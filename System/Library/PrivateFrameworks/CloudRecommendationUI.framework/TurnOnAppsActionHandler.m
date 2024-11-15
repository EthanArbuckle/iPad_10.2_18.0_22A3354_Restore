@implementation TurnOnAppsActionHandler

- (void)remoteUIFlowManager:(id)a3 didCompleteFlowWithSuccess:(BOOL)a4 error:(id)a5
{
  id v7;
  _TtC21CloudRecommendationUI23TurnOnAppsActionHandler *v8;
  id v9;

  v7 = a3;
  v8 = self;
  v9 = a5;
  sub_23814DF7C(a5, "TurnOnApps flow completed with error %s");

}

- (void)remoteUIFlowManager:(id)a3 didDismissWithError:(id)a4
{
  id v6;
  _TtC21CloudRecommendationUI23TurnOnAppsActionHandler *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_23814DF7C(a4, "TurnOnApps flow cancelled with error %s");

}

- (_TtC21CloudRecommendationUI23TurnOnAppsActionHandler)init
{
  _TtC21CloudRecommendationUI23TurnOnAppsActionHandler *result;

  result = (_TtC21CloudRecommendationUI23TurnOnAppsActionHandler *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI23TurnOnAppsActionHandler_presenter));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI23TurnOnAppsActionHandler_account));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI23TurnOnAppsActionHandler_remoteUIPresenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI23TurnOnAppsActionHandler_activeRecommendation));
}

@end
