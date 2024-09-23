@implementation NSPropertyMapping

+ (void)initialize
{
  objc_opt_self();
}

- (NSPropertyMapping)init
{
  return (NSPropertyMapping *)-[NSPropertyMapping _initWithDestinationName:valueExpression:](self, "_initWithDestinationName:valueExpression:", 0, 0);
}

- (void)dealloc
{
  objc_super v3;

  self->_name = 0;
  self->_valueExpression = 0;

  self->_userInfo = 0;
  self->_propertyTransforms = 0;

  self->_transformValidations = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSPropertyMapping;
  -[NSPropertyMapping dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    v4[4] = -[NSString copy](self->_name, "copy");
    v4[5] = -[NSExpression copy](self->_valueExpression, "copy");
    v4[6] = -[NSDictionary copy](self->_userInfo, "copy");
    v4[3] = -[NSArray copy](self->_propertyTransforms, "copy");
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  NSExpression *v8;
  uint64_t v9;
  NSDictionary *v10;
  uint64_t v11;
  NSArray *propertyTransforms;
  NSArray *v13;

  if (a3 == self)
    goto LABEL_23;
  if (!a3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  v5 = -[NSPropertyMapping name](self, "name");
  v6 = objc_msgSend(a3, "name");
  if (v5 == (NSString *)v6
    || (v7 = v6, LOBYTE(v6) = 0, v5) && v7 && (LODWORD(v6) = -[NSString isEqual:](v5, "isEqual:"), (_DWORD)v6))
  {
    v8 = -[NSPropertyMapping valueExpression](self, "valueExpression");
    v6 = objc_msgSend(a3, "valueExpression");
    if (v8 == (NSExpression *)v6
      || (v9 = v6, LOBYTE(v6) = 0, v8) && v9 && (LODWORD(v6) = -[NSExpression isEqual:](v8, "isEqual:"), (_DWORD)v6))
    {
      v10 = -[NSPropertyMapping userInfo](self, "userInfo");
      v6 = objc_msgSend(a3, "userInfo");
      if (v10 == (NSDictionary *)v6
        || (v11 = v6, LOBYTE(v6) = 0, v10)
        && v11
        && (LODWORD(v6) = -[NSDictionary isEqual:](v10, "isEqual:"), (_DWORD)v6))
      {
        if (self)
          propertyTransforms = self->_propertyTransforms;
        else
          propertyTransforms = 0;
        v13 = (NSArray *)*((_QWORD *)a3 + 3);
        if (propertyTransforms != v13)
        {
          LOBYTE(v6) = 0;
          if (propertyTransforms && v13)
            LOBYTE(v6) = -[NSArray isEqual:](propertyTransforms, "isEqual:");
          return v6;
        }
LABEL_23:
        LOBYTE(v6) = 1;
      }
    }
  }
  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@), name %@, valueExpression %@, userInfo %@"), objc_opt_class(), -[NSPropertyMapping name](self, "name"), -[NSPropertyMapping valueExpression](self, "valueExpression"), -[NSPropertyMapping userInfo](self, "userInfo"));
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  NSString *v5;

  -[NSPropertyMapping _throwIfNotEditable](self, "_throwIfNotEditable");
  v5 = self->_name;
  if (v5 != name)
  {

    self->_name = (NSString *)-[NSString copy](name, "copy");
  }
}

- (NSExpression)valueExpression
{
  return self->_valueExpression;
}

- (void)setValueExpression:(NSExpression *)valueExpression
{
  NSExpression *v5;

  -[NSPropertyMapping _throwIfNotEditable](self, "_throwIfNotEditable");
  v5 = self->_valueExpression;
  if (v5 != valueExpression)
  {

    self->_valueExpression = (NSExpression *)-[NSExpression copy](valueExpression, "copy");
  }
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(NSDictionary *)userInfo
{
  NSDictionary *v5;

  -[NSPropertyMapping _throwIfNotEditable](self, "_throwIfNotEditable");
  v5 = self->_userInfo;
  if (v5 != userInfo)
  {

    self->_userInfo = (NSDictionary *)-[NSDictionary copy](userInfo, "copy");
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *propertyTransforms;

  objc_msgSend(a3, "encodeObject:forKey:", -[NSPropertyMapping name](self, "name"), CFSTR("NSDestinationPropertyName"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSPropertyMapping valueExpression](self, "valueExpression"), CFSTR("NSValueExpression"));
  objc_msgSend(a3, "encodeObject:forKey:", -[NSPropertyMapping userInfo](self, "userInfo"), CFSTR("NSUserInfo"));
  if (self)
    propertyTransforms = self->_propertyTransforms;
  else
    propertyTransforms = 0;
  objc_msgSend(a3, "encodeObject:forKey:", propertyTransforms, CFSTR("NSPropertyTransforms"));
}

- (NSPropertyMapping)initWithCoder:(id)a3
{
  NSPropertyMapping *v4;
  NSString *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSPropertyMapping;
  v4 = -[NSPropertyMapping init](&v9, sel_init);
  if (v4)
  {
    v5 = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSDestinationPropertyName"));
    v4->_name = v5;
    if (v5 && (-[NSString isNSString](v5, "isNSString") & 1) == 0)
    {
      objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4866, &unk_1E1F4AD90));

      return 0;
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0C99E60];
      v7 = objc_opt_class();
      v4->_valueExpression = (NSExpression *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0), CFSTR("NSValueExpression"));
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[NSExpression allowEvaluation](v4->_valueExpression, "allowEvaluation");
      v4->_userInfo = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[_PFRoutines plistClassesForSecureCoding](), CFSTR("NSUserInfo"));
      v4->_propertyTransforms = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NSPropertyTransforms"));
      *(_DWORD *)&v4->_propertyMappingFlags &= ~1u;
    }
  }
  return v4;
}

- (id)_initWithDestinationName:(id)a3 valueExpression:(id)a4
{
  NSPropertyMapping *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSPropertyMapping;
  v6 = -[NSPropertyMapping init](&v8, sel_init);
  if (v6)
  {
    v6->_name = (NSString *)objc_msgSend(a3, "copy");
    v6->_valueExpression = (NSExpression *)objc_msgSend(a4, "copy");
    v6->_userInfo = 0;
    *(_DWORD *)&v6->_propertyMappingFlags &= ~1u;
  }
  return v6;
}

- (void)_throwIfNotEditable
{
  if (!self || (*(_BYTE *)&self->_propertyMappingFlags & 1) != 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Can't modify an immutable property mapping."), 0));
}

- (_QWORD)_setPropertyTransforms:(_QWORD *)result
{
  _QWORD *v3;
  void *v4;

  if (result)
  {
    v3 = result;
    result = (_QWORD *)objc_msgSend(result, "_throwIfNotEditable");
    v4 = (void *)v3[3];
    if (v4 != a2)
    {

      result = a2;
      v3[3] = result;
    }
  }
  return result;
}

- (_QWORD)_setTransformValidations:(_QWORD *)result
{
  _QWORD *v3;
  void *v4;

  if (result)
  {
    v3 = result;
    result = (_QWORD *)objc_msgSend(result, "_throwIfNotEditable");
    v4 = (void *)v3[2];
    if (v4 != a2)
    {

      result = a2;
      v3[2] = result;
    }
  }
  return result;
}

@end
