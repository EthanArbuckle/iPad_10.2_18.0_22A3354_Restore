@implementation IMDScreenTimeAskReponseHandler

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
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  char v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  int v47;
  NSObject *v48;
  void *v49;
  id v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void (**v57)(id, BOOL);
  void *v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  void *v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v56 = a4;
  v57 = (void (**)(id, BOOL))a5;
  objc_msgSend(v7, "notification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "request");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "content");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userInfo");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v58, "objectForKey:", *MEMORY[0x1E0D38BE0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
LABEL_2:
    v12 = objc_alloc_init(MEMORY[0x1E0D8C048]);
    objc_msgSend(v7, "actionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D38D60]);

    if ((v14 & 1) != 0)
    {
      v16 = CFSTR("approve15");
      v17 = 1;
    }
    else
    {
      objc_msgSend(v7, "actionIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D38D70]);

      if ((v19 & 1) != 0)
      {
        v16 = CFSTR("approveHour");
        v17 = 2;
      }
      else
      {
        objc_msgSend(v7, "actionIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "isEqualToString:", *MEMORY[0x1E0D38D58]);

        if ((v29 & 1) != 0)
        {
          v16 = CFSTR("approveDay");
          v17 = 3;
        }
        else
        {
          objc_msgSend(v7, "actionIdentifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "isEqualToString:", *MEMORY[0x1E0D38D68]);

          v17 = 0;
          if (v47)
            v16 = CFSTR("decline");
          else
            v16 = 0;
        }
      }
    }
    if (IMOSLoggingEnabled(v15))
    {
      OSLogHandleForIMFoundationCategory();
      v48 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v65 = v49;
        _os_log_impl(&dword_1D1413000, v48, OS_LOG_TYPE_INFO, "Sending sent ST response with answer: %@", buf, 0xCu);

      }
    }
    v59 = 0;
    objc_msgSend(v12, "respondToAskForTimeRequestWithIdentifier:answer:error:", v11, v17, &v59);
    v50 = v59;
    if (v50)
    {
      IMLogHandleForCategory();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        sub_1D1666270(v17, (uint64_t)v50, v51);
    }
    else
    {
      if (IMOSLoggingEnabled(0))
      {
        OSLogHandleForIMFoundationCategory();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v65 = v53;
          _os_log_impl(&dword_1D1413000, v52, OS_LOG_TYPE_INFO, "Successfully sent ST response with answer: %@", buf, 0xCu);

        }
      }
      objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
      v51 = objc_claimAutoreleasedReturnValue();
      -[NSObject trackAction:extensionBundleID:isNotification:](v51, "trackAction:extensionBundleID:isNotification:", v16, *MEMORY[0x1E0D374E8], 1);
    }

    v57[2](v57, v50 == 0);
    goto LABEL_42;
  }
  objc_msgSend(v58, "objectForKey:", *MEMORY[0x1E0D38BD8]);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v55);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v20, 1);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    objc_msgSend(v54, "queryItems");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v61;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v61 != v23)
            objc_enumerationMutation(v21);
          v25 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_msgSend(v25, "name");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("requestID"));

          if (v27)
          {
            objc_msgSend(v25, "value");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_19;
          }
        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
        if (v22)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_19:

    if (v11)
      goto LABEL_2;
    IMLogHandleForCategory();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_1D166623C(v30, v31, v32, v33, v34, v35, v36, v37);

    v57[2](v57, 0);
  }
  else
  {
    IMLogHandleForCategory();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      sub_1D1666208(v38, v39, v40, v41, v42, v43, v44, v45);

    v57[2](v57, 0);
  }
LABEL_42:

}

@end
