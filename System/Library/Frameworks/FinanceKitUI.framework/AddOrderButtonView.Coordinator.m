@implementation AddOrderButtonView.Coordinator

- (void)callback
{
  void (*v2)(uint64_t);
  _TtCV12FinanceKitUI18AddOrderButtonView11Coordinator *v3;
  uint64_t v4;

  v2 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCV12FinanceKitUI18AddOrderButtonView11Coordinator_action);
  v3 = self;
  v4 = swift_retain();
  v2(v4);

  swift_release();
}

- (_TtCV12FinanceKitUI18AddOrderButtonView11Coordinator)init
{
  _TtCV12FinanceKitUI18AddOrderButtonView11Coordinator *result;

  result = (_TtCV12FinanceKitUI18AddOrderButtonView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
