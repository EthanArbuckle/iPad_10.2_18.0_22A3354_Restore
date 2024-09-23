@implementation CNFInternalSettingsUtilities

+ (BOOL)isViceroyLoggingEnabled
{
  CFIndex AppIntegerValue;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("errorLogLevel"), CFSTR("com.apple.VideoConference"), &keyExistsAndHasValidFormat);
  return keyExistsAndHasValidFormat && AppIntegerValue == 7;
}

+ (void)setViceroyLoggingEnabled:(BOOL)a3
{
  const void *v3;

  if (a3)
    v3 = (const void *)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 8);
  else
    v3 = 0;
  CFPreferencesSetAppValue(CFSTR("errorLogLevel"), v3, CFSTR("com.apple.VideoConference"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.VideoConference"));
}

+ (void)killImagent
{
  const __CFString *v2;

  if (MarcoShouldLogRegistration())
  {
    v2 = CFSTR("killall -9 imagent");
    MarcoLogRegistration();
  }
  objc_msgSend(CFSTR("killall -9 imagent"), "UTF8String", v2);
  IMPerformSystem();
}

+ (void)killImavagent
{
  const __CFString *v2;

  if (MarcoShouldLogRegistration())
  {
    v2 = CFSTR("killall -9 imavagent");
    MarcoLogRegistration();
  }
  objc_msgSend(CFSTR("killall -9 imavagent"), "UTF8String", v2);
  IMPerformSystem();
}

+ (void)syncImagentLogSettings
{
  const __CFString *v2;

  if (MarcoShouldLogRegistration())
  {
    v2 = CFSTR("killall -USR2 imagent");
    MarcoLogRegistration();
  }
  objc_msgSend(CFSTR("killall -USR2 imagent"), "UTF8String", v2);
  IMPerformSystem();
}

+ (void)killMediaServerd
{
  const __CFString *v2;

  if (MarcoShouldLogRegistration())
  {
    v2 = CFSTR("killall -9 mediaserverd");
    MarcoLogRegistration();
  }
  objc_msgSend(CFSTR("killall -9 mediaserverd"), "UTF8String", v2);
  IMPerformSystem();
}

+ (void)killCallservicesd
{
  const __CFString *v2;

  if (MarcoShouldLogRegistration())
  {
    v2 = CFSTR("killall -9 callservicesd");
    MarcoLogRegistration();
  }
  objc_msgSend(CFSTR("killall -9 callservicesd"), "UTF8String", v2);
  IMPerformSystem();
}

+ (void)killFaceTime
{
  const __CFString *v2;

  if (MarcoShouldLogRegistration())
  {
    v2 = CFSTR("killall -9 FaceTime");
    MarcoLogRegistration();
  }
  objc_msgSend(CFSTR("killall -9 FaceTime"), "UTF8String", v2);
  IMPerformSystem();
}

+ (void)killMobilePhone
{
  const __CFString *v2;

  if (MarcoShouldLogRegistration())
  {
    v2 = CFSTR("killall -9 MobilePhone");
    MarcoLogRegistration();
  }
  objc_msgSend(CFSTR("killall -9 MobilePhone"), "UTF8String", v2);
  IMPerformSystem();
}

+ (void)killMobileSMS
{
  const __CFString *v2;

  if (MarcoShouldLogRegistration())
  {
    v2 = CFSTR("killall -9 MobileSMS");
    MarcoLogRegistration();
  }
  objc_msgSend(CFSTR("killall -9 MobileSMS"), "UTF8String", v2);
  IMPerformSystem();
}

+ (void)killEverything
{
  const __CFString *v2;

  if (MarcoShouldLogRegistration())
  {
    v2 = CFSTR("killall -9 mediaserverd Contacts imagent imavagent identityservicesd SpringBoard MobilePhone MobileSMS");
    MarcoLogRegistration();
  }
  objc_msgSend(CFSTR("killall -9 mediaserverd Contacts imagent imavagent identityservicesd SpringBoard MobilePhone MobileSMS"), "UTF8String", v2);
  IMPerformSystem();
}

+ (void)nukeKeychain
{
  __CFDictionary *Mutable;
  const void *v3;
  OSStatus v4;
  OSStatus v5;

  if (MarcoShouldLogRegistration())
    MarcoLogRegistration();
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, 0);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9230]);
  v3 = (const void *)*MEMORY[0x24BDE9128];
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDE9128], CFSTR("com.apple.iChat.VeniceRegistrationAgent"));
  v4 = SecItemDelete(Mutable);
  if (v4)
    NSLog(CFSTR("Unable to remove V0 keychain data: %ld"), v4);
  CFDictionarySetValue(Mutable, v3, CFSTR("com.apple.facetime"));
  v5 = SecItemDelete(Mutable);
  if (v5)
    NSLog(CFSTR("Unable to remove V1 keychain data: %ld"), v5);
  if (Mutable)
    CFRelease(Mutable);
}

+ (void)signOutAllAccounts
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
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
  MarcoLogRegistration();
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 2);
  objc_msgSend(MEMORY[0x24BE50368], "facetimeService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BE50368], "facetimeService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

  }
  objc_msgSend(MEMORY[0x24BE50368], "iMessageService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE50368], "iMessageService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v6);

  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v2;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v27)
  {
    v26 = *(_QWORD *)v34;
    v7 = (void *)*MEMORY[0x24BE50A38];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v34 != v26)
          objc_enumerationMutation(obj);
        v28 = v8;
        v9 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v8);
        objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "accountsForService:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v12 = v11;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v30;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v30 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
              if (objc_msgSend(v17, "accountType") == 1)
              {
                MarcoLogRegistration();
                objc_msgSend(v17, "unregisterAccount", v17);
                objc_msgSend(v17, "setBool:forKey:", 1, CFSTR("AccountSignedOut"));
                v18 = objc_alloc(MEMORY[0x24BDBCEB8]);
                objc_msgSend(v17, "aliases");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = (void *)objc_msgSend(v18, "initWithArray:", v19);

                objc_msgSend(v7, "lowercaseString");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v20, "containsObject:", v21);

                if ((v22 & 1) == 0)
                {
                  objc_msgSend(v7, "lowercaseString");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "addObject:", v23);

                }
                objc_msgSend(v17, "removeAliases:", v20);
                objc_msgSend(v17, "writeSettings");
                objc_msgSend(MEMORY[0x24BE50288], "sharedInstance");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "deactivateAccount:", v17);

              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          }
          while (v14);
        }

        v8 = v28 + 1;
      }
      while (v28 + 1 != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v27);
  }

}

+ (id)currentInternalSettingsBundle
{
  return (id)sCurrentInternalBundle;
}

+ (void)setCurrentInternalSettingsBundle:(id)a3
{
  objc_storeStrong((id *)&sCurrentInternalBundle, a3);
}

+ (id)IDSEnvironment
{
  void *v2;
  void *v3;
  __CFString *v4;

  CFPreferencesAppSynchronize(CFSTR("com.apple.ids"));
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("env"), CFSTR("com.apple.ids"));
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = CFSTR("prod");

  return v4;
}

+ (void)setIDSEnvironment:(id)a3
{
  id v3;

  v3 = a3;
  MarcoLogRegistration();
  CFPreferencesSetAppValue(CFSTR("env"), v3, CFSTR("com.apple.ids"));

  CFPreferencesAppSynchronize(CFSTR("com.apple.ids"));
}

@end
