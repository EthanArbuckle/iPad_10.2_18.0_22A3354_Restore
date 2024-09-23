@implementation NSUUID(ULExtensions)

+ (id)nilUUID
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
}

- (uint64_t)isNilUUID
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BDD1880], "nilUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "isEqual:", v2);

  return v3;
}

@end
