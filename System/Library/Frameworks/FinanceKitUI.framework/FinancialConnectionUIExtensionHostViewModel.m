@implementation FinancialConnectionUIExtensionHostViewModel

- (void)completeWithAuthorizationResult:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_23372F0D4(v3);

  swift_release();
}

- (void)completeWithError:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_23372F348(v3);
  swift_release();

}

@end
