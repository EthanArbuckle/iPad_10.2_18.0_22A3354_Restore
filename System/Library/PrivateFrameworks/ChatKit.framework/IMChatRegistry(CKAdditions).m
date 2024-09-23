@implementation IMChatRegistry(CKAdditions)

- (id)_ck_chatForHandles:()CKAdditions displayName:lastAddressedHandle:lastAddressedSIMID:joinedChatsOnly:findMatchingNamedGroups:createIfNecessary:
{
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  id v36;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  id obj;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[4];
  id v62;
  __int16 v63;
  id v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v44 = a4;
  v42 = a5;
  v43 = a6;
  v45 = v15;
  if (CKIsRunningUITests())
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v58 != v19)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * i), "ID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "_appearsToBePhoneNumber"))
          {
            IMInternationalForPhoneNumberWithOptions();
            v22 = objc_claimAutoreleasedReturnValue();

            v21 = (void *)v22;
          }
          IMStripFormattingFromAddress();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v23);

        }
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
      }
      while (v18);
    }

    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "simulatedChats");
    obj = (id)objc_claimAutoreleasedReturnValue();

    v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
    if (v48)
    {
      v47 = *(_QWORD *)v54;
      while (2)
      {
        for (j = 0; j != v48; ++j)
        {
          if (*(_QWORD *)v54 != v47)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          objc_msgSend(v26, "participants");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
          if (v29)
          {
            v30 = *(_QWORD *)v50;
            do
            {
              for (k = 0; k != v29; ++k)
              {
                if (*(_QWORD *)v50 != v30)
                  objc_enumerationMutation(v28);
                objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * k), "ID");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                IMStripFormattingFromAddress();
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "addObject:", v33);

              }
              v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
            }
            while (v29);
          }

          objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v16);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v27, "isEqualToSet:", v34);

          if (v35)
          {
            v36 = v26;

            goto LABEL_32;
          }

        }
        v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
        if (v48)
          continue;
        break;
      }
    }
    v36 = 0;
LABEL_32:

  }
  else if ((unint64_t)objc_msgSend(v15, "count") < 2)
  {
    if (objc_msgSend(v15, "count") == 1)
    {
      objc_msgSend(v15, "objectAtIndex:", 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "existingChatWithHandle:allowAlternativeService:", v38, 0);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      if (!v36 && a9)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v62 = v42;
            v63 = 2112;
            v64 = v43;
            _os_log_impl(&dword_18DFCD000, v39, OS_LOG_TYPE_INFO, "Creating chat with last addressed handle %@ last addressed sim ID %@", buf, 0x16u);
          }

        }
        objc_msgSend(a1, "chatWithHandle:lastAddressedHandle:lastAddressedSIMID:", v38, v42, v43);
        v36 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(19);
        OSLogHandleForIMFoundationCategory();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v62 = v15;
          _os_log_impl(&dword_18DFCD000, v41, OS_LOG_TYPE_DEBUG, "Bad recipients for conversation request. %@", buf, 0xCu);
        }

      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
        _CKLog();
      v36 = 0;
    }
  }
  else
  {
    if ((_DWORD)a8)
    {
      objc_msgSend(a1, "existingChatWithHandles:allowAlternativeService:groupID:displayName:joinedChatsOnly:", v15, 0, 0, v44, a7);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      if (v36)
        goto LABEL_33;
    }
    else
    {
      v36 = 0;
    }
    if (a9)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v62 = v42;
          v63 = 2112;
          v64 = v43;
          _os_log_impl(&dword_18DFCD000, v40, OS_LOG_TYPE_INFO, "Creating group chat with last addressed handle %@ last addressed sim ID %@", buf, 0x16u);
        }

      }
      objc_msgSend(a1, "chatWithHandles:displayName:joinedChatsOnly:findMatchingNamedGroups:lastAddressedHandle:lastAddressedSIMID:", v45, v44, a7, a8, v42, v43);
      v36 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_33:

  return v36;
}

- (uint64_t)_ck_chatForHandles:()CKAdditions createIfNecessary:
{
  uint64_t v5;

  LOBYTE(v5) = a4;
  return objc_msgSend(a1, "_ck_chatForHandles:displayName:lastAddressedHandle:lastAddressedSIMID:joinedChatsOnly:findMatchingNamedGroups:createIfNecessary:", a3, 0, 0, 0, 1, 1, v5);
}

@end
