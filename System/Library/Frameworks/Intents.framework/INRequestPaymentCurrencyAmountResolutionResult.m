@implementation INRequestPaymentCurrencyAmountResolutionResult

- (id)_initWithIntentSlotResolutionResult:(id)a3 slotDescription:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INRequestPaymentCurrencyAmountResolutionResult;
  v7 = -[INIntentResolutionResult _initWithIntentSlotResolutionResult:slotDescription:](&v14, sel__initWithIntentSlotResolutionResult_slotDescription_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "payloadUnsupported");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasRequestPaymentIntentCurrencyAmountUnsupportedReason");

    if (v9)
    {
      objc_msgSend(v6, "payloadUnsupported");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "requestPaymentIntentCurrencyAmountUnsupportedReason") - 1;
      if (v11 < 3)
        v12 = v11 + 1;
      else
        v12 = 0;
      objc_msgSend(v7, "setUnsupportedReason:", v12);

    }
  }

  return v7;
}

- (id)_buildIntentSlotResolutionResultWithIntentSlotDescription:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)INRequestPaymentCurrencyAmountResolutionResult;
  -[INIntentResolutionResult _buildIntentSlotResolutionResultWithIntentSlotDescription:](&v10, sel__buildIntentSlotResolutionResultWithIntentSlotDescription_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[INIntentResolutionResult resolutionResultCode](self, "resolutionResultCode") == 1
    && -[INIntentResolutionResult unsupportedReason](self, "unsupportedReason"))
  {
    objc_msgSend(v4, "payloadUnsupported");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setReason:", 1000);

    objc_msgSend(v4, "payloadUnsupported");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[INIntentResolutionResult unsupportedReason](self, "unsupportedReason") - 1;
    if (v7 < 3)
      v8 = (v7 + 1);
    else
      v8 = 0x7FFFFFFFLL;
    objc_msgSend(v6, "setRequestPaymentIntentCurrencyAmountUnsupportedReason:", v8);

  }
  return v4;
}

+ (INRequestPaymentCurrencyAmountResolutionResult)unsupportedForReason:(INRequestPaymentCurrencyAmountUnsupportedReason)reason
{
  void *v4;

  objc_msgSend(a1, "unsupported");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnsupportedReason:", reason);
  return (INRequestPaymentCurrencyAmountResolutionResult *)v4;
}

@end
