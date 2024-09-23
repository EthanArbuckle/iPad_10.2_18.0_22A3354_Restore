@implementation NSSQLProperty

- (id)propertyDescription
{
  return self->_propertyDescription;
}

- (NSSQLProperty)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  NSSQLProperty *v6;
  NSSQLProperty *v7;
  _QWORD *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NSSQLProperty;
  v6 = -[NSSQLProperty init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_propertyDescription = (NSPropertyDescription *)a4;
    v6->_entity = (NSSQLEntity *)a3;
    if (a4)
    {
      if (-[NSEntityDescription _hasUniquedProperty:](objc_msgSend(a3, "entityDescription"), a4))
      {
        *(_WORD *)&v7->_flags |= 6u;
        if (a3)
        {
          v8 = (_QWORD *)objc_msgSend(a3, "rootEntity");
          if (v8)
            v8 = (_QWORD *)v8[26];
          objc_msgSend(v8, "addObject:", v7);
        }
      }
    }
  }
  return v7;
}

- (BOOL)isToMany
{
  return self->_propertyType == 8;
}

- (unsigned)propertyType
{
  return self->_propertyType;
}

- (id)name
{
  return -[NSPropertyDescription name](self->_propertyDescription, "name");
}

- (void)setConstrained:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (id)entity
{
  return self->_entity;
}

- (void)copyValuesForReadOnlyFetch:(id)a3
{
  self->_propertyDescription = (NSPropertyDescription *)objc_msgSend(a3, "propertyDescription");
  self->_propertyType = objc_msgSend(a3, "propertyType");
}

- (BOOL)isConstrained
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)dealloc
{
  objc_super v2;

  self->_propertyDescription = 0;
  self->_entity = 0;
  v2.receiver = self;
  v2.super_class = (Class)NSSQLProperty;
  -[NSSQLProperty dealloc](&v2, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v7;
  id v8;
  objc_super v10;
  uint64_t v11;
  uint64_t v12;

  if (self == a3)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    v11 = v3;
    v12 = v4;
    v10.receiver = self;
    v10.super_class = (Class)NSSQLProperty;
    v7 = -[NSSQLProperty isEqual:](&v10, sel_isEqual_);
    if (v7)
    {
      v8 = -[NSSQLProperty propertyDescription](self, "propertyDescription");
      LOBYTE(v7) = v8 == (id)objc_msgSend(a3, "propertyDescription");
    }
  }
  return v7;
}

- (id)columnName
{
  return 0;
}

- (unsigned)sqlType
{
  return self->_sqlType;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  id v6;
  id v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[NSSQLProperty name](self, "name");
  if (self)
    v7 = -[NSSQLProperty columnName](self, "columnName");
  else
    v7 = 0;
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %@ (%@)>"), v5, v6, v7);
}

- (unsigned)slot
{
  return -1;
}

@end
