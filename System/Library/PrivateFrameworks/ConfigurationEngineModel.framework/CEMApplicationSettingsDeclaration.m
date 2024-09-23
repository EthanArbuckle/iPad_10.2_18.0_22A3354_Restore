@implementation CEMApplicationSettingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.application.settings");
}

+ (id)profileType
{
  return &stru_24C63AAC0;
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[10];

  v6[9] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("DiagnosticSubmission");
  v6[1] = CFSTR("AppAnalytics");
  v6[2] = CFSTR("allowDiagnosticSubmission");
  v6[3] = CFSTR("autonomousSingleAppModePermittedAppIDs");
  v6[4] = CFSTR("allowActivityContinuation");
  v6[5] = CFSTR("allowEnterpriseAppTrust");
  v6[6] = CFSTR("allowDiagnosticSubmissionModification");
  v6[7] = CFSTR("allowAutomaticAppUpdates");
  v6[8] = CFSTR("allowAutomaticAppUpdatesModification");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[8];

  v6[7] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("allowDiagnosticSubmission");
  v6[1] = CFSTR("autonomousSingleAppModePermittedAppIDs");
  v6[2] = CFSTR("allowActivityContinuation");
  v6[3] = CFSTR("allowEnterpriseAppTrust");
  v6[4] = CFSTR("allowDiagnosticSubmissionModification");
  v6[5] = CFSTR("allowAutomaticAppUpdates");
  v6[6] = CFSTR("allowAutomaticAppUpdatesModification");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)multipleAllowed
{
  return 0;
}

- (BOOL)mustBeSupervised
{
  return 1;
}

- (int)activationLevel
{
  return 2;
}

- (id)assetReferences
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)buildWithIdentifier:(id)a3 withDiagnosticSubmission:(id)a4 withAppAnalytics:(id)a5 withAllowDiagnosticSubmission:(id)a6 withAutonomousSingleAppModePermittedAppIDs:(id)a7 withAllowActivityContinuation:(id)a8 withAllowEnterpriseAppTrust:(id)a9 withAllowDiagnosticSubmissionModification:(id)a10 withAllowAutomaticAppUpdates:(id)a11 withAllowAutomaticAppUpdatesModification:(id)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v39;
  id v40;

  v16 = a3;
  v40 = a12;
  v39 = a11;
  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = a4;
  v24 = (void *)objc_opt_new();
  objc_msgSend(v24, "setDeclarationType:", CFSTR("com.apple.configuration.application.settings"));
  if (v16)
  {
    objc_msgSend(v24, "setDeclarationIdentifier:", v16);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "UUIDString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setDeclarationIdentifier:", v26);

    v16 = 0;
  }
  v27 = (void *)MEMORY[0x24BDBD1C0];
  if (v23)
    v28 = v23;
  else
    v28 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v24, "setPayloadDiagnosticSubmission:", v28);

  if (v22)
    v29 = v22;
  else
    v29 = v27;
  objc_msgSend(v24, "setPayloadAppAnalytics:", v29);

  v30 = (void *)MEMORY[0x24BDBD1C8];
  if (v21)
    v31 = v21;
  else
    v31 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v24, "setPayloadAllowDiagnosticSubmission:", v31);

  objc_msgSend(v24, "setPayloadAutonomousSingleAppModePermittedAppIDs:", v20);
  if (v19)
    v32 = v19;
  else
    v32 = v30;
  objc_msgSend(v24, "setPayloadAllowActivityContinuation:", v32);

  if (v18)
    v33 = v18;
  else
    v33 = v30;
  objc_msgSend(v24, "setPayloadAllowEnterpriseAppTrust:", v33);

  if (v17)
    v34 = v17;
  else
    v34 = v30;
  objc_msgSend(v24, "setPayloadAllowDiagnosticSubmissionModification:", v34);

  if (v39)
    v35 = v39;
  else
    v35 = v30;
  objc_msgSend(v24, "setPayloadAllowAutomaticAppUpdates:", v35);

  if (v40)
    v36 = v40;
  else
    v36 = v30;
  objc_msgSend(v24, "setPayloadAllowAutomaticAppUpdatesModification:", v36);

  objc_msgSend(v24, "updateServerHash");
  return v24;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.application.settings"));
  if (v3)
  {
    objc_msgSend(v4, "setDeclarationIdentifier:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeclarationIdentifier:", v6);

  }
  objc_msgSend(v4, "updateServerHash");

  return v4;
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *unknownPayloadKeys;
  NSNumber *v13;
  id v14;
  NSNumber *payloadDiagnosticSubmission;
  NSNumber *v16;
  NSNumber *payloadAppAnalytics;
  NSNumber *v18;
  NSNumber *payloadAllowDiagnosticSubmission;
  NSArray *v20;
  NSArray *payloadAutonomousSingleAppModePermittedAppIDs;
  NSNumber *v22;
  NSNumber *payloadAllowActivityContinuation;
  NSNumber *v24;
  NSNumber *payloadAllowEnterpriseAppTrust;
  NSNumber *v26;
  NSNumber *payloadAllowDiagnosticSubmissionModification;
  NSNumber *v28;
  NSNumber *payloadAllowAutomaticAppUpdates;
  NSNumber *v30;
  NSNumber *payloadAllowAutomaticAppUpdatesModification;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMApplicationSettingsDeclaration allowedPayloadKeys](CEMApplicationSettingsDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v41 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DiagnosticSubmission"), 0, MEMORY[0x24BDBD1C0], &v41);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v41;
  payloadDiagnosticSubmission = self->_payloadDiagnosticSubmission;
  self->_payloadDiagnosticSubmission = v13;

  if (!v14)
  {
    v40 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AppAnalytics"), 0, MEMORY[0x24BDBD1C0], &v40);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v40;
    payloadAppAnalytics = self->_payloadAppAnalytics;
    self->_payloadAppAnalytics = v16;

    if (!v14)
    {
      v39 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowDiagnosticSubmission"), 0, MEMORY[0x24BDBD1C8], &v39);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v39;
      payloadAllowDiagnosticSubmission = self->_payloadAllowDiagnosticSubmission;
      self->_payloadAllowDiagnosticSubmission = v18;

      if (!v14)
      {
        v38 = 0;
        -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("autonomousSingleAppModePermittedAppIDs"), &__block_literal_global_7, 0, 0, &v38);
        v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v14 = v38;
        payloadAutonomousSingleAppModePermittedAppIDs = self->_payloadAutonomousSingleAppModePermittedAppIDs;
        self->_payloadAutonomousSingleAppModePermittedAppIDs = v20;

        if (!v14)
        {
          v37 = 0;
          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowActivityContinuation"), 0, MEMORY[0x24BDBD1C8], &v37);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v37;
          payloadAllowActivityContinuation = self->_payloadAllowActivityContinuation;
          self->_payloadAllowActivityContinuation = v22;

          if (!v14)
          {
            v36 = 0;
            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowEnterpriseAppTrust"), 0, MEMORY[0x24BDBD1C8], &v36);
            v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v14 = v36;
            payloadAllowEnterpriseAppTrust = self->_payloadAllowEnterpriseAppTrust;
            self->_payloadAllowEnterpriseAppTrust = v24;

            if (!v14)
            {
              v35 = 0;
              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowDiagnosticSubmissionModification"), 0, MEMORY[0x24BDBD1C8], &v35);
              v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              v14 = v35;
              payloadAllowDiagnosticSubmissionModification = self->_payloadAllowDiagnosticSubmissionModification;
              self->_payloadAllowDiagnosticSubmissionModification = v26;

              if (!v14)
              {
                v34 = 0;
                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowAutomaticAppUpdates"), 0, MEMORY[0x24BDBD1C8], &v34);
                v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                v14 = v34;
                payloadAllowAutomaticAppUpdates = self->_payloadAllowAutomaticAppUpdates;
                self->_payloadAllowAutomaticAppUpdates = v28;

                if (!v14)
                {
                  v33 = 0;
                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowAutomaticAppUpdatesModification"), 0, MEMORY[0x24BDBD1C8], &v33);
                  v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  v14 = v33;
                  payloadAllowAutomaticAppUpdatesModification = self->_payloadAllowAutomaticAppUpdatesModification;
                  self->_payloadAllowAutomaticAppUpdatesModification = v30;

                }
              }
            }
          }
        }
      }
    }
  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

uint64_t __55__CEMApplicationSettingsDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("DiagnosticSubmission"), self->_payloadDiagnosticSubmission, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("AppAnalytics"), self->_payloadAppAnalytics, 0, v5);
  v6 = MEMORY[0x24BDBD1C8];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowDiagnosticSubmission"), self->_payloadAllowDiagnosticSubmission, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("autonomousSingleAppModePermittedAppIDs"), self->_payloadAutonomousSingleAppModePermittedAppIDs, &__block_literal_global_31, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowActivityContinuation"), self->_payloadAllowActivityContinuation, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowEnterpriseAppTrust"), self->_payloadAllowEnterpriseAppTrust, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowDiagnosticSubmissionModification"), self->_payloadAllowDiagnosticSubmissionModification, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowAutomaticAppUpdates"), self->_payloadAllowAutomaticAppUpdates, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowAutomaticAppUpdatesModification"), self->_payloadAllowAutomaticAppUpdatesModification, 0, v6);
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

id __72__CEMApplicationSettingsDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)CEMApplicationSettingsDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v24, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadDiagnosticSubmission, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadAppAnalytics, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadAllowDiagnosticSubmission, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSArray copy](self->_payloadAutonomousSingleAppModePermittedAppIDs, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSNumber copy](self->_payloadAllowActivityContinuation, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSNumber copy](self->_payloadAllowEnterpriseAppTrust, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  v17 = -[NSNumber copy](self->_payloadAllowDiagnosticSubmissionModification, "copy");
  v18 = (void *)v4[15];
  v4[15] = v17;

  v19 = -[NSNumber copy](self->_payloadAllowAutomaticAppUpdates, "copy");
  v20 = (void *)v4[16];
  v4[16] = v19;

  v21 = -[NSNumber copy](self->_payloadAllowAutomaticAppUpdatesModification, "copy");
  v22 = (void *)v4[17];
  v4[17] = v21;

  return v4;
}

- (NSNumber)payloadDiagnosticSubmission
{
  return self->_payloadDiagnosticSubmission;
}

- (void)setPayloadDiagnosticSubmission:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadAppAnalytics
{
  return self->_payloadAppAnalytics;
}

- (void)setPayloadAppAnalytics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadAllowDiagnosticSubmission
{
  return self->_payloadAllowDiagnosticSubmission;
}

- (void)setPayloadAllowDiagnosticSubmission:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)payloadAutonomousSingleAppModePermittedAppIDs
{
  return self->_payloadAutonomousSingleAppModePermittedAppIDs;
}

- (void)setPayloadAutonomousSingleAppModePermittedAppIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadAllowActivityContinuation
{
  return self->_payloadAllowActivityContinuation;
}

- (void)setPayloadAllowActivityContinuation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)payloadAllowEnterpriseAppTrust
{
  return self->_payloadAllowEnterpriseAppTrust;
}

- (void)setPayloadAllowEnterpriseAppTrust:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)payloadAllowDiagnosticSubmissionModification
{
  return self->_payloadAllowDiagnosticSubmissionModification;
}

- (void)setPayloadAllowDiagnosticSubmissionModification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)payloadAllowAutomaticAppUpdates
{
  return self->_payloadAllowAutomaticAppUpdates;
}

- (void)setPayloadAllowAutomaticAppUpdates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)payloadAllowAutomaticAppUpdatesModification
{
  return self->_payloadAllowAutomaticAppUpdatesModification;
}

- (void)setPayloadAllowAutomaticAppUpdatesModification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowAutomaticAppUpdatesModification, 0);
  objc_storeStrong((id *)&self->_payloadAllowAutomaticAppUpdates, 0);
  objc_storeStrong((id *)&self->_payloadAllowDiagnosticSubmissionModification, 0);
  objc_storeStrong((id *)&self->_payloadAllowEnterpriseAppTrust, 0);
  objc_storeStrong((id *)&self->_payloadAllowActivityContinuation, 0);
  objc_storeStrong((id *)&self->_payloadAutonomousSingleAppModePermittedAppIDs, 0);
  objc_storeStrong((id *)&self->_payloadAllowDiagnosticSubmission, 0);
  objc_storeStrong((id *)&self->_payloadAppAnalytics, 0);
  objc_storeStrong((id *)&self->_payloadDiagnosticSubmission, 0);
}

@end
