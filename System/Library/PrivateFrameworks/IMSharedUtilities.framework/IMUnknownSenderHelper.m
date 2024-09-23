@implementation IMUnknownSenderHelper

+ (BOOL)receiverIsCandidateForInternationalFiltering:(id)a3
{
  id v3;
  _BOOL4 v4;
  NSObject *v5;
  int v7;
  id v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = +[IMUnknownSenderHelper receivingID:isCountryCode:](IMUnknownSenderHelper, "receivingID:isCountryCode:", v3, CFSTR("tw"));
  if (v4 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412546;
      v8 = v3;
      v9 = 2112;
      v10 = CFSTR("tw");
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Receiving id (%@) with country code (%@) is a candidate for international filtering.", (uint8_t *)&v7, 0x16u);
    }

  }
  return v4;
}

+ (BOOL)accountRegionIsCandidateForInternationalFiltering:(id)a3
{
  id v3;
  NSObject *v4;
  BOOL v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("R:TW")))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v7 = 138412290;
        v8 = v3;
        _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Region (%@) is a candidate for international filtering.", (uint8_t *)&v7, 0xCu);
      }
LABEL_10:

    }
  }
  else
  {
    if (!IMGetDomainBoolForKey())
    {
      v5 = 0;
      goto LABEL_13;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Region is a candidate for international filtering.", (uint8_t *)&v7, 2u);
      }
      goto LABEL_10;
    }
  }
  v5 = 1;
LABEL_13:

  return v5;
}

+ (BOOL)accountCountryIsCandidateForInternationalFiltering:(id)a3
{
  id v3;
  NSObject *v4;
  BOOL v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("tw")))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v7 = 138412290;
        v8 = v3;
        _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Country (%@) is a candidate for international filtering.", (uint8_t *)&v7, 0xCu);
      }
LABEL_10:

    }
  }
  else
  {
    if (!IMGetDomainBoolForKey())
    {
      v5 = 0;
      goto LABEL_13;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        LOWORD(v7) = 0;
        _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Country is a candidate for international filtering.", (uint8_t *)&v7, 2u);
      }
      goto LABEL_10;
    }
  }
  v5 = 1;
LABEL_13:

  return v5;
}

+ (BOOL)shouldShowInternationalSenderWarningForHandleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    MEMORY[0x1A1AE7D34](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "mapID:usingKey:", v5, CFSTR("mapSendingIDForSpamFilter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((IMStringIsEmail() & 1) != 0 || !MEMORY[0x1A1AE7D10](v6))
    {
      v8 = 0;
    }
    else
    {
      IMCountryCodeForNumber();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7 != 0;

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)receivingID:(id)a3 isCountryCode:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "length"))
  {
    MEMORY[0x1A1AE7D34](v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "mapID:usingKey:", v8, CFSTR("mapSendingIDForSpamFilter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (MEMORY[0x1A1AE7D10](v9))
    {
      IMCountryCodeForNumber();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", v7);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

+ (id)mapID:(id)a3 usingKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  IMGetCachedDomainValueForKey();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "objectForKey:", v5), (v9 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = 138412546;
        v13 = v5;
        v14 = 2112;
        v15 = v9;
        _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "Mapping id (%@) to (%@).", (uint8_t *)&v12, 0x16u);
      }

    }
  }
  else
  {
    v9 = v5;
  }

  return v9;
}

@end
