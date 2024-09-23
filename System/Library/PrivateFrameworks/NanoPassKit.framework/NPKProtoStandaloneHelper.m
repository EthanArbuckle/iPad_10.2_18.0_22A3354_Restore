@implementation NPKProtoStandaloneHelper

+ (void)setPassImageSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  const __CFDictionary *v8;
  int v9;
  CFDictionaryRef DictionaryRepresentation;
  uint64_t v11;
  CGSize v12;

  height = a3.height;
  width = a3.width;
  v11 = *MEMORY[0x24BDAC8D0];
  if (a3.width <= 0.0 || a3.height <= 0.0)
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
        v12.width = width;
        v12.height = height;
        v9 = 138412290;
        DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v12);
        v8 = DictionaryRepresentation;
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Warning: Ignoring invalid pass image size %@", (uint8_t *)&v9, 0xCu);

      }
    }
  }
  else
  {
    __PassImageSize_0 = *(_QWORD *)&a3.width;
    __PassImageSize_1 = *(_QWORD *)&a3.height;
  }
}

+ (CGSize)passImageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)&__PassImageSize_0;
  v3 = *(double *)&__PassImageSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (void)setPassThumbnailImageSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  const __CFDictionary *v8;
  int v9;
  CFDictionaryRef DictionaryRepresentation;
  uint64_t v11;
  CGSize v12;

  height = a3.height;
  width = a3.width;
  v11 = *MEMORY[0x24BDAC8D0];
  if (a3.width <= 0.0 || a3.height <= 0.0)
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
        v12.width = width;
        v12.height = height;
        v9 = 138412290;
        DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v12);
        v8 = DictionaryRepresentation;
        _os_log_impl(&dword_213518000, v7, OS_LOG_TYPE_DEFAULT, "Warning: Ignoring invalid pass thumbnail image size %@", (uint8_t *)&v9, 0xCu);

      }
    }
  }
  else
  {
    __PassThumbnailImageSize_0 = *(_QWORD *)&a3.width;
    __PassThumbnailImageSize_1 = *(_QWORD *)&a3.height;
  }
}

+ (CGSize)passThumbnailImageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)&__PassThumbnailImageSize_0;
  v3 = *(double *)&__PassThumbnailImageSize_1;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (id)toNPKProtoStandalonePaymentProvisioningFlowStepContext:(id)a3 fromStep:(int)a4 toStep:(int)a5
{
  id v6;
  NPKProtoStandalonePaymentProvisioningFlowStepContext *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowStepContext);
  objc_msgSend(v6, "stepIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningFlowStepContext setStepIdentifier:](v7, "setStepIdentifier:", v8);

  objc_msgSend(v6, "backStepIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningFlowStepContext setBackStepIdentifier:](v7, "setBackStepIdentifier:", v9);

  -[NPKProtoStandalonePaymentProvisioningFlowStepContext setAllowsAddLater:](v7, "setAllowsAddLater:", objc_msgSend(v6, "allowsAddLater"));
  if (a5 > 164)
  {
    if (a5 > 209)
    {
      if (a5 <= 229)
      {
        if (a5 == 210)
        {
          +[NPKProtoStandaloneHelper _convertProvisioningProgressStepContext:protoContext:](NPKProtoStandaloneHelper, "_convertProvisioningProgressStepContext:protoContext:", v6, v7);
        }
        else if (a5 == 220)
        {
          +[NPKProtoStandaloneHelper _convertProvisioningResultStepContext:protoContext:](NPKProtoStandaloneHelper, "_convertProvisioningResultStepContext:protoContext:", v6, v7);
        }
      }
      else
      {
        switch(a5)
        {
          case 230:
            +[NPKProtoStandaloneHelper _convertIssuerVerificationChannelsStepContext:protoContext:](NPKProtoStandaloneHelper, "_convertIssuerVerificationChannelsStepContext:protoContext:", v6, v7);
            break;
          case 240:
            +[NPKProtoStandaloneHelper _convertIssuerVerificationFieldsStepContext:protoContext:](NPKProtoStandaloneHelper, "_convertIssuerVerificationFieldsStepContext:protoContext:", v6, v7);
            break;
          case 250:
            +[NPKProtoStandaloneHelper _convertIssuerVerificationCodeStepContext:protoContext:](NPKProtoStandaloneHelper, "_convertIssuerVerificationCodeStepContext:protoContext:", v6, v7);
            break;
        }
      }
    }
    else
    {
      switch(a5)
      {
        case 190:
          +[NPKProtoStandaloneHelper _convertSecondaryManualEntryStepContext:protoContext:](NPKProtoStandaloneHelper, "_convertSecondaryManualEntryStepContext:protoContext:", v6, v7);
          break;
        case 191:
        case 194:
        case 195:
        case 196:
        case 198:
        case 199:
          break;
        case 192:
          +[NPKProtoStandaloneHelper _convertLocalDeviceManualEntry:protoContext:](NPKProtoStandaloneHelper, "_convertLocalDeviceManualEntry:protoContext:", v6, v7);
          break;
        case 193:
          +[NPKProtoStandaloneHelper _convertLocalDeviceManualEntryProgress:protoContext:](NPKProtoStandaloneHelper, "_convertLocalDeviceManualEntryProgress:protoContext:", v6, v7);
          break;
        case 197:
          +[NPKProtoStandaloneHelper _convertPasscodeUpgradeStepContext:protoContext:](NPKProtoStandaloneHelper, "_convertPasscodeUpgradeStepContext:protoContext:", v6, v7);
          break;
        case 200:
          +[NPKProtoStandaloneHelper _convertTermsAndConditionsStepContext:protoContext:](NPKProtoStandaloneHelper, "_convertTermsAndConditionsStepContext:protoContext:", v6, v7);
          break;
        default:
          if (a5 == 165)
          {
            +[NPKProtoStandaloneHelper _convertReaderModeIngestionStepContext:protoContext:](NPKProtoStandaloneHelper, "_convertReaderModeIngestionStepContext:protoContext:", v6, v7);
          }
          else if (a5 == 180)
          {
            +[NPKProtoStandaloneHelper _convertManualEntryStepContext:protoContext:](NPKProtoStandaloneHelper, "_convertManualEntryStepContext:protoContext:", v6, v7);
          }
          break;
      }
    }
  }
  else if (a5 > 143)
  {
    if (a5 > 154)
    {
      switch(a5)
      {
        case 155:
          +[NPKProtoStandaloneHelper _convertDigitalIssuancePaymentStepContext:protoContext:](NPKProtoStandaloneHelper, "_convertDigitalIssuancePaymentStepContext:protoContext:", v6, v7);
          break;
        case 157:
          +[NPKProtoStandaloneHelper _convertMoreInformationStepContext:protoContext:](NPKProtoStandaloneHelper, "_convertMoreInformationStepContext:protoContext:", v6, v7);
          break;
        case 160:
          +[NPKProtoStandaloneHelper _convertReaderModeEntryStepContext:protoContext:](NPKProtoStandaloneHelper, "_convertReaderModeEntryStepContext:protoContext:", v6, v7);
          break;
      }
    }
    else if ((a5 - 144) < 2 || a5 == 150)
    {
      +[NPKProtoStandaloneHelper _convertDigitalIssuanceAmountStepContext:protoContext:](NPKProtoStandaloneHelper, "_convertDigitalIssuanceAmountStepContext:protoContext:", v6, v7);
    }
  }
  else
  {
    if (a5 <= 136)
    {
      if (a5 == 120)
      {
        +[NPKProtoStandaloneHelper _convertWelcomeStepContext:protoContext:](NPKProtoStandaloneHelper, "_convertWelcomeStepContext:protoContext:", v6, v7);
        goto LABEL_46;
      }
      if (a5 == 130)
      {
        +[NPKProtoStandaloneHelper _convertChooseFlowStepContext:protoContext:](NPKProtoStandaloneHelper, "_convertChooseFlowStepContext:protoContext:", v6, v7);
        goto LABEL_46;
      }
      if (a5 != 135)
        goto LABEL_46;
      goto LABEL_21;
    }
    if ((a5 - 137) < 2)
    {
LABEL_21:
      +[NPKProtoStandaloneHelper _convertChooseProductStepContext:protoContext:](NPKProtoStandaloneHelper, "_convertChooseProductStepContext:protoContext:", v6, v7);
      goto LABEL_46;
    }
    if (a5 == 140)
      +[NPKProtoStandaloneHelper _convertChooseCredentialsStepContext:protoContext:](NPKProtoStandaloneHelper, "_convertChooseCredentialsStepContext:protoContext:", v6, v7);
  }
LABEL_46:

  return v7;
}

+ (int)toNPKProtoStandalonePaymentSetupFieldType:(unint64_t)a3
{
  if (a3 - 1 >= 5)
    return 100;
  else
    return 10 * (a3 - 1) + 110;
}

+ (id)toNPKProtoStandaloneError:(id)a3
{
  id v4;
  NPKProtoStandaloneError *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  NPKProtoStandaloneError *v12;
  id v13;

  v4 = a3;
  v5 = objc_alloc_init(NPKProtoStandaloneError);
  -[NPKProtoStandaloneError setCode:](v5, "setCode:", objc_msgSend(v4, "code"));
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandaloneError setDomain:](v5, "setDomain:", v7);

  }
  else
  {
    -[NPKProtoStandaloneError setDomain:](v5, "setDomain:", CFSTR("com.apple.NPKStandaloneErrorDomain"));
  }

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __54__NPKProtoStandaloneHelper_toNPKProtoStandaloneError___block_invoke;
    v11[3] = &unk_24CFEBAE8;
    v13 = a1;
    v12 = v5;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
  return v5;
}

void __54__NPKProtoStandaloneHelper_toNPKProtoStandaloneError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NPKProtoStandaloneUserInfo *v8;

  v5 = a3;
  v6 = a2;
  v8 = objc_alloc_init(NPKProtoStandaloneUserInfo);
  -[NPKProtoStandaloneUserInfo setKey:](v8, "setKey:", v6);

  objc_msgSend(*(id *)(a1 + 40), "toStringValue:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKProtoStandaloneUserInfo setValue:](v8, "setValue:", v7);
  objc_msgSend(*(id *)(a1 + 32), "addUserInfos:", v8);

}

+ (id)toStringValue:(id)a3
{
  id v3;
  __CFString *v4;
  id v5;
  void *v6;
  char isKindOfClass;
  __CFString *v8;

  v3 = a3;
  if (!v3)
    goto LABEL_15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (__CFString *)v3;
LABEL_14:
    v8 = v4;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "absoluteString");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "stringValue");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
LABEL_15:
    v8 = &stru_24CFF06D8;
    goto LABEL_16;
  }
  v5 = v3;
  if (objc_msgSend(v5, "count")
    && (objc_msgSend(v5, "firstObject"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v5, "firstObject");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_24CFF06D8;
  }

LABEL_16:
  return v8;
}

+ (void)_convertWelcomeStepContext:(id)a3 protoContext:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NPKProtoStandalonePaymentProvisioningFlowWelcomeStepContext *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NPKProtoStandalonePaymentHeroImage *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "welcomeStepContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v21 = v5;
    v8 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowWelcomeStepContext);
    objc_msgSend(v6, "setWelcomeStepContext:", v8);

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v7, "heroImages");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v12);
          v14 = (void *)MEMORY[0x2199B65AC]();
          v15 = objc_alloc_init(NPKProtoStandalonePaymentHeroImage);
          objc_msgSend(v13, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NPKProtoStandalonePaymentHeroImage setIdentifier:](v15, "setIdentifier:", v16);

          PKScreenScale();
          objc_msgSend(v13, "URLForImageWithScale:");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "absoluteString");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NPKProtoStandalonePaymentHeroImage setImageURL:](v15, "setImageURL:", v18);

          if ((objc_msgSend(v7, "defaultImagesUsed") & 1) != 0)
          {
            v19 = 0;
          }
          else
          {
            PKScreenScale();
            objc_msgSend(v13, "imageWithScale:");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
          }
          -[NPKProtoStandalonePaymentHeroImage setImageData:](v15, "setImageData:", v19, v21);
          objc_msgSend(v6, "welcomeStepContext");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addHeroImages:", v15);

          objc_autoreleasePoolPop(v14);
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v10);
    }

    v5 = v21;
  }

}

+ (void)_convertChooseFlowStepContext:(id)a3 protoContext:(id)a4
{
  void *v6;
  NPKProtoStandalonePaymentProvisioningFlowChooseFlowStepContext *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v9 = a4;
  objc_msgSend(a3, "chooseFlowStepContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowChooseFlowStepContext);
    objc_msgSend(v9, "setChooseFlowStepContext:", v7);

    objc_msgSend(v6, "sections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __71__NPKProtoStandaloneHelper__convertChooseFlowStepContext_protoContext___block_invoke;
    v10[3] = &unk_24CFEBB10;
    v11 = v9;
    v12 = a1;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

  }
}

void __71__NPKProtoStandaloneHelper__convertChooseFlowStepContext_protoContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "chooseFlowStepContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "toNPKProtoStandalonePaymentProvisioningFlowPickerSection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addSections:", v5);
}

+ (void)_convertChooseProductStepContext:(id)a3 protoContext:(id)a4
{
  void *v6;
  NPKProtoStandalonePaymentProvisioningFlowChooseProductStepContext *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v9 = a4;
  objc_msgSend(a3, "chooseProductStepContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowChooseProductStepContext);
    objc_msgSend(v9, "setChooseProductStepContext:", v7);

    objc_msgSend(v6, "products");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __74__NPKProtoStandaloneHelper__convertChooseProductStepContext_protoContext___block_invoke;
    v10[3] = &unk_24CFEBB38;
    v11 = v9;
    v12 = a1;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

  }
}

void __74__NPKProtoStandaloneHelper__convertChooseProductStepContext_protoContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "chooseProductStepContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "toNPKProtoStandalonePaymentSetupProduct:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addProducts:", v5);
}

+ (void)_convertChooseCredentialsStepContext:(id)a3 protoContext:(id)a4
{
  void *v6;
  NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v11 = a4;
  objc_msgSend(a3, "chooseCredentialsStepContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext);
    objc_msgSend(v11, "setChooseCredentialsStepContext:", v7);

    v8 = objc_msgSend(v6, "allowsManualEntry");
    objc_msgSend(v11, "chooseCredentialsStepContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsManualEntry:", v8);

    objc_msgSend(v6, "flowIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __78__NPKProtoStandaloneHelper__convertChooseCredentialsStepContext_protoContext___block_invoke;
    v12[3] = &unk_24CFEBB60;
    v13 = v6;
    v14 = v11;
    v15 = a1;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v12);

  }
}

void __78__NPKProtoStandaloneHelper__convertChooseCredentialsStepContext_protoContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "flowIdentifierToCredential");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "chooseCredentialsStepContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "toNPKProtoStandalonePaymentCredentialUnion:withFlowIdentifier:thumbnailSize:", v12, v4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addCredentials:", v7);
  if (objc_msgSend(v12, "isRemoteCredential"))
  {
    objc_msgSend(*(id *)(a1 + 40), "chooseCredentialsStepContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 48);
    objc_msgSend(v12, "remoteCredential");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "toNPKProtoStandalonePaymentRemoteCredential:thumbnailSize:", v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addRemoteCredentials:", v11);

  }
}

+ (void)_convertDigitalIssuanceAmountStepContext:(id)a3 protoContext:(id)a4
{
  void *v6;
  NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a4;
  objc_msgSend(a3, "digitalIssuanceAmountStepContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext);
    objc_msgSend(v14, "setDigitalIssuanceAmountStepContext:", v7);

    objc_msgSend(v6, "product");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "product");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "toNPKProtoStandalonePaymentSetupProduct:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "digitalIssuanceAmountStepContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setProduct:", v10);

    }
    v12 = objc_msgSend(v6, "allowsReaderModeEntry");
    objc_msgSend(v14, "digitalIssuanceAmountStepContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAllowsReaderModeEntry:", v12);

  }
}

+ (void)_convertDigitalIssuancePaymentStepContext:(id)a3 protoContext:(id)a4
{
  void *v6;
  NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  objc_msgSend(a3, "digitalIssuancePaymentStepContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext);
    objc_msgSend(v12, "setDigitalIssuancePaymentStepContext:", v7);

    objc_msgSend(v6, "product");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "product");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "toNPKProtoStandalonePaymentSetupProduct:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "digitalIssuancePaymentStepContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setProduct:", v10);

    }
  }

}

+ (void)_convertReaderModeEntryStepContext:(id)a3 protoContext:(id)a4
{
  id v6;
  void *v7;
  NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "readerModeEntryStepContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext);
    objc_msgSend(v6, "setReaderModeEntryStepContext:", v8);

    objc_msgSend(v7, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "readerModeEntryStepContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitle:", v9);

    objc_msgSend(v7, "subtitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "readerModeEntryStepContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSubtitle:", v11);

    objc_msgSend(v7, "setupFields");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(v7, "setupFields");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v16)
      {
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v7, "setupFields", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v30;
          do
          {
            v21 = 0;
            do
            {
              if (*(_QWORD *)v30 != v20)
                objc_enumerationMutation(v17);
              v22 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v21);
              objc_msgSend(v6, "readerModeEntryStepContext");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "toNPKProtoStandalonePaymentSetupField:", v22);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "addSetupFields:", v24);

              ++v21;
            }
            while (v19 != v21);
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          }
          while (v19);
        }

      }
    }
    objc_msgSend(v7, "product");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v7, "product");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "toNPKProtoStandalonePaymentSetupProduct:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "readerModeEntryStepContext");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setProduct:", v27);

    }
  }

}

+ (void)_convertReaderModeIngestionStepContext:(id)a3 protoContext:(id)a4
{
  void *v6;
  NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  float v19;
  void *v20;
  double v21;
  id v22;

  v22 = a4;
  objc_msgSend(a3, "readerModeIngestionStepContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext);
    objc_msgSend(v22, "setReaderModeIngestionStepContext:", v7);

    objc_msgSend(v6, "physicalCardImageURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "physicalCardImageURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "absoluteString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "readerModeIngestionStepContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPhysicalCardImageURL:", v10);

    }
    objc_msgSend(v6, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "readerModeIngestionStepContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitle:", v12);

    objc_msgSend(v6, "subtitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "readerModeIngestionStepContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSubtitle:", v14);

    v16 = objc_msgSend(a1, "toNPKProtoStandaloneReaderModeIngestionState:", objc_msgSend(v6, "ingestionState"));
    objc_msgSend(v22, "readerModeIngestionStepContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setIngestionState:", v16);

    objc_msgSend(v6, "ingestionProgress");
    v19 = v18;
    objc_msgSend(v22, "readerModeIngestionStepContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v21 = v19;
    objc_msgSend(v20, "setIngestionProgress:", v21);

  }
}

+ (void)_convertManualEntryStepContext:(id)a3 protoContext:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(a3, "manualEntryStepContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1, "toNPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setManualEntryStepContext:", v7);

  }
}

+ (id)toNPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext:(id)a3
{
  id v4;
  NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext);
  -[NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext setCameraFirstProvisioningEnabled:](v5, "setCameraFirstProvisioningEnabled:", objc_msgSend(v4, "cameraFirstProvisioningEnabled"));
  objc_msgSend(v4, "setupFields");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v4, "setupFields");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      objc_msgSend(v4, "setupFields", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v18;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(a1, "toNPKProtoStandalonePaymentSetupField:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext addSetupFields:](v5, "addSetupFields:", v15);

            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v12);
      }

    }
  }

  return v5;
}

+ (id)toNPKProtoStandalonePaymentSetupField:(id)a3
{
  id v3;
  NPKProtoStandalonePaymentSetupField *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  v4 = objc_alloc_init(NPKProtoStandalonePaymentSetupField);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentSetupField setIdentifier:](v4, "setIdentifier:", v5);

  v6 = objc_msgSend(v3, "fieldType");
  -[NPKProtoStandalonePaymentSetupField setFieldType:](v4, "setFieldType:", +[NPKProtoStandaloneHelper toNPKProtoStandalonePaymentSetupFieldType:](NPKProtoStandaloneHelper, "toNPKProtoStandalonePaymentSetupFieldType:", v6));
  return v4;
}

+ (void)_convertSecondaryManualEntryStepContext:(id)a3 protoContext:(id)a4
{
  void *v6;
  NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext *v7;
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
  uint64_t v19;
  void *v20;
  id v21;

  v21 = a4;
  objc_msgSend(a3, "secondaryManualEntryStepContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext);
    objc_msgSend(v21, "setSecondaryManualEntryStepContext:", v7);

    objc_msgSend(a1, "toNPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "secondaryManualEntryStepContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setManualEntryStepContext:", v8);

    objc_msgSend(v6, "credential");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "credential");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "toNPKProtoStandalonePaymentCredentialUnion:withFlowIdentifier:thumbnailSize:", v11, 0, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "secondaryManualEntryStepContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setCredential:", v12);

      objc_msgSend(v6, "credential");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v12) = objc_msgSend(v14, "isRemoteCredential");

      if ((_DWORD)v12)
      {
        objc_msgSend(v6, "credential");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "remoteCredential");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "toNPKProtoStandalonePaymentRemoteCredential:thumbnailSize:", v16, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "secondaryManualEntryStepContext");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setRemoteCredential:", v17);

      }
    }
    v19 = objc_msgSend(v6, "allowsAddingDifferentCard");
    objc_msgSend(v21, "secondaryManualEntryStepContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAllowsAddingDifferentCard:", v19);

  }
}

+ (void)_convertLocalDeviceManualEntry:(id)a3 protoContext:(id)a4
{
  void *v6;
  NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext *v7;
  NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext *v8;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a4;
  objc_msgSend(a3, "localDeviceManualEntryStepContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext);
    objc_msgSend(v27, "setLocalDeviceManualEntryStepContext:", v7);

    v8 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext);
    objc_msgSend(v27, "localDeviceManualEntryStepContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSecondaryManualEntryStepContext:", v8);

    objc_msgSend(a1, "toNPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localDeviceManualEntryStepContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "secondaryManualEntryStepContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setManualEntryStepContext:", v10);

    objc_msgSend(v6, "credential");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v6, "credential");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "toNPKProtoStandalonePaymentCredentialUnion:withFlowIdentifier:thumbnailSize:", v14, 0, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localDeviceManualEntryStepContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "secondaryManualEntryStepContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setCredential:", v15);

      objc_msgSend(v6, "credential");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v15) = objc_msgSend(v18, "isRemoteCredential");

      if ((_DWORD)v15)
      {
        objc_msgSend(v6, "credential");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "remoteCredential");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "toNPKProtoStandalonePaymentRemoteCredential:thumbnailSize:", v20, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "localDeviceManualEntryStepContext");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "secondaryManualEntryStepContext");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setRemoteCredential:", v21);

      }
    }
    v24 = objc_msgSend(v6, "allowsAddingDifferentCard");
    objc_msgSend(v27, "localDeviceManualEntryStepContext");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "secondaryManualEntryStepContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setAllowsAddingDifferentCard:", v24);

  }
}

+ (void)_convertLocalDeviceManualEntryProgress:(id)a3 protoContext:(id)a4
{
  void *v5;
  NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryProgressStepContext *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a4;
  objc_msgSend(a3, "localDeviceManualEntryProgressStepContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryProgressStepContext);
    objc_msgSend(v9, "setLocalDeviceManualEntryProgressStepContext:", v6);

    v7 = objc_msgSend(v5, "numericEntryPending");
    objc_msgSend(v9, "localDeviceManualEntryProgressStepContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNumericEntryPending:", v7);

  }
}

+ (void)_convertPasscodeUpgradeStepContext:(id)a3 protoContext:(id)a4
{
  void *v5;
  NPKProtoStandalonePaymentProvisioningFlowPasscodeUpgradeStepContext *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a3, "passcodeUpgradeStepContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowPasscodeUpgradeStepContext);
    objc_msgSend(v7, "setPasscodeUpgradeStepContext:", v6);

  }
}

+ (void)_convertTermsAndConditionsStepContext:(id)a3 protoContext:(id)a4
{
  void *v6;
  NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  objc_msgSend(a3, "termsAndConditionsStepContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext);
    objc_msgSend(v16, "setTermsAndConditionsStepContext:", v7);

    objc_msgSend(v6, "termsURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "termsURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "absoluteString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "termsAndConditionsStepContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setTermsURL:", v10);

    }
    objc_msgSend(v6, "setAllowNonSecureHTTP:", objc_msgSend(v6, "allowNonSecureHTTP"));
    objc_msgSend(v6, "product");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v6, "product");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "toNPKProtoStandalonePaymentSetupProduct:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "termsAndConditionsStepContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setProduct:", v14);

    }
  }

}

+ (void)_convertProvisioningProgressStepContext:(id)a3 protoContext:(id)a4
{
  void *v6;
  NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  objc_msgSend(a3, "provisioningProgressStepContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext);
    objc_msgSend(v15, "setProvisioningProgressStepContext:", v7);

    objc_msgSend(v6, "product");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "product");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "toNPKProtoStandalonePaymentSetupProduct:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "provisioningProgressStepContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setProduct:", v10);

    }
    objc_msgSend(v6, "localizedProgressDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v6, "localizedProgressDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "provisioningProgressStepContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setLocalizedProgressDescription:", v13);

    }
  }

}

+ (void)_convertProvisioningResultStepContext:(id)a3 protoContext:(id)a4
{
  void *v6;
  NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  objc_msgSend(a3, "provisioningResultStepContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext);
    objc_msgSend(v14, "setProvisioningResultStepContext:", v7);

    v8 = objc_msgSend(v6, "cardAdded");
    objc_msgSend(v14, "provisioningResultStepContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCardAdded:", v8);

    objc_msgSend(v6, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "toNPKProtoStandaloneError:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "provisioningResultStepContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setError:", v12);

    }
  }

}

+ (void)_convertIssuerVerificationChannelsStepContext:(id)a3 protoContext:(id)a4
{
  void *v6;
  NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v14 = a4;
  objc_msgSend(a3, "verificationChannelsStepContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext);
    objc_msgSend(v14, "setIssuerVerificationChannelsStepContext:", v7);

    objc_msgSend(v6, "paymentPass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "paymentPass");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "toNPKProtoStandalonePaymentPass:thumbnailSize:", v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "issuerVerificationChannelsStepContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPaymentPass:", v10);

    }
    objc_msgSend(v6, "verificationChannels");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v6, "verificationChannels");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __87__NPKProtoStandaloneHelper__convertIssuerVerificationChannelsStepContext_protoContext___block_invoke;
      v15[3] = &unk_24CFEBB88;
      v16 = v14;
      v17 = a1;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v15);

    }
  }

}

void __87__NPKProtoStandaloneHelper__convertIssuerVerificationChannelsStepContext_protoContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "issuerVerificationChannelsStepContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "toNPKProtoStandaloneVerificationChannel:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addVerificationChannels:", v5);
}

+ (void)_convertIssuerVerificationFieldsStepContext:(id)a3 protoContext:(id)a4
{
  void *v5;
  NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationFieldsStepContext *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a3, "verificationFieldsStepContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationFieldsStepContext);
    objc_msgSend(v7, "setIssuerVerificationFieldsStepContext:", v6);

  }
}

+ (void)_convertMoreInformationStepContext:(id)a3 protoContext:(id)a4
{
  void *v6;
  NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v14 = a4;
  objc_msgSend(a3, "moreInformationStepContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext);
    objc_msgSend(v14, "setMoreInformationStepContext:", v7);

    objc_msgSend(v6, "moreInfoItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v6, "moreInfoItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __76__NPKProtoStandaloneHelper__convertMoreInformationStepContext_protoContext___block_invoke;
      v15[3] = &unk_24CFEBBB0;
      v16 = v14;
      v17 = a1;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v15);

    }
    objc_msgSend(v6, "paymentPass");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "paymentPass");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "toNPKProtoStandalonePaymentPass:thumbnailSize:", v11, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "moreInformationStepContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setPaymentPass:", v12);

    }
  }

}

void __76__NPKProtoStandaloneHelper__convertMoreInformationStepContext_protoContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "moreInformationStepContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "toNPKProtoStandalonePaymentSetupMoreInfoItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addMoreInfoItems:", v5);
}

+ (void)_convertIssuerVerificationCodeStepContext:(id)a3 protoContext:(id)a4
{
  void *v5;
  NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationCodeStepContext *v6;
  id v7;

  v7 = a4;
  objc_msgSend(a3, "verificationCodeStepContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationCodeStepContext);
    objc_msgSend(v7, "setIssuerVerificationCodeStepContext:", v6);

  }
}

+ (id)_convertProtoWelcomeStepContext:(id)a3 requestContext:(id)a4
{
  id v5;
  NPKPaymentProvisioningFlowControllerWelcomeStepContext *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v20 = a4;
  v6 = -[NPKPaymentProvisioningFlowControllerWelcomeStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerWelcomeStepContext alloc], "initWithRequestContext:", v20);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v5, "heroImages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v14 = objc_alloc(MEMORY[0x24BE6ECA0]);
        objc_msgSend(v13, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "imageData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v14, "initWithIdentifier:imageData:credentialType:", v15, v16, 0);

        objc_msgSend(v7, "addObject:", v17);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  v18 = (void *)objc_msgSend(v7, "copy");
  -[NPKPaymentProvisioningFlowControllerWelcomeStepContext setHeroImages:](v6, "setHeroImages:", v18);

  return v6;
}

+ (id)fromNPKProtoStandalonePaymentProvisioningFlowStepContext:(id)a3 requestContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NPKPaymentProvisioningFlowControllerChooseFlowStepContext *v9;
  int v10;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v7, "hasWelcomeStepContext"))
  {
    objc_msgSend(v7, "welcomeStepContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_convertProtoWelcomeStepContext:requestContext:", v8, v6);
    v9 = (NPKPaymentProvisioningFlowControllerChooseFlowStepContext *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = objc_msgSend(v7, "hasChooseFlowStepContext");

    if (v10)
      v9 = -[NPKPaymentProvisioningFlowControllerChooseFlowStepContext initWithRequestContext:]([NPKPaymentProvisioningFlowControllerChooseFlowStepContext alloc], "initWithRequestContext:", v6);
    else
      v9 = 0;
  }

  return v9;
}

+ (id)toNPKProtoStandalonePaymentSetupMoreInfoItem:(id)a3
{
  id v3;
  NPKProtoStandalonePaymentSetupMoreInfoItem *v4;
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
  void *v18;

  v3 = a3;
  v4 = objc_alloc_init(NPKProtoStandalonePaymentSetupMoreInfoItem);
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandalonePaymentSetupMoreInfoItem setTitle:](v4, "setTitle:", v6);

  }
  objc_msgSend(v3, "body");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "body");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandalonePaymentSetupMoreInfoItem setBody:](v4, "setBody:", v8);

  }
  objc_msgSend(v3, "linkText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v3, "linkText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandalonePaymentSetupMoreInfoItem setLinkText:](v4, "setLinkText:", v10);

  }
  objc_msgSend(v3, "linkURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "linkURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandalonePaymentSetupMoreInfoItem setLinkURL:](v4, "setLinkURL:", v13);

  }
  objc_msgSend(v3, "imageURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v3, "imageURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "absoluteString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandalonePaymentSetupMoreInfoItem setImageURL:](v4, "setImageURL:", v16);

  }
  -[NPKProtoStandalonePaymentSetupMoreInfoItem imageURL](v4, "imageURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    goto LABEL_14;
  objc_msgSend(v3, "imageData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v3, "imageData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandalonePaymentSetupMoreInfoItem setImageData:](v4, "setImageData:", v17);
LABEL_14:

  }
  return v4;
}

+ (int)toNPKProtoStandalonePassType:(unint64_t)a3
{
  int v3;

  if (a3 == 1)
    v3 = 110;
  else
    v3 = 100;
  if (a3 == -1)
    return 0;
  else
    return v3;
}

+ (int)toNPKProtoStandalonePaymentPassActivationState:(unint64_t)a3
{
  if (a3 - 1 >= 4)
    return 100;
  else
    return 10 * (a3 - 1) + 110;
}

+ (id)toNPKProtoStandalonePass:(id)a3 thumbnailSize:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NPKProtoStandalonePass *v7;
  void *v8;
  double v9;
  double v10;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  NPKProtoStandalonePass *v28;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init(NPKProtoStandalonePass);
  -[NPKProtoStandalonePass setPassType:](v7, "setPassType:", objc_msgSend(a1, "toNPKProtoStandalonePassType:", objc_msgSend(v6, "passType")));
  NPKURLForPass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "passImageSize");
    if (v4)
      objc_msgSend(a1, "passThumbnailImageSize");
    if (v9 == *MEMORY[0x24BDBF148] && v10 == *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      PKScreenSize();
      PKScreenScale();
    }
    v12 = v8;
    v13 = (void *)MEMORY[0x2199B65AC]();
    v14 = (void *)objc_msgSend(MEMORY[0x24BE6EBD8], "createWithFileURL:warnings:error:", v12, 0, 0);
    objc_msgSend(v14, "imageSetLoadedIfNeeded:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "faceImage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v13);
    -[NPKProtoStandalonePass setImageData:](v7, "setImageData:", v17);

  }
  objc_msgSend(v6, "serialNumber");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePass setSerialNumber:](v7, "setSerialNumber:", v18);

  objc_msgSend(v6, "passTypeIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePass setPassTypeIdentifier:](v7, "setPassTypeIdentifier:", v19);

  objc_msgSend(v6, "localizedName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePass setLocalizedName:](v7, "setLocalizedName:", v20);

  objc_msgSend(v6, "localizedDescription");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePass setLocalizedDescription:](v7, "setLocalizedDescription:", v21);

  objc_msgSend(v6, "organizationName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePass setOrganizationName:](v7, "setOrganizationName:", v22);

  objc_msgSend(v6, "userInfo");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v6, "userInfo");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __67__NPKProtoStandaloneHelper_toNPKProtoStandalonePass_thumbnailSize___block_invoke;
    v27[3] = &unk_24CFEBBD8;
    v28 = v7;
    objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v27);

  }
  -[NPKProtoStandalonePass setRemotePass:](v7, "setRemotePass:", objc_msgSend(v6, "isRemotePass"));
  objc_msgSend(v6, "deviceName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePass setDeviceName:](v7, "setDeviceName:", v25);

  return v7;
}

void __67__NPKProtoStandaloneHelper_toNPKProtoStandalonePass_thumbnailSize___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NPKProtoStandaloneUserInfo *v6;
  id v7;

  v7 = a3;
  v5 = a2;
  v6 = objc_alloc_init(NPKProtoStandaloneUserInfo);
  -[NPKProtoStandaloneUserInfo setKey:](v6, "setKey:", v5);

  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[NPKProtoStandaloneUserInfo setValue:](v6, "setValue:", v7);
  }
  objc_msgSend(*(id *)(a1 + 32), "addUserInfos:", v6);

}

+ (id)sha1hash:(id)a3
{
  id v3;
  void *v4;
  uint64_t i;
  unsigned __int8 md[20];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(a3);
  CC_SHA1((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), md);
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 20; ++i)
    objc_msgSend(v4, "appendFormat:", CFSTR("%02x"), md[i]);

  return v4;
}

+ (id)toNPKProtoStandalonePaymentPass:(id)a3 thumbnailSize:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NPKProtoStandalonePaymentPass *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NPKProtoStandalonePaymentApplication *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init(NPKProtoStandalonePaymentPass);
  v8 = (void *)MEMORY[0x2199B65AC]();
  objc_msgSend(a1, "toNPKProtoStandalonePass:thumbnailSize:", v6, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentPass setPass:](v7, "setPass:", v9);

  objc_msgSend(v6, "primaryAccountIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentPass setPrimaryAccountIdentifier:](v7, "setPrimaryAccountIdentifier:", v10);

  objc_msgSend(v6, "primaryAccountNumberSuffix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentPass setPrimaryAccountNumberSuffix:](v7, "setPrimaryAccountNumberSuffix:", v11);

  objc_msgSend(v6, "deviceAccountIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentPass setDeviceAccountIdentifier:](v7, "setDeviceAccountIdentifier:", v12);

  objc_msgSend(v6, "deviceAccountNumberSuffix");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentPass setDeviceAccountNumberSuffix:](v7, "setDeviceAccountNumberSuffix:", v13);

  -[NPKProtoStandalonePaymentPass setActivationState:](v7, "setActivationState:", objc_msgSend(a1, "toNPKProtoStandalonePaymentPassActivationState:", objc_msgSend(v6, "activationState")));
  objc_msgSend(v6, "devicePrimaryPaymentApplication");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_alloc_init(NPKProtoStandalonePaymentApplication);
    -[NPKProtoStandalonePaymentPass setDevicePrimaryPaymentApplication:](v7, "setDevicePrimaryPaymentApplication:", v15);

    objc_msgSend(v6, "devicePrimaryPaymentApplication");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(a1, "toNPKProtoStandalonePaymentApplicationState:", objc_msgSend(v16, "state"));
    -[NPKProtoStandalonePaymentPass devicePrimaryPaymentApplication](v7, "devicePrimaryPaymentApplication");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setState:", v17);

  }
  objc_autoreleasePoolPop(v8);

  return v7;
}

+ (int)toNPKProtoStandaloneVerificationChannelType:(unint64_t)a3
{
  if (a3 - 2 > 6)
    return 110;
  else
    return dword_213772214[a3 - 2];
}

+ (id)toNPKProtoStandaloneVerificationChannel:(id)a3
{
  id v4;
  NPKProtoStandaloneVerificationChannel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_alloc_init(NPKProtoStandaloneVerificationChannel);
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandaloneVerificationChannel setIdentifier:](v5, "setIdentifier:", v6);

  -[NPKProtoStandaloneVerificationChannel setType:](v5, "setType:", objc_msgSend(a1, "toNPKProtoStandaloneVerificationChannelType:", objc_msgSend(v4, "type")));
  objc_msgSend(v4, "typeDescriptionUnlocalized");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandaloneVerificationChannel setTypeDescriptionUnlocalized:](v5, "setTypeDescriptionUnlocalized:", v7);

  objc_msgSend(v4, "typeDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandaloneVerificationChannel setTypeDescription:](v5, "setTypeDescription:", v8);

  objc_msgSend(v4, "organizationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandaloneVerificationChannel setOrganizationName:](v5, "setOrganizationName:", v9);

  -[NPKProtoStandaloneVerificationChannel setRequiresUserInteraction:](v5, "setRequiresUserInteraction:", objc_msgSend(v4, "requiresUserInteraction"));
  objc_msgSend(v4, "contactPoint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandaloneVerificationChannel setContactPoint:](v5, "setContactPoint:", v10);

  objc_msgSend(v4, "sourceAddress");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKProtoStandaloneVerificationChannel setSourceAddress:](v5, "setSourceAddress:", v11);
  return v5;
}

+ (int)toNPKProtoStandalonePaymentApplicationState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xE)
    return 100;
  else
    return dword_213772230[a3 - 1];
}

+ (id)toNPKProtoStandalonePaymentCredential:(id)a3
{
  id v3;
  NPKProtoStandalonePaymentCredential *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc_init(NPKProtoStandalonePaymentCredential);
  objc_msgSend(v3, "sanitizedPrimaryAccountNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentCredential setSanitizedPrimaryAccountNumber:](v4, "setSanitizedPrimaryAccountNumber:", v5);

  objc_msgSend(v3, "expiration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentCredential setExpiration:](v4, "setExpiration:", v6);

  objc_msgSend(v3, "longDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKProtoStandalonePaymentCredential setLongDescription:](v4, "setLongDescription:", v7);
  return v4;
}

+ (id)toNPKProtoStandalonePaymentCredentialUnion:(id)a3 withFlowIdentifier:(id)a4 thumbnailSize:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NPKProtoStandalonePaymentCredentialUnion *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(NPKProtoStandalonePaymentCredentialUnion);
  -[NPKProtoStandalonePaymentCredentialUnion setFlowIdentifier:](v10, "setFlowIdentifier:", v9);

  objc_msgSend(v8, "remoteCredential");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(a1, "toNPKProtoStandalonePaymentRemoteCredential:thumbnailSize:", v11, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandalonePaymentCredentialUnion setRemoteCredential:](v10, "setRemoteCredential:", v12);

  }
  objc_msgSend(v8, "accountCredential");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(a1, "toNPKProtoStandaloneCreditAccountCredential:thumbnailSize:", v13, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandalonePaymentCredentialUnion setCreditAccountCredential:](v10, "setCreditAccountCredential:", v14);

  }
  return v10;
}

+ (id)toNPKProtoStandalonePaymentRemoteCredential:(id)a3 thumbnailSize:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NPKProtoStandalonePaymentRemoteCredential *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init(NPKProtoStandalonePaymentRemoteCredential);
  objc_msgSend(a1, "toNPKProtoStandalonePaymentCredential:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentRemoteCredential setPaymentCredential:](v7, "setPaymentCredential:", v8);

  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentRemoteCredential setIdentifier:](v7, "setIdentifier:", v9);

  objc_msgSend(v6, "passURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentRemoteCredential setPassURL:](v7, "setPassURL:", v11);

  objc_msgSend(v6, "summaryMetadataDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentRemoteCredential setSummaryMetadataDescription:](v7, "setSummaryMetadataDescription:", v12);

  objc_msgSend(v6, "statusDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentRemoteCredential setStatusDescription:](v7, "setStatusDescription:", v13);

  objc_msgSend(v6, "paymentPass");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "toNPKProtoStandalonePaymentPass:thumbnailSize:", v14, v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentRemoteCredential setPaymentPass:](v7, "setPaymentPass:", v15);

  -[NPKProtoStandalonePaymentRemoteCredential setRank:](v7, "setRank:", objc_msgSend(v6, "rank"));
  objc_msgSend(v6, "productIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKProtoStandalonePaymentRemoteCredential setProductIdentifier:](v7, "setProductIdentifier:", v16);
  return v7;
}

+ (id)toNPKProtoStandaloneCreditAccountCredential:(id)a3 thumbnailSize:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NPKProtoStandaloneCreditAccountCredential *v7;
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
  void *v20;
  void *v21;

  v4 = a4;
  v6 = a3;
  v7 = objc_alloc_init(NPKProtoStandaloneCreditAccountCredential);
  objc_msgSend(a1, "toNPKProtoStandalonePaymentCredential:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandaloneCreditAccountCredential setPaymentCredential:](v7, "setPaymentCredential:", v8);

  objc_msgSend(v6, "paymentPass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "toNPKProtoStandalonePaymentPass:thumbnailSize:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandaloneCreditAccountCredential setPaymentPass:](v7, "setPaymentPass:", v10);

  objc_msgSend(v6, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "creditDetails");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currencyCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandaloneCreditAccountCredential setCurrencyCode:](v7, "setCurrencyCode:", v13);

  objc_msgSend(v6, "account");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "creditDetails");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accountSummary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currentBalance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "doubleValue");
  -[NPKProtoStandaloneCreditAccountCredential setCurrentBalance:](v7, "setCurrentBalance:");

  objc_msgSend(v6, "account");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "creditDetails");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "accountSummary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "creditLimit");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "doubleValue");
  -[NPKProtoStandaloneCreditAccountCredential setCreditLimit:](v7, "setCreditLimit:");

  return v7;
}

+ (id)toNPKProtoStandalonePaymentProvisioningFlowPickerSection:(id)a3
{
  id v4;
  NPKProtoStandalonePaymentProvisioningFlowPickerSection *v5;
  void *v6;
  void *v7;
  void *v8;
  NPKProtoStandalonePaymentProvisioningFlowPickerSection *v9;
  _QWORD v11[4];
  NPKProtoStandalonePaymentProvisioningFlowPickerSection *v12;
  id v13;

  v4 = a3;
  v5 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowPickerSection);
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningFlowPickerSection setTitle:](v5, "setTitle:", v6);

  objc_msgSend(v4, "footer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningFlowPickerSection setFooter:](v5, "setFooter:", v7);

  objc_msgSend(v4, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __85__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentProvisioningFlowPickerSection___block_invoke;
  v11[3] = &unk_24CFEBC00;
  v9 = v5;
  v12 = v9;
  v13 = a1;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

  return v9;
}

void __85__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentProvisioningFlowPickerSection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "toNPKProtoStandalonePaymentProvisioningFlowPickerItem:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addItems:", v3);

}

+ (id)toNPKProtoStandalonePaymentProvisioningFlowPickerItem:(id)a3
{
  id v4;
  NPKProtoStandalonePaymentProvisioningFlowPickerItem *v5;
  void *v6;
  void *v7;
  void *v8;
  NPKProtoStandalonePaymentProvisioningFlowPickerItem *v9;
  _QWORD v11[4];
  NPKProtoStandalonePaymentProvisioningFlowPickerItem *v12;
  id v13;

  v4 = a3;
  v5 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningFlowPickerItem);
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningFlowPickerItem setTitle:](v5, "setTitle:", v6);

  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningFlowPickerItem setIdentifier:](v5, "setIdentifier:", v7);

  objc_msgSend(v4, "products");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __82__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentProvisioningFlowPickerItem___block_invoke;
  v11[3] = &unk_24CFEBB38;
  v9 = v5;
  v12 = v9;
  v13 = a1;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

  return v9;
}

void __82__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentProvisioningFlowPickerItem___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "toNPKProtoStandalonePaymentSetupProduct:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addProducts:", v3);

}

+ (id)toNPKProtoStandalonePaymentSetupProduct:(id)a3
{
  id v4;
  NPKProtoStandalonePaymentSetupProduct *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NPKProtoStandalonePaymentSetupProduct *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NPKProtoStandalonePaymentSetupProduct *v14;
  void *v15;
  NPKProtoStandalonePaymentSetupProduct *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NPKProtoStandalonePaymentSetupProduct *v26;
  void *v27;
  NPKProtoStandalonePaymentSetupProduct *v28;
  id v29;
  NPKProtoStandalonePaymentSetupProduct *v30;
  NPKProtoStandalonePaymentSetupProduct *v31;
  _QWORD v33[4];
  id v34;
  NPKProtoStandalonePaymentSetupProduct *v35;
  id v36;
  _QWORD v37[4];
  NPKProtoStandalonePaymentSetupProduct *v38;
  id v39;
  _QWORD v40[4];
  NPKProtoStandalonePaymentSetupProduct *v41;
  _QWORD v42[4];
  NPKProtoStandalonePaymentSetupProduct *v43;
  id v44;
  _QWORD v45[4];
  NPKProtoStandalonePaymentSetupProduct *v46;

  v4 = a3;
  v5 = objc_alloc_init(NPKProtoStandalonePaymentSetupProduct);
  objc_msgSend(v4, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentSetupProduct setDisplayName:](v5, "setDisplayName:", v6);

  objc_msgSend(v4, "regions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __68__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentSetupProduct___block_invoke;
  v45[3] = &unk_24CFEBC28;
  v9 = v5;
  v46 = v9;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v45);

  objc_msgSend(v4, "productIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentSetupProduct setProductIdentifier:](v9, "setProductIdentifier:", v10);

  objc_msgSend(v4, "partnerIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentSetupProduct setPartnerIdentifier:](v9, "setPartnerIdentifier:", v11);

  objc_msgSend(v4, "partnerName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentSetupProduct setPartnerName:](v9, "setPartnerName:", v12);

  objc_msgSend(v4, "requiredFields");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v8;
  v42[1] = 3221225472;
  v42[2] = __68__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentSetupProduct___block_invoke_2;
  v42[3] = &unk_24CFEBC50;
  v14 = v9;
  v43 = v14;
  v44 = a1;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v42);

  objc_msgSend(v4, "supportedProtocols");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v8;
  v40[1] = 3221225472;
  v40[2] = __68__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentSetupProduct___block_invoke_3;
  v40[3] = &unk_24CFE8260;
  v16 = v14;
  v41 = v16;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v40);

  objc_msgSend(v4, "termsURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v4, "termsURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "absoluteString");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandalonePaymentSetupProduct setTermsURL:](v16, "setTermsURL:", v19);

  }
  -[NPKProtoStandalonePaymentSetupProduct setSupportedProvisioningMethods:](v16, "setSupportedProvisioningMethods:", objc_msgSend(v4, "supportedProvisioningMethods"));
  objc_msgSend(v4, "readerModeMetadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "toJsonString:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    -[NPKProtoStandalonePaymentSetupProduct setReaderModeMetadataJson:](v16, "setReaderModeMetadataJson:", v21);
  -[NPKProtoStandalonePaymentSetupProduct setFlags:](v16, "setFlags:", objc_msgSend(v4, "flags"));
  -[NPKProtoStandalonePaymentSetupProduct setHsa2Requirement:](v16, "setHsa2Requirement:", objc_msgSend(v4, "hsa2Requirement"));
  objc_msgSend(v4, "imageAssetURLs");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v4, "imageAssetURLs");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "toNPKProtoStandalonePaymentSetupProductImageAssetURLs:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandalonePaymentSetupProduct setImageAssetURLs:](v16, "setImageAssetURLs:", v24);

  }
  -[NPKProtoStandalonePaymentSetupProduct setSuppressPendingPurchases:](v16, "setSuppressPendingPurchases:", objc_msgSend(v4, "suppressPendingPurchases"));
  objc_msgSend(v4, "paymentOptions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v8;
  v37[1] = 3221225472;
  v37[2] = __68__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentSetupProduct___block_invoke_4;
  v37[3] = &unk_24CFEBC78;
  v26 = v16;
  v38 = v26;
  v39 = a1;
  objc_msgSend(v25, "enumerateObjectsUsingBlock:", v37);

  objc_msgSend(v4, "provisioningMethodTypes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v8;
  v33[1] = 3221225472;
  v33[2] = __68__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentSetupProduct___block_invoke_5;
  v33[3] = &unk_24CFEBB60;
  v34 = v4;
  v36 = a1;
  v28 = v26;
  v35 = v28;
  v29 = v4;
  objc_msgSend(v27, "enumerateObjectsUsingBlock:", v33);

  v30 = v35;
  v31 = v28;

  return v31;
}

uint64_t __68__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentSetupProduct___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addRegions:", a2);
}

void __68__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentSetupProduct___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "toNPKProtoStandalonePaymentSetupField:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addRequiredFields:", v3);

}

uint64_t __68__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentSetupProduct___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addSupportedProtocols:", a2);
}

void __68__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentSetupProduct___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "toNPKProtoStandalonePaymentSetupProductPaymentOption:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addPaymentOptions:", v3);

}

void __68__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentSetupProduct___block_invoke_5(id *a1, void *a2)
{
  id v3;
  void *v4;
  NPKProtoStandalonePaymentProvisioningMethodMetadataDictionaryEntry *v5;
  void *v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    v7 = v3;
    objc_msgSend(a1[4], "provisioningMethodMetadataForType:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningMethodMetadataDictionaryEntry);
      -[NPKProtoStandalonePaymentProvisioningMethodMetadataDictionaryEntry setType:](v5, "setType:", v7);
      objc_msgSend(a1[6], "toNPKProtoStandalonePaymentProvisioningMethodMetadata:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NPKProtoStandalonePaymentProvisioningMethodMetadataDictionaryEntry setMetadata:](v5, "setMetadata:", v6);

      objc_msgSend(a1[5], "addRequestedProvisioningMethods:", v5);
    }

    v3 = v7;
  }

}

+ (id)toNPKProtoStandalonePaymentProvisioningMethodMetadata:(id)a3
{
  id v4;
  NPKProtoStandalonePaymentProvisioningMethodMetadata *v5;
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
  NPKProtoStandalonePaymentProvisioningMethodMetadata *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NPKProtoStandalonePaymentProvisioningMethodMetadata *v31;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void *v36;
  NPKProtoStandalonePaymentProvisioningMethodMetadata *v37;
  id v38;

  v4 = a3;
  v5 = objc_alloc_init(NPKProtoStandalonePaymentProvisioningMethodMetadata);
  objc_msgSend(v4, "productIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "productIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setProductIdentifier:](v5, "setProductIdentifier:", v7);

  }
  objc_msgSend(v4, "currency");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "currency");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setCurrency:](v5, "setCurrency:", v9);

  }
  objc_msgSend(v4, "depositAmount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "depositAmount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setDepositAmount:](v5, "setDepositAmount:", v12);

  }
  objc_msgSend(v4, "minLoadedBalance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v4, "minLoadedBalance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setMinLoadedBalance:](v5, "setMinLoadedBalance:", v15);

  }
  objc_msgSend(v4, "maxLoadedBalance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v4, "maxLoadedBalance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setMaxLoadedBalance:](v5, "setMaxLoadedBalance:", v18);

  }
  objc_msgSend(v4, "requiredFields");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = MEMORY[0x24BDAC760];
  v34 = 3221225472;
  v35 = __82__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentProvisioningMethodMetadata___block_invoke;
  v36 = &unk_24CFEBC50;
  v20 = v5;
  v37 = v20;
  v38 = a1;
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", &v33);

  objc_msgSend(v4, "readerModeMetadata", v33, v34, v35, v36);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "toJsonString:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setReaderModeMetadataJson:](v20, "setReaderModeMetadataJson:", v22);
  objc_msgSend(v4, "digitalIssuanceMetadata");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v4, "digitalIssuanceMetadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "toNPKProtoStandalonePaymentDigitalIssuanceMetadata:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setDigitalIssuanceMetadata:](v20, "setDigitalIssuanceMetadata:", v25);

  }
  objc_msgSend(v4, "readerModeResources");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "toJsonString:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setReaderModeResourcesJson:](v20, "setReaderModeResourcesJson:", v27);
  objc_msgSend(v4, "minimumReaderModeBalance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v4, "minimumReaderModeBalance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringValue");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandalonePaymentProvisioningMethodMetadata setMinimumReaderModeBalance:](v20, "setMinimumReaderModeBalance:", v30);

  }
  v31 = v20;

  return v31;
}

void __82__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentProvisioningMethodMetadata___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "toNPKProtoStandalonePaymentSetupField:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addRequiredFields:", v3);

}

+ (id)toNPKProtoStandalonePaymentDigitalIssuanceMetadata:(id)a3
{
  id v4;
  NPKProtoStandalonePaymentDigitalIssuanceMetadata *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NPKProtoStandalonePaymentDigitalIssuanceMetadata *v14;
  void *v15;
  NPKProtoStandalonePaymentDigitalIssuanceMetadata *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NPKProtoStandalonePaymentDigitalIssuanceMetadata *v24;
  NPKProtoStandalonePaymentDigitalIssuanceMetadata *v25;
  NPKProtoStandalonePaymentDigitalIssuanceMetadata *v26;
  _QWORD v28[4];
  NPKProtoStandalonePaymentDigitalIssuanceMetadata *v29;
  _QWORD v30[4];
  NPKProtoStandalonePaymentDigitalIssuanceMetadata *v31;
  _QWORD v32[4];
  NPKProtoStandalonePaymentDigitalIssuanceMetadata *v33;

  v4 = a3;
  v5 = objc_alloc_init(NPKProtoStandalonePaymentDigitalIssuanceMetadata);
  objc_msgSend(v4, "serviceProviderIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v4, "serviceProviderIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandalonePaymentDigitalIssuanceMetadata setServiceProviderIdentifier:](v5, "setServiceProviderIdentifier:", v7);

  }
  objc_msgSend(v4, "serviceProviderCountryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "serviceProviderCountryCode");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandalonePaymentDigitalIssuanceMetadata setServiceProviderCountryCode:](v5, "setServiceProviderCountryCode:", v9);

  }
  objc_msgSend(v4, "serviceProviderCountryCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "serviceProviderCountryCode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandalonePaymentDigitalIssuanceMetadata setServiceProviderCountryCode:](v5, "setServiceProviderCountryCode:", v11);

  }
  objc_msgSend(v4, "serviceProviderAcceptedNetworks");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __79__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentDigitalIssuanceMetadata___block_invoke;
  v32[3] = &unk_24CFE8260;
  v14 = v5;
  v33 = v14;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v32);

  objc_msgSend(v4, "serviceProviderCapabilities");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v13;
  v30[1] = 3221225472;
  v30[2] = __79__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentDigitalIssuanceMetadata___block_invoke_2;
  v30[3] = &unk_24CFE8260;
  v16 = v14;
  v31 = v16;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v30);

  objc_msgSend(v4, "serviceProviderDict");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "toJsonString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    -[NPKProtoStandalonePaymentDigitalIssuanceMetadata setServiceProviderDictJson:](v16, "setServiceProviderDictJson:", v18);
  objc_msgSend(v4, "action");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v4, "action");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandalonePaymentDigitalIssuanceMetadata setAction:](v16, "setAction:", v20);

  }
  objc_msgSend(v4, "merchantID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v4, "merchantID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandalonePaymentDigitalIssuanceMetadata setMerchantID:](v16, "setMerchantID:", v22);

  }
  objc_msgSend(v4, "defaultSuggestions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v13;
  v28[1] = 3221225472;
  v28[2] = __79__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentDigitalIssuanceMetadata___block_invoke_3;
  v28[3] = &unk_24CFEBCA0;
  v24 = v16;
  v29 = v24;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v28);

  v25 = v29;
  v26 = v24;

  return v26;
}

uint64_t __79__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentDigitalIssuanceMetadata___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addServiceProviderAcceptedNetworks:", a2);
}

uint64_t __79__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentDigitalIssuanceMetadata___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addServiceProviderCapabilities:", a2);
}

void __79__NPKProtoStandaloneHelper_toNPKProtoStandalonePaymentDigitalIssuanceMetadata___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "stringValue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addDefaultSuggestions:", v3);

}

+ (id)toNPKProtoStandalonePaymentSetupProductPaymentOption:(id)a3
{
  id v3;
  NPKProtoStandalonePaymentSetupProductPaymentOption *v4;
  uint64_t v5;

  v3 = a3;
  v4 = objc_alloc_init(NPKProtoStandalonePaymentSetupProductPaymentOption);
  -[NPKProtoStandalonePaymentSetupProductPaymentOption setPriority:](v4, "setPriority:", objc_msgSend(v3, "priority"));
  -[NPKProtoStandalonePaymentSetupProductPaymentOption setCardType:](v4, "setCardType:", objc_msgSend(v3, "cardType"));
  v5 = objc_msgSend(v3, "supportedProtocols");

  -[NPKProtoStandalonePaymentSetupProductPaymentOption setSupportedProtocols:](v4, "setSupportedProtocols:", v5);
  return v4;
}

+ (id)toNPKProtoStandalonePaymentSetupProductImageAssetURLs:(id)a3
{
  id v3;
  NPKProtoStandalonePaymentSetupProductImageAssetURLs *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = objc_alloc_init(NPKProtoStandalonePaymentSetupProductImageAssetURLs);
  objc_msgSend(v3, "digitalCardImageUrl");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "digitalCardImageUrl");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "absoluteString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandalonePaymentSetupProductImageAssetURLs setDigitalCardImageUrl:](v4, "setDigitalCardImageUrl:", v7);

  }
  objc_msgSend(v3, "thumbnailImageUrl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "thumbnailImageUrl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "absoluteString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandalonePaymentSetupProductImageAssetURLs setThumbnailImageUrl:](v4, "setThumbnailImageUrl:", v10);

  }
  objc_msgSend(v3, "logoImageUrl");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v3, "logoImageUrl");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NPKProtoStandalonePaymentSetupProductImageAssetURLs setLogoImageUrl:](v4, "setLogoImageUrl:", v13);

  }
  return v4;
}

+ (id)toJsonString:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (v3
    && (objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v3, 1, 0),
        (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v4, 4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (int)toNPKProtoStandaloneReaderModeIngestionState:(unint64_t)a3
{
  if (a3 - 1 >= 5)
    return 100;
  else
    return 10 * (a3 - 1) + 110;
}

+ (id)toPKPaymentSetupField:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(a1, "toPKPaymentSetupFieldType:", objc_msgSend(v4, "fieldType"));
  v6 = (void *)MEMORY[0x24BE6ED48];
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "paymentSetupFieldWithIdentifier:type:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (unint64_t)toPKPaymentSetupFieldType:(int)a3
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v3 = 3;
  v4 = 4;
  v5 = 5;
  if (a3 != 150)
    v5 = 0;
  if (a3 != 140)
    v4 = v5;
  if (a3 != 130)
    v3 = v4;
  v6 = 1;
  v7 = 2;
  if (a3 != 120)
    v7 = 0;
  if (a3 != 110)
    v6 = v7;
  if (a3 <= 129)
    return v6;
  else
    return v3;
}

@end
