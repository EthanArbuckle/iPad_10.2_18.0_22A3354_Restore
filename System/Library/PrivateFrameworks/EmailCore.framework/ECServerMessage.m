@implementation ECServerMessage

- (ECServerMessage)initWithServerMessageBuilder:(id)a3
{
  void (**v4)(id, ECServerMessage *);
  ECServerMessage *v5;
  objc_super v7;

  v4 = (void (**)(id, ECServerMessage *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ECServerMessage;
  v5 = -[ECServerMessage init](&v7, sel_init);
  if (v5)
    v4[2](v4, v5);

  return v5;
}

- (ECServerMessage)initWithIMAPServerMessageBuilder:(id)a3
{
  void (**v4)(id, ECServerMessage *);
  ECServerMessage *v5;
  objc_super v7;

  v4 = (void (**)(id, ECServerMessage *))a3;
  v7.receiver = self;
  v7.super_class = (Class)ECServerMessage;
  v5 = -[ECServerMessage init](&v7, sel_init);
  if (v5)
    v4[2](v4, v5);

  return v5;
}

- (ECServerMessage)init
{
  -[ECServerMessage doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[ECServerMessage init]", "ECServerMessage.m", 42, "0");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[ECServerMessage remoteID](self, "remoteID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ECServerMessage remoteID](self, "remoteID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (unsigned)imapUID
{
  NSNumber *imapUID;
  void *v6;

  imapUID = self->_imapUID;
  if (!imapUID)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECServerMessage.m"), 62, CFSTR("Trying to get an IMAP UID from a server message with a string remote_id"));

    imapUID = self->_imapUID;
  }
  return -[NSNumber unsignedIntValue](imapUID, "unsignedIntValue");
}

- (void)setImapUID:(unsigned int)a3
{
  uint64_t v3;
  NSNumber *v5;
  NSNumber *imapUID;
  id v7;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  imapUID = self->_imapUID;
  self->_imapUID = v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[ECServerMessage setRemoteID:](self, "setRemoteID:");

}

- (id)remoteIDObject
{
  NSNumber *imapUID;

  imapUID = self->_imapUID;
  if (!imapUID)
    imapUID = (NSNumber *)self->_remoteID;
  return imapUID;
}

- (NSString)persistentID
{
  return self->_persistentID;
}

- (void)setPersistentID:(id)a3
{
  objc_storeStrong((id *)&self->_persistentID, a3);
}

- (NSString)messagePersistentID
{
  return self->_messagePersistentID;
}

- (void)setMessagePersistentID:(id)a3
{
  objc_storeStrong((id *)&self->_messagePersistentID, a3);
}

- (ECMessageFlags)serverFlags
{
  return self->_serverFlags;
}

- (void)setServerFlags:(id)a3
{
  objc_storeStrong((id *)&self->_serverFlags, a3);
}

- (NSString)remoteID
{
  return self->_remoteID;
}

- (void)setRemoteID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSSet)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_remoteID, 0);
  objc_storeStrong((id *)&self->_serverFlags, 0);
  objc_storeStrong((id *)&self->_messagePersistentID, 0);
  objc_storeStrong((id *)&self->_persistentID, 0);
  objc_storeStrong((id *)&self->_imapUID, 0);
}

@end
