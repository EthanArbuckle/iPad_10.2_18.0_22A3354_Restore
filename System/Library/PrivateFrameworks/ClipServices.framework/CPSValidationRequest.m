@implementation CPSValidationRequest

- (CPSValidationRequest)initWithURLs:(id)a3 bundleIDs:(id)a4
{
  id v7;
  id v8;
  CPSValidationRequest *v9;
  CPSValidationRequest *v10;
  CPSValidationRequest *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CPSValidationRequest;
  v9 = -[CPSValidationRequest init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_urls, a3);
    objc_storeStrong((id *)&v10->_bundleIdentifiers, a4);
    v11 = v10;
  }

  return v10;
}

- (CPSValidationRequest)initWithValidation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CPSValidationRequest *v7;

  v4 = a3;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CPSValidationRequest initWithURLs:bundleIDs:](self, "initWithURLs:bundleIDs:", v5, v6);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CPSValidationRequest *v4;
  CPSValidationRequest *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (CPSValidationRequest *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[CPSValidationRequest urls](self, "urls");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPSValidationRequest urls](v5, "urls");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToArray:", v7);

      if (v8)
      {
        -[CPSValidationRequest bundleIdentifiers](self, "bundleIdentifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[CPSValidationRequest bundleIdentifiers](v5, "bundleIdentifiers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToArray:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (void)validateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  +[CPSDaemonConnection sharedConnection](CPSDaemonConnection, "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__CPSValidationRequest_validateWithCompletion___block_invoke;
  v7[3] = &unk_24C3BA0F8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performValidationWithRequest:completion:", self, v7);

}

uint64_t __47__CPSValidationRequest_validateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSValidationRequest)initWithCoder:(id)a3
{
  id v4;
  CPSValidationRequest *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *urls;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSArray *bundleIdentifiers;
  CPSValidationRequest *v16;
  objc_super v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CPSValidationRequest;
  v5 = -[CPSValidationRequest init](&v18, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("URLs"));
    v9 = objc_claimAutoreleasedReturnValue();
    urls = v5->_urls;
    v5->_urls = (NSArray *)v9;

    v11 = (void *)MEMORY[0x24BDBCF20];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("bundleIdentifiers"));
    v14 = objc_claimAutoreleasedReturnValue();
    bundleIdentifiers = v5->_bundleIdentifiers;
    v5->_bundleIdentifiers = (NSArray *)v14;

    v16 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *urls;
  id v5;

  urls = self->_urls;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", urls, CFSTR("URLs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifiers, CFSTR("bundleIdentifiers"));

}

- (NSArray)urls
{
  return self->_urls;
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_urls, 0);
}

@end
