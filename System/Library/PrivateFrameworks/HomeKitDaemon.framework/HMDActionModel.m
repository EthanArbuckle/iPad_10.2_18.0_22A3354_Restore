@implementation HMDActionModel

+ (id)properties
{
  return (id)MEMORY[0x24BDBD1B8];
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)CFSTR("actionSet");
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

@end
