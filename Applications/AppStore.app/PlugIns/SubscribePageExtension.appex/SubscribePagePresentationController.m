@implementation SubscribePagePresentationController

- (_TtC22SubscribePageExtension35SubscribePagePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  return (_TtC22SubscribePageExtension35SubscribePagePresentationController *)sub_1003EF5B8(v5, a4);
}

- (CGRect)frameOfPresentedViewInContainerView
{
  _TtC22SubscribePageExtension35SubscribePagePresentationController *v2;
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
  CGRect result;

  v2 = self;
  v3 = sub_1003EF924();
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  _TtC22SubscribePageExtension35SubscribePagePresentationController *v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;
  CGRect v18;
  CGRect v19;

  height = a4.height;
  width = a4.width;
  swift_unknownObjectRetain(a3);
  v8 = self;
  v9 = -[SubscribePagePresentationController traitCollection](v8, "traitCollection");
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (v10)
    v11 = 624.0;
  else
    v11 = 372.0;
  if (v10)
    v12 = 540.0;
  else
    v12 = 295.0;
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = width;
  v18.size.height = height;
  v13 = CGRectGetWidth(v18) + -80.0;
  if (v13 < v12)
    v12 = v13;
  v19.origin.x = 0.0;
  v19.origin.y = 0.0;
  v19.size.width = width;
  v19.size.height = height;
  v14 = CGRectGetHeight(v19);
  swift_unknownObjectRelease(a3);

  if (v14 + -80.0 >= v11)
    v15 = v11;
  else
    v15 = v14 + -80.0;
  v16 = v12;
  result.height = v15;
  result.width = v16;
  return result;
}

- (void)containerViewWillLayoutSubviews
{
  _TtC22SubscribePageExtension35SubscribePagePresentationController *v2;

  v2 = self;
  sub_1003EFC4C();

}

- (void)presentationTransitionWillBegin
{
  _TtC22SubscribePageExtension35SubscribePagePresentationController *v2;

  v2 = self;
  sub_1003EFD8C();

}

- (void)dismissalTransitionWillBegin
{
  _TtC22SubscribePageExtension35SubscribePagePresentationController *v2;

  v2 = self;
  sub_1003EFFBC();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35SubscribePagePresentationController_dimmingView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35SubscribePagePresentationController_shadowView));
}

@end
