@implementation ActivitySceneDelegateBase

- (UIWindow)window
{
  return (UIWindow *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR____TtC10ChronoCore25ActivitySceneDelegateBase_window));
}

- (void)setWindow:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ChronoCore25ActivitySceneDelegateBase_window);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10ChronoCore25ActivitySceneDelegateBase_window) = (Class)a3;
  v3 = a3;

}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC10ChronoCore25ActivitySceneDelegateBase *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1D280A89C(v8);

}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4;
  _TtC10ChronoCore25ActivitySceneDelegateBase *v5;

  v4 = a3;
  v5 = self;
  sub_1D280B99C("[%{public}s] Became active");

}

- (void)sceneWillResignActive:(id)a3
{
  id v4;
  _TtC10ChronoCore25ActivitySceneDelegateBase *v5;

  v4 = a3;
  v5 = self;
  sub_1D280B99C("[%{public}s] Resigned active");

}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4;
  _TtC10ChronoCore25ActivitySceneDelegateBase *v5;

  v4 = a3;
  v5 = self;
  sub_1D280BB9C();

}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4;
  _TtC10ChronoCore25ActivitySceneDelegateBase *v5;

  v4 = a3;
  v5 = self;
  sub_1D280BFAC();

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  _TtC10ChronoCore25ActivitySceneDelegateBase *v5;

  v4 = a3;
  v5 = self;
  sub_1D2808978((uint64_t)v4);

}

- (_TtC10ChronoCore25ActivitySceneDelegateBase)init
{
  return (_TtC10ChronoCore25ActivitySceneDelegateBase *)sub_1D2809468();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC10ChronoCore25ActivitySceneDelegateBase_logger;
  v4 = sub_1D29C29A0();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC10ChronoCore25ActivitySceneDelegateBase_clientLogger, v4);
  v5((char *)self + OBJC_IVAR____TtC10ChronoCore25ActivitySceneDelegateBase_viewLogger, v4);
  swift_bridgeObjectRelease();
  sub_1D271E704((uint64_t)self + OBJC_IVAR____TtC10ChronoCore25ActivitySceneDelegateBase_metricsDefinition, &qword_1ED952E50);
  sub_1D271E704((uint64_t)self + OBJC_IVAR____TtC10ChronoCore25ActivitySceneDelegateBase_activityService, &qword_1ED954DF0);
  sub_1D271E704((uint64_t)self + OBJC_IVAR____TtC10ChronoCore25ActivitySceneDelegateBase_descriptorService, &qword_1ED958580);
  sub_1D271E704((uint64_t)self + OBJC_IVAR____TtC10ChronoCore25ActivitySceneDelegateBase_descriptor, &qword_1ED952748);
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
}

@end
