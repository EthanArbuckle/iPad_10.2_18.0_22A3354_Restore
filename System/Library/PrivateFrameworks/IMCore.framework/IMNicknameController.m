@implementation IMNicknameController

+ (id)sharedInstance
{
  if (qword_1ECF12590 != -1)
    dispatch_once(&qword_1ECF12590, &unk_1E471D5D8);
  return (id)qword_1ECF125F0;
}

- (IMNicknameController)init
{
  IMNicknameController *v2;
  IMNicknameController *v3;
  NSObject *v4;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMNicknameController;
  v2 = -[IMNicknameController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    if (-[IMNicknameController _nicknameFeatureEnabled](v2, "_nicknameFeatureEnabled"))
    {
      -[IMNicknameController setIsInitialLoad:](v3, "setIsInitialLoad:", 1);
      -[IMNicknameController updateLocalNicknameStore](v3, "updateLocalNicknameStore");
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v4 = objc_claimAutoreleasedReturnValue();
      -[NSObject addObserver:selector:name:object:](v4, "addObserver:selector:name:object:", v3, sel__broadcastNicknamePreferencesDidChange_, *MEMORY[0x1E0D38B28], 0);
    }
    else
    {
      if (!IMOSLoggingEnabled())
        return v3;
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Nickname feature is disabled, not loading IMNicknameController", v6, 2u);
      }
    }

  }
  return v3;
}

- (BOOL)_canUpdatePersonalNickname
{
  void *v3;
  char v4;
  _BOOL4 v5;
  BOOL result;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAllowMultiplePhoneNumbersSNaPEnabled");

  v5 = -[IMNicknameController iCloudSignedInToUseNicknames](self, "iCloudSignedInToUseNicknames");
  result = v4 & v5;
  if ((v4 & 1) == 0 && v5)
    return objc_msgSend((id)objc_opt_class(), "multiplePhoneNumbersTiedToAppleID") ^ 1;
  return result;
}

- (void)_broadcastNicknamePreferencesDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Got IMNicknamePreferencesDidChangeNotification so syncing preferences", v7, 2u);
    }

  }
  -[IMNicknameController daemonController](self, "daemonController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nicknamePreferencesDidChange");

}

- (id)nicknameForHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[IMNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled"))
  {
    -[IMNicknameController _handleIDsForHandle:](self, "_handleIDsForHandle:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMNicknameController nicknameForHandleIDs:](self, "nicknameForHandleIDs:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

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
        v10 = v4;
        _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Nickname feature not enabled, returning nil nickname for handle %@", (uint8_t *)&v9, 0xCu);
      }

    }
    v6 = 0;
  }

  return v6;
}

- (unint64_t)nicknameUpdateForHandle:(id)a3 nicknameIfAvailable:(id *)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  int v29;
  int v30;
  void *v31;
  int v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  char v45;
  int v46;
  NSObject *v47;
  int v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  int v58;
  NSObject *v59;
  int v60;
  NSObject *v61;
  NSObject *v62;
  void *v63;
  _BOOL4 v64;
  uint64_t v65;
  uint64_t v66;
  int v68;
  uint64_t v69;
  int v70;
  void *v71;
  void *v72;
  int v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t buf[4];
  id v84;
  __int16 v85;
  void *v86;
  _BYTE v87[128];
  _QWORD v88[4];
  _QWORD v89[5];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[IMNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled"))
  {
    v71 = v5;
    -[IMNicknameController _handleIDsForHandle:](self, "_handleIDsForHandle:", v5);
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v80;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v80 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * v9);
        -[IMNicknameController pendingNicknameUpdates](self, "pendingNicknameUpdates");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }

      if (a4)
        *a4 = objc_retainAutorelease(v12);
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isNameAndPhotoC3Enabled");

      v17 = *MEMORY[0x1E0C966C0];
      if (v16)
      {
        v89[0] = *MEMORY[0x1E0C966D0];
        v89[1] = v17;
        v18 = *MEMORY[0x1E0C968A8];
        v89[2] = *MEMORY[0x1E0C96708];
        v89[3] = v18;
        v89[4] = *MEMORY[0x1E0C96710];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 5);
      }
      else
      {
        v88[0] = *MEMORY[0x1E0C966D0];
        v88[1] = v17;
        v19 = *MEMORY[0x1E0C96710];
        v88[2] = *MEMORY[0x1E0C96708];
        v88[3] = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 4);
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "cnContactWithKeys:", v20);
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v21 = v6;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v76;
LABEL_23:
        v24 = 0;
        while (1)
        {
          if (*(_QWORD *)v76 != v23)
            objc_enumerationMutation(v21);
          v25 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * v24);
          -[IMNicknameController handledNicknames](self, "handledNicknames");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKey:", v25);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
            break;
          if (v22 == ++v24)
          {
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
            if (v22)
              goto LABEL_23;
            goto LABEL_29;
          }
        }

        if ((objc_msgSend(MEMORY[0x1E0D397A8], "isCNContactAKnownContact:", v72) & 1) != 0)
        {
          v68 = 0;
          goto LABEL_32;
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v84 = v27;
            _os_log_impl(&dword_1A1FF4000, v49, OS_LOG_TYPE_INFO, "Not displaying nickname update banner for unknown contact with previously handled nickname: %@", buf, 0xCu);
          }

        }
        -[IMNicknameController clearPendingNicknameUpdatesForHandle:forceClear:](self, "clearPendingNicknameUpdatesForHandle:forceClear:", v71, 1);
        v13 = 0;
        if (a4)
          *a4 = 0;
        goto LABEL_137;
      }
LABEL_29:

      v27 = 0;
      v68 = 1;
LABEL_32:
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v84 = v27;
          _os_log_impl(&dword_1A1FF4000, v28, OS_LOG_TYPE_INFO, "Last handled nickname: %@", buf, 0xCu);
        }

      }
      v29 = objc_msgSend(v12, "isUpdateFromNickname:withOptions:", v27, 4);
      v30 = objc_msgSend(v12, "isUpdateFromNickname:withOptions:", v27, 2);
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "isNameAndPhotoC3Enabled");

      if (v32)
        v74 = objc_msgSend(v12, "isUpdateFromNickname:withOptions:", v27, 32);
      else
        v74 = 0;
      v70 = objc_msgSend(v12, "isUpdateFromNickname:withOptions:", v27, 16);
      if (v29)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v84 = v12;
            v85 = 2112;
            v86 = v72;
            _os_log_impl(&dword_1A1FF4000, v33, OS_LOG_TYPE_INFO, "Pending nickname update %@ does not match previously handled nickname for contact %@", buf, 0x16u);
          }

        }
        objc_msgSend(v72, "givenName");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstName");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v34, "isEqualToString:", v35) & 1) != 0)
        {
          objc_msgSend(v72, "familyName");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "lastName");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v36, "isEqualToString:", v37);

          if (v38)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A1FF4000, v39, OS_LOG_TYPE_INFO, "Pending nickname name matches names for contact. Setting nameChanged to NO", buf, 2u);
              }

            }
            goto LABEL_50;
          }
        }
        else
        {

        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v84 = v12;
            v85 = 2112;
            v86 = v72;
            _os_log_impl(&dword_1A1FF4000, v50, OS_LOG_TYPE_INFO, "Pending nickname name %@ does not match current contact name %@", buf, 0x16u);
          }

        }
        objc_msgSend(v12, "updateNameFromContact:", v72);
        v69 = 2;
        if (v30)
        {
LABEL_51:
          objc_msgSend(v72, "imageData");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v40, "length"))
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v84 = v72;
                v85 = 2112;
                v86 = v12;
                _os_log_impl(&dword_1A1FF4000, v51, OS_LOG_TYPE_INFO, "Existing contact does not have an image, not suppressing photo update banner. Contact: %@ pendingUpdate: %@", buf, 0x16u);
              }

            }
            v48 = 1;
            goto LABEL_92;
          }
          objc_msgSend(v12, "imageHash");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "imageHash");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v42 == 0;

          if (v43)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v52 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v84 = v72;
                v85 = 2112;
                v86 = v12;
                _os_log_impl(&dword_1A1FF4000, v52, OS_LOG_TYPE_INFO, "Could not determine md5 hash of existing image data, not suppressing photo update banner. Contact: %@ pendingUpdate: %@", buf, 0x16u);
              }
              goto LABEL_89;
            }
          }
          else if (objc_msgSend(v41, "length"))
          {
            objc_msgSend(v72, "imageHash");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v44, "isEqual:", v41);

            v46 = IMOSLoggingEnabled();
            if ((v45 & 1) != 0)
            {
              if (v46)
              {
                OSLogHandleForIMFoundationCategory();
                v47 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v84 = v72;
                  v85 = 2112;
                  v86 = v12;
                  _os_log_impl(&dword_1A1FF4000, v47, OS_LOG_TYPE_INFO, "Photo update has a the same md5 hash as the existing contact photo, suppressing photo update banner. Contact: %@ pendingUpdate: %@", buf, 0x16u);
                }

              }
              v48 = 0;
              goto LABEL_91;
            }
            if (v46)
            {
              OSLogHandleForIMFoundationCategory();
              v52 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v84 = v72;
                v85 = 2112;
                v86 = v12;
                _os_log_impl(&dword_1A1FF4000, v52, OS_LOG_TYPE_INFO, "Photo update has a distinct md5 hash from the existing contact photo, not suppressing photo update banner. Contact: %@ pendingUpdate: %@", buf, 0x16u);
              }
LABEL_89:

            }
          }
          else if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v84 = v72;
              v85 = 2112;
              v86 = v12;
              _os_log_impl(&dword_1A1FF4000, v52, OS_LOG_TYPE_INFO, "Could not determine md5 hash of suggested update image data, not suppressing photo update banner. Contact: %@ pendingUpdate: %@", buf, 0x16u);
            }
            goto LABEL_89;
          }
          v48 = 1;
LABEL_91:

LABEL_92:
LABEL_93:
          if (!v74)
          {
            v60 = 0;
LABEL_124:
            if (!v70
              || v68
              && (objc_msgSend(v12, "pronouns"),
                  v63 = (void *)objc_claimAutoreleasedReturnValue(),
                  v64 = v63 == 0,
                  v63,
                  v64))
            {
              v66 = v69 | 4;
              if (!v48)
                v66 = v69;
              if (v60)
                v13 = v66 | 8;
              else
                v13 = v66;
            }
            else
            {
              v65 = v69 | 4;
              if (!v48)
                v65 = v69;
              if (v60)
                v65 |= 8uLL;
              v13 = v65 | 0x10;
            }
LABEL_137:

            goto LABEL_138;
          }
          objc_msgSend(v72, "wallpaper");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "dataRepresentation");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v54, "length"))
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v61 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v84 = v72;
                v85 = 2112;
                v86 = v12;
                _os_log_impl(&dword_1A1FF4000, v61, OS_LOG_TYPE_INFO, "Existing contact does not have a wallpaper, not suppressing photo update banner. Contact: %@ pendingUpdate: %@", buf, 0x16u);
              }

            }
            v60 = 1;
            goto LABEL_123;
          }
          IMSharedHelperMD5OfDataInBytes();
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "wallpaperImageHash");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v55, "length"))
          {
            if (objc_msgSend(v56, "length"))
            {
              v57 = objc_msgSend(v55, "isEqual:", v56);
              v58 = IMOSLoggingEnabled();
              if ((v57 & 1) != 0)
              {
                if (v58)
                {
                  OSLogHandleForIMFoundationCategory();
                  v59 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    v84 = v72;
                    v85 = 2112;
                    v86 = v12;
                    _os_log_impl(&dword_1A1FF4000, v59, OS_LOG_TYPE_INFO, "Wallpaper update has a the same md5 hash as the existing wallpaper, suppressing photo update banner. Contact: %@ pendingUpdate: %@", buf, 0x16u);
                  }

                }
                v60 = 0;
                goto LABEL_122;
              }
              if (v58)
              {
                OSLogHandleForIMFoundationCategory();
                v62 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v84 = v72;
                  v85 = 2112;
                  v86 = v12;
                  _os_log_impl(&dword_1A1FF4000, v62, OS_LOG_TYPE_INFO, "Wallpaper update has a distinct md5 hash from the existing wallpaper, not suppressing photo update banner. Contact: %@ pendingUpdate: %@", buf, 0x16u);
                }
LABEL_120:

              }
            }
            else if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v62 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v84 = v72;
                v85 = 2112;
                v86 = v12;
                _os_log_impl(&dword_1A1FF4000, v62, OS_LOG_TYPE_INFO, "Could not determine md5 hash of suggested update wallpaper data, not suppressing photo update banner. Contact: %@ pendingUpdate: %@", buf, 0x16u);
              }
              goto LABEL_120;
            }
          }
          else if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v62 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v84 = v72;
              v85 = 2112;
              v86 = v12;
              _os_log_impl(&dword_1A1FF4000, v62, OS_LOG_TYPE_INFO, "Could not determine md5 hash of existing wallpaper data, not suppressing photo update banner. Contact: %@ pendingUpdate: %@", buf, 0x16u);
            }
            goto LABEL_120;
          }
          v60 = 1;
LABEL_122:

LABEL_123:
          goto LABEL_124;
        }
LABEL_72:
        v48 = 0;
        goto LABEL_93;
      }
LABEL_50:
      v69 = 0;
      if (v30)
        goto LABEL_51;
      goto LABEL_72;
    }
LABEL_10:
    v13 = 0;
    v12 = v6;
LABEL_138:

    v5 = v71;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v84 = v5;
        _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Nickname feature not enabled, no update for handle %@", buf, 0xCu);
      }

    }
    v13 = 0;
  }

  return v13;
}

- (id)IMSharedHelperMD5Helper:(id)a3
{
  return (id)IMSharedHelperMD5OfData();
}

- (void)clearPendingNicknameUpdatesForHandle:(id)a3 forceClear:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  _BOOL4 v27;
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[IMNicknameController _handleIDsForHandle:](self, "_handleIDsForHandle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v22 = 138412802;
      v23 = v7;
      v24 = 2112;
      v25 = v6;
      v26 = 1024;
      v27 = v4;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Clearing pending nickname update for handle IDs %@ on handle %@, force clear: %{BOOL}d", (uint8_t *)&v22, 0x1Cu);
    }

  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isNameAndPhotoC3Enabled");

  if (-[IMNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled"))
  {
    if (!v10 || v4)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          v22 = 138412290;
          v23 = v7;
          _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "Asking the daemon to clear handle IDs: %@", (uint8_t *)&v22, 0xCu);
        }

      }
      +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "clearPendingNicknameUpdatesForHandleIDs:", v12);
    }
    else
    {
      -[IMNicknameController pendingNicknameForHandleIDs:](self, "pendingNicknameForHandleIDs:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMNicknameController currentNicknameForHandleIDs:](self, "currentNicknameForHandleIDs:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          v22 = 138412546;
          v23 = v11;
          v24 = 2112;
          v25 = v12;
          _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Found pending nickname: %@, and current nickname %@", (uint8_t *)&v22, 0x16u);
        }

      }
      v14 = objc_msgSend(v11, "isUpdateFromNickname:withOptions:", v12, 8);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v22 = 67109120;
          LODWORD(v23) = v14;
          _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "Nicknames are different: %{BOOL}d", (uint8_t *)&v22, 8u);
        }

      }
      v16 = IMOSLoggingEnabled();
      if (v14)
      {
        if (v16)
        {
          OSLogHandleForIMFoundationCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v22 = 138412290;
            v23 = v7;
            _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Because the nicknames are different, we're asking the daemon to clear handle IDs: %@", (uint8_t *)&v22, 0xCu);
          }

        }
        +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "allObjects");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "clearPendingNicknameUpdatesForHandleIDs:", v19);

      }
      else if (v16)
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          LOWORD(v22) = 0;
          _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_INFO, "Nicknames were the same, no need to clear.", (uint8_t *)&v22, 2u);
        }

      }
    }

  }
}

- (void)clearPendingNicknameUpdatesForHandle:(id)a3
{
  -[IMNicknameController clearPendingNicknameUpdatesForHandle:forceClear:](self, "clearPendingNicknameUpdatesForHandle:forceClear:", a3, 1);
}

- (void)clearPendingNicknameUpdatesForHandleIDs:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Clearing pending nickname update for handle IDs %@", buf, 0xCu);
    }

  }
  if (-[IMNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
          +[IMNicknameController sharedInstance](IMNicknameController, "sharedInstance", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "markTransitionAsObservedForHandleID:isAutoUpdate:", v10, 0);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clearPendingNicknameUpdatesForHandleIDs:", v13);

  }
}

- (void)ignorePendingNicknameUpdatesForHandle:(id)a3
{
  id v4;

  -[IMNicknameController _handleIDsForHandle:](self, "_handleIDsForHandle:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[IMNicknameController ignorePendingNicknameUpdatesForHandleIDs:](self, "ignorePendingNicknameUpdatesForHandleIDs:", v4);

}

- (void)ignorePendingNicknameUpdatesForHandleIDs:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Ignoring pending nickname update for handle IDs %@", (uint8_t *)&v8, 0xCu);
    }

  }
  if (-[IMNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled"))
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ignorePendingNicknameUpdatesForHandleIDs:", v7);

  }
}

- (void)acceptPendingNicknameForHandleID:(id)a3 updateType:(unint64_t)a4
{
  _BOOL4 v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = -[IMNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled");
  if (v8 && v6)
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "acceptPendingNicknameForHandleID:updateType:", v8, a4);

  }
}

- (BOOL)handleIsAllowedForSharing:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  -[IMNicknameController _handleIDsForHandle:](self, "_handleIDsForHandle:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMNicknameController allowListedHandlesForSharing](self, "allowListedHandlesForSharing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "intersectsSet:", v5);

  return v6;
}

- (BOOL)handleIsDeniedForSharing:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  -[IMNicknameController _handleIDsForHandle:](self, "_handleIDsForHandle:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMNicknameController denyListedHandlesForSharing](self, "denyListedHandlesForSharing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "intersectsSet:", v5);

  return v6;
}

- (void)allowHandlesForNicknameSharing:(id)a3 forChat:(id)a4 fromHandle:(id)a5 forceSend:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v6 = a6;
  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v10;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        -[IMNicknameController _handleIDsForHandle:](self, "_handleIDsForHandle:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v18), (_QWORD)v23);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "unionSet:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

  if (-[IMNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled"))
  {
    if (v11)
    {
      +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "allGUIDsForChat:", v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = 0;
    }
    -[IMNicknameController daemonController](self, "daemonController", (_QWORD)v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "allowHandleIDsForNicknameSharing:onChatGUIDs:fromHandle:forceSend:", v13, v21, v12, v6);

  }
}

- (void)allowHandlesForNicknameSharing:(id)a3 fromHandle:(id)a4 forceSend:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v5 = a5;
  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        -[IMNicknameController _handleIDsForHandle:](self, "_handleIDsForHandle:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15), (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "unionSet:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  if (-[IMNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled"))
  {
    -[IMNicknameController daemonController](self, "daemonController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "allowHandleIDsForNicknameSharing:onChatGUIDs:fromHandle:forceSend:", v10, MEMORY[0x1E0C9AA60], v9, v5);

  }
}

- (void)sendPersonalNicknameToHandle:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_sendPersonalNicknameToHandle_fromHandle_);
}

- (void)sendPersonalNicknameToHandle:(id)a3 fromHandle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMService iMessageService](IMServiceImpl, "iMessageService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bestAccountForService:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "imHandleWithID:alreadyCanonical:", v7, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v13[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMNicknameController allowHandlesForNicknameSharing:fromHandle:forceSend:](self, "allowHandlesForNicknameSharing:fromHandle:forceSend:", v12, v6, 1);

  }
}

- (void)sendNameOnlyToHandleIDs:(id)a3 fromHandleID:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendNameOnlyToHandleIDs:fromHandleID:", v6, v5);

}

- (void)denyHandlesForNicknameSharing:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        -[IMNicknameController _handleIDsForHandle:](self, "_handleIDsForHandle:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "unionSet:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  if (-[IMNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled"))
  {
    -[IMNicknameController daemonController](self, "daemonController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "denyHandleIDsForNicknameSharing:", v5);

  }
}

- (void)markNickname:(id)a3 asActive:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v4 = a4;
  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!-[IMNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled"))
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_13;
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Nickname feature disabled, not setting personal nickname", (uint8_t *)&v16, 2u);
    }
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(v6, "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7
    || (objc_msgSend(v6, "handle"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_13;
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "handle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "recordID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Tried marking a nickname as active that is missing a handle or record ID. Handle: %@, RecordID: %@", (uint8_t *)&v16, 0x16u);

    }
    goto LABEL_12;
  }
  -[IMNicknameController daemonController](self, "daemonController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v10;
  objc_msgSend(v6, "recordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "markProfileRecords:asActive:", v12, v4);

LABEL_13:
}

- (BOOL)isActiveForNickname:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[IMNicknameController activeRecords](self, "activeRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "recordID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)markNicknameAsIgnored:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[IMNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled"))
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_13;
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Nickname feature disabled, not setting personal nickname", (uint8_t *)&v14, 2u);
    }
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(v4, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (objc_msgSend(v4, "handle"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_13;
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "handle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "recordID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412546;
      v15 = v12;
      v16 = 2112;
      v17 = v13;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Tried marking a nickname as ignored that is missing a handle or record ID. Handle: %@, RecordID: %@", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_12;
  }
  -[IMNicknameController daemonController](self, "daemonController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v8;
  objc_msgSend(v4, "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "markProfileRecordsAsIgnored:", v10);

LABEL_13:
}

- (BOOL)isIgnoredForNickname:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[IMNicknameController ignoredRecords](self, "ignoredRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "recordID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)setPersonalNickname:(id)a3
{
  char *v5;
  NSObject *v6;
  BOOL v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  char *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (char *)a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v15 = 136315138;
      v16 = "-[IMNicknameController setPersonalNickname:]";
      _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, "Setting personal nickname for %s", (uint8_t *)&v15, 0xCu);
    }

  }
  if (-[IMNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled"))
  {
    v7 = -[IMNicknameController _canUpdatePersonalNickname](self, "_canUpdatePersonalNickname");
    v8 = IMOSLoggingEnabled();
    if (v7)
    {
      if (v8)
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v15 = 138412290;
          v16 = v5;
          _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Setting new personal nickname and notifying daemon %@", (uint8_t *)&v15, 0xCu);
        }

      }
      if (v5)
      {
        objc_storeStrong((id *)&self->_personalNickname, a3);
        -[IMNicknameController daemonController](self, "daemonController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setNewPersonalNickname:", v5);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "postNotificationName:object:", CFSTR("__kIMPersonalNicknameDidChangeNotification"), 0);

      }
    }
    else if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend((id)objc_opt_class(), "multiplePhoneNumbersTiedToAppleID"));
        v14 = (char *)objc_claimAutoreleasedReturnValue();
        v15 = 138412290;
        v16 = v14;
        _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "We can't update the personal nickname - multiplePhoneNumbers: %@}", (uint8_t *)&v15, 0xCu);

      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Nickname feature disabled, not setting personal nickname", (uint8_t *)&v15, 2u);
    }

  }
}

- (void)fetchPersonalNicknameWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  BOOL v5;
  int v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  char *v13;
  void *v14;
  _QWORD v15[5];
  void (**v16)(id, void *);
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  if (-[IMNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled"))
  {
    v5 = -[IMNicknameController _canUpdatePersonalNickname](self, "_canUpdatePersonalNickname");
    v6 = IMOSLoggingEnabled();
    if (v5)
    {
      if (v6)
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          v18 = "-[IMNicknameController fetchPersonalNicknameWithCompletion:]";
          _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Fetching personal nickname for %s", buf, 0xCu);
        }

      }
      -[IMNicknameController personalNickname](self, "personalNickname");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Personal nickname found", buf, 2u);
          }

        }
        if (v4)
        {
          -[IMNicknameController personalNickname](self, "personalNickname");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, v10);

        }
      }
      else if (v4)
      {
        -[IMNicknameController daemonController](self, "daemonController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = sub_1A206D158;
        v15[3] = &unk_1E471F7B8;
        v15[4] = self;
        v16 = v4;
        objc_msgSend(v14, "fetchPersonalNicknameWithReply:", v15);

      }
      goto LABEL_28;
    }
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend((id)objc_opt_class(), "multiplePhoneNumbersTiedToAppleID"));
        v13 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v13;
        _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "We can't fetch the personal nickname - multiplePhoneNumbers: %@", buf, 0xCu);

      }
    }
    if (v4)
LABEL_19:
      v4[2](v4, 0);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Nickname feature disabled, not fetching personal nickname", buf, 2u);
      }

    }
    if (v4)
      goto LABEL_19;
  }
LABEL_28:

}

- (void)updatePersonalNickname:(id)a3
{
  id v5;
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  int v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = -[IMNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled");
  if (!v5 || v6)
  {
    v8 = -[IMNicknameController _canUpdatePersonalNickname](self, "_canUpdatePersonalNickname");
    v9 = IMOSLoggingEnabled();
    if (!v5 || v8)
    {
      if (v9)
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v14 = 138412290;
          v15 = v5;
          _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "Received personal nickname from daemon: %@", (uint8_t *)&v14, 0xCu);
        }

      }
      objc_storeStrong((id *)&self->_personalNickname, a3);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "postNotificationName:object:", CFSTR("__kIMPersonalNicknameDidChangeNotification"), 0);

    }
    else if (v9)
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend((id)objc_opt_class(), "multiplePhoneNumbersTiedToAppleID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412290;
        v15 = v11;
        _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "We can't update the personal nickname - multiplePhoneNumbers: %@", (uint8_t *)&v14, 0xCu);

      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Nickname feature disabled, not updating personal nickname", (uint8_t *)&v14, 2u);
    }

  }
}

- (BOOL)iCloudSignedInToUseNicknames
{
  void *v2;
  int v3;
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getBoolFromDomain:forKey:", *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38BC0]);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = CFSTR("NO");
      if (v3)
        v5 = CFSTR("YES");
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "iCloud signed in for nicknames: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  return v3;
}

+ (BOOL)accountsMatchUpToUseNicknames
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getBoolFromDomain:forKey:", *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38BC0]);

  return v3;
}

+ (BOOL)multiplePhoneNumbersTiedToAppleID
{
  void *v2;
  int v3;
  NSObject *v4;
  const __CFString *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D397E8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getBoolFromDomain:forKey:", *MEMORY[0x1E0D38B48], *MEMORY[0x1E0D38B80]);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = CFSTR("NO");
      if (v3)
        v5 = CFSTR("YES");
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "multiplePhoneNumbersTiedToAppleID: %@", (uint8_t *)&v7, 0xCu);
    }

  }
  return v3;
}

- (BOOL)shouldOfferNicknameSharingForChat:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "hasMessageFromMe"))
  {
    objc_msgSend(v4, "participants");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[IMNicknameController shouldOfferNicknameSharingForHandles:](self, "shouldOfferNicknameSharingForHandles:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)shouldOfferNicknameSharingForHandles:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  unsigned __int8 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  BOOL v23;
  id v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  const __CFString *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  const __CFString *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  -[IMNicknameController personalNickname](self, "personalNickname");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_26;
  -[IMNicknameController allowListedHandlesForSharing](self, "allowListedHandlesForSharing");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[IMNicknameController denyListedHandlesForSharing](self, "denyListedHandlesForSharing");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_5;
LABEL_26:
    v23 = 0;
    goto LABEL_29;
  }

LABEL_5:
  objc_msgSend(MEMORY[0x1E0D398E8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "sharingAudience");

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v25;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "isContact");
        v14 = -[IMNicknameController handleIsAllowedForSharing:](self, "handleIsAllowedForSharing:", v12);
        v15 = -[IMNicknameController handleIsDeniedForSharing:](self, "handleIsDeniedForSharing:", v12);
        v16 = v13 & (v8 < 2);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v12, "ID");
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = (void *)v18;
            v20 = CFSTR("NO");
            if (v16)
              v21 = CFSTR("YES");
            else
              v21 = CFSTR("NO");
            *(_DWORD *)buf = 138413058;
            v32 = v18;
            if (v14)
              v22 = CFSTR("YES");
            else
              v22 = CFSTR("NO");
            v33 = 2112;
            if (v15)
              v20 = CFSTR("YES");
            v34 = v21;
            v35 = 2112;
            v36 = v22;
            v37 = 2112;
            v38 = v20;
            _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Handle ID %@ contact %@ allow listed %@ deny listed %@", buf, 0x2Au);

          }
        }
        if ((v16 | v14 | v15) != 1)
        {
          v23 = 1;
          goto LABEL_28;
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
      if (v9)
        continue;
      break;
    }
  }
  v23 = 0;
LABEL_28:

LABEL_29:
  return v23;
}

- (id)getNicknameHandlesUnderScrutiny
{
  return (id)IMGetCachedDomainValueForKey();
}

- (void)setNicknameHandlesUnderScrutiny
{
  void *v2;
  id v3;

  -[IMNicknameController scrutinyNicknameHandles](self, "scrutinyNicknameHandles");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IMSetDomainValueForKey();

}

- (id)handlesForNicknamesUnderScrutiny
{
  NSMutableSet *scrutinyNicknameHandles;
  void *v4;
  NSMutableSet *v5;
  NSMutableSet *v6;

  scrutinyNicknameHandles = self->_scrutinyNicknameHandles;
  if (!scrutinyNicknameHandles)
  {
    -[IMNicknameController getNicknameHandlesUnderScrutiny](self, "getNicknameHandlesUnderScrutiny");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v5 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v4);
    else
      v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = self->_scrutinyNicknameHandles;
    self->_scrutinyNicknameHandles = v5;

    scrutinyNicknameHandles = self->_scrutinyNicknameHandles;
  }
  return scrutinyNicknameHandles;
}

- (void)markHandleUnderScrutiny:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "ID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[IMNicknameController scrutinyNicknameHandles](self, "scrutinyNicknameHandles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  -[IMNicknameController setNicknameHandlesUnderScrutiny](self, "setNicknameHandlesUnderScrutiny");
}

- (void)clearHandleFromScrutiny:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "ID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    -[IMNicknameController scrutinyNicknameHandles](self, "scrutinyNicknameHandles");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v5);

    -[IMNicknameController setNicknameHandlesUnderScrutiny](self, "setNicknameHandlesUnderScrutiny");
  }

}

- (id)personNameComponentsForHandle:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[IMNicknameController nicknameForHandle:](self, "nicknameForHandle:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0CB3850]);
  v7 = v6;
  if (v4)
    objc_msgSend(v6, "setGivenName:", v4);
  if (v5)
    objc_msgSend(v7, "setFamilyName:", v5);

  return v7;
}

- (id)imageDataForHandle:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;

  -[IMNicknameController nicknameForHandle:](self, "nicknameForHandle:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avatar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasImage");

  if (v5)
  {
    objc_msgSend(v3, "avatar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isInitialLoadComplete
{
  return !self->_isInitialLoad;
}

- (id)nicknameForHandleIDs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v4);
      v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8);
      -[IMNicknameController pendingNicknameUpdates](self, "pendingNicknameUpdates", (_QWORD)v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        break;
      -[IMNicknameController handledNicknames](self, "handledNicknames");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v15 = v13;
        goto LABEL_13;
      }
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v13 = 0;
    v15 = v11;
LABEL_13:
    v14 = v15;

    goto LABEL_14;
  }
LABEL_10:
  v14 = 0;
  v11 = v4;
LABEL_14:

  return v14;
}

- (id)pendingNicknameForHandleIDs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v7);
        -[IMNicknameController pendingNicknameUpdates](self, "pendingNicknameUpdates", (_QWORD)v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v21 = v10;
              _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Found a pending nickname: %@", buf, 0xCu);
            }

          }
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v21 = v8;
              _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Handle ID: %@", buf, 0xCu);
            }

          }
          v12 = v10;

          goto LABEL_23;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (v5)
        continue;
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v21 = 0;
      v22 = 2112;
      v23 = v4;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Found no pending nickname(%@) for handle IDs: %@", buf, 0x16u);
    }

  }
  v12 = 0;
LABEL_23:

  return v12;
}

- (id)currentNicknameForHandleIDs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v7);
        -[IMNicknameController handledNicknames](self, "handledNicknames", (_QWORD)v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v21 = v10;
              _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Found a current nickname: %@", buf, 0xCu);
            }

          }
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v21 = v8;
              _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Handle ID: %@", buf, 0xCu);
            }

          }
          v12 = v10;

          goto LABEL_23;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (v5)
        continue;
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v21 = 0;
      v22 = 2112;
      v23 = v4;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Found no current nickname(%@) for handle IDs: %@", buf, 0x16u);
    }

  }
  v12 = 0;
LABEL_23:

  return v12;
}

- (id)archivedNicknameForHandleIDs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v17;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v7);
        -[IMNicknameController archivedNicknames](self, "archivedNicknames", (_QWORD)v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v21 = v10;
              _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Found an archived nickname: %@", buf, 0xCu);
            }

          }
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v21 = v8;
              _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Handle ID: %@", buf, 0xCu);
            }

          }
          v12 = v10;

          goto LABEL_23;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (v5)
        continue;
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v21 = 0;
      v22 = 2112;
      v23 = v4;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Found no archived nickname(%@) for handle IDs: %@", buf, 0x16u);
    }

  }
  v12 = 0;
LABEL_23:

  return v12;
}

- (BOOL)hasObservedTransitionForHandleID:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[IMNicknameController transitionedHandles](self, "transitionedHandles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)markTransitionAsObservedForHandleID:(id)a3 isAutoUpdate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v4 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!objc_msgSend(v6, "length"))
  {
    IMLogHandleForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1A2196610(v16, v17, v18, v19, v20, v21, v22, v23);
    goto LABEL_21;
  }
  if (!-[IMNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled"))
  {
    IMLogHandleForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1A2196644(v16, v24, v25, v26, v27, v28, v29, v30);
LABEL_21:

    goto LABEL_22;
  }
  if (!-[IMNicknameController hasObservedTransitionForHandleID:](self, "hasObservedTransitionForHandleID:", v6))
  {
LABEL_15:
    -[IMNicknameController daemonController](self, "daemonController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "markNicknamesAsTransitionedForHandleIDs:isAutoUpdate:", v15, v4);

    goto LABEL_22;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v6;
      _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Handle ID has already transitioned: %@", buf, 0xCu);
    }

  }
  if (v4)
  {
    v8 = (void *)MEMORY[0x1E0C99E60];
    v32 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMNicknameController currentNicknameForHandleIDs:](self, "currentNicknameForHandleIDs:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMNicknameController pendingNicknameForHandleIDs:](self, "pendingNicknameForHandleIDs:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "isUpdateFromNickname:withOptions:", v11, 34))
    {

      goto LABEL_22;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "There is a new pending photo or wallpaper", buf, 2u);
      }

    }
    goto LABEL_15;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v31, OS_LOG_TYPE_INFO, "Auto-update off", buf, 2u);
    }

  }
LABEL_22:

}

- (id)createSharedProfileStateOracleForHandles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchCNContactForHandleWithID:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getContactStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMNicknameController currentNicknameForHandleIDs:](self, "currentNicknameForHandleIDs:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMNicknameController pendingNicknameForHandleIDs:](self, "pendingNicknameForHandleIDs:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMNicknameController archivedNicknameForHandleIDs:](self, "archivedNicknameForHandleIDs:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C973E0]), "initWithContact:contactStore:archivedNickname:currentNickname:pendingNickname:", v7, v9, v13, v11, v12);

  }
  else
  {
    IMLogHandleForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_1A2196678(v15);

    v14 = 0;
  }

  return v14;
}

- (void)updateLocalNicknameStore
{
  BOOL v3;
  int v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD v19[5];
  uint8_t buf[16];

  v3 = -[IMNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled");
  v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Updating nickname store!", buf, 2u);
      }

    }
    -[IMNicknameController daemonController](self, "daemonController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = sub_1A206EDA8;
    v19[3] = &unk_1E471F7E0;
    v19[4] = self;
    objc_msgSend(v6, "fetchPersonalNicknameWithReply:", v19);

    -[IMNicknameController daemonController](self, "daemonController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v7;
    v18[1] = 3221225472;
    v18[2] = sub_1A206EE34;
    v18[3] = &unk_1E471F808;
    v18[4] = self;
    objc_msgSend(v8, "fetchNicknamesWithReply:", v18);

    -[IMNicknameController daemonController](self, "daemonController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = sub_1A206F39C;
    v17[3] = &unk_1E471F830;
    v17[4] = self;
    objc_msgSend(v9, "fetchHandleSharingStateWithReply:", v17);

    -[IMNicknameController daemonController](self, "daemonController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = sub_1A206F458;
    v16[3] = &unk_1E471F858;
    v16[4] = self;
    objc_msgSend(v10, "fetchTransitionedNicknameHandlesWithReply:", v16);

    -[IMNicknameController daemonController](self, "daemonController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = sub_1A206F4E4;
    v15[3] = &unk_1E471E750;
    v15[4] = self;
    objc_msgSend(v11, "fetchActiveNicknamesWithReply:", v15);

    -[IMNicknameController daemonController](self, "daemonController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    v14[1] = 3221225472;
    v14[2] = sub_1A206F570;
    v14[3] = &unk_1E471E750;
    v14[4] = self;
    objc_msgSend(v12, "fetchIgnoredNicknameHandlesWithReply:", v14);

  }
  else if (v4)
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v13, OS_LOG_TYPE_INFO, "Nickname feature disabled, not updating nickname store", buf, 2u);
    }

  }
}

- (void)updatePendingNicknames:(id)a3 handledNicknames:(id)a4 archivedNicknames:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[3];
  _QWORD v23[3];
  const __CFString *v24;
  void *v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218496;
      v27 = objc_msgSend(v8, "count");
      v28 = 2048;
      v29 = objc_msgSend(v9, "count");
      v30 = 2048;
      v31 = objc_msgSend(v10, "count");
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Nickname store updated, got %lu pending, %lu handled nicknames, %lu archived nicknames", buf, 0x20u);
    }

  }
  -[IMNicknameController setPendingNicknameUpdates:](self, "setPendingNicknameUpdates:", v8);
  -[IMNicknameController setHandledNicknames:](self, "setHandledNicknames:", v9);
  -[IMNicknameController setArchivedNicknames:](self, "setArchivedNicknames:", v10);
  v24 = CFSTR("handleIDs");
  objc_msgSend(v9, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)

  v22[0] = CFSTR("pendingNicknames");
  v14 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[0] = v14;
  v22[1] = CFSTR("handledNicknames");
  v15 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[1] = v15;
  v22[2] = CFSTR("archivedNicknames");
  v16 = v10;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)

  if (!v9)
  if (!v8)

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("__kIMNicknameDidChangeNotification"), 0, v21);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "postNotificationName:object:userInfo:", CFSTR("__kIMPendingNicknamesDidChangeNotification"), 0, v17);

  if (-[IMNicknameController isInitialLoad](self, "isInitialLoad"))
  {
    -[IMNicknameController setIsInitialLoad:](self, "setIsInitialLoad:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "postNotificationName:object:", CFSTR("__kIMNicknameControllerDidLoadNotification"), 0);

  }
}

- (void)updateSharingAllowList:(id)a3 denyList:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      v17 = objc_msgSend(v6, "count");
      v18 = 2048;
      v19 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Got new allow list data, count: %lu, deny list count: %lu", buf, 0x16u);
    }

  }
  -[IMNicknameController setAllowListedHandlesForSharing:](self, "setAllowListedHandlesForSharing:", v6);
  -[IMNicknameController setDenyListedHandlesForSharing:](self, "setDenyListedHandlesForSharing:", v7);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMNicknameController handledNicknames](self, "handledNicknames", CFSTR("handleIDs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("__kIMNicknameDidChangeNotification"), 0, v13);

  if (!v11)
}

- (void)updateTransitionedNicknameHandles:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Got new transitioned list data, count: %@", (uint8_t *)&v7, 0xCu);

    }
  }
  -[IMNicknameController setTransitionedHandles:](self, "setTransitionedHandles:", v4);

}

- (void)updateIsActiveList:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14[0] = CFSTR("activeRecords");
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = CFSTR("previousActiveRecords");
  v15[0] = v5;
  -[IMNicknameController activeRecords](self, "activeRecords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)

  if (!v4)
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("__kIMActiveNicknamesDidChangeNotification"), 0, v9);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = 134217984;
      v13 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Got new active list data, count: %lu", (uint8_t *)&v12, 0xCu);
    }

  }
  -[IMNicknameController setActiveRecords:](self, "setActiveRecords:", v4);

}

- (void)updateIsIgnoredList:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 134217984;
      v7 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Got new ignored list data, count: %lu", (uint8_t *)&v6, 0xCu);
    }

  }
  -[IMNicknameController setIgnoredRecords:](self, "setIgnoredRecords:", v4);

}

- (id)_handleIDsForHandle:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (v3)
  {
    objc_msgSend(v3, "ID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    objc_msgSend(v3, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D397A8], "phoneNumbersForCNContact:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D397A8], "emailsForCNContact:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v27;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v27 != v12)
              objc_enumerationMutation(v9);
            IMCanonicalizeFormattedString();
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v14);

            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        }
        while (v11);
      }

    }
    if (objc_msgSend(v8, "count"))
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v15 = v8;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v23;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v23 != v18)
              objc_enumerationMutation(v15);
            IMCanonicalizeFormattedString();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v20, v22);

            ++v19;
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        }
        while (v17);
      }

    }
  }

  return v4;
}

- (void)updatePendingNicknameForHandleIDs:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearPendingNicknamePhotoUpdateForHandleIDs:", v3);

}

- (void)setPersonalNicknameFromOnboardingResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const __CFString *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  NSObject *v26;
  void *v27;
  int v28;
  const __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[IMNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled"))
  {
    if (-[IMNicknameController _canUpdatePersonalNickname](self, "_canUpdatePersonalNickname"))
    {
      objc_msgSend(MEMORY[0x1E0D398E8], "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSharingEnabled:", 1);

      objc_msgSend(MEMORY[0x1E0D398E8], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSharingAudience:", objc_msgSend(v4, "sharingAudience"));

      v7 = objc_msgSend(v4, "didPersistImageToContact");
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = CFSTR("YES");
          if (v7)
            v9 = CFSTR("NO");
          v28 = 138412290;
          v29 = v9;
          _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Nickname photo forked in onboarding: %@", (uint8_t *)&v28, 0xCu);
        }

      }
      -[IMNicknameController meCardSharingState](self, "meCardSharingState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setImageForkedFromMeCard:", v7 ^ 1u);

      v11 = objc_alloc_init(MEMORY[0x1E0C97360]);
      objc_msgSend(v4, "givenName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMNicknameController truncateNameIfNeeded:](self, "truncateNameIfNeeded:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "familyName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMNicknameController truncateNameIfNeeded:](self, "truncateNameIfNeeded:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setGivenName:", v13);
      objc_msgSend(v11, "setFamilyName:", v15);
      objc_msgSend(v4, "imageData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v18 = CFSTR("YES");
          if (!v16)
            v18 = CFSTR("NO");
          v28 = 138412290;
          v29 = v18;
          _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_INFO, "Onboarding result has imageData: %@", (uint8_t *)&v28, 0xCu);
        }

      }
      if (v16)
      {
        objc_msgSend(v4, "cropRect");
        v19 = (void *)IMCroppedImageDataFromDataWithCropRect();

        objc_msgSend(v11, "setImageData:", v19);
      }
      else
      {
        v19 = 0;
      }
      objc_msgSend(v4, "wallpaper");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWallpaper:", v23);

      objc_msgSend(v4, "watchWallpaperImageData");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWatchWallpaperImageData:", v24);

      v25 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39980]), "initWithMeContact:", v11);
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v28 = 138412290;
          v29 = v25;
          _os_log_impl(&dword_1A1FF4000, v26, OS_LOG_TYPE_INFO, "Setting personal nickname after onboarding to %@", (uint8_t *)&v28, 0xCu);
        }

      }
      -[IMNicknameController setPersonalNickname:](self, "setPersonalNickname:", v25);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "postNotificationName:object:", CFSTR("__kIMNicknameOnboardingDidFinishNotification"), 0);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend((id)objc_opt_class(), "multiplePhoneNumbersTiedToAppleID"));
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v28 = 138412290;
        v29 = v22;
        _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_INFO, "We can't set the personal nickname after onboarding - multiplePhoneNumbers: %@", (uint8_t *)&v28, 0xCu);

      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "Nickname feature is disabled, don't set personal nickname after onboarding", (uint8_t *)&v28, 2u);
    }

  }
}

- (void)updatePersonalNicknameIfNecessaryWithMeCardSharingResult:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  __CFString *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  NSObject *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  int v39;
  int v40;
  NSObject *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  __CFString *v49;
  __CFString *v50;
  NSObject *v51;
  void *v52;
  uint8_t buf[4];
  const __CFString *v54;
  __int16 v55;
  const __CFString *v56;
  __int16 v57;
  const __CFString *v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[IMNicknameController _nicknameFeatureEnabled](self, "_nicknameFeatureEnabled"))
  {
    if (-[IMNicknameController _canUpdatePersonalNickname](self, "_canUpdatePersonalNickname"))
    {
      -[IMNicknameController meCardSharingState](self, "meCardSharingState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "nameForkedFromMeCard");

      if ((v6 & 1) != 0)
      {
LABEL_22:
        -[IMNicknameController meCardSharingState](self, "meCardSharingState");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "imageForkedFromMeCard");

        v22 = objc_msgSend(v4, "didSaveImageToMeCard");
        if (v21 == v22)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              v24 = CFSTR("YES");
              if (v22)
                v24 = CFSTR("NO");
              *(_DWORD *)buf = 138412290;
              v54 = v24;
              _os_log_impl(&dword_1A1FF4000, v23, OS_LOG_TYPE_INFO, "Nickname photo now forked: %@", buf, 0xCu);
            }

          }
          -[IMNicknameController meCardSharingState](self, "meCardSharingState");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setImageForkedFromMeCard:", v22 ^ 1u);

        }
        v26 = objc_alloc_init(MEMORY[0x1E0C97360]);
        objc_msgSend(v4, "givenName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMNicknameController truncateNameIfNeeded:](self, "truncateNameIfNeeded:", v27);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "familyName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMNicknameController truncateNameIfNeeded:](self, "truncateNameIfNeeded:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "setGivenName:", v52);
        objc_msgSend(v26, "setFamilyName:", v29);
        -[IMNicknameController personalNickname](self, "personalNickname");
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "contactImage");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31
          && (objc_msgSend(v4, "contactImage"),
              v32 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v32, "imageData"),
              v33 = (void *)objc_claimAutoreleasedReturnValue(),
              v34 = v33 == 0,
              v33,
              v32,
              v34))
        {
          v40 = 0;
          v36 = 0;
          v39 = 1;
        }
        else
        {
          -[__CFString avatar](v30, "avatar");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "imageData");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            objc_msgSend(v4, "contactImage");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "imageData");
            v38 = objc_claimAutoreleasedReturnValue();

            v39 = 0;
            v40 = 1;
            v36 = (void *)v38;
          }
          else
          {
            v39 = 0;
            v40 = 0;
          }
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            v42 = CFSTR("YES");
            if (v31)
              v43 = CFSTR("YES");
            else
              v43 = CFSTR("NO");
            if (v39)
              v44 = CFSTR("YES");
            else
              v44 = CFSTR("NO");
            *(_DWORD *)buf = 138412802;
            v54 = v43;
            v55 = 2112;
            v56 = v44;
            if (!v40)
              v42 = CFSTR("NO");
            v57 = 2112;
            v58 = v42;
            _os_log_impl(&dword_1A1FF4000, v41, OS_LOG_TYPE_INFO, "imageUpdated = %@, imageDeleted = %@, shouldCrop = %@", buf, 0x20u);
          }

        }
        if (v40)
        {
          objc_msgSend(v4, "contactImage");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "cropRect");
          v46 = IMCroppedImageDataFromDataWithCropRect();

          v36 = (void *)v46;
        }
        objc_msgSend(v26, "setImageData:", v36);
        objc_msgSend(v4, "wallpaper");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setWallpaper:", v47);

        objc_msgSend(v4, "watchWallpaperImageData");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setWatchWallpaperImageData:", v48);

        v49 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39980]), "initWithMeContact:", v26);
        v50 = v49;
        if (!v30
          || (v39 | -[__CFString isUpdateFromNickname:withOptions:](v49, "isUpdateFromNickname:withOptions:", v30, 8)) == 1)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v54 = v30;
              v55 = 2112;
              v56 = v50;
              _os_log_impl(&dword_1A1FF4000, v51, OS_LOG_TYPE_INFO, "Updating personal nickname from %@ to %@", buf, 0x16u);
            }

          }
          -[IMNicknameController setPersonalNickname:](self, "setPersonalNickname:", v50);
        }

        goto LABEL_58;
      }
      -[IMNicknameController contactStore](self, "contactStore");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D397A8], "keysForNicknameHandling");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fetchMeContactWithKeys:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "givenName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "givenName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) != 0)
      {
        objc_msgSend(v9, "familyName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "familyName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if ((v14 & 1) != 0)
        {
LABEL_21:

          goto LABEL_22;
        }
      }
      else
      {

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1FF4000, v18, OS_LOG_TYPE_INFO, "Nickname name now forked", buf, 2u);
        }

      }
      -[IMNicknameController meCardSharingState](self, "meCardSharingState");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setNameForkedFromMeCard:", 1);

      goto LABEL_21;
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend((id)objc_opt_class(), "multiplePhoneNumbersTiedToAppleID"));
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v54 = v17;
        _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_INFO, "We can't update the personal nickname if necessary - multiplePhoneNumbers: %@", buf, 0xCu);

      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_INFO, "Nickname feature is disabled, don't update personal nickname with me card sharing result", buf, 2u);
    }

  }
LABEL_58:

}

- (id)truncateNameIfNeeded:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") < 0xC9)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(v3, "substringToIndex:", 200);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)daemonController
{
  return +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
}

- (id)meCardSharingState
{
  return (id)objc_msgSend(MEMORY[0x1E0D398E8], "sharedInstance");
}

- (id)contactStore
{
  return (id)objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
}

- (void)markAllAsPending
{
  id v2;

  -[IMNicknameController daemonController](self, "daemonController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markAllNicknamesAsPending");

}

- (NSMutableDictionary)responseHandlers
{
  return self->_responseHandlers;
}

- (void)setResponseHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_responseHandlers, a3);
}

- (IMNickname)personalNickname
{
  return self->_personalNickname;
}

- (NSDictionary)pendingNicknameUpdates
{
  return self->_pendingNicknameUpdates;
}

- (void)setPendingNicknameUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_pendingNicknameUpdates, a3);
}

- (NSDictionary)handledNicknames
{
  return self->_handledNicknames;
}

- (void)setHandledNicknames:(id)a3
{
  objc_storeStrong((id *)&self->_handledNicknames, a3);
}

- (NSDictionary)archivedNicknames
{
  return self->_archivedNicknames;
}

- (void)setArchivedNicknames:(id)a3
{
  objc_storeStrong((id *)&self->_archivedNicknames, a3);
}

- (NSSet)allowListedHandlesForSharing
{
  return self->_allowListedHandlesForSharing;
}

- (void)setAllowListedHandlesForSharing:(id)a3
{
  objc_storeStrong((id *)&self->_allowListedHandlesForSharing, a3);
}

- (NSSet)denyListedHandlesForSharing
{
  return self->_denyListedHandlesForSharing;
}

- (void)setDenyListedHandlesForSharing:(id)a3
{
  objc_storeStrong((id *)&self->_denyListedHandlesForSharing, a3);
}

- (NSSet)transitionedHandles
{
  return self->_transitionedHandles;
}

- (void)setTransitionedHandles:(id)a3
{
  objc_storeStrong((id *)&self->_transitionedHandles, a3);
}

- (NSDictionary)activeRecords
{
  return self->_activeRecords;
}

- (void)setActiveRecords:(id)a3
{
  objc_storeStrong((id *)&self->_activeRecords, a3);
}

- (NSDictionary)ignoredRecords
{
  return self->_ignoredRecords;
}

- (void)setIgnoredRecords:(id)a3
{
  objc_storeStrong((id *)&self->_ignoredRecords, a3);
}

- (NSMutableSet)scrutinyNicknameHandles
{
  return self->_scrutinyNicknameHandles;
}

- (void)setScrutinyNicknameHandles:(id)a3
{
  objc_storeStrong((id *)&self->_scrutinyNicknameHandles, a3);
}

- (BOOL)isInitialLoad
{
  return self->_isInitialLoad;
}

- (void)setIsInitialLoad:(BOOL)a3
{
  self->_isInitialLoad = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrutinyNicknameHandles, 0);
  objc_storeStrong((id *)&self->_ignoredRecords, 0);
  objc_storeStrong((id *)&self->_activeRecords, 0);
  objc_storeStrong((id *)&self->_transitionedHandles, 0);
  objc_storeStrong((id *)&self->_denyListedHandlesForSharing, 0);
  objc_storeStrong((id *)&self->_allowListedHandlesForSharing, 0);
  objc_storeStrong((id *)&self->_archivedNicknames, 0);
  objc_storeStrong((id *)&self->_handledNicknames, 0);
  objc_storeStrong((id *)&self->_pendingNicknameUpdates, 0);
  objc_storeStrong((id *)&self->_personalNickname, 0);
  objc_storeStrong((id *)&self->_responseHandlers, 0);
}

@end
