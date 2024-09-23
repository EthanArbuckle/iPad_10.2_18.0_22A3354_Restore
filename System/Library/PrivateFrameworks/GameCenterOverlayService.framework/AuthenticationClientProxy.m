@implementation AuthenticationClientProxy

- (void).cxx_destruct
{
  sub_23C951B58((uint64_t)self + OBJC_IVAR____TtC24GameCenterOverlayService25AuthenticationClientProxy_delegate);
}

- (void)didFinishOnboardingWithError:(id)a3
{
  id v5;
  _TtC24GameCenterOverlayService25AuthenticationClientProxy *v6;

  v5 = a3;
  v6 = self;
  AuthenticationClientProxy.didFinishOnboarding(error:)((NSError_optional *)a3);

}

@end
