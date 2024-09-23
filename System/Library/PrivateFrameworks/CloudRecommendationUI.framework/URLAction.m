@implementation URLAction

- (void)liftUIPresenterDidLoadWithSuccess:(BOOL)a3 error:(id)a4
{
  _TtC21CloudRecommendationUI9URLAction *v5;
  id v6;

  v5 = self;
  v6 = a4;
  sub_238183798(a4);

}

- (void)liftUIPresenterDidCompleteWithUserInfo:(id)a3
{
  uint64_t v4;
  _TtC21CloudRecommendationUI9URLAction *v5;

  if (a3)
    v4 = sub_23818A0D4();
  else
    v4 = 0;
  v5 = self;
  sub_238182534(v4);

  swift_bridgeObjectRelease();
}

- (void)liftUIPresenterDidCancelWithUserInfo:(id)a3
{
  _TtC21CloudRecommendationUI9URLAction *v4;

  if (a3)
    sub_23818A0D4();
  v4 = self;
  sub_238183988();

  swift_bridgeObjectRelease();
}

- (void)remoteUIFlowManager:(id)a3 didCompleteFlowWithSuccess:(BOOL)a4 error:(id)a5
{
  id v7;
  _TtC21CloudRecommendationUI9URLAction *v8;
  id v9;

  v7 = a3;
  v8 = self;
  v9 = a5;
  sub_238183ACC(a5);

}

- (void)remoteUIFlowManager:(id)a3 didDismissWithError:(id)a4
{
  id v6;
  _TtC21CloudRecommendationUI9URLAction *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_238183DE0(a4);

}

- (_TtC21CloudRecommendationUI9URLAction)init
{
  _TtC21CloudRecommendationUI9URLAction *result;

  result = (_TtC21CloudRecommendationUI9URLAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release();
  swift_unknownObjectRelease();

}

@end
