@implementation IDSCancelMessage

- (IDSCancelMessage)initWithQueueOneIdentifier:(id)a3 fromID:(id)a4
{
  id v7;
  id v8;
  IDSCancelMessage *v9;
  IDSCancelMessage *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSCancelMessage;
  v9 = -[IDSMessage init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fromID, a4);
    objc_storeStrong((id *)&v10->_queueOneIdentifier, a3);
  }

  return v10;
}

- (int64_t)command
{
  return 103;
}

- (id)messageBody
{
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  __CFDictionary *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  double v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)IDSCancelMessage;
  -[IDSMessage messageBody](&v17, sel_messageBody);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (__CFDictionary *)objc_msgSend_mutableCopy(v3, v4, v5, v6);

  objc_msgSend_fromID(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v7, CFSTR("sP"), v11);

  objc_msgSend_queueOneIdentifier(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    CFDictionarySetValue(v7, CFSTR("qI"), v15);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    sub_19BAFA378();
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  void *v14;
  const char *v15;
  double v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)IDSCancelMessage;
  v4 = -[IDSMessage copyWithZone:](&v18, sel_copyWithZone_, a3);
  objc_msgSend_fromID(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFromID_(v4, v9, (uint64_t)v8, v10);

  objc_msgSend_queueOneIdentifier(self, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setQueueOneIdentifier_(v4, v15, (uint64_t)v14, v16);

  return v4;
}

- (id)description
{
  uint64_t v2;
  double v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_fromID(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_queueOneIdentifier(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v11, (uint64_t)CFSTR("<IDSCancelMessage %p: %@ %@>"), v12, self, v6, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)fromID
{
  return self->_fromID;
}

- (void)setFromID:(id)a3
{
  objc_storeStrong((id *)&self->_fromID, a3);
}

- (NSString)queueOneIdentifier
{
  return self->_queueOneIdentifier;
}

- (void)setQueueOneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_queueOneIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueOneIdentifier, 0);
  objc_storeStrong((id *)&self->_fromID, 0);
}

@end
