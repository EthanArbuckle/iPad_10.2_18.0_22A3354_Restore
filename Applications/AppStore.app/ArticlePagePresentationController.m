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
  _TtC8AppStore33ArticlePagePresentationController *v2;
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
  sub_1005AC9EC();
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
  _TtC8AppStore33ArticlePagePresentationController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_1005ACE58(v6, a4);

  swift_unknownObjectRelease(a4);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC8AppStore33ArticlePagePresentationController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_1005AD19C(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (void)containerViewWillLayoutSubviews
{
  _TtC8AppStore33ArticlePagePresentationController *v2;

  v2 = self;
  sub_1005AD318();

}

- (UIView)presentedView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                           + OBJC_IVAR____TtC8AppStore33ArticlePagePresentationController_presentedContainerView));
}

- (void)presentationTransitionWillBegin
{
  _TtC8AppStore33ArticlePagePresentationController *v2;

  v2 = self;
  sub_1005AD468();

}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  _TtC8AppStore33ArticlePagePresentationController *v4;

  v4 = self;
  sub_1005AD8F0(a3);

}

- (void)dismissalTransitionWillBegin
{
  _TtC8AppStore33ArticlePagePresentationController *v2;

  v2 = self;
  sub_1005ADAAC();

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  void *v3;
  _TtC8AppStore33ArticlePagePresentationController *v4;

  if (a3)
  {
    v3 = *(Class *)((char *)&self->super.super.isa
                  + OBJC_IVAR____TtC8AppStore33ArticlePagePresentationController_overlayTintView);
    v4 = self;
    objc_msgSend(v3, "removeFromSuperview");
    objc_msgSend(*(id *)((char *)&v4->super.super.isa + OBJC_IVAR____TtC8AppStore33ArticlePagePresentationController_overlayBlurView), "removeFromSuperview");

  }
}

- (void)dismissTapDidChange:(id)a3
{
  _TtC8AppStore33ArticlePagePresentationController *v4;
  _TtC8AppStore33ArticlePagePresentationController *v5;
  _TtC8AppStore33ArticlePagePresentationController *v6;

  v4 = (_TtC8AppStore33ArticlePagePresentationController *)a3;
  v6 = self;
  if (-[ArticlePagePresentationController state](v4, "state") == (id)3)
  {
    v5 = (_TtC8AppStore33ArticlePagePresentationController *)-[ArticlePagePresentationController presentedViewController](v6, "presentedViewController");
    -[ArticlePagePresentationController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, 0);

    v4 = v6;
    v6 = v5;
  }

}

- (void)edgePanDidChange:(id)a3
{
  id v4;
  _TtC8AppStore33ArticlePagePresentationController *v5;

  v4 = a3;
  v5 = self;
  sub_1005AE084(v4);

}

- (void)scrollPanDidChange:(id)a3
{
  id v4;
  _TtC8AppStore33ArticlePagePresentationController *v5;

  v4 = a3;
  v5 = self;
  sub_1005AE528(v4);

}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4;
  _TtC8AppStore33ArticlePagePresentationController *v5;

  if (*((_BYTE *)&self->super.super.isa
       + OBJC_IVAR____TtC8AppStore33ArticlePagePresentationController_isScrollDismissActive) == 1)
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

- (_TtC8AppStore33ArticlePagePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5;
  id v6;
  _TtC8AppStore33ArticlePagePresentationController *result;

  v5 = a3;
  v6 = a4;
  result = (_TtC8AppStore33ArticlePagePresentationController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.ArticlePagePresentationController", 42, "init(presentedViewController:presenting:)", 41, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8AppStore33ArticlePagePresentationController_overlayBlurView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8AppStore33ArticlePagePresentationController_overlayTintView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8AppStore33ArticlePagePresentationController_shadowView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8AppStore33ArticlePagePresentationController_presentedContainerView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8AppStore33ArticlePagePresentationController_dismissTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8AppStore33ArticlePagePresentationController_dismissSwipeGestureRecognizer));
  sub_1000834F4((uint64_t)self + OBJC_IVAR____TtC8AppStore33ArticlePagePresentationController_transitioningViewProvider);
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore33ArticlePagePresentationController_interactiveDismissal, (uint64_t *)&unk_100835640);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8AppStore33ArticlePagePresentationController_dismissalScrollView);
}

@end
