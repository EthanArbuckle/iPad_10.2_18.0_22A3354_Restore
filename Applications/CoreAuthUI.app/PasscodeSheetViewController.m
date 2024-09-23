@implementation PasscodeSheetViewController

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)loadView
{
  _TtC10CoreAuthUI27PasscodeSheetViewController *v2;

  v2 = self;
  sub_100025E78();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self);
  v4 = (char *)v7.receiver;
  -[TransitionViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  sub_100025FD0(v4);
  v5 = *(void **)&v4[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_authorizationViewManager];
  *(_QWORD *)&v4[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_authorizationViewManager] = v6;

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
  _TtC10CoreAuthUI27PasscodeSheetViewController *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_10007A810, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_100027EEC;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_100026F8C((uint64_t)v7, v6);
  sub_100027EB8((uint64_t)v7, v6);

}

- (_TtC10CoreAuthUI27PasscodeSheetViewController)initWithInternalInfo:(id)a3 mechanism:(id)a4 backoffCounter:(id)a5 remoteUIHost:(id)a6 allowsLandscape:(BOOL)a7
{
  uint64_t v11;

  v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  swift_unknownObjectRetain(a4);
  swift_unknownObjectRetain(a5);
  swift_unknownObjectRetain(a6);
  return (_TtC10CoreAuthUI27PasscodeSheetViewController *)sub_1000273FC(v11, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7);
}

- (_TtC10CoreAuthUI27PasscodeSheetViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC10CoreAuthUI27PasscodeSheetViewController *)sub_10002763C(v5, v7, a4);
}

- (_TtC10CoreAuthUI27PasscodeSheetViewController)initWithCoder:(id)a3
{
  return (_TtC10CoreAuthUI27PasscodeSheetViewController *)sub_1000277CC(a3);
}

- (_TtC10CoreAuthUI27PasscodeSheetViewController)initWithInternalInfo:(id)a3 parent:(id)a4
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
    return (_TtC10CoreAuthUI27PasscodeSheetViewController *)sub_100027A1C(v5, (uint64_t)v8);
  }
  v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v6 = swift_unknownObjectRetain(a4);
  _bridgeAnyObjectToAny(_:)(v8, v6);
  swift_unknownObjectRelease(a4);
  return (_TtC10CoreAuthUI27PasscodeSheetViewController *)sub_100027A1C(v5, (uint64_t)v8);
}

- (void).cxx_destruct
{

}

- (void)viewModelDidRejectDevicePasscode:(id)a3
{
  id v4;
  _TtC10CoreAuthUI27PasscodeSheetViewController *v5;
  LAUIMechanism *v6;
  LAUIMechanism *v7;
  unint64_t v8;
  Class isa;

  v4 = a3;
  v5 = self;
  v6 = -[TransitionViewController mechanism](v5, "mechanism");
  if (v6)
  {
    v7 = v6;
    v8 = sub_100026D4C((uint64_t)&_swiftEmptyArrayStorage);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v8);
    -[LAUIMechanism uiEvent:options:](v7, "uiEvent:options:", 9, isa);

    swift_unknownObjectRelease(v7);
  }
  else
  {
    __break(1u);
  }
}

@end
