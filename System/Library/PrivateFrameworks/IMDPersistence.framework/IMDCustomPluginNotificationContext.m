@implementation IMDCustomPluginNotificationContext

+ (id)logger
{
  if (qword_1EEC403E8 != -1)
    dispatch_once(&qword_1EEC403E8, &unk_1E5AAF048);
  return (id)qword_1EEC403E0;
}

- (id)logger
{
  return (id)objc_msgSend((id)objc_opt_class(), "logger");
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
  CFMutableDictionaryRef Mutable;
  void *v12;
  void *v13;
  IMDAskToParser *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  IMDAskToParser *v25;
  void *v26;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (-[IMDCustomPluginNotificationContext canPopulateUserInfoForMessageBalloonBundleID:](self, "canPopulateUserInfoForMessageBalloonBundleID:", a4))
  {
    objc_msgSend(v8, "setCategoryIdentifier:", *MEMORY[0x1E0D38BF0]);
    objc_msgSend(v8, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    Mutable = (CFMutableDictionaryRef)objc_msgSend(v10, "mutableCopy");

    if (!Mutable)
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    IMDictionaryFromPayloadData();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    IMSanitizedURLForIMExtensionPayloadURLKey();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[IMDAskToParser initWithUrl:]([IMDAskToParser alloc], "initWithUrl:", v13);
    -[IMDAskToParser notificationText](v14, "notificationText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      -[IMDAskToParser summary](v14, "summary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        v25 = v14;
        v26 = v12;
        v27 = v9;
        objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v13, 0);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "queryItems");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v30;
LABEL_8:
          v19 = 0;
          while (1)
          {
            if (*(_QWORD *)v30 != v18)
              objc_enumerationMutation(obj);
            v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v19);
            objc_msgSend(v20, "name");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("notificationCaption"));

            if ((v22 & 1) != 0)
              break;
            if (v17 == ++v19)
            {
              v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
              if (v17)
                goto LABEL_8;
              goto LABEL_14;
            }
          }
          objc_msgSend(v20, "value");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = v26;
          v9 = v27;
          v14 = v25;
          if (v15)
            goto LABEL_17;
        }
        else
        {
LABEL_14:

          v12 = v26;
          v9 = v27;
          v14 = v25;
        }
        IMSanitizedCaptionForIMExtensionPayloadUserInfoKey();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
LABEL_17:
    if (objc_msgSend(v15, "length"))
      objc_msgSend(v8, "setBody:", v15);
    if (v13)
    {
      objc_msgSend(v13, "absoluteString");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", v23, *MEMORY[0x1E0D38BD8]);

    }
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
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CEC6D0];
  v3 = *MEMORY[0x1E0D38BF0];
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("MADRID_MESSAGE_FORMAT"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedUserNotificationStringForKey:arguments:", CFSTR("SINGLE_SUMMARY_FORMAT"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C9AA60];
  objc_msgSend(v2, "categoryWithIdentifier:actions:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:options:", v3, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], v4, v5, 14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v9[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

@end
