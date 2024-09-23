@implementation INSendAnnouncementAnnouncementResolutionResult

- (id)_initWithIntentSlotResolutionResult:(id)a3 slotDescription:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)INSendAnnouncementAnnouncementResolutionResult;
  v7 = -[INIntentResolutionResult _initWithIntentSlotResolutionResult:slotDescription:](&v15, sel__initWithIntentSlotResolutionResult_slotDescription_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "payloadConfirmation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasSendAnnouncementIntentAnnouncementConfirmationReason");

    if (v9)
    {
      objc_msgSend(v6, "payloadConfirmation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setConfirmationReason:", objc_msgSend(v10, "sendAnnouncementIntentAnnouncementConfirmationReason") == 1);

    }
    objc_msgSend(v6, "payloadUnsupported");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasSendAnnouncementIntentAnnouncementUnsupportedReason");

    if (v12)
    {
      objc_msgSend(v6, "payloadUnsupported");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setUnsupportedReason:", objc_msgSend(v13, "sendAnnouncementIntentAnnouncementUnsupportedReason") == 1);

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
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)INSendAnnouncementAnnouncementResolutionResult;
  -[INIntentResolutionResult _buildIntentSlotResolutionResultWithIntentSlotDescription:](&v12, sel__buildIntentSlotResolutionResultWithIntentSlotDescription_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[INIntentResolutionResult resolutionResultCode](self, "resolutionResultCode") == 3
    && -[INIntentResolutionResult confirmationReason](self, "confirmationReason"))
  {
    objc_msgSend(v4, "payloadConfirmation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setReason:", 1000);

    objc_msgSend(v4, "payloadConfirmation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[INIntentResolutionResult confirmationReason](self, "confirmationReason") == 1)
      v7 = 1;
    else
      v7 = 0x7FFFFFFFLL;
    objc_msgSend(v6, "setSendAnnouncementIntentAnnouncementConfirmationReason:", v7);

  }
  if (-[INIntentResolutionResult resolutionResultCode](self, "resolutionResultCode") == 1
    && -[INIntentResolutionResult unsupportedReason](self, "unsupportedReason"))
  {
    objc_msgSend(v4, "payloadUnsupported");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setReason:", 1000);

    objc_msgSend(v4, "payloadUnsupported");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[INIntentResolutionResult unsupportedReason](self, "unsupportedReason") == 1)
      v10 = 1;
    else
      v10 = 0x7FFFFFFFLL;
    objc_msgSend(v9, "setSendAnnouncementIntentAnnouncementUnsupportedReason:", v10);

  }
  return v4;
}

+ (id)confirmationRequiredWithAnnouncementToConfirm:(id)a3 forReason:(int64_t)a4
{
  void *v5;

  objc_msgSend(a1, "confirmationRequiredWithAnnouncementToConfirm:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfirmationReason:", a4);
  return v5;
}

+ (id)unsupportedForReason:(int64_t)a3
{
  void *v4;

  objc_msgSend(a1, "unsupported");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnsupportedReason:", a3);
  return v4;
}

@end
