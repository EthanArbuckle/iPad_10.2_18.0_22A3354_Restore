@implementation PKPaymentSetupProduct(NanoPassKit)

- (BOOL)isAppleBalanceProduct
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "configuration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "featureIdentifier") == 4;

  return v2;
}

@end
