@implementation IDSSessionCancelSentMetric

- (NSString)name
{
  return (NSString *)CFSTR("SessionCancelSent");
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  const char *v17;
  double v18;
  void *v19;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_guid(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(v3, CFSTR("guid"), v7);

  objc_msgSend_numberOfRecipients(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("numberOfRecipients"), v11);

  v12 = (void *)MEMORY[0x1E0CB37E8];
  v16 = objc_msgSend_remoteSessionEndReason(self, v13, v14, v15);
  objc_msgSend_numberWithUnsignedInt_(v12, v17, v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    CFDictionarySetValue(v3, CFSTR("remoteSessionEndReason"), v19);

  return (NSDictionary *)v3;
}

- (IDSSessionCancelSentMetric)initWithGuid:(id)a3 numberOfRecipients:(id)a4 remoteSessionEndReason:(unsigned int)a5
{
  id v9;
  id v10;
  IDSSessionCancelSentMetric *v11;
  IDSSessionCancelSentMetric *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IDSSessionCancelSentMetric;
  v11 = -[IDSSessionCancelSentMetric init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_guid, a3);
    objc_storeStrong((id *)&v12->_numberOfRecipients, a4);
    v12->_remoteSessionEndReason = a5;
  }

  return v12;
}

- (NSString)guid
{
  return self->_guid;
}

- (NSNumber)numberOfRecipients
{
  return self->_numberOfRecipients;
}

- (unsigned)remoteSessionEndReason
{
  return self->_remoteSessionEndReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfRecipients, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
