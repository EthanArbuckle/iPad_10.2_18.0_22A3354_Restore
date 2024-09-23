@implementation ActionViewController

- (UILabel)descriptionLabel
{
  return (UILabel *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC26GameCenterMessageExtension20ActionViewController_descriptionLabel, a2);
}

- (void)setDescriptionLabel:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension20ActionViewController_descriptionLabel, a3);
}

- (UIButton)actionButton
{
  return (UIButton *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC26GameCenterMessageExtension20ActionViewController_actionButton, a2);
}

- (void)setActionButton:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension20ActionViewController_actionButton, a3);
}

- (void)viewDidLoad
{
  _TtC26GameCenterMessageExtension20ActionViewController *v2;

  v2 = self;
  sub_100038B18();

}

- (void)openSettings
{
  id v3;
  _TtC26GameCenterMessageExtension20ActionViewController *v4;
  id v5;
  id v6;
  id v7;

  v3 = objc_allocWithZone((Class)GKReporter);
  v4 = self;
  v5 = objc_msgSend(v3, "init");
  objc_msgSend(v5, "reportEvent:type:", GKReporterDomainManualFriending, GKFriendRequestOpenSettings);

  v6 = objc_msgSend((id)objc_opt_self(GKApplicationWorkspace), "defaultWorkspace");
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "openGameCenterSettings");

  }
  else
  {
    __break(1u);
  }
}

- (_TtC26GameCenterMessageExtension20ActionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC26GameCenterMessageExtension20ActionViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension20ActionViewController_descriptionLabel, 0);
    swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension20ActionViewController_actionButton, 0);
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension20ActionViewController_descriptionLabel, 0);
    swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension20ActionViewController_actionButton, 0);
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for ActionViewController();
  v11 = -[ActionViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC26GameCenterMessageExtension20ActionViewController)initWithCoder:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension20ActionViewController_descriptionLabel, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension20ActionViewController_actionButton, 0);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ActionViewController();
  return -[ActionViewController initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension20ActionViewController_descriptionLabel, a2);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC26GameCenterMessageExtension20ActionViewController_actionButton, v3);
}

@end
