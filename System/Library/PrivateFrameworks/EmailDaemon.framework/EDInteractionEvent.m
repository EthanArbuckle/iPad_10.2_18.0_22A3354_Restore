@implementation EDInteractionEvent

- (id)debugDescription
{
  void *v3;
  int64_t v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v4 = -[EDInteractionEvent eventID](self, "eventID");
  v5 = v4 == 0;
  if (v4)
    objc_msgSend(v3, "appendFormat:", CFSTR(" eventID=%lld"), -[EDInteractionEvent eventID](self, "eventID"));
  if (-[EDInteractionEvent version](self, "version"))
  {
    if (v4)
      objc_msgSend(v3, "appendString:", CFSTR(","));
    objc_msgSend(v3, "appendFormat:", CFSTR(" version=%ld"), -[EDInteractionEvent version](self, "version"));
    v5 = 0;
  }
  -[EDInteractionEvent name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (!v5)
      objc_msgSend(v3, "appendString:", CFSTR(","));
    -[EDInteractionEvent name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" name=%@"), v7);

    v5 = 0;
  }
  -[EDInteractionEvent date](self, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (!v5)
      objc_msgSend(v3, "appendString:", CFSTR(","));
    -[EDInteractionEvent date](self, "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" date=%@"), v9);

    v5 = 0;
  }
  -[EDInteractionEvent accountID](self, "accountID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (!v5)
      objc_msgSend(v3, "appendString:", CFSTR(","));
    -[EDInteractionEvent accountID](self, "accountID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" accountID=%@"), v11);

    v5 = 0;
  }
  if (-[EDInteractionEvent mailboxID](self, "mailboxID"))
  {
    if (!v5)
      objc_msgSend(v3, "appendString:", CFSTR(","));
    objc_msgSend(v3, "appendFormat:", CFSTR(" mailboxID=%lld"), -[EDInteractionEvent mailboxID](self, "mailboxID"));
    v5 = 0;
  }
  if (-[EDInteractionEvent conversationID](self, "conversationID"))
  {
    if (!v5)
      objc_msgSend(v3, "appendString:", CFSTR(","));
    objc_msgSend(v3, "appendFormat:", CFSTR(" conversationID=%lld"), -[EDInteractionEvent conversationID](self, "conversationID"));
    v5 = 0;
  }
  if (-[EDInteractionEvent messageIDHash](self, "messageIDHash"))
  {
    if (!v5)
      objc_msgSend(v3, "appendString:", CFSTR(","));
    objc_msgSend(v3, "appendFormat:", CFSTR(" messageIDHash=%lld"), -[EDInteractionEvent messageIDHash](self, "messageIDHash"));
    v5 = 0;
  }
  if (-[EDInteractionEvent messagePersistentID](self, "messagePersistentID"))
  {
    if (!v5)
      objc_msgSend(v3, "appendString:", CFSTR(","));
    objc_msgSend(v3, "appendFormat:", CFSTR(" messagePersistentID=%lld"), -[EDInteractionEvent messagePersistentID](self, "messagePersistentID"));
    v5 = 0;
  }
  -[EDInteractionEvent data](self, "data");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (!v5)
      objc_msgSend(v3, "appendString:", CFSTR(","));
    -[EDInteractionEvent data](self, "data");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" data=%@"), v13);

  }
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (int64_t)eventID
{
  return self->_eventID;
}

- (void)setEventID:(int64_t)a3
{
  self->_eventID = a3;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)mailboxID
{
  return self->_mailboxID;
}

- (void)setMailboxID:(int64_t)a3
{
  self->_mailboxID = a3;
}

- (int64_t)conversationID
{
  return self->_conversationID;
}

- (void)setConversationID:(int64_t)a3
{
  self->_conversationID = a3;
}

- (int64_t)messageIDHash
{
  return self->_messageIDHash;
}

- (void)setMessageIDHash:(int64_t)a3
{
  self->_messageIDHash = a3;
}

- (int64_t)messagePersistentID
{
  return self->_messagePersistentID;
}

- (void)setMessagePersistentID:(int64_t)a3
{
  self->_messagePersistentID = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDictionary)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
