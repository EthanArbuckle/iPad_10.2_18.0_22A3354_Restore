@implementation INSendPaymentIntent(ATXIntentEvent)

- (void)atx_getArgsInto:()ATXIntentEvent
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(a1, "payee");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setArg1:", v6);

  objc_msgSend(a1, "currencyAmount");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "amount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  roundedDecimal(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setArg2:", v8);

}

@end
