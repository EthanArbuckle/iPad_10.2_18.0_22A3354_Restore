@implementation IMSharedUtilitiesHelloWorldClass

- (IMSharedUtilitiesHelloWorldClass)init
{
  IMSharedUtilitiesHelloWorldClass *v2;
  IMSharedUtilitiesHelloWorldClass_Impl *v3;
  IMSharedUtilitiesHelloWorldClass_Impl *swiftImpl;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMSharedUtilitiesHelloWorldClass;
  v2 = -[IMSharedUtilitiesHelloWorldClass init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(IMSharedUtilitiesHelloWorldClass_Impl);
    swiftImpl = v2->_swiftImpl;
    v2->_swiftImpl = v3;

  }
  return v2;
}

- (void)printGreeting
{
  MEMORY[0x1E0DE7D20](self->_swiftImpl, sel_printGreeting);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftImpl, 0);
}

@end
