@implementation InstallConfirmationViewController

- (_TtC26AppDistributionLaunchAngel33InstallConfirmationViewController)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC26AppDistributionLaunchAngel33InstallConfirmationViewController *v10;

  v4 = type metadata accessor for MainActor(0, a2);
  v5 = static MainActor.shared.getter(v4);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v8 = v7;
  if ((swift_task_isCurrentExecutor(v6) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallConfirmationViewController.swift", 66, 1, 44, v6, v8);
  v9 = a3;
  v10 = (_TtC26AppDistributionLaunchAngel33InstallConfirmationViewController *)sub_100030F40();
  swift_release(v5);
  return v10;
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC26AppDistributionLaunchAngel33InstallConfirmationViewController *v10;

  v5 = type metadata accessor for MainActor(0, a2);
  v6 = static MainActor.shared.getter(v5);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v9 = v8;
  if ((swift_task_isCurrentExecutor(v7) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallConfirmationViewController.swift", 66, 1, 48, v7, v9);
  v10 = self;
  sub_10002D954(a3, (uint64_t)v10);
  swift_release(v6);

}

- (int64_t)preferredStatusBarStyle
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC26AppDistributionLaunchAngel33InstallConfirmationViewController *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  v3 = type metadata accessor for MainActor(0, a2);
  v4 = static MainActor.shared.getter(v3);
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v7 = v6;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallConfirmationViewController.swift", 66, 1, 58, v5, v7);
  v8 = self;
  v9 = static MainActor.shared.getter(v8);
  v10 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v12 = v11;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallConfirmationViewController.swift", 66, 1, 58, v10, v12);
  v13 = *((unsigned __int8 *)&v8->super.super.super.isa
        + OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_isIPad);
  swift_release(v4);

  swift_release(v9);
  return ~v13 & 1;
}

- (_TtC26AppDistributionLaunchAngel33InstallConfirmationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC26AppDistributionLaunchAngel33InstallConfirmationViewController *result;

  v5 = type metadata accessor for MainActor(0, a2);
  static MainActor.shared.getter(v5);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v8 = v7;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallConfirmationViewController.swift", 66, 1, 24, v6, v8);
  v9 = a4;
  result = (_TtC26AppDistributionLaunchAngel33InstallConfirmationViewController *)_swift_stdlib_reportUnimplementedInitializer("AppDistributionLaunchAngel.InstallConfirmationViewController", 60, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100007E04(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_dismissAction), *(_QWORD *)&self->dismissAction[OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_dismissAction]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_childViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_responseAction));
  sub_100031084((uint64_t)self + OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_localizedContent, type metadata accessor for LocalizedInstallSheetContent);
  sub_100030EBC((uint64_t)self + OBJC_IVAR____TtC26AppDistributionLaunchAngel33InstallConfirmationViewController_appStoreMetrics);
}

@end
