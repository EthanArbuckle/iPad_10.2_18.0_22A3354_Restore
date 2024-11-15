@implementation EDExistingMessageWithMessageIDHeader

- (EDExistingMessageWithMessageIDHeader)initWithMessageIDHash:(id)a3 serverMessage:(id)a4 messagePersistentID:(int64_t)a5
{
  id v9;
  id v10;
  EDExistingMessageWithMessageIDHeader *v11;
  EDExistingMessageWithMessageIDHeader *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)EDExistingMessageWithMessageIDHeader;
  v11 = -[EDExistingMessageWithMessageIDHeader init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_messageIDHash, a3);
    objc_storeStrong((id *)&v12->_serverMessage, a4);
    v12->_messagePersistentID = a5;
  }

  return v12;
}

- (ECAngleBracketIDHash)messageIDHash
{
  return self->_messageIDHash;
}

- (ECServerMessage)serverMessage
{
  return self->_serverMessage;
}

- (int64_t)messagePersistentID
{
  return self->_messagePersistentID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverMessage, 0);
  objc_storeStrong((id *)&self->_messageIDHash, 0);
}

@end
