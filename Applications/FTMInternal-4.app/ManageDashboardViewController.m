@implementation ManageDashboardViewController

- (_TtC13FTMInternal_429ManageDashboardViewController)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  _TtC13FTMInternal_429ManageDashboardViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC13FTMInternal_429ManageDashboardViewController____lazy_storage___tableView) = 0;
  v4 = OBJC_IVAR____TtC13FTMInternal_429ManageDashboardViewController_dismissButton;
  v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v4) = (Class)sub_1001927B0();

  result = (_TtC13FTMInternal_429ManageDashboardViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100211390, "FTMInternal_4/ManageDashboardViewController.swift", 49, 2, 24, 0);
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC13FTMInternal_429ManageDashboardViewController *v2;

  v2 = self;
  sub_1001928E4();

}

- (_TtC13FTMInternal_429ManageDashboardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC13FTMInternal_429ManageDashboardViewController *result;

  v4 = a4;
  result = (_TtC13FTMInternal_429ManageDashboardViewController *)_swift_stdlib_reportUnimplementedInitializer("FTMInternal_4.ManageDashboardViewController", 43, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC13FTMInternal_429ManageDashboardViewController_dashboardList));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429ManageDashboardViewController_persistanceStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429ManageDashboardViewController____lazy_storage___tableView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13FTMInternal_429ManageDashboardViewController_dismissButton));
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  _TtC13FTMInternal_429ManageDashboardViewController *v13;
  double v14;
  uint64_t v16;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = qword_1002B39C0;
  v12 = a3;
  v13 = self;
  if (v11 != -1)
    swift_once(&qword_1002B39C0, sub_10016A8FC);
  v14 = *(double *)&qword_1002BEFB8;

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v14;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  char *v4;
  _BYTE v6[24];

  v4 = (char *)self + OBJC_IVAR____TtC13FTMInternal_429ManageDashboardViewController_dashboardList;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC13FTMInternal_429ManageDashboardViewController_dashboardList, v6, 0, 0);
  return *(_QWORD *)(*(_QWORD *)v4 + 16);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC13FTMInternal_429ManageDashboardViewController *v12;
  id v13;
  uint64_t v15;

  v7 = type metadata accessor for IndexPath(0, a2, a3);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  v13 = sub_10019307C(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v13;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC13FTMInternal_429ManageDashboardViewController *v14;
  uint64_t v15;

  v9 = type metadata accessor for IndexPath(0, a2, a3);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  v14 = self;
  sub_10019330C(v13, a4, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)didTapDismissWithSender:(id)a3
{
  id v5;
  id v6;
  _TtC13FTMInternal_429ManageDashboardViewController *v7;
  id v8;

  v5 = objc_allocWithZone((Class)UIImpactFeedbackGenerator);
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, "initWithStyle:", 1);
  objc_msgSend(v8, "impactOccurred");
  -[ManageDashboardViewController dismissViewControllerAnimated:completion:](v7, "dismissViewControllerAnimated:completion:", 1, 0);

}

@end
