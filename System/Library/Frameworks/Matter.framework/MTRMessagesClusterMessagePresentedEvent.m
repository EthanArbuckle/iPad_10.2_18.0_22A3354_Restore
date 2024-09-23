@implementation MTRMessagesClusterMessagePresentedEvent

- (MTRMessagesClusterMessagePresentedEvent)init
{
  const char *v2;
  uint64_t v3;
  MTRMessagesClusterMessagePresentedEvent *v4;
  uint64_t v5;
  NSData *messageID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTRMessagesClusterMessagePresentedEvent;
  v4 = -[MTRMessagesClusterMessagePresentedEvent init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend_data(MEMORY[0x24BDBCE50], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    messageID = v4->_messageID;
    v4->_messageID = (NSData *)v5;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRMessagesClusterMessagePresentedEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;

  v4 = objc_alloc_init(MTRMessagesClusterMessagePresentedEvent);
  objc_msgSend_messageID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMessageID_(v4, v8, (uint64_t)v7);

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
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("<%@: messageID:%@; >"), v5, v7);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageID, 0);
}

@end
