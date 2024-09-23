@implementation LicenseResolutionViewController

- (_TtC26AppDistributionLaunchAngel31LicenseResolutionViewController)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC26AppDistributionLaunchAngel31LicenseResolutionViewController *v10;

  v4 = type metadata accessor for MainActor(0, a2);
  v5 = static MainActor.shared.getter(v4);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v8 = v7;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/LicenseResolutionViewController.swift", 64, 1, 23, v6, v8);
  v9 = a3;
  v10 = (_TtC26AppDistributionLaunchAngel31LicenseResolutionViewController *)sub_100007908();
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
  _TtC26AppDistributionLaunchAngel31LicenseResolutionViewController *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  v3 = type metadata accessor for MainActor(0, a2);
  v4 = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v7 = v6;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/LicenseResolutionViewController.swift", 64, 1, 27, v5, v7);
  v8 = self;
  v9 = static MainActor.shared.getter();
  v10 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v12 = v11;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/LicenseResolutionViewController.swift", 64, 1, 27, v10, v12);
  v13 = *((unsigned __int8 *)&v8->super.super.super.isa
        + OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_isIPad);
  swift_release(v4);

  swift_release(v9);
  return ~v13 & 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC26AppDistributionLaunchAngel31LicenseResolutionViewController *v10;
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
  if ((((uint64_t (*)(void))swift_task_isCurrentExecutor)() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/LicenseResolutionViewController.swift", 64, 1, 31, v7, v9);
  v10 = self;
  v11 = static MainActor.shared.getter(v10);
  v12 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v14 = v13;
  if ((swift_task_isCurrentExecutor(v12) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/LicenseResolutionViewController.swift", 64, 1, 31, v12, v14);
  v18.receiver = v10;
  v18.super_class = (Class)type metadata accessor for LicenseResolutionViewController(0);
  -[LicenseResolutionViewController viewWillAppear:](&v18, "viewWillAppear:", v3);
  v15 = objc_msgSend((id)objc_opt_self(UIColor), "blackColor");
  v16 = objc_msgSend(v15, "colorWithAlphaComponent:", 0.8);

  sub_100006D60(v16, v17);
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
  _TtC26AppDistributionLaunchAngel31LicenseResolutionViewController *v10;

  v5 = type metadata accessor for MainActor(0, a2);
  v6 = static MainActor.shared.getter(v5);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v9 = v8;
  if ((swift_task_isCurrentExecutor(v7) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/LicenseResolutionViewController.swift", 64, 1, 36, v7, v9);
  v10 = self;
  sub_1000066DC(a3);
  swift_release(v6);

}

- (_TtC26AppDistributionLaunchAngel31LicenseResolutionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC26AppDistributionLaunchAngel31LicenseResolutionViewController *result;

  v5 = type metadata accessor for MainActor(0, a2);
  static MainActor.shared.getter();
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v8 = v7;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/LicenseResolutionViewController.swift", 64, 1, 12, v6, v8);
  v9 = a4;
  result = (_TtC26AppDistributionLaunchAngel31LicenseResolutionViewController *)_swift_stdlib_reportUnimplementedInitializer("AppDistributionLaunchAngel.LicenseResolutionViewController", 58, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  sub_100007E04(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_dismissAction), *(_QWORD *)&self->dismissAction[OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_dismissAction]);
  v3 = (char *)self + OBJC_IVAR____TtC26AppDistributionLaunchAngel31LicenseResolutionViewController_sheetContext;
  v4 = type metadata accessor for LicenseResolutionContext(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)safariViewControllerDidFinish:(id)a3
{
  id v4;
  _TtC26AppDistributionLaunchAngel31LicenseResolutionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100007A28();

}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC26AppDistributionLaunchAngel31LicenseResolutionViewController *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t isCurrentExecutor;
  uint64_t v17;

  v5 = type metadata accessor for MainActor(0, a2);
  v6 = static MainActor.shared.getter(v5);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v9 = v8;
  if ((swift_task_isCurrentExecutor(v7) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/LicenseResolutionViewController.swift", 64, 1, 78, v7, v9);
  v10 = a3;
  v11 = self;
  v12 = static MainActor.shared.getter(v11);
  v13 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v15 = v14;
  isCurrentExecutor = swift_task_isCurrentExecutor(v13);
  if ((isCurrentExecutor & 1) == 0)
    isCurrentExecutor = swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/LicenseResolutionViewController.swift", 64, 1, 78, v13, v15);
  sub_100006F70(isCurrentExecutor, v17);
  swift_release(v6);

  swift_release(v12);
}

@end
