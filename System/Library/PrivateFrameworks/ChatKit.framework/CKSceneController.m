@implementation CKSceneController

- (id)messagesSceneDelegate
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char isKindOfClass;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectedScenes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "delegate", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v9, "delegate");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)alertSuppressionContextsFromForegroundActiveScenes
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  __int128 v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v24 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectedScenes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v26;
    *(_QWORD *)&v7 = 138412290;
    v23 = v7;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);
        objc_msgSend(v10, "delegate", v23);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EE185988))
        {
          v12 = v11;
          v13 = objc_msgSend(v10, "activationState") == 0;
          v14 = IMOSLoggingEnabled();
          if (v13)
          {
            if (v14)
            {
              OSLogHandleForIMFoundationCategory();
              v16 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v23;
                v30 = v10;
                _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Scene is foregrounded: %@", buf, 0xCu);
              }

            }
            if (CKIsRunningInMacCatalyst()
              && !+[CKApplicationState isApplicationActive](CKApplicationState, "isApplicationActive"))
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Not collecting alert suppression context from scene while mac app state is inactive", buf, 2u);
                }

              }
            }
            else
            {
              -[NSObject alertSuppressionContexts](v12, "alertSuppressionContexts");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "unionSet:", v17);

            }
          }
          else if (v14)
          {
            OSLogHandleForIMFoundationCategory();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v23;
              v30 = v10;
              _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Not collecting alert suppression context from non-foreground scene: %@ ", buf, 0xCu);
            }

          }
        }
        else
        {
          if (!IMOSLoggingEnabled())
            goto LABEL_24;
          OSLogHandleForIMFoundationCategory();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v30 = v10;
            v31 = 2112;
            v32 = v11;
            _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Not collecting alert suppression context from non-messages scene: %@ delegate: %@", buf, 0x16u);
          }
        }

LABEL_24:
        ++v9;
      }
      while (v6 != v9);
      v19 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      v6 = v19;
    }
    while (v19);
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v24;
      _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "Active alert suppression contexts: %@", buf, 0xCu);
    }

  }
  v21 = (void *)objc_msgSend(v24, "copy");

  return v21;
}

- (BOOL)shouldSuppressNotificationForMessageWithRelevantContext:(id)a3 withAlertSupressionContextForScenes:(id)a4
{
  id v5;
  id v6;
  _BOOL4 v7;
  int v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  NSObject *v12;
  BOOL v13;
  uint8_t v15[16];
  uint8_t buf[2];
  __int16 v17;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "intersectsSet:", v5))
  {
    v7 = +[CKStarkManager isCarPlayConnected](CKStarkManager, "isCarPlayConnected");
    v8 = IMOSLoggingEnabled();
    if (v7)
    {
      if (v8)
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v17 = 0;
          v10 = "There is an active alert suppression context matching this alert (the relvant chat or conversation list "
                "is being shown on a screen), but the user is connected to CarPlay, so the notifications should never be suppressed";
          v11 = (uint8_t *)&v17;
LABEL_14:
          _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, v10, v11, 2u);
          goto LABEL_15;
        }
        goto LABEL_15;
      }
    }
    else if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v10 = "There is an alert suppression context matching this alert (the relvant chat or conversation list is being "
              "shown on screen). System notification should be suppressed, in favor of in-app alert sounds.";
        v11 = buf;
        goto LABEL_14;
      }
LABEL_15:

    }
    v13 = !v7;
    goto LABEL_17;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "There is no alert suppression context matching this alert (the relvant chat or conversation list is not being shown on screen). System notification should be allowed.", v15, 2u);
    }

  }
  v13 = 0;
LABEL_17:

  return v13;
}

- (void)userNotificationCenter:(id)a3 willPresentNotification:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  int v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  objc_msgSend(v9, "request");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "content");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "threadIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "request");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "content");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "userInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("CKBBContextKeySenderPersonCentricID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v26 = 138412546;
      v27 = v13;
      v28 = 2112;
      v29 = v17;
      _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "willPresentNotification called with notification thread identifier %@, personCentricID %@", (uint8_t *)&v26, 0x16u);
    }

  }
  -[CKSceneController _suppressionContextsForChatIdentifier:personCentricID:](self, "_suppressionContextsForChatIdentifier:personCentricID:", v13, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSceneController alertSuppressionContextsFromForegroundActiveScenes](self, "alertSuppressionContextsFromForegroundActiveScenes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[CKSceneController shouldSuppressNotificationForMessageWithRelevantContext:withAlertSupressionContextForScenes:](self, "shouldSuppressNotificationForMessageWithRelevantContext:withAlertSupressionContextForScenes:", v19, v20);
  v22 = IMOSLoggingEnabled();
  if (v21)
  {
    if (v22)
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "Supressing system notification and sound. A foreground active scene is displaying the relevant conversation, or the conversation list.", (uint8_t *)&v26, 2u);
      }

    }
    if (v10)
    {
      v24 = 0;
LABEL_18:
      v10[2](v10, v24);
    }
  }
  else
  {
    if (v22)
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "Displaying system notification and sound, neither the relevant conversation nor the conversation list, is being displayed in a foreground active scene", (uint8_t *)&v26, 2u);
      }

    }
    if (v10)
    {
      v24 = 6;
      goto LABEL_18;
    }
  }

}

- (id)_suppressionContextsForChatIdentifier:(id)a3 personCentricID:(id)a4
{
  return CKSuppressionContextsForIdentifiers(a3, a4);
}

@end
