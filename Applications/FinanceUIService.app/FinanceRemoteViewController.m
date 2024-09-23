@implementation FinanceRemoteViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(uint64_t);
  uint64_t v7;
  id v8;
  _TtC16FinanceUIService27FinanceRemoteViewController *v9;

  v6 = (void (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_1000113E0, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(uint64_t))sub_10000C4D4;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_10000B5E0(a3, v6, v7);
  sub_100006BE0((uint64_t)v6, v7);

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(uint64_t);
  uint64_t v7;
  id v8;
  _TtC16FinanceUIService27FinanceRemoteViewController *v9;

  v6 = (void (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100011368, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(uint64_t))sub_10000C404;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_10000BB1C(a3, v6, v7);
  sub_100006BE0((uint64_t)v6, v7);

}

- (_TtC16FinanceUIService27FinanceRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  _TtC16FinanceUIService27FinanceRemoteViewController *v10;
  objc_super v12;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = a4;
  Logger.init(subsystem:category:)(0xD000000000000014, 0x800000010000D570, 0xD000000000000010, 0x800000010000D440);
  if (v7)
  {
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v9 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for FinanceRemoteViewController(0);
  v10 = -[FinanceRemoteViewController initWithNibName:bundle:](&v12, "initWithNibName:bundle:", v9, v8);

  return v10;
}

- (_TtC16FinanceUIService27FinanceRemoteViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC16FinanceUIService27FinanceRemoteViewController *v5;
  objc_super v7;

  v4 = a3;
  Logger.init(subsystem:category:)(0xD000000000000014, 0x800000010000D570, 0xD000000000000010, 0x800000010000D440);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for FinanceRemoteViewController(0);
  v5 = -[FinanceRemoteViewController initWithCoder:](&v7, "initWithCoder:", v4);

  return v5;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC16FinanceUIService27FinanceRemoteViewController_log;
  v3 = type metadata accessor for Logger(0, a2);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
