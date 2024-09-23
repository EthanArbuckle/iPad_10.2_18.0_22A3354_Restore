@implementation MFMailDelivery

+ (id)newWithMessage:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(+[MailAccount accountThatMessageIsFrom:](MailAccount, "accountThatMessageIsFrom:"), "deliveryAccount");
  if (!v4)
    v4 = +[MailAccount defaultDeliveryAccount](MailAccount, "defaultDeliveryAccount");
  return (id)objc_msgSend(v4, "newDeliveryWithMessage:", a3);
}

+ (id)newWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5
{
  return (id)objc_msgSend((id)objc_msgSend(+[MailAccount accountContainingEmailAddress:](MailAccount, "accountContainingEmailAddress:", objc_msgSend(a3, "firstSenderAddress")), "deliveryAccount"), "newDeliveryWithHeaders:mixedContent:textPartsAreHTML:", a3, a4, a5);
}

+ (id)newWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6 charsets:(id)a7
{
  return (id)objc_msgSend((id)objc_msgSend(+[MailAccount accountContainingEmailAddress:](MailAccount, "accountContainingEmailAddress:", objc_msgSend(a3, "firstSenderAddress")), "deliveryAccount"), "newDeliveryWithHeaders:HTML:plainTextAlternative:other:charsets:", a3, a4, a5, a6, a7);
}

+ (BOOL)deliverMessage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(a1, "newWithMessage:", a3);
  if (v3)
  {
    v4 = v3;
    v5 = (void *)objc_msgSend(v3, "deliverSynchronously");

    LOBYTE(v3) = objc_msgSend(v5, "status") == 0;
  }
  return (char)v3;
}

- (MFMailDelivery)init
{
  MFMailDelivery *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMailDelivery;
  result = -[MFMailDelivery init](&v3, sel_init);
  if (result)
    result->_delegate = 0;
  return result;
}

- (MFMailDelivery)initWithMessage:(id)a3
{
  MFMailDelivery *v4;

  v4 = -[MFMailDelivery init](self, "init");
  if (v4)
    v4->_message = (MFMessage *)a3;
  return v4;
}

- (MFMailDelivery)initWithHeaders:(id)a3 mixedContent:(id)a4 textPartsAreHTML:(BOOL)a5
{
  MFMailDelivery *v8;
  MFMutableMessageHeaders *v9;

  v8 = -[MFMailDelivery init](self, "init");
  if (v8)
  {
    v9 = (MFMutableMessageHeaders *)objc_msgSend(a3, "mutableCopy");
    v8->_headers = v9;
    -[MFMutableMessageHeaders stripInternalHeaders](v9, "stripInternalHeaders");
    v8->_mixedContent = (NSArray *)a4;
    v8->_textPartsAreHTML = a5;
  }
  return v8;
}

- (MFMailDelivery)initWithHeaders:(id)a3 HTML:(id)a4 plainTextAlternative:(id)a5 other:(id)a6 charsets:(id)a7
{
  MFMailDelivery *v12;
  MFMutableMessageHeaders *v13;

  v12 = -[MFMailDelivery init](self, "init");
  if (v12)
  {
    v13 = (MFMutableMessageHeaders *)objc_msgSend(a3, "mutableCopy");
    v12->_headers = v13;
    -[MFMutableMessageHeaders stripInternalHeaders](v13, "stripInternalHeaders");
    v12->_htmlString = (NSString *)a4;
    v12->_plainTextAlternative = (MFPlainTextDocument *)a5;
    v12->_otherStringsAndAttachments = (NSArray *)a6;
    v12->_charsets = (NSArray *)a7;
    v12->_textPartsAreHTML = 1;
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[MFMessage setMessageBody:](self->_message, "setMessageBody:", 0);

  v3.receiver = self;
  v3.super_class = (Class)MFMailDelivery;
  -[MFMailDelivery dealloc](&v3, sel_dealloc);
}

- (id)newMessageWriter
{
  return -[MFMessageWriter initWithCompositionSpecification:]([MFMessageWriter alloc], "initWithCompositionSpecification:", -[MFMailDelivery compositionSpecification](self, "compositionSpecification"));
}

- (id)message
{
  id result;
  id v4;
  NSArray *otherStringsAndAttachments;
  id v6;
  MFMessage *v7;
  MFMessage *v8;

  result = self->_message;
  if (!result)
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
        v7 = (MFMessage *)objc_msgSend(v6, "createMessageWithPlainTextDocumentsAndAttachments:headers:", self->_mixedContent, self->_headers);
        goto LABEL_6;
      }
    }
    v7 = (MFMessage *)objc_msgSend(v4, "createMessageWithHtmlString:plainTextAlternative:otherHtmlStringsAndAttachments:charsets:headers:", self->_htmlString, self->_plainTextAlternative, self->_otherStringsAndAttachments, self->_charsets, self->_headers);
LABEL_6:
    v8 = v7;
    self->_message = v7;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D68], "date"), "timeIntervalSince1970");
    -[MFMessage setDateSentTimeIntervalSince1970:](v8, "setDateSentTimeIntervalSince1970:");

    return self->_message;
  }
  return result;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (id)archiveAccount
{
  return self->_archiveAccount;
}

- (void)setArchiveAccount:(id)a3
{
  MailAccount *archiveAccount;

  archiveAccount = self->_archiveAccount;
  if (archiveAccount != a3)
  {

    self->_archiveAccount = (MailAccount *)a3;
  }
}

- (id)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
  DeliveryAccount *account;

  account = self->_account;
  if (account != a3)
  {

    self->_account = (DeliveryAccount *)a3;
    *((_BYTE *)self + 112) &= ~2u;
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
  if (self->_headers)
    return self->_headers;
  else
    return (id)-[MFMessage headers](self->_message, "headers");
}

- (id)headersForDelivery
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;

  v3 = (id)-[MFMessage headers](self->_message, "headers");
  if (!v3)
    v3 = -[MFMailDelivery originalHeaders](self, "originalHeaders");
  v4 = (id)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v4, "removeHeaderForKey:", *MEMORY[0x1E0D45F08]);
  objc_msgSend(v4, "stripInternalHeaders");
  v5 = *MEMORY[0x1E0D1E618];
  if (!objc_msgSend(v4, "firstHeaderForKey:", *MEMORY[0x1E0D1E618]))
  {
    v6 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ ("), EFProductName()), "mutableCopyWithZone:", -[MFMailDelivery zone](self, "zone"));
    objc_msgSend(v6, "appendString:", MEMORY[0x1CAA3540C]());
    objc_msgSend(v6, "appendString:", CFSTR(")"));
    objc_msgSend(v4, "setHeader:forKey:", v6, v5);

  }
  return v4;
}

- (BOOL)shouldSignMessage
{
  return objc_msgSend(-[NSDictionary objectForKey:](self->_compositionSpecification, "objectForKey:", CFSTR("ShouldSign")), "BOOLValue");
}

- (BOOL)shouldEncryptMessage
{
  return objc_msgSend(-[NSDictionary objectForKey:](self->_compositionSpecification, "objectForKey:", CFSTR("ShouldEncrypt")), "BOOLValue");
}

- (void)deliverAsynchronously
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = +[MFInvocationQueue sharedInvocationQueue](MFInvocationQueue, "sharedInvocationQueue");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = MFLookupLocalizedString((uint64_t)CFSTR("SEND_MESSAGE_FORMAT"), (uint64_t)CFSTR("Sending message: %@"), 0);
  if (objc_msgSend((id)-[MFMessage subject](self->_message, "subject"), "length"))
    v6 = -[MFMessage subject](self->_message, "subject");
  else
    v6 = MFLookupLocalizedString((uint64_t)CFSTR("NO_SUBJECT"), (uint64_t)CFSTR("No subject"), 0);
  objc_msgSend(v3, "addInvocation:", +[MFMonitoredInvocation invocationWithSelector:target:taskName:priority:canBeCancelled:](MFMonitoredInvocation, "invocationWithSelector:target:taskName:priority:canBeCancelled:", sel_deliverSynchronously, self, objc_msgSend(v4, "stringWithFormat:", v5, v6), 6, 1));
}

- (id)deliverSynchronously
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  MFDeliveryResult *v11;
  MFDeliveryResult *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  v3 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  v4 = -[MFMailDelivery message](self, "message");
  v5 = -[MFMailDelivery headersForDelivery](self, "headersForDelivery");
  if (!v4 && objc_msgSend(v3, "error"))
    goto LABEL_11;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = objc_msgSend(MEMORY[0x1E0D46100], "data");
  v8 = objc_msgSend((id)objc_msgSend(v4, "messageBody"), "rawData");
  objc_msgSend(v5, "appendHeaderData:andRecipients:", v7, v6);
  v9 = (void *)objc_msgSend(MEMORY[0x1E0D46088], "dataHolderWithData:", v7);
  v10 = v9;
  if (v8)
    objc_msgSend(v9, "addData:", v8);
  if (!v6 || !objc_msgSend(v6, "count"))
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = MFLookupLocalizedString((uint64_t)CFSTR("INTERNAL_DELIVERY_ERROR_FORMAT"), (uint64_t)CFSTR("This message couldn’t be delivered because the following internal error occurred: %@"), CFSTR("Delayed"));
    v14 = objc_msgSend(v16, "stringWithFormat:", v17, MFLookupLocalizedString((uint64_t)CFSTR("NO_RECIPIENTS"), (uint64_t)CFSTR("This message couldn’t be delivered because you haven’t specified any recipients."), CFSTR("Delayed")));
    v15 = 1048;
    goto LABEL_9;
  }
  v11 = -[MFMailDelivery deliverMessageData:toRecipients:](self, "deliverMessageData:toRecipients:", v10, v6);
  self->_result = v11;
  v12 = v11;
  v13 = -[MFDeliveryResult status](self->_result, "status");
  if (v13 == 3)
  {
    v14 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("INTERNAL_DELIVERY_ERROR_FORMAT"), (uint64_t)CFSTR("This message couldn’t be delivered because the following internal error occurred: %@"), CFSTR("Delayed")), &stru_1E81CBE50);
    v15 = 1030;
LABEL_9:
    objc_msgSend(v3, "setError:", +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), v15, v14));
LABEL_11:
    v13 = 1;
  }
  -[MFDeliveryResult setStatus:](self->_result, "setStatus:", v13);
  return self->_result;
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
  *((_BYTE *)self + 112) = *((_BYTE *)self + 112) & 0xFD | v3;
}

- (void)archive
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = objc_msgSend((id)objc_msgSend(a1, "error"), "ef_publicDescription");
  _os_log_error_impl(&dword_1C8839000, a2, OS_LOG_TYPE_ERROR, "Error %{public}@ occurred while trying to append messages to outgoing store. Ignoring and proceeding with delivery...", (uint8_t *)&v3, 0xCu);
}

- (NSDictionary)compositionSpecification
{
  return self->_compositionSpecification;
}

- (void)setCompositionSpecification:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
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

@end
