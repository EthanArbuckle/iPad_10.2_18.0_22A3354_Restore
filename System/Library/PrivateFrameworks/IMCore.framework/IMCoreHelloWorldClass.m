@implementation IMCoreHelloWorldClass

- (IMCoreHelloWorldClass)init
{
  IMCoreHelloWorldClass *v2;
  IMCoreHelloWorldClass_Impl *v3;
  IMCoreHelloWorldClass_Impl *swiftImpl;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMCoreHelloWorldClass;
  v2 = -[IMCoreHelloWorldClass init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(IMCoreHelloWorldClass_Impl);
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
