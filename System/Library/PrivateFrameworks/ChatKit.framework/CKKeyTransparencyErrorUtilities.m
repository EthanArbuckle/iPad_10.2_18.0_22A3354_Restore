@implementation CKKeyTransparencyErrorUtilities

+ (id)_getLearnMoreURL:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("https://support.apple.com/ht213478");
  else
    v3 = CFSTR("https://support.apple.com/ht213465");
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
}

+ (void)learnMorePressedFromError:(BOOL)a3
{
  void *v3;
  id v4;

  objc_msgSend(a1, "_getLearnMoreURL:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:options:completionHandler:", v4, MEMORY[0x1E0C9AA70], 0);

}

+ (void)showReportToAppleUIFromViewController:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v4 = (void *)getKTStatusClass_softClass;
  v14 = getKTStatusClass_softClass;
  v5 = MEMORY[0x1E0C809B0];
  if (!getKTStatusClass_softClass)
  {
    location[0] = (id)MEMORY[0x1E0C809B0];
    location[1] = (id)3221225472;
    location[2] = __getKTStatusClass_block_invoke;
    location[3] = &unk_1E274A178;
    location[4] = &v11;
    __getKTStatusClass_block_invoke((uint64_t)location);
    v4 = (void *)v12[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v11, 8);
  v7 = (void *)objc_msgSend([v6 alloc], "initWithApplication:", CFSTR("IDS"));
  location[0] = 0;
  objc_initWeak(location, v3);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __73__CKKeyTransparencyErrorUtilities_showReportToAppleUIFromViewController___block_invoke;
  v8[3] = &unk_1E275A0B0;
  objc_copyWeak(&v9, location);
  objc_msgSend(v7, "getCurrentStatus:", v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(location);

}

void __73__CKKeyTransparencyErrorUtilities_showReportToAppleUIFromViewController___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  objc_class *v11;
  id v12;
  void *v13;
  id WeakRetained;
  void *v15;
  objc_class *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE buf[24];
  void *v27;
  uint64_t *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7 || !objc_msgSend(v6, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v7;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v6;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Unable to present Report to Apple UI due to error: %@ failure events: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v9 = (void *)getTUIKTReportToAppleContextClass_softClass;
    v25 = getTUIKTReportToAppleContextClass_softClass;
    v10 = MEMORY[0x1E0C809B0];
    if (!getTUIKTReportToAppleContextClass_softClass)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getTUIKTReportToAppleContextClass_block_invoke;
      v27 = &unk_1E274A178;
      v28 = &v22;
      __getTUIKTReportToAppleContextClass_block_invoke((uint64_t)buf);
      v9 = (void *)v23[3];
    }
    v11 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v22, 8);
    v12 = [v11 alloc];
    objc_msgSend(v6, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFailingValidation:", v13);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v15 = (void *)getTUIKTReportToAppleViewControllerClass_softClass;
    v25 = getTUIKTReportToAppleViewControllerClass_softClass;
    if (!getTUIKTReportToAppleViewControllerClass_softClass)
    {
      *(_QWORD *)buf = v10;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getTUIKTReportToAppleViewControllerClass_block_invoke;
      v27 = &unk_1E274A178;
      v28 = &v22;
      __getTUIKTReportToAppleViewControllerClass_block_invoke((uint64_t)buf);
      v15 = (void *)v23[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v22, 8);
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __73__CKKeyTransparencyErrorUtilities_showReportToAppleUIFromViewController___block_invoke_2;
    v19[3] = &unk_1E274A108;
    v20 = WeakRetained;
    v21 = (id)objc_msgSend([v16 alloc], "initWithContext:", v12);
    v17 = v21;
    v18 = WeakRetained;
    dispatch_async(MEMORY[0x1E0C80D38], v19);

  }
}

uint64_t __73__CKKeyTransparencyErrorUtilities_showReportToAppleUIFromViewController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, &__block_literal_global_246);
}

void __73__CKKeyTransparencyErrorUtilities_showReportToAppleUIFromViewController___block_invoke_3()
{
  NSObject *v0;
  uint8_t v1[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v1 = 0;
      _os_log_impl(&dword_18DFCD000, v0, OS_LOG_TYPE_INFO, "Presented Report To Apple KT UI", v1, 2u);
    }

  }
}

+ (void)showKTContactVerificationUIForIMChat:(id)a3 fromViewController:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  objc_class *v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  NSObject *v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  _BYTE v78[128];
  _BYTE v79[128];
  _QWORD v80[2];
  _BYTE buf[24];
  void *v82;
  uint64_t *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v65 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Tapped KT verify conversation cell", buf, 2u);
    }

  }
  if ((objc_msgSend(v5, "hasKnownParticipants") & 1) != 0)
  {
    objc_msgSend(v5, "participants");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count") == 1;

    if (v8)
    {
      objc_msgSend(v5, "participants");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        IMLogHandleForCategory();
        v32 = objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          +[CKKeyTransparencyErrorUtilities showKTContactVerificationUIForIMChat:fromViewController:].cold.1((uint64_t)v5, v32, v34, v35, v36, v37, v38, v39);
          v33 = v32;
        }
        goto LABEL_64;
      }
      v11 = *MEMORY[0x1E0C966A8];
      v80[0] = *MEMORY[0x1E0C967C0];
      v80[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject cnContactWithKeys:](v10, "cnContactWithKeys:", v12);
      v64 = objc_claimAutoreleasedReturnValue();

      -[NSObject phoneNumberStrings](v64, "phoneNumberStrings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject emailAddressStrings](v64, "emailAddressStrings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_opt_new();
      -[NSObject ID](v10, "ID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKKeyTransparencyErrorUtilities keyTransparencyIDFromID:](CKKeyTransparencyErrorUtilities, "keyTransparencyIDFromID:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v17);

      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v18 = v13;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v71;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v71 != v20)
              objc_enumerationMutation(v18);
            +[CKKeyTransparencyErrorUtilities keyTransparencyIDFromID:](CKKeyTransparencyErrorUtilities, "keyTransparencyIDFromID:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v22);

          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v70, v79, 16);
        }
        while (v19);
      }

      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v23 = v14;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v67;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v67 != v25)
              objc_enumerationMutation(v23);
            +[CKKeyTransparencyErrorUtilities keyTransparencyIDFromID:](CKKeyTransparencyErrorUtilities, "keyTransparencyIDFromID:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * j));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v27);

          }
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v66, v78, 16);
        }
        while (v24);
      }

      if (!objc_msgSend(v15, "count"))
      {
        IMLogHandleForCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v64;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v18;
          *(_WORD *)&buf[22] = 2112;
          v82 = v23;
          _os_log_error_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_ERROR, "Unable to verify key transparency, no valid handles identified for contact: %@ with phoneNumbers: %@, emailAddresses: %@", buf, 0x20u);
        }
        goto LABEL_63;
      }
      v28 = objc_opt_new();
      objc_msgSend(v5, "lastAddressedHandleID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v29 && objc_msgSend(v29, "length"))
      {
        v31 = v30;
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v5;
            _os_log_impl(&dword_18DFCD000, v40, OS_LOG_TYPE_INFO, "Unable to find a valid last addressed handle ID for chat:%@", buf, 0xCu);
          }

        }
        objc_msgSend(v5, "account");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "loginIMHandle");
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          objc_msgSend(v42, "displayID");
          v43 = objc_claimAutoreleasedReturnValue();

          v30 = (void *)v43;
        }
        else if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v5;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = 0;
            _os_log_impl(&dword_18DFCD000, v44, OS_LOG_TYPE_INFO, "Unable to find a valid handle ID for chat:%@ login handle: %@", buf, 0x16u);
          }

        }
        v31 = v30;
        if (!v30)
        {
          v61 = 0;
          goto LABEL_48;
        }
      }
      if (objc_msgSend(v31, "length", v31))
      {
        -[NSObject setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v61, CFSTR("lastUsedIdentifier"));
LABEL_52:
        -[NSObject identifier](v64, "identifier", v61);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        if (v63)
        {
          -[NSObject identifier](v64, "identifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v46, CFSTR("contactIdentifier"));

          objc_msgSend(v15, "array");
          v47 = objc_claimAutoreleasedReturnValue();
          if ((IMOSLoggingEnabled() & 1) != 0)
          {
            OSLogHandleForIMFoundationCategory();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              *(_QWORD *)&buf[4] = v47;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v28;
              _os_log_impl(&dword_18DFCD000, v48, OS_LOG_TYPE_INFO, "Attempting to present KT verification for handles: %@, options: %@", buf, 0x16u);
            }

          }
          v74 = 0;
          v75 = &v74;
          v76 = 0x2050000000;
          v49 = (void *)getTUIKTConversationViewControllerClass_softClass;
          v77 = getTUIKTConversationViewControllerClass_softClass;
          if (!getTUIKTConversationViewControllerClass_softClass)
          {
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __getTUIKTConversationViewControllerClass_block_invoke;
            v82 = &unk_1E274A178;
            v83 = &v74;
            __getTUIKTConversationViewControllerClass_block_invoke((uint64_t)buf);
            v49 = (void *)v75[3];
          }
          v50 = objc_retainAutorelease(v49);
          _Block_object_dispose(&v74, 8);
          v51 = (void *)objc_msgSend([v50 alloc], "initForMembers:options:", v47, v28);
          v52 = v65;
          objc_msgSend(v51, "setDelegate:", v52);
          v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v51);
          objc_msgSend(v52, "presentViewController:animated:completion:", v53, 1, 0);

        }
        else
        {
          IMLogHandleForCategory();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
            +[CKKeyTransparencyErrorUtilities showKTContactVerificationUIForIMChat:fromViewController:].cold.2(v47, v54, v55, v56, v57, v58, v59, v60);
        }

LABEL_63:
        v33 = v64;
LABEL_64:

        goto LABEL_65;
      }
LABEL_48:
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v45, OS_LOG_TYPE_INFO, "Cannot set the lastUsedIdentifier.", buf, 2u);
        }

      }
      goto LABEL_52;
    }
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[CKKeyTransparencyErrorUtilities showKTContactVerificationUIForIMChat:fromViewController:].cold.3(v5, v10);
  }
  else
  {
    IMLogHandleForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[CKKeyTransparencyErrorUtilities showKTContactVerificationUIForIMChat:fromViewController:].cold.4(v10);
  }
LABEL_65:

}

+ (id)keyTransparencyIDFromID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "_stripFZIDPrefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IMChatCanonicalIDSIDsForAddress();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(CFSTR("im://"), "stringByAppendingString:", v5);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v9 = 138412290;
        v10 = v3;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "CKDetailsController_KT Could not get a canonical ID for the identifier: %@", (uint8_t *)&v9, 0xCu);
      }

    }
    v6 = &stru_1E276D870;
  }

  return v6;
}

+ (id)ktClearWarningAlertControllerForChat:(id)a3 confirmationHandler:(id)a4
{
  id v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;

  v5 = a3;
  v6 = a4;
  v7 = CKIsRunningInMacCatalyst();
  if (CKIsRunningInMacCatalyst())
  {
    CKFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("KT_CLEAR_ARE_YOU_SURE"), &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("KT_CLEAR_YOU_WILL_SEE_A_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
    v9 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", v9, v11, v7 != 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CEA2E0];
  CKFrameworkBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("KT_CLEAR_WARNING"), &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __92__CKKeyTransparencyErrorUtilities_ktClearWarningAlertControllerForChat_confirmationHandler___block_invoke;
  v24[3] = &unk_1E2755940;
  v25 = v5;
  v26 = v6;
  v16 = v6;
  v17 = v5;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 2, v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0CEA2E0];
  CKFrameworkBundle();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("KT_CANCEL"), &stru_1E276D870, CFSTR("ChatKit-Key-Transparency"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 1, &__block_literal_global_86_3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addAction:", v18);
  objc_msgSend(v12, "addAction:", v22);

  return v12;
}

uint64_t __92__CKKeyTransparencyErrorUtilities_ktClearWarningAlertControllerForChat_confirmationHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "ignoreKTFailure");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)showKTContactVerificationUIForIMChat:(uint64_t)a3 fromViewController:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_18DFCD000, a2, a3, "There are no participants in the IMChat to verify. %@", a5, a6, a7, a8, 2u);
}

+ (void)showKTContactVerificationUIForIMChat:(uint64_t)a3 fromViewController:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_18DFCD000, a1, a3, "Unable to form options dictionary for TUIKTConversationViewController due to missing contactIdentifier. contactIdentifier: %@", a5, a6, a7, a8, 2u);
}

+ (void)showKTContactVerificationUIForIMChat:(void *)a1 fromViewController:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 134218242;
  v6 = objc_msgSend(v4, "count");
  v7 = 2112;
  v8 = a1;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "Invalid Chat. There is more than one participant in the IMChat to verify. Number of participants: %lu IMChat: %@", (uint8_t *)&v5, 0x16u);

}

+ (void)showKTContactVerificationUIForIMChat:(os_log_t)log fromViewController:.cold.4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "Unable to verify KT status for conversation with no known participants.", v1, 2u);
}

@end
