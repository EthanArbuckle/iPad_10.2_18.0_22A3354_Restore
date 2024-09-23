@implementation GKSignInView

- (GKSignInView)initWithSignInAction:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  return (GKSignInView *)SignInView.init(signInAction:)((uint64_t)sub_1AB48638C, v4);
}

- (GKSignInView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1AB76BEC0();
}

- (void)disablePrimaryButton
{
  GKSignInView *v2;

  v2 = self;
  SignInView.disablePrimaryButton()();

}

- (void)enablePrimaryButton
{
  GKSignInView *v2;

  v2 = self;
  SignInView.enablePrimaryButton()();

}

- (void)primaryAction
{
  GKSignInView *v2;

  v2 = self;
  sub_1AB76C004();

}

- (void)setupVerticalLayout
{
  GKSignInView *v2;

  v2 = self;
  sub_1AB76C064((uint64_t)v2);

}

- (void)setupHorizontalLayout
{
  GKSignInView *v2;

  v2 = self;
  sub_1AB76C188((uint64_t)v2);

}

- (void).cxx_destruct
{
  swift_release();

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___GKSignInView____lazy_storage___artworkHeight));
}

@end
