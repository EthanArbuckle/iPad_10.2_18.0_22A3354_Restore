@implementation AppPromotionDetailPageTransitioningDelegate

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC8AppStore43AppPromotionDetailPageTransitioningDelegate *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_10040A3C8(v8, a4, v10);

  return v12;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC8AppStore43AppPromotionDetailPageTransitioningDelegate *v11;
  char *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_10040C1B8();

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  _TtC8AppStore43AppPromotionDetailPageTransitioningDelegate *v5;
  char *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_10040B0CC(v4);

  return v6;
}

- (_TtC8AppStore43AppPromotionDetailPageTransitioningDelegate)init
{
  _TtC8AppStore43AppPromotionDetailPageTransitioningDelegate *result;

  result = (_TtC8AppStore43AppPromotionDetailPageTransitioningDelegate *)_swift_stdlib_reportUnimplementedInitializer("AppStore.AppPromotionDetailPageTransitioningDelegate", 52, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8AppStore43AppPromotionDetailPageTransitioningDelegate_originatingView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8AppStore43AppPromotionDetailPageTransitioningDelegate_detailPageViewController));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8AppStore43AppPromotionDetailPageTransitioningDelegate_presentingViewController);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8AppStore43AppPromotionDetailPageTransitioningDelegate_sourceCollectionViewController);
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore43AppPromotionDetailPageTransitioningDelegate_sourceIndexPath, (uint64_t *)&unk_100834600);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8AppStore43AppPromotionDetailPageTransitioningDelegate_sourceCell));
}

@end
