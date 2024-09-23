@implementation IdentityProofingRetryProvisioningViewController

- (_TtC9CoreIDVUI47IdentityProofingRetryProvisioningViewController)initWithCoder:(id)a3
{
  id v4;
  _TtC9CoreIDVUI47IdentityProofingRetryProvisioningViewController *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingRetryProvisioningViewController____lazy_storage___tertiaryButton) = 0;
  v4 = a3;

  result = (_TtC9CoreIDVUI47IdentityProofingRetryProvisioningViewController *)sub_213FF9878();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  _TtC9CoreIDVUI47IdentityProofingRetryProvisioningViewController *v2;

  v2 = self;
  sub_213F6E8C4();

}

- (void)configureFonts
{
  _TtC9CoreIDVUI47IdentityProofingRetryProvisioningViewController *v2;

  v2 = self;
  sub_213F6F164();

}

- (void)tertiaryButtonClicked
{
  _TtC9CoreIDVUI47IdentityProofingRetryProvisioningViewController *v2;

  v2 = self;
  sub_213F6F318();

}

- (void).cxx_destruct
{
  swift_release();
  sub_213F6F80C((uint64_t)self + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingRetryProvisioningViewController_retryConfig);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9CoreIDVUI47IdentityProofingRetryProvisioningViewController____lazy_storage___tertiaryButton));
}

@end
