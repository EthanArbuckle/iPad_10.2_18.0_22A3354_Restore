@implementation PKPaymentBalance(NanoPassKit)

+ (id)NPK_paymentBalanceWithAppletBalance:()NanoPassKit
{
  id v3;
  NSDecimalNumber *v4;
  NSString *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "balance");
  v4 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currency");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exponent");
  PKCurrencyAmountCreate(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x24BE6EC40]);
  objc_msgSend(v3, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v7, "initWithIdentifier:forCurrencyAmount:", v8, v6);
  return v9;
}

@end
