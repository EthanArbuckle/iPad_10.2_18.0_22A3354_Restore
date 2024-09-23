@implementation IMDAskToBuyResponseHandler

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
  id v7;
  void (**v8)(id, uint64_t);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  uint8_t buf[16];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v43 = a4;
  v8 = (void (**)(id, uint64_t))a5;
  v42 = v7;
  objc_msgSend(v7, "notification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "request");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "content");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userInfo");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v45, "objectForKeyedSubscript:", *MEMORY[0x1E0D38BD8]);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v44);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v12, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v41, "queryItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v48;
LABEL_4:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v48 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v16);
        objc_msgSend(v17, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("requestID"));

        if ((v19 & 1) != 0)
          break;
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
          if (v14)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      objc_msgSend(v17, "value");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
        goto LABEL_19;
      if (IMOSLoggingEnabled(v21))
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D1413000, v22, OS_LOG_TYPE_INFO, "Launching askpermission page", buf, 2u);
        }

      }
      v23 = (void *)MEMORY[0x1D17EA3EC](CFSTR("APRequestHandler"), CFSTR("AskPermission"));
      if (v23)
      {
        objc_msgSend(v23, "presentApprovalSheetWithRequestIdentifier:completion:", v20, 0);
        objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "trackAction:extensionBundleID:isNotification:", CFSTR("view"), *MEMORY[0x1E0D374E0], 1);

        v8[2](v8, 1);
      }
      else
      {
        v8[2](v8, 0);
      }

    }
    else
    {
LABEL_10:

LABEL_19:
      IMLogHandleForCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_1D166C934(v25, v26, v27, v28, v29, v30, v31, v32);

      v8[2](v8, 0);
    }

  }
  else
  {
    IMLogHandleForCategory();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      sub_1D166C900(v33, v34, v35, v36, v37, v38, v39, v40);

    v8[2](v8, 0);
  }

}

@end
