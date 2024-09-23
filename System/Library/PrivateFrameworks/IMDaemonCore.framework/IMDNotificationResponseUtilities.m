@implementation IMDNotificationResponseUtilities

+ (id)sharedInstance
{
  if (qword_1ED935C98 != -1)
    dispatch_once(&qword_1ED935C98, &unk_1E922BD90);
  return (id)qword_1ED935DD0;
}

- (IMDNotificationResponseUtilities)init
{
  IMDNotificationResponseUtilities *v2;
  IMDNotificationResponseUtilities *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMDNotificationResponseUtilities;
  v2 = -[IMDNotificationResponseUtilities init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[IMDNotificationResponseUtilities _setupNotificationCenter](v2, "_setupNotificationCenter");
  return v3;
}

- (IMDScreenTimeAskReponseHandler)screenTimeAskReponseHandler
{
  IMDScreenTimeAskReponseHandler *screenTimeAskReponseHandler;
  IMDScreenTimeAskReponseHandler *v4;
  IMDScreenTimeAskReponseHandler *v5;

  screenTimeAskReponseHandler = self->_screenTimeAskReponseHandler;
  if (!screenTimeAskReponseHandler)
  {
    v4 = objc_alloc_init(IMDScreenTimeAskReponseHandler);
    v5 = self->_screenTimeAskReponseHandler;
    self->_screenTimeAskReponseHandler = v4;

    screenTimeAskReponseHandler = self->_screenTimeAskReponseHandler;
  }
  return screenTimeAskReponseHandler;
}

- (IMDFamilyInviteReponseHandler)familyInviteResponseHandler
{
  IMDFamilyInviteReponseHandler *familyInviteResponseHandler;
  IMDFamilyInviteReponseHandler *v4;
  IMDFamilyInviteReponseHandler *v5;

  familyInviteResponseHandler = self->_familyInviteResponseHandler;
  if (!familyInviteResponseHandler)
  {
    v4 = objc_alloc_init(IMDFamilyInviteReponseHandler);
    v5 = self->_familyInviteResponseHandler;
    self->_familyInviteResponseHandler = v4;

    familyInviteResponseHandler = self->_familyInviteResponseHandler;
  }
  return familyInviteResponseHandler;
}

- (IMDAskToBuyResponseHandler)askToBuyResponseHandler
{
  IMDAskToBuyResponseHandler *askToBuyResponseHandler;
  IMDAskToBuyResponseHandler *v4;
  IMDAskToBuyResponseHandler *v5;

  askToBuyResponseHandler = self->_askToBuyResponseHandler;
  if (!askToBuyResponseHandler)
  {
    v4 = objc_alloc_init(IMDAskToBuyResponseHandler);
    v5 = self->_askToBuyResponseHandler;
    self->_askToBuyResponseHandler = v4;

    askToBuyResponseHandler = self->_askToBuyResponseHandler;
  }
  return askToBuyResponseHandler;
}

- (IMDSafetyMonitorResponseHandler)safetyMonitorResponseHandler
{
  IMDSafetyMonitorResponseHandler *safetyMonitorResponseHandler;
  IMDSafetyMonitorResponseHandler *v4;
  IMDSafetyMonitorResponseHandler *v5;

  safetyMonitorResponseHandler = self->_safetyMonitorResponseHandler;
  if (!safetyMonitorResponseHandler)
  {
    v4 = objc_alloc_init(IMDSafetyMonitorResponseHandler);
    v5 = self->_safetyMonitorResponseHandler;
    self->_safetyMonitorResponseHandler = v4;

    safetyMonitorResponseHandler = self->_safetyMonitorResponseHandler;
  }
  return safetyMonitorResponseHandler;
}

- (void)_setupNotificationCenter
{
  UNUserNotificationCenter *v3;
  UNUserNotificationCenter *notificationCenter;

  v3 = (UNUserNotificationCenter *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEC7A0]), "initWithBundleIdentifier:", CFSTR("com.apple.MobileSMS"));
  notificationCenter = self->_notificationCenter;
  self->_notificationCenter = v3;

  -[UNUserNotificationCenter setDelegate:](self->_notificationCenter, "setDelegate:", self);
  MEMORY[0x1E0DE7D20](self->_notificationCenter, sel_setWantsNotificationResponsesDelivered);
}

- (void)_markMessageAsRead:(id)a3 inChat:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  +[IMDChatRegistry sharedInstance](IMDChatRegistry, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "existingChatWithGUID:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39918]), "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:threadIdentifier:", 0, 0, 0, 0, 0, 0, 0, v7, 0);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTimeRead:", v13);

    objc_msgSend(v11, "serviceSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "chatIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sendReadReceiptForMessage:toChatID:identifier:style:", v12, v8, v15, objc_msgSend(v11, "style"));

    objc_msgSend(v10, "updateNotificationUnreadCountForChat:", v11);
    if (!v9)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (IMOSLoggingEnabled(0))
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v8;
      _os_log_impl(&dword_1D1413000, v16, OS_LOG_TYPE_INFO, "couldn't find chat for %@ to mark message as read", buf, 0xCu);
    }

  }
  if (v9)
LABEL_9:
    v9[2](v9);
LABEL_10:

}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  _QWORD *v15;
  id v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  int v24;
  id v25;
  _QWORD v26[7];
  _QWORD v27[7];
  _QWORD v28[7];
  _QWORD v29[7];
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMOSLoggingEnabled(v10))
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v8;
      _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "receive notification response for bundleID [%@]", buf, 0xCu);
    }

  }
  -[IMDNotificationResponseUtilities screenTimeAskReponseHandler](self, "screenTimeAskReponseHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "canHandleNotificationResponse:userNotificationCenter:", v9, v8);

  if (v13)
  {
    -[IMDNotificationResponseUtilities screenTimeAskReponseHandler](self, "screenTimeAskReponseHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = sub_1D14E2A88;
    v29[3] = &unk_1E922BDB8;
    v15 = v29;
    v16 = v9;
    v29[4] = v16;
    v29[5] = self;
    v29[6] = v10;
    objc_msgSend(v14, "handleNotificationResponse:userNotificationCenter:completionHandler:", v16, v8, v29);
LABEL_13:

    goto LABEL_14;
  }
  -[IMDNotificationResponseUtilities familyInviteResponseHandler](self, "familyInviteResponseHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "canHandleNotificationResponse:userNotificationCenter:", v9, v8);

  if (v18)
  {
    -[IMDNotificationResponseUtilities familyInviteResponseHandler](self, "familyInviteResponseHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = sub_1D14E2BA0;
    v28[3] = &unk_1E922BDB8;
    v15 = v28;
    v19 = v9;
    v28[4] = v19;
    v28[5] = self;
    v28[6] = v10;
    objc_msgSend(v14, "handleNotificationResponse:userNotificationCenter:completionHandler:", v19, v8, v28);
    goto LABEL_13;
  }
  -[IMDNotificationResponseUtilities askToBuyResponseHandler](self, "askToBuyResponseHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "canHandleNotificationResponse:userNotificationCenter:", v9, v8);

  if (v21)
  {
    -[IMDNotificationResponseUtilities askToBuyResponseHandler](self, "askToBuyResponseHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = sub_1D14E2CB8;
    v27[3] = &unk_1E922BDB8;
    v15 = v27;
    v22 = v9;
    v27[4] = v22;
    v27[5] = self;
    v27[6] = v10;
    objc_msgSend(v14, "handleNotificationResponse:userNotificationCenter:completionHandler:", v22, v8, v27);
    goto LABEL_13;
  }
  -[IMDNotificationResponseUtilities safetyMonitorResponseHandler](self, "safetyMonitorResponseHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "canHandleNotificationResponse:userNotificationCenter:", v9, v8);

  if (v24)
  {
    -[IMDNotificationResponseUtilities safetyMonitorResponseHandler](self, "safetyMonitorResponseHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = sub_1D14E2DD0;
    v26[3] = &unk_1E922BDB8;
    v15 = v26;
    v25 = v9;
    v26[4] = v25;
    v26[5] = self;
    v26[6] = v10;
    objc_msgSend(v14, "handleNotificationResponse:userNotificationCenter:completionHandler:", v25, v8, v26);
    goto LABEL_13;
  }
LABEL_14:

}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (void)setScreenTimeAskReponseHandler:(id)a3
{
  objc_storeStrong((id *)&self->_screenTimeAskReponseHandler, a3);
}

- (void)setFamilyInviteResponseHandler:(id)a3
{
  objc_storeStrong((id *)&self->_familyInviteResponseHandler, a3);
}

- (void)setAskToBuyResponseHandler:(id)a3
{
  objc_storeStrong((id *)&self->_askToBuyResponseHandler, a3);
}

- (void)setSafetyMonitorResponseHandler:(id)a3
{
  objc_storeStrong((id *)&self->_safetyMonitorResponseHandler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_safetyMonitorResponseHandler, 0);
  objc_storeStrong((id *)&self->_askToBuyResponseHandler, 0);
  objc_storeStrong((id *)&self->_familyInviteResponseHandler, 0);
  objc_storeStrong((id *)&self->_screenTimeAskReponseHandler, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

@end
