@implementation WFHandlePaymentIntentAction

- (id)disabledOnPlatforms
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFHandlePaymentIntentAction;
  -[WFHandleIntentAction disabledOnPlatforms](&v10, sel_disabledOnPlatforms);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandlePaymentIntentAction identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("sirikit.intent.payments.SendPaymentIntent")))
  {

  }
  else
  {
    -[WFHandlePaymentIntentAction identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("sirikit.intent.payments.RequestPaymentIntent"));

    if (!v6)
    {
      v7 = v3;
      goto LABEL_6;
    }
  }
  objc_msgSend(v3, "arrayByAddingObject:", *MEMORY[0x24BEC43E8]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v8 = v7;

  return v8;
}

- (id)showsWhenRunIfApplicable
{
  void *v3;
  int v4;
  void *v5;
  objc_super v7;

  -[WFHandleSystemIntentAction intentDescription](self, "intentDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend((id)objc_msgSend(v3, "facadeClass"), "isSubclassOfClass:", objc_opt_class());

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)WFHandlePaymentIntentAction;
    -[WFHandleIntentAction showsWhenRunIfApplicable](&v7, sel_showsWhenRunIfApplicable);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1C8];
  }
  return v5;
}

- (BOOL)opensInApp
{
  void *v2;
  char v3;

  -[WFHandlePaymentIntentAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFVenmoActionAppSwitch"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)minimumSupportedClientVersion
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFHandlePaymentIntentAction;
  -[WFHandlePaymentIntentAction minimumSupportedClientVersion](&v5, sel_minimumSupportedClientVersion);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFMaximumBundleVersion();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *, _QWORD);
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  objc_super v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, void *, _QWORD))a7;
  objc_msgSend(v12, "wf_slotName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("currencyAmount"));

  if (v18)
  {
    v19 = v13;
    if (v19)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD1520], "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", 2, 4, 0, 0, 0, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "magnitude");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "decimalNumberByRoundingAccordingToBehavior:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "unitString");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23)
        {
          v25 = v23;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "currencyCode");
          v25 = (id)objc_claimAutoreleasedReturnValue();

        }
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9C80]), "initWithAmount:currencyCode:", v22, v25);

      }
      else
      {
        v26 = 0;
        v20 = v19;
        v19 = 0;
      }
    }
    else
    {
      v20 = 0;
      v26 = 0;
    }

    v16[2](v16, v26, 0);
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)WFHandlePaymentIntentAction;
    -[WFHandleIntentAction resolveSlot:withProcessedValue:parameter:input:completion:](&v28, sel_resolveSlot_withProcessedValue_parameter_input_completion_, v12, v13, v14, v15, v16);
  }

}

- (id)errorFromResolutionResult:(id)a3 forSlot:(id)a4 onIntent:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  WFHandlePaymentIntentAction *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  WFHandlePaymentIntentAction *v19;
  uint64_t v20;
  void *v21;
  WFHandlePaymentIntentAction *v23;
  void *v24;
  uint64_t v25;
  objc_super v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
    if (objc_msgSend(v8, "resolutionResultCode") == 1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = objc_msgSend(v8, "unsupportedReason");
        if (v12 != 3)
        {
          if (v12 != 2)
          {
            if (v12 == 1)
            {
              objc_msgSend(v11, "currencyAmount");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = self;
              v15 = v13;
              v16 = 1;
LABEL_15:
              -[WFHandlePaymentIntentAction amountBelowMinimumErrorWithAmount:sending:](v14, "amountBelowMinimumErrorWithAmount:sending:", v15, v16);
              v18 = objc_claimAutoreleasedReturnValue();
LABEL_30:
              v21 = (void *)v18;

              goto LABEL_31;
            }
            goto LABEL_23;
          }
          objc_msgSend(v11, "currencyAmount");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = self;
          v24 = v13;
          v25 = 1;
LABEL_29:
          -[WFHandlePaymentIntentAction amountAboveMaximumErrorWithAmount:sending:](v23, "amountAboveMaximumErrorWithAmount:sending:", v24, v25);
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_30;
        }
        goto LABEL_26;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "unsupportedReason") == 3)
      {
        v19 = self;
        v20 = 1;
LABEL_22:
        -[WFHandlePaymentIntentAction noRecipientAccountError:](v19, "noRecipientAccountError:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:

        goto LABEL_25;
      }
    }
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
    if (objc_msgSend(v8, "resolutionResultCode") == 1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = objc_msgSend(v8, "unsupportedReason");
        if (v17 != 3)
        {
          if (v17 != 2)
          {
            if (v17 == 1)
            {
              objc_msgSend(v11, "currencyAmount");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = self;
              v15 = v13;
              v16 = 0;
              goto LABEL_15;
            }
            goto LABEL_23;
          }
          objc_msgSend(v11, "currencyAmount");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = self;
          v24 = v13;
          v25 = 0;
          goto LABEL_29;
        }
LABEL_26:
        objc_msgSend(v11, "currencyAmount");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFHandlePaymentIntentAction currencyUnsupportedErrorWithAmount:](self, "currencyUnsupportedErrorWithAmount:", v13);
        v18 = objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "unsupportedReason") == 2)
      {
        v19 = self;
        v20 = 0;
        goto LABEL_22;
      }
    }
LABEL_23:

  }
  v26.receiver = self;
  v26.super_class = (Class)WFHandlePaymentIntentAction;
  -[WFHandleIntentAction errorFromResolutionResult:forSlot:onIntent:](&v26, sel_errorFromResolutionResult_forSlot_onIntent_, v8, v9, v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

  return v21;
}

- (BOOL)selectedPaymentServiceIsApplePay
{
  void *v2;
  void *v3;
  char v4;

  -[WFHandleSystemIntentAction intentDescriptor](self, "intentDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.PassKit.PassKitIntentsExtension"));

  return v4;
}

- (id)customAppNameForBundleIdentifier:(id)a3
{
  void *v3;

  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BEC16F0]))
  {
    WFLocalizedString(CFSTR("Apple Pay"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)customImageForBundleIdentifier:(id)a3
{
  void *v3;
  void *v4;

  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BEC16F0]))
  {
    objc_msgSend(MEMORY[0x24BEC14E0], "actionKitImageNamed:", CFSTR("ApplePay"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageWithRenderingMode:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)localizedKeyParameterDisplayName
{
  return WFLocalizedString(CFSTR("Contact"));
}

- (id)noRecipientAccountError:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v3 = a3;
  v18[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("No Account"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  if (v3)
    v7 = CFSTR("The person you are trying to send money to doesn't have an account set up with %@.");
  else
    v7 = CFSTR("The person you are trying to request money from doesn't have an account set up with %@.");
  WFLocalizedString(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleSystemIntentAction localizedAppName](self, "localizedAppName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD1540];
  v12 = *MEMORY[0x24BEC4270];
  v13 = *MEMORY[0x24BDD0FC8];
  v17[0] = *MEMORY[0x24BDD0FD8];
  v17[1] = v13;
  v18[0] = v5;
  v18[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 5, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)credentialsUnverifiedError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("Credentials Unverified"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("You will need to open %@ to verify your credentials."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleSystemIntentAction localizedAppName](self, "localizedAppName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringWithFormat:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BDD1540];
  v9 = *MEMORY[0x24BEC4270];
  v10 = *MEMORY[0x24BDD0FC8];
  v15[0] = *MEMORY[0x24BDD0FD8];
  v15[1] = v10;
  v16[0] = v3;
  v16[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 5, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleIntentAction errorThatLaunchesApp:](self, "errorThatLaunchesApp:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)amountBelowMinimumErrorWithAmount:(id)a3 sending:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v4 = a4;
  v18[2] = *MEMORY[0x24BDAC8D0];
  WFFormattedCurrencyAccount(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Below Minimum Amount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  if (v4)
    v8 = CFSTR("The amount you specified, %@, is below the minimum amount you are allowed to send.");
  else
    v8 = CFSTR("The amount you specified, %@, is below the minimum amount you are allowed to request.");
  WFLocalizedString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v9, v5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD1540];
  v12 = *MEMORY[0x24BEC4270];
  v13 = *MEMORY[0x24BDD0FC8];
  v17[0] = *MEMORY[0x24BDD0FD8];
  v17[1] = v13;
  v18[0] = v6;
  v18[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 5, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)amountAboveMaximumErrorWithAmount:(id)a3 sending:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v4 = a4;
  v18[2] = *MEMORY[0x24BDAC8D0];
  WFFormattedCurrencyAccount(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Above Maximum Amount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  if (v4)
    v8 = CFSTR("The amount you specified, %@, is above the maximum amount you are allowed to send.");
  else
    v8 = CFSTR("The amount you specified, %@, is above the maximum amount you are allowed to request.");
  WFLocalizedString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v9, v5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD1540];
  v12 = *MEMORY[0x24BEC4270];
  v13 = *MEMORY[0x24BDD0FC8];
  v17[0] = *MEMORY[0x24BDD0FD8];
  v17[1] = v13;
  v18[0] = v6;
  v18[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 5, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)currencyUnsupportedErrorWithAmount:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCEA0];
  v5 = a3;
  objc_msgSend(v4, "currentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currencyCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "localizedStringForCurrencyCode:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  WFLocalizedString(CFSTR("Currency Unsupported"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("The amount you specified was in %1$@, which is not supported by %2$@."));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHandleSystemIntentAction localizedAppName](self, "localizedAppName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringWithFormat:", v11, v8, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDD1540];
  v15 = *MEMORY[0x24BEC4270];
  v16 = *MEMORY[0x24BDD0FC8];
  v20[0] = *MEMORY[0x24BDD0FD8];
  v20[1] = v16;
  v21[0] = v9;
  v21[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 5, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)noBankAccountError
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("No Bank Account"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("You don't have a bank account configured on this device."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BEC4270];
  v6 = *MEMORY[0x24BDD0FC8];
  v10[0] = *MEMORY[0x24BDD0FD8];
  v10[1] = v6;
  v11[0] = v2;
  v11[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)insufficientFundsError
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  WFLocalizedString(CFSTR("Insufficient Funds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Your account does not have enough money to send the payment."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD1540];
  v5 = *MEMORY[0x24BEC4270];
  v6 = *MEMORY[0x24BDD0FC8];
  v10[0] = *MEMORY[0x24BDD0FD8];
  v10[1] = v6;
  v11[0] = v2;
  v11[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", v5, 5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)errorFromPaymentsResponse:(id)a3 intent:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  WFHandlePaymentIntentAction *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  WFHandlePaymentIntentAction *v16;
  void *v17;
  uint64_t v18;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    switch(objc_msgSend(v6, "code"))
    {
      case 6:
        goto LABEL_6;
      case 7:
        objc_msgSend(v8, "currencyAmount");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = self;
        v11 = v9;
        v12 = 1;
        goto LABEL_15;
      case 8:
        objc_msgSend(v8, "currencyAmount");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = self;
        v17 = v9;
        v18 = 1;
        goto LABEL_17;
      case 9:
        goto LABEL_9;
      case 10:
        -[WFHandlePaymentIntentAction insufficientFundsError](self, "insufficientFundsError");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 11:
        goto LABEL_10;
      default:
        goto LABEL_8;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    switch(objc_msgSend(v6, "code"))
    {
      case 6:
LABEL_6:
        -[WFHandlePaymentIntentAction credentialsUnverifiedError](self, "credentialsUnverifiedError");
        v13 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 7:
        objc_msgSend(v8, "currencyAmount");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = self;
        v11 = v9;
        v12 = 0;
LABEL_15:
        -[WFHandlePaymentIntentAction amountBelowMinimumErrorWithAmount:sending:](v10, "amountBelowMinimumErrorWithAmount:sending:", v11, v12);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      case 8:
        objc_msgSend(v8, "currencyAmount");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = self;
        v17 = v9;
        v18 = 0;
LABEL_17:
        -[WFHandlePaymentIntentAction amountAboveMaximumErrorWithAmount:sending:](v16, "amountAboveMaximumErrorWithAmount:sending:", v17, v18);
        v15 = objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      case 9:
LABEL_9:
        objc_msgSend(v8, "currencyAmount");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFHandlePaymentIntentAction currencyUnsupportedErrorWithAmount:](self, "currencyUnsupportedErrorWithAmount:", v9);
        v15 = objc_claimAutoreleasedReturnValue();
LABEL_18:
        v14 = (void *)v15;

        break;
      case 10:
LABEL_10:
        -[WFHandlePaymentIntentAction noBankAccountError](self, "noBankAccountError");
        v13 = objc_claimAutoreleasedReturnValue();
LABEL_13:
        v14 = (void *)v13;
        break;
      default:
LABEL_8:
        v14 = 0;
        break;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)errorFromConfirmResponse:(id)a3 intent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  -[WFHandlePaymentIntentAction errorFromPaymentsResponse:intent:](self, "errorFromPaymentsResponse:intent:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFHandlePaymentIntentAction;
    -[WFHandleIntentAction errorFromConfirmResponse:intent:](&v13, sel_errorFromConfirmResponse_intent_, v6, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)errorFromHandleResponse:(id)a3 intent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  -[WFHandlePaymentIntentAction errorFromPaymentsResponse:intent:](self, "errorFromPaymentsResponse:intent:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)WFHandlePaymentIntentAction;
    -[WFHandleIntentAction errorFromHandleResponse:intent:](&v13, sel_errorFromHandleResponse_intent_, v6, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (id)iconName
{
  objc_super v4;

  if (-[WFHandlePaymentIntentAction selectedPaymentServiceIsApplePay](self, "selectedPaymentServiceIsApplePay"))
    return CFSTR("ApplePay");
  v4.receiver = self;
  v4.super_class = (Class)WFHandlePaymentIntentAction;
  -[WFHandlePaymentIntentAction iconName](&v4, sel_iconName);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)actionForAppIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFHandlePaymentIntentAction;
  -[WFHandleSystemIntentAction actionForAppIdentifier:](&v4, sel_actionForAppIdentifier_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFHandlePaymentIntentAction;
  -[WFHandlePaymentIntentAction serializedParametersForDonatedIntent:allowDroppingUnconfigurableValues:](&v5, sel_serializedParametersForDonatedIntent_allowDroppingUnconfigurableValues_, a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
}

@end
