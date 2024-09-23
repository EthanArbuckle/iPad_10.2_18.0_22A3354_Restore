@implementation INSendMessageRecipientResolutionResult

- (id)_initWithIntentSlotResolutionResult:(id)a3 slotDescription:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INSendMessageRecipientResolutionResult;
  v7 = -[INIntentResolutionResult _initWithIntentSlotResolutionResult:slotDescription:](&v14, sel__initWithIntentSlotResolutionResult_slotDescription_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "payloadUnsupported");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasSendMessageIntentRecipientUnsupportedReason");

    if (v9)
    {
      objc_msgSend(v6, "payloadUnsupported");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "sendMessageIntentRecipientUnsupportedReason") - 1;
      if (v11 > 9)
        v12 = 0;
      else
        v12 = qword_18C3114A8[v11];
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
  uint64_t v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)INSendMessageRecipientResolutionResult;
  -[INIntentResolutionResult _buildIntentSlotResolutionResultWithIntentSlotDescription:](&v12, sel__buildIntentSlotResolutionResultWithIntentSlotDescription_, a3);
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
    v8 = 0x7FFFFFFFLL;
    if (v7 > 999)
    {
      if (v7 == 1002)
        v9 = 9;
      else
        v9 = 0x7FFFFFFF;
      if (v7 == 1001)
        v10 = 8;
      else
        v10 = v9;
      if (v7 == 1000)
        v8 = 7;
      else
        v8 = v10;
    }
    else
    {
      switch(v7)
      {
        case 1:
          v8 = 1;
          break;
        case 2:
          v8 = 2;
          break;
        case 3:
          v8 = 3;
          break;
        case 4:
          v8 = 4;
          break;
        case 5:
          v8 = 5;
          break;
        case 6:
          v8 = 6;
          break;
        case 7:
          v8 = 10;
          break;
        default:
          break;
      }
    }
    objc_msgSend(v6, "setSendMessageIntentRecipientUnsupportedReason:", v8);

  }
  return v4;
}

+ (INSendMessageRecipientResolutionResult)unsupportedForReason:(INSendMessageRecipientUnsupportedReason)reason
{
  void *v4;

  objc_msgSend(a1, "unsupported");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnsupportedReason:", reason);
  return (INSendMessageRecipientResolutionResult *)v4;
}

@end
