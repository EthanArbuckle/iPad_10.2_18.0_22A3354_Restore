@implementation IMDAskToBuyNotificationContext

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
    v5 = *MEMORY[0x1E0D37428];
    objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("VIEW_ATB_OPTIONS"), 0);
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
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  CFMutableDictionaryRef Mutable;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (-[IMDAskToBuyNotificationContext canPopulateUserInfoForMessageBalloonBundleID:](self, "canPopulateUserInfoForMessageBalloonBundleID:", a4))
  {
    objc_msgSend(v8, "setCategoryIdentifier:", *MEMORY[0x1E0D38BD0]);
    IMDictionaryFromPayloadData();
    v23 = objc_claimAutoreleasedReturnValue();
    IMSanitizedURLForIMExtensionPayloadURLKey();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:");
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "queryItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v27;
LABEL_4:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v14);
        objc_msgSend(v15, "name");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("notificationCaption"));

        if ((v17 & 1) != 0)
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          if (v12)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      objc_msgSend(v15, "value");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)v23;
      if (v19)
        goto LABEL_13;
    }
    else
    {
LABEL_10:

      v18 = (void *)v23;
    }
    IMSanitizedCaptionForIMExtensionPayloadUserInfoKey();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    if (objc_msgSend(v19, "length"))
      objc_msgSend(v8, "setBody:", v19);
    objc_msgSend(v8, "userInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    Mutable = (CFMutableDictionaryRef)objc_msgSend(v20, "mutableCopy");

    if (!Mutable)
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    objc_msgSend(v25, "absoluteString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", v22, *MEMORY[0x1E0D38BD8]);

    -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D38BE8]);
    objc_msgSend(v8, "setUserInfo:", Mutable);
    objc_msgSend(v8, "setInterruptionLevel:", 2);

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
  v3 = *MEMORY[0x1E0D38BD0];
  -[IMDAskToBuyNotificationContext actions](self, "actions");
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
