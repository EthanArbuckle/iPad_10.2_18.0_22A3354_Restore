@implementation CKShare(ChatKitAdditions)

- (uint64_t)isCloudKitShareRemovable
{
  void *v2;
  void *v3;
  uint64_t result;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  __int16 v8;
  uint8_t buf[2];

  if (objc_msgSend(a1, "publicPermission") != 1)
  {
    result = IMOSLoggingEnabled();
    if (!(_DWORD)result)
      return result;
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      goto LABEL_10;
    *(_WORD *)buf = 0;
    v6 = "CKShare is public, not removing CloudKit share";
    v7 = buf;
    goto LABEL_9;
  }
  objc_msgSend(a1, "currentUserParticipant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "owner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 != v3)
  {
    result = IMOSLoggingEnabled();
    if (!(_DWORD)result)
      return result;
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      goto LABEL_10;
    v8 = 0;
    v6 = "Current user is not owner, not removing CloudKit share";
    v7 = (uint8_t *)&v8;
LABEL_9:
    _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
LABEL_10:

    return 0;
  }
  return objc_msgSend(a1, "_nonOwnerInvitedParticipantsCount") == 0;
}

- (uint64_t)_nonOwnerInvitedParticipantsCount
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "_nonOwnerParticipantsCountWithAcceptanceStatus:", 1);
  return objc_msgSend(a1, "_nonOwnerParticipantsCountWithAcceptanceStatus:", 2) + v2;
}

- (uint64_t)_nonOwnerParticipantsCountWithAcceptanceStatus:()ChatKitAdditions
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "participants", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(a1, "owner");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isEqual:", v12) & 1) != 0)
        {

        }
        else
        {
          v13 = objc_msgSend(v11, "acceptanceStatus");

          if (v13 == a3)
            ++v8;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
