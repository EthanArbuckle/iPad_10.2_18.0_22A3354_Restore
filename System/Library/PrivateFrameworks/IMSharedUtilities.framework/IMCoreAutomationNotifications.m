@implementation IMCoreAutomationNotifications

+ (id)sharedInstance
{
  if (qword_1ECFC7670 != -1)
    dispatch_once(&qword_1ECFC7670, &unk_1E3FB3B68);
  return (id)qword_1ECFC75D0;
}

- (IMCoreAutomationNotifications)init
{
  IMCoreAutomationNotifications *v2;
  IMCoreAutomationNotifications *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IMCoreAutomationNotifications;
  v2 = -[IMCoreAutomationNotifications init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[IMCoreAutomationNotifications clearSyncCounts](v2, "clearSyncCounts");
  return v3;
}

- (void)clearSyncCounts
{
  NSObject *v2;
  uint8_t v3[16];

  *(_OWORD *)&self->_attachmentsWrittenCount = 0u;
  *(_OWORD *)&self->_chatsWrittenCount = 0u;
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_19E239000, v2, OS_LOG_TYPE_INFO, "Cleared sync counts", v3, 2u);
    }
  }
}

- (void)postCoreAutomationNotificationFinishedPeriodicSyncNotificationWithStartTime:(id)a3 chatsDidsync:(BOOL)a4 messagesDidSync:(BOOL)a5 attachmentsDidSync:(BOOL)a6 recoverableMessagesDidSync:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  void *v12;
  uint64_t v13;
  _QWORD v14[10];
  _QWORD v15[11];

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v10 = a4;
  v15[10] = *MEMORY[0x1E0C80C00];
  v15[0] = CFSTR("initiatePeriodicSyncWithActivity");
  v14[0] = CFSTR("action");
  v14[1] = CFSTR("time");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSinceDate:", a3);
  v15[1] = objc_msgSend(v12, "numberWithDouble:");
  v14[2] = CFSTR("chatsDidSync");
  v15[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
  v14[3] = CFSTR("messagesDidSync");
  v15[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
  v14[4] = CFSTR("attachmentsDidSync");
  v15[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v14[5] = CFSTR("recoverableMessagesDidSync");
  v15[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v7);
  v14[6] = CFSTR("chatsWrittenCount");
  v15[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_chatsWrittenCount);
  v14[7] = CFSTR("messagesWrittenCount");
  v15[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_messagesWrittenCount);
  v14[8] = CFSTR("attachmentsWrittenCount");
  v15[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_attachmentsWrittenCount);
  v14[9] = CFSTR("recoverablesMessagesWrittenCount");
  v15[9] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_recoverableMessagesWrittenCount);
  v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 10);
  -[IMCoreAutomationNotifications clearSyncCounts](self, "clearSyncCounts");
  -[IMCoreAutomationNotifications postCoreAutomationNotificationWithDictionary:withVerboseLogging:](self, "postCoreAutomationNotificationWithDictionary:withVerboseLogging:", v13, 1);
}

- (void)postCoreAutomationNotificationPeriodicSyncUpdateNotification
{
  _QWORD v3[5];
  _QWORD v4[6];

  v4[5] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("updatePeriodicSyncWithActivity");
  v3[0] = CFSTR("action");
  v3[1] = CFSTR("chatsWrittenCount");
  v4[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_chatsWrittenCount);
  v3[2] = CFSTR("attachmentsWrittenCount");
  v4[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_attachmentsWrittenCount);
  v3[3] = CFSTR("messagesWrittenCount");
  v4[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_messagesWrittenCount);
  v3[4] = CFSTR("recoverablesMessagesWrittenCount");
  v4[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_recoverableMessagesWrittenCount);
  -[IMCoreAutomationNotifications postCoreAutomationNotificationWithDictionary:withVerboseLogging:](self, "postCoreAutomationNotificationWithDictionary:withVerboseLogging:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 5), 1);
}

- (void)postCoreAutomationNotificationWithAction:(id)a3
{
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("action");
  v4[0] = a3;
  -[IMCoreAutomationNotifications postCoreAutomationNotificationWithDictionary:withVerboseLogging:](self, "postCoreAutomationNotificationWithDictionary:withVerboseLogging:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1), 1);
}

- (void)postCoreAutomationNotificationWithDictionary:(id)a3 withVerboseLogging:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  const __CFString *v9;
  uint8_t v10[24];
  uint64_t v11;

  v4 = a4;
  v11 = *MEMORY[0x1E0C80C00];
  if (IMIsRunningInAutomation())
  {
    if (v4)
    {
      if (!IMOSLoggingEnabled())
        goto LABEL_13;
      v6 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        goto LABEL_13;
      *(_DWORD *)v10 = 138412290;
      *(_QWORD *)&v10[4] = a3;
      v7 = "postCoreAutomationNotificationWithDictionary with userInfo %@";
    }
    else
    {
      v8 = objc_msgSend(a3, "objectForKey:", CFSTR("action"));
      if (v8)
        v9 = (const __CFString *)v8;
      else
        v9 = CFSTR("<action name not passed in>");
      if (!IMOSLoggingEnabled())
        goto LABEL_13;
      v6 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        goto LABEL_13;
      *(_DWORD *)v10 = 138412290;
      *(_QWORD *)&v10[4] = v9;
      v7 = "postCoreAutomationNotificationWithDictionary for action %@";
    }
    _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, v7, v10, 0xCu);
LABEL_13:
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter", *(_OWORD *)v10), "postNotificationName:object:userInfo:", CFSTR("com.apple.messages.coreautomationnotification"), 0, a3);
  }
}

- (void)postCoreAutomationNotificationFinishedPurgingAttachments:(id)a3 withErrorString:(id)a4
{
  void *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v10[0] = CFSTR("action");
    v10[1] = CFSTR("error");
    v11[0] = CFSTR("purgeAttachments");
    v11[1] = a4;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = v11;
    v7 = v10;
  }
  else
  {
    v8[0] = CFSTR("action");
    v8[1] = CFSTR("deletedAttachments");
    v9[0] = CFSTR("purgeAttachments");
    v9[1] = a3;
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = v9;
    v7 = v8;
  }
  -[IMCoreAutomationNotifications postCoreAutomationNotificationWithDictionary:withVerboseLogging:](self, "postCoreAutomationNotificationWithDictionary:withVerboseLogging:", objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v6, v7, 2), 0);
}

- (void)postCoreAutomationNotificationFinishedTapToDownload:(id)a3 downloadedFromCloudKitSuccessfully:(BOOL)a4
{
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("action");
  v5[1] = CFSTR("guid");
  v6[0] = CFSTR("tapToDownload");
  v6[1] = a3;
  v5[2] = CFSTR("downloadedFromCloudKitSuccessfully");
  v6[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4);
  -[IMCoreAutomationNotifications postCoreAutomationNotificationWithDictionary:withVerboseLogging:](self, "postCoreAutomationNotificationWithDictionary:withVerboseLogging:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3), 0);
}

- (void)addNewChatsSyncedCount:(int64_t)a3
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  self->_chatsWrittenCount += a3;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_chatsWrittenCount);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Number of chats written count now is %@", (uint8_t *)&v6, 0xCu);
    }
  }
  -[IMCoreAutomationNotifications postCoreAutomationNotificationPeriodicSyncUpdateNotification](self, "postCoreAutomationNotificationPeriodicSyncUpdateNotification");
}

- (void)addNewAttachmentsSyncedCount:(int64_t)a3
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  self->_attachmentsWrittenCount += a3;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_attachmentsWrittenCount);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Number of attachments written count now is %@", (uint8_t *)&v6, 0xCu);
    }
  }
  -[IMCoreAutomationNotifications postCoreAutomationNotificationPeriodicSyncUpdateNotification](self, "postCoreAutomationNotificationPeriodicSyncUpdateNotification");
}

- (void)addNewMessagesSyncedCount:(int64_t)a3
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  self->_messagesWrittenCount += a3;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_messagesWrittenCount);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Number of messages written count now is %@", (uint8_t *)&v6, 0xCu);
    }
  }
  -[IMCoreAutomationNotifications postCoreAutomationNotificationPeriodicSyncUpdateNotification](self, "postCoreAutomationNotificationPeriodicSyncUpdateNotification");
}

- (void)addNewRecoverableMessagesSyncedCount:(int64_t)a3
{
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  self->_recoverableMessagesWrittenCount += a3;
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_recoverableMessagesWrittenCount);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_19E239000, v4, OS_LOG_TYPE_INFO, "Number of recoverable messages written count now is %@", (uint8_t *)&v6, 0xCu);
    }
  }
  -[IMCoreAutomationNotifications postCoreAutomationNotificationPeriodicSyncUpdateNotification](self, "postCoreAutomationNotificationPeriodicSyncUpdateNotification");
}

- (int64_t)chatsWrittenCount
{
  return self->_chatsWrittenCount;
}

- (int64_t)messagesWrittenCount
{
  return self->_messagesWrittenCount;
}

- (int64_t)attachmentsWrittenCount
{
  return self->_attachmentsWrittenCount;
}

- (int64_t)recoverableMessagesWrittenCount
{
  return self->_recoverableMessagesWrittenCount;
}

@end
