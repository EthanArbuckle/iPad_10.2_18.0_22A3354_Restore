@implementation AppPromotionDetailPageTransitioningDelegate

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC22SubscribePageExtension43AppPromotionDetailPageTransitioningDelegate *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_100048080(v8, a4, v10);

  return v12;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC22SubscribePageExtension43AppPromotionDetailPageTransitioningDelegate *v11;
  char *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_100049FB4();

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension43AppPromotionDetailPageTransitioningDelegate *v5;
  char *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_100048D84(v4);

  return v6;
}

- (_TtC22SubscribePageExtension43AppPromotionDetailPageTransitioningDelegate)init
{
  _TtC22SubscribePageExtension43AppPromotionDetailPageTransitioningDelegate *result;

  result = (_TtC22SubscribePageExtension43AppPromotionDetailPageTransitioningDelegate *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.AppPromotionDetailPageTransitioningDelegate", 66, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43AppPromotionDetailPageTransitioningDelegate_originatingView));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43AppPromotionDetailPageTransitioningDelegate_detailPageViewController));
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtC22SubscribePageExtension43AppPromotionDetailPageTransitioningDelegate_presentingViewController);
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtC22SubscribePageExtension43AppPromotionDetailPageTransitioningDelegate_sourceCollectionViewController);
  sub_100011088((uint64_t)self+ OBJC_IVAR____TtC22SubscribePageExtension43AppPromotionDetailPageTransitioningDelegate_sourceIndexPath, &qword_1007F5520);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension43AppPromotionDetailPageTransitioningDelegate_sourceCell));
}

@end
