@implementation INPlayMediaPlaybackSpeedResolutionResult

- (id)_initWithIntentSlotResolutionResult:(id)a3 slotDescription:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  uint64_t v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INPlayMediaPlaybackSpeedResolutionResult;
  v7 = -[INIntentResolutionResult _initWithIntentSlotResolutionResult:slotDescription:](&v14, sel__initWithIntentSlotResolutionResult_slotDescription_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "payloadUnsupported");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasPlayMediaIntentPlaybackSpeedUnsupportedReason");

    if (v9)
    {
      objc_msgSend(v6, "payloadUnsupported");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "playMediaIntentPlaybackSpeedUnsupportedReason");
      if (v11 == 1)
        v12 = 1;
      else
        v12 = 2 * (v11 == 2);
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
  unsigned int v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)INPlayMediaPlaybackSpeedResolutionResult;
  -[INIntentResolutionResult _buildIntentSlotResolutionResultWithIntentSlotDescription:](&v11, sel__buildIntentSlotResolutionResultWithIntentSlotDescription_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[INIntentResolutionResult resolutionResultCode](self, "resolutionResultCode") == 1
    && -[INIntentResolutionResult unsupportedReason](self, "unsupportedReason"))
  {
    objc_msgSend(v4, "payloadUnsupported");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setReason:", 1000);

    objc_msgSend(v4, "payloadUnsupported");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[INIntentResolutionResult unsupportedReason](self, "unsupportedReason");
    if (v7 == 2)
      v8 = 2;
    else
      v8 = 0x7FFFFFFF;
    if (v7 == 1)
      v9 = 1;
    else
      v9 = v8;
    objc_msgSend(v6, "setPlayMediaIntentPlaybackSpeedUnsupportedReason:", v9);

  }
  return v4;
}

+ (INPlayMediaPlaybackSpeedResolutionResult)unsupportedForReason:(INPlayMediaPlaybackSpeedUnsupportedReason)reason
{
  void *v4;

  objc_msgSend(a1, "unsupported");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnsupportedReason:", reason);
  return (INPlayMediaPlaybackSpeedResolutionResult *)v4;
}

@end
