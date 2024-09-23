@implementation ATHostNetService

- (ATHostNetService)initWithNetService:(id)a3
{
  id v5;
  ATHostNetService *v6;
  ATHostNetService *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSString *libraryIdentifier;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ATHostNetService;
  v6 = -[ATHostNetService init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_netService, a3);
    objc_msgSend(v5, "TXTRecordData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37B0], "dictionaryFromTXTRecordData:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v10 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", "libid", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v11);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "stringWithCString:encoding:", objc_msgSend(v12, "bytes"), 4);
    v13 = objc_claimAutoreleasedReturnValue();
    libraryIdentifier = v7->_libraryIdentifier;
    v7->_libraryIdentifier = (NSString *)v13;

  }
  return v7;
}

- (NSNetService)netService
{
  return self->_netService;
}

- (NSString)libraryIdentifier
{
  return self->_libraryIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryIdentifier, 0);
  objc_storeStrong((id *)&self->_netService, 0);
}

@end
