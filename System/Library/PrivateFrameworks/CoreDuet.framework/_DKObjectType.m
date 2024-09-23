@implementation _DKObjectType

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)objectTypeFromClass:(Class)a3
{
  void *v4;
  void *v5;

  NSStringFromClass(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectTypeWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (_DKObjectType)objectTypeWithTypeCode:(int64_t)a3
{
  return (_DKObjectType *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithTypeCode:objectClass:", a3, objc_msgSend(a1, "associatedObjectClass"));
}

- (_DKObjectType)initWithTypeCode:(int64_t)a3 objectClass:(Class)a4
{
  _DKObjectType *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_DKObjectType;
  result = -[_DKObjectType init](&v7, sel_init);
  if (result)
  {
    result->_typeCode = a3;
    result->_objectClass = a4;
  }
  return result;
}

+ (_DKObjectType)objectTypeWithName:(id)a3
{
  return (_DKObjectType *)objc_msgSend(a1, "objectTypeWithTypeCode:", objc_msgSend(a1, "typeCodeFromName:", a3));
}

+ (int64_t)typeCodeFromName:(id)a3
{
  return objc_msgSend(a3, "hash");
}

- (int64_t)typeCode
{
  return self->_typeCode;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_typeCode == v4[1] && self->_objectClass == (Class)v4[2];

  return v5;
}

- (Class)objectClass
{
  return self->_objectClass;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t typeCode;
  id v5;
  id v6;

  typeCode = self->_typeCode;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", typeCode, CFSTR("typeCode"));
  NSStringFromClass(self->_objectClass);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("objectClass"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromClass(self->_objectClass);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%ld)"), v4, self->_typeCode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (_DKObjectType)initWithCoder:(id)a3
{
  id v4;
  NSString *v5;

  v4 = a3;
  self->_typeCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("typeCode"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectClass"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  self->_objectClass = NSClassFromString(v5);
  return self;
}

+ (Class)associatedObjectClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)hash
{
  return self->_typeCode;
}

@end
