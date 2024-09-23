@implementation INStartCallContactResolutionResult

- (id)_initWithIntentSlotResolutionResult:(id)a3 slotDescription:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)INStartCallContactResolutionResult;
  v7 = -[INIntentResolutionResult _initWithIntentSlotResolutionResult:slotDescription:](&v19, sel__initWithIntentSlotResolutionResult_slotDescription_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "payloadConfirmation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "hasStartCallIntentContactsConfirmationReason");

    if (v9)
    {
      objc_msgSend(v6, "payloadConfirmation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "startCallIntentContactsConfirmationReason") - 1;
      if (v11 < 5)
        v12 = v11 + 1;
      else
        v12 = 0;
      objc_msgSend(v7, "setConfirmationReason:", v12);

    }
    objc_msgSend(v6, "payloadUnsupported");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hasStartCallIntentContactsUnsupportedReason");

    if (v14)
    {
      objc_msgSend(v6, "payloadUnsupported");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "startCallIntentContactsUnsupportedReason") - 1;
      if (v16 > 9)
        v17 = 0;
      else
        v17 = qword_18C3121F8[v16];
      objc_msgSend(v7, "setUnsupportedReason:", v17);

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
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)INStartCallContactResolutionResult;
  -[INIntentResolutionResult _buildIntentSlotResolutionResultWithIntentSlotDescription:](&v14, sel__buildIntentSlotResolutionResultWithIntentSlotDescription_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[INIntentResolutionResult resolutionResultCode](self, "resolutionResultCode") == 3
    && -[INIntentResolutionResult confirmationReason](self, "confirmationReason"))
  {
    objc_msgSend(v4, "payloadConfirmation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setReason:", 1000);

    objc_msgSend(v4, "payloadConfirmation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[INIntentResolutionResult confirmationReason](self, "confirmationReason") - 1;
    if (v7 < 5)
      v8 = (v7 + 1);
    else
      v8 = 0x7FFFFFFFLL;
    objc_msgSend(v6, "setStartCallIntentContactsConfirmationReason:", v8);

  }
  if (-[INIntentResolutionResult resolutionResultCode](self, "resolutionResultCode") == 1
    && -[INIntentResolutionResult unsupportedReason](self, "unsupportedReason"))
  {
    objc_msgSend(v4, "payloadUnsupported");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setReason:", 1000);

    objc_msgSend(v4, "payloadUnsupported");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[INIntentResolutionResult unsupportedReason](self, "unsupportedReason");
    switch(v11)
    {
      case 1uLL:
        v12 = 1;
        break;
      case 2uLL:
        v12 = 2;
        break;
      case 3uLL:
        v12 = 3;
        break;
      case 4uLL:
        v12 = 4;
        break;
      case 5uLL:
        v12 = 5;
        break;
      case 6uLL:
        v12 = 6;
        break;
      case 7uLL:
        v12 = 7;
        break;
      case 8uLL:
        v12 = 10;
        break;
      default:
        if (v11 == 1000)
          v12 = 8;
        else
          v12 = 0x7FFFFFFFLL;
        break;
    }
    objc_msgSend(v10, "setStartCallIntentContactsUnsupportedReason:", v12);

  }
  return v4;
}

+ (id)confirmationRequiredWithPersonToConfirm:(id)a3 forReason:(int64_t)a4
{
  void *v5;

  objc_msgSend(a1, "confirmationRequiredWithPersonToConfirm:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setConfirmationReason:", a4);
  return v5;
}

+ (INStartCallContactResolutionResult)unsupportedForReason:(INStartCallContactUnsupportedReason)reason
{
  void *v4;

  objc_msgSend(a1, "unsupported");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUnsupportedReason:", reason);
  return (INStartCallContactResolutionResult *)v4;
}

@end
