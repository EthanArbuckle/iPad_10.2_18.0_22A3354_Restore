@implementation WFSSHKeyParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (id)defaultSerializedRepresentation
{
  return (id)MEMORY[0x24BDBD1B8];
}

@end
