@implementation ConfirmationViewController

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t Strong;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ConfirmationViewController();
  v4 = (char *)v7.receiver;
  -[ConfirmationViewController viewDidDisappear:](&v7, "viewDidDisappear:", v3);
  Strong = swift_unknownObjectWeakLoadStrong(&v4[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI26ConfirmationViewController_delegate]);
  if (Strong)
  {
    v6 = Strong;
    sub_10000CAC4();

    swift_unknownObjectRelease(v6);
  }
  else
  {

  }
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ConfirmationViewController();
  v2 = v4.receiver;
  -[ConfirmationViewController viewDidLoad](&v4, "viewDidLoad");
  v3 = objc_msgSend(v2, "navigationItem", v4.receiver, v4.super_class);
  objc_msgSend(v3, "setHidesBackButton:animated:", 1, 0);

}

- (_TtC30FamilyControlsAuthenticationUI26ConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  if (!a4)
  {
    v13 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v14 = 0;
    v16 = 0;
    return (_TtC30FamilyControlsAuthenticationUI26ConfirmationViewController *)sub_100005604(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = v15;
  return (_TtC30FamilyControlsAuthenticationUI26ConfirmationViewController *)sub_100005604(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC30FamilyControlsAuthenticationUI26ConfirmationViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSString v14;
  NSString v15;
  _TtC30FamilyControlsAuthenticationUI26ConfirmationViewController *v16;
  objc_super v18;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v12;
  }
  *(_QWORD *)&self->delegate[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI26ConfirmationViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  v13 = a5;
  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  if (a4)
  {
    v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a4);
  }
  else
  {
    v15 = 0;
  }
  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for ConfirmationViewController();
  v16 = -[ConfirmationViewController initWithTitle:detailText:icon:contentLayout:](&v18, "initWithTitle:detailText:icon:contentLayout:", v14, v15, v13, a6);

  return v16;
}

- (void).cxx_destruct
{
  sub_100006064((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI26ConfirmationViewController_delegate]);
}

@end
