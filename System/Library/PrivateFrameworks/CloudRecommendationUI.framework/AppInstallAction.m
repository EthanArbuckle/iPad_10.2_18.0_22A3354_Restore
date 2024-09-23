@implementation AppInstallAction

- (_TtC21CloudRecommendationUI16AppInstallAction)init
{
  _TtC21CloudRecommendationUI16AppInstallAction *result;

  result = (_TtC21CloudRecommendationUI16AppInstallAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI16AppInstallAction_activeRecommendation));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21CloudRecommendationUI16AppInstallAction_storeProductViewController));
  sub_238120710((uint64_t)self + OBJC_IVAR____TtC21CloudRecommendationUI16AppInstallAction_delegate);
}

- (void)productViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v5;
  _TtC21CloudRecommendationUI16AppInstallAction *v6;

  v5 = a3;
  v6 = self;
  _s21CloudRecommendationUI16AppInstallActionC21productViewController_13didFinishWithySo014SKStoreProducthI0CSg_So19SKProductPageResultVtF_0();

}

@end
