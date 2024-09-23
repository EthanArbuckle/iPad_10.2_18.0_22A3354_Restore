@implementation BCNativeOAuth2Response

- (BCNativeOAuth2Response)initWithToken:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  BCNativeOAuth2Response *v9;
  BCNativeOAuth2Response *v10;
  BOOL v11;
  uint64_t v12;
  BCError *v13;
  void *v14;
  void *v15;
  void *v16;
  BCError *v17;
  uint64_t v18;
  NSArray *errors;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)BCNativeOAuth2Response;
  v9 = -[BCNativeOAuth2Response init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_token, a3);
    if (v8)
      v11 = 1;
    else
      v11 = v7 == 0;
    v12 = 1;
    if (v11)
      v12 = 2;
    v10->_status = v12;
    if (v8)
    {
      v13 = [BCError alloc];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "code"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "domain");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[BCError initWithCode:domain:message:](v13, "initWithCode:domain:message:", v14, v15, v16);

      v22[0] = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
      v18 = objc_claimAutoreleasedReturnValue();
      errors = v10->_errors;
      v10->_errors = (NSArray *)v18;

    }
  }

  return v10;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *errors;
  void *v7;
  NSArray *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = v3;
  if (self)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_token, CFSTR("token"));
    NSStringFromNativeAuthStatus(-[BCNativeOAuth2Response status](self, "status"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("status"));

    errors = self->_errors;
  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", 0, CFSTR("token"));
    NSStringFromNativeAuthStatus(objc_msgSend(0, "status"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("status"));

    errors = 0;
  }
  if (-[NSArray count](errors, "count"))
  {
    v7 = (void *)objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    if (self)
      v8 = self->_errors;
    else
      v8 = 0;
    v9 = v8;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "dictionaryValue", (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("errors"));
  }
  return (NSDictionary *)v4;
}

- (BCError)error
{
  if (self)
    self = (BCNativeOAuth2Response *)self->_errors;
  return (BCError *)-[BCNativeOAuth2Response firstObject](self, "firstObject");
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errors, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
