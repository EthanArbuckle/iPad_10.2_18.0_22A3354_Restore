@implementation LegacyArticlePagePresentationController

- (_TtC20ProductPageExtension39LegacyArticlePagePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5;
  id v6;
  _TtC20ProductPageExtension39LegacyArticlePagePresentationController *v7;
  _TtC20ProductPageExtension39LegacyArticlePagePresentationController *v8;

  v5 = a3;
  v6 = a4;
  sub_1005F5EC0((uint64_t)v5, (uint64_t)a4);
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
  _TtC20ProductPageExtension39LegacyArticlePagePresentationController *v2;
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
  sub_1005F3C5C(v3);
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
  _TtC20ProductPageExtension39LegacyArticlePagePresentationController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_1005F410C(v6, a4);

  swift_unknownObjectRelease();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC20ProductPageExtension39LegacyArticlePagePresentationController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_1005F441C(a4, width, height);
  swift_unknownObjectRelease();

}

- (void)containerViewWillLayoutSubviews
{
  _TtC20ProductPageExtension39LegacyArticlePagePresentationController *v2;

  v2 = self;
  sub_1005F4598();

}

- (UIView)presentedView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                           + OBJC_IVAR____TtC20ProductPageExtension39LegacyArticlePagePresentationController_presentedContainerView));
}

- (void)presentationTransitionWillBegin
{
  _TtC20ProductPageExtension39LegacyArticlePagePresentationController *v2;

  v2 = self;
  sub_1005F46B4();

}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  _TtC20ProductPageExtension39LegacyArticlePagePresentationController *v4;

  v4 = self;
  sub_1005F4AE8(a3);

}

- (void)dismissalTransitionWillBegin
{
  _TtC20ProductPageExtension39LegacyArticlePagePresentationController *v2;

  v2 = self;
  sub_1005F4C90();

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  if (a3)
    objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension39LegacyArticlePagePresentationController_overlayView), "removeFromSuperview");
}

- (void)dismissTapDidChange:(id)a3
{
  _TtC20ProductPageExtension39LegacyArticlePagePresentationController *v4;
  _TtC20ProductPageExtension39LegacyArticlePagePresentationController *v5;
  _TtC20ProductPageExtension39LegacyArticlePagePresentationController *v6;

  v4 = (_TtC20ProductPageExtension39LegacyArticlePagePresentationController *)a3;
  v6 = self;
  if (-[LegacyArticlePagePresentationController state](v4, "state") == (id)3)
  {
    v5 = (_TtC20ProductPageExtension39LegacyArticlePagePresentationController *)-[LegacyArticlePagePresentationController presentedViewController](v6, "presentedViewController");
    -[LegacyArticlePagePresentationController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, 0);

    v4 = v6;
    v6 = v5;
  }

}

- (void)edgePanDidChange:(id)a3
{
  id v4;
  _TtC20ProductPageExtension39LegacyArticlePagePresentationController *v5;

  v4 = a3;
  v5 = self;
  sub_1005F4FBC(v4);

}

- (void)scrollPanDidChange:(id)a3
{
  id v4;
  _TtC20ProductPageExtension39LegacyArticlePagePresentationController *v5;

  v4 = a3;
  v5 = self;
  sub_1005F5400(v4);

}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4;
  _TtC20ProductPageExtension39LegacyArticlePagePresentationController *v5;

  if (*((_BYTE *)&self->super.super.isa
       + OBJC_IVAR____TtC20ProductPageExtension39LegacyArticlePagePresentationController_isScrollDismissActive) == 1)
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
  _TtC20ProductPageExtension39LegacyArticlePagePresentationController *v6;

  v5 = a3;
  v6 = self;
  sub_1005F5C24(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39LegacyArticlePagePresentationController_overlayView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39LegacyArticlePagePresentationController_shadowView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39LegacyArticlePagePresentationController_presentedContainerView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39LegacyArticlePagePresentationController_dismissTapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39LegacyArticlePagePresentationController_dismissSwipeGestureRecognizer));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension39LegacyArticlePagePresentationController_closeButton);
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension39LegacyArticlePagePresentationController_interactiveDismissal, (uint64_t *)&unk_100808A60);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC20ProductPageExtension39LegacyArticlePagePresentationController_dismissalScrollView);
}

@end
