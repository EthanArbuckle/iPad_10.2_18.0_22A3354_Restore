@implementation LNQueryParametersValueType

- (LNQueryParametersValueType)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LNQueryParametersValueType;
  return (LNQueryParametersValueType *)-[LNValueType _init](&v3, sel__init);
}

- (Class)objectClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)hash
{
  return 303030;
}

- (BOOL)isEqual:(id)a3
{
  LNQueryParametersValueType *v4;
  LNQueryParametersValueType *v5;
  char isKindOfClass;

  v4 = (LNQueryParametersValueType *)a3;
  v5 = v4;
  if (self == v4)
  {
    isKindOfClass = 1;
  }
  else if (v4)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (id)description
{
  return CFSTR("Query");
}

+ (id)objectClassesForCoding
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_opt_class());
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
