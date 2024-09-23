@implementation MFDADelivery

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __19__MFDADelivery_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, block);
  return (OS_os_log *)(id)log_log;
}

void __19__MFDADelivery_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;

}

- (void)setDAMailAccount:(id)a3
{
  objc_storeStrong((id *)&self->_DAMailAccount, a3);
}

- (id)newMessageWriter
{
  id v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFDADelivery;
  v2 = -[MFMailDelivery newMessageWriter](&v4, sel_newMessageWriter);
  objc_msgSend(v2, "setAllowsQuotedPrintable:", 0);
  return v2;
}

- (id)deliverSynchronously
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  double Current;
  void *v10;
  NSObject *v11;
  NSString *folderID;
  NSString *originalMessageID;
  NSString *originalLongID;
  void *v15;
  void *v16;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  NSString *accountID;
  double v21;
  void *v22;
  void *v23;
  MFDeliveryResult *v24;
  MFDeliveryResult *v25;
  void *v26;
  void *v27;
  DAMailAccount *DAMailAccount;
  void *v29;
  void *v30;
  MFDeliveryResult *v31;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  MFDADeliveryConsumer *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  uint8_t buf[4];
  int v42;
  __int16 v43;
  NSString *v44;
  __int16 v45;
  NSString *v46;
  __int16 v47;
  NSString *v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v37 = objc_alloc_init(MFDADeliveryConsumer);
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  MFUserAgent();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "networkActivityStarted:", self);

  -[MFMailDelivery message](self, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageIDHeaderInFortyBytesOrLess");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFMailDelivery originalMessage](self, "originalMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MFMailDelivery originalMessage](self, "originalMessage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFDADelivery _updateBasedOnOriginalMessage:](self, "_updateBasedOnOriginalMessage:", v6);

  }
  if (-[MFMailDelivery action](self, "action"))
  {
    if (-[MFMailDelivery action](self, "action") == 1)
      v7 = 1;
    else
      v7 = 2;
  }
  else
  {
    v7 = 0;
  }
  if (-[MFMailDelivery shouldSign](self, "shouldSign"))
    v8 = 0;
  else
    v8 = !-[MFMailDelivery shouldEncrypt](self, "shouldEncrypt");
  Current = CFAbsoluteTimeGetCurrent();
  -[MFMailDelivery message](self, "message");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "messageDataHolder");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  +[MFDADelivery log](MFDADelivery, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    folderID = self->_folderID;
    originalMessageID = self->_originalMessageID;
    originalLongID = self->_originalLongID;
    *(_DWORD *)buf = 67241218;
    v42 = v7;
    v43 = 2114;
    v44 = folderID;
    v45 = 2114;
    v46 = originalMessageID;
    v47 = 2114;
    v48 = originalLongID;
    v49 = 1026;
    v50 = v8;
    _os_log_impl(&dword_1A4F90000, v11, OS_LOG_TYPE_DEFAULT, "Sending message with type: %{public}u, folderID: %{public}@, originalMessageID: %{public}@, originalLongID: %{public}@, useSmartTask: %{public}d", buf, 0x2Cu);
  }

  -[DAMailAccount accountConduit](self->_DAMailAccount, "accountConduit");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = self->_folderID;
  v18 = self->_originalMessageID;
  v19 = self->_originalLongID;
  accountID = self->_accountID;
  BYTE1(v33) = -[MFMailDelivery isUserRequested](self, "isUserRequested");
  LOBYTE(v33) = v8;
  objc_msgSend(v15, "sendMessageWithRFC822Data:messageID:outgoingMessageType:originalMessageFolderID:originalMessageItemID:originalMessageLongID:originalAccountID:useSmartTasksIfPossible:isUserRequested:consumer:context:", v16, v36, v7, v17, v18, v19, accountID, v33, v37, 0);

  -[MFDAMailAccountConsumer waitUntilDone](v37, "waitUntilDone");
  v21 = CFAbsoluteTimeGetCurrent();
  -[MFDADeliveryConsumer error](v37, "error");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setError:", v22);

  MFUserAgent();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "networkActivityEnded:", self);

  v24 = -[MFDeliveryResult initWithStatus:]([MFDeliveryResult alloc], "initWithStatus:", -[MFDADeliveryConsumer status](v37, "status"));
  v25 = self->super._result;
  self->super._result = v24;

  -[MFDeliveryResult setDuration:](self->super._result, "setDuration:", v21 - Current);
  -[MFDeliveryResult setBytesSent:](self->super._result, "setBytesSent:", -[MFDADeliveryConsumer bytesWritten](v37, "bytesWritten"));
  if (!(_DWORD)v7
    && -[DAMailAccount supportsThreadOperations](self->_DAMailAccount, "supportsThreadOperations")
    && -[MFMailDelivery conversationFlags](self, "conversationFlags"))
  {
    -[MailAccount mailboxUidOfType:createIfNeeded:](self->_DAMailAccount, "mailboxUidOfType:createIfNeeded:", 4, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    DAMailAccount = self->_DAMailAccount;
    v38 = v26;
    v39 = CFSTR("MailAccountContentsDidChangeUids");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "postNotificationName:object:userInfo:", CFSTR("MailAccountContentsDidChange"), DAMailAccount, v30);

  }
  v31 = self->super._result;

  return v31;
}

- (void)_updateBasedOnOriginalMessage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  NSString *v7;
  NSString *originalLongID;
  void *v9;
  NSString *v10;
  NSString *originalMessageID;
  id v12;
  NSString *v13;
  NSString *folderID;
  void *v15;
  char isKindOfClass;
  id v17;
  NSString *v18;
  void *v19;
  NSString *v20;
  NSString *accountID;
  NSString *v22;
  NSString *v23;
  id v24;

  v24 = a3;
  objc_msgSend(v24, "messageStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v24;
    objc_msgSend(v5, "DAMailMessage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "longID");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    originalLongID = self->_originalLongID;
    self->_originalLongID = v7;

    objc_msgSend(v5, "DAMailMessage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteID");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    originalMessageID = self->_originalMessageID;
    self->_originalMessageID = v10;

    objc_msgSend(v5, "DAMailMessage");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "folderID");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v15 = v24;
    if ((isKindOfClass & 1) == 0)
      goto LABEL_9;
    v17 = v24;
    if (objc_msgSend(v17, "isSearchResultWithBogusRemoteId"))
    {
      objc_msgSend(v17, "remoteID");
      v18 = (NSString *)objc_claimAutoreleasedReturnValue();
      v12 = self->_originalLongID;
      self->_originalLongID = v18;
      goto LABEL_4;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_5;
    v12 = v4;
    objc_msgSend(v17, "remoteID");
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    v23 = self->_originalMessageID;
    self->_originalMessageID = v22;

    objc_msgSend(v12, "folderIDForFetching");
    v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  folderID = self->_folderID;
  self->_folderID = v13;

LABEL_4:
LABEL_5:

  v15 = v24;
LABEL_9:
  objc_msgSend(v15, "account");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "uniqueID");
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  accountID = self->_accountID;
  self->_accountID = v20;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalLongID, 0);
  objc_storeStrong((id *)&self->_originalMessageID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_folderID, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_DAMailAccount, 0);
}

@end
