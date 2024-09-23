@implementation MFDAMessage

- (MFDAMessage)initWithDAMailMessage:(id)a3 mailbox:(id)a4
{
  id v7;
  id v8;
  MFDAMessage *v9;
  void *v10;
  uint64_t v11;
  MFMessage *rfc822CreatedMessage;
  uint64_t v13;
  NSString *externalConversationID;
  NSObject *v15;
  void *v16;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MFDAMessage;
  v9 = -[MFDAMessage init](&v18, sel_init);
  if (v9)
  {
    objc_msgSend(v7, "rfc822Data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFMessage messageWithRFC822Data:](MFMailMessage, "messageWithRFC822Data:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    rfc822CreatedMessage = v9->_rfc822CreatedMessage;
    v9->_rfc822CreatedMessage = (MFMessage *)v11;

    objc_storeStrong((id *)&v9->_DAMailMessage, a3);
    objc_storeStrong((id *)&v9->_mailbox, a4);
    v13 = MFCreateExternalConversationID(v9->_DAMailMessage);
    externalConversationID = v9->_externalConversationID;
    v9->_externalConversationID = (NSString *)v13;

    MFLogGeneral();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      -[MFDAMessage subject](v9, "subject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v16;
      _os_log_impl(&dword_1A4F90000, v15, OS_LOG_TYPE_INFO, "#Power [New Message] subject=%@;", buf, 0xCu);

    }
  }

  return v9;
}

- (NSString)remoteID
{
  return (NSString *)-[DAMailMessage remoteID](self->_DAMailMessage, "remoteID");
}

- (id)externalConversationID
{
  return self->_externalConversationID;
}

- (EDIndexableMailbox)mailbox
{
  return (EDIndexableMailbox *)self->_mailbox;
}

- (ECMessageHeaders)headers
{
  return (ECMessageHeaders *)-[MFMessage headers](self->_rfc822CreatedMessage, "headers");
}

- (unint64_t)messageFlags
{
  unint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MFDAMessage;
  v3 = -[MFMailMessage messageFlags](&v14, sel_messageFlags);
  v4 = v3 | -[DAMailMessage read](self->_DAMailMessage, "read");
  if (-[DAMailMessage flagged](self->_DAMailMessage, "flagged"))
    v4 |= 0x10uLL;
  v5 = -[DAMailMessage lastVerb](self->_DAMailMessage, "lastVerb");
  v6 = v4 | 4;
  if (v5 == 1)
    v7 = v4 | 4;
  else
    v7 = v4;
  if (v5 != 2)
    v6 = v7;
  if (v5 == 3)
    v8 = v4 | 0x100;
  else
    v8 = v6;
  -[DAMailMessage attachments](self->_DAMailMessage, "attachments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  -[DAMailMessage meetingRequestUUID](self->_DAMailMessage, "meetingRequestUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v12 = v10 + 1;
  else
    v12 = v10;
  return v8 & 0xFFFFFFFFFFFF03FFLL | ((unint64_t)(v12 & 0x3F) << 10);
}

- (id)messageBody
{
  return (id)-[MFMessage messageBody](self->_rfc822CreatedMessage, "messageBody");
}

- (BOOL)messageData:(id *)a3 messageSize:(unint64_t *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6
{
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  return 0;
}

- (BOOL)messageDataHolder:(id *)a3 messageSize:(unint64_t *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6
{
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  return 0;
}

- (id)remoteMailboxURL
{
  void *v2;
  void *v3;

  -[MFDAMessage mailbox](self, "mailbox");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)messageSize
{
  int v3;
  void *v4;
  void *v5;
  int v6;

  v3 = -[DAMailMessage bodySize](self->_DAMailMessage, "bodySize");
  -[DAMailMessage attachments](self->_DAMailMessage, "attachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKeyPath:", CFSTR("@sum.size"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue") + v3;

  return v6;
}

- (EDMessageCategorizationResult)categorizationResult
{
  return self->_categorizationResult;
}

- (void)setCategorizationResult:(id)a3
{
  objc_storeStrong((id *)&self->_categorizationResult, a3);
}

- (int64_t)authenticationState
{
  return self->_authenticationState;
}

- (void)setAuthenticationState:(int64_t)a3
{
  self->_authenticationState = a3;
}

- (DAMailMessage)DAMailMessage
{
  return self->_DAMailMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_DAMailMessage, 0);
  objc_storeStrong((id *)&self->_categorizationResult, 0);
  objc_storeStrong((id *)&self->_externalConversationID, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);
  objc_storeStrong((id *)&self->_rfc822CreatedMessage, 0);
}

@end
