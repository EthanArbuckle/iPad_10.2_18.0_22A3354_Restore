@implementation APMaintenanceClient

- (void)clearAccessTableWithCompletion:(id)a3
{
  sub_23628D1B4(self, (int)a2, a3, (void (*)(void))sub_23628D4DC);
}

- (void)getStateDumpWithCompletion:(id)a3
{
  sub_23628D1B4(self, (int)a2, a3, (void (*)(void))sub_23628D7E8);
}

- (_TtC13AppProtection19APMaintenanceClient)init
{
  _TtC13AppProtection19APMaintenanceClient *result;

  result = (_TtC13AppProtection19APMaintenanceClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_236264B94((uint64_t)self + OBJC_IVAR____TtC13AppProtection19APMaintenanceClient_delegate);
}

@end
