@implementation IMDExposureNotificationManager

+ (id)sharedInstance
{
  if (qword_1ED935C30 != -1)
    dispatch_once(&qword_1ED935C30, &unk_1E922ACD0);
  if (qword_1ED935C80 != -1)
    dispatch_once(&qword_1ED935C80, &unk_1E922ACF0);
  if (qword_1ED935D50 != -1)
    dispatch_once(&qword_1ED935D50, &unk_1E922AD10);
  return (id)qword_1ED935DB0;
}

- (id)_enManager
{
  if (qword_1ED935F78 != -1)
    dispatch_once(&qword_1ED935F78, &unk_1E922AD30);
  return (id)qword_1ED935F70;
}

- (id)_allowedDomains
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("en-push-allow-domains"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = v3;
  else
    v4 = &unk_1E9271910;
  v5 = v4;

  return v5;
}

- (BOOL)_bagDisabled
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x1E0D34E78], "sharedInstanceForBagType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("en-push-disabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)_isMessageItemEligibleForEN:(id)a3
{
  id v4;
  char v5;
  void *v6;

  v4 = a3;
  if (-[IMDExposureNotificationManager _bagDisabled](self, "_bagDisabled") || (objc_msgSend(v4, "isFromMe") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "service");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D38F58]);

  }
  return v5;
}

- (id)_enURLsForMessageBody:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = *MEMORY[0x1E0D365F0];
  v8 = objc_msgSend(v5, "length");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1D14AE17C;
  v13[3] = &unk_1E922AD78;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v8, 0, v13);

  v10 = v14;
  v11 = v9;

  return v11;
}

- (id)_enTextMessageForMessageBody:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (qword_1EFC63CF0 != -1)
    dispatch_once(&qword_1EFC63CF0, &unk_1E922AD98);
  if (qword_1EFC63CE8)
  {
    -[IMDExposureNotificationManager _enURLsForMessageBody:](self, "_enURLsForMessageBody:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v6 = (void *)qword_1EFC63CE8;
      objc_msgSend(v4, "string");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "textMessageWithMessage:embeddedURLs:", v7, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)processMessageItemForENURL:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  __int16 v13;
  _QWORD v14[4];
  void (**v15)(id, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend(v6, "body");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[IMDExposureNotificationManager _isMessageItemEligibleForEN:](self, "_isMessageItemEligibleForEN:", v6) && v8)
  {
    -[IMDExposureNotificationManager _enManager](self, "_enManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "exposureNotificationEnabled"))
    {
      v7[2](v7, 0);
LABEL_15:

      goto LABEL_16;
    }
    -[IMDExposureNotificationManager _enTextMessageForMessageBody:](self, "_enTextMessageForMessageBody:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = objc_opt_respondsToSelector();
      if ((v11 & 1) != 0)
      {
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = sub_1D14AE544;
        v14[3] = &unk_1E922A238;
        v15 = v7;
        objc_msgSend(v9, "verifyTextMessage:completionHandler:", v10, v14);

LABEL_14:
        goto LABEL_15;
      }
      if (IMOSLoggingEnabled(v11))
      {
        OSLogHandleForIMFoundationCategory();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = 0;
          _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Running on an old build - unable to run through ENManager", (uint8_t *)&v13, 2u);
        }

      }
    }
    v7[2](v7, 0);
    goto LABEL_14;
  }
  v7[2](v7, 0);
LABEL_16:

}

@end
