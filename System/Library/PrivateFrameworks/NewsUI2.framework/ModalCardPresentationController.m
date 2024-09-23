@implementation ModalCardPresentationController

- (_TtC7NewsUI231ModalCardPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  return (_TtC7NewsUI231ModalCardPresentationController *)sub_1D620552C(v5, a4);
}

- (CGRect)frameOfPresentedViewInContainerView
{
  _TtC7NewsUI231ModalCardPresentationController *v2;
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
  v3 = sub_1D6205704();
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

- (void)presentationTransitionWillBegin
{
  _TtC7NewsUI231ModalCardPresentationController *v2;

  v2 = self;
  sub_1D62058D4();

}

- (void)dismissalTransitionWillBegin
{
  _TtC7NewsUI231ModalCardPresentationController *v2;

  v2 = self;
  sub_1D6205DF0();

}

- (void)dismissModal
{
  _TtC7NewsUI231ModalCardPresentationController *v2;
  id v3;

  v2 = self;
  v3 = -[ModalCardPresentationController presentingViewController](v2, sel_presentingViewController);
  objc_msgSend(v3, sel_dismissViewControllerAnimated_completion_, 1, 0);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7NewsUI231ModalCardPresentationController_effectView));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7NewsUI231ModalCardPresentationController_observation));
}

@end
