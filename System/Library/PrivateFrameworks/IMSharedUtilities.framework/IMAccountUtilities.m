@implementation IMAccountUtilities

+ (BOOL)_hasMadridIDSAccountForSending
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (IMIsRunningInIDSAccountCapableClient())
  {
    if (qword_1EE503CE8 != -1)
      dispatch_once(&qword_1EE503CE8, &unk_1E3FB32E8);
    v9 = 0u;
    v10 = 0u;
    v7 = 0u;
    v8 = 0u;
    objc_msgSend((id)qword_1EE503CE0, "accounts", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v8;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v8 != v4)
            objc_enumerationMutation(v2);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "canSend") & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_15;
          }
        }
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_15:

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

+ (BOOL)_isApprovedForRelayWithAllAccounts:(id)a3 account:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  char v7;
  void *v8;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "deviceType");

  if (v6 == 2)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "service");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "supportsRelay");

  }
  return v7;
}

+ (BOOL)isAccountUsableForSendingWithAllAccounts:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  int v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  int v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  int v28;
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "internalName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", IMServiceNameiMessage[0]) & 1) != 0)
  {
    v10 = IMIsRunningInIDSAccountCapableClient();

    if (!v10)
    {
LABEL_12:
      if ((objc_msgSend(v7, "isActive") & 1) != 0)
      {
        if (objc_msgSend(v7, "loginStatus") == 4
          || (objc_msgSend(v7, "service"),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v17 = objc_msgSend(v16, "ignoresNetworkConnectivity"),
              v16,
              (v17 & 1) != 0))
        {
          if (!objc_msgSend(v7, "accountType"))
            goto LABEL_41;
          objc_msgSend(v7, "service");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "supportsRegistration");

          if (!v19)
            goto LABEL_41;
          if (objc_msgSend(v7, "accountType") == 2)
          {
            v20 = objc_msgSend(a1, "_isApprovedForRelayWithAllAccounts:account:", v6, v7);
            v15 = objc_msgSend(v7, "isRegistered") | v20;
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                v28 = 136447234;
                v29 = "+[IMAccountUtilities isAccountUsableForSendingWithAllAccounts:account:]";
                v30 = 2112;
                v31 = a1;
                v32 = 1024;
                v33 = v15;
                v34 = 1024;
                v35 = objc_msgSend(v7, "isRegistered");
                v36 = 1024;
                v37 = v20;
                _os_log_impl(&dword_19E239000, v21, OS_LOG_TYPE_INFO, "%{public}s %@ %{BOOL}d is registered %{BOOL}d is approved for relay %{BOOL}d", (uint8_t *)&v28, 0x28u);
              }

            }
            goto LABEL_42;
          }
          if (objc_msgSend(v7, "accountType") != 1)
          {
LABEL_41:
            LOBYTE(v15) = 1;
            goto LABEL_42;
          }
          if ((objc_msgSend(v7, "isRegistered") & 1) != 0
            || (objc_msgSend(a1, "_isApprovedForRelayWithAllAccounts:account:", v6, v7) & 1) != 0)
          {
            objc_msgSend(v7, "aliases");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v23, "count"))
            {
              if (objc_msgSend(v23, "count") != 1
                || (objc_msgSend(v23, "lastObject"),
                    v24 = (void *)objc_claimAutoreleasedReturnValue(),
                    v25 = objc_msgSend(v24, "isEqualToIgnoringCase:", *MEMORY[0x1E0D36F80]),
                    v24,
                    !v25))
              {
                LOBYTE(v15) = 1;
LABEL_49:

                goto LABEL_42;
              }
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v26 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                {
                  v28 = 136446466;
                  v29 = "+[IMAccountUtilities isAccountUsableForSendingWithAllAccounts:account:]";
                  v30 = 2112;
                  v31 = v7;
                  _os_log_impl(&dword_19E239000, v26, OS_LOG_TYPE_INFO, "%{public}s NO %@ has sentinel alias", (uint8_t *)&v28, 0x16u);
                }
LABEL_47:

              }
            }
            else if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                v28 = 136446466;
                v29 = "+[IMAccountUtilities isAccountUsableForSendingWithAllAccounts:account:]";
                v30 = 2112;
                v31 = v7;
                _os_log_impl(&dword_19E239000, v26, OS_LOG_TYPE_INFO, "%{public}s NO %@ has no aliases", (uint8_t *)&v28, 0x16u);
              }
              goto LABEL_47;
            }
            LOBYTE(v15) = 0;
            goto LABEL_49;
          }
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              v28 = 136446466;
              v29 = "+[IMAccountUtilities isAccountUsableForSendingWithAllAccounts:account:]";
              v30 = 2112;
              v31 = v7;
              _os_log_impl(&dword_19E239000, v22, OS_LOG_TYPE_INFO, "%{public}s NO %@ is not registered nor approved for relay", (uint8_t *)&v28, 0x16u);
            }
LABEL_29:

          }
        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            v28 = 136446466;
            v29 = "+[IMAccountUtilities isAccountUsableForSendingWithAllAccounts:account:]";
            v30 = 2112;
            v31 = v7;
            _os_log_impl(&dword_19E239000, v22, OS_LOG_TYPE_INFO, "%{public}s NO %@ is not logged in and service does not ignore network connectivity", (uint8_t *)&v28, 0x16u);
          }
          goto LABEL_29;
        }
      }
      else if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v28 = 136446466;
          v29 = "+[IMAccountUtilities isAccountUsableForSendingWithAllAccounts:account:]";
          v30 = 2112;
          v31 = v7;
          _os_log_impl(&dword_19E239000, v22, OS_LOG_TYPE_INFO, "%{public}s NO %@ is not active", (uint8_t *)&v28, 0x16u);
        }
        goto LABEL_29;
      }
      LOBYTE(v15) = 0;
      goto LABEL_42;
    }
  }
  else
  {
    objc_msgSend(v7, "service");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "internalName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "isEqualToString:", IMServiceNameiMessageLite[0]))
    {

      goto LABEL_12;
    }
    v13 = IMIsRunningInIDSAccountCapableClient();

    if ((v13 & 1) == 0)
      goto LABEL_12;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "Early returning based on the value of IMServiceImpl because this is iMessage or iMessage Lite", (uint8_t *)&v28, 2u);
    }

  }
  LOBYTE(v15) = objc_msgSend(a1, "_hasMadridIDSAccountForSending");
LABEL_42:

  return v15;
}

+ (BOOL)isAccountRegistered:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "isActive"))
    v4 = objc_msgSend(v3, "registrationStatus") == 5;
  else
    v4 = 0;

  return v4;
}

+ (BOOL)isAccountOperationalWithAllAccounts:(id)a3 account:(id)a4
{
  id v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;

  v5 = a4;
  if (objc_msgSend(a3, "containsObjectIdenticalTo:", v5) && objc_msgSend(v5, "isActive"))
  {
    objc_msgSend(v5, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsRegistration");

    if (v7)
    {
      v8 = objc_msgSend(v5, "accountType");
      v9 = objc_msgSend(v5, "registrationStatus");
      v10 = v9 == 5 && v8 == 2;
      if (v8 != 2 && v9 == 5)
        v10 = objc_msgSend(v5, "profileValidationStatus") == 3;
    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
