@implementation NRDiffBase

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char isKindOfClass;
  BOOL v6;
  BOOL v7;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if (self)
    v6 = v4 == 0;
  else
    v6 = 0;
  v7 = !v6;
  return (isKindOfClass & 1) != 0 && v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
}

+ (id)enclosedClassTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

@end
