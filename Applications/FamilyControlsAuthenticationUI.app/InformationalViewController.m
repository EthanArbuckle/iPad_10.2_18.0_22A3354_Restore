@implementation InformationalViewController

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC30FamilyControlsAuthenticationUI27InformationalViewController *v4;

  v4 = self;
  sub_100008D68(a3);

}

- (_TtC30FamilyControlsAuthenticationUI27InformationalViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
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
    return (_TtC30FamilyControlsAuthenticationUI27InformationalViewController *)sub_100008EE4(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v13 = v12;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v16 = v15;
  return (_TtC30FamilyControlsAuthenticationUI27InformationalViewController *)sub_100008EE4(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC30FamilyControlsAuthenticationUI27InformationalViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSString v14;
  NSString v15;
  _TtC30FamilyControlsAuthenticationUI27InformationalViewController *v16;
  objc_super v18;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    a4 = v12;
  }
  *(_QWORD *)&self->delegate[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI27InformationalViewController_delegate] = 0;
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
  v18.super_class = (Class)type metadata accessor for InformationalViewController();
  v16 = -[InformationalViewController initWithTitle:detailText:icon:contentLayout:](&v18, "initWithTitle:detailText:icon:contentLayout:", v14, v15, v13, a6);

  return v16;
}

- (void).cxx_destruct
{
  sub_100006064((uint64_t)&self->OBWelcomeController_opaque[OBJC_IVAR____TtC30FamilyControlsAuthenticationUI27InformationalViewController_delegate]);
}

@end
