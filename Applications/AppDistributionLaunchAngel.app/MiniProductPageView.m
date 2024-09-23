@implementation MiniProductPageView

- (_TtC26AppDistributionLaunchAngel19MiniProductPageView)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _TtC26AppDistributionLaunchAngel19MiniProductPageView *result;

  v4 = type metadata accessor for MainActor(0, a2);
  ((void (*)(void))static MainActor.shared.getter)();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v7 = v6;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/MiniProductPageView.swift", 52, 1, 22, v5, v7);
  v8 = static MainActor.shared.getter(a3);
  v9 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v11 = v10;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/MiniProductPageView.swift", 52, 1, 23, v9, v11);
  swift_release(v8);
  result = (_TtC26AppDistributionLaunchAngel19MiniProductPageView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000350F0, "AppDistributionLaunchAngel/MiniProductPageView.swift", 52, 2, 23, 0);
  __break(1u);
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC26AppDistributionLaunchAngel19MiniProductPageView *v11;

  v5 = type metadata accessor for MainActor(0, a2);
  v6 = static MainActor.shared.getter(v5);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  v9 = v8;
  if ((swift_task_isCurrentExecutor(v7) & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/MiniProductPageView.swift", 52, 1, 27, v7, v9);
  v10 = a3;
  v11 = self;
  sub_10001FA70((uint64_t)a3, (uint64_t)v11);
  swift_release(v6);

}

- (_TtC26AppDistributionLaunchAngel19MiniProductPageView)initWithFrame:(CGRect)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC26AppDistributionLaunchAngel19MiniProductPageView *result;

  v3 = type metadata accessor for MainActor(0, a2);
  static MainActor.shared.getter(v3);
  v4 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  v6 = v5;
  if ((swift_task_isCurrentExecutor() & 1) == 0)
    swift_task_reportUnexpectedExecutor("AppDistributionLaunchAngel/MiniProductPageView.swift", 52, 1, 11, v4, v6);
  result = (_TtC26AppDistributionLaunchAngel19MiniProductPageView *)_swift_stdlib_reportUnimplementedInitializer("AppDistributionLaunchAngel.MiniProductPageView", 46, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC26AppDistributionLaunchAngel19MiniProductPageView_context;
  v4 = type metadata accessor for InstallSheetContext(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC26AppDistributionLaunchAngel19MiniProductPageView_appStoreComponentsWrapper));
}

@end
