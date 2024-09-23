@implementation IMDScreenTimeAskNotificationContext

- (NSArray)actions
{
  NSArray *actions;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSArray *v20;
  NSArray *v21;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  actions = self->_actions;
  if (!actions)
  {
    v4 = (void *)MEMORY[0x1E0CEC700];
    v5 = *MEMORY[0x1E0D38D60];
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("APPROVE_FOR_15_MINUTES"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionWithIdentifier:title:options:", v5, v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CEC700];
    v9 = *MEMORY[0x1E0D38D70];
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("APPROVE_FOR_AN_HOUR"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "actionWithIdentifier:title:options:", v9, v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0CEC700];
    v13 = *MEMORY[0x1E0D38D58];
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("APPROVE_ALL_DAY"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "actionWithIdentifier:title:options:", v13, v14, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0CEC700];
    v17 = *MEMORY[0x1E0D38D68];
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("DONT_APPROVE"), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "actionWithIdentifier:title:options:", v17, v18, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v23[0] = v7;
    v23[1] = v11;
    v23[2] = v15;
    v23[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
    v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v21 = self->_actions;
    self->_actions = v20;

    actions = self->_actions;
  }
  return actions;
}

- (BOOL)canPopulateUserInfoForMessageBalloonBundleID:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  IMBalloonExtensionIDWithSuffix();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)populateUserInfoForNotificationContent:(id)a3 messageBalloonBundleID:(id)a4 payloadData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  CFMutableDictionaryRef Mutable;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  IMDAskToParser *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  uint64_t v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v43 = v9;
  if (-[IMDScreenTimeAskNotificationContext canPopulateUserInfoForMessageBalloonBundleID:](self, "canPopulateUserInfoForMessageBalloonBundleID:", v9))
  {
    objc_msgSend(v8, "setCategoryIdentifier:", *MEMORY[0x1E0D38C00]);
    v40 = v10;
    IMDictionaryFromPayloadData();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    IMSanitizedURLForIMExtensionPayloadURLKey();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = -[IMDAskToParser initWithUrl:]([IMDAskToParser alloc], "initWithUrl:", v44);
    -[IMDAskToParser notificationText](v42, "notificationText");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      -[IMDAskToParser summary](v42, "summary");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;

    -[IMDAskToParser questionIdentifier](v42, "questionIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1ABB60000, v16, OS_LOG_TYPE_INFO, "Could not find request identifier using AskTo bits. Looking in URL for request identifier instead.", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v44, 0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      objc_msgSend(v38, "queryItems");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      if (v15)
      {
        v18 = *(_QWORD *)v50;
        while (2)
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v50 != v18)
              objc_enumerationMutation(v17);
            v20 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v20, "name");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("requestID"));

            if (v22)
            {
              objc_msgSend(v20, "value");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_20;
            }
          }
          v15 = (void *)objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
          if (v15)
            continue;
          break;
        }
      }
LABEL_20:

    }
    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v44, 0);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      objc_msgSend(v39, "queryItems");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v46;
LABEL_24:
        v26 = 0;
        while (1)
        {
          if (*(_QWORD *)v46 != v25)
            objc_enumerationMutation(v23);
          v27 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v26);
          objc_msgSend(v27, "name");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("notificationCaption"));

          if ((v29 & 1) != 0)
            break;
          if (v24 == ++v26)
          {
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
            if (v24)
              goto LABEL_24;
            goto LABEL_30;
          }
        }
        objc_msgSend(v27, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          goto LABEL_33;
      }
      else
      {
LABEL_30:

      }
      IMSanitizedCaptionForIMExtensionPayloadUserInfoKey();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_33:
    if (objc_msgSend(v14, "length"))
      objc_msgSend(v8, "setBody:", v14);
    objc_msgSend(v8, "userInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    Mutable = (CFMutableDictionaryRef)objc_msgSend(v30, "mutableCopy");

    if (!Mutable)
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (v15)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v54 = (uint64_t)v15;
          _os_log_impl(&dword_1ABB60000, v32, OS_LOG_TYPE_INFO, "Adding request identifier to notification context: %@", buf, 0xCu);
        }

      }
      -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", v15, *MEMORY[0x1E0D38BE0]);
    }
    else if (v44)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v44, "absoluteString");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "lengthOfBytesUsingEncoding:", 4);
          *(_DWORD *)buf = 134217984;
          v54 = v35;
          _os_log_impl(&dword_1ABB60000, v33, OS_LOG_TYPE_INFO, "Couldn't find request identifier in URL. Attaching URL itself instead. url size is %zd", buf, 0xCu);

        }
      }
      objc_msgSend(v44, "absoluteString");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", v36, *MEMORY[0x1E0D38BD8]);

    }
    else
    {
      IMLogHandleForCategory();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        sub_1ABC5FE74(v37);

    }
    -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D38BE8]);
    objc_msgSend(v8, "setUserInfo:", Mutable);
    objc_msgSend(v8, "setInterruptionLevel:", 2);

    v10 = v40;
  }

}

- (id)notificationCategories
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CEC6D0];
  v3 = *MEMORY[0x1E0D38C00];
  -[IMDScreenTimeAskNotificationContext actions](self, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("MADRID_MESSAGE_FORMAT"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("SINGLE_SUMMARY_FORMAT"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v2, "categoryWithIdentifier:actions:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:options:", v3, v4, MEMORY[0x1E0C9AA60], v5, v6, 14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v10[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)setActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
}

@end
