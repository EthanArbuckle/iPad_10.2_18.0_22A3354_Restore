@implementation IMHandle

- (id)immediateNameWithNeedsSuggestedNameFetch:(BOOL *)a3 useSuggestedName:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  char v17;
  NSString *v18;
  NSObject *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  NSString *firstName;
  NSString *v26;
  NSString *fullName;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  NSObject *v43;
  id v44;
  void *v45;
  _BOOL4 v46;
  NSObject *v47;
  int IsEmail;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  uint8_t v60[8];
  _QWORD v61[4];
  id v62;
  IMHandle *v63;
  id v64;
  _BYTE buf[24];
  uint64_t v66;

  v4 = a4;
  v66 = *MEMORY[0x1E0C80C00];
  -[IMHandle cnContact](self, "cnContact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[IMHandle ID](self, "ID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v9;
        _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_DEBUG, "DisplayName: Refetching Contact for id: %@", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMHandle ID](self, "ID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchCNContactForHandleWithID:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v7 = 0;
      if (-[IMHandle isAnonymous](self, "isAnonymous"))
        goto LABEL_9;
      v17 = 1;
      v12 = 0;
      goto LABEL_19;
    }
    -[IMHandle updateCNContact:](self, "updateCNContact:", v7);
  }
  if (-[IMHandle isAnonymous](self, "isAnonymous"))
  {
LABEL_9:
    -[IMHandle resource](self, "resource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length") == 0;
    v14 = IMOSLoggingEnabled();
    if (v13)
    {
      if (v14)
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1FF4000, v19, OS_LOG_TYPE_DEBUG, "DisplayName: Returning displayID since handle is anonymous", buf, 2u);
        }

      }
      -[IMHandle displayID](self, "displayID");
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_47;
    }
    if (!v14)
      goto LABEL_24;
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_DEBUG, "DisplayName: Returning resource since handle is anonymous", buf, 2u);
    }
    goto LABEL_23;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v16, OS_LOG_TYPE_DEBUG, "DisplayName: Getting display name from Contact", buf, 2u);
    }

  }
  -[IMHandle _displayNameWithContact:](self, "_displayNameWithContact:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
LABEL_19:
  if (objc_msgSend(v12, "length"))
  {
    if (!IMOSLoggingEnabled())
    {
LABEL_24:
      v18 = v12;
      v12 = v18;
LABEL_47:
      v21 = v18;
      goto LABEL_48;
    }
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v12;
      _os_log_impl(&dword_1A1FF4000, v15, OS_LOG_TYPE_DEBUG, "DisplayName: found displayName: %@", buf, 0xCu);
    }
LABEL_23:

    goto LABEL_24;
  }
  if (!-[IMHandle isLoginIMHandle](self, "isLoginIMHandle"))
    goto LABEL_39;
  +[IMMe me](IMMe, "me");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fullName");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v21, "length"))
  {

LABEL_39:
    if (-[IMHandle _hasServiceNameProperties](self, "_hasServiceNameProperties"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1FF4000, v23, OS_LOG_TYPE_DEBUG, "DisplayName: Using Service name properties", buf, 2u);
        }

      }
      if (-[NSString length](self->_fullName, "length"))
        goto LABEL_45;
      if (-[NSString length](self->_firstName, "length") && !-[NSString length](self->_lastName, "length"))
      {
        firstName = self->_firstName;
        goto LABEL_46;
      }
      if (!-[NSString length](self->_firstName, "length") && -[NSString length](self->_lastName, "length"))
      {
        firstName = self->_lastName;
        goto LABEL_46;
      }
      if (!-[NSString length](self->_firstName, "length")
        && !-[NSString length](self->_lastName, "length")
        && -[NSString length](self->_nickname, "length"))
      {
        firstName = self->_nickname;
        goto LABEL_46;
      }
      if (-[NSString length](self->_firstName, "length") && -[NSString length](self->_lastName, "length"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), self->_firstName, self->_lastName);
        v26 = (NSString *)objc_claimAutoreleasedReturnValue();
        fullName = self->_fullName;
        self->_fullName = v26;

      }
      if (-[NSString length](self->_fullName, "length"))
      {
LABEL_45:
        firstName = self->_fullName;
LABEL_46:
        v18 = firstName;
        goto LABEL_47;
      }
    }
    -[IMHandle suggestedName](self, "suggestedName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v4 && objc_msgSend(v28, "length") && -[IMHandle _allowedByScreenTime](self, "_allowedByScreenTime"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v29;
          _os_log_impl(&dword_1A1FF4000, v30, OS_LOG_TYPE_DEBUG, "DisplayName: Using suggested name %@", buf, 0xCu);
        }

      }
      v21 = v29;
      goto LABEL_132;
    }
    if (a3 && !v29)
    {
      v60[0] = 0;
      +[IMSuggestionsService sharedInstance](IMSuggestionsService, "sharedInstance");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMHandle displayID](self, "displayID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "suggestedNameFromCache:wasFound:", v32, v60);
      v21 = (id)objc_claimAutoreleasedReturnValue();

      if (v60[0] && objc_msgSend(v21, "length"))
      {
        -[IMHandle setSuggestedName:](self, "setSuggestedName:", v21);
        if (v4)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = 0;
              _os_log_impl(&dword_1A1FF4000, v33, OS_LOG_TYPE_DEBUG, "DisplayName: Using cached suggested name %@", buf, 0xCu);
            }

          }
          goto LABEL_132;
        }
      }
      else
      {
        *a3 = 1;
      }

    }
    if (-[IMHandle isBusiness](self, "isBusiness"))
    {
      -[IMHandle displayID](self, "displayID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = 0;
      objc_initWeak((id *)buf, self);
      +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = sub_1A209BD3C;
      v61[3] = &unk_1E4720710;
      objc_copyWeak(&v64, (id *)buf);
      v36 = v34;
      v62 = v36;
      v63 = self;
      objc_msgSend(v35, "businessNameForUID:updateHandler:", v36, v61);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v60 = 0;
          _os_log_impl(&dword_1A1FF4000, v38, OS_LOG_TYPE_DEBUG, "DisplayName: Using biz name", v60, 2u);
        }

      }
      if (v37)
      {
        v21 = v37;
      }
      else
      {
        v58 = (void *)MEMORY[0x1E0D396F8];
        -[IMHandle ID](self, "ID");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "placeholderNameForBrandURI:", v59);
        v21 = (id)objc_claimAutoreleasedReturnValue();

      }
      objc_destroyWeak(&v64);
      objc_destroyWeak((id *)buf);

      goto LABEL_132;
    }
    if ((v17 & 1) != 0)
    {
      -[IMHandle ID](self, "ID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = MEMORY[0x1A858280C]();

      -[IMHandle ID](self, "ID");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        IMFormattedDisplayStringForNumber();
        v42 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        IsEmail = IMStringIsEmail();

        if (IsEmail)
        {
          -[IMHandle ID](self, "ID");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          IMFormattedDisplayStringForNumber();
          v42 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v42 = 0;
        }
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D397A8], "displayNameWithPhoneNumberOrEmailForContact:", v7);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (objc_msgSend(v42, "length"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1FF4000, v43, OS_LOG_TYPE_DEBUG, "DisplayName: Using formattedDisplayName", buf, 2u);
        }

      }
      v44 = v42;
LABEL_94:
      v21 = v44;
LABEL_95:

LABEL_132:
      goto LABEL_48;
    }
    -[IMHandle ID](self, "ID");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "length") == 0;

    if (v46)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1FF4000, v50, OS_LOG_TYPE_DEBUG, "DisplayName: Using ID", buf, 2u);
        }

      }
      sub_1A20F1964();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("Buddy Name"), &stru_1E4725068, CFSTR("IMCoreLocalizable"));
      v21 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_95;
    }
    if (-[IMHandle hasServer](self, "hasServer"))
    {
      -[IMHandle _IDWithTrimmedServer](self, "_IDWithTrimmedServer");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "length"))
      {
        if (!IMOSLoggingEnabled())
          goto LABEL_95;
        OSLogHandleForIMFoundationCategory();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1FF4000, v47, OS_LOG_TYPE_DEBUG, "DisplayName: Using ID from Server", buf, 2u);
        }
LABEL_102:

        goto LABEL_95;
      }

    }
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "stewieEnabled");

    if (v53)
    {
      if (-[IMHandle isStewieEmergency](self, "isStewieEmergency"))
      {
        sub_1A20F1964();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("STEWIE_EMERGENCY_SOS_HANDLE"), &stru_1E4725068, CFSTR("IMCoreLocalizable-SOS"));
        v21 = (id)objc_claimAutoreleasedReturnValue();

        if (!IMOSLoggingEnabled())
          goto LABEL_95;
        OSLogHandleForIMFoundationCategory();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1FF4000, v47, OS_LOG_TYPE_DEBUG, "DisplayName: Using Stewie emergency name", buf, 2u);
        }
        goto LABEL_102;
      }
      if (-[IMHandle isStewieRoadside](self, "isStewieRoadside"))
      {
        +[IMChorosMonitor sharedInstance](IMChorosMonitor, "sharedInstance");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMHandle ID](self, "ID");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "roadsideProviderNameForChatIdentifier:", v56);
        v21 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_95;
      }
    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v57, OS_LOG_TYPE_DEBUG, "DisplayName: Last resort displayID", buf, 2u);
      }

    }
    -[IMHandle displayID](self, "displayID");
    v44 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_94;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v22, OS_LOG_TYPE_DEBUG, "DisplayName: Using IMMe's FullName", buf, 2u);
    }

  }
LABEL_48:

  return v21;
}

- (BOOL)isAnonymous
{
  return self->_isAnonymous;
}

- (id)_displayNameWithContact:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D397A8], "displayNameWithCNNickNameOrFullNameOrCompanyNameOrAbbreviatedForContact:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[IMHandle _displayNameWithNicknameIfAvailable](self, "_displayNameWithNicknameIfAvailable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7;
    if (v7)
      v8 = v7;

  }
  return v6;
}

- (id)existingChatSiblingsArray
{
  void *v3;
  void *v4;

  +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_existingChatSiblingsForHandle:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)originalID
{
  return self->_uncanonicalID;
}

- (NSString)countryCode
{
  NSString *countryCode;

  countryCode = self->_countryCode;
  if (countryCode)
    return countryCode;
  IMCountryCodeForIncomingTextMessage();
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)ID
{
  return self->_id;
}

- (NSString)personCentricID
{
  return self->_personCentricID;
}

- (void)scheduleSuggestedNameFetchIfNecessary
{
  void *v3;

  if (!-[IMHandle hasCheckedForSuggestions](self, "hasCheckedForSuggestions"))
  {
    +[IMSuggestionsService sharedInstance](IMSuggestionsService, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scheduleFetchIfNecessaryForHandle:", self);

    MEMORY[0x1E0DE7D20](self, sel_setHasCheckedForSuggestions_);
  }
}

- (BOOL)hasCheckedForSuggestions
{
  return self->_hasCheckedForSuggestions;
}

- (void)setPersonCentricID:(id)a3
{
  objc_storeStrong((id *)&self->_personCentricID, a3);
}

- (void)_setOriginalID:(id)a3 countryCode:(id)a4 updateSiblings:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a5;
  v9 = a3;
  v8 = a4;
  if (v9 && (IMSharedHelperAreObjectsLogicallySame() & 1) == 0)
    -[IMHandle _setOriginalID:updateSiblings:](self, "_setOriginalID:updateSiblings:", v9, v5);
  -[IMHandle _setCountryCode:updateSiblings:](self, "_setCountryCode:updateSiblings:", v8, v5);

}

- (void)_setCountryCode:(id)a3 updateSiblings:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSString *v7;
  NSString *countryCode;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  IMHandle *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    if ((IMSharedHelperAreObjectsLogicallySame() & 1) == 0)
    {
      v7 = (NSString *)objc_msgSend(v6, "copy");
      countryCode = self->_countryCode;
      self->_countryCode = v7;

      if (v4)
      {
        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        -[IMHandle existingChatSiblingsArray](self, "existingChatSiblingsArray", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v16;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v16 != v12)
                objc_enumerationMutation(v9);
              v14 = *(IMHandle **)(*((_QWORD *)&v15 + 1) + 8 * v13);
              if (v14 != self)
                -[IMHandle _setCountryCode:updateSiblings:](v14, "_setCountryCode:updateSiblings:", v6, 0);
              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          }
          while (v11);
        }

      }
    }
  }

}

- (void)associatedBusinessIDChanged
{
  if (-[IMHandle isStewieRoadside](self, "isStewieRoadside"))
    -[IMHandle _fetchBrandInfoForRoadside](self, "_fetchBrandInfoForRoadside");
}

- (IMHandle)initWithAccount:(id)a3 ID:(id)a4 alreadyCanonical:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  IMHandle *v11;
  void *v12;
  uint64_t v13;
  void *id;
  uint64_t v15;
  NSString *v16;
  uint64_t v17;
  NSString *uncanonicalID;
  void *v19;
  void *v20;
  IMHandle *v21;
  uint64_t v22;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v11 = -[IMHandle init](self, "init");
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D36AE8], "IMCoreSetupTimingCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startTimingForKey:", CFSTR("IMCoreSetup: IMHandle init"));
    objc_storeStrong((id *)&v11->_account, a3);
    if (v5)
    {
      v13 = objc_msgSend(v10, "copy");
      id = v11->_id;
      v11->_id = (NSString *)v13;
    }
    else
    {
      objc_msgSend(v9, "canonicalFormOfID:", v10);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v11->_id;
      v11->_id = (NSString *)v15;

      if ((objc_msgSend(v10, "isEqualToString:", v11->_id) & 1) != 0)
      {
LABEL_7:
        v11->_resourceIndex = 0x7FFFFFFFFFFFFFFFLL;
        v11->_capabilities = objc_msgSend(v9, "capabilities");
        if (v11->_id && v11->_account)
        {
          +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "registerIMHandle:", v11);

          -[IMHandle account](v11, "account");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "registerIMHandle:", v11);

          -[IMHandle _registerForNotifications](v11, "_registerForNotifications");
        }
        objc_msgSend(v12, "stopTimingForKey:", CFSTR("IMCoreSetup: IMHandle init"));
        if (-[IMHandle isMapKitBusiness](v11, "isMapKitBusiness"))
        {
          v21 = v11;
          v22 = 1;
LABEL_16:
          -[IMHandle _fetchBrandInfoForBusiness:](v21, "_fetchBrandInfoForBusiness:", v22);
          goto LABEL_17;
        }
        if (-[IMHandle isStewieRoadside](v11, "isStewieRoadside"))
        {
          -[IMHandle _fetchBrandInfoForRoadside](v11, "_fetchBrandInfoForRoadside");
        }
        else if (-[IMHandle isChatBot](v11, "isChatBot"))
        {
          v21 = v11;
          v22 = 2;
          goto LABEL_16;
        }
LABEL_17:

        goto LABEL_18;
      }
      IMCleanupPhoneNumber();
      id = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(id, "copy");
      uncanonicalID = v11->_uncanonicalID;
      v11->_uncanonicalID = (NSString *)v17;

    }
    goto LABEL_7;
  }
LABEL_18:

  return v11;
}

- (BOOL)isStewieRoadside
{
  void *v2;
  char v3;

  -[IMHandle ID](self, "ID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = IMIsStringStewieRoadside();

  return v3;
}

- (id)imHandleForOtherAccount:(id)a3
{
  id v4;
  id v5;
  NSDictionary *otherServiceIDs;
  void *v7;
  void *v8;
  IMHandle *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  IMHandle *v17;
  IMHandle *v18;
  void *v19;

  v4 = a3;
  if (v4)
  {
    -[IMHandle account](self, "account");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 != v4)
    {
      otherServiceIDs = self->_otherServiceIDs;
      objc_msgSend(v4, "internalName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKey:](otherServiceIDs, "objectForKey:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v4, "imHandleWithID:", v8);
        v9 = (IMHandle *)objc_claimAutoreleasedReturnValue();
LABEL_21:

        goto LABEL_22;
      }
      -[IMHandle service](self, "service");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "service");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 == v11)
        goto LABEL_11;
      -[IMHandle service](self, "service");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "supportsMessaging"))
      {
        -[IMHandle service](self, "service");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "supportsCanonicalHandles"))
        {
          objc_msgSend(v4, "service");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v14, "supportsMessaging") & 1) != 0)
          {
            objc_msgSend(v4, "service");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "supportsCanonicalHandles");

            if (v16)
            {
LABEL_11:
              -[IMHandle ID](self, "ID");
              v17 = (IMHandle *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "imHandleWithID:alreadyCanonical:", v17, 1);
              v18 = (IMHandle *)objc_claimAutoreleasedReturnValue();
              goto LABEL_19;
            }
LABEL_15:
            objc_msgSend(v4, "service");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMHandle bestIMHandleForService:](self, "bestIMHandleForService:", v19);
            v17 = (IMHandle *)objc_claimAutoreleasedReturnValue();

            if (v17 == self)
            {
              v18 = self;
            }
            else
            {
              if (!v17)
              {
                v9 = 0;
                goto LABEL_20;
              }
              -[IMHandle imHandleForOtherAccount:](v17, "imHandleForOtherAccount:", v4);
              v18 = (IMHandle *)objc_claimAutoreleasedReturnValue();
            }
LABEL_19:
            v9 = v18;
LABEL_20:

            goto LABEL_21;
          }

        }
      }

      goto LABEL_15;
    }
  }
  v9 = self;
LABEL_22:

  return v9;
}

- (IMAccount)account
{
  return self->_account;
}

- (IMHandle)init
{
  IMHandle *v2;
  uint64_t v3;
  NSString *guid;
  NSString *statusMsg;
  NSString *prevStatusMsg;
  void *v7;
  uint64_t v8;
  NSString *countryCode;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IMHandle;
  v2 = -[IMHandle init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x1E0CB3940], "copyStringGUIDForObject:", v2);
    guid = v2->_guid;
    v2->_guid = (NSString *)v3;

    v2->_isAnonymous = 0;
    *(_WORD *)&v2->_isMobile = 0;
    v2->_status = 0;
    statusMsg = v2->_statusMsg;
    v2->_statusMsg = (NSString *)&stru_1E4725068;

    prevStatusMsg = v2->_prevStatusMsg;
    v2->_prevStatusMsg = (NSString *)&stru_1E4725068;

    IMCountryCodeForIncomingTextMessage();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    countryCode = v2->_countryCode;
    v2->_countryCode = (NSString *)v8;

  }
  return v2;
}

- (id)displayNameForChat:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  id *p_cachedDisplayNameWithAbbreviation;
  NSString *cachedDisplayNameWithAbbreviation;
  void *v28;
  NSObject *v29;
  id v30;
  int v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v32 = 138412290;
      v33 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_DEBUG, "Calculating displayName for chat: %@", (uint8_t *)&v32, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isTranscriptSharingEnabled");

  if (v7 && objc_msgSend(v4, "isStewieSharingChat"))
  {
    -[IMHandle immediateNameWithNeedsSuggestedNameFetch:useSuggestedName:](self, "immediateNameWithNeedsSuggestedNameFetch:useSuggestedName:", 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[IMHandle _unformattedPhoneNumber](self, "_unformattedPhoneNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) != 0)
    {
      objc_msgSend(v4, "stewieSharingSuggestedName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12 == 0;

      if (!v13)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v4, "stewieSharingSuggestedName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = 138412290;
            v33 = v15;
            _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_DEBUG, "Returning transcript sharing suggested name: %@", (uint8_t *)&v32, 0xCu);

          }
        }
        objc_msgSend(v4, "stewieSharingSuggestedName");
        v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_34:
        v19 = v16;

        goto LABEL_55;
      }
    }
    else
    {

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v32 = 138412290;
        v33 = v8;
        _os_log_impl(&dword_1A1FF4000, v23, OS_LOG_TYPE_DEBUG, "Found name: %@ for stewie sharing chat", (uint8_t *)&v32, 0xCu);
      }

    }
    v16 = v8;
    goto LABEL_34;
  }
  if (!-[IMHandle isBusiness](self, "isBusiness") && !-[IMHandle isStewie](self, "isStewie"))
  {
    -[IMHandle cnContact](self, "cnContact");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      if (objc_msgSend(v4, "chatStyle") == 45)
      {
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            -[IMHandle name](self, "name");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = 138412290;
            v33 = v22;
            _os_log_impl(&dword_1A1FF4000, v21, OS_LOG_TYPE_DEBUG, "Chat style is instantMessageChatStyle, returning name: %@", (uint8_t *)&v32, 0xCu);

          }
        }
      }
      else
      {
        p_cachedDisplayNameWithAbbreviation = (id *)&self->_cachedDisplayNameWithAbbreviation;
        cachedDisplayNameWithAbbreviation = self->_cachedDisplayNameWithAbbreviation;
        if (!cachedDisplayNameWithAbbreviation)
        {
          if (objc_msgSend(MEMORY[0x1E0D397A8], "shouldShowAbbreviatedNames"))
          {
            objc_msgSend(MEMORY[0x1E0D397A8], "abbreviatedNameForCNContact:", v20);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v28 = 0;
          }
          if (objc_msgSend(v28, "length"))
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                v32 = 138412290;
                v33 = v28;
                _os_log_impl(&dword_1A1FF4000, v29, OS_LOG_TYPE_DEBUG, "Found short name, setting _cachedDisplayNameWithAbbreviation to: %@", (uint8_t *)&v32, 0xCu);
              }

            }
            objc_storeStrong((id *)&self->_cachedDisplayNameWithAbbreviation, v28);
          }

          cachedDisplayNameWithAbbreviation = (NSString *)*p_cachedDisplayNameWithAbbreviation;
        }
        if (-[NSString length](cachedDisplayNameWithAbbreviation, "length"))
        {
          v30 = *p_cachedDisplayNameWithAbbreviation;
LABEL_54:
          v19 = v30;

          goto LABEL_55;
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        -[IMHandle name](self, "name");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = 138412290;
        v33 = v25;
        _os_log_impl(&dword_1A1FF4000, v24, OS_LOG_TYPE_DEBUG, "No contact found, returning self.name: %@", (uint8_t *)&v32, 0xCu);

      }
    }
    -[IMHandle name](self, "name");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_54;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      -[IMHandle name](self, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 138412290;
      v33 = v18;
      _os_log_impl(&dword_1A1FF4000, v17, OS_LOG_TYPE_DEBUG, "Found name: %@ for stewie or business chat", (uint8_t *)&v32, 0xCu);

    }
  }
  -[IMHandle name](self, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_55:

  return v19;
}

- (id)cnContactWithKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  CNContact *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (!-[IMHandle isBusiness](self, "isBusiness"))
  {
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isTranscriptSharingEnabled");

    if (!v7 || !-[IMHandle isStewieTranscriptSharingHandle](self, "isStewieTranscriptSharingHandle"))
    {
      v8 = self->_cnContact;
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "completedContact:withKeys:", v8, v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
          goto LABEL_9;
      }
      -[NSString im_stripCategoryLabel](self->_id, "im_stripCategoryLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v10, "length"))
      {

        v5 = 0;
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fetchCNContactForHandleID:withKeys:", v10, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
LABEL_9:
        -[IMHandle updateCNContact:](self, "updateCNContact:", v5);
LABEL_11:

      goto LABEL_12;
    }
  }
  v5 = 0;
LABEL_12:

  return v5;
}

- (BOOL)isBusiness
{
  return -[IMHandle isMapKitBusiness](self, "isMapKitBusiness") || -[IMHandle isChatBot](self, "isChatBot");
}

- (BOOL)isStewieTranscriptSharingHandle
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTranscriptSharingEnabled");

  if (v4)
  {
    -[IMHandle ID](self, "ID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "hasPrefix:", *MEMORY[0x1E0D394C8]))
    {

      return 1;
    }
    -[IMHandle ID](self, "ID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasSuffix:", *MEMORY[0x1E0D37DC0]);

    if ((v7 & 1) != 0)
      return 1;
  }
  return 0;
}

- (void)updateCNContact:(id)a3
{
  CNContact *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  IMHandle *v15;
  CNContact *v16;
  id v17;
  id location;

  v4 = (CNContact *)a3;
  if (self->_cnContact != v4)
  {
    -[IMHandle setCnContact:](self, "setCnContact:", v4);
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      -[IMHandle setCachedDisplayNameWithAbbreviation:](self, "setCachedDisplayNameWithAbbreviation:", 0);
      if (-[IMHandle isBusiness](self, "isBusiness"))
      {
        v5 = (void *)MEMORY[0x1E0D396F8];
        -[IMHandle ID](self, "ID");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "placeholderNameForBrandURI:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMHandle setCachedName:](self, "setCachedName:", v7);

      }
      else
      {
        -[IMHandle setCachedName:](self, "setCachedName:", 0);
      }
      +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addHandleToCNIDMap:CNContact:", self, v4);

    }
    else
    {
      location = 0;
      objc_initWeak(&location, self);
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = sub_1A209CAAC;
      v14 = &unk_1E4720738;
      objc_copyWeak(&v17, &location);
      v15 = self;
      v16 = v4;
      dispatch_async(MEMORY[0x1E0C80D38], &v11);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
    objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance", v11, v12, v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isBatchFetchingForLaunchCompleted");

    if (v10)
      -[IMHandle sendNotificationABPersonChanged](self, "sendNotificationABPersonChanged");
  }

}

- (CNContact)cnContact
{
  return (CNContact *)-[IMHandle cnContactWithKeys:](self, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
}

- (BOOL)isContact
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isBatchFetchingForLaunchCompleted") & 1) != 0)
  {

  }
  else
  {
    v4 = IMIsRunningInUnitTesting();

    if ((v4 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMHandle ID](self, "ID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isIDAKnownContact:", v8);

      goto LABEL_6;
    }
  }
  v5 = (void *)MEMORY[0x1E0D397A8];
  -[IMHandle cnContactWithKeys:](self, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isCNContactAKnownContact:", v6);
LABEL_6:

  return v7;
}

- (BOOL)isStewie
{
  void *v2;
  char v3;

  -[IMHandle ID](self, "ID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1A8582818]();

  return v3;
}

- (NSString)guid
{
  return self->_guid;
}

- (NSString)name
{
  NSString **p_cachedName;
  NSString *cachedName;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t v12[16];

  p_cachedName = &self->_cachedName;
  cachedName = self->_cachedName;
  if (-[IMHandle isBusiness](self, "isBusiness") && cachedName)
  {
    v5 = self->_cachedName;
    v6 = (void *)MEMORY[0x1E0D396F8];
    -[IMHandle ID](self, "ID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "placeholderNameForBrandURI:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = -[NSString isEqualToString:](v5, "isEqualToString:", v8);

    if ((v5 & 1) == 0)
      goto LABEL_13;
  }
  else if (cachedName)
  {
    goto LABEL_13;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_DEBUG, "No cached name, fetching", v12, 2u);
    }

  }
  -[IMHandle immediateNameWithNeedsSuggestedNameFetch:useSuggestedName:](self, "immediateNameWithNeedsSuggestedNameFetch:useSuggestedName:", 0, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "length"))
    objc_storeStrong((id *)p_cachedName, v10);

LABEL_13:
  if (-[NSString length](*p_cachedName, "length"))
    return *p_cachedName;
  -[IMHandle immediateNameWithNeedsSuggestedNameFetch:useSuggestedName:](self, "immediateNameWithNeedsSuggestedNameFetch:useSuggestedName:", 0, 1);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setCnContact:(id)a3
{
  objc_storeStrong((id *)&self->_cnContact, a3);
}

- (void)setCachedName:(id)a3
{
  objc_storeStrong((id *)&self->_cachedName, a3);
}

- (void)setCachedDisplayNameWithAbbreviation:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDisplayNameWithAbbreviation, a3);
}

- (BOOL)matchesIMHandle:(id)a3
{
  IMHandle *v4;
  IMHandle *v5;
  IMAccount *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  IMHandle *v12;
  void *v13;
  IMHandle *v14;

  v4 = (IMHandle *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    -[IMHandle account](v4, "account");
    v6 = (IMAccount *)objc_claimAutoreleasedReturnValue();
    if (v6 == self->_account)
    {
      v11 = 0;
    }
    else
    {
      v7 = MEMORY[0x1E0C9AA60];
      -[IMHandle cnContactWithKeys:](self, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMHandle cnContactWithKeys:](v5, "cnContactWithKeys:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "_im_isEqualToContact:", v9);

      if ((v10 & 1) != 0)
      {
        v11 = 1;
      }
      else
      {
        -[IMHandle imHandleForOtherAccount:](self, "imHandleForOtherAccount:", v6);
        v12 = (IMHandle *)objc_claimAutoreleasedReturnValue();
        if (v12 == v5)
        {
          v11 = 1;
        }
        else
        {
          -[IMHandle account](self, "account");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[IMHandle imHandleForOtherAccount:](v5, "imHandleForOtherAccount:", v13);
          v14 = (IMHandle *)objc_claimAutoreleasedReturnValue();
          v11 = v14 == self;

        }
      }
    }

  }
  return v11;
}

- (BOOL)shouldQueueNotifications
{
  return self->_notificationQueueCount > 0;
}

- (NSString)suggestedName
{
  return self->_suggestedName;
}

- (void)setHasCheckedForSuggestions:(BOOL)a3
{
  self->_hasCheckedForSuggestions = a3;
}

- (void)postNotificationName:(id)a3
{
  -[IMHandle _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", a3, 0);
}

- (NSString)nickname
{
  void *v3;
  void *v4;
  NSString *v5;
  void *v6;
  void *v8;

  -[IMHandle cnContact](self, "cnContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D397A8], "nickNameForCNContact:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;
LABEL_8:
    v6 = v5;
    goto LABEL_9;
  }
  if (-[IMHandle _hasServiceNameProperties](self, "_hasServiceNameProperties"))
  {
    v5 = self->_nickname;
    goto LABEL_8;
  }
  if (-[IMHandle isLoginIMHandle](self, "isLoginIMHandle"))
  {
    +[IMMe me](IMMe, "me");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nickname");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
LABEL_9:

  return (NSString *)v6;
}

- (BOOL)isStewieEmergency
{
  void *v2;
  char v3;

  -[IMHandle ID](self, "ID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = IMIsStringStewieEmergency();

  return v3;
}

- (BOOL)isLoginIMHandle
{
  IMHandle *v2;
  IMHandle *v3;

  v2 = self;
  -[IMAccount loginIMHandle](self->_account, "loginIMHandle");
  v3 = (IMHandle *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v3 == v2;

  return (char)v2;
}

- (NSString)displayID
{
  NSString *displayID;
  NSString *v3;
  void *v5;
  NSString *v6;
  _BOOL4 v7;
  NSString *id;
  void *v10;
  void *v11;
  NSString *v12;

  displayID = self->_displayID;
  if (!displayID)
  {
    -[IMHandle _formattedPhoneNumber](self, "_formattedPhoneNumber");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v6 = v5;
    }
    else
    {
      v7 = -[IMHandle isBusiness](self, "isBusiness");
      id = self->_id;
      if (!v7)
      {
        if (-[NSString length](id, "length"))
        {
          -[NSString im_stripCategoryLabel](self->_id, "im_stripCategoryLabel");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          MEMORY[0x1A8582830]();
        }
        else
        {
          MEMORY[0x1A8582830](self->_uncanonicalID);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "im_stripCategoryLabel");
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "_appearsToBePhoneNumber"))
        {
          IMFormattedDisplayStringForNumber();
          v12 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v12 = v11;
        }
        v3 = v12;

        goto LABEL_8;
      }
      v6 = id;
    }
    v3 = v6;
LABEL_8:

    return v3;
  }
  v3 = displayID;
  return v3;
}

- (void)_setOriginalID:(id)a3 updateSiblings:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSString *v7;
  NSString *uncanonicalID;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  IMHandle *v14;
  NSString *formattedNumber;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6 && (IMSharedHelperAreObjectsLogicallySame() & 1) == 0)
  {
    v7 = (NSString *)objc_msgSend(v6, "copy");
    uncanonicalID = self->_uncanonicalID;
    self->_uncanonicalID = v7;

    if (v4)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      -[IMHandle existingChatSiblingsArray](self, "existingChatSiblingsArray", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v17;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v17 != v12)
              objc_enumerationMutation(v9);
            v14 = *(IMHandle **)(*((_QWORD *)&v16 + 1) + 8 * v13);
            if (v14 != self)
              -[IMHandle _setOriginalID:updateSiblings:](v14, "_setOriginalID:updateSiblings:", v6, 0);
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v11);
      }

    }
    formattedNumber = self->_formattedNumber;
    self->_formattedNumber = 0;

    -[IMHandle postNotificationName:](self, "postNotificationName:", CFSTR("__kIMHandleInfoChangedNotification"));
  }

}

- (void)_postNotificationName:(id)a3 userInfo:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  if (!self->_blockNotifications && byte_1EE65CD48 != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:userInfo:", a3, self, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "mainThread");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1A200C86C;
    v9[3] = &unk_1E471E7C8;
    v9[4] = self;
    v10 = v6;
    v8 = v6;
    objc_msgSend(v7, "__im_performBlock:", v9);

  }
}

- (void)_postNotification:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *notificationNameQueue;
  NSMutableArray *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  NSMutableArray *notificationQueue;
  NSObject *v11;
  void *v12;
  int v13;
  IMHandle *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[IMHandle shouldQueueNotifications](self, "shouldQueueNotifications"))
  {
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    notificationNameQueue = self->_notificationNameQueue;
    if (!notificationNameQueue)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v8 = self->_notificationNameQueue;
      self->_notificationNameQueue = v7;

      v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      notificationQueue = self->_notificationQueue;
      self->_notificationQueue = v9;

      notificationNameQueue = self->_notificationNameQueue;
    }
    if ((-[NSMutableArray containsObject:](notificationNameQueue, "containsObject:", v5) & 1) == 0)
    {
      -[NSMutableArray addObject:](self->_notificationNameQueue, "addObject:", v5);
      -[NSMutableArray addObject:](self->_notificationQueue, "addObject:", v4);
    }

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v13 = 138412546;
        v14 = self;
        v15 = 2112;
        v16 = v4;
        _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_DEBUG, "%@ is posting %@", (uint8_t *)&v13, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "__mainThreadPostNotification:", v4);

  }
}

- (BOOL)_hasServiceNameProperties
{
  BOOL v3;
  void *v5;

  if (-[NSString length](self->_firstName, "length") || -[NSString length](self->_lastName, "length"))
    return 1;
  if (!-[NSString length](self->_nickname, "length"))
    return 0;
  -[IMHandle ID](self, "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "localizedCompare:", self->_nickname) != 0;

  return v3;
}

- (id)_formattedPhoneNumber
{
  NSString *formattedNumber;
  NSUInteger v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  __CFString *v11;
  NSString *v12;
  id v13;
  void *v14;
  void *v15;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  _WORD v19[2];

  formattedNumber = self->_formattedNumber;
  if (formattedNumber)
    return formattedNumber;
  v5 = -[NSString length](self->_uncanonicalID, "length");
  v6 = 24;
  if (!v5)
    v6 = 16;
  MEMORY[0x1A8582830](*(Class *)((char *)&self->super.isa + v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self->_hasCheckedPhoneNumber)
  {
    if (!self->_phoneNumberRef)
      goto LABEL_18;
  }
  else if (!objc_msgSend(v7, "_appearsToBePhoneNumber"))
  {
LABEL_18:
    v18 = 0;
    goto LABEL_19;
  }
  if (objc_msgSend(v8, "_appearsToBePhoneNumber"))
  {
    IMFormattedNumberForUnformattedNumber();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (const __CFString *)IMCopyStringWithLocalizedNumbers();
    if (v10)
    {
      v11 = (__CFString *)v10;
      if (CFStringGetLength(v10) > 0)
        goto LABEL_15;
      CFRelease(v11);
    }
    v11 = v9;
    v9 = v11;
  }
  else
  {
    v11 = v8;
    v9 = 0;
  }
LABEL_15:
  v12 = self->_formattedNumber;
  self->_formattedNumber = &v11->isa;

  if (!objc_msgSend(v9, "length"))
  {

    goto LABEL_18;
  }
  qmemcpy(v19, ", * ", sizeof(v19));
  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v19[1], 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (NSString *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@%@%@"), v14, v9, v15);
  v17 = self->_formattedNumber;
  self->_formattedNumber = v16;

  v18 = self->_formattedNumber;
LABEL_19:

  return v18;
}

- (NSString)_displayNameWithAbbreviation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id *p_cachedDisplayNameWithAbbreviation;
  NSString *cachedDisplayNameWithAbbreviation;
  void *v9;

  -[IMHandle cnContact](self, "cnContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (objc_msgSend(MEMORY[0x1E0D397A8], "shouldShowNickNames"))
    {
      -[IMHandle nickname](self, "nickname");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
    if (objc_msgSend(v4, "length"))
    {
      v6 = v4;
    }
    else
    {
      p_cachedDisplayNameWithAbbreviation = (id *)&self->_cachedDisplayNameWithAbbreviation;
      cachedDisplayNameWithAbbreviation = self->_cachedDisplayNameWithAbbreviation;
      if (!cachedDisplayNameWithAbbreviation)
      {
        if (objc_msgSend(MEMORY[0x1E0D397A8], "shouldShowAbbreviatedNames"))
        {
          objc_msgSend(MEMORY[0x1E0D397A8], "abbreviatedNameForCNContact:", v3);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = 0;
        }
        if (objc_msgSend(v9, "length"))
          objc_storeStrong((id *)&self->_cachedDisplayNameWithAbbreviation, v9);

        cachedDisplayNameWithAbbreviation = (NSString *)*p_cachedDisplayNameWithAbbreviation;
      }
      if (-[NSString length](cachedDisplayNameWithAbbreviation, "length"))
      {
        v6 = *p_cachedDisplayNameWithAbbreviation;
      }
      else
      {
        -[IMHandle name](self, "name");
        v6 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    v5 = v6;

  }
  else
  {
    -[IMHandle name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v5;
}

+ (void)setNotificationsEnabled:(BOOL)a3
{
  byte_1EE65CD48 = a3;
}

+ (BOOL)notificationsEnabled
{
  return byte_1EE65CD48;
}

+ (id)cnPhoneticKeys
{
  if (qword_1EE65EA60 != -1)
    dispatch_once(&qword_1EE65EA60, &unk_1E471D6D8);
  return (id)qword_1EE65EA78;
}

+ (void)_loadStatusNames
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  byte_1EE65F4E0 = 1;
  v2 = (void *)MEMORY[0x1E0C99D80];
  _IMFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("OnlineStatuses"), CFSTR("plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithContentsOfFile:", v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKey:", CFSTR("StatusList"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = (void *)qword_1EE65F4D8;
  qword_1EE65F4D8 = (uint64_t)v7;

  if (v6 >= 1)
  {
    v9 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", IMPersonStatusFromFZPersonStatus(v9));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("_LOCALIZABLE_"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)qword_1EE65F4D8;
      objc_msgSend(v11, "objectForKey:", CFSTR("StatusName"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v13);

      v9 = (v9 + 1);
    }
    while (v6 != (_DWORD)v9);
  }

}

+ (id)nameOfStatus:(unint64_t)a3
{
  if ((byte_1EE65F4E0 & 1) == 0)
    objc_msgSend(a1, "_loadStatusNames");
  return (id)objc_msgSend((id)qword_1EE65F4D8, "objectAtIndex:", a3);
}

- (void)dealloc
{
  NSObject *v3;
  NSString *id;
  IMAccount *account;
  void *v6;
  __CFPhoneNumber *phoneNumberRef;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  NSString *v11;
  __int16 v12;
  IMAccount *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      account = self->_account;
      id = self->_id;
      *(_DWORD *)buf = 138412546;
      v11 = id;
      v12 = 2112;
      v13 = account;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_DEBUG, "Dealloc ID: %@    Account: %@", buf, 0x16u);
    }

  }
  if (-[IMHandle watchingIMHandle](self, "watchingIMHandle"))
    -[IMAccount stopWatchingIMHandle:](self->_account, "stopWatchingIMHandle:", self);
  -[IMAccount unregisterIMHandleWithID:](self->_account, "unregisterIMHandleWithID:", self->_id);
  +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterIMHandle:", self);

  phoneNumberRef = self->_phoneNumberRef;
  if (phoneNumberRef)
    CFRelease(phoneNumberRef);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_DEBUG, " => done", buf, 2u);
    }

  }
  v9.receiver = self;
  v9.super_class = (Class)IMHandle;
  -[IMHandle dealloc](&v9, sel_dealloc);
}

- (id)_handleInfo
{
  void *v2;
  uint64_t v3;
  NSString *id;
  NSString *uncanonicalID;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = *MEMORY[0x1E0D36D90];
  id = self->_id;
  uncanonicalID = self->_uncanonicalID;
  v6 = *MEMORY[0x1E0D36E10];
  -[IMHandle countryCode](self, "countryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryWithObjectsAndKeys:", id, v3, uncanonicalID, v6, v7, *MEMORY[0x1E0D36D68], 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_setOriginalID:(id)a3
{
  id v4;

  IMCleanupPhoneNumber();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[IMHandle _setOriginalID:updateSiblings:](self, "_setOriginalID:updateSiblings:", v4, 1);

}

- (BOOL)isMapKitBusiness
{
  NSNumber *isBusiness;
  void *v4;
  void *v5;
  NSNumber *v6;
  NSNumber *v7;

  isBusiness = self->_isBusiness;
  if (!isBusiness)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[IMHandle ID](self, "ID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", MEMORY[0x1A85827F4]());
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v7 = self->_isBusiness;
    self->_isBusiness = v6;

    isBusiness = self->_isBusiness;
  }
  return -[NSNumber BOOLValue](isBusiness, "BOOLValue");
}

- (BOOL)isMako
{
  NSNumber *isMako;
  void *v4;
  void *v5;
  NSNumber *v6;
  NSNumber *v7;

  isMako = self->_isMako;
  if (!isMako)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[IMHandle ID](self, "ID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithBool:", IMSharedHelperIsMakoURI());
    v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v7 = self->_isMako;
    self->_isMako = v6;

    isMako = self->_isMako;
  }
  return -[NSNumber BOOLValue](isMako, "BOOLValue");
}

- (BOOL)isApple
{
  NSNumber *isApple;
  void *v4;
  void *v5;
  _BOOL8 v6;
  NSNumber *v7;
  NSNumber *v8;

  isApple = self->_isApple;
  if (!isApple)
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[IMHandle ID](self, "ID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (IMSharedHelperIsAppleURI() & 1) != 0 || -[IMHandle isMako](self, "isMako");
    objc_msgSend(v4, "numberWithInt:", v6);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_isApple;
    self->_isApple = v7;

    isApple = self->_isApple;
  }
  return -[NSNumber BOOLValue](isApple, "BOOLValue");
}

- (BOOL)isStewieEmergencyServices
{
  void *v3;
  int v4;
  void *v5;
  char v6;
  BOOL result;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTranscriptSharingEnabled");

  result = 0;
  if (v4)
  {
    -[IMHandle ID](self, "ID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasSuffix:", *MEMORY[0x1E0D37DC0]);

    if ((v6 & 1) != 0)
      return 1;
  }
  return result;
}

- (IMHandle)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  IMHandle *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  id v33;
  IMHandle *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AccountID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountForUniqueID:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
LABEL_2:
    if (objc_msgSend(v5, "length", v31, v32, v33, v34))
    {
      objc_msgSend(v8, "imHandleWithID:", v5);
      v9 = (IMHandle *)objc_claimAutoreleasedReturnValue();
      -[IMHandle setAnonymous:](v9, "setAnonymous:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AnonymousKey")));
LABEL_23:

      self = 0;
      goto LABEL_24;
    }
LABEL_22:
    v9 = 0;
    goto LABEL_23;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ServiceName"));
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ServiceLoginID"));
  v35 = (void *)v10;
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMServiceImpl serviceWithInternalName:](IMServiceImpl, "serviceWithInternalName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accountsForService:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v15)
  {
    v16 = v15;
    v31 = v6;
    v32 = v5;
    v33 = v4;
    v34 = self;
    v17 = 0;
    v18 = *(_QWORD *)v38;
LABEL_6:
    v19 = 0;
    v20 = v17;
    while (1)
    {
      if (*(_QWORD *)v38 != v18)
        objc_enumerationMutation(v14);
      v17 = *(id *)(*((_QWORD *)&v37 + 1) + 8 * v19);

      objc_msgSend(v11, "canonicalFormOfID:", v36);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "login");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "canonicalFormOfID:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v11, "equalID:andID:", v21, v23);

      if ((v24 & 1) != 0)
        break;
      ++v19;
      v20 = v17;
      if (v16 == v19)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v16)
          goto LABEL_6;

        v4 = v33;
        self = v34;
        v6 = v31;
        v5 = v32;
        goto LABEL_13;
      }
    }
    v8 = v17;

    v4 = v33;
    self = v34;
    v6 = v31;
    v5 = v32;
    if (!v8)
      goto LABEL_16;
    v25 = 0;
    v26 = v8;
    v27 = v35;
  }
  else
  {
LABEL_13:

LABEL_16:
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance", v31, v32, v33, v34);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "bestAccountForService:", v11);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v27 = v35;
    if (v8
      || (+[IMAccountController sharedInstance](IMAccountController, "sharedInstance"),
          v29 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v29, "bestAccountForService:", 0),
          v8 = (id)objc_claimAutoreleasedReturnValue(),
          v29,
          v8))
    {
      v25 = 0;
      v26 = 0;
    }
    else
    {

      v26 = 0;
      self = 0;
      v25 = 1;
    }
  }

  if ((v25 & 1) == 0)
  {
    if (!v8)
      goto LABEL_22;
    goto LABEL_2;
  }
  v9 = 0;
LABEL_24:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[IMHandle account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("AccountID"));

  -[IMHandle account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "login");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
    objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("ServiceLoginID"));
  -[IMHandle account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "internalName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("ServiceName"));

  objc_msgSend(v10, "encodeObject:forKey:", self->_id, CFSTR("ID"));
  objc_msgSend(v10, "encodeBool:forKey:", self->_isAnonymous, CFSTR("AnonymousKey"));

}

+ (id)handlesForCNContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "handlesForCNIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)groupsArray
{
  void *v3;
  void *v4;
  void *v5;

  -[IMHandle account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMHandle ID](self, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "memberGroups:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSSet)groups
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[IMHandle groupsArray](self, "groupsArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (void)setAnonymous:(BOOL)a3
{
  self->_isAnonymous = a3;
}

- (NSString)nameAndEmail
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[IMHandle email](self, "email");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    -[IMHandle name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ \u202A<%@>\u202C"), v4, v3);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = v3;
    }
    v6 = v5;

  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (IMServiceImpl)service
{
  return -[IMAccount service](self->_account, "service");
}

- (BOOL)isContactButNotMe
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchMeContactWithKeys:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isBatchFetchingForLaunchCompleted") & 1) != 0)
  {

  }
  else
  {
    v7 = IMIsRunningInUnitTesting();

    if ((v7 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMHandle ID](self, "ID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cnContactIdentifierForID:", v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        v10 = objc_msgSend(v8, "isEqualToString:", v5) ^ 1;
        goto LABEL_9;
      }
LABEL_8:
      LOBYTE(v10) = 0;
      goto LABEL_9;
    }
  }
  -[IMHandle cnContactWithKeys:](self, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(MEMORY[0x1E0D397A8], "isCNContactAKnownContact:", v8))
    goto LABEL_8;
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v5) ^ 1;

LABEL_9:
  return v10;
}

- (BOOL)resetCNContact
{
  char v3;
  CNContact *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  IMHandle *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[NSString length](self->_id, "length") >= 2
    && -[NSString characterAtIndex:](self->_id, "characterAtIndex:", 1) == 58)
  {
    return 0;
  }
  v4 = self->_cnContact;
  objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMHandle ID](self, "ID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchCNContactForHandleWithID:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  -[IMHandle updateCNContact:](self, "updateCNContact:", v7);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[IMHandle existingChatSiblingsArray](self, "existingChatSiblingsArray", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(IMHandle **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (v13 != self)
          -[IMHandle updateCNContact:](v13, "updateCNContact:", v7);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  if (!-[IMHandle areCNContactPropertiesRecent](self, "areCNContactPropertiesRecent"))
  {
    -[IMHandle resetCNContactProperties](self, "resetCNContactProperties");
    -[IMHandle postNotificationName:](self, "postNotificationName:", CFSTR("__kIMHandleInfoChangedNotification"));
  }
  if (v7 | (unint64_t)v4)
    v3 = objc_msgSend((id)v7, "_im_isEqualToContact:", v4);
  else
    v3 = 0;

  return v3;
}

- (BOOL)areCNContactPropertiesRecent
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;

  -[IMHandle nickname](self, "nickname");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if ((uint64_t)self->_cnNickname | v3 && !objc_msgSend((id)v3, "isEqualToString:"))
    goto LABEL_10;
  -[IMHandle firstName](self, "firstName");
  v5 = objc_claimAutoreleasedReturnValue();

  if ((uint64_t)self->_cnFirstName | v5 && !objc_msgSend((id)v5, "isEqualToString:"))
  {
    v7 = 0;
    v4 = v5;
    goto LABEL_13;
  }
  -[IMHandle lastName](self, "lastName");
  v6 = objc_claimAutoreleasedReturnValue();

  if ((uint64_t)self->_cnLastName | v6 && !objc_msgSend((id)v6, "isEqualToString:"))
  {
    v7 = 0;
    v4 = v6;
    goto LABEL_13;
  }
  -[IMHandle fullName](self, "fullName");
  v4 = objc_claimAutoreleasedReturnValue();

  if ((uint64_t)self->_cnFullName | v4 && !objc_msgSend((id)v4, "isEqualToString:"))
LABEL_10:
    v7 = 0;
  else
    v7 = 1;
LABEL_13:

  return v7;
}

- (void)_clearCNContactProperties
{
  NSString *v3;
  NSString *cnNickname;
  NSString *v5;
  NSString *cnFullName;
  NSString *v7;
  NSString *cnFirstName;
  NSString *v9;
  NSString *cnLastName;

  -[IMHandle nickname](self, "nickname");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  cnNickname = self->_cnNickname;
  self->_cnNickname = v3;

  -[IMHandle fullName](self, "fullName");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  cnFullName = self->_cnFullName;
  self->_cnFullName = v5;

  -[IMHandle firstName](self, "firstName");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  cnFirstName = self->_cnFirstName;
  self->_cnFirstName = v7;

  -[IMHandle lastName](self, "lastName");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  cnLastName = self->_cnLastName;
  self->_cnLastName = v9;

}

- (void)resetCNContactProperties
{
  if (self->_cnContact)
  {
    if (!-[IMHandle areCNContactPropertiesRecent](self, "areCNContactPropertiesRecent"))
      MEMORY[0x1E0DE7D20](self, sel__clearCNContactProperties);
  }
}

- (id)_IDWithTrimmedServer
{
  NSString *IDWithTrimmedServer;
  NSString *v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;

  IDWithTrimmedServer = self->_IDWithTrimmedServer;
  if (IDWithTrimmedServer)
  {
    v3 = IDWithTrimmedServer;
  }
  else
  {
    -[IMAccount login](self->_account, "login");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "rangeOfString:", CFSTR("@"));
    -[IMHandle ID](self, "ID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_12;
    objc_msgSend(v5, "substringFromIndex:", v6 + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && objc_msgSend(v7, "hasSuffix:", v8))
    {
      objc_msgSend(v7, "substringToIndex:", objc_msgSend(v7, "rangeOfString:options:", v8, 4));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "hasSuffix:", CFSTR("@")))
      {
        objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "length") - 1);
        v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = v9;
      }
      v11 = self->_IDWithTrimmedServer;
      self->_IDWithTrimmedServer = v10;

    }
    v12 = self->_IDWithTrimmedServer;
    if (!v12)
    {
LABEL_12:
      -[IMHandle ID](self, "ID");
      v13 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = v12;
    }
    v3 = v13;

  }
  return v3;
}

- (BOOL)_hasABName
{
  return -[NSString length](self->_cnFirstName, "length")
      || -[NSString length](self->_cnLastName, "length")
      || -[NSString length](self->_cnFullName, "length")
      || -[NSString length](self->_cnNickname, "length") != 0;
}

- (void)setSuggestedName:(id)a3
{
  NSString *v4;
  NSString *suggestedName;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_suggestedName, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    suggestedName = self->_suggestedName;
    self->_suggestedName = v4;

    -[IMHandle setHasSuggestedName:](self, "setHasSuggestedName:", -[NSString length](self->_suggestedName, "length") != 0);
    -[IMHandle postNotificationName:](self, "postNotificationName:", CFSTR("__kIMHandleInfoChangedNotification"));
  }

}

- (BOOL)_allowedByScreenTime
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[IMHandle ID](self, "ID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMDowntimeController sharedInstance](IMDowntimeController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "allowedToShowConversationWithHandleIDs:sync:context:", v4, 0, 0);

  return v5;
}

- (id)_displayNameWithNicknameIfAvailable
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (-[IMHandle _allowedByScreenTime](self, "_allowedByScreenTime"))
  {
    +[IMNicknameController sharedInstance](IMNicknameController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "nicknameForHandle:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C97360]);
      objc_msgSend(v4, "firstName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setGivenName:", v6);

      objc_msgSend(v4, "lastName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setFamilyName:", v7);

      objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v5, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "length"))
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        IMCoreLocalizedString(CFSTR("Maybe: %@"), CFSTR("Maybe: %@"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", v10, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (NSString)normalizedID
{
  NSString *normalizedFormOfID;
  void *v4;
  int v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;

  normalizedFormOfID = self->_normalizedFormOfID;
  if (normalizedFormOfID)
    goto LABEL_6;
  -[IMHandle service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsPhoneNumberMapping");

  if (v5)
  {
    -[IMHandle service](self, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "normalizedFormOfID:", self->_id);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->_normalizedFormOfID;
    self->_normalizedFormOfID = v7;

    normalizedFormOfID = self->_normalizedFormOfID;
    if (normalizedFormOfID)
      goto LABEL_6;
    MEMORY[0x1A8582830](self->_id);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = self->_normalizedFormOfID;
    self->_normalizedFormOfID = v9;

  }
  normalizedFormOfID = self->_normalizedFormOfID;
  if (!normalizedFormOfID)
  {
    MEMORY[0x1A8582830](self->_id);
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    return v11;
  }
LABEL_6:
  v11 = normalizedFormOfID;
  return v11;
}

- (NSString)fullName
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *fullName;
  void *v7;
  void *v8;
  void *v9;

  -[IMHandle cnContact](self, "cnContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D397A8], "fullNameForCNContact:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;
LABEL_10:
    v9 = v5;
    goto LABEL_11;
  }
  if (-[IMHandle _hasServiceNameProperties](self, "_hasServiceNameProperties"))
  {
    fullName = self->_fullName;
    if (fullName)
    {
      v5 = fullName;
      goto LABEL_10;
    }
  }
  if (!-[IMHandle isLoginIMHandle](self, "isLoginIMHandle"))
  {
LABEL_9:
    -[IMHandle name](self, "name");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  +[IMMe me](IMMe, "me");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fullName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "trimmedString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "length"))
  {

    goto LABEL_9;
  }
LABEL_11:

  return (NSString *)v9;
}

- (NSString)nameAndID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;

  if (-[IMHandle hasName](self, "hasName"))
  {
    -[IMHandle name](self, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMHandle displayID](self, "displayID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[IMAccount equalID:andID:](self->_account, "equalID:andID:", v3, v4))
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v3, v8);
    else
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ \u202A<%@>\u202C"), v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[IMHandle displayID](self, "displayID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@"), v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v6;
}

- (BOOL)hasName
{
  return -[IMHandle _hasABName](self, "_hasABName")
      || -[IMHandle _hasServiceNameProperties](self, "_hasServiceNameProperties");
}

- (NSString)firstName
{
  void *v3;
  void *v4;
  NSString *v5;
  void *v6;
  NSString *firstName;
  void *v9;

  -[IMHandle cnContact](self, "cnContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D397A8], "firstNameForCNContact:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = v4;
LABEL_3:
    v6 = v5;
    goto LABEL_4;
  }
  if (-[IMHandle _hasServiceNameProperties](self, "_hasServiceNameProperties"))
  {
    firstName = self->_firstName;
    if (firstName)
    {
      v5 = firstName;
      goto LABEL_3;
    }
  }
  if (-[IMHandle isLoginIMHandle](self, "isLoginIMHandle"))
  {
    +[IMMe me](IMMe, "me");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
LABEL_4:

  return (NSString *)v6;
}

- (NSString)lastName
{
  void *v3;
  void *v4;
  NSString *v5;
  void *v6;
  void *v8;

  -[IMHandle cnContact](self, "cnContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D397A8], "lastNameForCNContact:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    if (-[IMHandle _hasServiceNameProperties](self, "_hasServiceNameProperties"))
    {
      if (-[NSString length](self->_lastName, "length"))
      {
        v5 = self->_lastName;
        goto LABEL_3;
      }
    }
    else if (-[IMHandle isLoginIMHandle](self, "isLoginIMHandle"))
    {
      +[IMMe me](IMMe, "me");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_4;
    }
    v6 = 0;
    goto LABEL_4;
  }
  v5 = v4;
LABEL_3:
  v6 = v5;
LABEL_4:

  return (NSString *)v6;
}

- (NSString)phoneticFirstName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend((id)objc_opt_class(), "cnPhoneticKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMHandle cnContactWithKeys:](self, "cnContactWithKeys:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D397A8], "phoneticFirstNameForCNContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    v6 = v5;
  else
    v6 = 0;

  return (NSString *)v6;
}

- (NSString)phoneticLastName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend((id)objc_opt_class(), "cnPhoneticKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMHandle cnContactWithKeys:](self, "cnContactWithKeys:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D397A8], "phoneticLastNameForCNContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    v6 = v5;
  else
    v6 = 0;

  return (NSString *)v6;
}

- (NSString)phoneticFullName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend((id)objc_opt_class(), "cnPhoneticKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMHandle cnContactWithKeys:](self, "cnContactWithKeys:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D397A8], "phoneticFullNameForCNContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    v6 = v5;
  else
    v6 = 0;

  return (NSString *)v6;
}

- (void)_setBaseFirstName:(id)a3 lastName:(id)a4 fullName:(id)a5
{
  NSString *v8;
  NSString *v9;
  int v10;
  int v11;
  NSString *v12;
  NSString *fullName;
  NSString *v14;
  NSString *firstName;
  NSString *v16;
  NSString *lastName;
  NSString *v18;

  v18 = (NSString *)a3;
  v8 = (NSString *)a4;
  v9 = (NSString *)a5;
  if (self->_firstName == v18)
    v10 = 0;
  else
    v10 = !-[NSString isEqualToString:](v18, "isEqualToString:");
  if (self->_lastName == v8)
    v11 = 0;
  else
    v11 = !-[NSString isEqualToString:](v8, "isEqualToString:");
  if (self->_fullName == v9)
  {
    if ((v10 | v11) != 1)
      goto LABEL_13;
  }
  else if (((!-[NSString isEqualToString:](v9, "isEqualToString:") | v10 | v11) & 1) == 0)
  {
    goto LABEL_13;
  }
  v12 = (NSString *)-[NSString copy](v9, "copy");
  fullName = self->_fullName;
  self->_fullName = v12;

  v14 = (NSString *)-[NSString copy](v18, "copy");
  firstName = self->_firstName;
  self->_firstName = v14;

  v16 = (NSString *)-[NSString copy](v8, "copy");
  lastName = self->_lastName;
  self->_lastName = v16;

  if (!-[IMHandle _hasABName](self, "_hasABName"))
    -[IMHandle postNotificationName:](self, "postNotificationName:", CFSTR("__kIMHandleInfoChangedNotification"));
LABEL_13:

}

- (void)setImageData:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0C96890];
  v11[0] = *MEMORY[0x1E0C96708];
  v11[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMHandle cnContactWithKeys:](self, "cnContactWithKeys:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "imageData");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 != v4 && (objc_msgSend(v4, "isEqualToData:", v8) & 1) == 0)
  {
    v9 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v9, "setImageData:", v4);
    v10 = (void *)objc_msgSend(v9, "copy");
    -[IMHandle updateCNContact:](self, "updateCNContact:", v10);

    -[IMHandle postNotificationName:](self, "postNotificationName:", CFSTR("__kIMHandleInfoChangedNotification"));
  }

}

- (void)setLocalNickname:(id)a3
{
  NSString *v4;
  NSString *nickname;
  BOOL v6;
  NSString *fullName;
  NSString *v8;
  NSString *v9;
  BOOL v10;
  NSString *v11;

  v4 = (NSString *)a3;
  nickname = self->_nickname;
  if (nickname != v4)
  {
    v11 = v4;
    v6 = -[NSString isEqualToString:](nickname, "isEqualToString:", v4);
    v4 = v11;
    if (!v6)
    {
      fullName = self->_fullName;
      self->_fullName = 0;

      v8 = (NSString *)-[NSString copy](v11, "copy");
      v9 = self->_nickname;
      self->_nickname = v8;

      v10 = -[IMHandle _hasABName](self, "_hasABName");
      v4 = v11;
      if (!v10)
      {
        -[IMHandle postNotificationName:](self, "postNotificationName:", CFSTR("__kIMHandleInfoChangedNotification"));
        v4 = v11;
      }
    }
  }

}

- (void)setFirstName:(id)a3 lastName:(id)a4 fullName:(id)a5 andUpdateABPerson:(BOOL)a6
{
  if (!a6)
    MEMORY[0x1E0DE7D20](self, sel__setBaseFirstName_lastName_fullName_);
}

- (void)setEmail:(id)a3 andUpdateABPerson:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  IMSingleObjectArray();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[IMHandle setEmails:andUpdateABPerson:](self, "setEmails:andUpdateABPerson:", v6, v4);

}

- (NSString)email
{
  void *v2;
  void *v3;

  -[IMHandle emails](self, "emails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "__imFirstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

- (NSArray)emails
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  void *v7;
  void *v9;

  v3 = (void *)MEMORY[0x1E0D397A8];
  -[IMHandle cnContactWithKeys:](self, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emailsForCNContact:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    v6 = v5;
LABEL_5:
    v7 = v6;
    goto LABEL_6;
  }
  if (-[NSArray count](self->_emails, "count"))
  {
    v6 = self->_emails;
    goto LABEL_5;
  }
  if (-[IMHandle isLoginIMHandle](self, "isLoginIMHandle"))
  {
    +[IMMe me](IMMe, "me");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "emails");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
LABEL_6:

  return (NSArray *)v7;
}

- (void)setFirstName:(id)a3 lastName:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_setFirstName_lastName_fullName_andUpdateABPerson_);
}

- (void)setEmail:(id)a3
{
  MEMORY[0x1E0DE7D20](self, sel_setEmail_andUpdateABPerson_);
}

- (void)setEmails:(id)a3
{
  -[IMHandle setEmails:andUpdateABPerson:](self, "setEmails:andUpdateABPerson:", a3, 1);
}

- (BOOL)isSystemUser
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v9;
  char v10;

  -[IMHandle ID](self, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMHandle service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D362B8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "isEqualToString:", v6);

  if ((v7 & 1) != 0)
    return 1;
  -[NSDictionary objectForKey:](self->_extraProps, "objectForKey:", *MEMORY[0x1E0D36DA0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  return v10;
}

- (BOOL)isKTVerified
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  +[IMKeyTransparencyController sharedController](IMKeyTransparencyController, "sharedController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMHandle ID](self, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_stripFZIDPrefix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ktVerifierResultForHandleID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "staticAccountKeyEnforced") && (objc_msgSend(v6, "optedIn") & 1) != 0;
  return v7;
}

- (void)setIsMobile:(BOOL)a3
{
  if (self->_isMobile != a3)
  {
    self->_isMobile = a3;
    -[IMHandle postNotificationName:](self, "postNotificationName:", CFSTR("__kIMHandleIsMobileChangedNotification"));
  }
}

- (void)setIsBot:(BOOL)a3
{
  if (self->_isBot != a3)
  {
    self->_isBot = a3;
    -[IMHandle postNotificationName:](self, "postNotificationName:", CFSTR("__kIMHandleIsBotChangedNotification"));
  }
}

- (NSString)mobileDeviceName
{
  void *v2;
  void *v3;

  -[IMHandle extraProperties](self, "extraProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D36DB0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)hasServer
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[IMHandle account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMService jabberService](IMServiceImpl, "jabberService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 == v4;

  return v5;
}

- (BOOL)hasResource
{
  return self->_resourceIndex != 0x7FFFFFFFFFFFFFFFLL;
}

- (NSString)server
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (-[IMHandle hasServer](self, "hasServer"))
  {
    -[IMHandle IDWithoutResource](self, "IDWithoutResource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("@"));
    if (v4 == 0x7FFFFFFFFFFFFFFFLL || (v6 = v4, v4 + v5 >= -[NSString length](self->_id, "length")))
    {
      v7 = 0;
    }
    else
    {
      objc_msgSend(v3, "substringFromIndex:", v6 + 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

- (BOOL)isBuddy
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[IMHandle account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMHandle ID](self, "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "memberGroups:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (BOOL)isLoginIMHandleForAnyAccount
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (-[IMHandle isLoginIMHandle](self, "isLoginIMHandle"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    -[IMHandle accountSiblingsArray](self, "accountSiblingsArray", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v5 = *(_QWORD *)v9;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isLoginIMHandle") & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        v3 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v3;
}

- (BOOL)matchesLoginHandleForAnyAccount
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[IMHandle accountSiblingsArray](self, "accountSiblingsArray");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMHandle normalizedID](self, "normalizedID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1A8582830]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "account", (_QWORD)v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "loginIMHandle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "normalizedID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        MEMORY[0x1A8582830]();
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_msgSend(v5, "caseInsensitiveCompare:", v13);
        if (!v14)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (void)_createPhoneNumberRefIfNeeded
{
  id v3;

  if (!self->_hasCheckedPhoneNumber && !self->_phoneNumberRef)
  {
    self->_hasCheckedPhoneNumber = 1;
    MEMORY[0x1A8582830](self->_id, a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "_appearsToBePhoneNumber"))
      self->_phoneNumberRef = (__CFPhoneNumber *)IMPhoneNumberRefCopyForPhoneNumber();

  }
}

- (__CFPhoneNumber)phoneNumberRef
{
  -[IMHandle _createPhoneNumberRefIfNeeded](self, "_createPhoneNumberRefIfNeeded");
  return self->_phoneNumberRef;
}

- (void)_updateOriginalID:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  IMHandle *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "hasPrefix:", CFSTR("+")) & 1) == 0)
  {
    if (objc_msgSend(v4, "length"))
    {
      if ((objc_msgSend(v4, "_appearsToBeEmail") & 1) == 0)
      {
        -[IMHandle originalID](self, "originalID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v4, "isEqualToIgnoringCase:", v5);

        if ((v6 & 1) == 0)
        {
          +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "capabilitiesForListenerID:", 0);
          v9 = *MEMORY[0x1E0D36CD0] & v8;

          if (v9)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v10 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
              {
                -[IMHandle originalID](self, "originalID");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = 138412802;
                v17 = v11;
                v18 = 2112;
                v19 = v4;
                v20 = 2112;
                v21 = self;
                _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_DEBUG, "Updating unformatted ID from %@ to %@ (%@)", (uint8_t *)&v16, 0x20u);

              }
            }
            +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMHandle ID](self, "ID");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[IMHandle service](self, "service");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "internalName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "updateUnformattedID:forBuddyID:onService:", v4, v13, v15);

          }
        }
      }
    }
  }

}

- (id)_unformattedPhoneNumber
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[IMHandle _formattedPhoneNumber](self, "_formattedPhoneNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        v7 = 138412290;
        v8 = v2;
        _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_DEBUG, "Unformatted phone number: %@", (uint8_t *)&v7, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
  }
  return v2;
}

- (void)requestValueOfProperty:(id)a3
{
  MEMORY[0x1E0DE7D20](self->_account, sel_requestProperty_ofIMHandle_);
}

- (void)setValue:(id)a3 ofExtraProperty:(id)a4
{
  MEMORY[0x1E0DE7D20](self->_account, sel_setValue_ofExtraProperty_ofIMHandle_);
}

- (BOOL)watchingIMHandle
{
  return -[IMHandle isBuddy](self, "isBuddy") || self->_hasTemporaryWatch;
}

- (void)setHasTemporaryWatch:(BOOL)a3
{
  self->_hasTemporaryWatch = a3;
}

- (BOOL)isBetterThanIMHandle:(id)a3
{
  return -[IMHandle isBetterThanIMHandle:nonPhoneNumbersPreferred:](self, "isBetterThanIMHandle:nonPhoneNumbersPreferred:", a3, 1);
}

- (BOOL)isBetterThanIMHandle:(id)a3 nonPhoneNumbersPreferred:(BOOL)a4
{
  _BOOL4 v4;
  IMHandle *v6;
  IMHandle *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  char v20;
  int v21;
  int v22;
  _BOOL4 v24;
  _BOOL4 v25;
  unint64_t v26;
  IMPersonStatus v27;
  void *v28;
  void *v29;
  int v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  int64_t priority;
  void *v45;
  void *v46;
  int v47;
  double v48;
  double v49;
  double v50;
  BOOL v51;
  int64_t v52;
  unint64_t v53;
  unint64_t v54;

  v4 = a4;
  v6 = (IMHandle *)a3;
  v7 = v6;
  if (v6)
  {
    if (v6 != self)
    {
      v54 = -[IMHandle status](self, "status");
      v53 = -[IMHandle status](v7, "status");
      -[IMHandle account](self, "account");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMHandle account](v7, "account");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "accounts");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMHandle account](self, "account");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "containsObjectIdenticalTo:", v12);

      +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "accounts");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMHandle account](v7, "account");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "containsObjectIdenticalTo:", v16);

      v18 = v8;
      if (v13 != v17)
      {
LABEL_13:

        goto LABEL_14;
      }
      v19 = objc_msgSend(v8, "isOperational");
      if (v19 != objc_msgSend(v9, "isOperational"))
      {
        v20 = objc_msgSend(v8, "isOperational");
LABEL_12:
        LOBYTE(v13) = v20;
        goto LABEL_13;
      }
      v21 = objc_msgSend(v8, "isActive");
      if (v21 != objc_msgSend(v9, "isActive"))
      {
        v20 = objc_msgSend(v8, "isActive");
        goto LABEL_12;
      }
      v22 = objc_msgSend(v8, "isConnected");
      if (v22 != objc_msgSend(v9, "isConnected"))
      {
        v20 = objc_msgSend(v8, "isConnected");
        goto LABEL_12;
      }
      v24 = -[IMHandle isLoginIMHandle](self, "isLoginIMHandle");
      v25 = -[IMHandle isLoginIMHandle](v7, "isLoginIMHandle");
      if (v24 && !v25)
      {
LABEL_17:
        LOBYTE(v13) = 0;
        goto LABEL_13;
      }
      if (v24 || !v25)
      {
        if (v54 <= 1)
          v26 = 1;
        else
          v26 = v54;
        if (v53 <= 1)
          v27 = 1;
        else
          v27 = v53;
        if (v26 == v27)
        {
          if (v4)
          {
            v13 = -[IMHandle isMobile](self, "isMobile");
            if (v13 != -[IMHandle isMobile](v7, "isMobile"))
              goto LABEL_29;
            -[IMHandle ID](self, "ID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v28, "_appearsToBePhoneNumber");

            -[IMHandle ID](v7, "ID");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "_appearsToBePhoneNumber");

            if (v13 != v30)
            {
LABEL_29:
              LOBYTE(v13) = v13 ^ 1;
              goto LABEL_13;
            }
          }
          v31 = -[IMHandle capabilities](self, "capabilities");
          v32 = -[IMHandle capabilities](v7, "capabilities");
          if (v31 != v32)
          {
            v33 = 0x20000;
            v34 = 8u;
            do
            {
              v35 = v33 & v32;
              LOBYTE(v13) = (v33 & v31) == v33;
              if ((v33 & v31) == v33)
              {
                if (v35 != v33)
                  goto LABEL_13;
              }
              else if (v35 == v33)
              {
                goto LABEL_13;
              }
              v33 = *(_QWORD *)((char *)&unk_1A21AE4D8 + v34);
              v34 += 8;
            }
            while (v34 != 64);
          }
          v36 = -[IMHandle isBuddy](self, "isBuddy");
          if (v36 != -[IMHandle isBuddy](v7, "isBuddy"))
          {
            v20 = -[IMHandle isBuddy](self, "isBuddy");
            goto LABEL_12;
          }
          if (-[IMHandle hasResource](v7, "hasResource") && -[IMHandle hasResource](self, "hasResource"))
          {
            -[IMHandle account](self, "account");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "loginIMHandle");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "server");
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v39, "length"))
            {
              -[IMHandle server](self, "server");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = objc_msgSend(v40, "isEqualToString:", v39);

              -[IMHandle server](v7, "server");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = objc_msgSend(v41, "isEqualToString:", v39);

              if (v13 != v42)
              {

                goto LABEL_13;
              }
            }

          }
          if (IMPersonStatusIsOnline(v26) && IMPersonStatusIsOnline(v26))
          {
            v43 = -[IMHandle priority](v7, "priority");
            priority = self->_priority;
            LOBYTE(v13) = priority > v43;
            if (priority != v43)
              goto LABEL_13;
          }
          -[IMHandle account](self, "account");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v45, "isConnected");

          -[IMHandle account](v7, "account");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "isConnected");

          if (v13 != v47)
            goto LABEL_13;
          -[IMHandle timeSinceWentOffline](self, "timeSinceWentOffline");
          v49 = v48;
          -[IMHandle timeSinceWentOffline](v7, "timeSinceWentOffline");
          if (v49 != v50)
          {
            if (v49 >= 0.0 || v50 < 0.0)
            {
              v51 = v49 >= 0.0;
              if (v50 >= 0.0)
                v51 = 0;
              LOBYTE(v13) = v49 < v50 || v51;
              goto LABEL_13;
            }
            goto LABEL_17;
          }
          v52 = -[IMHandle compareIDs:](self, "compareIDs:", v7);
          if (v52 != -1)
          {
            if (v52 != 1)
            {
              LOBYTE(v13) = v7 > self;
              goto LABEL_13;
            }
            goto LABEL_17;
          }
        }
        else if (v26 != 2 || v27 != 3)
        {
          LOBYTE(v13) = IMComparePersonStatus(v26, v27) == NSOrderedDescending;
          goto LABEL_13;
        }
      }
      LOBYTE(v13) = 1;
      goto LABEL_13;
    }
    LOBYTE(v13) = 0;
  }
  else
  {
    LOBYTE(v13) = 1;
  }
LABEL_14:

  return v13;
}

- (id)bestIMHandleForService:(id)a3
{
  return -[IMHandle bestIMHandleForAccount:onService:inGroup:otherThan:](self, "bestIMHandleForAccount:onService:inGroup:otherThan:", 0, a3, 0, 0);
}

- (id)bestIMHandleForAccount:(id)a3
{
  return -[IMHandle bestIMHandleForAccount:onService:inGroup:otherThan:](self, "bestIMHandleForAccount:onService:inGroup:otherThan:", a3, 0, 0, 0);
}

- (id)bestAccountSibling
{
  void *v2;
  void *v3;

  -[IMHandle existingAccountSiblingsArray](self, "existingAccountSiblingsArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMHandle bestIMHandleInArray:](IMHandle, "bestIMHandleInArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)bestIMHandleInArray:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (!v6 || objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "isBetterThanIMHandle:", v6))
        {
          v10 = v9;

          v6 = v10;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)bestIMHandleForAccount:(id)a3 onService:(id)a4 inGroup:(id)a5 otherThan:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  int v27;
  BOOL v28;
  char v29;
  id v30;
  void *v31;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v34 = a6;
  if (v12 && !objc_msgSend(v12, "length"))
  {

    v12 = 0;
  }
  v13 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[IMHandle siblings](self, "siblings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithSet:", v14);

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (!v17)
  {
    v31 = 0;
    goto LABEL_33;
  }
  v18 = v17;
  v33 = 0;
  v19 = 0;
  v20 = *(_QWORD *)v36;
  do
  {
    for (i = 0; i != v18; ++i)
    {
      v22 = v19;
      if (*(_QWORD *)v36 != v20)
        objc_enumerationMutation(v16);
      v19 = *(id *)(*((_QWORD *)&v35 + 1) + 8 * i);

      if (v11)
      {
        objc_msgSend(v19, "service");
        v23 = (id)objc_claimAutoreleasedReturnValue();

        if (v23 != v11)
          continue;
      }
      if (v10)
      {
        objc_msgSend(v19, "account");
        v24 = (id)objc_claimAutoreleasedReturnValue();

        if (v24 != v10)
          continue;
      }
      if (!v12)
      {
        if (v34 && v19 == v34)
          continue;
LABEL_25:
        if ((objc_msgSend(v19, "isLoginIMHandle", v33) & 1) == 0
          && objc_msgSend(v19, "isBetterThanIMHandle:", v33))
        {
          v30 = v19;

          v33 = v30;
        }
        continue;
      }
      objc_msgSend(v19, "groupsArray");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v12;
      v27 = objc_msgSend(v25, "containsObject:", v12);

      if (v34)
        v28 = v19 == v34;
      else
        v28 = 0;
      v29 = v28;
      if (!v27)
      {
        v12 = v26;
        continue;
      }
      v12 = v26;
      if ((v29 & 1) == 0)
        goto LABEL_25;
    }
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  }
  while (v18);

  v31 = v33;
LABEL_33:

  return v31;
}

- (id)bestSibling
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_account
    && (+[IMAccountController sharedInstance](IMAccountController, "sharedInstance"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "accounts"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "containsObjectIdenticalTo:", self->_account),
        v4,
        v3,
        v5))
  {
    -[IMHandle bestIMHandleForAccount:onService:inGroup:otherThan:](self, "bestIMHandleForAccount:onService:inGroup:otherThan:", self->_account, 0, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[IMHandle service](self, "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMHandle bestIMHandleForAccount:onService:inGroup:otherThan:](self, "bestIMHandleForAccount:onService:inGroup:otherThan:", 0, v7, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = v8;
    }
    else
    {
      -[IMHandle bestIMHandleForAccount:onService:inGroup:otherThan:](self, "bestIMHandleForAccount:onService:inGroup:otherThan:", 0, 0, 0, 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v9;

  }
  return v6;
}

- (void)_setExtraProperties:(id)a3
{
  NSDictionary *v4;
  NSDictionary *v5;
  char v6;
  NSDictionary *extraProps;
  NSDictionary *v8;
  NSDictionary *v9;
  NSDictionary *v10;
  NSDictionary *v11;

  v4 = (NSDictionary *)a3;
  v5 = v4;
  if (self->_extraProps != v4)
  {
    v11 = v4;
    v6 = -[NSDictionary isEqual:](v4, "isEqual:");
    v5 = v11;
    if ((v6 & 1) == 0)
    {
      extraProps = self->_extraProps;
      if (extraProps)
        v8 = (NSDictionary *)-[NSDictionary mutableCopy](extraProps, "mutableCopy");
      else
        v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = v8;
      -[NSDictionary addEntriesFromDictionary:](v8, "addEntriesFromDictionary:", v11);
      v10 = self->_extraProps;
      self->_extraProps = v9;

      -[IMHandle postNotificationName:](self, "postNotificationName:", CFSTR("__kIMHandleExtraPropertiesChangedNotification"));
      v5 = v11;
    }
  }

}

- (void)propertiesChanged:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = objc_msgSend(v16, "count") == 1;
  v5 = v16;
  if (!v4
    || (objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0D36D90]),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5 = v16,
        !v6))
  {
    if (!self->_blockNotifications)
    {
      -[IMHandle beginNotificationQueue](self, "beginNotificationQueue");
      v5 = v16;
    }
    v7 = *MEMORY[0x1E0D36D60];
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D36D60]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v16, "objectForKey:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMHandle setCapabilities:](self, "setCapabilities:", objc_msgSend(v9, "unsignedLongLongValue"));

    }
    if (!qword_1EE65F4E8)
    {
      v10 = objc_alloc(MEMORY[0x1E0C99D20]);
      v11 = objc_msgSend(v10, "initWithObjects:", *MEMORY[0x1E0D36D90], *MEMORY[0x1E0D36E00], *MEMORY[0x1E0D36DF0], *MEMORY[0x1E0D36DF8], *MEMORY[0x1E0D36D88], *MEMORY[0x1E0D36DA8], *MEMORY[0x1E0D36D70], v7, *MEMORY[0x1E0D36DC8], *MEMORY[0x1E0D36D58], *MEMORY[0x1E0D36D78], *MEMORY[0x1E0D36D80], *MEMORY[0x1E0D36D50], *MEMORY[0x1E0D36DB8], *MEMORY[0x1E0D36DE0], *MEMORY[0x1E0D36E08], 0);
      v12 = (void *)qword_1EE65F4E8;
      qword_1EE65F4E8 = v11;

    }
    v13 = (void *)objc_msgSend(v16, "mutableCopy");
    objc_msgSend(v13, "removeObjectsForKeys:", qword_1EE65F4E8);
    -[IMHandle _setExtraProperties:](self, "_setExtraProperties:", v13);
    objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0D36D98]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isAnonymous = objc_msgSend(v14, "intValue") != 0;

    if (!self->_blockNotifications)
    {
      -[IMHandle releaseNotificationQueue](self, "releaseNotificationQueue");
      if (!self->_notificationQueueCount)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "__mainThreadPostNotificationName:object:", CFSTR("__kIMBuddyPropertiesChangedDoneNotification"), self);

      }
    }

    v5 = v16;
  }

}

- (BOOL)_isMyIDInList:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  IMAccount *account;
  NSString *id;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "count") - 1;
  do
  {
    v6 = v5;
    if (v5 < 0)
      break;
    account = self->_account;
    id = self->_id;
    objc_msgSend(v4, "objectAtIndex:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(account) = -[IMAccount equalID:andID:](account, "equalID:andID:", id, v9);

    v5 = v6 - 1;
  }
  while (!(_DWORD)account);

  return v6 >= 0;
}

- (BOOL)isVisiblyBlocked
{
  return !IMPersonStatusIsOnline(-[IMHandle status](self, "status")) && -[IMHandle isBlocked](self, "isBlocked");
}

- (BOOL)isBlocked
{
  IMHandle *v2;
  void *v3;

  v2 = self;
  switch(-[IMAccount blockingMode](self->_account, "blockingMode"))
  {
    case 1u:
      LODWORD(v2) = !-[IMHandle isBuddy](v2, "isBuddy");
      break;
    case 2u:
      -[IMAccount allowList](v2->_account, "allowList");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v2) = !-[IMHandle _isMyIDInList:](v2, "_isMyIDInList:", v3);
      goto LABEL_6;
    case 3u:
      -[IMAccount blockList](v2->_account, "blockList");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v2) = -[IMHandle _isMyIDInList:](v2, "_isMyIDInList:", v3);
LABEL_6:

      break;
    case 4u:
      LOBYTE(v2) = 1;
      break;
    default:
      LOBYTE(v2) = 0;
      break;
  }
  return (char)v2;
}

- (void)setBlocked:(BOOL)a3
{
  _BOOL8 v3;
  IMAccount *account;
  id v6;

  v3 = a3;
  if (-[IMHandle isBlocked](self, "isBlocked") != a3)
  {
    account = self->_account;
    -[IMHandle ID](self, "ID");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[IMAccount blockMessages:fromID:](account, "blockMessages:fromID:", v3, v6);

  }
}

- (unsigned)sortOrderInGroup:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[IMHandle account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "sortOrderForIMHandle:inGroup:", self, v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)accountTypeName
{
  void *v2;
  void *v3;

  -[IMHandle account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)resource
{
  if (self->_resourceIndex == 0x7FFFFFFFFFFFFFFFLL)
    return (NSString *)0;
  -[NSString substringFromIndex:](self->_id, "substringFromIndex:");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)IDWithoutResource
{
  NSString *IDWithoutResource;
  unint64_t resourceIndex;
  BOOL v5;
  NSString *v6;
  NSString *v7;

  IDWithoutResource = self->_IDWithoutResource;
  if (!IDWithoutResource)
  {
    resourceIndex = self->_resourceIndex;
    if (resourceIndex)
      v5 = resourceIndex == 0x7FFFFFFFFFFFFFFFLL;
    else
      v5 = 1;
    if (v5)
    {
      v6 = self->_id;
    }
    else
    {
      -[NSString substringToIndex:](self->_id, "substringToIndex:", resourceIndex - 1);
      v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    v7 = self->_IDWithoutResource;
    self->_IDWithoutResource = v6;

    IDWithoutResource = self->_IDWithoutResource;
  }
  return IDWithoutResource;
}

- (IMHandle)imHandleWithoutResource
{
  IMHandle *v3;
  void *v4;
  void *v5;

  if (self->_resourceIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = self;
  }
  else
  {
    -[IMHandle account](self, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMHandle IDWithoutResource](self, "IDWithoutResource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imHandleWithID:", v5);
    v3 = (IMHandle *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)existingIMHandleWithoutResource
{
  IMHandle *v3;
  void *v4;
  void *v5;

  if (self->_resourceIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = self;
  }
  else
  {
    -[IMHandle account](self, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMHandle IDWithoutResource](self, "IDWithoutResource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "existingIMHandleWithID:", v5);
    v3 = (IMHandle *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)dependentIMHandles
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  IMHandle *v9;
  IMHandle *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_resourceIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[IMAccount arrayOfAllIMHandles](self->_account, "arrayOfAllIMHandles", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(IMHandle **)(*((_QWORD *)&v12 + 1) + 8 * v8);
          if (v9 != self)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "imHandleWithoutResource");
            v10 = (IMHandle *)objc_claimAutoreleasedReturnValue();

            if (v10 == self)
              objc_msgSend(v3, "addObject:", v9);
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_stopRetainingAccount:(id)a3
{
  IMAccount *account;

  account = self->_account;
  self->_account = 0;

}

- (void)_updateStatusBasedOnAuthRequestStatus
{
  void *v3;
  unsigned int authRequestStatus;
  const __CFString *v5;
  void *v6;
  id v7;

  if (!-[IMHandle isLoginIMHandle](self, "isLoginIMHandle"))
  {
    sub_1A20F1964();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    authRequestStatus = self->_authRequestStatus;
    if (authRequestStatus == 2)
    {
      v5 = CFSTR("Not authorized");
    }
    else
    {
      if (authRequestStatus != 1)
      {
LABEL_7:

        return;
      }
      v5 = CFSTR("Waiting for authorization");
    }
    v7 = v3;
    objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E4725068, CFSTR("IMCoreLocalizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMHandle setStatus:message:richMessage:](self, "setStatus:message:richMessage:", 0, v6, 0);

    v3 = v7;
    goto LABEL_7;
  }
}

- (void)setAuthRequestStatus:(unsigned int)a3
{
  if (self->_authRequestStatus != a3)
  {
    self->_authRequestStatus = a3;
    -[IMHandle postNotificationName:](self, "postNotificationName:", CFSTR("__kIMHandleInfoChangedNotification"));
  }
  MEMORY[0x1E0DE7D20](self, sel__updateStatusBasedOnAuthRequestStatus);
}

- (unint64_t)status
{
  void *v2;
  int v3;

  -[IMHandle account](self, "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isConnected");

  if (v3)
    return 5;
  else
    return 1;
}

- (void)setPersonStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (void)statusChanged:(unint64_t)a3 message:(id)a4
{
  -[IMHandle setStatus:message:richMessage:](self, "setStatus:message:richMessage:", a3, a4, 0);
}

- (void)statusMessageChanged:(id)a3
{
  id v4;

  v4 = a3;
  -[IMHandle setStatus:message:richMessage:](self, "setStatus:message:richMessage:", -[IMHandle status](self, "status"), v4, 0);

}

- (void)statusChanged:(unint64_t)a3
{
  -[IMHandle setStatus:message:richMessage:](self, "setStatus:message:richMessage:", a3, 0, 0);
}

- (NSString)nameOfStatus
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  +[IMHandle nameOfStatus:](IMHandle, "nameOfStatus:", self->_status);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[IMHandle status](self, "status"))
  {
    -[IMHandle account](self, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "loginStatus");

    if (v5 != 4)
    {
      sub_1A20F1964();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR(" (You are offline)"), &stru_1E4725068, CFSTR("IMCoreLocalizable"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringByAppendingString:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v8;
    }
  }
  return (NSString *)v3;
}

- (double)idleTime
{
  NSDate *idleSince;
  double v3;

  idleSince = self->_idleSince;
  if (!idleSince)
    return 0.0;
  -[NSDate timeIntervalSinceNow](idleSince, "timeIntervalSinceNow");
  return -v3;
}

- (int64_t)IDStatus
{
  return 0;
}

- (void)_setIDStatus:(int64_t)a3
{
  NSObject *v5;
  int64_t IDStatus;
  int v7;
  IMHandle *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_IDStatus != a3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        IDStatus = self->_IDStatus;
        v7 = 138412802;
        v8 = self;
        v9 = 1024;
        v10 = IDStatus;
        v11 = 1024;
        v12 = a3;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_DEBUG, "Posting ID status change for: %@   from %d to %d", (uint8_t *)&v7, 0x18u);
      }

    }
    self->_IDStatus = a3;
  }
}

- (void)setIdleSince:(id)a3
{
  NSDate *v4;
  NSDate *idleSince;
  id v6;

  v6 = a3;
  if ((IMSharedHelperAreObjectsLogicallySame() & 1) == 0)
  {
    v4 = (NSDate *)objc_msgSend(v6, "copy");
    idleSince = self->_idleSince;
    self->_idleSince = v4;

  }
}

- (void)setFeedUpdatedDate:(id)a3
{
  NSDate *v4;
  NSDate *feedUpdatedDate;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToDate:", self->_feedUpdatedDate) & 1) == 0)
  {
    v4 = (NSDate *)objc_msgSend(v6, "copy");
    feedUpdatedDate = self->_feedUpdatedDate;
    self->_feedUpdatedDate = v4;

    -[IMHandle postNotificationName:](self, "postNotificationName:", CFSTR("__kIMHandleFeedUpdatedDateChangedNotification"));
  }

}

- (NSString)offlineString
{
  double v3;
  void *v4;
  void *v5;
  double v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  signed int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;

  if (-[IMHandle status](self, "status") == 1)
  {
    -[IMHandle timeSinceWentOffline](self, "timeSinceWentOffline");
    if (v3 >= 0.0)
    {
      sub_1A20F1964();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMHandle timeSinceStatusChanged](self, "timeSinceStatusChanged");
      v7 = (int)(v6 / 60.0);
      v8 = (v7 % 60);
      v9 = (v7 / 60 % 24);
      if (v7 >= 1440)
      {
        v10 = -(v7 / 0x5A0u);
        v11 = objc_alloc_init(MEMORY[0x1E0C99D78]);
        objc_msgSend(v11, "setDay:", v10);
        objc_msgSend(v11, "setHour:", -(int)v9);
        objc_msgSend(v11, "setMinute:", -(int)v8);
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "dateByAddingComponents:toDate:options:", v11, v13, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_alloc_init(MEMORY[0x1E0CB3578]);
        objc_msgSend(v15, "setFormatterBehavior:", 1040);
        objc_msgSend(v15, "setDateStyle:", 2);
        objc_msgSend(v15, "setTimeStyle:", 1);
        objc_msgSend(v15, "stringFromDate:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Logged out %@"), &stru_1E4725068, CFSTR("IMCoreLocalizable"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", v18, v16);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
        return (NSString *)v4;
      }
      if ((_DWORD)v9 == 1)
      {
        if ((int)v8 >= 2)
        {
          v19 = (void *)MEMORY[0x1E0CB3940];
          v20 = CFSTR("Logged out 1 hour %@ minutes ago");
          goto LABEL_12;
        }
        v28 = CFSTR("Logged out 1 hour 1 minute ago");
      }
      else
      {
        if ((_DWORD)v9)
        {
          v24 = (void *)MEMORY[0x1E0CB3940];
          if ((_DWORD)v8 == 1)
          {
            objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Logged out %@ hours 1 minute ago"), &stru_1E4725068, CFSTR("IMCoreLocalizable"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "localizedString");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "stringWithFormat:", v25, v27);
            v4 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Logged out %@ hours %@ minutes ago"), &stru_1E4725068, CFSTR("IMCoreLocalizable"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "localizedString");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "localizedString");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "stringWithFormat:", v25, v27, v30);
            v4 = (void *)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_22;
        }
        if ((int)v8 >= 2)
        {
          v19 = (void *)MEMORY[0x1E0CB3940];
          v20 = CFSTR("Logged out %@ minutes ago");
LABEL_12:
          objc_msgSend(v5, "localizedStringForKey:value:table:", v20, &stru_1E4725068, CFSTR("IMCoreLocalizable"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "localizedString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringWithFormat:", v21, v23);
          v4 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_22;
        }
        if ((_DWORD)v8 == 1)
          v28 = CFSTR("Logged out 1 minute ago");
        else
          v28 = CFSTR("Logged out under a minute ago");
      }
      objc_msgSend(v5, "localizedStringForKey:value:table:", v28, &stru_1E4725068, CFSTR("IMCoreLocalizable"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    }
  }
  v4 = 0;
  return (NSString *)v4;
}

- (NSString)idleString
{
  unint64_t v3;
  double v4;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  int v12;
  id v13;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v3 = -[IMHandle status](self, "status");
  -[IMHandle idleTime](self, "idleTime");
  if (v4 > 0.0 || v3 == 2)
  {
    v6 = v4;
    sub_1A20F1964();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMHandle nameOfStatus:](IMHandle, "nameOfStatus:", 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v6 > 0.0
      && (v10 = (int)(v6 / 60.0), v11 = (v10 % 60), v12 = v10 / 60 % 24, v12 | v11))
    {
      if (v10 >= 1440)
      {
        v15 = objc_alloc_init(MEMORY[0x1E0C99D78]);
        objc_msgSend(v15, "setDay:", (int)(((int)(((unint64_t)(1240768329 * v10) >> 32) - v10) >> 10)+ ((((unint64_t)(1240768329 * v10) >> 32) - v10) >> 31)));
        objc_msgSend(v15, "setHour:", -v12);
        objc_msgSend(v15, "setMinute:", -(int)v11);
        objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "dateByAddingComponents:toDate:options:", v15, v17, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10 >> 5 < 0x13B)
        {
          if (!qword_1EE65F4F8)
          {
            v29 = objc_alloc_init(MEMORY[0x1E0CB3578]);
            v30 = (void *)qword_1EE65F4F8;
            qword_1EE65F4F8 = (uint64_t)v29;

            objc_msgSend((id)qword_1EE65F4F8, "setFormatterBehavior:", 1040);
            objc_msgSend((id)qword_1EE65F4F8, "setDateStyle:", 0);
            objc_msgSend((id)qword_1EE65F4F8, "setTimeStyle:", 1);
          }
          if (!qword_1EE65F500)
          {
            v31 = objc_alloc_init(MEMORY[0x1E0CB3578]);
            v32 = (void *)qword_1EE65F500;
            qword_1EE65F500 = (uint64_t)v31;

            objc_msgSend((id)qword_1EE65F500, "setFormatterBehavior:", 1040);
            objc_msgSend((id)qword_1EE65F500, "setDateStyle:", 0);
            objc_msgSend((id)qword_1EE65F500, "setTimeStyle:", 1);
            objc_msgSend((id)qword_1EE65F500, "setDateFormat:", CFSTR("EEE"));
          }
          objc_msgSend((id)qword_1EE65F4F8, "stringFromDate:", v18);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)qword_1EE65F500, "stringFromDate:", v18);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v34, v33);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v19 = (void *)qword_1EE65F4F0;
          if (!qword_1EE65F4F0)
          {
            v20 = objc_alloc_init(MEMORY[0x1E0CB3578]);
            v21 = (void *)qword_1EE65F4F0;
            qword_1EE65F4F0 = (uint64_t)v20;

            objc_msgSend((id)qword_1EE65F4F0, "setFormatterBehavior:", 1040);
            objc_msgSend((id)qword_1EE65F4F0, "setDateStyle:", 2);
            objc_msgSend((id)qword_1EE65F4F0, "setTimeStyle:", 1);
            v19 = (void *)qword_1EE65F4F0;
          }
          objc_msgSend(v19, "stringFromDate:", v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v35 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%@ (Since %@)"), &stru_1E4725068, CFSTR("IMCoreLocalizable"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringWithFormat:", v36, v9, v22);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      v23 = (void *)MEMORY[0x1E0CB3940];
      if (v12)
      {
        if (!(_DWORD)v11)
        {
          objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%@ (%@ h)"), &stru_1E4725068, CFSTR("IMCoreLocalizable"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v10 / 60 % 24));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "localizedString");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringWithFormat:", v39, v9, v41);
          v13 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_9;
        }
        objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%@ (%@ h %@ min)"), &stru_1E4725068, CFSTR("IMCoreLocalizable"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v10 / 60 % 24));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localizedString");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "localizedString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", v24, v9, v26, v28);
        v13 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("%@ (%@ min)"), &stru_1E4725068, CFSTR("IMCoreLocalizable"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v10 % 60));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localizedString");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "stringWithFormat:", v24, v9, v38);
        v13 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v13 = v8;
    }
LABEL_9:

    return (NSString *)v13;
  }
  v13 = 0;
  return (NSString *)v13;
}

- (void)_filterStatusMessage
{
  NSString *statusMsg;
  NSString *v4;
  NSString *processedStatusMsg;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *v9;
  void *v10;

  if (!self->_processedStatusMsg)
  {
    statusMsg = self->_statusMsg;
    if (statusMsg)
    {
      if (-[NSString rangeOfString:](statusMsg, "rangeOfString:", CFSTR("%n")) == 0x7FFFFFFFFFFFFFFFLL)
      {
        v4 = (NSString *)-[NSString copy](self->_statusMsg, "copy");
        processedStatusMsg = self->_processedStatusMsg;
        self->_processedStatusMsg = v4;
      }
      else
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", self->_statusMsg);
        +[IMMe me](IMMe, "me");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "fullName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", CFSTR("%n"), v7, 2, 0, objc_msgSend(v10, "length"));

        v8 = (NSString *)objc_msgSend(v10, "copy");
        v9 = self->_processedStatusMsg;
        self->_processedStatusMsg = v8;

        processedStatusMsg = (NSString *)v10;
      }

    }
  }
}

- (NSString)statusMessage
{
  NSString *processedStatusMsg;

  processedStatusMsg = self->_processedStatusMsg;
  if (!processedStatusMsg)
  {
    -[IMHandle _filterStatusMessage](self, "_filterStatusMessage");
    processedStatusMsg = self->_processedStatusMsg;
  }
  return processedStatusMsg;
}

- (void)setStatus:(unint64_t)a3 message:(id)a4 richMessage:(id)a5
{
  id v8;
  NSString *v9;
  NSAttributedString *v10;
  NSString *v11;
  NSString *prevStatusMsg;
  void *v13;
  uint64_t v14;
  void *v15;
  NSString *v16;
  void *v17;
  NSString *v18;
  NSString *statusMsg;
  NSString *processedStatusMsg;
  NSAttributedString *v21;
  NSAttributedString *richStatusMsg;
  void *v23;
  uint64_t v24;
  NSString *v25;
  NSString *v26;
  unint64_t status;
  NSDate *v28;
  NSDate *whenStatusChanged;
  NSDate *whenWentOffline;
  NSDate *v31;
  id v32;

  v32 = a4;
  v8 = a5;
  if (v32 && (v8 || (objc_msgSend(v32, "isEqualToString:", self->_statusMsg) & 1) == 0))
  {
    objc_storeStrong((id *)&self->_prevStatusMsg, self->_statusMsg);
    v18 = (NSString *)objc_msgSend(v32, "copy");
    statusMsg = self->_statusMsg;
    self->_statusMsg = v18;

    processedStatusMsg = self->_processedStatusMsg;
    self->_processedStatusMsg = 0;

    v21 = (NSAttributedString *)objc_msgSend(v8, "copy");
    richStatusMsg = self->_richStatusMsg;
    self->_richStatusMsg = v21;

    if (a3 == 3)
    {
      -[NSString trimmedString](self->_statusMsg, "trimmedString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "length");

      if (!v24)
      {
        sub_1A20F1964();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Away"), &stru_1E4725068, CFSTR("IMCoreLocalizable"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (NSString *)objc_msgSend(v17, "copy");
        v26 = self->_statusMsg;
        self->_statusMsg = v25;

        goto LABEL_11;
      }
    }
LABEL_12:
    -[IMHandle _clearStatusMessageURLCache](self, "_clearStatusMessageURLCache");
    status = self->_status;
    if (status != a3)
    {
      self->_status = a3;
      self->_prevStatus = status;
    }
    v28 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
    whenStatusChanged = self->_whenStatusChanged;
    self->_whenStatusChanged = v28;

    if (IMPersonStatusIsOnline(self->_prevStatus) && !IMPersonStatusIsOnline(self->_status))
    {
      v31 = (NSDate *)objc_alloc_init(MEMORY[0x1E0C99D68]);
      whenWentOffline = self->_whenWentOffline;
      self->_whenWentOffline = v31;
    }
    else
    {
      if (!IMPersonStatusIsOnline(self->_status))
        goto LABEL_21;
      whenWentOffline = self->_whenWentOffline;
      if (!whenWentOffline)
        goto LABEL_21;
      self->_whenWentOffline = 0;
    }

LABEL_21:
    -[IMHandle postNotificationName:](self, "postNotificationName:", CFSTR("__kIMHandleStatusChangedNotification"));
    goto LABEL_22;
  }
  if (self->_status != a3)
  {
    v9 = self->_processedStatusMsg;
    self->_processedStatusMsg = 0;

    v10 = self->_richStatusMsg;
    self->_richStatusMsg = 0;

    v11 = (NSString *)-[NSString copy](self->_statusMsg, "copy");
    prevStatusMsg = self->_prevStatusMsg;
    self->_prevStatusMsg = v11;

    if (a3 == 3)
    {
      -[NSString trimmedString](self->_statusMsg, "trimmedString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "length");

      if (!v14)
      {
        sub_1A20F1964();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Away"), &stru_1E4725068, CFSTR("IMCoreLocalizable"));
        v16 = (NSString *)objc_claimAutoreleasedReturnValue();
        v17 = self->_statusMsg;
        self->_statusMsg = v16;
LABEL_11:

        goto LABEL_12;
      }
    }
    goto LABEL_12;
  }
LABEL_22:

}

- (double)timeSinceWentOffline
{
  NSDate *whenWentOffline;
  double v3;

  whenWentOffline = self->_whenWentOffline;
  if (!whenWentOffline)
    return -1.0;
  -[NSDate timeIntervalSinceNow](whenWentOffline, "timeIntervalSinceNow");
  return -v3;
}

- (double)timeSinceStatusChanged
{
  NSDate *whenStatusChanged;
  double v3;

  whenStatusChanged = self->_whenStatusChanged;
  if (!whenStatusChanged)
    return 99999.0;
  -[NSDate timeIntervalSinceNow](whenStatusChanged, "timeIntervalSinceNow");
  return -v3;
}

- (int64_t)offGridMode
{
  void *v3;
  int64_t v4;

  objc_msgSend(MEMORY[0x1E0D39878], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "offGridModeForHandle:", self);

  return v4;
}

- (void)autoInviteToViewOffGridModeIfNeededFromHandleID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCarrierPigeonEnabled");

  if (v6)
  {
    if (-[IMHandle matchesLoginHandleForAnyAccount](self, "matchesLoginHandleForAnyAccount"))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_DEBUG, "Not auto sharing off grid mode with myself", buf, 2u);
        }
LABEL_16:

      }
    }
    else if (-[IMHandle isContact](self, "isContact"))
    {
      -[IMHandle normalizedID](self, "normalizedID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v14 = v8;
          v15 = 2112;
          v16 = v4;
          _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_DEBUG, "Requesting to share personal off grid mode with handle: %@ fromHandle: %@", buf, 0x16u);
        }

      }
      objc_msgSend(MEMORY[0x1E0D39998], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = sub_1A209FBDC;
      v11[3] = &unk_1E4720760;
      v11[4] = self;
      v12 = v4;
      objc_msgSend(v10, "attemptIfNecessaryToAutomaticallyShareOffGridModeWithHandleID:fromHandleID:completion:", v8, v12, v11);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_DEBUG, "Not auto sharing off grid mode with non contact", buf, 2u);
      }
      goto LABEL_16;
    }
  }

}

- (int64_t)availability
{
  void *v3;
  int64_t v4;

  +[IMHandleAvailabilityManager sharedInstance](IMHandleAvailabilityManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "availabilityForHandle:", self);

  return v4;
}

- (NSDate)availabilityStatusPublishedDate
{
  void *v3;
  void *v4;

  +[IMHandleAvailabilityManager sharedInstance](IMHandleAvailabilityManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "availabilityStatusPublishedDateForHandle:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (id)beginObservingAvailability
{
  void *v3;
  void *v4;

  +[IMHandleStatusManager sharedInstance](IMHandleStatusManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "acquireObservationAssertionForHandle:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)isInvitedToViewMyFocusStatusFromHandleID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[IMHandle normalizedID](self, "normalizedID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D396E8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "isFocusStatusSharedWithHandleID:fromHandleID:completion:", v9, v7, v6);

}

- (void)autoInviteToViewAvailabilityIfNeededFromHandleID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[IMHandle matchesLoginHandleForAnyAccount](self, "matchesLoginHandleForAnyAccount"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_DEBUG, "Not auto sharing availability with myself", buf, 2u);
      }
LABEL_15:

    }
  }
  else if (-[IMHandle isContact](self, "isContact"))
  {
    -[IMHandle normalizedID](self, "normalizedID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v12 = v6;
        v13 = 2112;
        v14 = v4;
        _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_DEBUG, "Requesting to share personal availability with handle: %@ fromHandle: %@", buf, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x1E0D396E8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1A20A0100;
    v9[3] = &unk_1E4720788;
    v9[4] = self;
    v10 = v4;
    objc_msgSend(v8, "attemptIfNeccessaryToAutomaticallyShareFocusStatusWithHandleID:fromHandleID:completion:", v6, v10, v9);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_DEBUG, "Not auto sharing availability with non contact", buf, 2u);
    }
    goto LABEL_15;
  }

}

- (id)_nameForComparisonPreferFirst:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;

  v3 = a3;
  -[IMHandle uniqueName](self, "uniqueName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "length"))
  {
    if (v3)
    {
      -[IMHandle firstName](self, "firstName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "length"))
      {
        -[IMHandle lastName](self, "lastName");
        v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
        v10 = (void *)v8;

        if (!objc_msgSend(v10, "length"))
        {
          -[IMHandle name](self, "name");
          v6 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
        v9 = v10;
LABEL_11:
        v6 = v9;
        v10 = v9;
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      -[IMHandle lastName](self, "lastName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v7, "length"))
      {
        -[IMHandle firstName](self, "firstName");
        v8 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
    v9 = v7;
    goto LABEL_11;
  }
  v6 = v5;
LABEL_13:

  return v6;
}

- (int64_t)compareFirstNames:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[IMHandle _nameForComparisonPreferFirst:](self, "_nameForComparisonPreferFirst:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_nameForComparisonPreferFirst:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCompareToString:", v6);
  return v7;
}

- (int64_t)compareLastNames:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[IMHandle _nameForComparisonPreferFirst:](self, "_nameForComparisonPreferFirst:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_nameForComparisonPreferFirst:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCompareToString:", v6);
  return v7;
}

- (int64_t)compareStatus:(id)a3
{
  id v4;
  NSComparisonResult v5;

  v4 = a3;
  v5 = IMComparePersonStatus(-[IMHandle status](self, "status"), objc_msgSend(v4, "status"));
  if (v5 == NSOrderedSame)
    v5 = -[IMHandle compareIDs:](self, "compareIDs:", v4);

  return v5;
}

- (int64_t)compareIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int64_t v14;

  v4 = a3;
  -[IMHandle ID](self, "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_appearsToBePhoneNumber")
    && objc_msgSend(v6, "_appearsToBePhoneNumber"))
  {
    objc_msgSend(v4, "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "_wantsInternationizedNumbers") & 1) != 0)
    {
      -[IMHandle service](self, "service");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "_wantsInternationizedNumbers");

      if ((v9 & 1) != 0)
        goto LABEL_8;
    }
    else
    {

    }
    -[IMHandle countryCode](self, "countryCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    IMInternationalForPhoneNumberWithOptions();
    v11 = objc_claimAutoreleasedReturnValue();

    -[IMHandle countryCode](self, "countryCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    IMInternationalForPhoneNumberWithOptions();
    v13 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
    v6 = (void *)v13;
  }
LABEL_8:
  v14 = objc_msgSend(v5, "caseInsensitiveCompare:", v6);

  return v14;
}

- (int64_t)compareNormalizedIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[IMHandle normalizedID](self, "normalizedID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "normalizedID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (int64_t)compareAccountNames:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  v4 = a3;
  -[IMHandle account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "accountDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "localizedCompareToString:", v8);

  return v9;
}

- (BOOL)hasOtherSiblings
{
  void *v2;
  BOOL v3;

  -[IMHandle siblings](self, "siblings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (NSArray)siblingsArray
{
  void *v2;
  void *v3;

  -[IMHandle siblings](self, "siblings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

+ (id)filterIMHandlesForAccountSiblings:(id)a3 onAccount:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v21;
      do
      {
        v13 = 0;
        v14 = v11;
        do
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v8);
          v11 = *(id *)(*((_QWORD *)&v20 + 1) + 8 * v13);

          objc_msgSend(v11, "service", (_QWORD)v20);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "service");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15 == v16)
          {
            objc_msgSend(v11, "ID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "imHandleWithID:alreadyCanonical:", v17, 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18 && (objc_msgSend(v7, "containsObjectIdenticalTo:", v18) & 1) == 0)
              objc_msgSend(v7, "addObject:", v18);

          }
          ++v13;
          v14 = v11;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);

    }
  }
  else
  {
    +[IMHandle filterIMHandlesForBestAccountSiblings:](IMHandle, "filterIMHandlesForBestAccountSiblings:", v5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)filterIMHandlesForBestAccountSiblings:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "bestAccountSibling", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v4, "containsObjectIdenticalTo:", v10) & 1) == 0)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (NSArray)existingAccountSiblingsArray
{
  void *v3;
  void *v4;

  +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_existingAccountSiblingsForHandle:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (NSArray)accountSiblingsArray
{
  void *v3;
  void *v4;

  +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accountSiblingsForHandle:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (id)chatSiblingsArray
{
  void *v3;
  void *v4;

  +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_chatSiblingsForHandle:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSSet)siblings
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[IMHandleRegistrar sharedInstance](IMHandleRegistrar, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siblingsForIMHandle:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
    objc_msgSend(v3, "unionSet:", v5);
  -[IMHandle accountSiblingsArray](self, "accountSiblingsArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v3, "addObjectsFromArray:", v6);
  -[IMHandle chatSiblingsArray](self, "chatSiblingsArray");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v3, "addObjectsFromArray:", v7);

  return (NSSet *)v3;
}

- (BOOL)isAccountSiblingOf:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[IMHandle accountSiblingsArray](self, "accountSiblingsArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObjectIdenticalTo:", v4);

  return v6;
}

- (BOOL)isSiblingOf:(id)a3
{
  IMHandle *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;

  v4 = (IMHandle *)a3;
  if (v4 == self)
  {
    v6 = 1;
  }
  else
  {
    -[IMHandle siblings](self, "siblings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") == 1)
    {
      v6 = 0;
    }
    else
    {
      -[IMHandle service](v4, "service");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMHandle service](self, "service");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7 == v8
        && (-[IMHandle ID](v4, "ID"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            -[IMHandle ID](self, "ID"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = objc_msgSend(v9, "isEqualToString:", v10),
            v10,
            v9,
            (v11 & 1) != 0))
      {
        v6 = 1;
      }
      else
      {
        objc_msgSend(v5, "member:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v12 != 0;

      }
    }

  }
  return v6;
}

- (BOOL)_isChatSiblingOf:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMHandle ID](self, "ID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v4, "_contactID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMHandle _contactID](self, "_contactID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isEqualToString:", v9);

  }
  return v7;
}

- (id)_contactID
{
  void *v2;
  void *v3;

  -[IMHandle cnContactWithKeys:](self, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_chatSiblings
{
  void *v2;
  void *v3;

  -[IMHandle chatSiblingsArray](self, "chatSiblingsArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_bestChatSibling
{
  void *v2;
  void *v3;

  -[IMHandle _chatSiblingsArray](self, "_chatSiblingsArray");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMHandle bestIMHandleInArray:](IMHandle, "bestIMHandleInArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)capabilities
{
  void *v3;
  unint64_t capabilities;

  -[IMAccount loginIMHandle](self->_account, "loginIMHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMAccount isConnected](self->_account, "isConnected");
  capabilities = self->_capabilities;
  -[IMAccount defaultHandleCapabilities](self->_account, "defaultHandleCapabilities");

  return capabilities;
}

- (void)setCapabilities:(unint64_t)a3
{
  unint64_t capabilities;
  void *v5;
  void *v6;
  id v7;

  capabilities = self->_capabilities;
  if (-[IMHandle _setCapabilities:](self, "_setCapabilities:", a3))
  {
    v5 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", capabilities);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryWithObject:forKey:", v7, CFSTR("__kIMHandleCapabilitiesUserInfoOldCapsKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMHandle _postNotificationName:userInfo:](self, "_postNotificationName:userInfo:", CFSTR("__kIMHandleCapabilitiesChangedNotification"), v6);

  }
}

- (BOOL)_setCapabilities:(unint64_t)a3
{
  unint64_t capabilities;
  NSObject *v6;
  void *v7;
  int v9;
  IMHandle *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  capabilities = self->_capabilities;
  if (capabilities != a3)
  {
    self->_capabilities = a3;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        _IMStringFromFZCapabilities();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412546;
        v10 = self;
        v11 = 2112;
        v12 = v7;
        _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_DEBUG, "%@ capabilities changed: %@", (uint8_t *)&v9, 0x16u);

      }
    }
  }
  return capabilities != a3;
}

- (BOOL)hasCapability:(unint64_t)a3
{
  void *v5;
  int v6;
  BOOL result;

  -[IMHandle ID](self, "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_appearsToBePhoneNumber");

  if (!v6)
    return (a3 & ~-[IMHandle capabilities](self, "capabilities")) == 0;
  result = 0;
  if (a3 != 0x100000 && a3 != 0x400000)
    return (a3 & ~-[IMHandle capabilities](self, "capabilities")) == 0;
  return result;
}

- (BOOL)hasConferencing
{
  return (-[IMHandle capabilities](self, "capabilities") & 0x620000) != 0;
}

- (BOOL)isConferenceAvailable
{
  return -[IMHandle hasCapability:](self, "hasCapability:", 0x100000);
}

- (BOOL)hasVideo
{
  return -[IMHandle hasCapability:](self, "hasCapability:", 0x40000);
}

- (BOOL)hasMultiwayVideo
{
  _BOOL4 v3;

  v3 = -[IMHandle hasVideo](self, "hasVideo");
  if (v3)
    LOBYTE(v3) = -[IMHandle hasCapability:](self, "hasCapability:", 0x1000000);
  return v3;
}

- (BOOL)hasAudio
{
  void *v3;
  char v4;

  -[IMHandle ID](self, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_appearsToBePhoneNumber");

  if ((v4 & 1) != 0)
    return 0;
  if (-[IMHandle hasCapability:](self, "hasCapability:", 655360))
    return 1;
  return -[IMHandle hasCapability:](self, "hasCapability:", 0x400000);
}

- (BOOL)hasMultiwayAudio
{
  _BOOL4 v3;

  v3 = -[IMHandle hasAudio](self, "hasAudio");
  if (v3)
    LOBYTE(v3) = -[IMHandle hasCapability:](self, "hasCapability:", 0x800000);
  return v3;
}

- (void)_imPersonPictureChanged:(id)a3
{
  -[IMHandle postNotificationName:](self, "postNotificationName:", CFSTR("__kIMHandlePictureChangedNotification"));
}

- (void)setCustomPictureData:(id)a3
{
  id v5;

  v5 = a3;
  if ((IMSharedHelperAreObjectsLogicallySame() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_pictureData, a3);
    -[IMHandle customPictureDataChanged:key:](self, "customPictureDataChanged:key:", v5, 0);
    -[IMHandle postNotificationName:](self, "postNotificationName:", CFSTR("__kIMHandlePictureChangedNotification"));
  }

}

- (void)setCustomPictureData:(id)a3 key:(id)a4
{
  id v7;
  id v8;

  v8 = a3;
  v7 = a4;
  if ((IMSharedHelperAreObjectsLogicallySame() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_pictureData, a3);
    -[IMHandle postNotificationName:](self, "postNotificationName:", CFSTR("__kIMHandlePictureChangedNotification"));
    -[IMHandle customPictureDataChanged:key:](self, "customPictureDataChanged:key:", v8, v7);
  }

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *id;
  __CFString *v7;
  const __CFString *uncanonicalID;
  void *v9;
  CNContact *cnContact;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  id = self->_id;
  v7 = CFSTR("<None>");
  if (self->_uncanonicalID)
    uncanonicalID = (const __CFString *)self->_uncanonicalID;
  else
    uncanonicalID = CFSTR("<None>");
  -[IMHandle countryCode](self, "countryCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[IMHandle countryCode](self, "countryCode");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  cnContact = self->_cnContact;
  if (cnContact)
  {
    objc_msgSend(MEMORY[0x1E0D397A8], "descriptionForCNContact:", self->_cnContact);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = CFSTR("<No CNStore Match>");
  }
  -[IMAccount accountDescription](self->_account, "accountDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithObjects:", CFSTR("["), v5, CFSTR(": <"), id, CFSTR(":"), uncanonicalID, CFSTR(":"), v7, CFSTR("> (CNContact: "), v11, CFSTR(") (Account: "), v12, CFSTR("]"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)IMCreateSimpleComponentString();

  if (cnContact)
  if (v9)

  return v14;
}

- (DNDContactHandle)dndContactHandle
{
  DNDContactHandle *dndContactHandle;
  void *v4;
  uint64_t v5;
  id v6;
  DNDContactHandle *v7;
  DNDContactHandle *v8;

  dndContactHandle = self->_dndContactHandle;
  if (!dndContactHandle)
  {
    -[IMHandle ID](self, "ID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "_appearsToBeEmail"))
      v5 = 1;
    else
      v5 = 2;
    v6 = objc_alloc_init((Class)MEMORY[0x1A858292C](CFSTR("DNDMutableContactHandle"), CFSTR("DoNotDisturb")));
    objc_msgSend(v6, "setValue:", v4);
    objc_msgSend(v6, "setType:", v5);
    v7 = (DNDContactHandle *)objc_msgSend(v6, "copy");
    v8 = self->_dndContactHandle;
    self->_dndContactHandle = v7;

    dndContactHandle = self->_dndContactHandle;
  }
  return dndContactHandle;
}

- (IMBrandManager)brandManager
{
  IMBrandManager *brandManager;

  brandManager = self->_brandManager;
  if (brandManager)
    return brandManager;
  if ((IMIsRunningInUnitTesting() & 1) != 0)
    return (IMBrandManager *)0;
  objc_msgSend(MEMORY[0x1E0D39700], "sharedInstance");
  return (IMBrandManager *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_fetchBrandInfoForBrandWithURI:(id)a3 forType:(unint64_t)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _BYTE buf[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if ((IMIsRunningInMessagesComposeViewService() & 1) == 0)
  {
    if (v7)
    {
      if (!-[NSString isEqualToString:](self->_brandURI, "isEqualToString:", v7))
      {
        objc_storeStrong((id *)&self->_brandURI, a3);
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v7;
            _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_DEBUG, "Fetching business info for business with brandURI: %@", buf, 0xCu);
          }

        }
        *(_QWORD *)buf = 0;
        objc_initWeak((id *)buf, self);
        -[IMHandle brandManager](self, "brandManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = sub_1A20A17F0;
        v11[3] = &unk_1E47207B0;
        objc_copyWeak(&v13, (id *)buf);
        v12 = v7;
        objc_msgSend(v9, "brandWithURI:forType:completion:", v12, a4, v11);

        objc_destroyWeak(&v13);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      IMLogHandleForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_1A2196D34(v10);

    }
  }

}

- (void)_fetchBrandInfoForBusiness:(unint64_t)a3
{
  id v5;

  -[IMHandle ID](self, "ID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[IMHandle _fetchBrandInfoForBrandWithURI:forType:](self, "_fetchBrandInfoForBrandWithURI:forType:", v5, a3);

}

- (void)_fetchBrandInfoForRoadside
{
  _QWORD v2[4];
  id v3;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = sub_1A20A1A5C;
  v2[3] = &unk_1E471E460;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

- (void)_fetchedBrand:(id)a3 withBrandURI:(id)a4
{
  id v6;
  id v7;
  id v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  id *v12;
  id *v13;
  NSObject *v14;
  NSString *brandURI;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id location;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  NSString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if (-[NSString isEqualToString:](self->_brandURI, "isEqualToString:", v7))
    {
      -[IMHandle setBrand:](self, "setBrand:", v6);
      -[IMHandle _postOnScreenChangedNotificationForBrandProperty:](self, "_postOnScreenChangedNotificationForBrandProperty:", *MEMORY[0x1E0D373D8]);
      if ((sub_1A20F18A8() & 1) == 0)
      {
        location = 0;
        v8 = objc_initWeak(&location, self);
        v9 = -[IMHandle isChatBot](self, "isChatBot");

        if (v9)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v29 = v7;
              _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_DEBUG, "Fetching logo image data for brandURI: %@", buf, 0xCu);
            }

          }
          objc_msgSend(v6, "logoFingerprint");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = sub_1A20A1EAC;
          v24[3] = &unk_1E47207D8;
          v12 = &v26;
          objc_copyWeak(&v26, &location);
          v25 = v7;
          objc_msgSend(v6, "logoDataOfType:desiredSize:fingerprint:completion:", 2, v11, v24, 172.0, 172.0);

          v13 = &v25;
        }
        else
        {
          v16 = MEMORY[0x1E0C809B0];
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = sub_1A20A2050;
          v21[3] = &unk_1E47207D8;
          v12 = &v23;
          objc_copyWeak(&v23, &location);
          v17 = v7;
          v22 = v17;
          objc_msgSend(v6, "squareLogoDataForDesiredSize:completion:", v21, 172.0, 172.0);
          v18[0] = v16;
          v18[1] = 3221225472;
          v18[2] = sub_1A20A21F4;
          v18[3] = &unk_1E47207D8;
          objc_copyWeak(&v20, &location);
          v19 = v17;
          objc_msgSend(v6, "wideLogoDataForDesiredSize:completion:", v18, 540.0, 81.0);

          objc_destroyWeak(&v20);
          v13 = &v22;
        }

        objc_destroyWeak(v12);
        objc_destroyWeak(&location);
      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        brandURI = self->_brandURI;
        *(_DWORD *)buf = 138412546;
        v29 = v7;
        v30 = 2112;
        v31 = brandURI;
        _os_log_impl(&dword_1A1FF4000, v14, OS_LOG_TYPE_INFO, "Ignoring fetched brand for brandURI: %@, as it doesn't match current brandURI: %@", buf, 0x16u);
      }

    }
  }

}

- (void)_postOnScreenChangedNotificationForBrandProperty:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v11[0] = *MEMORY[0x1E0D37400];
  v4 = a3;
  -[IMHandle ID](self, "ID");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E4725068;
  if (v5)
    v7 = (const __CFString *)v5;
  v11[1] = *MEMORY[0x1E0D373F0];
  v12[0] = v7;
  v12[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "__mainThreadPostNotificationName:object:userInfo:", *MEMORY[0x1E0D37408], self, v8);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "__mainThreadPostNotificationName:object:userInfo:", *MEMORY[0x1E0D373D0], self, v8);
}

- (NSDictionary)extraProperties
{
  return self->_extraProps;
}

- (unint64_t)previousStatus
{
  return self->_prevStatus;
}

- (NSString)previousStatusMessage
{
  return self->_prevStatusMsg;
}

- (NSAttributedString)richStatusMessage
{
  return self->_richStatusMsg;
}

- (NSString)uniqueName
{
  return self->_uniqueName;
}

- (BOOL)hasSuggestedName
{
  return self->_hasSuggestedName;
}

- (void)setHasSuggestedName:(BOOL)a3
{
  self->_hasSuggestedName = a3;
}

- (void)setIDStatus:(int64_t)a3
{
  self->_IDStatus = a3;
}

- (unsigned)authRequestStatus
{
  return self->_authRequestStatus;
}

- (NSDate)feedUpdatedDate
{
  return self->_feedUpdatedDate;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (BOOL)isBot
{
  return self->_isBot;
}

- (BOOL)isMobile
{
  return self->_isMobile;
}

- (NSData)pictureData
{
  return self->_pictureData;
}

- (NSDictionary)otherServiceIDs
{
  return self->_otherServiceIDs;
}

- (void)setOtherServiceIDs:(id)a3
{
  objc_storeStrong((id *)&self->_otherServiceIDs, a3);
}

- (IMBrand)brand
{
  return self->_brand;
}

- (void)setBrand:(id)a3
{
  objc_storeStrong((id *)&self->_brand, a3);
}

- (NSData)brandSquareLogoImageData
{
  return self->_brandSquareLogoImageData;
}

- (void)setBrandSquareLogoImageData:(id)a3
{
  objc_storeStrong((id *)&self->_brandSquareLogoImageData, a3);
}

- (NSData)brandWideLogoImageData
{
  return self->_brandWideLogoImageData;
}

- (void)setBrandWideLogoImageData:(id)a3
{
  objc_storeStrong((id *)&self->_brandWideLogoImageData, a3);
}

- (void)setDndContactHandle:(id)a3
{
  objc_storeStrong((id *)&self->_dndContactHandle, a3);
}

- (void)setBrandManager:(id)a3
{
  objc_storeStrong((id *)&self->_brandManager, a3);
}

- (NSString)cachedDisplayNameWithAbbreviation
{
  return self->_cachedDisplayNameWithAbbreviation;
}

- (NSString)cachedName
{
  return self->_cachedName;
}

- (NSNumber)chatBot
{
  return self->_chatBot;
}

- (void)setChatBot:(id)a3
{
  objc_storeStrong((id *)&self->_chatBot, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatBot, 0);
  objc_storeStrong((id *)&self->_cachedName, 0);
  objc_storeStrong((id *)&self->_cachedDisplayNameWithAbbreviation, 0);
  objc_storeStrong((id *)&self->_suggestedName, 0);
  objc_storeStrong((id *)&self->_brandManager, 0);
  objc_storeStrong((id *)&self->_dndContactHandle, 0);
  objc_storeStrong((id *)&self->_brandWideLogoImageData, 0);
  objc_storeStrong((id *)&self->_brandSquareLogoImageData, 0);
  objc_storeStrong((id *)&self->_brand, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_cnContact, 0);
  objc_storeStrong((id *)&self->_personCentricID, 0);
  objc_storeStrong((id *)&self->_brandURI, 0);
  objc_storeStrong((id *)&self->_isApple, 0);
  objc_storeStrong((id *)&self->_isMako, 0);
  objc_storeStrong((id *)&self->_isBusiness, 0);
  objc_storeStrong((id *)&self->_formattedNumber, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_notificationNameQueue, 0);
  objc_storeStrong((id *)&self->_prevStatusMsg, 0);
  objc_storeStrong((id *)&self->_whenStatusChanged, 0);
  objc_storeStrong((id *)&self->_whenWentOffline, 0);
  objc_storeStrong((id *)&self->_richStatusMsg, 0);
  objc_storeStrong((id *)&self->_processedStatusMsg, 0);
  objc_storeStrong((id *)&self->_statusMsg, 0);
  objc_storeStrong((id *)&self->_pictureData, 0);
  objc_storeStrong((id *)&self->_uniqueName, 0);
  objc_storeStrong((id *)&self->_IDWithTrimmedServer, 0);
  objc_storeStrong((id *)&self->_IDWithoutResource, 0);
  objc_storeStrong((id *)&self->_normalizedFormOfID, 0);
  objc_storeStrong((id *)&self->_emails, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_displayID, 0);
  objc_storeStrong((id *)&self->_cnNickname, 0);
  objc_storeStrong((id *)&self->_cnFullName, 0);
  objc_storeStrong((id *)&self->_cnLastName, 0);
  objc_storeStrong((id *)&self->_cnFirstName, 0);
  objc_storeStrong((id *)&self->_extraProps, 0);
  objc_storeStrong((id *)&self->_feedUpdatedDate, 0);
  objc_storeStrong((id *)&self->_idleSince, 0);
  objc_storeStrong((id *)&self->_otherServiceIDs, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_uncanonicalID, 0);
  objc_storeStrong((id *)&self->_id, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (void)beginNotificationQueue
{
  ++self->_notificationQueueCount;
}

- (void)releaseNotificationQueue
{
  int notificationQueueCount;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *notificationNameQueue;
  NSMutableArray *notificationQueue;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  notificationQueueCount = self->_notificationQueueCount;
  if (notificationQueueCount <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("IMHandle.m"), 3214, CFSTR("%@ unmatched notification queue release"), self);

    notificationQueueCount = self->_notificationQueueCount;
  }
  self->_notificationQueueCount = notificationQueueCount - 1;
  if (!-[IMHandle shouldQueueNotifications](self, "shouldQueueNotifications"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = (void *)-[NSMutableArray copy](self->_notificationQueue, "copy");
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          -[IMHandle _postNotification:](self, "_postNotification:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

    notificationNameQueue = self->_notificationNameQueue;
    self->_notificationNameQueue = 0;

    notificationQueue = self->_notificationQueue;
    self->_notificationQueue = 0;

  }
}

- (id)publicAPIPropertiesDictionary
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSDate *idleSince;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  int v23;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[IMHandle service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", CFSTR("SubNet")))
  {
    v6 = CFSTR("Bonjour");

    v5 = v6;
  }
  if (v5)
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("__kIMPersonServiceNameKey"));
  -[IMHandle ID](self, "ID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[IMHandle ID](self, "ID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("__kIMPersonScreenNameKey"));

  }
  if (-[IMHandle isBuddy](self, "isBuddy"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[IMHandle status](self, "status"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("__kIMPersonStatusKey"));

    -[IMHandle statusMessage](self, "statusMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[IMHandle statusMessage](self, "statusMessage");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("__kIMPersonStatusMessageKey"));

    }
    idleSince = self->_idleSince;
    if (idleSince)
      objc_msgSend(v3, "setObject:forKey:", idleSince, CFSTR("__kIMPersonIdleSinceKey"));
    -[IMHandle firstName](self, "firstName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
      objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("__kIMPersonFirstNameKey"));
    -[IMHandle lastName](self, "lastName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
      objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("__kIMPersonLastNameKey"));
    -[IMHandle email](self, "email");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[IMHandle email](self, "email");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("__kIMPersonEmailKey"));

    }
    -[IMHandle pictureData](self, "pictureData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[IMHandle pictureData](self, "pictureData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("__kIMPersonPictureDataKey"));

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[IMHandle hasCapability:](self, "hasCapability:", 0x100000) ^ 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("__kIMPersonAVBusyKey"));

    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (-[IMHandle hasCapability:](self, "hasCapability:", 1024))
      objc_msgSend(v20, "addObject:", CFSTR("__kIMCapabilityText"));
    if (-[IMHandle hasCapability:](self, "hasCapability:", 32))
      objc_msgSend(v20, "addObject:", CFSTR("__kIMCapabilityFileTransfer"));
    if (-[IMHandle hasCapability:](self, "hasCapability:", 655360)
      || -[IMHandle hasCapability:](self, "hasCapability:", 4718592))
    {
      objc_msgSend(v20, "addObject:", CFSTR("__kIMCapabilityAudioConference"));
    }
    if (-[IMHandle hasCapability:](self, "hasCapability:", 393216)
      || -[IMHandle hasCapability:](self, "hasCapability:", 2359296))
    {
      objc_msgSend(v20, "addObject:", CFSTR("__kIMCapabilityVideoConference"));
    }
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "listener");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "vcCapabilities");

    if ((~v23 & 0xA0000) != 0
      || (objc_msgSend(v20, "containsObject:", CFSTR("__kIMCapabilityAudioConference")) & 1) == 0)
    {
      objc_msgSend(v20, "removeObject:", CFSTR("__kIMCapabilityAudioConference"));
    }
    if ((v23 & 0x40000) == 0
      || (*(_QWORD *)&v23 & 0x220000) == 0
      || (objc_msgSend(v20, "containsObject:", CFSTR("__kIMCapabilityVideoConference")) & 1) == 0)
    {
      objc_msgSend(v20, "removeObject:", CFSTR("__kIMCapabilityVideoConference"));
    }
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("__kIMPersonCapabilitiesKey"));
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("__kIMPersonAllowedCapabilitiesKey"));

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("__kIMPersonStatusKey"));
  }

  return v3;
}

+ (void)bestHandlesForContacts:(id)a3 completion:(id)a4
{
  objc_msgSend(a1, "bestHandlesForContacts:useExtendedAsyncLookup:completion:", a3, 1, a4);
}

+ (void)bestHandlesForContacts:(id)a3 useExtendedAsyncLookup:(BOOL)a4 completion:(id)a5
{
  MEMORY[0x1E0DE7D20](a1, sel_handlesForContacts_useBestHandle_useExtendedAsyncLookup_completion_);
}

+ (void)validHandlesForContacts:(id)a3 completion:(id)a4
{
  MEMORY[0x1E0DE7D20](a1, sel_validHandlesForContacts_useExtendedAsyncLookup_completion_);
}

+ (void)validHandlesForContacts:(id)a3 useExtendedAsyncLookup:(BOOL)a4 completion:(id)a5
{
  MEMORY[0x1E0DE7D20](a1, sel_handlesForContacts_useBestHandle_useExtendedAsyncLookup_completion_);
}

+ (void)handlesForContacts:(id)a3 useBestHandle:(BOOL)a4 useExtendedAsyncLookup:(BOOL)a5 completion:(id)a6
{
  id v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  __CFString *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  id v81;
  NSObject *v82;
  uint64_t v83;
  char v84;
  int v85;
  id v86;
  id obj;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  uint64_t i;
  void *v93;
  void *v94;
  __CFString *v95;
  id v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  __CFString *v100;
  uint64_t v101;
  id v102;
  _QWORD v103[4];
  id v104;
  id v105;
  id v106;
  id v107;
  char v108;
  _QWORD v109[4];
  id v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  _BYTE v128[128];
  uint8_t v129[128];
  _BYTE buf[24];
  const __CFString *v131;
  id v132;
  uint64_t v133;

  LODWORD(v83) = a4;
  HIDWORD(v83) = a5;
  v133 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v86 = a6;
  v98 = v7;
  v8 = objc_msgSend(v7, "count");
  v9 = IMOSLoggingEnabled();
  if (!v8)
  {
    if (v9)
    {
      OSLogHandleForIMFoundationCategory();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v56, OS_LOG_TYPE_INFO, "[handlesForContacts] Received empty array of contacts", buf, 2u);
      }

    }
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v86 + 2))(v86, 0, 0, 0);
    goto LABEL_96;
  }
  if (v9)
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = CFSTR("NO");
      if ((_DWORD)v83)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v7;
      *(_QWORD *)&buf[14] = v12;
      *(_WORD *)&buf[12] = 2112;
      if (HIDWORD(v83))
        v11 = CFSTR("YES");
      *(_WORD *)&buf[22] = 2112;
      v131 = v11;
      _os_log_impl(&dword_1A1FF4000, v10, OS_LOG_TYPE_INFO, "[handlesForContacts] Attempting to identify best handles for contacts: %@ with conditions [useBestHandle:%@, useExtendedAsyncLookup:%@]", buf, 0x20u);
    }

  }
  +[IMChatRegistry sharedRegistry](IMChatRegistry, "sharedRegistry", v83);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cachedChats");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "__imArrayByFilteringWithBlock:", &unk_1E471D978);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "sortedArrayUsingComparator:", &unk_1E471C330);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  obj = v16;
  v89 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v129, 16);
  if (v89)
  {
    v88 = *(_QWORD *)v120;
    while (2)
    {
      for (i = 0; i != v89; ++i)
      {
        if (*(_QWORD *)v120 != v88)
          objc_enumerationMutation(obj);
        v95 = *(__CFString **)(*((_QWORD *)&v119 + 1) + 8 * i);
        -[__CFString contacts](v95, "contacts");
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v98, "intersectsSet:", v93))
        {
          if (objc_msgSend(v98, "isEqualToSet:", v93))
          {
            v17 = objc_msgSend(v93, "count");
            -[__CFString participants](v95, "participants");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v17) = v17 == objc_msgSend(v18, "count");

            if ((_DWORD)v17)
            {
              sub_1A20EFA54(v98, v95);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v62 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
                {
                  -[__CFString account](v95, "account");
                  v63 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)&buf[4] = v61;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v63;
                  *(_WORD *)&buf[22] = 2112;
                  v131 = v95;
                  _os_log_impl(&dword_1A1FF4000, v62, OS_LOG_TYPE_INFO, "[handlesForContacts] Attempt 1: Found handles: %@, account: %@, for union match chat: %@", buf, 0x20u);

                }
              }
              -[__CFString account](v95, "account");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, void *, void *, __CFString *))v86 + 2))(v86, v61, v64, v95);

              v41 = obj;
              goto LABEL_95;
            }
          }
          -[__CFString chatIdentifier](v95, "chatIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "setObject:forKeyedSubscript:", v93, v19);

          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          v117 = 0u;
          v118 = 0u;
          v115 = 0u;
          v116 = 0u;
          v96 = v93;
          v99 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v115, v128, 16);
          if (v99)
          {
            v97 = *(_QWORD *)v116;
            do
            {
              v20 = 0;
              do
              {
                if (*(_QWORD *)v116 != v97)
                {
                  v21 = v20;
                  objc_enumerationMutation(v96);
                  v20 = v21;
                }
                v101 = v20;
                v22 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v20);
                if (objc_msgSend(v98, "containsObject:", v22))
                {
                  v102 = v22;
                  v100 = v95;
                  -[__CFString account](v100, "account");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  v125 = 0u;
                  v126 = 0u;
                  v123 = 0u;
                  v124 = 0u;
                  -[__CFString participants](v100, "participants");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v123, buf, 16);
                  if (v25)
                  {
                    v26 = *(_QWORD *)v124;
                    while (2)
                    {
                      for (j = 0; j != v25; ++j)
                      {
                        if (*(_QWORD *)v124 != v26)
                          objc_enumerationMutation(v24);
                        objc_msgSend(*(id *)(*((_QWORD *)&v123 + 1) + 8 * j), "ID");
                        v28 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v23, "imHandleWithID:", v28);
                        v29 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_msgSend(v29, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
                        v30 = (void *)objc_claimAutoreleasedReturnValue();
                        v31 = v30;
                        if (v30)
                        {
                          objc_msgSend(v30, "identifier");
                          v32 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v102, "identifier");
                          v33 = (void *)objc_claimAutoreleasedReturnValue();
                          v34 = objc_msgSend(v32, "isEqualToString:", v33);

                          if ((v34 & 1) != 0)
                          {

                            goto LABEL_36;
                          }
                        }

                      }
                      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v123, buf, 16);
                      if (v25)
                        continue;
                      break;
                    }
                  }
                  v29 = 0;
LABEL_36:

                  objc_msgSend(v102, "identifier");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v94, "setObject:forKeyedSubscript:", v29, v35);

                }
                v20 = v101 + 1;
              }
              while (v101 + 1 != v99);
              v99 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v115, v128, 16);
            }
            while (v99);
          }

          -[__CFString account](v95, "account");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "uniqueID");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v90, "objectForKeyedSubscript:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v36) = v38 == 0;

          if ((_DWORD)v36)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "setObject:forKeyedSubscript:", v39, v37);

          }
          objc_msgSend(v90, "objectForKeyedSubscript:", v37);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addEntriesFromDictionary:", v94);

        }
      }
      v89 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v119, v129, 16);
      if (v89)
        continue;
      break;
    }
  }

  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v41 = obj;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v111, v127, 16);
  if (v42)
  {
    v43 = *(_QWORD *)v112;
    while (2)
    {
      for (k = 0; k != v42; ++k)
      {
        if (*(_QWORD *)v112 != v43)
          objc_enumerationMutation(v41);
        v45 = *(__CFString **)(*((_QWORD *)&v111 + 1) + 8 * k);
        -[__CFString chatIdentifier](v45, "chatIdentifier");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "objectForKeyedSubscript:", v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        if (v47 && objc_msgSend(v98, "isSubsetOfSet:", v47))
        {
          sub_1A20EFA54(v98, v45);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v58 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
            {
              -[__CFString account](v45, "account");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v57;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v59;
              *(_WORD *)&buf[22] = 2112;
              v131 = v45;
              _os_log_impl(&dword_1A1FF4000, v58, OS_LOG_TYPE_INFO, "[handlesForContacts] Attempt 2: Found handles: %@, account: %@, for subset match chat: %@", buf, 0x20u);

            }
          }
          -[__CFString account](v45, "account");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, void *, void *, _QWORD))v86 + 2))(v86, v57, v60, 0);

          goto LABEL_95;
        }

      }
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v111, v127, 16);
      if (v42)
        continue;
      break;
    }
  }

  v48 = MEMORY[0x1E0C809B0];
  v109[0] = MEMORY[0x1E0C809B0];
  v109[1] = 3221225472;
  v109[2] = sub_1A20EFC30;
  v109[3] = &unk_1E4721FE0;
  v49 = v98;
  v110 = v49;
  objc_msgSend(v90, "keysOfEntriesPassingTest:", v109);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v50, "count") == 1)
  {
    objc_msgSend(v50, "anyObject");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "objectForKeyedSubscript:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v52;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v51;
        _os_log_impl(&dword_1A1FF4000, v53, OS_LOG_TYPE_INFO, "[handlesForContacts] Attempt 3: Found handles: %@ for account: %@ that contacted all recipients", buf, 0x16u);
      }

    }
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "accountForUniqueID:", v51);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, void *, _QWORD))v86 + 2))(v86, v52, v55, 0);

    goto LABEL_94;
  }
  if ((unint64_t)objc_msgSend(v50, "count") < 2)
    goto LABEL_87;
  v65 = v50;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[IMServiceImpl iMessageEnabledForSenderLastAddressedHandle:simID:](IMServiceImpl, "iMessageEnabledForSenderLastAddressedHandle:simID:", 0, 0))
  {
    +[IMService iMessageService](IMService, "iMessageService");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "name");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setObject:forKeyedSubscript:", &unk_1E475ED48, v68);
LABEL_79:

    goto LABEL_80;
  }
  if (+[IMServiceImpl smsEnabled](IMServiceImpl, "smsEnabled"))
  {
    +[IMService smsService](IMService, "smsService");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "name");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setObject:forKeyedSubscript:", &unk_1E475ED60, v68);
    goto LABEL_79;
  }
LABEL_80:
  objc_msgSend(v65, "allObjects");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = v48;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = sub_1A20F0B74;
  v131 = (const __CFString *)&unk_1E471EAE8;
  v132 = v66;
  v70 = v66;
  objc_msgSend(v69, "sortedArrayUsingComparator:", buf);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "objectAtIndexedSubscript:", 0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v72, "length"))
  {
    objc_msgSend(v90, "objectForKeyedSubscript:", v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v74 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v72;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v73;
        _os_log_impl(&dword_1A1FF4000, v74, OS_LOG_TYPE_INFO, "[handlesForContacts] Attempt 3: Selected best account: %@ that messaged all handles: %@", buf, 0x16u);
      }

    }
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "accountForUniqueID:", v72);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, void *, _QWORD))v86 + 2))(v86, v73, v76, 0);

    goto LABEL_94;
  }

LABEL_87:
  if (v85)
  {
    sub_1A20EFC68(v49);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1A20EFE10(v49);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = (void *)*MEMORY[0x1E0D34240];
    v103[0] = v48;
    v103[1] = 3221225472;
    v103[2] = sub_1A20F0050;
    v103[3] = &unk_1E4722030;
    v108 = v84;
    v104 = v78;
    v105 = v49;
    v106 = v77;
    v107 = v86;
    v80 = v77;
    v81 = v78;
    sub_1A20EFFB0(v80, v79, v103);

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v82 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1FF4000, v82, OS_LOG_TYPE_INFO, "[handlesForContacts] Failed to find handles for contacts", buf, 2u);
      }

    }
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v86 + 2))(v86, 0, 0, 0);
  }
LABEL_94:

  v41 = v110;
LABEL_95:

LABEL_96:
}

- (id)fmfHandle
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = MEMORY[0x1A858292C](CFSTR("FMFHandle"), CFSTR("FMF"));
  if (v3)
  {
    v4 = (void *)v3;
    -[IMHandle ID](self, "ID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleWithId:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)findMyHandle
{
  void *v2;
  void *v3;

  -[IMHandle ID](self, "ID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMFindMyHandle handleWithIdentifier:](IMFindMyHandle, "handleWithIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)findMySiblingHandles
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMHandle cnContactWithKeys:](self, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(MEMORY[0x1E0D397A8], "phoneNumbersForCNContact:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v28 != v8)
            objc_enumerationMutation(v5);
          IMInternationalForPhoneNumberWithOptions();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          +[IMFindMyHandle handleWithIdentifier:](IMFindMyHandle, "handleWithIdentifier:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v7);
    }

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(MEMORY[0x1E0D397A8], "emailsForCNContact:", v4, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "lowercaseString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[IMFindMyHandle handleWithIdentifier:](IMFindMyHandle, "handleWithIdentifier:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v14);
    }

  }
  else
  {
    -[IMHandle ID](self, "ID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMFindMyHandle handleWithIdentifier:](IMFindMyHandle, "handleWithIdentifier:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v20);
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)isChatBot
{
  IMHandle *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_1A218D330();

  return v3 & 1;
}

@end
