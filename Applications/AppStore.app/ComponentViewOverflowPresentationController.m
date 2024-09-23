@implementation ComponentViewOverflowPresentationController

- (_TtC8AppStore43ComponentViewOverflowPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5;
  id v6;
  _TtC8AppStore43ComponentViewOverflowPresentationController *result;

  v5 = a3;
  v6 = a4;
  sub_100228C4C(v5, a4);
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

- (CGRect)frameOfPresentedViewInContainerView
{
  _TtC8AppStore43ComponentViewOverflowPresentationController *v2;
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
  sub_1002290B4();
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
  _TtC8AppStore43ComponentViewOverflowPresentationController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_1002296C0((uint64_t)v6, a4);

  swift_unknownObjectRelease(a4);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  _TtC8AppStore43ComponentViewOverflowPresentationController *v8;

  height = a3.height;
  width = a3.width;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_100229970(a4, width, height);
  swift_unknownObjectRelease(a4);

}

- (void)containerViewWillLayoutSubviews
{
  _TtC8AppStore43ComponentViewOverflowPresentationController *v2;

  v2 = self;
  sub_100229AEC();

}

- (UIView)presentedView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                           + OBJC_IVAR____TtC8AppStore43ComponentViewOverflowPresentationController_presentedContainerView));
}

- (void)presentationTransitionWillBegin
{
  _TtC8AppStore43ComponentViewOverflowPresentationController *v2;

  v2 = self;
  sub_100229DA8();

}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  _TtC8AppStore43ComponentViewOverflowPresentationController *v4;

  v4 = self;
  sub_10022A1EC(a3);

}

- (void)dismissalTransitionWillBegin
{
  _TtC8AppStore43ComponentViewOverflowPresentationController *v2;

  v2 = self;
  sub_10022A314();

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  if (a3)
    objc_msgSend(*(id *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8AppStore43ComponentViewOverflowPresentationController_overlayView), "removeFromSuperview");
}

- (void)dismissTapDidChange:(id)a3
{
  _TtC8AppStore43ComponentViewOverflowPresentationController *v4;
  _TtC8AppStore43ComponentViewOverflowPresentationController *v5;
  _TtC8AppStore43ComponentViewOverflowPresentationController *v6;

  v4 = (_TtC8AppStore43ComponentViewOverflowPresentationController *)a3;
  v6 = self;
  if (-[ComponentViewOverflowPresentationController state](v4, "state") == (id)3)
  {
    v5 = (_TtC8AppStore43ComponentViewOverflowPresentationController *)-[ComponentViewOverflowPresentationController presentedViewController](v6, "presentedViewController");
    -[ComponentViewOverflowPresentationController dismissViewControllerAnimated:completion:](v5, "dismissViewControllerAnimated:completion:", 1, 0);

    v4 = v6;
    v6 = v5;
  }

}

- (void)scrollPanDidChange:(id)a3
{
  id v4;
  _TtC8AppStore43ComponentViewOverflowPresentationController *v5;

  v4 = a3;
  v5 = self;
  sub_10022A660(v4);

}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4;
  _TtC8AppStore43ComponentViewOverflowPresentationController *v5;

  if (*((_BYTE *)&self->super.super.isa
       + OBJC_IVAR____TtC8AppStore43ComponentViewOverflowPresentationController_isScrollDismissActive) == 1)
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

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8AppStore43ComponentViewOverflowPresentationController_overlayView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8AppStore43ComponentViewOverflowPresentationController_shadowView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8AppStore43ComponentViewOverflowPresentationController_presentedContainerView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8AppStore43ComponentViewOverflowPresentationController_dismissTapGestureRecognizer));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore43ComponentViewOverflowPresentationController_interactiveDismissal, (uint64_t *)&unk_100835640);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8AppStore43ComponentViewOverflowPresentationController_dismissalScrollView);
}

@end
