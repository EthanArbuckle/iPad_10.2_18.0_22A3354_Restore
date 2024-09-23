@implementation MTRMessagesClusterMessageResponseOptionStruct

- (MTRMessagesClusterMessageResponseOptionStruct)init
{
  MTRMessagesClusterMessageResponseOptionStruct *v2;
  MTRMessagesClusterMessageResponseOptionStruct *v3;
  NSNumber *messageResponseID;
  NSString *label;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRMessagesClusterMessageResponseOptionStruct;
  v2 = -[MTRMessagesClusterMessageResponseOptionStruct init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    messageResponseID = v2->_messageResponseID;
    v2->_messageResponseID = 0;

    label = v3->_label;
    v3->_label = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRMessagesClusterMessageResponseOptionStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRMessagesClusterMessageResponseOptionStruct);
  objc_msgSend_messageResponseID(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMessageResponseID_(v4, v8, (uint64_t)v7);

  objc_msgSend_label(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLabel_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: messageResponseID:%@; label:%@; >"),
    v5,
    self->_messageResponseID,
    self->_label);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)messageResponseID
{
  return self->_messageResponseID;
}

- (void)setMessageResponseID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_messageResponseID, 0);
}

@end
