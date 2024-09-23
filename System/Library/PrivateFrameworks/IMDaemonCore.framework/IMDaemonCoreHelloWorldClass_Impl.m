@implementation IMDaemonCoreHelloWorldClass_Impl

- (void)printGreeting
{
  IMDaemonCoreHelloWorldClass_Impl *v2;

  v2 = self;
  sub_1D166D79C();
  sub_1D166D760();

}

- (IMDaemonCoreHelloWorldClass_Impl)init
{
  uint64_t v3;
  id v4;
  IMDaemonCoreHelloWorldClass_Impl *v5;
  uint64_t v6;
  objc_super v8;

  v3 = OBJC_IVAR___IMDaemonCoreHelloWorldClass_Impl_sharedUtilitiesHelloWorld;
  v4 = objc_allocWithZone((Class)sub_1D166D7A8());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);
  v6 = OBJC_IVAR___IMDaemonCoreHelloWorldClass_Impl_persistenceHelloWorld;
  *(Class *)((char *)&v5->super.isa + v6) = (Class)objc_msgSend(objc_allocWithZone((Class)sub_1D166D76C()), sel_init);

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for DaemonCoreHelloWorldClass();
  return -[IMDaemonCoreHelloWorldClass_Impl init](&v8, sel_init);
}

- (void).cxx_destruct
{

}

@end
