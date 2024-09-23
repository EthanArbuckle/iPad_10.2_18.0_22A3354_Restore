@implementation ViewController

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for ViewController(0);
  -[ViewController viewDidLoad](&v2, "viewDidLoad");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ViewController(0);
  -[ViewController viewDidAppear:](&v4, "viewDidAppear:", v3);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t (*v8)();
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _TtC18DKPairingUIService14ViewController *v13;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_100014A88, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v8 = sub_100009864;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v9 = *(void **)&self->context[OBJC_IVAR____TtC18DKPairingUIService14ViewController_context];
  *(_QWORD *)&self->context[OBJC_IVAR____TtC18DKPairingUIService14ViewController_context] = a3;
  v10 = a3;
  v13 = self;

  v11 = (void *)sub_100003994();
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v11, "setAllowsAlertStacking:", 1);
    swift_unknownObjectRelease(v12);
  }
  if (v6)
  {
    v8();
    sub_100009704((uint64_t)v8, v7);
  }

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  void (*v6)(void);
  uint64_t v7;
  id v8;
  _TtC18DKPairingUIService14ViewController *v9;

  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_1000149E8, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_100009738;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_10000882C(v6, v7);
  sub_100009704((uint64_t)v6, v7);

}

- (void)pairingStatusWithInfo:(id)a3 state:(int64_t)a4 metadata:(id)a5 error:(id)a6
{
  uint64_t v9;
  id v10;
  _TtC18DKPairingUIService14ViewController *v11;

  v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for String, &type metadata for String, &protocol witness table for String);
  v10 = a6;
  v11 = self;
  sub_1000093F0(a4, v9, a6);

  swift_bridgeObjectRelease(v9);
}

- (_TtC18DKPairingUIService14ViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC18DKPairingUIService14ViewController *)sub_100007978(v5, v7, a4);
}

- (_TtC18DKPairingUIService14ViewController)initWithCoder:(id)a3
{
  return (_TtC18DKPairingUIService14ViewController *)sub_100007B48(a3);
}

- (void).cxx_destruct
{
  unsigned __int8 *v3;
  uint64_t v4;

  v3 = &self->context[OBJC_IVAR____TtC18DKPairingUIService14ViewController_logger];
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_release(*(_QWORD *)&self->context[OBJC_IVAR____TtC18DKPairingUIService14ViewController_controller]);
}

- (void)proxCardFlowDidDismiss
{
  _TtC18DKPairingUIService14ViewController *v2;

  v2 = self;
  sub_100007E48();

}

@end
