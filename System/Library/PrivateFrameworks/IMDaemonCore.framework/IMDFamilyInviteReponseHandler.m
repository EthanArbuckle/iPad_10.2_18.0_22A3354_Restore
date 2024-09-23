@implementation IMDFamilyInviteReponseHandler

- (BOOL)canHandleNotificationResponse:(id)a3 userNotificationCenter:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "notification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("CKBBContextKeyBalloonBundleID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  IMBalloonExtensionIDWithSuffix();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v8, "isEqualToString:", v9);

  return (char)v6;
}

- (void)handleNotificationResponse:(id)a3 userNotificationCenter:(id)a4 completionHandler:(id)a5
{
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t))a5;
  objc_msgSend(a3, "notification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "content");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D38BD8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v43 = v11;
    v44 = v10;
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v12, 1);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "queryItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v46;
LABEL_4:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v46 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v17);
        objc_msgSend(v18, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("inviteUrl"));

        if ((v20 & 1) != 0)
          break;
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
          if (v15)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      objc_msgSend(v18, "value");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
        goto LABEL_15;
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "openSensitiveURL:withOptions:", v23, 0);

      if ((_DWORD)v24)
      {
        objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "trackAction:extensionBundleID:isNotification:", CFSTR("view"), *MEMORY[0x1E0D374D8], 1);

      }
      v6[2](v6, v24);

    }
    else
    {
LABEL_10:

LABEL_15:
      IMLogHandleForCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_1D1667E1C(v26, v27, v28, v29, v30, v31, v32, v33);

      v6[2](v6, 0);
    }
    v11 = v43;
    v10 = v44;

  }
  else
  {
    IMLogHandleForCategory();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_1D1667DE8(v34, v35, v36, v37, v38, v39, v40, v41);

    v6[2](v6, 0);
  }

}

@end
