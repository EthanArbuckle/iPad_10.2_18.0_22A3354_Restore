@implementation INStartCallCallRecordToCallBackResolutionResult

- (id)_initWithIntentSlotResolutionResult:(id)a3 slotDescription:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)INStartCallCallRecordToCallBackResolutionResult;
  v7 = -[INIntentResolutionResult _initWithIntentSlotResolutionResult:slotDescription:](&v12, sel__initWithIntentSlotResolutionResult_slotDescription_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "payloadUnsupported");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasStartCallIntentCallRecordToCallBackUnsupportedReason");

    if (v9)
    {
      objc_msgSend(v6, "payloadUnsupported");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setUnsupportedReason:", objc_msgSend(v10, "startCallIntentCallRecordToCallBackUnsupportedReason") == 1);

    }
  }

  return v7;
}

- (id)_buildIntentSlotResolutionResultWithIntentSlotDescription:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)INStartCallCallRecordToCallBackResolutionResult;
  -[INIntentResolutionResult _buildIntentSlotResolutionResultWithIntentSlotDescription:](&v9, sel__buildIntentSlotResolutionResultWithIntentSlotDescription_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[INIntentResolutionResult resolutionResultCode](self, "resolutionResultCode") == 1
    && -[INIntentResolutionResult unsupportedReason](self, "unsupportedReason"))
  {
    objc_msgSend(v4, "payloadUnsupported");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setReason:", 1000);

    objc_msgSend(v4, "payloadUnsupported");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[INIntentResolutionResult unsupportedReason](self, "unsupportedReason") == 1)
      v7 = 1;
    else
      v7 = 0x7FFFFFFFLL;
    objc_msgSend(v6, "setStartCallIntentCallRecordToCallBackUnsupportedReason:", v7);

  }
  return v4;
}

+ (INStartCallCallRecordToCallBackResolutionResult)unsupportedForReason:(INStartCallCallRecordToCallBackUnsupportedReason)reason
{
  void *v4;

  objc_msgSend(a1, "unsupported");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnsupportedReason:", reason);
  return (INStartCallCallRecordToCallBackResolutionResult *)v4;
}

@end
