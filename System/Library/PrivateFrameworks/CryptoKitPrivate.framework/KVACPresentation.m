@implementation KVACPresentation

- (KVACPresentation)initWithCredential:(id)a3 tagPrefix:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  KVACPresentation *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSData *serverKeyId;
  uint64_t v15;
  NSData *tag;
  uint64_t v17;
  NSData *prefix;
  uint64_t v19;
  NSData *presentationData;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)KVACPresentation;
  v10 = -[KVACPresentation init](&v22, sel_init);
  if (v10)
  {
    objc_msgSend(v8, "credential");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "makePresentationWithTagPrefix:error:", v9, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v12, "serverKeyId");
      v13 = objc_claimAutoreleasedReturnValue();
      serverKeyId = v10->_serverKeyId;
      v10->_serverKeyId = (NSData *)v13;

      objc_msgSend(v12, "tag");
      v15 = objc_claimAutoreleasedReturnValue();
      tag = v10->_tag;
      v10->_tag = (NSData *)v15;

      objc_msgSend(v12, "prefix");
      v17 = objc_claimAutoreleasedReturnValue();
      prefix = v10->_prefix;
      v10->_prefix = (NSData *)v17;

      objc_msgSend(v12, "presentationData");
      v19 = objc_claimAutoreleasedReturnValue();
      presentationData = v10->_presentationData;
      v10->_presentationData = (NSData *)v19;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.cryptokit.KVAC.error"), 3, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v10;
}

- (NSData)serverKeyId
{
  return self->_serverKeyId;
}

- (NSData)tag
{
  return self->_tag;
}

- (NSData)prefix
{
  return self->_prefix;
}

- (NSData)presentationData
{
  return self->_presentationData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationData, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_serverKeyId, 0);
}

@end
