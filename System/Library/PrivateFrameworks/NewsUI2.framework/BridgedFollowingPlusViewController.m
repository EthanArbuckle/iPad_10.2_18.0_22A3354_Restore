@implementation BridgedFollowingPlusViewController

- (_TtC7NewsUI234BridgedFollowingPlusViewController)initWithCoder:(id)a3
{
  _TtC7NewsUI234BridgedFollowingPlusViewController *result;

  result = (_TtC7NewsUI234BridgedFollowingPlusViewController *)sub_1D6E28010();
  __break(1u);
  return result;
}

- (UIViewController)childViewControllerForStatusBarStyle
{
  return (UIViewController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                     + OBJC_IVAR____TtC7NewsUI234BridgedFollowingPlusViewController_viewController));
}

- (_TtC7NewsUI234BridgedFollowingPlusViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC7NewsUI234BridgedFollowingPlusViewController *result;

  v4 = a4;
  result = (_TtC7NewsUI234BridgedFollowingPlusViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI234BridgedFollowingPlusViewController_viewController));
}

- (void)presentationControllerDidDismiss:(id)a3
{
  sub_1D61F8708((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_presentationControllerDidDismiss_);
}

- (void)presentationControllerWillDismiss:(id)a3
{
  sub_1D61F8708((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_presentationControllerWillDismiss_);
}

@end
