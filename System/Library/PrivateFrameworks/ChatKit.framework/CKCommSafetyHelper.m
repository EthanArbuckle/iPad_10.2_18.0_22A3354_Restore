@implementation CKCommSafetyHelper

+ (id)waysToGetHelpURL
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;

  +[CKCommSafetyHelper validLanguageCountryPairings](CKCommSafetyHelper, "validLanguageCountryPairings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKCommSafetyHelper defaultLanguageForCountryPairings](CKCommSafetyHelper, "defaultLanguageForCountryPairings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D397A0], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "enablementGroup");

  if (v5 == 2)
  {
    v6 = CFSTR("https://apple.com/go/child-safety/re/");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D397A0], "sharedManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "childIsYoungAgeGroup");

    if (v8)
      v6 = CFSTR("https://www.apple.com/go/child-safety/rc-u13/");
    else
      v6 = CFSTR("https://www.apple.com/go/child-safety/rc/");
  }
  objc_msgSend(MEMORY[0x1E0D00100], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "primaryAuthKitAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "appleIDCountryCodeForAccount:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lowercaseString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "languageCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lowercaseString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && v15)
  {
    objc_msgSend(v2, "objectForKey:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = objc_msgSend(v16, "containsObject:", v15);
      v19 = (void *)MEMORY[0x1E0CB3940];
      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v15, v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v3, "objectForKey:", v12);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringWithFormat:", CFSTR("%@-%@"), v21, v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v20);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v6;
}

+ (id)validLanguageCountryPairings
{
  id v2;
  void *v3;
  void *v4;
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

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("br"), 0);
  objc_msgSend(v2, "setValue:forKey:", v3, CFSTR("br"));

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("en"), CFSTR("fr"), 0);
  objc_msgSend(v2, "setValue:forKey:", v4, CFSTR("ca"));

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("en"), CFSTR("es"), 0);
  objc_msgSend(v2, "setValue:forKey:", v5, CFSTR("us"));

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("jp"), 0);
  objc_msgSend(v2, "setValue:forKey:", v6, CFSTR("jp"));

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("ko"), 0);
  objc_msgSend(v2, "setValue:forKey:", v7, CFSTR("kr"));

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("fr"), CFSTR("nl"), 0);
  objc_msgSend(v2, "setValue:forKey:", v8, CFSTR("be"));

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("en"), CFSTR("fr"), 0);
  objc_msgSend(v2, "setValue:forKey:", v9, CFSTR("fr"));

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("en"), CFSTR("de"), 0);
  objc_msgSend(v2, "setValue:forKey:", v10, CFSTR("de"));

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("en"), 0);
  objc_msgSend(v2, "setValue:forKey:", v11, CFSTR("gb"));

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("it"), 0);
  objc_msgSend(v2, "setValue:forKey:", v12, CFSTR("it"));

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("nl"), 0);
  objc_msgSend(v2, "setValue:forKey:", v13, CFSTR("nl"));

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("es"), 0);
  objc_msgSend(v2, "setValue:forKey:", v14, CFSTR("es"));

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("sv"), 0);
  objc_msgSend(v2, "setValue:forKey:", v15, CFSTR("se"));

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("en"), 0);
  objc_msgSend(v2, "setValue:forKey:", v16, CFSTR("au"));

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("en"), 0);
  objc_msgSend(v2, "setValue:forKey:", v17, CFSTR("nz"));

  return v2;
}

+ (id)defaultLanguageForCountryPairings
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setValue:forKey:", CFSTR("br"), CFSTR("br"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("en"), CFSTR("ca"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("en"), CFSTR("us"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("jp"), CFSTR("jp"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("ko"), CFSTR("kr"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("fr"), CFSTR("be"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("fr"), CFSTR("fr"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("de"), CFSTR("de"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("en"), CFSTR("gb"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("it"), CFSTR("it"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("nl"), CFSTR("nl"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("es"), CFSTR("es"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("sv"), CFSTR("se"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("en"), CFSTR("au"));
  objc_msgSend(v2, "setValue:forKey:", CFSTR("en"), CFSTR("nz"));
  return v2;
}

+ (BOOL)shouldDisableTranscriptCapabilitiesForFileTransfer:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  uint8_t v9[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(a1, "shouldDisableTranscriptCapabilitiesForTransferWithCommSafetyState:", objc_msgSend(v4, "commSafetySensitive"));
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Tried to check shouldDisableTranscriptCapabilitiesForFileTransfer for a nil fileTransfer. Programming error.", v9, 2u);
      }

    }
    v6 = 0;
  }

  return v6;
}

+ (BOOL)shouldDisableTranscriptCapabilitiesForCKFileTransfer:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  uint8_t v9[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(a1, "shouldDisableTranscriptCapabilitiesForTransferWithCommSafetyState:", objc_msgSend(v4, "commSafetySensitive"));
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Tried to check shouldDisableTranscriptCapabilitiesForCKFileTransfer for a nil ckFileTransfer. Programming error.", v9, 2u);
      }

    }
    v6 = 0;
  }

  return v6;
}

+ (BOOL)shouldDisableTranscriptCapabilitiesForTransferWithCommSafetyState:(int64_t)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0D397A0], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "enablementGroup");

  if (v5 == 2)
    return a3 == 1;
  if (v5 == 1)
    return (unint64_t)(a3 - 1) < 2;
  return 0;
}

@end
