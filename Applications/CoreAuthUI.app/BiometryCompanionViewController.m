@implementation BiometryCompanionViewController

- (void)viewDidAppear:(BOOL)a3
{
  _TtC10CoreAuthUI31BiometryCompanionViewController *v4;

  v4 = self;
  sub_10003F6F0(a3);

}

- (void)dismissChildWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  _TtC10CoreAuthUI31BiometryCompanionViewController *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_10007B900, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_100027EEC;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_10003FBA0((uint64_t)v7, v6);
  sub_100027EB8((uint64_t)v7, v6);

}

- (_TtC10CoreAuthUI31BiometryCompanionViewController)initWithInternalInfo:(id)a3 mechanism:(id)a4 backoffCounter:(id)a5 remoteUIHost:(id)a6 allowsLandscape:(BOOL)a7
{
  objc_class *ObjectType;
  uint64_t v13;
  _TtC10CoreAuthUI31BiometryCompanionViewController *v14;
  _QWORD *v15;
  Class isa;
  _TtC10CoreAuthUI31BiometryCompanionViewController *v17;
  _BOOL4 v19;
  objc_super v20;

  v19 = a7;
  ObjectType = (objc_class *)swift_getObjectType(self);
  v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  swift_unknownObjectRetain(a4);
  swift_unknownObjectRetain(a5);
  swift_unknownObjectRetain(a6);
  v14 = self;
  v15 = sub_1000419B8();
  sub_1000419D0(*v15);
  *(_QWORD *)&v14->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType] = 0;

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v13);
  v20.receiver = v14;
  v20.super_class = ObjectType;
  v17 = -[TransitionViewController initWithInternalInfo:mechanism:backoffCounter:remoteUIHost:allowsLandscape:](&v20, "initWithInternalInfo:mechanism:backoffCounter:remoteUIHost:allowsLandscape:", isa, a4, a5, a6, v19);

  swift_unknownObjectRelease(a4);
  swift_unknownObjectRelease(a5);
  swift_unknownObjectRelease(a6);
  return v17;
}

- (_TtC10CoreAuthUI31BiometryCompanionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC10CoreAuthUI31BiometryCompanionViewController *)sub_1000400FC(v5, v7, a4);
}

- (_TtC10CoreAuthUI31BiometryCompanionViewController)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  id v6;
  _TtC10CoreAuthUI31BiometryCompanionViewController *v7;
  _QWORD *v8;
  _TtC10CoreAuthUI31BiometryCompanionViewController *v9;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v6 = a3;
  v7 = self;
  v8 = sub_1000419B8();
  sub_1000419D0(*v8);
  *(_QWORD *)&v7->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType] = 0;

  v11.receiver = v7;
  v11.super_class = ObjectType;
  v9 = -[BiometryCompanionViewController initWithCoder:](&v11, "initWithCoder:", v6);

  return v9;
}

- (_TtC10CoreAuthUI31BiometryCompanionViewController)initWithInternalInfo:(id)a3 parent:(id)a4
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
    return (_TtC10CoreAuthUI31BiometryCompanionViewController *)sub_100040350(v5, (uint64_t)v8);
  }
  v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v6 = swift_unknownObjectRetain(a4);
  _bridgeAnyObjectToAny(_:)(v8, v6);
  swift_unknownObjectRelease(a4);
  return (_TtC10CoreAuthUI31BiometryCompanionViewController *)sub_100040350(v5, (uint64_t)v8);
}

- (void).cxx_destruct
{
  unsigned __int8 *v2;
  uint64_t v3;

  v2 = &self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_log];
  v3 = type metadata accessor for Logger(0);
  (*(void (**)(unsigned __int8 *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
