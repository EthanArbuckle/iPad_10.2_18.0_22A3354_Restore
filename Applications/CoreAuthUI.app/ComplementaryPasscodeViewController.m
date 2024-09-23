@implementation ComplementaryPasscodeViewController

- (void)viewDidLoad
{
  id v2;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  v2 = v5.receiver;
  -[TransitionViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = (void *)objc_opt_self(LAUtils);
  if (objc_msgSend(v3, "isSharedIPad", v5.receiver, v5.super_class))
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)LALocalBackoffCounter), "init");
    objc_msgSend(v2, "setBackoffCounter:", v4);

    v2 = v4;
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC10CoreAuthUI35ComplementaryPasscodeViewController *v4;

  v4 = self;
  sub_10004B828(a3);

}

- (void)dismissChildWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  _TtC10CoreAuthUI35ComplementaryPasscodeViewController *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_10007C5B8, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_100027EEC;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_10004C228((uint64_t)v7, v6);
  sub_100027EB8((uint64_t)v7, v6);

}

- (_TtC10CoreAuthUI35ComplementaryPasscodeViewController)initWithInternalInfo:(id)a3 mechanism:(id)a4 backoffCounter:(id)a5 remoteUIHost:(id)a6 allowsLandscape:(BOOL)a7
{
  _BOOL8 v7;
  objc_class *ObjectType;
  uint64_t v14;
  Class isa;
  _TtC10CoreAuthUI35ComplementaryPasscodeViewController *v16;
  objc_super v18;

  v7 = a7;
  ObjectType = (objc_class *)swift_getObjectType(self);
  v14 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  swift_unknownObjectRetain(a4);
  swift_unknownObjectRetain(a5);
  swift_unknownObjectRetain(a6);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v14);
  v18.receiver = self;
  v18.super_class = ObjectType;
  v16 = -[TransitionViewController initWithInternalInfo:mechanism:backoffCounter:remoteUIHost:allowsLandscape:](&v18, "initWithInternalInfo:mechanism:backoffCounter:remoteUIHost:allowsLandscape:", isa, a4, a5, a6, v7);

  swift_unknownObjectRelease(a4);
  swift_unknownObjectRelease(a5);
  swift_unknownObjectRelease(a6);
  return v16;
}

- (_TtC10CoreAuthUI35ComplementaryPasscodeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _TtC10CoreAuthUI35ComplementaryPasscodeViewController *v12;
  objc_super v14;

  ObjectType = (objc_class *)swift_getObjectType(self);
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v9 = v8;
    v10 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
  }
  else
  {
    v11 = a4;
  }
  v14.receiver = self;
  v14.super_class = ObjectType;
  v12 = -[ComplementaryPasscodeViewController initWithNibName:bundle:](&v14, "initWithNibName:bundle:", a3, a4);

  return v12;
}

- (_TtC10CoreAuthUI35ComplementaryPasscodeViewController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self);
  return -[ComplementaryPasscodeViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

- (_TtC10CoreAuthUI35ComplementaryPasscodeViewController)initWithInternalInfo:(id)a3 parent:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  _OWORD v8[2];

  if (!a3)
  {
    v5 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    memset(v8, 0, sizeof(v8));
    return (_TtC10CoreAuthUI35ComplementaryPasscodeViewController *)sub_10004C804(v5, (uint64_t)v8);
  }
  v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v6 = swift_unknownObjectRetain(a4);
  _bridgeAnyObjectToAny(_:)(v8, v6);
  swift_unknownObjectRelease(a4);
  return (_TtC10CoreAuthUI35ComplementaryPasscodeViewController *)sub_10004C804(v5, (uint64_t)v8);
}

@end
