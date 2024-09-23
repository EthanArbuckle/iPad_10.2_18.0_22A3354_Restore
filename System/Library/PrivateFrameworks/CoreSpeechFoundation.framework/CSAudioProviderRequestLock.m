@implementation CSAudioProviderRequestLock

- (CSAudioProviderRequestLock)initWithClientIdentity:(unint64_t)a3
{
  CSAudioProviderRequestLock *v4;
  void *v5;
  uint64_t v6;
  NSString *UUIDString;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSAudioProviderRequestLock;
  v4 = -[CSAudioProviderRequestLock init](&v9, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = objc_claimAutoreleasedReturnValue();
    UUIDString = v4->_UUIDString;
    v4->_UUIDString = (NSString *)v6;

    v4->_clientIdentity = a3;
  }
  return v4;
}

- (NSString)UUIDString
{
  return self->_UUIDString;
}

- (unint64_t)clientIdentity
{
  return self->_clientIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUIDString, 0);
}

@end
