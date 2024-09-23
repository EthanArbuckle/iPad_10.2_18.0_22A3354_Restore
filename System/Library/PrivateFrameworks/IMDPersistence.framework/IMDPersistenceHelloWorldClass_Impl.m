@implementation IMDPersistenceHelloWorldClass_Impl

- (IMDPersistenceHelloWorldClass_Impl)init
{
  uint64_t v3;
  id v4;
  IMDPersistenceHelloWorldClass_Impl *v5;
  objc_super v7;

  v3 = OBJC_IVAR___IMDPersistenceHelloWorldClass_Impl_inner;
  v4 = objc_allocWithZone((Class)sub_1ABC64348());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for IMDPersistenceHelloWorldClass();
  return -[IMDPersistenceHelloWorldClass_Impl init](&v7, sel_init);
}

- (void)printGreeting
{
  IMDPersistenceHelloWorldClass_Impl *v2;

  v2 = self;
  sub_1ABC6433C();

}

- (void).cxx_destruct
{

}

@end
