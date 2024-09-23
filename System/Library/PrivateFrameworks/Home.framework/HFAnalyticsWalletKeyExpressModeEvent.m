@implementation HFAnalyticsWalletKeyExpressModeEvent

- (HFAnalyticsWalletKeyExpressModeEvent)initWithData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  HFAnalyticsWalletKeyExpressModeEvent *v11;
  HFAnalyticsWalletKeyExpressModeEvent *v12;
  objc_super v14;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("walletKeyExpressModeSelection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (!v7)
    NSLog(CFSTR("Error: HFAnalyticsWalletKeyExpressModeSelectionKey is nil"));
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("walletKeyExpressModeLocation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (!v10)
    NSLog(CFSTR("Error: HFAnalyticsWalletKeyExpressModeLocationKey is nil"));
  v14.receiver = self;
  v14.super_class = (Class)HFAnalyticsWalletKeyExpressModeEvent;
  v11 = -[HFAnalyticsEvent initWithEventType:](&v14, sel_initWithEventType_, 27);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_expressModeSelectionNumber, v6);
    objc_storeStrong((id *)&v12->_expressModeLocationNumber, v9);
  }

  return v12;
}

- (id)payload
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFAnalyticsWalletKeyExpressModeEvent;
  -[HFAnalyticsEvent payload](&v8, sel_payload);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HFAnalyticsWalletKeyExpressModeEvent expressModeSelectionNumber](self, "expressModeSelectionNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v5, CFSTR("expressModeSelection"));

  -[HFAnalyticsWalletKeyExpressModeEvent expressModeLocationNumber](self, "expressModeLocationNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v6, CFSTR("expressModeLocation"));

  return v4;
}

- (NSNumber)expressModeSelectionNumber
{
  return self->_expressModeSelectionNumber;
}

- (void)setExpressModeSelectionNumber:(id)a3
{
  objc_storeStrong((id *)&self->_expressModeSelectionNumber, a3);
}

- (NSNumber)expressModeLocationNumber
{
  return self->_expressModeLocationNumber;
}

- (void)setExpressModeLocationNumber:(id)a3
{
  objc_storeStrong((id *)&self->_expressModeLocationNumber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expressModeLocationNumber, 0);
  objc_storeStrong((id *)&self->_expressModeSelectionNumber, 0);
}

@end
