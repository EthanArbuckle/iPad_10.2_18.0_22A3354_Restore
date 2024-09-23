@implementation NPKSimulatedPaymentProvisioningFlowController

+ (id)_passWithDescription:(id)a3 credentialType:(int64_t)a4
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE buf[24];
  void *v34;
  uint64_t *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v27 = a3;
  PKPassKitBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", *MEMORY[0x24BE6F848], CFSTR("json"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x24BDD1608];
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "JSONObjectWithData:options:error:", v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKey:", v27, *MEMORY[0x24BE6F530]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v10, *MEMORY[0x24BE6F540]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE6F538]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKey:", v11, *MEMORY[0x24BE6F5E0]);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6EF00]), "initWithDictionary:bundle:", v8, 0);
  PKPaymentNetworkNameForPaymentCredentialType();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SimulatorCard_%@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v17 = (void *)getUIImageClass_softClass;
  v32 = getUIImageClass_softClass;
  if (!getUIImageClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getUIImageClass_block_invoke;
    v34 = &unk_24CFE81D0;
    v35 = &v29;
    __getUIImageClass_block_invoke((uint64_t)buf);
    v17 = (void *)v30[3];
  }
  v18 = objc_retainAutorelease(v17);
  _Block_object_dispose(&v29, 8);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/NanoPassKitUI.framework"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "imageNamed:inBundle:", v16, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_alloc_init(MEMORY[0x24BE6EC10]);
  if (v20)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6EB60]), "initWithCGImage:scale:orientation:", objc_msgSend(objc_retainAutorelease(v20), "CGImage"), 1, 1.0);
    objc_msgSend(v21, "setCardBackgroundCombinedImage:", v22);

  }
  pk_Payment_log();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

  if (v24)
  {
    pk_Payment_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v20;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v16;
      _os_log_impl(&dword_213518000, v25, OS_LOG_TYPE_DEFAULT, "Notice: Got background image %@ for %@", buf, 0x16u);
    }

  }
  objc_msgSend(v14, "setImageSet:forImageSetType:", v21, 4);

  return v14;
}

+ (id)_broadwayCredential
{
  return 0;
}

+ (id)_easyProvisioningCredentials
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[6];

  v25[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE6F668];
  v25[0] = *MEMORY[0x24BE6F688];
  v25[1] = v4;
  v5 = *MEMORY[0x24BE6F658];
  v25[2] = *MEMORY[0x24BE6F648];
  v25[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 4);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v10);
        v12 = PKPaymentCredentialTypeForPaymentNetworkName();
        v13 = objc_alloc(MEMORY[0x24BE6ECE8]);
        v14 = (void *)objc_msgSend(v13, "initWithIdentifier:status:credentialType:passURL:", v11, 1, v12, 0, (_QWORD)v20);
        objc_msgSend(a1, "_passWithDescription:credentialType:", v11, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setPaymentPass:", v15);

        objc_msgSend(v14, "paymentPass");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "primaryAccountNumberSuffix");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setSanitizedPrimaryAccountNumber:", v17);

        objc_msgSend(v3, "addObject:", v14);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

  objc_msgSend(a1, "_broadwayCredential");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v3, "insertObject:atIndex:", v18, 0);

  return v3;
}

- (void)startProvisioningFlow:(id)a3
{
  id v4;
  NPKPaymentProvisioningFlowStepContext *v5;
  dispatch_time_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  NPKSimulatedPaymentProvisioningFlowController *v10;

  v4 = a3;
  v5 = -[NPKPaymentProvisioningFlowStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowStepContext alloc], "initWithRequestContext:", v4);
  -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", 110, v5);
  v6 = dispatch_time(0, 1000000000);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __71__NPKSimulatedPaymentProvisioningFlowController_startProvisioningFlow___block_invoke;
  v8[3] = &unk_24CFE7E40;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_after(v6, MEMORY[0x24BDAC9B8], v8);

}

void __71__NPKSimulatedPaymentProvisioningFlowController_startProvisioningFlow___block_invoke(uint64_t a1)
{
  void *v2;
  NPKPaymentProvisioningFlowControllerWelcomeStepContext *v3;

  v3 = -[NPKPaymentProvisioningFlowControllerWelcomeStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerWelcomeStepContext alloc], "initWithRequestContext:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BE6ECA8], "defaultImages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowControllerWelcomeStepContext setHeroImages:](v3, "setHeroImages:", v2);

  objc_msgSend(*(id *)(a1 + 40), "_performTransitionToStep:withContext:", 120, v3);
}

- (void)acknowledgeWelcome:(id)a3
{
  id v4;
  NPKPaymentProvisioningFlowControllerChooseFlowStepContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[NPKPaymentProvisioningFlowControllerChooseFlowStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerChooseFlowStepContext alloc], "initWithRequestContext:", v4);

  +[NPKPaymentProvisioningFlowPickerItem itemWithIdentifier:title:products:](NPKPaymentProvisioningFlowPickerItem, "itemWithIdentifier:title:products:", CFSTR("manualEntryProvisioning"), CFSTR("Manual Entry Provisioning"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NPKPaymentProvisioningFlowPickerItem itemWithIdentifier:title:products:](NPKPaymentProvisioningFlowPickerItem, "itemWithIdentifier:title:products:", CFSTR("easyProvisioning"), CFSTR("Easy Provisioning"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedPaymentString(CFSTR("CARD_TYPE_PAYMENT_SECTION_HEADER"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[NPKPaymentProvisioningFlowPickerSection sectionWithTitle:productType:](NPKPaymentProvisioningFlowPickerSection, "sectionWithTitle:productType:", v8, &unk_24D0565D8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v6);

  objc_msgSend(v9, "items");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObject:", v7);

  v13[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowControllerChooseFlowStepContext setSections:](v5, "setSections:", v12);

  -[NPKPaymentProvisioningFlowController _performTransitionToStep:withContext:](self, "_performTransitionToStep:withContext:", 130, v5);
}

- (void)chooseFlowForPickerItem:(id)a3 requestContext:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  objc_msgSend(v12, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("manualEntryProvisioning"));

  if (v8)
  {
    -[NPKPaymentProvisioningFlowController _transitionToManualEntry:](self, "_transitionToManualEntry:", v6);
  }
  else
  {
    objc_msgSend(v12, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("easyProvisioning"));

    if (v10)
    {
      objc_msgSend((id)objc_opt_class(), "_easyProvisioningCredentials");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKPaymentProvisioningFlowController _transitionBasedOnCredentials:product:requestContext:](self, "_transitionBasedOnCredentials:product:requestContext:", v11, 0, v6);

    }
  }

}

- (void)handleManualEntryFields:(id)a3 credential:(id)a4 requestContext:(id)a5
{
  id v7;
  void *v8;
  id v9;

  v9 = a5;
  v7 = a3;
  -[NPKPaymentProvisioningFlowController fieldsModel](self, "fieldsModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateWithPaymentSetupFields:", v7);

  -[NPKPaymentProvisioningFlowController _performNextActionForProvisioningState:](self, "_performNextActionForProvisioningState:", v9);
}

- (void)_startProvisioningForCredential:(id)a3 requestContext:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a3;
  -[NPKPaymentProvisioningFlowController provisioningController](self, "provisioningController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetForNewProvisioning");

  -[NPKPaymentProvisioningFlowController setCurrentCredential:](self, "setCurrentCredential:", v6);
  v8 = objc_alloc(MEMORY[0x24BE6ED50]);
  v9 = (void *)objc_msgSend(v8, "initWithPaymentSetupFields:", MEMORY[0x24BDBD1A8]);
  -[NPKPaymentProvisioningFlowController setFieldsModel:](self, "setFieldsModel:", v9);

  -[NPKPaymentProvisioningFlowController _performNextActionForProvisioningState:](self, "_performNextActionForProvisioningState:", v10);
}

- (void)_requestRequirements:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NPKPaymentProvisioningFlowController provisioningController](self, "provisioningController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resetForNewProvisioning");

  -[NPKPaymentProvisioningFlowController provisioningController](self, "provisioningController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setState:", 1);

  -[NPKPaymentProvisioningFlowController currentCredential](self, "currentCredential");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAccountCredential");

  if (v8)
  {
    -[NPKPaymentProvisioningFlowController setTermsAcceptedOutOfBand:](self, "setTermsAcceptedOutOfBand:", 1);
    -[NPKPaymentProvisioningFlowController _performNextActionForProvisioningState:](self, "_performNextActionForProvisioningState:", v4);
  }
  else
  {
    -[NPKPaymentProvisioningFlowController currentCredential](self, "currentCredential");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isRemoteCredential");

    if (v10)
    {
      objc_msgSend(MEMORY[0x24BE6ED48], "paymentSetupFieldWithIdentifier:", *MEMORY[0x24BE6F720]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE6ED48], "paymentSetupFieldWithIdentifier:", *MEMORY[0x24BE6F710]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE6ED48], "paymentSetupFieldWithIdentifier:", *MEMORY[0x24BE6F720], v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = v13;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
      v12 = objc_claimAutoreleasedReturnValue();

    }
    -[NPKPaymentProvisioningFlowController fieldsModel](self, "fieldsModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateWithPaymentSetupFields:", v12);

    -[NPKPaymentProvisioningFlowController currentCredential](self, "currentCredential");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKPaymentProvisioningFlowController _transitionToSecondaryManualEntryWithFields:credential:requestContext:](self, "_transitionToSecondaryManualEntryWithFields:credential:requestContext:", v12, v15, v4);

    v4 = (id)v12;
  }

}

- (void)_performEligibility:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

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
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Standalone: performing eligibility", v9, 2u);
    }

  }
  -[NPKPaymentProvisioningFlowController provisioningController](self, "provisioningController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setState:", 3);

  -[NPKPaymentProvisioningFlowController _performNextActionForProvisioningState:](self, "_performNextActionForProvisioningState:", v4);
}

- (void)_performTerms:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDBCF48];
  v5 = a3;
  objc_msgSend(v4, "URLWithString:", CFSTR("https://nc-pod1-smp-device-asset.apple.com:443/broker/v1/assets/en_e1604103d8354ea3a69d9d9af961b042_v8"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NPKPaymentProvisioningFlowController _transitionBasedOnTermsForReason:URL:requestContext:](self, "_transitionBasedOnTermsForReason:URL:requestContext:", 0, v6, v5);

}

- (void)_performProvision:(id)a3
{
  id v4;
  dispatch_time_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NPKPaymentProvisioningFlowController _transitionToProvisioningProgressWithRequestContext:](self, "_transitionToProvisioningProgressWithRequestContext:", v4);
  v5 = dispatch_time(0, 3000000000);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__NPKSimulatedPaymentProvisioningFlowController__performProvision___block_invoke;
  v7[3] = &unk_24CFE7E40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_after(v5, MEMORY[0x24BDAC9B8], v7);

}

uint64_t __67__NPKSimulatedPaymentProvisioningFlowController__performProvision___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "provisioningController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setState:", 5);

  return objc_msgSend(*(id *)(a1 + 32), "_performNextActionForProvisioningState:", *(_QWORD *)(a1 + 40));
}

@end
