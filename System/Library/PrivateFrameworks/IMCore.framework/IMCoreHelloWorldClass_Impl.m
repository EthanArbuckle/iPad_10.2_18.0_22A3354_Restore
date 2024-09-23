@implementation IMCoreHelloWorldClass_Impl

- (IMCoreHelloWorldClass_Impl)init
{
  uint64_t v3;
  id v4;
  IMCoreHelloWorldClass_Impl *v5;
  uint64_t v6;
  objc_super v8;

  v3 = OBJC_IVAR___IMCoreHelloWorldClass_Impl_sharedUtilitiesHelloWorld;
  v4 = objc_allocWithZone((Class)sub_1A2199668());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);
  v6 = OBJC_IVAR___IMCoreHelloWorldClass_Impl_persistenceHelloWorld;
  *(Class *)((char *)&v5->super.isa + v6) = (Class)objc_msgSend(objc_allocWithZone((Class)sub_1A219962C()), sel_init);

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for IMCoreHelloWorldClass();
  return -[IMCoreHelloWorldClass_Impl init](&v8, sel_init);
}

- (void)printGreeting
{
  IMCoreHelloWorldClass_Impl *v2;

  v2 = self;
  sub_1A219965C();
  sub_1A2199620();

}

- (void).cxx_destruct
{

}

@end
