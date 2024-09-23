@implementation CEMPasscodeSettingsDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.passcode.settings");
}

+ (id)profileType
{
  return CFSTR("com.apple.mobiledevice.passwordpolicy");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[18];

  v6[17] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("allowSimple");
  v6[1] = CFSTR("forcePIN");
  v6[2] = CFSTR("maxFailedAttempts");
  v6[3] = CFSTR("maxInactivity");
  v6[4] = CFSTR("maxPINAgeInDays");
  v6[5] = CFSTR("minComplexChars");
  v6[6] = CFSTR("minLength");
  v6[7] = CFSTR("requireAlphanumeric");
  v6[8] = CFSTR("pinHistory");
  v6[9] = CFSTR("maxGracePeriod");
  v6[10] = CFSTR("minutesUntilFailedLoginReset");
  v6[11] = CFSTR("changeAtNextAuth");
  v6[12] = CFSTR("manualFetchingWhenRoaming");
  v6[13] = CFSTR("allowFingerprintForUnlock");
  v6[14] = CFSTR("allowFingerprintModification");
  v6[15] = CFSTR("allowPasscodeModification");
  v6[16] = CFSTR("allowAutoUnlock");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 17);
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
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("allowFingerprintForUnlock");
  v6[1] = CFSTR("allowFingerprintModification");
  v6[2] = CFSTR("allowPasscodeModification");
  v6[3] = CFSTR("allowAutoUnlock");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
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
  return 0;
}

- (int)activationLevel
{
  return 0;
}

- (id)assetReferences
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)buildWithIdentifier:(id)a3 withAllowSimple:(id)a4 withForcePIN:(id)a5 withMaxFailedAttempts:(id)a6 withMaxInactivity:(id)a7 withMaxPINAgeInDays:(id)a8 withMinComplexChars:(id)a9 withMinLength:(id)a10 withRequireAlphanumeric:(id)a11 withPinHistory:(id)a12 withMaxGracePeriod:(id)a13 withMinutesUntilFailedLoginReset:(id)a14 withChangeAtNextAuth:(id)a15 withManualFetchingWhenRoaming:(id)a16 withAllowFingerprintForUnlock:(id)a17 withAllowFingerprintModification:(id)a18 withAllowPasscodeModification:(id)a19 withAllowAutoUnlock:(id)a20
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;

  v20 = a3;
  v61 = a20;
  v60 = a19;
  v59 = a18;
  v58 = a17;
  v57 = a16;
  v56 = a15;
  v55 = a14;
  v54 = a13;
  v53 = a12;
  v52 = a11;
  v21 = a10;
  v22 = a9;
  v23 = a8;
  v24 = a7;
  v25 = a6;
  v26 = a5;
  v27 = a4;
  v28 = (void *)objc_opt_new();
  objc_msgSend(v28, "setDeclarationType:", CFSTR("com.apple.configuration.passcode.settings"));
  if (v20)
  {
    objc_msgSend(v28, "setDeclarationIdentifier:", v20);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "UUIDString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setDeclarationIdentifier:", v30);

    v20 = 0;
  }
  v31 = (void *)MEMORY[0x24BDBD1C8];
  if (v27)
    v32 = v27;
  else
    v32 = (id)MEMORY[0x24BDBD1C8];
  objc_msgSend(v28, "setPayloadAllowSimple:", v32);

  if (v26)
    v33 = v26;
  else
    v33 = v31;
  objc_msgSend(v28, "setPayloadForcePIN:", v33);

  if (v25)
    v34 = v25;
  else
    v34 = &unk_24C69CE00;
  objc_msgSend(v28, "setPayloadMaxFailedAttempts:", v34);

  objc_msgSend(v28, "setPayloadMaxInactivity:", v24);
  objc_msgSend(v28, "setPayloadMaxPINAgeInDays:", v23);

  if (v22)
    v35 = v22;
  else
    v35 = &unk_24C69CE18;
  objc_msgSend(v28, "setPayloadMinComplexChars:", v35);

  if (v21)
    v36 = v21;
  else
    v36 = &unk_24C69CE18;
  objc_msgSend(v28, "setPayloadMinLength:", v36);

  v37 = (void *)MEMORY[0x24BDBD1C0];
  if (v52)
    v38 = v52;
  else
    v38 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v28, "setPayloadRequireAlphanumeric:", v38);

  objc_msgSend(v28, "setPayloadPinHistory:", v53);
  if (v54)
    v39 = v54;
  else
    v39 = &unk_24C69CE18;
  objc_msgSend(v28, "setPayloadMaxGracePeriod:", v39);

  objc_msgSend(v28, "setPayloadMinutesUntilFailedLoginReset:", v55);
  if (v56)
    v40 = v56;
  else
    v40 = v37;
  objc_msgSend(v28, "setPayloadChangeAtNextAuth:", v40);

  if (v57)
    v41 = v57;
  else
    v41 = v37;
  objc_msgSend(v28, "setPayloadManualFetchingWhenRoaming:", v41);

  if (v58)
    v42 = v58;
  else
    v42 = v31;
  objc_msgSend(v28, "setPayloadAllowFingerprintForUnlock:", v42);

  if (v59)
    v43 = v59;
  else
    v43 = v31;
  objc_msgSend(v28, "setPayloadAllowFingerprintModification:", v43);

  if (v60)
    v44 = v60;
  else
    v44 = v31;
  objc_msgSend(v28, "setPayloadAllowPasscodeModification:", v44);

  if (v61)
    v45 = v61;
  else
    v45 = v31;
  objc_msgSend(v28, "setPayloadAllowAutoUnlock:", v45);

  objc_msgSend(v28, "updateServerHash");
  return v28;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.passcode.settings"));
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
  NSNumber *payloadAllowSimple;
  NSNumber *v16;
  NSNumber *payloadForcePIN;
  NSNumber *v18;
  NSNumber *payloadMaxFailedAttempts;
  NSNumber *v20;
  NSNumber *payloadMaxInactivity;
  NSNumber *v22;
  NSNumber *payloadMaxPINAgeInDays;
  NSNumber *v24;
  NSNumber *payloadMinComplexChars;
  NSNumber *v26;
  NSNumber *payloadMinLength;
  NSNumber *v28;
  NSNumber *payloadRequireAlphanumeric;
  NSNumber *v30;
  NSNumber *payloadPinHistory;
  NSNumber *v32;
  NSNumber *payloadMaxGracePeriod;
  NSNumber *v34;
  NSNumber *payloadMinutesUntilFailedLoginReset;
  NSNumber *v36;
  NSNumber *payloadChangeAtNextAuth;
  NSNumber *v38;
  NSNumber *payloadManualFetchingWhenRoaming;
  NSNumber *v40;
  NSNumber *payloadAllowFingerprintForUnlock;
  NSNumber *v42;
  NSNumber *payloadAllowFingerprintModification;
  NSNumber *v44;
  NSNumber *payloadAllowPasscodeModification;
  NSNumber *v46;
  NSNumber *payloadAllowAutoUnlock;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMPasscodeSettingsDeclaration allowedPayloadKeys](CEMPasscodeSettingsDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v65 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowSimple"), 0, MEMORY[0x24BDBD1C8], &v65);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v65;
  payloadAllowSimple = self->_payloadAllowSimple;
  self->_payloadAllowSimple = v13;

  if (!v14)
  {
    v64 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("forcePIN"), 0, MEMORY[0x24BDBD1C8], &v64);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v64;
    payloadForcePIN = self->_payloadForcePIN;
    self->_payloadForcePIN = v16;

    if (!v14)
    {
      v63 = 0;
      -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("maxFailedAttempts"), 0, &unk_24C69CE00, &v63);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v63;
      payloadMaxFailedAttempts = self->_payloadMaxFailedAttempts;
      self->_payloadMaxFailedAttempts = v18;

      if (!v14)
      {
        v62 = 0;
        -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("maxInactivity"), 0, 0, &v62);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v62;
        payloadMaxInactivity = self->_payloadMaxInactivity;
        self->_payloadMaxInactivity = v20;

        if (!v14)
        {
          v61 = 0;
          -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("maxPINAgeInDays"), 0, 0, &v61);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v61;
          payloadMaxPINAgeInDays = self->_payloadMaxPINAgeInDays;
          self->_payloadMaxPINAgeInDays = v22;

          if (!v14)
          {
            v60 = 0;
            -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("minComplexChars"), 0, &unk_24C69CE18, &v60);
            v24 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            v14 = v60;
            payloadMinComplexChars = self->_payloadMinComplexChars;
            self->_payloadMinComplexChars = v24;

            if (!v14)
            {
              v59 = 0;
              -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("minLength"), 0, &unk_24C69CE18, &v59);
              v26 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              v14 = v59;
              payloadMinLength = self->_payloadMinLength;
              self->_payloadMinLength = v26;

              if (!v14)
              {
                v58 = 0;
                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("requireAlphanumeric"), 0, MEMORY[0x24BDBD1C0], &v58);
                v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                v14 = v58;
                payloadRequireAlphanumeric = self->_payloadRequireAlphanumeric;
                self->_payloadRequireAlphanumeric = v28;

                if (!v14)
                {
                  v57 = 0;
                  -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("pinHistory"), 0, 0, &v57);
                  v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  v14 = v57;
                  payloadPinHistory = self->_payloadPinHistory;
                  self->_payloadPinHistory = v30;

                  if (!v14)
                  {
                    v56 = 0;
                    -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("maxGracePeriod"), 0, &unk_24C69CE18, &v56);
                    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                    v14 = v56;
                    payloadMaxGracePeriod = self->_payloadMaxGracePeriod;
                    self->_payloadMaxGracePeriod = v32;

                    if (!v14)
                    {
                      v55 = 0;
                      -[CEMPayloadBase loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadIntegerFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("minutesUntilFailedLoginReset"), 0, 0, &v55);
                      v34 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                      v14 = v55;
                      payloadMinutesUntilFailedLoginReset = self->_payloadMinutesUntilFailedLoginReset;
                      self->_payloadMinutesUntilFailedLoginReset = v34;

                      if (!v14)
                      {
                        v54 = 0;
                        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("changeAtNextAuth"), 0, MEMORY[0x24BDBD1C0], &v54);
                        v36 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                        v14 = v54;
                        payloadChangeAtNextAuth = self->_payloadChangeAtNextAuth;
                        self->_payloadChangeAtNextAuth = v36;

                        if (!v14)
                        {
                          v53 = 0;
                          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("manualFetchingWhenRoaming"), 0, MEMORY[0x24BDBD1C0], &v53);
                          v38 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                          v14 = v53;
                          payloadManualFetchingWhenRoaming = self->_payloadManualFetchingWhenRoaming;
                          self->_payloadManualFetchingWhenRoaming = v38;

                          if (!v14)
                          {
                            v52 = 0;
                            -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowFingerprintForUnlock"), 0, MEMORY[0x24BDBD1C8], &v52);
                            v40 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                            v14 = v52;
                            payloadAllowFingerprintForUnlock = self->_payloadAllowFingerprintForUnlock;
                            self->_payloadAllowFingerprintForUnlock = v40;

                            if (!v14)
                            {
                              v51 = 0;
                              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowFingerprintModification"), 0, MEMORY[0x24BDBD1C8], &v51);
                              v42 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                              v14 = v51;
                              payloadAllowFingerprintModification = self->_payloadAllowFingerprintModification;
                              self->_payloadAllowFingerprintModification = v42;

                              if (!v14)
                              {
                                v50 = 0;
                                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowPasscodeModification"), 0, MEMORY[0x24BDBD1C8], &v50);
                                v44 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                v14 = v50;
                                payloadAllowPasscodeModification = self->_payloadAllowPasscodeModification;
                                self->_payloadAllowPasscodeModification = v44;

                                if (!v14)
                                {
                                  v49 = 0;
                                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("allowAutoUnlock"), 0, MEMORY[0x24BDBD1C8], &v49);
                                  v46 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                  v14 = v49;
                                  payloadAllowAutoUnlock = self->_payloadAllowAutoUnlock;
                                  self->_payloadAllowAutoUnlock = v46;

                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
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

- (id)serializePayloadWithAssetProviders:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDBD1C8];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowSimple"), self->_payloadAllowSimple, 0, MEMORY[0x24BDBD1C8]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("forcePIN"), self->_payloadForcePIN, 0, v5);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("maxFailedAttempts"), self->_payloadMaxFailedAttempts, 0, &unk_24C69CE00);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("maxInactivity"), self->_payloadMaxInactivity, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("maxPINAgeInDays"), self->_payloadMaxPINAgeInDays, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("minComplexChars"), self->_payloadMinComplexChars, 0, &unk_24C69CE18);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("minLength"), self->_payloadMinLength, 0, &unk_24C69CE18);
  v6 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("requireAlphanumeric"), self->_payloadRequireAlphanumeric, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("pinHistory"), self->_payloadPinHistory, 0, 0);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("maxGracePeriod"), self->_payloadMaxGracePeriod, 0, &unk_24C69CE18);
  -[CEMPayloadBase serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeIntegerIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("minutesUntilFailedLoginReset"), self->_payloadMinutesUntilFailedLoginReset, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("changeAtNextAuth"), self->_payloadChangeAtNextAuth, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("manualFetchingWhenRoaming"), self->_payloadManualFetchingWhenRoaming, 0, v6);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowFingerprintForUnlock"), self->_payloadAllowFingerprintForUnlock, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowFingerprintModification"), self->_payloadAllowFingerprintModification, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowPasscodeModification"), self->_payloadAllowPasscodeModification, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("allowAutoUnlock"), self->_payloadAllowAutoUnlock, 0, v5);
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
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
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)CEMPasscodeSettingsDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v40, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadAllowSimple, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadForcePIN, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadMaxFailedAttempts, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadMaxInactivity, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSNumber copy](self->_payloadMaxPINAgeInDays, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSNumber copy](self->_payloadMinComplexChars, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  v17 = -[NSNumber copy](self->_payloadMinLength, "copy");
  v18 = (void *)v4[15];
  v4[15] = v17;

  v19 = -[NSNumber copy](self->_payloadRequireAlphanumeric, "copy");
  v20 = (void *)v4[16];
  v4[16] = v19;

  v21 = -[NSNumber copy](self->_payloadPinHistory, "copy");
  v22 = (void *)v4[17];
  v4[17] = v21;

  v23 = -[NSNumber copy](self->_payloadMaxGracePeriod, "copy");
  v24 = (void *)v4[18];
  v4[18] = v23;

  v25 = -[NSNumber copy](self->_payloadMinutesUntilFailedLoginReset, "copy");
  v26 = (void *)v4[19];
  v4[19] = v25;

  v27 = -[NSNumber copy](self->_payloadChangeAtNextAuth, "copy");
  v28 = (void *)v4[20];
  v4[20] = v27;

  v29 = -[NSNumber copy](self->_payloadManualFetchingWhenRoaming, "copy");
  v30 = (void *)v4[21];
  v4[21] = v29;

  v31 = -[NSNumber copy](self->_payloadAllowFingerprintForUnlock, "copy");
  v32 = (void *)v4[22];
  v4[22] = v31;

  v33 = -[NSNumber copy](self->_payloadAllowFingerprintModification, "copy");
  v34 = (void *)v4[23];
  v4[23] = v33;

  v35 = -[NSNumber copy](self->_payloadAllowPasscodeModification, "copy");
  v36 = (void *)v4[24];
  v4[24] = v35;

  v37 = -[NSNumber copy](self->_payloadAllowAutoUnlock, "copy");
  v38 = (void *)v4[25];
  v4[25] = v37;

  return v4;
}

- (NSNumber)payloadAllowSimple
{
  return self->_payloadAllowSimple;
}

- (void)setPayloadAllowSimple:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadForcePIN
{
  return self->_payloadForcePIN;
}

- (void)setPayloadForcePIN:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadMaxFailedAttempts
{
  return self->_payloadMaxFailedAttempts;
}

- (void)setPayloadMaxFailedAttempts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadMaxInactivity
{
  return self->_payloadMaxInactivity;
}

- (void)setPayloadMaxInactivity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadMaxPINAgeInDays
{
  return self->_payloadMaxPINAgeInDays;
}

- (void)setPayloadMaxPINAgeInDays:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)payloadMinComplexChars
{
  return self->_payloadMinComplexChars;
}

- (void)setPayloadMinComplexChars:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)payloadMinLength
{
  return self->_payloadMinLength;
}

- (void)setPayloadMinLength:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSNumber)payloadRequireAlphanumeric
{
  return self->_payloadRequireAlphanumeric;
}

- (void)setPayloadRequireAlphanumeric:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)payloadPinHistory
{
  return self->_payloadPinHistory;
}

- (void)setPayloadPinHistory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)payloadMaxGracePeriod
{
  return self->_payloadMaxGracePeriod;
}

- (void)setPayloadMaxGracePeriod:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)payloadMinutesUntilFailedLoginReset
{
  return self->_payloadMinutesUntilFailedLoginReset;
}

- (void)setPayloadMinutesUntilFailedLoginReset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)payloadChangeAtNextAuth
{
  return self->_payloadChangeAtNextAuth;
}

- (void)setPayloadChangeAtNextAuth:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSNumber)payloadManualFetchingWhenRoaming
{
  return self->_payloadManualFetchingWhenRoaming;
}

- (void)setPayloadManualFetchingWhenRoaming:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSNumber)payloadAllowFingerprintForUnlock
{
  return self->_payloadAllowFingerprintForUnlock;
}

- (void)setPayloadAllowFingerprintForUnlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSNumber)payloadAllowFingerprintModification
{
  return self->_payloadAllowFingerprintModification;
}

- (void)setPayloadAllowFingerprintModification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSNumber)payloadAllowPasscodeModification
{
  return self->_payloadAllowPasscodeModification;
}

- (void)setPayloadAllowPasscodeModification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSNumber)payloadAllowAutoUnlock
{
  return self->_payloadAllowAutoUnlock;
}

- (void)setPayloadAllowAutoUnlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadAllowAutoUnlock, 0);
  objc_storeStrong((id *)&self->_payloadAllowPasscodeModification, 0);
  objc_storeStrong((id *)&self->_payloadAllowFingerprintModification, 0);
  objc_storeStrong((id *)&self->_payloadAllowFingerprintForUnlock, 0);
  objc_storeStrong((id *)&self->_payloadManualFetchingWhenRoaming, 0);
  objc_storeStrong((id *)&self->_payloadChangeAtNextAuth, 0);
  objc_storeStrong((id *)&self->_payloadMinutesUntilFailedLoginReset, 0);
  objc_storeStrong((id *)&self->_payloadMaxGracePeriod, 0);
  objc_storeStrong((id *)&self->_payloadPinHistory, 0);
  objc_storeStrong((id *)&self->_payloadRequireAlphanumeric, 0);
  objc_storeStrong((id *)&self->_payloadMinLength, 0);
  objc_storeStrong((id *)&self->_payloadMinComplexChars, 0);
  objc_storeStrong((id *)&self->_payloadMaxPINAgeInDays, 0);
  objc_storeStrong((id *)&self->_payloadMaxInactivity, 0);
  objc_storeStrong((id *)&self->_payloadMaxFailedAttempts, 0);
  objc_storeStrong((id *)&self->_payloadForcePIN, 0);
  objc_storeStrong((id *)&self->_payloadAllowSimple, 0);
}

@end
