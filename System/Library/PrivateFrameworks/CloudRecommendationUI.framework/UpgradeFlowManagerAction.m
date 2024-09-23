@implementation UpgradeFlowManagerAction

- (void)upgradeFlowManager:(id)a3 didPresentViewController:(id)a4
{
  id v6;
  id v7;
  _TtC21CloudRecommendationUI24UpgradeFlowManagerAction *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_238113D9C();

}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  id v4;
  _TtC21CloudRecommendationUI24UpgradeFlowManagerAction *v5;

  v4 = a3;
  v5 = self;
  sub_238113FEC();

}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  id v4;
  _TtC21CloudRecommendationUI24UpgradeFlowManagerAction *v5;

  v4 = a3;
  v5 = self;
  sub_2381140BC();

}

- (void)upgradeFlowManagerDidFail:(id)a3 error:(id)a4
{
  id v6;
  _TtC21CloudRecommendationUI24UpgradeFlowManagerAction *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_238114188(a4);

}

- (_TtC21CloudRecommendationUI24UpgradeFlowManagerAction)init
{
  _TtC21CloudRecommendationUI24UpgradeFlowManagerAction *result;

  result = (_TtC21CloudRecommendationUI24UpgradeFlowManagerAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI24UpgradeFlowManagerAction_presenter));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI24UpgradeFlowManagerAction_account));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI24UpgradeFlowManagerAction_activeRecommendation));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI24UpgradeFlowManagerAction_upgradeFlowManager));
  swift_unknownObjectRelease();
}

@end
