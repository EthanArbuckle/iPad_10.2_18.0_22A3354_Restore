@implementation LaunchAngelService

- (void)handleXPCRequest:(id)a3 reply:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _TtC26AppDistributionLaunchAngel18LaunchAngelService *v12;

  v6 = _Block_copy(a4);
  v7 = a3;
  v12 = self;
  v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v10 = v9;

  v11 = swift_allocObject(&unk_100041E58, 24, 7);
  *(_QWORD *)(v11 + 16) = v6;
  sub_10001B9C0(v8, v10, (uint64_t)sub_10001AF44, v11);
  swift_release(v11);
  sub_10000A064(v8, v10);

}

- (_TtC26AppDistributionLaunchAngel18LaunchAngelService)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LaunchAngelService();
  return -[LaunchAngelService init](&v3, "init");
}

@end
