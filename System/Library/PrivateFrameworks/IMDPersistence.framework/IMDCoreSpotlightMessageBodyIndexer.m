@implementation IMDCoreSpotlightMessageBodyIndexer

+ (void)indexItem:(id)a3 withChat:(id)a4 isReindexing:(BOOL)a5 metadataToUpdate:(id)a6 timingProfiler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  int v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  objc_msgSend(v11, "objectForKey:", CFSTR("balloonBundleID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_1ABB60000, v16, OS_LOG_TYPE_INFO, "Message is a balloon plugin type, deferring to later indexers", (uint8_t *)&v26, 2u);
      }

    }
  }
  else
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("attributedBody"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "string");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    _IMDCoreSpotlightStrippedBody(v11, (uint64_t)CFSTR("plainBody"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "isInternalInstall"))
    {
      v21 = IMGetCachedDomainBoolForKeyWithDefaultValue();

      if (v21)
      {
        if (objc_msgSend(v19, "isEqualToString:", CFSTR("poison_abort")))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              LOWORD(v26) = 0;
              _os_log_impl(&dword_1ABB60000, v25, OS_LOG_TYPE_INFO, "IMDCoreSpotlightMessageBodyIndexer - Poison pill abort detected, crashing!", (uint8_t *)&v26, 2u);
            }

          }
          abort();
        }
        if (objc_msgSend(v19, "isEqualToString:", CFSTR("poison_spin")))
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              LOWORD(v26) = 0;
              _os_log_impl(&dword_1ABB60000, v22, OS_LOG_TYPE_INFO, "(IMDCoreSpotlightMessageBodyIndexer - Poison pill spin detected, hanging!", (uint8_t *)&v26, 2u);
            }

          }
          while (1)
            ;
        }
      }
    }
    else
    {

    }
    objc_msgSend(v13, "setTextContent:", v19);
    objc_msgSend(a1, "indexTypeCustomKey");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setValue:forCustomKey:", CFSTR("msg"), v23);

    objc_msgSend(v13, "setMessageType:", CFSTR("msg"));
    if (objc_msgSend(MEMORY[0x1E0D397C8], "verboseLoggingEnabled") && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v26 = 138412290;
        v27 = v19;
        _os_log_impl(&dword_1ABB60000, v24, OS_LOG_TYPE_INFO, "setting text content %@", (uint8_t *)&v26, 0xCu);
      }

    }
  }

}

@end
