@implementation IDSSessionInvitationSentMetric

- (NSString)name
{
  return (NSString *)CFSTR("IDSSessionInvitationSent");
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

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_guid(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(v3, CFSTR("guid"), v7);

  objc_msgSend_numberOfRecipients(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v3, CFSTR("numberOfRecipients"), v11);

  return (NSDictionary *)v3;
}

- (IDSSessionInvitationSentMetric)initWithGuid:(id)a3 numberOfRecipients:(id)a4
{
  id v7;
  id v8;
  IDSSessionInvitationSentMetric *v9;
  IDSSessionInvitationSentMetric *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSSessionInvitationSentMetric;
  v9 = -[IDSSessionInvitationSentMetric init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_guid, a3);
    objc_storeStrong((id *)&v10->_numberOfRecipients, a4);
  }

  return v10;
}

- (NSString)guid
{
  return self->_guid;
}

- (NSNumber)numberOfRecipients
{
  return self->_numberOfRecipients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberOfRecipients, 0);
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
