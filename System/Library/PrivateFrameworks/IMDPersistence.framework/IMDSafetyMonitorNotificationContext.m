@implementation IMDSafetyMonitorNotificationContext

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

- (void)populateUserInfoForNotificationContent:(id)a3 messageBalloonBundleID:(id)a4 payloadData:(id)a5 chatIdentifier:(id)a6 isUrgentMessageTrigger:(BOOL *)a7 shouldSuppressNotification:(BOOL *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  CFMutableDictionaryRef Mutable;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  int v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  if (-[IMDSafetyMonitorNotificationContext canPopulateUserInfoForMessageBalloonBundleID:](self, "canPopulateUserInfoForMessageBalloonBundleID:", v15))
  {
    IMDictionaryFromPayloadData();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    IMSanitizedURLForIMExtensionPayloadURLKey();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0D39A00], "sharedCoordinator");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "notificationContentForInitiator:messageURL:content:", v17, v19, v14);

      if (v21 != 2)
      {
        if (v21 == 1)
          *a7 = 1;
        objc_msgSend(v14, "userInfo");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        Mutable = (CFMutableDictionaryRef)objc_msgSend(v22, "mutableCopy");

        if (!Mutable)
          Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        objc_msgSend(v19, "absoluteString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", v24, *MEMORY[0x1E0D38BD8]);

        -[__CFDictionary setObject:forKey:](Mutable, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D38BE8]);
        objc_msgSend(v14, "setUserInfo:", Mutable);

LABEL_18:
        goto LABEL_19;
      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_1ABB60000, v25, OS_LOG_TYPE_INFO, "Unable to extract URL from Message, supressing the notification", (uint8_t *)&v27, 2u);
      }

    }
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = 138412290;
        v28 = v19;
        _os_log_impl(&dword_1ABB60000, v26, OS_LOG_TYPE_INFO, "Supressing the notification for %@", (uint8_t *)&v27, 0xCu);
      }

    }
    *a8 = 1;
    goto LABEL_18;
  }
LABEL_19:

}

@end
