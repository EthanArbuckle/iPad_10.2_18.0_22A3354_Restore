@implementation MFMailDelivery

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__MFMailDelivery_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_6 != -1)
    dispatch_once(&log_onceToken_6, block);
  return (id)log_log_6;
}

void __21__MFMailDelivery_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_6;
  log_log_6 = (uint64_t)v1;

}

+ (id)newWithMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[MailAccount accountThatMessageIsFrom:](MailAccount, "accountThatMessageIsFrom:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deliveryAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[MailAccount defaultDeliveryAccount](MailAccount, "defaultDeliveryAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)objc_msgSend(v5, "newDeliveryWithMessage:", v3);

  return v6;
}

+ (id)newWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  accountForHeaders(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "newDeliveryWithHeaders:mixedContent:textPartsAreHTML:", v7, v8, v5);

  return v10;
}

+ (id)newWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  accountForHeaders(v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "newDeliveryWithHeaders:HTML:plainTextAlternative:other:", v9, v10, v11, v12);

  return v14;
}

+ (BOOL)deliverMessage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = (void *)objc_msgSend(a1, "newWithMessage:", a3);
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "deliverSynchronously");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "status") == 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MFMailDelivery)init
{
  MFMailDelivery *v2;
  MFMailDelivery *v3;
  void *v4;
  MFMailDelivery *v5;
  uint64_t v6;
  EFFuture *followUpFuture;
  _QWORD v9[4];
  MFMailDelivery *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MFMailDelivery;
  v2 = -[MFMailDelivery init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeWeak(&v2->_delegate, 0);
    v4 = (void *)MEMORY[0x1E0D1EEC0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __22__MFMailDelivery_init__block_invoke;
    v9[3] = &unk_1E4E89E20;
    v5 = v3;
    v10 = v5;
    objc_msgSend(v4, "lazyFutureWithBlock:", v9);
    v6 = objc_claimAutoreleasedReturnValue();
    followUpFuture = v5->_followUpFuture;
    v5->_followUpFuture = (EFFuture *)v6;

  }
  return v3;
}

MFFollowUpWarningResult *__22__MFMailDelivery_init__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  MFFollowUpWarningResult *v19;
  void *v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subjectString");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_1E4F1C8F8;
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 32), "_htmlBodyForMessage:", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1E770], "snippetFromHTMLBody:options:maxLength:preservingQuotedForwardedContent:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EF48], "ec_partiallyRedactedStringForSubjectOrSummary:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EF48], "ec_partiallyRedactedStringForSubjectOrSummary:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFMailDelivery log](MFMailDelivery, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v24 = v11;
    v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_DEFAULT, "_followUpFuture calling suggestionService with Subject: %{public}@ Body: %{public}@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0D19970], "serviceForMail");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSyncTimeout:", 1.0);
  objc_msgSend(v4, "dateSent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v14, "identifyFollowUpWarningFromSubject:body:date:error:", v9, v10, v15, &v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v22;

  v18 = objc_retainAutorelease(v17);
  *a2 = v18;
  v19 = -[MFFollowUpWarningResult initWithFollowUpWarning:error:]([MFFollowUpWarningResult alloc], "initWithFollowUpWarning:error:", v16, v18);

  return v19;
}

- (MFMailDelivery)initWithMessage:(id)a3
{
  id v5;
  MFMailDelivery *v6;
  MFMailDelivery *v7;

  v5 = a3;
  v6 = -[MFMailDelivery init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_message, a3);

  return v7;
}

- (MFMailDelivery)initWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5
{
  id v8;
  id v9;
  MFMailDelivery *v10;
  uint64_t v11;
  MFMutableMessageHeaders *headers;

  v8 = a3;
  v9 = a4;
  v10 = -[MFMailDelivery init](self, "init");
  if (v10)
  {
    v11 = objc_msgSend(v8, "mutableCopy");
    headers = v10->_headers;
    v10->_headers = (MFMutableMessageHeaders *)v11;

    -[MFMailDelivery updateOriginalMessageFromHeaders:](v10, "updateOriginalMessageFromHeaders:", v10->_headers);
    -[MFMutableMessageHeaders stripInternalHeaders](v10->_headers, "stripInternalHeaders");
    objc_storeStrong((id *)&v10->_mixedContent, a4);
    v10->_textPartsAreHTML = a5;
  }

  return v10;
}

- (MFMailDelivery)initWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  MFMailDelivery *v14;
  uint64_t v15;
  MFMutableMessageHeaders *headers;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[MFMailDelivery init](self, "init");
  if (v14)
  {
    v15 = objc_msgSend(v10, "mutableCopy");
    headers = v14->_headers;
    v14->_headers = (MFMutableMessageHeaders *)v15;

    -[MFMailDelivery updateOriginalMessageFromHeaders:](v14, "updateOriginalMessageFromHeaders:", v14->_headers);
    -[MFMutableMessageHeaders stripInternalHeaders](v14->_headers, "stripInternalHeaders");
    objc_storeStrong((id *)&v14->_htmlString, a4);
    objc_storeStrong((id *)&v14->_plainTextAlternative, a5);
    objc_storeStrong((id *)&v14->_otherStringsAndAttachments, a6);
    v14->_textPartsAreHTML = 1;
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[MFMailMessage setMessageBody:](self->_message, "setMessageBody:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MFMailDelivery;
  -[MFMailDelivery dealloc](&v3, sel_dealloc);
}

- (id)newMessageWriter
{
  MFMessageWriter *v3;
  void *v4;
  MFMessageWriter *v5;

  v3 = [MFMessageWriter alloc];
  -[MFMailDelivery compositionSpecification](self, "compositionSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MFMessageWriter initWithCompositionSpecification:](v3, "initWithCompositionSpecification:", v4);

  return v5;
}

- (id)message
{
  MFMailMessage *message;
  id v4;
  NSArray *otherStringsAndAttachments;
  id v6;
  MFMailMessage *v7;
  MFMailMessage *v8;
  void *v9;

  message = self->_message;
  if (!message)
  {
    if (self->_htmlString)
    {
      v4 = -[MFMailDelivery newMessageWriter](self, "newMessageWriter");
    }
    else
    {
      otherStringsAndAttachments = self->_otherStringsAndAttachments;
      v6 = -[MFMailDelivery newMessageWriter](self, "newMessageWriter");
      v4 = v6;
      if (!otherStringsAndAttachments)
      {
        v7 = (MFMailMessage *)objc_msgSend(v6, "createMessageWithPlainTextDocumentsAndAttachments:headers:", self->_mixedContent, self->_headers);
        goto LABEL_6;
      }
    }
    v7 = (MFMailMessage *)objc_msgSend(v4, "createMessageWithHTMLStringAndMIMECharset:plainTextAlternative:otherHtmlStringsAndAttachments:headers:", self->_htmlString, self->_plainTextAlternative, self->_otherStringsAndAttachments, self->_headers);
LABEL_6:
    v8 = self->_message;
    self->_message = v7;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    -[MFMailMessage setDateSentAsTimeIntervalSince1970:](self->_message, "setDateSentAsTimeIntervalSince1970:");

    message = self->_message;
  }
  return message;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (id)archiveAccount
{
  return self->_archiveAccount;
}

- (void)setArchiveAccount:(id)a3
{
  objc_storeStrong((id *)&self->_archiveAccount, a3);
}

- (id)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  DeliveryAccount *v5;
  DeliveryAccount *v6;

  v5 = (DeliveryAccount *)a3;
  if (self->_account != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_account, a3);
    v5 = v6;
    *((_BYTE *)self + 104) &= ~2u;
  }

}

- (int64_t)deliveryStatus
{
  return -[MFDeliveryResult status](self->_result, "status");
}

- (id)deliveryResult
{
  return self->_result;
}

- (id)originalHeaders
{
  MFMutableMessageHeaders *v3;

  v3 = self->_headers;
  if (!v3)
  {
    -[MFMailMessage headers](self->_message, "headers");
    v3 = (MFMutableMessageHeaders *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)headersForDelivery
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[MFMailMessage headers](self->_message, "headers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[MFMailDelivery originalHeaders](self, "originalHeaders");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v4, "removeHeaderForKey:", *MEMORY[0x1E0D45F08]);
  objc_msgSend(v4, "stripInternalHeaders");
  v5 = *MEMORY[0x1E0D1E618];
  objc_msgSend(v4, "firstHeaderForKey:", *MEMORY[0x1E0D1E618]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    EFProductName();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ ("), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    EFSystemBuildVersion();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendString:", v11);

    objc_msgSend(v10, "appendString:", CFSTR(")"));
    objc_msgSend(v4, "setHeader:forKey:", v10, v5);

  }
  return v4;
}

- (void)deliverAsynchronously
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  MFLookupLocalizedString(CFSTR("SEND_MESSAGE_FORMAT"), CFSTR("Sending message: %@"), CFSTR("Message"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessage subject](self->_message, "subject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  if (v6)
  {
    -[MFMailMessage subject](self->_message, "subject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subjectString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    MFLookupLocalizedString(CFSTR("NO_SUBJECT"), CFSTR("No subject"), CFSTR("Message"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8;
  }
  objc_msgSend(v3, "stringWithFormat:", v4, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)

  +[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFMonitoredInvocation invocationWithSelector:target:taskName:priority:canBeCancelled:](MFMonitoredInvocation, "invocationWithSelector:target:taskName:priority:canBeCancelled:", sel_deliverSynchronously, self, v11, 6, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addInvocation:", v10);

}

- (id)deliverSynchronously
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MFDeliveryResult *v12;
  MFDeliveryResult *v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  MFDeliveryResult *v25;
  void *v27;
  void *v28;

  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailDelivery message](self, "message");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailDelivery headersForDelivery](self, "headersForDelivery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "error");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
      goto LABEL_11;
  }
  v27 = v5;
  v28 = v3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D46100], "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rawData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "appendHeaderData:andRecipients:", v7, v6);
  objc_msgSend(MEMORY[0x1E0D46088], "dataHolderWithData:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
    objc_msgSend(v10, "addData:", v9);
  if (v6 && objc_msgSend(v6, "count"))
  {
    -[MFMailDelivery deliverMessageData:toRecipients:](self, "deliverMessageData:toRecipients:", v11, v6);
    v12 = (MFDeliveryResult *)objc_claimAutoreleasedReturnValue();
    v13 = self->_result;
    self->_result = v12;

    v14 = -[MFDeliveryResult status](self->_result, "status");
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB3940];
    MFLookupLocalizedString(CFSTR("INTERNAL_DELIVERY_ERROR_FORMAT"), CFSTR("This message couldn’t be delivered because the following internal error occurred: %@"), CFSTR("Delayed"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    MFLookupLocalizedString(CFSTR("NO_RECIPIENTS"), CFSTR("This message couldn’t be delivered because you haven’t specified any recipients."), CFSTR("Delayed"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1048, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setError:", v19);

    v14 = 1;
  }

  v5 = v27;
  v3 = v28;
  if (v14 == 3)
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    MFLookupLocalizedString(CFSTR("INTERNAL_DELIVERY_ERROR_FORMAT"), CFSTR("This message couldn’t be delivered because the following internal error occurred: %@"), CFSTR("Delayed"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", v21, &stru_1E4F1C8F8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1030, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setError:", v23);

LABEL_11:
    v14 = 1;
  }
  -[MFDeliveryResult setStatus:](self->_result, "setStatus:", v14);
  v25 = self->_result;

  return v25;
}

- (id)deliverMessageData:(id)a3 toRecipients:(id)a4
{
  return -[MFDeliveryResult initWithStatus:]([MFDeliveryResult alloc], "initWithStatus:", 1);
}

- (void)setCellDataOnly:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_BYTE *)self + 104) = *((_BYTE *)self + 104) & 0xFD | v3;
}

- (id)followUpWarning
{
  EFFuture *followUpFuture;
  void *v3;
  id v4;
  void *v5;
  id v7;

  followUpFuture = self->_followUpFuture;
  v7 = 0;
  -[EFFuture result:](followUpFuture, "result:", &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  objc_msgSend(v3, "followUpWarning");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)archive
{
  void *v3;
  MailAccount *archiveAccount;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  archiveAccount = self->_archiveAccount;
  if (archiveAccount)
  {
    -[MailAccount mailboxUidOfType:createIfNeeded:](archiveAccount, "mailboxUidOfType:createIfNeeded:", 4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCanBeCancelled:", 1);
    objc_msgSend(v5, "store");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "allowsAppend");

    if (v7)
    {
      +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "persistence");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "messageChangeManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMailDelivery message](self, "message");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "URL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addNewMessages:mailboxURL:userInitiated:", v11, v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[MFMailDelivery _checkAndApplyFollowUpToDeliveredMessage:](self, "_checkAndApplyFollowUpToDeliveredMessage:", v14);
    }

  }
}

- (void)updateOriginalMessageFromHeaders:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  EMMessageObjectID *v9;
  EMMessageObjectID *originalMessageObjectID;
  int64_t v11;
  void *v12;
  EMMessageObjectID *v13;
  id v14;

  v14 = a3;
  objc_msgSend(v14, "firstHeaderForKey:", *MEMORY[0x1E0D45F18]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstHeaderForKey:", *MEMORY[0x1E0D45F00]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  self->_action = 0;
  if (v4)
  {
    v7 = (void *)MEMORY[0x1E0D1E258];
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedData:options:", v4, 0);
    objc_msgSend(v7, "objectIDFromSerializedRepresentation:", v8);
    v9 = (EMMessageObjectID *)objc_claimAutoreleasedReturnValue();
    originalMessageObjectID = self->_originalMessageObjectID;
    self->_originalMessageObjectID = v9;
    v11 = 1;
LABEL_5:

    self->_action = v11;
    goto LABEL_6;
  }
  if (v5)
  {
    v12 = (void *)MEMORY[0x1E0D1E258];
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedData:options:", v5, 0);
    objc_msgSend(v12, "objectIDFromSerializedRepresentation:", v8);
    v13 = (EMMessageObjectID *)objc_claimAutoreleasedReturnValue();
    originalMessageObjectID = self->_originalMessageObjectID;
    self->_originalMessageObjectID = v13;
    v11 = 2;
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_checkAndApplyFollowUpToDeliveredMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MFMailDelivery followUpWarning](self, "followUpWarning");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_16;
  +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistence");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageChangeManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 20);
  v10 = objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 21);
  if (v9)
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 10.0);
  else
    objc_msgSend(v5, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v11, "dateByAddingTimeInterval:", 60.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v17 = &stru_1E4F1C8F8;
      goto LABEL_10;
    }
  }
  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("using DebugStartDate (original startDate:%@, endDate:%@)"), v15, v16);
  v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "toLightJson");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E178]), "initWithStartDate:endDate:jsonStringForModelEvaluationForSuggestions:", v12, v13, v18);
  +[MFMailDelivery log](MFMailDelivery, "log");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "score");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v25 = v21;
    v26 = 2114;
    v27 = v19;
    v28 = 2114;
    v29 = v17;
    _os_log_impl(&dword_1A4F90000, v20, OS_LOG_TYPE_DEFAULT, "suggestionService warning.score:%{public}@ followUp:%{public}@ %{public}@", buf, 0x20u);

  }
  v23 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applyFollowUp:toMessages:", v19, v22);

LABEL_16:
}

- (id)_htmlBodyForMessage:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "messageBodyIfAvailable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "htmlContent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v14;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "htmlData");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "preferredCharacterSet");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          MFEncodingForCharset();
          v12 = (void *)MFCreateStringWithData();

          objc_msgSend(v4, "appendString:", v12);
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v4;
}

- (NSDictionary)compositionSpecification
{
  return self->_compositionSpecification;
}

- (void)setCompositionSpecification:(id)a3
{
  objc_storeStrong((id *)&self->_compositionSpecification, a3);
}

- (unint64_t)conversationFlags
{
  return self->_conversationFlags;
}

- (void)setConversationFlags:(unint64_t)a3
{
  self->_conversationFlags = a3;
}

- (BOOL)isUserRequested
{
  return self->_isUserRequested;
}

- (void)setIsUserRequested:(BOOL)a3
{
  self->_isUserRequested = a3;
}

- (EMMessageObjectID)originalMessageObjectID
{
  return self->_originalMessageObjectID;
}

- (void)setOriginalMessageObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_originalMessageObjectID, a3);
}

- (MFMailMessage)originalMessage
{
  return self->_originalMessage;
}

- (void)setOriginalMessage:(id)a3
{
  objc_storeStrong((id *)&self->_originalMessage, a3);
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (BOOL)shouldSign
{
  return self->_shouldSign;
}

- (void)setShouldSign:(BOOL)a3
{
  self->_shouldSign = a3;
}

- (BOOL)shouldEncrypt
{
  return self->_shouldEncrypt;
}

- (void)setShouldEncrypt:(BOOL)a3
{
  self->_shouldEncrypt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalMessage, 0);
  objc_storeStrong((id *)&self->_originalMessageObjectID, 0);
  objc_storeStrong((id *)&self->_followUpFuture, 0);
  objc_storeStrong((id *)&self->_otherStringsAndAttachments, 0);
  objc_storeStrong((id *)&self->_plainTextAlternative, 0);
  objc_storeStrong((id *)&self->_htmlString, 0);
  objc_storeStrong((id *)&self->_mixedContent, 0);
  objc_storeStrong((id *)&self->_compositionSpecification, 0);
  objc_storeStrong((id *)&self->_headers, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_archiveAccount, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_destroyWeak(&self->_delegate);
}

@end
