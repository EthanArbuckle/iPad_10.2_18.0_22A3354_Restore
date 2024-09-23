@implementation LegacyArticlePagePresentationController

- (_TtC8AppStore39LegacyArticlePagePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5;
  id v6;
  _TtC8AppStore39LegacyArticlePagePresentationController *v7;
  _TtC8AppStore39LegacyArticlePagePresentationController *v8;

  v5 = a3;
  v6 = a4;
  sub_1004401F4((uint64_t)v5, (uint64_t)a4);
  v8 = v7;

  return v8;
}

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
  _TtC8AppStore39LegacyArticlePagePresentationController *v2;
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
  sub_10043DFA8();
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
  _TtC8AppStore39LegacyArticlePagePresentationController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_10043E458(v6, a4);

  swift_unknownObjectRelease(a4);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC8AppStore39LegacyArticlePagePresentationController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_10043E768(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (void)containerViewWillLayoutSubviews
{
  _TtC8AppStore39LegacyArticlePagePresentationController *v2;

  v2 = self;
  sub_10043E8E4();

}

- (UIView)presentedView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                           + OBJC_IVAR____TtC8AppStore39LegacyArticlePagePresentationController_presentedContainerView));
}

- (void)presentationTransitionWillBegin
{
  _TtC8AppStore39LegacyArticlePagePresentationController *v2;

  v2 = self;
  sub_10043EA00();

}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  _TtC8AppStore39LegacyArticlePagePresentationController *v4;

  v4 = self;
  sub_10043EE34(a3);

}

- (void)dismissalTransitionWillBegin
{
  _TtC8AppStore39LegacyArticlePagePresentationController *v2;

  v2 = self;
  sub_10043EFDC();

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  if (a3)
    objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8AppStore39LegacyArticlePagePresentationController_overlayView), "removeFromSuperview");
}

- (void)dismissTapDidChange:(id)a3
{
  _TtC8AppStore39LegacyArticlePagePresentationController *v4;
  _TtC8AppStore39LegacyArticlePagePresentationController *v5;
  _TtC8AppStore39LegacyArticlePagePresentationController *v6;

  v4 = (_TtC8AppStore39LegacyArticlePagePresentationController *)a3;
  v6 = self;
  if (-[LegacyArticlePagePresentationController state](v4, "state") == (id)3)
  {
    v5 = (_TtC8AppStore39LegacyArticlePagePresentationController *)-[LegacyArticlePagePresentationController presentedViewController](v6, "presentedViewController");
    -[LegacyArticlePagePresentationController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, 0);

    v4 = v6;
    v6 = v5;
  }

}

- (void)edgePanDidChange:(id)a3
{
  id v4;
  _TtC8AppStore39LegacyArticlePagePresentationController *v5;

  v4 = a3;
  v5 = self;
  sub_10043F308(v4);

}

- (void)scrollPanDidChange:(id)a3
{
  id v4;
  _TtC8AppStore39LegacyArticlePagePresentationController *v5;

  v4 = a3;
  v5 = self;
  sub_10043F74C(v4);

}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4;
  _TtC8AppStore39LegacyArticlePagePresentationController *v5;

  if (*((_BYTE *)&self->super.super.isa
       + OBJC_IVAR____TtC8AppStore39LegacyArticlePagePresentationController_isScrollDismissActive) == 1)
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
  _TtC8AppStore39LegacyArticlePagePresentationController *v6;

  v5 = a3;
  v6 = self;
  sub_10043FF70(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8AppStore39LegacyArticlePagePresentationController_overlayView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8AppStore39LegacyArticlePagePresentationController_shadowView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8AppStore39LegacyArticlePagePresentationController_presentedContainerView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8AppStore39LegacyArticlePagePresentationController_dismissTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8AppStore39LegacyArticlePagePresentationController_dismissSwipeGestureRecognizer));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8AppStore39LegacyArticlePagePresentationController_closeButton);
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore39LegacyArticlePagePresentationController_interactiveDismissal, (uint64_t *)&unk_100835640);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8AppStore39LegacyArticlePagePresentationController_dismissalScrollView);
}

@end
