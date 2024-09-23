@implementation AnalyticsDailyMultiEventManager

- (void)daemonReady:(id)a3
{
  uint64_t v4;
  void *v5;
  _TtC19HealthBalanceDaemon31AnalyticsDailyMultiEventManager *v6;
  id v7;
  void (*v8)(void);

  objc_opt_self();
  v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    v5 = (void *)v4;
    swift_unknownObjectRetain_n();
    v6 = self;
    v7 = objc_msgSend(v5, sel_analyticsSubmissionCoordinator);
    objc_msgSend(v7, sel_addObserver_queue_, v6, 0);

    v8 = *(void (**)(void))((char *)&v6->super.isa
                          + OBJC_IVAR____TtC19HealthBalanceDaemon31AnalyticsDailyMultiEventManager_unitTest_didObserveAnalyticsSubmissionCoordinator);
    if (v8)
      v8();

    swift_unknownObjectRelease_n();
  }
}

- (void)reportDailyAnalyticsWithCoordinator:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC19HealthBalanceDaemon31AnalyticsDailyMultiEventManager *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_23DCBFFB0(sub_23DCBFFA8, v7);

  swift_release();
}

- (_TtC19HealthBalanceDaemon31AnalyticsDailyMultiEventManager)init
{
  _TtC19HealthBalanceDaemon31AnalyticsDailyMultiEventManager *result;

  result = (_TtC19HealthBalanceDaemon31AnalyticsDailyMultiEventManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19HealthBalanceDaemon31AnalyticsDailyMultiEventManager_eventSubmissionManager));
  sub_23DC97390(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC19HealthBalanceDaemon31AnalyticsDailyMultiEventManager_unitTest_didObserveAnalyticsSubmissionCoordinator));
}

@end
