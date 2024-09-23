@implementation PINSheetViewController

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  id v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self);
  v4 = (char *)v7.receiver;
  -[TransitionViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  v5 = sub_10003CB48(v4);
  v6 = *(void **)&v4[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager];
  *(_QWORD *)&v4[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager] = v5;

}

- (BOOL)isFullScreenController
{
  sub_1000287F0(0, &qword_100091F90, UIDevice_ptr);
  return sub_1000557C4();
}

- (BOOL)shouldPresentWithAnimation
{
  return 0;
}

- (void)dismissChildWithCompletionHandler:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  _TtC10CoreAuthUI22PINSheetViewController *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_10007B778, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_100027EEC;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_10003D43C((uint64_t)v7, v6);
  sub_100027EB8((uint64_t)v7, v6);

}

- (_TtC10CoreAuthUI22PINSheetViewController)initWithInternalInfo:(id)a3 mechanism:(id)a4 backoffCounter:(id)a5 remoteUIHost:(id)a6 allowsLandscape:(BOOL)a7
{
  objc_class *ObjectType;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _TtC10CoreAuthUI22PINSheetViewController *v16;
  Class isa;
  _TtC10CoreAuthUI22PINSheetViewController *v18;
  _BOOL4 v20;
  objc_super v21;

  v20 = a7;
  ObjectType = (objc_class *)swift_getObjectType(self);
  v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v14 = OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_context;
  v15 = objc_allocWithZone((Class)LAContext);
  swift_unknownObjectRetain(a4);
  swift_unknownObjectRetain(a5);
  swift_unknownObjectRetain(a6);
  v16 = self;
  *(_QWORD *)&self->super.SBUIRemoteAlertServiceViewController_opaque[v14] = objc_msgSend(v15, "init");
  *(_QWORD *)&v16->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager] = 0;

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v13);
  v21.receiver = v16;
  v21.super_class = ObjectType;
  v18 = -[TransitionViewController initWithInternalInfo:mechanism:backoffCounter:remoteUIHost:allowsLandscape:](&v21, "initWithInternalInfo:mechanism:backoffCounter:remoteUIHost:allowsLandscape:", isa, a4, a5, a6, v20);

  swift_unknownObjectRelease(a4);
  swift_unknownObjectRelease(a5);
  swift_unknownObjectRelease(a6);
  return v18;
}

- (_TtC10CoreAuthUI22PINSheetViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC10CoreAuthUI22PINSheetViewController *)sub_10003DB08(v5, v7, a4);
}

- (_TtC10CoreAuthUI22PINSheetViewController)initWithCoder:(id)a3
{
  return (_TtC10CoreAuthUI22PINSheetViewController *)sub_10003DC4C(a3);
}

- (_TtC10CoreAuthUI22PINSheetViewController)initWithInternalInfo:(id)a3 parent:(id)a4
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
    return (_TtC10CoreAuthUI22PINSheetViewController *)sub_10003DD18(v5, (uint64_t)v8);
  }
  v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v6 = swift_unknownObjectRetain(a4);
  _bridgeAnyObjectToAny(_:)(v8, v6);
  swift_unknownObjectRelease(a4);
  return (_TtC10CoreAuthUI22PINSheetViewController *)sub_10003DD18(v5, (uint64_t)v8);
}

- (void).cxx_destruct
{

}

- (void)viewModel:(id)a3 didReceiveCustomPassword:(id)a4 handler:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC10CoreAuthUI22PINSheetViewController *v13;

  v8 = _Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  _Block_copy(v8);
  v12 = a3;
  v13 = self;
  sub_10003E5DC(v9, v11, (char *)v13, (void (**)(_QWORD, _QWORD))v8);
  _Block_release(v8);
  _Block_release(v8);

  swift_bridgeObjectRelease(v11);
}

@end
