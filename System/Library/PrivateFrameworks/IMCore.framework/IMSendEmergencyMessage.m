@implementation IMSendEmergencyMessage

- (IMSendEmergencyMessage)init
{
  void *v3;
  IMSendEmergencyMessage *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  __int16 v10;
  __int16 v11;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[IMSendEmergencyMessage initWithDaemon:](self, "initWithDaemon:", v3);

  v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v11 = 0;
        v7 = "Success init";
        v8 = (uint8_t *)&v11;
LABEL_8:
        _os_log_impl(&dword_1A1FF4000, v6, OS_LOG_TYPE_INFO, v7, v8, 2u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if (v5)
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v10 = 0;
      v7 = "Failed init";
      v8 = (uint8_t *)&v10;
      goto LABEL_8;
    }
LABEL_9:

  }
  return v4;
}

- (void)sendEmergencyQuestionnaire:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Sending request to daemon to send emergency questionnaire", v6, 2u);
    }

  }
  -[IMDaemonProtocol sendEmergencyQuestionnaire:](self->_daemon, "sendEmergencyQuestionnaire:", v4);

}

- (void)locationUpdateSent
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Sending a location update", v4, 2u);
    }

  }
  -[IMDaemonProtocol locationUpdateSent](self->_daemon, "locationUpdateSent");
}

- (IMSendEmergencyMessage)initWithDaemon:(id)a3
{
  id v4;
  IMSendEmergencyMessage *v5;
  IMSendEmergencyMessage *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IMSendEmergencyMessage;
  v5 = -[IMSendEmergencyMessage init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[IMSendEmergencyMessage setDaemon:](v5, "setDaemon:", v4);
    -[IMSendEmergencyMessage setUpConnectionToDaemaon](v6, "setUpConnectionToDaemaon");
  }

  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[IMDaemonProtocol setDelegate:](self->_daemon, "setDelegate:", 0);
  -[IMSendEmergencyMessage setDaemon:](self, "setDaemon:", 0);
  v4.receiver = self;
  v4.super_class = (Class)IMSendEmergencyMessage;
  -[IMSendEmergencyMessage dealloc](&v4, sel_dealloc);
}

- (void)setUpConnectionToDaemaon
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t buf[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Setting up IMAgent connect for Stewie emergency message", buf, 2u);
    }

  }
  -[IMDaemonProtocol setDelegate:](self->_daemon, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-SendEmergencyMessage"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDaemonProtocol addListenerID:capabilities:](self->_daemon, "addListenerID:capabilities:", v6, *MEMORY[0x1E0D36D20]);
  -[IMDaemonProtocol connectToDaemonWithLaunch:capabilities:blockUntilConnected:](self->_daemon, "connectToDaemonWithLaunch:capabilities:blockUntilConnected:", 0, -[IMDaemonProtocol capabilities](self->_daemon, "capabilities"), 0);

}

- (void)daemonControllerDidDisconnect
{
  NSObject *v2;
  uint8_t v3[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1A1FF4000, v2, OS_LOG_TYPE_INFO, "Did disconnect from daemon", v3, 2u);
    }

  }
}

- (void)daemonConnectionLost
{
  NSObject *v2;
  uint8_t v3[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1A1FF4000, v2, OS_LOG_TYPE_INFO, "Lost connection daemon", v3, 2u);
    }

  }
}

- (IMDaemonProtocol)daemon
{
  return self->_daemon;
}

- (void)setDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_daemon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemon, 0);
}

@end
