@implementation IMCollaborationNoticeDispatcher

- (IMCollaborationNoticeDispatcher)init
{
  IMCollaborationNoticeDispatcher *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)IMCollaborationNoticeDispatcher;
  v2 = -[IMCollaborationNoticeDispatcher init](&v8, sel_init);
  v3 = IMOSLoggingEnabled();
  if (v2)
  {
    if (v3)
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1A1FF4000, v4, OS_LOG_TYPE_INFO, "Success init", v7, 2u);
      }

    }
    -[IMCollaborationNoticeDispatcher setUpConnectionToDaemon](v2, "setUpConnectionToDaemon");
  }
  else if (v3)
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "IMCollaborationNoticeDispatcher failed init", v7, 2u);
    }

  }
  return v2;
}

- (void)sendNotice:(id)a3 toHandles:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Connecting to daemon to send notice %@ to %@", buf, 0x16u);
    }

  }
  -[IMCollaborationNoticeDispatcher daemonConnection](self, "daemonConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1A20AB8C0;
  v16[3] = &unk_1E471F438;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v12, "connectWithCompletion:", v16);

}

- (void)sendClearNotice:(id)a3 toHandles:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Connecting to daemon to send clear notice %@ to %@", buf, 0x16u);
    }

  }
  -[IMCollaborationNoticeDispatcher daemonConnection](self, "daemonConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1A20ABD88;
  v16[3] = &unk_1E471F438;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v12, "connectWithCompletion:", v16);

}

- (id)_bestSendingHandle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  +[IMServiceImpl serviceWithInternalName:](IMServiceImpl, "serviceWithInternalName:", *MEMORY[0x1E0D38F68]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bestAccountForService:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "loginIMHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1A8582830]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "_appearsToBeEmail"))
    v8 = MEMORY[0x1A8581F9C](v7);
  else
    v8 = IDSCopyIDForPhoneNumber();
  v9 = (void *)v8;

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[IMCollaborationNoticeDispatcher disconnectFromDaemon](self, "disconnectFromDaemon");
  -[IMCollaborationNoticeDispatcher setDaemonConnection:](self, "setDaemonConnection:", 0);
  v3.receiver = self;
  v3.super_class = (Class)IMCollaborationNoticeDispatcher;
  -[IMCollaborationNoticeDispatcher dealloc](&v3, sel_dealloc);
}

- (void)setUpConnectionToDaemon
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  IMDaemonMultiplexedConnectionManaging *v7;
  IMDaemonMultiplexedConnectionManaging *daemonConnection;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = (objc_class *)objc_opt_class();
      NSStringFromClass(v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Setting up connection for %@", (uint8_t *)&v9, 0xCu);

    }
  }
  +[IMDaemonController sharedController](IMDaemonController, "sharedController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "multiplexedConnectionWithLabel:capabilities:context:", CFSTR("com.apple.IMCore.IMCollaborationNoticeDispatcher"), 512, 0);
  v7 = (IMDaemonMultiplexedConnectionManaging *)objc_claimAutoreleasedReturnValue();
  daemonConnection = self->_daemonConnection;
  self->_daemonConnection = v7;

}

- (void)disconnectFromDaemon
{
  -[IMDaemonMultiplexedConnectionManaging invalidate](self->_daemonConnection, "invalidate");
}

- (IMDaemonMultiplexedConnectionManaging)daemonConnection
{
  return self->_daemonConnection;
}

- (void)setDaemonConnection:(id)a3
{
  objc_storeStrong((id *)&self->_daemonConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemonConnection, 0);
}

@end
