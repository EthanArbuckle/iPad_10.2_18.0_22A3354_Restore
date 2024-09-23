@implementation LACDTOEnvironmentProvider

- (_TtC23LocalAuthenticationCore25LACDTOEnvironmentProvider)initWithLocationProvider:(id)a3 featureController:(id)a4 ratchetStateProvider:(id)a5 lostModeController:(id)a6
{
  objc_super v7;

  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC23LocalAuthenticationCore25LACDTOEnvironmentProvider_locationProvider) = (Class)a3;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC23LocalAuthenticationCore25LACDTOEnvironmentProvider_featureController) = (Class)a4;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC23LocalAuthenticationCore25LACDTOEnvironmentProvider_ratchetStateProvider) = (Class)a5;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC23LocalAuthenticationCore25LACDTOEnvironmentProvider_lostModeController) = (Class)a6;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for LACDTOEnvironmentProvider();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return -[LACDTOEnvironmentProvider init](&v7, sel_init);
}

- (void)fetchEnvironmentForPolicy:(int64_t)a3 options:(id)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC23LocalAuthenticationCore25LACDTOEnvironmentProvider *v10;

  v7 = _Block_copy(a5);
  v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = self;
  LACDTOEnvironmentProvider.fetchEnvironment(policy:options:completion:)(a3, v8, (uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned LACDTOEnvironment?, @unowned NSError?) -> (), v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (_TtC23LocalAuthenticationCore25LACDTOEnvironmentProvider)init
{
  _TtC23LocalAuthenticationCore25LACDTOEnvironmentProvider *result;

  result = (_TtC23LocalAuthenticationCore25LACDTOEnvironmentProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
