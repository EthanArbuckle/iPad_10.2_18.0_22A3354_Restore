@implementation IMCorePipelineHelloWorldClass

- (IMCorePipelineHelloWorldClass)init
{
  IMCorePipelineHelloWorldClass *v2;
  IMCorePipelineHelloWorldClass_Impl *v3;
  IMCorePipelineHelloWorldClass_Impl *swiftImpl;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMCorePipelineHelloWorldClass;
  v2 = -[IMCorePipelineHelloWorldClass init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(IMCorePipelineHelloWorldClass_Impl);
    swiftImpl = v2->_swiftImpl;
    v2->_swiftImpl = v3;

  }
  return v2;
}

- (void)printGreeting
{
  MEMORY[0x24BEDD108](self->_swiftImpl, sel_printGreeting);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftImpl, 0);
}

@end
