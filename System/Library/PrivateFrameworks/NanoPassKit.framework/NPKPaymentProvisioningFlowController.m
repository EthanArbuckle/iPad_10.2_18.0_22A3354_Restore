@implementation NPKPaymentProvisioningFlowController

- (NPKPaymentProvisioningFlowController)initWithProvisioningController:(id)a3 setupContext:(int64_t)a4
{
  id v7;
  NPKPaymentProvisioningFlowController *v8;
  uint64_t v9;
  PKPaymentWebService *webService;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  id *p_provisioningController;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *progressNotificationToken;
  _QWORD v27[4];
  id v28;
  objc_super v29;
  uint8_t buf[4];
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v29.receiver = self;
  v29.super_class = (Class)NPKPaymentProvisioningFlowController;
  v8 = -[NPKPaymentProvisioningFlowController init](&v29, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "webService");
    v9 = objc_claimAutoreleasedReturnValue();
    webService = v8->_webService;
    v8->_webService = (PKPaymentWebService *)v9;

    pk_Payment_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

    if (v12)
    {
      pk_Payment_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        -[PKPaymentWebService debugDescription](v8->_webService, "debugDescription");
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v15 = objc_msgSend(v14, "UTF8String");
        *(_DWORD *)buf = 136315138;
        v31 = v15;
        _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: checking webService %s: ", buf, 0xCu);

      }
    }
    v8->_currentStep = 100;
    p_provisioningController = (id *)&v8->_provisioningController;
    objc_storeStrong((id *)&v8->_provisioningController, a3);
    v8->_setupContext = a4;
    pk_Payment_log();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      pk_Payment_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*p_provisioningController, "debugDescription");
        v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v21 = objc_msgSend(v20, "UTF8String");
        *(_DWORD *)buf = 136315138;
        v31 = v21;
        _os_log_impl(&dword_213518000, v19, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: checking controller initialization %s: ", buf, 0xCu);

      }
    }
    objc_initWeak((id *)buf, v8);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *p_provisioningController;
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __84__NPKPaymentProvisioningFlowController_initWithProvisioningController_setupContext___block_invoke;
    v27[3] = &unk_24CFE8B20;
    objc_copyWeak(&v28, (id *)buf);
    objc_msgSend(v22, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x24BE6F6B8], v23, 0, v27);
    v24 = objc_claimAutoreleasedReturnValue();
    progressNotificationToken = v8->_progressNotificationToken;
    v8->_progressNotificationToken = v24;

    objc_msgSend(MEMORY[0x24BE6E9C8], "beginSubjectReporting:", CFSTR("provisioning"));
    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
  }

  return v8;
}

void __84__NPKPaymentProvisioningFlowController_initWithProvisioningController_setupContext___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_provisioningLocalizedProgressDescriptionDidChange:", v5);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (self->_progressNotificationToken)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_progressNotificationToken);

  }
  objc_msgSend(MEMORY[0x24BE6E9C8], "endSubjectReporting:", CFSTR("provisioning"));
  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowController;
  -[NPKPaymentProvisioningFlowController dealloc](&v4, sel_dealloc);
}

- (void)reset
{
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  id v8;
  PKPaymentCredential *currentCredential;
  PKAppleBalanceCredential *currentAppleBalanceCredential;
  PKPaymentSetupProduct *currentProduct;
  NSString *chooseCredentialsStepIdentifier;
  PKAddPaymentPassRequestConfiguration *inAppProvisioningRequestConfiguration;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE6E9C8];
  NPKAnalyticsEventForProvisioningFlowClientInput(CFSTR("reset"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subject:sendEvent:", CFSTR("provisioning"), v4);

  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      -[PKPaymentWebService debugDescription](self->_webService, "debugDescription");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v14 = 136315138;
      v15 = objc_msgSend(v8, "UTF8String");
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: checking webService %s: ", (uint8_t *)&v14, 0xCu);

    }
  }
  -[PKPaymentProvisioningController reset](self->_provisioningController, "reset");
  currentCredential = self->_currentCredential;
  self->_currentCredential = 0;

  currentAppleBalanceCredential = self->_currentAppleBalanceCredential;
  self->_currentAppleBalanceCredential = 0;

  currentProduct = self->_currentProduct;
  self->_currentProduct = 0;

  self->_termsAcceptedOutOfBand = 0;
  self->_currentStep = 100;
  chooseCredentialsStepIdentifier = self->_chooseCredentialsStepIdentifier;
  self->_chooseCredentialsStepIdentifier = 0;

  inAppProvisioningRequestConfiguration = self->_inAppProvisioningRequestConfiguration;
  self->_inAppProvisioningRequestConfiguration = 0;

}

- (void)startProvisioningFlow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int currentStep;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)MEMORY[0x24BE6E9C8];
  NPKAnalyticsEventForProvisioningFlowClientInput(CFSTR("startProvisioningFlow"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subject:sendEvent:", CFSTR("provisioning"), v6);

  currentStep = self->_currentStep;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (currentStep == 100)
  {
    v10 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      pk_Payment_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: starting provisioning flow", buf, 2u);
      }

    }
    -[NPKPaymentProvisioningFlowController _handleProvisioningFlowStarted:](self, "_handleProvisioningFlowStarted:", v4);
  }
  else
  {
    v12 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      pk_Payment_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_ERROR, "Error: Past initialization step; cannot start provisioning flow!",
          v14,
          2u);
      }

    }
  }

}

- (void)acknowledgeWelcome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int IsTinker;
  _BOOL4 v12;
  int v13;
  _BOOL8 v14;
  _BOOL4 v15;
  uint64_t v16;
  id v17;
  void (**v18)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  void (**v24)(_QWORD, _QWORD, _QWORD, _QWORD);
  char v25;
  _QWORD v26[4];
  id v27;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BE6E9C8];
  NPKAnalyticsEventForProvisioningFlowClientInput(CFSTR("acknowledgeWelcome"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subject:sendEvent:", CFSTR("provisioning"), v6);

  if (self->_inAppProvisioningRequestConfiguration)
  {
    -[NPKPaymentProvisioningFlowController _performNextActionForProvisioningState:](self, "_performNextActionForProvisioningState:", v4);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_flowPickerSectionsWithContext:provisioningController:readerModeSupported:digitalIssuanceSupported:", self->_setupContext, self->_provisioningController, self->_readerModeProvisioningSupported, self->_digitalIssuanceSupported);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPaymentProvisioningFlowController provisioningController](self, "provisioningController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "webService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "paymentSetupSupportedInRegion");

    IsTinker = NPKPairedOrPairingDeviceIsTinker();
    if (IsTinker)
      v12 = -[PKPaymentProvisioningController isCurrentUserUnder13](self->_provisioningController, "isCurrentUserUnder13") == 1;
    else
      v12 = 0;
    if (v10 == 1)
      v13 = IsTinker;
    else
      v13 = 1;
    if (v10 != 1)
      v12 = 1;
    v14 = !v12;
    v15 = IsTinker & v14;
    v16 = MEMORY[0x24BDAC760];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __59__NPKPaymentProvisioningFlowController_acknowledgeWelcome___block_invoke;
    v26[3] = &unk_24CFE8B68;
    v17 = v7;
    v27 = v17;
    v18 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x2199B6780](v26);
    v19 = v18;
    if (v15)
    {
      v21[0] = v16;
      v21[1] = 3221225472;
      v21[2] = __59__NPKPaymentProvisioningFlowController_acknowledgeWelcome___block_invoke_3;
      v21[3] = &unk_24CFE8B90;
      v21[4] = self;
      v24 = v18;
      v22 = v17;
      v25 = v13;
      v23 = v4;
      -[NPKPaymentProvisioningFlowController _canMakeDigitalIssuancePaymentsForTransitProductsWithCompletion:](self, "_canMakeDigitalIssuancePaymentsForTransitProductsWithCompletion:", v21);

    }
    else
    {
      ((void (**)(_QWORD, id, _QWORD, _BOOL8))v18)[2](v18, v17, v13 ^ 1u, v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKPaymentProvisioningFlowController _transitionToChooseFlowWithSections:requestContext:](self, "_transitionToChooseFlowWithSections:requestContext:", v20, v4);

    }
  }

}

id __59__NPKPaymentProvisioningFlowController_acknowledgeWelcome___block_invoke(uint64_t a1, void *a2, int a3, char a4)
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  char v14;
  char v15;

  v7 = a2;
  v8 = v7;
  if (a3 && (a4 & 1) != 0)
  {
    v9 = v7;
  }
  else
  {
    v10 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __59__NPKPaymentProvisioningFlowController_acknowledgeWelcome___block_invoke_2;
    v13[3] = &__block_descriptor_34_e56_B32__0__NPKPaymentProvisioningFlowPickerSection_8Q16_B24l;
    v14 = a3;
    v15 = a4;
    objc_msgSend(v10, "pk_objectsPassingTest:", v13);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v9;

  return v11;
}

BOOL __59__NPKPaymentProvisioningFlowController_acknowledgeWelcome___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  _BOOL8 v5;

  v3 = a2;
  if (objc_msgSend(v3, "isPaymentSection"))
  {
    v4 = *(unsigned __int8 *)(a1 + 32);
  }
  else
  {
    if (!objc_msgSend(v3, "isTransitSection"))
    {
      v5 = 1;
      goto LABEL_7;
    }
    v4 = *(unsigned __int8 *)(a1 + 33);
  }
  v5 = v4 != 0;
LABEL_7:

  return v5;
}

void __59__NPKPaymentProvisioningFlowController_acknowledgeWelcome___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  (*(void (**)(_QWORD, _QWORD, BOOL, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 64) == 0, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_transitionToChooseFlowWithSections:requestContext:", v4, *(_QWORD *)(a1 + 48));

}

- (void)chooseFlowForPickerItem:(id)a3 requestContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v14 = CFSTR("flowItem");
    objc_msgSend(v6, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v10 = (void *)MEMORY[0x24BE6E9C8];
  NPKAnalyticsEventForProvisioningFlowClientInput(CFSTR("chooseFlow"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subject:sendEvent:", CFSTR("provisioning"), v11);

  objc_msgSend(v6, "products");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v12, "count") < 2)
  {
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPaymentProvisioningFlowController _handleProductChosen:includeCardsOnFile:requestContext:](self, "_handleProductChosen:includeCardsOnFile:requestContext:", v13, 1, v7);

  }
  else
  {
    -[NPKPaymentProvisioningFlowController _transitionToChooseProductWithProducts:requestContext:](self, "_transitionToChooseProductWithProducts:requestContext:", v12, v7);
  }

}

+ (id)_filterAssociatedCredentials:(id)a3 forProduct:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "paymentOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = objc_msgSend(v8, "cardType");
  else
    v9 = 0;
  objc_msgSend(v6, "productIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9 && v10 && objc_msgSend(v10, "length"))
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __80__NPKPaymentProvisioningFlowController__filterAssociatedCredentials_forProduct___block_invoke;
    v18[3] = &unk_24CFE8BB8;
    v20 = v9;
    v19 = v11;
    objc_msgSend(v5, "pk_objectsPassingTest:", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    pk_General_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

    if (v14)
    {
      pk_General_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "displayName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v22 = v16;
        v23 = 1024;
        v24 = v9;
        v25 = 2112;
        v26 = v11;
        _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_ERROR, "Error: Failed collecting associated credentials for product = '%@', cardType = %u, productIdentifier = %@", buf, 0x1Cu);

      }
    }
    v12 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v12;
}

uint64_t __80__NPKPaymentProvisioningFlowController__filterAssociatedCredentials_forProduct___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "credentialType") == *(_QWORD *)(a1 + 40)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v3, "productIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasCredentialsAssociatedWithProduct:(id)a3
{
  PKPaymentProvisioningController *provisioningController;
  id v4;
  void *v5;
  void *v6;

  provisioningController = self->_provisioningController;
  v4 = a3;
  -[PKPaymentProvisioningController associatedCredentials](provisioningController, "associatedCredentials");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_filterAssociatedCredentials:forProduct:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "count") != 0;
  return (char)v4;
}

- (void)_ensureMetadataForCredentials:(id)a3 updateHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  id obj;
  PKPaymentProvisioningController *v40;
  void (**v41)(id, uint64_t, _QWORD, id);
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD v47[4];
  id v48;
  PKPaymentProvisioningController *v49;
  id v50;
  void (**v51)(id, uint64_t, _QWORD, id);
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[5];
  id v64;
  _QWORD v65[3];
  char v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v41 = (void (**)(id, uint64_t, _QWORD, id))a4;
  v36 = a5;
  v65[0] = 0;
  v65[1] = v65;
  v65[2] = 0x2020000000;
  v66 = 0;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x3032000000;
  v63[3] = __Block_byref_object_copy__4;
  v63[4] = __Block_byref_object_dispose__4;
  v64 = 0;
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v40 = self->_provisioningController;
  v37 = (void *)objc_opt_new();
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v60;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v60 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v12);
        v14 = objc_msgSend(v13, "credentialType");
        if (!v14)
          goto LABEL_12;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_12;
        v15 = v13;
        if (!objc_msgSend(v15, "requiresMetadata"))
        {

LABEL_12:
          objc_msgSend(v9, "addObject:", v13);
          goto LABEL_13;
        }
        objc_msgSend(v15, "productIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u,%@"), v14, v16);
        else
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%u"), v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKey:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v18, "unsignedIntegerValue") + 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v37, "setObject:forKeyedSubscript:", v20, v17);

LABEL_13:
        ++v12;
      }
      while (v10 != v12);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
      v10 = v21;
    }
    while (v21);
  }

  if (objc_msgSend(v37, "count"))
  {
    if (v41 && objc_msgSend(v9, "count"))
      v41[2](v41, 1, 0, v9);
    objc_msgSend(v37, "keysSortedByValueUsingComparator:", &__block_literal_global_4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc_init(MEMORY[0x24BE6EA18]);
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v38 = v22;
    v24 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v56 != v25)
            objc_enumerationMutation(v38);
          v27 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          v28 = objc_msgSend(v27, "rangeOfString:", CFSTR(","));
          v29 = v28;
          if (v28 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v30 = objc_msgSend(v27, "integerValue");
            v31 = 0;
          }
          else
          {
            objc_msgSend(v27, "substringFromIndex:", v28 + 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "substringToIndex:", v29);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v32, "integerValue");

          }
          v47[0] = MEMORY[0x24BDAC760];
          v47[1] = 3221225472;
          v47[2] = __102__NPKPaymentProvisioningFlowController__ensureMetadataForCredentials_updateHandler_completionHandler___block_invoke_2;
          v47[3] = &unk_24CFE8C48;
          v54 = v30;
          v33 = v31;
          v48 = v33;
          v49 = v40;
          v52 = v63;
          v50 = v9;
          v53 = v65;
          v51 = v41;
          objc_msgSend(v23, "addOperation:", v47);

        }
        v24 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v55, v67, 16);
      }
      while (v24);
    }

    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __102__NPKPaymentProvisioningFlowController__ensureMetadataForCredentials_updateHandler_completionHandler___block_invoke_58;
    v42[3] = &unk_24CFE8C70;
    v44 = v36;
    v45 = v65;
    v46 = v63;
    v43 = v9;
    v35 = (id)objc_msgSend(v23, "evaluateWithInput:completion:", v34, v42);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD, id))v36 + 2))(v36, 1, 0, v9);
  }

  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v65, 8);

}

uint64_t __102__NPKPaymentProvisioningFlowController__ensureMetadataForCredentials_updateHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __102__NPKPaymentProvisioningFlowController__ensureMetadataForCredentials_updateHandler_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v9 = v8;
  v10 = objc_alloc_init(MEMORY[0x24BE6ECF0]);
  objc_msgSend(v10, "setIncludeMetadata:", 1);
  objc_msgSend(v10, "setCredentialType:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v10, "setProductIdentifier:", *(_QWORD *)(a1 + 32));
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __102__NPKPaymentProvisioningFlowController__ensureMetadataForCredentials_updateHandler_completionHandler___block_invoke_3;
  v18[3] = &unk_24CFE8C20;
  v26 = v9;
  v27 = *(_QWORD *)(a1 + 80);
  v11 = *(void **)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 64);
  v19 = v12;
  v24 = v13;
  v14 = *(id *)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 72);
  v20 = v14;
  v25 = v15;
  v22 = *(id *)(a1 + 56);
  v23 = v7;
  v21 = v6;
  v16 = v6;
  v17 = v7;
  objc_msgSend(v11, "updateRemoteCredentials:withCompletionHandler:", v10, v18);

}

void __102__NPKPaymentProvisioningFlowController__ensureMetadataForCredentials_updateHandler_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  __int16 v29;
  id v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v11 = v10;
  v12 = *(double *)(a1 + 88);
  pk_General_log();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    pk_General_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(a1 + 96);
      v17 = *(void **)(a1 + 32);
      v27 = 67109634;
      v28 = v16;
      v29 = 2112;
      v30 = v17;
      v31 = 2048;
      v32 = v11 - v12;
      _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: updateRemoteCredentials [%u, %@] completed in %f seconds", (uint8_t *)&v27, 0x1Cu);
    }

  }
  if (!v9 || !objc_msgSend(v9, "count"))
  {
    pk_General_log();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (v19)
    {
      pk_General_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = *(_QWORD *)(a1 + 96);
        v27 = 67109120;
        v28 = v21;
        _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_DEFAULT, "Notice: Warning: User had matching associated credentials (type=%d) but when fetching metadata no credentials were returned", (uint8_t *)&v27, 8u);
      }

    }
  }
  if (v8)
  {
    pk_General_log();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

    if (v23)
    {
      pk_General_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = *(_QWORD *)(a1 + 96);
        v27 = 67109378;
        v28 = v25;
        v29 = 2112;
        v30 = v8;
        _os_log_impl(&dword_213518000, v24, OS_LOG_TYPE_ERROR, "Error: Failed collecting metadata for associated credentials (type=%d), error = %@", (uint8_t *)&v27, 0x12u);
      }

    }
  }
  if ((_DWORD)a2 && v9 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v9);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) |= a2;
  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a3);
  v26 = *(_QWORD *)(a1 + 56);
  if (v26)
    (*(void (**)(uint64_t, uint64_t, id, _QWORD))(v26 + 16))(v26, a2, v8, *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

uint64_t __102__NPKPaymentProvisioningFlowController__ensureMetadataForCredentials_updateHandler_completionHandler___block_invoke_58(uint64_t a1)
{
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_cardsOnFileForProduct:(id)a3 updateHandler:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  PKPaymentProvisioningController *provisioningController;
  id v14;
  id v15;
  id v16;

  v16 = a3;
  if (v16)
  {
    v8 = a5;
    v9 = a4;
    v10 = (void *)objc_opt_class();
    -[PKPaymentProvisioningController associatedCredentials](self->_provisioningController, "associatedCredentials");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_filterAssociatedCredentials:forProduct:", v11, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    provisioningController = self->_provisioningController;
    v14 = a5;
    v15 = a4;
    -[PKPaymentProvisioningController associatedCredentials](provisioningController, "associatedCredentials");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[NPKPaymentProvisioningFlowController _ensureMetadataForCredentials:updateHandler:completionHandler:](self, "_ensureMetadataForCredentials:updateHandler:completionHandler:", v12, a4, a5);

}

- (void)ensureMetadataForCredentials:(id)a3 requestContext:(id)a4 updateHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __116__NPKPaymentProvisioningFlowController_ensureMetadataForCredentials_requestContext_updateHandler_completionHandler___block_invoke;
  v20[3] = &unk_24CFE8C98;
  v20[4] = self;
  v21 = v10;
  v22 = v11;
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __116__NPKPaymentProvisioningFlowController_ensureMetadataForCredentials_requestContext_updateHandler_completionHandler___block_invoke_60;
  v17[3] = &unk_24CFE8C98;
  v17[4] = self;
  v18 = v21;
  v19 = v12;
  v14 = v12;
  v15 = v21;
  v16 = v11;
  -[NPKPaymentProvisioningFlowController _ensureMetadataForCredentials:updateHandler:completionHandler:](self, "_ensureMetadataForCredentials:updateHandler:completionHandler:", a3, v20, v17);

}

void __116__NPKPaymentProvisioningFlowController_ensureMetadataForCredentials_requestContext_updateHandler_completionHandler___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((a2 & 1) == 0)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      pk_Payment_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v7;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Error occurred when setting up product for provisioning: %@", (uint8_t *)&v12, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_sendDidEncounterError:requestContext:", v7, *(_QWORD *)(a1 + 40));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __116__NPKPaymentProvisioningFlowController_ensureMetadataForCredentials_requestContext_updateHandler_completionHandler___block_invoke_60(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if ((a2 & 1) == 0)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      pk_Payment_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v7;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Error occurred when setting up product for provisioning: %@", (uint8_t *)&v12, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_sendDidEncounterError:requestContext:", v7, *(_QWORD *)(a1 + 40));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)chooseCardsOnFileFlowForProduct:(id)a3 requestContext:(id)a4 preloadMetadata:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  PKPaymentProvisioningController *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  if (v5)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __103__NPKPaymentProvisioningFlowController_chooseCardsOnFileFlowForProduct_requestContext_preloadMetadata___block_invoke;
    v13[3] = &unk_24CFE8CC0;
    v13[4] = self;
    v14 = v9;
    v15 = v10;
    -[NPKPaymentProvisioningFlowController _cardsOnFileForProduct:updateHandler:completionHandler:](self, "_cardsOnFileForProduct:updateHandler:completionHandler:", v14, 0, v13);

  }
  else
  {
    v11 = self->_provisioningController;
    -[PKPaymentProvisioningController associatedCredentials](v11, "associatedCredentials");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_currentProduct, a3);
    -[NPKPaymentProvisioningFlowController _transitionBasedOnCredentials:product:requestContext:](self, "_transitionBasedOnCredentials:product:requestContext:", v12, v9, v10);

  }
}

void __103__NPKPaymentProvisioningFlowController_chooseCardsOnFileFlowForProduct_requestContext_preloadMetadata___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (a2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 184), *(id *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_transitionBasedOnCredentials:product:requestContext:", v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      pk_Payment_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = v7;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Error occurred when setting up product for provisioning: %@", (uint8_t *)&v12, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_sendDidEncounterError:requestContext:", v7, *(_QWORD *)(a1 + 48));
  }

}

+ (id)_productsArrayFromPickerSection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "items", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "products");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (void)_chooseProductFromFlowPickerSection:(id)a3 requestContext:(id)a4 transitioningToStep:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  NPKPaymentProvisioningFlowControllerChooseProductStepContext *v10;
  id v11;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "_productsArrayFromPickerSection:", v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v10 = -[NPKPaymentProvisioningFlowControllerChooseProductStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerChooseProductStepContext alloc], "initWithRequestContext:", v8);
  -[NPKPaymentProvisioningFlowControllerChooseProductStepContext setProducts:](v10, "setProducts:", v11);
  -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", v5, v10);

}

- (void)chooseTransitProductFromFlowPickerSection:(id)a3 requestContext:(id)a4
{
  -[NPKPaymentProvisioningFlowController _chooseProductFromFlowPickerSection:requestContext:transitioningToStep:](self, "_chooseProductFromFlowPickerSection:requestContext:transitioningToStep:", a3, a4, 137);
}

- (void)chooseEMoneyProductFromFlowPickerSection:(id)a3 requestContext:(id)a4
{
  -[NPKPaymentProvisioningFlowController _chooseProductFromFlowPickerSection:requestContext:transitioningToStep:](self, "_chooseProductFromFlowPickerSection:requestContext:transitioningToStep:", a3, a4, 138);
}

- (void)prefetchCredentialsForProduct:(id)a3 requestContext:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL8 v11;
  PKPaymentProvisioningController *provisioningController;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  NPKPaymentProvisioningFlowController *v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = !NPKPaymentProvisioningSetupContextIsSetupAssistant(self->_setupContext);
  provisioningController = self->_provisioningController;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __103__NPKPaymentProvisioningFlowController_prefetchCredentialsForProduct_requestContext_completionHandler___block_invoke;
  v16[3] = &unk_24CFE8CE8;
  v17 = v8;
  v18 = self;
  v19 = v9;
  v20 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  -[PKPaymentProvisioningController setupProductForProvisioning:includePurchases:withCompletionHandler:](provisioningController, "setupProductForProvisioning:includePurchases:withCompletionHandler:", v14, v11, v16);

}

void __103__NPKPaymentProvisioningFlowController_prefetchCredentialsForProduct_requestContext_completionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      pk_Payment_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 32), "displayName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412546;
        v11 = v9;
        v12 = 2112;
        v13 = v5;
        _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Error occurred when collecting associated purchases for product %@, error: %@", (uint8_t *)&v10, 0x16u);

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "_sendDidEncounterError:requestContext:", v5, *(_QWORD *)(a1 + 48));
  }

}

- (void)chooseProductAndCredentialsFlowForProduct:(id)a3 credentials:(id)a4 requestContext:(id)a5
{
  -[NPKPaymentProvisioningFlowController _transitionBasedOnCredentials:product:requestContext:](self, "_transitionBasedOnCredentials:product:requestContext:", a4, a3, a5);
}

- (void)chooseProduct:(id)a3 includeCardsOnFile:(BOOL)a4 requestContext:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v6 = a4;
  v15[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "productIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v14 = CFSTR("productIdentifier");
    objc_msgSend(v8, "productIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12 = (void *)MEMORY[0x24BE6E9C8];
  NPKAnalyticsEventForProvisioningFlowClientInput(CFSTR("chooseProduct"), v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "subject:sendEvent:", CFSTR("provisioning"), v13);

  if (objc_msgSend(v8, "isAppleBalanceProduct"))
    -[NPKPaymentProvisioningFlowController _handleAppleBalanceProductChosen:requestContext:](self, "_handleAppleBalanceProductChosen:requestContext:", v8, v9);
  else
    -[NPKPaymentProvisioningFlowController _handleProductChosen:includeCardsOnFile:requestContext:](self, "_handleProductChosen:includeCardsOnFile:requestContext:", v8, v6, v9);

}

- (void)chooseProduct:(id)a3 requestContext:(id)a4
{
  -[NPKPaymentProvisioningFlowController chooseProduct:includeCardsOnFile:requestContext:](self, "chooseProduct:includeCardsOnFile:requestContext:", a3, 1, a4);
}

- (void)handleDigitalIssuanceAmount:(id)a3 requestContext:(id)a4
{
  NSDecimalNumber *v6;
  void *v7;
  void *v8;
  NSDecimalNumber *digitalIssuanceAmount;
  NSDecimalNumber *v10;
  id v11;

  v6 = (NSDecimalNumber *)a3;
  v7 = (void *)MEMORY[0x24BE6E9C8];
  v11 = a4;
  NPKAnalyticsEventForProvisioningFlowClientInput(CFSTR("digitalIssuanceAmount"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subject:sendEvent:", CFSTR("provisioning"), v8);

  digitalIssuanceAmount = self->_digitalIssuanceAmount;
  self->_digitalIssuanceAmount = v6;
  v10 = v6;

  -[NPKPaymentProvisioningFlowController _startDigitalIssuancePaymentWithAmount:requestContext:](self, "_startDigitalIssuancePaymentWithAmount:requestContext:", v10, v11);
}

- (void)handleDigitalIssuanceAmount:(id)a3 serviceProviderProduct:(id)a4 item:(id)a5 requestContext:(id)a6
{
  NSDecimalNumber *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  NSDecimalNumber *digitalIssuanceAmount;
  NSDecimalNumber *v16;
  id v17;

  v10 = (NSDecimalNumber *)a3;
  v11 = (void *)MEMORY[0x24BE6E9C8];
  v12 = a6;
  v13 = a5;
  v17 = a4;
  NPKAnalyticsEventForProvisioningFlowClientInput(CFSTR("digitalIssuanceAmount"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "subject:sendEvent:", CFSTR("provisioning"), v14);

  digitalIssuanceAmount = self->_digitalIssuanceAmount;
  self->_digitalIssuanceAmount = v10;
  v16 = v10;

  -[NPKPaymentProvisioningFlowController _startDigitalIssuancePaymentWithAmount:requestContext:serviceProviderProduct:productItem:](self, "_startDigitalIssuancePaymentWithAmount:requestContext:serviceProviderProduct:productItem:", v16, v12, v17, v13);
}

- (void)chooseReaderMode:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x24BE6E9C8];
  v6 = a3;
  NPKAnalyticsEventForProvisioningFlowClientInput(CFSTR("chooseReaderMode"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subject:sendEvent:", CFSTR("provisioning"), v5);

  -[NPKPaymentProvisioningFlowController _transitionToReaderModeForProduct:requestContext:](self, "_transitionToReaderModeForProduct:requestContext:", self->_currentProduct, v6);
}

- (void)handleReaderModeFields:(id)a3 requestContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  NPKAnalyticsEventEntriesForPaymentSetupFields(a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BE6E9C8];
  NPKAnalyticsEventForProvisioningFlowClientInput(CFSTR("readerModeFields"), v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subject:sendEvent:", CFSTR("provisioning"), v8);

  -[PKPaymentSetupProduct termsURL](self->_currentProduct, "termsURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowController _transitionBasedOnTermsForReason:URL:requestContext:](self, "_transitionBasedOnTermsForReason:URL:requestContext:", 2, v9, v6);

}

- (void)chooseCredentials:(id)a3 requestContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  NPKAnalyticsEventEntriesForCredentials(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BE6E9C8];
  NPKAnalyticsEventForProvisioningFlowClientInput(CFSTR("chooseCredentials"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subject:sendEvent:", CFSTR("provisioning"), v10);

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", &__block_literal_global_64);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "count"))
  {
    -[NPKPaymentProvisioningFlowController _handleProceedWithCredentials:chosenByUser:requestContext:](self, "_handleProceedWithCredentials:chosenByUser:requestContext:", v12, 1, v7);
  }
  else
  {
    pk_General_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);

    if (v14)
    {
      pk_General_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = 138412290;
        v17 = v6;
        _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_ERROR, "Error: Error: No valid provisioning methods exist for credentials [%@]", (uint8_t *)&v16, 0xCu);
      }

    }
  }

}

BOOL __73__NPKPaymentProvisioningFlowController_chooseCredentials_requestContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "remoteCredential");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = (unint64_t)(objc_msgSend(v2, "status") - 1) < 2;
  else
    v4 = 1;

  return v4;
}

- (void)chooseManualEntry:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)MEMORY[0x24BE6E9C8];
  v6 = a3;
  NPKAnalyticsEventForProvisioningFlowClientInput(CFSTR("chooseManualEntry"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subject:sendEvent:", CFSTR("provisioning"), v5);

  -[NPKPaymentProvisioningFlowController _transitionBasedOnCredentials:product:requestContext:](self, "_transitionBasedOnCredentials:product:requestContext:", 0, self->_currentProduct, v6);
}

- (void)handleManualEntryFields:(id)a3 credential:(id)a4 requestContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NPKPaymentProvisioningFlowControllerLocalDeviceManualEntryProgressStepContext *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  PKPaymentCredential *currentCredential;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *fieldsModel;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  NSObject *v34;
  _BOOL4 v35;
  NSObject *v36;
  void *v37;
  PKPaymentSetupFieldsModel *v38;
  NSObject *v39;
  _BOOL4 v40;
  NSObject *v41;
  PKPaymentCredential *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  void *v48;
  PKPaymentSetupFieldsModel *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  _BOOL4 v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  NPKPaymentProvisioningFlowController *v58;
  void *v59;
  void *v60;
  NPKPaymentProvisioningFlowController *v61;
  void *v62;
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  uint8_t v79[128];
  uint8_t buf[4];
  id v81;
  __int16 v82;
  PKPaymentCredential *v83;
  uint64_t v84;

  v84 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  NPKAnalyticsEventEntriesForPaymentSetupFields(v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BE6E9C8];
  v62 = v11;
  NPKAnalyticsEventForProvisioningFlowClientInput(CFSTR("manualEntryFields"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "subject:sendEvent:", CFSTR("provisioning"), v13);

  if (-[PKPaymentProvisioningController state](self->_provisioningController, "state") == 3)
    -[PKPaymentProvisioningController declineTerms](self->_provisioningController, "declineTerms");
  if (self->_currentStep == 192)
  {
    v14 = -[NPKPaymentProvisioningFlowControllerLocalDeviceManualEntryProgressStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerLocalDeviceManualEntryProgressStepContext alloc], "initWithRequestContext:", v10);
    -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", 193, v14);

  }
  v63 = v10;
  if (-[PKPaymentProvisioningController state](self->_provisioningController, "state") == 1)
  {
    if (v9)
    {
      if ((PKEqualObjects() & 1) != 0)
        goto LABEL_39;
      pk_General_log();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

      if (v16)
      {
        pk_General_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          currentCredential = self->_currentCredential;
          *(_DWORD *)buf = 138412546;
          v81 = v9;
          v82 = 2112;
          v83 = currentCredential;
          _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Provided credential %@ does not match current credential %@; going back to requirements",
            buf,
            0x16u);
        }

      }
      objc_msgSend(v9, "requirementsResponse");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "requiredPaymentSetupFields");
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = 0u;
      v74 = 0u;
      v75 = 0u;
      v76 = 0u;
      v21 = v8;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v74;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v74 != v24)
              objc_enumerationMutation(v21);
            objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "identifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v26);

          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v73, v79, 16);
        }
        while (v23);
      }

      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      fieldsModel = (void *)objc_claimAutoreleasedReturnValue();
      if ((self->_currentStep & 0xFFFFFFFE) == 0xC0)
        -[NPKPaymentProvisioningFlowController _localRequiredFieldsFromRequirementsResponse](self, "_localRequiredFieldsFromRequirementsResponse");
      else
        -[NPKPaymentProvisioningFlowController _requiredFieldsFromRequirementsResponseExcludingLocalFields](self, "_requiredFieldsFromRequirementsResponseExcludingLocalFields");
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v28 = (id)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v70;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v70 != v31)
              objc_enumerationMutation(v28);
            objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * j), "identifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(fieldsModel, "addObject:", v33);

          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
        }
        while (v30);
      }

      if (objc_msgSend(fieldsModel, "isSubsetOfSet:", v19))
      {

LABEL_38:
        goto LABEL_39;
      }
      pk_General_log();
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);

      if (v35)
      {
        pk_General_log();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v81 = v19;
          v82 = 2112;
          v83 = (PKPaymentCredential *)fieldsModel;
          _os_log_impl(&dword_213518000, v36, OS_LOG_TYPE_DEFAULT, "Notice: Manual entry fields %@ do not contain all required fields %@; going back to requirements",
            buf,
            0x16u);
        }

      }
      -[NPKPaymentProvisioningFlowController _curatedDefaultPaymentSetupProvisioningFields](self, "_curatedDefaultPaymentSetupProvisioningFields");
      v20 = objc_claimAutoreleasedReturnValue();

    }
    -[PKPaymentProvisioningController resetForNewProvisioning](self->_provisioningController, "resetForNewProvisioning");
    -[PKPaymentProvisioningController credentialProvisioningQueue](self->_provisioningController, "credentialProvisioningQueue");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setCurrentCredential:", v9);

    v38 = (PKPaymentSetupFieldsModel *)objc_msgSend(objc_alloc(MEMORY[0x24BE6ED50]), "initWithPaymentSetupFields:", v20);
    fieldsModel = self->_fieldsModel;
    self->_fieldsModel = v38;
    v19 = (void *)v20;
    goto LABEL_38;
  }
LABEL_39:
  pk_Payment_log();
  v39 = objc_claimAutoreleasedReturnValue();
  v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);

  if (v40)
  {
    pk_Payment_log();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      -[PKPaymentSetupFieldsModel paymentSetupFields](self->_fieldsModel, "paymentSetupFields");
      v42 = (PKPaymentCredential *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v81 = v8;
      v82 = 2112;
      v83 = v42;
      _os_log_impl(&dword_213518000, v41, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Handling manual entry fields: %@ with fields model fields: %@", buf, 0x16u);

    }
  }
  v64 = v9;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v43 = v8;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v66;
    do
    {
      for (k = 0; k != v45; ++k)
      {
        if (*(_QWORD *)v66 != v46)
          objc_enumerationMutation(v43);
        v48 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * k);
        v49 = self->_fieldsModel;
        objc_msgSend(v48, "identifier");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](v49, "paymentSetupFieldWithIdentifier:", v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        pk_Payment_log();
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);

        if (v51)
        {
          if (!v53)
            goto LABEL_56;
          pk_Payment_log();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v81 = v51;
            _os_log_impl(&dword_213518000, v54, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Updating %@", buf, 0xCu);
          }
        }
        else
        {
          if (!v53)
            goto LABEL_56;
          pk_Payment_log();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v48, "identifier");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v81 = v55;
            _os_log_impl(&dword_213518000, v54, OS_LOG_TYPE_DEFAULT, "Warning: Standalone: no model field with identifier %@ to update!", buf, 0xCu);

          }
        }

LABEL_56:
        objc_msgSend(v48, "currentValue");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "setCurrentValue:", v56);

        objc_msgSend(v51, "setSource:", objc_msgSend(v48, "source") == 1);
      }
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
    }
    while (v45);
  }

  if (-[NPKPaymentProvisioningFlowController _fieldsModelCompleteExceptForLocalFields:](self, "_fieldsModelCompleteExceptForLocalFields:", self->_fieldsModel))
  {
    -[PKPaymentSetupFieldsModel paymentSetupFields](self->_fieldsModel, "paymentSetupFields");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = self;
    v60 = v63;
    v59 = v64;
    -[NPKPaymentProvisioningFlowController _transitionToSecondaryManualEntryWithFields:credential:requestContext:](v58, "_transitionToSecondaryManualEntryWithFields:credential:requestContext:", v57, v64, v63);

  }
  else
  {
    v61 = self;
    v60 = v63;
    -[NPKPaymentProvisioningFlowController _performNextActionForProvisioningState:](v61, "_performNextActionForProvisioningState:", v63);
    v59 = v64;
  }

}

- (void)handleProductSelection:(id)a3 requestContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  PKPaymentProvisioningController *provisioningController;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  _BOOL4 v30;
  int v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  NPKAnalyticsEventEntriesForProduct(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BE6E9C8];
  NPKAnalyticsEventForProvisioningFlowClientInput(CFSTR("productSelection"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subject:sendEvent:", CFSTR("provisioning"), v10);

  pk_Payment_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "rawDictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138412546;
      v32 = (uint64_t)v6;
      v33 = 2112;
      v34 = (uint64_t)v14;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Handling product selection: %@ (%@)", (uint8_t *)&v31, 0x16u);

    }
  }
  if (self->_currentStep == 195)
  {
    if (v6)
    {
      pk_Payment_log();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

      if (v16)
      {
        pk_Payment_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "productIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[PKPaymentProvisioningController state](self->_provisioningController, "state");
          -[PKPaymentProvisioningController requirementsResponse](self->_provisioningController, "requirementsResponse");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "status");
          v31 = 138412802;
          v32 = (uint64_t)v18;
          v33 = 2048;
          v34 = v19;
          v35 = 2048;
          v36 = v21;
          _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: id %@ state %lu response status %lu", (uint8_t *)&v31, 0x20u);

        }
      }
      provisioningController = self->_provisioningController;
      objc_msgSend(v6, "productIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentProvisioningController resolveAmbiguousRequirementsWithProductIdentifier:](provisioningController, "resolveAmbiguousRequirementsWithProductIdentifier:", v23);

    }
    -[NPKPaymentProvisioningFlowController _requiredFieldsFromRequirementsResponseExcludingLocalFields](self, "_requiredFieldsFromRequirementsResponseExcludingLocalFields");
    v24 = objc_claimAutoreleasedReturnValue();
    pk_Payment_log();
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

    if (v26)
    {
      pk_Payment_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = -[NSObject count](v24, "count");
        v31 = 134217984;
        v32 = v28;
        _os_log_impl(&dword_213518000, v27, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Start secondary manual entry with %lu fields following product disambiguation.", (uint8_t *)&v31, 0xCu);
      }

    }
    -[NPKPaymentProvisioningFlowController _transitionToSecondaryManualEntryWithFields:credential:requestContext:](self, "_transitionToSecondaryManualEntryWithFields:credential:requestContext:", v24, 0, v7);
LABEL_20:

    goto LABEL_21;
  }
  pk_Payment_log();
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);

  if (v30)
  {
    pk_Payment_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v31) = 0;
      _os_log_impl(&dword_213518000, v24, OS_LOG_TYPE_ERROR, "Error: Not on product disambiguation step; cannot choose product!",
        (uint8_t *)&v31,
        2u);
    }
    goto LABEL_20;
  }
LABEL_21:

}

- (void)handlePasscodeUpgradeCompleteWithSuccess:(BOOL)a3 error:(id)a4 requestContext:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  _DWORD v15[2];
  __int16 v16;
  id v17;
  uint64_t v18;

  v6 = a3;
  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x24BE6E9C8];
  NPKAnalyticsEventForProvisioningFlowClientInput(CFSTR("passcodeUpgradeComplete"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subject:sendEvent:", CFSTR("provisioning"), v11);

  pk_Payment_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    pk_Payment_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15[0] = 67109378;
      v15[1] = v6;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Handling passcode upgrade complete with success: %d error: %@", (uint8_t *)v15, 0x12u);
    }

  }
  -[NPKPaymentProvisioningFlowController _handlePasscodeUpgradeCompleteWithSuccess:error:requestContext:](self, "_handlePasscodeUpgradeCompleteWithSuccess:error:requestContext:", v6, v8, v9);

}

- (void)acknowledgeAppleBalanceAccountDetailsWithProduct:(id)a3 requestContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BE6E9C8];
  NPKAnalyticsEventForProvisioningFlowClientInput(CFSTR("acknowledgeAppleBalanceAccountDetails"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subject:sendEvent:", CFSTR("provisioning"), v9);

  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v6;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Handling Apple Balance Account Details Acknowledged with product: %@", (uint8_t *)&v13, 0xCu);
    }

  }
  -[NPKPaymentProvisioningFlowController _handleAppleBalanceAccountDetailsAcknowledgedWithProduct:requestContext:](self, "_handleAppleBalanceAccountDetailsAcknowledgedWithProduct:requestContext:", v6, v7);

}

- (void)acceptTerms:(id)a3
{
  void *v4;
  void *v5;
  unint64_t termsReason;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)MEMORY[0x24BE6E9C8];
  NPKAnalyticsEventForProvisioningFlowClientInput(CFSTR("acceptTerms"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subject:sendEvent:", CFSTR("provisioning"), v5);

  termsReason = self->_termsReason;
  if (termsReason == 2)
  {
    -[NPKPaymentProvisioningFlowController _handleReaderModeTermsAccepted:](self, "_handleReaderModeTermsAccepted:", v8);
    goto LABEL_7;
  }
  if (termsReason == 1)
  {
    -[NPKPaymentProvisioningFlowController _handleDigitalIssuanceTermsAccepted:](self, "_handleDigitalIssuanceTermsAccepted:", v8);
    goto LABEL_7;
  }
  v7 = v8;
  if (!termsReason)
  {
    -[PKPaymentProvisioningController acceptTerms](self->_provisioningController, "acceptTerms");
    -[NPKPaymentProvisioningFlowController _performNextActionForProvisioningState:](self, "_performNextActionForProvisioningState:", v8);
LABEL_7:
    v7 = v8;
  }

}

- (void)skipProvisioning:(id)a3
{
  void *v4;
  void *v5;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x24BE6E9C8];
  NPKAnalyticsEventForProvisioningFlowClientInput(CFSTR("skipProvisioning"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subject:sendEvent:", CFSTR("provisioning"), v5);

  if ((self->_currentStep - 180) <= 0x14 && ((1 << (LOBYTE(self->_currentStep) + 76)) & 0x103401) != 0)
    -[NPKPaymentProvisioningFlowController _handleEndOfProvisioningFlowForCurrentPass:requestContext:](self, "_handleEndOfProvisioningFlowForCurrentPass:requestContext:", 0, v7);

}

- (void)acknowledgeMoreInformation:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];

  v4 = (void *)MEMORY[0x24BE6E9C8];
  v5 = a3;
  NPKAnalyticsEventForProvisioningFlowClientInput(CFSTR("acknowledgeMoreInformation"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subject:sendEvent:", CFSTR("provisioning"), v6);

  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: More information acknowledged", v11, 2u);
    }

  }
  -[PKPaymentProvisioningController provisionedPass](self->_provisioningController, "provisionedPass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowController _performNextStepForProvisionedPass:moreInfoAcknowledged:requestContext:](self, "_performNextStepForProvisionedPass:moreInfoAcknowledged:requestContext:", v10, 1, v5);

}

- (void)presentTransitServiceProviderProductsWithRequestContext:(id)a3
{
  -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", 145, a3);
}

- (void)startIssuerVerificationFlowForPaymentPass:(id)a3 requestContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int currentStep;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x24BE6E9C8];
  NPKAnalyticsEventForProvisioningFlowClientInput(CFSTR("startIssuerVerificationFlow"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subject:sendEvent:", CFSTR("provisioning"), v10);

  currentStep = self->_currentStep;
  pk_Payment_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (currentStep == 100)
  {
    v14 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      pk_Payment_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "uniqueID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412290;
        v20 = v16;
        _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: starting issuer verification flow for pass %@", (uint8_t *)&v19, 0xCu);

      }
    }
    objc_storeStrong((id *)&self->_issuerVerificationPass, a3);
    -[NPKPaymentProvisioningFlowController _requestVerificationOptionsForPass:context:](self, "_requestVerificationOptionsForPass:context:", v7, v8);
  }
  else
  {
    v17 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

    if (v17)
    {
      pk_Payment_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_213518000, v18, OS_LOG_TYPE_ERROR, "Error: Past initialization step; cannot start issuer verification flow!",
          (uint8_t *)&v19,
          2u);
      }

    }
  }

}

- (void)handleIssuerVerificationChannel:(id)a3 requestContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  NPKAnalyticsEventEntriesForVerificationChannel(v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BE6E9C8];
  NPKAnalyticsEventForProvisioningFlowClientInput(CFSTR("chooseIssuerVerificationChannel"), v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subject:sendEvent:", CFSTR("provisioning"), v9);

  -[NPKPaymentProvisioningFlowController _updateVerificationForPass:channel:context:](self, "_updateVerificationForPass:channel:context:", self->_issuerVerificationPass, v7, v6);
}

- (void)handleIssuerVerificationFields:(id)a3 requestContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  PKPaymentSetupFieldsModel *fieldsModel;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BE6E9C8];
  NPKAnalyticsEventForProvisioningFlowClientInput(CFSTR("issuerVerificationFields"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subject:sendEvent:", CFSTR("provisioning"), v9);

  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[PKPaymentSetupFieldsModel paymentSetupFields](self->_fieldsModel, "paymentSetupFields");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v30 = v6;
      v31 = 2112;
      v32 = v13;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Handling issuer verification fields: %@ with fields model fields: %@", buf, 0x16u);

    }
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = v6;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        fieldsModel = self->_fieldsModel;
        objc_msgSend(v19, "identifier", (_QWORD)v24);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](fieldsModel, "paymentSetupFieldWithIdentifier:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "currentValue");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setCurrentValue:", v23);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v16);
  }

  -[NPKPaymentProvisioningFlowController _handleVerificationFieldsForPass:context:](self, "_handleVerificationFieldsForPass:context:", self->_issuerVerificationPass, v7);
}

- (void)handleIssuerVerificationCode:(id)a3 requestContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BE6E9C8];
  NPKAnalyticsEventForProvisioningFlowClientInput(CFSTR("issuerVerificationCode"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subject:sendEvent:", CFSTR("provisioning"), v9);

  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134217984;
      v14 = objc_msgSend(v6, "length");
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Handling issuer verification code of length %lu", (uint8_t *)&v13, 0xCu);
    }

  }
  -[NPKPaymentProvisioningFlowController _handleVerificationCode:forPass:context:](self, "_handleVerificationCode:forPass:context:", v6, self->_issuerVerificationPass, v7);

}

- (void)skipIssuerVerification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint8_t v11[16];

  v4 = a3;
  v5 = (void *)MEMORY[0x24BE6E9C8];
  NPKAnalyticsEventForProvisioningFlowClientInput(CFSTR("skipIssuerVerification"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subject:sendEvent:", CFSTR("provisioning"), v6);

  if ((self->_currentStep - 230) > 0x14 || ((1 << (LOBYTE(self->_currentStep) + 26)) & 0x100401) == 0)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

    if (v9)
    {
      pk_Payment_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_ERROR, "Error: Not on an issuer verification step; cannot skip issuer verification!",
          v11,
          2u);
      }

    }
  }
  else
  {
    -[NPKPaymentProvisioningFlowController _handleEndOfProvisioningFlowForCurrentPass:requestContext:](self, "_handleEndOfProvisioningFlowForCurrentPass:requestContext:", self->_issuerVerificationPass, v4);
  }

}

- (void)startInAppProvisioningFlowWithConfiguration:(id)a3 requestContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  int currentStep;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x24BE6E9C8];
  NPKAnalyticsEventForProvisioningFlowClientInput(CFSTR("startInAppProvisioningFlow"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subject:sendEvent:", CFSTR("provisioning"), v10);

  currentStep = self->_currentStep;
  pk_Payment_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (currentStep == 100)
  {
    v14 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      pk_Payment_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138412290;
        v19 = v7;
        _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: starting in-app provisioning flow with configuration %@", (uint8_t *)&v18, 0xCu);
      }

    }
    objc_storeStrong((id *)&self->_inAppProvisioningRequestConfiguration, a3);
    -[NPKPaymentProvisioningFlowController _handleProvisioningFlowStarted:](self, "_handleProvisioningFlowStarted:", v8);
  }
  else
  {
    v16 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

    if (v16)
    {
      pk_Payment_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_ERROR, "Error: Past initialization step; cannot start issuer verification flow!",
          (uint8_t *)&v18,
          2u);
      }

    }
  }

}

- (void)handleIssuerApplicationAddRequest:(id)a3 requestContext:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *inAppProvisioningGetRequestTimer;
  OS_dispatch_source *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  int v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x24BE6E9C8];
  NPKAnalyticsEventForProvisioningFlowClientInput(CFSTR("issuerApplicationAddRequest"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subject:sendEvent:", CFSTR("provisioning"), v10);

  pk_Payment_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v7;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Handling issuer add request %@", (uint8_t *)&v20, 0xCu);
    }

  }
  if (self->_currentStep == 300)
  {
    if (v7)
    {
      inAppProvisioningGetRequestTimer = self->_inAppProvisioningGetRequestTimer;
      if (inAppProvisioningGetRequestTimer)
      {
        dispatch_source_cancel(inAppProvisioningGetRequestTimer);
        v15 = self->_inAppProvisioningGetRequestTimer;
        self->_inAppProvisioningGetRequestTimer = 0;

      }
      objc_storeStrong((id *)&self->_inAppProvisioningRequest, a3);
      objc_msgSend(v7, "setPublicKeyHash:", self->_inAppProvisioningPublicKeyHash);
      objc_msgSend(v7, "setNonce:", self->_inAppProvisioningNonce);
      -[NPKPaymentProvisioningFlowController _performNextActionForProvisioningState:](self, "_performNextActionForProvisioningState:", v8);
    }
    else
    {
      PKDisplayableErrorForCommonType();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKPaymentProvisioningFlowController _endProvisioningFlowWithError:requestContext:](self, "_endProvisioningFlowWithError:requestContext:", v19, v8);

    }
  }
  else
  {
    pk_Payment_log();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);

    if (v17)
    {
      pk_Payment_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_213518000, v18, OS_LOG_TYPE_ERROR, "Error: Not on get issuer add request step; cannot handle request!",
          (uint8_t *)&v20,
          2u);
      }

    }
  }

}

- (void)_performRequirementsOrEligibilityForInAppProvisioning:(id)a3
{
  if (self->_inAppProvisioningRequest)
    -[NPKPaymentProvisioningFlowController _performEligibility:](self, "_performEligibility:", a3);
  else
    -[NPKPaymentProvisioningFlowController _fetchInAppProvisioningCertificates:](self, "_fetchInAppProvisioningCertificates:", a3);
}

- (void)_fetchInAppProvisioningCertificates:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  PKPaymentWebService *webService;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x24BE6ECB8]);
  -[PKAddPaymentPassRequestConfiguration encryptionScheme](self->_inAppProvisioningRequestConfiguration, "encryptionScheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithEncryptionScheme:", v6);

  webService = self->_webService;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __76__NPKPaymentProvisioningFlowController__fetchInAppProvisioningCertificates___block_invoke;
  v10[3] = &unk_24CFE8DA0;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  -[PKPaymentWebService issuerProvisioningCertificatesForRequest:withCompletion:](webService, "issuerProvisioningCertificatesForRequest:withCompletion:", v7, v10);

}

void __76__NPKPaymentProvisioningFlowController__fetchInAppProvisioningCertificates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __76__NPKPaymentProvisioningFlowController__fetchInAppProvisioningCertificates___block_invoke_2;
  v11[3] = &unk_24CFE8D78;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = v5;
  v13 = v7;
  v14 = v8;
  v15 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

void __76__NPKPaymentProvisioningFlowController__fetchInAppProvisioningCertificates___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    v4 = *(void **)(v3 + 104);
    objc_msgSend(v2, "nonce");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __76__NPKPaymentProvisioningFlowController__fetchInAppProvisioningCertificates___block_invoke_3;
    v16[3] = &unk_24CFE8D50;
    v6 = *(id *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    v17 = v6;
    v18 = v7;
    v19 = v8;
    v20 = *(id *)(a1 + 56);
    objc_msgSend(v4, "signNonce:withCompletion:", v5, v16);

    v9 = v17;
  }
  else
  {
    objc_msgSend(*(id *)(v3 + 24), "displayableErrorForProvisioningError:", *(_QWORD *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      PKDisplayableErrorForCommonType();
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v12;

    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      pk_Payment_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v9;
        _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: No response from issuer provisioning certificates endpoint: %@", buf, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "_sendDidEncounterError:requestContext:", v9, *(_QWORD *)(a1 + 48));
  }

}

void __76__NPKPaymentProvisioningFlowController__fetchInAppProvisioningCertificates___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__NPKPaymentProvisioningFlowController__fetchInAppProvisioningCertificates___block_invoke_4;
  block[3] = &unk_24CFE82D8;
  v9 = v3;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v10 = v4;
  v11 = v5;
  v12 = v6;
  v13 = *(id *)(a1 + 56);
  v7 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __76__NPKPaymentProvisioningFlowController__fetchInAppProvisioningCertificates___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setNonceSignature:");
    objc_msgSend(*(id *)(a1 + 48), "_fetchAddRequestWithCertificatesResponse:requestContext:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "displayableErrorForProvisioningError:", *(_QWORD *)(a1 + 64));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      v4 = v2;
    }
    else
    {
      PKDisplayableErrorForCommonType();
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;

    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      pk_Payment_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138412290;
        v10 = v5;
        _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: No response from issuer provisioning certificates endpoint: %@", (uint8_t *)&v9, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 48), "_sendDidEncounterError:requestContext:", v5, *(_QWORD *)(a1 + 56));

  }
}

- (void)_fetchAddRequestWithCertificatesResponse:(id)a3 requestContext:(id)a4
{
  id v6;
  id v7;
  NSObject *inAppProvisioningGetRequestTimer;
  OS_dispatch_source *v9;
  OS_dispatch_source *v10;
  OS_dispatch_source *v11;
  NSObject *v12;
  dispatch_time_t v13;
  NSObject *v14;
  id v15;
  NSData *v16;
  NSData *inAppProvisioningPublicKeyHash;
  NSData *v18;
  NSData *inAppProvisioningNonce;
  NPKPaymentProvisioningFlowControllerGetIssuerApplicationAddRequestStepContext *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  NPKPaymentProvisioningFlowController *v28;
  id v29;

  v6 = a3;
  v7 = a4;
  inAppProvisioningGetRequestTimer = self->_inAppProvisioningGetRequestTimer;
  if (inAppProvisioningGetRequestTimer)
  {
    dispatch_source_cancel(inAppProvisioningGetRequestTimer);
    v9 = self->_inAppProvisioningGetRequestTimer;
    self->_inAppProvisioningGetRequestTimer = 0;

  }
  v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
  v11 = self->_inAppProvisioningGetRequestTimer;
  self->_inAppProvisioningGetRequestTimer = v10;

  v12 = self->_inAppProvisioningGetRequestTimer;
  v13 = dispatch_time(0, 20000000000);
  dispatch_source_set_timer(v12, v13, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  v14 = self->_inAppProvisioningGetRequestTimer;
  v24 = MEMORY[0x24BDAC760];
  v25 = 3221225472;
  v26 = __96__NPKPaymentProvisioningFlowController__fetchAddRequestWithCertificatesResponse_requestContext___block_invoke;
  v27 = &unk_24CFE7E40;
  v28 = self;
  v29 = v7;
  v15 = v7;
  dispatch_source_set_event_handler(v14, &v24);
  dispatch_resume((dispatch_object_t)self->_inAppProvisioningGetRequestTimer);
  objc_msgSend(v6, "publicKeyHash", v24, v25, v26, v27, v28);
  v16 = (NSData *)objc_claimAutoreleasedReturnValue();
  inAppProvisioningPublicKeyHash = self->_inAppProvisioningPublicKeyHash;
  self->_inAppProvisioningPublicKeyHash = v16;

  objc_msgSend(v6, "nonce");
  v18 = (NSData *)objc_claimAutoreleasedReturnValue();
  inAppProvisioningNonce = self->_inAppProvisioningNonce;
  self->_inAppProvisioningNonce = v18;

  v20 = -[NPKPaymentProvisioningFlowControllerGetIssuerApplicationAddRequestStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerGetIssuerApplicationAddRequestStepContext alloc], "initWithRequestContext:", v15);
  objc_msgSend(v6, "certificates");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowControllerGetIssuerApplicationAddRequestStepContext setCertificates:](v20, "setCertificates:", v21);

  objc_msgSend(v6, "nonce");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowControllerGetIssuerApplicationAddRequestStepContext setNonce:](v20, "setNonce:", v22);

  objc_msgSend(v6, "nonceSignature");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowControllerGetIssuerApplicationAddRequestStepContext setNonceSignature:](v20, "setNonceSignature:", v23);

  -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", 300, v20);
}

uint64_t __96__NPKPaymentProvisioningFlowController__fetchAddRequestWithCertificatesResponse_requestContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v8[16];

  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: In-app provisioning timed out waiting for response from client", v8, 2u);
    }

  }
  v5 = *(void **)(a1 + 32);
  PKDisplayableErrorForCommonType();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_endProvisioningFlowWithError:requestContext:", v6, *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

- (void)_handleProvisioningFlowStarted:(id)a3
{
  id v4;
  NPKPaymentProvisioningFlowControllerPreconditionsStepContext *v5;
  PKPaymentWebService *webService;
  uint64_t v7;
  NPKPaymentProvisioningFlowControllerPreconditionsStepContext *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  NPKPaymentProvisioningFlowControllerPreconditionsStepContext *v12;
  uint64_t v13;

  v4 = a3;
  v5 = -[NPKPaymentProvisioningFlowControllerPreconditionsStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerPreconditionsStepContext alloc], "initWithRequestContext:", v4);
  objc_storeStrong((id *)&self->_preconditionsRequestContext, v5);
  -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", 110, v5);
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  webService = self->_webService;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __71__NPKPaymentProvisioningFlowController__handleProvisioningFlowStarted___block_invoke;
  v10[3] = &unk_24CFE8E68;
  v10[4] = self;
  v11 = v4;
  v12 = v5;
  v13 = v7;
  v8 = v5;
  v9 = v4;
  -[NPKPaymentProvisioningFlowController _configureWebServiceIfNecessary:completion:](self, "_configureWebServiceIfNecessary:completion:", webService, v10);

}

void __71__NPKPaymentProvisioningFlowController__handleProvisioningFlowStarted___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  _QWORD *v28;
  _QWORD v29[3];
  char v30;

  v5 = a3;
  if (a2 == 1)
  {
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v30 = 0;
    v25[2] = __71__NPKPaymentProvisioningFlowController__handleProvisioningFlowStarted___block_invoke_2;
    v25[3] = &unk_24CFE8DC8;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v28 = v29;
    v25[4] = v6;
    v8 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v26 = v7;
    v27 = *(id *)(a1 + 48);
    v9 = (void *)MEMORY[0x2199B6780](v25);
    v21[0] = v8;
    v21[1] = 3221225472;
    v21[2] = __71__NPKPaymentProvisioningFlowController__handleProvisioningFlowStarted___block_invoke_3;
    v21[3] = &unk_24CFE8DF0;
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    v24 = v29;
    v21[4] = v10;
    v22 = v11;
    v23 = *(id *)(a1 + 48);
    v12 = (void *)MEMORY[0x2199B6780](v21);
    v13 = *(void **)(a1 + 32);
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __71__NPKPaymentProvisioningFlowController__handleProvisioningFlowStarted___block_invoke_4;
    v17[3] = &unk_24CFE8E40;
    v17[4] = v13;
    v14 = v9;
    v18 = v14;
    v20 = *(_QWORD *)(a1 + 56);
    v15 = v12;
    v19 = v15;
    objc_msgSend(v13, "_verifyPasscodeStateIfNecessaryWithCompletion:", v17);

    _Block_object_dispose(v29, 8);
  }
  else
  {
    PKDisplayableErrorForCommonType();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_endProvisioningFlowWithError:requestContext:", v16, *(_QWORD *)(a1 + 40));

  }
}

void __71__NPKPaymentProvisioningFlowController__handleProvisioningFlowStarted___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (a2)
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "_handlePreconditionsVerified:", *(_QWORD *)(a1 + 40));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    }
    objc_msgSend(*(id *)(a1 + 48), "setPreconditionsState:", 2);
    objc_msgSend(*(id *)(a1 + 32), "_performTransitionToStep:withContext:", 110, *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (v5)
    {
      v6 = v5;
    }
    else
    {
      PKDisplayableErrorForCommonType();
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "_endProvisioningFlowWithError:requestContext:", v6, *(_QWORD *)(a1 + 40));

  }
}

uint64_t __71__NPKPaymentProvisioningFlowController__handleProvisioningFlowStarted___block_invoke_3(uint64_t a1)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "_handlePreconditionsVerified:", *(_QWORD *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  objc_msgSend(*(id *)(a1 + 48), "setPreconditionsState:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_performTransitionToStep:withContext:", 110, *(_QWORD *)(a1 + 48));
}

void __71__NPKPaymentProvisioningFlowController__handleProvisioningFlowStarted___block_invoke_4(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    if (*(_QWORD *)(v6 + 56))
    {
      objc_msgSend(*(id *)(v6 + 24), "validatePreconditionsAndRegister:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __71__NPKPaymentProvisioningFlowController__handleProvisioningFlowStarted___block_invoke_5;
      v8[3] = &unk_24CFE8E18;
      v8[4] = v6;
      v9 = *(id *)(a1 + 40);
      v11 = 45;
      v12 = *(_QWORD *)(a1 + 56);
      v13 = 13;
      v10 = *(id *)(a1 + 48);
      objc_msgSend(v7, "preflightWithRequirements:update:", 45, v8);

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __71__NPKPaymentProvisioningFlowController__handleProvisioningFlowStarted___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void (*v8)(void);
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  int v21;
  const char *v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (v5)
  {
    if (objc_msgSend(v5, "code") != 5
      || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "webService"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "paymentSetupSupportedInRegion"),
          v6,
          v7 != 1))
    {
      v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_11:
      v8();
      goto LABEL_12;
    }
LABEL_10:
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_11;
  }
  if ((*(_QWORD *)(a1 + 56) & ~a2) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v10 = v9;
    v11 = *(double *)(a1 + 64);
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      pk_Payment_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 136315394;
        v22 = "-[NPKPaymentProvisioningFlowController _handleProvisioningFlowStarted:]_block_invoke_5";
        v23 = 2048;
        v24 = v10 - v11;
        _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: %s: time taken to all requirements = %fs", (uint8_t *)&v21, 0x16u);
      }

    }
    goto LABEL_10;
  }
  if ((*(_QWORD *)(a1 + 72) & ~a2) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
    v16 = v15;
    v17 = *(double *)(a1 + 64);
    pk_Payment_log();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (v19)
    {
      pk_Payment_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = 136315394;
        v22 = "-[NPKPaymentProvisioningFlowController _handleProvisioningFlowStarted:]_block_invoke";
        v23 = 2048;
        v24 = v16 - v17;
        _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_DEFAULT, "Notice: %s: time taken to min requirements = %fs", (uint8_t *)&v21, 0x16u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
LABEL_12:

}

- (void)_handlePreconditionsVerified:(id)a3
{
  id v4;
  NPKPaymentProvisioningFlowControllerWelcomeStepContext *v5;

  v4 = a3;
  v5 = -[NPKPaymentProvisioningFlowControllerWelcomeStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerWelcomeStepContext alloc], "initWithRequestContext:", v4);

  -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", 120, v5);
}

- (void)_handleProductChosen:(id)a3 includeCardsOnFile:(BOOL)a4 requestContext:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  _BOOL8 v13;
  PKPaymentProvisioningController *provisioningController;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  BOOL v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v8;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Product chosen: %@", buf, 0xCu);
    }

  }
  v13 = !NPKPaymentProvisioningSetupContextIsSetupAssistant(self->_setupContext);
  provisioningController = self->_provisioningController;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __95__NPKPaymentProvisioningFlowController__handleProductChosen_includeCardsOnFile_requestContext___block_invoke;
  v17[3] = &unk_24CFE8E90;
  v17[4] = self;
  v18 = v8;
  v20 = a4;
  v19 = v9;
  v15 = v9;
  v16 = v8;
  -[PKPaymentProvisioningController setupProductForProvisioning:includePurchases:withCompletionHandler:](provisioningController, "setupProductForProvisioning:includePurchases:withCompletionHandler:", v16, v13, v17);

}

void __95__NPKPaymentProvisioningFlowController__handleProductChosen_includeCardsOnFile_requestContext___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (a2)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 184), *(id *)(a1 + 40));
    if (*(_BYTE *)(a1 + 56))
      v9 = v8;
    else
      v9 = 0;
    objc_msgSend(*(id *)(a1 + 32), "_transitionBasedOnCredentials:product:requestContext:", v9, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      pk_Payment_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138412290;
        v14 = v7;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Error occurred when setting up product for provisioning: %@", (uint8_t *)&v13, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "_sendDidEncounterError:requestContext:", v7, *(_QWORD *)(a1 + 48));
  }

}

- (void)_handleAppleBalanceProductChosen:(id)a3 requestContext:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  pk_Payment_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    pk_Payment_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v7;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Apple Balance product chosen. Requesting resolve local eligibility with product: %@", buf, 0xCu);
    }

  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6E9E0]), "initWithProduct:eligibilitySource:", v7, 1);
  -[NPKPaymentProvisioningFlowController setCurrentAppleBalanceCredential:](self, "setCurrentAppleBalanceCredential:", v12);

  objc_storeStrong((id *)&self->_currentProduct, a3);
  -[NPKPaymentProvisioningFlowController provisioningController](self, "provisioningController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowController currentAppleBalanceCredential](self, "currentAppleBalanceCredential");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __88__NPKPaymentProvisioningFlowController__handleAppleBalanceProductChosen_requestContext___block_invoke;
  v17[3] = &unk_24CFE8EB8;
  v17[4] = self;
  v18 = v8;
  v19 = v7;
  v15 = v7;
  v16 = v8;
  objc_msgSend(v13, "resolveLocalEligibilityRequirementsForAppleBalanceCredential:withCompletion:", v14, v17);

}

void __88__NPKPaymentProvisioningFlowController__handleAppleBalanceProductChosen_requestContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEBUG, "Debug: Standalone: Apple Balance. Local eligibility resolved. Error: %@", buf, 0xCu);
    }

  }
  v7 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __88__NPKPaymentProvisioningFlowController__handleAppleBalanceProductChosen_requestContext___block_invoke_78;
  v19[3] = &unk_24CFE8EB8;
  v8 = *(void **)(a1 + 40);
  v19[4] = *(_QWORD *)(a1 + 32);
  v20 = v8;
  v21 = *(id *)(a1 + 48);
  v9 = MEMORY[0x2199B6780](v19);
  v10 = (void *)v9;
  if (v3)
  {
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v3);
  }
  else
  {
    v11 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newPaymentEligibilityRequest");
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      pk_Payment_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Apple Balance. Requesting eligibility", buf, 2u);
      }

    }
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 24);
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __88__NPKPaymentProvisioningFlowController__handleAppleBalanceProductChosen_requestContext___block_invoke_80;
    v17[3] = &unk_24CFE8EE0;
    v17[4] = v15;
    v18 = v10;
    objc_msgSend(v16, "requestEligibility:withCompletionHandler:", v11, v17);

  }
}

void __88__NPKPaymentProvisioningFlowController__handleAppleBalanceProductChosen_requestContext___block_invoke_78(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __88__NPKPaymentProvisioningFlowController__handleAppleBalanceProductChosen_requestContext___block_invoke_2;
  v7[3] = &unk_24CFE8D78;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v11 = *(id *)(a1 + 48);
  v6 = v3;
  NPKGuaranteeMainThread(v7);

}

uint64_t __88__NPKPaymentProvisioningFlowController__handleAppleBalanceProductChosen_requestContext___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3)
    return objc_msgSend(v2, "_sendDidEncounterError:requestContext:", v3, a1[6]);
  else
    return objc_msgSend(v2, "_transitionToAppleBalanceAccountDetailsWithProduct:requestContext:", a1[7], a1[6]);
}

void __88__NPKPaymentProvisioningFlowController__handleAppleBalanceProductChosen_requestContext___block_invoke_80(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a2;
  pk_Payment_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v5;
      _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Apple Balance. Eligibility resolved. Error: %@", buf, 0xCu);
    }

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setEligibilityResponse:", v6);
  objc_msgSend(v6, "eligibilityStatus");

  PKProvisioningErrorForAppleBalanceEligibilityStatus();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6E970], "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __88__NPKPaymentProvisioningFlowController__handleAppleBalanceProductChosen_requestContext___block_invoke_82;
    v12[3] = &unk_24CFE7940;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v11, "validateAppleBalanceSecurityRequirementsWithCompletion:", v12);

  }
}

void __88__NPKPaymentProvisioningFlowController__handleAppleBalanceProductChosen_requestContext___block_invoke_82(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      pk_Payment_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v12 = 138412290;
        v13 = v5;
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_ERROR, "Error: Standalone: Apple Balance security requirements not met. Could not verify/setup Apple Pay cloud store container. Error: %@", (uint8_t *)&v12, 0xCu);
      }

    }
    PKLocalizedPaymentString(CFSTR("COULD_NOT_SET_UP_TITLE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("COULD_NOT_SET_UP_MESSAGE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKDisplayableErrorCustom();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_handleAppleBalanceAccountDetailsAcknowledgedWithProduct:(id)a3 requestContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Apple Balance. Acknowledged account details with product: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  -[NPKPaymentProvisioningFlowController _performNextActionForProvisioningState:](self, "_performNextActionForProvisioningState:", v7);

}

- (void)_handleProceedWithCredentials:(id)a3 chosenByUser:(BOOL)a4 requestContext:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  int v18;
  id v19;
  uint64_t v20;

  v6 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v8;
      _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Credentials chosen: %@", (uint8_t *)&v18, 0xCu);
    }

  }
  if (v6)
  {
    -[PKPaymentProvisioningController credentialProvisioningQueue](self->_provisioningController, "credentialProvisioningQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCredentialsToProvision:", v8);
    objc_msgSend(v13, "nextCredentialToProvision");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if ((unint64_t)objc_msgSend(v8, "count") >= 2)
    {
      pk_Payment_log();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);

      if (v16)
      {
        pk_Payment_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_ERROR, "Error: >1 credentials when not chosen by user!", (uint8_t *)&v18, 2u);
        }

      }
    }
    objc_msgSend(v8, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[NPKPaymentProvisioningFlowController _startProvisioningForCredential:requestContext:](self, "_startProvisioningForCredential:requestContext:", v14, v9);

}

- (void)_startProvisioningForCredential:(id)a3 requestContext:(id)a4
{
  id v7;
  id v8;
  id v9;
  PKPaymentSetupFieldsModel *v10;
  PKPaymentSetupFieldsModel *fieldsModel;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  NPKPaymentProvisioningFlowController *v16;
  id v17;

  v7 = a3;
  v8 = a4;
  objc_storeStrong((id *)&self->_currentCredential, a3);
  v9 = objc_alloc(MEMORY[0x24BE6ED50]);
  v10 = (PKPaymentSetupFieldsModel *)objc_msgSend(v9, "initWithPaymentSetupFields:", MEMORY[0x24BDBD1A8]);
  fieldsModel = self->_fieldsModel;
  self->_fieldsModel = v10;

  if (objc_msgSend(v7, "isAccountCredential"))
  {
    objc_msgSend(v7, "accountCredential");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __87__NPKPaymentProvisioningFlowController__startProvisioningForCredential_requestContext___block_invoke;
    v14[3] = &unk_24CFE8F08;
    v15 = v12;
    v16 = self;
    v17 = v8;
    v13 = v12;
    -[NPKPaymentProvisioningFlowController _requestPassDetailsForAccountCredential:withCompletionHandler:](self, "_requestPassDetailsForAccountCredential:withCompletionHandler:", v13, v14);

  }
  else
  {
    -[NPKPaymentProvisioningFlowController _requestRequirements:](self, "_requestRequirements:", v8);
  }

}

void __87__NPKPaymentProvisioningFlowController__startProvisioningForCredential_requestContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 40), "_sendDidEncounterError:requestContext:", a3, *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "passDetailsResponse");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "status");

    if (v5 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "account");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "creditDetails");
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        if ((objc_msgSend(v8, "termsAcceptanceRequired") & 1) == 0)
          objc_msgSend(*(id *)(a1 + 40), "setTermsAcceptedOutOfBand:", 1);
      }
      objc_msgSend(*(id *)(a1 + 40), "_requestRequirements:", *(_QWORD *)(a1 + 48));
    }
    else
    {
      v7 = *(void **)(a1 + 40);
      PKDisplayableErrorForCommonType();
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_sendDidEncounterError:requestContext:", v8, *(_QWORD *)(a1 + 48));
    }

  }
}

- (void)_performNextActionForProvisioningState:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[PKPaymentProvisioningController state](self->_provisioningController, "state");
  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 134217984;
      v19 = v5;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: current State is %ld", (uint8_t *)&v18, 0xCu);
    }

  }
  -[NPKPaymentProvisioningFlowController _noteProvisioningStateChangeForReaderMode:](self, "_noteProvisioningStateChangeForReaderMode:", v5);
  switch(v5)
  {
    case 0:
      if (self->_inAppProvisioningRequestConfiguration)
        goto LABEL_13;
      -[NPKPaymentProvisioningFlowController _requestRequirements:](self, "_requestRequirements:", v4);
      break;
    case 1:
      if (self->_inAppProvisioningRequestConfiguration)
LABEL_13:
        -[NPKPaymentProvisioningFlowController _performRequirementsOrEligibilityForInAppProvisioning:](self, "_performRequirementsOrEligibilityForInAppProvisioning:", v4);
      else
        -[NPKPaymentProvisioningFlowController _performEligibility:](self, "_performEligibility:", v4);
      break;
    case 2:
      if (-[NPKPaymentProvisioningFlowController _isPasscodeUpgradeRequired](self, "_isPasscodeUpgradeRequired"))
      {
        -[NPKPaymentProvisioningFlowController _performPasscodeUpgrade:](self, "_performPasscodeUpgrade:", v4);
      }
      else
      {
        pk_Payment_log();
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

        if (v16)
        {
          pk_Payment_log();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v18) = 0;
            _os_log_impl(&dword_213518000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Skipping passcode upgrade", (uint8_t *)&v18, 2u);
          }

        }
        -[NPKPaymentProvisioningFlowController _handlePasscodeUpgradeCompleteWithSuccess:error:requestContext:](self, "_handlePasscodeUpgradeCompleteWithSuccess:error:requestContext:", 1, 0, v4);
      }
      break;
    case 3:
      -[NPKPaymentProvisioningFlowController _performTerms:](self, "_performTerms:", v4);
      break;
    case 4:
      -[NPKPaymentProvisioningFlowController _performProvision:](self, "_performProvision:", v4);
      break;
    case 5:
      -[NPKPaymentProvisioningFlowController _handleFinished:](self, "_handleFinished:", v4);
      break;
    default:
      pk_Payment_log();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

      if (v10)
      {
        pk_Payment_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v12 = (objc_class *)objc_opt_class();
          NSStringFromClass(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          PKPaymentProvisioningControllerStateToString();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543618;
          v19 = (uint64_t)v13;
          v20 = 2114;
          v21 = v14;
          _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Warning: Error: %{public}@ does not know how to handle provisioning state : %{public}@.", (uint8_t *)&v18, 0x16u);

        }
      }
      break;
  }

}

- (id)_newPaymentRequirementsRequest
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  PKPaymentCredential *currentCredential;
  id v7;
  PKPaymentCredential *v8;
  PKAppleBalanceCredential *currentAppleBalanceCredential;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  PKAppleBalanceCredential *v13;
  void *v14;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  PKPaymentCredential *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (self->_currentCredential)
  {
    pk_Payment_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      pk_Payment_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        currentCredential = self->_currentCredential;
        v22 = 138412290;
        v23 = currentCredential;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Forming payment requirements request from current credential %@", (uint8_t *)&v22, 0xCu);
      }

    }
    v7 = objc_alloc(MEMORY[0x24BE6ED28]);
    v8 = self->_currentCredential;
    return (id)objc_msgSend(v7, "initWithPaymentCredential:", v8);
  }
  currentAppleBalanceCredential = self->_currentAppleBalanceCredential;
  pk_Payment_log();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (currentAppleBalanceCredential)
  {
    if (v11)
    {
      pk_Payment_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = self->_currentAppleBalanceCredential;
        v22 = 138412290;
        v23 = v13;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Forming payment requirements request from current Apple Balance credential %@", (uint8_t *)&v22, 0xCu);
      }

    }
    v7 = objc_alloc(MEMORY[0x24BE6ED28]);
    v8 = self->_currentAppleBalanceCredential;
    return (id)objc_msgSend(v7, "initWithPaymentCredential:", v8);
  }
  if (v11)
  {
    pk_Payment_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_DEFAULT, "Notice: Forming payment requirements request from fields model", (uint8_t *)&v22, 2u);
    }

  }
  v17 = objc_alloc(MEMORY[0x24BE6ED28]);
  -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self->_fieldsModel, "paymentSetupFieldWithIdentifier:", *MEMORY[0x24BE6F728]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "submissionString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self->_fieldsModel, "paymentSetupFieldWithIdentifier:", *MEMORY[0x24BE6F730]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "submissionString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v17, "initWithCardholderName:primaryAccountNumber:", v19, v21);

  return v14;
}

- (id)_newPaymentEligibilityRequest
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  PKAddPaymentPassRequest *inAppProvisioningRequest;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  PKPaymentCredential *currentCredential;
  id v23;
  PKPaymentCredential *v24;
  PKAppleBalanceCredential *currentAppleBalanceCredential;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  PKAppleBalanceCredential *v29;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  if (self->_inAppProvisioningRequest)
  {
    pk_Payment_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      pk_Payment_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        inAppProvisioningRequest = self->_inAppProvisioningRequest;
        v47 = 138412290;
        v48 = inAppProvisioningRequest;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Forming payment eligibility request from in-app provisioning request %@", (uint8_t *)&v47, 0xCu);
      }

    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6EC98]), "initWithSource:", 2);
    -[PKAddPaymentPassRequest encryptionVersion](self->_inAppProvisioningRequest, "encryptionVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEncryptionVersion:", v8);

    -[PKAddPaymentPassRequest encryptedPassData](self->_inAppProvisioningRequest, "encryptedPassData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEncryptedCardData:", v9);

    -[PKAddPaymentPassRequest publicKeyHash](self->_inAppProvisioningRequest, "publicKeyHash");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPublicKeyHash:", v10);

    -[PKAddPaymentPassRequest ephemeralPublicKey](self->_inAppProvisioningRequest, "ephemeralPublicKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEphemeralPublicKey:", v11);

    -[PKAddPaymentPassRequest wrappedKey](self->_inAppProvisioningRequest, "wrappedKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWrappedKey:", v12);

    -[PKAddPaymentPassRequest issuerIdentifier](self->_inAppProvisioningRequest, "issuerIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIssuerIdentifier:", v13);

    -[PKAddPaymentPassRequest hostApplicationIdentifier](self->_inAppProvisioningRequest, "hostApplicationIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHostApplicationIdentifier:", v14);

    -[PKAddPaymentPassRequest hostApplicationVersion](self->_inAppProvisioningRequest, "hostApplicationVersion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHostApplicationVersion:", v15);

    -[PKAddPaymentPassRequest FPInfo](self->_inAppProvisioningRequest, "FPInfo");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFPInfo:", v16);

    -[PKAddPaymentPassRequest nonce](self->_inAppProvisioningRequest, "nonce");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hexEncoding");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setNonce:", v18);

    return v7;
  }
  if (self->_currentCredential)
  {
    pk_Payment_log();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);

    if (v20)
    {
      pk_Payment_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        currentCredential = self->_currentCredential;
        v47 = 138412290;
        v48 = currentCredential;
        _os_log_impl(&dword_213518000, v21, OS_LOG_TYPE_DEFAULT, "Notice: Forming payment eligibility request from current credential %@", (uint8_t *)&v47, 0xCu);
      }

    }
    v23 = objc_alloc(MEMORY[0x24BE6EC98]);
    v24 = self->_currentCredential;
    return (id)objc_msgSend(v23, "initWithPaymentCredential:", v24);
  }
  currentAppleBalanceCredential = self->_currentAppleBalanceCredential;
  pk_Payment_log();
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

  if (currentAppleBalanceCredential)
  {
    if (v27)
    {
      pk_Payment_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = self->_currentAppleBalanceCredential;
        v47 = 138412290;
        v48 = v29;
        _os_log_impl(&dword_213518000, v28, OS_LOG_TYPE_DEFAULT, "Notice: Forming payment eligibility request from current Apple Balance credential %@", (uint8_t *)&v47, 0xCu);
      }

    }
    v23 = objc_alloc(MEMORY[0x24BE6EC98]);
    v24 = self->_currentAppleBalanceCredential;
    return (id)objc_msgSend(v23, "initWithPaymentCredential:", v24);
  }
  if (v27)
  {
    pk_Payment_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v47) = 0;
      _os_log_impl(&dword_213518000, v31, OS_LOG_TYPE_DEFAULT, "Notice: Forming payment eligibility request from fields model", (uint8_t *)&v47, 2u);
    }

  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6EC98]), "initWithSource:", 1);
  -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self->_fieldsModel, "paymentSetupFieldWithIdentifier:", *MEMORY[0x24BE6F728]);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "submissionString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCardholderName:", v33);

  if (objc_msgSend(v32, "source") == 1)
    v34 = 2;
  else
    v34 = 1;
  objc_msgSend(v7, "setCardholderNameInputMethod:", v34);
  -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self->_fieldsModel, "paymentSetupFieldWithIdentifier:", *MEMORY[0x24BE6F730]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "submissionString");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPrimaryAccountNumber:", v36);

  if (objc_msgSend(v35, "source") == 1)
    v37 = 2;
  else
    v37 = 1;
  objc_msgSend(v7, "setPrimaryAccountNumberInputMethod:", v37);
  -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self->_fieldsModel, "paymentSetupFieldWithIdentifier:", *MEMORY[0x24BE6F710]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "submissionString");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExpiration:", v39);

  if (objc_msgSend(v38, "source") == 1)
    v40 = 2;
  else
    v40 = 1;
  objc_msgSend(v7, "setExpirationInputMethod:", v40);
  -[PKPaymentProvisioningController productIdentifier](self->_provisioningController, "productIdentifier");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProductIdentifier:", v41);

  -[NPKPaymentProvisioningFlowController fieldsModel](self, "fieldsModel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = *MEMORY[0x24BE6F740];
  objc_msgSend(v42, "submissionValuesForDestination:", *MEMORY[0x24BE6F740]);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setOverlayParameters:", v44);
  -[NPKPaymentProvisioningFlowController fieldsModel](self, "fieldsModel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "secureSubmissionValuesForDestination:", v43);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setSecureOverlayParameters:", v46);
  return v7;
}

- (id)_newPaymentProvisioningRequest
{
  id v3;
  void *v4;
  void *v5;
  PKAddPaymentPassRequest *inAppProvisioningRequest;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = objc_alloc(MEMORY[0x24BE6ECD8]);
  -[PKPaymentProvisioningController eligibilityResponse](self->_provisioningController, "eligibilityResponse");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithEligibilityResponse:", v4);

  inAppProvisioningRequest = self->_inAppProvisioningRequest;
  if (inAppProvisioningRequest)
  {
    -[PKAddPaymentPassRequest activationData](inAppProvisioningRequest, "activationData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setActivationData:", v7);

    if (-[PKAddPaymentPassRequestConfiguration style](self->_inAppProvisioningRequestConfiguration, "style") == PKAddPaymentPassStyleAccess)
      objc_msgSend(v5, "setStyle:", 1);
  }
  else
  {
    -[NPKPaymentProvisioningFlowController provisioningController](self, "provisioningController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "eligibilityResponse");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setEligibilityResponse:", v9);

    -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self->_fieldsModel, "paymentSetupFieldWithIdentifier:", *MEMORY[0x24BE6F720]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "submissionString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCardSecurityCode:", v11);

    -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](self->_fieldsModel, "paymentSetupFieldWithIdentifier:", *MEMORY[0x24BE6F728]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "submissionString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCardholderName:", v13);

    -[NPKPaymentProvisioningFlowController fieldsModel](self, "fieldsModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x24BE6F748];
    objc_msgSend(v14, "submissionValuesForDestination:", *MEMORY[0x24BE6F748]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setOverlayParameters:", v16);
    -[NPKPaymentProvisioningFlowController fieldsModel](self, "fieldsModel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "secureSubmissionValuesForDestination:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setSecureOverlayParameters:", v18);
  }
  return v5;
}

- (void)_requestRequirements:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  PKPaymentCredential *currentCredential;
  id v9;
  PKPaymentProvisioningController *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  PKPaymentProvisioningController *provisioningController;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PKPaymentProvisioningController resetForNewProvisioning](self->_provisioningController, "resetForNewProvisioning");
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: performing requirements", buf, 2u);
    }

  }
  currentCredential = self->_currentCredential;
  if (currentCredential
    && -[PKPaymentCredential isPurchasedProductCredential](currentCredential, "isPurchasedProductCredential"))
  {
    -[PKPaymentCredential purchasedProductCredential](self->_currentCredential, "purchasedProductCredential");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = self->_provisioningController;
    objc_msgSend(v9, "product");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "provisioningMethodMetadataForType:", *MEMORY[0x24BE6F6C8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentProvisioningController resolveRequirementsUsingProvisioningMethodMetadata:](v10, "resolveRequirementsUsingProvisioningMethodMetadata:", v12);

    -[PKPaymentProvisioningController requirementsResponse](v10, "requirementsResponse");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRequirementsResponse:", v13);

    -[NPKPaymentProvisioningFlowController setTermsAcceptedOutOfBand:](self, "setTermsAcceptedOutOfBand:", 1);
    pk_Payment_log();
    v14 = objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if ((_DWORD)v12)
    {
      pk_Payment_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v9, "product");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "displayName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "summaryMetadataDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v23 = v17;
        v24 = 2112;
        v25 = v18;
        _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Moving directly to next provisioning step for purchased product %@ (%@).", buf, 0x16u);

      }
    }
    -[NPKPaymentProvisioningFlowController _performNextActionForProvisioningState:](self, "_performNextActionForProvisioningState:", v4);

  }
  else
  {
    v9 = -[NPKPaymentProvisioningFlowController _newPaymentRequirementsRequest](self, "_newPaymentRequirementsRequest");
    provisioningController = self->_provisioningController;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __61__NPKPaymentProvisioningFlowController__requestRequirements___block_invoke;
    v20[3] = &unk_24CFE8F30;
    v20[4] = self;
    v21 = v4;
    -[PKPaymentProvisioningController requestRequirements:withCompletionHandler:](provisioningController, "requestRequirements:withCompletionHandler:", v9, v20);

  }
}

void __61__NPKPaymentProvisioningFlowController__requestRequirements___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  id *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  void *v29;
  _BOOL8 v30;
  void *v31;
  void *v32;
  NSObject *v33;
  _BOOL4 v34;
  NSObject *v35;
  void *v36;
  int v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    pk_Payment_log();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      if (v13)
      {
        pk_Payment_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v37 = 138412290;
          v38 = (uint64_t)v6;
          _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Error occurred when sending requirements request: %@", (uint8_t *)&v37, 0xCu);
        }

      }
      v15 = *(id **)(a1 + 32);
      objc_msgSend(v15[3], "displayableErrorForProvisioningError:", v6);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v13)
      {
        pk_Payment_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v37) = 0;
          _os_log_impl(&dword_213518000, v25, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: No response or error from requirements!", (uint8_t *)&v37, 2u);
        }

      }
      v15 = *(id **)(a1 + 32);
      PKDisplayableErrorForCommonType();
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v16;
    objc_msgSend(v15, "_sendDidEncounterError:requestContext:", v16, *(_QWORD *)(a1 + 40));
    goto LABEL_28;
  }
  if (objc_msgSend(v5, "status") == 2 || PKForcePrivateLabelSetupDisambiguation())
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v8)
    {
      pk_Payment_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v37) = 0;
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: PKPaymentRequirementsStatusRequirementsAmbiguous is responded by server", (uint8_t *)&v37, 2u);
      }

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "requirementsResponse");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "possibleProducts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_transitionToProductDisambiguationWithProducts:requestContext:", v11, *(_QWORD *)(a1 + 40));
LABEL_28:

    goto LABEL_29;
  }
  if (objc_msgSend(v5, "status") == 1)
  {
    v17 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
    objc_msgSend(v5, "requiredPaymentSetupFields");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "updateWithPaymentSetupFields:", v18);

    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "hasIncompletePaymentSetupFields"))
    {
      objc_msgSend(v5, "requiredPaymentSetupFields");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "count");

      pk_Payment_log();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

      if (v22)
      {
        pk_Payment_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v37 = 134217984;
          v38 = v20;
          _os_log_impl(&dword_213518000, v23, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Start secondary manual entry with %lu fields.", (uint8_t *)&v37, 0xCu);
        }

      }
      v24 = *(void **)(a1 + 32);
      objc_msgSend(v5, "requiredPaymentSetupFields");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_transitionToSecondaryManualEntryWithFields:credential:requestContext:", v11, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168), *(_QWORD *)(a1 + 40));
      goto LABEL_28;
    }
    pk_Payment_log();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);

    if (v34)
    {
      pk_Payment_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "paymentSetupFields");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138412290;
        v38 = (uint64_t)v36;
        _os_log_impl(&dword_213518000, v35, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Moving directly to next provisioning step since all fields are complete (%@).", (uint8_t *)&v37, 0xCu);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_performNextActionForProvisioningState:", *(_QWORD *)(a1 + 40));
  }
  else if (!objc_msgSend(v5, "status") || objc_msgSend(v5, "status") == 3)
  {
    pk_Payment_log();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

    if (v27)
    {
      pk_Payment_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v37) = 0;
        _os_log_impl(&dword_213518000, v28, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: PKPaymentRequirementsStatusUnknownRequirements or PKPaymentRequirementsStatusCardNotSupported is responded by server", (uint8_t *)&v37, 2u);
      }

    }
    v29 = (void *)objc_opt_class();
    v30 = NPKPaymentCardIneligibleReasonForRequirementsStatus(objc_msgSend(v5, "status"));
    objc_msgSend(v5, "learnMoreURL");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_displayableErrorWithIneligibilityReason:learnMoreURL:", v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_sendDidEncounterError:requestContext:", v32, *(_QWORD *)(a1 + 40));
  }
LABEL_29:

}

- (void)_performEligibility:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (-[NPKPaymentProvisioningFlowController _isResolveLocalEligibilityRequired](self, "_isResolveLocalEligibilityRequired"))
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __60__NPKPaymentProvisioningFlowController__performEligibility___block_invoke;
    v5[3] = &unk_24CFE8F58;
    v5[4] = self;
    v6 = v4;
    -[NPKPaymentProvisioningFlowController _performResolveLocalEligibilityARequirements:completion:](self, "_performResolveLocalEligibilityARequirements:completion:", v6, v5);

  }
  else
  {
    -[NPKPaymentProvisioningFlowController _performProvisioningEligibility:](self, "_performProvisioningEligibility:", v4);
  }

}

void __60__NPKPaymentProvisioningFlowController__performEligibility___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__NPKPaymentProvisioningFlowController__performEligibility___block_invoke_2;
  v7[3] = &unk_24CFE8288;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  NPKGuaranteeMainThread(v7);

}

uint64_t __60__NPKPaymentProvisioningFlowController__performEligibility___block_invoke_2(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3)
    return objc_msgSend(v2, "_sendDidEncounterError:requestContext:", v3, a1[6]);
  else
    return objc_msgSend(v2, "_performProvisioningEligibility:", a1[6]);
}

- (void)_performProvisioningEligibility:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  id v8;
  PKPaymentProvisioningController *provisioningController;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: performing provisioning eligibility", buf, 2u);
    }

  }
  v8 = -[NPKPaymentProvisioningFlowController _newPaymentEligibilityRequest](self, "_newPaymentEligibilityRequest");
  provisioningController = self->_provisioningController;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__NPKPaymentProvisioningFlowController__performProvisioningEligibility___block_invoke;
  v11[3] = &unk_24CFE8F80;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  -[PKPaymentProvisioningController requestEligibility:withCompletionHandler:](provisioningController, "requestEligibility:withCompletionHandler:", v8, v11);

}

void __72__NPKPaymentProvisioningFlowController__performProvisioningEligibility___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __72__NPKPaymentProvisioningFlowController__performProvisioningEligibility___block_invoke_2;
  v11[3] = &unk_24CFE8D78;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = v5;
  v13 = v7;
  v14 = v8;
  v15 = v6;
  v9 = v6;
  v10 = v5;
  NPKGuaranteeMainThread(v11);

}

void __72__NPKPaymentProvisioningFlowController__performProvisioningEligibility___block_invoke_2(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  uint64_t v10;
  id *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD v21[5];
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if (objc_msgSend(v2, "eligibilityStatus") == 1)
    {
      v3 = objc_msgSend(*(id *)(a1 + 40), "_isValidateSecurityRequirementsRequired");
      v5 = *(void **)(a1 + 40);
      v4 = *(void **)(a1 + 48);
      if (v3)
      {
        v21[0] = MEMORY[0x24BDAC760];
        v21[1] = 3221225472;
        v21[2] = __72__NPKPaymentProvisioningFlowController__performProvisioningEligibility___block_invoke_3;
        v21[3] = &unk_24CFE8F58;
        v21[4] = v5;
        v22 = v4;
        objc_msgSend(v5, "_performValidateSecurityRequirements:completion:", v22, v21);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 40), "_handleEligibiltySuccessWithContext:", v4);
      }
    }
    else
    {
      v13 = (void *)objc_opt_class();
      v14 = NPKPaymentCardIneligibleReasonForEligibilityStatus(objc_msgSend(*(id *)(a1 + 32), "eligibilityStatus"));
      objc_msgSend(*(id *)(a1 + 32), "learnMoreURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_displayableErrorWithIneligibilityReason:learnMoreURL:", v14, v15);
      v20 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "_sendDidEncounterError:requestContext:", v20, *(_QWORD *)(a1 + 48));
    }
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 56);
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      if (v8)
      {
        pk_Payment_log();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = *(_QWORD *)(a1 + 56);
          *(_DWORD *)buf = 138412290;
          v24 = v10;
          _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Error occurred when sending eligibility request: %@", buf, 0xCu);
        }

      }
      v11 = *(id **)(a1 + 40);
      objc_msgSend(v11[3], "displayableErrorForProvisioningError:", *(_QWORD *)(a1 + 56));
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v8)
      {
        pk_Payment_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: No response or error from requirements!", buf, 2u);
        }

      }
      v11 = *(id **)(a1 + 40);
      PKDisplayableErrorForCommonType();
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v12;
    objc_msgSend(v11, "_sendDidEncounterError:requestContext:", v12, *(_QWORD *)(a1 + 48));

    v18 = *(_QWORD *)(a1 + 40);
    v19 = *(void **)(v18 + 64);
    *(_QWORD *)(v18 + 64) = 0;

  }
}

void __72__NPKPaymentProvisioningFlowController__performProvisioningEligibility___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__NPKPaymentProvisioningFlowController__performProvisioningEligibility___block_invoke_4;
  v7[3] = &unk_24CFE8288;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  NPKGuaranteeMainThread(v7);

}

uint64_t __72__NPKPaymentProvisioningFlowController__performProvisioningEligibility___block_invoke_4(_QWORD *a1)
{
  void *v2;
  uint64_t v3;

  v3 = a1[4];
  v2 = (void *)a1[5];
  if (v3)
    return objc_msgSend(v2, "_sendDidEncounterError:requestContext:", v3, a1[6]);
  else
    return objc_msgSend(v2, "_handleEligibiltySuccessWithContext:", a1[6]);
}

- (void)_handleEligibiltySuccessWithContext:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (PKEnableDynamicSEAllocation())
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __76__NPKPaymentProvisioningFlowController__handleEligibiltySuccessWithContext___block_invoke;
    v5[3] = &unk_24CFE8FD0;
    v5[4] = self;
    v6 = v4;
    -[NPKPaymentProvisioningFlowController _performSEStorageCheck:](self, "_performSEStorageCheck:", v5);

  }
  else
  {
    -[NPKPaymentProvisioningFlowController _performNextActionForProvisioningState:](self, "_performNextActionForProvisioningState:", v4);
  }

}

void __76__NPKPaymentProvisioningFlowController__handleEligibiltySuccessWithContext___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  char v5;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __76__NPKPaymentProvisioningFlowController__handleEligibiltySuccessWithContext___block_invoke_2;
  v3[3] = &unk_24CFE8FA8;
  v5 = a2;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  NPKGuaranteeMainThread(v3);

}

void __76__NPKPaymentProvisioningFlowController__handleEligibiltySuccessWithContext___block_invoke_2(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "_performNextActionForProvisioningState:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    PKDisplayableErrorForCommonType();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_sendDidEncounterError:requestContext:", v2, *(_QWORD *)(a1 + 40));

  }
}

- (BOOL)_isResolveLocalEligibilityRequired
{
  PKPaymentCredential *currentCredential;

  currentCredential = self->_currentCredential;
  return currentCredential && -[PKPaymentCredential credentialType](currentCredential, "credentialType") == 135
      || self->_currentAppleBalanceCredential != 0;
}

- (void)_performResolveLocalEligibilityARequirements:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  PKPaymentCredential *currentCredential;
  PKPaymentProvisioningController *provisioningController;
  id v11;
  PKPaymentCredential *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[16];

  v5 = a4;
  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Resolving local eligibility requirements", buf, 2u);
    }

  }
  currentCredential = self->_currentCredential;
  if (!currentCredential)
    currentCredential = self->_currentAppleBalanceCredential;
  provisioningController = self->_provisioningController;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __96__NPKPaymentProvisioningFlowController__performResolveLocalEligibilityARequirements_completion___block_invoke;
  v13[3] = &unk_24CFE7B80;
  v14 = v5;
  v11 = v5;
  v12 = currentCredential;
  -[PKPaymentProvisioningController resolveLocalEligibilityRequirementsForAppleBalanceCredential:withCompletion:](provisioningController, "resolveLocalEligibilityRequirementsForAppleBalanceCredential:withCompletion:", v12, v13);

}

void __96__NPKPaymentProvisioningFlowController__performResolveLocalEligibilityARequirements_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Local eligibility resolved. Error: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (BOOL)_isValidateSecurityRequirementsRequired
{
  PKPaymentCredential *currentCredential;

  currentCredential = self->_currentCredential;
  return currentCredential && -[PKPaymentCredential credentialType](currentCredential, "credentialType") == 135
      || self->_currentAppleBalanceCredential != 0;
}

- (void)_performValidateSecurityRequirements:(id)a3 completion:(id)a4
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a4;
  objc_msgSend(MEMORY[0x24BE6E970], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __88__NPKPaymentProvisioningFlowController__performValidateSecurityRequirements_completion___block_invoke;
  v7[3] = &unk_24CFE7940;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "validateAppleBalanceSecurityRequirementsWithCompletion:", v7);

}

void __88__NPKPaymentProvisioningFlowController__performValidateSecurityRequirements_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);

    if (v8)
    {
      pk_Payment_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v13 = 138412290;
        v14 = v5;
        _os_log_impl(&dword_213518000, v9, OS_LOG_TYPE_ERROR, "Error: Standalone: Apple Balance security requirements not met. Could not verify/setup Apple Pay cloud store container. Error: %@", (uint8_t *)&v13, 0xCu);
      }

    }
    PKLocalizedPaymentString(CFSTR("COULD_NOT_SET_UP_TITLE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedPaymentString(CFSTR("COULD_NOT_SET_UP_MESSAGE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PKDisplayableErrorCustom();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  v12 = *(_QWORD *)(a1 + 32);
  if (v12)
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v6);

}

- (void)_performSEStorageCheck:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[8];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Performing SE storage check.", buf, 2u);
    }

  }
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PKPaymentProvisioningController eligibilityResponse](self->_provisioningController, "eligibilityResponse", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "paymentApplications");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14), "appletTypeIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "npkSafelyAddObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v12);
  }

  -[NPKPaymentProvisioningFlowController _checkSpaceAvailableForAppletTypes:triedCleanup:completion:](self, "_checkSpaceAvailableForAppletTypes:triedCleanup:completion:", v8, 0, v4);
}

- (void)_checkSpaceAvailableForAppletTypes:(id)a3 triedCleanup:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  NPKPaymentProvisioningFlowController *v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x24BE6EE68];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __99__NPKPaymentProvisioningFlowController__checkSpaceAvailableForAppletTypes_triedCleanup_completion___block_invoke;
  v13[3] = &unk_24CFE8FF8;
  v17 = a4;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "getCurrentSnapshot:", v13);

}

void __99__NPKPaymentProvisioningFlowController__checkSpaceAvailableForAppletTypes_triedCleanup_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  id v14;
  void (*v15)(void);
  int8x16_t v16;
  _QWORD v17[4];
  int8x16_t v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (!v3)
  {
    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
LABEL_16:
    v15();
    goto LABEL_17;
  }
  v5 = objc_msgSend(v3, "canFitAppletTypes:", *(_QWORD *)(a1 + 32));
  pk_General_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_General_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromBOOL();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v9;
      v22 = 2112;
      v23 = v4;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: SE storage check returned can fit applets on SE: %@ from snapshot %@", buf, 0x16u);

    }
  }
  if (PKDynamicSEAllocationFakeFullSE())
  {
    pk_General_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    v5 = 0;
    if (v11)
    {
      pk_General_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_213518000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Overriding canFit to NO b/c fake full se", buf, 2u);
      }

      v5 = 0;
    }
  }
  if (*(_BYTE *)(a1 + 56) || (v5 & 1) != 0)
  {
    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    goto LABEL_16;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6EE60]), "initWithWebService:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104));
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __99__NPKPaymentProvisioningFlowController__checkSpaceAvailableForAppletTypes_triedCleanup_completion___block_invoke_96;
  v17[3] = &unk_24CFE84E8;
  v16 = *(int8x16_t *)(a1 + 32);
  v14 = (id)v16.i64[0];
  v18 = vextq_s8(v16, v16, 8uLL);
  v19 = *(id *)(a1 + 48);
  objc_msgSend(v13, "debugPerformSECleanup:", v17);

LABEL_17:
}

uint64_t __99__NPKPaymentProvisioningFlowController__checkSpaceAvailableForAppletTypes_triedCleanup_completion___block_invoke_96(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_checkSpaceAvailableForAppletTypes:triedCleanup:completion:", *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48));
}

- (void)_handlePasscodeUpgradeCompleteWithSuccess:(BOOL)a3 error:(id)a4 requestContext:(id)a5
{
  _BOOL8 v5;
  id v7;

  v5 = a3;
  v7 = a5;
  -[PKPaymentProvisioningController passcodeUpgradeCompleted:](self->_provisioningController, "passcodeUpgradeCompleted:", v5);
  if (v5)
    -[NPKPaymentProvisioningFlowController _performNextActionForProvisioningState:](self, "_performNextActionForProvisioningState:", v7);

}

- (BOOL)_isPasscodeUpgradeRequired
{
  return -[PKPaymentProvisioningController isPasscodeUpgradeRequired](self->_provisioningController, "isPasscodeUpgradeRequired");
}

- (void)_performPasscodeUpgrade:(id)a3
{
  id v4;
  PKPaymentProvisioningController *provisioningController;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  provisioningController = self->_provisioningController;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__NPKPaymentProvisioningFlowController__performPasscodeUpgrade___block_invoke;
  v7[3] = &unk_24CFE9048;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PKPaymentProvisioningController preflightPasscodeUpgradeWithCompletion:](provisioningController, "preflightPasscodeUpgradeWithCompletion:", v7);

}

void __64__NPKPaymentProvisioningFlowController__performPasscodeUpgrade___block_invoke(uint64_t a1, char a2, char a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  char v15;
  char v16;

  v7 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __64__NPKPaymentProvisioningFlowController__performPasscodeUpgrade___block_invoke_2;
  v11[3] = &unk_24CFE9020;
  v15 = a2;
  v16 = a3;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v12 = v7;
  v13 = v8;
  v14 = v9;
  v10 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

void __64__NPKPaymentProvisioningFlowController__performPasscodeUpgrade___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NPKPaymentProvisioningFlowControllerPasscodeUpgradeStepContext *v10;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  pk_Payment_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(unsigned __int8 *)(a1 + 56);
      v6 = *(unsigned __int8 *)(a1 + 57);
      v7 = *(_QWORD *)(a1 + 32);
      v11[0] = 67109634;
      v11[1] = v5;
      v12 = 1024;
      v13 = v6;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Preflighted passcode upgrade with success %d, meets policy %d, error %@", (uint8_t *)v11, 0x18u);
    }

  }
  if (*(_BYTE *)(a1 + 56))
  {
    if (*(_BYTE *)(a1 + 57))
    {
      objc_msgSend(*(id *)(a1 + 40), "_handlePasscodeUpgradeCompleteWithSuccess:error:requestContext:", 1, 0, *(_QWORD *)(a1 + 48));
    }
    else
    {
      v10 = -[NPKPaymentProvisioningFlowControllerPasscodeUpgradeStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerPasscodeUpgradeStepContext alloc], "initWithRequestContext:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 40), "_performTransitionToStep:withContext:", 197, v10);

    }
  }
  else
  {
    v8 = *(void **)(a1 + 40);
    PKDisplayableErrorForCommonType();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_sendDidEncounterError:requestContext:", v9, *(_QWORD *)(a1 + 48));

  }
}

- (void)_performTerms:(id)a3
{
  PKPaymentProvisioningController *provisioningController;
  id v5;
  void *v6;
  id v7;

  provisioningController = self->_provisioningController;
  v5 = a3;
  -[PKPaymentProvisioningController eligibilityResponse](provisioningController, "eligibilityResponse");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "termsURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowController _transitionBasedOnTermsForReason:URL:requestContext:](self, "_transitionBasedOnTermsForReason:URL:requestContext:", 0, v6, v5);

}

- (void)_performProvision:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[16];

  v4 = a3;
  -[NPKPaymentProvisioningFlowController _transitionToProvisioningProgressWithRequestContext:](self, "_transitionToProvisioningProgressWithRequestContext:", v4);
  v5 = -[NPKPaymentProvisioningFlowController _newPaymentProvisioningRequest](self, "_newPaymentProvisioningRequest");
  v6 = (void *)MEMORY[0x24BDBFA70];
  PKPassKitCoreBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "newAssertionForBundle:withReason:", v7, CFSTR("User-requested Wallet pass provisioning"));

  pk_General_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    pk_General_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Requesting externalized auth...", buf, 2u);
    }

  }
  -[NPKPaymentProvisioningFlowController fidoAuthCoordinator](self, "fidoAuthCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __58__NPKPaymentProvisioningFlowController__performProvision___block_invoke;
  v16[3] = &unk_24CFE9098;
  v16[4] = self;
  v17 = v5;
  v18 = v4;
  v19 = v8;
  v13 = v8;
  v14 = v4;
  v15 = v5;
  objc_msgSend(v12, "requestAuthorizationWithCompletion:", v16);

}

void __58__NPKPaymentProvisioningFlowController__performProvision___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  char v20;

  v8 = a4;
  v9 = a5;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__NPKPaymentProvisioningFlowController__performProvision___block_invoke_2;
  block[3] = &unk_24CFE9070;
  v20 = a2;
  v14 = v8;
  v15 = v9;
  v10 = *(void **)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v10;
  v18 = *(id *)(a1 + 48);
  v19 = *(id *)(a1 + 56);
  v11 = v9;
  v12 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __58__NPKPaymentProvisioningFlowController__performProvision___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    pk_General_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(unsigned __int8 *)(a1 + 80);
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(_QWORD *)(a1 + 40);
      v17 = 138412802;
      v18 = v6;
      v19 = 1024;
      v20 = v5;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Created context %@ with success %i and error %@", (uint8_t *)&v17, 0x1Cu);
    }

  }
  if (*(_BYTE *)(a1 + 80))
  {
    objc_msgSend(*(id *)(a1 + 48), "fidoAuthCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "externalizedContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "storeExternalizedAuth:", v10);
    objc_msgSend(*(id *)(a1 + 48), "_performProvisionWithRequest:requestContext:assertion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  }
  else
  {
    if (!*(_QWORD *)(a1 + 40))
      return;
    pk_General_log();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);

    if (v12)
    {
      pk_General_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = *(_QWORD *)(a1 + 40);
        v17 = 138412290;
        v18 = v14;
        _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_ERROR, "Error: Standalone: Error: Unable to request and store externalized auth! %@", (uint8_t *)&v17, 0xCu);
      }

    }
    objc_msgSend(*(id *)(a1 + 48), "fidoAuthCoordinator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "clearContext");

    v16 = *(id **)(a1 + 48);
    objc_msgSend(v16[3], "displayableErrorForProvisioningError:", *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_sendDidEncounterError:requestContext:", v10, *(_QWORD *)(a1 + 64));
  }

}

- (void)_performProvisionWithRequest:(id)a3 requestContext:(id)a4 assertion:(id)a5
{
  id v8;
  id v9;
  PKPaymentProvisioningController *provisioningController;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  NPKPaymentProvisioningFlowController *v15;
  id v16;

  v8 = a4;
  v9 = a5;
  provisioningController = self->_provisioningController;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __94__NPKPaymentProvisioningFlowController__performProvisionWithRequest_requestContext_assertion___block_invoke;
  v13[3] = &unk_24CFE90C0;
  v14 = v9;
  v15 = self;
  v16 = v8;
  v11 = v8;
  v12 = v9;
  -[PKPaymentProvisioningController requestProvisioning:withCompletion:](provisioningController, "requestProvisioning:withCompletion:", a3, v13);

}

void __94__NPKPaymentProvisioningFlowController__performProvisionWithRequest_requestContext_assertion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  id *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "_performNextActionForProvisioningState:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "fidoAuthCoordinator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "fidoAuthCoordinator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "clearContext");

    }
  }
  else
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      if (v10)
      {
        pk_Payment_log();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138412290;
          v19 = v6;
          _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Error occurred when sending provision request: %@", (uint8_t *)&v18, 0xCu);
        }

      }
      v12 = *(id **)(a1 + 40);
      objc_msgSend(v12[3], "displayableErrorForProvisioningError:", v6);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v10)
      {
        pk_Payment_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: No response or error from provision!", (uint8_t *)&v18, 2u);
        }

      }
      v12 = *(id **)(a1 + 40);
      PKDisplayableErrorForCommonType();
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v13;
    objc_msgSend(v12, "_sendDidEncounterError:requestContext:", v13, *(_QWORD *)(a1 + 48));

    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(void **)(v16 + 64);
    *(_QWORD *)(v16 + 64) = 0;

  }
}

- (void)_handleFinished:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  -[PKPaymentProvisioningController provisionedPass](self->_provisioningController, "provisionedPass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NPKPaymentProvisioningFlowController internalIngestionState](self, "internalIngestionState") == 7)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      pk_Payment_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Provisioning is complete, but waiting for reader mode second tap", v9, 2u);
      }

    }
  }
  else
  {
    -[NPKPaymentProvisioningFlowController _performNextStepForProvisionedPass:requestContext:](self, "_performNextStepForProvisionedPass:requestContext:", v5, v4);
  }

}

- (void)_performNextStepForProvisionedPass:(id)a3 requestContext:(id)a4
{
  -[NPKPaymentProvisioningFlowController _performNextStepForProvisionedPass:moreInfoAcknowledged:requestContext:](self, "_performNextStepForProvisionedPass:moreInfoAcknowledged:requestContext:", a3, 0, a4);
}

- (void)_performNextStepForProvisionedPass:(id)a3 moreInfoAcknowledged:(BOOL)a4 requestContext:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSObject *v20;
  uint8_t v21[16];

  v9 = a3;
  v10 = a5;
  -[PKPaymentProvisioningController webService](self->_provisioningController, "webService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "targetDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "secureElementIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateDevicePaymentApplicationsWithSecureElementIdentifiers:", v13);

  objc_msgSend(v9, "devicePrimaryPaymentApplication");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "state");

  -[PKPaymentProvisioningController moreInfoItems](self->_provisioningController, "moreInfoItems");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (a4 || !objc_msgSend(v16, "count"))
  {
    if ((unint64_t)(v15 - 3) > 1)
    {
      -[NPKPaymentProvisioningFlowController _handleEndOfProvisioningFlowForCurrentPass:requestContext:](self, "_handleEndOfProvisioningFlowForCurrentPass:requestContext:", v9, v10);
    }
    else
    {
      pk_Payment_log();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

      if (v19)
      {
        pk_Payment_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_213518000, v20, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Verification is necessary", v21, 2u);
        }

      }
      objc_storeStrong((id *)&self->_issuerVerificationPass, a3);
      -[NPKPaymentProvisioningFlowController _requestVerificationOptionsForPass:context:](self, "_requestVerificationOptionsForPass:context:", v9, v10);
    }
  }
  else
  {
    -[NPKPaymentProvisioningFlowController _transitionToMoreInformationWithItems:pass:requestContext:](self, "_transitionToMoreInformationWithItems:pass:requestContext:", v17, v9, v10);
  }

}

- (void)_handleVerificationResponseForPass:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  PKPaymentSetupFieldsModel *v12;
  PKPaymentSetupFieldsModel *fieldsModel;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  uint8_t v19[16];
  _QWORD v20[5];
  id v21;

  v6 = a3;
  v7 = a4;
  -[PKPaymentWebService verificationRecordForPass:](self->_webService, "verificationRecordForPass:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "verificationStatus");
  switch(v9)
  {
    case 3:
      objc_msgSend(v8, "channel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v15;
      if (v15 && (objc_msgSend(v15, "type") == 2 || objc_msgSend(v14, "type") == 1))
      {
        -[NPKPaymentProvisioningFlowController _transitionToVerificationCodeWithPaymentPass:channel:requestContext:](self, "_transitionToVerificationCodeWithPaymentPass:channel:requestContext:", v6, v14, v7);
      }
      else
      {
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __83__NPKPaymentProvisioningFlowController__handleVerificationResponseForPass_context___block_invoke;
        v20[3] = &unk_24CFE90E8;
        v20[4] = self;
        v21 = v7;
        -[NPKPaymentProvisioningFlowController _downloadAndAddUpdatedPassForPaymentPass:completion:](self, "_downloadAndAddUpdatedPassForPaymentPass:completion:", v6, v20);

      }
      break;
    case 2:
      objc_msgSend(v8, "allChannels");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKPaymentProvisioningFlowController _transitionToVerificationChannelsWithPaymentPass:channels:requestContext:](self, "_transitionToVerificationChannelsWithPaymentPass:channels:requestContext:", v6, v14, v7);
      break;
    case 1:
      v10 = objc_alloc(MEMORY[0x24BE6ED50]);
      objc_msgSend(v8, "requiredVerificationFields");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (PKPaymentSetupFieldsModel *)objc_msgSend(v10, "initWithPaymentSetupFields:", v11);
      fieldsModel = self->_fieldsModel;
      self->_fieldsModel = v12;

      objc_msgSend(v8, "requiredVerificationFields");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKPaymentProvisioningFlowController _transitionToVerificationFieldsWithPaymentPass:fields:requestContext:](self, "_transitionToVerificationFieldsWithPaymentPass:fields:requestContext:", v6, v14, v7);
      break;
    default:
      pk_Payment_log();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

      if (v17)
      {
        pk_Payment_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_213518000, v18, OS_LOG_TYPE_DEFAULT, "Warning: Standalone verification status: unknown, showing error.", v19, 2u);
        }

      }
      PKDisplayableErrorForCommonType();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKPaymentProvisioningFlowController _sendDidEncounterError:requestContext:](self, "_sendDidEncounterError:requestContext:", v14, v7);
      break;
  }

}

uint64_t __83__NPKPaymentProvisioningFlowController__handleVerificationResponseForPass_context___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleEndOfProvisioningFlowForCurrentPass:requestContext:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_requestVerificationOptionsForPass:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKPaymentWebService *webService;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BE6EDA0], "requestWithPass:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  webService = self->_webService;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __83__NPKPaymentProvisioningFlowController__requestVerificationOptionsForPass_context___block_invoke;
  v12[3] = &unk_24CFE9110;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[PKPaymentWebService verificationOptionsForRequest:completion:](webService, "verificationOptionsForRequest:completion:", v8, v12);

}

void __83__NPKPaymentProvisioningFlowController__requestVerificationOptionsForPass_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v6 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__NPKPaymentProvisioningFlowController__requestVerificationOptionsForPass_context___block_invoke_2;
  block[3] = &unk_24CFE7E18;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v14 = a2;
  block[4] = v7;
  v11 = v8;
  v12 = *(id *)(a1 + 48);
  v13 = v6;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __83__NPKPaymentProvisioningFlowController__requestVerificationOptionsForPass_context___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 64) == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleVerificationResponseForPass:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    pk_Payment_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      pk_Payment_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 56);
        v5 = *(_QWORD *)(a1 + 64);
        v9 = 134218242;
        v10 = v5;
        v11 = 2112;
        v12 = v6;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Warning: Standalone: requesting verification options failed (result %lu). Showing error: %@", (uint8_t *)&v9, 0x16u);
      }

    }
    v7 = *(void **)(a1 + 32);
    objc_msgSend((id)objc_opt_class(), "_displayableErrorWithUnderlyingVerificationError:", *(_QWORD *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_sendDidEncounterError:requestContext:", v8, *(_QWORD *)(a1 + 48));

  }
}

- (void)_updateVerificationForPass:(id)a3 channel:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  PKPaymentWebService *webService;
  id v11;
  void *v12;
  id v13;
  void *v14;
  PKPaymentWebService *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;

  v8 = a3;
  v9 = a5;
  webService = self->_webService;
  v11 = a4;
  -[PKPaymentWebService verificationRecordForPass:](webService, "verificationRecordForPass:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x24BE6EDA8]);
  objc_msgSend(v12, "currentStepIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setStepIdentifier:", v14);

  objc_msgSend(v13, "setPass:", v8);
  objc_msgSend(v13, "setChannel:", v11);

  v15 = self->_webService;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __83__NPKPaymentProvisioningFlowController__updateVerificationForPass_channel_context___block_invoke;
  v18[3] = &unk_24CFE9110;
  v18[4] = self;
  v19 = v8;
  v20 = v9;
  v16 = v9;
  v17 = v8;
  -[PKPaymentWebService updateVerification:completion:](v15, "updateVerification:completion:", v13, v18);

}

void __83__NPKPaymentProvisioningFlowController__updateVerificationForPass_channel_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v6 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__NPKPaymentProvisioningFlowController__updateVerificationForPass_channel_context___block_invoke_2;
  block[3] = &unk_24CFE7E18;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v14 = a2;
  block[4] = v7;
  v11 = v8;
  v12 = *(id *)(a1 + 48);
  v13 = v6;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __83__NPKPaymentProvisioningFlowController__updateVerificationForPass_channel_context___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 64) == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleVerificationResponseForPass:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    pk_Payment_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      pk_Payment_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 56);
        v5 = *(_QWORD *)(a1 + 64);
        v9 = 134218242;
        v10 = v5;
        v11 = 2112;
        v12 = v6;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Warning: Standalone: requesting verification fields failed (result %lu). Showing error: %@", (uint8_t *)&v9, 0x16u);
      }

    }
    v7 = *(void **)(a1 + 32);
    objc_msgSend((id)objc_opt_class(), "_displayableErrorWithUnderlyingVerificationError:", *(_QWORD *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_sendDidEncounterError:requestContext:", v8, *(_QWORD *)(a1 + 48));

  }
}

- (void)_handleVerificationFieldsForPass:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  PKPaymentWebService *webService;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  -[PKPaymentWebService verificationRecordForPass:](self->_webService, "verificationRecordForPass:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BE6EDA8]);
  objc_msgSend(v8, "currentStepIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStepIdentifier:", v10);

  objc_msgSend(v9, "setPass:", v6);
  objc_msgSend(v8, "channel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setChannel:", v11);

  -[NPKPaymentProvisioningFlowController fieldsModel](self, "fieldsModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BE6F738];
  objc_msgSend(v12, "submissionValuesForDestination:", *MEMORY[0x24BE6F738]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setOverlayParameters:", v14);
  -[NPKPaymentProvisioningFlowController fieldsModel](self, "fieldsModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "secureSubmissionValuesForDestination:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setSecureOverlayParameters:", v16);
  webService = self->_webService;
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __81__NPKPaymentProvisioningFlowController__handleVerificationFieldsForPass_context___block_invoke;
  v20[3] = &unk_24CFE9110;
  v20[4] = self;
  v21 = v6;
  v22 = v7;
  v18 = v7;
  v19 = v6;
  -[PKPaymentWebService updateVerification:completion:](webService, "updateVerification:completion:", v9, v20);

}

void __81__NPKPaymentProvisioningFlowController__handleVerificationFieldsForPass_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v6 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __81__NPKPaymentProvisioningFlowController__handleVerificationFieldsForPass_context___block_invoke_2;
  block[3] = &unk_24CFE7E18;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v14 = a2;
  block[4] = v7;
  v11 = v8;
  v12 = *(id *)(a1 + 48);
  v13 = v6;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __81__NPKPaymentProvisioningFlowController__handleVerificationFieldsForPass_context___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 64) == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleVerificationResponseForPass:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    pk_Payment_log();
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

    if (v3)
    {
      pk_Payment_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 56);
        v5 = *(_QWORD *)(a1 + 64);
        v9 = 134218242;
        v10 = v5;
        v11 = 2112;
        v12 = v6;
        _os_log_impl(&dword_213518000, v4, OS_LOG_TYPE_DEFAULT, "Warning: Standalone: requesting verification fields failed (result %lu). Showing error: %@", (uint8_t *)&v9, 0x16u);
      }

    }
    v7 = *(void **)(a1 + 32);
    objc_msgSend((id)objc_opt_class(), "_displayableErrorWithUnderlyingVerificationError:", *(_QWORD *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_sendDidEncounterError:requestContext:", v8, *(_QWORD *)(a1 + 48));

  }
}

- (void)_handleVerificationCode:(id)a3 forPass:(id)a4 context:(id)a5
{
  id v8;
  PKPaymentWebService *webService;
  id v10;
  _QWORD v11[5];
  id v12;

  v8 = a5;
  webService = self->_webService;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __80__NPKPaymentProvisioningFlowController__handleVerificationCode_forPass_context___block_invoke;
  v11[3] = &unk_24CFE9138;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  -[PKPaymentWebService submitVerificationCode:verificationData:forPass:completion:](webService, "submitVerificationCode:verificationData:forPass:completion:", a3, 0, a4, v11);

}

void __80__NPKPaymentProvisioningFlowController__handleVerificationCode_forPass_context___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v7 = a3;
  v8 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__NPKPaymentProvisioningFlowController__handleVerificationCode_forPass_context___block_invoke_2;
  block[3] = &unk_24CFE7E18;
  v16 = a2;
  v9 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v13 = v7;
  v14 = v9;
  v15 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __80__NPKPaymentProvisioningFlowController__handleVerificationCode_forPass_context___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 64) == 1)
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __80__NPKPaymentProvisioningFlowController__handleVerificationCode_forPass_context___block_invoke_3;
    v11[3] = &unk_24CFE90E8;
    v11[4] = v2;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v2, "_downloadRemoteAssetsAndAddPaymentPass:completion:", v3, v11);

  }
  else
  {
    pk_Payment_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

    if (v5)
    {
      pk_Payment_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = *(_QWORD *)(a1 + 56);
        v7 = *(_QWORD *)(a1 + 64);
        *(_DWORD *)buf = 134218242;
        v14 = v7;
        v15 = 2112;
        v16 = v8;
        _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Warning: Standalone: submitting verification code failed (result %lu). Showing error: %@", buf, 0x16u);
      }

    }
    v9 = *(void **)(a1 + 32);
    objc_msgSend((id)objc_opt_class(), "_displayableErrorWithUnderlyingVerificationError:", *(_QWORD *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_sendDidEncounterError:requestContext:", v10, *(_QWORD *)(a1 + 48));

  }
}

uint64_t __80__NPKPaymentProvisioningFlowController__handleVerificationCode_forPass_context___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleEndOfProvisioningFlowForCurrentPass:requestContext:", a2, *(_QWORD *)(a1 + 40));
}

- (void)_downloadAndAddUpdatedPassForPaymentPass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  PKPaymentWebService *webService;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  webService = self->_webService;
  objc_msgSend(v6, "passTypeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serialNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __92__NPKPaymentProvisioningFlowController__downloadAndAddUpdatedPassForPaymentPass_completion___block_invoke;
  v13[3] = &unk_24CFE9160;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  -[PKPaymentWebService passWithPassTypeIdentifier:serialNumber:completion:](webService, "passWithPassTypeIdentifier:serialNumber:completion:", v9, v10, v13);

}

uint64_t __92__NPKPaymentProvisioningFlowController__downloadAndAddUpdatedPassForPaymentPass_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_downloadRemoteAssetsAndAddPaymentPass:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_downloadRemoteAssetsAndAddPaymentPass:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "dataAccessor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __90__NPKPaymentProvisioningFlowController__downloadRemoteAssetsAndAddPaymentPass_completion___block_invoke;
  v11[3] = &unk_24CFE91B0;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "downloadRemoteAssetsWithCloudStoreCoordinatorDelegate:completion:", 0, v11);

}

void __90__NPKPaymentProvisioningFlowController__downloadRemoteAssetsAndAddPaymentPass_completion___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "targetDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __90__NPKPaymentProvisioningFlowController__downloadRemoteAssetsAndAddPaymentPass_completion___block_invoke_2;
    v6[3] = &unk_24CFE9188;
    v8 = *(id *)(a1 + 48);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v3, "paymentWebService:addPaymentPass:withCompletionHandler:", v5, v4, v6);

  }
}

uint64_t __90__NPKPaymentProvisioningFlowController__downloadRemoteAssetsAndAddPaymentPass_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)_provisioningLocalizedProgressDescriptionDidChange:(id)a3
{
  void *v4;
  void *v5;
  NPKPaymentProvisioningFlowControllerProvisioningProgressStepContext *v6;

  if (self->_currentStep == 210)
  {
    v6 = -[NPKPaymentProvisioningFlowControllerProvisioningProgressStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerProvisioningProgressStepContext alloc], "initWithRequestContext:", self->_provisioningProgressRequestContext);
    -[PKPaymentProvisioningController localizedProgressDescription](self->_provisioningController, "localizedProgressDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPaymentProvisioningFlowControllerProvisioningProgressStepContext setLocalizedProgressDescription:](v6, "setLocalizedProgressDescription:", v4);

    -[NPKPaymentProvisioningFlowController currentProduct](self, "currentProduct");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPaymentProvisioningFlowControllerProvisioningProgressStepContext setProduct:](v6, "setProduct:", v5);

    -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", 210, v6);
  }
}

- (void)_transitionToChooseFlowWithSections:(id)a3 requestContext:(id)a4
{
  id v6;
  id v7;
  NPKPaymentProvisioningFlowControllerChooseFlowStepContext *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[NPKPaymentProvisioningFlowControllerChooseFlowStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerChooseFlowStepContext alloc], "initWithRequestContext:", v6);

  -[NPKPaymentProvisioningFlowControllerChooseFlowStepContext setSections:](v8, "setSections:", v7);
  -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", 130, v8);

}

- (void)_transitionToChooseProductWithProducts:(id)a3 requestContext:(id)a4
{
  id v6;
  id v7;
  NPKPaymentProvisioningFlowControllerChooseProductStepContext *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[NPKPaymentProvisioningFlowControllerChooseProductStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerChooseProductStepContext alloc], "initWithRequestContext:", v6);

  -[NPKPaymentProvisioningFlowControllerChooseProductStepContext setProducts:](v8, "setProducts:", v7);
  -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", 135, v8);

}

- (void)_transitionBasedOnTermsForReason:(unint64_t)a3 URL:(id)a4 requestContext:(id)a5
{
  id v8;
  id v9;
  NPKPaymentProvisioningFlowControllerTermsAndConditionsStepContext *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  _BOOL4 termsAcceptedOutOfBand;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  _BOOL4 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  self->_termsReason = a3;
  v9 = a5;
  v10 = -[NPKPaymentProvisioningFlowControllerTermsAndConditionsStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerTermsAndConditionsStepContext alloc], "initWithRequestContext:", v9);

  -[NPKPaymentProvisioningFlowController currentProduct](self, "currentProduct");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowControllerTermsAndConditionsStepContext setProduct:](v10, "setProduct:", v11);

  -[NPKPaymentProvisioningFlowControllerTermsAndConditionsStepContext setTermsURL:](v10, "setTermsURL:", v8);
  -[PKPaymentWebService context](self->_webService, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowControllerTermsAndConditionsStepContext setAllowNonSecureHTTP:](v10, "setAllowNonSecureHTTP:", objc_msgSend(v12, "devSigned"));

  if (v8 && !self->_termsAcceptedOutOfBand)
  {
    -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", 200, v10);
  }
  else
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      pk_Payment_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        termsAcceptedOutOfBand = self->_termsAcceptedOutOfBand;
        v18 = 138412546;
        v19 = v8;
        v20 = 1024;
        v21 = termsAcceptedOutOfBand;
        _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Not showing terms (termsURL %@, accepted out of band %d)", (uint8_t *)&v18, 0x12u);
      }

    }
    self->_termsAcceptedOutOfBand = 0;
    -[NPKPaymentProvisioningFlowStepContext requestContext](v10, "requestContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPaymentProvisioningFlowController acceptTerms:](self, "acceptTerms:", v17);

  }
}

- (void)_transitionToProvisioningProgressWithRequestContext:(id)a3
{
  int currentStep;
  NPKPaymentProvisioningFlowControllerProvisioningProgressStepContext *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_provisioningProgressRequestContext, a3);
  currentStep = self->_currentStep;
  if (currentStep != 165 && currentStep != 210)
  {
    v6 = -[NPKPaymentProvisioningFlowControllerProvisioningProgressStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerProvisioningProgressStepContext alloc], "initWithRequestContext:", self->_provisioningProgressRequestContext);
    -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", 210, v6);

  }
}

- (void)_transitionToProvisioningForCredential:(id)a3 product:(id)a4 requestContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "isRemoteCredential")
    && (objc_msgSend(v8, "remoteCredential"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "status"),
        v11,
        v12 != 1))
  {
    pk_General_log();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

    if (!v18)
      goto LABEL_9;
    pk_General_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "displayName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "longDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138412546;
      v22 = v19;
      v23 = 2112;
      v24 = v20;
      _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_ERROR, "Error: Error: No valid provisioning methods exist for product[%@] credential [%@]", (uint8_t *)&v21, 0x16u);

    }
  }
  else
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      pk_Payment_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Single remote credential", (uint8_t *)&v21, 2u);
      }

    }
    v25[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
    v16 = objc_claimAutoreleasedReturnValue();
    -[NPKPaymentProvisioningFlowController _handleProceedWithCredentials:chosenByUser:requestContext:](self, "_handleProceedWithCredentials:chosenByUser:requestContext:", v16, 0, v10);
  }

LABEL_9:
}

- (void)_transitionBasedOnCredentials:(id)a3 product:(id)a4 requestContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  PKPaymentSetupProduct *currentProduct;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v8, "count"))
  {
    pk_Payment_log();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v9)
    {
      if (v15)
      {
        pk_Payment_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v9, "productIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "provisioningMethodTypes");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 138412546;
          v27 = v17;
          v28 = 2112;
          v29 = v18;
          _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Have product with identifier %@ provisioning method types %@", (uint8_t *)&v26, 0x16u);

        }
      }
      if (!NPKPaymentProvisioningSetupContextIsSetupAssistant(self->_setupContext))
      {
        objc_msgSend(v9, "provisioningMethodMetadataForType:", *MEMORY[0x24BE6F6C8]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          -[NPKPaymentProvisioningFlowController _transitionToDigitalIssuanceForProduct:requestContext:](self, "_transitionToDigitalIssuanceForProduct:requestContext:", v9, v10);
          goto LABEL_27;
        }
      }
      objc_msgSend(v9, "provisioningMethodMetadataForType:", *MEMORY[0x24BE6F6E0]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        -[NPKPaymentProvisioningFlowController _transitionToReaderModeForProduct:requestContext:](self, "_transitionToReaderModeForProduct:requestContext:", v9, v10);
        goto LABEL_27;
      }
      pk_General_log();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

      if (v23)
      {
        pk_General_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v26) = 0;
          _os_log_impl(&dword_213518000, v24, OS_LOG_TYPE_ERROR, "Error: Error: No valid provisioning methods exist for product; transitioning to manual entry",
            (uint8_t *)&v26,
            2u);
        }

      }
      currentProduct = self->_currentProduct;
      self->_currentProduct = 0;

    }
    else if (v15)
    {
      pk_Payment_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_213518000, v21, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Enter Manual Entry, no credentials found", (uint8_t *)&v26, 2u);
      }

    }
    -[NPKPaymentProvisioningFlowController _transitionToManualEntry:](self, "_transitionToManualEntry:", v10);
    goto LABEL_27;
  }
  pk_Payment_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: TransitionToRemoteCredentials Step", (uint8_t *)&v26, 2u);
    }

  }
  -[NPKPaymentProvisioningFlowController _transitionToChooseCredentials:product:requestContext:](self, "_transitionToChooseCredentials:product:requestContext:", v8, v9, v10);
LABEL_27:

}

- (void)_transitionToChooseCredentials:(id)a3 product:(id)a4 requestContext:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext *v20;
  id v22;
  id v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v23 = a4;
  v22 = a5;
  v20 = -[NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext alloc], "initWithRequestContext:", v22);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v14, "remoteCredential");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          v18 = v16;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1880], "UUID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "UUIDString");
          v18 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v9, "addObject:", v18);
        objc_msgSend(v8, "setObject:forKey:", v14, v18);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  -[NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext setFlowIdentifiers:](v20, "setFlowIdentifiers:", v9);
  -[NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext setFlowIdentifierToCredential:](v20, "setFlowIdentifierToCredential:", v8);
  -[NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext setAllowsManualEntry:](v20, "setAllowsManualEntry:", 1);
  -[NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext setProduct:](v20, "setProduct:", v23);
  -[NPKPaymentProvisioningFlowControllerChooseCredentialsStepContext setCredentials:](v20, "setCredentials:", obj);
  -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", 140, v20);

}

- (void)_transitionToAppleBalanceAccountDetailsWithProduct:(id)a3 requestContext:(id)a4
{
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NPKPaymentProvisioningFlowControllerAppleBalanceAccountDetailsStepContext *v20;

  v5 = a4;
  v20 = -[NPKPaymentProvisioningFlowControllerAppleBalanceAccountDetailsStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerAppleBalanceAccountDetailsStepContext alloc], "initWithRequestContext:", v5);

  -[NPKPaymentProvisioningFlowController provisioningController](self, "provisioningController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "webService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "targetDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appleAccountInformation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKPaymentProvisioningFlowControllerAppleBalanceAccountDetailsStepContext setAppleID:](v20, "setAppleID:", v10);
  -[NPKPaymentProvisioningFlowController currentAppleBalanceCredential](self, "currentAppleBalanceCredential");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "eligibilityResponse");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "supplementaryData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lightweightAccount");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "appleBalanceDetails");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accountSummary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currentBalance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currencyCode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountMake();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowControllerAppleBalanceAccountDetailsStepContext setBalance:](v20, "setBalance:", v19);

  -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", 260, v20);
}

- (id)_curatedDefaultPaymentSetupProvisioningFields
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x24BE6ED50], "defaultPaymentSetupProvisioningFields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PKPaymentProvisioningController suppressDefaultCardholderNameField](self->_provisioningController, "suppressDefaultCardholderNameField"))
  {
    objc_msgSend(v3, "pk_objectsPassingTest:", &__block_literal_global_119);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

uint64_t __85__NPKPaymentProvisioningFlowController__curatedDefaultPaymentSetupProvisioningFields__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BE6F728]) ^ 1;

  return v3;
}

- (void)_transitionToManualEntry:(id)a3
{
  PKPaymentCredential *currentCredential;
  id v5;
  void *v6;
  PKPaymentSetupFieldsModel *v7;
  PKPaymentSetupFieldsModel *fieldsModel;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  PKPaymentSetupFieldsModel *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  NPKPaymentProvisioningFlowControllerManualEntryStepContext *v28;
  unsigned int v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  currentCredential = self->_currentCredential;
  self->_currentCredential = 0;

  v5 = objc_alloc(MEMORY[0x24BE6ED50]);
  -[NPKPaymentProvisioningFlowController _curatedDefaultPaymentSetupProvisioningFields](self, "_curatedDefaultPaymentSetupProvisioningFields");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (PKPaymentSetupFieldsModel *)objc_msgSend(v5, "initWithPaymentSetupFields:", v6);
  fieldsModel = self->_fieldsModel;
  self->_fieldsModel = v7;

  -[PKPaymentProvisioningController resetForNewProvisioning](self->_provisioningController, "resetForNewProvisioning");
  -[PKPaymentWebService context](self->_webService, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPaymentWebService targetDevice](self->_webService, "targetDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deviceRegion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_msgSend(v10, "cameraFirstProvisioningEnabledForRegion:", v12);
  -[NPKPaymentProvisioningFlowController _curatedDefaultPaymentSetupProvisioningFields](self, "_curatedDefaultPaymentSetupProvisioningFields");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v18, "defaultValue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          v20 = self->_fieldsModel;
          objc_msgSend(v18, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPaymentSetupFieldsModel paymentSetupFieldWithIdentifier:](v20, "paymentSetupFieldWithIdentifier:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(v22, "defaultValue");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setDefaultValue:", v23);

          }
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v15);
  }
  v24 = objc_msgSend(v13, "count");
  pk_Payment_log();
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

  if (v26)
  {
    pk_Payment_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v36 = v24;
      _os_log_impl(&dword_213518000, v27, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: There are %lu fields required in the Manual Entry", buf, 0xCu);
    }

  }
  v28 = -[NPKPaymentProvisioningFlowControllerManualEntryStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerManualEntryStepContext alloc], "initWithRequestContext:", v30);
  -[NPKPaymentProvisioningFlowControllerManualEntryStepContext setCameraFirstProvisioningEnabled:](v28, "setCameraFirstProvisioningEnabled:", v29);
  -[NPKPaymentProvisioningFlowControllerManualEntryStepContext setSetupFields:](v28, "setSetupFields:", v13);
  -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", 180, v28);

}

- (id)_credentialReadonlyFieldIdentifiers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BE6F718];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_secondaryFilteredFields:(id)a3 forCredential:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];

  v6 = a3;
  v7 = v6;
  if (a4)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __79__NPKPaymentProvisioningFlowController__secondaryFilteredFields_forCredential___block_invoke;
    v11[3] = &unk_24CFE9218;
    v11[4] = self;
    objc_msgSend(v6, "pk_objectsPassingTest:", v11);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;

  return v9;
}

uint64_t __79__NPKPaymentProvisioningFlowController__secondaryFilteredFields_forCredential___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_credentialReadonlyFieldIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3) ^ 1;

  return v5;
}

- (void)_transitionToSecondaryManualEntryWithFields:(id)a3 credential:(id)a4 requestContext:(id)a5
{
  id v8;
  PKPaymentSetupFieldsModel *fieldsModel;
  id v10;
  _BOOL8 v11;
  NPKPaymentProvisioningFlowControllerLocalDeviceManualEntryStepContext *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _BOOL8 v26;
  int v27;
  id v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  fieldsModel = self->_fieldsModel;
  v10 = a5;
  -[PKPaymentSetupFieldsModel updateWithPaymentSetupFields:](fieldsModel, "updateWithPaymentSetupFields:", a3);
  v11 = -[NPKPaymentProvisioningFlowController _fieldsModelCompleteExceptForLocalFields:](self, "_fieldsModelCompleteExceptForLocalFields:", self->_fieldsModel);
  if (v11)
  {
    v12 = -[NPKPaymentProvisioningFlowControllerLocalDeviceManualEntryStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerLocalDeviceManualEntryStepContext alloc], "initWithRequestContext:", v10);

    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (v14)
    {
      pk_Payment_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[PKPaymentSetupFieldsModel incompletePaymentSetupFields](self->_fieldsModel, "incompletePaymentSetupFields");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138412546;
        v28 = v8;
        v29 = 2048;
        v30 = objc_msgSend(v16, "count");
        _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Entered Local Device Manual Entry for credential %@. There are %lu incomplete fields.", (uint8_t *)&v27, 0x16u);

      }
      v17 = 192;
LABEL_10:

      goto LABEL_13;
    }
    v17 = 192;
  }
  else
  {
    v12 = -[NPKPaymentProvisioningFlowControllerSecondaryManualEntryStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerSecondaryManualEntryStepContext alloc], "initWithRequestContext:", v10);

    pk_Payment_log();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (v19)
    {
      pk_Payment_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        -[PKPaymentSetupFieldsModel incompletePaymentSetupFields](self->_fieldsModel, "incompletePaymentSetupFields");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = 138412546;
        v28 = v8;
        v29 = 2048;
        v30 = objc_msgSend(v20, "count");
        _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Entered Secondary Manual Entry for credential %@. There are %lu incomplete fields.", (uint8_t *)&v27, 0x16u);

      }
      v17 = 190;
      goto LABEL_10;
    }
    v17 = 190;
  }
LABEL_13:
  -[PKPaymentSetupFieldsModel paymentSetupFields](self->_fieldsModel, "paymentSetupFields");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowController _filteredPaymentSetupFields:forLocalDeviceEntry:](self, "_filteredPaymentSetupFields:forLocalDeviceEntry:", v21, v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKPaymentProvisioningFlowController _secondaryFilteredFields:forCredential:](self, "_secondaryFilteredFields:forCredential:", v22, v8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowControllerManualEntryStepContext setSetupFields:](v12, "setSetupFields:", v23);
  -[NPKPaymentProvisioningFlowControllerSecondaryManualEntryStepContext setCredential:](v12, "setCredential:", v8);
  -[PKPaymentProvisioningController credentialProvisioningQueue](self->_provisioningController, "credentialProvisioningQueue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25)
    v26 = 0;
  else
    v26 = v8 != 0;
  -[NPKPaymentProvisioningFlowStepContext setAllowsAddLater:](v12, "setAllowsAddLater:", v25 != 0);
  -[NPKPaymentProvisioningFlowControllerSecondaryManualEntryStepContext setAllowsAddingDifferentCard:](v12, "setAllowsAddingDifferentCard:", v26);
  -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", v17, v12);

}

- (void)_transitionToProductDisambiguationWithProducts:(id)a3 requestContext:(id)a4
{
  id v6;
  id v7;
  NPKPaymentProvisioningFlowControllerProductDisambiguationStepContext *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[NPKPaymentProvisioningFlowControllerProductDisambiguationStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerProductDisambiguationStepContext alloc], "initWithRequestContext:", v6);

  -[NPKPaymentProvisioningFlowControllerProductDisambiguationStepContext setProducts:](v8, "setProducts:", v7);
  -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", 195, v8);

}

- (void)_transitionToMoreInformationWithItems:(id)a3 pass:(id)a4 requestContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NPKPaymentProvisioningFlowControllerMoreInformationStepContext *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  pk_Payment_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 134217984;
      v16 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Entered more information step. There are %lu more info items", (uint8_t *)&v15, 0xCu);
    }

  }
  v14 = -[NPKPaymentProvisioningFlowControllerMoreInformationStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerMoreInformationStepContext alloc], "initWithRequestContext:", v9);

  -[NPKPaymentProvisioningFlowControllerMoreInformationStepContext setPaymentPass:](v14, "setPaymentPass:", v10);
  -[NPKPaymentProvisioningFlowControllerMoreInformationStepContext setMoreInfoItems:](v14, "setMoreInfoItems:", v8);
  -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", 157, v14);

}

- (void)_transitionToVerificationChannelsWithPaymentPass:(id)a3 channels:(id)a4 requestContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NPKPaymentProvisioningFlowControllerIssuerVerificationChannelsStepContext *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  pk_Payment_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 134217984;
      v16 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Entered verification options step. There are %lu channels", (uint8_t *)&v15, 0xCu);
    }

  }
  v14 = -[NPKPaymentProvisioningFlowControllerIssuerVerificationChannelsStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerIssuerVerificationChannelsStepContext alloc], "initWithRequestContext:", v9);

  -[NPKPaymentProvisioningFlowControllerIssuerVerificationChannelsStepContext setPaymentPass:](v14, "setPaymentPass:", v10);
  -[NPKPaymentProvisioningFlowControllerIssuerVerificationChannelsStepContext setVerificationChannels:](v14, "setVerificationChannels:", v8);
  -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", 230, v14);

}

- (void)_transitionToVerificationFieldsWithPaymentPass:(id)a3 fields:(id)a4 requestContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  NPKPaymentProvisioningFlowControllerIssuerVerificationFieldsStepContext *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_msgSend(v9, "count");
  pk_Payment_log();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    pk_Payment_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 134217984;
      v17 = v11;
      _os_log_impl(&dword_213518000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Entered verification fields step. There are %lu fields required", (uint8_t *)&v16, 0xCu);
    }

  }
  v15 = -[NPKPaymentProvisioningFlowControllerIssuerVerificationFieldsStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerIssuerVerificationFieldsStepContext alloc], "initWithRequestContext:", v8);

  -[NPKPaymentProvisioningFlowControllerIssuerVerificationFieldsStepContext setPaymentPass:](v15, "setPaymentPass:", v10);
  -[NPKPaymentProvisioningFlowControllerIssuerVerificationFieldsStepContext setVerificationFields:](v15, "setVerificationFields:", v9);

  -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", 240, v15);
}

- (void)_transitionToVerificationCodeWithPaymentPass:(id)a3 channel:(id)a4 requestContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  id v14;
  NPKPaymentProvisioningFlowControllerIssuerVerificationCodeStepContext *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  pk_Payment_log();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    pk_Payment_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "description");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v16 = 136315138;
      v17 = objc_msgSend(v14, "UTF8String");
      _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: Entered verification code step with channel %s", (uint8_t *)&v16, 0xCu);

    }
  }
  v15 = -[NPKPaymentProvisioningFlowControllerIssuerVerificationCodeStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerIssuerVerificationCodeStepContext alloc], "initWithRequestContext:", v9);

  -[NPKPaymentProvisioningFlowControllerIssuerVerificationCodeStepContext setPaymentPass:](v15, "setPaymentPass:", v10);
  -[NPKPaymentProvisioningFlowControllerIssuerVerificationCodeStepContext setVerificationChannel:](v15, "setVerificationChannel:", v8);
  -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", 250, v15);

}

- (void)_handleEndOfProvisioningFlowForCurrentPass:(id)a3 requestContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  _DWORD v17[2];
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17[0]) = 0;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: End of provisioning flow for current card", (uint8_t *)v17, 2u);
    }

  }
  self->_termsAcceptedOutOfBand = 0;
  -[PKPaymentProvisioningController credentialProvisioningQueue](self->_provisioningController, "credentialProvisioningQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "remaining");
  objc_msgSend(v11, "nextCredentialToProvision");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    pk_Payment_log();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      pk_Payment_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17[0] = 67109378;
        v17[1] = v12;
        v18 = 2112;
        v19 = v13;
        _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_DEFAULT, "Notice: %d credentials remaining; moving to credential: %@",
          (uint8_t *)v17,
          0x12u);
      }

    }
    -[NPKPaymentProvisioningFlowController _startProvisioningForCredential:requestContext:](self, "_startProvisioningForCredential:requestContext:", v13, v7);
  }
  else
  {
    -[NPKPaymentProvisioningFlowController _endProvisioningFlowWithSuccessForPass:requestContext:](self, "_endProvisioningFlowWithSuccessForPass:requestContext:", v6, v7);
  }

}

- (void)_endProvisioningFlowWithSuccessForPass:(id)a3 requestContext:(id)a4
{
  id v6;
  id v7;
  NPKPaymentProvisioningFlowControllerProvisioningResultStepContext *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[NPKPaymentProvisioningFlowControllerProvisioningResultStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerProvisioningResultStepContext alloc], "initWithRequestContext:", v6);

  -[NPKPaymentProvisioningFlowControllerProvisioningResultStepContext setCardAdded:](v8, "setCardAdded:", 1);
  -[NPKPaymentProvisioningFlowControllerProvisioningResultStepContext setProvisionedPass:](v8, "setProvisionedPass:", v7);

  -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", 220, v8);
}

- (void)_endProvisioningFlowWithError:(id)a3 requestContext:(id)a4
{
  id v6;
  id v7;
  NPKPaymentProvisioningFlowControllerProvisioningResultStepContext *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[NPKPaymentProvisioningFlowControllerProvisioningResultStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerProvisioningResultStepContext alloc], "initWithRequestContext:", v6);

  -[NPKPaymentProvisioningFlowControllerProvisioningResultStepContext setCardAdded:](v8, "setCardAdded:", 0);
  -[NPKPaymentProvisioningFlowControllerProvisioningResultStepContext setError:](v8, "setError:", v7);

  -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", 220, v8);
}

- (void)_performTransitionToStep:(int)a3 withContext:(id)a4
{
  uint64_t currentStep;
  NSString *v7;
  void *v8;
  NSString *chooseCredentialsStepIdentifier;
  void *v10;
  NSString *v11;
  NSString *immediatelyBeforeTermsStepIdentifier;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NPKPaymentProvisioningFlowControllerRequestContext *digitalIssuanceAmountRequestContext;
  void *v20;
  id v21;

  v21 = a4;
  if ((objc_msgSend(v21, "allowsAddLater") & 1) == 0
    && NPKPaymentProvisioningSetupContextIsSetupAssistant(self->_setupContext))
  {
    objc_msgSend(v21, "setAllowsAddLater:", 1);
  }
  if (((a3 - 100) > 0x39 || ((1 << (a3 - 100)) & 0x200000000100401) == 0)
    && a3 != 220)
  {
    if (a3 == 210 && (chooseCredentialsStepIdentifier = self->_immediatelyBeforeTermsStepIdentifier) != 0)
    {
      v10 = v21;
    }
    else
    {
      v13 = v21;
      if (a3 != 190 || !self->_chooseCredentialsStepIdentifier)
      {
        if (a3 != 150 || (digitalIssuanceAmountRequestContext = self->_digitalIssuanceAmountRequestContext) == 0)
        {
LABEL_22:
          objc_msgSend(v13, "backStepIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
          {
            objc_msgSend(v21, "requestContext");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "currentStepIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setBackStepIdentifier:", v18);

          }
          goto LABEL_6;
        }
        -[NPKPaymentProvisioningFlowControllerRequestContext currentStepIdentifier](digitalIssuanceAmountRequestContext, "currentStepIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setBackStepIdentifier:", v20);

LABEL_21:
        v13 = v21;
        goto LABEL_22;
      }
      objc_msgSend(v21, "secondaryManualEntryStepContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "credential");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v21;
      if (!v15)
        goto LABEL_22;
      chooseCredentialsStepIdentifier = self->_chooseCredentialsStepIdentifier;
      v10 = v21;
    }
    objc_msgSend(v10, "setBackStepIdentifier:", chooseCredentialsStepIdentifier);
    goto LABEL_21;
  }
LABEL_6:
  currentStep = self->_currentStep;
  self->_currentStep = a3;
  if (a3 == 200)
  {
    objc_msgSend(v21, "requestContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentStepIdentifier");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    immediatelyBeforeTermsStepIdentifier = self->_immediatelyBeforeTermsStepIdentifier;
    self->_immediatelyBeforeTermsStepIdentifier = v11;

    goto LABEL_14;
  }
  if (a3 == 140)
  {
    objc_msgSend(v21, "stepIdentifier");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->_chooseCredentialsStepIdentifier;
    self->_chooseCredentialsStepIdentifier = v7;
LABEL_14:

  }
  -[NPKPaymentProvisioningFlowController _sendDidTransitionFromStep:toStep:withContext:](self, "_sendDidTransitionFromStep:toStep:withContext:", currentStep, self->_currentStep, v21);

}

- (void)_sendDidTransitionFromStep:(int)a3 toStep:(int)a4 withContext:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  __CFString *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  __CFString *v19;
  __int16 v20;
  __CFString *v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v5 = *(_QWORD *)&a4;
  v6 = *(_QWORD *)&a3;
  v24 = *MEMORY[0x24BDAC8D0];
  v8 = (__CFString *)a5;
  pk_Payment_log();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    pk_Payment_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
LABEL_118:

      goto LABEL_119;
    }
    if ((int)v6 > 179)
    {
      if ((int)v6 <= 209)
      {
        switch((int)v6)
        {
          case 190:
            v12 = CFSTR("SecondaryManualEntry");
            break;
          case 191:
          case 194:
          case 196:
          case 198:
          case 199:
            goto LABEL_58;
          case 192:
            v12 = CFSTR("LocalDeviceManualEntry");
            break;
          case 193:
            v12 = CFSTR("LocalDeviceManualEntryProgress");
            break;
          case 195:
            v12 = CFSTR("ProductDisambiguation");
            break;
          case 197:
            v12 = CFSTR("PasscodeUpgrade");
            break;
          case 200:
            v12 = CFSTR("TermsAndConditions");
            break;
          default:
            if ((_DWORD)v6 != 180)
              goto LABEL_58;
            v12 = CFSTR("ManualEntry");
            break;
        }
LABEL_59:
        v13 = v12;
        if ((int)v5 > 179)
        {
          if ((int)v5 <= 209)
          {
            switch((int)v5)
            {
              case 190:
                v14 = CFSTR("SecondaryManualEntry");
                break;
              case 191:
              case 194:
              case 196:
              case 198:
              case 199:
                goto LABEL_114;
              case 192:
                v14 = CFSTR("LocalDeviceManualEntry");
                break;
              case 193:
                v14 = CFSTR("LocalDeviceManualEntryProgress");
                break;
              case 195:
                v14 = CFSTR("ProductDisambiguation");
                break;
              case 197:
                v14 = CFSTR("PasscodeUpgrade");
                break;
              case 200:
                v14 = CFSTR("TermsAndConditions");
                break;
              default:
                if ((_DWORD)v5 != 180)
                  goto LABEL_114;
                v14 = CFSTR("ManualEntry");
                break;
            }
            goto LABEL_115;
          }
          if ((int)v5 <= 239)
          {
            switch((_DWORD)v5)
            {
              case 0xD2:
                v14 = CFSTR("ProvisioningProgress");
                goto LABEL_115;
              case 0xDC:
                v14 = CFSTR("ProvisioningResult");
                goto LABEL_115;
              case 0xE6:
                v14 = CFSTR("IssuerVerificationChannels");
                goto LABEL_115;
            }
            goto LABEL_114;
          }
          if ((int)v5 > 259)
          {
            if ((_DWORD)v5 == 260)
            {
              v14 = CFSTR("AppleBalanceAccountDetails");
              goto LABEL_115;
            }
            if ((_DWORD)v5 == 300)
            {
              v14 = CFSTR("GetIssuerApplicationAddRequest");
              goto LABEL_115;
            }
            goto LABEL_114;
          }
          if ((_DWORD)v5 == 240)
          {
            v14 = CFSTR("IssuerVerificationFields");
            goto LABEL_115;
          }
          if ((_DWORD)v5 != 250)
            goto LABEL_114;
          v14 = CFSTR("IssuerVerificationCode");
        }
        else
        {
          if ((int)v5 > 134)
          {
            if ((int)v5 <= 154)
            {
              switch((int)v5)
              {
                case 135:
                  v14 = CFSTR("ChooseProduct");
                  break;
                case 137:
                  v14 = CFSTR("ChooseTransitProduct");
                  break;
                case 138:
                  v14 = CFSTR("ChooseEMoneyProduct");
                  break;
                case 140:
                  v14 = CFSTR("ChooseCredentials");
                  break;
                case 144:
                  v14 = CFSTR("ChooseTransitProductType");
                  break;
                case 145:
                  v14 = CFSTR("ChooseServiceProviderProducts");
                  break;
                case 150:
                  v14 = CFSTR("DigitalIssuanceAmount");
                  break;
                default:
                  goto LABEL_114;
              }
              goto LABEL_115;
            }
            if ((int)v5 > 159)
            {
              if ((_DWORD)v5 == 160)
              {
                v14 = CFSTR("ReaderModeEntry");
                goto LABEL_115;
              }
              if ((_DWORD)v5 == 165)
              {
                v14 = CFSTR("ReaderModeIngestion");
                goto LABEL_115;
              }
            }
            else
            {
              if ((_DWORD)v5 == 155)
              {
                v14 = CFSTR("DigitalIssuancePayment");
                goto LABEL_115;
              }
              if ((_DWORD)v5 == 157)
              {
                v14 = CFSTR("MoreInformation");
                goto LABEL_115;
              }
            }
LABEL_114:
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v5);
            v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_115;
          }
          if ((int)v5 > 119)
          {
            if ((_DWORD)v5 == 120)
            {
              v14 = CFSTR("Welcome");
              goto LABEL_115;
            }
            if ((_DWORD)v5 == 130)
            {
              v14 = CFSTR("ChooseFlow");
              goto LABEL_115;
            }
            goto LABEL_114;
          }
          if ((_DWORD)v5 == 100)
          {
            v14 = CFSTR("Initialized");
            goto LABEL_115;
          }
          if ((_DWORD)v5 != 110)
            goto LABEL_114;
          v14 = CFSTR("Preconditions");
        }
LABEL_115:
        v15 = CFSTR("<none>");
        *(_DWORD *)buf = 138412802;
        if (v8)
          v15 = v8;
        v19 = v13;
        v20 = 2112;
        v21 = v14;
        v22 = 2112;
        v23 = v15;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Flow controller change step from %@ to %@ with context: %@", buf, 0x20u);

        goto LABEL_118;
      }
      if ((int)v6 <= 239)
      {
        switch((_DWORD)v6)
        {
          case 0xD2:
            v12 = CFSTR("ProvisioningProgress");
            goto LABEL_59;
          case 0xDC:
            v12 = CFSTR("ProvisioningResult");
            goto LABEL_59;
          case 0xE6:
            v12 = CFSTR("IssuerVerificationChannels");
            goto LABEL_59;
        }
      }
      else if ((int)v6 > 259)
      {
        if ((_DWORD)v6 == 260)
        {
          v12 = CFSTR("AppleBalanceAccountDetails");
          goto LABEL_59;
        }
        if ((_DWORD)v6 == 300)
        {
          v12 = CFSTR("GetIssuerApplicationAddRequest");
          goto LABEL_59;
        }
      }
      else
      {
        if ((_DWORD)v6 == 240)
        {
          v12 = CFSTR("IssuerVerificationFields");
          goto LABEL_59;
        }
        if ((_DWORD)v6 == 250)
        {
          v12 = CFSTR("IssuerVerificationCode");
          goto LABEL_59;
        }
      }
    }
    else if ((int)v6 <= 134)
    {
      if ((int)v6 > 119)
      {
        if ((_DWORD)v6 == 120)
        {
          v12 = CFSTR("Welcome");
          goto LABEL_59;
        }
        if ((_DWORD)v6 == 130)
        {
          v12 = CFSTR("ChooseFlow");
          goto LABEL_59;
        }
      }
      else
      {
        if ((_DWORD)v6 == 100)
        {
          v12 = CFSTR("Initialized");
          goto LABEL_59;
        }
        if ((_DWORD)v6 == 110)
        {
          v12 = CFSTR("Preconditions");
          goto LABEL_59;
        }
      }
    }
    else
    {
      if ((int)v6 <= 154)
      {
        switch((int)v6)
        {
          case 135:
            v12 = CFSTR("ChooseProduct");
            break;
          case 137:
            v12 = CFSTR("ChooseTransitProduct");
            break;
          case 138:
            v12 = CFSTR("ChooseEMoneyProduct");
            break;
          case 140:
            v12 = CFSTR("ChooseCredentials");
            break;
          case 144:
            v12 = CFSTR("ChooseTransitProductType");
            break;
          case 145:
            v12 = CFSTR("ChooseServiceProviderProducts");
            break;
          case 150:
            v12 = CFSTR("DigitalIssuanceAmount");
            break;
          default:
            goto LABEL_58;
        }
        goto LABEL_59;
      }
      if ((int)v6 > 159)
      {
        if ((_DWORD)v6 == 160)
        {
          v12 = CFSTR("ReaderModeEntry");
          goto LABEL_59;
        }
        if ((_DWORD)v6 == 165)
        {
          v12 = CFSTR("ReaderModeIngestion");
          goto LABEL_59;
        }
      }
      else
      {
        if ((_DWORD)v6 == 155)
        {
          v12 = CFSTR("DigitalIssuancePayment");
          goto LABEL_59;
        }
        if ((_DWORD)v6 == 157)
        {
          v12 = CFSTR("MoreInformation");
          goto LABEL_59;
        }
      }
    }
LABEL_58:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_59;
  }
LABEL_119:
  NPKAnalyticsEventForProvisioningFlowStepTransition(v6, v5, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6E9C8], "subject:sendEvent:", CFSTR("provisioning"), v16);
  -[NPKPaymentProvisioningFlowController delegate](self, "delegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "paymentProvisioningFlowController:didTransitionFromStep:toStep:withContext:", self, v6, v5, v8);

}

- (void)_sendDidEncounterError:(id)a3 requestContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  pk_Payment_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    pk_Payment_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Flow controller encountered error: %@", (uint8_t *)&v14, 0xCu);
    }

  }
  if (v6)
  {
    v11 = (void *)MEMORY[0x24BE6E9C8];
    NPKAnalyticsEventForError(CFSTR("nonFatalError"), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subject:sendEvent:", CFSTR("provisioning"), v12);

  }
  -[NPKPaymentProvisioningFlowController delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "paymentProvisioningFlowController:didEncounterError:requestContext:", self, v6, v7);

}

- (id)_requiredFieldsFromRequirementsResponseExcludingLocalFields
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  uint8_t v10[8];
  _QWORD v11[5];

  -[NPKPaymentProvisioningFlowController _requiredFieldsFromRequirementsResponse](self, "_requiredFieldsFromRequirementsResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_separateLocalDeviceEntryRequired)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __99__NPKPaymentProvisioningFlowController__requiredFieldsFromRequirementsResponseExcludingLocalFields__block_invoke;
    v11[3] = &unk_24CFE9218;
    v11[4] = self;
    objc_msgSend(v3, "pk_objectsPassingTest:", v11);
    v5 = objc_claimAutoreleasedReturnValue();
    if ((PKEqualObjects() & 1) == 0)
    {
      pk_Payment_log();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

      if (v7)
      {
        pk_Payment_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Filtered required fields based on local device entry requirement", v10, 2u);
        }

      }
    }

    v4 = (void *)v5;
  }
  return v4;
}

uint64_t __99__NPKPaymentProvisioningFlowController__requiredFieldsFromRequirementsResponseExcludingLocalFields__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fieldRequiresLocalEntry:", a2) ^ 1;
}

- (id)_localRequiredFieldsFromRequirementsResponse
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  if (!self->_separateLocalDeviceEntryRequired)
    return MEMORY[0x24BDBD1A8];
  -[NPKPaymentProvisioningFlowController _requiredFieldsFromRequirementsResponse](self, "_requiredFieldsFromRequirementsResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __84__NPKPaymentProvisioningFlowController__localRequiredFieldsFromRequirementsResponse__block_invoke;
  v6[3] = &unk_24CFE9218;
  v6[4] = self;
  objc_msgSend(v3, "pk_objectsPassingTest:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __84__NPKPaymentProvisioningFlowController__localRequiredFieldsFromRequirementsResponse__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fieldRequiresLocalEntry:", a2);
}

- (BOOL)_fieldsModelCompleteExceptForLocalFields:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  _BOOL4 v17;
  BOOL v18;
  char v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  _BYTE v30[10];
  _DWORD v31[4];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_separateLocalDeviceEntryRequired)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v24 = v4;
    objc_msgSend(v4, "paymentSetupFields");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = 0;
      v10 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v26 != v10)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if ((objc_msgSend(v12, "submissionStringMeetsAllRequirements") & 1) == 0)
          {
            pk_Payment_log();
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

            if (v14)
            {
              pk_Payment_log();
              v15 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v12, "identifier");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = -[NPKPaymentProvisioningFlowController _fieldRequiresLocalEntry:](self, "_fieldRequiresLocalEntry:", v12);
                *(_DWORD *)buf = 138412546;
                *(_QWORD *)v30 = v16;
                *(_WORD *)&v30[8] = 1024;
                v31[0] = v17;
                _os_log_impl(&dword_213518000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Field %@ is incomplete requires local entry %d", buf, 0x12u);

              }
            }
            v18 = -[NPKPaymentProvisioningFlowController _fieldRequiresLocalEntry:](self, "_fieldRequiresLocalEntry:", v12);
            v8 |= !v18;
            v9 |= v18;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }

    v19 = v9 & (v8 ^ 1);
    pk_Payment_log();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

    if (v21)
    {
      pk_Payment_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v30 = v19 & 1;
        *(_WORD *)&v30[4] = 1024;
        *(_DWORD *)&v30[6] = v9 & 1;
        LOWORD(v31[0]) = 1024;
        *(_DWORD *)((char *)v31 + 2) = v8 & 1;
        _os_log_impl(&dword_213518000, v22, OS_LOG_TYPE_DEFAULT, "Notice: Complete except for local fields %d local %d non local %d", buf, 0x14u);
      }

    }
    v4 = v24;
  }
  else
  {
    v19 = 0;
  }

  return v19 & 1;
}

- (BOOL)_fieldRequiresLocalEntry:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE6F720]);

  return v4;
}

- (id)_filteredPaymentSetupFields:(id)a3 forLocalDeviceEntry:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  BOOL v12;

  v6 = a3;
  v7 = v6;
  if (self->_separateLocalDeviceEntryRequired)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __88__NPKPaymentProvisioningFlowController__filteredPaymentSetupFields_forLocalDeviceEntry___block_invoke;
    v11[3] = &unk_24CFE9240;
    v11[4] = self;
    v12 = a4;
    objc_msgSend(v6, "pk_objectsPassingTest:", v11);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;

  return v9;
}

BOOL __88__NPKPaymentProvisioningFlowController__filteredPaymentSetupFields_forLocalDeviceEntry___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(unsigned __int8 *)(a1 + 40) == objc_msgSend(*(id *)(a1 + 32), "_fieldRequiresLocalEntry:", a2);
}

- (id)_requiredFieldsFromRequirementsResponse
{
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[PKPaymentProvisioningController requirementsResponse](self->_provisioningController, "requirementsResponse");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  pk_Payment_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    pk_Payment_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(v3, "status");
      -[PKPaymentProvisioningController productIdentifier](self->_provisioningController, "productIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v26 = v7;
      v27 = 2112;
      v28 = v8;
      _os_log_impl(&dword_213518000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Determining required fields for response status %ld and product identifier %@", buf, 0x16u);

    }
  }
  if (objc_msgSend(v3, "status") == 1)
  {
    objc_msgSend(v3, "requiredPaymentSetupFields");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "status") == 2
         && (-[PKPaymentProvisioningController productIdentifier](self->_provisioningController, "productIdentifier"),
             v10 = (void *)objc_claimAutoreleasedReturnValue(),
             v10,
             v10))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(v3, "possibleProducts", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v15, "productIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPaymentProvisioningController productIdentifier](self->_provisioningController, "productIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqualToString:", v17);

          if (v18)
          {
            v12 = v15;
            goto LABEL_20;
          }
        }
        v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_20:

    objc_msgSend(v12, "requiredFields");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v9;
}

- (void)_configureWebServiceIfNecessary:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "needsConfiguration"))
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __83__NPKPaymentProvisioningFlowController__configureWebServiceIfNecessary_completion___block_invoke;
    v12[3] = &unk_24CFE9290;
    v7 = &v13;
    v13 = v6;
    v8 = v6;
    objc_msgSend(v5, "configurePaymentServiceWithCompletion:", v12);
  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __83__NPKPaymentProvisioningFlowController__configureWebServiceIfNecessary_completion___block_invoke_3;
    v10[3] = &unk_24CFE7B00;
    v7 = &v11;
    v11 = v6;
    v9 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], v10);
  }

}

void __83__NPKPaymentProvisioningFlowController__configureWebServiceIfNecessary_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  uint64_t v10;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__NPKPaymentProvisioningFlowController__configureWebServiceIfNecessary_completion___block_invoke_2;
  block[3] = &unk_24CFE9268;
  v9 = *(id *)(a1 + 32);
  v10 = a2;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __83__NPKPaymentProvisioningFlowController__configureWebServiceIfNecessary_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

uint64_t __83__NPKPaymentProvisioningFlowController__configureWebServiceIfNecessary_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_verifyPasscodeStateIfNecessaryWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (void)_requestPassDetailsForAccountCredential:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  PKPaymentProvisioningController *provisioningController;
  _QWORD v11[4];
  id v12;
  void (**v13)(id, void *, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(v6, "passDetailsResponse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v7)
    {
      objc_msgSend(v6, "passDetailsResponse");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, v9, 0);

    }
  }
  else
  {
    provisioningController = self->_provisioningController;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __102__NPKPaymentProvisioningFlowController__requestPassDetailsForAccountCredential_withCompletionHandler___block_invoke;
    v11[3] = &unk_24CFE92E0;
    v13 = v7;
    v12 = v6;
    -[PKPaymentProvisioningController setupAccountCredentialForProvisioning:completion:](provisioningController, "setupAccountCredentialForProvisioning:completion:", v12, v11);

  }
}

void __102__NPKPaymentProvisioningFlowController__requestPassDetailsForAccountCredential_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v4 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __102__NPKPaymentProvisioningFlowController__requestPassDetailsForAccountCredential_withCompletionHandler___block_invoke_2;
  block[3] = &unk_24CFE92B8;
  v9 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v8 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __102__NPKPaymentProvisioningFlowController__requestPassDetailsForAccountCredential_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v3;

  v1 = *(_QWORD *)(a1 + 48);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "passDetailsResponse");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v3, *(_QWORD *)(a1 + 40));

  }
}

- (NPKFidoAuthCoordinator)fidoAuthCoordinator
{
  NPKFidoAuthCoordinator *fidoAuthCoordinator;
  NPKFidoAuthCoordinator *v4;
  NPKFidoAuthCoordinator *v5;

  fidoAuthCoordinator = self->_fidoAuthCoordinator;
  if (!fidoAuthCoordinator)
  {
    v4 = objc_alloc_init(NPKFidoAuthCoordinator);
    v5 = self->_fidoAuthCoordinator;
    self->_fidoAuthCoordinator = v4;

    fidoAuthCoordinator = self->_fidoAuthCoordinator;
  }
  return fidoAuthCoordinator;
}

- (NPKPaymentProvisioningFlowControllerDelegate)delegate
{
  return (NPKPaymentProvisioningFlowControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKPaymentProvisioningController)provisioningController
{
  return self->_provisioningController;
}

- (int64_t)setupContext
{
  return self->_setupContext;
}

- (BOOL)isReaderModeProvisioningSupported
{
  return self->_readerModeProvisioningSupported;
}

- (void)setReaderModeProvisioningSupported:(BOOL)a3
{
  self->_readerModeProvisioningSupported = a3;
}

- (BOOL)isDigitalIssuanceSupported
{
  return self->_digitalIssuanceSupported;
}

- (void)setDigitalIssuanceSupported:(BOOL)a3
{
  self->_digitalIssuanceSupported = a3;
}

- (BOOL)isSeparateLocalDeviceEntryRequired
{
  return self->_separateLocalDeviceEntryRequired;
}

- (void)setSeparateLocalDeviceEntryRequired:(BOOL)a3
{
  self->_separateLocalDeviceEntryRequired = a3;
}

- (PKPaymentAuthorizationController)unitTestingAuthorizationController
{
  return self->_unitTestingAuthorizationController;
}

- (void)setUnitTestingAuthorizationController:(id)a3
{
  objc_storeStrong((id *)&self->_unitTestingAuthorizationController, a3);
}

- (PKContactlessCardIngester)unitTestingCardIngester
{
  return self->_unitTestingCardIngester;
}

- (void)setUnitTestingCardIngester:(id)a3
{
  objc_storeStrong((id *)&self->_unitTestingCardIngester, a3);
}

- (PKAddPaymentPassRequestConfiguration)inAppProvisioningRequestConfiguration
{
  return self->_inAppProvisioningRequestConfiguration;
}

- (void)setInAppProvisioningRequestConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_inAppProvisioningRequestConfiguration, a3);
}

- (PKAddPaymentPassRequest)inAppProvisioningRequest
{
  return self->_inAppProvisioningRequest;
}

- (void)setInAppProvisioningRequest:(id)a3
{
  objc_storeStrong((id *)&self->_inAppProvisioningRequest, a3);
}

- (NSData)inAppProvisioningPublicKeyHash
{
  return self->_inAppProvisioningPublicKeyHash;
}

- (void)setInAppProvisioningPublicKeyHash:(id)a3
{
  objc_storeStrong((id *)&self->_inAppProvisioningPublicKeyHash, a3);
}

- (NSData)inAppProvisioningNonce
{
  return self->_inAppProvisioningNonce;
}

- (void)setInAppProvisioningNonce:(id)a3
{
  objc_storeStrong((id *)&self->_inAppProvisioningNonce, a3);
}

- (OS_dispatch_source)inAppProvisioningGetRequestTimer
{
  return self->_inAppProvisioningGetRequestTimer;
}

- (void)setInAppProvisioningGetRequestTimer:(id)a3
{
  objc_storeStrong((id *)&self->_inAppProvisioningGetRequestTimer, a3);
}

- (void)setFidoAuthCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_fidoAuthCoordinator, a3);
}

- (PKPaymentWebService)webService
{
  return self->_webService;
}

- (void)setWebService:(id)a3
{
  objc_storeStrong((id *)&self->_webService, a3);
}

- (int)currentStep
{
  return self->_currentStep;
}

- (void)setCurrentStep:(int)a3
{
  self->_currentStep = a3;
}

- (NPKPaymentProvisioningFlowControllerPreconditionsStepContext)preconditionsRequestContext
{
  return self->_preconditionsRequestContext;
}

- (void)setPreconditionsRequestContext:(id)a3
{
  objc_storeStrong((id *)&self->_preconditionsRequestContext, a3);
}

- (NSString)chooseCredentialsStepIdentifier
{
  return self->_chooseCredentialsStepIdentifier;
}

- (void)setChooseCredentialsStepIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_chooseCredentialsStepIdentifier, a3);
}

- (NSString)immediatelyBeforeTermsStepIdentifier
{
  return self->_immediatelyBeforeTermsStepIdentifier;
}

- (void)setImmediatelyBeforeTermsStepIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_immediatelyBeforeTermsStepIdentifier, a3);
}

- (PKPaymentSetupFieldsModel)fieldsModel
{
  return self->_fieldsModel;
}

- (void)setFieldsModel:(id)a3
{
  objc_storeStrong((id *)&self->_fieldsModel, a3);
}

- (NSObject)progressNotificationToken
{
  return self->_progressNotificationToken;
}

- (void)setProgressNotificationToken:(id)a3
{
  objc_storeStrong((id *)&self->_progressNotificationToken, a3);
}

- (NPKPaymentProvisioningFlowControllerRequestContext)provisioningProgressRequestContext
{
  return self->_provisioningProgressRequestContext;
}

- (void)setProvisioningProgressRequestContext:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningProgressRequestContext, a3);
}

- (PKPaymentPass)issuerVerificationPass
{
  return self->_issuerVerificationPass;
}

- (void)setIssuerVerificationPass:(id)a3
{
  objc_storeStrong((id *)&self->_issuerVerificationPass, a3);
}

- (PKPaymentCredential)currentCredential
{
  return self->_currentCredential;
}

- (void)setCurrentCredential:(id)a3
{
  objc_storeStrong((id *)&self->_currentCredential, a3);
}

- (PKAppleBalanceCredential)currentAppleBalanceCredential
{
  return self->_currentAppleBalanceCredential;
}

- (void)setCurrentAppleBalanceCredential:(id)a3
{
  objc_storeStrong((id *)&self->_currentAppleBalanceCredential, a3);
}

- (PKPaymentSetupProduct)currentProduct
{
  return self->_currentProduct;
}

- (void)setCurrentProduct:(id)a3
{
  objc_storeStrong((id *)&self->_currentProduct, a3);
}

- (unint64_t)termsReason
{
  return self->_termsReason;
}

- (void)setTermsReason:(unint64_t)a3
{
  self->_termsReason = a3;
}

- (BOOL)termsAcceptedOutOfBand
{
  return self->_termsAcceptedOutOfBand;
}

- (void)setTermsAcceptedOutOfBand:(BOOL)a3
{
  self->_termsAcceptedOutOfBand = a3;
}

- (PKPaymentRequest)digitalIssuancePaymentRequest
{
  return self->_digitalIssuancePaymentRequest;
}

- (void)setDigitalIssuancePaymentRequest:(id)a3
{
  objc_storeStrong((id *)&self->_digitalIssuancePaymentRequest, a3);
}

- (NSDecimalNumber)digitalIssuanceAmount
{
  return self->_digitalIssuanceAmount;
}

- (void)setDigitalIssuanceAmount:(id)a3
{
  objc_storeStrong((id *)&self->_digitalIssuanceAmount, a3);
}

- (PKServiceProviderPurchase)digitalIssuancePurchase
{
  return self->_digitalIssuancePurchase;
}

- (void)setDigitalIssuancePurchase:(id)a3
{
  objc_storeStrong((id *)&self->_digitalIssuancePurchase, a3);
}

- (NPKPaymentProvisioningFlowControllerRequestContext)digitalIssuanceAmountRequestContext
{
  return self->_digitalIssuanceAmountRequestContext;
}

- (void)setDigitalIssuanceAmountRequestContext:(id)a3
{
  objc_storeStrong((id *)&self->_digitalIssuanceAmountRequestContext, a3);
}

- (NPKPaymentProvisioningFlowControllerRequestContext)digitalIssuancePaymentRequestContext
{
  return self->_digitalIssuancePaymentRequestContext;
}

- (void)setDigitalIssuancePaymentRequestContext:(id)a3
{
  objc_storeStrong((id *)&self->_digitalIssuancePaymentRequestContext, a3);
}

- (PKPaymentAuthorizationController)authorizationController
{
  return self->_authorizationController;
}

- (void)setAuthorizationController:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationController, a3);
}

- (PKContactlessCardIngester)cardIngester
{
  return self->_cardIngester;
}

- (void)setCardIngester:(id)a3
{
  objc_storeStrong((id *)&self->_cardIngester, a3);
}

- (unint64_t)internalIngestionState
{
  return self->_internalIngestionState;
}

- (void)setInternalIngestionState:(unint64_t)a3
{
  self->_internalIngestionState = a3;
}

- (unint64_t)flowIngestionState
{
  return self->_flowIngestionState;
}

- (void)setFlowIngestionState:(unint64_t)a3
{
  self->_flowIngestionState = a3;
}

- (double)ingestionProgress
{
  return self->_ingestionProgress;
}

- (void)setIngestionProgress:(double)a3
{
  self->_ingestionProgress = a3;
}

- (unint64_t)ingestionStateOnRetry
{
  return self->_ingestionStateOnRetry;
}

- (void)setIngestionStateOnRetry:(unint64_t)a3
{
  self->_ingestionStateOnRetry = a3;
}

- (NSString)ingestionCardSessionToken
{
  return self->_ingestionCardSessionToken;
}

- (void)setIngestionCardSessionToken:(id)a3
{
  objc_storeStrong((id *)&self->_ingestionCardSessionToken, a3);
}

- (OS_dispatch_source)ingestionCardNotFoundTimer
{
  return self->_ingestionCardNotFoundTimer;
}

- (void)setIngestionCardNotFoundTimer:(id)a3
{
  objc_storeStrong((id *)&self->_ingestionCardNotFoundTimer, a3);
}

- (PKPaymentProvisioningMethodMetadata)ingestionMethodMetadata
{
  return self->_ingestionMethodMetadata;
}

- (void)setIngestionMethodMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_ingestionMethodMetadata, a3);
}

- (NPKPaymentProvisioningFlowControllerRequestContext)readerModeRequestContext
{
  return self->_readerModeRequestContext;
}

- (void)setReaderModeRequestContext:(id)a3
{
  objc_storeStrong((id *)&self->_readerModeRequestContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerModeRequestContext, 0);
  objc_storeStrong((id *)&self->_ingestionMethodMetadata, 0);
  objc_storeStrong((id *)&self->_ingestionCardNotFoundTimer, 0);
  objc_storeStrong((id *)&self->_ingestionCardSessionToken, 0);
  objc_storeStrong((id *)&self->_cardIngester, 0);
  objc_storeStrong((id *)&self->_authorizationController, 0);
  objc_storeStrong((id *)&self->_digitalIssuancePaymentRequestContext, 0);
  objc_storeStrong((id *)&self->_digitalIssuanceAmountRequestContext, 0);
  objc_storeStrong((id *)&self->_digitalIssuancePurchase, 0);
  objc_storeStrong((id *)&self->_digitalIssuanceAmount, 0);
  objc_storeStrong((id *)&self->_digitalIssuancePaymentRequest, 0);
  objc_storeStrong((id *)&self->_currentProduct, 0);
  objc_storeStrong((id *)&self->_currentAppleBalanceCredential, 0);
  objc_storeStrong((id *)&self->_currentCredential, 0);
  objc_storeStrong((id *)&self->_issuerVerificationPass, 0);
  objc_storeStrong((id *)&self->_provisioningProgressRequestContext, 0);
  objc_storeStrong((id *)&self->_progressNotificationToken, 0);
  objc_storeStrong((id *)&self->_fieldsModel, 0);
  objc_storeStrong((id *)&self->_immediatelyBeforeTermsStepIdentifier, 0);
  objc_storeStrong((id *)&self->_chooseCredentialsStepIdentifier, 0);
  objc_storeStrong((id *)&self->_preconditionsRequestContext, 0);
  objc_storeStrong((id *)&self->_webService, 0);
  objc_storeStrong((id *)&self->_fidoAuthCoordinator, 0);
  objc_storeStrong((id *)&self->_inAppProvisioningGetRequestTimer, 0);
  objc_storeStrong((id *)&self->_inAppProvisioningNonce, 0);
  objc_storeStrong((id *)&self->_inAppProvisioningPublicKeyHash, 0);
  objc_storeStrong((id *)&self->_inAppProvisioningRequest, 0);
  objc_storeStrong((id *)&self->_inAppProvisioningRequestConfiguration, 0);
  objc_storeStrong((id *)&self->_unitTestingCardIngester, 0);
  objc_storeStrong((id *)&self->_unitTestingAuthorizationController, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (id)_flowPickerSectionsWithContext:(int64_t)a3 provisioningController:(id)a4 readerModeSupported:(BOOL)a5 digitalIssuanceSupported:(BOOL)a6
{
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v7 = a5;
  v10 = a4;
  objc_msgSend(v10, "webService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PKCurrentMobileCarrierRegion();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "paymentSetupProductModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v22) = a6;
  objc_msgSend(a1, "_filteredPaymentSetupProducts:localCredentials:setupContext:webService:mobileCarrierRegion:readerModeSupported:digitalIssuanceSupported:", v13, 0, a3, v11, v12, v7, v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__7;
  v30 = __Block_byref_object_dispose__7;
  v31 = 0;
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __154__NPKPaymentProvisioningFlowController_FlowSelection___flowPickerSectionsWithContext_provisioningController_readerModeSupported_digitalIssuanceSupported___block_invoke;
  v23[3] = &unk_24CFE9868;
  v25 = &v26;
  v16 = v15;
  v24 = v16;
  v17 = (void *)MEMORY[0x2199B6780](v23);
  objc_msgSend((id)objc_opt_class(), "_addGroupedItemsToSections:fromModel:webService:paymentSection:", v16, v14, v11, v17);
  objc_msgSend((id)objc_opt_class(), "_addAppleBalanceToSections:fromModel:", v16, v14);
  if (objc_msgSend(v16, "count"))
    objc_msgSend((id)objc_opt_class(), "_addCreditDebitItemToSection:webService:", v17, v11);
  if (v27[5])
  {
    objc_msgSend(v16, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)v27[5];

    if (v18 != v19)
    {
      objc_msgSend(v16, "removeObject:", v27[5]);
      objc_msgSend(v16, "insertObject:atIndex:", v27[5], 0);
    }
  }
  v20 = v16;

  _Block_object_dispose(&v26, 8);
  return v20;
}

id __154__NPKPaymentProvisioningFlowController_FlowSelection___flowPickerSectionsWithContext_provisioningController_readerModeSupported_digitalIssuanceSupported___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v2)
  {
    PKLocalizedPaymentString(CFSTR("CARD_TYPE_PAYMENT_SECTION_HEADER"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[NPKPaymentProvisioningFlowPickerSection sectionWithTitle:productType:](NPKPaymentProvisioningFlowPickerSection, "sectionWithTitle:productType:", v3, &unk_24D056578);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Added products section with title: %@", (uint8_t *)&v10, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  }
  return v2;
}

+ (id)_filteredPaymentSetupProducts:(id)a3 localCredentials:(id)a4 setupContext:(int64_t)a5 webService:(id)a6 mobileCarrierRegion:(id)a7 readerModeSupported:(BOOL)a8 digitalIssuanceSupported:(BOOL)a9
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  const char *v30;
  uint32_t v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  const char *v37;
  uint32_t v38;
  int IsAvailable;
  _BOOL4 v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  id v57;
  void *v59;
  id v60;
  void *v61;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  int64_t v67;
  void *v68;
  id v69;
  NSObject *v70;
  void *v71;
  id obj;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t v82[128];
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  _BYTE v89[128];
  uint64_t v90;

  LODWORD(v18) = a8;
  v90 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v60 = a4;
  v14 = a6;
  v15 = a7;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  PKOSVersion();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  PKDeviceClass();
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v14;
  objc_msgSend(v14, "targetDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "deviceRegion");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v18;
  v67 = a5;
  if (a9 && !NPKPaymentProvisioningSetupContextIsSetupAssistant(a5))
    v18 = v18 | 2;
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v61 = v13;
  objc_msgSend(v13, "allSetupProducts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v79;
    v68 = v16;
    v69 = v15;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v79 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v22);
        if ((objc_msgSend(v23, "supportsOSVersion:deviceClass:", v16, v73) & 1) == 0)
        {
          PKLogFacilityTypeGetObject();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v23, "displayName");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v84 = v28;
            v29 = v27;
            v30 = "Product: %@ is not supported due to device OS version";
            v31 = 12;
            goto LABEL_14;
          }
LABEL_15:
          v26 = 0;
LABEL_16:

          goto LABEL_17;
        }
        objc_msgSend(v23, "configuration");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "type");

        if (v25 != 3)
        {
          if (v71)
          {
            objc_msgSend(v23, "regions");
            v27 = objc_claimAutoreleasedReturnValue();
            if ((-[NSObject containsObject:](v27, "containsObject:", v71) & 1) != 0)
            {
              v26 = 1;
              v70 = v27;
              goto LABEL_16;
            }
            if (!v15)
            {

              v70 = v27;
LABEL_70:
              PKLogFacilityTypeGetObject();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v23, "displayName");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v84 = v28;
                v85 = 2112;
                v86 = (uint64_t)v71;
                v87 = 2112;
                v88 = (uint64_t)v15;
                v29 = v27;
                v30 = "Product: %@ is not supported in neither this device region: %@, nor mobile carrier region: %@";
                v31 = 32;
LABEL_14:
                _os_log_impl(&dword_213518000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, v31);

              }
              goto LABEL_15;
            }
            v70 = v27;
          }
          else if (!v15)
          {
            goto LABEL_70;
          }
          objc_msgSend(v23, "regions");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "containsObject:", v15);

          if (v71)
          if ((v48 & 1) == 0)
            goto LABEL_70;
        }
        v26 = 1;
LABEL_17:
        v32 = objc_msgSend(v23, "supportedProvisioningMethods");
        if (v26 && (v32 & v18) == 0)
        {
          PKLogFacilityTypeGetObject();
          v33 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            goto LABEL_58;
          objc_msgSend(v23, "displayName");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v23, "supportedProvisioningMethods");
          *(_DWORD *)buf = 138412802;
          v84 = v34;
          v85 = 2048;
          v86 = v18;
          v87 = 2048;
          v88 = v35;
          v36 = v33;
          v37 = "Product: %@ is not supported due to no matching provisioning methods (local supported methods %lu, produ"
                "ct supported methods %lu)";
          v38 = 32;
          goto LABEL_57;
        }
        if ((v26 & 1) == 0)
        {
          PKLogFacilityTypeGetObject();
          v33 = objc_claimAutoreleasedReturnValue();
          goto LABEL_59;
        }
        if ((objc_msgSend(v23, "allSupportedProtocols") & 4) != 0)
        {
          IsAvailable = PKFelicaSecureElementIsAvailable();
          PKLogFacilityTypeGetObject();
          v33 = objc_claimAutoreleasedReturnValue();
          v40 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
          if (!IsAvailable)
          {
            if (!v40)
              goto LABEL_58;
            objc_msgSend(v23, "displayName");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v84 = v34;
            v36 = v33;
            v37 = "Product: %@ is not supported due to lack of Type F support";
            goto LABEL_56;
          }
          if (v40)
          {
            objc_msgSend(v23, "displayName");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v84 = v41;
            _os_log_impl(&dword_213518000, v33, OS_LOG_TYPE_DEFAULT, "Product: %@ is supported due to available Type F support", buf, 0xCu);

          }
        }
        if (!PKSecureElementIsAvailable())
        {
          PKLogFacilityTypeGetObject();
          v33 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            goto LABEL_58;
          objc_msgSend(v23, "displayName");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v84 = v34;
          v36 = v33;
          v37 = "Product: %@ is not supported due to lack of SE";
LABEL_56:
          v38 = 12;
LABEL_57:
          _os_log_impl(&dword_213518000, v36, OS_LOG_TYPE_DEFAULT, v37, buf, v38);

          goto LABEL_58;
        }
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_38;
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        objc_msgSend(v23, "paymentOptions");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
        if (!v43)
        {
LABEL_37:

          v16 = v68;
          v15 = v69;
LABEL_38:
          PKLogFacilityTypeGetObject();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v23, "displayName");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v84 = v34;
            v36 = v33;
            v37 = "Product: %@ is not supported on device";
            goto LABEL_56;
          }
LABEL_58:

LABEL_59:
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v23, "displayName");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v84 = v49;
            _os_log_impl(&dword_213518000, v33, OS_LOG_TYPE_DEFAULT, "Product: %@ is unsupported and will not be shown in the flow picker", buf, 0xCu);

          }
          goto LABEL_61;
        }
        v44 = v43;
        v45 = *(_QWORD *)v75;
LABEL_31:
        v46 = 0;
        while (1)
        {
          if (*(_QWORD *)v75 != v45)
            objc_enumerationMutation(v42);
          if ((objc_msgSend(v17, "supportsCredentialType:", objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * v46), "cardType")) & 1) != 0)break;
          if (v44 == ++v46)
          {
            v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
            if (v44)
              goto LABEL_31;
            goto LABEL_37;
          }
        }

        if (v67 == 1 && objc_msgSend(v23, "hsa2Requirement") == 2 && (objc_msgSend(a1, "_isHSA2Enabled") & 1) == 0)
        {
          PKLogFacilityTypeGetObject();
          v33 = objc_claimAutoreleasedReturnValue();
          v16 = v68;
          v15 = v69;
          if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            goto LABEL_58;
          objc_msgSend(v23, "displayName");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v84 = v34;
          v36 = v33;
          v37 = "Product: %@ is not supported in setup context due to HSA requirement";
          goto LABEL_56;
        }
        objc_msgSend(v23, "configuration");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = objc_msgSend(v50, "state");

        v16 = v68;
        v15 = v69;
        if (v51 == 2)
        {
          PKLogFacilityTypeGetObject();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v23, "displayName");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "configuration");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "state");
            PKPaymentSetupProductStateToString();
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v84 = v63;
            v85 = 2112;
            v86 = (uint64_t)v52;
            _os_log_impl(&dword_213518000, v33, OS_LOG_TYPE_DEFAULT, "Product: %@ not supported. Product state is: %@. Previously provisioned to device?", buf, 0x16u);

          }
          goto LABEL_58;
        }
        v33 = v23;
        PKLogFacilityTypeGetObject();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject displayName](v33, "displayName");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject productIdentifier](v33, "productIdentifier");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject provisioningMethodTypes](v33, "provisioningMethodTypes");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v84 = v65;
          v85 = 2112;
          v86 = (uint64_t)v54;
          v87 = 2112;
          v88 = (uint64_t)v55;
          _os_log_impl(&dword_213518000, v53, OS_LOG_TYPE_DEFAULT, "Product: %@ (%@) is supported with provisioning types %@", buf, 0x20u);

          v15 = v69;
        }

        objc_msgSend(v66, "addObject:", v33);
LABEL_61:

        ++v22;
      }
      while (v22 != v20);
      v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
      v20 = v56;
    }
    while (v56);
  }

  v57 = objc_alloc_init(MEMORY[0x24BE6ED60]);
  objc_msgSend(v57, "setPaymentSetupProducts:", v66);

  return v57;
}

+ (void)_addGroupedItemsToSections:(id)a3 fromModel:(id)a4 webService:(id)a5 paymentSection:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[4];

  v38[2] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v37[0] = &unk_24D056590;
  PKLocalizedPaymentString(CFSTR("CARD_TYPE_TRANSIT"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v13;
  v37[1] = &unk_24D0565A8;
  PKLocalizedPaymentString(CFSTR("CARD_TYPE_EMONEY"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v35[0] = &unk_24D056590;
  PKLocalizedPaymentString(CFSTR("CARD_TYPE_TRANSIT_SECTION_HEADER"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = &unk_24D0565A8;
  v36[0] = v16;
  PKLocalizedPaymentString(CFSTR("PAYMENT_SETUP_EMONEY_TITLE"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "targetDevice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "deviceRegion");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __118__NPKPaymentProvisioningFlowController_FlowSelection___addGroupedItemsToSections_fromModel_webService_paymentSection___block_invoke;
  v27[3] = &unk_24CFE9890;
  v28 = v10;
  v29 = v18;
  v30 = v11;
  v31 = v20;
  v32 = &unk_24D056590;
  v33 = v9;
  v34 = v12;
  v21 = v12;
  v22 = v9;
  v23 = v20;
  v24 = v11;
  v25 = v18;
  v26 = v10;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v27);

}

void __118__NPKPaymentProvisioningFlowController_FlowSelection___addGroupedItemsToSections_fromModel_webService_paymentSection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  void *v49;
  _BYTE v50[128];
  void *v51;
  uint8_t buf[4];
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setupProductsOfType:", objc_msgSend(v5, "unsignedIntegerValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {
    PKLogFacilityTypeGetObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "unsignedIntegerValue");
      PKPaymentSetupProductTypeToString();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v53 = v12;
      _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_DEFAULT, "Skipped products of type: %@. Not available setup products.", buf, 0xCu);

    }
    goto LABEL_29;
  }
  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "length"))
    {
      v10 = v9;

      v6 = v10;
    }
    else
    {
      PKLogFacilityTypeGetObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "unsignedIntegerValue");
        PKPaymentSetupProductTypeToString();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v53 = v14;
        _os_log_impl(&dword_213518000, v13, OS_LOG_TYPE_DEFAULT, "Only one available product of type: %@ but no name for display. Using default for product type instead.", buf, 0xCu);

      }
    }

  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v5);
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(v5, "unsignedIntegerValue");
    PKPaymentSetupProductTypeToString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[NPKPaymentProvisioningFlowPickerItem itemWithIdentifier:title:products:](NPKPaymentProvisioningFlowPickerItem, "itemWithIdentifier:title:products:", v15, v6, v7);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "items");
    v36 = objc_claimAutoreleasedReturnValue();
    -[NSObject addObject:](v36, "addObject:", v38);
    goto LABEL_28;
  }
  v41 = v6;
  v39 = v11;
  v44 = v5;
  +[NPKPaymentProvisioningFlowPickerSection sectionWithTitle:productType:](NPKPaymentProvisioningFlowPickerSection, "sectionWithTitle:productType:", v11, v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = a1;
  objc_msgSend(v16, "betaPaymentNetworksForRegion:", *(_QWORD *)(a1 + 56));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("displayName"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v51, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v7;
  objc_msgSend(v7, "sortedArrayUsingDescriptors:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v20 = v19;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  if (!v21)
    goto LABEL_24;
  v22 = v21;
  v23 = *(_QWORD *)v46;
  do
  {
    for (i = 0; i != v22; ++i)
    {
      if (*(_QWORD *)v46 != v23)
        objc_enumerationMutation(v20);
      v25 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
      objc_msgSend(v25, "productIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v25;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v49, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[NPKPaymentProvisioningFlowPickerItem itemWithIdentifier:products:](NPKPaymentProvisioningFlowPickerItem, "itemWithIdentifier:products:", v26, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "footer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v29 && objc_msgSend(v44, "isEqualToNumber:", *(_QWORD *)(v43 + 64)))
      {
        v30 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v25, "paymentOptions");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "firstObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "numberWithInteger:", objc_msgSend(v32, "cardType"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v42, "containsObject:", v33);

        if (!v34)
          goto LABEL_22;
        PKLocalizedPaymentString(CFSTR("CARD_TYPE_TRANSIT_SECTION_BETA_FOOTER"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setFooter:", v29);
      }

LABEL_22:
      objc_msgSend(v15, "items");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addObject:", v28);

    }
    v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
  }
  while (v22);
LABEL_24:

  objc_msgSend(*(id *)(v43 + 72), "addObject:", v15);
  PKLogFacilityTypeGetObject();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v15, "title");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v53 = v37;
    _os_log_impl(&dword_213518000, v36, OS_LOG_TYPE_DEFAULT, "Added products section with title: %@", buf, 0xCu);

  }
  v5 = v44;
  v7 = v40;
  v6 = v41;
  v11 = v39;
  v38 = v42;
LABEL_28:

LABEL_29:
}

+ (void)_addAppleBalanceToSections:(id)a3 fromModel:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a4, "productsForFeatureIdentifier:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      PKLocalizedLynxString(CFSTR("APPLE_ACCOUNT_TITLE"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

    objc_msgSend(v7, "productIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[NPKPaymentProvisioningFlowPickerItem itemWithIdentifier:products:](NPKPaymentProvisioningFlowPickerItem, "itemWithIdentifier:products:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[NPKPaymentProvisioningFlowPickerSection sectionWithTitle:productType:items:](NPKPaymentProvisioningFlowPickerSection, "sectionWithTitle:productType:items:", v11, &unk_24D0565C0, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v16);
  }

}

+ (void)_addCreditDebitItemToSection:(id)a3 webService:(id)a4
{
  void (**v4)(_QWORD);
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void (**)(_QWORD))a3;
  if (PKDeviceSupportsFelicaDebitWithWebService())
    v5 = CFSTR("CARD_TYPE_CREDIT_DEBIT");
  else
    v5 = CFSTR("CARD_TYPE_CREDIT_PREPAID");
  PKLocalizedPaymentString(&v5->isa);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[NPKPaymentProvisioningFlowPickerItem itemWithIdentifier:title:products:](NPKPaymentProvisioningFlowPickerItem, "itemWithIdentifier:title:products:", CFSTR("regularPaymentCardProvisioning"), v9, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertObject:atIndex:", v6, 0);

}

+ (id)_authContext
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = objc_alloc_init(MEMORY[0x24BDB4398]);
  objc_msgSend(v2, "aa_primaryAppleAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "altDSIDForAccount:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x24BE0ACB8]);
  objc_msgSend(v6, "setAltDSID:", v5);
  objc_msgSend(v6, "setSecurityUpgradeContext:", *MEMORY[0x24BE0AC40]);

  return v6;
}

+ (BOOL)_isHSA2Enabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_authContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "altDSID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authKitAccountWithAltDSID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = (unint64_t)objc_msgSend(v3, "securityLevelForAccount:", v6) > 3;
  return (char)v4;
}

+ (BOOL)_localCredentials:(id)a3 containProduct:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[5];

  v5 = a3;
  objc_msgSend(a4, "paymentOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "cardType");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __88__NPKPaymentProvisioningFlowController_FlowSelection___localCredentials_containProduct___block_invoke;
  v10[3] = &__block_descriptor_40_e29_B16__0__PKPaymentCredential_8l;
  v10[4] = v8;
  LOBYTE(v6) = objc_msgSend(v5, "pk_containsObjectPassingTest:", v10);

  return (char)v6;
}

BOOL __88__NPKPaymentProvisioningFlowController_FlowSelection___localCredentials_containProduct___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  return v2 == objc_msgSend(a2, "credentialType");
}

- (void)_transitionToDigitalIssuanceForProduct:(id)a3 requestContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext *v15;

  v6 = a4;
  v7 = a3;
  -[NPKPaymentProvisioningFlowController setDigitalIssuanceAmountRequestContext:](self, "setDigitalIssuanceAmountRequestContext:", v6);
  v15 = -[NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext alloc], "initWithRequestContext:", v6);

  -[NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext setProduct:](v15, "setProduct:", v7);
  -[NPKPaymentProvisioningFlowControllerDigitalIssuanceAmountStepContext setAllowsReaderModeEntry:](v15, "setAllowsReaderModeEntry:", objc_msgSend((id)objc_opt_class(), "_readerModeEntryAllowedForProduct:", v7));
  objc_msgSend(v7, "provisioningMethodMetadataForType:", *MEMORY[0x24BE6F6C8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "digitalIssuanceMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "serviceProviderProducts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10 || !objc_msgSend(v10, "count"))
    goto LABEL_6;
  objc_msgSend(v9, "balanceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v14 = 145;
    goto LABEL_7;
  }
  objc_msgSend(v9, "balanceIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v14 = 144;
  else
LABEL_6:
    v14 = 150;
LABEL_7:
  -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", v14, v15);

}

- (void)_handleDigitalIssuanceTermsAccepted:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  objc_class *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  NPKPaymentProvisioningFlowController *v19;
  uint8_t buf[8];
  uint64_t v21;
  Class (*v22)(uint64_t);
  void *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Digital issuance terms accepted", buf, 2u);
    }

  }
  -[NPKPaymentProvisioningFlowController setDigitalIssuancePaymentRequestContext:](self, "setDigitalIssuancePaymentRequestContext:", v4);
  -[NPKPaymentProvisioningFlowController setTermsAcceptedOutOfBand:](self, "setTermsAcceptedOutOfBand:", 1);
  -[NPKPaymentProvisioningFlowController unitTestingAuthorizationController](self, "unitTestingAuthorizationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = MEMORY[0x24BDAC760];
  if (v8)
  {
    v11 = v8;
  }
  else
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v12 = (void *)getPKPaymentAuthorizationControllerClass_softClass;
    v28 = getPKPaymentAuthorizationControllerClass_softClass;
    if (!getPKPaymentAuthorizationControllerClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x24BDAC760];
      v21 = 3221225472;
      v22 = __getPKPaymentAuthorizationControllerClass_block_invoke;
      v23 = &unk_24CFE81D0;
      v24 = &v25;
      __getPKPaymentAuthorizationControllerClass_block_invoke((uint64_t)buf);
      v12 = (void *)v26[3];
    }
    v13 = objc_retainAutorelease(v12);
    _Block_object_dispose(&v25, 8);
    v14 = [v13 alloc];
    -[NPKPaymentProvisioningFlowController digitalIssuancePaymentRequest](self, "digitalIssuancePaymentRequest");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v14, "initWithPaymentRequest:", v15);

  }
  -[NPKPaymentProvisioningFlowController setAuthorizationController:](self, "setAuthorizationController:", v11);
  objc_msgSend(v11, "setDelegate:", self);
  objc_msgSend(v11, "setPrivateDelegate:", self);
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __93__NPKPaymentProvisioningFlowController_DigitalIssuance___handleDigitalIssuanceTermsAccepted___block_invoke;
  v17[3] = &unk_24CFE8FD0;
  v18 = v4;
  v19 = self;
  v16 = v4;
  objc_msgSend(v11, "presentWithCompletion:", v17);

}

void __93__NPKPaymentProvisioningFlowController_DigitalIssuance___handleDigitalIssuanceTermsAccepted___block_invoke(uint64_t a1, char a2)
{
  id v3;
  uint64_t v4;
  _QWORD block[4];
  id v6;
  uint64_t v7;
  char v8;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __93__NPKPaymentProvisioningFlowController_DigitalIssuance___handleDigitalIssuanceTermsAccepted___block_invoke_2;
  block[3] = &unk_24CFE8FA8;
  v8 = a2;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  v7 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __93__NPKPaymentProvisioningFlowController_DigitalIssuance___handleDigitalIssuanceTermsAccepted___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NPKPaymentProvisioningFlowControllerDigitalIssuancePaymentStepContext *v4;

  if (*(_BYTE *)(a1 + 48))
  {
    v4 = -[NPKPaymentProvisioningFlowControllerDigitalIssuancePaymentStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerDigitalIssuancePaymentStepContext alloc], "initWithRequestContext:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "currentProduct");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPaymentProvisioningFlowControllerDigitalIssuancePaymentStepContext setProduct:](v4, "setProduct:", v2);

    objc_msgSend(*(id *)(a1 + 40), "_performTransitionToStep:withContext:", 155, v4);
  }
  else
  {
    v3 = *(void **)(a1 + 40);
    PKDisplayableErrorForCommonType();
    v4 = (NPKPaymentProvisioningFlowControllerDigitalIssuancePaymentStepContext *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_sendDidEncounterError:requestContext:");
  }

}

- (void)_canMakeDigitalIssuancePaymentsForTransitProducts:(id)a3 withCompletion:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id obj;
  _QWORD v24[4];
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD v29[6];
  id v30;
  _QWORD *v31;
  _QWORD *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[3];
  int v38;
  _QWORD v39[3];
  char v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v20 = a3;
  v19 = a4;
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v7 = v6;
  -[NPKPaymentProvisioningFlowController webService](self, "webService");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "targetDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deviceRegion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "sortedArrayUsingFunction:context:", _compareProductByRegionCodes, v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6EC00], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x24BE6EA18]);
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v38 = 0;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v9;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v14);
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __122__NPKPaymentProvisioningFlowController_DigitalIssuance___canMakeDigitalIssuancePaymentsForTransitProducts_withCompletion___block_invoke;
        v29[3] = &unk_24CFEA2C8;
        v29[4] = self;
        v29[5] = v15;
        v30 = v10;
        v31 = v39;
        v32 = v37;
        objc_msgSend(v11, "addOperation:", v29);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v12);
  }

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __122__NPKPaymentProvisioningFlowController_DigitalIssuance___canMakeDigitalIssuancePaymentsForTransitProducts_withCompletion___block_invoke_3;
  v24[3] = &unk_24CFEA2F0;
  v28 = v7;
  v26 = v37;
  v27 = v39;
  v17 = v19;
  v25 = v17;
  v18 = (id)objc_msgSend(v11, "evaluateWithInput:completion:", v16, v24);

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);

}

void __122__NPKPaymentProvisioningFlowController_DigitalIssuance___canMakeDigitalIssuancePaymentsForTransitProducts_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  __int128 v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "provisioningController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __122__NPKPaymentProvisioningFlowController_DigitalIssuance___canMakeDigitalIssuancePaymentsForTransitProducts_withCompletion___block_invoke_2;
  v13[3] = &unk_24CFEA2A0;
  v9 = *(void **)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 40);
  v10 = v9;
  v18 = *(_OWORD *)(a1 + 56);
  v16 = v6;
  v17 = v7;
  v15 = v10;
  v11 = v6;
  v12 = v7;
  objc_msgSend(v8, "requestProvisioningMethodMetadataForProduct:completionHandler:", v14, v13);

}

void __122__NPKPaymentProvisioningFlowController_DigitalIssuance___canMakeDigitalIssuancePaymentsForTransitProducts_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "provisioningMethodMetadataForType:", *MEMORY[0x24BE6F6C8]);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v10, "digitalIssuanceMetadata");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "serviceProviderAcceptedNetworks");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "serviceProviderCountryCode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "serviceProviderCapabilities");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = PKMerchantCapabilityFromStrings();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v5, "hasPassesWithSupportedNetworks:merchantCapabilities:issuerCountryCodes:webDomain:", v6, v8, v9, 0);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) |= v5;
  }
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

uint64_t __122__NPKPaymentProvisioningFlowController_DigitalIssuance___canMakeDigitalIssuancePaymentsForTransitProducts_withCompletion___block_invoke_3(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  int v8;
  const __CFString *v9;
  int v11;
  const char *v12;
  __int16 v13;
  double v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v3 = v2;
  v4 = *(double *)(a1 + 56);
  pk_General_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_General_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      v11 = 136315906;
      v12 = "-[NPKPaymentProvisioningFlowController(DigitalIssuance) _canMakeDigitalIssuancePaymentsForTransitProducts:wi"
            "thCompletion:]_block_invoke_3";
      v13 = 2048;
      v14 = v3 - v4;
      v15 = 1024;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: %s: completed in %f seconds, after %u products, hasCompatiblePass = %@", (uint8_t *)&v11, 0x26u);
    }

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_canMakeDigitalIssuancePaymentsForTransitProductsWithCompletion:(id)a3
{
  void (**v3)(id, uint64_t, _QWORD);
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = (void (**)(id, uint64_t, _QWORD))a3;
  PKInAppSupportedPaymentNetworks();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE6EC00], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasPassesWithSupportedNetworks:merchantCapabilities:issuerCountryCodes:webDomain:", v5, 159, 0, 0);

  v3[2](v3, v6, 0);
}

- (void)_startDigitalIssuancePaymentWithAmount:(id)a3 requestContext:(id)a4
{
  -[NPKPaymentProvisioningFlowController _startDigitalIssuancePaymentWithAmount:requestContext:serviceProviderProduct:productItem:](self, "_startDigitalIssuancePaymentWithAmount:requestContext:serviceProviderProduct:productItem:", a3, a4, 0, 0);
}

- (void)_startDigitalIssuancePaymentWithAmount:(id)a3 requestContext:(id)a4 serviceProviderProduct:(id)a5 productItem:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  _BOOL4 v30;
  NPKPaymentProvisioningFlowController *v31;
  id v32;
  id v33;
  _QWORD v34[5];
  id v35;
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v33 = a4;
  v11 = a5;
  v12 = a6;
  -[NPKPaymentProvisioningFlowController currentProduct](self, "currentProduct");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "provisioningMethodMetadataForType:", *MEMORY[0x24BE6F6C8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minLoadedBalance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "maxLoadedBalance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 && objc_msgSend(v10, "compare:", v15) == -1)
  {
    v32 = v12;
    pk_Payment_log();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

    if (v30)
    {
      pk_Payment_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v38 = v10;
        v39 = 2112;
        v40 = v15;
        v20 = "Warning: Provided digital issuance amount %@ which is less than the minimum %@";
        goto LABEL_16;
      }
LABEL_17:

    }
LABEL_18:
    v21 = v11;
    PKDisplayableErrorForCommonType();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = self;
    v27 = v33;
    -[NPKPaymentProvisioningFlowController _sendDidEncounterError:requestContext:](v31, "_sendDidEncounterError:requestContext:", v26, v33);
    v23 = v32;
    goto LABEL_19;
  }
  if (v16 && objc_msgSend(v10, "compare:", v16) == 1)
  {
    v32 = v12;
    pk_Payment_log();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      pk_Payment_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v38 = v10;
        v39 = 2112;
        v40 = v16;
        v20 = "Warning: Provided digital issuance amount %@ which is more than the maximum %@";
LABEL_16:
        _os_log_impl(&dword_213518000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0x16u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (v11 && v12)
  {
    v21 = v11;
    v22 = v11;
    v23 = v12;
    -[NPKPaymentProvisioningFlowController _paymentRequestForAmount:serviceProviderProduct:productItem:](self, "_paymentRequestForAmount:serviceProviderProduct:productItem:", v10, v22, v12);
    v24 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = v11;
    v23 = v12;
    -[NPKPaymentProvisioningFlowController _paymentRequestForAmount:](self, "_paymentRequestForAmount:", v10);
    v24 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v24;
  -[NPKPaymentProvisioningFlowController setDigitalIssuancePaymentRequest:](self, "setDigitalIssuancePaymentRequest:", v24);
  objc_msgSend(MEMORY[0x24BE6EC00], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __146__NPKPaymentProvisioningFlowController_DigitalIssuance___startDigitalIssuancePaymentWithAmount_requestContext_serviceProviderProduct_productItem___block_invoke;
  v34[3] = &unk_24CFEA318;
  v34[4] = self;
  v35 = v25;
  v27 = v33;
  v36 = v33;
  v28 = v25;
  objc_msgSend(v26, "canPresentPaymentRequest:completion:", v28, v34);

LABEL_19:
}

void __146__NPKPaymentProvisioningFlowController_DigitalIssuance___startDigitalIssuancePaymentWithAmount_requestContext_serviceProviderProduct_productItem___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  uint64_t v8;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __146__NPKPaymentProvisioningFlowController_DigitalIssuance___startDigitalIssuancePaymentWithAmount_requestContext_serviceProviderProduct_productItem___block_invoke_2;
  v5[3] = &unk_24CFE8A28;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v8 = a2;
  v5[4] = v3;
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

void __146__NPKPaymentProvisioningFlowController_DigitalIssuance___startDigitalIssuancePaymentWithAmount_requestContext_serviceProviderProduct_productItem___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2 == 5 || v2 == 2)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "_addCardErrorForPaymentRequest:", *(_QWORD *)(a1 + 40));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_sendDidEncounterError:requestContext:");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setDigitalIssuancePaymentRequestContext:", *(_QWORD *)(a1 + 48));
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "currentProduct");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "termsURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_transitionBasedOnTermsForReason:URL:requestContext:", 1, v6, *(_QWORD *)(a1 + 48));

  }
}

- (id)_paymentRequestForAmount:(id)a3
{
  return -[NPKPaymentProvisioningFlowController _paymentRequestForAmount:serviceProviderProduct:productItem:](self, "_paymentRequestForAmount:serviceProviderProduct:productItem:", a3, 0, 0);
}

- (id)_paymentRequestForAmount:(id)a3 serviceProviderProduct:(id)a4 productItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  _QWORD v69[2];
  _QWORD v70[3];

  v70[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v66 = v10;
  if (v9)
    v11 = v10 == 0;
  else
    v11 = 1;
  v12 = !v11;
  -[NPKPaymentProvisioningFlowController currentProduct](self, "currentProduct");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "provisioningMethodMetadataForType:", *MEMORY[0x24BE6F6C8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v8;
  v67 = v14;
  objc_msgSend(v14, "depositAmount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (uint64_t)v15;
  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD1518], "zero");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "compare:", v16);

    v17 = (uint64_t)v15;
    if (v19 == -1)
    {
      objc_msgSend(v15, "decimalNumberByAdding:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

    }
  }
  objc_msgSend(v67, "digitalIssuanceMetadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_alloc_init(MEMORY[0x24BE6EBD0]);
  objc_msgSend(v20, "action");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setItemDescription:", v22);

  v23 = objc_alloc(MEMORY[0x24BDBCED8]);
  objc_msgSend(v20, "serviceProviderDict");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithDictionary:", v24);

  v62 = (void *)v17;
  objc_msgSend(v25, "setObject:forKey:", v17, *MEMORY[0x24BE6F820]);
  v65 = v25;
  if (v12)
  {
    v69[0] = CFSTR("identifier");
    objc_msgSend(v66, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v69[1] = CFSTR("amount");
    v70[0] = v26;
    v70[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v70, v69, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v68 = v27;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v68, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKey:", v28, *MEMORY[0x24BE6F828]);

    v25 = v65;
  }
  objc_msgSend(v21, "setServiceProviderData:", v25);
  objc_msgSend(v20, "serviceProviderIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setServiceProviderIdentifier:", v29);

  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6EEB0]), "initWithServiceProviderOrder:", v21);
  objc_msgSend(v20, "serviceProviderAcceptedNetworks");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setSupportedNetworks:", v31);

  objc_msgSend(v20, "serviceProviderSupportedCountries");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setSupportedCountries:", v32);

  objc_msgSend(v20, "serviceProviderCapabilities");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setMerchantCapabilities:", PKMerchantCapabilityFromStrings());

  objc_msgSend(v20, "serviceProviderCountryCode");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setCountryCode:", v34);

  objc_msgSend(v67, "currency");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setCurrencyCode:", v35);

  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
  v63 = v15;
  v64 = v9;
  if (v12)
  {
    v37 = objc_alloc_init(MEMORY[0x24BDD17C8]);
    objc_msgSend(v9, "localizedDisplayName");
    v38 = objc_claimAutoreleasedReturnValue();
    if (v38
      && (v39 = (void *)v38,
          objc_msgSend(v66, "localizedDisplayName"),
          v40 = (void *)objc_claimAutoreleasedReturnValue(),
          v40,
          v39,
          v40))
    {
      v41 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v64, "localizedDisplayName");
      v42 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "localizedDisplayName");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "stringWithFormat:", CFSTR("%@ - %@"), v42, v43);
      v44 = objc_claimAutoreleasedReturnValue();

      v37 = (id)v42;
    }
    else
    {
      objc_msgSend(v64, "localizedDisplayName");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v49)
      {
LABEL_20:
        v48 = v63;
        v46 = (void *)MEMORY[0x24BE6ED78];
        v47 = v37;
        goto LABEL_21;
      }
      objc_msgSend(v64, "localizedDisplayName");
      v44 = objc_claimAutoreleasedReturnValue();
    }

    v37 = (id)v44;
    goto LABEL_20;
  }
  v45 = (void *)MEMORY[0x24BE6ED78];
  PKLocalizedPaymentString(CFSTR("SETUP_PURCHASE_TRANSFER_ITEM_LABEL"));
  v37 = (id)objc_claimAutoreleasedReturnValue();
  v46 = v45;
  v47 = v37;
  v48 = v15;
LABEL_21:
  objc_msgSend(v46, "summaryItemWithLabel:amount:", v47, v48);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "addObject:", v50);
  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD1518], "zero");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "compare:", v16);

    if (v52 == -1)
    {
      v53 = (void *)MEMORY[0x24BE6ED78];
      PKLocalizedPaymentString(CFSTR("SETUP_PURCHASE_NONREFUNDABLE_SERVICE_FEE_ITEM_LABEL"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "summaryItemWithLabel:amount:", v54, v16);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v36, "addObject:", v55);
    }
  }
  objc_msgSend(v20, "serviceProviderLocalizedDisplayName");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v56;
  if (v56)
  {
    v58 = v56;
  }
  else
  {
    objc_msgSend(v13, "displayName");
    v58 = (id)objc_claimAutoreleasedReturnValue();
  }
  v59 = v58;

  objc_msgSend(MEMORY[0x24BE6ED78], "summaryItemWithLabel:amount:", v59, v62);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addObject:", v60);
  objc_msgSend(v30, "setPaymentSummaryItems:", v36);

  return v30;
}

- (void)paymentAuthorizationController:(id)a3 didAuthorizePayment:(id)a4 handler:(id)a5
{
  objc_class *v5;
  void (**v6)(id, id);
  id v7;

  v5 = (objc_class *)MEMORY[0x24BE6EC28];
  v6 = (void (**)(id, id))a5;
  v7 = (id)objc_msgSend([v5 alloc], "initWithStatus:errors:", 0, 0);
  v6[2](v6, v7);

}

- (void)paymentAuthorizationControllerDidFinish:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __97__NPKPaymentProvisioningFlowController_DigitalIssuance__paymentAuthorizationControllerDidFinish___block_invoke;
  v3[3] = &unk_24CFE7998;
  v3[4] = self;
  objc_msgSend(a3, "dismissWithCompletion:", v3);
}

void __97__NPKPaymentProvisioningFlowController_DigitalIssuance__paymentAuthorizationControllerDidFinish___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __97__NPKPaymentProvisioningFlowController_DigitalIssuance__paymentAuthorizationControllerDidFinish___block_invoke_2;
  block[3] = &unk_24CFE7998;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __97__NPKPaymentProvisioningFlowController_DigitalIssuance__paymentAuthorizationControllerDidFinish___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
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
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  uint8_t v21[16];

  objc_msgSend(*(id *)(a1 + 32), "setAuthorizationController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "currentProduct");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "digitalIssuancePurchase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "provisioningMethodMetadataForType:", *MEMORY[0x24BE6F6C8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x24BE6EAB8]);
    objc_msgSend(*(id *)(a1 + 32), "digitalIssuanceAmount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currency");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithAmount:currency:exponent:", v6, v7, 0);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6EC90]), "initWithPaymentSetupProduct:purchase:balance:", v2, v3, v8);
    objc_msgSend(*(id *)(a1 + 32), "setDigitalIssuancePurchase:", 0);
    objc_msgSend(*(id *)(a1 + 32), "provisioningController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "resolveRequirementsUsingProvisioningMethodMetadata:", v4);

    objc_msgSend(*(id *)(a1 + 32), "provisioningController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "requirementsResponse");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRequirementsResponse:", v12);

    v13 = *(void **)(a1 + 32);
    objc_msgSend(v13, "digitalIssuancePaymentRequestContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_transitionToProvisioningProgressWithRequestContext:", v14);

    v15 = *(void **)(a1 + 32);
    objc_msgSend(v15, "digitalIssuancePaymentRequestContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_transitionToProvisioningForCredential:product:requestContext:", v9, v2, v16);

  }
  else
  {
    pk_Payment_log();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

    if (v18)
    {
      pk_Payment_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_213518000, v19, OS_LOG_TYPE_DEFAULT, "Notice: No digital issuance purchase; going back",
          v21,
          2u);
      }

    }
    objc_msgSend(*(id *)(a1 + 32), "setTermsAcceptedOutOfBand:", 0);
    v20 = *(void **)(a1 + 32);
    objc_msgSend(v20, "digitalIssuanceAmountRequestContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_transitionToDigitalIssuanceForProduct:requestContext:", v2, v4);
  }

}

- (void)paymentAuthorizationController:(id)a3 didAuthorizePurchase:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  NPKPaymentProvisioningFlowController *v13;
  id v14;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __120__NPKPaymentProvisioningFlowController_DigitalIssuance__paymentAuthorizationController_didAuthorizePurchase_completion___block_invoke;
  block[3] = &unk_24CFE84E8;
  v12 = v7;
  v13 = self;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __120__NPKPaymentProvisioningFlowController_DigitalIssuance__paymentAuthorizationController_didAuthorizePurchase_completion___block_invoke(uint64_t a1)
{
  uint64_t (*v2)(void);

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setDigitalIssuancePurchase:");
    v2 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    v2 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  return v2();
}

- (id)_addCardErrorForPaymentRequest:(id)a3
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  NSString *v12;
  uint64_t v13;
  __CFString *v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  __CFString *v18;
  void *v19;

  v3 = a3;
  objc_msgSend(v3, "supportedNetworks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "merchantCapabilities");

  v6 = objc_msgSend(v4, "count");
  v7 = v5 & 0xC;
  PKLocalizedPaymentString(CFSTR("SETUP_PURCHASE_PAYMENT_METHOD_REQUIRED_ALERT_TITLE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == 1)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKPaymentCredentialTypeForPaymentNetworkName();

    PKDisplayablePaymentNetworkNameForPaymentCredentialType();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (NPKPairedOrPairingDeviceIsTinker())
    {
      v11 = CFSTR("PROVISIONING_SETUP_PURCHASE_ADD_SPECIFIC_CARD_ALERT_MESSAGE_FAMILY_SETUP");
      if (v7 == 8)
        v11 = CFSTR("PROVISIONING_SETUP_PURCHASE_ADD_SPECIFIC_DEBIT_CARD_ALERT_MESSAGE_FAMILY_SETUP");
      v12 = v11;
      NPKLocalizedStringWithTableSuffix(v12, CFSTR("PaymentProvisioning"), CFSTR("%@"), v10);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = CFSTR("SETUP_PURCHASE_ADD_SPECIFIC_CARD_ALERT_MESSAGE");
      if (v7 == 8)
        v16 = CFSTR("SETUP_PURCHASE_ADD_SPECIFIC_DEBIT_CARD_ALERT_MESSAGE");
      v12 = v16;
      PKLocalizedPaymentString(v12, CFSTR("%@"), v10);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v13;

  }
  else
  {
    if (NPKPairedOrPairingDeviceIsTinker())
    {
      if (v7 == 8)
        v14 = CFSTR("PROVISIONING_SETUP_PURCHASE_ADD_DEBIT_PAYMENT_METHOD_ALERT_MESSAGE_FAMILY_SETUP");
      else
        v14 = CFSTR("PROVISIONING_SETUP_PURCHASE_ADD_PAYMENT_METHOD_ALERT_MESSAGE_FAMILY_SETUP");
      NPKLocalizedStringWithTableSuffix(&v14->isa, CFSTR("PaymentProvisioning"));
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v7 == 8)
        v18 = CFSTR("SETUP_PURCHASE_ADD_DEBIT_PAYMENT_METHOD_ALERT_MESSAGE");
      else
        v18 = CFSTR("SETUP_PURCHASE_ADD_PAYMENT_METHOD_ALERT_MESSAGE");
      PKLocalizedPaymentString(&v18->isa);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v15;
  }
  PKDisplayableErrorCustom();
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)_displayableErrorWithIneligibilityReason:(int64_t)a3 learnMoreURL:(id)a4
{
  id v5;
  void *v6;
  _BOOL4 v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[2];
  void *v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = v5;
  v8 = a3 == 5 || v5 == 0;
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PKPaymentCardEligibilityErrorDomain"), a3, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a3)
  {
    case 1:
      PKLocalizedPaymentString(CFSTR("ELIGIBILITY_UNKNOWN_REQUIREMENTS_ERROR_TITLE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v11 = CFSTR("ELIGIBILITY_UNKNOWN_REQUIREMENTS_ERROR_MESSAGE_NO_URL");
        goto LABEL_17;
      }
      v21 = CFSTR("ELIGIBILITY_UNKNOWN_REQUIREMENTS_ERROR_MESSAGE");
      goto LABEL_25;
    case 2:
      NPKTrackPaymentProvisioningWebServicesCheck();
      PKLocalizedPaymentString(CFSTR("ELIGIBILITY_INELIGIBLE_ERROR_TITLE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v11 = CFSTR("ELIGIBILITY_INELIGIBLE_ERROR_MESSAGE_NO_URL");
LABEL_17:
        PKLocalizedPaymentString(&v11->isa);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:
        v20 = 0;
      }
      else
      {
        v21 = CFSTR("ELIGIBILITY_INELIGIBLE_ERROR_MESSAGE");
LABEL_25:
        PKLocalizedPaymentString(&v21->isa);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:
        v25[0] = *MEMORY[0x24BDD0FE8];
        PKLocalizedPaymentString(CFSTR("ELIGIBILITY_LEARN_MORE_BUTTON_TITLE"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v14;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25[1] = *MEMORY[0x24BE6F328];
        v26[0] = v15;
        v26[1] = v6;
        v16 = (void *)MEMORY[0x24BDBCE70];
        v17 = v26;
        v18 = v25;
LABEL_27:
        objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      PKDisplayableErrorCustom();
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      return v22;
    case 3:
      NPKTrackPaymentProvisioningWebServicesCheck();
      PKLocalizedPaymentString(CFSTR("ELIGIBILITY_UNAVAILABLE_ERROR_TITLE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("ELIGIBILITY_UNAVAILABLE_ERROR_MESSAGE");
      goto LABEL_19;
    case 4:
      NPKTrackPaymentProvisioningWebServicesCheck();
      PKLocalizedPaymentString(CFSTR("ELIGIBILITY_ALREADY_PROVISIONED_ERROR_TITLE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      if (!v8)
        goto LABEL_26;
      goto LABEL_22;
    case 5:
      NPKTrackPaymentProvisioningWebServicesCheck();
      PKLocalizedPaymentString(CFSTR("ELIGIBILITY_NEWER_OS_VERSION_REQUIRED_ERROR_TITLE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedPaymentString(CFSTR("ELIGIBILITY_NEWER_OS_VERSION_REQUIRED_ERROR_MESSAGE_WATCH"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = *MEMORY[0x24BDD0FE8];
      PKLocalizedPaymentString(CFSTR("ELIGIBILITY_SOFTWARE_UPDATE_BUTTON_TITLE"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v14;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v27, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = *MEMORY[0x24BE6F328];
      v29[0] = v15;
      v29[1] = CFSTR("bridge:root=GENERAL_LINK&path=SOFTWARE_UPDATE_LINK");
      v16 = (void *)MEMORY[0x24BDBCE70];
      v17 = v29;
      v18 = v28;
      goto LABEL_27;
    case 6:
      PKLocalizedPaymentString(CFSTR("ELIGIBILITY_HARDWARE_NOT_SUPPORTED_ERROR_TITLE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("ELIGIBILITY_HARDWARE_NOT_SUPPORTED_ERROR_MESSAGE_WATCH");
      goto LABEL_19;
    case 7:
      PKLocalizedLynxString(CFSTR("ELIGIBILITY_ERROR_BALANCE_TOO_LOW_TITLE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      PKLocalizedLynxString(CFSTR("ELIGIBILITY_ERROR_BALANCE_TOO_LOW_MESSAGE"));
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    default:
      PKLocalizedPaymentString(CFSTR("COULD_NOT_ADD_CARD_TITLE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("COULD_NOT_ADD_CARD_MESSAGE");
LABEL_19:
      PKLocalizedPaymentString(&v12->isa);
      v19 = objc_claimAutoreleasedReturnValue();
LABEL_21:
      v13 = (void *)v19;
      if (v8)
        goto LABEL_22;
      goto LABEL_26;
  }
}

+ (id)_displayableErrorWithUnderlyingVerificationError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  PKLocalizedPaymentString(CFSTR("ACTIVATION_NOT_AVAILABLE_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("ACTIVATION_NOT_AVAILABLE_MESSAGE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDD1308]);

  if (v7)
  {
    PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_TITLE"));
    v8 = objc_claimAutoreleasedReturnValue();

    PKLocalizedPaymentString(CFSTR("COULD_NOT_CONNECT_MESSAGE"));
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v13 = v5;
    v4 = (void *)v8;
    v5 = (void *)v9;
    goto LABEL_11;
  }
  objc_msgSend(v3, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE6F9F0]);

  if (v11)
  {
    if ((unint64_t)objc_msgSend(v3, "code") > 5)
      goto LABEL_12;
    objc_msgSend(v3, "localizedFailureReason");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_12;
LABEL_9:
    objc_msgSend(v3, "localizedFailureReason");
    v8 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "localizedRecoverySuggestion");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(v3, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BE6F770]))
  {
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(v3, "localizedFailureReason");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    goto LABEL_9;
LABEL_12:
  PKDisplayableErrorCustom();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_displayableCouldNotAddCardErrorWithUnderlyingError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  PKLocalizedPaymentString(CFSTR("COULD_NOT_ADD_CARD_TITLE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("COULD_NOT_ADD_CARD_MESSAGE"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PKDisplayableErrorCustom();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)_readerModeEntryAllowedForProduct:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  BOOL v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  _BOOL4 v14;
  __int16 v16;
  uint8_t buf[2];
  __int16 v18;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_18;
  if ((objc_msgSend(v3, "supportedProvisioningMethods") & 1) != 0)
  {
    if ((objc_msgSend(v4, "allSupportedProtocols") & 4) != 0 && !PKFelicaSecureElementIsAvailable())
    {
      pk_Payment_log();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

      v7 = 0;
      if (v14)
      {
        pk_Payment_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v9 = "Notice: Reader mode entry is disabled for typeF product as a local Felica secure element is not available";
          v10 = buf;
          goto LABEL_16;
        }
        goto LABEL_17;
      }
    }
    else if (PKSecureElementIsAvailable())
    {
      v7 = 1;
    }
    else
    {
      pk_Payment_log();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

      v7 = 0;
      if (v12)
      {
        pk_Payment_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v16 = 0;
          v9 = "Notice: Reader mode entry is disabled because secure element is not available";
          v10 = (uint8_t *)&v16;
          goto LABEL_16;
        }
LABEL_17:

LABEL_18:
        v7 = 0;
      }
    }
  }
  else
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    v7 = 0;
    if (v6)
    {
      pk_Payment_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 0;
        v9 = "Notice: Reader mode entry is disabled because transit product lacks reader mode provisioning method";
        v10 = (uint8_t *)&v18;
LABEL_16:
        _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
  }

  return v7;
}

- (void)_transitionToReaderModeForProduct:(id)a3 requestContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NPKPaymentProvisioningFlowControllerReaderModeEntryStepContext *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  -[NPKPaymentProvisioningFlowController provisioningController](self, "provisioningController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resolveRequirementsUsingProduct:", v17);

  objc_msgSend(v17, "provisioningMethodMetadataForType:", *MEMORY[0x24BE6F6E0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowController setIngestionMethodMetadata:](self, "setIngestionMethodMetadata:", v8);
  if (v8)
  {
    objc_msgSend(v8, "requiredFields");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "readerModeResources");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE6F6F0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("welcome"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BE6F6D8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BE6F6D0]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v17, "requiredFields");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v13 = 0;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6ED50]), "initWithPaymentSetupFields:", v9);
  -[NPKPaymentProvisioningFlowController setFieldsModel:](self, "setFieldsModel:", v15);

  v16 = -[NPKPaymentProvisioningFlowControllerReaderModeEntryStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerReaderModeEntryStepContext alloc], "initWithRequestContext:", v6);
  -[NPKPaymentProvisioningFlowControllerReaderModeEntryStepContext setProduct:](v16, "setProduct:", v17);
  -[NPKPaymentProvisioningFlowControllerReaderModeEntryStepContext setTitle:](v16, "setTitle:", v13);
  -[NPKPaymentProvisioningFlowControllerReaderModeEntryStepContext setSubtitle:](v16, "setSubtitle:", v14);
  -[NPKPaymentProvisioningFlowControllerReaderModeEntryStepContext setSetupFields:](v16, "setSetupFields:", v9);
  -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", 160, v16);

}

- (void)_handleReaderModeTermsAccepted:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Reader mode terms accepted", v8, 2u);
    }

  }
  -[NPKPaymentProvisioningFlowController setTermsAcceptedOutOfBand:](self, "setTermsAcceptedOutOfBand:", 1);
  -[NPKPaymentProvisioningFlowController _startReaderModeIngestion:](self, "_startReaderModeIngestion:", v4);

}

- (void)_startReaderModeIngestion:(id)a3
{
  -[NPKPaymentProvisioningFlowController setReaderModeRequestContext:](self, "setReaderModeRequestContext:", a3);
  -[NPKPaymentProvisioningFlowController setInternalIngestionState:](self, "setInternalIngestionState:", 0);
  -[NPKPaymentProvisioningFlowController setFlowIngestionState:](self, "setFlowIngestionState:", 0);
  -[NPKPaymentProvisioningFlowController _startIngestion](self, "_startIngestion");
}

- (void)_noteProvisioningStateChangeForReaderMode:(int64_t)a3
{
  unint64_t v5;
  double v6;
  unint64_t v7;
  unint64_t v8;

  v5 = -[NPKPaymentProvisioningFlowController internalIngestionState](self, "internalIngestionState");
  if (a3 == 1 && v5 == 3)
  {
    -[NPKPaymentProvisioningFlowController setInternalIngestionState:](self, "setInternalIngestionState:", 4);
    v6 = 0.537313433;
LABEL_7:
    -[NPKPaymentProvisioningFlowController _transitionToIngestionProgress:](self, "_transitionToIngestionProgress:", v6);
    return;
  }
  v7 = -[NPKPaymentProvisioningFlowController internalIngestionState](self, "internalIngestionState");
  if (a3 == 4 && v7 == 4)
  {
    -[NPKPaymentProvisioningFlowController setInternalIngestionState:](self, "setInternalIngestionState:", 5);
    v6 = 0.776119403;
    goto LABEL_7;
  }
  v8 = -[NPKPaymentProvisioningFlowController internalIngestionState](self, "internalIngestionState");
  if (a3 == 5 && v8 == 5)
  {
    -[NPKPaymentProvisioningFlowController setInternalIngestionState:](self, "setInternalIngestionState:", 6);
    -[NPKPaymentProvisioningFlowController _transitionToIngestionProgress:](self, "_transitionToIngestionProgress:", 0.98);
    -[NPKPaymentProvisioningFlowController _startTransferringCard](self, "_startTransferringCard");
  }
}

- (void)_setupCardIngester
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  -[NPKPaymentProvisioningFlowController cardIngester](self, "cardIngester");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[NPKPaymentProvisioningFlowController unitTestingCardIngester](self, "unitTestingCardIngester");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v8 = v4;
    }
    else
    {
      v6 = objc_alloc(MEMORY[0x24BE6EA98]);
      -[NPKPaymentProvisioningFlowController currentProduct](self, "currentProduct");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v6, "initWithPaymentSetupProduct:delegate:", v7, self);

    }
    -[NPKPaymentProvisioningFlowController setCardIngester:](self, "setCardIngester:", v8);

  }
}

- (void)_tearDownCardIngester
{
  void *v3;

  -[NPKPaymentProvisioningFlowController cardIngester](self, "cardIngester");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[NPKPaymentProvisioningFlowController setCardIngester:](self, "setCardIngester:", 0);
  -[NPKPaymentProvisioningFlowController setIngestionCardSessionToken:](self, "setIngestionCardSessionToken:", 0);
  -[NPKPaymentProvisioningFlowController _invalidateCardNotFoundTimer](self, "_invalidateCardNotFoundTimer");
}

- (void)contactlessCardIngester:(id)a3 didUpdateCardIngestionStatus:(unint64_t)a4
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD v6[6];
  _QWORD block[4];
  id v8;

  v4 = MEMORY[0x24BDAC760];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __105__NPKPaymentProvisioningFlowController_ReaderMode__contactlessCardIngester_didUpdateCardIngestionStatus___block_invoke;
  v6[3] = &unk_24CFE8238;
  v6[4] = self;
  v6[5] = a4;
  v5 = v6;
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke;
  block[3] = &unk_24CFE7B00;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __105__NPKPaymentProvisioningFlowController_ReaderMode__contactlessCardIngester_didUpdateCardIngestionStatus___block_invoke(uint64_t a1)
{
  uint64_t v2;
  dispatch_time_t v3;
  uint64_t v4;
  double v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 == 2)
  {
    v3 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __105__NPKPaymentProvisioningFlowController_ReaderMode__contactlessCardIngester_didUpdateCardIngestionStatus___block_invoke_2;
    block[3] = &unk_24CFE7998;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v3, MEMORY[0x24BDAC9B8], block);
    objc_msgSend(*(id *)(a1 + 32), "_invalidateCardNotFoundTimer");
    v4 = objc_msgSend(*(id *)(a1 + 32), "internalIngestionState");
    if (v4 == 2)
    {
      v5 = 0.179104478;
    }
    else
    {
      if (v4 != 7)
        goto LABEL_9;
      v5 = 0.98;
    }
    objc_msgSend(*(id *)(a1 + 32), "_transitionToIngestionProgress:", v5);
  }
  else if (v2 == 10)
  {
    objc_msgSend(*(id *)(a1 + 32), "_startCardNotFoundTimer");
  }
LABEL_9:
  pk_Payment_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    pk_Payment_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134217984;
      v12 = v9;
      _os_log_impl(&dword_213518000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Card ingestion status: %lu", buf, 0xCu);
    }

  }
}

unint64_t __105__NPKPaymentProvisioningFlowController_ReaderMode__contactlessCardIngester_didUpdateCardIngestionStatus___block_invoke_2(uint64_t a1)
{
  unint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "internalIngestionState");
  if (result <= 7 && ((1 << result) & 0x9C) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "_transitionToFlowIngestionState:", 3);
  return result;
}

- (void)_transitionToFlowIngestionState:(unint64_t)a3 progress:(double)a4
{
  double v7;
  NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext *v15;

  if (-[NPKPaymentProvisioningFlowController flowIngestionState](self, "flowIngestionState") != a3
    || (-[NPKPaymentProvisioningFlowController ingestionProgress](self, "ingestionProgress"), v7 != a4))
  {
    -[NPKPaymentProvisioningFlowController setFlowIngestionState:](self, "setFlowIngestionState:", a3);
    -[NPKPaymentProvisioningFlowController setIngestionProgress:](self, "setIngestionProgress:", a4);
    v8 = [NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext alloc];
    -[NPKPaymentProvisioningFlowController readerModeRequestContext](self, "readerModeRequestContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext initWithRequestContext:](v8, "initWithRequestContext:", v9);

    -[NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext setIngestionState:](v15, "setIngestionState:", a3);
    -[NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext setIngestionProgress:](v15, "setIngestionProgress:", a4);
    -[NPKPaymentProvisioningFlowController _titleForState:](self, "_titleForState:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext setTitle:](v15, "setTitle:", v10);

    -[NPKPaymentProvisioningFlowController _subtitleForState:](self, "_subtitleForState:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext setSubtitle:](v15, "setSubtitle:", v11);

    v12 = (void *)objc_opt_class();
    -[NPKPaymentProvisioningFlowController ingestionMethodMetadata](self, "ingestionMethodMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PKScreenScale();
    objc_msgSend(v12, "_physicalCardURLFromMetadata:forScale:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext setPhysicalCardImageURL:](v15, "setPhysicalCardImageURL:", v14);

    -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", 165, v15);
  }
}

- (void)contactlessCardIngester:(id)a3 didFailToIngestCardWithError:(id)a4 resetProvisioning:(BOOL)a5 isRecoverable:(BOOL)a6
{
  id v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  BOOL v15;
  BOOL v16;
  _QWORD block[4];
  id v18;

  v9 = a4;
  v10 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __137__NPKPaymentProvisioningFlowController_ReaderMode__contactlessCardIngester_didFailToIngestCardWithError_resetProvisioning_isRecoverable___block_invoke;
  v13[3] = &unk_24CFEC2D8;
  v15 = a5;
  v13[4] = self;
  v14 = v9;
  v16 = a6;
  v11 = v13;
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke;
  block[3] = &unk_24CFE7B00;
  v18 = v11;
  v12 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __137__NPKPaymentProvisioningFlowController_ReaderMode__contactlessCardIngester_didFailToIngestCardWithError_resetProvisioning_isRecoverable___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  double v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_invalidateCardNotFoundTimer");
  objc_msgSend(*(id *)(a1 + 32), "setIngestionStateOnRetry:", 0);
  v2 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v2, "_resetReaderModeProvisioningState");
  }
  else
  {
    v3 = objc_msgSend(v2, "internalIngestionState");
    v4 = 0.0;
    if (v3 == 7)
    {
      objc_msgSend(*(id *)(a1 + 32), "setIngestionStateOnRetry:", 6, 0.0);
      v4 = 0.776119403;
    }
    objc_msgSend(*(id *)(a1 + 32), "_transitionToFlowIngestionState:progress:", 0, v4);
  }
  pk_Payment_log();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    pk_Payment_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(unsigned __int8 *)(a1 + 48);
      v10 = *(unsigned __int8 *)(a1 + 49);
      v15 = 136315906;
      v16 = "-[NPKPaymentProvisioningFlowController(ReaderMode) contactlessCardIngester:didFailToIngestCardWithError:rese"
            "tProvisioning:isRecoverable:]_block_invoke";
      v17 = 2112;
      v18 = v8;
      v19 = 1024;
      v20 = v9;
      v21 = 1024;
      v22 = v10;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: %s:%@ (resetProvisioning: %d, isRecoverable: %d)", (uint8_t *)&v15, 0x22u);
    }

  }
  v11 = *(unsigned __int8 *)(a1 + 49);
  v12 = *(void **)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v12, "readerModeRequestContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v12, "_sendDidEncounterError:requestContext:", v13, v14);
  else
    objc_msgSend(v12, "_endProvisioningFlowWithError:requestContext:", v13, v14);

}

- (void)_startIngestion
{
  if (!-[NPKPaymentProvisioningFlowController internalIngestionState](self, "internalIngestionState")
    || -[NPKPaymentProvisioningFlowController internalIngestionState](self, "internalIngestionState") == 6)
  {
    -[NPKPaymentProvisioningFlowController _setupCardIngester](self, "_setupCardIngester");
    -[NPKPaymentProvisioningFlowController _transitionToFlowIngestionState:](self, "_transitionToFlowIngestionState:", 2);
    if (-[NPKPaymentProvisioningFlowController internalIngestionState](self, "internalIngestionState"))
    {
      if (-[NPKPaymentProvisioningFlowController internalIngestionState](self, "internalIngestionState") == 6)
        -[NPKPaymentProvisioningFlowController _startTransferringCard](self, "_startTransferringCard");
    }
    else
    {
      -[NPKPaymentProvisioningFlowController _startReadingCard](self, "_startReadingCard");
    }
  }
}

- (void)_startReadingCard
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[8];
  _QWORD v9[5];

  if (-[NPKPaymentProvisioningFlowController internalIngestionState](self, "internalIngestionState"))
  {
    pk_Payment_log();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

    if (v4)
    {
      pk_Payment_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Warning: Warning! Attempted to ingestCard: while currently ingesting", v8, 2u);
      }

    }
    objc_msgSend((id)objc_opt_class(), "_displayableCouldNotAddCardErrorWithUnderlyingError:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPaymentProvisioningFlowController readerModeRequestContext](self, "readerModeRequestContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPaymentProvisioningFlowController _sendDidEncounterError:requestContext:](self, "_sendDidEncounterError:requestContext:", v6, v7);

  }
  else
  {
    -[NPKPaymentProvisioningFlowController setInternalIngestionState:](self, "setInternalIngestionState:", 2);
    -[NPKPaymentProvisioningFlowController cardIngester](self, "cardIngester");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __69__NPKPaymentProvisioningFlowController_ReaderMode___startReadingCard__block_invoke;
    v9[3] = &unk_24CFEC300;
    v9[4] = self;
    objc_msgSend(v6, "ingestCardWithSuccessHandler:", v9);
  }

}

void __69__NPKPaymentProvisioningFlowController_ReaderMode___startReadingCard__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __69__NPKPaymentProvisioningFlowController_ReaderMode___startReadingCard__block_invoke_2;
  v5[3] = &unk_24CFE7E40;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

void __69__NPKPaymentProvisioningFlowController_ReaderMode___startReadingCard__block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_invalidateCardNotFoundTimer");
  objc_msgSend(*(id *)(a1 + 32), "setIngestionCardSessionToken:", *(_QWORD *)(a1 + 40));
  v2 = objc_alloc(MEMORY[0x24BE6EC58]);
  objc_msgSend(*(id *)(a1 + 32), "currentProduct");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v2, "initWithPaymentSetupProduct:cardSessionToken:", v3, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "setInternalIngestionState:", 3);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "currentProduct");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "readerModeRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_transitionToProvisioningForCredential:product:requestContext:", v7, v5, v6);

}

- (void)_startTransferringCard
{
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint8_t v8[8];
  _QWORD v9[5];

  if (-[NPKPaymentProvisioningFlowController internalIngestionState](self, "internalIngestionState") == 6)
  {
    -[NPKPaymentProvisioningFlowController setInternalIngestionState:](self, "setInternalIngestionState:", 7);
    -[NPKPaymentProvisioningFlowController cardIngester](self, "cardIngester");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPaymentProvisioningFlowController ingestionCardSessionToken](self, "ingestionCardSessionToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __74__NPKPaymentProvisioningFlowController_ReaderMode___startTransferringCard__block_invoke;
    v9[3] = &unk_24CFE7998;
    v9[4] = self;
    objc_msgSend(v3, "ingestCardWithCardSessionToken:successHandler:", v4, v9);
  }
  else
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      pk_Payment_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Warning: Warning! attempting to ingestCardWithCardSessionToken: while currently ingesting", v8, 2u);
      }

    }
    objc_msgSend((id)objc_opt_class(), "_displayableCouldNotAddCardErrorWithUnderlyingError:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPaymentProvisioningFlowController readerModeRequestContext](self, "readerModeRequestContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPaymentProvisioningFlowController _sendDidEncounterError:requestContext:](self, "_sendDidEncounterError:requestContext:", v3, v4);
  }

}

void __74__NPKPaymentProvisioningFlowController_ReaderMode___startTransferringCard__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD v3[5];
  _QWORD block[4];
  id v5;

  v1 = MEMORY[0x24BDAC760];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __74__NPKPaymentProvisioningFlowController_ReaderMode___startTransferringCard__block_invoke_2;
  v3[3] = &unk_24CFE7998;
  v3[4] = *(_QWORD *)(a1 + 32);
  v2 = v3;
  block[0] = v1;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke;
  block[3] = &unk_24CFE7B00;
  v5 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __74__NPKPaymentProvisioningFlowController_ReaderMode___startTransferringCard__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "setInternalIngestionState:", 8);
  objc_msgSend(*(id *)(a1 + 32), "provisioningController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "provisionedPass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fieldForKey:", *MEMORY[0x24BE6F6A8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = 5;
  else
    v5 = 4;

  objc_msgSend(*(id *)(a1 + 32), "_transitionToFlowIngestionState:progress:", v5, 1.0);
  objc_msgSend(*(id *)(a1 + 32), "_tearDownCardIngester");
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "provisioningController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "provisionedPass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "readerModeRequestContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_performNextStepForProvisionedPass:requestContext:", v7, v8);

}

- (void)_resetReaderModeProvisioningState
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD v4[5];
  _QWORD block[4];
  id v6;

  v2 = MEMORY[0x24BDAC760];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __85__NPKPaymentProvisioningFlowController_ReaderMode___resetReaderModeProvisioningState__block_invoke;
  v4[3] = &unk_24CFE7998;
  v4[4] = self;
  v3 = v4;
  block[0] = v2;
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke;
  block[3] = &unk_24CFE7B00;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __85__NPKPaymentProvisioningFlowController_ReaderMode___resetReaderModeProvisioningState__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_removePassIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "provisioningController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetForNewProvisioning");

  objc_msgSend(*(id *)(a1 + 32), "provisioningController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentProduct");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resolveRequirementsUsingProduct:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "_transitionToFlowIngestionState:progress:", 0, 0.0);
}

- (void)_removePassIfNecessary
{
  void *v3;
  int v4;
  id v5;

  if (-[NPKPaymentProvisioningFlowController internalIngestionState](self, "internalIngestionState") != 8)
  {
    -[NPKPaymentProvisioningFlowController provisioningController](self, "provisioningController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasPaymentPass");

    if (v4)
    {
      -[NPKPaymentProvisioningFlowController provisioningController](self, "provisioningController");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeProvisionedPass");

    }
  }
}

- (void)_transitionToFlowIngestionState:(unint64_t)a3
{
  -[NPKPaymentProvisioningFlowController ingestionProgress](self, "ingestionProgress");
  -[NPKPaymentProvisioningFlowController _transitionToFlowIngestionState:progress:](self, "_transitionToFlowIngestionState:progress:", a3);
}

- (void)_transitionToIngestionProgress:(double)a3
{
  -[NPKPaymentProvisioningFlowController _transitionToFlowIngestionState:progress:](self, "_transitionToFlowIngestionState:progress:", -[NPKPaymentProvisioningFlowController flowIngestionState](self, "flowIngestionState"), a3);
}

- (void)_cardNotFoundTimerFired
{
  -[NPKPaymentProvisioningFlowController _transitionToFlowIngestionState:](self, "_transitionToFlowIngestionState:", 1);
}

- (void)_startCardNotFoundTimer
{
  dispatch_source_t v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  -[NPKPaymentProvisioningFlowController _invalidateCardNotFoundTimer](self, "_invalidateCardNotFoundTimer");
  v3 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
  -[NPKPaymentProvisioningFlowController setIngestionCardNotFoundTimer:](self, "setIngestionCardNotFoundTimer:", v3);

  objc_initWeak(&location, self);
  -[NPKPaymentProvisioningFlowController ingestionCardNotFoundTimer](self, "ingestionCardNotFoundTimer");
  v4 = objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __75__NPKPaymentProvisioningFlowController_ReaderMode___startCardNotFoundTimer__block_invoke;
  v11 = &unk_24CFE7970;
  objc_copyWeak(&v12, &location);
  dispatch_source_set_event_handler(v4, &v8);

  -[NPKPaymentProvisioningFlowController ingestionCardNotFoundTimer](self, "ingestionCardNotFoundTimer", v8, v9, v10, v11);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_time(0, 15000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);

  -[NPKPaymentProvisioningFlowController ingestionCardNotFoundTimer](self, "ingestionCardNotFoundTimer");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_resume(v7);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __75__NPKPaymentProvisioningFlowController_ReaderMode___startCardNotFoundTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cardNotFoundTimerFired");

}

- (void)_invalidateCardNotFoundTimer
{
  void *v3;
  NSObject *v4;

  -[NPKPaymentProvisioningFlowController ingestionCardNotFoundTimer](self, "ingestionCardNotFoundTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NPKPaymentProvisioningFlowController ingestionCardNotFoundTimer](self, "ingestionCardNotFoundTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[NPKPaymentProvisioningFlowController setIngestionCardNotFoundTimer:](self, "setIngestionCardNotFoundTimer:", 0);
  }
}

+ (id)_readerModeResources
{
  if (_readerModeResources_onceToken != -1)
    dispatch_once(&_readerModeResources_onceToken, &__block_literal_global_24);
  return (id)_readerModeResources_resourceKeys;
}

void __72__NPKPaymentProvisioningFlowController_ReaderMode___readerModeResources__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[7];

  v2[6] = *MEMORY[0x24BDAC8D0];
  v2[0] = CFSTR("transferValue");
  v2[1] = CFSTR("notFound");
  v2[2] = CFSTR("transferValue");
  v2[3] = CFSTR("transferring");
  v2[4] = CFSTR("cardAdded");
  v2[5] = CFSTR("commuteCardAdded");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_readerModeResources_resourceKeys;
  _readerModeResources_resourceKeys = v0;

}

+ (id)_physicalCardURLFromMetadata:(id)a3 forScale:(double)a4
{
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  uint8_t v18[16];

  v5 = CFSTR("2x");
  if (a4 > 2.0)
    v5 = CFSTR("3x");
  v6 = v5;
  objc_msgSend(a3, "readerModeResources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE6F6E8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("plasticCardImages"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v9, "count"))
  {
    v10 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    pk_Payment_log();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      pk_Payment_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_213518000, v16, OS_LOG_TYPE_DEFAULT, "Notice: Malformed reader mode resources - missing card image urls", v18, 2u);
      }

    }
    v13 = 0;
  }

  return v13;
}

- (id)_titleForState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend((id)objc_opt_class(), "_readerModeResources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKPaymentProvisioningFlowController ingestionMethodMetadata](self, "ingestionMethodMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "readerModeResources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE6F6F0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("localizedTitle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    if (a3 > 5)
    {
      v11 = 0;
    }
    else
    {
      PKLocalizedPaymentString(&off_24CFEC358[a3]->isa);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v11;
}

- (id)_subtitleForState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;

  objc_msgSend((id)objc_opt_class(), "_readerModeResources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKPaymentProvisioningFlowController ingestionMethodMetadata](self, "ingestionMethodMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "readerModeResources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE6F6F0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("localizedDescription"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    switch(a3)
    {
      case 0uLL:
      case 2uLL:
        -[NPKPaymentProvisioningFlowController currentProduct](self, "currentProduct");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "displayName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("READER_MODE_PROVISIONING_TRANSFER_VALUE_SUBTITLE_FORMAT"), CFSTR("%@"), v13);
        goto LABEL_10;
      case 1uLL:
        v14 = CFSTR("READER_MODE_PROVISIONING_CARD_NOT_FOUND_SUBTITLE");
        goto LABEL_7;
      case 3uLL:
        v14 = CFSTR("READER_MODE_PROVISIONING_TRANSFERRING_SUBTITLE");
LABEL_7:
        PKLocalizedPaymentString(&v14->isa);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 4uLL:
        -[NPKPaymentProvisioningFlowController currentProduct](self, "currentProduct");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "displayName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("READER_MODE_PROVISIONING_CARD_ADDED_DEFAULT_SUBTITLE_FORMAT"), CFSTR("%@"), v13);
        goto LABEL_10;
      case 5uLL:
        -[NPKPaymentProvisioningFlowController currentProduct](self, "currentProduct");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "displayName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedPaymentString(CFSTR("READER_MODE_PROVISIONING_CARD_ADDED_COMMUTE_SUBTITLE_FORMAT"), CFSTR("%@"), v13);
LABEL_10:
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        break;
      default:
        v11 = 0;
        break;
    }
  }

  return v11;
}

@end
