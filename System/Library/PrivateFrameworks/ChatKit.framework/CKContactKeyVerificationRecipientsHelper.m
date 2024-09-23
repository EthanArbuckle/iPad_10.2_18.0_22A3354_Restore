@implementation CKContactKeyVerificationRecipientsHelper

+ (id)recipientsToUpdateForUpdatedCKVHandles:(id)a3 recipients:(id)a4 inConversation:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  NSObject *v27;
  id v29;
  id v30;
  void *v31;
  id v32;
  id obj;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
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
  uint8_t buf[4];
  id v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v30 = a4;
  v29 = a5;
  objc_msgSend(v29, "lastAddressedHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_stripFZIDPrefix");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v48;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v48 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "_stripFZIDPrefix");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v31);

        if (v13)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "Updating atom state for all recipients because self status changed.", buf, 2u);
            }

          }
          v34 = v30;

          goto LABEL_40;
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      if (v9)
        continue;
      break;
    }
  }

  v34 = (id)objc_opt_new();
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v32 = v30;
  v36 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
  if (v36)
  {
    v35 = *(_QWORD *)v44;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v44 != v35)
        {
          v15 = v14;
          objc_enumerationMutation(v32);
          v14 = v15;
        }
        v37 = v14;
        v16 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v14);
        if (objc_msgSend(v16, "isGroup"))
        {
          objc_msgSend(v34, "addObject:", v16);
        }
        else
        {
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v38 = obj;
          v17 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
          if (v17)
          {
            v18 = *(_QWORD *)v40;
            while (2)
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v40 != v18)
                  objc_enumerationMutation(v38);
                objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "_stripFZIDPrefix");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "normalizedAddress");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "_stripFZIDPrefix");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v22, "isEqualToString:", v20))
                {

LABEL_27:
                  objc_msgSend(v34, "addObject:", v16);

                  goto LABEL_28;
                }
                objc_msgSend(v16, "address");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "_stripFZIDPrefix");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v24, "isEqualToString:", v20);

                if (v25)
                  goto LABEL_27;

              }
              v17 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
              if (v17)
                continue;
              break;
            }
          }
LABEL_28:

        }
        v14 = v37 + 1;
      }
      while (v37 + 1 != v36);
      v36 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
    }
    while (v36);
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v34;
      _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "Recipients to update: %@", buf, 0xCu);
    }

  }
LABEL_40:

  return v34;
}

+ (BOOL)shouldShowVerifiedIconForRecipient:(id)a3 inChat:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v16;
  unint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D35848], "sharedController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "selfOptedIn");

  if (!v8)
    goto LABEL_5;
  if (!objc_msgSend(v5, "isGroup"))
  {
    objc_msgSend(v5, "address");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_15;
    objc_msgSend(v5, "normalizedAddress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    IMStripFormattingFromAddress();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D35848], "sharedController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v13, "contactKeyVerificationStatusForHandleID:inChat:", v12, v6);

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v16 = 134218498;
        v17 = v9;
        v18 = 2112;
        v19 = v12;
        v20 = 2112;
        v21 = v6;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Setting kt status %lu to set atom state for address: %@ in chat: %@", (uint8_t *)&v16, 0x20u);
      }

    }
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_5:
    LOBYTE(v10) = 0;
    goto LABEL_15;
  }
  v9 = objc_msgSend(v6, "keyTransparencyStatusForAffectedHandles:", 0);
LABEL_12:
  if (v9 <= 0xE)
    LODWORD(v10) = (0x110u >> v9) & 1;
  else
    LOBYTE(v10) = 0;
LABEL_15:

  return (char)v10;
}

@end
