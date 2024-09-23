@implementation MTRMessagesClusterMessageCompleteEvent

- (MTRMessagesClusterMessageCompleteEvent)init
{
  const char *v2;
  uint64_t v3;
  MTRMessagesClusterMessageCompleteEvent *v4;
  uint64_t v5;
  NSData *messageID;
  NSNumber *responseID;
  NSString *reply;
  NSNumber *futureMessagesPreference;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTRMessagesClusterMessageCompleteEvent;
  v4 = -[MTRMessagesClusterMessageCompleteEvent init](&v11, sel_init);
  if (v4)
  {
    objc_msgSend_data(MEMORY[0x24BDBCE50], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    messageID = v4->_messageID;
    v4->_messageID = (NSData *)v5;

    responseID = v4->_responseID;
    v4->_responseID = 0;

    reply = v4->_reply;
    v4->_reply = 0;

    futureMessagesPreference = v4->_futureMessagesPreference;
    v4->_futureMessagesPreference = 0;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRMessagesClusterMessageCompleteEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;

  v4 = objc_alloc_init(MTRMessagesClusterMessageCompleteEvent);
  objc_msgSend_messageID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMessageID_(v4, v8, (uint64_t)v7);

  objc_msgSend_responseID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setResponseID_(v4, v12, (uint64_t)v11);

  objc_msgSend_reply(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setReply_(v4, v16, (uint64_t)v15);

  objc_msgSend_futureMessagesPreference(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFutureMessagesPreference_(v4, v20, (uint64_t)v19);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_messageID, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("<%@: messageID:%@; responseID:%@; reply:%@; futureMessagesPreference:%@; >"),
    v5,
    v7,
    self->_responseID,
    self->_reply,
    self->_futureMessagesPreference);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSData)messageID
{
  return self->_messageID;
}

- (void)setMessageID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)responseID
{
  return self->_responseID;
}

- (void)setResponseID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)futureMessagesPreference
{
  return self->_futureMessagesPreference;
}

- (void)setFutureMessagesPreference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_futureMessagesPreference, 0);
  objc_storeStrong((id *)&self->_reply, 0);
  objc_storeStrong((id *)&self->_responseID, 0);
  objc_storeStrong((id *)&self->_messageID, 0);
}

@end
