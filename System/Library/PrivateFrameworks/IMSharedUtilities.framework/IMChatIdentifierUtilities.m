@implementation IMChatIdentifierUtilities

+ (id)personCentricIDForChatWithGUID:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5 groupID:(id)a6 displayName:(id)a7 lastKnownToBeHybrid:(BOOL)a8 mergeDisplayNames:(BOOL)a9 participantIDs:(id)a10
{
  int v13;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  int v23;
  BOOL v24;
  void *v25;
  BOOL v26;
  _BOOL4 v27;
  BOOL v28;
  void *v29;
  uint64_t v31;
  id v32;

  v13 = a5;
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a10;
  if (v13 != 35)
  {
    v32 = a1;
    +[IMFeatureFlags sharedFeatureFlags](IMFeatureFlags, "sharedFeatureFlags");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isTranscriptSharingEnabled");

    if (!v23 || !objc_msgSend(v17, "hasPrefix:", CFSTR("tsharing:")))
    {
      if (v13 == 43)
      {
        v26 = objc_msgSend(v19, "length") == 0;
        if (objc_msgSend(v19, "length"))
          v27 = a8 && a9;
        else
          v27 = 0;
        v28 = (unint64_t)objc_msgSend(v20, "count") > 1;
        v25 = v32;
        if (!v28)
          goto LABEL_14;
      }
      else
      {
        if (v13 == 45)
        {
          v24 = objc_msgSend(v20, "count") == 1;
          v25 = v32;
          if (!v24)
          {
LABEL_14:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-corruptChat"), v17, v31);
LABEL_20:
            v21 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_23;
          }
LABEL_21:
          objc_msgSend(v25, "_handleBasedPersonCentricIDWithParticipantIDs:", v20);
          v21 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
        v26 = 0;
        v27 = 0;
        v25 = v32;
      }
      if (v26 || v27)
        goto LABEL_21;
      if (objc_msgSend(v19, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v18, v17);
        goto LABEL_20;
      }
    }
    v21 = v17;
    goto LABEL_23;
  }
  v21 = v16;
LABEL_23:
  v29 = v21;

  return v29;
}

+ (id)_handleBasedPersonCentricIDWithParticipantIDs:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(v3, "sortUsingSelector:", sel_caseInsensitiveCompare_);
  objc_msgSend(v3, "componentsJoinedByString:", &stru_1E3FBBA48);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_randomUnverifiedChatIdentifierForGroupChat
{
  void *v2;
  NSObject *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "generatedRoomNameForGroupChat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_impl(&dword_19E239000, v3, OS_LOG_TYPE_INFO, "Generated random chat identifier %@", (uint8_t *)&v5, 0xCu);
    }

  }
  return v2;
}

+ (id)generateUnusedChatIdentifierForGroupChatWithServiceName:(id)a3 chatWithChatIdentifierExists:(id)a4
{
  id v6;
  unsigned int (**v7)(id, uint64_t);
  void *v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (unsigned int (**)(id, uint64_t))a4;
  v8 = 0;
  v9 = 3;
  *(_QWORD *)&v10 = 138412290;
  v15 = v10;
  while (1)
  {
    objc_msgSend(a1, "_randomUnverifiedChatIdentifierForGroupChat", v15);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
    if (!objc_msgSend(v6, "length"))
      break;
    if (!v7 || v7[2](v7, v11))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v15;
          v17 = v8;
          _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "Improbable collision has occured for group chat with chatIdentifier: %@", buf, 0xCu);
        }

      }
      if (--v9)
        continue;
    }
    goto LABEL_15;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E239000, v13, OS_LOG_TYPE_INFO, "No service provided for generateUnusedChatIdentifierForGroupChatWithAccount, can't verify there are no duplicates", buf, 2u);
    }

  }
LABEL_15:

  return v8;
}

@end
