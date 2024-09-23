@implementation OAuthAuthorizationViewController

- (_TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController *v10;

  v4 = type metadata accessor for MainActor(0, a2);
  v5 = static MainActor.shared.getter(v4);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v8 = v7;
  if ((swift_task_isCurrentExecutor(v6) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 24, v6, v8);
  v9 = a3;
  v10 = (_TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController *)sub_10001EE80();
  swift_release(v5);
  return v10;
}

- (int64_t)preferredStatusBarStyle
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = type metadata accessor for MainActor(0, a2);
  v4 = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v7 = v6;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 28, v5, v7);
  v8 = self;
  v9 = static MainActor.shared.getter();
  v10 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v12 = v11;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 28, v10, v12);

  swift_release(v9);
  swift_release(v4);
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  objc_super v18;

  v3 = a3;
  v5 = type metadata accessor for MainActor(0, a2);
  v6 = static MainActor.shared.getter(v5);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v9 = v8;
  if ((swift_task_isCurrentExecutor(v7) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 32, v7, v9);
  v10 = self;
  v11 = static MainActor.shared.getter(v10);
  v12 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v14 = v13;
  if ((swift_task_isCurrentExecutor(v12) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 32, v12, v14);
  v18.receiver = v10;
  v18.super_class = (Class)type metadata accessor for OAuthAuthorizationViewController(0);
  -[OAuthAuthorizationViewController viewWillAppear:](&v18, "viewWillAppear:", v3);
  v15 = objc_msgSend((id)objc_opt_self(UIColor), "blackColor");
  v16 = objc_msgSend(v15, "colorWithAlphaComponent:", 0.8);

  sub_10001E394(v16, v17);
  swift_release(v6);

  swift_release(v11);
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController *v10;

  v5 = type metadata accessor for MainActor(0, a2);
  v6 = static MainActor.shared.getter(v5);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v9 = v8;
  if ((swift_task_isCurrentExecutor(v7) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 37, v7, v9);
  v10 = self;
  sub_10001D578(a3);
  swift_release(v6);

}

- (_TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController *result;

  v5 = type metadata accessor for MainActor(0, a2);
  static MainActor.shared.getter();
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v8 = v7;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 12, v6, v8);
  v9 = a4;
  result = (_TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController *)_swift_stdlib_reportUnimplementedInitializer("AppDistributionLaunchAngel.OAuthAuthorizationViewController", 59, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5;

  sub_100007E04(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_dismissAction), *(_QWORD *)&self->dismissAction[OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_dismissAction]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_responseAction));
  v3 = (char *)self + OBJC_IVAR____TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController_sheetContext;
  v5 = type metadata accessor for OAuthAuthorizationContext(0, v4);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v3, v5);
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC26AppDistributionLaunchAngel32OAuthAuthorizationViewController *v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v5 = type metadata accessor for MainActor(0, a2);
  v6 = static MainActor.shared.getter(v5);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v9 = v8;
  if ((swift_task_isCurrentExecutor(v7) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/OAuthAuthorizationViewController.swift", 65, 1, 90, v7, v9);
  v10 = a3;
  v11 = self;
  sub_10001EF60((uint64_t)v11, v12);
  v14 = v13;
  swift_release(v6);

  return v14;
}

@end
