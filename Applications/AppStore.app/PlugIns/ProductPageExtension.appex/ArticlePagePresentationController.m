@implementation ArticlePagePresentationController

- (int64_t)presentationStyle
{
  return 5;
}

- (int64_t)adaptivePresentationStyle
{
  return 0;
}

- (BOOL)shouldRemovePresentersView
{
  return 0;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  _TtC20ProductPageExtension33ArticlePagePresentationController *v2;
  __n128 v3;
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
  double v15;
  CGRect result;

  v2 = self;
  sub_100377EA0(v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  _TtC20ProductPageExtension33ArticlePagePresentationController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_10037830C(v6, a4);

  swift_unknownObjectRelease();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC20ProductPageExtension33ArticlePagePresentationController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_100378650(a4, width, height);
  swift_unknownObjectRelease();

}

- (void)containerViewWillLayoutSubviews
{
  _TtC20ProductPageExtension33ArticlePagePresentationController *v2;

  v2 = self;
  sub_1003787CC();

}

- (UIView)presentedView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                           + OBJC_IVAR____TtC20ProductPageExtension33ArticlePagePresentationController_presentedContainerView));
}

- (void)presentationTransitionWillBegin
{
  _TtC20ProductPageExtension33ArticlePagePresentationController *v2;

  v2 = self;
  sub_10037891C();

}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  _TtC20ProductPageExtension33ArticlePagePresentationController *v4;

  v4 = self;
  sub_100378DA4(a3);

}

- (void)dismissalTransitionWillBegin
{
  _TtC20ProductPageExtension33ArticlePagePresentationController *v2;

  v2 = self;
  sub_100378F60();

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  void *v3;
  _TtC20ProductPageExtension33ArticlePagePresentationController *v4;

  if (a3)
  {
    v3 = *(Class *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension33ArticlePagePresentationController_overlayTintView);
    v4 = self;
    objc_msgSend(v3, "removeFromSuperview");
    objc_msgSend(*(id *)((char *)&v4->super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension33ArticlePagePresentationController_overlayBlurView), "removeFromSuperview");

  }
}

- (void)dismissTapDidChange:(id)a3
{
  _TtC20ProductPageExtension33ArticlePagePresentationController *v4;
  _TtC20ProductPageExtension33ArticlePagePresentationController *v5;
  _TtC20ProductPageExtension33ArticlePagePresentationController *v6;

  v4 = (_TtC20ProductPageExtension33ArticlePagePresentationController *)a3;
  v6 = self;
  if (-[ArticlePagePresentationController state](v4, "state") == (id)3)
  {
    v5 = (_TtC20ProductPageExtension33ArticlePagePresentationController *)-[ArticlePagePresentationController presentedViewController](v6, "presentedViewController");
    -[ArticlePagePresentationController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, 0);

    v4 = v6;
    v6 = v5;
  }

}

- (void)edgePanDidChange:(id)a3
{
  id v4;
  _TtC20ProductPageExtension33ArticlePagePresentationController *v5;

  v4 = a3;
  v5 = self;
  sub_100379538(v4);

}

- (void)scrollPanDidChange:(id)a3
{
  id v4;
  _TtC20ProductPageExtension33ArticlePagePresentationController *v5;

  v4 = a3;
  v5 = self;
  sub_1003799DC(v4);

}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4;
  _TtC20ProductPageExtension33ArticlePagePresentationController *v5;

  if (*((_BYTE *)&self->super.super.isa
       + OBJC_IVAR____TtC20ProductPageExtension33ArticlePagePresentationController_isScrollDismissActive) == 1)
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

- (_TtC20ProductPageExtension33ArticlePagePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5;
  id v6;
  _TtC20ProductPageExtension33ArticlePagePresentationController *result;

  v5 = a3;
  v6 = a4;
  result = (_TtC20ProductPageExtension33ArticlePagePresentationController *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.ArticlePagePresentationController", 54, "init(presentedViewController:presenting:)", 41, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33ArticlePagePresentationController_overlayBlurView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33ArticlePagePresentationController_overlayTintView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33ArticlePagePresentationController_shadowView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33ArticlePagePresentationController_presentedContainerView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33ArticlePagePresentationController_dismissTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33ArticlePagePresentationController_dismissSwipeGestureRecognizer));
  sub_100010D1C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension33ArticlePagePresentationController_transitioningViewProvider);
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension33ArticlePagePresentationController_interactiveDismissal, (uint64_t *)&unk_100808A60);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension33ArticlePagePresentationController_dismissalScrollView);
}

@end
