@implementation InstallSheetViewController

- (void)viewDidLoad
{
  sub_1000128E8(self, (uint64_t)a2, 26, sub_10000FDA0);
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC26AppDistributionLaunchAngel26InstallSheetViewController *v10;

  v5 = type metadata accessor for MainActor(0, a2);
  v6 = static MainActor.shared.getter(v5);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v9 = v8;
  if ((swift_task_isCurrentExecutor(v7) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 96, v7, v9);
  v10 = self;
  sub_100010FC4(a3);
  swift_release(v6);

}

- (CGSize)preferredContentSize
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC26AppDistributionLaunchAngel26InstallSheetViewController *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  CGSize result;

  v3 = type metadata accessor for MainActor(0, a2);
  v4 = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v7 = v6;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 106, v5, v7);
  v8 = self;
  v9 = static MainActor.shared.getter();
  v10 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v12 = v11;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 106, v10, v12);

  swift_release(v9);
  swift_release(v4);
  v13 = 624.0;
  v14 = 0.0;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC26AppDistributionLaunchAngel26InstallSheetViewController *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = type metadata accessor for MainActor(0, a2);
  v5 = static MainActor.shared.getter();
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v8 = v7;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 109, v6, v8);
  v9 = self;
  v10 = static MainActor.shared.getter();
  v11 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v13 = v12;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 109, v11, v13);

  swift_release(v10);
  swift_release(v5);
}

- (void)miniProductPageRequestDidFinish
{
  sub_1000117FC(self, (uint64_t)a2, (uint64_t)&unk_100041D18, (uint64_t)&unk_100048968, (uint64_t (*)(char *, uint64_t, _QWORD *))sub_1000162E8);
}

- (void)moreButtonPressed
{
  sub_1000117FC(self, (uint64_t)a2, (uint64_t)&unk_100041CF0, (uint64_t)&unk_100048958, (uint64_t (*)(char *, uint64_t, _QWORD *))sub_100016434);
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _TtC26AppDistributionLaunchAngel26InstallSheetViewController *v17;
  id v18;

  v9 = type metadata accessor for MainActor(0, a2);
  v10 = static MainActor.shared.getter(v9);
  v11 = dispatch thunk of Actor.unownedExecutor.getter(v9, &protocol witness table for MainActor);
  v13 = v12;
  if ((swift_task_isCurrentExecutor(v11) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 134, v11, v13);
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = self;
  v18 = (id)sub_1000138C8((uint64_t)v15, (uint64_t)v16);
  swift_release(v10);

  return v18;
}

- (void)confirmPressed
{
  sub_1000128E8(self, (uint64_t)a2, 151, sub_100011BFC);
}

- (void)cancelPressed
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC26AppDistributionLaunchAngel26InstallSheetViewController *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _TtC26AppDistributionLaunchAngel26InstallSheetViewController *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;

  v3 = sub_1000051F0(&qword_100048300);
  __chkstk_darwin(v3);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for MainActor(0, v6);
  v8 = static MainActor.shared.getter(v7);
  v9 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  v11 = v10;
  if ((swift_task_isCurrentExecutor(v9) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 177, v9, v11);
  v12 = self;
  v13 = static MainActor.shared.getter(v12);
  v14 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  v16 = v15;
  if ((swift_task_isCurrentExecutor(v14) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 177, v14, v16);
  v17 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v5, 1, 1, v17);
  v18 = v12;
  v19 = static MainActor.shared.getter(v18);
  v20 = (_QWORD *)swift_allocObject(&unk_100041CA0, 40, 7);
  v20[2] = v19;
  v20[3] = &protocol witness table for MainActor;
  v20[4] = v18;
  v21 = sub_100016434((uint64_t)v5, (uint64_t)&unk_100048938, (uint64_t)v20);
  swift_release(v8);

  swift_release(v13);
  swift_release(v21);
}

- (_TtC26AppDistributionLaunchAngel26InstallSheetViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC26AppDistributionLaunchAngel26InstallSheetViewController *result;

  v6 = type metadata accessor for MainActor(0, a2);
  static MainActor.shared.getter();
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  v9 = v8;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 13, v7, v9);
  result = (_TtC26AppDistributionLaunchAngel26InstallSheetViewController *)_swift_stdlib_reportUnimplementedInitializer("AppDistributionLaunchAngel.InstallSheetViewController", 53, "init(title:detailText:symbolName:contentLayout:)", 48, 0);
  __break(1u);
  return result;
}

- (_TtC26AppDistributionLaunchAngel26InstallSheetViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC26AppDistributionLaunchAngel26InstallSheetViewController *result;

  v7 = type metadata accessor for MainActor(0, a2);
  static MainActor.shared.getter();
  v8 = dispatch thunk of Actor.unownedExecutor.getter(v7, &protocol witness table for MainActor);
  v10 = v9;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/InstallSheetViewController.swift", 59, 1, 13, v8, v10);
  v11 = a5;
  result = (_TtC26AppDistributionLaunchAngel26InstallSheetViewController *)_swift_stdlib_reportUnimplementedInitializer("AppDistributionLaunchAngel.InstallSheetViewController", 53, "init(title:detailText:icon:contentLayout:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10000F764((uint64_t)&self->delegate[OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_localizedContent]);
  sub_100014618((uint64_t)&self->delegate[OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_delegate]);

}

@end
