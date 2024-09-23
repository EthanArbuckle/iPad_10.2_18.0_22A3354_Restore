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
  _TtC22SubscribePageExtension33ArticlePagePresentationController *v2;
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
  sub_10038A8EC();
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

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  _TtC22SubscribePageExtension33ArticlePagePresentationController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_10038AD58(v6, a4);

  swift_unknownObjectRelease(a4);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC22SubscribePageExtension33ArticlePagePresentationController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_10038B09C(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (void)containerViewWillLayoutSubviews
{
  _TtC22SubscribePageExtension33ArticlePagePresentationController *v2;

  v2 = self;
  sub_10038B218();

}

- (UIView)presentedView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                           + OBJC_IVAR____TtC22SubscribePageExtension33ArticlePagePresentationController_presentedContainerView));
}

- (void)presentationTransitionWillBegin
{
  _TtC22SubscribePageExtension33ArticlePagePresentationController *v2;

  v2 = self;
  sub_10038B368();

}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  _TtC22SubscribePageExtension33ArticlePagePresentationController *v4;

  v4 = self;
  sub_10038B7F0(a3);

}

- (void)dismissalTransitionWillBegin
{
  _TtC22SubscribePageExtension33ArticlePagePresentationController *v2;

  v2 = self;
  sub_10038B9AC();

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  void *v3;
  _TtC22SubscribePageExtension33ArticlePagePresentationController *v4;

  if (a3)
  {
    v3 = *(Class *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension33ArticlePagePresentationController_overlayTintView);
    v4 = self;
    objc_msgSend(v3, "removeFromSuperview");
    objc_msgSend(*(id *)((char *)&v4->super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension33ArticlePagePresentationController_overlayBlurView), "removeFromSuperview");

  }
}

- (void)dismissTapDidChange:(id)a3
{
  _TtC22SubscribePageExtension33ArticlePagePresentationController *v4;
  _TtC22SubscribePageExtension33ArticlePagePresentationController *v5;
  _TtC22SubscribePageExtension33ArticlePagePresentationController *v6;

  v4 = (_TtC22SubscribePageExtension33ArticlePagePresentationController *)a3;
  v6 = self;
  if (-[ArticlePagePresentationController state](v4, "state") == (id)3)
  {
    v5 = (_TtC22SubscribePageExtension33ArticlePagePresentationController *)-[ArticlePagePresentationController presentedViewController](v6, "presentedViewController");
    -[ArticlePagePresentationController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, 0);

    v4 = v6;
    v6 = v5;
  }

}

- (void)edgePanDidChange:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension33ArticlePagePresentationController *v5;

  v4 = a3;
  v5 = self;
  sub_10038BF84(v4);

}

- (void)scrollPanDidChange:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension33ArticlePagePresentationController *v5;

  v4 = a3;
  v5 = self;
  sub_10038C428(v4);

}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension33ArticlePagePresentationController *v5;

  if (*((_BYTE *)&self->super.super.isa
       + OBJC_IVAR____TtC22SubscribePageExtension33ArticlePagePresentationController_isScrollDismissActive) == 1)
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

- (_TtC22SubscribePageExtension33ArticlePagePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5;
  id v6;
  _TtC22SubscribePageExtension33ArticlePagePresentationController *result;

  v5 = a3;
  v6 = a4;
  result = (_TtC22SubscribePageExtension33ArticlePagePresentationController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.ArticlePagePresentationController", 56, "init(presentedViewController:presenting:)", 41, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33ArticlePagePresentationController_overlayBlurView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33ArticlePagePresentationController_overlayTintView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33ArticlePagePresentationController_shadowView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33ArticlePagePresentationController_presentedContainerView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33ArticlePagePresentationController_dismissTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33ArticlePagePresentationController_dismissSwipeGestureRecognizer));
  sub_100010E34((uint64_t)self+ OBJC_IVAR____TtC22SubscribePageExtension33ArticlePagePresentationController_transitioningViewProvider);
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension33ArticlePagePresentationController_interactiveDismissal, (uint64_t *)&unk_100819CC0);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC22SubscribePageExtension33ArticlePagePresentationController_dismissalScrollView);
}

@end
