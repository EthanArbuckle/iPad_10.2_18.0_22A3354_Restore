@implementation NPKProtoStandalonePaymentProvisioningFlowStepContext

- (BOOL)hasBackStepIdentifier
{
  return self->_backStepIdentifier != 0;
}

- (void)setAllowsAddLater:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_allowsAddLater = a3;
}

- (void)setHasAllowsAddLater:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAllowsAddLater
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasWelcomeStepContext
{
  return self->_welcomeStepContext != 0;
}

- (BOOL)hasChooseFlowStepContext
{
  return self->_chooseFlowStepContext != 0;
}

- (BOOL)hasChooseProductStepContext
{
  return self->_chooseProductStepContext != 0;
}

- (BOOL)hasChooseCredentialsStepContext
{
  return self->_chooseCredentialsStepContext != 0;
}

- (BOOL)hasDigitalIssuanceAmountStepContext
{
  return self->_digitalIssuanceAmountStepContext != 0;
}

- (BOOL)hasDigitalIssuancePaymentStepContext
{
  return self->_digitalIssuancePaymentStepContext != 0;
}

- (BOOL)hasMoreInformationStepContext
{
  return self->_moreInformationStepContext != 0;
}

- (BOOL)hasReaderModeEntryStepContext
{
  return self->_readerModeEntryStepContext != 0;
}

- (BOOL)hasReaderModeIngestionStepContext
{
  return self->_readerModeIngestionStepContext != 0;
}

- (BOOL)hasManualEntryStepContext
{
  return self->_manualEntryStepContext != 0;
}

- (BOOL)hasSecondaryManualEntryStepContext
{
  return self->_secondaryManualEntryStepContext != 0;
}

- (BOOL)hasLocalDeviceManualEntryStepContext
{
  return self->_localDeviceManualEntryStepContext != 0;
}

- (BOOL)hasLocalDeviceManualEntryProgressStepContext
{
  return self->_localDeviceManualEntryProgressStepContext != 0;
}

- (BOOL)hasProductDisambiguationStepContext
{
  return self->_productDisambiguationStepContext != 0;
}

- (BOOL)hasPasscodeUpgradeStepContext
{
  return self->_passcodeUpgradeStepContext != 0;
}

- (BOOL)hasTermsAndConditionsStepContext
{
  return self->_termsAndConditionsStepContext != 0;
}

- (BOOL)hasProvisioningProgressStepContext
{
  return self->_provisioningProgressStepContext != 0;
}

- (BOOL)hasProvisioningResultStepContext
{
  return self->_provisioningResultStepContext != 0;
}

- (BOOL)hasIssuerVerificationChannelsStepContext
{
  return self->_issuerVerificationChannelsStepContext != 0;
}

- (BOOL)hasIssuerVerificationFieldsStepContext
{
  return self->_issuerVerificationFieldsStepContext != 0;
}

- (BOOL)hasIssuerVerificationCodeStepContext
{
  return self->_issuerVerificationCodeStepContext != 0;
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
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowStepContext;
  -[NPKProtoStandalonePaymentProvisioningFlowStepContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoStandalonePaymentProvisioningFlowStepContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *stepIdentifier;
  NSString *backStepIdentifier;
  void *v7;
  NPKProtoStandalonePaymentProvisioningFlowWelcomeStepContext *welcomeStepContext;
  void *v9;
  NPKProtoStandalonePaymentProvisioningFlowChooseFlowStepContext *chooseFlowStepContext;
  void *v11;
  NPKProtoStandalonePaymentProvisioningFlowChooseProductStepContext *chooseProductStepContext;
  void *v13;
  NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext *chooseCredentialsStepContext;
  void *v15;
  NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext *digitalIssuanceAmountStepContext;
  void *v17;
  NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext *digitalIssuancePaymentStepContext;
  void *v19;
  NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext *moreInformationStepContext;
  void *v21;
  NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext *readerModeEntryStepContext;
  void *v23;
  NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext *readerModeIngestionStepContext;
  void *v25;
  NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext *manualEntryStepContext;
  void *v27;
  NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext *secondaryManualEntryStepContext;
  void *v29;
  NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext *localDeviceManualEntryStepContext;
  void *v31;
  NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryProgressStepContext *localDeviceManualEntryProgressStepContext;
  void *v33;
  NPKProtoStandalonePaymentProvisioningFlowProductDisambiguationStepContext *productDisambiguationStepContext;
  void *v35;
  NPKProtoStandalonePaymentProvisioningFlowPasscodeUpgradeStepContext *passcodeUpgradeStepContext;
  void *v37;
  NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext *termsAndConditionsStepContext;
  void *v39;
  NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext *provisioningProgressStepContext;
  void *v41;
  NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext *provisioningResultStepContext;
  void *v43;
  NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext *issuerVerificationChannelsStepContext;
  void *v45;
  NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationFieldsStepContext *issuerVerificationFieldsStepContext;
  void *v47;
  NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationCodeStepContext *issuerVerificationCodeStepContext;
  void *v49;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  stepIdentifier = self->_stepIdentifier;
  if (stepIdentifier)
    objc_msgSend(v3, "setObject:forKey:", stepIdentifier, CFSTR("stepIdentifier"));
  backStepIdentifier = self->_backStepIdentifier;
  if (backStepIdentifier)
    objc_msgSend(v4, "setObject:forKey:", backStepIdentifier, CFSTR("backStepIdentifier"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_allowsAddLater);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("allowsAddLater"));

  }
  welcomeStepContext = self->_welcomeStepContext;
  if (welcomeStepContext)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowWelcomeStepContext dictionaryRepresentation](welcomeStepContext, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("welcomeStepContext"));

  }
  chooseFlowStepContext = self->_chooseFlowStepContext;
  if (chooseFlowStepContext)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowChooseFlowStepContext dictionaryRepresentation](chooseFlowStepContext, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("chooseFlowStepContext"));

  }
  chooseProductStepContext = self->_chooseProductStepContext;
  if (chooseProductStepContext)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowChooseProductStepContext dictionaryRepresentation](chooseProductStepContext, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("chooseProductStepContext"));

  }
  chooseCredentialsStepContext = self->_chooseCredentialsStepContext;
  if (chooseCredentialsStepContext)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext dictionaryRepresentation](chooseCredentialsStepContext, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("chooseCredentialsStepContext"));

  }
  digitalIssuanceAmountStepContext = self->_digitalIssuanceAmountStepContext;
  if (digitalIssuanceAmountStepContext)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext dictionaryRepresentation](digitalIssuanceAmountStepContext, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("digitalIssuanceAmountStepContext"));

  }
  digitalIssuancePaymentStepContext = self->_digitalIssuancePaymentStepContext;
  if (digitalIssuancePaymentStepContext)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext dictionaryRepresentation](digitalIssuancePaymentStepContext, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("digitalIssuancePaymentStepContext"));

  }
  moreInformationStepContext = self->_moreInformationStepContext;
  if (moreInformationStepContext)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext dictionaryRepresentation](moreInformationStepContext, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("moreInformationStepContext"));

  }
  readerModeEntryStepContext = self->_readerModeEntryStepContext;
  if (readerModeEntryStepContext)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext dictionaryRepresentation](readerModeEntryStepContext, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("readerModeEntryStepContext"));

  }
  readerModeIngestionStepContext = self->_readerModeIngestionStepContext;
  if (readerModeIngestionStepContext)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext dictionaryRepresentation](readerModeIngestionStepContext, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("readerModeIngestionStepContext"));

  }
  manualEntryStepContext = self->_manualEntryStepContext;
  if (manualEntryStepContext)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext dictionaryRepresentation](manualEntryStepContext, "dictionaryRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("manualEntryStepContext"));

  }
  secondaryManualEntryStepContext = self->_secondaryManualEntryStepContext;
  if (secondaryManualEntryStepContext)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext dictionaryRepresentation](secondaryManualEntryStepContext, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("secondaryManualEntryStepContext"));

  }
  localDeviceManualEntryStepContext = self->_localDeviceManualEntryStepContext;
  if (localDeviceManualEntryStepContext)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext dictionaryRepresentation](localDeviceManualEntryStepContext, "dictionaryRepresentation");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("localDeviceManualEntryStepContext"));

  }
  localDeviceManualEntryProgressStepContext = self->_localDeviceManualEntryProgressStepContext;
  if (localDeviceManualEntryProgressStepContext)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryProgressStepContext dictionaryRepresentation](localDeviceManualEntryProgressStepContext, "dictionaryRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("localDeviceManualEntryProgressStepContext"));

  }
  productDisambiguationStepContext = self->_productDisambiguationStepContext;
  if (productDisambiguationStepContext)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowProductDisambiguationStepContext dictionaryRepresentation](productDisambiguationStepContext, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("productDisambiguationStepContext"));

  }
  passcodeUpgradeStepContext = self->_passcodeUpgradeStepContext;
  if (passcodeUpgradeStepContext)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowPasscodeUpgradeStepContext dictionaryRepresentation](passcodeUpgradeStepContext, "dictionaryRepresentation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("passcodeUpgradeStepContext"));

  }
  termsAndConditionsStepContext = self->_termsAndConditionsStepContext;
  if (termsAndConditionsStepContext)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext dictionaryRepresentation](termsAndConditionsStepContext, "dictionaryRepresentation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("termsAndConditionsStepContext"));

  }
  provisioningProgressStepContext = self->_provisioningProgressStepContext;
  if (provisioningProgressStepContext)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext dictionaryRepresentation](provisioningProgressStepContext, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("provisioningProgressStepContext"));

  }
  provisioningResultStepContext = self->_provisioningResultStepContext;
  if (provisioningResultStepContext)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext dictionaryRepresentation](provisioningResultStepContext, "dictionaryRepresentation");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("provisioningResultStepContext"));

  }
  issuerVerificationChannelsStepContext = self->_issuerVerificationChannelsStepContext;
  if (issuerVerificationChannelsStepContext)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext dictionaryRepresentation](issuerVerificationChannelsStepContext, "dictionaryRepresentation");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("issuerVerificationChannelsStepContext"));

  }
  issuerVerificationFieldsStepContext = self->_issuerVerificationFieldsStepContext;
  if (issuerVerificationFieldsStepContext)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationFieldsStepContext dictionaryRepresentation](issuerVerificationFieldsStepContext, "dictionaryRepresentation");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v47, CFSTR("issuerVerificationFieldsStepContext"));

  }
  issuerVerificationCodeStepContext = self->_issuerVerificationCodeStepContext;
  if (issuerVerificationCodeStepContext)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationCodeStepContext dictionaryRepresentation](issuerVerificationCodeStepContext, "dictionaryRepresentation");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("issuerVerificationCodeStepContext"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowStepContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!self->_stepIdentifier)
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext writeTo:].cold.1();
  v6 = v4;
  PBDataWriterWriteStringField();
  if (self->_backStepIdentifier)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();
  v5 = v6;
  if (self->_welcomeStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_chooseFlowStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_chooseProductStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_chooseCredentialsStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_digitalIssuanceAmountStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_digitalIssuancePaymentStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_moreInformationStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_readerModeEntryStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_readerModeIngestionStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_manualEntryStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_secondaryManualEntryStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_localDeviceManualEntryStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_localDeviceManualEntryProgressStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_productDisambiguationStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_passcodeUpgradeStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_termsAndConditionsStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_provisioningProgressStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_provisioningResultStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_issuerVerificationChannelsStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_issuerVerificationFieldsStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_issuerVerificationCodeStepContext)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  _BYTE *v5;

  v5 = a3;
  objc_msgSend(v5, "setStepIdentifier:", self->_stepIdentifier);
  if (self->_backStepIdentifier)
    objc_msgSend(v5, "setBackStepIdentifier:");
  v4 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v5[192] = self->_allowsAddLater;
    v5[196] |= 1u;
  }
  if (self->_welcomeStepContext)
  {
    objc_msgSend(v5, "setWelcomeStepContext:");
    v4 = v5;
  }
  if (self->_chooseFlowStepContext)
  {
    objc_msgSend(v5, "setChooseFlowStepContext:");
    v4 = v5;
  }
  if (self->_chooseProductStepContext)
  {
    objc_msgSend(v5, "setChooseProductStepContext:");
    v4 = v5;
  }
  if (self->_chooseCredentialsStepContext)
  {
    objc_msgSend(v5, "setChooseCredentialsStepContext:");
    v4 = v5;
  }
  if (self->_digitalIssuanceAmountStepContext)
  {
    objc_msgSend(v5, "setDigitalIssuanceAmountStepContext:");
    v4 = v5;
  }
  if (self->_digitalIssuancePaymentStepContext)
  {
    objc_msgSend(v5, "setDigitalIssuancePaymentStepContext:");
    v4 = v5;
  }
  if (self->_moreInformationStepContext)
  {
    objc_msgSend(v5, "setMoreInformationStepContext:");
    v4 = v5;
  }
  if (self->_readerModeEntryStepContext)
  {
    objc_msgSend(v5, "setReaderModeEntryStepContext:");
    v4 = v5;
  }
  if (self->_readerModeIngestionStepContext)
  {
    objc_msgSend(v5, "setReaderModeIngestionStepContext:");
    v4 = v5;
  }
  if (self->_manualEntryStepContext)
  {
    objc_msgSend(v5, "setManualEntryStepContext:");
    v4 = v5;
  }
  if (self->_secondaryManualEntryStepContext)
  {
    objc_msgSend(v5, "setSecondaryManualEntryStepContext:");
    v4 = v5;
  }
  if (self->_localDeviceManualEntryStepContext)
  {
    objc_msgSend(v5, "setLocalDeviceManualEntryStepContext:");
    v4 = v5;
  }
  if (self->_localDeviceManualEntryProgressStepContext)
  {
    objc_msgSend(v5, "setLocalDeviceManualEntryProgressStepContext:");
    v4 = v5;
  }
  if (self->_productDisambiguationStepContext)
  {
    objc_msgSend(v5, "setProductDisambiguationStepContext:");
    v4 = v5;
  }
  if (self->_passcodeUpgradeStepContext)
  {
    objc_msgSend(v5, "setPasscodeUpgradeStepContext:");
    v4 = v5;
  }
  if (self->_termsAndConditionsStepContext)
  {
    objc_msgSend(v5, "setTermsAndConditionsStepContext:");
    v4 = v5;
  }
  if (self->_provisioningProgressStepContext)
  {
    objc_msgSend(v5, "setProvisioningProgressStepContext:");
    v4 = v5;
  }
  if (self->_provisioningResultStepContext)
  {
    objc_msgSend(v5, "setProvisioningResultStepContext:");
    v4 = v5;
  }
  if (self->_issuerVerificationChannelsStepContext)
  {
    objc_msgSend(v5, "setIssuerVerificationChannelsStepContext:");
    v4 = v5;
  }
  if (self->_issuerVerificationFieldsStepContext)
  {
    objc_msgSend(v5, "setIssuerVerificationFieldsStepContext:");
    v4 = v5;
  }
  if (self->_issuerVerificationCodeStepContext)
  {
    objc_msgSend(v5, "setIssuerVerificationCodeStepContext:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_stepIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v6;

  v8 = -[NSString copyWithZone:](self->_backStepIdentifier, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 192) = self->_allowsAddLater;
    *(_BYTE *)(v5 + 196) |= 1u;
  }
  v10 = -[NPKProtoStandalonePaymentProvisioningFlowWelcomeStepContext copyWithZone:](self->_welcomeStepContext, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v10;

  v12 = -[NPKProtoStandalonePaymentProvisioningFlowChooseFlowStepContext copyWithZone:](self->_chooseFlowStepContext, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  v14 = -[NPKProtoStandalonePaymentProvisioningFlowChooseProductStepContext copyWithZone:](self->_chooseProductStepContext, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  v16 = -[NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext copyWithZone:](self->_chooseCredentialsStepContext, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;

  v18 = -[NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext copyWithZone:](self->_digitalIssuanceAmountStepContext, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v18;

  v20 = -[NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext copyWithZone:](self->_digitalIssuancePaymentStepContext, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v20;

  v22 = -[NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext copyWithZone:](self->_moreInformationStepContext, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v22;

  v24 = -[NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext copyWithZone:](self->_readerModeEntryStepContext, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v24;

  v26 = -[NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext copyWithZone:](self->_readerModeIngestionStepContext, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v26;

  v28 = -[NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext copyWithZone:](self->_manualEntryStepContext, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v28;

  v30 = -[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext copyWithZone:](self->_secondaryManualEntryStepContext, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v30;

  v32 = -[NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext copyWithZone:](self->_localDeviceManualEntryStepContext, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v32;

  v34 = -[NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryProgressStepContext copyWithZone:](self->_localDeviceManualEntryProgressStepContext, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v34;

  v36 = -[NPKProtoStandalonePaymentProvisioningFlowProductDisambiguationStepContext copyWithZone:](self->_productDisambiguationStepContext, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v36;

  v38 = -[NPKProtoStandalonePaymentProvisioningFlowPasscodeUpgradeStepContext copyWithZone:](self->_passcodeUpgradeStepContext, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v38;

  v40 = -[NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext copyWithZone:](self->_termsAndConditionsStepContext, "copyWithZone:", a3);
  v41 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v40;

  v42 = -[NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext copyWithZone:](self->_provisioningProgressStepContext, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v42;

  v44 = -[NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext copyWithZone:](self->_provisioningResultStepContext, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v44;

  v46 = -[NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext copyWithZone:](self->_issuerVerificationChannelsStepContext, "copyWithZone:", a3);
  v47 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v46;

  v48 = -[NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationFieldsStepContext copyWithZone:](self->_issuerVerificationFieldsStepContext, "copyWithZone:", a3);
  v49 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v48;

  v50 = -[NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationCodeStepContext copyWithZone:](self->_issuerVerificationCodeStepContext, "copyWithZone:", a3);
  v51 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v50;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *stepIdentifier;
  NSString *backStepIdentifier;
  NPKProtoStandalonePaymentProvisioningFlowWelcomeStepContext *welcomeStepContext;
  NPKProtoStandalonePaymentProvisioningFlowChooseFlowStepContext *chooseFlowStepContext;
  NPKProtoStandalonePaymentProvisioningFlowChooseProductStepContext *chooseProductStepContext;
  NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext *chooseCredentialsStepContext;
  NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext *digitalIssuanceAmountStepContext;
  NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext *digitalIssuancePaymentStepContext;
  NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext *moreInformationStepContext;
  NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext *readerModeEntryStepContext;
  NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext *readerModeIngestionStepContext;
  NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext *manualEntryStepContext;
  NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext *secondaryManualEntryStepContext;
  NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext *localDeviceManualEntryStepContext;
  NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryProgressStepContext *localDeviceManualEntryProgressStepContext;
  NPKProtoStandalonePaymentProvisioningFlowProductDisambiguationStepContext *productDisambiguationStepContext;
  NPKProtoStandalonePaymentProvisioningFlowPasscodeUpgradeStepContext *passcodeUpgradeStepContext;
  NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext *termsAndConditionsStepContext;
  NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext *provisioningProgressStepContext;
  NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext *provisioningResultStepContext;
  NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext *issuerVerificationChannelsStepContext;
  NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationFieldsStepContext *issuerVerificationFieldsStepContext;
  NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationCodeStepContext *issuerVerificationCodeStepContext;
  char v28;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_56;
  stepIdentifier = self->_stepIdentifier;
  if ((unint64_t)stepIdentifier | *((_QWORD *)v4 + 21))
  {
    if (!-[NSString isEqual:](stepIdentifier, "isEqual:"))
      goto LABEL_56;
  }
  backStepIdentifier = self->_backStepIdentifier;
  if ((unint64_t)backStepIdentifier | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](backStepIdentifier, "isEqual:"))
      goto LABEL_56;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 196) & 1) != 0)
    {
      if (self->_allowsAddLater)
      {
        if (!*((_BYTE *)v4 + 192))
          goto LABEL_56;
        goto LABEL_14;
      }
      if (!*((_BYTE *)v4 + 192))
        goto LABEL_14;
    }
LABEL_56:
    v28 = 0;
    goto LABEL_57;
  }
  if ((*((_BYTE *)v4 + 196) & 1) != 0)
    goto LABEL_56;
LABEL_14:
  welcomeStepContext = self->_welcomeStepContext;
  if ((unint64_t)welcomeStepContext | *((_QWORD *)v4 + 23)
    && !-[NPKProtoStandalonePaymentProvisioningFlowWelcomeStepContext isEqual:](welcomeStepContext, "isEqual:"))
  {
    goto LABEL_56;
  }
  chooseFlowStepContext = self->_chooseFlowStepContext;
  if ((unint64_t)chooseFlowStepContext | *((_QWORD *)v4 + 3))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowChooseFlowStepContext isEqual:](chooseFlowStepContext, "isEqual:"))
      goto LABEL_56;
  }
  chooseProductStepContext = self->_chooseProductStepContext;
  if ((unint64_t)chooseProductStepContext | *((_QWORD *)v4 + 4))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowChooseProductStepContext isEqual:](chooseProductStepContext, "isEqual:"))goto LABEL_56;
  }
  chooseCredentialsStepContext = self->_chooseCredentialsStepContext;
  if ((unint64_t)chooseCredentialsStepContext | *((_QWORD *)v4 + 2))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext isEqual:](chooseCredentialsStepContext, "isEqual:"))goto LABEL_56;
  }
  digitalIssuanceAmountStepContext = self->_digitalIssuanceAmountStepContext;
  if ((unint64_t)digitalIssuanceAmountStepContext | *((_QWORD *)v4 + 5))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext isEqual:](digitalIssuanceAmountStepContext, "isEqual:"))goto LABEL_56;
  }
  digitalIssuancePaymentStepContext = self->_digitalIssuancePaymentStepContext;
  if ((unint64_t)digitalIssuancePaymentStepContext | *((_QWORD *)v4 + 6))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext isEqual:](digitalIssuancePaymentStepContext, "isEqual:"))goto LABEL_56;
  }
  moreInformationStepContext = self->_moreInformationStepContext;
  if ((unint64_t)moreInformationStepContext | *((_QWORD *)v4 + 13))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext isEqual:](moreInformationStepContext, "isEqual:"))goto LABEL_56;
  }
  readerModeEntryStepContext = self->_readerModeEntryStepContext;
  if ((unint64_t)readerModeEntryStepContext | *((_QWORD *)v4 + 18))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext isEqual:](readerModeEntryStepContext, "isEqual:"))goto LABEL_56;
  }
  readerModeIngestionStepContext = self->_readerModeIngestionStepContext;
  if ((unint64_t)readerModeIngestionStepContext | *((_QWORD *)v4 + 19))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext isEqual:](readerModeIngestionStepContext, "isEqual:"))goto LABEL_56;
  }
  manualEntryStepContext = self->_manualEntryStepContext;
  if ((unint64_t)manualEntryStepContext | *((_QWORD *)v4 + 12))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext isEqual:](manualEntryStepContext, "isEqual:"))goto LABEL_56;
  }
  secondaryManualEntryStepContext = self->_secondaryManualEntryStepContext;
  if ((unint64_t)secondaryManualEntryStepContext | *((_QWORD *)v4 + 20))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext isEqual:](secondaryManualEntryStepContext, "isEqual:"))goto LABEL_56;
  }
  localDeviceManualEntryStepContext = self->_localDeviceManualEntryStepContext;
  if ((unint64_t)localDeviceManualEntryStepContext | *((_QWORD *)v4 + 11))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext isEqual:](localDeviceManualEntryStepContext, "isEqual:"))goto LABEL_56;
  }
  localDeviceManualEntryProgressStepContext = self->_localDeviceManualEntryProgressStepContext;
  if ((unint64_t)localDeviceManualEntryProgressStepContext | *((_QWORD *)v4 + 10))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryProgressStepContext isEqual:](localDeviceManualEntryProgressStepContext, "isEqual:"))goto LABEL_56;
  }
  productDisambiguationStepContext = self->_productDisambiguationStepContext;
  if ((unint64_t)productDisambiguationStepContext | *((_QWORD *)v4 + 15))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowProductDisambiguationStepContext isEqual:](productDisambiguationStepContext, "isEqual:"))goto LABEL_56;
  }
  passcodeUpgradeStepContext = self->_passcodeUpgradeStepContext;
  if ((unint64_t)passcodeUpgradeStepContext | *((_QWORD *)v4 + 14))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowPasscodeUpgradeStepContext isEqual:](passcodeUpgradeStepContext, "isEqual:"))goto LABEL_56;
  }
  termsAndConditionsStepContext = self->_termsAndConditionsStepContext;
  if ((unint64_t)termsAndConditionsStepContext | *((_QWORD *)v4 + 22))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext isEqual:](termsAndConditionsStepContext, "isEqual:"))goto LABEL_56;
  }
  provisioningProgressStepContext = self->_provisioningProgressStepContext;
  if ((unint64_t)provisioningProgressStepContext | *((_QWORD *)v4 + 16))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext isEqual:](provisioningProgressStepContext, "isEqual:"))goto LABEL_56;
  }
  provisioningResultStepContext = self->_provisioningResultStepContext;
  if ((unint64_t)provisioningResultStepContext | *((_QWORD *)v4 + 17))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext isEqual:](provisioningResultStepContext, "isEqual:"))goto LABEL_56;
  }
  issuerVerificationChannelsStepContext = self->_issuerVerificationChannelsStepContext;
  if ((unint64_t)issuerVerificationChannelsStepContext | *((_QWORD *)v4 + 7))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext isEqual:](issuerVerificationChannelsStepContext, "isEqual:"))goto LABEL_56;
  }
  issuerVerificationFieldsStepContext = self->_issuerVerificationFieldsStepContext;
  if ((unint64_t)issuerVerificationFieldsStepContext | *((_QWORD *)v4 + 9))
  {
    if (!-[NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationFieldsStepContext isEqual:](issuerVerificationFieldsStepContext, "isEqual:"))goto LABEL_56;
  }
  issuerVerificationCodeStepContext = self->_issuerVerificationCodeStepContext;
  if ((unint64_t)issuerVerificationCodeStepContext | *((_QWORD *)v4 + 8))
    v28 = -[NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationCodeStepContext isEqual:](issuerVerificationCodeStepContext, "isEqual:");
  else
    v28 = 1;
LABEL_57:

  return v28;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;

  v3 = -[NSString hash](self->_stepIdentifier, "hash");
  v4 = -[NSString hash](self->_backStepIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_allowsAddLater;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[NPKProtoStandalonePaymentProvisioningFlowWelcomeStepContext hash](self->_welcomeStepContext, "hash");
  v7 = -[NPKProtoStandalonePaymentProvisioningFlowChooseFlowStepContext hash](self->_chooseFlowStepContext, "hash");
  v8 = v7 ^ -[NPKProtoStandalonePaymentProvisioningFlowChooseProductStepContext hash](self->_chooseProductStepContext, "hash");
  v9 = v6 ^ v8 ^ -[NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext hash](self->_chooseCredentialsStepContext, "hash");
  v10 = -[NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext hash](self->_digitalIssuanceAmountStepContext, "hash");
  v11 = v10 ^ -[NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext hash](self->_digitalIssuancePaymentStepContext, "hash");
  v12 = v11 ^ -[NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext hash](self->_moreInformationStepContext, "hash");
  v13 = v9 ^ v12 ^ -[NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext hash](self->_readerModeEntryStepContext, "hash");
  v14 = -[NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext hash](self->_readerModeIngestionStepContext, "hash");
  v15 = v14 ^ -[NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext hash](self->_manualEntryStepContext, "hash");
  v16 = v15 ^ -[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext hash](self->_secondaryManualEntryStepContext, "hash");
  v17 = v16 ^ -[NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext hash](self->_localDeviceManualEntryStepContext, "hash");
  v18 = v13 ^ v17 ^ -[NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryProgressStepContext hash](self->_localDeviceManualEntryProgressStepContext, "hash");
  v19 = -[NPKProtoStandalonePaymentProvisioningFlowProductDisambiguationStepContext hash](self->_productDisambiguationStepContext, "hash");
  v20 = v19 ^ -[NPKProtoStandalonePaymentProvisioningFlowPasscodeUpgradeStepContext hash](self->_passcodeUpgradeStepContext, "hash");
  v21 = v20 ^ -[NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext hash](self->_termsAndConditionsStepContext, "hash");
  v22 = v21 ^ -[NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext hash](self->_provisioningProgressStepContext, "hash");
  v23 = v22 ^ -[NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext hash](self->_provisioningResultStepContext, "hash");
  v24 = v18 ^ v23 ^ -[NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext hash](self->_issuerVerificationChannelsStepContext, "hash");
  v25 = -[NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationFieldsStepContext hash](self->_issuerVerificationFieldsStepContext, "hash");
  return v24 ^ v25 ^ -[NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationCodeStepContext hash](self->_issuerVerificationCodeStepContext, "hash");
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  NPKProtoStandalonePaymentProvisioningFlowWelcomeStepContext *welcomeStepContext;
  uint64_t v6;
  NPKProtoStandalonePaymentProvisioningFlowChooseFlowStepContext *chooseFlowStepContext;
  uint64_t v8;
  NPKProtoStandalonePaymentProvisioningFlowChooseProductStepContext *chooseProductStepContext;
  uint64_t v10;
  NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext *chooseCredentialsStepContext;
  uint64_t v12;
  NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext *digitalIssuanceAmountStepContext;
  uint64_t v14;
  NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext *digitalIssuancePaymentStepContext;
  uint64_t v16;
  NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext *moreInformationStepContext;
  uint64_t v18;
  NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext *readerModeEntryStepContext;
  uint64_t v20;
  NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext *readerModeIngestionStepContext;
  uint64_t v22;
  NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext *manualEntryStepContext;
  uint64_t v24;
  NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext *secondaryManualEntryStepContext;
  uint64_t v26;
  NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext *localDeviceManualEntryStepContext;
  uint64_t v28;
  NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryProgressStepContext *localDeviceManualEntryProgressStepContext;
  uint64_t v30;
  NPKProtoStandalonePaymentProvisioningFlowProductDisambiguationStepContext *productDisambiguationStepContext;
  uint64_t v32;
  NPKProtoStandalonePaymentProvisioningFlowPasscodeUpgradeStepContext *passcodeUpgradeStepContext;
  uint64_t v34;
  NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext *termsAndConditionsStepContext;
  uint64_t v36;
  NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext *provisioningProgressStepContext;
  uint64_t v38;
  NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext *provisioningResultStepContext;
  uint64_t v40;
  NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext *issuerVerificationChannelsStepContext;
  uint64_t v42;
  NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationFieldsStepContext *issuerVerificationFieldsStepContext;
  uint64_t v44;
  NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationCodeStepContext *issuerVerificationCodeStepContext;
  uint64_t v46;
  BOOL *v47;

  v4 = (BOOL *)a3;
  v47 = v4;
  if (*((_QWORD *)v4 + 21))
  {
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setStepIdentifier:](self, "setStepIdentifier:");
    v4 = v47;
  }
  if (*((_QWORD *)v4 + 1))
  {
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setBackStepIdentifier:](self, "setBackStepIdentifier:");
    v4 = v47;
  }
  if (v4[196])
  {
    self->_allowsAddLater = v4[192];
    *(_BYTE *)&self->_has |= 1u;
  }
  welcomeStepContext = self->_welcomeStepContext;
  v6 = *((_QWORD *)v4 + 23);
  if (welcomeStepContext)
  {
    if (!v6)
      goto LABEL_13;
    -[NPKProtoStandalonePaymentProvisioningFlowWelcomeStepContext mergeFrom:](welcomeStepContext, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_13;
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setWelcomeStepContext:](self, "setWelcomeStepContext:");
  }
  v4 = v47;
LABEL_13:
  chooseFlowStepContext = self->_chooseFlowStepContext;
  v8 = *((_QWORD *)v4 + 3);
  if (chooseFlowStepContext)
  {
    if (!v8)
      goto LABEL_19;
    -[NPKProtoStandalonePaymentProvisioningFlowChooseFlowStepContext mergeFrom:](chooseFlowStepContext, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_19;
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setChooseFlowStepContext:](self, "setChooseFlowStepContext:");
  }
  v4 = v47;
LABEL_19:
  chooseProductStepContext = self->_chooseProductStepContext;
  v10 = *((_QWORD *)v4 + 4);
  if (chooseProductStepContext)
  {
    if (!v10)
      goto LABEL_25;
    -[NPKProtoStandalonePaymentProvisioningFlowChooseProductStepContext mergeFrom:](chooseProductStepContext, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_25;
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setChooseProductStepContext:](self, "setChooseProductStepContext:");
  }
  v4 = v47;
LABEL_25:
  chooseCredentialsStepContext = self->_chooseCredentialsStepContext;
  v12 = *((_QWORD *)v4 + 2);
  if (chooseCredentialsStepContext)
  {
    if (!v12)
      goto LABEL_31;
    -[NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext mergeFrom:](chooseCredentialsStepContext, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_31;
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setChooseCredentialsStepContext:](self, "setChooseCredentialsStepContext:");
  }
  v4 = v47;
LABEL_31:
  digitalIssuanceAmountStepContext = self->_digitalIssuanceAmountStepContext;
  v14 = *((_QWORD *)v4 + 5);
  if (digitalIssuanceAmountStepContext)
  {
    if (!v14)
      goto LABEL_37;
    -[NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext mergeFrom:](digitalIssuanceAmountStepContext, "mergeFrom:");
  }
  else
  {
    if (!v14)
      goto LABEL_37;
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setDigitalIssuanceAmountStepContext:](self, "setDigitalIssuanceAmountStepContext:");
  }
  v4 = v47;
LABEL_37:
  digitalIssuancePaymentStepContext = self->_digitalIssuancePaymentStepContext;
  v16 = *((_QWORD *)v4 + 6);
  if (digitalIssuancePaymentStepContext)
  {
    if (!v16)
      goto LABEL_43;
    -[NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext mergeFrom:](digitalIssuancePaymentStepContext, "mergeFrom:");
  }
  else
  {
    if (!v16)
      goto LABEL_43;
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setDigitalIssuancePaymentStepContext:](self, "setDigitalIssuancePaymentStepContext:");
  }
  v4 = v47;
LABEL_43:
  moreInformationStepContext = self->_moreInformationStepContext;
  v18 = *((_QWORD *)v4 + 13);
  if (moreInformationStepContext)
  {
    if (!v18)
      goto LABEL_49;
    -[NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext mergeFrom:](moreInformationStepContext, "mergeFrom:");
  }
  else
  {
    if (!v18)
      goto LABEL_49;
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setMoreInformationStepContext:](self, "setMoreInformationStepContext:");
  }
  v4 = v47;
LABEL_49:
  readerModeEntryStepContext = self->_readerModeEntryStepContext;
  v20 = *((_QWORD *)v4 + 18);
  if (readerModeEntryStepContext)
  {
    if (!v20)
      goto LABEL_55;
    -[NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext mergeFrom:](readerModeEntryStepContext, "mergeFrom:");
  }
  else
  {
    if (!v20)
      goto LABEL_55;
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setReaderModeEntryStepContext:](self, "setReaderModeEntryStepContext:");
  }
  v4 = v47;
LABEL_55:
  readerModeIngestionStepContext = self->_readerModeIngestionStepContext;
  v22 = *((_QWORD *)v4 + 19);
  if (readerModeIngestionStepContext)
  {
    if (!v22)
      goto LABEL_61;
    -[NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext mergeFrom:](readerModeIngestionStepContext, "mergeFrom:");
  }
  else
  {
    if (!v22)
      goto LABEL_61;
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setReaderModeIngestionStepContext:](self, "setReaderModeIngestionStepContext:");
  }
  v4 = v47;
LABEL_61:
  manualEntryStepContext = self->_manualEntryStepContext;
  v24 = *((_QWORD *)v4 + 12);
  if (manualEntryStepContext)
  {
    if (!v24)
      goto LABEL_67;
    -[NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext mergeFrom:](manualEntryStepContext, "mergeFrom:");
  }
  else
  {
    if (!v24)
      goto LABEL_67;
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setManualEntryStepContext:](self, "setManualEntryStepContext:");
  }
  v4 = v47;
LABEL_67:
  secondaryManualEntryStepContext = self->_secondaryManualEntryStepContext;
  v26 = *((_QWORD *)v4 + 20);
  if (secondaryManualEntryStepContext)
  {
    if (!v26)
      goto LABEL_73;
    -[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext mergeFrom:](secondaryManualEntryStepContext, "mergeFrom:");
  }
  else
  {
    if (!v26)
      goto LABEL_73;
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setSecondaryManualEntryStepContext:](self, "setSecondaryManualEntryStepContext:");
  }
  v4 = v47;
LABEL_73:
  localDeviceManualEntryStepContext = self->_localDeviceManualEntryStepContext;
  v28 = *((_QWORD *)v4 + 11);
  if (localDeviceManualEntryStepContext)
  {
    if (!v28)
      goto LABEL_79;
    -[NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext mergeFrom:](localDeviceManualEntryStepContext, "mergeFrom:");
  }
  else
  {
    if (!v28)
      goto LABEL_79;
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setLocalDeviceManualEntryStepContext:](self, "setLocalDeviceManualEntryStepContext:");
  }
  v4 = v47;
LABEL_79:
  localDeviceManualEntryProgressStepContext = self->_localDeviceManualEntryProgressStepContext;
  v30 = *((_QWORD *)v4 + 10);
  if (localDeviceManualEntryProgressStepContext)
  {
    if (!v30)
      goto LABEL_85;
    -[NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryProgressStepContext mergeFrom:](localDeviceManualEntryProgressStepContext, "mergeFrom:");
  }
  else
  {
    if (!v30)
      goto LABEL_85;
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setLocalDeviceManualEntryProgressStepContext:](self, "setLocalDeviceManualEntryProgressStepContext:");
  }
  v4 = v47;
LABEL_85:
  productDisambiguationStepContext = self->_productDisambiguationStepContext;
  v32 = *((_QWORD *)v4 + 15);
  if (productDisambiguationStepContext)
  {
    if (!v32)
      goto LABEL_91;
    -[NPKProtoStandalonePaymentProvisioningFlowProductDisambiguationStepContext mergeFrom:](productDisambiguationStepContext, "mergeFrom:");
  }
  else
  {
    if (!v32)
      goto LABEL_91;
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setProductDisambiguationStepContext:](self, "setProductDisambiguationStepContext:");
  }
  v4 = v47;
LABEL_91:
  passcodeUpgradeStepContext = self->_passcodeUpgradeStepContext;
  v34 = *((_QWORD *)v4 + 14);
  if (passcodeUpgradeStepContext)
  {
    if (!v34)
      goto LABEL_97;
    -[NPKProtoStandalonePaymentProvisioningFlowPasscodeUpgradeStepContext mergeFrom:](passcodeUpgradeStepContext, "mergeFrom:");
  }
  else
  {
    if (!v34)
      goto LABEL_97;
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setPasscodeUpgradeStepContext:](self, "setPasscodeUpgradeStepContext:");
  }
  v4 = v47;
LABEL_97:
  termsAndConditionsStepContext = self->_termsAndConditionsStepContext;
  v36 = *((_QWORD *)v4 + 22);
  if (termsAndConditionsStepContext)
  {
    if (!v36)
      goto LABEL_103;
    -[NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext mergeFrom:](termsAndConditionsStepContext, "mergeFrom:");
  }
  else
  {
    if (!v36)
      goto LABEL_103;
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setTermsAndConditionsStepContext:](self, "setTermsAndConditionsStepContext:");
  }
  v4 = v47;
LABEL_103:
  provisioningProgressStepContext = self->_provisioningProgressStepContext;
  v38 = *((_QWORD *)v4 + 16);
  if (provisioningProgressStepContext)
  {
    if (!v38)
      goto LABEL_109;
    -[NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext mergeFrom:](provisioningProgressStepContext, "mergeFrom:");
  }
  else
  {
    if (!v38)
      goto LABEL_109;
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setProvisioningProgressStepContext:](self, "setProvisioningProgressStepContext:");
  }
  v4 = v47;
LABEL_109:
  provisioningResultStepContext = self->_provisioningResultStepContext;
  v40 = *((_QWORD *)v4 + 17);
  if (provisioningResultStepContext)
  {
    if (!v40)
      goto LABEL_115;
    -[NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext mergeFrom:](provisioningResultStepContext, "mergeFrom:");
  }
  else
  {
    if (!v40)
      goto LABEL_115;
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setProvisioningResultStepContext:](self, "setProvisioningResultStepContext:");
  }
  v4 = v47;
LABEL_115:
  issuerVerificationChannelsStepContext = self->_issuerVerificationChannelsStepContext;
  v42 = *((_QWORD *)v4 + 7);
  if (issuerVerificationChannelsStepContext)
  {
    if (!v42)
      goto LABEL_121;
    -[NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext mergeFrom:](issuerVerificationChannelsStepContext, "mergeFrom:");
  }
  else
  {
    if (!v42)
      goto LABEL_121;
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setIssuerVerificationChannelsStepContext:](self, "setIssuerVerificationChannelsStepContext:");
  }
  v4 = v47;
LABEL_121:
  issuerVerificationFieldsStepContext = self->_issuerVerificationFieldsStepContext;
  v44 = *((_QWORD *)v4 + 9);
  if (issuerVerificationFieldsStepContext)
  {
    if (!v44)
      goto LABEL_127;
    -[NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationFieldsStepContext mergeFrom:](issuerVerificationFieldsStepContext, "mergeFrom:");
  }
  else
  {
    if (!v44)
      goto LABEL_127;
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setIssuerVerificationFieldsStepContext:](self, "setIssuerVerificationFieldsStepContext:");
  }
  v4 = v47;
LABEL_127:
  issuerVerificationCodeStepContext = self->_issuerVerificationCodeStepContext;
  v46 = *((_QWORD *)v4 + 8);
  if (issuerVerificationCodeStepContext)
  {
    if (v46)
    {
      -[NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationCodeStepContext mergeFrom:](issuerVerificationCodeStepContext, "mergeFrom:");
LABEL_132:
      v4 = v47;
    }
  }
  else if (v46)
  {
    -[NPKProtoStandalonePaymentProvisioningFlowStepContext setIssuerVerificationCodeStepContext:](self, "setIssuerVerificationCodeStepContext:");
    goto LABEL_132;
  }

}

- (NSString)stepIdentifier
{
  return self->_stepIdentifier;
}

- (void)setStepIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_stepIdentifier, a3);
}

- (NSString)backStepIdentifier
{
  return self->_backStepIdentifier;
}

- (void)setBackStepIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_backStepIdentifier, a3);
}

- (BOOL)allowsAddLater
{
  return self->_allowsAddLater;
}

- (NPKProtoStandalonePaymentProvisioningFlowWelcomeStepContext)welcomeStepContext
{
  return self->_welcomeStepContext;
}

- (void)setWelcomeStepContext:(id)a3
{
  objc_storeStrong((id *)&self->_welcomeStepContext, a3);
}

- (NPKProtoStandalonePaymentProvisioningFlowChooseFlowStepContext)chooseFlowStepContext
{
  return self->_chooseFlowStepContext;
}

- (void)setChooseFlowStepContext:(id)a3
{
  objc_storeStrong((id *)&self->_chooseFlowStepContext, a3);
}

- (NPKProtoStandalonePaymentProvisioningFlowChooseProductStepContext)chooseProductStepContext
{
  return self->_chooseProductStepContext;
}

- (void)setChooseProductStepContext:(id)a3
{
  objc_storeStrong((id *)&self->_chooseProductStepContext, a3);
}

- (NPKProtoStandalonePaymentProvisioningFlowChooseCredentialsStepContext)chooseCredentialsStepContext
{
  return self->_chooseCredentialsStepContext;
}

- (void)setChooseCredentialsStepContext:(id)a3
{
  objc_storeStrong((id *)&self->_chooseCredentialsStepContext, a3);
}

- (NPKProtoStandalonePaymentProvisioningFlowDigitalIssuanceAmountStepContext)digitalIssuanceAmountStepContext
{
  return self->_digitalIssuanceAmountStepContext;
}

- (void)setDigitalIssuanceAmountStepContext:(id)a3
{
  objc_storeStrong((id *)&self->_digitalIssuanceAmountStepContext, a3);
}

- (NPKProtoStandalonePaymentProvisioningFlowDigitalIssuancePaymentStepContext)digitalIssuancePaymentStepContext
{
  return self->_digitalIssuancePaymentStepContext;
}

- (void)setDigitalIssuancePaymentStepContext:(id)a3
{
  objc_storeStrong((id *)&self->_digitalIssuancePaymentStepContext, a3);
}

- (NPKProtoStandalonePaymentProvisioningFlowMoreInformationStepContext)moreInformationStepContext
{
  return self->_moreInformationStepContext;
}

- (void)setMoreInformationStepContext:(id)a3
{
  objc_storeStrong((id *)&self->_moreInformationStepContext, a3);
}

- (NPKProtoStandalonePaymentProvisioningFlowReaderModeEntryStepContext)readerModeEntryStepContext
{
  return self->_readerModeEntryStepContext;
}

- (void)setReaderModeEntryStepContext:(id)a3
{
  objc_storeStrong((id *)&self->_readerModeEntryStepContext, a3);
}

- (NPKProtoStandalonePaymentProvisioningFlowReaderModeIngestionStepContext)readerModeIngestionStepContext
{
  return self->_readerModeIngestionStepContext;
}

- (void)setReaderModeIngestionStepContext:(id)a3
{
  objc_storeStrong((id *)&self->_readerModeIngestionStepContext, a3);
}

- (NPKProtoStandalonePaymentProvisioningFlowManualEntryStepContext)manualEntryStepContext
{
  return self->_manualEntryStepContext;
}

- (void)setManualEntryStepContext:(id)a3
{
  objc_storeStrong((id *)&self->_manualEntryStepContext, a3);
}

- (NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext)secondaryManualEntryStepContext
{
  return self->_secondaryManualEntryStepContext;
}

- (void)setSecondaryManualEntryStepContext:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryManualEntryStepContext, a3);
}

- (NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext)localDeviceManualEntryStepContext
{
  return self->_localDeviceManualEntryStepContext;
}

- (void)setLocalDeviceManualEntryStepContext:(id)a3
{
  objc_storeStrong((id *)&self->_localDeviceManualEntryStepContext, a3);
}

- (NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryProgressStepContext)localDeviceManualEntryProgressStepContext
{
  return self->_localDeviceManualEntryProgressStepContext;
}

- (void)setLocalDeviceManualEntryProgressStepContext:(id)a3
{
  objc_storeStrong((id *)&self->_localDeviceManualEntryProgressStepContext, a3);
}

- (NPKProtoStandalonePaymentProvisioningFlowProductDisambiguationStepContext)productDisambiguationStepContext
{
  return self->_productDisambiguationStepContext;
}

- (void)setProductDisambiguationStepContext:(id)a3
{
  objc_storeStrong((id *)&self->_productDisambiguationStepContext, a3);
}

- (NPKProtoStandalonePaymentProvisioningFlowPasscodeUpgradeStepContext)passcodeUpgradeStepContext
{
  return self->_passcodeUpgradeStepContext;
}

- (void)setPasscodeUpgradeStepContext:(id)a3
{
  objc_storeStrong((id *)&self->_passcodeUpgradeStepContext, a3);
}

- (NPKProtoStandalonePaymentProvisioningFlowTermsAndConditionsStepContext)termsAndConditionsStepContext
{
  return self->_termsAndConditionsStepContext;
}

- (void)setTermsAndConditionsStepContext:(id)a3
{
  objc_storeStrong((id *)&self->_termsAndConditionsStepContext, a3);
}

- (NPKProtoStandalonePaymentProvisioningFlowProvisioningProgressStepContext)provisioningProgressStepContext
{
  return self->_provisioningProgressStepContext;
}

- (void)setProvisioningProgressStepContext:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningProgressStepContext, a3);
}

- (NPKProtoStandalonePaymentProvisioningFlowProvisioningResultStepContext)provisioningResultStepContext
{
  return self->_provisioningResultStepContext;
}

- (void)setProvisioningResultStepContext:(id)a3
{
  objc_storeStrong((id *)&self->_provisioningResultStepContext, a3);
}

- (NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationChannelsStepContext)issuerVerificationChannelsStepContext
{
  return self->_issuerVerificationChannelsStepContext;
}

- (void)setIssuerVerificationChannelsStepContext:(id)a3
{
  objc_storeStrong((id *)&self->_issuerVerificationChannelsStepContext, a3);
}

- (NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationFieldsStepContext)issuerVerificationFieldsStepContext
{
  return self->_issuerVerificationFieldsStepContext;
}

- (void)setIssuerVerificationFieldsStepContext:(id)a3
{
  objc_storeStrong((id *)&self->_issuerVerificationFieldsStepContext, a3);
}

- (NPKProtoStandalonePaymentProvisioningFlowIssuerVerificationCodeStepContext)issuerVerificationCodeStepContext
{
  return self->_issuerVerificationCodeStepContext;
}

- (void)setIssuerVerificationCodeStepContext:(id)a3
{
  objc_storeStrong((id *)&self->_issuerVerificationCodeStepContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_welcomeStepContext, 0);
  objc_storeStrong((id *)&self->_termsAndConditionsStepContext, 0);
  objc_storeStrong((id *)&self->_stepIdentifier, 0);
  objc_storeStrong((id *)&self->_secondaryManualEntryStepContext, 0);
  objc_storeStrong((id *)&self->_readerModeIngestionStepContext, 0);
  objc_storeStrong((id *)&self->_readerModeEntryStepContext, 0);
  objc_storeStrong((id *)&self->_provisioningResultStepContext, 0);
  objc_storeStrong((id *)&self->_provisioningProgressStepContext, 0);
  objc_storeStrong((id *)&self->_productDisambiguationStepContext, 0);
  objc_storeStrong((id *)&self->_passcodeUpgradeStepContext, 0);
  objc_storeStrong((id *)&self->_moreInformationStepContext, 0);
  objc_storeStrong((id *)&self->_manualEntryStepContext, 0);
  objc_storeStrong((id *)&self->_localDeviceManualEntryStepContext, 0);
  objc_storeStrong((id *)&self->_localDeviceManualEntryProgressStepContext, 0);
  objc_storeStrong((id *)&self->_issuerVerificationFieldsStepContext, 0);
  objc_storeStrong((id *)&self->_issuerVerificationCodeStepContext, 0);
  objc_storeStrong((id *)&self->_issuerVerificationChannelsStepContext, 0);
  objc_storeStrong((id *)&self->_digitalIssuancePaymentStepContext, 0);
  objc_storeStrong((id *)&self->_digitalIssuanceAmountStepContext, 0);
  objc_storeStrong((id *)&self->_chooseProductStepContext, 0);
  objc_storeStrong((id *)&self->_chooseFlowStepContext, 0);
  objc_storeStrong((id *)&self->_chooseCredentialsStepContext, 0);
  objc_storeStrong((id *)&self->_backStepIdentifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentProvisioningFlowStepContext writeTo:]", "NPKProtoStandalonePaymentProvisioningFlowStepContext.m", 700, "nil != self->_stepIdentifier");
}

@end
