@implementation AppPromotionDetailPageTransitioningDelegate

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC20ProductPageExtension43AppPromotionDetailPageTransitioningDelegate *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_1001CBCA4(v8, a4, v10);

  return v12;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC20ProductPageExtension43AppPromotionDetailPageTransitioningDelegate *v11;
  char *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_1001CDB48();

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  _TtC20ProductPageExtension43AppPromotionDetailPageTransitioningDelegate *v5;
  char *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1001CC9A8(v4);

  return v6;
}

- (_TtC20ProductPageExtension43AppPromotionDetailPageTransitioningDelegate)init
{
  _TtC20ProductPageExtension43AppPromotionDetailPageTransitioningDelegate *result;

  result = (_TtC20ProductPageExtension43AppPromotionDetailPageTransitioningDelegate *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.AppPromotionDetailPageTransitioningDelegate", 64, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension43AppPromotionDetailPageTransitioningDelegate_originatingView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension43AppPromotionDetailPageTransitioningDelegate_detailPageViewController));
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtC20ProductPageExtension43AppPromotionDetailPageTransitioningDelegate_presentingViewController);
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtC20ProductPageExtension43AppPromotionDetailPageTransitioningDelegate_sourceCollectionViewController);
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension43AppPromotionDetailPageTransitioningDelegate_sourceIndexPath, (uint64_t *)&unk_1008102F0);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension43AppPromotionDetailPageTransitioningDelegate_sourceCell));
}

@end
