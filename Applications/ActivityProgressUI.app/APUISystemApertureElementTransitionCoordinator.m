@implementation APUISystemApertureElementTransitionCoordinator

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator *v11;
  id v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = _s18ActivityProgressUI46APUISystemApertureElementTransitionCoordinatorC19animationController12forPresented10presenting6sourceSo06UIViewJ21AnimatedTransitioning_pSgSo0oJ0C_A2KtF_0();

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  _TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = _s18ActivityProgressUI46APUISystemApertureElementTransitionCoordinatorC19animationController12forDismissedSo06UIViewJ21AnimatedTransitioning_pSgSo0mJ0C_tF_0();

  return v6;
}

- (_TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator)init
{
  return (_TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator *)APUISystemApertureElementTransitionCoordinator.init()();
}

- (void).cxx_destruct
{
  sub_10002C800((uint64_t)self + OBJC_IVAR____TtC18ActivityProgressUI46APUISystemApertureElementTransitionCoordinator_delegate);
}

@end
