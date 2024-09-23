@implementation HMDHelperExternalProtocolImpl

- (HMDHelperExternalProtocolImpl)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMDHelperExternalProtocolImpl;
  return -[HMDHelperExternalProtocolImpl init](&v3, sel_init);
}

- (id)createAFSecurityConnection
{
  return objc_alloc_init(MEMORY[0x1E0CFE9A0]);
}

@end
