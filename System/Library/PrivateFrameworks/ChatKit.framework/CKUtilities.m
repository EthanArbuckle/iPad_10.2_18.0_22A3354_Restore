@implementation CKUtilities

+ (BOOL)isIpad
{
  if (isIpad_onceToken != -1)
    dispatch_once(&isIpad_onceToken, &__block_literal_global_1131_0);
  return isIpad_isIpad;
}

+ (id)imDefaultsSharedInstance
{
  return (id)objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
}

void __21__CKUtilities_isIpad__block_invoke()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  isIpad_isIpad = (v1 & 0xFFFFFFFFFFFFFFFBLL) == 1;
}

+ (id)nsUserDefaultsStandardUserDefaults
{
  return (id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
}

+ (BOOL)userDefaultBoolForKey:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  objc_msgSend(a1, "nsUserDefaultsStandardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", v4);

  return v6;
}

+ (id)threadIdentifierForMessagePart:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t ThreadIdentifierWithOriginatorGUID;

  v3 = a3;
  objc_msgSend(v3, "threadIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "message");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "guid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "originalMessagePartRange");
    objc_msgSend(v3, "index");
    ThreadIdentifierWithOriginatorGUID = IMMessageCreateThreadIdentifierWithOriginatorGUID();

    v4 = (void *)ThreadIdentifierWithOriginatorGUID;
  }

  return v4;
}

+ (id)threadOriginatorForMessagePart:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "threadIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "threadOriginator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "_imMessageItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v6;
  }

  return v5;
}

+ (id)imMessageForIMMessageItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *IMMessageFromIMItem;

  v3 = a3;
  objc_msgSend(v3, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _IMBestAccountForIMItem();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  IMMessageFromIMItem = (void *)_CreateIMMessageFromIMItem();
  return IMMessageFromIMItem;
}

+ (id)deviceSpecificNameForKey:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "deviceType");

  if ((unint64_t)(v5 - 1) > 6)
  {
    v6 = v3;
  }
  else
  {
    objc_msgSend(v3, "stringByAppendingString:", off_1E274EDB0[v5 - 1]);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

+ (unint64_t)messageJunkStatus
{
  if (!CKIsEligibleForBlackhole())
    return 28;
  if (objc_msgSend(MEMORY[0x1E0D39AF8], "isFilterUnknownSendersEnabled"))
    return 30;
  return 29;
}

+ (BOOL)isMessageUnknownSenderNotificationDisabled
{
  if (CKMessageUnknownSenderNotificationDisabled_onceToken != -1)
    dispatch_once(&CKMessageUnknownSenderNotificationDisabled_onceToken, &__block_literal_global_1402);
  return sSMSDefaultAllowUnknownSendersDisabled;
}

+ (BOOL)isMessageTransactionsNotificationDisabled
{
  if (CKMessageTransactionsNotificationDisabled_onceToken != -1)
    dispatch_once(&CKMessageTransactionsNotificationDisabled_onceToken, &__block_literal_global_1405_0);
  return sSMSDefaultAllowTransactionsDisabled;
}

+ (BOOL)isMessagePromotionsNotificationDisabled
{
  if (CKMessagePromotionsNotificationDisabled_onceToken != -1)
    dispatch_once(&CKMessagePromotionsNotificationDisabled_onceToken, &__block_literal_global_1408);
  return sSMSDefaultAllowPromotionsDisabled;
}

+ (void)openCKVSettings
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=TRANSPARENCY"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

}

+ (id)quickSaveConfirmationAlertWithPhotoCount:(unint64_t)a3 videoCount:(unint64_t)a4 otherCount:(unint64_t)a5 alreadySavedCount:(unint64_t)a6 popoverSource:(id)a7 cancelHandler:(id)a8 saveHandler:(id)a9 navigationHandler:(id)a10
{
  id v15;
  void *v16;
  unint64_t v17;
  const __CFString *v18;
  _BOOL4 v19;
  _BOOL4 v20;
  _BOOL4 v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  __CFString *v28;
  char v29;
  void *v30;
  int v31;
  uint64_t v32;
  __CFString *v33;
  __CFString *v34;
  void *v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  __CFString *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  __CFString *v46;
  __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  __CFString *v61;
  uint64_t v62;
  __CFString *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v73;
  __CFString *v74;
  BOOL v75;
  void *v76;
  id v77;
  id v78;
  void *v79;
  id v80;
  _QWORD v81[4];
  id v82;
  BOOL v83;
  char v84;
  _QWORD v85[4];
  id v86;
  _QWORD v87[4];
  id v88;
  uint8_t buf[16];

  v78 = a7;
  v80 = a8;
  v77 = a9;
  v15 = a10;
  v16 = v15;
  v17 = a4 + a3 + a5;
  if (!a3 || a5 | a4)
  {
    v19 = a4 != 0;
    v20 = (a5 | a3) == 0;
    if (v19 && v20)
      v18 = CFSTR("_VIDEO");
    else
      v18 = CFSTR("_ITEM");
    if (v19 && v20)
      a3 = a4;
    else
      a3 += a4 + a5;
  }
  else
  {
    v18 = CFSTR("_PHOTO");
  }
  v79 = v15;
  if (a6)
  {
    if (v17 <= a6)
    {
      v28 = CFSTR("ALREADY_SAVED_CONFIRMATION_SINGLE");
      if (a3 > 1)
        v28 = CFSTR("ALREADY_SAVED_CONFIRMATION_MULTIPLE");
      v22 = v28;
      v21 = 0;
    }
    else
    {
      v21 = a6 > 1;
      if (a6 <= 1)
        v22 = CFSTR("ALREADY_SAVED_CONFIRMATION_PARTIAL_SINGLE");
      else
        v22 = CFSTR("ALREADY_SAVED_CONFIRMATION_PARTIAL_MULTIPLE");
    }
    v29 = IMGetCachedDomainBoolForKeyWithDefaultValue();
LABEL_30:
    objc_msgSend(MEMORY[0x1E0CD16F8], "sharedPhotoLibrary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isCloudPhotoLibraryEnabled");

    if (v31)
    {
      -[__CFString stringByAppendingString:](v22, "stringByAppendingString:", CFSTR("_ICPL"));
      v32 = objc_claimAutoreleasedReturnValue();

      v22 = (__CFString *)v32;
    }
    v33 = v22;
    -[__CFString stringByAppendingString:](v22, "stringByAppendingString:", v18);
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v35 = (void *)MEMORY[0x1E0CB3940];
      v36 = v34;
      CKFrameworkBundle();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localizedStringForKey:value:table:", v36, &stru_1E276D870, CFSTR("ChatKit"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v35, "localizedStringWithFormat:", v38, a6);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "userInterfaceLayoutDirection");

      if (v41 == 1)
        v42 = CFSTR("\u200F");
      else
        v42 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v42, "stringByAppendingString:", v39);
      v43 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      CKFrameworkBundle();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", v34, &stru_1E276D870, CFSTR("ChatKit"));
      v43 = objc_claimAutoreleasedReturnValue();
    }
    v76 = (void *)v43;

    v44 = MEMORY[0x1E0C809B0];
    v45 = v17 - a6;
    v75 = v17 == a6;
    v74 = v34;
    if (v17 == a6)
    {
      v46 = CFSTR("SAVE_MULTIPLE_DUPLICATES");
      if (a6 == 1)
        v46 = CFSTR("SAVE_SINGLE_DUPLICATE");
      v47 = v46;
      CKFrameworkBundle();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "localizedStringForKey:value:table:", v47, &stru_1E276D870, CFSTR("ChatKit"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      v50 = (void *)MEMORY[0x1E0CEA2E0];
      CKFrameworkBundle();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("SHOW_IN_PHOTOS"), &stru_1E276D870, CFSTR("ChatKit"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v87[0] = v44;
      v87[1] = 3221225472;
      v87[2] = __154__CKUtilities_quickSaveConfirmationAlertWithPhotoCount_videoCount_otherCount_alreadySavedCount_popoverSource_cancelHandler_saveHandler_navigationHandler___block_invoke;
      v87[3] = &unk_1E274B330;
      v53 = v79;
      v88 = v79;
      objc_msgSend(v50, "actionWithTitle:style:handler:", v52, 0, v87);
      v73 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v45 >= v17)
      {
        if (v45 == 1)
          v63 = CFSTR("SAVE_SINGLE");
        else
          v63 = CFSTR("SAVE_MULTIPLE");
        -[__CFString stringByAppendingString:](v63, "stringByAppendingString:", v18);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        CKFrameworkBundle();
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "localizedStringForKey:value:table:", v54, &stru_1E276D870, CFSTR("ChatKit"));
        v62 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(CFSTR("SAVE_COUNT"), "stringByAppendingString:", v18);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = (void *)MEMORY[0x1E0CB3940];
        CKFrameworkBundle();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "localizedStringForKey:value:table:", v54, &stru_1E276D870, CFSTR("ChatKit"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "localizedStringWithFormat:", v57, v45);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v59, "userInterfaceLayoutDirection");

        if (v60 == 1)
          v61 = CFSTR("\u200F");
        else
          v61 = CFSTR("\u200E");
        -[__CFString stringByAppendingString:](v61, "stringByAppendingString:", v58);
        v62 = objc_claimAutoreleasedReturnValue();
      }
      v49 = (void *)v62;

      v73 = 0;
      v53 = v79;
    }
    v64 = (void *)MEMORY[0x1E0CEA2E0];
    CKFrameworkBundle();
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = v44;
    v85[1] = 3221225472;
    v85[2] = __154__CKUtilities_quickSaveConfirmationAlertWithPhotoCount_videoCount_otherCount_alreadySavedCount_popoverSource_cancelHandler_saveHandler_navigationHandler___block_invoke_2;
    v85[3] = &unk_1E274B330;
    v86 = v80;
    objc_msgSend(v64, "actionWithTitle:style:handler:", v66, 1, v85);
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    v68 = (void *)MEMORY[0x1E0CEA2E0];
    v81[0] = v44;
    v81[1] = 3221225472;
    v81[2] = __154__CKUtilities_quickSaveConfirmationAlertWithPhotoCount_videoCount_otherCount_alreadySavedCount_popoverSource_cancelHandler_saveHandler_navigationHandler___block_invoke_3;
    v81[3] = &unk_1E274EB20;
    v25 = v77;
    v82 = v77;
    v83 = v75;
    v84 = v29;
    objc_msgSend(v68, "actionWithTitle:style:handler:", v49, 0, v81);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA2E8], "alertControllerWithTitle:message:preferredStyle:", 0, v76, 0);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v70;
    v16 = v53;
    if (v53 && v73)
      objc_msgSend(v70, "addAction:", v73);
    objc_msgSend(v27, "addAction:", v69);
    objc_msgSend(v27, "setPreferredAction:", v69);
    objc_msgSend(v27, "addAction:", v67);
    objc_opt_class();
    v24 = v78;
    v22 = v74;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v27, "popoverPresentationController");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "setBarButtonItem:", v78);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_60:

        goto LABEL_61;
      }
      objc_msgSend(v27, "popoverPresentationController");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "setSourceView:", v78);
    }

    v16 = v79;
    goto LABEL_60;
  }
  v23 = CFSTR("QUICK_SAVE_CONFIRMATION_SINGLE");
  if (a3 > 1)
    v23 = CFSTR("QUICK_SAVE_CONFIRMATION_MULTIPLE");
  v22 = v23;
  if (!IMGetCachedDomainBoolForKeyWithDefaultValue())
  {
    v29 = 0;
    v21 = 0;
    goto LABEL_30;
  }
  v25 = v77;
  v24 = v78;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "Found that we did not need to show quick save confirmation alert. Calling save handler now instead.", buf, 2u);
    }

  }
  if (v77)
    (*((void (**)(id, _QWORD))v77 + 2))(v77, 0);
  v27 = 0;
LABEL_61:

  return v27;
}

uint64_t __154__CKUtilities_quickSaveConfirmationAlertWithPhotoCount_videoCount_otherCount_alreadySavedCount_popoverSource_cancelHandler_saveHandler_navigationHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __154__CKUtilities_quickSaveConfirmationAlertWithPhotoCount_videoCount_otherCount_alreadySavedCount_popoverSource_cancelHandler_saveHandler_navigationHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __154__CKUtilities_quickSaveConfirmationAlertWithPhotoCount_videoCount_otherCount_alreadySavedCount_popoverSource_cancelHandler_saveHandler_navigationHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(unsigned __int8 *)(a1 + 40));
  if (!*(_BYTE *)(a1 + 41))
    IMSetDomainBoolForKey();

}

+ (id)quickSaveConfirmationAlertForMediaObjects:(id)a3 momentShareURL:(id)a4 popoverSource:(id)a5 metricsSource:(id)a6 cancelHandler:(id)a7 preSaveHandler:(id)a8 postSaveHandler:(id)a9
{
  return (id)objc_msgSend(a1, "quickSaveConfirmationAlertForMediaObjects:momentShareURL:popoverSource:metricsSource:cancelHandler:preSaveHandler:postSaveHandler:postAnyActionHandler:", a3, a4, a5, a6, a7, a8, a9, 0);
}

+ (id)quickSaveConfirmationAlertForMediaObjects:(id)a3 momentShareURL:(id)a4 popoverSource:(id)a5 metricsSource:(id)a6 cancelHandler:(id)a7 preSaveHandler:(id)a8 postSaveHandler:(id)a9 postAnyActionHandler:(id)a10
{
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  dispatch_time_t v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  BOOL v42;
  uint64_t v43;
  _QWORD *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  NSObject *v51;
  id *v53;
  id v54;
  void *v55;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  id obj;
  _QWORD v67[4];
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  BOOL v74;
  _QWORD v75[4];
  id v76;
  id v77;
  _QWORD aBlock[4];
  id v79;
  id v80;
  BOOL v81;
  _QWORD v82[4];
  _QWORD v83[2];
  BOOL v84;
  _QWORD v85[4];
  NSObject *v86;
  uint64_t *v87;
  uint64_t *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  uint64_t (*v96)(uint64_t, uint64_t);
  void (*v97)(uint64_t);
  id v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  uint8_t buf[4];
  void *v108;
  _BYTE v109[128];
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v58 = a4;
  v59 = a5;
  v60 = a6;
  v62 = a7;
  v61 = a8;
  v63 = a9;
  v64 = a10;
  v55 = v16;
  v56 = objc_msgSend(v16, "count");
  if (v56)
  {
    v54 = a1;
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v17 = v16;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v103, v110, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v104;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v104 != v22)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * i), "UTIType");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (IMUTITypeIsPhoto())
          {
            ++v18;
          }
          else if (IMUTITypeIsVideo())
          {
            ++v19;
          }
          else
          {
            ++v20;
          }

        }
        v21 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v103, v110, 16);
      }
      while (v21);
    }

    v99 = 0;
    v100 = &v99;
    v101 = 0x2020000000;
    v102 = 0;
    v93 = 0;
    v94 = &v93;
    v95 = 0x3032000000;
    v96 = __Block_byref_object_copy__20;
    v97 = __Block_byref_object_dispose__20;
    v98 = 0;
    v25 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    obj = v17;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v109, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v90;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v90 != v27)
            objc_enumerationMutation(obj);
          v29 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * j);
          objc_msgSend(v29, "syndicationIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
          {
            objc_msgSend(v25, "addObject:", v30);
          }
          else
          {
            IMLogHandleForCategory();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v108 = v29;
              _os_log_error_impl(&dword_18DFCD000, v31, OS_LOG_TYPE_ERROR, "syndicationIdentifier for media object was nil. %@", buf, 0xCu);
            }

          }
        }
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v109, 16);
      }
      while (v26);
    }

    v32 = objc_msgSend(v25, "count");
    v33 = MEMORY[0x1E0C809B0];
    if (v32 == v56)
    {
      v34 = dispatch_group_create();
      dispatch_group_enter(v34);
      objc_msgSend(MEMORY[0x1E0D358C0], "sharedInstance");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v85[0] = v33;
      v85[1] = 3221225472;
      v85[2] = __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke;
      v85[3] = &unk_1E274EB48;
      v87 = &v99;
      v88 = &v93;
      v36 = v34;
      v86 = v36;
      objc_msgSend(v35, "fetchInfoForSyndicationIdentifiersSavedToSystemPhotoLibrary:completion:", v25, v85);

      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0D39B48], "sharedInstance");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "sendSavePhotoEvent");

      }
      v38 = dispatch_time(0, 1000000000);
      if (dispatch_group_wait(v36, v38))
      {
        IMLogHandleForCategory();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          +[CKUtilities quickSaveConfirmationAlertForMediaObjects:momentShareURL:popoverSource:metricsSource:cancelHandler:preSaveHandler:postSaveHandler:postAnyActionHandler:].cold.2();

      }
    }
    else
    {
      IMLogHandleForCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        +[CKUtilities quickSaveConfirmationAlertForMediaObjects:momentShareURL:popoverSource:metricsSource:cancelHandler:preSaveHandler:postSaveHandler:postAnyActionHandler:].cold.3((uint64_t)v25, v56, v36);
    }

    v42 = v100[3] == v56;
    v43 = v94[5];
    if (v43)
    {
      v82[0] = v33;
      v82[1] = 3221225472;
      v82[2] = __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_1199;
      v82[3] = &unk_1E274EB70;
      v83[1] = &v93;
      v84 = v42;
      v44 = v82;
      v53 = (id *)v83;
      v83[0] = v64;
    }
    else
    {
      v44 = 0;
    }
    v65 = _Block_copy(v44);
    aBlock[0] = v33;
    aBlock[1] = 3221225472;
    aBlock[2] = __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_2;
    aBlock[3] = &unk_1E274EB98;
    v81 = v42;
    v79 = v62;
    v45 = v64;
    v80 = v45;
    v46 = _Block_copy(aBlock);
    v75[0] = v33;
    v75[1] = 3221225472;
    v75[2] = __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_1200;
    v75[3] = &unk_1E274EBC0;
    v57 = v25;
    v76 = v57;
    v77 = v63;
    v47 = _Block_copy(v75);
    v48 = v46;
    v49 = v100[3];
    v67[0] = v33;
    v67[1] = 3221225472;
    v67[2] = __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_2_1202;
    v67[3] = &unk_1E274EBE8;
    v71 = v61;
    v68 = obj;
    v69 = v58;
    v50 = v47;
    v72 = v50;
    v70 = v60;
    v73 = v45;
    v74 = v42;
    objc_msgSend(v54, "quickSaveConfirmationAlertWithPhotoCount:videoCount:otherCount:alreadySavedCount:popoverSource:cancelHandler:saveHandler:navigationHandler:", v18, v19, v20, v49, v59, v48, v67, v65);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v41 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v51, OS_LOG_TYPE_INFO, "Save confirmation won't be presented", buf, 2u);
      }

    }
    if (v43)

    _Block_object_dispose(&v93, 8);
    _Block_object_dispose(&v99, 8);
  }
  else
  {
    IMLogHandleForCategory();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      +[CKUtilities quickSaveConfirmationAlertForMediaObjects:momentShareURL:popoverSource:metricsSource:cancelHandler:preSaveHandler:postSaveHandler:postAnyActionHandler:].cold.1();

    v41 = 0;
  }

  return v41;
}

void __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke(uint64_t a1, uint64_t a2, id obj)
{
  id v5;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_1199(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t result;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(CFSTR("photos://asset?uuid="), "stringByAppendingString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v6 = objc_msgSend(v5, "openSensitiveURL:withOptions:error:", v4, 0, &v11);
  v7 = v11;

  IMLogHandleForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v2;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_DEFAULT, "Navigated to asset %{public}@ in Photos", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_1199_cold_1((uint64_t)v2, (uint64_t)v7, v9);
  }

  _TrackSaveDialogOptionSelected((void *)*MEMORY[0x1E0D38860], *(unsigned __int8 *)(a1 + 48));
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  uint8_t v5[16];

  IMLogHandleForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_DEFAULT, "User canceled save.", v5, 2u);
  }

  _TrackSaveDialogOptionSelected((void *)*MEMORY[0x1E0D38838], *(unsigned __int8 *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_1200(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if ((_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x1E0D358C0], "sharedInstance", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cacheCompletedSaveForSyndicationIdentifiers:", v7);

    v5 = v9;
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v9);
    v5 = v9;
  }

}

void __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_2_1202(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  CKMediaObjectExportManager *v12;
  CKMediaObjectExportManager *v13;
  NSObject *v14;
  uint64_t v15;
  void **v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
    (*(void (**)(void))(v4 + 16))();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "count");
      *(_DWORD *)buf = 134217984;
      v21 = v6;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Will save %tu items", buf, 0xCu);
    }

  }
  if (!*(_QWORD *)(a1 + 40))
    goto LABEL_17;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Will attempt to save through moment share", buf, 2u);
    }

  }
  if ((CKSaveMomentShareFromURL(*(void **)(a1 + 40), *(void **)(a1 + 32), *(void **)(a1 + 64)) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Moment share save failed. Will fallback to media object save", buf, 2u);
      }

    }
LABEL_17:
    v12 = -[CKMediaObjectExportManager initWithMediaObjects:]([CKMediaObjectExportManager alloc], "initWithMediaObjects:", *(_QWORD *)(a1 + 32));
    v13 = v12;
    if (a2)
    {
      -[CKMediaObjectExportManager setIgnoreSyndicationIdentifiers:](v12, "setIgnoreSyndicationIdentifiers:", 1);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Will save ignoring syndication state, since items are already saved", buf, 2u);
        }

      }
    }
    -[CKMediaObjectExportManager setMetricsSource:](v13, "setMetricsSource:", *(_QWORD *)(a1 + 48));
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_1204;
    v17[3] = &unk_1E274EBC0;
    v18 = *(id *)(a1 + 32);
    v19 = *(id *)(a1 + 64);
    -[CKMediaObjectExportManager exportQueuedMediaObjectsWithCompletion:](v13, "exportQueuedMediaObjectsWithCompletion:", v17);

  }
  v15 = *(_QWORD *)(a1 + 72);
  if (v15)
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 16))(v15, v8, v9, v10);
  v16 = (void **)MEMORY[0x1E0D38840];
  if (!a2)
    v16 = (void **)MEMORY[0x1E0D38850];
  _TrackSaveDialogOptionSelected(*v16, *(unsigned __int8 *)(a1 + 80));
}

void __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_1204(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v5 = a3;
  if (!a2)
  {
    IMLogHandleForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_1204_cold_1(a1, (uint64_t)v5, v6);
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Save succeeded", v7, 2u);
    }
LABEL_7:

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (unint64_t)indexOfChatItem:(id)a3 inChatItemsArray:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  char v13;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "indexOfObject:", v5);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_15;
  }
  v8 = v5;
  if (!objc_msgSend(v6, "count"))
  {
LABEL_11:
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_14;
  }
  v7 = 0;
  while (1)
  {
    objc_msgSend(v6, "objectAtIndex:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "transferGUIDs");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "transferGUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "containsObject:", v11);
      goto LABEL_9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
LABEL_10:

    if (++v7 >= objc_msgSend(v6, "count"))
      goto LABEL_11;
  }
  objc_msgSend(v9, "transferGUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transferGUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);
LABEL_9:
  v13 = v12;

  if ((v13 & 1) == 0)
    goto LABEL_10;

LABEL_14:
LABEL_15:

  return v7;
}

+ (void)onboardRecentlyDeletedIfNeeded:(id)a3 actionHandler:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  int Unlock;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  void (**v23)(_QWORD);

  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerForKey:", CFSTR("CKRecentlyDeletedOnboardingVersion"));

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLForKey:", CFSTR("CKRecentlyDeletedAlwaysShowOnboarding"));

  if (!v8 || (v10 & 1) != 0)
  {
    Unlock = CKMessageUnknownFilteringEnabledUnderFirstUnlock(0);
    CKFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (Unlock)
      v14 = CFSTR("RECENTLY_DELETED_INITIAL_DELETE_ONBOARDING_ALERT_FILTERS");
    else
      v14 = CFSTR("RECENTLY_DELETED_INITIAL_DELETE_ONBOARDING_ALERT_EDIT_MENU");
    objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1E276D870, CFSTR("ChatKit"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("RECENTLY_DELETED_INITIAL_DELETE_ONBOARDING_ALERT_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v17, v15, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E276D870, CFSTR("ChatKit"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __60__CKUtilities_onboardRecentlyDeletedIfNeeded_actionHandler___block_invoke;
    v22[3] = &unk_1E274B330;
    v23 = v6;
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v20, 0, v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAction:", v21);

    objc_msgSend(v18, "presentFromViewController:animated:completion:", v5, 1, &__block_literal_global_1216);
  }
  else
  {
    v6[2](v6);
  }

}

uint64_t __60__CKUtilities_onboardRecentlyDeletedIfNeeded_actionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __60__CKUtilities_onboardRecentlyDeletedIfNeeded_actionHandler___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setInteger:forKey:", 1, CFSTR("CKRecentlyDeletedOnboardingVersion"));

}

+ (unint64_t)daysUntilRecentlyDeletedDeletionForDate:(id)a3
{
  double v3;

  objc_msgSend(a1, "_daysSinceDate:", a3);
  return vcvtpd_u64_f64(30.0 - v3);
}

+ (unint64_t)daysUntilJunkFilterDeletionForDate:(id)a3
{
  double v3;

  objc_msgSend(a1, "_daysSinceDate:", a3);
  return vcvtpd_u64_f64(90.0 - v3);
}

+ (double)_intervalSinceDate:(id)a3
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;

  return v7 - v4;
}

+ (double)_daysSinceDate:(id)a3
{
  double v3;

  objc_msgSend(a1, "_intervalSinceDate:", a3);
  return v3 / 86400.0;
}

+ (BOOL)isIMStickerSaveable:(id)a3
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  NSObject *v8;
  uint8_t v10[16];

  v3 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "stickerSavingEnabled");

  if ((v5 & 1) != 0)
  {
    objc_msgSend(v3, "stickerPackGUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "containsString:", *MEMORY[0x1E0D374D0]) & 1) != 0)
      v7 = 1;
    else
      v7 = objc_msgSend(v6, "containsString:", *MEMORY[0x1E0D375B8]);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Saving stickers is not supported.", v10, 2u);
      }

    }
    v7 = 0;
  }

  return v7;
}

+ (id)saveableStickerFromChatItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t v17[16];
  uint8_t buf[16];

  v4 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "stickerSavingEnabled");

  if ((v6 & 1) == 0)
  {
    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Saving stickers is not supported.", buf, 2u);
    }
    goto LABEL_23;
  }
  if (!v4)
    goto LABEL_21;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "mediaObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transfer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributionInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D37F10]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "isEqualToString:", &stru_1E276D870)
      && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
       || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
    {
      objc_msgSend(v7, "sticker");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_21;
    v7 = v4;
    objc_msgSend(v7, "mediaObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "transfer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "attributionInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0D37F10]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "isEqualToString:", &stru_1E276D870))
    {
      objc_msgSend(v7, "sticker");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }

  }
  if (!v11)
  {
LABEL_21:
    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[CKUtilities saveableStickerFromChatItem:].cold.1();
    goto LABEL_23;
  }
  if ((objc_msgSend(a1, "isIMStickerSaveable:", v11) & 1) == 0)
  {
    IMLogHandleForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Sticker is not saveable. (e.g. it is from a sticker pack)", v17, 2u);
    }

LABEL_23:
    v11 = 0;
  }

  return v11;
}

+ (id)saveableStickerForMediaObject:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint8_t v11[16];
  uint8_t buf[16];

  v4 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "stickerSavingEnabled");

  if ((v6 & 1) == 0)
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Saving stickers is not supported.", buf, 2u);
    }
    goto LABEL_12;
  }
  objc_msgSend(v4, "sticker");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[CKUtilities saveableStickerForMediaObject:].cold.1();
    goto LABEL_11;
  }
  if ((objc_msgSend(a1, "isIMStickerSaveable:", v7) & 1) == 0)
  {
    IMLogHandleForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Sticker is not saveable. (e.g. it is from a sticker pack)", v11, 2u);
    }
LABEL_11:

LABEL_12:
    v8 = 0;
    goto LABEL_13;
  }
  v7 = v7;
  v8 = v7;
LABEL_13:

  return v8;
}

+ (void)quickSaveConfirmationAlertForMediaObjects:momentShareURL:popoverSource:metricsSource:cancelHandler:preSaveHandler:postSaveHandler:postAnyActionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Tried to create a quick save alert with no media objects.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)quickSaveConfirmationAlertForMediaObjects:momentShareURL:popoverSource:metricsSource:cancelHandler:preSaveHandler:postSaveHandler:postAnyActionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Timed out while fetching num saved. Assuming none are saved.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)quickSaveConfirmationAlertForMediaObjects:(NSObject *)a3 momentShareURL:popoverSource:metricsSource:cancelHandler:preSaveHandler:postSaveHandler:postAnyActionHandler:.cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_1(&dword_18DFCD000, a2, a3, "Discrepancy between the media objects and the syndication identifiers. Assuming none are saved. mediaObjects.count: %tu, syndicationIdentifiers: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

void __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_1199_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_18DFCD000, a2, a3, "Failed to navigate to asset %@ in Photos. Error %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

void __166__CKUtilities_quickSaveConfirmationAlertForMediaObjects_momentShareURL_popoverSource_metricsSource_cancelHandler_preSaveHandler_postSaveHandler_postAnyActionHandler___block_invoke_1204_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_18DFCD000, a2, a3, "Error quick saving media items: %@. Error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

+ (void)saveableStickerFromChatItem:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Could not extract IMSticker from chat item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

+ (void)saveableStickerForMediaObject:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Could not extract IMSticker from emoji image media object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
