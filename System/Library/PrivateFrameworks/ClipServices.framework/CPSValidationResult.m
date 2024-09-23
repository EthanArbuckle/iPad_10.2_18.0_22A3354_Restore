@implementation CPSValidationResult

- (CPSValidationResult)initWithRequest:(id)a3 response:(id)a4
{
  id v7;
  id v8;
  CPSValidationResult *v9;
  CPSValidationResult *v10;
  CPSValidationResult *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CPSValidationResult;
  v9 = -[CPSValidationResult init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_response, a4);
    v11 = v10;
  }

  return v10;
}

- (id)validBundleIDForURL:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_response, "objectForKeyedSubscript:", a3);
}

- (NSDictionary)availabilities
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CPSValidationRequest urls](self->_request, "urls", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[CPSValidationResult validBundleIDForURL:](self, "validBundleIDForURL:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 != 0;

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return (NSDictionary *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPSValidationResult)initWithCoder:(id)a3
{
  id v4;
  CPSValidationResult *v5;
  uint64_t v6;
  CPSValidationRequest *request;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *response;
  CPSValidationResult *v13;
  objc_super v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CPSValidationResult;
  v5 = -[CPSValidationResult init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("request"));
    v6 = objc_claimAutoreleasedReturnValue();
    request = v5->_request;
    v5->_request = (CPSValidationRequest *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v16[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("response"));
    v11 = objc_claimAutoreleasedReturnValue();
    response = v5->_response;
    v5->_response = (NSDictionary *)v11;

    v13 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  CPSValidationRequest *request;
  id v5;

  request = self->_request;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", request, CFSTR("request"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_response, CFSTR("response"));

}

- (CPSValidationRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

@end
