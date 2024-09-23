@implementation NPKProtoStandalonePaymentProvisioningFlowResponse

- (id)fromStepAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 <= 179)
  {
    if (a3 <= 134)
    {
      if (a3 > 119)
      {
        if (a3 == 120)
          return CFSTR("Welcome");
        if (a3 == 130)
          return CFSTR("ChooseFlow");
      }
      else
      {
        if (a3 == 100)
          return CFSTR("Initialized");
        if (a3 == 110)
          return CFSTR("Preconditions");
      }
    }
    else
    {
      if (a3 <= 154)
      {
        switch(a3)
        {
          case 135:
            v3 = CFSTR("ChooseProduct");
            return v3;
          case 137:
            result = CFSTR("ChooseTransitProduct");
            break;
          case 138:
            result = CFSTR("ChooseEMoneyProduct");
            break;
          case 140:
            result = CFSTR("ChooseCredentials");
            break;
          case 144:
            result = CFSTR("ChooseTransitProductType");
            break;
          case 145:
            result = CFSTR("ChooseServiceProviderProducts");
            break;
          case 150:
            result = CFSTR("DigitalIssuanceAmount");
            break;
          default:
            goto LABEL_58;
        }
        return result;
      }
      if (a3 > 159)
      {
        if (a3 == 160)
          return CFSTR("ReaderModeEntry");
        if (a3 == 165)
          return CFSTR("ReaderModeIngestion");
      }
      else
      {
        if (a3 == 155)
          return CFSTR("DigitalIssuancePayment");
        if (a3 == 157)
          return CFSTR("MoreInformation");
      }
    }
    goto LABEL_58;
  }
  if (a3 > 209)
  {
    if (a3 <= 239)
    {
      switch(a3)
      {
        case 210:
          return CFSTR("ProvisioningProgress");
        case 220:
          return CFSTR("ProvisioningResult");
        case 230:
          return CFSTR("IssuerVerificationChannels");
      }
    }
    else if (a3 > 259)
    {
      if (a3 == 260)
        return CFSTR("AppleBalanceAccountDetails");
      if (a3 == 300)
        return CFSTR("GetIssuerApplicationAddRequest");
    }
    else
    {
      if (a3 == 240)
        return CFSTR("IssuerVerificationFields");
      if (a3 == 250)
        return CFSTR("IssuerVerificationCode");
    }
LABEL_58:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  switch(a3)
  {
    case 190:
      result = CFSTR("SecondaryManualEntry");
      break;
    case 191:
    case 194:
    case 196:
    case 198:
    case 199:
      goto LABEL_58;
    case 192:
      result = CFSTR("LocalDeviceManualEntry");
      break;
    case 193:
      result = CFSTR("LocalDeviceManualEntryProgress");
      break;
    case 195:
      result = CFSTR("ProductDisambiguation");
      break;
    case 197:
      result = CFSTR("PasscodeUpgrade");
      break;
    case 200:
      result = CFSTR("TermsAndConditions");
      break;
    default:
      if (a3 != 180)
        goto LABEL_58;
      result = CFSTR("ManualEntry");
      break;
  }
  return result;
}

- (int)StringAsFromStep:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Initialized")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Preconditions")) & 1) != 0)
  {
    v4 = 110;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Welcome")) & 1) != 0)
  {
    v4 = 120;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ChooseFlow")) & 1) != 0)
  {
    v4 = 130;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ChooseProduct")) & 1) != 0)
  {
    v4 = 135;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ChooseTransitProduct")) & 1) != 0)
  {
    v4 = 137;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ChooseEMoneyProduct")) & 1) != 0)
  {
    v4 = 138;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ChooseCredentials")) & 1) != 0)
  {
    v4 = 140;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ChooseTransitProductType")) & 1) != 0)
  {
    v4 = 144;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ChooseServiceProviderProducts")) & 1) != 0)
  {
    v4 = 145;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DigitalIssuanceAmount")) & 1) != 0)
  {
    v4 = 150;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DigitalIssuancePayment")) & 1) != 0)
  {
    v4 = 155;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MoreInformation")) & 1) != 0)
  {
    v4 = 157;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReaderModeEntry")) & 1) != 0)
  {
    v4 = 160;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReaderModeIngestion")) & 1) != 0)
  {
    v4 = 165;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ManualEntry")) & 1) != 0)
  {
    v4 = 180;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SecondaryManualEntry")) & 1) != 0)
  {
    v4 = 190;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LocalDeviceManualEntry")) & 1) != 0)
  {
    v4 = 192;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LocalDeviceManualEntryProgress")) & 1) != 0)
  {
    v4 = 193;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProductDisambiguation")) & 1) != 0)
  {
    v4 = 195;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PasscodeUpgrade")) & 1) != 0)
  {
    v4 = 197;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TermsAndConditions")) & 1) != 0)
  {
    v4 = 200;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProvisioningProgress")) & 1) != 0)
  {
    v4 = 210;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProvisioningResult")) & 1) != 0)
  {
    v4 = 220;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IssuerVerificationChannels")) & 1) != 0)
  {
    v4 = 230;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IssuerVerificationFields")) & 1) != 0)
  {
    v4 = 240;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IssuerVerificationCode")) & 1) != 0)
  {
    v4 = 250;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppleBalanceAccountDetails")) & 1) != 0)
  {
    v4 = 260;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GetIssuerApplicationAddRequest")))
  {
    v4 = 300;
  }
  else
  {
    v4 = 100;
  }

  return v4;
}

- (id)toStepAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 <= 179)
  {
    if (a3 <= 134)
    {
      if (a3 > 119)
      {
        if (a3 == 120)
          return CFSTR("Welcome");
        if (a3 == 130)
          return CFSTR("ChooseFlow");
      }
      else
      {
        if (a3 == 100)
          return CFSTR("Initialized");
        if (a3 == 110)
          return CFSTR("Preconditions");
      }
    }
    else
    {
      if (a3 <= 154)
      {
        switch(a3)
        {
          case 135:
            v3 = CFSTR("ChooseProduct");
            return v3;
          case 137:
            result = CFSTR("ChooseTransitProduct");
            break;
          case 138:
            result = CFSTR("ChooseEMoneyProduct");
            break;
          case 140:
            result = CFSTR("ChooseCredentials");
            break;
          case 144:
            result = CFSTR("ChooseTransitProductType");
            break;
          case 145:
            result = CFSTR("ChooseServiceProviderProducts");
            break;
          case 150:
            result = CFSTR("DigitalIssuanceAmount");
            break;
          default:
            goto LABEL_58;
        }
        return result;
      }
      if (a3 > 159)
      {
        if (a3 == 160)
          return CFSTR("ReaderModeEntry");
        if (a3 == 165)
          return CFSTR("ReaderModeIngestion");
      }
      else
      {
        if (a3 == 155)
          return CFSTR("DigitalIssuancePayment");
        if (a3 == 157)
          return CFSTR("MoreInformation");
      }
    }
    goto LABEL_58;
  }
  if (a3 > 209)
  {
    if (a3 <= 239)
    {
      switch(a3)
      {
        case 210:
          return CFSTR("ProvisioningProgress");
        case 220:
          return CFSTR("ProvisioningResult");
        case 230:
          return CFSTR("IssuerVerificationChannels");
      }
    }
    else if (a3 > 259)
    {
      if (a3 == 260)
        return CFSTR("AppleBalanceAccountDetails");
      if (a3 == 300)
        return CFSTR("GetIssuerApplicationAddRequest");
    }
    else
    {
      if (a3 == 240)
        return CFSTR("IssuerVerificationFields");
      if (a3 == 250)
        return CFSTR("IssuerVerificationCode");
    }
LABEL_58:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  switch(a3)
  {
    case 190:
      result = CFSTR("SecondaryManualEntry");
      break;
    case 191:
    case 194:
    case 196:
    case 198:
    case 199:
      goto LABEL_58;
    case 192:
      result = CFSTR("LocalDeviceManualEntry");
      break;
    case 193:
      result = CFSTR("LocalDeviceManualEntryProgress");
      break;
    case 195:
      result = CFSTR("ProductDisambiguation");
      break;
    case 197:
      result = CFSTR("PasscodeUpgrade");
      break;
    case 200:
      result = CFSTR("TermsAndConditions");
      break;
    default:
      if (a3 != 180)
        goto LABEL_58;
      result = CFSTR("ManualEntry");
      break;
  }
  return result;
}

- (int)StringAsToStep:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Initialized")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Preconditions")) & 1) != 0)
  {
    v4 = 110;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Welcome")) & 1) != 0)
  {
    v4 = 120;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ChooseFlow")) & 1) != 0)
  {
    v4 = 130;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ChooseProduct")) & 1) != 0)
  {
    v4 = 135;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ChooseTransitProduct")) & 1) != 0)
  {
    v4 = 137;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ChooseEMoneyProduct")) & 1) != 0)
  {
    v4 = 138;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ChooseCredentials")) & 1) != 0)
  {
    v4 = 140;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ChooseTransitProductType")) & 1) != 0)
  {
    v4 = 144;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ChooseServiceProviderProducts")) & 1) != 0)
  {
    v4 = 145;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DigitalIssuanceAmount")) & 1) != 0)
  {
    v4 = 150;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DigitalIssuancePayment")) & 1) != 0)
  {
    v4 = 155;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MoreInformation")) & 1) != 0)
  {
    v4 = 157;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReaderModeEntry")) & 1) != 0)
  {
    v4 = 160;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ReaderModeIngestion")) & 1) != 0)
  {
    v4 = 165;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ManualEntry")) & 1) != 0)
  {
    v4 = 180;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SecondaryManualEntry")) & 1) != 0)
  {
    v4 = 190;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LocalDeviceManualEntry")) & 1) != 0)
  {
    v4 = 192;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LocalDeviceManualEntryProgress")) & 1) != 0)
  {
    v4 = 193;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProductDisambiguation")) & 1) != 0)
  {
    v4 = 195;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PasscodeUpgrade")) & 1) != 0)
  {
    v4 = 197;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TermsAndConditions")) & 1) != 0)
  {
    v4 = 200;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProvisioningProgress")) & 1) != 0)
  {
    v4 = 210;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ProvisioningResult")) & 1) != 0)
  {
    v4 = 220;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IssuerVerificationChannels")) & 1) != 0)
  {
    v4 = 230;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IssuerVerificationFields")) & 1) != 0)
  {
    v4 = 240;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IssuerVerificationCode")) & 1) != 0)
  {
    v4 = 250;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppleBalanceAccountDetails")) & 1) != 0)
  {
    v4 = 260;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GetIssuerApplicationAddRequest")))
  {
    v4 = 300;
  }
  else
  {
    v4 = 100;
  }

  return v4;
}

- (BOOL)hasContext
{
  return self->_context != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowResponse;
  -[NPKProtoStandalonePaymentProvisioningFlowResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningFlowResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  NPKProtoStandaloneResponseHeader *responseHeader;
  void *v5;
  int fromStep;
  __CFString *v7;
  int toStep;
  __CFString *v9;
  NPKProtoStandalonePaymentProvisioningFlowStepContext *context;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  responseHeader = self->_responseHeader;
  if (responseHeader)
  {
    -[NPKProtoStandaloneResponseHeader dictionaryRepresentation](responseHeader, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("responseHeader"));

  }
  fromStep = self->_fromStep;
  if (fromStep <= 179)
  {
    if (fromStep <= 134)
    {
      if (fromStep > 119)
      {
        if (fromStep == 120)
        {
          v7 = CFSTR("Welcome");
          goto LABEL_59;
        }
        if (fromStep == 130)
        {
          v7 = CFSTR("ChooseFlow");
          goto LABEL_59;
        }
      }
      else
      {
        if (fromStep == 100)
        {
          v7 = CFSTR("Initialized");
          goto LABEL_59;
        }
        if (fromStep == 110)
        {
          v7 = CFSTR("Preconditions");
          goto LABEL_59;
        }
      }
    }
    else
    {
      if (fromStep <= 154)
      {
        switch(fromStep)
        {
          case 135:
            v7 = CFSTR("ChooseProduct");
            break;
          case 137:
            v7 = CFSTR("ChooseTransitProduct");
            break;
          case 138:
            v7 = CFSTR("ChooseEMoneyProduct");
            break;
          case 140:
            v7 = CFSTR("ChooseCredentials");
            break;
          case 144:
            v7 = CFSTR("ChooseTransitProductType");
            break;
          case 145:
            v7 = CFSTR("ChooseServiceProviderProducts");
            break;
          case 150:
            v7 = CFSTR("DigitalIssuanceAmount");
            break;
          default:
            goto LABEL_58;
        }
        goto LABEL_59;
      }
      if (fromStep > 159)
      {
        if (fromStep == 160)
        {
          v7 = CFSTR("ReaderModeEntry");
          goto LABEL_59;
        }
        if (fromStep == 165)
        {
          v7 = CFSTR("ReaderModeIngestion");
          goto LABEL_59;
        }
      }
      else
      {
        if (fromStep == 155)
        {
          v7 = CFSTR("DigitalIssuancePayment");
          goto LABEL_59;
        }
        if (fromStep == 157)
        {
          v7 = CFSTR("MoreInformation");
          goto LABEL_59;
        }
      }
    }
LABEL_58:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_fromStep);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_59;
  }
  if (fromStep > 209)
  {
    if (fromStep <= 239)
    {
      switch(fromStep)
      {
        case 210:
          v7 = CFSTR("ProvisioningProgress");
          goto LABEL_59;
        case 220:
          v7 = CFSTR("ProvisioningResult");
          goto LABEL_59;
        case 230:
          v7 = CFSTR("IssuerVerificationChannels");
          goto LABEL_59;
      }
    }
    else if (fromStep > 259)
    {
      if (fromStep == 260)
      {
        v7 = CFSTR("AppleBalanceAccountDetails");
        goto LABEL_59;
      }
      if (fromStep == 300)
      {
        v7 = CFSTR("GetIssuerApplicationAddRequest");
        goto LABEL_59;
      }
    }
    else
    {
      if (fromStep == 240)
      {
        v7 = CFSTR("IssuerVerificationFields");
        goto LABEL_59;
      }
      if (fromStep == 250)
      {
        v7 = CFSTR("IssuerVerificationCode");
        goto LABEL_59;
      }
    }
    goto LABEL_58;
  }
  switch(fromStep)
  {
    case 190:
      v7 = CFSTR("SecondaryManualEntry");
      break;
    case 191:
    case 194:
    case 196:
    case 198:
    case 199:
      goto LABEL_58;
    case 192:
      v7 = CFSTR("LocalDeviceManualEntry");
      break;
    case 193:
      v7 = CFSTR("LocalDeviceManualEntryProgress");
      break;
    case 195:
      v7 = CFSTR("ProductDisambiguation");
      break;
    case 197:
      v7 = CFSTR("PasscodeUpgrade");
      break;
    case 200:
      v7 = CFSTR("TermsAndConditions");
      break;
    default:
      if (fromStep != 180)
        goto LABEL_58;
      v7 = CFSTR("ManualEntry");
      break;
  }
LABEL_59:
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("fromStep"));

  toStep = self->_toStep;
  if (toStep <= 179)
  {
    if (toStep <= 134)
    {
      if (toStep > 119)
      {
        if (toStep == 120)
        {
          v9 = CFSTR("Welcome");
          goto LABEL_115;
        }
        if (toStep == 130)
        {
          v9 = CFSTR("ChooseFlow");
          goto LABEL_115;
        }
      }
      else
      {
        if (toStep == 100)
        {
          v9 = CFSTR("Initialized");
          goto LABEL_115;
        }
        if (toStep == 110)
        {
          v9 = CFSTR("Preconditions");
          goto LABEL_115;
        }
      }
    }
    else
    {
      if (toStep <= 154)
      {
        switch(toStep)
        {
          case 135:
            v9 = CFSTR("ChooseProduct");
            break;
          case 137:
            v9 = CFSTR("ChooseTransitProduct");
            break;
          case 138:
            v9 = CFSTR("ChooseEMoneyProduct");
            break;
          case 140:
            v9 = CFSTR("ChooseCredentials");
            break;
          case 144:
            v9 = CFSTR("ChooseTransitProductType");
            break;
          case 145:
            v9 = CFSTR("ChooseServiceProviderProducts");
            break;
          case 150:
            v9 = CFSTR("DigitalIssuanceAmount");
            break;
          default:
            goto LABEL_114;
        }
        goto LABEL_115;
      }
      if (toStep > 159)
      {
        if (toStep == 160)
        {
          v9 = CFSTR("ReaderModeEntry");
          goto LABEL_115;
        }
        if (toStep == 165)
        {
          v9 = CFSTR("ReaderModeIngestion");
          goto LABEL_115;
        }
      }
      else
      {
        if (toStep == 155)
        {
          v9 = CFSTR("DigitalIssuancePayment");
          goto LABEL_115;
        }
        if (toStep == 157)
        {
          v9 = CFSTR("MoreInformation");
          goto LABEL_115;
        }
      }
    }
LABEL_114:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_toStep);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_115;
  }
  if (toStep > 209)
  {
    if (toStep <= 239)
    {
      switch(toStep)
      {
        case 210:
          v9 = CFSTR("ProvisioningProgress");
          goto LABEL_115;
        case 220:
          v9 = CFSTR("ProvisioningResult");
          goto LABEL_115;
        case 230:
          v9 = CFSTR("IssuerVerificationChannels");
          goto LABEL_115;
      }
    }
    else if (toStep > 259)
    {
      if (toStep == 260)
      {
        v9 = CFSTR("AppleBalanceAccountDetails");
        goto LABEL_115;
      }
      if (toStep == 300)
      {
        v9 = CFSTR("GetIssuerApplicationAddRequest");
        goto LABEL_115;
      }
    }
    else
    {
      if (toStep == 240)
      {
        v9 = CFSTR("IssuerVerificationFields");
        goto LABEL_115;
      }
      if (toStep == 250)
      {
        v9 = CFSTR("IssuerVerificationCode");
        goto LABEL_115;
      }
    }
    goto LABEL_114;
  }
  switch(toStep)
  {
    case 190:
      v9 = CFSTR("SecondaryManualEntry");
      break;
    case 191:
    case 194:
    case 196:
    case 198:
    case 199:
      goto LABEL_114;
    case 192:
      v9 = CFSTR("LocalDeviceManualEntry");
      break;
    case 193:
      v9 = CFSTR("LocalDeviceManualEntryProgress");
      break;
    case 195:
      v9 = CFSTR("ProductDisambiguation");
      break;
    case 197:
      v9 = CFSTR("PasscodeUpgrade");
      break;
    case 200:
      v9 = CFSTR("TermsAndConditions");
      break;
    default:
      if (toStep != 180)
        goto LABEL_114;
      v9 = CFSTR("ManualEntry");
      break;
  }
LABEL_115:
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("toStep"));

  context = self->_context;
  if (context)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext dictionaryRepresentation](context, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("context"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt32Field();
  if (self->_context)
    PBDataWriterWriteSubmessage();
  if (!self->_responseHeader)
    -[NPKProtoStandalonePaymentProvisioningFlowResponse writeTo:].cold.1();
  PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  v4[4] = self->_fromStep;
  v4[8] = self->_toStep;
  v5 = v4;
  if (self->_context)
  {
    objc_msgSend(v4, "setContext:");
    v4 = v5;
  }
  objc_msgSend(v4, "setResponseHeader:", self->_responseHeader);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 16) = self->_fromStep;
  *(_DWORD *)(v5 + 32) = self->_toStep;
  v6 = -[NPKProtoStandalonePaymentProvisioningFlowStepContext copyWithZone:](self->_context, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  v8 = -[NPKProtoStandaloneResponseHeader copyWithZone:](self->_responseHeader, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NPKProtoStandalonePaymentProvisioningFlowStepContext *context;
  NPKProtoStandaloneResponseHeader *responseHeader;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_fromStep == *((_DWORD *)v4 + 4)
    && self->_toStep == *((_DWORD *)v4 + 8)
    && ((context = self->_context, !((unint64_t)context | v4[1]))
     || -[NPKProtoStandalonePaymentProvisioningFlowStepContext isEqual:](context, "isEqual:")))
  {
    responseHeader = self->_responseHeader;
    if ((unint64_t)responseHeader | v4[3])
      v7 = -[NPKProtoStandaloneResponseHeader isEqual:](responseHeader, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  v3 = (2654435761 * self->_toStep) ^ (2654435761 * self->_fromStep);
  v4 = -[NPKProtoStandalonePaymentProvisioningFlowStepContext hash](self->_context, "hash");
  return v3 ^ v4 ^ -[NPKProtoStandaloneResponseHeader hash](self->_responseHeader, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  NPKProtoStandalonePaymentProvisioningFlowStepContext *context;
  uint64_t v6;
  NPKProtoStandaloneResponseHeader *responseHeader;
  uint64_t v8;
  _DWORD *v9;

  v4 = a3;
  self->_fromStep = v4[4];
  self->_toStep = v4[8];
  context = self->_context;
  v6 = *((_QWORD *)v4 + 1);
  v9 = v4;
  if (context)
  {
    if (!v6)
      goto LABEL_7;
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext mergeFrom:](context, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[NPKProtoStandalonePaymentProvisioningFlowResponse setContext:](self, "setContext:");
  }
  v4 = v9;
LABEL_7:
  responseHeader = self->_responseHeader;
  v8 = *((_QWORD *)v4 + 3);
  if (responseHeader)
  {
    if (v8)
    {
      -[NPKProtoStandaloneResponseHeader mergeFrom:](responseHeader, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowResponse setResponseHeader:](self, "setResponseHeader:");
    goto LABEL_12;
  }

}

- (NPKProtoStandaloneResponseHeader)responseHeader
{
  return self->_responseHeader;
}

- (void)setResponseHeader:(id)a3
{
  objc_storeStrong((id *)&self->_responseHeader, a3);
}

- (int)fromStep
{
  return self->_fromStep;
}

- (void)setFromStep:(int)a3
{
  self->_fromStep = a3;
}

- (int)toStep
{
  return self->_toStep;
}

- (void)setToStep:(int)a3
{
  self->_toStep = a3;
}

- (NPKProtoStandalonePaymentProvisioningFlowStepContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseHeader, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentProvisioningFlowResponse writeTo:]", "NPKProtoStandalonePaymentProvisioningFlowResponse.m", 159, "self->_responseHeader != nil");
}

@end
