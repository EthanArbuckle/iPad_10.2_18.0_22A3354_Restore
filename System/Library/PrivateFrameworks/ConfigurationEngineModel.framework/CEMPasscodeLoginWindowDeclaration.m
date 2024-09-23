@implementation CEMPasscodeLoginWindowDeclaration

+ (NSString)registeredClassName
{
  return (NSString *)CFSTR("Declarations");
}

+ (NSString)registeredIdentifier
{
  return (NSString *)CFSTR("com.apple.configuration.passcode.loginwindow");
}

+ (id)profileType
{
  return CFSTR("com.apple.loginwindow");
}

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[20];

  v6[19] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("SHOWFULLNAME");
  v6[1] = CFSTR("HideLocalUsers");
  v6[2] = CFSTR("IncludeNetworkUser");
  v6[3] = CFSTR("HideAdminUsers");
  v6[4] = CFSTR("SHOWOTHERUSERS_MANAGED");
  v6[5] = CFSTR("AdminHostInfo");
  v6[6] = CFSTR("AllowList");
  v6[7] = CFSTR("DenyList");
  v6[8] = CFSTR("HideMobileAccounts");
  v6[9] = CFSTR("ShutDownDisabled");
  v6[10] = CFSTR("RestartDisabled");
  v6[11] = CFSTR("SleepDisabled");
  v6[12] = CFSTR("DisableConsoleAccess");
  v6[13] = CFSTR("LoginwindowText");
  v6[14] = CFSTR("ShutDownDisabledWhileLoggedIn");
  v6[15] = CFSTR("RestartDisabledWhileLoggedIn");
  v6[16] = CFSTR("PowerOffDisabledWhileLoggedIn");
  v6[17] = CFSTR("LogOutDisabledWhileLoggedIn");
  v6[18] = CFSTR("DisableScreenLockImmediate");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 19);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)restrictionPayloadKeys
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", MEMORY[0x24BDBD1A8]);
}

- (BOOL)multipleAllowed
{
  return 1;
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

+ (id)buildWithIdentifier:(id)a3 withSHOWFULLNAME:(id)a4 withHideLocalUsers:(id)a5 withIncludeNetworkUser:(id)a6 withHideAdminUsers:(id)a7 withSHOWOTHERUSERSMANAGED:(id)a8 withAdminHostInfo:(id)a9 withAllowList:(id)a10 withDenyList:(id)a11 withHideMobileAccounts:(id)a12 withShutDownDisabled:(id)a13 withRestartDisabled:(id)a14 withSleepDisabled:(id)a15 withDisableConsoleAccess:(id)a16 withLoginwindowText:(id)a17 withShutDownDisabledWhileLoggedIn:(id)a18 withRestartDisabledWhileLoggedIn:(id)a19 withPowerOffDisabledWhileLoggedIn:(id)a20 withLogOutDisabledWhileLoggedIn:(id)a21 withDisableScreenLockImmediate:(id)a22
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
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
  id v66;

  v22 = a3;
  v66 = a22;
  v65 = a21;
  v64 = a20;
  v63 = a19;
  v62 = a18;
  v61 = a17;
  v60 = a16;
  v59 = a15;
  v23 = a14;
  v24 = a13;
  v58 = a12;
  v57 = a11;
  v56 = a10;
  v55 = a9;
  v25 = a8;
  v26 = a7;
  v27 = a6;
  v28 = a5;
  v29 = a4;
  v30 = (void *)objc_opt_new();
  objc_msgSend(v30, "setDeclarationType:", CFSTR("com.apple.configuration.passcode.loginwindow"));
  if (v22)
  {
    objc_msgSend(v30, "setDeclarationIdentifier:", v22);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "UUIDString");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setDeclarationIdentifier:", v32);

    v22 = 0;
  }
  v33 = (void *)MEMORY[0x24BDBD1C0];
  if (v29)
    v34 = v29;
  else
    v34 = (id)MEMORY[0x24BDBD1C0];
  objc_msgSend(v30, "setPayloadSHOWFULLNAME:", v34, a13);

  if (v28)
    v35 = v28;
  else
    v35 = v33;
  objc_msgSend(v30, "setPayloadHideLocalUsers:", v35);

  if (v27)
    v36 = v27;
  else
    v36 = v33;
  objc_msgSend(v30, "setPayloadIncludeNetworkUser:", v36);

  if (v26)
    v37 = v26;
  else
    v37 = v33;
  objc_msgSend(v30, "setPayloadHideAdminUsers:", v37);

  if (v25)
    v38 = v25;
  else
    v38 = v33;
  objc_msgSend(v30, "setPayloadSHOWOTHERUSERSMANAGED:", v38);

  objc_msgSend(v30, "setPayloadAdminHostInfo:", v55);
  objc_msgSend(v30, "setPayloadAllowList:", v56);

  objc_msgSend(v30, "setPayloadDenyList:", v57);
  if (v58)
    v39 = v58;
  else
    v39 = v33;
  objc_msgSend(v30, "setPayloadHideMobileAccounts:", v39);

  if (v24)
    v40 = v24;
  else
    v40 = v33;
  objc_msgSend(v30, "setPayloadShutDownDisabled:", v40);

  if (v23)
    v41 = v23;
  else
    v41 = v33;
  objc_msgSend(v30, "setPayloadRestartDisabled:", v41);

  if (v59)
    v42 = v59;
  else
    v42 = v33;
  objc_msgSend(v30, "setPayloadSleepDisabled:", v42);

  if (v60)
    v43 = v60;
  else
    v43 = v33;
  objc_msgSend(v30, "setPayloadDisableConsoleAccess:", v43);

  objc_msgSend(v30, "setPayloadLoginwindowText:", v61);
  if (v62)
    v44 = v62;
  else
    v44 = v33;
  objc_msgSend(v30, "setPayloadShutDownDisabledWhileLoggedIn:", v44);

  if (v63)
    v45 = v63;
  else
    v45 = v33;
  objc_msgSend(v30, "setPayloadRestartDisabledWhileLoggedIn:", v45);

  if (v64)
    v46 = v64;
  else
    v46 = v33;
  objc_msgSend(v30, "setPayloadPowerOffDisabledWhileLoggedIn:", v46);

  if (v65)
    v47 = v65;
  else
    v47 = v33;
  objc_msgSend(v30, "setPayloadLogOutDisabledWhileLoggedIn:", v47);

  if (v66)
    v48 = v66;
  else
    v48 = v33;
  objc_msgSend(v30, "setPayloadDisableScreenLockImmediate:", v48);

  objc_msgSend(v30, "updateServerHash");
  return v30;
}

+ (id)buildRequiredOnlyWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDeclarationType:", CFSTR("com.apple.configuration.passcode.loginwindow"));
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
  NSNumber *payloadSHOWFULLNAME;
  NSNumber *v16;
  NSNumber *payloadHideLocalUsers;
  NSNumber *v18;
  NSNumber *payloadIncludeNetworkUser;
  NSNumber *v20;
  NSNumber *payloadHideAdminUsers;
  NSNumber *v22;
  NSNumber *payloadSHOWOTHERUSERSMANAGED;
  NSString *v24;
  NSString *payloadAdminHostInfo;
  NSArray *v26;
  NSArray *payloadAllowList;
  NSArray *v28;
  NSArray *payloadDenyList;
  NSNumber *v30;
  NSNumber *payloadHideMobileAccounts;
  NSNumber *v32;
  NSNumber *payloadShutDownDisabled;
  NSNumber *v34;
  NSNumber *payloadRestartDisabled;
  NSNumber *v36;
  NSNumber *payloadSleepDisabled;
  NSNumber *v38;
  NSNumber *payloadDisableConsoleAccess;
  NSString *v40;
  NSString *payloadLoginwindowText;
  NSNumber *v42;
  NSNumber *payloadShutDownDisabledWhileLoggedIn;
  NSNumber *v44;
  NSNumber *payloadRestartDisabledWhileLoggedIn;
  NSNumber *v46;
  NSNumber *payloadPowerOffDisabledWhileLoggedIn;
  NSNumber *v48;
  NSNumber *payloadLogOutDisabledWhileLoggedIn;
  NSNumber *v50;
  NSNumber *payloadDisableScreenLockImmediate;
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
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMPasscodeLoginWindowDeclaration allowedPayloadKeys](CEMPasscodeLoginWindowDeclaration, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super.super.super._unknownPayloadKeys;
  self->super.super.super._unknownPayloadKeys = v11;

  v71 = 0;
  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SHOWFULLNAME"), 0, MEMORY[0x24BDBD1C0], &v71);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  v14 = v71;
  payloadSHOWFULLNAME = self->_payloadSHOWFULLNAME;
  self->_payloadSHOWFULLNAME = v13;

  if (!v14)
  {
    v70 = 0;
    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("HideLocalUsers"), 0, MEMORY[0x24BDBD1C0], &v70);
    v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v14 = v70;
    payloadHideLocalUsers = self->_payloadHideLocalUsers;
    self->_payloadHideLocalUsers = v16;

    if (!v14)
    {
      v69 = 0;
      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("IncludeNetworkUser"), 0, MEMORY[0x24BDBD1C0], &v69);
      v18 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v14 = v69;
      payloadIncludeNetworkUser = self->_payloadIncludeNetworkUser;
      self->_payloadIncludeNetworkUser = v18;

      if (!v14)
      {
        v68 = 0;
        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("HideAdminUsers"), 0, MEMORY[0x24BDBD1C0], &v68);
        v20 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v14 = v68;
        payloadHideAdminUsers = self->_payloadHideAdminUsers;
        self->_payloadHideAdminUsers = v20;

        if (!v14)
        {
          v67 = 0;
          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SHOWOTHERUSERS_MANAGED"), 0, MEMORY[0x24BDBD1C0], &v67);
          v22 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          v14 = v67;
          payloadSHOWOTHERUSERSMANAGED = self->_payloadSHOWOTHERUSERSMANAGED;
          self->_payloadSHOWOTHERUSERSMANAGED = v22;

          if (!v14)
          {
            v66 = 0;
            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("AdminHostInfo"), 0, 0, &v66);
            v24 = (NSString *)objc_claimAutoreleasedReturnValue();
            v14 = v66;
            payloadAdminHostInfo = self->_payloadAdminHostInfo;
            self->_payloadAdminHostInfo = v24;

            if (!v14)
            {
              v65 = 0;
              -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("AllowList"), &__block_literal_global_27, 0, 0, &v65);
              v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
              v14 = v65;
              payloadAllowList = self->_payloadAllowList;
              self->_payloadAllowList = v26;

              if (!v14)
              {
                v64 = 0;
                -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("DenyList"), &__block_literal_global_55, 0, 0, &v64);
                v28 = (NSArray *)objc_claimAutoreleasedReturnValue();
                v14 = v64;
                payloadDenyList = self->_payloadDenyList;
                self->_payloadDenyList = v28;

                if (!v14)
                {
                  v63 = 0;
                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("HideMobileAccounts"), 0, MEMORY[0x24BDBD1C0], &v63);
                  v30 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                  v14 = v63;
                  payloadHideMobileAccounts = self->_payloadHideMobileAccounts;
                  self->_payloadHideMobileAccounts = v30;

                  if (!v14)
                  {
                    v62 = 0;
                    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ShutDownDisabled"), 0, MEMORY[0x24BDBD1C0], &v62);
                    v32 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                    v14 = v62;
                    payloadShutDownDisabled = self->_payloadShutDownDisabled;
                    self->_payloadShutDownDisabled = v32;

                    if (!v14)
                    {
                      v61 = 0;
                      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("RestartDisabled"), 0, MEMORY[0x24BDBD1C0], &v61);
                      v34 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                      v14 = v61;
                      payloadRestartDisabled = self->_payloadRestartDisabled;
                      self->_payloadRestartDisabled = v34;

                      if (!v14)
                      {
                        v60 = 0;
                        -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("SleepDisabled"), 0, MEMORY[0x24BDBD1C0], &v60);
                        v36 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                        v14 = v60;
                        payloadSleepDisabled = self->_payloadSleepDisabled;
                        self->_payloadSleepDisabled = v36;

                        if (!v14)
                        {
                          v59 = 0;
                          -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisableConsoleAccess"), 0, MEMORY[0x24BDBD1C0], &v59);
                          v38 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                          v14 = v59;
                          payloadDisableConsoleAccess = self->_payloadDisableConsoleAccess;
                          self->_payloadDisableConsoleAccess = v38;

                          if (!v14)
                          {
                            v58 = 0;
                            -[CEMPayloadBase loadStringFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadStringFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("LoginwindowText"), 0, 0, &v58);
                            v40 = (NSString *)objc_claimAutoreleasedReturnValue();
                            v14 = v58;
                            payloadLoginwindowText = self->_payloadLoginwindowText;
                            self->_payloadLoginwindowText = v40;

                            if (!v14)
                            {
                              v57 = 0;
                              -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("ShutDownDisabledWhileLoggedIn"), 0, MEMORY[0x24BDBD1C0], &v57);
                              v42 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                              v14 = v57;
                              payloadShutDownDisabledWhileLoggedIn = self->_payloadShutDownDisabledWhileLoggedIn;
                              self->_payloadShutDownDisabledWhileLoggedIn = v42;

                              if (!v14)
                              {
                                v56 = 0;
                                -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("RestartDisabledWhileLoggedIn"), 0, MEMORY[0x24BDBD1C0], &v56);
                                v44 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                v14 = v56;
                                payloadRestartDisabledWhileLoggedIn = self->_payloadRestartDisabledWhileLoggedIn;
                                self->_payloadRestartDisabledWhileLoggedIn = v44;

                                if (!v14)
                                {
                                  v55 = 0;
                                  -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("PowerOffDisabledWhileLoggedIn"), 0, MEMORY[0x24BDBD1C0], &v55);
                                  v46 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                  v14 = v55;
                                  payloadPowerOffDisabledWhileLoggedIn = self->_payloadPowerOffDisabledWhileLoggedIn;
                                  self->_payloadPowerOffDisabledWhileLoggedIn = v46;

                                  if (!v14)
                                  {
                                    v54 = 0;
                                    -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("LogOutDisabledWhileLoggedIn"), 0, MEMORY[0x24BDBD1C0], &v54);
                                    v48 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                    v14 = v54;
                                    payloadLogOutDisabledWhileLoggedIn = self->_payloadLogOutDisabledWhileLoggedIn;
                                    self->_payloadLogOutDisabledWhileLoggedIn = v48;

                                    if (!v14)
                                    {
                                      v53 = 0;
                                      -[CEMPayloadBase loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:](self, "loadBooleanFromDictionary:withKey:isRequired:defaultValue:error:", v6, CFSTR("DisableScreenLockImmediate"), 0, MEMORY[0x24BDBD1C0], &v53);
                                      v50 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                                      v14 = v53;
                                      payloadDisableScreenLockImmediate = self->_payloadDisableScreenLockImmediate;
                                      self->_payloadDisableScreenLockImmediate = v50;

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
    }
  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

uint64_t __55__CEMPasscodeLoginWindowDeclaration_loadPayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __55__CEMPasscodeLoginWindowDeclaration_loadPayload_error___block_invoke_2(uint64_t a1, void *a2)
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
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDBD1C0];
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("SHOWFULLNAME"), self->_payloadSHOWFULLNAME, 0, MEMORY[0x24BDBD1C0]);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("HideLocalUsers"), self->_payloadHideLocalUsers, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("IncludeNetworkUser"), self->_payloadIncludeNetworkUser, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("HideAdminUsers"), self->_payloadHideAdminUsers, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("SHOWOTHERUSERS_MANAGED"), self->_payloadSHOWOTHERUSERSMANAGED, 0, v5);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("AdminHostInfo"), self->_payloadAdminHostInfo, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("AllowList"), self->_payloadAllowList, &__block_literal_global_58, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("DenyList"), self->_payloadDenyList, &__block_literal_global_59, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("HideMobileAccounts"), self->_payloadHideMobileAccounts, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ShutDownDisabled"), self->_payloadShutDownDisabled, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("RestartDisabled"), self->_payloadRestartDisabled, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("SleepDisabled"), self->_payloadSleepDisabled, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("DisableConsoleAccess"), self->_payloadDisableConsoleAccess, 0, v5);
  -[CEMPayloadBase serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeStringIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("LoginwindowText"), self->_payloadLoginwindowText, 0, 0);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("ShutDownDisabledWhileLoggedIn"), self->_payloadShutDownDisabledWhileLoggedIn, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("RestartDisabledWhileLoggedIn"), self->_payloadRestartDisabledWhileLoggedIn, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("PowerOffDisabledWhileLoggedIn"), self->_payloadPowerOffDisabledWhileLoggedIn, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("LogOutDisabledWhileLoggedIn"), self->_payloadLogOutDisabledWhileLoggedIn, 0, v5);
  -[CEMPayloadBase serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:](self, "serializeBooleanIntoDictionary:withKey:withValue:isRequired:defaultValue:", v4, CFSTR("DisableScreenLockImmediate"), self->_payloadDisableScreenLockImmediate, 0, v5);
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
}

id __72__CEMPasscodeLoginWindowDeclaration_serializePayloadWithAssetProviders___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

id __72__CEMPasscodeLoginWindowDeclaration_serializePayloadWithAssetProviders___block_invoke_2(uint64_t a1, void *a2)
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
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  objc_super v44;

  v44.receiver = self;
  v44.super_class = (Class)CEMPasscodeLoginWindowDeclaration;
  v4 = -[CEMDeclarationBase copyWithZone:](&v44, sel_copyWithZone_, a3);
  v5 = -[NSNumber copy](self->_payloadSHOWFULLNAME, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  v7 = -[NSNumber copy](self->_payloadHideLocalUsers, "copy");
  v8 = (void *)v4[10];
  v4[10] = v7;

  v9 = -[NSNumber copy](self->_payloadIncludeNetworkUser, "copy");
  v10 = (void *)v4[11];
  v4[11] = v9;

  v11 = -[NSNumber copy](self->_payloadHideAdminUsers, "copy");
  v12 = (void *)v4[12];
  v4[12] = v11;

  v13 = -[NSNumber copy](self->_payloadSHOWOTHERUSERSMANAGED, "copy");
  v14 = (void *)v4[13];
  v4[13] = v13;

  v15 = -[NSString copy](self->_payloadAdminHostInfo, "copy");
  v16 = (void *)v4[14];
  v4[14] = v15;

  v17 = -[NSArray copy](self->_payloadAllowList, "copy");
  v18 = (void *)v4[15];
  v4[15] = v17;

  v19 = -[NSArray copy](self->_payloadDenyList, "copy");
  v20 = (void *)v4[16];
  v4[16] = v19;

  v21 = -[NSNumber copy](self->_payloadHideMobileAccounts, "copy");
  v22 = (void *)v4[17];
  v4[17] = v21;

  v23 = -[NSNumber copy](self->_payloadShutDownDisabled, "copy");
  v24 = (void *)v4[18];
  v4[18] = v23;

  v25 = -[NSNumber copy](self->_payloadRestartDisabled, "copy");
  v26 = (void *)v4[19];
  v4[19] = v25;

  v27 = -[NSNumber copy](self->_payloadSleepDisabled, "copy");
  v28 = (void *)v4[20];
  v4[20] = v27;

  v29 = -[NSNumber copy](self->_payloadDisableConsoleAccess, "copy");
  v30 = (void *)v4[21];
  v4[21] = v29;

  v31 = -[NSString copy](self->_payloadLoginwindowText, "copy");
  v32 = (void *)v4[22];
  v4[22] = v31;

  v33 = -[NSNumber copy](self->_payloadShutDownDisabledWhileLoggedIn, "copy");
  v34 = (void *)v4[23];
  v4[23] = v33;

  v35 = -[NSNumber copy](self->_payloadRestartDisabledWhileLoggedIn, "copy");
  v36 = (void *)v4[24];
  v4[24] = v35;

  v37 = -[NSNumber copy](self->_payloadPowerOffDisabledWhileLoggedIn, "copy");
  v38 = (void *)v4[25];
  v4[25] = v37;

  v39 = -[NSNumber copy](self->_payloadLogOutDisabledWhileLoggedIn, "copy");
  v40 = (void *)v4[26];
  v4[26] = v39;

  v41 = -[NSNumber copy](self->_payloadDisableScreenLockImmediate, "copy");
  v42 = (void *)v4[27];
  v4[27] = v41;

  return v4;
}

- (NSNumber)payloadSHOWFULLNAME
{
  return self->_payloadSHOWFULLNAME;
}

- (void)setPayloadSHOWFULLNAME:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)payloadHideLocalUsers
{
  return self->_payloadHideLocalUsers;
}

- (void)setPayloadHideLocalUsers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)payloadIncludeNetworkUser
{
  return self->_payloadIncludeNetworkUser;
}

- (void)setPayloadIncludeNetworkUser:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)payloadHideAdminUsers
{
  return self->_payloadHideAdminUsers;
}

- (void)setPayloadHideAdminUsers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)payloadSHOWOTHERUSERSMANAGED
{
  return self->_payloadSHOWOTHERUSERSMANAGED;
}

- (void)setPayloadSHOWOTHERUSERSMANAGED:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)payloadAdminHostInfo
{
  return self->_payloadAdminHostInfo;
}

- (void)setPayloadAdminHostInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSArray)payloadAllowList
{
  return self->_payloadAllowList;
}

- (void)setPayloadAllowList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)payloadDenyList
{
  return self->_payloadDenyList;
}

- (void)setPayloadDenyList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)payloadHideMobileAccounts
{
  return self->_payloadHideMobileAccounts;
}

- (void)setPayloadHideMobileAccounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSNumber)payloadShutDownDisabled
{
  return self->_payloadShutDownDisabled;
}

- (void)setPayloadShutDownDisabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSNumber)payloadRestartDisabled
{
  return self->_payloadRestartDisabled;
}

- (void)setPayloadRestartDisabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSNumber)payloadSleepDisabled
{
  return self->_payloadSleepDisabled;
}

- (void)setPayloadSleepDisabled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSNumber)payloadDisableConsoleAccess
{
  return self->_payloadDisableConsoleAccess;
}

- (void)setPayloadDisableConsoleAccess:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)payloadLoginwindowText
{
  return self->_payloadLoginwindowText;
}

- (void)setPayloadLoginwindowText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSNumber)payloadShutDownDisabledWhileLoggedIn
{
  return self->_payloadShutDownDisabledWhileLoggedIn;
}

- (void)setPayloadShutDownDisabledWhileLoggedIn:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (NSNumber)payloadRestartDisabledWhileLoggedIn
{
  return self->_payloadRestartDisabledWhileLoggedIn;
}

- (void)setPayloadRestartDisabledWhileLoggedIn:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSNumber)payloadPowerOffDisabledWhileLoggedIn
{
  return self->_payloadPowerOffDisabledWhileLoggedIn;
}

- (void)setPayloadPowerOffDisabledWhileLoggedIn:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSNumber)payloadLogOutDisabledWhileLoggedIn
{
  return self->_payloadLogOutDisabledWhileLoggedIn;
}

- (void)setPayloadLogOutDisabledWhileLoggedIn:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSNumber)payloadDisableScreenLockImmediate
{
  return self->_payloadDisableScreenLockImmediate;
}

- (void)setPayloadDisableScreenLockImmediate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDisableScreenLockImmediate, 0);
  objc_storeStrong((id *)&self->_payloadLogOutDisabledWhileLoggedIn, 0);
  objc_storeStrong((id *)&self->_payloadPowerOffDisabledWhileLoggedIn, 0);
  objc_storeStrong((id *)&self->_payloadRestartDisabledWhileLoggedIn, 0);
  objc_storeStrong((id *)&self->_payloadShutDownDisabledWhileLoggedIn, 0);
  objc_storeStrong((id *)&self->_payloadLoginwindowText, 0);
  objc_storeStrong((id *)&self->_payloadDisableConsoleAccess, 0);
  objc_storeStrong((id *)&self->_payloadSleepDisabled, 0);
  objc_storeStrong((id *)&self->_payloadRestartDisabled, 0);
  objc_storeStrong((id *)&self->_payloadShutDownDisabled, 0);
  objc_storeStrong((id *)&self->_payloadHideMobileAccounts, 0);
  objc_storeStrong((id *)&self->_payloadDenyList, 0);
  objc_storeStrong((id *)&self->_payloadAllowList, 0);
  objc_storeStrong((id *)&self->_payloadAdminHostInfo, 0);
  objc_storeStrong((id *)&self->_payloadSHOWOTHERUSERSMANAGED, 0);
  objc_storeStrong((id *)&self->_payloadHideAdminUsers, 0);
  objc_storeStrong((id *)&self->_payloadIncludeNetworkUser, 0);
  objc_storeStrong((id *)&self->_payloadHideLocalUsers, 0);
  objc_storeStrong((id *)&self->_payloadSHOWFULLNAME, 0);
}

@end
