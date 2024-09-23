@implementation HKStateSyncRequest

- (BOOL)isEqual:(id)a3
{
  id v3;
  char v4;

  if (!a3)
    return 0;
  v3 = a3;
  v4 = objc_msgSend(v3, "isMemberOfClass:", objc_opt_class());

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p"), objc_opt_class(), self);
}

@end
