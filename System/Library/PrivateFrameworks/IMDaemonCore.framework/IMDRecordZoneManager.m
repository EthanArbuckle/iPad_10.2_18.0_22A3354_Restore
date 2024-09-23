@implementation IMDRecordZoneManager

+ (IMDRecordZoneManager)sharedInstance
{
  if (qword_1ED935C60 != -1)
    dispatch_once(&qword_1ED935C60, &unk_1E9229350);
  return (IMDRecordZoneManager *)qword_1ED935D88;
}

- (IMDRecordZoneManager)init
{
  IMDRecordZoneManager *v2;
  IMDRecordZoneManager *v3;
  id v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMDRecordZoneManager;
  v2 = -[IMDRecordZoneManager init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_dataBaseManager = 0;
    v4 = objc_alloc(MEMORY[0x1E0C95098]);
    v5 = *MEMORY[0x1E0C94730];
    v3->_chatRecordZoneID = (CKRecordZoneID *)objc_msgSend(v4, "initWithZoneName:ownerName:", CFSTR("chatManateeZone"), *MEMORY[0x1E0C94730]);
    v3->_chatRecordZone = (CKRecordZone *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v3->_chatRecordZoneID);
    v3->_chat1RecordZoneID = (CKRecordZoneID *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95098]), "initWithZoneName:ownerName:", CFSTR("chat1ManateeZone"), v5);
    v3->_chat1RecordZone = (CKRecordZone *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v3->_chat1RecordZoneID);
    v3->_messageRecordZoneID = (CKRecordZoneID *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95098]), "initWithZoneName:ownerName:", CFSTR("messageManateeZone"), v5);
    v3->_messageRecordZone = (CKRecordZone *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v3->_messageRecordZoneID);
    v3->_attachmentRecordZoneID = (CKRecordZoneID *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95098]), "initWithZoneName:ownerName:", CFSTR("attachmentManateeZone"), v5);
    v3->_attachmentRecordZone = (CKRecordZone *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v3->_attachmentRecordZoneID);
    v3->_updateRecordZoneID = (CKRecordZoneID *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95098]), "initWithZoneName:ownerName:", CFSTR("messageUpdateZone"), v5);
    v3->_updateRecordZone = (CKRecordZone *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v3->_updateRecordZoneID);
    v3->_analyticRecordZoneID = (CKRecordZoneID *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95098]), "initWithZoneName:ownerName:", CFSTR("analyticManateeZone"), v5);
    v3->_analyticRecordZone = (CKRecordZone *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v3->_analyticRecordZoneID);
    v3->_deDupeSaltZoneID = (CKRecordZoneID *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95098]), "initWithZoneName:ownerName:", CFSTR("RecordKeyManateeZone"), v5);
    v3->_deDupeSaltRecordZone = (CKRecordZone *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v3->_deDupeSaltZoneID);
    v3->_metricZoneID = (CKRecordZoneID *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95098]), "initWithZoneName:ownerName:", CFSTR("MetricsManateeZone"), v5);
    v3->_recoverableMessageRecordZoneID = (CKRecordZoneID *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95098]), "initWithZoneName:ownerName:", CFSTR("recoverableMessageDeleteZone"), v5);
    v3->_recoverableMessageRecordZone = (CKRecordZone *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v3->_recoverableMessageRecordZoneID);
    v3->_scheduledMessageRecordZoneID = (CKRecordZoneID *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95098]), "initWithZoneName:ownerName:", CFSTR("scheduledMessageZone"), v5);
    v3->_scheduledMessageRecordZone = (CKRecordZone *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", v3->_scheduledMessageRecordZoneID);
    if ((IMIsRunningInUnitTesting() & 1) == 0)
      -[IMDRecordZoneManager _setUpPushConnection](v3, "_setUpPushConnection");
  }
  return v3;
}

- (IMDCKDatabaseManager)dataBaseManager
{
  IMDCKDatabaseManager *result;

  result = self->_dataBaseManager;
  if (!result)
  {
    result = +[IMDCKDatabaseManager sharedInstance](IMDCKDatabaseManager, "sharedInstance");
    self->_dataBaseManager = result;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IMDRecordZoneManager;
  -[IMDRecordZoneManager dealloc](&v3, sel_dealloc);
}

- (APSConnection)pushConnection
{
  id v3;
  APSConnection *v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v8[16];

  if (!self->_pushConnection)
  {
    v3 = objc_alloc(MEMORY[0x1E0CFE148]);
    v4 = (APSConnection *)objc_msgSend(v3, "initWithEnvironmentName:namedDelegatePort:queue:", *MEMORY[0x1E0CFE130], CFSTR("com.apple.aps.imagent"), MEMORY[0x1E0C80D38]);
    self->_pushConnection = v4;
    v5 = -[APSConnection setDelegate:](v4, "setDelegate:", self);
    if (!self->_pushConnection)
    {
      if (IMOSLoggingEnabled(v5))
      {
        v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v8 = 0;
          _os_log_impl(&dword_1D1413000, v6, OS_LOG_TYPE_INFO, "We couldn't create the push connection for the IMDRecordZoneManager", v8, 2u);
        }
      }
    }
  }
  return self->_pushConnection;
}

- (void)_setUpPushConnection
{
  APSConnection *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  APSConnection *v7;
  __int16 v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = -[IMDRecordZoneManager pushConnection](self, "pushConnection");
  v3 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
  if (!objc_msgSend(v3, "length"))
    v3 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "executablePath"), "lastPathComponent");
  v10[0] = objc_msgSend(CFSTR("com.apple.icloud-container."), "stringByAppendingString:", v3);
  v4 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  if (IMOSLoggingEnabled(-[APSConnection setEnabledTopics:](v2, "setEnabledTopics:", v4)))
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412546;
      v7 = v2;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Created push connection %@ with enabled topics %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  NSObject *v4;
  uint8_t v5[16];

  if (IMOSLoggingEnabled(self))
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "APSConnection didReceivePublicToken", v5, 2u);
    }
  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a4, "userInfo", a3);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C94F40], "notificationFromRemoteNotificationDictionary:", v5);
  if (IMOSLoggingEnabled(v6))
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v11 = 138412546;
      v12 = v5;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "APSConnection didReceiveIncomingMessage pushPayload: %@ ckNotification: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  v8 = objc_msgSend(v6, "notificationType");
  if (v8 == 2)
  {
    -[IMDRecordZoneManager _handleNotificationForZoneID:subscriptionID:](self, "_handleNotificationForZoneID:subscriptionID:", objc_msgSend(v6, "recordZoneID"), objc_msgSend(v6, "subscriptionID"));
  }
  else if (IMOSLoggingEnabled(v8))
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "notificationType"));
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Received a notification for an unsupported notitifcation type: %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)_handleNotificationForZoneID:(id)a3 subscriptionID:(id)a4
{
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v10 = 138412546;
      v11 = a3;
      v12 = 2112;
      v13 = a4;
      _os_log_impl(&dword_1D1413000, v7, OS_LOG_TYPE_INFO, "Received a notification for zoneID: %@ for subscriptionID: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  v8 = objc_msgSend(a3, "isEqual:", -[IMDRecordZoneManager deDupeSaltZoneID](self, "deDupeSaltZoneID"));
  if ((_DWORD)v8)
  {
    -[IMDCKExitManager handleNotificationForSubscriptionID:](+[IMDCKExitManager sharedInstance](IMDCKExitManager, "sharedInstance"), "handleNotificationForSubscriptionID:", a4);
  }
  else if (IMOSLoggingEnabled(v8))
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 138412546;
      v11 = a3;
      v12 = 2112;
      v13 = a4;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Received a notification for zoneID we haven't set up: %@ subscriptionID: %@", (uint8_t *)&v10, 0x16u);
    }
  }
}

- (void)_createSubscriptionForZoneID:(id)a3 subscriptionID:(id)a4 recordType:(id)a5 completionBlock:(id)a6
{
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  _QWORD v14[5];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C950B0]), "initWithZoneID:subscriptionID:", a3, a4);
  v11 = objc_msgSend(a5, "length");
  if (v11)
    v11 = objc_msgSend(v10, "setRecordType:", a5);
  if (IMOSLoggingEnabled(v11))
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v10;
      v17 = 2112;
      v18 = a3;
      _os_log_impl(&dword_1D1413000, v12, OS_LOG_TYPE_INFO, "Creating subscription: %@ for zoneID: %@", buf, 0x16u);
    }
  }
  v13 = -[IMDCKDatabaseManager truthDatabase](-[IMDRecordZoneManager dataBaseManager](self, "dataBaseManager"), "truthDatabase");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = sub_1D1464AE4;
  v14[3] = &unk_1E9229378;
  v14[4] = a6;
  objc_msgSend(v13, "saveSubscription:completionHandler:", v10, v14);

}

- (void)_createSubscriptionIfNeededForZoneID:(id)a3 subscriptionID:(id)a4 recordType:(id)a5 completionBlock:(id)a6
{
  id v11;
  _QWORD v12[9];

  v11 = -[IMDCKDatabaseManager truthDatabase](-[IMDRecordZoneManager dataBaseManager](self, "dataBaseManager"), "truthDatabase");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = sub_1D1464CC8;
  v12[3] = &unk_1E92293A0;
  v12[7] = a5;
  v12[8] = a6;
  v12[4] = a4;
  v12[5] = self;
  v12[6] = a3;
  objc_msgSend(v11, "fetchSubscriptionWithID:completionHandler:", a4, v12);
}

- (void)_checkRecordZoneExists:(id)a3 completionBlock:(id)a4
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[6];
  int v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  _QWORD v20[10];

  v20[1] = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    v7 = objc_alloc(MEMORY[0x1E0C94E08]);
    v20[0] = a3;
    v8 = (void *)objc_msgSend(v7, "initWithRecordZoneIDs:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1));
    v9 = objc_alloc_init(MEMORY[0x1E0C94F80]);
    objc_msgSend(v9, "setAllowsCellularAccess:", 1);
    objc_msgSend(v9, "setQualityOfService:", -[IMDRecordZoneManager derivedQualityOfService](self, "derivedQualityOfService"));
    objc_msgSend(v8, "setConfiguration:", v9);

    if (IMOSLoggingEnabled(v10))
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v16 = 138412546;
        v17 = (id)objc_msgSend(v8, "operationID");
        v18 = 2112;
        v19 = objc_msgSend(v8, "recordZoneIDs");
        _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Created CKFetchRecordZonesOperation operation ID %@ zoneID %@", (uint8_t *)&v16, 0x16u);
      }
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = sub_1D1465138;
    v15[3] = &unk_1E92293C8;
    v15[4] = a3;
    v15[5] = a4;
    v12 = objc_msgSend(v8, "setFetchRecordZonesCompletionBlock:", v15);
    if (v8)
    {
      objc_msgSend(-[IMDCKDatabaseManager truthDatabase](-[IMDRecordZoneManager dataBaseManager](self, "dataBaseManager"), "truthDatabase"), "addOperation:", v8);
    }
    else
    {
      if (IMOSLoggingEnabled(v12))
      {
        v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_1D1413000, v14, OS_LOG_TYPE_INFO, "Error initializing fetchOperation ", (uint8_t *)&v16, 2u);
        }
      }
      (*((void (**)(id, _QWORD, uint64_t))a4 + 2))(a4, 0, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.private.IM.IMRecordZoneManagerErrorDomain"), 1, 0));
    }

  }
  else if (IMOSLoggingEnabled(self))
  {
    v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v16 = 138412290;
      v17 = a3;
      _os_log_impl(&dword_1D1413000, v13, OS_LOG_TYPE_INFO, "_checkRecordZoneExists invalid parameter: recordZoneID %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)_createRecordZone:(id)a3 completionBlock:(id)a4
{
  id v7;
  void *v8;
  id v9;
  _QWORD v10[6];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc(MEMORY[0x1E0C94EF0]);
  v11[0] = a3;
  v8 = (void *)objc_msgSend(v7, "initWithRecordZonesToSave:recordZoneIDsToDelete:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1), 0);
  v9 = objc_alloc_init(MEMORY[0x1E0C94F80]);
  objc_msgSend(v9, "setAllowsCellularAccess:", 1);
  objc_msgSend(v9, "setQualityOfService:", -[IMDRecordZoneManager derivedQualityOfService](self, "derivedQualityOfService"));
  objc_msgSend(v8, "setConfiguration:", v9);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1D146540C;
  v10[3] = &unk_1E92293F0;
  v10[4] = a3;
  v10[5] = a4;
  objc_msgSend(v8, "setModifyRecordZonesCompletionBlock:", v10);
  objc_msgSend(-[IMDCKDatabaseManager truthDatabase](-[IMDRecordZoneManager dataBaseManager](self, "dataBaseManager"), "truthDatabase"), "addOperation:", v8);

}

- (void)_createRecordZoneIfNeeded:(id)a3 completionBlock:(id)a4
{
  uint64_t v7;
  _QWORD v8[8];

  v7 = objc_msgSend(a3, "zoneID");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = sub_1D14655FC;
  v8[3] = &unk_1E9229440;
  v8[4] = v7;
  v8[5] = a3;
  v8[6] = self;
  v8[7] = a4;
  -[IMDRecordZoneManager _checkRecordZoneExists:completionBlock:](self, "_checkRecordZoneExists:completionBlock:", v7, v8);
}

- (void)_deleteZone:(id)a3
{
  -[IMDCKDatabaseManager truthDatabase](+[IMDCKDatabaseManager sharedInstance](IMDCKDatabaseManager, "sharedInstance"), "truthDatabase");
  MEMORY[0x1E0DE7D20](self, sel__deleteZone_forDatabase_);
}

- (void)_deleteZone:(id)a3 forDatabase:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "zoneID");
  v6 = objc_alloc(MEMORY[0x1E0C94EF0]);
  v8[0] = v5;
  v7 = (void *)objc_msgSend(v6, "initWithRecordZonesToSave:recordZoneIDsToDelete:", 0, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1));
  objc_msgSend(v7, "setModifyRecordZonesCompletionBlock:", &unk_1E9229480);
  objc_msgSend(a4, "addOperation:", v7);
}

- (void)createChatZoneIfNeededWithCompletionBlock:(id)a3
{
  -[IMDRecordZoneManager chatRecordZone](self, "chatRecordZone");
  MEMORY[0x1E0DE7D20](self, sel__createRecordZoneIfNeeded_completionBlock_);
}

- (void)deleteChatZone
{
  -[IMDRecordZoneManager chatRecordZone](self, "chatRecordZone");
  MEMORY[0x1E0DE7D20](self, sel__deleteZone_);
}

- (void)deleteChat1Zone
{
  -[IMDRecordZoneManager chat1RecordZone](self, "chat1RecordZone");
  MEMORY[0x1E0DE7D20](self, sel__deleteZone_);
}

- (void)createAttachmentZoneIfNeededWithCompletionBlock:(id)a3
{
  -[IMDRecordZoneManager attachmentRecordZone](self, "attachmentRecordZone");
  MEMORY[0x1E0DE7D20](self, sel__createRecordZoneIfNeeded_completionBlock_);
}

- (void)deleteAttachmentZone
{
  -[IMDRecordZoneManager attachmentRecordZone](self, "attachmentRecordZone");
  MEMORY[0x1E0DE7D20](self, sel__deleteZone_);
}

- (void)createMessageZoneIfNeededWithCompletionBlock:(id)a3
{
  -[IMDRecordZoneManager messageRecordZone](self, "messageRecordZone");
  MEMORY[0x1E0DE7D20](self, sel__createRecordZoneIfNeeded_completionBlock_);
}

- (void)deleteMessageZone
{
  -[IMDRecordZoneManager messageRecordZone](self, "messageRecordZone");
  MEMORY[0x1E0DE7D20](self, sel__deleteZone_);
}

- (void)createUpdateZoneIfNeededWithCompletionBlock:(id)a3
{
  -[IMDRecordZoneManager updateRecordZone](self, "updateRecordZone");
  MEMORY[0x1E0DE7D20](self, sel__createRecordZoneIfNeeded_completionBlock_);
}

- (void)deleteUpdateZone
{
  -[IMDRecordZoneManager updateRecordZone](self, "updateRecordZone");
  MEMORY[0x1E0DE7D20](self, sel__deleteZone_);
}

- (void)createAnalyticZoneIfNeededWithCompletionBlock:(id)a3
{
  -[IMDRecordZoneManager analyticRecordZone](self, "analyticRecordZone");
  MEMORY[0x1E0DE7D20](self, sel__createRecordZoneIfNeeded_completionBlock_);
}

- (void)deleteAnalyticZone
{
  -[IMDRecordZoneManager analyticRecordZone](self, "analyticRecordZone");
  MEMORY[0x1E0DE7D20](self, sel__deleteZone_);
}

- (void)createDeDupeSaltZoneIfNeededWithCompletionBlock:(id)a3
{
  -[IMDRecordZoneManager deDupeSaltRecordZone](self, "deDupeSaltRecordZone");
  MEMORY[0x1E0DE7D20](self, sel__createRecordZoneIfNeeded_completionBlock_);
}

- (void)deleteDeDupeSaltZone
{
  -[IMDRecordZoneManager deDupeSaltRecordZone](self, "deDupeSaltRecordZone");
  MEMORY[0x1E0DE7D20](self, sel__deleteZone_);
}

- (void)createSubscriptionIfNeededOnDeDupeZoneForSubscription:(id)a3 recordType:(id)a4 completionBlock:(id)a5
{
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled(self))
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 138412546;
      v11 = a3;
      v12 = 2112;
      v13 = a4;
      _os_log_impl(&dword_1D1413000, v9, OS_LOG_TYPE_INFO, "Going to create subscription on deDupe zone for subscriptionID: %@ recordType: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  -[IMDRecordZoneManager _createSubscriptionIfNeededForZoneID:subscriptionID:recordType:completionBlock:](self, "_createSubscriptionIfNeededForZoneID:subscriptionID:recordType:completionBlock:", -[IMDRecordZoneManager deDupeSaltZoneID](self, "deDupeSaltZoneID"), a3, a4, a5);
}

- (void)createRecoverableMessageZoneIfNeededWithCompletionBlock:(id)a3
{
  -[IMDRecordZoneManager recoverableMessageRecordZone](self, "recoverableMessageRecordZone");
  MEMORY[0x1E0DE7D20](self, sel__createRecordZoneIfNeeded_completionBlock_);
}

- (void)deleteRecoverableMessageZone
{
  -[IMDRecordZoneManager recoverableMessageRecordZone](self, "recoverableMessageRecordZone");
  MEMORY[0x1E0DE7D20](self, sel__deleteZone_);
}

- (void)createScheduledMessageZoneIfNeededWithCompletionBlock:(id)a3
{
  -[IMDRecordZoneManager scheduledMessageRecordZone](self, "scheduledMessageRecordZone");
  MEMORY[0x1E0DE7D20](self, sel__createRecordZoneIfNeeded_completionBlock_);
}

- (void)deleteScheduledMessageZone
{
  -[IMDRecordZoneManager scheduledMessageRecordZone](self, "scheduledMessageRecordZone");
  MEMORY[0x1E0DE7D20](self, sel__deleteZone_);
}

- (void)deleteAllZones
{
  -[IMDCKDatabaseManager truthDatabase](-[IMDRecordZoneManager dataBaseManager](self, "dataBaseManager"), "truthDatabase");
  MEMORY[0x1E0DE7D20](self, sel__deleteAllZonesForDatabase_);
}

- (void)_deleteAllZonesForDatabase:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", -[IMDRecordZoneManager chatRecordZoneID](self, "chatRecordZoneID"), -[IMDRecordZoneManager chat1RecordZoneID](self, "chat1RecordZoneID"), -[IMDRecordZoneManager messageRecordZoneID](self, "messageRecordZoneID"), -[IMDRecordZoneManager attachmentRecordZoneID](self, "attachmentRecordZoneID"), -[IMDRecordZoneManager updateRecordZoneID](self, "updateRecordZoneID"), -[IMDRecordZoneManager recoverableMessageRecordZoneID](self, "recoverableMessageRecordZoneID"), -[IMDRecordZoneManager scheduledMessageRecordZoneID](self, "scheduledMessageRecordZoneID"), 0);
  if (IMOSLoggingEnabled(v4))
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v9 = v4;
      v10 = 2112;
      v11 = a3;
      _os_log_impl(&dword_1D1413000, v5, OS_LOG_TYPE_INFO, "Request to delete zones %@ for database %@", buf, 0x16u);
    }
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94EF0]), "initWithRecordZonesToSave:recordZoneIDsToDelete:", 0, v4);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1D1466114;
  v7[3] = &unk_1E92294A8;
  v7[4] = a3;
  objc_msgSend(v6, "setModifyRecordZonesCompletionBlock:", v7);
  objc_msgSend(a3, "addOperation:", v6);

}

- (id)ckUtilities
{
  return +[IMDCKUtilities sharedInstance](IMDCKUtilities, "sharedInstance");
}

- (id)errorAnalyzer
{
  return (id)objc_msgSend(MEMORY[0x1E0D39B28], "sharedInstance");
}

- (int64_t)derivedQualityOfService
{
  uint64_t v2;
  int64_t v3;
  NSObject *v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"), "qualityOfService");
  if (v2 <= 17)
    v3 = 17;
  else
    v3 = v2;
  if (IMOSLoggingEnabled(v2))
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 134218240;
      v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"), "qualityOfService");
      v8 = 2048;
      v9 = v3;
      _os_log_impl(&dword_1D1413000, v4, OS_LOG_TYPE_INFO, "QOS: 0x%lX target qos: 0x%lX", (uint8_t *)&v6, 0x16u);
    }
  }
  return v3;
}

- (void)fetchChatZoneToCheckManateeStatus:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[6];
  uint8_t buf[16];
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v11[0] = -[IMDRecordZoneManager chatRecordZoneID](self, "chatRecordZoneID");
  v5 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94E08]), "initWithRecordZoneIDs:", v5);
  v7 = objc_alloc_init(MEMORY[0x1E0C94F80]);
  objc_msgSend(v7, "setQualityOfService:", -[IMDRecordZoneManager derivedQualityOfService](self, "derivedQualityOfService"));
  if (IMOSLoggingEnabled(objc_msgSend(v7, "setAllowsCellularAccess:", 1)))
  {
    v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Attempting to infer manatee status by fetching chat zone.", buf, 2u);
    }
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1D1466570;
  v9[3] = &unk_1E92293C8;
  v9[4] = self;
  v9[5] = a3;
  objc_msgSend(v6, "setFetchRecordZonesCompletionBlock:", v9);
  objc_msgSend(-[IMDCKDatabaseManager truthDatabase](-[IMDRecordZoneManager dataBaseManager](self, "dataBaseManager"), "truthDatabase"), "addOperation:", v6);

}

- (CKRecordZoneID)chatRecordZoneID
{
  return self->_chatRecordZoneID;
}

- (CKRecordZone)chatRecordZone
{
  return self->_chatRecordZone;
}

- (CKRecordZoneID)chat1RecordZoneID
{
  return self->_chat1RecordZoneID;
}

- (CKRecordZone)chat1RecordZone
{
  return self->_chat1RecordZone;
}

- (CKRecordZoneID)attachmentRecordZoneID
{
  return self->_attachmentRecordZoneID;
}

- (CKRecordZone)attachmentRecordZone
{
  return self->_attachmentRecordZone;
}

- (CKRecordZoneID)messageRecordZoneID
{
  return self->_messageRecordZoneID;
}

- (CKRecordZone)messageRecordZone
{
  return self->_messageRecordZone;
}

- (CKRecordZoneID)updateRecordZoneID
{
  return self->_updateRecordZoneID;
}

- (CKRecordZone)updateRecordZone
{
  return self->_updateRecordZone;
}

- (CKRecordZoneID)analyticRecordZoneID
{
  return self->_analyticRecordZoneID;
}

- (CKRecordZone)analyticRecordZone
{
  return self->_analyticRecordZone;
}

- (CKRecordZoneID)deDupeSaltZoneID
{
  return self->_deDupeSaltZoneID;
}

- (CKRecordZone)deDupeSaltRecordZone
{
  return self->_deDupeSaltRecordZone;
}

- (CKRecordZoneID)metricZoneID
{
  return self->_metricZoneID;
}

- (CKRecordZoneID)recoverableMessageRecordZoneID
{
  return self->_recoverableMessageRecordZoneID;
}

- (CKRecordZone)recoverableMessageRecordZone
{
  return self->_recoverableMessageRecordZone;
}

- (CKRecordZoneID)scheduledMessageRecordZoneID
{
  return self->_scheduledMessageRecordZoneID;
}

- (CKRecordZone)scheduledMessageRecordZone
{
  return self->_scheduledMessageRecordZone;
}

- (void)setDataBaseManager:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 160);
}

- (void)setPushConnection:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 168);
}

@end
