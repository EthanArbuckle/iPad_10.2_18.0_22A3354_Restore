@implementation IMSpamFilterHelper

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
    objc_msgSend(a1, "mapID:usingKey:", v8, CFSTR("mapReceivingIDForSpamFilter"));
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

+ (id)telephonyCountryCodesEligibleForJunkFiltering
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[IMDeviceUtilities isInternalInstall](IMDeviceUtilities, "isInternalInstall"))
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("telephony-imessage-junk-filter-internal"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
      goto LABEL_10;
    objc_msgSend(v3, "objectForKey:", CFSTR("telephony-imessage-junk-filter-seed"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v5, "count"))
    {
      objc_msgSend(v3, "objectForKey:", CFSTR("telephony-imessage-junk-filter"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
LABEL_8:
    v4 = v5;
    goto LABEL_10;
  }
  if (+[IMDeviceUtilities isSeedInstall](IMDeviceUtilities, "isSeedInstall"))
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("telephony-imessage-junk-filter-seed"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
      goto LABEL_10;
    objc_msgSend(v3, "objectForKey:", CFSTR("telephony-imessage-junk-filter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("telephony-imessage-junk-filter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  if (!objc_msgSend(v4, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "Server bagged values for junk not found. Using local values of this release.", (uint8_t *)&v12, 2u);
      }

    }
    objc_msgSend((id)objc_opt_class(), "defaultTelephonyCountryCodesEligibleForJunkFiltering");
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  objc_msgSend(a1, "_additionalTelephonyCountryCodesEligibleForJunkFiltering");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v9;
      _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "iMessage junk enabled for: %@", (uint8_t *)&v12, 0xCu);
    }

  }
  return v9;
}

+ (BOOL)receiverIsCandidateForiMessageJunk:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  BOOL v11;
  NSObject *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  IMGetCachedDomainValueForKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Default set, country is a candidate for imessage junk.", buf, 2u);
      }

    }
LABEL_20:
    v11 = 1;
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend((id)objc_opt_class(), "telephonyCountryCodesEligibleForJunkFiltering", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (+[IMSpamFilterHelper receivingID:isCountryCode:](IMSpamFilterHelper, "receivingID:isCountryCode:", v3, v10))
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v12 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v19 = v3;
                v20 = 2112;
                v21 = v10;
                _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "Receiving id (%@) with country code (%@) is a candidate for imessage junk.", buf, 0x16u);
              }

            }
            goto LABEL_20;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        if (v7)
          continue;
        break;
      }
    }

    v11 = 0;
  }

  return v11;
}

+ (id)accountRegionsEligibleForJunkFiltering
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[IMDeviceUtilities isInternalInstall](IMDeviceUtilities, "isInternalInstall"))
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("accounts-imessage-junk-filter-internal"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
      goto LABEL_10;
    objc_msgSend(v3, "objectForKey:", CFSTR("accounts-imessage-junk-filter-seed"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v5, "count"))
    {
      objc_msgSend(v3, "objectForKey:", CFSTR("accounts-imessage-junk-filter"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
LABEL_8:
    v4 = v5;
    goto LABEL_10;
  }
  if (+[IMDeviceUtilities isSeedInstall](IMDeviceUtilities, "isSeedInstall"))
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("accounts-imessage-junk-filter-seed"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
      goto LABEL_10;
    objc_msgSend(v3, "objectForKey:", CFSTR("accounts-imessage-junk-filter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  objc_msgSend(v3, "objectForKey:", CFSTR("accounts-imessage-junk-filter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  if (!objc_msgSend(v4, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "Server bagged values for junk not found. Using local values of this release.", (uint8_t *)&v12, 2u);
      }

    }
    objc_msgSend((id)objc_opt_class(), "defaultAccountRegionsEligibleForJunkFiltering");
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  objc_msgSend(a1, "_additionalAccountRegionsEligibleForJunkFiltering");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = 138412290;
      v13 = v9;
      _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "iMessage junk enabled for: %@", (uint8_t *)&v12, 0xCu);
    }

  }
  return v9;
}

+ (BOOL)accountCountryIsCandidateForiMessageJunk:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSObject *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  id v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend((id)objc_opt_class(), "accountRegionsEligibleForJunkFiltering", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        if (objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v15 = v3;
              _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Country (%@) is a candidate for imessage junk.", buf, 0xCu);
            }

          }
          LOBYTE(v5) = 1;
          goto LABEL_15;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_15:

  return v5;
}

+ (id)_additionalTelephonyCountryCodesEligibleForJunkFiltering
{
  void *v2;
  id v3;

  IMGetCachedDomainValueForKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = (id)MEMORY[0x1E0C9AA60];

  return v3;
}

+ (id)_additionalAccountRegionsEligibleForJunkFiltering
{
  void *v2;
  id v3;

  IMGetCachedDomainValueForKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = (id)MEMORY[0x1E0C9AA60];

  return v3;
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

+ (id)defaultTelephonyCountryCodesEligibleForJunkFiltering
{
  if (qword_1EE503FE0 != -1)
    dispatch_once(&qword_1EE503FE0, &unk_1E3FB3888);
  return (id)qword_1EE503FD8;
}

+ (id)defaultAccountRegionsEligibleForJunkFiltering
{
  if (qword_1EE503FF0 != -1)
    dispatch_once(&qword_1EE503FF0, &unk_1E3FB4568);
  return (id)qword_1EE503FE8;
}

+ (BOOL)isiMessageJunkFilterEnabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  _QWORD block[4];
  id v14;

  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("apply-imessage-junk-filter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (unint64_t)objc_msgSend(v3, "unsignedIntegerValue") <= 1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19E2C3384;
    block[3] = &unk_1E3FB6B98;
    v14 = v4;
    if (qword_1EE503A18 != -1)
      dispatch_once(&qword_1EE503A18, block);

    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  IMGetCachedDomainValueForKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = sub_19E2C3484;
    v11 = &unk_1E3FB6B98;
    v12 = v4;
    if (qword_1EE503FF8 != -1)
      dispatch_once(&qword_1EE503FF8, &v8);
    v5 = objc_msgSend(v6, "BOOLValue", v8, v9, v10, v11);

  }
  return v5;
}

+ (BOOL)shouldDowngradeToRecipient:(id)a3 fromSender:(id)a4 ifCapableOfSMS:(BOOL)a5 withConversationDowngradeState:(BOOL)a6 andConversationHistoryState:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  const __CFString *v16;
  const __CFString *v17;
  BOOL v18;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v7 = a7;
  v8 = a6;
  v28 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  if (!objc_msgSend(a1, "isInternationalSpamFilteringEnabled")
    || !objc_msgSend(a1, "receiverIsCandidateForHawking:", v12))
  {
    goto LABEL_35;
  }
  if (!a5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v20 = 138412290;
        v21 = v13;
        _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "Sender (%@) incapable of sending SMS, ineligible for downgrade.", (uint8_t *)&v20, 0xCu);
      }
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  if ((objc_msgSend(a1, "senderIsCandidateForSMSDowngrade:", v13) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v20 = 138412546;
        v21 = v13;
        v22 = 2112;
        v23 = v12;
        _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "Conversation from (%@) to (%@) is not eligible for SMS downgrade.", (uint8_t *)&v20, 0x16u);
      }
      goto LABEL_34;
    }
    goto LABEL_35;
  }
  if (v7)
  {
    if (!v8)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v20 = 138412546;
          v21 = v13;
          v22 = 2112;
          v23 = v12;
          _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "Conversation from (%@) to (%@) has history, not eligible for SMS downgrade.", (uint8_t *)&v20, 0x16u);
        }
        goto LABEL_34;
      }
LABEL_35:
      v18 = 0;
      goto LABEL_36;
    }
    if (objc_msgSend(a1, "isChineseSpamFilteringEnabled")
      && objc_msgSend(a1, "senderIsChinaHandle:", v13))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v20 = 138412546;
          v21 = v13;
          v22 = 2112;
          v23 = v12;
          _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "Conversation from (%@) to (%@) has history and was downgraded, but overriding for CN-CN filtering.", (uint8_t *)&v20, 0x16u);
        }
LABEL_34:

        goto LABEL_35;
      }
      goto LABEL_35;
    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = CFSTR("NO");
      v20 = 138413058;
      v21 = v13;
      if (v8)
        v17 = CFSTR("YES");
      else
        v17 = CFSTR("NO");
      v22 = 2112;
      v23 = v12;
      if (v7)
        v16 = CFSTR("YES");
      v24 = 2112;
      v25 = v17;
      v26 = 2112;
      v27 = v16;
      _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "Initiating SMS downgrade for conversation from (%@) to (%@): conversationWasDowngraded: %@, hasHistoryWithSender: %@.", (uint8_t *)&v20, 0x2Au);
    }

  }
  v18 = 1;
LABEL_36:

  return v18;
}

+ (BOOL)shouldShowSMSWarningForSender:(id)a3 forRecipient:(id)a4 withConversationHistory:(BOOL)a5
{
  id v8;
  id v9;
  BOOL v10;
  NSObject *v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (a5)
    goto LABEL_2;
  if ((objc_msgSend(a1, "isInternationalSpamFilteringEnabled") & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "International spam filtering not enabled.", (uint8_t *)&v14, 2u);
      }

    }
    goto LABEL_2;
  }
  if (!v9
    || !objc_msgSend(a1, "receiverIsCandidateForHawking:", v9)
    || !objc_msgSend(v8, "length")
    || !IMStringIsEmail())
  {
LABEL_2:
    v10 = 0;
    goto LABEL_3;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "Should show blackhole warning for conversation from (%@) to (%@).", (uint8_t *)&v14, 0x16u);
    }

  }
  v10 = 1;
LABEL_3:

  return v10;
}

+ (BOOL)shouldBlackholeMessageFromSender:(id)a3 toRecipient:(id)a4 ifRecipientIsCandidate:(BOOL)a5 givenHistory:(BOOL)a6 forEligibleAccounts:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL4 v8;
  id v12;
  id v13;
  NSObject *v14;
  int v15;
  int v16;
  BOOL v17;
  NSObject *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v7 = a7;
  v8 = a6;
  v24 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  if ((objc_msgSend(a1, "isBlackholeEnabledForEligibleAccounts:", v7) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "User ineligible for blackhole.", (uint8_t *)&v20, 2u);
      }
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  if (!a5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v20 = 138412290;
        v21 = v13;
        _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "Receiver (%@) is not a candidate for blackhole.", (uint8_t *)&v20, 0xCu);
      }
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  if (v8)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v20 = 138412546;
        v21 = v12;
        v22 = 2112;
        v23 = v13;
        _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "Sender (%@) has history with recipient (%@).", (uint8_t *)&v20, 0x16u);
      }
LABEL_25:

      goto LABEL_26;
    }
    goto LABEL_26;
  }
  if ((objc_msgSend(a1, "senderIsCandidateForBlackhole:", v12) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v20 = 138412546;
        v21 = v12;
        v22 = 2112;
        v23 = v13;
        _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "Sender (%@) to (%@) is not a candidate for blackhole.", (uint8_t *)&v20, 0x16u);
      }
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  v15 = objc_msgSend(a1, "senderIsKnownContact:", v12);
  v16 = IMOSLoggingEnabled();
  if (v15)
  {
    if (v16)
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v20 = 138412546;
        v21 = v12;
        v22 = 2112;
        v23 = v13;
        _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "Known contact, will not black hole message from (%@) to (%@).", (uint8_t *)&v20, 0x16u);
      }
      goto LABEL_25;
    }
LABEL_26:
    v17 = 0;
    goto LABEL_27;
  }
  if (v16)
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = 138412546;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      _os_log_impl(&dword_19E239000, v19, OS_LOG_TYPE_INFO, "Should blackhole message from (%@) to (%@).", (uint8_t *)&v20, 0x16u);
    }

  }
  v17 = 1;
LABEL_27:

  return v17;
}

+ (BOOL)shouldBlackholeGroupMessageFromSender:(id)a3 toRecipient:(id)a4 ifRecipientIsCandidate:(BOOL)a5 withOtherParticipants:(id)a6 givenHistory:(BOOL)a7 forEligibleAccounts:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  BOOL v18;
  void *v20;
  NSObject *v21;
  int v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v8 = a8;
  v9 = a7;
  v26 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  if ((objc_msgSend(a1, "isBlackholeEnabledForEligibleAccounts:", v8) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_INFO, "User ineligible for blackhole.", (uint8_t *)&v22, 2u);
      }
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (!a5)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v22 = 138412290;
        v23 = v15;
        _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_INFO, "Receiver (%@) is not a candidate for blackhole.", (uint8_t *)&v22, 0xCu);
      }
      goto LABEL_15;
    }
LABEL_16:
    v18 = 0;
    goto LABEL_17;
  }
  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v22 = 138412290;
        v23 = v14;
        _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_INFO, "Sender (%@) has history with someone in group conversation.", (uint8_t *)&v22, 0xCu);
      }
LABEL_15:

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  objc_msgSend(v16, "arrayByAddingObject:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "anyParticipantIsCandidateForBlackhole:", v20)
    && (objc_msgSend(a1, "anyParticipantIsKnownContact:", v20) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = 138412546;
        v23 = v14;
        v24 = 2112;
        v25 = v15;
        _os_log_impl(&dword_19E239000, v21, OS_LOG_TYPE_INFO, "Should blackhole group message from (%@) to (%@).", (uint8_t *)&v22, 0x16u);
      }

    }
    v18 = 1;
  }
  else
  {
    v18 = 0;
  }

LABEL_17:
  return v18;
}

+ (BOOL)isBlackholeEnabledForEligibleAccounts:(BOOL)a3
{
  _BOOL4 v3;
  char v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  __int16 v12;
  uint8_t buf[16];
  __int16 v14;
  __int16 v15;

  v3 = a3;
  if ((objc_msgSend(a1, "isInternationalSpamFilteringEnabled") & 1) == 0)
  {
    v6 = IMOSLoggingEnabled();
    if (!v6)
      return v6;
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_19;
    v15 = 0;
    v9 = "Blackhole disabled; international spam filtering not enabled.";
    v10 = (uint8_t *)&v15;
LABEL_18:
    _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
    goto LABEL_19;
  }
  v5 = objc_msgSend(a1, "isFilterUnknownSendersEnabled");
  v6 = IMOSLoggingEnabled();
  if ((v5 & 1) == 0)
  {
    if (!v6)
      return v6;
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      goto LABEL_19;
    v14 = 0;
    v9 = "Blackhole disabled; user has disabled filtering unknown senders.";
    v10 = (uint8_t *)&v14;
    goto LABEL_18;
  }
  if (!v3)
  {
    if (!v6)
      return v6;
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12 = 0;
      v9 = "Blackhole disabled; active accounts ineligble.";
      v10 = (uint8_t *)&v12;
      goto LABEL_18;
    }
LABEL_19:

    LOBYTE(v6) = 0;
    return v6;
  }
  if (v6)
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "Blackhole enabled; active accounts eligible.", buf, 2u);
    }

  }
  LOBYTE(v6) = 1;
  return v6;
}

+ (BOOL)receiverIsCandidateForHawking:(id)a3
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
  v4 = +[IMSpamFilterHelper receivingID:isCountryCode:](IMSpamFilterHelper, "receivingID:isCountryCode:", v3, CFSTR("cn"));
  if (v4 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412546;
      v8 = v3;
      v9 = 2112;
      v10 = CFSTR("cn");
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Receiving id (%@) with country code (%@) is a candidate for hawking.", (uint8_t *)&v7, 0x16u);
    }

  }
  return v4;
}

+ (BOOL)receiverIsEnabledForSMSFilter:(id)a3
{
  id v3;
  void *v4;
  char v5;
  BOOL v6;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("us")))
  {
    +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSMSFilterEnabledForUS");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("gb")))
    {
      v6 = 1;
      goto LABEL_7;
    }
    +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSMSFilterEnabledForUK");
  }
  v6 = v5;

LABEL_7:
  return v6;
}

+ (BOOL)receiverIsCandidateForSMSFilter:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  BOOL v8;
  NSObject *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(&unk_1E3FFEFC0, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(&unk_1E3FFEFC0);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (+[IMSpamFilterHelper receivingID:isCountryCode:](IMSpamFilterHelper, "receivingID:isCountryCode:", v3, v7))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v16 = v3;
              v17 = 2112;
              v18 = v7;
              _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Receiving id (%@) with country code (%@) is a candidate for load but set to none filter.", buf, 0x16u);
            }

          }
          v8 = +[IMSpamFilterHelper receiverIsEnabledForSMSFilter:](IMSpamFilterHelper, "receiverIsEnabledForSMSFilter:", v7);
          goto LABEL_15;
        }
      }
      v4 = objc_msgSend(&unk_1E3FFEFC0, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_15:

  return v8;
}

+ (BOOL)receiverIsCandidateForDefaultAppleSMSFilter:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  NSObject *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(&unk_1E3FFEFD8, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(&unk_1E3FFEFD8);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (+[IMSpamFilterHelper receivingID:isCountryCode:](IMSpamFilterHelper, "receivingID:isCountryCode:", v3, v7))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v15 = v3;
              v16 = 2112;
              v17 = v7;
              _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Receiving id (%@) with country code (%@) is a candidate for first party sms filtering.", buf, 0x16u);
            }

          }
          LOBYTE(v4) = 1;
          goto LABEL_15;
        }
      }
      v4 = objc_msgSend(&unk_1E3FFEFD8, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_15:

  return v4;
}

+ (BOOL)receiverIsCandidateForAppleSMSFilterSubClassification:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  NSObject *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(&unk_1E3FFEFF0, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(&unk_1E3FFEFF0);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (+[IMSpamFilterHelper receivingID:isCountryCode:](IMSpamFilterHelper, "receivingID:isCountryCode:", v3, v7))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v15 = v3;
              v16 = 2112;
              v17 = v7;
              _os_log_impl(&dword_19E239000, v8, OS_LOG_TYPE_INFO, "Receiving id (%@) with country code (%@) is a candidate for SMS subclassification.", buf, 0x16u);
            }

          }
          LOBYTE(v4) = 1;
          goto LABEL_15;
        }
      }
      v4 = objc_msgSend(&unk_1E3FFEFF0, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_15:

  return v4;
}

+ (BOOL)receiverIsCandidateForSMSFilterWithSimSlot:(int64_t)a3
{
  void *v4;
  NSObject *v5;
  BOOL v6;
  int v8;
  int64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[IMCTSMSUtilities IMCountryCodeForSimSlot:](IMCTSMSUtilities, "IMCountryCodeForSimSlot:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(&unk_1E3FFEFC0, "containsObject:", v4))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v8 = 134218242;
        v9 = a3;
        v10 = 2112;
        v11 = v4;
        _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Receiving sim slot (%ld) with country code (%@) is a candidate for load but set to none filter.", (uint8_t *)&v8, 0x16u);
      }

    }
    v6 = +[IMSpamFilterHelper receiverIsEnabledForSMSFilter:](IMSpamFilterHelper, "receiverIsEnabledForSMSFilter:", v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)receiverIsCandidateForDefaultAppleSMSFilterWithSimSlot:(int64_t)a3
{
  void *v4;
  NSObject *v5;
  BOOL v6;
  int v8;
  int64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[IMCTSMSUtilities IMCountryCodeForSimSlot:](IMCTSMSUtilities, "IMCountryCodeForSimSlot:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(&unk_1E3FFEFD8, "containsObject:", v4))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v8 = 134218242;
        v9 = a3;
        v10 = 2112;
        v11 = v4;
        _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Receiving sim slot (%ld) with country code (%@) is a candidate for first party sms filtering.", (uint8_t *)&v8, 0x16u);
      }

    }
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)receiverIsCandidateForAppleSMSFilterSubClassificationWithSimSlot:(int64_t)a3
{
  void *v4;
  NSObject *v5;
  BOOL v6;
  int v8;
  int64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[IMCTSMSUtilities IMCountryCodeForSimSlot:](IMCTSMSUtilities, "IMCountryCodeForSimSlot:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(&unk_1E3FFEFF0, "containsObject:", v4))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v8 = 134218242;
        v9 = a3;
        v10 = 2112;
        v11 = v4;
        _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Receiving sim slot (%ld) with country code (%@) is a candidate for SMS subclassification.", (uint8_t *)&v8, 0x16u);
      }

    }
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)accountRegionIsCandidateForHawking:(id)a3
{
  __CFString *v3;
  NSObject *v4;
  BOOL v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("R:CN")))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v7 = 138412290;
        v8 = v3;
        _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Region (%@) is a candidate for spam filtering.", (uint8_t *)&v7, 0xCu);
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
        v7 = 138412290;
        v8 = CFSTR("is");
        _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Region %@ a candidate for spam filtering.", (uint8_t *)&v7, 0xCu);
      }
      goto LABEL_10;
    }
  }
  v5 = 1;
LABEL_13:

  return v5;
}

+ (BOOL)accountCountryIsCandidateForHawking:(id)a3
{
  id v3;
  NSObject *v4;
  BOOL v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("cn")))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v7 = 138412290;
        v8 = v3;
        _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Country (%@) is a candidate for hawking.", (uint8_t *)&v7, 0xCu);
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
        _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Country is a candidate for hawking.", (uint8_t *)&v7, 2u);
      }
      goto LABEL_10;
    }
  }
  v5 = 1;
LABEL_13:

  return v5;
}

+ (BOOL)accountCountryIsCandidateForSMSFilter:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  int v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(&unk_1E3FFEFC0, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(&unk_1E3FFEFC0);
        v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v3, "isEqualToString:", v8))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v20 = v3;
              _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "Country (%@) is a candidate for first party sms filtering.", buf, 0xCu);
            }

          }
          v11 = +[IMSpamFilterHelper receiverIsEnabledForSMSFilter:](IMSpamFilterHelper, "receiverIsEnabledForSMSFilter:", v8);
          goto LABEL_22;
        }
        objc_msgSend(&unk_1E3FFEFA8, "objectAtIndex:", v5 + i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = IMGetDomainBoolForKey();

        if (v10)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "Country is a candidate for first party sms filtering.", buf, 2u);
            }

          }
          v11 = 1;
          goto LABEL_22;
        }
      }
      v4 = objc_msgSend(&unk_1E3FFEFC0, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      v11 = 0;
      v5 += i;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_22:

  return v11;
}

+ (BOOL)senderIsCandidateForSMSDowngrade:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    MEMORY[0x1A1AE7D34](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "mapID:usingKey:", v5, CFSTR("mapSendingIDForSpamFilter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMStringIsEmail())
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v20 = 138412290;
          v21 = v6;
          _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "Sender (%@) is an email, cannot downgrade to SMS.", (uint8_t *)&v20, 0xCu);
        }

      }
    }
    else
    {
      if (MEMORY[0x1A1AE7D10](v6))
      {
        IMCountryCodeForNumber();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqualToString:", CFSTR("cn"))
          && !objc_msgSend(a1, "isChineseSpamFilteringEnabled"))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              v20 = 138412546;
              v21 = v6;
              v22 = 2112;
              v23 = v9;
              _os_log_impl(&dword_19E239000, v18, OS_LOG_TYPE_INFO, "Sender (%@) with country code (%@) should not be downgraded to SMS.", (uint8_t *)&v20, 0x16u);
            }

          }
          v8 = 0;
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              v20 = 138412546;
              v21 = v6;
              v22 = 2112;
              v23 = v9;
              _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "Sender (%@) with country code (%@) should be downgraded to SMS.", (uint8_t *)&v20, 0x16u);
            }

          }
          v8 = 1;
        }

        goto LABEL_26;
      }
      IMLogHandleForCategory("SpamFilter");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_19E36DC2C((uint64_t)v6, v11, v12, v13, v14, v15, v16, v17);

    }
    v8 = 0;
LABEL_26:

    goto LABEL_27;
  }
  v8 = 1;
LABEL_27:

  return v8;
}

+ (BOOL)senderIsChinaHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

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
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("cn"));

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)senderIsCandidateForBlackhole:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  __CFString *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  int v21;
  void *v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    MEMORY[0x1A1AE7D34](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "mapID:usingKey:", v5, CFSTR("mapSendingIDForSpamFilter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (IMStringIsEmail())
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v21 = 138412546;
          v22 = v6;
          v23 = 2112;
          v24 = CFSTR("R:CN");
          _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "Sender (%@) should be blackholed for (%@) receiver.", (uint8_t *)&v21, 0x16u);
        }

      }
    }
    else
    {
      if (MEMORY[0x1A1AE7D10](v6))
      {
        IMCountryCodeForNumber();
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("cn"))
          && !+[IMSpamFilterHelper isChineseSpamFilteringEnabled](IMSpamFilterHelper, "isChineseSpamFilteringEnabled"))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              v21 = 138412546;
              v22 = v6;
              v23 = 2112;
              v24 = v9;
              _os_log_impl(&dword_19E239000, v19, OS_LOG_TYPE_INFO, "Sender (%@) with country code (%@) should not be blackholed.", (uint8_t *)&v21, 0x16u);
            }

          }
          v8 = 0;
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              v21 = 138412546;
              v22 = v6;
              v23 = 2112;
              v24 = v9;
              _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "Sender (%@) with country code (%@) should be blackholed.", (uint8_t *)&v21, 0x16u);
            }

          }
          v8 = 1;
        }

        goto LABEL_32;
      }
      if (MEMORY[0x1A1AE7CF8](v6))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            v21 = 138412290;
            v22 = v6;
            _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Sender (%@) is business chat, should not be blackholed.", (uint8_t *)&v21, 0xCu);
          }

        }
        v8 = 0;
        goto LABEL_32;
      }
      IMLogHandleForCategory("SpamFilter");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_19E36DC94((uint64_t)v6, v12, v13, v14, v15, v16, v17, v18);

    }
    v8 = 1;
LABEL_32:

    goto LABEL_33;
  }
  v8 = 1;
LABEL_33:

  return v8;
}

+ (BOOL)anyParticipantIsCandidateForBlackhole:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSObject *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v5);
          if ((objc_msgSend(a1, "senderIsCandidateForBlackhole:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12) & 1) != 0)
          {

            v10 = 1;
            goto LABEL_16;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
        if (v6)
          continue;
        break;
      }
    }

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v5;
        _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "No participants are candidates for blackhole: (%@)", buf, 0xCu);
      }

    }
  }
  v10 = 0;
LABEL_16:

  return v10;
}

+ (BOOL)anyParticipantIsKnownContact:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSObject *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v5);
          if ((objc_msgSend(a1, "isKnownContact:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12) & 1) != 0)
          {

            v10 = 1;
            goto LABEL_16;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
        if (v6)
          continue;
        break;
      }
    }

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v5;
        _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "No known contacts in participants list: (%@)", buf, 0xCu);
      }

    }
  }
  v10 = 0;
LABEL_16:

  return v10;
}

+ (void)participantsAreiMessagable:(id)a3 completionBlock:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v6 = *MEMORY[0x1E0D34240];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_19E2DD068;
  v8[3] = &unk_1E3FB8178;
  v9 = v5;
  v7 = v5;
  +[IMIDSIDQueryController refreshIDStatusForDestinations:service:listenerID:queue:completionBlock:](IMIDSIDQueryController, "refreshIDStatusForDestinations:service:listenerID:queue:completionBlock:", a3, v6, CFSTR("IMChatServiceForSendingIDSQueryControllerListenerID"), MEMORY[0x1E0C80D38], v8);

}

+ (id)sanitizeParticipants:(id)a3 excludingHandles:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 *v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  id v31;
  void *v32;
  id v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v32 = v5;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v31 = v6;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v48;
      v12 = (__int128 *)MEMORY[0x1E0D17858];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v48 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "_stripFZIDPrefix");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (MEMORY[0x1A1AE7D10]())
          {
            IMCountryCodeForNumber();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v12[1];
            v43 = *v12;
            v44 = v16;
            v17 = v12[3];
            v45 = v12[2];
            v46 = v17;
            objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
            PNDecomposeForCountry();
            if ((_QWORD)v45 && DWORD2(v45))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
                objc_msgSend(v7, "addObject:", v18);

            }
          }
          else
          {
            objc_msgSend(v7, "addObject:", v14);
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      }
      while (v10);
    }

    v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v32, "count"));
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v32;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v40 != v21)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "_stripFZIDPrefix");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%@ ENDSWITH SELF"), v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 0u;
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v25 = v7;
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
          if (v26)
          {
            v27 = v26;
            v28 = *(_QWORD *)v36;
            while (2)
            {
              for (k = 0; k != v27; ++k)
              {
                if (*(_QWORD *)v36 != v28)
                  objc_enumerationMutation(v25);
                if ((objc_msgSend(v24, "evaluateWithObject:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * k)) & 1) != 0)
                {

                  goto LABEL_32;
                }
              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v51, 16);
              if (v27)
                continue;
              break;
            }
          }

          objc_msgSend(v33, "addObject:", v23);
LABEL_32:

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v52, 16);
      }
      while (v20);
    }

    v6 = v31;
    v5 = v32;
  }
  else
  {
    objc_msgSend(v5, "__imArrayByApplyingBlock:", &unk_1E3FB3A28);
    v33 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v33;
}

+ (BOOL)isKnownContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void **v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    MEMORY[0x1A1AE7D34](v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_class();
    v19[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_cnRecordForAliases:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!qword_1EE504160)
    {
      v9 = (void **)MEMORY[0x1A1AE7D58]("IMDCNPersonNotFound", CFSTR("IMDPersistence"));
      if (v9)
        v10 = *v9;
      else
        v10 = 0;
      objc_storeStrong((id *)&qword_1EE504160, v10);
    }
    if (v8 && (objc_msgSend(v8, "containsString:", qword_1EE504160) & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v15 = 138412546;
          v16 = v4;
          v17 = 2112;
          v18 = v8;
          _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "Identified known alias (%@) which maps to cnRecordID (%@).", (uint8_t *)&v15, 0x16u);
        }

      }
      v11 = 1;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v15 = 138412290;
          v16 = v4;
          _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "Sender (%@) is not a known contact", (uint8_t *)&v15, 0xCu);
        }

      }
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)_cnRecordForAliases:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (qword_1EE504170 != -1)
    dispatch_once(&qword_1EE504170, &unk_1E3FB8198);
  if (off_1EE504168)
  {
    off_1EE504168(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)isInternationalSpamFilteringEnabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  _QWORD block[4];
  id v14;

  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("apply-international-spam-filter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (unint64_t)objc_msgSend(v3, "unsignedIntegerValue") <= 1)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19E2DDAA0;
    block[3] = &unk_1E3FB6B98;
    v14 = v4;
    if (qword_1ECFC7188 != -1)
      dispatch_once(&qword_1ECFC7188, block);

    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  IMGetCachedDomainValueForKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = sub_19E2DDBA0;
    v11 = &unk_1E3FB6B98;
    v12 = v4;
    if (qword_1EE504178 != -1)
      dispatch_once(&qword_1EE504178, &v8);
    v5 = objc_msgSend(v6, "BOOLValue", v8, v9, v10, v11);

  }
  return v5;
}

+ (BOOL)isChineseSpamFilteringEnabled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  _QWORD block[4];
  id v9;

  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("apply-chinese-spam-filter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (unint64_t)objc_msgSend(v3, "unsignedIntegerValue") <= 1)
  {
    if (qword_1EE504188 != -1)
      dispatch_once(&qword_1EE504188, &unk_1E3FB47E8);
    byte_1EE504180 = 1;
  }
  IMGetCachedDomainValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19E2DDE7C;
    block[3] = &unk_1E3FB6B98;
    v9 = v4;
    if (qword_1EE504190 != -1)
      dispatch_once(&qword_1EE504190, block);
    v6 = objc_msgSend(v5, "BOOLValue");

  }
  else
  {
    v6 = byte_1EE504180;
  }

  return v6;
}

+ (BOOL)isFilterUnknownSendersEnabled
{
  return IMGetDomainBoolForKey();
}

+ (id)internationalSpamFilterLearnMoreURL
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("international-spam-filter-learn-more-url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          v7 = 138412290;
          v8 = v3;
          _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Received learn more URL from server: %@", (uint8_t *)&v7, 0xCu);
        }

      }
      objc_storeStrong((id *)&qword_1EE5010B8, v3);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", qword_1EE5010B8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
