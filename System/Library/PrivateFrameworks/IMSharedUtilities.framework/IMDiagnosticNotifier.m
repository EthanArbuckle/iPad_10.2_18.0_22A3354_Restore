@implementation IMDiagnosticNotifier

- (IMDiagnosticNotifier)init
{
  void *v3;
  int v4;
  IMDiagnosticNotifier *v5;
  void *v6;
  objc_class *v7;
  uint64_t v8;
  UNUserNotificationCenter *notificationCenter;
  IMDiagnosticNotifier *v10;
  objc_super v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternalInstall");

  if (v4)
  {
    v12.receiver = self;
    v12.super_class = (Class)IMDiagnosticNotifier;
    v5 = -[IMDiagnosticNotifier init](&v12, sel_init);
    if (v5)
    {
      v14 = 0;
      v15 = &v14;
      v16 = 0x2050000000;
      v6 = (void *)qword_1EE5041F8;
      v17 = qword_1EE5041F8;
      if (!qword_1EE5041F8)
      {
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = sub_19E2EFD68;
        v13[3] = &unk_1E3FB4F80;
        v13[4] = &v14;
        sub_19E2EFD68((uint64_t)v13);
        v6 = (void *)v15[3];
      }
      v7 = objc_retainAutorelease(v6);
      _Block_object_dispose(&v14, 8);
      v8 = objc_msgSend([v7 alloc], "initWithBundleIdentifier:", CFSTR("com.apple.Messages.diagnostics.usernotifications"));
      notificationCenter = v5->_notificationCenter;
      v5->_notificationCenter = (UNUserNotificationCenter *)v8;

    }
    self = v5;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)postNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "_createRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[IMDiagnosticNotifier notificationCenter](self, "notificationCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_19E2EFA4C;
    v9[3] = &unk_1E3FB8578;
    v10 = v4;
    objc_msgSend(v6, "addNotificationRequest:withCompletionHandler:", v5, v9);

  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_19E239000, v7, OS_LOG_TYPE_INFO, "Not posting diagnostic notification %@ due to invalid request", buf, 0xCu);

    }
  }

}

- (void)postNotificationWithTitle:(id)a3 body:(id)a4
{
  id v6;
  id v7;
  IMDiagnosticNotification *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[IMDiagnosticNotification initWithTitle:body:]([IMDiagnosticNotification alloc], "initWithTitle:body:", v7, v6);

  -[IMDiagnosticNotifier postNotification:](self, "postNotification:", v8);
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end
