@implementation MFDADraftMessage

- (MFDADraftMessage)initWithMailMessage:(id)a3 clientID:(unint64_t)a4
{
  id v7;
  MFDADraftMessage *v8;
  MFDADraftMessage *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSString *bodyData;
  MFDADraftMessage *v14;
  objc_super v16;

  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MFDADraftMessage;
  v8 = -[MFDADraftMessage init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_message, a3);
    v10 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MFMailMessage messageData](v9->_message, "messageData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithData:encoding:", v11, 4);
    bodyData = v9->_bodyData;
    v9->_bodyData = (NSString *)v12;

    v9->_clientID = a4;
    v14 = v9;
  }

  return v9;
}

- (id)messageIDHeader
{
  return (id)-[MFMailMessage messageIDHeader](self->_message, "messageIDHeader");
}

- (id)to
{
  return (id)-[MFMailMessage to](self->_message, "to");
}

- (id)cc
{
  return (id)-[MFMailMessage cc](self->_message, "cc");
}

- (id)bcc
{
  return (id)-[MFMailMessage bcc](self->_message, "bcc");
}

- (id)from
{
  return (id)-[MFMailMessage senders](self->_message, "senders");
}

- (id)replyTo
{
  return 0;
}

- (id)date
{
  return (id)-[MFMailMessage dateSent](self->_message, "dateSent");
}

- (id)subject
{
  void *v2;
  void *v3;

  -[MFMailMessage subject](self->_message, "subject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subjectString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)body
{
  return self->_bodyData;
}

- (id)clientID
{
  unint64_t clientID;
  void *v3;

  clientID = self->_clientID;
  if (clientID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), clientID);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)setClientID:(unint64_t)a3
{
  self->_clientID = a3;
}

- (id)serverID
{
  void *v3;
  void *v4;

  if ((-[MFMailMessage messageFlags](self->_message, "messageFlags") & 0x100000000) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[MFMailMessage remoteID](self->_message, "remoteID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "copy");

  }
  return v4;
}

- (int)bodyType
{
  return 4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
