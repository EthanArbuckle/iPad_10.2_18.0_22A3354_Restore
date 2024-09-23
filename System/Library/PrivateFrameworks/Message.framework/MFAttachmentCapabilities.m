@implementation MFAttachmentCapabilities

+ (unint64_t)currentMessageLimit
{
  void *v3;
  char v4;
  unint64_t v5;
  void *v6;
  void *v7;

  MFUserAgent();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMobileMail");

  if ((v4 & 1) != 0)
  {
    v5 = 52428800;
  }
  else
  {
    objc_msgSend(a1, "capabilitiesDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MFMailAttachmentMessageLimitKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "integerValue");

  }
  if (objc_msgSend(a1, "placeholdersAvailable"))
    return v5;
  else
    return 15728640;
}

+ (unint64_t)currentDownloadLimit
{
  void *v2;
  int v3;

  +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFatPipe");

  if (v3)
    return 0x40000000;
  else
    return 104857600;
}

+ (unint64_t)currentUploadLimit
{
  void *v3;
  int v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;

  MFUserAgent();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMobileMail");

  if (v4)
  {
    +[MailAccount defaultMailAccountForDelivery](MailAccount, "defaultMailAccountForDelivery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(a1, "mailDropAvailableForAccount:", v5) & 1) != 0
      || objc_msgSend(a1, "mailDropAvailable"))
    {
      v6 = objc_msgSend(a1, "_mailDropLimit");
    }
    else
    {
      v6 = 104857600;
    }
    +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isFatPipe");

    v10 = 104857600;
    if (v6 < 0x6400000)
      v10 = v6;
    if (!v9)
      v6 = v10;
  }
  else
  {
    objc_msgSend(a1, "capabilitiesDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MFMailAttachmentUploadLimitKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "integerValue");

  }
  if (objc_msgSend(a1, "placeholdersAvailable"))
    return v6;
  else
    return 104857600;
}

+ (unint64_t)currentUploadLimitForAccount:(id)a3
{
  id v4;
  void *v5;
  int v6;
  unint64_t v7;
  void *v8;
  int v9;
  int v10;
  uint64_t v11;
  unint64_t v12;

  v4 = a3;
  MFUserAgent();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMobileMail");

  if (v6 && objc_msgSend(a1, "mailDropAvailableForAccount:", v4))
    v7 = objc_msgSend(a1, "_mailDropLimit");
  else
    v7 = 104857600;
  +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isFatPipe");

  v10 = objc_msgSend(a1, "placeholdersAvailable");
  if (v7 >= 0x6400000)
    v11 = 104857600;
  else
    v11 = v7;
  if (v9)
    v11 = v7;
  if (v10)
    v12 = v11;
  else
    v12 = 104857600;

  return v12;
}

+ (BOOL)_isMailDropDevice
{
  void *v2;
  char v3;

  MFUserAgent();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMobileMail");

  return v3;
}

+ (unint64_t)mailDropThreshold
{
  void *v3;
  int v4;
  unint64_t v5;
  void *v6;
  void *v7;

  MFUserAgent();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMobileMail");

  if (v4)
  {
    if (objc_msgSend(a1, "mailDropAvailable"))
      v5 = 20971520;
    else
      v5 = 0xFFFFFFFFLL;
  }
  else
  {
    objc_msgSend(a1, "capabilitiesDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("MFMailAttachmentMailDropThresholdKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "integerValue");

  }
  if (objc_msgSend(a1, "placeholdersAvailable"))
    return v5;
  else
    return 0xFFFFFFFFLL;
}

+ (unint64_t)_mailDropLimit
{
  void *v2;
  int v3;

  +[MFNetworkController sharedInstance](MFNetworkController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFatPipe");

  if (v3)
    return 0xFFFFFFFFLL;
  else
    return 104857600;
}

+ (BOOL)mailDropConfigured
{
  BOOL result;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  char v11;

  if (mailDropConfigured_onceToken != -1)
    dispatch_once(&mailDropConfigured_onceToken, &__block_literal_global_23);
  if (mailDropConfigured_mailDropConfiguredNeedsRefresh == 1)
    return mailDropConfigured_mailDropConfigured != 0;
  MFUserAgent();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isMobileMail") & 1) != 0)
  {

  }
  else
  {
    v5 = MFHasAccountsEntitlement();

    if ((v5 & 1) == 0)
    {
      objc_msgSend(a1, "capabilitiesDictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MFMailAttachmentMailDropConfiguredKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "BOOLValue");
      goto LABEL_12;
    }
  }
  +[MFAccountStore sharedAccountStore](MFAccountStore, "sharedAccountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistentStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "aa_primaryAppleAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "isEnabledForDataclass:", *MEMORY[0x1E0C8F430]);
LABEL_12:
    v11 = v10;
    goto LABEL_13;
  }
  v11 = 0;
LABEL_13:

  result = objc_msgSend(a1, "placeholdersAvailable") & v11;
  mailDropConfigured_mailDropConfigured = result;
  mailDropConfigured_mailDropConfiguredNeedsRefresh = 1;
  return result;
}

void __46__MFAttachmentCapabilities_mailDropConfigured__block_invoke()
{
  const char *v0;
  NSObject *v1;
  int out_token;

  out_token = -1431655766;
  v0 = (const char *)*MEMORY[0x1E0D4D870];
  dispatch_get_global_queue(0, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  notify_register_dispatch(v0, &out_token, v1, &__block_literal_global_16_0);

}

void __46__MFAttachmentCapabilities_mailDropConfigured__block_invoke_2()
{
  mailDropConfigured_mailDropConfiguredNeedsRefresh = 0;
}

+ (BOOL)mailDropAvailableForAccount:(id)a3
{
  id v4;
  void *v5;
  int v6;
  char v7;
  char v8;

  v4 = a3;
  MFUserAgent();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMobileMail");

  if (v6 && objc_msgSend(a1, "_isMailDropDevice") && objc_msgSend(v4, "supportsMailDrop"))
    v7 = objc_msgSend(a1, "mailDropConfigured");
  else
    v7 = 0;
  v8 = objc_msgSend(a1, "placeholdersAvailable") & v7;

  return v8;
}

+ (BOOL)mailDropAvailable
{
  void *v3;
  int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  MFUserAgent();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMobileMail");

  if (v4)
  {
    if (objc_msgSend(a1, "_isMailDropDevice"))
    {
      +[MailAccount activeAccounts](MailAccount, "activeAccounts");
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v13;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v13 != v7)
              objc_enumerationMutation(v5);
            if ((objc_msgSend(a1, "mailDropAvailableForAccount:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12) & 1) != 0)
            {
              LOBYTE(v6) = 1;
              goto LABEL_15;
            }
          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v6)
            continue;
          break;
        }
      }
LABEL_15:

    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    objc_msgSend(a1, "capabilitiesDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MFMailAttachmentMailDropAvailableKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v10, "BOOLValue");

  }
  return objc_msgSend(a1, "placeholdersAvailable", (_QWORD)v12) & v6;
}

+ (double)mailDropExpiration
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  double result;

  MFUserAgent();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMobileMail");

  if (!v3)
    return 2592000.0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("MailDropShortExp"));

  result = 2592000.0;
  if (v5)
    return 600.0;
  return result;
}

+ (id)mailDropPreferences
{
  void *v2;
  int v3;
  const __CFString *v4;
  void *v5;

  MFUserAgent();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMobileMail");

  if (v3)
  {
    v4 = (const __CFString *)MFMobileMailPreferenceDomain();
    v5 = (void *)CFPreferencesCopyAppValue(CFSTR("mailDrop"), v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (unint64_t)currentPlaceholderThreshold
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;

  MFUserAgent();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMobileMail");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("AttachmentPlaceholderLowerLimit"));

    if (v6)
      v7 = 0x200000;
    else
      v7 = 10485760;
    if (objc_msgSend(a1, "placeholdersAvailable"))
      v8 = v7;
    else
      v8 = 0xFFFFFFFFLL;
  }
  else
  {
    objc_msgSend(a1, "capabilitiesDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MFMailAttachmentPlaceholderThresholdKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "integerValue");

  }
  if (objc_msgSend(a1, "placeholdersAvailable"))
    return v8;
  else
    return 0xFFFFFFFFLL;
}

+ (BOOL)placeholdersAvailable
{
  return 1;
}

+ (id)capabilitiesDictionary
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  MFUserAgent();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isMobileMail");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "currentUploadLimit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("MFMailAttachmentUploadLimitKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "currentMessageLimit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("MFMailAttachmentMessageLimitKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "mailDropThreshold"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("MFMailAttachmentMailDropThresholdKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "currentPlaceholderThreshold"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("MFMailAttachmentPlaceholderThresholdKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "placeholdersAvailable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("MFMailAttachmentPlaceholdersAvailableKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "mailDropAvailable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("MFMailAttachmentMailDropConfiguredKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "mailDropConfigured"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("MFMailAttachmentMailDropConfiguredKey"));

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D46AA8], "attachmentCapabilities");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end
