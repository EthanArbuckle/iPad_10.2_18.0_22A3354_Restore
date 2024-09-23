@implementation ACDDatabaseInitializer

+ (id)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (ACDDatabaseInitializer)init
{
  -[ACDDatabaseInitializer doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ACDDatabaseInitializer)initWithDatabaseConnection:(id)a3
{
  id v6;
  ACDDatabaseInitializer *v7;
  ACDDatabaseInitializer *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDDatabaseInitializer.m"), 192, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databaseConnection"));

  }
  v11.receiver = self;
  v11.super_class = (Class)ACDDatabaseInitializer;
  v7 = -[ACDDatabaseInitializer init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_databaseConnection, a3);

  return v8;
}

- (BOOL)updateDefaultContentIfNecessary:(id *)a3
{
  void *v5;
  char v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__1;
  v13 = __Block_byref_object_dispose__1;
  v14 = 0;
  -[ACDDatabaseConnection managedObjectContext](self->_databaseConnection, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__ACDDatabaseInitializer_updateDefaultContentIfNecessary___block_invoke;
  v8[3] = &unk_24C7E2158;
  v8[4] = self;
  v8[5] = &v15;
  v8[6] = &v9;
  objc_msgSend(v5, "performBlockAndWait:", v8);

  if (a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  v6 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __58__ACDDatabaseInitializer_updateDefaultContentIfNecessary___block_invoke(_QWORD *a1)
{
  id *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  NSObject *v9;
  char v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char v16;
  void *v17;
  uint64_t v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id obj;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 4);
  objc_msgSend(*(id *)(a1[4] + 8), "version");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = -1;

  _ACDLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("not migrating");
    *(_DWORD *)buf = 138412802;
    v27 = v7;
    v29 = &unk_24C7EF1A0;
    v28 = 2112;
    if ((uint64_t)v5 < 103)
      v8 = CFSTR("migrating");
    v30 = 2112;
    v31 = v8;
    _os_log_impl(&dword_20D8CB000, v6, OS_LOG_TYPE_DEFAULT, "\"Opened database at version %@, current config version %@, %@\", buf, 0x20u);

  }
  if ((uint64_t)v5 >= 104)
  {
    _ACDLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __58__ACDDatabaseInitializer_updateDefaultContentIfNecessary___block_invoke_cold_3();

    goto LABEL_13;
  }
  if (v5 != 103)
  {
    if ((v5 & 0x8000000000000000) != 0)
    {
      objc_msgSend(*v2, "_addTwitterAccountType");
    }
    else
    {
      if (v5 == 1)
      {
LABEL_112:
        objc_msgSend(*v2, "_addFacebookAccountType");
        objc_msgSend(*v2, "_addCalDAVAccountType");
        objc_msgSend(*v2, "_addCardDAVAccountType");
        objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB4580]);
        objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB4598]);
        goto LABEL_113;
      }
      if (v5)
      {
        if (v5 > 2)
        {
          if (v5 != 3)
          {
            if (v5 > 4)
            {
              if (v5 != 5)
              {
                if (v5 > 6)
                {
                  if (v5 != 7)
                  {
                    if (v5 > 8)
                    {
                      if (v5 != 9)
                      {
                        if (v5 > 0xA)
                        {
                          if (v5 != 11)
                          {
                            if (v5 > 0xC)
                            {
                              if (v5 != 13)
                              {
                                if (v5 > 0xE)
                                {
                                  if (v5 != 15)
                                  {
                                    if (v5 > 0x10)
                                    {
                                      if (v5 != 17)
                                      {
                                        if (v5 > 0x12)
                                        {
                                          if (v5 != 19)
                                          {
                                            if (v5 > 0x14)
                                            {
                                              if (v5 != 21)
                                              {
                                                if (v5 > 0x16)
                                                {
                                                  if (v5 != 23)
                                                  {
                                                    if (v5 > 0x18)
                                                    {
                                                      if (v5 > 0x1A)
                                                      {
                                                        if (v5 != 27)
                                                        {
                                                          if (v5 > 0x1C)
                                                          {
                                                            if (v5 != 29)
                                                            {
                                                              if (v5 > 0x1E)
                                                              {
                                                                if (v5 > 0x20)
                                                                {
                                                                  if (v5 != 33)
                                                                  {
                                                                    if (v5 > 0x22)
                                                                    {
                                                                      if (v5 != 35)
                                                                      {
                                                                        if (v5 > 0x24)
                                                                        {
                                                                          if (v5 != 37)
                                                                          {
                                                                            if (v5 > 0x26)
                                                                            {
                                                                              if (v5 > 0x29)
                                                                              {
                                                                                if (v5 != 42)
                                                                                {
                                                                                  if (v5 > 0x2C)
                                                                                  {
                                                                                    if (v5 != 45)
                                                                                    {
                                                                                      if (v5 > 0x2E)
                                                                                      {
                                                                                        if (v5 != 47)
                                                                                        {
                                                                                          if (v5 > 0x30)
                                                                                          {
                                                                                            if (v5 != 49)
                                                                                            {
                                                                                              if (v5 > 0x33)
                                                                                              {
                                                                                                if (v5 != 52)
                                                                                                {
                                                                                                  if (v5 > 0x35)
                                                                                                  {
                                                                                                    if (v5 > 0x37)
                                                                                                    {
                                                                                                      if (v5 != 56)
                                                                                                      {
                                                                                                        if (v5 > 0x39)
                                                                                                        {
                                                                                                          if (v5 != 58)
                                                                                                          {
                                                                                                            if (v5 > 0x3B)
                                                                                                            {
                                                                                                              if (v5 != 60)
                                                                                                              {
                                                                                                                if (v5 > 0x3D)
                                                                                                                {
                                                                                                                  if (v5 != 62)
                                                                                                                  {
                                                                                                                    if (v5 > 0x3F)
                                                                                                                    {
                                                                                                                      if (v5 != 64)
                                                                                                                      {
                                                                                                                        if (v5 > 0x41)
                                                                                                                        {
                                                                                                                          if (v5 != 66)
                                                                                                                          {
                                                                                                                            if (v5 > 0x43)
                                                                                                                            {
                                                                                                                              if (v5 != 68)
                                                                                                                              {
                                                                                                                                if (v5 > 0x45)
                                                                                                                                {
                                                                                                                                  if (v5 != 70)
                                                                                                                                  {
                                                                                                                                    if (v5 > 0x47)
                                                                                                                                    {
                                                                                                                                      if (v5 != 72)
                                                                                                                                      {
                                                                                                                                        if (v5 > 0x49)
                                                                                                                                        {
                                                                                                                                          if (v5 != 74)
                                                                                                                                          {
                                                                                                                                            if (v5 > 0x4B)
                                                                                                                                            {
                                                                                                                                              if (v5 != 76)
                                                                                                                                              {
                                                                                                                                                if (v5 > 0x4D)
                                                                                                                                                {
                                                                                                                                                  if (v5 != 78)
                                                                                                                                                  {
                                                                                                                                                    if (v5 > 0x4F)
                                                                                                                                                    {
                                                                                                                                                      if (v5 != 80)
                                                                                                                                                      {
                                                                                                                                                        if (v5 > 0x51)
                                                                                                                                                        {
                                                                                                                                                          if (v5 != 82)
                                                                                                                                                          {
                                                                                                                                                            if (v5 > 0x53)
                                                                                                                                                            {
                                                                                                                                                              if (v5 != 84)
                                                                                                                                                              {
                                                                                                                                                                if (v5 > 0x55)
                                                                                                                                                                {
                                                                                                                                                                  if (v5 != 86)
                                                                                                                                                                  {
                                                                                                                                                                    if (v5 > 0x57)
                                                                                                                                                                    {
                                                                                                                                                                      if (v5 != 88)
                                                                                                                                                                      {
                                                                                                                                                                        if (v5 > 0x59)
                                                                                                                                                                        {
                                                                                                                                                                          if (v5 != 90)
                                                                                                                                                                          {
                                                                                                                                                                            if (v5 > 0x5B)
                                                                                                                                                                            {
                                                                                                                                                                              if (v5 != 92)
                                                                                                                                                                              {
                                                                                                                                                                                if (v5 > 0x5E)
                                                                                                                                                                                {
                                                                                                                                                                                  if (v5 != 95)
                                                                                                                                                                                  {
                                                                                                                                                                                    if (v5 > 0x60)
                                                                                                                                                                                    {
                                                                                                                                                                                      if (v5 != 97)
                                                                                                                                                                                      {
                                                                                                                                                                                        if (v5 > 0x62)
                                                                                                                                                                                        {
                                                                                                                                                                                          if (v5 != 99)
                                                                                                                                                                                          {
                                                                                                                                                                                            if (v5 > 0x64)
                                                                                                                                                                                            {
                                                                                                                                                                                              if (v5 != 101)
                                                                                                                                                                                                goto LABEL_205;
                                                                                                                                                                                              goto LABEL_204;
                                                                                                                                                                                            }
LABEL_203:
                                                                                                                                                                                            objc_msgSend(*v2, "_removeRedundantAccountTypes");
LABEL_204:
                                                                                                                                                                                            objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB3E50]);
LABEL_205:
                                                                                                                                                                                            objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB3E70]);
                                                                                                                                                                                            v10 = 1;
                                                                                                                                                                                            goto LABEL_206;
                                                                                                                                                                                          }
LABEL_202:
                                                                                                                                                                                          objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB3E10]);
                                                                                                                                                                                          goto LABEL_203;
                                                                                                                                                                                        }
LABEL_201:
                                                                                                                                                                                        objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB3E98]);
                                                                                                                                                                                        goto LABEL_202;
                                                                                                                                                                                      }
LABEL_200:
                                                                                                                                                                                      objc_msgSend(*v2, "_addPublishedCalendarAccountType");
                                                                                                                                                                                      goto LABEL_201;
                                                                                                                                                                                    }
LABEL_199:
                                                                                                                                                                                    objc_msgSend(*v2, "_removeRedundantDataclasses");
                                                                                                                                                                                    goto LABEL_200;
                                                                                                                                                                                  }
LABEL_198:
                                                                                                                                                                                  objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB3E08]);
                                                                                                                                                                                  goto LABEL_199;
                                                                                                                                                                                }
LABEL_197:
                                                                                                                                                                                objc_msgSend(*v2, "_addWarmingUpAttributeToAccounts");
                                                                                                                                                                                goto LABEL_198;
                                                                                                                                                                              }
LABEL_196:
                                                                                                                                                                              objc_msgSend(*v2, "_addRemoteManagementAccountType");
                                                                                                                                                                              goto LABEL_197;
                                                                                                                                                                            }
LABEL_195:
                                                                                                                                                                            objc_msgSend(*v2, "_removeRedundantDataclasses");
                                                                                                                                                                            goto LABEL_196;
                                                                                                                                                                          }
LABEL_194:
                                                                                                                                                                          objc_msgSend(*v2, "_addFindMyiPhoneAccountType");
                                                                                                                                                                          goto LABEL_195;
                                                                                                                                                                        }
LABEL_193:
                                                                                                                                                                        objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB3E80]);
                                                                                                                                                                        goto LABEL_194;
                                                                                                                                                                      }
LABEL_192:
                                                                                                                                                                      objc_msgSend(*v2, "_aolSupportsAuthentication");
                                                                                                                                                                      goto LABEL_193;
                                                                                                                                                                    }
LABEL_191:
                                                                                                                                                                    objc_msgSend(*v2, "_switchAolAccountsToOAuth");
                                                                                                                                                                    goto LABEL_192;
                                                                                                                                                                  }
LABEL_190:
                                                                                                                                                                  objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB4660]);
                                                                                                                                                                  goto LABEL_191;
                                                                                                                                                                }
LABEL_189:
                                                                                                                                                                objc_msgSend(*v2, "_removeBTMMType");
                                                                                                                                                                goto LABEL_190;
                                                                                                                                                              }
LABEL_188:
                                                                                                                                                              objc_msgSend(*v2, "_changeSocialAccountTypeObsoleteAttributes");
                                                                                                                                                              goto LABEL_189;
                                                                                                                                                            }
LABEL_187:
                                                                                                                                                            objc_msgSend(*v2, "_changeFacebookAndLinkedInAccountsToLegacyAccountTypes");
                                                                                                                                                            goto LABEL_188;
                                                                                                                                                          }
LABEL_186:
                                                                                                                                                          objc_msgSend(*v2, "_addLinkedInLegacyAccountType");
                                                                                                                                                          goto LABEL_187;
                                                                                                                                                        }
LABEL_185:
                                                                                                                                                        objc_msgSend(*v2, "_addiTunesStoreSandboxAccountType");
                                                                                                                                                        goto LABEL_186;
                                                                                                                                                      }
LABEL_184:
                                                                                                                                                      objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB4618]);
                                                                                                                                                      goto LABEL_185;
                                                                                                                                                    }
LABEL_183:
                                                                                                                                                    objc_msgSend(*v2, "_removeMessagesFromAOLSupportedDataclasses");
                                                                                                                                                    goto LABEL_184;
                                                                                                                                                  }
LABEL_182:
                                                                                                                                                  objc_msgSend(*v2, "_addObsoleteAttributeToAccountTypes");
                                                                                                                                                  goto LABEL_183;
                                                                                                                                                }
LABEL_181:
                                                                                                                                                objc_msgSend(*v2, "_addFacebookAndDAVLegacyAccountTypes");
                                                                                                                                                objc_msgSend(*v2, "_changeFacebookAccountToLegacyAccountType");
                                                                                                                                                goto LABEL_182;
                                                                                                                                              }
LABEL_180:
                                                                                                                                              objc_msgSend(*v2, "_removeAIMAccounts");
                                                                                                                                              goto LABEL_181;
                                                                                                                                            }
LABEL_179:
                                                                                                                                            objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB4650]);
                                                                                                                                            goto LABEL_180;
                                                                                                                                          }
LABEL_178:
                                                                                                                                          objc_msgSend(*v2, "_removeMessagesFromGoogleSupportedDataclasses");
                                                                                                                                          goto LABEL_179;
                                                                                                                                        }
LABEL_177:
                                                                                                                                        objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB45C0]);
                                                                                                                                        goto LABEL_178;
                                                                                                                                      }
LABEL_176:
                                                                                                                                      objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB45C8]);
                                                                                                                                      objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB45B0]);
                                                                                                                                      goto LABEL_177;
                                                                                                                                    }
LABEL_175:
                                                                                                                                    objc_msgSend(*v2, "_setCloudKitAllowsMultipleAccounts");
                                                                                                                                    goto LABEL_176;
                                                                                                                                  }
LABEL_174:
                                                                                                                                  objc_msgSend(*v2, "_setYahooAccountsProvisionedDataclassesToSupportedOnes");
                                                                                                                                  goto LABEL_175;
                                                                                                                                }
LABEL_173:
                                                                                                                                objc_msgSend(*v2, "_removeMessengerFromYahooSupportedDataclasses");
                                                                                                                                goto LABEL_174;
                                                                                                                              }
LABEL_172:
                                                                                                                              objc_msgSend(*v2, "_updateMacOSServerAccountDescription");
                                                                                                                              goto LABEL_173;
                                                                                                                            }
LABEL_171:
                                                                                                                            objc_msgSend(*v2, "_addNotesDataclassToAASupportedDataclasses");
                                                                                                                            goto LABEL_172;
                                                                                                                          }
LABEL_170:
                                                                                                                          objc_msgSend(*v2, "_setSupportedDataclassesForAOLAccountType");
                                                                                                                          goto LABEL_171;
                                                                                                                        }
LABEL_169:
                                                                                                                        objc_msgSend(*v2, "_switchHotmailToOAuthAuthentication");
                                                                                                                        goto LABEL_170;
                                                                                                                      }
LABEL_168:
                                                                                                                      objc_msgSend(*v2, "_addSingleSignOnAccountType");
                                                                                                                      objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB4588]);
                                                                                                                      goto LABEL_169;
                                                                                                                    }
LABEL_167:
                                                                                                                    objc_msgSend(*v2, "_addMSOAccountType");
                                                                                                                    goto LABEL_168;
                                                                                                                  }
LABEL_166:
                                                                                                                  objc_msgSend(*v2, "_supportiCloudKeychainSyncDataclass");
                                                                                                                  goto LABEL_167;
                                                                                                                }
LABEL_165:
                                                                                                                objc_msgSend(*v2, "_ensurePresenceOfNewsDataclass");
                                                                                                                goto LABEL_166;
                                                                                                              }
LABEL_164:
                                                                                                              objc_msgSend(*v2, "_supportiCloudNewsDataclass");
                                                                                                              goto LABEL_165;
                                                                                                            }
LABEL_163:
                                                                                                            objc_msgSend(*v2, "_allowMultipleAppleIDAuthenticationAccounts");
                                                                                                            objc_msgSend(*v2, "_makeTudouYoukuSingletons");
                                                                                                            goto LABEL_164;
                                                                                                          }
LABEL_162:
                                                                                                          objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB4638]);
                                                                                                          objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB4658]);
                                                                                                          goto LABEL_163;
                                                                                                        }
LABEL_161:
                                                                                                        objc_msgSend(*v2, "_configureSMTPAccountType");
                                                                                                        goto LABEL_162;
                                                                                                      }
LABEL_160:
                                                                                                      objc_msgSend(*v2, "_updateOSXServerAccountDescription");
                                                                                                      goto LABEL_161;
                                                                                                    }
LABEL_159:
                                                                                                    objc_msgSend(*v2, "_addOnMyDeviceAccountType");
                                                                                                    objc_msgSend(*v2, "_switchYahooToOAuthAuthentication");
                                                                                                    goto LABEL_160;
                                                                                                  }
LABEL_158:
                                                                                                  objc_msgSend(*v2, "_updateAOLAndAddNotificationsDataclass");
                                                                                                  goto LABEL_159;
                                                                                                }
LABEL_157:
                                                                                                objc_msgSend(*v2, "_addIDMSAccountType");
                                                                                                goto LABEL_158;
                                                                                              }
LABEL_156:
                                                                                              objc_msgSend(*v2, "_addDocumentsAndVPNDataclass");
                                                                                              goto LABEL_157;
                                                                                            }
LABEL_155:
                                                                                            objc_msgSend(*v2, "_switchGoogleToOAuthAuthentication");
                                                                                            goto LABEL_156;
                                                                                          }
LABEL_154:
                                                                                          objc_msgSend(*v2, "_addAndConfigureAllOSXAccountTypes");
                                                                                          goto LABEL_155;
                                                                                        }
LABEL_153:
                                                                                        objc_msgSend(*v2, "_removeLiverpoolTypes");
                                                                                        objc_msgSend(*v2, "_addCloudKitDataclasses");
                                                                                        objc_msgSend(*v2, "_setCloudKitCredentialType");
                                                                                        goto LABEL_154;
                                                                                      }
LABEL_152:
                                                                                      objc_msgSend(*v2, "_addAppleIDAuthenticationAccountType");
                                                                                      goto LABEL_153;
                                                                                    }
LABEL_151:
                                                                                    objc_msgSend(*v2, "_addCloudKitAccountType");
                                                                                    objc_msgSend(*v2, "_addAccessKeysAttributeToCloudKitAccountType");
                                                                                    goto LABEL_152;
                                                                                  }
LABEL_150:
                                                                                  objc_msgSend(*v2, "_createLiverpoolDataclasses");
                                                                                  goto LABEL_151;
                                                                                }
LABEL_149:
                                                                                objc_msgSend(*v2, "_setOwningBundleIDForNativeAccountTypes");
                                                                                goto LABEL_150;
                                                                              }
LABEL_148:
                                                                              objc_msgSend(*v2, "_addFMFAccountType");
                                                                              goto LABEL_149;
                                                                            }
LABEL_147:
                                                                            objc_msgSend(*v2, "_addHolidayCalendarAccountType");
                                                                            goto LABEL_148;
                                                                          }
LABEL_146:
                                                                          objc_msgSend(*v2, "_makeTencentWeiboSingleton");
                                                                          goto LABEL_147;
                                                                        }
LABEL_145:
                                                                        objc_msgSend(*v2, "_updateIdentityServicesAccountDescription");
                                                                        goto LABEL_146;
                                                                      }
LABEL_144:
                                                                      objc_msgSend(*v2, "_updateIdentityServicesAccountTypeToSupportAuthenticationAndMultipleAccounts");
                                                                      goto LABEL_145;
                                                                    }
LABEL_143:
                                                                    objc_msgSend(*v2, "_addFindMyiPhoneAccountType");
                                                                    goto LABEL_144;
                                                                  }
LABEL_142:
                                                                  objc_msgSend(*v2, "_addTencentWeiboAccessKeys");
                                                                  objc_msgSend(*v2, "_addAccessKeysAttributeToTencentWeiboAccountType");
                                                                  goto LABEL_143;
                                                                }
LABEL_141:
                                                                objc_msgSend(*v2, "_updateTencentWeiboCredentialTypeToOAuth2");
                                                                goto LABEL_142;
                                                              }
LABEL_140:
                                                              objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB45D8]);
                                                              objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB45A8]);
                                                              goto LABEL_141;
                                                            }
LABEL_139:
                                                            objc_msgSend(*v2, "_addIMAPMailAccountType");
                                                            goto LABEL_140;
                                                          }
LABEL_138:
                                                          objc_msgSend(*v2, "_addIMAPAccountType");
                                                          objc_msgSend(*v2, "_addPOPAccountType");
                                                          goto LABEL_139;
                                                        }
LABEL_137:
                                                        objc_msgSend(*v2, "_addPasswordCredentialTypeToSMTPAccountType");
                                                        objc_msgSend(*v2, "_addPasswordCredentialTypeToGmailAccountType");
                                                        objc_msgSend(*v2, "_addTokenCredentialTypeToYahooAccountType");
                                                        goto LABEL_138;
                                                      }
LABEL_136:
                                                      objc_msgSend(*v2, "_ensureMajorDataclassesExist");
                                                      objc_msgSend(*v2, "_addSubscribedCalendarAccountType");
                                                      objc_msgSend(*v2, "_addBookmarkDAVAccountType");
                                                      objc_msgSend(*v2, "_addExchangeAccountType");
                                                      objc_msgSend(*v2, "_addHotmailAccountType");
                                                      objc_msgSend(*v2, "_addIMAPNotesAccountType");
                                                      objc_msgSend(*v2, "_addLDAPAccountType");
                                                      objc_msgSend(*v2, "_ensureProperAccountTypeDataclasses");
                                                      goto LABEL_137;
                                                    }
LABEL_135:
                                                    objc_msgSend(*v2, "_limitLinkedInToOneAccount");
                                                    goto LABEL_136;
                                                  }
LABEL_134:
                                                  objc_msgSend(*v2, "_addIdentityServicesAccountType");
                                                  goto LABEL_135;
                                                }
LABEL_133:
                                                objc_msgSend(*v2, "_updateVimeoCredentialTypeToOAuth");
                                                goto LABEL_134;
                                              }
LABEL_132:
                                              objc_msgSend(*v2, "_updateFlickrCredentialTypeToOAuth");
                                              goto LABEL_133;
                                            }
LABEL_131:
                                            objc_msgSend(*v2, "_limitFlickrToOneAccount");
                                            objc_msgSend(*v2, "_limitVimeoToOneAccount");
                                            goto LABEL_132;
                                          }
LABEL_130:
                                          objc_msgSend(*v2, "_addLinkedInAccessKeys");
                                          objc_msgSend(*v2, "_addAccessKeysAttributeToLinkedInAccountType");
                                          goto LABEL_131;
                                        }
LABEL_129:
                                        objc_msgSend(*v2, "_addiTunesStoreAccountType");
                                        goto LABEL_130;
                                      }
LABEL_128:
                                      objc_msgSend(*v2, "_addFaceTimeAccountType");
                                      objc_msgSend(*v2, "_addMadridAccountType");
                                      objc_msgSend(*v2, "_addGameCenterAccountType");
                                      goto LABEL_129;
                                    }
LABEL_127:
                                    objc_msgSend(*v2, "_addRemindersDataclassToCalDAVAccountType");
                                    goto LABEL_128;
                                  }
LABEL_126:
                                  objc_msgSend(*v2, "_addSMTPAccountType");
                                  objc_msgSend(*v2, "_addGmailAccountType");
                                  objc_msgSend(*v2, "_addYahooAccountType");
                                  goto LABEL_127;
                                }
LABEL_125:
                                objc_msgSend(*v2, "_addTencentWeiboAccountType");
                                objc_msgSend(*v2, "_upgradeLinkedInAccountType");
                                goto LABEL_126;
                              }
LABEL_124:
                              objc_msgSend(*v2, "_addLiverpoolAccountType");
                              objc_msgSend(*v2, "_addLiverpoolAccessKeys");
                              objc_msgSend(*v2, "_addAccessKeysAttributeToLiverpoolAccountType");
                              goto LABEL_125;
                            }
LABEL_123:
                            objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB4560]);
                            objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB45E0]);
                            objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB4620]);
                            objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB4608]);
                            objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB45A0]);
                            objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB45B8]);
                            objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB45E8]);
                            objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB4640]);
                            objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB4558]);
                            objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB4668]);
                            objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB45D0]);
                            objc_msgSend(*v2, "_addDataclassWithName:", *MEMORY[0x24BDB4648]);
                            objc_msgSend(*v2, "_addAppleAccountType");
                            goto LABEL_124;
                          }
LABEL_122:
                          objc_msgSend(*v2, "_removeFacebookPermissionGroupAccessKey");
                          objc_msgSend(*v2, "_removeFacebookAppVersionAccessKey");
                          objc_msgSend(*v2, "_addFacebookAudienceAccessKey");
                          objc_msgSend(*v2, "_addFacebookAudienceAccessKeyToFacebookAccountType");
                          goto LABEL_123;
                        }
LABEL_121:
                        objc_msgSend(*v2, "_addFacebookAccessKeys");
                        objc_msgSend(*v2, "_addAccessKeysAttributeToFacebookAccountType");
                        goto LABEL_122;
                      }
LABEL_120:
                      objc_msgSend(*v2, "_addYelpAccountType");
                      goto LABEL_121;
                    }
LABEL_119:
                    objc_msgSend(*v2, "_addSupportsMultipleAccountsAttributeToAccountTypes");
                    goto LABEL_120;
                  }
LABEL_118:
                  objc_msgSend(*v2, "_addSyncableDataclassesToCardAndCalDAV");
                  goto LABEL_119;
                }
LABEL_117:
                objc_msgSend(*v2, "_addMissingAccountTypes");
                goto LABEL_118;
              }
LABEL_116:
              objc_msgSend(*v2, "_addSupportsAuthenticationAttributeToAccountTypes");
              objc_msgSend(*v2, "_addSupportsAuthenticationAttributeToAccounts");
              goto LABEL_117;
            }
LABEL_115:
            objc_msgSend(*v2, "_updateWeiboAccountTypeIfNecessary");
            goto LABEL_116;
          }
LABEL_114:
          objc_msgSend(*v2, "_addTudouAccountType");
          objc_msgSend(*v2, "_addYoukuAccountType");
          goto LABEL_115;
        }
LABEL_113:
        objc_msgSend(*v2, "_addContactsCalendarsDataclassesToFB");
        goto LABEL_114;
      }
    }
    objc_msgSend(*v2, "_addWeiboAccountType");
    objc_msgSend(*v2, "_addAppleIDAccountType");
    objc_msgSend(*v2, "_addFlickrAccountType");
    objc_msgSend(*v2, "_addVimeoAccountType");
    objc_msgSend(*v2, "_addLinkedInAccountType");
    goto LABEL_112;
  }
LABEL_13:
  v10 = 0;
LABEL_206:
  v11 = objc_msgSend(*v2, "_ensureAllDataclassesExist");
  v12 = objc_msgSend(*v2, "_ensureAllInternalAccountTypesExist:", v11);
  if ((v11 & 1) != 0 || (v10 & 1) != 0 || v12)
  {
    v13 = (uint64_t)(a1 + 6);
    v14 = *(void **)(a1[4] + 8);
    v15 = *(_QWORD *)(a1[6] + 8);
    obj = *(id *)(v15 + 40);
    v16 = objc_msgSend(v14, "saveWithError:", &obj);
    objc_storeStrong((id *)(v15 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v16;
    if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
    {
      objc_msgSend(*(id *)(a1[4] + 8), "setVersion:", &unk_24C7EF1A0);
      v17 = *(void **)(a1[4] + 8);
      v18 = *(_QWORD *)(a1[6] + 8);
      v24 = *(id *)(v18 + 40);
      v19 = objc_msgSend(v17, "saveWithError:", &v24);
      objc_storeStrong((id *)(v18 + 40), v24);
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v19;
      LODWORD(v18) = *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24);
      _ACDLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if ((_DWORD)v18)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v27 = v22;
          v28 = 2112;
          v29 = &unk_24C7EF1A0;
          _os_log_impl(&dword_20D8CB000, v21, OS_LOG_TYPE_DEFAULT, "\"Updated database from version %@ to %@\", buf, 0x16u);

        }
      }
      else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        __58__ACDDatabaseInitializer_updateDefaultContentIfNecessary___block_invoke_cold_2(v13, v21, v23);
      }
    }
    else
    {
      _ACDLogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        __58__ACDDatabaseInitializer_updateDefaultContentIfNecessary___block_invoke_cold_1(v5, v13, v21);
    }

  }
}

- (id)_resultsForEntityNamed:(id)a3
{
  return -[ACDDatabaseConnection fetchObjectsForEntityNamed:](self->_databaseConnection, "fetchObjectsForEntityNamed:", a3);
}

- (id)_accounts
{
  NSArray *accounts;
  NSArray *v4;
  NSArray *v5;

  accounts = self->_accounts;
  if (!accounts)
  {
    -[ACDDatabaseConnection fetchObjectsForEntityNamed:](self->_databaseConnection, "fetchObjectsForEntityNamed:", CFSTR("Account"));
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_accounts;
    self->_accounts = v4;

    accounts = self->_accounts;
  }
  return accounts;
}

- (id)_accountTypes
{
  NSArray *accountTypes;
  NSArray *v4;
  NSArray *v5;

  accountTypes = self->_accountTypes;
  if (!accountTypes)
  {
    -[ACDDatabaseConnection fetchObjectsForEntityNamed:](self->_databaseConnection, "fetchObjectsForEntityNamed:", CFSTR("AccountType"));
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_accountTypes;
    self->_accountTypes = v4;

    accountTypes = self->_accountTypes;
  }
  return accountTypes;
}

- (id)_dataclasses
{
  NSArray *dataclasses;
  NSArray *v4;
  NSArray *v5;

  dataclasses = self->_dataclasses;
  if (!dataclasses)
  {
    -[ACDDatabaseConnection fetchObjectsForEntityNamed:](self->_databaseConnection, "fetchObjectsForEntityNamed:", CFSTR("Dataclass"));
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_dataclasses;
    self->_dataclasses = v4;

    dataclasses = self->_dataclasses;
  }
  return dataclasses;
}

- (id)_accessKeys
{
  NSArray *accessKeys;
  NSArray *v4;
  NSArray *v5;

  accessKeys = self->_accessKeys;
  if (!accessKeys)
  {
    -[ACDDatabaseConnection fetchObjectsForEntityNamed:](self->_databaseConnection, "fetchObjectsForEntityNamed:", CFSTR("AccessOptionsKey"));
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_accessKeys;
    self->_accessKeys = v4;

    accessKeys = self->_accessKeys;
  }
  return accessKeys;
}

- (id)_dataclassWithName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ACDDatabaseInitializer _dataclasses](self, "_dataclasses", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_accountTypeWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ACDDatabaseInitializer _accountTypes](self, "_accountTypes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_accessKeyWithName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ACDDatabaseInitializer _accessKeys](self, "_accessKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "name");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_addAccountTypeWithIdentifier:(id)a3 displayName:(id)a4 visibility:(int)a5 supportedDataclasses:(id)a6 credentialType:(id)a7 supportsAuthentication:(BOOL)a8 supportsMultipleAccounts:(BOOL)a9
{
  uint64_t v10;

  BYTE1(v10) = a9;
  LOBYTE(v10) = a8;
  return -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", a3, a4, *(_QWORD *)&a5, a6, 0, a7, v10);
}

- (id)_addAccountTypeWithIdentifier:(id)a3 displayName:(id)a4 visibility:(int)a5 supportedDataclasses:(id)a6 syncableDataclasses:(id)a7 credentialType:(id)a8 supportsAuthentication:(BOOL)a9 supportsMultipleAccounts:(BOOL)a10
{
  uint64_t v11;

  LOWORD(v11) = __PAIR16__(a10, a9);
  return -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:credentialProtectionPolicy:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:credentialProtectionPolicy:", a3, a4, *(_QWORD *)&a5, a6, a7, a8, v11, 0);
}

- (id)_addAccountTypeWithIdentifier:(id)a3 displayName:(id)a4 visibility:(int)a5 supportedDataclasses:(id)a6 syncableDataclasses:(id)a7 credentialType:(id)a8 supportsAuthentication:(BOOL)a9 supportsMultipleAccounts:(BOOL)a10 credentialProtectionPolicy:(id)a11
{
  uint64_t v14;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  NSArray *v32;
  NSArray *accountTypes;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v14 = *(_QWORD *)&a5;
  v37 = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a11;
  v22 = a4;
  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", v17);
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    _ACDLogSystem();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v17;
      _os_log_impl(&dword_20D8CB000, v25, OS_LOG_TYPE_DEFAULT, "@\"Attempt to add account type %@ which already exists, will modify to match expected\", buf, 0xCu);
    }

  }
  else
  {
    -[ACDDatabaseConnection insertNewObjectForEntityForName:](self->_databaseConnection, "insertNewObjectForEntityForName:", CFSTR("AccountType"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v24, "setIdentifier:", v17);
  objc_msgSend(v24, "setAccountTypeDescription:", v22);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v14);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setVisibility:", v26);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a9);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setSupportsAuthentication:", v27);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a10);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setSupportsMultipleAccounts:", v28);

  if (v18)
    objc_msgSend(v24, "setSupportedDataclasses:", v18);
  if (v19)
    objc_msgSend(v24, "setSyncableDataclasses:", v19);
  if (v20)
    objc_msgSend(v24, "setCredentialType:", v20);
  if (v21)
  {
    v29 = v24;
    v30 = v21;
  }
  else
  {
    v30 = (id)*MEMORY[0x24BDE8F68];
    v29 = v24;
  }
  objc_msgSend(v29, "setCredentialProtectionPolicy:", v30);
  -[ACDDatabaseConnection fetchObjectsForEntityNamed:](self->_databaseConnection, "fetchObjectsForEntityNamed:", CFSTR("AccountType"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (NSArray *)objc_msgSend(v31, "mutableCopy");
  accountTypes = self->_accountTypes;
  self->_accountTypes = v32;

  return v24;
}

- (void)_addCredentialType:(id)a3 toAccountType:(id)a4 supportsAuthentication:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "setCredentialType:", v8);
      if (v5)
        v12 = MEMORY[0x24BDBD1C8];
      else
        v12 = MEMORY[0x24BDBD1C0];
      objc_msgSend(v11, "setSupportsAuthentication:", v12);
    }
    else
    {
      _ACDLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ACDDatabaseInitializer _addCredentialType:toAccountType:supportsAuthentication:].cold.1();

    }
  }

}

- (void)_addDataclassWithName:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *dataclasses;

  v4 = a3;
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _ACDLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ACDDatabaseInitializer _addDataclassWithName:].cold.1();

  }
  else
  {
    -[ACDDatabaseConnection insertNewObjectForEntityForName:](self->_databaseConnection, "insertNewObjectForEntityForName:", CFSTR("Dataclass"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setName:", v4);
    -[ACDDatabaseConnection fetchObjectsForEntityNamed:](self->_databaseConnection, "fetchObjectsForEntityNamed:", CFSTR("Dataclass"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSArray *)objc_msgSend(v8, "mutableCopy");
    dataclasses = self->_dataclasses;
    self->_dataclasses = v9;

  }
}

- (void)_addAccessKeyWithName:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *accessKeys;

  v4 = a3;
  -[ACDDatabaseInitializer _accessKeyWithName:](self, "_accessKeyWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _ACDLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ACDDatabaseInitializer _addAccessKeyWithName:].cold.1();

  }
  else
  {
    -[ACDDatabaseConnection insertNewObjectForEntityForName:](self->_databaseConnection, "insertNewObjectForEntityForName:", CFSTR("AccessOptionsKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setName:", v4);
    -[ACDDatabaseConnection fetchObjectsForEntityNamed:](self->_databaseConnection, "fetchObjectsForEntityNamed:", CFSTR("AccessOptionsKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (NSArray *)objc_msgSend(v8, "mutableCopy");
    accessKeys = self->_accessKeys;
    self->_accessKeys = v9;

  }
}

- (void)_addTwitterAccountType
{
  id v2;
  uint64_t v3;

  LOBYTE(v3) = 1;
  v2 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4150], CFSTR("Twitter"), 1, 0, *MEMORY[0x24BDB41B8], 1, v3);
}

- (void)_addAppleIDAccountType
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  LOBYTE(v4) = 1;
  v3 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB3FF0], CFSTR("AppleID"), 0, v5, CFSTR("appleid-tokens"), 1, v4);

}

- (void)_addFaceTimeAccountType
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  LOBYTE(v4) = 1;
  v3 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4038], CFSTR("FaceTime"), 0, v5, *MEMORY[0x24BDB41D0], 1, v4);

}

- (void)_addMadridAccountType
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  LOBYTE(v4) = 1;
  v3 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB40E0], CFSTR("Messages"), 0, v5, *MEMORY[0x24BDB41D0], 1, v4);

}

- (void)_addGameCenterAccountType
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  LOBYTE(v4) = 1;
  v3 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4060], CFSTR("Game Center"), 0, v5, *MEMORY[0x24BDB41D0], 1, v4);

}

- (void)_addiTunesStoreAccountType
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  LOBYTE(v4) = 1;
  v3 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4180], CFSTR("iTunes Store"), 0, v5, *MEMORY[0x24BDB41C8], 1, v4);

}

- (void)_addFacebookAccountType
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  v3 = (void *)MEMORY[0x24BDBCF20];
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4598]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4580]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v7) = 0;
  v6 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4040], CFSTR("Facebook"), 1, v8, *MEMORY[0x24BDB41C0], 1, v7);

}

- (void)_addWeiboAccountType
{
  id v2;
  uint64_t v3;

  LOBYTE(v3) = 1;
  v2 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4120], CFSTR("Sina Weibo"), 1, 0, *MEMORY[0x24BDB41B8], 1, v3);
}

- (void)_updateWeiboAccountTypeIfNecessary
{
  void *v2;
  id v3;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", CFSTR("com.apple.weibo"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "setIdentifier:", *MEMORY[0x24BDB4120]);
    objc_msgSend(v3, "setAccountTypeDescription:", CFSTR("Sina Weibo"));
    v2 = v3;
  }

}

- (void)_addCalDAVAccountType
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDBCF20];
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4580]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = 1;
  v5 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4000], CFSTR("CalDAV"), 0, v7, *MEMORY[0x24BDB41C8], 1, v6);

}

- (void)_addCardDAVAccountType
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDBCF20];
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4598]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = 1;
  v5 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4010], CFSTR("CardDAV"), 0, v7, *MEMORY[0x24BDB41C8], 1, v6);

}

- (void)_addFlickrAccountType
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  LOBYTE(v4) = 1;
  v3 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4058], CFSTR("Flickr"), 1, v5, 0, 0, v4);

}

- (void)_addVimeoAccountType
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  LOBYTE(v4) = 1;
  v3 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4158], CFSTR("Vimeo"), 1, v5, 0, 0, v4);

}

- (void)_addLinkedInAccountType
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  LOBYTE(v4) = 1;
  v3 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", CFSTR("com.apple.linkedin"), CFSTR("LinkedIn"), 1, v5, 0, 0, v4);

}

- (void)_addTudouAccountType
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  LOBYTE(v4) = 1;
  v3 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4140], CFSTR("Tudou"), 1, v5, 0, 0, v4);

}

- (void)_addYoukuAccountType
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  LOBYTE(v4) = 1;
  v3 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4178], CFSTR("Youku"), 1, v5, 0, 0, v4);

}

- (void)_addYelpAccountType
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  LOBYTE(v4) = 0;
  v3 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4170], CFSTR("Yelp"), 0, v5, *MEMORY[0x24BDB41B8], 0, v4);

}

- (void)_addAppleAccountType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v15 = objc_alloc(MEMORY[0x24BDBCF20]);
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4598]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4580]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB45E0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4620]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4560]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB45B8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB45E8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4640]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4558]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4668]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB45D0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4648]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "initWithObjects:", v14, v18, v17, v12, v13, v3, v4, v5, v6, v7, v8, v9, 0);

  LOBYTE(v11) = 1;
  v10 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB3FD8], CFSTR("iCloud"), 1, v16, *MEMORY[0x24BDB41D0], 1, v11);

}

- (void)_addLiverpoolAccountType
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  LOBYTE(v4) = 0;
  v3 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", CFSTR("com.apple.account.Liverpool"), CFSTR("Liverpool"), 1, v5, CFSTR("liverpool-tokens"), 1, v4);

}

- (void)_addTencentWeiboAccountType
{
  id v2;
  uint64_t v3;

  LOBYTE(v3) = 1;
  v2 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4138], CFSTR("Tencent Weibo"), 1, 0, *MEMORY[0x24BDB41B8], 1, v3);
}

- (void)_upgradeLinkedInAccountType
{
  uint64_t v2;
  id v3;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", CFSTR("com.apple.linkedin"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCredentialType:", *MEMORY[0x24BDB41B8]);
  v2 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v3, "setSupportsAuthentication:", MEMORY[0x24BDBD1C8]);
  objc_msgSend(v3, "setSupportsMultipleAccounts:", v2);

}

- (void)_addContactsCalendarsDataclassesToFB
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDBCF20];
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4598]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4580]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4040]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSupportedDataclasses:", v7);

}

- (void)_addSupportsAuthenticationAttributeToAccountTypes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[ACDDatabaseInitializer _accountTypes](self, "_accountTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v26;
    v6 = *MEMORY[0x24BDB3FF0];
    v23 = *MEMORY[0x24BDB4150];
    v24 = *MEMORY[0x24BDB4040];
    v20 = *MEMORY[0x24BDB4120];
    v18 = *MEMORY[0x24BDB4000];
    v16 = *MEMORY[0x24BDB4010];
    v21 = v2;
    v22 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v8, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isEqual:", v6) & 1) != 0)
        {
          v10 = 1;
        }
        else
        {
          v11 = v6;
          objc_msgSend(v8, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v12, "isEqual:", v24) & 1) != 0)
          {
            v10 = 1;
          }
          else
          {
            objc_msgSend(v8, "identifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v13, "isEqual:", v23) & 1) != 0)
            {
              v10 = 1;
            }
            else
            {
              objc_msgSend(v8, "identifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v14, "isEqual:", v20) & 1) != 0)
              {
                v10 = 1;
              }
              else
              {
                objc_msgSend(v8, "identifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v19, "isEqual:", v18) & 1) != 0)
                {
                  v10 = 1;
                }
                else
                {
                  objc_msgSend(v8, "identifier");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  v10 = objc_msgSend(v17, "isEqual:", v16);

                }
              }

              v2 = v21;
            }

            v5 = v22;
          }

          v6 = v11;
        }

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setSupportsAuthentication:", v15);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v4);
  }

}

- (void)_addSupportsAuthenticationAttributeToAccounts
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ACDDatabaseInitializer _accounts](self, "_accounts", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    v6 = *MEMORY[0x24BDB4000];
    v7 = *MEMORY[0x24BDB4010];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "accountType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isEqual:", v6) & 1) != 0 || objc_msgSend(v11, "isEqual:", v7))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
          v12 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v10, "supportsAuthentication");
          v12 = objc_claimAutoreleasedReturnValue();
        }
        v13 = (void *)v12;
        objc_msgSend(v9, "setSupportsAuthentication:", v12);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

- (void)_addMissingAccountTypes
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ACDDatabaseInitializer _accountTypes](self, "_accountTypes", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  if ((objc_msgSend(v3, "containsObject:", *MEMORY[0x24BDB4150]) & 1) == 0)
    -[ACDDatabaseInitializer _addTwitterAccountType](self, "_addTwitterAccountType");
  if ((objc_msgSend(v3, "containsObject:", *MEMORY[0x24BDB4120]) & 1) == 0)
    -[ACDDatabaseInitializer _addWeiboAccountType](self, "_addWeiboAccountType");
  if ((objc_msgSend(v3, "containsObject:", *MEMORY[0x24BDB3FF0]) & 1) == 0)
    -[ACDDatabaseInitializer _addAppleIDAccountType](self, "_addAppleIDAccountType");
  if ((objc_msgSend(v3, "containsObject:", *MEMORY[0x24BDB4058]) & 1) == 0)
    -[ACDDatabaseInitializer _addFlickrAccountType](self, "_addFlickrAccountType");
  if ((objc_msgSend(v3, "containsObject:", *MEMORY[0x24BDB4158]) & 1) == 0)
    -[ACDDatabaseInitializer _addVimeoAccountType](self, "_addVimeoAccountType");
  if ((objc_msgSend(v3, "containsObject:", CFSTR("com.apple.linkedin")) & 1) == 0)
    -[ACDDatabaseInitializer _addLinkedInAccountType](self, "_addLinkedInAccountType");
  if ((objc_msgSend(v3, "containsObject:", *MEMORY[0x24BDB4040]) & 1) == 0)
    -[ACDDatabaseInitializer _addFacebookAccountType](self, "_addFacebookAccountType");
  if ((objc_msgSend(v3, "containsObject:", *MEMORY[0x24BDB4000]) & 1) == 0)
    -[ACDDatabaseInitializer _addCalDAVAccountType](self, "_addCalDAVAccountType");
  if ((objc_msgSend(v3, "containsObject:", *MEMORY[0x24BDB4010]) & 1) == 0)
    -[ACDDatabaseInitializer _addCardDAVAccountType](self, "_addCardDAVAccountType");
  if ((objc_msgSend(v3, "containsObject:", *MEMORY[0x24BDB4140]) & 1) == 0)
    -[ACDDatabaseInitializer _addTudouAccountType](self, "_addTudouAccountType");
  if ((objc_msgSend(v3, "containsObject:", *MEMORY[0x24BDB4178]) & 1) == 0)
    -[ACDDatabaseInitializer _addYoukuAccountType](self, "_addYoukuAccountType");

}

- (void)_addSyncableDataclassesToCardAndCalDAV
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4010]);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v3 = (void *)MEMORY[0x24BDBCF20];
    -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4598]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithObjects:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setSyncableDataclasses:", v5);
  }
  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4000]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDBCF20];
    -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4580]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithObjects:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setSyncableDataclasses:", v9);
  }

}

- (void)_addSupportsMultipleAccountsAttributeToAccountTypes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ACDDatabaseInitializer _accountTypes](self, "_accountTypes", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    v6 = *MEMORY[0x24BDB4040];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqual:", v6);

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10 ^ 1u);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setSupportsMultipleAccounts:", v11);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

- (void)_addFacebookAccessKeys
{
  -[ACDDatabaseInitializer _addAccessKeyWithName:](self, "_addAccessKeyWithName:", *MEMORY[0x24BDB4210]);
  -[ACDDatabaseInitializer _addAccessKeyWithName:](self, "_addAccessKeyWithName:", *MEMORY[0x24BDB4220]);
}

- (void)_addLiverpoolAccessKeys
{
  -[ACDDatabaseInitializer _addAccessKeyWithName:](self, "_addAccessKeyWithName:", *MEMORY[0x24BDB4268]);
}

- (void)_addAccessKeysAttributeToFacebookAccountType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  -[ACDDatabaseInitializer _accessKeyWithName:](self, "_accessKeyWithName:", *MEMORY[0x24BDB4210]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  -[ACDDatabaseInitializer _accessKeyWithName:](self, "_accessKeyWithName:", *MEMORY[0x24BDB4220]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4040]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessKeys:", v7);

}

- (void)_addAccessKeysAttributeToLiverpoolAccountType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[ACDDatabaseInitializer _accessKeyWithName:](self, "_accessKeyWithName:", *MEMORY[0x24BDB4268]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", CFSTR("com.apple.account.Liverpool"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessKeys:", v6);

}

- (void)_removeFacebookPermissionGroupAccessKey
{
  void *v3;
  void *v4;

  -[ACDDatabaseInitializer _accessKeyWithName:](self, "_accessKeyWithName:", CFSTR("ACFacebookPermissionGroupKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[ACDDatabaseConnection deleteObject:](self->_databaseConnection, "deleteObject:", v3);
    v3 = v4;
  }

}

- (void)_removeFacebookAppVersionAccessKey
{
  void *v3;
  void *v4;

  -[ACDDatabaseInitializer _accessKeyWithName:](self, "_accessKeyWithName:", CFSTR("ACFacebookAppVersionKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[ACDDatabaseConnection deleteObject:](self->_databaseConnection, "deleteObject:", v3);
    v3 = v4;
  }

}

- (void)_addFacebookAudienceAccessKey
{
  -[ACDDatabaseInitializer _addAccessKeyWithName:](self, "_addAccessKeyWithName:", *MEMORY[0x24BDB4218]);
}

- (void)_addFacebookAudienceAccessKeyToFacebookAccountType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  -[ACDDatabaseInitializer _accessKeyWithName:](self, "_accessKeyWithName:", *MEMORY[0x24BDB4210]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _accessKeyWithName:](self, "_accessKeyWithName:", *MEMORY[0x24BDB4220], v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  -[ACDDatabaseInitializer _accessKeyWithName:](self, "_accessKeyWithName:", *MEMORY[0x24BDB4218]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4040]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessKeys:", v8);

}

- (void)_addSMTPAccountType
{
  id v2;
  uint64_t v3;

  LOBYTE(v3) = 1;
  v2 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4118], CFSTR("SMTP"), 0, 0, 0, 0, v3);
}

- (void)_addGmailAccountType
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  v3 = objc_alloc(MEMORY[0x24BDBCF20]);
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB45E0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4598]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4580]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4608]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "initWithObjects:", v4, v5, v6, v7, 0);

  LOBYTE(v9) = 1;
  v8 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4068], CFSTR("Gmail"), 0, v10, 0, 0, v9);

}

- (void)_addYahooAccountType
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;

  v3 = objc_alloc(MEMORY[0x24BDBCF20]);
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB45E0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4598]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4620]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4580]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4608]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "initWithObjects:", v4, v5, v6, v7, v8, 0);

  LOBYTE(v10) = 1;
  v9 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4160], CFSTR("Yahoo"), 0, v11, 0, 0, v10);

}

- (void)_addRemindersDataclassToCalDAVAccountType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4000]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v3 = (void *)MEMORY[0x24BDBCF20];
    -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4580]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4620]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithObjects:", v4, v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setSyncableDataclasses:", v6);
    objc_msgSend(v7, "setSupportedDataclasses:", v6);

  }
}

- (void)_addLinkedInAccessKeys
{
  -[ACDDatabaseInitializer _addAccessKeyWithName:](self, "_addAccessKeyWithName:", CFSTR("ACLinkedInAppIdKey"));
  -[ACDDatabaseInitializer _addAccessKeyWithName:](self, "_addAccessKeyWithName:", CFSTR("ACLinkedInPermissionsKey"));
}

- (void)_addAccessKeysAttributeToLinkedInAccountType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  -[ACDDatabaseInitializer _accessKeyWithName:](self, "_accessKeyWithName:", CFSTR("ACLinkedInAppIdKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  -[ACDDatabaseInitializer _accessKeyWithName:](self, "_accessKeyWithName:", CFSTR("ACLinkedInPermissionsKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", CFSTR("com.apple.linkedin"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessKeys:", v7);

}

- (void)_limitFlickrToOneAccount
{
  id v2;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4058]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSupportsMultipleAccounts:", MEMORY[0x24BDBD1C0]);

}

- (void)_limitVimeoToOneAccount
{
  id v2;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4158]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSupportsMultipleAccounts:", MEMORY[0x24BDBD1C0]);

}

- (void)_updateFlickrCredentialTypeToOAuth
{
  id v2;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4058]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSupportsAuthentication:", MEMORY[0x24BDBD1C8]);
  objc_msgSend(v2, "setCredentialType:", *MEMORY[0x24BDB41B8]);

}

- (void)_updateVimeoCredentialTypeToOAuth
{
  id v2;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4158]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSupportsAuthentication:", MEMORY[0x24BDBD1C8]);
  objc_msgSend(v2, "setCredentialType:", *MEMORY[0x24BDB41B8]);

}

- (void)_addSubscribedCalendarAccountType
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDBCF20];
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4580]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = 1;
  v5 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4130], CFSTR("SubscribedCalendar"), 0, v7, *MEMORY[0x24BDB41C8], 1, v6);

}

- (void)_addBookmarkDAVAccountType
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDBCF20];
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4560]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = 1;
  v5 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB3FF8], CFSTR("BookmarkDAV"), 0, v7, *MEMORY[0x24BDB41C8], 1, v6);

}

- (void)_addExchangeAccountType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;

  v3 = (void *)MEMORY[0x24BDBCF20];
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB45E0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4598]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4580]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4620]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4608]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = 1;
  v9 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4030], CFSTR("Exchange"), 0, v11, *MEMORY[0x24BDB41C8], 1, v10);

}

- (void)_addIMAPNotesAccountType
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDBCF20];
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4608]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = 1;
  v5 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4098], CFSTR("IMAPNotes"), 0, v7, *MEMORY[0x24BDB41C8], 1, v6);

}

- (void)_addLDAPAccountType
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDBCF20];
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB45A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = 1;
  v5 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB40C0], CFSTR("LDAP"), 0, v7, *MEMORY[0x24BDB41C8], 1, v6);

}

- (void)_addHotmailAccountType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;

  v3 = (void *)MEMORY[0x24BDBCF20];
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB45E0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4598]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4580]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4620]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4608]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, v8, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = 1;
  v9 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4078], CFSTR("Hotmail"), 0, v11, *MEMORY[0x24BDB41C8], 1, v10);

}

- (void)_ensureAccountTypeWithIdentifier:(id)a3 supportsDataclasses:(id)a4 syncsDataclasses:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v34;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(v12);
        -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v16));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v14);
  }

  v18 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v19 = v9;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v30;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v30 != v22)
          objc_enumerationMutation(v19);
        -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v23), (_QWORD)v29);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v21);
  }

  objc_msgSend(v10, "supportedDataclasses");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEqualToSet:", v11);

  if ((v26 & 1) == 0)
    objc_msgSend(v10, "setSupportedDataclasses:", v11);
  objc_msgSend(v10, "syncableDataclasses", (_QWORD)v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isEqualToSet:", v18);

  if ((v28 & 1) == 0)
    objc_msgSend(v10, "setSyncableDataclasses:", v18);

}

- (void)_ensureMajorDataclassesExist
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[7];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = *MEMORY[0x24BDB4608];
  v17[0] = *MEMORY[0x24BDB45E0];
  v17[1] = v3;
  v4 = *MEMORY[0x24BDB4580];
  v17[2] = *MEMORY[0x24BDB4598];
  v17[3] = v4;
  v5 = *MEMORY[0x24BDB45A0];
  v17[4] = *MEMORY[0x24BDB4620];
  v17[5] = v5;
  v17[6] = *MEMORY[0x24BDB4560];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 7, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
          -[ACDDatabaseInitializer _addDataclassWithName:](self, "_addDataclassWithName:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v8);
  }

}

- (void)_ensureProperAccountTypeDataclasses
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[5];
  uint64_t v46;
  _QWORD v47[4];
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD v52[6];
  _QWORD v53[6];
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[4];

  v62[2] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDB4040];
  v5 = *MEMORY[0x24BDB4580];
  v62[0] = *MEMORY[0x24BDB4598];
  v4 = v62[0];
  v62[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:](self, "_ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:", v3, v6, 0);

  v7 = *MEMORY[0x24BDB4130];
  v61 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v61, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v60, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:](self, "_ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:", v7, v8, v9);

  v10 = *MEMORY[0x24BDB4000];
  v11 = *MEMORY[0x24BDB4620];
  v59[0] = v5;
  v59[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v5;
  v58[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:](self, "_ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:", v10, v12, v13);

  v14 = *MEMORY[0x24BDB4010];
  v15 = *MEMORY[0x24BDB45A0];
  v57[0] = v4;
  v57[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v4;
  v56[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:](self, "_ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:", v14, v16, v17);

  v18 = *MEMORY[0x24BDB3FF8];
  v55 = *MEMORY[0x24BDB4560];
  v19 = v55;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v55, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v54, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:](self, "_ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:", v18, v20, v21);

  v22 = *MEMORY[0x24BDB4030];
  v24 = *MEMORY[0x24BDB4608];
  v53[0] = *MEMORY[0x24BDB45E0];
  v23 = v53[0];
  v53[1] = v24;
  v53[2] = v4;
  v53[3] = v5;
  v53[4] = v11;
  v53[5] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v23;
  v52[1] = v24;
  v52[2] = v4;
  v52[3] = v5;
  v52[4] = v11;
  v52[5] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:](self, "_ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:", v22, v25, v26);

  v27 = *MEMORY[0x24BDB4078];
  v51[0] = v23;
  v51[1] = v4;
  v51[2] = v5;
  v51[3] = v11;
  v51[4] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v23;
  v50[1] = v4;
  v50[2] = v5;
  v50[3] = v11;
  v50[4] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 5);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:](self, "_ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:", v27, v28, v29);

  v30 = *MEMORY[0x24BDB40C0];
  v49 = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v49, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v48, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:](self, "_ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:", v30, v31, v32);

  v33 = *MEMORY[0x24BDB4068];
  v47[0] = v23;
  v47[1] = v24;
  v47[2] = v4;
  v47[3] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v46, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:](self, "_ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:", v33, v34, v35);

  v36 = *MEMORY[0x24BDB4160];
  v45[0] = v23;
  v45[1] = v24;
  v45[2] = v4;
  v45[3] = v5;
  v45[4] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v45, 5);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v44, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:](self, "_ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:", v36, v37, v38);

  v39 = *MEMORY[0x24BDB4098];
  v43 = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v43, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v24;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v42, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:](self, "_ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:", v39, v40, v41);

}

- (void)_addPasswordCredentialTypeToSMTPAccountType
{
  -[ACDDatabaseInitializer _addCredentialType:toAccountType:supportsAuthentication:](self, "_addCredentialType:toAccountType:supportsAuthentication:", *MEMORY[0x24BDB41C8], *MEMORY[0x24BDB4118], 0);
}

- (void)_addPasswordCredentialTypeToGmailAccountType
{
  -[ACDDatabaseInitializer _addCredentialType:toAccountType:supportsAuthentication:](self, "_addCredentialType:toAccountType:supportsAuthentication:", *MEMORY[0x24BDB41C8], *MEMORY[0x24BDB4068], 1);
}

- (void)_addTokenCredentialTypeToYahooAccountType
{
  -[ACDDatabaseInitializer _addCredentialType:toAccountType:supportsAuthentication:](self, "_addCredentialType:toAccountType:supportsAuthentication:", *MEMORY[0x24BDB41D8], *MEMORY[0x24BDB4160], 1);
}

- (id)_modernIMAPSupportedDataclasses
{
  uint64_t v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDB4608];
  v4[0] = *MEMORY[0x24BDB45E0];
  v4[1] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_modernIMAPSyncableDataclasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BDB45E0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_addIMAPAccountType
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  -[ACDDatabaseInitializer _modernIMAPSupportedDataclasses](self, "_modernIMAPSupportedDataclasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _managedDataclassesSetForNames:](self, "_managedDataclassesSetForNames:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[ACDDatabaseInitializer _modernIMAPSyncableDataclasses](self, "_modernIMAPSyncableDataclasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _managedDataclassesSetForNames:](self, "_managedDataclassesSetForNames:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v7) = 257;
  v6 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4088], CFSTR("IMAP"), 0, v8, v5, *MEMORY[0x24BDB41C8], v7);

}

- (id)_modernPOPSupportedAndSyncableDataclasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BDB45E0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_addPOPAccountType
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  -[ACDDatabaseInitializer _modernPOPSupportedAndSyncableDataclasses](self, "_modernPOPSupportedAndSyncableDataclasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _managedDataclassesSetForNames:](self, "_managedDataclassesSetForNames:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[ACDDatabaseInitializer _modernPOPSupportedAndSyncableDataclasses](self, "_modernPOPSupportedAndSyncableDataclasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _managedDataclassesSetForNames:](self, "_managedDataclassesSetForNames:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v7) = 257;
  v6 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB40F8], CFSTR("POP"), 0, v8, v5, *MEMORY[0x24BDB41C8], v7);

}

- (id)_modernIMAPMailSupportedAndSyncableDataclasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BDB45E0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_addIMAPMailAccountType
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  -[ACDDatabaseInitializer _modernIMAPMailSupportedAndSyncableDataclasses](self, "_modernIMAPMailSupportedAndSyncableDataclasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _managedDataclassesSetForNames:](self, "_managedDataclassesSetForNames:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[ACDDatabaseInitializer _modernIMAPMailSupportedAndSyncableDataclasses](self, "_modernIMAPMailSupportedAndSyncableDataclasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _managedDataclassesSetForNames:](self, "_managedDataclassesSetForNames:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v7) = 257;
  v6 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4090], CFSTR("IMAPMail"), 0, v8, v5, *MEMORY[0x24BDB41C8], v7);

}

- (void)_addIdentityServicesAccountType
{
  id v2;
  uint64_t v3;

  LOBYTE(v3) = 1;
  v2 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB40A0], CFSTR("Messages"), 0, 0, *MEMORY[0x24BDB41D0], 1, v3);
}

- (void)_limitLinkedInToOneAccount
{
  id v2;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", CFSTR("com.apple.linkedin"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSupportsMultipleAccounts:", MEMORY[0x24BDBD1C0]);

}

- (void)_updateTencentWeiboCredentialTypeToOAuth2
{
  id v2;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4138]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCredentialType:", *MEMORY[0x24BDB41C0]);

}

- (id)_modernDeviceLocatiorSupportedDataclasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BDB45B8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_addFindMyiPhoneAccountType
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;

  v3 = *MEMORY[0x24BDB4028];
  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4028]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[ACDDatabaseInitializer _modernDeviceLocatiorSupportedDataclasses](self, "_modernDeviceLocatiorSupportedDataclasses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACDDatabaseInitializer _managedDataclassesSetForNames:](self, "_managedDataclassesSetForNames:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    LOWORD(v8) = 0;
    v7 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:credentialProtectionPolicy:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:credentialProtectionPolicy:", v3, CFSTR("Device Locator"), 0, v6, 0, *MEMORY[0x24BDB41D0], v8, *MEMORY[0x24BDE8F80]);

    v4 = 0;
  }

}

- (void)_addTencentWeiboAccessKeys
{
  -[ACDDatabaseInitializer _addAccessKeyWithName:](self, "_addAccessKeyWithName:", *MEMORY[0x24BDB4370]);
}

- (void)_addAccessKeysAttributeToTencentWeiboAccountType
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4138]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  -[ACDDatabaseInitializer _accessKeyWithName:](self, "_accessKeyWithName:", *MEMORY[0x24BDB4370]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessKeys:", v5);

}

- (void)_updateIdentityServicesAccountTypeToSupportAuthenticationAndMultipleAccounts
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDB40A0];
  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB40A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v4, "setSupportsAuthentication:", MEMORY[0x24BDBD1C8]);
  v15 = v4;
  objc_msgSend(v4, "setSupportsMultipleAccounts:", v5);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[ACDDatabaseInitializer _accounts](self, "_accounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "accountType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "isEqual:", v3))
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setSupportsAuthentication:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

- (void)_updateIdentityServicesAccountDescription
{
  id v2;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB40A0]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccountTypeDescription:", CFSTR("Messages"));

}

- (void)_updateOSXServerAccountDescription
{
  id v2;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB40E8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccountTypeDescription:", CFSTR("OS X Server"));

}

- (void)_updateMacOSServerAccountDescription
{
  id v2;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB40E8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccountTypeDescription:", CFSTR("macOS Server"));

}

- (void)_makeTencentWeiboSingleton
{
  id v2;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4138]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSupportsMultipleAccounts:", MEMORY[0x24BDBD1C0]);

}

- (id)_modernHolidayCalendarSupportedAndSyncableDataclasses
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = *MEMORY[0x24BDB4580];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_addHolidayCalendarAccountType
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  -[ACDDatabaseInitializer _modernHolidayCalendarSupportedAndSyncableDataclasses](self, "_modernHolidayCalendarSupportedAndSyncableDataclasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _managedDataclassesSetForNames:](self, "_managedDataclassesSetForNames:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  LOWORD(v5) = 0;
  v4 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:credentialProtectionPolicy:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:credentialProtectionPolicy:", *MEMORY[0x24BDB4070], CFSTR("Holiday Calendar"), 0, v6, v6, *MEMORY[0x24BDB41C8], v5, *MEMORY[0x24BDE8F80]);

}

- (void)_addFMFAccountType
{
  id v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = 0;
  v3 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4050], CFSTR("Find My Friends"), 0, v5, *MEMORY[0x24BDB41D0], 0, v4);

}

- (void)_addAppleIDAuthenticationAccountType
{
  id v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = 0;
  v3 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB3FE8], CFSTR("Apple ID"), 0, v5, *MEMORY[0x24BDB41B0], 1, v4);

}

- (void)_setOwningBundleIDForNativeAccountTypes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[ACDDatabaseInitializer _accountTypes](self, "_accountTypes", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(v7, "owningBundleID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
          objc_msgSend(v7, "setOwningBundleID:", CFSTR("com.apple.accountsd"));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)_createLiverpoolDataclasses
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB3FD8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedDataclasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(&unk_24C7EF2B0, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(&unk_24C7EF2B0);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
          -[ACDDatabaseInitializer _addDataclassWithName:](self, "_addDataclassWithName:", v10);
        -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "addObject:", v12);

      }
      v7 = objc_msgSend(&unk_24C7EF2B0, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  objc_msgSend(v3, "setSupportedDataclasses:", v5);

}

- (void)_addCloudKitAccountType
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  LOBYTE(v4) = 0;
  v3 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4020], CFSTR("CloudKit"), 0, v5, *MEMORY[0x24BDB41D0], 1, v4);

}

- (void)_addAccessKeysAttributeToCloudKitAccountType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[ACDDatabaseInitializer _accessKeyWithName:](self, "_accessKeyWithName:", *MEMORY[0x24BDB4268]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4020]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessKeys:", v6);

}

- (void)_removeLiverpoolTypes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", CFSTR("com.apple.account.Liverpool"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[ACDDatabaseConnection deleteObject:](self->_databaseConnection, "deleteObject:", v3);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = objc_msgSend(&unk_24C7EF2C8, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(&unk_24C7EF2C8);
        -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          -[ACDDatabaseConnection deleteObject:](self->_databaseConnection, "deleteObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(&unk_24C7EF2C8, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_addCloudKitDataclasses
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[3];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = *MEMORY[0x24BDB4570];
  v22[0] = *MEMORY[0x24BDB4568];
  v22[1] = v4;
  v22[2] = *MEMORY[0x24BDB4578];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
          -[ACDDatabaseInitializer _addDataclassWithName:](self, "_addDataclassWithName:", v10);
        -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v3, "addObject:", v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v7);
  }

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB3FD8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "supportedDataclasses");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  objc_msgSend(v3, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v16);

  objc_msgSend(v13, "setSupportedDataclasses:", v15);
  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4020]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSupportedDataclasses:", v3);
  objc_msgSend(v17, "setSyncableDataclasses:", v3);

}

- (void)_setCloudKitCredentialType
{
  id v2;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4020]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCredentialType:", *MEMORY[0x24BDB41D0]);

}

- (void)_add126AccountType
{
  id v2;
  uint64_t v3;

  LOBYTE(v3) = 1;
  v2 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB3FB8], CFSTR("126"), 0, 0, *MEMORY[0x24BDB41C8], 0, v3);
}

- (void)_add163AccountType
{
  id v2;
  uint64_t v3;

  LOBYTE(v3) = 1;
  v2 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB3FC0], CFSTR("163"), 0, 0, *MEMORY[0x24BDB41C8], 0, v3);
}

- (void)_addAOLAccountType
{
  id v2;
  uint64_t v3;

  LOBYTE(v3) = 1;
  v2 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB3FD0], CFSTR("Aol"), 0, 0, *MEMORY[0x24BDB41C8], 0, v3);
}

- (void)_addQQAccountType
{
  id v2;
  uint64_t v3;

  LOBYTE(v3) = 1;
  v2 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4108], CFSTR("QQ"), 0, 0, *MEMORY[0x24BDB41C8], 0, v3);
}

- (void)_addJabberAccountType
{
  id v2;
  uint64_t v3;

  LOBYTE(v3) = 1;
  v2 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB40A8], CFSTR("Jabber"), 0, 0, *MEMORY[0x24BDB41C8], 0, v3);
}

- (void)_addYahooIMAccountType
{
  id v2;
  uint64_t v3;

  LOBYTE(v3) = 1;
  v2 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4168], CFSTR("Yahoo IM"), 0, 0, *MEMORY[0x24BDB41C8], 0, v3);
}

- (void)_addAIMAccountType
{
  id v2;
  uint64_t v3;

  LOBYTE(v3) = 1;
  v2 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB3FC8], CFSTR("AIM"), 0, 0, *MEMORY[0x24BDB41C8], 0, v3);
}

- (void)_addOSXServerAccountType
{
  id v2;
  uint64_t v3;

  LOBYTE(v3) = 1;
  v2 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB40E8], CFSTR("OSX Server"), 0, 0, *MEMORY[0x24BDB41C8], 0, v3);
}

- (void)_addAndConfigureAllOSXAccountTypes
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"Adding OS X account types...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_switchGoogleToOAuthAuthentication
{
  id v2;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4068]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCredentialType:", *MEMORY[0x24BDB41C0]);

}

- (void)_switchHotmailToOAuthAuthentication
{
  id v2;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4078]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCredentialType:", *MEMORY[0x24BDB41C0]);

}

- (void)_switchYahooToPasswordAuthentication
{
  id v2;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4160]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCredentialType:", *MEMORY[0x24BDB41C8]);

}

- (void)_addDocumentsAndVPNDataclass
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[7];
  _QWORD v14[2];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDB45F8];
  -[ACDDatabaseInitializer _addDataclassWithName:](self, "_addDataclassWithName:", *MEMORY[0x24BDB45F8]);
  v4 = *MEMORY[0x24BDB4628];
  -[ACDDatabaseInitializer _addDataclassWithName:](self, "_addDataclassWithName:", *MEMORY[0x24BDB4628]);
  v12 = *MEMORY[0x24BDB40E8];
  v6 = *MEMORY[0x24BDB4620];
  v14[0] = *MEMORY[0x24BDB4580];
  v5 = v14[0];
  v14[1] = v6;
  v8 = *MEMORY[0x24BDB45E0];
  v15 = *MEMORY[0x24BDB4608];
  v7 = v15;
  v16 = v8;
  v17 = *MEMORY[0x24BDB4598];
  v9 = v17;
  v18 = v3;
  v19 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = v6;
  v13[2] = v7;
  v13[3] = v8;
  v13[4] = v9;
  v13[5] = v3;
  v13[6] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:](self, "_ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:", v12, v10, v11);

}

- (void)_addIDMSAccountType
{
  id v2;
  uint64_t v3;

  LOBYTE(v3) = 1;
  v2 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4080], CFSTR("IDMS"), 0, 0, *MEMORY[0x24BDB41D0], 0, v3);
}

- (void)_addMSOAccountType
{
  id v2;
  uint64_t v3;

  LOBYTE(v3) = 1;
  v2 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB40D8], CFSTR("MSO"), 1, 0, *MEMORY[0x24BDB41D0], 1, v3);
}

- (void)_addSingleSignOnAccountType
{
  id v2;
  uint64_t v3;

  LOBYTE(v3) = 1;
  v2 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4128], CFSTR("Single Sign-on"), 1, 0, *MEMORY[0x24BDB41C8], 1, v3);
}

- (void)_updateAOLAndAddNotificationsDataclass
{
  -[ACDDatabaseInitializer _addDataclassWithName:](self, "_addDataclassWithName:", *MEMORY[0x24BDB4610]);
}

- (id)_modernOnMyDeviceSupportedDataclasses
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDB4598];
  v5[0] = *MEMORY[0x24BDB45E0];
  v5[1] = v2;
  v3 = *MEMORY[0x24BDB4580];
  v5[2] = *MEMORY[0x24BDB4608];
  v5[3] = v3;
  v5[4] = *MEMORY[0x24BDB4620];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_addOnMyDeviceAccountType
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  v3 = *MEMORY[0x24BDB40F0];
  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB40F0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[ACDDatabaseInitializer _modernOnMyDeviceSupportedDataclasses](self, "_modernOnMyDeviceSupportedDataclasses");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[ACDDatabaseInitializer _managedDataclassesSetForNames:](self, "_managedDataclassesSetForNames:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = 0;
    v6 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", v3, CFSTR("On My Device"), 0, v5, 0, 0, v7);

  }
}

- (void)_switchYahooToOAuthAuthentication
{
  id v2;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4160]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCredentialType:", *MEMORY[0x24BDB41C0]);

}

- (void)_configureSMTPAccountType
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4118]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSupportsAuthentication:", MEMORY[0x24BDBD1C8]);
  v3 = (void *)MEMORY[0x24BDBCF20];
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB45E0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSupportedDataclasses:", v5);

}

- (void)_allowMultipleAppleIDAuthenticationAccounts
{
  id v2;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB3FE8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSupportsMultipleAccounts:", MEMORY[0x24BDBD1C8]);

}

- (void)_makeTudouYoukuSingletons
{
  uint64_t v3;
  void *v4;
  id v5;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4140]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDBD1C0];
  objc_msgSend(v5, "setSupportsMultipleAccounts:", MEMORY[0x24BDBD1C0]);
  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4178]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSupportsMultipleAccounts:", v3);

}

- (void)_supportiCloudNewsDataclass
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, v0, v1, "\"Missing kAccountDataclassNews!\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_ensurePresenceOfNewsDataclass
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"kAccountDataclassNews is already present.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_supportiCloudKeychainSyncDataclass
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, v0, v1, "\"Unable to get kAccountDataclassKeychainSync!\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_setSupportedDataclassesForAOLAccountType
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, v0, v1, "\"Missing kAccountDataclassMail!\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_addNotesDataclassToAASupportedDataclasses
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, v0, v1, "\"Missing account type with ID: ACAccountTypeIdentifierAppleAccount\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_removeMessengerFromYahooSupportedDataclasses
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4160]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v2, "supportedDataclasses", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    v7 = *MEMORY[0x24BDB45F0];
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v6)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
      objc_msgSend(v9, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", v7);

      if ((v11 & 1) != 0)
        break;
      if (v5 == ++v8)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v12 = v9;

    if (!v12)
      goto LABEL_13;
    objc_msgSend(v2, "supportedDataclasses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    objc_msgSend(v14, "removeObject:", v12);
    objc_msgSend(v2, "setSupportedDataclasses:", v14);

    v3 = v12;
  }
LABEL_12:

LABEL_13:
}

- (void)_setYahooAccountsProvisionedDataclassesToSupportedOnes
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ACDDatabaseInitializer _accounts](self, "_accounts", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    v6 = *MEMORY[0x24BDB4160];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "accountType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "isEqual:", v6))
        {
          objc_msgSend(v8, "accountType");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "supportedDataclasses");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setProvisionedDataclasses:", v12);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

- (void)_setCloudKitAllowsMultipleAccounts
{
  id v2;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4020]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSupportsMultipleAccounts:", MEMORY[0x24BDBD1C8]);

}

- (void)_removeMessagesFromGoogleSupportedDataclasses
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDB4068];
  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB4068]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "supportedDataclasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v35;
    v8 = *MEMORY[0x24BDB45F0];
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v7)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v9);
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v8);

      if ((v12 & 1) != 0)
        break;
      if (v6 == ++v9)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v13 = v10;

    if (!v13)
    {
      v27 = 0;
      goto LABEL_16;
    }
    _ACLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D8CB000, v14, OS_LOG_TYPE_DEFAULT, "\"Removing Messages from google account type.\", buf, 2u);
    }

    objc_msgSend(v29, "supportedDataclasses");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v15, "mutableCopy");

    objc_msgSend(v4, "removeObject:", v13);
    objc_msgSend(v29, "setSupportedDataclasses:", v4);
  }
  else
  {
LABEL_9:
    v13 = 0;
  }
  v27 = v13;

LABEL_16:
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[ACDDatabaseInitializer _accounts](self, "_accounts", v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v21, "accountType");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v23, "isEqual:", v3))
        {
          _ACLogSystem();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v39 = v21;
            _os_log_impl(&dword_20D8CB000, v24, OS_LOG_TYPE_DEFAULT, "\"Updating supported dataclass on account %@\", buf, 0xCu);
          }

          objc_msgSend(v21, "accountType");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "supportedDataclasses");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setProvisionedDataclasses:", v26);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v18);
  }

}

- (void)_removeAIMAccounts
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[ACDDatabaseInitializer _accounts](self, "_accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  v6 = *MEMORY[0x24BDB3FC8];
  if (v4)
  {
    v7 = v4;
    v8 = *(_QWORD *)v18;
    *(_QWORD *)&v5 = 138412290;
    v16 = v5;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "accountType", v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "isEqual:", v6))
        {
          _ACLogSystem();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v16;
            v22 = v10;
            _os_log_impl(&dword_20D8CB000, v13, OS_LOG_TYPE_DEFAULT, "\"Removing AIM account %@\", buf, 0xCu);
          }

          -[ACDDatabaseConnection deleteObject:](self->_databaseConnection, "deleteObject:", v10);
        }

      }
      v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v7);
  }

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    _ACLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D8CB000, v15, OS_LOG_TYPE_DEFAULT, "\"Removing AIM account type\", buf, 2u);
    }

    -[ACDDatabaseConnection deleteObject:](self->_databaseConnection, "deleteObject:", v14);
  }

}

- (void)_addFacebookAndDAVLegacyAccountTypes
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
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
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint8_t buf[16];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x24BDAC8D0];
  _ACLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D8CB000, v3, OS_LOG_TYPE_DEFAULT, "\"Adding Facebook legacy account types\", buf, 2u);
  }

  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = *MEMORY[0x24BDB4598];
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4598]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDB4580];
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4580]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithObjects:", v6, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *MEMORY[0x24BDB4048];
  LOBYTE(v29) = 0;
  v11 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4048], CFSTR("Facebook Legacy"), 0, v9, *MEMORY[0x24BDB41C0], 1, v29);
  -[ACDDatabaseInitializer _accessKeyWithName:](self, "_accessKeyWithName:", *MEMORY[0x24BDB4210]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v12;
  -[ACDDatabaseInitializer _accessKeyWithName:](self, "_accessKeyWithName:", *MEMORY[0x24BDB4220]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v13;
  -[ACDDatabaseInitializer _accessKeyWithName:](self, "_accessKeyWithName:", *MEMORY[0x24BDB4218]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v33[2] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccessKeys:", v17);

  v18 = (void *)MEMORY[0x24BDBCF20];
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4620]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithObjects:", v19, v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = *MEMORY[0x24BDB41C8];
  LOWORD(v30) = 257;
  v23 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4008], CFSTR("CalDAV Legacy"), 0, v21, v21, *MEMORY[0x24BDB41C8], v30);
  v24 = (void *)MEMORY[0x24BDBCF20];
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB45A0]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setWithObjects:", v25, v26, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v31) = 257;
  v28 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4018], CFSTR("CardDAV Legacy"), 0, v27, v27, v22, v31);

}

- (void)_changeFacebookAccountToLegacyAccountType
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id obj;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  _ACLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D8CB000, v3, OS_LOG_TYPE_DEFAULT, "\"Changing Facebook account types\", buf, 2u);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[ACDDatabaseInitializer _accounts](self, "_accounts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v41;
    v7 = *MEMORY[0x24BDB4040];
    v26 = *MEMORY[0x24BDB4048];
    v8 = *MEMORY[0x24BDB4000];
    v35 = *MEMORY[0x24BDB4010];
    v33 = *MEMORY[0x24BDB4018];
    v34 = *MEMORY[0x24BDB4008];
    v27 = *MEMORY[0x24BDB4040];
    v28 = *(_QWORD *)v41;
    do
    {
      v9 = 0;
      v29 = v5;
      do
      {
        if (*(_QWORD *)v41 != v6)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v9);
        objc_msgSend(v10, "accountType", v26);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "isEqual:", v7))
        {
          v31 = v12;
          v32 = v9;
          _ACLogSystem();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v10;
            _os_log_impl(&dword_20D8CB000, v13, OS_LOG_TYPE_DEFAULT, "\"Changing account type of Facebook account %@\", buf, 0xCu);
          }

          -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", v26);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setAccountType:", v14);

          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          objc_msgSend(v10, "childAccounts");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v37;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v37 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
                objc_msgSend(v20, "accountType");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "identifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v22, "isEqualToString:", v8))
                {
                  _ACLogSystem();
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v46 = v20;
                    _os_log_impl(&dword_20D8CB000, v23, OS_LOG_TYPE_DEFAULT, "\"Changing account type of Facebook child CalDAV account %@\", buf, 0xCu);
                  }
                  v24 = v34;
                }
                else
                {
                  if (!objc_msgSend(v22, "isEqualToString:", v35))
                    goto LABEL_25;
                  _ACLogSystem();
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v46 = v20;
                    _os_log_impl(&dword_20D8CB000, v23, OS_LOG_TYPE_DEFAULT, "\"Changing account type of Facebook child CardDAV account %@\", buf, 0xCu);
                  }
                  v24 = v33;
                }

                -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", v24);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setAccountType:", v25);

LABEL_25:
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            }
            while (v17);
          }

          v6 = v28;
          v5 = v29;
          v7 = v27;
          v12 = v31;
          v9 = v32;
        }

        ++v9;
      }
      while (v9 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v5);
  }

}

- (void)_addObsoleteAttributeToAccountTypes
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  _ACLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D8CB000, v3, OS_LOG_TYPE_DEFAULT, "\"Adding obsolete attribute to Account Types\", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BDB4040], *MEMORY[0x24BDB4150], *MEMORY[0x24BDB4120], *MEMORY[0x24BDB4138], CFSTR("com.apple.linkedin"), *MEMORY[0x24BDB4058], *MEMORY[0x24BDB4158], *MEMORY[0x24BDB4140], *MEMORY[0x24BDB4178], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[ACDDatabaseInitializer _accountTypes](self, "_accountTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "containsObject:", v11);

        if ((_DWORD)v12)
        {
          _ACLogSystem();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v20 = v10;
            _os_log_impl(&dword_20D8CB000, v13, OS_LOG_TYPE_DEFAULT, "\"Marking account type %@ as obsolete\", buf, 0xCu);
          }

        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObsolete:", v14);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v7);
  }

}

- (void)_removeMessagesFromAOLSupportedDataclasses
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDB3FD0];
  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB3FD0]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "supportedDataclasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v35;
    v8 = *MEMORY[0x24BDB45F0];
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v35 != v7)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v9);
      objc_msgSend(v10, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", v8);

      if ((v12 & 1) != 0)
        break;
      if (v6 == ++v9)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v13 = v10;

    if (!v13)
    {
      v27 = 0;
      goto LABEL_16;
    }
    _ACLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D8CB000, v14, OS_LOG_TYPE_DEFAULT, "\"Removing Messages from AOL account type.\", buf, 2u);
    }

    objc_msgSend(v29, "supportedDataclasses");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v15, "mutableCopy");

    objc_msgSend(v4, "removeObject:", v13);
    objc_msgSend(v29, "setSupportedDataclasses:", v4);
  }
  else
  {
LABEL_9:
    v13 = 0;
  }
  v27 = v13;

LABEL_16:
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[ACDDatabaseInitializer _accounts](self, "_accounts", v27);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v21, "accountType");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v23, "isEqual:", v3))
        {
          _ACLogSystem();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v39 = v21;
            _os_log_impl(&dword_20D8CB000, v24, OS_LOG_TYPE_DEFAULT, "\"Updating supported dataclass on account %@\", buf, 0xCu);
          }

          objc_msgSend(v21, "accountType");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "supportedDataclasses");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setProvisionedDataclasses:", v26);

        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v18);
  }

}

- (void)_addiTunesStoreSandboxAccountType
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  LOBYTE(v4) = 1;
  v3 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4188], CFSTR("iTunes Store (Sandbox)"), 0, v5, *MEMORY[0x24BDB41C8], 1, v4);

}

- (void)_addLinkedInLegacyAccountType
{
  NSObject *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint8_t buf[16];

  _ACLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D8CB000, v3, OS_LOG_TYPE_DEFAULT, "\"Adding LinkedIn legacy account type\", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (_QWORD *)MEMORY[0x24BDB40D0];
  if (v4)
  {
    -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4598]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4610]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v4, "addObject:", v6);
    if (v7)
      objc_msgSend(v4, "addObject:", v7);
    LOBYTE(v14) = 0;
    v8 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *v5, CFSTR("LinkedIn Legacy"), 0, v4, *MEMORY[0x24BDB41B8], 1, v14);

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[ACDDatabaseInitializer _accessKeyWithName:](self, "_accessKeyWithName:", CFSTR("ACLinkedInAppIdKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACDDatabaseInitializer _accessKeyWithName:](self, "_accessKeyWithName:", CFSTR("ACLinkedInPermissionsKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v9, "addObject:", v10);
    if (v11)
      objc_msgSend(v9, "addObject:", v11);
    -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setAccessKeys:", v13);

    }
  }

}

- (void)_removeBTMMType
{
  void *v3;
  void *v4;

  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4550]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[ACDDatabaseConnection deleteObject:](self->_databaseConnection, "deleteObject:", v3);
    v3 = v4;
  }

}

- (void)_switchAolAccountsToOAuth
{
  id v2;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB3FD0]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCredentialType:", *MEMORY[0x24BDB41C0]);

}

- (void)_aolSupportsAuthentication
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", *MEMORY[0x24BDB3FD0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB45E0]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v6, "setSupportsAuthentication:", MEMORY[0x24BDBD1C8]);
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSyncableDataclasses:", v5);

    }
    v3 = v6;
  }

}

- (void)_removeRedundantDataclasses
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  NSArray *v42;
  NSArray *dataclasses;
  void *v44;
  NSArray *v45;
  NSArray *accounts;
  void *v47;
  NSArray *v48;
  NSArray *accountTypes;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  NSObject *v56;
  NSArray *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  NSObject *v66;
  char *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t k;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  NSObject *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t m;
  void *v84;
  void *v85;
  void *v86;
  int v87;
  NSObject *v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t n;
  void *v96;
  void *v97;
  void *v98;
  int v99;
  NSObject *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t ii;
  void *v106;
  void *v107;
  void *v108;
  int v109;
  NSObject *v110;
  id v111;
  ACDDatabaseInitializer *v112;
  id v113;
  NSArray *v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  NSArray *obj;
  char *obja;
  id v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  _BYTE v160[128];
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  _BYTE v164[128];
  _BYTE v165[128];
  _BYTE v166[128];
  uint8_t v167[128];
  uint8_t buf[4];
  void *v169;
  __int16 v170;
  void *v171;
  _BYTE v172[128];
  uint64_t v173;

  v173 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v123 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v156 = 0u;
  v157 = 0u;
  v158 = 0u;
  v159 = 0u;
  -[ACDDatabaseInitializer _dataclasses](self, "_dataclasses");
  obj = (NSArray *)objc_claimAutoreleasedReturnValue();
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v156, v172, 16);
  if (!v5)
    goto LABEL_117;
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v157;
  v111 = v3;
  v112 = self;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v157 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * v9);
      objc_msgSend(v10, "name", v111);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        _ACLogSystem();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v10, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v169 = v14;
          v170 = 2112;
          v171 = v10;
          _os_log_impl(&dword_20D8CB000, v13, OS_LOG_TYPE_DEFAULT, "\"Removing redundant dataclass of name %@ %@\", buf, 0x16u);

        }
        _ACLogSystem();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v169 = v12;
          _os_log_impl(&dword_20D8CB000, v15, OS_LOG_TYPE_DEFAULT, "\"Replacing with canonical dataclass %@\", buf, 0xCu);
        }

        objc_msgSend(v10, "objectID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "URIRepresentation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v17);

        objc_msgSend(v10, "provisionedAccounts");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        if (v19)
        {
          objc_msgSend(v10, "provisionedAccounts");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addProvisionedAccounts:", v20);

          objc_msgSend(v10, "provisionedAccounts");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "unionSet:", v21);

        }
        objc_msgSend(v10, "enabledAccounts");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");

        if (v23)
        {
          objc_msgSend(v10, "enabledAccounts");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addEnabledAccounts:", v24);

          objc_msgSend(v10, "enabledAccounts");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "unionSet:", v25);

        }
        objc_msgSend(v10, "supportedTypes");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "count");

        if (v27)
        {
          objc_msgSend(v10, "supportedTypes");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addSupportedTypes:", v28);

          objc_msgSend(v10, "supportedTypes");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "unionSet:", v29);

        }
        objc_msgSend(v10, "syncableTypes");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count");

        if (v31)
        {
          objc_msgSend(v10, "syncableTypes");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addSyncableTypes:", v32);

          objc_msgSend(v10, "syncableTypes");
          v33 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "unionSet:", v33);
          goto LABEL_19;
        }
        goto LABEL_20;
      }
      objc_msgSend(v10, "name");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend(v10, "name");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v35);

        goto LABEL_31;
      }
      _ACDLogSystem();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v169 = v10;
        _os_log_error_impl(&dword_20D8CB000, v36, OS_LOG_TYPE_ERROR, "@\"There was no name on the dataclass %@\", buf, 0xCu);
      }

      objc_msgSend(v10, "supportedTypes");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v37, "count"))
      {

        self = v112;
        goto LABEL_31;
      }
      objc_msgSend(v10, "syncableTypes");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v38, "count"))
        goto LABEL_30;
      objc_msgSend(v10, "enabledAccounts");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v39, "count"))
      {

LABEL_30:
        v3 = v111;
        self = v112;
        goto LABEL_31;
      }
      objc_msgSend(v10, "provisionedAccounts");
      v113 = (id)objc_claimAutoreleasedReturnValue();
      v116 = objc_msgSend(v113, "count");

      v3 = v111;
      self = v112;
      if (!v116)
      {
        _ACDLogSystem();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v169 = v10;
          _os_log_error_impl(&dword_20D8CB000, v33, OS_LOG_TYPE_ERROR, "@\"Dataclass %@ has no types or accounts, deleting\", buf, 0xCu);
        }
LABEL_19:

LABEL_20:
        -[ACDDatabaseConnection deleteObject:](self->_databaseConnection, "deleteObject:", v10);
        v7 = 1;
      }
LABEL_31:

      ++v9;
    }
    while (v6 != v9);
    v40 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v156, v172, 16);
    v6 = v40;
  }
  while (v40);

  if ((v7 & 1) != 0)
  {
    -[ACDDatabaseConnection fetchObjectsForEntityNamed:](self->_databaseConnection, "fetchObjectsForEntityNamed:", CFSTR("Dataclass"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (NSArray *)objc_msgSend(v41, "mutableCopy");
    dataclasses = self->_dataclasses;
    self->_dataclasses = v42;

    -[ACDDatabaseConnection fetchObjectsForEntityNamed:](self->_databaseConnection, "fetchObjectsForEntityNamed:", CFSTR("Account"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (NSArray *)objc_msgSend(v44, "mutableCopy");
    accounts = self->_accounts;
    self->_accounts = v45;

    -[ACDDatabaseConnection fetchObjectsForEntityNamed:](self->_databaseConnection, "fetchObjectsForEntityNamed:", CFSTR("AccountType"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (NSArray *)objc_msgSend(v47, "mutableCopy");
    accountTypes = self->_accountTypes;
    self->_accountTypes = v48;

    v154 = 0u;
    v155 = 0u;
    v152 = 0u;
    v153 = 0u;
    v50 = v123;
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v152, v167, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v153;
      do
      {
        for (i = 0; i != v52; ++i)
        {
          if (*(_QWORD *)v153 != v53)
            objc_enumerationMutation(v50);
          v55 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * i);
          _ACLogSystem();
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v169 = v55;
            _os_log_impl(&dword_20D8CB000, v56, OS_LOG_TYPE_DEFAULT, "\"Redundant dataclass removal affected %@\", buf, 0xCu);
          }

        }
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v152, v167, 16);
      }
      while (v52);
    }

    v150 = 0u;
    v151 = 0u;
    v148 = 0u;
    v149 = 0u;
    v57 = v112->_dataclasses;
    v58 = -[NSArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v148, v166, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v149;
      do
      {
        for (j = 0; j != v59; ++j)
        {
          if (*(_QWORD *)v149 != v60)
            objc_enumerationMutation(v57);
          v62 = *(void **)(*((_QWORD *)&v148 + 1) + 8 * j);
          objc_msgSend(v62, "objectID");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "URIRepresentation");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v4, "containsObject:", v64);

          if (v65)
          {
            _ACLogSystem();
            v66 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v169 = v62;
              _os_log_error_impl(&dword_20D8CB000, v66, OS_LOG_TYPE_ERROR, "\"Ostensibly removed dataclass still exists! %@\", buf, 0xCu);
            }

          }
        }
        v59 = -[NSArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v148, v166, 16);
      }
      while (v59);
    }

    v146 = 0u;
    v147 = 0u;
    v144 = 0u;
    v145 = 0u;
    v114 = v112->_accounts;
    v119 = -[NSArray countByEnumeratingWithState:objects:count:](v114, "countByEnumeratingWithState:objects:count:", &v144, v165, 16);
    if (v119)
    {
      v117 = *(_QWORD *)v145;
      do
      {
        v67 = 0;
        do
        {
          if (*(_QWORD *)v145 != v117)
            objc_enumerationMutation(v114);
          obja = v67;
          v68 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * (_QWORD)v67);
          v140 = 0u;
          v141 = 0u;
          v142 = 0u;
          v143 = 0u;
          objc_msgSend(v68, "provisionedDataclasses");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v140, v164, 16);
          if (v70)
          {
            v71 = v70;
            v72 = *(_QWORD *)v141;
            do
            {
              for (k = 0; k != v71; ++k)
              {
                if (*(_QWORD *)v141 != v72)
                  objc_enumerationMutation(v69);
                v74 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * k);
                objc_msgSend(v74, "objectID");
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v75, "URIRepresentation");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                v77 = objc_msgSend(v4, "containsObject:", v76);

                if (v77)
                {
                  _ACLogSystem();
                  v78 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v169 = v74;
                    v170 = 2112;
                    v171 = v68;
                    _os_log_error_impl(&dword_20D8CB000, v78, OS_LOG_TYPE_ERROR, "\"Ostensibly removed dataclass still among account.provisionedDataclasses! %@ %@\", buf, 0x16u);
                  }

                }
              }
              v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v140, v164, 16);
            }
            while (v71);
          }

          v138 = 0u;
          v139 = 0u;
          v136 = 0u;
          v137 = 0u;
          objc_msgSend(v68, "enabledDataclasses");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v136, v163, 16);
          if (v80)
          {
            v81 = v80;
            v82 = *(_QWORD *)v137;
            do
            {
              for (m = 0; m != v81; ++m)
              {
                if (*(_QWORD *)v137 != v82)
                  objc_enumerationMutation(v79);
                v84 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * m);
                objc_msgSend(v84, "objectID");
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v85, "URIRepresentation");
                v86 = (void *)objc_claimAutoreleasedReturnValue();
                v87 = objc_msgSend(v4, "containsObject:", v86);

                if (v87)
                {
                  _ACLogSystem();
                  v88 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v169 = v84;
                    v170 = 2112;
                    v171 = v68;
                    _os_log_error_impl(&dword_20D8CB000, v88, OS_LOG_TYPE_ERROR, "\"Ostensibly removed dataclass still among account.enabledDataclasses! %@ %@\", buf, 0x16u);
                  }

                }
              }
              v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v136, v163, 16);
            }
            while (v81);
          }

          v67 = obja + 1;
        }
        while (obja + 1 != (char *)v119);
        v119 = -[NSArray countByEnumeratingWithState:objects:count:](v114, "countByEnumeratingWithState:objects:count:", &v144, v165, 16);
      }
      while (v119);
    }

    v134 = 0u;
    v135 = 0u;
    v132 = 0u;
    v133 = 0u;
    obj = v112->_accountTypes;
    v118 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v132, v162, 16);
    if (v118)
    {
      v115 = *(id *)v133;
      do
      {
        v89 = 0;
        do
        {
          if (*(id *)v133 != v115)
            objc_enumerationMutation(obj);
          v120 = v89;
          v90 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * v89);
          v128 = 0u;
          v129 = 0u;
          v130 = 0u;
          v131 = 0u;
          objc_msgSend(v90, "supportedDataclasses");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v128, v161, 16);
          if (v92)
          {
            v93 = v92;
            v94 = *(_QWORD *)v129;
            do
            {
              for (n = 0; n != v93; ++n)
              {
                if (*(_QWORD *)v129 != v94)
                  objc_enumerationMutation(v91);
                v96 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * n);
                objc_msgSend(v96, "objectID");
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v97, "URIRepresentation");
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                v99 = objc_msgSend(v4, "containsObject:", v98);

                if (v99)
                {
                  _ACLogSystem();
                  v100 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v169 = v96;
                    v170 = 2112;
                    v171 = v90;
                    _os_log_error_impl(&dword_20D8CB000, v100, OS_LOG_TYPE_ERROR, "\"Ostensibly removed dataclass still among accountType.supportedDataclasses! %@ %@\", buf, 0x16u);
                  }

                }
              }
              v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v128, v161, 16);
            }
            while (v93);
          }

          v126 = 0u;
          v127 = 0u;
          v124 = 0u;
          v125 = 0u;
          objc_msgSend(v90, "syncableDataclasses");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v124, v160, 16);
          if (v102)
          {
            v103 = v102;
            v104 = *(_QWORD *)v125;
            do
            {
              for (ii = 0; ii != v103; ++ii)
              {
                if (*(_QWORD *)v125 != v104)
                  objc_enumerationMutation(v101);
                v106 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * ii);
                objc_msgSend(v106, "objectID");
                v107 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v107, "URIRepresentation");
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                v109 = objc_msgSend(v4, "containsObject:", v108);

                if (v109)
                {
                  _ACLogSystem();
                  v110 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412546;
                    v169 = v106;
                    v170 = 2112;
                    v171 = v90;
                    _os_log_error_impl(&dword_20D8CB000, v110, OS_LOG_TYPE_ERROR, "\"Ostensibly removed dataclass still among accountType.syncableDataclasses! %@ %@\", buf, 0x16u);
                  }

                }
              }
              v103 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v124, v160, 16);
            }
            while (v103);
          }

          v89 = v120 + 1;
        }
        while (v120 + 1 != v118);
        v118 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v132, v162, 16);
      }
      while (v118);
    }
    v3 = v111;
LABEL_117:

  }
}

- (void)_addRemoteManagementAccountType
{
  id v3;
  uint64_t v4;
  id v5;

  v5 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  LOBYTE(v4) = 1;
  v3 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4110], CFSTR("Remote Management"), 1, v5, *MEMORY[0x24BDB41D0], 1, v4);

}

- (void)_addPublishedCalendarAccountType
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;

  v3 = (void *)MEMORY[0x24BDBCF20];
  -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *MEMORY[0x24BDB4580]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  LOWORD(v6) = 257;
  v5 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:", *MEMORY[0x24BDB4100], CFSTR("Published Calendar"), 0, v7, v7, *MEMORY[0x24BDB41C8], v6);

}

- (void)_removeRedundantAccountTypes
{
  id v3;
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSArray *dataclasses;
  void *v32;
  uint64_t v33;
  NSArray *accounts;
  void *v35;
  uint64_t v36;
  NSArray *accountTypes;
  void *v38;
  uint64_t v39;
  NSArray *accessKeys;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  NSObject *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t m;
  void *v63;
  void *v64;
  uint64_t v65;
  NSObject *v66;
  NSArray *obj;
  ACDDatabaseInitializer *v68;
  id v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint8_t v88[128];
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  void *v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v69 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v68 = self;
  -[ACDDatabaseInitializer _accountTypes](self, "_accountTypes");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v82, v93, 16);
  if (!v6)
  {
LABEL_53:

    goto LABEL_54;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v83;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v83 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        _ACLogSystem();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v90 = v15;
          v91 = 2112;
          v92 = v11;
          _os_log_impl(&dword_20D8CB000, v14, OS_LOG_TYPE_DEFAULT, "\"Removing redundant account type of name %@ %@\", buf, 0x16u);

        }
        _ACLogSystem();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v90 = v13;
          _os_log_impl(&dword_20D8CB000, v16, OS_LOG_TYPE_DEFAULT, "\"Replacing with canonical account type %@\", buf, 0xCu);
        }

        objc_msgSend(v11, "objectID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "URIRepresentation");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "addObject:", v18);

        objc_msgSend(v11, "accounts");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v11, "accounts");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addAccounts:", v20);

          objc_msgSend(v11, "accounts");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "unionSet:", v21);

        }
        objc_msgSend(v11, "permission");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(v11, "permission");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addPermission:", v23);

          objc_msgSend(v11, "permission");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "unionSet:", v24);

        }
        objc_msgSend(v11, "accessKeys");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(v11, "accessKeys");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addAccessKeys:", v26);

          objc_msgSend(v11, "accessKeys");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "unionSet:", v27);

        }
        -[ACDDatabaseConnection deleteObject:](v68->_databaseConnection, "deleteObject:", v11);
        v8 = 1;
      }
      else
      {
        objc_msgSend(v11, "identifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v28);

      }
    }
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v82, v93, 16);
  }
  while (v7);

  if ((v8 & 1) != 0)
  {
    -[ACDDatabaseConnection fetchObjectsForEntityNamed:](v68->_databaseConnection, "fetchObjectsForEntityNamed:", CFSTR("Dataclass"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "mutableCopy");
    dataclasses = v68->_dataclasses;
    v68->_dataclasses = (NSArray *)v30;

    -[ACDDatabaseConnection fetchObjectsForEntityNamed:](v68->_databaseConnection, "fetchObjectsForEntityNamed:", CFSTR("Account"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "mutableCopy");
    accounts = v68->_accounts;
    v68->_accounts = (NSArray *)v33;

    -[ACDDatabaseConnection fetchObjectsForEntityNamed:](v68->_databaseConnection, "fetchObjectsForEntityNamed:", CFSTR("AccountType"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "mutableCopy");
    accountTypes = v68->_accountTypes;
    v68->_accountTypes = (NSArray *)v36;

    -[ACDDatabaseConnection fetchObjectsForEntityNamed:](v68->_databaseConnection, "fetchObjectsForEntityNamed:", CFSTR("AccessOptionsKey"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "mutableCopy");
    accessKeys = v68->_accessKeys;
    v68->_accessKeys = (NSArray *)v39;

    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v41 = v4;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v79;
      do
      {
        for (j = 0; j != v43; ++j)
        {
          if (*(_QWORD *)v79 != v44)
            objc_enumerationMutation(v41);
          v46 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
          _ACLogSystem();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v90 = v46;
            _os_log_impl(&dword_20D8CB000, v47, OS_LOG_TYPE_DEFAULT, "\"Redundant account type removal affected %@\", buf, 0xCu);
          }

        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
      }
      while (v43);
    }

    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    obj = v68->_accounts;
    v48 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v75;
      do
      {
        for (k = 0; k != v49; ++k)
        {
          if (*(_QWORD *)v75 != v50)
            objc_enumerationMutation(obj);
          v52 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * k);
          objc_msgSend(v52, "accountType");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "objectID");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "URIRepresentation");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v69, "containsObject:", v55);

          if (v56)
          {
            _ACLogSystem();
            v57 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v52, "accountType");
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v90 = v58;
              v91 = 2112;
              v92 = v52;
              _os_log_error_impl(&dword_20D8CB000, v57, OS_LOG_TYPE_ERROR, "\"Ostensibly removed account type still set for account.accountType! %@ %@\", buf, 0x16u);

            }
          }
        }
        v49 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
      }
      while (v49);
    }

    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v5 = v68->_accessKeys;
    v59 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
    if (v59)
    {
      v60 = v59;
      v61 = *(_QWORD *)v71;
      do
      {
        for (m = 0; m != v60; ++m)
        {
          if (*(_QWORD *)v71 != v61)
            objc_enumerationMutation(v5);
          v63 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * m);
          objc_msgSend(v63, "owningAccountTypes");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v64, "count");

          if (!v65)
          {
            _ACLogSystem();
            v66 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v90 = v63;
              _os_log_error_impl(&dword_20D8CB000, v66, OS_LOG_TYPE_ERROR, "\"Unowned access key! %@\", buf, 0xCu);
            }

          }
        }
        v60 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
      }
      while (v60);
    }
    goto LABEL_53;
  }
LABEL_54:

}

- (id)_managedDataclassesSetForNames:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[ACDDatabaseInitializer _dataclassWithName:](self, "_dataclassWithName:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_ensureAllInternalAccountTypesExist:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  ACDDatabaseInitializer *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id obj;
  _BOOL4 v31;
  void *v32;
  void *v33;
  unsigned int v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v31 = a3;
  v45 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  _ACDLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[ACDDatabaseInitializer _ensureAllInternalAccountTypesExist:].cold.2();

  +[ACDDatabasePersistentConfiguration accountTypes](ACDDatabasePersistentConfiguration, "accountTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v5, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v39)
  {
    v6 = *(_QWORD *)v41;
    v27 = *(_QWORD *)v41;
    v28 = v5;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v41 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACDDatabaseInitializer _accountTypeWithIdentifier:](self, "_accountTypeWithIdentifier:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          if (!v31)
            goto LABEL_13;
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ACDAccountTypeSupportedDataclasses"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ACDAccountTypeSyncableDataclasses"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[ACDDatabaseInitializer _ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:](self, "_ensureAccountTypeWithIdentifier:supportsDataclasses:syncsDataclasses:", v8, v11, v12);
        }
        else
        {
          objc_msgSend(v29, "addObject:", v8);
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ACDAccountTypeDisplayName"));
          v36 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ACDAccountTypeVisibility"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v37, "unsignedIntValue");
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ACDAccountTypeSupportedDataclasses"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[ACDDatabaseInitializer _managedDataclassesSetForNames:](self, "_managedDataclassesSetForNames:", v38);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ACDAccountTypeSyncableDataclasses"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[ACDDatabaseInitializer _managedDataclassesSetForNames:](self, "_managedDataclassesSetForNames:", v35);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ACDAccountTypeCredentialType"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ACDAccountTypeSupportsAuthentication"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = self;
          v16 = objc_msgSend(v14, "BOOLValue");
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ACDAccountTypeSupportsMultipleAccounts"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "BOOLValue");
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ACDAccountTypeCredentialProtectionPolicy"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          BYTE1(v26) = v18;
          LOBYTE(v26) = v16;
          self = v15;
          v11 = (void *)v36;
          v20 = -[ACDDatabaseInitializer _addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:credentialProtectionPolicy:](self, "_addAccountTypeWithIdentifier:displayName:visibility:supportedDataclasses:syncableDataclasses:credentialType:supportsAuthentication:supportsMultipleAccounts:credentialProtectionPolicy:", v8, v36, v34, v13, v33, v32, v26, v19);

          v12 = v37;
          v6 = v27;

          v5 = v28;
        }

LABEL_13:
      }
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v39);
  }

  v21 = objc_msgSend(v29, "count");
  if (v21)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing account types: %@"), v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    _ACDLogSystem();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[ACDDatabaseInitializer _ensureAllInternalAccountTypesExist:].cold.1();

    +[ACDEventLedger sharedLedger](ACDEventLedger, "sharedLedger");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "simulateCrashWithMessage:", v22);

  }
  return v21 != 0;
}

- (BOOL)_ensureAllDataclassesExist
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  _ACDLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[ACDDatabaseInitializer _ensureAllDataclassesExist].cold.2();

  +[ACDDatabasePersistentConfiguration dataclasses](ACDDatabasePersistentConfiguration, "dataclasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCF20];
  -[ACDDatabaseInitializer _dataclasses](self, "_dataclasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKeyPath:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((objc_msgSend(v8, "containsObject:", v15) & 1) == 0)
        {
          -[ACDDatabaseInitializer _addDataclassWithName:](self, "_addDataclassWithName:", v15);
          objc_msgSend(v9, "addObject:", v15);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  v16 = objc_msgSend(v9, "count");
  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing dataclasses: %@"), v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _ACDLogSystem();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ACDDatabaseInitializer _ensureAllInternalAccountTypesExist:].cold.1();

    +[ACDEventLedger sharedLedger](ACDEventLedger, "sharedLedger");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "simulateCrashWithMessage:", v17);

  }
  return v16 != 0;
}

- (void)_addWarmingUpAttributeToAccounts
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[ACDDatabaseInitializer _accounts](self, "_accounts", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setWarmingUp:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessKeys, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_accountTypes, 0);
  objc_storeStrong((id *)&self->_dataclasses, 0);
  objc_storeStrong((id *)&self->_databaseConnection, 0);
}

void __58__ACDDatabaseInitializer_updateDefaultContentIfNecessary___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  v8 = 2112;
  v9 = v5;
  OUTLINED_FUNCTION_6(&dword_20D8CB000, a3, v6, "\"Database initialization failed. Stuck at version %@. Error: %@\", v7);

}

void __58__ACDDatabaseInitializer_updateDefaultContentIfNecessary___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  void *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40);
  v4 = 138412546;
  v5 = &unk_24C7EF1A0;
  v6 = 2112;
  v7 = v3;
  OUTLINED_FUNCTION_6(&dword_20D8CB000, a2, a3, "\"Failed to update current version %@. Error: %@\", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

void __58__ACDDatabaseInitializer_updateDefaultContentIfNecessary___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_1(&dword_20D8CB000, v0, v1, "\"Opened a database with a newer configuration than this version of the framework supports, here there be krakens.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_addCredentialType:toAccountType:supportsAuthentication:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_6(&dword_20D8CB000, v1, (uint64_t)v1, "\"Could not find account type %@ to set credential type %@\", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_addDataclassWithName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"Attempt to insert duplicate dataclass name %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_addAccessKeyWithName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"Attempt to insert duplicate access key name %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_ensureAllInternalAccountTypesExist:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9(&dword_20D8CB000, v0, v1, "\"%@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_ensureAllInternalAccountTypesExist:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"Ensuring all internal account types exist...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_ensureAllDataclassesExist
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_10(&dword_20D8CB000, v0, v1, "\"Ensuring all dataclasses exist...\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
