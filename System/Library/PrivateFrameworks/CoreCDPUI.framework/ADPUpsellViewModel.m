@implementation ADPUpsellViewModel

- (_TtC9CoreCDPUI18ADPUpsellViewModel)init
{
  _TtC9CoreCDPUI18ADPUpsellViewModel *result;

  result = (_TtC9CoreCDPUI18ADPUpsellViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  sub_20DCD08B4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9CoreCDPUI18ADPUpsellViewModel__alertState), *(_QWORD *)&self->_isWalrusEnabled[OBJC_IVAR____TtC9CoreCDPUI18ADPUpsellViewModel__alertState]);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9CoreCDPUI18ADPUpsellViewModel_urlBag);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9CoreCDPUI18ADPUpsellViewModel_reachabilityProvider);
  sub_20DCC2410((uint64_t)self + OBJC_IVAR____TtC9CoreCDPUI18ADPUpsellViewModel__delegate);
  v3 = (char *)self + OBJC_IVAR____TtC9CoreCDPUI18ADPUpsellViewModel___observationRegistrar;
  v4 = sub_20DCF6190();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)showErrorAlertTitled:(id)a3 message:(id)a4
{
  _TtC9CoreCDPUI18ADPUpsellViewModel *v5;

  sub_20DCF6BE0();
  sub_20DCF6BE0();
  swift_getKeyPath();
  sub_20DCC24F8((unint64_t *)&unk_2549E30D0, (uint64_t (*)(uint64_t))type metadata accessor for ADPUpsellViewModel, (uint64_t)&unk_20DCFBFC8);
  v5 = self;
  sub_20DCF6154();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end
