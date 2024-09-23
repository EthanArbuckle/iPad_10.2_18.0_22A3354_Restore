@implementation DashboardContentViewController

- (_TtC13GameOverlayUI30DashboardContentViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100095038();
}

- (void)viewDidLoad
{
  _TtC13GameOverlayUI30DashboardContentViewController *v2;

  v2 = self;
  sub_100090EB0();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC13GameOverlayUI30DashboardContentViewController *v4;

  v4 = self;
  sub_100091254(a3);

}

- (void)viewWillLayoutSubviews
{
  _TtC13GameOverlayUI30DashboardContentViewController *v2;

  v2 = self;
  sub_1000915FC();

}

- (UINavigationController)navigationController
{
  return (UINavigationController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                           + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController__navigationController));
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC13GameOverlayUI30DashboardContentViewController *v4;

  v4 = self;
  sub_10009180C(a3);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DashboardContentViewController();
  v4 = (char *)v6.receiver;
  -[DashboardContentViewController viewDidDisappear:](&v6, "viewDidDisappear:", v3);
  sub_100092FD4((uint64_t)&_swiftEmptyArrayStorage, 0);
  v5 = *(void **)&v4[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_contentViewController];
  *(_QWORD *)&v4[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_contentViewController] = 0;

  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_daemonProxy], "setDataUpdateDelegate:", 0, v6.receiver, v6.super_class);
}

- (void)dismissNotificationCallback:(id)a3
{
  id v4;
  _TtC13GameOverlayUI30DashboardContentViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100095180();

}

- (void)scrollToTopPressed:(id)a3
{
  _TtC13GameOverlayUI30DashboardContentViewController *v5;
  uint64_t v6;
  _TtC13GameOverlayUI30DashboardContentViewController *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3, v6);
    _bridgeAnyObjectToAny(_:)(v8);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_100093524();

  sub_100010ED0((uint64_t)v8, &qword_10010EB30);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DashboardContentViewController();
  v4 = a3;
  v5 = v6.receiver;
  -[DashboardContentViewController traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_1000937B0();

}

- (void)donePressed:(id)a3
{
  _TtC13GameOverlayUI30DashboardContentViewController *v5;
  uint64_t v6;
  _TtC13GameOverlayUI30DashboardContentViewController *v7;
  void (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  _OWORD v11[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3, v6);
    _bridgeAnyObjectToAny(_:)(v11);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v7 = self;
  }
  v8 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_dismissHandler);
  if (v8)
  {
    v9 = *(_QWORD *)&self->dismissHandler[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_dismissHandler];
    v10 = swift_retain(v9);
    v8(v10);
    sub_100050580((uint64_t)v8, v9);
  }

  sub_100010ED0((uint64_t)v11, &qword_10010EB30);
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  _TtC13GameOverlayUI30DashboardContentViewController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_100095374(v8);

}

- (void)refreshContentsForDataType:(unsigned int)a3 userInfo:(id)a4
{
  uint64_t v4;
  _TtC13GameOverlayUI20GameOverlayUIService *v6;
  _TtC13GameOverlayUI30DashboardContentViewController *v7;
  SEL v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v4 = *(_QWORD *)&a3;
  v6 = (_TtC13GameOverlayUI20GameOverlayUIService *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v7 = self;
  sub_100093D18(v4);

  swift_bridgeObjectRelease(v6, v8, v9, v10, v11, v12, v13, v14);
}

- (void)finish
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC13GameOverlayUI30DashboardContentViewController *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_dismissHandler);
  if (v2)
  {
    v3 = *(_QWORD *)&self->dismissHandler[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_dismissHandler];
    v5 = self;
    v4 = sub_10001B3C0((uint64_t)v2, v3);
    v2(v4);
    sub_100050580((uint64_t)v2, v3);

  }
}

- (void)finishAndPlayChallenge:(id)a3
{
  id v4;
  _TtC13GameOverlayUI30DashboardContentViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100094014(v4);

}

- (void)finishWithTurnBasedMatch:(id)a3
{
  id v4;
  _TtC13GameOverlayUI30DashboardContentViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1000940BC(v4);

}

- (void)quitTurnBasedMatch:(id)a3
{
  id v4;
  _TtC13GameOverlayUI30DashboardContentViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100094164(v4);

}

- (void)dashboardDidChangeToViewState:(int64_t)a3
{
  sub_1000944F0((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_viewState);
}

- (void)dashboardDidChangeToLeaderboardTimeScope:(int64_t)a3
{
  sub_1000944F0((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_leaderboardTimeScope);
}

- (void)dashboardDidChangeToLeaderboardPlayerScope:(int64_t)a3
{
  sub_1000944F0((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC13GameOverlayUI16DashboardRequest_leaderboardPlayerScope);
}

- (void)dashboardDidChangeToLeaderboardIdentifier:(id)a3
{
  uint64_t v4;
  _TtC13GameOverlayUI20GameOverlayUIService *v5;
  _TtC13GameOverlayUI20GameOverlayUIService *v6;
  _TtC13GameOverlayUI30DashboardContentViewController *v7;
  SEL v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = self;
  sub_100094514(v4, (uint64_t)v6);

  swift_bridgeObjectRelease(v6, v8, v9, v10, v11, v12, v13, v14);
}

- (void)dismissWithGameController
{
  _TtC13GameOverlayUI30DashboardContentViewController *v2;

  v2 = self;
  sub_100094604();

}

- (void)setToLightBackground
{
  sub_10009476C((char *)self, (uint64_t)a2, 0);
}

- (void)setToDarkBackground
{
  sub_10009476C((char *)self, (uint64_t)a2, 2);
}

- (_TtC13GameOverlayUI30DashboardContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC13GameOverlayUI30DashboardContentViewController *result;

  v4 = a4;
  result = (_TtC13GameOverlayUI30DashboardContentViewController *)_swift_stdlib_reportUnimplementedInitializer("GameOverlayUI.DashboardContentViewController", 44, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  SEL v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  SEL v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  SEL v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;

  sub_100050580(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_dismissHandler), *(_QWORD *)&self->dismissHandler[OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_dismissHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController__navigationController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_contentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_effectView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_daemonProxy));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_request));
  sub_10009549C((uint64_t)self + OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_remoteTarget, v3);
  swift_bridgeObjectRelease(*(_TtC13GameOverlayUI20GameOverlayUIService **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_dashboardAssetNames), v4, v5, v6, v7, v8, v9, v10);
  swift_bridgeObjectRelease(*(_TtC13GameOverlayUI20GameOverlayUIService **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_leaderboardSetAssetNames), v11, v12, v13, v14, v15, v16, v17);
  swift_bridgeObjectRelease(*(_TtC13GameOverlayUI20GameOverlayUIService **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC13GameOverlayUI30DashboardContentViewController_leaderboardAssetNames), v18, v19, v20, v21, v22, v23, v24);
}

@end
