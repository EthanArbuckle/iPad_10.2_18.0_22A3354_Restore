@implementation IMCollaborationNoticeController

+ (id)sharedInstance
{
  if (qword_1ECF125E0 != -1)
    dispatch_once(&qword_1ECF125E0, &unk_1E471DB98);
  return (id)qword_1ECF12640;
}

- (IMCollaborationNoticeController)init
{
  IMCollaborationNoticeController *v2;
  IMCollaborationNoticeController *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMCollaborationNoticeController;
  v2 = -[IMCollaborationNoticeController init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[IMCollaborationNoticeController listener](v2, "listener");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addHandler:", v3);

  }
  return v3;
}

- (void)dismissNotice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 136315394;
      v8 = "-[IMCollaborationNoticeController dismissNotice:]";
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "%s dismiss notice: %@", (uint8_t *)&v7, 0x16u);
    }

  }
  -[IMCollaborationNoticeController remoteDaemon](self, "remoteDaemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissNotice:", v4);

}

- (void)markAsViewedForNotice:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "dateViewed");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDateViewed:", v5);

    -[IMCollaborationNoticeController remoteDaemon](self, "remoteDaemon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateNotice:", v7);

  }
}

- (void)collaborationNoticesDidChangeForChatGUIDs:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Received notification of collaboration notice changes for guids: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__mainThreadPostNotificationName:object:", CFSTR("__kIMCollaborationNoticesDidChangeNotification"), v3);

}

- (void)fetchCollaborationNoticesForChatGUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[IMCollaborationNoticeController remoteDaemon](self, "remoteDaemon");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchCollaborationNoticesForChatGUID:reply:", v7, v6);

}

- (id)remoteDaemon
{
  void *v2;
  void *v3;

  +[IMDaemonController sharedController](IMDaemonController, "sharedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteDaemon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)listener
{
  void *v2;
  void *v3;

  +[IMDaemonController sharedController](IMDaemonController, "sharedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
