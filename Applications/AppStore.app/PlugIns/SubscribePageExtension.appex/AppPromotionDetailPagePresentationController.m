@implementation AppPromotionDetailPagePresentationController

- (_TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5;
  id v6;
  _TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController *result;

  v5 = a3;
  v6 = a4;
  sub_10059C624(v5, a4);
  return result;
}

- (int64_t)presentationStyle
{
  return 5;
}

- (int64_t)adaptivePresentationStyle
{
  return 0;
}

- (BOOL)shouldPresentInFullscreen
{
  return 1;
}

- (BOOL)shouldRemovePresentersView
{
  return 0;
}

- (UIView)presentedView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                           + OBJC_IVAR____TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController_presentedContainerView));
}

- (CGRect)frameOfPresentedViewInContainerView
{
  _TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = self;
  sub_10059CC84();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)containerViewWillLayoutSubviews
{
  _TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController *v2;

  v2 = self;
  sub_10059D028();

}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  _TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_10059D158((uint64_t)v6, a4);

  swift_unknownObjectRelease(a4);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_10059D2E0(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (void)presentationTransitionWillBegin
{
  _TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController *v2;

  v2 = self;
  sub_10059D45C();

}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  _TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController *v4;

  v4 = self;
  sub_10059D830(a3);

}

- (void)dismissalTransitionWillBegin
{
  _TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController *v2;

  v2 = self;
  sub_10059D958();

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  if (a3)
    objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController_overlayView), "removeFromSuperview");
}

- (void)didTapOverlayView:(id)a3
{
  _TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController *v4;
  _TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController *v5;
  _TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController *v6;

  v4 = (_TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController *)a3;
  v6 = self;
  if (-[AppPromotionDetailPagePresentationController state](v4, "state") == (id)3)
  {
    v5 = (_TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController *)-[AppPromotionDetailPagePresentationController presentedViewController](v6, "presentedViewController");
    -[AppPromotionDetailPagePresentationController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, 0);

    v4 = v6;
    v6 = v5;
  }

}

- (void)edgePanDidChange:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController *v5;

  v4 = a3;
  v5 = self;
  sub_10059DCE0(v4);

}

- (void)scrollPanDidChange:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController *v5;

  v4 = a3;
  v5 = self;
  sub_10059E108(v4);

}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController *v5;

  if (*((_BYTE *)&self->super.super.isa
       + OBJC_IVAR____TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController_isScrollDismissActive) == 1)
  {
    if (a3)
    {
      v4 = a3;
      v5 = self;
      objc_msgSend(v4, "adjustedContentInset");
      objc_msgSend(v4, "contentOffset");
      objc_msgSend(v4, "setContentOffset:");

    }
    else
    {
      __break(1u);
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController *v6;

  v5 = a3;
  v6 = self;
  sub_10059E720(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController_overlayView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController_presentedContainerView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController_dismissTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController_dismissScreenEdgePanGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController_blurOverlayView));
  sub_10059EAB8((uint64_t)self+ OBJC_IVAR____TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController_interactiveDismissal);
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtC22SubscribePageExtension44AppPromotionDetailPagePresentationController_dismissalScrollView);
}

@end
