@implementation SessionsPresentationController

- (CGRect)frameOfPresentedViewInContainerView
{
  _TtC13MediaControls30SessionsPresentationController *v2;
  id v3;
  void *v4;
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
  double v16;
  CGRect result;

  v2 = self;
  v3 = -[SessionsPresentationController containerView](v2, sel_containerView);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_bounds);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {

    v6 = 0.0;
    v8 = 0.0;
    v10 = 0.0;
    v12 = 0.0;
  }
  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)presentationTransitionWillBegin
{
  _TtC13MediaControls30SessionsPresentationController *v2;

  v2 = self;
  sub_1AAA81544();

}

- (void)dismissalTransitionWillBegin
{
  _TtC13MediaControls30SessionsPresentationController *v2;

  v2 = self;
  sub_1AAA81824();

}

- (_TtC13MediaControls30SessionsPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _TtC13MediaControls30SessionsPresentationController *v11;
  _QWORD *v12;
  _TtC13MediaControls30SessionsPresentationController *v13;
  objc_super v15;

  v7 = OBJC_IVAR____TtC13MediaControls30SessionsPresentationController_blurView;
  v8 = objc_allocWithZone(MEMORY[0x1E0DC3F58]);
  v9 = a3;
  v10 = a4;
  v11 = self;
  *(Class *)((char *)&self->super.super.isa + v7) = (Class)objc_msgSend(v8, sel_init);
  v12 = (Class *)((char *)&v11->super.super.isa
                + OBJC_IVAR____TtC13MediaControls30SessionsPresentationController_blurImageMaskName);
  *v12 = 0xD000000000000026;
  v12[1] = 0x80000001AAAD3BE0;
  *(Class *)((char *)&v11->super.super.isa + OBJC_IVAR____TtC13MediaControls30SessionsPresentationController_blurRadius) = (Class)0x4038000000000000;

  v15.receiver = v11;
  v15.super_class = (Class)type metadata accessor for SessionsPresentationController();
  v13 = -[SessionsPresentationController initWithPresentedViewController:presentingViewController:](&v15, sel_initWithPresentedViewController_presentingViewController_, v9, v10);

  return v13;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC13MediaControls30SessionsPresentationController_blurView));
  swift_bridgeObjectRelease();
}

@end
