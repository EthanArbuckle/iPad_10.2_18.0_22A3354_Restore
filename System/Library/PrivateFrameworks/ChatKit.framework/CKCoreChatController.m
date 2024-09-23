@implementation CKCoreChatController

- (id)_nicknameBannerUpdatesAndStyle:(unint64_t *)a3
{
  void *v3;
  void *v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  BOOL v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  NSObject *v24;
  id obj;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  unint64_t v41;
  __int16 v42;
  unint64_t v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D358A8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCoreChatController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "recipients");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v4;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (!v32)
  {
    v33 = 0;
    goto LABEL_40;
  }
  v33 = 0;
  v30 = *(_QWORD *)v37;
  do
  {
    for (i = 0; i != v32; ++i)
    {
      if (*(_QWORD *)v37 != v30)
        objc_enumerationMutation(obj);
      v6 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      objc_msgSend(v6, "defaultIMHandle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "defaultIMHandle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "ID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "defaultIMHandle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      v10 = objc_msgSend(v31, "nicknameUpdateForHandle:nicknameIfAvailable:", v9, &v35);
      v11 = v35;

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v41 = (unint64_t)v34;
          v42 = 2048;
          v43 = v10;
          _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "handle ID %@ has nickname state %lu", buf, 0x16u);
        }

      }
      if (v10)
      {
        v13 = (void *)objc_opt_new();
        objc_msgSend(v13, "setHandle:", v7);
        objc_msgSend(v13, "setUpdateType:", v10);
        if (v11)
          objc_msgSend(v13, "setNickname:", v11);
        objc_msgSend(MEMORY[0x1E0D397A8], "keysForNicknameHandling");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "cnContactWithKeys:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            objc_msgSend(v13, "setContact:", v15);
        }
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "userInterfaceIdiom"))
        {
          objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "userInterfaceIdiom") == 1;

        }
        else
        {
          v18 = 1;
        }

        v19 = (v10 & 2) == 0 && v18;
        if (!v19
          && !-[CKCoreChatController _haveUpdateAlready:forContact:](self, "_haveUpdateAlready:forContact:", v29, v15))
        {
          objc_msgSend(v29, "addObject:", v13);
        }
        if (v33)
        {
          v20 = objc_msgSend(v29, "count");
          v21 = v33;
          if (v20 > 1)
            v21 = 4;
          goto LABEL_34;
        }
        objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isNameAndPhotoC3Enabled");

        v33 = v10 & 2;
        if ((v23 & v18 & 1) == 0)
        {
          v21 = 2;
          if ((~(_BYTE)v10 & 6) == 0)
            v21 = 3;
          if ((v10 & 2) == 0)
            v21 = (v10 >> 2) & 1;
LABEL_34:
          v33 = v21;
        }

      }
    }
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  }
  while (v32);
LABEL_40:

  if (a3)
    *a3 = v33;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      v41 = v33;
      v42 = 2112;
      v43 = (unint64_t)v29;
      _os_log_impl(&dword_18DFCD000, v24, OS_LOG_TYPE_INFO, "Returning style %lu for nicknames %@", buf, 0x16u);
    }

  }
  return v29;
}

- (id)createMutableContact:(id)a3 withNicknameUpdate:(id)a4 updateType:(unint64_t)a5 addHandleToContact:(BOOL)a6
{
  _BOOL4 v6;
  char v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  BOOL v32;
  void *v33;
  int v35;
  void *v36;
  uint64_t v37;

  v6 = a6;
  v7 = a5;
  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (v10)
    v12 = (id)objc_msgSend(v10, "mutableCopy");
  else
    v12 = objc_alloc_init(MEMORY[0x1E0C97360]);
  v13 = v12;
  objc_msgSend(v11, "nickname");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v7 & 2) != 0)
  {
    objc_msgSend(v14, "firstName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setGivenName:", v16);

    objc_msgSend(v15, "lastName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFamilyName:", v17);

  }
  if ((v7 & 4) != 0)
  {
    objc_msgSend(v15, "avatar");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "imageData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v13, "setCropRect:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      objc_msgSend(v13, "setThumbnailImageData:", 0);
      objc_msgSend(v13, "setImageData:", v19);
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v35 = 138412290;
        v36 = v15;
        _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "CKCoreChatController_Nicknames: Trying to update contact avatar with nil image from nickname %@", (uint8_t *)&v35, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isNameAndPhotoC3Enabled");

    if (v22)
    {
      v23 = objc_alloc(MEMORY[0x1E0C97408]);
      objc_msgSend(v15, "wallpaper");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "wallpaperData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v23, "initWithPosterArchiveData:", v25);

      objc_msgSend(v15, "wallpaper");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "metadata");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_msgSend(v26, "wallpaperIncludingIMWallpaperMetadata:", v28);
        v29 = objc_claimAutoreleasedReturnValue();

        v26 = (void *)v29;
      }
      if (v26)
      {
        objc_msgSend(v13, "setWallpaper:", v26);
      }
      else if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          v35 = 138412290;
          v36 = v15;
          _os_log_impl(&dword_18DFCD000, v30, OS_LOG_TYPE_INFO, "Trying to update contact wallpaper with nil wallpaper from nickname %@", (uint8_t *)&v35, 0xCu);
        }

      }
    }

  }
  if (v6)
  {
    objc_msgSend(v15, "handle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "length") == 0;

    if (!v32)
    {
      objc_msgSend(v15, "handle");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKCoreChatController updateContact:withHandle:](self, "updateContact:withHandle:", v13, v33);

    }
  }

  return v13;
}

- (BOOL)saveContact:(id)a3 shouldUpdate:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  char v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getContactStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_alloc_init(MEMORY[0x1E0C973D0]);
    v9 = v8;
    if (v4)
      objc_msgSend(v8, "updateContact:", v5);
    else
      objc_msgSend(v8, "addContact:toContainerWithIdentifier:", v5, 0);
    v15 = 0;
    v10 = objc_msgSend(v7, "executeSaveRequest:error:", v9, &v15);
    v11 = v15;
    if (v11)
      v12 = 0;
    else
      v12 = v10;
    if ((v12 & 1) == 0 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v11;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "CKCoreChatController_Nicknames: error saving contact: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_haveUpdateAlready:(id)a3 forContact:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "contact");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        v9 |= v15;
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9 & 1;
}

- (id)_retrieveNicknameBannerUpdatesIfNeeded:(unint64_t *)a3
{
  void *v5;
  int v6;
  BOOL v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  char v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  id v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  int v26;
  const __CFString *v27;
  const __CFString *v28;
  int v29;
  const __CFString *v30;
  NSObject *v31;
  int v32;
  const __CFString *v33;
  int v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  NSObject *v39;
  CKNicknameUpdate *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  CKNicknameUpdate *v45;
  uint8_t buf[4];
  unint64_t v47;
  __int16 v48;
  const __CFString *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPriusEnabled");

  v7 = -[CKViewController appearing](self, "appearing");
  if (!v6)
  {
    if (!v7 && !-[CKViewController appeared](self, "appeared"))
      goto LABEL_21;
    -[CKCoreChatController conversation](self, "conversation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "isBusinessConversation"))
    {
      -[CKCoreChatController chat](self, "chat");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isSMS") & 1) == 0
        && !CKIsRunningForDevelopmentOnSimulator()
        && !-[CKCoreChatController _isRunningPPT](self, "_isRunningPPT")
        && !-[CKCoreChatController isInline](self, "isInline")
        && !+[CKApplicationState isResizing](CKApplicationState, "isResizing"))
      {
        v13 = IMIsRunningInScreenshotTesting_IsolatedTranscriptUI();

        if ((v13 & 1) != 0)
          goto LABEL_21;
        goto LABEL_24;
      }

    }
LABEL_20:

    goto LABEL_21;
  }
  if (!v7 && !-[CKViewController appeared](self, "appeared"))
    goto LABEL_21;
  -[CKCoreChatController chat](self, "chat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "supportsCapabilities:", 8)
    || CKIsRunningForDevelopmentOnSimulator()
    || -[CKCoreChatController _isRunningPPT](self, "_isRunningPPT")
    || -[CKCoreChatController isInline](self, "isInline")
    || +[CKApplicationState isResizing](CKApplicationState, "isResizing"))
  {
    goto LABEL_20;
  }
  v9 = IMIsRunningInScreenshotTesting_IsolatedTranscriptUI();

  if ((v9 & 1) != 0)
    goto LABEL_21;
LABEL_24:
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "areBannersSupported");

  if (!v15)
    goto LABEL_21;
  if (!objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled"))
    goto LABEL_31;
  IMSharedDowntimeController();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isDowntimeLimited"))
    goto LABEL_20;
  -[CKCoreChatController conversation](self, "conversation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "chat");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {

    goto LABEL_31;
  }
  -[CKCoreChatController conversation](self, "conversation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "chat");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "allowedByScreenTime");

  if (v20)
  {
LABEL_31:
    v44 = 0;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "Checking nickname banner state", buf, 2u);
      }

    }
    -[CKCoreChatController _nicknameBannerUpdatesAndStyle:](self, "_nicknameBannerUpdatesAndStyle:", &v44);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D398E8], "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CKCoreChatController accountCanCreateNickname](self, "accountCanCreateNickname"))
    {
      if ((objc_msgSend(v23, "wasSharingEverEnabled") & 1) != 0)
      {
        if (!-[CKCoreChatController _alwaysShowNicknameBanners](self, "_alwaysShowNicknameBanners")
          && (objc_msgSend(v23, "sharingEnabled") & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              v25 = -[CKCoreChatController _alwaysShowNicknameBanners](self, "_alwaysShowNicknameBanners", v44);
              v26 = objc_msgSend(v23, "sharingEnabled");
              v27 = CFSTR("NO");
              if (v25)
                v28 = CFSTR("YES");
              else
                v28 = CFSTR("NO");
              if (v26)
                v27 = CFSTR("YES");
              *(_DWORD *)buf = 138412546;
              v47 = (unint64_t)v28;
              v48 = 2112;
              v49 = v27;
              _os_log_impl(&dword_18DFCD000, v24, OS_LOG_TYPE_INFO, "Not showing banner. Always show nickname banners: %@ is sharing enabled: %@", buf, 0x16u);
            }
LABEL_53:

            goto LABEL_54;
          }
          goto LABEL_54;
        }
      }
      else
      {
        v44 = 6;
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v32 = objc_msgSend(v23, "wasSharingEverEnabled");
            v33 = CFSTR("NO");
            if (v32)
              v33 = CFSTR("YES");
            *(_DWORD *)buf = 138412290;
            v47 = (unint64_t)v33;
            _os_log_impl(&dword_18DFCD000, v31, OS_LOG_TYPE_INFO, "Showing outgoing share banner. Was sharing ever enabled: %@", buf, 0xCu);
          }

        }
      }
      v34 = objc_msgSend(v23, "sharingEnabled", v44);
      if (v44)
        v35 = 0;
      else
        v35 = v34;
      if (v35 == 1)
      {
        objc_msgSend(MEMORY[0x1E0D358A8], "sharedInstance");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKCoreChatController chat](self, "chat");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v36, "shouldOfferNicknameSharingForChat:", v37);

        if (v38)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              v47 = v44;
              _os_log_impl(&dword_18DFCD000, v39, OS_LOG_TYPE_INFO, "Should offer nickname sharing. Banner style set to %lu", buf, 0xCu);
            }

          }
          v44 = 5;
          v40 = objc_alloc_init(CKNicknameUpdate);
          objc_msgSend(MEMORY[0x1E0D358A8], "sharedInstance");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "personalNickname");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKNicknameUpdate setNickname:](v40, "setNickname:", v42);

          v45 = v40;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
          v43 = objc_claimAutoreleasedReturnValue();

          v22 = (id)v43;
        }
      }
      if (a3)
        *a3 = v44;
      v22 = v22;
      v11 = v22;
      goto LABEL_74;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v29 = IMSharedHelperNickNameEnabled();
        v30 = CFSTR("NO");
        if (v29)
          v30 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v47 = (unint64_t)v30;
        _os_log_impl(&dword_18DFCD000, v24, OS_LOG_TYPE_INFO, "Not showing banner. Nickname feature enabled: %@", buf, 0xCu);
      }
      goto LABEL_53;
    }
LABEL_54:
    v11 = 0;
LABEL_74:

    return v11;
  }
LABEL_21:
  v11 = 0;
  return v11;
}

- (BOOL)accountCanCreateNickname
{
  void *v2;
  int v3;
  int v4;
  void *v5;
  int v6;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAllowMultiplePhoneNumbersSNaPEnabled");

  v4 = IMSharedHelperNickNameEnabled();
  if (v3)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0D358A8], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v6) = objc_msgSend(v5, "iCloudSignedInToUseNicknames");
LABEL_9:

      return v6;
    }
  }
  else if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D358A8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "iCloudSignedInToUseNicknames"))
      v6 = objc_msgSend(MEMORY[0x1E0D358A8], "multiplePhoneNumbersTiedToAppleID") ^ 1;
    else
      LOBYTE(v6) = 0;
    goto LABEL_9;
  }
  LOBYTE(v6) = 0;
  return v6;
}

- (void)updateContact:(id)a3 withHandle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && objc_msgSend(v6, "length"))
  {
    if (objc_msgSend(v7, "_appearsToBeEmail"))
    {
      objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", *MEMORY[0x1E0C96FF8], v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "emailAddresses");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v15[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setEmailAddresses:", v10);
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(v5, "emailAddresses");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrayByAddingObject:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setEmailAddresses:", v11);
LABEL_11:

      goto LABEL_12;
    }
    if (objc_msgSend(v7, "_appearsToBePhoneNumber"))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97398]), "initWithStringValue:", v7);
      objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", *MEMORY[0x1E0C97028], v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "phoneNumbers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v5, "phoneNumbers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "arrayByAddingObject:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setPhoneNumbers:", v13);

      }
      else
      {
        v14 = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setPhoneNumbers:", v11);
      }
      goto LABEL_11;
    }
  }
LABEL_13:

}

- (BOOL)_isRunningPPT
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "isRunningTest");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  CKCoreChatController *v5;
  void *v6;
  void *v7;
  objc_super v8;

  objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeListener:", self);

  -[CKConversation chat](self->_conversation, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendProgressDelegate");
  v5 = (CKCoreChatController *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
    objc_msgSend(v4, "setSendProgressDelegate:", 0);
  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", 0);

  -[CKCoreChatController refreshServiceForSendingUpdater](self, "refreshServiceForSendingUpdater");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  -[CKConversation willBecomeInactive](self->_conversation, "willBecomeInactive");
  v8.receiver = self;
  v8.super_class = (Class)CKCoreChatController;
  -[CKCoreChatController dealloc](&v8, sel_dealloc);
}

- (CKCoreChatController)initWithConversation:(id)a3
{
  id v4;
  CKCoreChatController *v5;
  CKCoreChatController *v6;
  CKScheduledUpdater *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CKCoreChatController;
  v5 = -[CKScrollViewController init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_initialViewSize = (CGSize)*MEMORY[0x1E0C9D820];
    v7 = -[CKScheduledUpdater initWithTarget:action:]([CKScheduledUpdater alloc], "initWithTarget:action:", v5, sel__refreshServiceForSending);
    -[CKCoreChatController setRefreshServiceForSendingUpdater:](v6, "setRefreshServiceForSendingUpdater:", v7);
    -[CKCoreChatController setConversation:](v6, "setConversation:", v4);
    -[CKCoreChatController registerNotifications](v6, "registerNotifications");
    -[CKCoreChatController _updateTitleAnimated:](v6, "_updateTitleAnimated:", 0);
    -[CKCoreChatController _updateNavigationButtons](v6, "_updateNavigationButtons");
    objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addListener:", v6);

  }
  return v6;
}

+ (Class)_gradientReferenceViewClass
{
  return (Class)objc_opt_class();
}

- (void)loadView
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[CKCoreChatController _initialFrameForGradientReferenceView](self, "_initialFrameForGradientReferenceView");
  v13 = (id)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_gradientReferenceViewClass")), "initWithFrame:", v3, v4, v5, v6);
  -[CKCoreChatController setView:](self, "setView:", v13);
  -[CKCoreChatController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAutoresizingMask:", 18);

  -[CKCoreChatController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "theme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transcriptBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v11);

  -[CKCoreChatController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLayoutMarginsFollowReadableWidth:", 1);

  -[CKCoreChatController setAutomaticallyAdjustsScrollViewInsets:](self, "setAutomaticallyAdjustsScrollViewInsets:", 0);
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKCoreChatController;
  -[CKCoreChatController viewDidLoad](&v4, sel_viewDidLoad);
  if (-[CKCoreChatController _controllerEligibleForSetConversation](self, "_controllerEligibleForSetConversation"))
  {
    -[CKCoreChatController conversation](self, "conversation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKCoreChatController setConversation:](self, "setConversation:", v3);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKCoreChatController;
  -[CKViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  if (CKIsRunningInMacCatalyst())
  {
    -[CKCoreChatController macToolbarController](self, "macToolbarController");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      v6 = -[CKCoreChatController conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE1607D8);

      if (v6)
      {
        -[CKCoreChatController macToolbarController](self, "macToolbarController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setSecondaryItemProvider:", self);

      }
    }
  }
  -[CKCoreChatController _registerSendProgressDelegate](self, "_registerSendProgressDelegate");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKCoreChatController;
  -[CKViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CKCoreChatController setViewIsVisible:](self, "setViewIsVisible:", 1);
}

- (void)viewDidAppearDeferredSetup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKCoreChatController;
  -[CKViewController viewDidAppearDeferredSetup](&v7, sel_viewDidAppearDeferredSetup);
  if (CKIsRunningInMessages())
  {
    CKPrewarmBalloonViewCacheIfNeeded();
    -[CKCoreChatController traitCollection](self, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    CKPrewarmBalloonViewMaskAndPunchOutCacheIfNeeded(v3);

  }
  +[CKPreviewDispatchCache genmojiPreviewCache](CKPreviewDispatchCache, "genmojiPreviewCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resume");

  +[CKPreviewDispatchCache transcriptPreviewCache](CKPreviewDispatchCache, "transcriptPreviewCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resume");

  +[CKPreviewDispatchCache snapshotCache](CKPreviewDispatchCache, "snapshotCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resume");

  -[CKCoreChatController _markAsReadIfNecessary](self, "_markAsReadIfNecessary");
  -[CKCoreChatController _inviteToViewStatusesIfNeeded](self, "_inviteToViewStatusesIfNeeded");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  int v14;
  objc_super v15;

  v3 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CKCoreChatController;
  -[CKViewController viewWillDisappear:](&v15, sel_viewWillDisappear_);
  -[CKCoreChatController setHandleStatusAssertion:](self, "setHandleStatusAssertion:", 0);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "useMacToolbar"))
    goto LABEL_5;
  -[CKCoreChatController macToolbarController](self, "macToolbarController");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
    goto LABEL_5;
  v7 = (void *)v6;
  v8 = -[CKCoreChatController conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE1607D8);

  if (v8)
  {
    -[CKCoreChatController macToolbarController](self, "macToolbarController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeItemProvider:", self);
LABEL_5:

  }
  -[CKCoreChatController _deregisterSendProgressDelegate](self, "_deregisterSendProgressDelegate");
  -[CKCoreChatController fullScreenBalloonViewController](self, "fullScreenBalloonViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[CKCoreChatController fullScreenBalloonViewController](self, "fullScreenBalloonViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "shouldShowStickers");

    if ((v12 & 1) == 0)
      -[CKCoreChatController _dismissFullScreenBubbleViewControllerAnimated:withSendAnimation:completion:](self, "_dismissFullScreenBubbleViewControllerAnimated:withSendAnimation:completion:", v3, 0, 0);
  }
  -[CKCoreChatController setViewIsVisible:](self, "setViewIsVisible:", 0);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isCarrierPigeonEnabled");

  if (v14)
    -[CKCoreChatController _cancelSatelliteFetch](self, "_cancelSatelliteFetch");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CKCoreChatController;
  -[CKCoreChatController viewDidLayoutSubviews](&v9, sel_viewDidLayoutSubviews);
  if (!-[CKCoreChatController initialLayoutComplete](self, "initialLayoutComplete"))
  {
    if (-[CKCoreChatController _controllerEligibleForSetConversation](self, "_controllerEligibleForSetConversation"))
    {
      -[CKCoreChatController setInitialLayoutComplete:](self, "setInitialLayoutComplete:", 1);
      -[CKCoreChatController conversation](self, "conversation");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKCoreChatController setConversation:](self, "setConversation:", v3);

      -[CKCoreChatController collectionView](self, "collectionView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)MEMORY[0x1E0CEABB0];
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __45__CKCoreChatController_viewDidLayoutSubviews__block_invoke;
      v7[3] = &unk_1E274A208;
      v8 = v4;
      v6 = v4;
      objc_msgSend(v5, "performWithoutAnimation:", v7);

    }
  }
}

void __45__CKCoreChatController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  id v2;

  +[CKScrollViewAnimationProperties unanimated](CKScrollViewAnimationProperties, "unanimated");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "enforceTranscriptScrollIntentWithAnimationProperties:", v2);

}

- (BOOL)_controllerEligibleForSetConversation
{
  return 1;
}

- (void)parentControllerDidBecomeActive
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "MarkAsRead - parentControllerDidBecomeActive", v4, 2u);
    }

  }
  -[CKCoreChatController _markAsReadIfNecessary](self, "_markAsReadIfNecessary");
}

- (void)systemApplicationWillEnterForeground
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKCoreChatController;
  -[CKViewController systemApplicationWillEnterForeground](&v4, sel_systemApplicationWillEnterForeground);
  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemApplicationWillEnterForeground");

}

- (void)parentControllerDidResume:(BOOL)a3 animating:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  objc_super v8;

  v4 = a4;
  v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CKCoreChatController;
  -[CKViewController parentControllerDidResume:animating:](&v8, sel_parentControllerDidResume_animating_);
  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parentControllerDidResume:animating:", v5, v4);

  -[CKCoreChatController _performResume](self, "_performResume");
}

- (void)_performResume
{
  void *v3;

  -[CKCoreChatController _registerSendProgressDelegate](self, "_registerSendProgressDelegate");
  -[CKCoreChatController _markAsReadIfNecessary](self, "_markAsReadIfNecessary");
  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForResume");

  -[CKCoreChatController refreshServiceForSending](self, "refreshServiceForSending");
}

- (void)prepareForSuspend
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKCoreChatController;
  -[CKViewController prepareForSuspend](&v3, sel_prepareForSuspend);
  -[CKCoreChatController _deregisterSendProgressDelegate](self, "_deregisterSendProgressDelegate");
}

+ (Class)transcriptControllerClass
{
  void *v2;
  void *v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transcriptCollectionViewControllerClass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (CKTranscriptCollectionView)collectionView
{
  void *v2;
  void *v3;

  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CKTranscriptCollectionView *)v3;
}

- (BOOL)shouldDismissAfterSend
{
  return !CKIsRunningInMessages() && CKIsRunningInMessagesTranscriptExtension() == 0;
}

- (BOOL)shouldDisplayTextEntry
{
  void *v3;
  void *v4;
  char v5;

  -[CKCoreChatController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CKCoreChatController conversation](self, "conversation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasReplyEnabled");

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (IMChat)chat
{
  void *v2;
  void *v3;

  -[CKCoreChatController conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (IMChat *)v3;
}

- (double)balloonMaxWidth
{
  return 0.0;
}

- (double)gradientBottomPlaceholderHeight
{
  return 0.0;
}

- (id)_handleIDsForCurrentConversation
{
  void *v2;
  void *v3;
  void *v4;

  -[CKCoreChatController conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__imArrayByApplyingBlock:", &__block_literal_global_176_2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __56__CKCoreChatController__handleIDsForCurrentConversation__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "defaultIMHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_conversationHasReplyEnabled
{
  void *v3;
  void *v4;
  char v5;

  -[CKCoreChatController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CKCoreChatController conversation](self, "conversation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasReplyEnabled");

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)_shouldAllowReply
{
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  BOOL v7;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = -[CKCoreChatController _shouldAllowReplyFromLockScreen](self, "_shouldAllowReplyFromLockScreen");
      -[CKCoreChatController conversation](self, "conversation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = 67109376;
      v9[1] = v4;
      v10 = 1024;
      v11 = objc_msgSend(v5, "hasLeftGroupChat");
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "allow reply: %d has left: %d", (uint8_t *)v9, 0xEu);

    }
  }
  if (!-[CKCoreChatController _shouldAllowReplyFromLockScreen](self, "_shouldAllowReplyFromLockScreen"))
    return 0;
  -[CKCoreChatController conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_msgSend(v6, "hasLeftGroupChat") & 1) == 0
    && -[CKCoreChatController _conversationHasReplyEnabled](self, "_conversationHasReplyEnabled");

  return v7;
}

- (BOOL)_shouldAllowReplyFromLockScreen
{
  int AppBooleanValue;
  int v4;
  void *v5;
  int v6;
  NSObject *v7;
  BOOL result;
  uint8_t v9[15];
  Boolean keyExistsAndHasValidFormat;

  CFPreferencesSynchronize(CFSTR("com.apple.mobilephone"), (CFStringRef)*MEMORY[0x1E0C9B240], (CFStringRef)*MEMORY[0x1E0C9B230]);
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("LockScreenMessaging"), CFSTR("com.apple.mobilephone"), &keyExistsAndHasValidFormat);
  v4 = keyExistsAndHasValidFormat;
  objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUnderFirstDataProtectionLock");

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Under first unlock. Not allowing lock screen messaging", v9, 2u);
      }

    }
    return !-[CKCoreChatController _deviceIsPasscodeLocked](self, "_deviceIsPasscodeLocked");
  }
  result = 1;
  if (v4 && !AppBooleanValue)
    return !-[CKCoreChatController _deviceIsPasscodeLocked](self, "_deviceIsPasscodeLocked");
  return result;
}

- (BOOL)conversationAllowedByScreenTime
{
  void *v3;
  void *v4;
  char v5;

  if (!objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled"))
    return 1;
  -[CKCoreChatController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "allowedToShowConversationSync");

  return v5;
}

- (BOOL)shouldUseInitialViewSize
{
  int32x2_t v2;

  v2 = vmovn_s64((int64x2_t)vmvnq_s8((int8x16_t)vcgtq_f64((float64x2_t)vdupq_n_s64(0x3EE4F8B580000000uLL), vabdq_f64((float64x2_t)self->_initialViewSize, *MEMORY[0x1E0C9D820]))));
  return (v2.i8[0] | v2.i8[4]) & 1;
}

- (CGRect)_initialFrameForCollectionView
{
  CGFloat width;
  CGFloat height;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  if (-[CKCoreChatController shouldUseInitialViewSize](self, "shouldUseInitialViewSize"))
  {
    width = self->_initialViewSize.width;
    height = self->_initialViewSize.height;
    v5 = 0.0;
    v6 = 0.0;
  }
  else
  {
    -[CKCoreChatController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v5 = v8;
    v6 = v9;
    width = v10;
    height = v11;

  }
  v12 = v5;
  v13 = v6;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)_initialFrameForGradientReferenceView
{
  CGFloat width;
  CGFloat height;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  if (-[CKCoreChatController shouldUseInitialViewSize](self, "shouldUseInitialViewSize"))
  {
    width = self->_initialViewSize.width;
    height = self->_initialViewSize.height;
    v5 = 0.0;
    v6 = 0.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v6 = v8;
    v5 = v9;
    width = v10;
    height = v11;

  }
  v12 = v6;
  v13 = v5;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)setConversation:(id)a3
{
  -[CKCoreChatController setConversation:forceReload:](self, "setConversation:forceReload:", a3, 0);
}

- (void)setConversation:(id)a3 forceReload:(BOOL)a4
{
  _BOOL4 v4;
  CKConversation *v7;
  NSObject *v8;
  id *p_conversation;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  char v15;
  int v16;
  NSObject *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  NSObject *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  NSObject *v59;
  CGRect rect;
  uint64_t v61;
  CGRect v62;

  v4 = a4;
  v61 = *MEMORY[0x1E0C80C00];
  v7 = (CKConversation *)a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LODWORD(rect.origin.y) = 138412290;
      *(_QWORD *)((char *)&rect.origin.y + 4) = v7;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "setting conversation: %@", (uint8_t *)&rect.origin.y, 0xCu);
    }

  }
  p_conversation = (id *)&self->_conversation;
  if (self->_conversation != v7)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = *p_conversation;
        LODWORD(rect.origin.y) = 138412290;
        *(_QWORD *)((char *)&rect.origin.y + 4) = v11;
        _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "old conversation becoming inactive %@", (uint8_t *)&rect.origin.y, 0xCu);
      }

    }
    objc_storeStrong((id *)&self->_conversation, a3);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = *p_conversation;
        LODWORD(rect.origin.y) = 138412290;
        *(_QWORD *)((char *)&rect.origin.y + 4) = v13;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "new conversation becoming active %@", (uint8_t *)&rect.origin.y, 0xCu);
      }

    }
    objc_msgSend(*p_conversation, "didBecomeActive");
    objc_msgSend(*p_conversation, "acquireHandleStatusObservationAssertion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKCoreChatController setHandleStatusAssertion:](self, "setHandleStatusAssertion:", v14);

    -[CKCoreChatController _deregisterSendProgressDelegate](self, "_deregisterSendProgressDelegate");
    -[CKCoreChatController refreshServiceForSending](self, "refreshServiceForSending");
  }
  v15 = -[CKCoreChatController isViewLoaded](self, "isViewLoaded");
  v16 = IMOSLoggingEnabled();
  if ((v15 & 1) != 0)
  {
    if (v16)
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LODWORD(rect.origin.y) = 136315138;
        *(_QWORD *)((char *)&rect.origin.y + 4) = "-[CKCoreChatController setConversation:forceReload:]";
        _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "Initial layout is complete, proceeding with %s", (uint8_t *)&rect.origin.y, 0xCu);
      }

    }
    if (v7)
    {
      -[CKConversation chat](v7, "chat");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = -[CKCoreChatController conversationAllowedByScreenTime](self, "conversationAllowedByScreenTime");

        -[CKCoreChatController satelliteUnavailableLabel](self, "satelliteUnavailableLabel");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "removeFromSuperview");

        -[CKCoreChatController setSatelliteUnavailableLabel:](self, "setSatelliteUnavailableLabel:", 0);
        if (v19)
        {
          -[CKCoreChatController collectionViewController](self, "collectionViewController");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "conversation");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKCoreChatController conversation](self, "conversation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22 != v23)
            v4 = 1;

          if (v4)
          {
            -[CKCoreChatController _removeExistingCollectionViewController](self, "_removeExistingCollectionViewController");
            -[CKCoreChatController calculateTranscriptMarginInsets](self, "calculateTranscriptMarginInsets");
            v25 = v24;
            v27 = v26;
            v29 = v28;
            v31 = v30;
            -[CKCoreChatController balloonMaxWidth](self, "balloonMaxWidth");
            v33 = v32;
            -[CKCoreChatController _initialFrameForCollectionView](self, "_initialFrameForCollectionView");
            rect.origin.x = v34;
            v36 = v35;
            v38 = v37;
            v40 = v39;
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v41 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
              {
                v62.origin.x = rect.origin.x;
                v62.origin.y = v36;
                v62.size.width = v38;
                v62.size.height = v40;
                NSStringFromCGRect(v62);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(rect.origin.y) = 138412290;
                *(_QWORD *)((char *)&rect.origin.y + 4) = v42;
                _os_log_impl(&dword_18DFCD000, v41, OS_LOG_TYPE_INFO, "Collection view's initialFrame is: %@", (uint8_t *)&rect.origin.y, 0xCu);

              }
            }
            v43 = objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "transcriptControllerClass"));
            -[CKCoreChatController conversation](self, "conversation");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = (void *)objc_msgSend(v43, "initWithConversation:delegate:balloonMaxWidth:marginInsets:collectionViewSize:", v44, self, v33, v25, v27, v29, v31, v38, v40);

            -[CKCoreChatController setCollectionViewController:](self, "setCollectionViewController:", v45);
            objc_msgSend(v45, "setTransitionedFromComposing:", -[CKCoreChatController transitionedFromComposing](self, "transitionedFromComposing"));
            objc_msgSend(v45, "setDelegate:", self);
            objc_msgSend(v45, "__setCurrentTestName:", __CurrentTestName);
            -[CKCoreChatController gradientReferenceView](self, "gradientReferenceView");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "setGradientReferenceView:", v46);

            -[CKCoreChatController addChildViewController:](self, "addChildViewController:", v45);
            objc_msgSend(v45, "collectionView");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "setFrame:", rect.origin.x, v36, v38, v40);
            objc_msgSend(v47, "setAutoresizingMask:", 18);
            -[CKCoreChatController delegate](self, "delegate");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "initialSafeAreaInsetsForChatController:", self);
            objc_msgSend(v47, "setInitialSafeAreaInsets:");

            -[CKCoreChatController view](self, "view");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            -[CKCoreChatController viewToInsertTranscriptCollectionViewBelow](self, "viewToInsertTranscriptCollectionViewBelow");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            if (v50)
              objc_msgSend(v49, "insertSubview:belowSubview:", v47, v50);
            else
              objc_msgSend(v49, "addSubview:", v47);
            -[CKCoreChatController applyInitialContextToCollectionViewIfNeeded](self, "applyInitialContextToCollectionViewIfNeeded");
            objc_msgSend(v45, "reloadData");
            -[CKCoreChatController gradientReferenceView](self, "gradientReferenceView");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "contentInset");
            -[CKCoreChatController gradientFrameWithInsets:](self, "gradientFrameWithInsets:");
            objc_msgSend(v53, "setGradientFrame:");

            objc_msgSend(v45, "collectionView");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "collectionViewLayout");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "prepareLayout");

            -[CKScrollViewController updateScrollGeometryWithoutAnimationForReason:](self, "updateScrollGeometryWithoutAnimationForReason:", CFSTR("ChangeConversation"));
            objc_msgSend(v45, "didMoveToParentViewController:", self);
            -[CKCoreChatController _registerSendProgressDelegate](self, "_registerSendProgressDelegate");
            -[CKCoreChatController _updateTitleAnimated:](self, "_updateTitleAnimated:", 0);
            -[CKCoreChatController _updateNavigationButtons](self, "_updateNavigationButtons");
            -[CKCoreChatController registerNotificationsForConversation:](self, "registerNotificationsForConversation:", v7);
            -[CKCoreChatController setInitialViewSize:](self, "setInitialViewSize:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));

          }
          goto LABEL_47;
        }
      }
      else
      {
        -[CKCoreChatController satelliteUnavailableLabel](self, "satelliteUnavailableLabel");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "removeFromSuperview");

        -[CKCoreChatController setSatelliteUnavailableLabel:](self, "setSatelliteUnavailableLabel:", 0);
      }
      if (!-[CKConversation isPending](v7, "isPending"))
      {
LABEL_47:
        -[CKCoreChatController _setConversationDeferredSetup](self, "_setConversationDeferredSetup");
        if (-[CKCoreChatController needsEndPinningInputViewsForSwitchingConversationAfterConversationIsSet](self, "needsEndPinningInputViewsForSwitchingConversationAfterConversationIsSet"))
        {
          -[CKCoreChatController setNeedsEndPinningInputViewsForSwitchingConversationAfterConversationIsSet:](self, "setNeedsEndPinningInputViewsForSwitchingConversationAfterConversationIsSet:", 0);
          -[CKCoreChatController endPinningInputViewsForReason:](self, "endPinningInputViewsForReason:", CFSTR("SwitchingActiveConversations"));
        }
        goto LABEL_49;
      }
    }
    else
    {
      -[CKCoreChatController satelliteUnavailableLabel](self, "satelliteUnavailableLabel");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "removeFromSuperview");

      -[CKCoreChatController setSatelliteUnavailableLabel:](self, "setSatelliteUnavailableLabel:", 0);
      if (!objc_msgSend(0, "isPending"))
      {
        IMLogHandleForCategory();
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          -[CKCoreChatController setConversation:forceReload:].cold.1();

        goto LABEL_47;
      }
    }
    -[CKCoreChatController _removeExistingCollectionViewController](self, "_removeExistingCollectionViewController");
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "isCarrierPigeonEnabled");

    if (v58)
      -[CKCoreChatController _displaySatelliteStatusItemIfNeeded](self, "_displaySatelliteStatusItemIfNeeded");
    goto LABEL_47;
  }
  if (v16)
  {
    OSLogHandleForIMFoundationCategory();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
    {
      LODWORD(rect.origin.y) = 136315138;
      *(_QWORD *)((char *)&rect.origin.y + 4) = "-[CKCoreChatController setConversation:forceReload:]";
      _os_log_impl(&dword_18DFCD000, v51, OS_LOG_TYPE_INFO, "View is not loaded, bailing from %s", (uint8_t *)&rect.origin.y, 0xCu);
    }

  }
LABEL_49:

}

- (void)_displaySatelliteStatusItemIfNeeded
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  id v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  CKTranscriptLabelCell *v46;

  -[CKCoreChatController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 < 2)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isSatelliteConnectionActive");

  }
  objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isSatelliteConnectionActive"))
  {
    -[CKCoreChatController conversation](self, "conversation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recipients");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      -[CKCoreChatController conversation](self, "conversation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isSatelliteSendingService") ^ 1;

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  if ((v7 | v12) == 1)
  {
    -[CKCoreChatController satelliteUnavailableLabel](self, "satelliteUnavailableLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      -[CKCoreChatController _initialFrameForCollectionView](self, "_initialFrameForCollectionView");
      v45 = v14;
      v16 = v15;
      v18 = v17;
      v46 = objc_alloc_init(CKTranscriptLabelCell);
      -[CKCoreChatController conversation](self, "conversation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sendingService");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D35918], "iMessageService");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 == v21)
      {
        v25 = 1;
      }
      else
      {
        -[CKCoreChatController conversation](self, "conversation");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "sendingService");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D35918], "iMessageLiteService");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v23 == v24;

      }
      v26 = +[CKUnavailableSatelliteForServiceChatItem newComposeTranscriptTextForiMessage:isGroupChat:](CKUnavailableSatelliteForServiceChatItem, "newComposeTranscriptTextForiMessage:isGroupChat:", v25, v5 > 1);
      -[CKTranscriptLabelCell setAttributedText:](v46, "setAttributedText:", v26);
      -[CKCoreChatController calculateTranscriptMarginInsets](self, "calculateTranscriptMarginInsets");
      v28 = v27;
      v29 = v18 + v27 * -2.0;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "boundingRectWithSize:options:context:", 1, 0, v29, 1.79769313e308);
      v32 = v31;
      objc_msgSend(v30, "smallTranscriptSpace");
      v34 = v33;
      objc_msgSend(v30, "transcriptBoldTextAlignmentInsets");
      v36 = v35;
      v38 = v37;
      -[CKCoreChatController view](self, "view");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "safeAreaInsets");
      v41 = v40;
      -[CKScrollViewController topInsetPadding](self, "topInsetPadding");
      v43 = v41 + v42;

      -[CKTranscriptLabelCell setFrame:](v46, "setFrame:", v45 + v28, v16 + v43, v29, v32 - v36 + v34 + v32 - v38);
      -[CKCoreChatController setSatelliteUnavailableLabel:](self, "setSatelliteUnavailableLabel:", v46);
      -[CKCoreChatController view](self, "view");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addSubview:", v46);

    }
  }
}

- (UIEdgeInsets)calculateTranscriptMarginInsets
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  id WeakRetained;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  UIEdgeInsets result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "forceMinTranscriptMarginInsets") & 1) != 0)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "minTranscriptMarginInsets");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
  }
  else
  {
    -[CKCoreChatController systemMinimumLayoutMargins](self, "systemMinimumLayoutMargins");
    v6 = v13;
    v12 = v14;
    v10 = v15;
    v17 = v16;
    -[CKCoreChatController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v4, "effectiveUserInterfaceLayoutDirection");
    if (v18)
      v8 = v17;
    else
      v8 = v12;
    if (!v18)
      v12 = v17;
  }

  if (*(double *)(MEMORY[0x1E0CEB4B0] + 8) == v8
    && *MEMORY[0x1E0CEB4B0] == v6
    && *(double *)(MEMORY[0x1E0CEB4B0] + 24) == v12
    && *(double *)(MEMORY[0x1E0CEB4B0] + 16) == v10)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

    if (WeakRetained)
    {
      v23 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v23, "initialSystemMinimumLayoutMarginsForChatController:", self);
      v6 = v24;
      v8 = v25;
      v10 = v26;
      v12 = v27;

    }
  }
  v28 = v6;
  v29 = v8;
  v30 = v10;
  v31 = v12;
  result.right = v31;
  result.bottom = v30;
  result.left = v29;
  result.top = v28;
  return result;
}

- (id)viewToInsertTranscriptCollectionViewBelow
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  if (!-[CKCoreChatController isShowingLockoutView](self, "isShowingLockoutView")
    || (-[CKCoreChatController lockoutViewController](self, "lockoutViewController"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "view"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "useMacToolbar"))
      goto LABEL_7;
    v5 = -[CKCoreChatController showingInStandAloneWindow](self, "showingInStandAloneWindow");

    if (!v5)
    {
LABEL_8:
      v4 = 0;
      return v4;
    }
    -[CKCoreChatController macToolbarController](self, "macToolbarController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4
      || (-[CKCoreChatController view](self, "view"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v7, "subviews"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "containsObject:", v4),
          v8,
          v7,
          (v9 & 1) == 0))
    {
LABEL_7:

      goto LABEL_8;
    }
  }
  return v4;
}

- (UIEdgeInsets)calculateTranscriptSafeAreaInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[CKCoreChatController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeAreaInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)_removeExistingCollectionViewController
{
  void *v3;
  void *v4;
  id v5;

  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKCoreChatController collectionViewController](self, "collectionViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "willMoveToParentViewController:", 0);
    objc_msgSend(v5, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    objc_msgSend(v5, "removeFromParentViewController");
  }
}

- (void)setCollectionViewController:(id)a3
{
  CKCoreTranscriptControllerProtocol *v5;
  CKCoreTranscriptControllerProtocol *v6;

  v5 = (CKCoreTranscriptControllerProtocol *)a3;
  if (self->_collectionViewController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_collectionViewController, a3);
    v5 = v6;
  }

}

- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 tappedForChatItem:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CKCoreChatController collectionViewController](self, "collectionViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transcriptIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentViewControllerForContext:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[CKCoreChatController navigationController](self, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pushViewController:animated:", v8, 1);

    }
  }

}

- (void)_handleTapEventForBalloonView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  int v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEmojiTapbacksEnabled");

  if ((v9 & 1) != 0 || -[CKCoreChatController _shouldAllowReply](self, "_shouldAllowReply"))
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    -[CKCoreChatController collectionViewController](self, "collectionViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v11, "associatedChatItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = objc_msgSend(v7, "item");
      if (v14 < objc_msgSend(v13, "count"))
      {
        objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v7, "item"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKCoreChatController collectionViewController](self, "collectionViewController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "chatItems");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "associatedChatItemGUID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v15, "associatedMessageRange");
        v21 = objc_msgSend(v17, "__ck_indexOfParentChatItemWithMesssageGUID:associatedMessageRange:", v18, v19, v20);

        if (v21 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v22 = v15;
        }
        else
        {
          -[CKCoreChatController collectionViewController](self, "collectionViewController");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "chatItems");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectAtIndex:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v21, 0);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[CKCoreChatController showFullScreenAcknowledgmentPickerIfNeededForBalloonAtIndexPath:](self, "showFullScreenAcknowledgmentPickerIfNeededForBalloonAtIndexPath:", v29);

          }
        }

        goto LABEL_32;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v31 = 134218240;
          v32 = objc_msgSend(v7, "item");
          v33 = 2048;
          v34 = objc_msgSend(v13, "count");
          _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "Attempted to present ack menu for associated chat item out of idx range. idx %lu count %lu", (uint8_t *)&v31, 0x16u);
        }
LABEL_18:

      }
    }
    else
    {
      objc_msgSend(v11, "chatItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = objc_msgSend(v7, "item");
      if (v23 >= objc_msgSend(v13, "count"))
      {
        if (!IMOSLoggingEnabled())
          goto LABEL_32;
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v31 = 134218240;
          v32 = objc_msgSend(v7, "item");
          v33 = 2048;
          v34 = objc_msgSend(v13, "count");
          _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "Attempted to present ack menu for chat item out of idx range. idx %lu count %lu", (uint8_t *)&v31, 0x16u);
        }
        goto LABEL_18;
      }
      objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v7, "item"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v24, "isCommSafetySensitive") & 1) == 0)
      {
        if (!objc_msgSend(v24, "isEditedMessageHistory"))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v30 = v24;
            if (objc_msgSend(v30, "isReplyContextPreview"))
              -[CKCoreChatController showInlineReplyControllerForChatItem:presentKeyboard:](self, "showInlineReplyControllerForChatItem:presentKeyboard:", v30, 0);
            else
              -[CKCoreChatController showFullScreenAcknowledgmentPickerIfNeededForBalloonAtIndexPath:](self, "showFullScreenAcknowledgmentPickerIfNeededForBalloonAtIndexPath:", v7);

          }
          goto LABEL_32;
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            LOWORD(v31) = 0;
            _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "Ignoring tap action for edited message history balloon", (uint8_t *)&v31, 2u);
          }

        }
      }

    }
LABEL_32:

  }
}

- (void)_handleShowInlineReplyForItemWithIndexPath:(id)a3 replyTransitionProperties:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chatItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v13, "item");
  if (v9 < objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v13, "item"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "replyShouldShowKeyboard");

    -[CKCoreChatController showInlineReplyControllerForChatItem:presentKeyboard:replyTransitionProperties:](self, "showInlineReplyControllerForChatItem:presentKeyboard:replyTransitionProperties:", v10, v12, v6);
  }

}

- (void)viewDidLayoutSubviewsForTranscriptCollectionViewController:(id)a3
{
  void *v4;
  id v5;

  -[CKCoreChatController fullScreenBalloonViewController](self, "fullScreenBalloonViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKCoreChatController fullScreenBalloonViewController](self, "fullScreenBalloonViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateBalloonViewFrame");

  }
}

- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 doubleTappedItemAtIndexPath:(id)a5
{
  -[CKCoreChatController _handleTapEventForBalloonView:atIndexPath:](self, "_handleTapEventForBalloonView:atIndexPath:", a4, a5);
}

- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 longPressedForItemWithIndexPath:(id)a5
{
  -[CKCoreChatController _handleTapEventForBalloonView:atIndexPath:](self, "_handleTapEventForBalloonView:atIndexPath:", a4, a5);
}

- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 selectedItemAtIndexPath:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "highlightItemAtIndexPathWhenDisplayed:autoDismiss:", v6, 0);

}

- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 showInlineReplyForItemWithIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[CKInlineReplyTransitionProperties defaultProperties](CKInlineReplyTransitionProperties, "defaultProperties");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[CKCoreChatController transcriptCollectionViewController:balloonView:showInlineReplyForItemWithIndexPath:withReplyTransitionProperties:](self, "transcriptCollectionViewController:balloonView:showInlineReplyForItemWithIndexPath:withReplyTransitionProperties:", v10, v9, v8, v11);

}

- (void)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 showInlineReplyForItemWithIndexPath:(id)a5 withReplyTransitionProperties:(id)a6
{
  -[CKCoreChatController _handleShowInlineReplyForItemWithIndexPath:replyTransitionProperties:](self, "_handleShowInlineReplyForItemWithIndexPath:replyTransitionProperties:", a5, a6);
}

- (int64_t)transcriptCollectionViewControllerWantsCurrentDesiredIntent:(id)a3
{
  return 0;
}

- (void)transcriptCollectionViewControllerDidInset:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CKCoreChatController gradientReferenceView](self, "gradientReferenceView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "contentInset");
  -[CKCoreChatController gradientFrameWithInsets:](self, "gradientFrameWithInsets:");
  objc_msgSend(v6, "setGradientFrame:");

}

- (BOOL)transcriptCollectionViewController:(id)a3 balloonView:(id)a4 shouldSelectChatItem:(id)a5
{
  return 0;
}

- (BOOL)transcriptCollectionViewControllerShouldPlayAudio:(id)a3
{
  return 0;
}

- (void)transcriptCollectionViewControllerDidSetChatItems:(id)a3
{
  if (-[CKViewController deferredAppeared](self, "deferredAppeared", a3))
    -[CKCoreChatController _inviteToViewStatusesIfNeeded](self, "_inviteToViewStatusesIfNeeded");
}

- (void)transcriptCollectionViewController:(id)a3 collectionViewContentSizeDidChange:(CGSize)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  CGRect v15;
  CGRect v16;

  -[CKCoreChatController gradientReferenceView](self, "gradientReferenceView", a3, a4.width, a4.height);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[CKCoreChatController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentInset");
  -[CKCoreChatController gradientFrameWithInsets:](self, "gradientFrameWithInsets:");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  objc_msgSend(v14, "gradientFrame");
  v16.origin.x = v7;
  v16.origin.y = v9;
  v16.size.width = v11;
  v16.size.height = v13;
  if (!CGRectEqualToRect(v15, v16))
  {
    objc_msgSend(v14, "setGradientFrame:", v7, v9, v11, v13);
    objc_msgSend(v14, "layoutGradientViewsIfNeeded");
  }

}

- (BOOL)transcriptCollectionViewControllerShouldShouldScrollToTopForStatusBarTap:(id)a3
{
  return 1;
}

- (BOOL)transcriptCollectionViewControllerShouldScrollToBottomForLocalSentMessage:(id)a3
{
  return 1;
}

- (void)transcriptCollectionViewController:(id)a3 shouldScrollToHighlightedMessage:(id)a4
{
  -[CKCoreChatController scrollToHighlightedMessageScrollContext:](self, "scrollToHighlightedMessageScrollContext:", a4);
}

- (void)transcriptCollectionViewControllerReportSpamButtonTapped:(id)a3
{
  void *v4;
  id v5;

  -[CKCoreChatController delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CKCoreChatController conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chatController:didReportSpamForConversation:", self, v4);

}

- (void)transcriptCollectionViewControllerWillDisplayLastBalloon:(id)a3
{
  -[CKCoreChatController setIgnoreLastBalloonVisibleInMarkAsReadCheck:](self, "setIgnoreLastBalloonVisibleInMarkAsReadCheck:", 1);
  -[CKCoreChatController _markAsReadIfNecessary](self, "_markAsReadIfNecessary");
  -[CKCoreChatController setIgnoreLastBalloonVisibleInMarkAsReadCheck:](self, "setIgnoreLastBalloonVisibleInMarkAsReadCheck:", 0);
}

- (void)transcriptCollectionViewControllerDidChangeAssociatedChatItem:(id)a3 chatItemDiff:(id)a4
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a4, "inserted", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    -[CKCoreChatController _markAsReadIfNecessary](self, "_markAsReadIfNecessary");
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKCoreChatController;
  v4 = a3;
  -[CKCoreChatController traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, v4);
  -[CKCoreChatController invalidateChatItemLayoutForTraitCollectionChangeIfNeeded:](self, "invalidateChatItemLayoutForTraitCollectionChangeIfNeeded:", v4, v5.receiver, v5.super_class);

}

- (void)invalidateChatItemLayoutForTraitCollectionChangeIfNeeded:(id)a3
{
  id v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  v4 = a3;
  -[CKCoreChatController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ck_chatItemLayoutNeedsInvalidationForPreviousTraitCollection:", v4);

  if (v6)
  {
    -[CKCoreChatController collectionViewController](self, "collectionViewController");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "balloonMaxWidth");
    v8 = v7;
    objc_msgSend(v18, "marginInsets");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[CKCoreChatController traitCollection](self, "traitCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "invalidateChatItemLayoutWithNewBalloonMaxWidth:marginInsets:traitCollection:", v17, v8, v10, v12, v14, v16);

  }
}

- (double)transcriptCollectionViewController:(id)a3 targetAlphaForChatItem:(id)a4
{
  return 1.0;
}

- (BOOL)transcriptCollectionViewControllerPlaybackForOutgoingEffectsIsAllowed:(id)a3
{
  return 1;
}

- (BOOL)transcriptCollectionViewController:(id)a3 shouldSetupFullscreenEffectUI:(id)a4
{
  return 1;
}

- (BOOL)transcriptCollectionViewControllerShouldLayoutFullscreenEffects:(id)a3
{
  return 1;
}

- (BOOL)transcriptCollectionViewController:(id)a3 shouldCleanupFullscreenEffectUI:(id)a4
{
  return 1;
}

- (id)transcriptCollectionViewControllerAdditionalFullscreenEffectViews:(id)a3
{
  return 0;
}

- (id)transcriptCollectionViewControllerOuterEffectPresentingView:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)transcriptCollectionViewController:(id)a3 balloonViewDidRequestCommitPayload:(id)a4 forPlugin:(id)a5 allowAllCommits:(BOOL)a6 error:(id *)a7
{
  return 0;
}

- (BOOL)transcriptCollectionViewController:(id)a3 balloonViewDidRequestCommitSticker:(id)a4 forPlugin:(id)a5 allowAllCommits:(BOOL)a6 error:(id *)a7
{
  return 0;
}

- (void)transcriptCollectionViewController:(id)a3 viewedCommSafetyItemWithIndexPath:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  NSObject *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  uint8_t buf[4];
  _DWORD v40[7];

  *(_QWORD *)&v40[5] = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v35 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[CKCoreChatController conversation](self, "conversation", v33);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "chat");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v40 = v8;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "User signified view sensitive photo for chat %@", buf, 0xCu);

    }
  }
  v9 = objc_msgSend(v35, "item", v33);
  if (v9 < 0)
  {
    v15 = 0;
  }
  else
  {
    while (1)
    {
      -[CKCoreChatController collectionViewController](self, "collectionViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "chatItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "IMChatItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "supportsCommunicationSafety"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v40 = v13;
          _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "This chat item is not IMMessagePartChatItem: %@", buf, 0xCu);
        }

      }
      if (v9-- <= 0)
      {
        v15 = 0;
        v9 = -1;
        goto LABEL_16;
      }
    }
    objc_msgSend(v13, "messageItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "message");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "fileTransferGUIDs");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v18, "count");

  }
LABEL_16:
  v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((v9 & 0x8000000000000000) == 0 && v15)
  {
    v19 = 0;
    do
    {
      -[CKCoreChatController collectionViewController](self, "collectionViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "chatItems");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectAtIndex:", v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = v22;
        objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "transferGUID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "transferForGUID:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v26, "commSafetySensitive") == 1)
        {
          objc_msgSend(v23, "IMChatItem");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObject:", v27);

          objc_msgSend(v23, "message");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "guid");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKCoreChatController _registerCommSafetyReceivedEventForTransfer:messageGUID:](self, "_registerCommSafetyReceivedEventForTransfer:messageGUID:", v26, v29);

        }
        ++v19;
      }

      v30 = v9-- != 0;
    }
    while (v30 && v19 < v15);
  }
  if (objc_msgSend(v36, "count"))
  {
    -[CKCoreChatController collectionViewController](self, "collectionViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __93__CKCoreChatController_transcriptCollectionViewController_viewedCommSafetyItemWithIndexPath___block_invoke;
    v37[3] = &unk_1E274A108;
    v37[4] = self;
    v38 = v36;
    objc_msgSend(v31, "updateTranscript:animated:completion:", v37, 1, 0);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109376;
      v40[0] = v15;
      LOWORD(v40[1]) = 1024;
      *(_DWORD *)((char *)&v40[1] + 2) = v9;
      _os_log_impl(&dword_18DFCD000, v32, OS_LOG_TYPE_INFO, "Did not find chatItems to refresh. totalTransferCount: %d, indexForSensitiveAttachment: %d", buf, 0xEu);
    }

  }
}

void __93__CKCoreChatController_transcriptCollectionViewController_viewedCommSafetyItemWithIndexPath___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "chat");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateCommSafety:forChatItems:", 2, *(_QWORD *)(a1 + 40));

}

- (id)transcriptCollectionViewController:(id)a3 mediaObjectsForCommSafetyReportWithIndexPath:(id)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v23 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      -[CKCoreChatController conversation](self, "conversation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "chat");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v26 = v8;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "User started sensitive content report for chat %@", buf, 0xCu);

    }
  }
  v24 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "chatItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v23, "item");
  v12 = v11;
  if (v11)
  {
    if (v11 < 0)
      goto LABEL_17;
  }
  else
  {
    v12 = objc_msgSend(v10, "count") - 1;
    if (v12 < 0)
      goto LABEL_17;
  }
  do
  {
    objc_msgSend(v10, "objectAtIndexedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "IMChatItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "supportsCommunicationSafety"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = v13;
          objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "transferGUID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "transferForGUID:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v18, "commSafetySensitive"))
          {
            objc_msgSend(v15, "mediaObject");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v19);

          }
        }
      }
    }

  }
  while (v12-- > 0);
LABEL_17:

  return v24;
}

- (void)transcriptCollectionViewController:(id)a3 viewedCommSafetyAssociatedItemsWithIndexPath:(id)a4
{
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _QWORD v34[5];
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v29 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[CKCoreChatController conversation](self, "conversation", v27);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "chat");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v43 = v7;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "User signified view multiple sensitive associated items for chat %@", buf, 0xCu);

    }
  }
  v31 = objc_msgSend(v29, "item", v27);
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v31 < 0)
  {
    v30 = 0;
  }
  else
  {
    while (1)
    {
      -[CKCoreChatController collectionViewController](self, "collectionViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "chatItems");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v32, "IMChatItem");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v43 = v30;
          _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "This chat item is not IMMessagePartChatItem: %@", buf, 0xCu);
        }

      }
      if (v31-- <= 0)
      {
        v30 = 0;
        LODWORD(v31) = -1;
        goto LABEL_30;
      }
    }
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v32, "visibleAssociatedMessageChatItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v38 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if (objc_msgSend(v16, "isCommSafetySensitiveNotViewable"))
          {
            objc_msgSend(v16, "commSafetyTransferGUID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "commSafetyTransferGUID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "transferForGUID:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              v20 = 0;
            }

            objc_msgSend(v16, "IMChatItem");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v21);

            if (v20)
            {
              objc_msgSend(v16, "commSafetyMessageGUID");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = v22 == 0;

              if (!v23)
              {
                objc_msgSend(v16, "commSafetyMessageGUID");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                -[CKCoreChatController _registerCommSafetyReceivedEventForTransfer:messageGUID:](self, "_registerCommSafetyReceivedEventForTransfer:messageGUID:", v20, v24);

              }
            }

          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v13);
    }

  }
LABEL_30:
  if (objc_msgSend(v8, "count"))
  {
    -[CKCoreChatController collectionViewController](self, "collectionViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __104__CKCoreChatController_transcriptCollectionViewController_viewedCommSafetyAssociatedItemsWithIndexPath___block_invoke;
    v34[3] = &unk_1E274A0B8;
    v34[4] = self;
    v35 = v8;
    v36 = v30;
    objc_msgSend(v25, "updateTranscript:animated:completion:", v34, 1, 0);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v43) = v31;
      _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "Did not find associated chatItems to refresh. indexForSensitiveAttachment: %d", buf, 8u);
    }

  }
}

void __104__CKCoreChatController_transcriptCollectionViewController_viewedCommSafetyAssociatedItemsWithIndexPath___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "chat");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateCommSafety:forChatItems:parentChatItem:", 2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)_registerCommSafetyReceivedEventForTransfer:(id)a3 messageGUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "localURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0D357D8]);
    objc_msgSend(v6, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithIdentifier:imageData:", v11, v9);

    v13 = (void *)MEMORY[0x1E0D357D0];
    -[CKCoreChatController chat](self, "chat");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "registerEvent:eventType:messageGUID:chat:forImages:", 1, 0, v7, v14, v15);

  }
}

- (void)_messageSomeonePressed
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D357E0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getOpenChatURLWith:", &__block_literal_global_209_2);

}

void __46__CKCoreChatController__messageSomeonePressed__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0CEA2F8];
  v3 = a2;
  objc_msgSend(v2, "sharedApplication");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openURL:options:completionHandler:", v3, MEMORY[0x1E0C9AA70], 0);

}

- (void)sendStickerTapback:(id)a3 mediaObject:(id)a4 parentMessagePartChatItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  CKCoreChatController *v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
    {
      +[CKStickerTapbackCommSafetySendContext contextWithStickerTapback:mediaObject:parentMessagePartChatItem:](CKStickerTapbackCommSafetySendContext, "contextWithStickerTapback:mediaObject:parentMessagePartChatItem:", v8, v9, v10);
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "transfer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fileURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __81__CKCoreChatController_sendStickerTapback_mediaObject_parentMessagePartChatItem___block_invoke;
      v14[3] = &unk_1E274FBC8;
      v15 = v8;
      v16 = self;
      v17 = v10;
      -[CKCoreChatController presentCommSafetyInterventionIfNecessaryForFileURL:withSendContext:completion:](self, "presentCommSafetyInterventionIfNecessaryForFileURL:withSendContext:completion:", v13, v11, v14);

    }
    else
    {
      IMLogHandleForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CKCoreChatController sendStickerTapback:mediaObject:parentMessagePartChatItem:].cold.2();
    }
  }
  else
  {
    IMLogHandleForCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CKChatController(CKChatController_Stickers) sendSticker:withMediaObject:composition:parentMessagePartChatItem:messageSummaryInfo:].cold.1();
  }

}

void __81__CKCoreChatController_sendStickerTapback_mediaObject_parentMessagePartChatItem___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    IMLogHandleForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v7 = v4;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Sticker Tapback was sensitive, deferring send for intervention: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "_dismissFullScreenBubbleViewControllerAnimated:withSendAnimation:completion:", 1, 0, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "chat");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendTapback:forChatItem:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  }
}

- (CGRect)gradientFrameWithInsets:(UIEdgeInsets)a3
{
  double bottom;
  double v5;
  double v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect result;

  bottom = a3.bottom;
  -[CKCoreChatController gradientBottomPlaceholderHeight](self, "gradientBottomPlaceholderHeight", a3.top, a3.left, a3.bottom, a3.right);
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  -[CKCoreChatController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 > 1)
  {
    objc_msgSend(v9, "frame");
    v13 = v14;
  }
  else
  {
    objc_msgSend(v9, "bounds");
    v13 = fmax(v11, v12);
  }

  v15 = *MEMORY[0x1E0C9D538];
  -[CKCoreChatController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;

  v19 = v15 + 0.0;
  v20 = v13 - (v6 + 0.0);
  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "collectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKCoreChatController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "frame");
  v25 = v24 - (bottom + v20);

  v26 = v20 - (bottom + -44.0);
  objc_msgSend(v22, "__ck_contentSize");
  v28 = v26 - v27;
  if (v26 <= v27)
    v28 = 0.0;
  v29 = v25 - v28;

  v30 = v19;
  v31 = v29;
  v32 = v18;
  v33 = v20;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (void)transcriptCollectionViewController:(id)a3 requestDeleteJunkConversation:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CKCoreChatController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chatController:requestDeleteJunkConversation:", self, v5);

}

- (void)transcriptCollectionViewController:(id)a3 requestRecoverJunkConversation:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[CKCoreChatController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chatController:requestRecoverJunkConversation:", self, v5);

}

- (void)transcriptCollectionViewController:(id)a3 didInsertChatItems:(id)a4 associatedChatItems:(id)a5
{
  void *v6;
  int v7;
  void *v8;
  void (**v9)(void);

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEmojiTapbacksEnabled");

  if (v7)
  {
    -[CKCoreChatController insertItemsEmojiTapbacksCallBack](self, "insertItemsEmojiTapbacksCallBack");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[CKCoreChatController insertItemsEmojiTapbacksCallBack](self, "insertItemsEmojiTapbacksCallBack");
      v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v9[2]();

      -[CKCoreChatController setInsertItemsEmojiTapbacksCallBack:](self, "setInsertItemsEmojiTapbacksCallBack:", 0);
    }
  }
}

- (void)transcriptCollectionViewController:(id)a3 didRemoveChatItems:(id)a4 associatedChatItems:(id)a5
{
  void *v6;
  int v7;
  void *v8;
  void (**v9)(void);

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEmojiTapbacksEnabled");

  if (v7)
  {
    -[CKCoreChatController removeItemsEmojiTapbacksCallBack](self, "removeItemsEmojiTapbacksCallBack");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[CKCoreChatController removeItemsEmojiTapbacksCallBack](self, "removeItemsEmojiTapbacksCallBack");
      v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v9[2]();

      -[CKCoreChatController setRemoveItemsEmojiTapbacksCallBack:](self, "setRemoveItemsEmojiTapbacksCallBack:", 0);
    }
  }
}

- (void)_updateForNewPreferredService
{
  -[CKCoreChatController _updateTitleAnimated:](self, "_updateTitleAnimated:", 1);
}

- (void)refreshServiceForSending
{
  id v2;

  -[CKCoreChatController refreshServiceForSendingUpdater](self, "refreshServiceForSendingUpdater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdate");

}

- (void)_refreshServiceForSending
{
  id v2;

  -[CKCoreChatController conversation](self, "conversation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshServiceForSending");

}

- (void)_willSendComposition:(id)a3 inConversation:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CKCoreChatController delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "chatController:willSendComposition:inConversation:", self, v7, v6);

}

- (void)_didSendCompositionInConversation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKCoreChatController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chatController:didSendCompositionInConversation:", self, v4);

}

- (void)_inviteToViewStatusesIfNeeded
{
  void *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;

  -[CKCoreChatController chat](self, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (CKIsRunningInMessages())
    {
      if (CKIsRunningForDevelopmentOnSimulator())
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v4 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
          {
            v9 = 0;
            v5 = "Not sharing focus status in simulator";
            v6 = (uint8_t *)&v9;
LABEL_18:
            _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, v5, v6, 2u);
            goto LABEL_19;
          }
          goto LABEL_19;
        }
      }
      else if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "isRunningTest"))
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v4 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
          {
            v8 = 0;
            v5 = "Not sharing focus status during PPT";
            v6 = (uint8_t *)&v8;
            goto LABEL_18;
          }
          goto LABEL_19;
        }
      }
      else
      {
        if (!-[CKCoreChatController isInline](self, "isInline"))
        {
          objc_msgSend(v3, "autoInviteToViewAvailabilityIfNeeded");
          objc_msgSend(v3, "autoInviteToViewOffGridModeIfNeeded");
          goto LABEL_20;
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v4 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
          {
            v7 = 0;
            v5 = "Not sharing focus status from inline reply transcript";
            v6 = (uint8_t *)&v7;
            goto LABEL_18;
          }
          goto LABEL_19;
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v10 = 0;
        v5 = "Not sharing focus status from non messages process";
        v6 = (uint8_t *)&v10;
        goto LABEL_18;
      }
LABEL_19:

    }
  }
LABEL_20:

}

- (BOOL)isSafeToMarkAsRead
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  BOOL v17;
  _BOOL4 v18;
  NSObject *v19;
  const __CFString *v20;
  _BOOL4 v21;
  _BOOL4 v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  _BOOL4 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  const __CFString *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  const __CFString *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[CKCoreChatController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = +[CKApplicationState isWindowForegroundActive:](CKApplicationState, "isWindowForegroundActive:", v4)|| CKIsRunningInMessagesNotificationExtension() != 0;
  v28 = v5;
  if (-[CKCoreChatController ignoreLastBalloonVisibleInMarkAsReadCheck](self, "ignoreLastBalloonVisibleInMarkAsReadCheck"))
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isCatchUpEnabled"))
  {

LABEL_7:
    LODWORD(v7) = 1;
    goto LABEL_23;
  }
  -[CKCoreChatController chat](self, "chat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "chatStyle") == 45)
  {
    v9 = CKIsRunningInMessagesTranscriptExtension();

    if (!v9)
      goto LABEL_7;
  }
  else
  {

  }
  -[CKCoreChatController collectionView](self, "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "__ck_indexPathForLastItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "row");

  objc_msgSend(v10, "visibleCells");
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
  if (v7)
  {
    v14 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(v13);
        objc_msgSend(v10, "indexPathForCell:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "row") == v12;

        if (v17)
        {
          LODWORD(v7) = 1;
          goto LABEL_22;
        }
      }
      v7 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_22:

LABEL_23:
  if (-[CKViewController appearing](self, "appearing") || -[CKViewController appeared](self, "appeared"))
    v18 = v28 & v7;
  else
    v18 = 0;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      if (v18)
        v20 = CFSTR("YES");
      else
        v20 = CFSTR("NO");
      v21 = -[CKViewController appearing](self, "appearing");
      v22 = -[CKViewController appeared](self, "appeared");
      if (v21)
        v23 = CFSTR("YES");
      else
        v23 = CFSTR("NO");
      *(_DWORD *)buf = 138413314;
      if (v22)
        v24 = CFSTR("YES");
      else
        v24 = CFSTR("NO");
      v34 = v20;
      v35 = 2112;
      if (v28)
        v25 = CFSTR("YES");
      else
        v25 = CFSTR("NO");
      v36 = v23;
      if ((_DWORD)v7)
        v26 = CFSTR("YES");
      else
        v26 = CFSTR("NO");
      v37 = 2112;
      v38 = v24;
      v39 = 2112;
      v40 = v25;
      v41 = 2112;
      v42 = v26;
      _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "MarkAsRead - isSafe %@ appearing %@ appeared %@ isActive %@ lastBalloonIsVisible %@", buf, 0x34u);
    }

  }
  return v18;
}

- (void)_markAsReadIfNecessary
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint8_t v7[16];

  if (-[CKCoreChatController isSafeToMarkAsRead](self, "isSafeToMarkAsRead"))
  {
    -[CKCoreChatController conversation](self, "conversation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "markAllMessagesAsRead");

    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isCarrierPigeonEnabled");

    if (v5)
      -[CKCoreChatController _startSatelliteFetchIfNecessary](self, "_startSatelliteFetchIfNecessary");
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "MarkAsRead - Not safe to mark as read, bailing", v7, 2u);
    }

  }
}

- (void)_startSatelliteFetchIfNecessary
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;
  uint8_t buf[4];
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[CKCoreChatController satelliteFetchTimer](self, "satelliteFetchTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSatelliteConnectionActive");

    if (v5)
    {
      -[CKCoreChatController conversation](self, "conversation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "chat");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "pendingIncomingSatelliteMessageCount");

      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", CFSTR("satellite-fetch-delay-interval"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v11 = 3.0;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "doubleValue");
          v11 = v12;
        }
        location = 0;
        objc_initWeak(&location, self);
        v13 = (void *)MEMORY[0x1E0C99E88];
        v16 = MEMORY[0x1E0C809B0];
        v17 = 3221225472;
        v18 = __55__CKCoreChatController__startSatelliteFetchIfNecessary__block_invoke;
        v19 = &unk_1E2757590;
        objc_copyWeak(&v20, &location);
        objc_msgSend(v13, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v16, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKCoreChatController setSatelliteFetchTimer:](self, "setSatelliteFetchTimer:", v14, v16, v17, v18, v19);

        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            v23 = v11;
            _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "Queued satellite fetch with %f second delay", buf, 0xCu);
          }

        }
        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);

      }
    }
  }
}

void __55__CKCoreChatController__startSatelliteFetchIfNecessary__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "conversation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fetchIncomingPendingMessagesOverSatellite");

  objc_msgSend(WeakRetained, "setSatelliteFetchTimer:", 0);
}

- (void)_cancelSatelliteFetch
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  -[CKCoreChatController satelliteFetchTimer](self, "satelliteFetchTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Canceling satellite fetch", v6, 2u);
      }

    }
    -[CKCoreChatController satelliteFetchTimer](self, "satelliteFetchTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

    -[CKCoreChatController setSatelliteFetchTimer:](self, "setSatelliteFetchTimer:", 0);
  }
}

- (id)scrollView
{
  void *v3;
  void *v4;

  if ((IMEnableModernTranscript() & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    -[CKCoreChatController collectionViewController](self, "collectionViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)contentInsetWillChange:(UIEdgeInsets)a3 withAnimationProperties:(id)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v9 = a4;
  -[CKCoreChatController _updateGradientReferenceViewForContentInset:withAnimationProperties:](self, "_updateGradientReferenceViewForContentInset:withAnimationProperties:", v9, top, left, bottom, right);
  -[CKCoreChatController _setTranscriptCustomScrollAnimationFromAnimationProperties:](self, "_setTranscriptCustomScrollAnimationFromAnimationProperties:", v9);

}

- (void)_updateGradientReferenceViewForContentInset:(UIEdgeInsets)a3 withAnimationProperties:(id)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  _QWORD aBlock[4];
  id v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGRect v26;
  CGRect v27;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v9 = a4;
  -[CKCoreChatController gradientReferenceView](self, "gradientReferenceView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCoreChatController gradientFrameWithInsets:](self, "gradientFrameWithInsets:", top, left, bottom, right);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(v10, "gradientFrame");
  v27.origin.x = v12;
  v27.origin.y = v14;
  v27.size.width = v16;
  v27.size.height = v18;
  if (!CGRectEqualToRect(v26, v27))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __92__CKCoreChatController__updateGradientReferenceViewForContentInset_withAnimationProperties___block_invoke;
    aBlock[3] = &unk_1E274B8B8;
    v21 = v10;
    v22 = v12;
    v23 = v14;
    v24 = v16;
    v25 = v18;
    v19 = _Block_copy(aBlock);
    objc_msgSend(v9, "performAnimationBlock:", v19);

  }
}

uint64_t __92__CKCoreChatController__updateGradientReferenceViewForContentInset_withAnimationProperties___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setGradientFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "layoutGradientViewsIfNeeded");
}

- (void)_setTranscriptCustomScrollAnimationFromAnimationProperties:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "animationType") == 1)
  {
    objc_msgSend(v6, "caBasicAnimation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[CKCoreChatController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranscriptCustomScrollAnimation:", v4);

}

- (void)contentInsetDidChangeWithAnimationProperties:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKCoreChatController collectionView](self, "collectionView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enforceTranscriptScrollIntentWithAnimationProperties:", v4);

  objc_msgSend(v5, "setTranscriptCustomScrollAnimation:", 0);
}

- (BOOL)shouldIgnoreKeyboardAnimationDuration
{
  return !-[CKCoreChatController viewIsVisible](self, "viewIsVisible");
}

- (void)keyboardWillHideViaGesture
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CEABB0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__CKCoreChatController_keyboardWillHideViaGesture__block_invoke;
  v6[3] = &unk_1E274A208;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "performWithoutAnimation:", v6);

}

void __50__CKCoreChatController_keyboardWillHideViaGesture__block_invoke(uint64_t a1)
{
  id v2;

  +[CKScrollViewAnimationProperties unanimated](CKScrollViewAnimationProperties, "unanimated");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "enforceTranscriptScrollIntentWithAnimationProperties:", v2);

}

- (void)updateScrollOffsetForAppearingKeyboard
{
  void *v2;
  void *v3;
  id v4;

  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionView");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  +[CKScrollViewAnimationProperties unanimated](CKScrollViewAnimationProperties, "unanimated");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enforceTranscriptScrollIntentWithAnimationProperties:", v3);

}

- (void)setupScrollingForKeyboardInteraction
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "collectionView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentSize");
  v6 = v5;

  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScrollAnchor:", v6);

}

- (void)_updateTitleAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[CKCoreChatController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hasDisplayName"))
    objc_msgSend(v5, "displayName");
  else
    objc_msgSend(v5, "displayNameForMediaObjects:subject:shouldListParticipants:", 0, 0, -[CKCoreChatController shouldListParticipantsInTitle](self, "shouldListParticipantsInTitle"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CKCoreChatController _setTitle:animated:](self, "_setTitle:animated:", v7, v3);
  -[CKCoreChatController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackButtonTitle:", v7);

}

- (BOOL)shouldListParticipantsInTitle
{
  return 0;
}

- (void)_registerSendProgressDelegate
{
  id v3;

  -[CKConversation chat](self->_conversation, "chat");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSendProgressDelegate:", self);

}

- (void)_deregisterSendProgressDelegate
{
  void *v3;
  CKCoreChatController *v4;
  void *v5;

  -[CKConversation chat](self->_conversation, "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendProgressDelegate");
  v4 = (CKCoreChatController *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
  {
    -[CKConversation chat](self->_conversation, "chat");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSendProgressDelegate:", 0);

  }
  -[UIProgressView removeFromSuperview](self->_progressBar, "removeFromSuperview");
  -[CKCoreChatController setProgressBar:](self, "setProgressBar:", 0);
  self->_sendProgress = 0.0;
  self->_sendProgressSendCount = 0;
  self->_sendProgressTotalCount = 0;
  -[CKCoreChatController _updateTitleAnimated:](self, "_updateTitleAnimated:", 0);
}

- (void)chat:(id)a3 progressDidChange:(float)a4 sendingMessages:(id)a5 sendCount:(unint64_t)a6 totalCount:(unint64_t)a7 finished:(BOOL)a8
{
  _BOOL4 v8;
  void *v13;
  id v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  float v25;
  int v26;
  _BOOL4 v27;
  void *v28;
  double v29;
  uint64_t v30;
  id v31;
  void (**v32)(_QWORD);
  void (**v33)(void *, uint64_t);
  _QWORD v34[4];
  id v35;
  CKCoreChatController *v36;
  _QWORD aBlock[4];
  id v38;

  v8 = a8;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults", a3, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "BOOLForKey:", CFSTR("ShouldHideProgressBar")) & 1) != 0)
  {
    self->_sendProgressSendCount = a6;
    self->_sendProgressTotalCount = a7;
    if (self->_sendProgressSendCount != a6)
      -[CKCoreChatController _updateTitleAnimated:](self, "_updateTitleAnimated:", 1);
    if (v8)
    {
      self->_sendProgressSendCount = 0;
      self->_sendProgressTotalCount = 0;
      -[CKCoreChatController _updateTitleAnimated:](self, "_updateTitleAnimated:", 1);
    }
    v14 = 0;
  }
  else
  {
    v15 = a4;
    if (a4 <= 0.0)
    {
      v14 = 0;
    }
    else
    {
      -[CKCoreChatController progressBar](self, "progressBar");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[CKCoreChatController conversation](self, "conversation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "sendButtonColor");

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "theme");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "sendButtonColorForColorType:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTintColor:", v20);

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "theme");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "progressBarTrackTintColor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTrackTintColor:", v23);

      objc_msgSend(v14, "setAlpha:", 1.0);
    }
    v24 = vabdd_f64(v15, self->_sendProgress) * 0.25;
    v25 = v24;
    if (self->_sendProgressSendCount == a6 && self->_sendProgressTotalCount == a7)
    {
      *(float *)&v24 = a4;
      objc_msgSend(v14, "setProgress:animated:", 0, v24);
      v26 = 0;
    }
    else
    {
      *(float *)&v24 = a4;
      objc_msgSend(v14, "_setProgressAnimated:duration:delay:options:", 196612, v24, v25, 0.0);
      v26 = 1;
    }
    self->_sendProgress = v15;
    self->_sendProgressSendCount = a6;
    self->_sendProgressTotalCount = a7;
    if (v8)
    {
      v27 = 0;
    }
    else
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "sendProgressTitleTransitionProgressThreshold");
      v27 = v29 < v15 && a4 < 1.0;

    }
    if ((v26 | v27) == 1)
      -[CKCoreChatController _updateTitleAnimated:](self, "_updateTitleAnimated:", 1);
    if (v8)
    {
      self->_sendProgress = 0.0;
      self->_sendProgressSendCount = 0;
      self->_sendProgressTotalCount = 0;
      v30 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __93__CKCoreChatController_chat_progressDidChange_sendingMessages_sendCount_totalCount_finished___block_invoke;
      aBlock[3] = &unk_1E274A208;
      v31 = v14;
      v38 = v31;
      v32 = (void (**)(_QWORD))_Block_copy(aBlock);
      v34[0] = v30;
      v34[1] = 3221225472;
      v34[2] = __93__CKCoreChatController_chat_progressDidChange_sendingMessages_sendCount_totalCount_finished___block_invoke_2;
      v34[3] = &unk_1E274BE58;
      v14 = v31;
      v35 = v14;
      v36 = self;
      v33 = (void (**)(void *, uint64_t))_Block_copy(v34);
      if (-[CKCoreChatController disableAnimationsUnderTest](self, "disableAnimationsUnderTest"))
      {
        v32[2](v32);
        v33[2](v33, 1);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v32, v33, 0.3, v25);
      }

    }
  }

}

uint64_t __93__CKCoreChatController_chat_progressDidChange_sendingMessages_sendCount_totalCount_finished___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __93__CKCoreChatController_chat_progressDidChange_sendingMessages_sendCount_totalCount_finished___block_invoke_2(uint64_t a1, double a2)
{
  _QWORD block[5];

  LODWORD(a2) = 0;
  objc_msgSend(*(id *)(a1 + 32), "setProgress:animated:", 0, a2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__CKCoreChatController_chat_progressDidChange_sendingMessages_sendCount_totalCount_finished___block_invoke_3;
  block[3] = &unk_1E274A208;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __93__CKCoreChatController_chat_progressDidChange_sendingMessages_sendCount_totalCount_finished___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateTitleAnimated:", 1);
}

- (UIProgressView)progressBar
{
  void *v3;
  unsigned int v4;
  UIProgressView *v5;
  UIProgressView *progressBar;

  if (!self->_progressBar && !CKIsRunningInMessagesViewService())
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "showsProgressInNavigationBar");

    v5 = (UIProgressView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA8E8]), "initWithProgressViewStyle:", v4);
    progressBar = self->_progressBar;
    self->_progressBar = v5;

  }
  -[UIProgressView setAlpha:](self->_progressBar, "setAlpha:", 0.0);
  return self->_progressBar;
}

- (void)registerNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__preferredServiceChangedNotification_, CFSTR("CKConversationPreferredServiceChangedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__downgradeStateChangedNotification_, *MEMORY[0x1E0D352F8], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__serviceSwitchNotification_, *MEMORY[0x1E0D354D8], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__satelliteStateChangedNotification_, *MEMORY[0x1E0D35500], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__displayNameUpdatedNotification_, *MEMORY[0x1E0D352F0], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleStatusChangedNotification_, *MEMORY[0x1E0D35598], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleStatusInvitationReceivedNotification_, *MEMORY[0x1E0D355A8], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleStatusStateChangedNotification_, *MEMORY[0x1E0D355B0], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__statusDaemonDisconnectedNotification_, *MEMORY[0x1E0D355A0], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__transferFinishedNotification_, CFSTR("CKFileTransferFinishedNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__localeDidChangeNotification_, *MEMORY[0x1E0C99720], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_handleContentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0CEB3F0], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__increaseContrastDidChangeNotification_, *MEMORY[0x1E0CEAFF0], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__transferRestoredNotification_, CFSTR("CKFileTransferRestoredNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleAddressBookChangedNotification_, *MEMORY[0x1E0D373C0], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__conversationListFinishedMerging_, CFSTR("CKConversationListFinishedMergingChatsNotification"), 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__refreshActiveChat_, *MEMORY[0x1E0D35270], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__refreshActiveChat_, *MEMORY[0x1E0D35268], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__chatRegistryDidReloadNotification_, *MEMORY[0x1E0D35470], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__chatsRemergedNotification_, *MEMORY[0x1E0D35498], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleStatusChangedNotification_, *MEMORY[0x1E0D38050], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleStatusInvitationReceivedNotification_, *MEMORY[0x1E0D38060], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__handleStatusStateChangedNotification_, *MEMORY[0x1E0D38068], 0);
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__statusDaemonDisconnectedNotification_, *MEMORY[0x1E0D38058], 0);

}

- (void)preferredSendingServiceChanged
{
  -[CKCoreChatController _updateTitleAnimated:](self, "_updateTitleAnimated:", 1);
}

- (void)_preferredServiceChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "object");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CKCoreChatController conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v8))
    -[CKCoreChatController preferredSendingServiceChanged](self, "preferredSendingServiceChanged");
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCarrierPigeonEnabled");

  if (v6)
  {
    -[CKCoreChatController chat](self, "chat");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_reloadChatItemsForServiceChange");

  }
}

- (void)_downgradeStateChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Refreshing service for sending due downgrade state change", v9, 2u);
    }

  }
  -[CKCoreChatController conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
    -[CKCoreChatController refreshServiceForSending](self, "refreshServiceForSending");

}

- (void)_serviceSwitchNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Refreshing service for sending due to service switch request", v9, 2u);
    }

  }
  -[CKCoreChatController conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
    -[CKCoreChatController refreshServiceForSending](self, "refreshServiceForSending");

}

- (void)_satelliteStateChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Received satellite state change.", v6, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__refreshServiceForSendingForSatelliteStateChange, 0);
  -[CKCoreChatController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__refreshServiceForSendingForSatelliteStateChange, 0, 3.0);

}

- (void)_refreshServiceForSendingForSatelliteStateChange
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Refreshing service for sending due to satellite state change", v5, 2u);
    }

  }
  -[CKCoreChatController refreshServiceForSending](self, "refreshServiceForSending");
  -[CKCoreChatController chat](self, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_reloadChatItemsForSatelliteStateChangeIfRequired:", CFSTR("Satellite status changed"));

}

- (void)_displayNameUpdatedNotification:(id)a3
{
  void *v4;
  int v5;
  id v6;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CKCoreChatController chat](self, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqual:", v4);

  if (v5)
    -[CKCoreChatController _updateTitleAnimated:](self, "_updateTitleAnimated:", 1);

}

- (void)setHandleStatusAssertion:(id)a3
{
  IMHandleStatusObserverAssertion *v4;
  NSObject *v5;
  IMHandleStatusObserverAssertion *handleStatusAssertion;
  IMHandleStatusObserverAssertion *v7;
  uint8_t v8[16];

  v4 = (IMHandleStatusObserverAssertion *)a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Setting handle observer and invalidating old observer if necessary", v8, 2u);
    }

  }
  if (v4)
  {
    handleStatusAssertion = self->_handleStatusAssertion;
    if (handleStatusAssertion != v4)
      -[IMHandleStatusObserverAssertion invalidate](handleStatusAssertion, "invalidate");
  }
  v7 = self->_handleStatusAssertion;
  self->_handleStatusAssertion = v4;

}

- (void)_statusDaemonDisconnectedNotification:(id)a3
{
  id v4;
  void *v5;
  char v6;
  const __CFString *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D35598]);

  if ((v6 & 1) != 0)
  {
    v7 = CFSTR("Availability");
  }
  else
  {
    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0D38050]);

    if (v9)
      v7 = CFSTR("Off grid");
    else
      v7 = 0;
  }
  -[CKCoreChatController chat](self, "chat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v13 = 138412546;
        v14 = v7;
        v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "%@ daemon was disconnected while there was an active chat controller. Requesting that we continue observing availability for chat %@", (uint8_t *)&v13, 0x16u);
      }

    }
    objc_msgSend(v10, "beginObservingHandleStatuses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKCoreChatController setHandleStatusAssertion:](self, "setHandleStatusAssertion:", v12);

  }
}

- (void)_handleStatusChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  const __CFString *v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  NSObject *v14;
  __CFString *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  const __CFString *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCoreChatController chat](self, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D35598]);

  if ((v8 & 1) != 0)
  {
    v9 = CFSTR("Availability");
  }
  else
  {
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D38050]);

    if (v11)
      v9 = CFSTR("Off grid");
    else
      v9 = 0;
  }
  v12 = objc_msgSend(v5, "isPersonalStatusSubscription");
  v13 = IMOSLoggingEnabled();
  if (v12)
  {
    if (v13)
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "subscriptionIdentifier");
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "guid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412546;
        v23 = v15;
        v24 = 2112;
        v25 = v16;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Personal status subscription %@ changed while there was an active chat controller displaying chat %@. Taking no action.", (uint8_t *)&v22, 0x16u);

      }
    }
  }
  else
  {
    if (v13)
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "subscriptionIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "ownerHandles");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "guid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138413314;
        v23 = v9;
        v24 = 2112;
        v25 = v18;
        v26 = 2112;
        v27 = v19;
        v28 = 2112;
        v29 = v20;
        v30 = 2112;
        v31 = v9;
        _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "%@ changed for subscription %@ owned by %@ while there was an active chat controller displaying chat %@. Re-observing all relevant %@ status for chat.", (uint8_t *)&v22, 0x34u);

      }
    }
    objc_msgSend(v6, "beginObservingHandleStatuses");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKCoreChatController setHandleStatusAssertion:](self, "setHandleStatusAssertion:", v21);

  }
}

- (void)_handleStatusInvitationReceivedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  const __CFString *v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  const __CFString *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCoreChatController chat](self, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D35598]);

  if ((v8 & 1) != 0)
  {
    v9 = CFSTR("Availability");
  }
  else
  {
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D38050]);

    if (v11)
      v9 = CFSTR("Off grid");
    else
      v9 = 0;
  }
  v12 = objc_msgSend(v5, "isPersonalStatusSubscription");
  v13 = IMOSLoggingEnabled();
  if (v12)
  {
    if (v13)
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "subscriptionIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "guid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412802;
        v23 = v9;
        v24 = 2112;
        v25 = v15;
        v26 = 2112;
        v27 = v16;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "%@ invitation received for personal status subscription %@ while there was an active chat controller displaying chat %@. Taking no action.", (uint8_t *)&v22, 0x20u);

      }
    }
  }
  else
  {
    if (v13)
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "subscriptionIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "ownerHandles");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "guid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138413314;
        v23 = v9;
        v24 = 2112;
        v25 = v18;
        v26 = 2112;
        v27 = v19;
        v28 = 2112;
        v29 = v20;
        v30 = 2112;
        v31 = v9;
        _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "%@ invitation received for subscription %@ owned by %@ while there was an active chat controller displaying chat: %@. Re-observing all relevant %@ for chat", (uint8_t *)&v22, 0x34u);

      }
    }
    objc_msgSend(v6, "beginObservingHandleStatuses");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKCoreChatController setHandleStatusAssertion:](self, "setHandleStatusAssertion:", v21);

  }
}

- (void)_handleStatusStateChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  const __CFString *v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  const __CFString *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCoreChatController chat](self, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D35598]);

  if ((v8 & 1) != 0)
  {
    v9 = CFSTR("Availability");
  }
  else
  {
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0D38050]);

    if (v11)
      v9 = CFSTR("Off grid");
    else
      v9 = 0;
  }
  v12 = objc_msgSend(v5, "isPersonalStatusSubscription");
  v13 = IMOSLoggingEnabled();
  if (v12)
  {
    if (v13)
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "subscriptionIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "guid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412802;
        v23 = v9;
        v24 = 2112;
        v25 = v15;
        v26 = 2112;
        v27 = v16;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "%@ state changed for personal status subscription %@ while there was an active chat controller displaying chat %@. Taking no action.", (uint8_t *)&v22, 0x20u);

      }
    }
  }
  else
  {
    if (v13)
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "subscriptionIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "ownerHandles");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138413314;
        v23 = v9;
        v24 = 2112;
        v25 = v18;
        v26 = 2112;
        v27 = v19;
        v28 = 2112;
        v29 = v6;
        v30 = 2112;
        v31 = v9;
        _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "%@ state changed for subscription %@ owned by %@ while there was an active chat controller displaying chat. Re-observing all relevant %@ status for chat: %@", (uint8_t *)&v22, 0x34u);

      }
    }
    objc_msgSend(v6, "beginObservingHandleStatuses");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKCoreChatController setHandleStatusAssertion:](self, "setHandleStatusAssertion:", v20);

    objc_msgSend(v4, "name");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0D38068]);

    if ((_DWORD)v20)
      objc_msgSend(v6, "refreshServiceForSending");
  }

}

- (void)_localeDidChangeNotification:(id)a3
{
  id v4;

  -[CKCoreChatController conversation](self, "conversation", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKCoreChatController setConversation:forceReload:](self, "setConversation:forceReload:", v4, 1);

}

- (void)_chatRegistryDidReloadNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "_chatRegistryDidReloadNotification", v9, 2u);
    }

  }
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D35468]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  -[CKCoreChatController _reassignConversationWithDeferredReload:](self, "_reassignConversationWithDeferredReload:", v8);
}

- (void)_chatsRemergedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "_chatsRemergedNotification", v6, 2u);
    }

  }
  -[CKCoreChatController _reassignConversationWithDeferredReload:](self, "_reassignConversationWithDeferredReload:", 1);

}

- (void)_reassignConversationWithDeferredReload:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD aBlock[5];
  uint8_t buf[4];
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v10 = v3;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "_reassignConversationWithDeferredReload: %{BOOL}d", buf, 8u);
    }

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__CKCoreChatController__reassignConversationWithDeferredReload___block_invoke;
  aBlock[3] = &unk_1E274A208;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  v7 = v6;
  if (v3)
    im_dispatch_after();
  else
    (*((void (**)(void *))v6 + 2))(v6);

}

void __64__CKCoreChatController__reassignConversationWithDeferredReload___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  NSObject *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v10 = 0;
    goto LABEL_8;
  }
  v6 = objc_msgSend(v5, "chatStyle") == 43;
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "groupID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "conversationForExistingChatWithGroupID:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "guid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "conversationForExistingChatWithGUID:", v11);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_8;
    +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "personCentricID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "conversationForExistingChatWithPersonCentricID:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (id)v9;

LABEL_8:
  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLoadedMessageCount:", objc_msgSend(v12, "limitToLoad"));

  objc_msgSend(v10, "loadAllMessages");
  if (v10)
    v13 = 0;
  else
    v13 = v5 == 0;
  if (v13)
  {
    v10 = v3;
    +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPendingConversation:", v10);

  }
  objc_msgSend(*(id *)(a1 + 32), "setConversation:forceReload:", v10, 1);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = 138412546;
      v17 = v10;
      v18 = 2112;
      v19 = v3;
      _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "conversationToSet: %@, oldConversation: %@", (uint8_t *)&v16, 0x16u);
    }

  }
}

- (void)handleContentSizeCategoryDidChangeNotification:(id)a3
{
  id v4;

  -[CKCoreChatController _dismissFullScreenBubbleViewControllerAnimated:withSendAnimation:completion:](self, "_dismissFullScreenBubbleViewControllerAnimated:withSendAnimation:completion:", 1, 0, 0);
  -[CKCoreChatController conversation](self, "conversation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKCoreChatController setConversation:forceReload:](self, "setConversation:forceReload:", v4, 1);

}

- (void)_increaseContrastDidChangeNotification:(id)a3
{
  id v4;

  -[CKCoreChatController conversation](self, "conversation", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CKCoreChatController setConversation:forceReload:](self, "setConversation:forceReload:", v4, 1);

}

- (void)_conversationListFinishedMerging:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKCoreChatController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "guid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "conversationForExistingChatWithGUID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (v5 != v9)
    {
      -[CKCoreChatController setConversation:forceReload:](self, "setConversation:forceReload:", v9, 1);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = 138412546;
          v12 = v9;
          v13 = 2112;
          v14 = v5;
          _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Conversation list performed re-merge, updating transcript conversation to %@ from %@", (uint8_t *)&v11, 0x16u);
        }
LABEL_11:

      }
    }
  }
  else if (v5 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "CKCoreChatController attempted to replace conversation after re-merge, but couldn't find a new conversation to replace %@", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_11;
  }

}

- (void)significantTimeChange
{
  void *v3;
  CKCoreChatController *v4;
  _QWORD block[5];

  -[CKCoreChatController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleViewController");
  v4 = (CKCoreChatController *)objc_claimAutoreleasedReturnValue();

  if (v4 == self)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__CKCoreChatController_significantTimeChange__block_invoke;
    block[3] = &unk_1E274A208;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __45__CKCoreChatController_significantTimeChange__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "conversation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setConversation:forceReload:", v2, 1);

}

- (id)indexPathForMessageGUID:(id)a3 messagePartIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v6 = a3;
  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chatItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v8, "__ck_indexesOfPartsOfMessageWithGUID:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "firstIndex");
    v6 = v10;
  }
  else
  {
    v11 = objc_msgSend(v8, "__ck_indexOfPartOfMessageGUID:withMessagePartIndex:", v6, a4);
  }

  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (CGPoint)contentOffsetForIndexPath:(id)a3 viewToAlignWith:(id)a4 allowOverScroll:(BOOL)a5
{
  double v5;
  double v6;
  CGPoint result;

  -[CKCoreChatController contentOffsetForIndexPath:viewToAlignWith:allowOverScroll:scrollPosition:](self, "contentOffsetForIndexPath:viewToAlignWith:allowOverScroll:scrollPosition:", a3, a4, a5, 2);
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGPoint)contentOffsetForIndexPath:(id)a3 viewToAlignWith:(id)a4 allowOverScroll:(BOOL)a5 scrollPosition:(unint64_t)a6
{
  char v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double MinY;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  double v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  double MaxY;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  CGPoint result;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeFullTranscriptIfNecessary");
  -[CKCoreChatController collectionView](self, "collectionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(v13, "contentInset");
  v23 = v22;
  v25 = v15 + v24;
  v90 = v19 - (v24 + v26);
  v91 = v17 + v22;
  v28 = v21 - (v22 + v27);
  objc_msgSend(v13, "layoutAttributesForItemAtIndexPath:", v10);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "frame");
  v34 = v30;
  v35 = v31;
  v36 = v32;
  v37 = v33;
  if (v11)
  {
    v88 = v15;
    -[CKCoreChatController collectionViewController](self, "collectionViewController");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "chatItemAtIndexPath:", v10);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKCoreChatController collectionViewController](self, "collectionViewController");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "balloonViewForChatItem:", v39);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = v28;
    if (v41)
    {
      objc_opt_class();
      v43 = v25;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v41, "ck_identityTransformFrameInView:", v13);
        v34 = v44;
        v35 = v45;
        v36 = v46;
        v37 = v47;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v13, "coordinateSpace");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "currentAssetFrameInCoordinateSpace:", v53);
          v34 = v54;
          v35 = v55;
          v36 = v56;
          v37 = v57;

        }
      }
    }
    else
    {
      v43 = v25;
    }
    v95.origin.x = v34;
    v95.origin.y = v35;
    v95.size.width = v36;
    v95.size.height = v37;
    MinY = CGRectGetMinY(v95);
    objc_msgSend(v11, "frame");
    v60 = v59;
    v62 = v61;
    v64 = v63;
    v66 = v65;
    objc_msgSend(v11, "superview");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "convertRect:fromView:", v67, v60, v62, v64, v66);
    v69 = v68;
    v71 = v70;
    v73 = v72;
    v75 = v74;

    v96.origin.x = v69;
    v96.origin.y = v71;
    v96.size.width = v73;
    v96.size.height = v75;
    v76 = CGRectGetMinY(v96);
    v25 = v43;
    v97.origin.x = v43;
    v97.size.width = v90;
    v97.origin.y = v91;
    v28 = v42;
    v97.size.height = v42;
    v52 = MinY - (v76 - CGRectGetMinY(v97)) - v23;

    v15 = v88;
  }
  else if ((v6 & 1) != 0)
  {
    v52 = CGRectGetMinY(*(CGRect *)&v30) + v23 * -1.2;
  }
  else
  {
    v93.origin.x = v25;
    v93.size.width = v90;
    v93.origin.y = v91;
    v93.size.height = v28;
    v89 = v15;
    v48 = v28;
    v49 = v25;
    v50 = CGRectGetHeight(v93) * -0.5;
    v94.origin.x = v34;
    v94.origin.y = v35;
    v94.size.width = v36;
    v94.size.height = v37;
    v51 = CGRectGetMidY(v94) + v50;
    v25 = v49;
    v28 = v48;
    v15 = v89;
    v52 = v51 - v23;
  }
  objc_msgSend(v12, "chatItems");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "firstObject");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", 0, 0);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layoutAttributesForItemAtIndexPath:", v79);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "frame");
    MaxY = CGRectGetMaxY(v98);
    if (MaxY > v52)
      v52 = MaxY - v23;

  }
  if (!a5)
  {
    objc_msgSend(v13, "collectionViewLayout");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "collectionViewContentSize");
    v84 = v83;
    v99.origin.x = v25;
    v99.size.width = v90;
    v99.origin.y = v91;
    v99.size.height = v28;
    v85 = v84 - CGRectGetHeight(v99) - v23;
    if (v52 <= v85)
      v85 = v52;
    if (v52 >= -v23)
      v52 = v85;
    else
      v52 = -v23;

  }
  v86 = v15;
  v87 = v52;
  result.y = v87;
  result.x = v86;
  return result;
}

- (void)scrollToHighlightedMessageScrollContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;

  v4 = a3;
  -[CKCoreChatController collectionView](self, "collectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "messagePartIndex");
  objc_msgSend(v4, "viewToAlignWith");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "allowOverScroll");
  v10 = objc_msgSend(v4, "scrollPosition");

  -[CKCoreChatController indexPathForMessageGUID:messagePartIndex:](self, "indexPathForMessageGUID:messagePartIndex:", v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[CKCoreChatController contentOffsetForIndexPath:viewToAlignWith:allowOverScroll:scrollPosition:](self, "contentOffsetForIndexPath:viewToAlignWith:allowOverScroll:scrollPosition:", v11, v8, v9, v10);
    v13 = v12;
    v15 = v14;
    objc_msgSend(v5, "beginDisablingTranscriptDynamicsForReason:", CFSTR("ScrollToMessage"));
    objc_msgSend(v5, "setContentOffset:animated:", 0, v13, v15);
    objc_msgSend(v5, "endDisablingTranscriptDynamicsForReason:", CFSTR("ScrollToMessage"));
  }
  else
  {
    IMLogHandleForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CKCoreChatController scrollToHighlightedMessageScrollContext:].cold.1();

  }
}

- (id)textInputContextIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[CKCoreChatController conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceIndependentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CKTextInputIdentifier(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isFullScreenBalloonViewOnScreen
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmojiTapbacksEnabled");

  -[CKCoreChatController fullScreenBalloonViewController](self, "fullScreenBalloonViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = v5;
  if (v4)
  {
    objc_msgSend(v5, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7 != 0;
}

- (BOOL)shouldUpdateScrollPositionForKeyboardScreenFrameChanges
{
  _BOOL4 v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = -[CKCoreChatController isFullScreenBalloonViewOnScreen](self, "isFullScreenBalloonViewOnScreen");
  if (v2)
  {
    IMLogHandleForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Ignoring keyboard frame change because full screen balloon view is visible", v5, 2u);
    }

  }
  return !v2;
}

- (id)_fullScreenBalloonViewControllerWithChatItem:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Implemented by subclasses"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (id)_fullScreenBalloonViewControllerWithChatItem:(id)a3 displayConfiguration:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Implemented by subclasses"), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (BOOL)showFullScreenAcknowledgmentPickerIfNeededForBalloonAtIndexPath:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "showFullScreenAcknowledgmentPickerIfNeededForBalloonAtIndexPath, indexPath: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  if (v4)
  {
    -[CKCoreChatController collectionViewController](self, "collectionViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chatItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v4, "item"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[CKCoreChatController shouldShowFullScreenAcknowledgmentPickerForChatItem:](self, "shouldShowFullScreenAcknowledgmentPickerForChatItem:", v8);
    if (v9)
      -[CKCoreChatController showFullScreenAcknowledgmentPickerForChatItem:](self, "showFullScreenAcknowledgmentPickerForChatItem:", v8);

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)showFullScreenAcknowledgmentPickerForChatItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "IMChatItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "guid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 136315394;
      v10 = "-[CKCoreChatController showFullScreenAcknowledgmentPickerForChatItem:]";
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "%s, chatItem.guid: %@", (uint8_t *)&v9, 0x16u);

    }
  }
  +[CKFullScreenBalloonViewDisplayConfiguration tapbackPickerContext](CKFullScreenBalloonViewDisplayConfiguration, "tapbackPickerContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCoreChatController showFullScreenAcknowledgmentPickerForChatItem:displayConfiguration:](self, "showFullScreenAcknowledgmentPickerForChatItem:displayConfiguration:", v4, v8);

}

- (void)showFullScreenTapbackKeyboardInputForChatItem:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "IMChatItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "guid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 136315394;
      v10 = "-[CKCoreChatController showFullScreenTapbackKeyboardInputForChatItem:]";
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "%s, chatItem.guid: %@", (uint8_t *)&v9, 0x16u);

    }
  }
  +[CKFullScreenBalloonViewDisplayConfiguration tapbackKeyboardInputContext](CKFullScreenBalloonViewDisplayConfiguration, "tapbackKeyboardInputContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCoreChatController showFullScreenAcknowledgmentPickerForChatItem:displayConfiguration:](self, "showFullScreenAcknowledgmentPickerForChatItem:displayConfiguration:", v4, v8);

}

- (void)showFullScreenAcknowledgmentPickerForChatItem:(id)a3 displayConfiguration:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  int v15;
  void *v16;
  NSObject *v17;
  void *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  id v26;
  id location;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "IMChatItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "guid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v29 = "-[CKCoreChatController showFullScreenAcknowledgmentPickerForChatItem:displayConfiguration:]";
      v30 = 2112;
      v31 = v10;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "%s, chatItem.guid: %@", buf, 0x16u);

    }
  }
  location = 0;
  objc_initWeak(&location, self);
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __91__CKCoreChatController_showFullScreenAcknowledgmentPickerForChatItem_displayConfiguration___block_invoke;
  v23 = &unk_1E274CB00;
  objc_copyWeak(&v26, &location);
  v11 = v6;
  v24 = v11;
  v12 = v7;
  v25 = v12;
  v13 = (void (**)(_QWORD))_Block_copy(&v20);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", v20, v21, v22, v23);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isExpressiveTextEnabled");

  if (v15)
  {
    -[CKCoreChatController collectionViewController](self, "collectionViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v13[2](v13);

      goto LABEL_15;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v11, "IMChatItem");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "guid");
        v19 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v29 = v19;
        _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "Presening fullScreenBalloonViewController: no textEffects cancellation in progress, chatItem.guid: %@", buf, 0xCu);

      }
    }
    objc_msgSend(v16, "prepareTextEffectsForModalPresentation");

  }
  v13[2](v13);
LABEL_15:

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

}

void __91__CKCoreChatController_showFullScreenAcknowledgmentPickerForChatItem_displayConfiguration___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "chat");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v46, "beginHoldingChatItemsUpdatesForReason:", *MEMORY[0x1E0D35380]);
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "beginHoldingScrollGeometryUpdatesForReason:", CFSTR("FullscreenBalloonMenuVisible"));

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "_fullScreenBalloonViewControllerWithChatItem:displayConfiguration:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "IMChatItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "guid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v48 = v9;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "fullScreenBalloonViewController will be presented, chatItem.guid: %@", buf, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEmojiTapbacksEnabled");

  if (v11)
  {
    v12 = objc_loadWeakRetained(v2);
    objc_msgSend(v12, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "window");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_loadWeakRetained(v2);
    objc_msgSend(v15, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v25 = objc_loadWeakRetained(v2);
    objc_msgSend(v25, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "convertRect:fromView:", v26, v18, v20, v22, v24);
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;

    objc_msgSend(v6, "view");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setFrame:", v28, v30, v32, v34);

    v36 = objc_loadWeakRetained(v2);
    objc_msgSend(v36, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "window");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addSubview:", v39);

  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v40, "canPresentOverKeyboard"))
      v41 = 0;
    else
      v41 = 6;
    objc_msgSend(v6, "setModalPresentationStyle:", v41);

    +[CKAdaptivePresentationController sharedInstance](CKAdaptivePresentationController, "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_loadWeakRetained(v2);
    objc_msgSend(v36, "presentViewController:fromViewController:presentationHandler:dismissalHandler:animated:completion:", v6, v37, 0, 0, 0, 0);
  }

  v42 = objc_loadWeakRetained(v2);
  objc_msgSend(v42, "setFullScreenBalloonViewController:", v6);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "IMChatItem");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "guid");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v48 = v45;
      _os_log_impl(&dword_18DFCD000, v43, OS_LOG_TYPE_INFO, "_fullScreenBalloonViewController has been set, chatItem.guid: %@", buf, 0xCu);

    }
  }

}

- (BOOL)shouldShowTapbackAttributionForFullScreenBalloonViewController:(id)a3
{
  void *v4;

  objc_msgSend(a3, "chatItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CKCoreChatController shouldShowTapbackAttributionForChatItem:](self, "shouldShowTapbackAttributionForChatItem:", v4);

  return (char)self;
}

- (BOOL)shouldShowTapbackPickerForFullScreenBalloonViewController:(id)a3
{
  void *v4;

  objc_msgSend(a3, "chatItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CKCoreChatController shouldShowTapbackPickerForChatItem:](self, "shouldShowTapbackPickerForChatItem:", v4);

  return (char)self;
}

- (BOOL)shouldShowFullScreenAcknowledgmentPickerForChatItem:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  _BOOL4 v7;
  uint8_t v9[16];

  v4 = a3;
  if (-[CKCoreChatController isFullScreenBalloonViewOnScreen](self, "isFullScreenBalloonViewOnScreen"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Should not present fullScreenBalloonViewController - a fullScreenBalloonViewController is already presented", v9, 2u);
      }

    }
    LOBYTE(v6) = 0;
  }
  else
  {
    v7 = -[CKCoreChatController shouldShowTapbackPickerForChatItem:](self, "shouldShowTapbackPickerForChatItem:", v4);
    v6 = v7 | -[CKCoreChatController shouldShowTapbackAttributionForChatItem:](self, "shouldShowTapbackAttributionForChatItem:", v4);
  }

  return v6;
}

- (BOOL)shouldShowTapbackAttributionForChatItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  BOOL v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  __int16 v14;
  __int16 v15;
  __int16 v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEmojiTapbacksEnabled");

  if ((v6 & 1) == 0)
  {
    -[CKCoreChatController conversation](self, "conversation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isGroupConversation");

    if ((v8 & 1) == 0)
    {
      if (!IMOSLoggingEnabled())
        goto LABEL_17;
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        goto LABEL_16;
      v16 = 0;
      v11 = "not showing tapback attribution: not group conversation";
      v12 = (uint8_t *)&v16;
      goto LABEL_15;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_17;
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    v15 = 0;
    v11 = "not showing tapback attribution: not message part chatItem";
    v12 = (uint8_t *)&v15;
LABEL_15:
    _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, v11, v12, 2u);
    goto LABEL_16;
  }
  if ((objc_msgSend(v4, "hasVisibleAssociatedMessageItems") & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v14 = 0;
        v11 = "not showing tapback attribution: no visible tapbacks";
        v12 = (uint8_t *)&v14;
        goto LABEL_15;
      }
LABEL_16:

    }
LABEL_17:
    v9 = 0;
    goto LABEL_18;
  }
  v9 = 1;
LABEL_18:

  return v9;
}

- (BOOL)shouldShowTapbackPickerForChatItem:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  BOOL v10;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  __int16 v18;
  __int16 v19;
  __int16 v20;
  __int16 v21;
  uint8_t buf[2];

  v4 = a3;
  if (-[CKCoreChatController _shouldAllowReplyFromLockScreen](self, "_shouldAllowReplyFromLockScreen"))
  {
    -[CKCoreChatController conversation](self, "conversation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isBusinessChatDisabled");

    if (v6)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v21 = 0;
          v8 = "not showing tapback picker: business chat disabled";
          v9 = (uint8_t *)&v21;
LABEL_9:
          _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, v8, v9, 2u);
          goto LABEL_10;
        }
        goto LABEL_10;
      }
    }
    else
    {
      -[CKCoreChatController conversation](self, "conversation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "chat");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "supportsCapabilities:", 0x40000);

      if ((v14 & 1) == 0)
      {
        if (!IMOSLoggingEnabled())
          goto LABEL_11;
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          goto LABEL_10;
        v20 = 0;
        v8 = "not showing tapback picker: missing tapbacks chat capability";
        v9 = (uint8_t *)&v20;
        goto LABEL_9;
      }
      -[CKCoreChatController conversation](self, "conversation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "chat");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "canSend");

      if ((v17 & 1) == 0)
      {
        if (!IMOSLoggingEnabled())
          goto LABEL_11;
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          goto LABEL_10;
        v19 = 0;
        v8 = "not showing tapback picker: cannot send to chat";
        v9 = (uint8_t *)&v19;
        goto LABEL_9;
      }
      if ((objc_msgSend(v4, "canSendTapbacks") & 1) != 0)
      {
        v10 = 1;
        goto LABEL_12;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          goto LABEL_10;
        v18 = 0;
        v8 = "not showing tapback picker: chatItem can't send tapbacks";
        v9 = (uint8_t *)&v18;
        goto LABEL_9;
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v8 = "not showing tapback picker: replies not allowed lock screen";
      v9 = buf;
      goto LABEL_9;
    }
LABEL_10:

  }
LABEL_11:
  v10 = 0;
LABEL_12:

  return v10;
}

- (void)_dismissFullScreenBubbleViewControllerAnimated:(BOOL)a3 withSendAnimation:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  id v10;
  void (**v11)(_QWORD);
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  CKCoreChatController *v23;
  id v24;
  uint8_t buf[4];
  const __CFString *v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v5 = a4;
  v6 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "_dismissFullScreenBubbleViewControllerAnimated", buf, 2u);
    }

  }
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __100__CKCoreChatController__dismissFullScreenBubbleViewControllerAnimated_withSendAnimation_completion___block_invoke;
  v22 = &unk_1E274C2E0;
  v23 = self;
  v10 = v8;
  v24 = v10;
  v11 = (void (**)(_QWORD))_Block_copy(&v19);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      if (v6)
        v13 = CFSTR("YES");
      else
        v13 = CFSTR("NO");
      v14 = _Block_copy(v10);
      *(_DWORD *)buf = 138412802;
      v26 = v13;
      v27 = 1024;
      v28 = v5;
      v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "_dismissFullScreenBubbleViewControllerAnimated %@:WithSendAnimation: %d, completion %@", buf, 0x1Cu);

    }
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", v19, v20, v21, v22, v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEmojiTapbacksEnabled");

  if ((v16 & 1) != 0 || !CKIsRunningInMessagesTranscriptExtension())
  {
    -[CKCoreChatController fullScreenBalloonViewController](self, "fullScreenBalloonViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v6)
    {
      if (v5)
        objc_msgSend(v17, "performSendAndCloseAnimationWithCompletion:", v11);
      else
        objc_msgSend(v17, "performCancelAnimationWithCompletion:", v11);

    }
    else
    {
      objc_msgSend(v17, "dismissImmediatelyWithNoAnimations");

      v11[2](v11);
    }
  }
  else
  {
    v11[2](v11);
  }

}

void __100__CKCoreChatController__dismissFullScreenBubbleViewControllerAnimated_withSendAnimation_completion___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint8_t v17[16];

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEmojiTapbacksEnabled");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "fullScreenBalloonViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "fullScreenBalloonViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v5)
      goto LABEL_8;
LABEL_6:
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 0, 0);
    goto LABEL_9;
  }
  +[CKAdaptivePresentationController sharedInstance](CKAdaptivePresentationController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentedViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fullScreenBalloonViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "isEqual:", v10);

  if (v11)
  {
    +[CKAdaptivePresentationController sharedInstance](CKAdaptivePresentationController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "fullScreenBalloonViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
LABEL_8:
  objc_msgSend(v6, "willMoveToParentViewController:", 0);

  objc_msgSend(*(id *)(a1 + 32), "fullScreenBalloonViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "fullScreenBalloonViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeFromParentViewController");

  objc_msgSend(*(id *)(a1 + 32), "fullScreenBalloonViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didMoveToParentViewController:", 0);
LABEL_9:

  objc_msgSend(*(id *)(a1 + 32), "setFullScreenBalloonViewController:", 0);
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    (*(void (**)(void))(v15 + 16))();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "_fullScreenBalloonViewController has been dismissed and set to nil", v17, 2u);
    }

  }
}

- (void)fullScreenBalloonViewController:(id)a3 didAppearAnimated:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  id v19;

  v5 = a3;
  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chatItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "balloonViewForChatItem:", v7);
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "prepareForAcknowledgementDisplay");
  objc_msgSend(v19, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCoreChatController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  -[CKCoreChatController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertRect:fromView:", v18, v11, v13, v15, v17);
  objc_msgSend(v5, "setPreservedBoundsInBalloonWindowAtAppearance:");

}

- (void)fullScreenBalloonViewControllerDidDisappear:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[CKCoreChatController chat](self, "chat");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endHoldingChatItemsUpdatesForReason:", *MEMORY[0x1E0D35380]);
  -[CKScrollViewController endHoldingScrollGeometryUpdatesForReason:](self, "endHoldingScrollGeometryUpdatesForReason:", CFSTR("FullscreenBalloonMenuVisible"));
  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chatItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "balloonViewForChatItem:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "prepareForAcknowledgementDismissal");
  objc_msgSend(v4, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeFromSuperview");
}

- (void)fullScreenBalloonViewController:(id)a3 sendMessageAcknowledgment:(int64_t)a4 forChatItem:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  int64_t v11;

  v7 = a5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __94__CKCoreChatController_fullScreenBalloonViewController_sendMessageAcknowledgment_forChatItem___block_invoke;
  v9[3] = &unk_1E274A420;
  v10 = v7;
  v11 = a4;
  v9[4] = self;
  v8 = v7;
  -[CKCoreChatController _dismissFullScreenBubbleViewControllerAnimated:withSendAnimation:completion:](self, "_dismissFullScreenBubbleViewControllerAnimated:withSendAnimation:completion:", 1, 1, v9);

}

void __94__CKCoreChatController_fullScreenBalloonViewController_sendMessageAcknowledgment_forChatItem___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "fullScreenBalloonViewController:sendMessageAcknowledgment:", v4, 2u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "chat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendMessageAcknowledgment:forChatItem:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

- (id)fullScreenBalloonViewController:(id)a3 balloonViewForChatItem:(id)a4
{
  return -[CKCoreChatController balloonViewForChatItem:](self, "balloonViewForChatItem:", a4);
}

- (id)balloonViewForChatItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "IMChatItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "guid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chatItemForGUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKCoreChatController collectionViewController](self, "collectionViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "balloonViewForChatItem:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (CGRect)fullScreenBalloonViewController:(id)a3 balloonFrameForChatItem:(id)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect result;

  -[CKCoreChatController fullScreenBalloonViewController:balloonViewForChatItem:](self, "fullScreenBalloonViewController:balloonViewForChatItem:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CKCoreChatController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v5, "superview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "convertRect:fromView:", v15, v8, v10, v12, v14);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

  }
  else
  {
    v17 = *MEMORY[0x1E0C9D648];
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v23 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v24 = v17;
  v25 = v19;
  v26 = v21;
  v27 = v23;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)fullScreenBalloonViewControllerHandleDismissTap:(id)a3
{
  -[CKCoreChatController _dismissFullScreenBubbleViewControllerAnimated:withSendAnimation:completion:](self, "_dismissFullScreenBubbleViewControllerAnimated:withSendAnimation:completion:", 1, 0, 0);
}

- (BOOL)wantsReplyButton
{
  void *v4;
  char v5;

  if (-[CKCoreChatController isInline](self, "isInline"))
    return 0;
  -[CKCoreChatController chat](self, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canSendInlineReply");

  return v5;
}

- (CGRect)fullScreenBalloonViewControllerSafeAreaLayoutFrame:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[CKCoreChatController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeAreaLayoutGuide");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)fullScreenBalloonViewController:(id)a3 duplicatedViewForChatItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  int v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;

  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CKCoreChatController balloonViewForChatItem:](self, "balloonViewForChatItem:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "canUseOpaqueMask") & 1) != 0)
    {
      objc_msgSend(v6, "setCanUseOpaqueMask:", 0);
      objc_msgSend(v6, "prepareForDisplayIfNeeded");
      objc_msgSend(v6, "layoutIfNeeded");
      objc_msgSend(MEMORY[0x1E0CD28B0], "flush");
      objc_msgSend(v6, "snapshotViewAfterScreenUpdates:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCanUseOpaqueMask:", 1);
      objc_msgSend(v6, "prepareForDisplayIfNeeded");
      objc_msgSend(v6, "layoutIfNeeded");
    }
    else
    {
      objc_msgSend(v6, "snapshotViewAfterScreenUpdates:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    CKBalloonViewForClass((objc_class *)objc_msgSend(v5, "balloonViewClass"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    objc_msgSend(v7, "configureForMessagePart:", v5);
    if ((isKindOfClass & 1) == 0)
      objc_msgSend(v7, "setInvisibleInkEffectEnabled:", 0);
    objc_msgSend(v7, "setCanUseOpaqueMask:", 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CKCoreChatController view](self, "view");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setGradientReferenceView:", v9);

    }
    objc_msgSend(v7, "setNeedsPrepareForDisplay");
    objc_msgSend(v7, "prepareForDisplayIfNeeded");
    objc_msgSend(v5, "size");
    v11 = v10;
    v13 = v12;
    v14 = objc_msgSend(v5, "itemIsReplyContextPreview");
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      objc_msgSend(v15, "replyBalloonMaskSizeWithTailShape:isMultiline:", 1, 0);
      objc_msgSend(v7, "setWantsSkinnyMask:", v11 < v17);

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "textReplyPreviewBalloonMinHeight");
    }
    else
    {
      objc_msgSend(v15, "balloonMaskSizeWithTailShape:isMultiline:", 1, 0);
      objc_msgSend(v7, "setWantsSkinnyMask:", v11 < v19);

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "textBalloonMinHeight");
    }
    objc_msgSend(v7, "setWantsMultilineMask:", v13 > v18);
  }

  return v7;
}

- (BOOL)isInline
{
  return 0;
}

- (void)showInlineReplyControllerForChatItem:(id)a3 presentKeyboard:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  +[CKInlineReplyTransitionProperties defaultProperties](CKInlineReplyTransitionProperties, "defaultProperties");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CKCoreChatController showInlineReplyControllerForChatItem:presentKeyboard:replyTransitionProperties:](self, "showInlineReplyControllerForChatItem:presentKeyboard:replyTransitionProperties:", v6, v4, v7);

}

- (id)_threadChatItemForReplyCountChatItem:(id)a3 chatItems:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "IMChatItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "itemIsReplyCount"))
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "threadIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "replyMessageGUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "length") || objc_msgSend(v12, "length"))
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x3032000000;
      v22 = __Block_byref_object_copy__55;
      v23 = __Block_byref_object_dispose__55;
      v24 = 0;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __71__CKCoreChatController__threadChatItemForReplyCountChatItem_chatItems___block_invoke;
      v15[3] = &unk_1E2757830;
      v16 = v12;
      v17 = v11;
      v18 = &v19;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v15);
      v13 = (id)v20[5];

      _Block_object_dispose(&v19, 8);
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __71__CKCoreChatController__threadChatItemForReplyCountChatItem_chatItems___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  int v17;
  id v18;

  v7 = a2;
  objc_msgSend(v7, "IMChatItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "IMChatItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a1[4])
    {
      objc_msgSend(v10, "message");
      v12 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v12, "guid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v12) = objc_msgSend(v13, "isEqualToString:", a1[4]);
      if ((v12 & 1) == 0)
        goto LABEL_9;
    }
    else
    {
      v18 = 0;
      v14 = objc_msgSend(v10, "itemIsThreadOriginatorWithThreadIdentifier:", &v18);
      v15 = v18;
      v16 = v15;
      if ((v14 & 1) == 0)
      {

        goto LABEL_9;
      }
      v17 = objc_msgSend(v15, "isEqualToString:", a1[5]);

      if (!v17)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
    *a4 = 1;
    goto LABEL_9;
  }
LABEL_10:

}

- (void)systemApplicationDidResume
{
  void *v2;
  void *v3;
  id v4;

  if (-[CKCoreChatController viewIsVisible](self, "viewIsVisible"))
  {
    +[CKPreviewDispatchCache genmojiPreviewCache](CKPreviewDispatchCache, "genmojiPreviewCache");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "resume");

    +[CKPreviewDispatchCache transcriptPreviewCache](CKPreviewDispatchCache, "transcriptPreviewCache");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resume");

    +[CKPreviewDispatchCache snapshotCache](CKPreviewDispatchCache, "snapshotCache");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resume");

  }
}

- (void)configureWithToolbarController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[CKCoreChatController macToolbarController](self, "macToolbarController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 != v6)
    -[CKCoreChatController setMacToolbarController:](self, "setMacToolbarController:", v6);
  if (-[CKCoreChatController conformsToProtocol:](self, "conformsToProtocol:", &unk_1EE1607D8))
  {
    -[CKCoreChatController macToolbarController](self, "macToolbarController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSecondaryItemProvider:", self);

  }
}

- (void)providerWillBeRemovedFromToolbarController:(id)a3
{
  -[CKCoreChatController setMacToolbarController:](self, "setMacToolbarController:", 0);
}

- (BOOL)itemProviderDisablesTouches
{
  return 0;
}

- (id)toolbarItemForIdentifier:(id)a3
{
  return 0;
}

- (void)presentMacToolbarController
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "useMacToolbar");

  if (v4)
  {
    -[CKCoreChatController macToolbarController](self, "macToolbarController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[CKCoreChatController view](self, "view");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[CKCoreChatController macToolbarController](self, "macToolbarController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", v7);

    }
  }
}

- (id)selectedChatItems
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)fullScreenBalloonViewControllerShouldShowHightlightButton:(id)a3 forChatItem:(id)a4
{
  return objc_msgSend(a4, "syndicationBehavior", a3) == 1;
}

- (void)fullScreenBalloonViewController:(id)a3 sendMessageHighlight:(BOOL)a4 forChatItem:(id)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v5 = a4;
  v7 = a5;
  -[CKCoreChatController chat](self, "chat");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "IMChatItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "guid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "messagePartRange");
  v12 = v11;

  if (v5)
    v13 = 4;
  else
    v13 = 8;
  objc_msgSend(v14, "sendSyndicationAction:forMessagePartGUID:syndicatedMessagePartRange:", v13, v9, v10, v12);

}

- (void)fullScreenBalloonViewControllerMessageHighlightButtonDidFinishAnimating:(id)a3
{
  -[CKCoreChatController _dismissFullScreenBubbleViewControllerAnimated:withSendAnimation:completion:](self, "_dismissFullScreenBubbleViewControllerAnimated:withSendAnimation:completion:", 1, 1, &__block_literal_global_293_2);
}

- (id)contextualChatItemsForFullScreenBalloonViewController:(id)a3
{
  void *v3;
  void *v4;

  -[CKCoreChatController collectionViewController](self, "collectionViewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chatItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)copyChatItem:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "canCopy") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pasteboardItemProviders");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setItemProviders:", v4);

  }
}

- (void)deleteChatItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "canDelete"))
  {
    -[CKCoreChatController collectionViewController](self, "collectionViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deleteSelectedChatItems:", v6);

  }
}

- (void)transcriptCollectionViewController:(id)a3 willDeleteChatItems:(id)a4
{
  void *v5;
  int v6;
  id v7;
  _QWORD v8[5];

  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D397A0], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isFeatureEnabled");

  if (v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __79__CKCoreChatController_transcriptCollectionViewController_willDeleteChatItems___block_invoke;
    v8[3] = &unk_1E27500C0;
    v8[4] = self;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);
  }

}

void __79__CKCoreChatController_transcriptCollectionViewController_willDeleteChatItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "supportsCommunicationSafety"))
  {
    objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "commSafetyTransferGUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transferForGUID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "commSafetySensitive") == 2)
    {
      v7 = objc_msgSend(v3, "isFromMe");
      objc_msgSend(v6, "localURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = v7 ^ 1u;
        v11 = objc_alloc(MEMORY[0x1E0D357D8]);
        objc_msgSend(v3, "commSafetyTransferGUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithIdentifier:imageData:", v12, v9);

        v14 = (void *)MEMORY[0x1E0D357D0];
        objc_msgSend(v3, "commSafetyMessageGUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "chat");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "registerEvent:eventType:messageGUID:chat:forImages:", v10, 2, v15, v16, v17);

      }
    }

  }
}

- (id)firstUnreadMessageItemGUIDForTranscriptCollectionViewController:(id)a3
{
  return 0;
}

- (double)_maxEntryViewHeight
{
  return 0.0;
}

- (CKCoreChatControllerDelegate)delegate
{
  return (CKCoreChatControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (BOOL)isSendingMessage
{
  return self->_sendingMessage;
}

- (void)setSendingMessage:(BOOL)a3
{
  self->_sendingMessage = a3;
}

- (BOOL)viewIsVisible
{
  return self->_viewIsVisible;
}

- (void)setViewIsVisible:(BOOL)a3
{
  self->_viewIsVisible = a3;
}

- (BOOL)transitionedFromComposing
{
  return self->_transitionedFromComposing;
}

- (void)setTransitionedFromComposing:(BOOL)a3
{
  self->_transitionedFromComposing = a3;
}

- (BOOL)userInitiatedTranscriptPush
{
  return self->_userInitiatedTranscriptPush;
}

- (void)setUserInitiatedTranscriptPush:(BOOL)a3
{
  self->_userInitiatedTranscriptPush = a3;
}

- (BOOL)shareWasCreated
{
  return self->_shareWasCreated;
}

- (void)setShareWasCreated:(BOOL)a3
{
  self->_shareWasCreated = a3;
}

- (CGSize)initialViewSize
{
  double width;
  double height;
  CGSize result;

  width = self->_initialViewSize.width;
  height = self->_initialViewSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setInitialViewSize:(CGSize)a3
{
  self->_initialViewSize = a3;
}

- (BOOL)showingInStandAloneWindow
{
  return self->_showingInStandAloneWindow;
}

- (void)setShowingInStandAloneWindow:(BOOL)a3
{
  self->_showingInStandAloneWindow = a3;
}

- (CKChatInputController)inputController
{
  return self->_inputController;
}

- (void)setInputController:(id)a3
{
  objc_storeStrong((id *)&self->_inputController, a3);
}

- (CKCoreTranscriptControllerProtocol)collectionViewController
{
  return self->_collectionViewController;
}

- (BOOL)initialLayoutComplete
{
  return self->_initialLayoutComplete;
}

- (void)setInitialLayoutComplete:(BOOL)a3
{
  self->_initialLayoutComplete = a3;
}

- (BOOL)ignoreLastBalloonVisibleInMarkAsReadCheck
{
  return self->_ignoreLastBalloonVisibleInMarkAsReadCheck;
}

- (void)setIgnoreLastBalloonVisibleInMarkAsReadCheck:(BOOL)a3
{
  self->_ignoreLastBalloonVisibleInMarkAsReadCheck = a3;
}

- (CKScheduledUpdater)refreshServiceForSendingUpdater
{
  return self->_refreshServiceForSendingUpdater;
}

- (void)setRefreshServiceForSendingUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_refreshServiceForSendingUpdater, a3);
}

- (void)setProgressBar:(id)a3
{
  objc_storeStrong((id *)&self->_progressBar, a3);
}

- (double)sendProgress
{
  return self->_sendProgress;
}

- (void)setSendProgress:(double)a3
{
  self->_sendProgress = a3;
}

- (unint64_t)sendProgressSendCount
{
  return self->_sendProgressSendCount;
}

- (void)setSendProgressSendCount:(unint64_t)a3
{
  self->_sendProgressSendCount = a3;
}

- (unint64_t)sendProgressTotalCount
{
  return self->_sendProgressTotalCount;
}

- (void)setSendProgressTotalCount:(unint64_t)a3
{
  self->_sendProgressTotalCount = a3;
}

- (CKFullScreenBalloonViewController)fullScreenBalloonViewController
{
  return self->_fullScreenBalloonViewController;
}

- (void)setFullScreenBalloonViewController:(id)a3
{
  objc_storeStrong((id *)&self->_fullScreenBalloonViewController, a3);
}

- (int64_t)acknowledgmentToSend
{
  return self->_acknowledgmentToSend;
}

- (void)setAcknowledgmentToSend:(int64_t)a3
{
  self->_acknowledgmentToSend = a3;
}

- (BOOL)disableAnimationsUnderTest
{
  return self->_disableAnimationsUnderTest;
}

- (void)setDisableAnimationsUnderTest:(BOOL)a3
{
  self->_disableAnimationsUnderTest = a3;
}

- (STLockoutViewController)lockoutViewController
{
  return self->_lockoutViewController;
}

- (void)setLockoutViewController:(id)a3
{
  objc_storeStrong((id *)&self->_lockoutViewController, a3);
}

- (BOOL)isShowingLockoutView
{
  return self->_isShowingLockoutView;
}

- (void)setIsShowingLockoutView:(BOOL)a3
{
  self->_isShowingLockoutView = a3;
}

- (CKMacToolbarController)macToolbarController
{
  return self->_macToolbarController;
}

- (void)setMacToolbarController:(id)a3
{
  objc_storeStrong((id *)&self->_macToolbarController, a3);
}

- (NSTimer)satelliteFetchTimer
{
  return self->_satelliteFetchTimer;
}

- (void)setSatelliteFetchTimer:(id)a3
{
  objc_storeStrong((id *)&self->_satelliteFetchTimer, a3);
}

- (UIView)satelliteUnavailableLabel
{
  return self->_satelliteUnavailableLabel;
}

- (void)setSatelliteUnavailableLabel:(id)a3
{
  objc_storeStrong((id *)&self->_satelliteUnavailableLabel, a3);
}

- (IMHandleStatusObserverAssertion)handleStatusAssertion
{
  return self->_handleStatusAssertion;
}

- (id)insertItemsEmojiTapbacksCallBack
{
  return self->_insertItemsEmojiTapbacksCallBack;
}

- (void)setInsertItemsEmojiTapbacksCallBack:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1224);
}

- (id)removeItemsEmojiTapbacksCallBack
{
  return self->_removeItemsEmojiTapbacksCallBack;
}

- (void)setRemoveItemsEmojiTapbacksCallBack:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1232);
}

- (NSCountedSet)activePinningInputViewReasons
{
  return self->_activePinningInputViewReasons;
}

- (void)setActivePinningInputViewReasons:(id)a3
{
  objc_storeStrong((id *)&self->_activePinningInputViewReasons, a3);
}

- (BOOL)needsEndPinningInputViewsForSwitchingConversationAfterConversationIsSet
{
  return self->_needsEndPinningInputViewsForSwitchingConversationAfterConversationIsSet;
}

- (void)setNeedsEndPinningInputViewsForSwitchingConversationAfterConversationIsSet:(BOOL)a3
{
  self->_needsEndPinningInputViewsForSwitchingConversationAfterConversationIsSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activePinningInputViewReasons, 0);
  objc_storeStrong(&self->_removeItemsEmojiTapbacksCallBack, 0);
  objc_storeStrong(&self->_insertItemsEmojiTapbacksCallBack, 0);
  objc_storeStrong((id *)&self->_handleStatusAssertion, 0);
  objc_storeStrong((id *)&self->_satelliteUnavailableLabel, 0);
  objc_storeStrong((id *)&self->_satelliteFetchTimer, 0);
  objc_storeStrong((id *)&self->_macToolbarController, 0);
  objc_storeStrong((id *)&self->_lockoutViewController, 0);
  objc_storeStrong((id *)&self->_fullScreenBalloonViewController, 0);
  objc_storeStrong((id *)&self->_progressBar, 0);
  objc_storeStrong((id *)&self->_refreshServiceForSendingUpdater, 0);
  objc_storeStrong((id *)&self->_collectionViewController, 0);
  objc_storeStrong((id *)&self->_inputController, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)lazyCreatedActivePinningInputViewReasons
{
  id v3;

  -[CKCoreChatController activePinningInputViewReasons](self, "activePinningInputViewReasons");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3550]);
    -[CKCoreChatController setActivePinningInputViewReasons:](self, "setActivePinningInputViewReasons:", v3);
  }
  return v3;
}

- (void)beginPinningInputViewsForReason:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKCoreChatController lazyCreatedActivePinningInputViewReasons](self, "lazyCreatedActivePinningInputViewReasons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(v5, "addObject:", v4);
  v7 = IMOSLoggingEnabled();
  if (v6)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v5;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "We are now pinning input views for multiple reasons: %@", (uint8_t *)&v11, 0xCu);
      }

    }
  }
  else
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v4;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Beginning pinning input views for reason %@", (uint8_t *)&v11, 0xCu);
      }

    }
    -[CKCoreChatController _beginPinningInputViews](self, "_beginPinningInputViews");
    objc_msgSend(MEMORY[0x1E0CEA828], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_beginDisablingAnimations");

  }
}

- (void)endPinningInputViewsForReason:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKCoreChatController lazyCreatedActivePinningInputViewReasons](self, "lazyCreatedActivePinningInputViewReasons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v4) & 1) == 0)
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_16;
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Received request to end pinning input views for reason %@, but we are not currently pinning for that reason.", (uint8_t *)&v11, 0xCu);
    }
    goto LABEL_6;
  }
  objc_msgSend(v5, "removeObject:", v4);
  v6 = objc_msgSend(v5, "count");
  v7 = IMOSLoggingEnabled();
  if (v6)
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v11 = 138412546;
        v12 = v4;
        v13 = 2112;
        v14 = v5;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Ending pinning input views for reason %@, but we are still pinning input views for reasons %@", (uint8_t *)&v11, 0x16u);
      }
LABEL_6:

    }
  }
  else
  {
    if (v7)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v4;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Ending pinning input views for reason %@", (uint8_t *)&v11, 0xCu);
      }

    }
    -[CKCoreChatController _endPinningInputViews](self, "_endPinningInputViews");
    objc_msgSend(MEMORY[0x1E0CEA828], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_endDisablingAnimations");

  }
LABEL_16:

}

- (BOOL)chatSupportsStickerTapbacks
{
  CKCoreChatController *v2;
  CKConversation *v3;
  CKCoreChatController *v4;
  unsigned __int8 v5;

  v2 = self;
  v3 = -[CKCoreChatController conversation](v2, sel_conversation);
  v4 = -[CKConversation chat](v3, sel_chat);

  if (v4)
  {
    v5 = -[CKCoreChatController supportsCapabilities:](v4, sel_supportsCapabilities_, 0x10000);

    v2 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)sendTapback:(id)a3 chatItem:(id)a4 isRemoval:(BOOL)a5
{
  id v8;
  id v9;
  CKCoreChatController *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_18E6186EC(v8, (uint64_t)v9, a5);

}

- (id)currentlyFocusedChatItemForTapbackInTranscriptCollectionViewController:(id)a3
{
  id v4;
  CKCoreChatController *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_18E6188F4(v4);
  v7 = v6;

  return v7;
}

- (void)fullScreenBalloonViewController:(id)a3 didSelectTapback:(id)a4
{
  id v6;
  id v7;
  CKCoreChatController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_18E618F30(v6, (uint64_t)v7);

}

- (void)fullScreenBalloonViewController:(id)a3 didDeselectTapback:(id)a4
{
  id v6;
  id v7;
  CKCoreChatController *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[6];

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = objc_msgSend(v6, sel_chatItem);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v6;
  v13[4] = sub_18E619AC8;
  v13[5] = v10;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 1107296256;
  v13[2] = sub_18E521C9C;
  v13[3] = &block_descriptor_3_1;
  v11 = _Block_copy(v13);
  v12 = v6;
  swift_release();
  -[CKCoreChatController setRemoveItemsEmojiTapbacksCallBack:](v8, sel_setRemoveItemsEmojiTapbacksCallBack_, v11);
  _Block_release(v11);
  -[CKCoreChatController sendTapback:chatItem:isRemoval:](v8, sel_sendTapback_chatItem_isRemoval_, v7, v9, 1);

}

- (void)fullScreenBalloonViewController:(id)a3 requestedPresentPlugin:(id)a4 withPayloadID:(id)a5
{
  id v5;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  CKCoreChatController *v12;

  v5 = a5;
  if (!a4)
  {
    v8 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v8 = (void *)sub_18E76887C();
  if (!v5)
    goto LABEL_5;
LABEL_3:
  v9 = sub_18E768984();
  v5 = v10;
LABEL_6:
  v11 = a3;
  v12 = self;
  sub_18E6199CC(v8, v9, (uint64_t)v5);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)fullScreenBalloonViewControllerRequestedAppCardDismiss:(id)a3
{
  id v4;
  CKChatInputController *v5;
  CKChatInputController *v6;
  void *v7;
  CKCoreChatController *v8;
  _QWORD aBlock[6];

  v4 = a3;
  v8 = self;
  v5 = -[CKCoreChatController inputController](v8, sel_inputController);
  if (v5)
  {
    v6 = v5;
    aBlock[4] = nullsub_1;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_18E521C9C;
    aBlock[3] = &block_descriptor_36;
    v7 = _Block_copy(aBlock);
    -[CKChatInputController dismissAppCardIfNecessaryAnimated:completion:](v6, sel_dismissAppCardIfNecessaryAnimated_completion_, 1, v7);
    _Block_release(v7);

  }
  else
  {

  }
}

- (BOOL)fullScreenBalloonViewControllerShouldEnableStickerTapbacks:(id)a3
{
  return -[CKCoreChatController chatSupportsStickerTapbacks](self, sel_chatSupportsStickerTapbacks, a3);
}

- (id)associatedTapbackPileViewForFullScreenBalloonViewController:(id)a3
{
  id v4;
  CKCoreChatController *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_18E619394(v4);
  v7 = v6;

  return v7;
}

- (void)fullScreenBalloonViewController:(id)a3 updateTapbackPileAppearanceAsHidden:(BOOL)a4
{
  id v6;
  CKCoreChatController *v7;

  v6 = a3;
  v7 = self;
  sub_18E6195D4(v6, a4);

}

- (void)fullScreenBalloonViewController:(id)a3 updateTranscriptBalloonViewAppearanceAsHidden:(BOOL)a4
{
  id v6;
  CKCoreChatController *v7;

  v6 = a3;
  v7 = self;
  sub_18E619754(v6, a4);

}

- (id)fullScreenBalloonViewControllerSmartEmojiResponses:(id)a3
{
  id v4;
  CKCoreChatController *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, sel_chatItem);
  sub_18E618438(v6);

  v7 = (void *)sub_18E768AC8();
  swift_bridgeObjectRelease();
  return v7;
}

- (id)textInputContextIdentifierForFullScreenBalloonViewController:(id)a3
{
  id v4;
  CKCoreChatController *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  v6 = -[CKCoreChatController textInputContextIdentifier](v5, sel_textInputContextIdentifier);
  if (v6)
  {
    v7 = v6;
    sub_18E768984();

    v8 = (void *)sub_18E768954();
    swift_bridgeObjectRelease();
  }
  else
  {

    v8 = 0;
  }
  return v8;
}

- (void)setConversation:forceReload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Attempted to set conversation to nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)sendStickerTapback:mediaObject:parentMessagePartChatItem:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Unable to send nil media object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)scrollToHighlightedMessageScrollContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_18DFCD000, v0, v1, "Could not scroll to highlighted message context, index path not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
