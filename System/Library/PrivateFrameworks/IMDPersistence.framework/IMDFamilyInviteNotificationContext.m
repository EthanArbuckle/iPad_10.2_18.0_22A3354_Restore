@implementation IMDFamilyInviteNotificationContext

- (BOOL)inviteeIsTeen
{
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  uint64_t v10;
  void *v11;
  id v12;
  uint8_t buf[8];
  uint64_t v14;
  Class (*v15)(uint64_t);
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v2 = (void *)qword_1EEC405E0;
  v21 = qword_1EEC405E0;
  if (!qword_1EEC405E0)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = sub_1ABC04814;
    v16 = &unk_1E5AB0C88;
    v17 = &v18;
    sub_1ABC04814((uint64_t)buf);
    v2 = (void *)v19[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v18, 8);
  v4 = objc_alloc_init(v3);
  objc_msgSend(v4, "setCachePolicy:", 1);
  v12 = 0;
  objc_msgSend(v4, "fetchFamilyCircleWithError:", &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v6)
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1ABC61A8C((uint64_t)v6, v7);
LABEL_6:

    goto LABEL_7;
  }
  if (!v5)
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_7;
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "FAFetchFamilyCircleRequest returned nil", buf, 2u);
    }
    goto LABEL_6;
  }
  objc_msgSend(v5, "_serverResponse");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v10, "objectForKeyedSubscript:", CFSTR("age-category"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v10) = objc_msgSend(v11, "isEqualToString:", CFSTR("TEEN"));
  if ((v10 & 1) != 0)
  {
    v8 = 1;
    goto LABEL_8;
  }
LABEL_7:
  v8 = 0;
LABEL_8:

  return v8;
}

- (NSArray)actions
{
  NSArray *actions;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  actions = self->_actions;
  if (!actions)
  {
    v4 = (void *)MEMORY[0x1E0CEC700];
    v5 = *MEMORY[0x1E0D37E90];
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("VIEW_INVITATION"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionWithIdentifier:title:options:", v5, v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v9 = self->_actions;
    self->_actions = v8;

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
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  CFMutableDictionaryRef Mutable;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[IMDFamilyInviteNotificationContext canPopulateUserInfoForMessageBalloonBundleID:](self, "canPopulateUserInfoForMessageBalloonBundleID:", v9))goto LABEL_28;
  objc_msgSend(v8, "setCategoryIdentifier:", *MEMORY[0x1E0D38BF8]);
  IMDictionaryFromPayloadData();
  v11 = objc_claimAutoreleasedReturnValue();
  IMSanitizedURLForIMExtensionPayloadURLKey();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v12, 0);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "queryItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (!v14)
  {

    v17 = 0;
LABEL_30:
    IMSanitizedCaptionForIMExtensionPayloadUserInfoKey();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
      goto LABEL_31;
    goto LABEL_21;
  }
  v15 = v14;
  v32 = v12;
  v33 = v11;
  v34 = v10;
  v35 = v9;
  v36 = v8;
  v16 = 0;
  v17 = 0;
  v18 = *(_QWORD *)v39;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v39 != v18)
        objc_enumerationMutation(v13);
      v20 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
      if (!v16)
      {
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("messageSubTitle"));

        if (v22)
        {
          objc_msgSend(v20, "value");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = 0;
        }
      }
      objc_msgSend(v20, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "isEqualToString:", CFSTR("messageSubTitleTeen")))
      {
        v24 = -[IMDFamilyInviteNotificationContext inviteeIsTeen](self, "inviteeIsTeen");

        if (!v24)
          goto LABEL_15;
        objc_msgSend(v20, "value");
        v23 = v16;
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }

LABEL_15:
      objc_msgSend(v20, "name");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("messageTitle"));

      if (v26)
      {
        objc_msgSend(v20, "value");
        v27 = objc_claimAutoreleasedReturnValue();

        v17 = (void *)v27;
      }
    }
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  }
  while (v15);

  v9 = v35;
  v8 = v36;
  v11 = v33;
  v10 = v34;
  v12 = v32;
  if (!v16)
    goto LABEL_30;
  if (v17)
    goto LABEL_21;
LABEL_31:
  IMSanitizedAppNameForIMExtensionPayloadUserInfoKey();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:
  if (objc_msgSend(v17, "length"))
    objc_msgSend(v8, "setHeader:", v17);
  v28 = (void *)v11;
  if (objc_msgSend(v16, "length"))
    objc_msgSend(v8, "setBody:", v16);
  objc_msgSend(v8, "userInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = (CFMutableDictionaryRef)objc_msgSend(v29, "mutableCopy");

  if (!Mutable)
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  objc_msgSend(v12, "absoluteString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", v31, *MEMORY[0x1E0D38BD8]);

  -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D38BE8]);
  objc_msgSend(v8, "setUserInfo:", Mutable);
  objc_msgSend(v8, "setInterruptionLevel:", 2);

LABEL_28:
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
  v3 = *MEMORY[0x1E0D38BF8];
  -[IMDFamilyInviteNotificationContext actions](self, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("MADRID_MESSAGE_FORMAT"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("SINGLE_SUMMARY_FORMAT"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v2, "categoryWithIdentifier:actions:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:options:", v3, v4, MEMORY[0x1E0C9AA60], v5, v6, 12);
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
