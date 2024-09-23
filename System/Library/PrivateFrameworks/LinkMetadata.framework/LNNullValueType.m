@implementation LNNullValueType

- (LNNullValueType)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LNNullValueType;
  return (LNNullValueType *)-[LNValueType _init](&v3, sel__init);
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
  LNNullValueType *v4;
  LNNullValueType *v5;
  char isKindOfClass;

  v4 = (LNNullValueType *)a3;
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
  return CFSTR("Null");
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
