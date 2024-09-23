@implementation IDSSessionInvitationReceivedMetric

- (NSString)name
{
  return (NSString *)CFSTR("SessionInvitationReceived");
}

- (NSDictionary)dictionaryRepresentation
{
  __CFDictionary *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend_guid(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(v3, CFSTR("guid"), v7);

  return (NSDictionary *)v3;
}

- (IDSSessionInvitationReceivedMetric)initWithGuid:(id)a3
{
  id v5;
  IDSSessionInvitationReceivedMetric *v6;
  IDSSessionInvitationReceivedMetric *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSSessionInvitationReceivedMetric;
  v6 = -[IDSSessionInvitationReceivedMetric init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_guid, a3);

  return v7;
}

- (NSString)guid
{
  return self->_guid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guid, 0);
}

@end
