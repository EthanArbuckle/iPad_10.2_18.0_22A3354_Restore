@implementation SessionsTransitioningDelegate

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC13MediaControls29SessionsTransitioningDelegate *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_1AAA96150(v8, a4);

  return v12;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v5;
  id v10;
  id v11;
  id v12;
  _TtC13MediaControls29SessionsTransitioningDelegate *v13;

  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13MediaControls29SessionsTransitioningDelegate_presentationStyle))
  {
    v5 = 0;
  }
  else
  {
    type metadata accessor for SessionsPresentationAnimationController();
    v10 = a3;
    v11 = a4;
    v12 = a5;
    v13 = self;
    v5 = sub_1AAAB25DC(0, (uint64_t)v10);

  }
  return v5;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v3;
  id v6;
  _TtC13MediaControls29SessionsTransitioningDelegate *v7;

  if (*(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC13MediaControls29SessionsTransitioningDelegate_presentationStyle))
  {
    v3 = 0;
  }
  else
  {
    type metadata accessor for SessionsPresentationAnimationController();
    v6 = a3;
    v7 = self;
    v3 = sub_1AAAB25DC(1, (uint64_t)v6);

  }
  return v3;
}

- (_TtC13MediaControls29SessionsTransitioningDelegate)init
{
  _TtC13MediaControls29SessionsTransitioningDelegate *result;

  result = (_TtC13MediaControls29SessionsTransitioningDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
