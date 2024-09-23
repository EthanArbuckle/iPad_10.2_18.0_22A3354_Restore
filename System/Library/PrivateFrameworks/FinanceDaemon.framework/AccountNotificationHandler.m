@implementation AccountNotificationHandler

+ (id)makeHandler
{
  return sub_1CF3D381C();
}

- (void)primaryAppleAccountWasAdded
{
  _TtC13FinanceDaemon26AccountNotificationHandler *v2;

  v2 = self;
  sub_1CF3D3444();

}

- (void)primaryAppleAccountWasDeleted
{
  _TtC13FinanceDaemon26AccountNotificationHandler *v2;

  v2 = self;
  sub_1CF3D3484();

}

- (_TtC13FinanceDaemon26AccountNotificationHandler)init
{
  _TtC13FinanceDaemon26AccountNotificationHandler *result;

  result = (_TtC13FinanceDaemon26AccountNotificationHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC13FinanceDaemon26AccountNotificationHandler_userIdentifierProvider);
}

@end
