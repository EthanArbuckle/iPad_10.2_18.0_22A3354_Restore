@implementation HSRequest

- (HSRequest)initWithAction:(id)a3
{
  id v4;
  HSRequest *v5;
  uint64_t v6;
  NSString *action;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HSRequest;
  v5 = -[HSRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    action = v5->_action;
    v5->_action = (NSString *)v6;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HSRequest;
  -[HSRequest description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = CFSTR("GET");
  if (self->_method == 1)
    v5 = CFSTR("POST");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@ [%@]"), v5, self->_action);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)timeoutInterval
{
  return 60.0;
}

- (void)setValue:(id)a3 forArgument:(id)a4
{
  id v6;
  NSDictionary *arguments;
  NSDictionary *v8;
  NSDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  arguments = self->_arguments;
  if (!arguments)
  {
    v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v9 = self->_arguments;
    self->_arguments = v8;

    arguments = self->_arguments;
  }
  -[NSDictionary setObject:forKey:](arguments, "setObject:forKey:", v10, v6);

}

- (id)requestURLForBaseURL:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  NSDictionary *arguments;
  void *v9;
  void *v10;
  NSDictionary *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)-[NSString mutableCopy](self->_action, "mutableCopy");
  if ((_DWORD)v4)
  {
    arguments = self->_arguments;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setValue:forKey:](arguments, "setValue:forKey:", v9, CFSTR("session-id"));

  }
  if (-[NSDictionary count](self->_arguments, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self->_arguments;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __44__HSRequest_requestURLForBaseURL_sessionID___block_invoke;
    v16[3] = &unk_24C364468;
    v17 = v10;
    v12 = v10;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v11, "enumerateKeysAndObjectsUsingBlock:", v16);
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR("&"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendString:", CFSTR("?"));
    objc_msgSend(v7, "appendString:", v13);

  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:relativeToURL:", v7, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)URLRequestForBaseURL:(id)a3 sessionID:(unsigned int)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  -[HSRequest requestURLForBaseURL:sessionID:](self, "requestURLForBaseURL:sessionID:", a3, *(_QWORD *)&a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD16B0];
  -[HSRequest timeoutInterval](self, "timeoutInterval");
  objc_msgSend(v6, "requestWithURL:cachePolicy:timeoutInterval:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self->_method == 1)
    v9 = CFSTR("POST");
  else
    v9 = CFSTR("GET");
  objc_msgSend(v7, "setHTTPMethod:", v9);
  if (-[HSRequest acceptsGzipEncoding](self, "acceptsGzipEncoding"))
    objc_msgSend(v8, "setValue:forHTTPHeaderField:", CFSTR("gzip"), CFSTR("Accept-Encoding"));
  if (-[NSData length](self->_bodyData, "length"))
    objc_msgSend(v8, "setHTTPBody:", self->_bodyData);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d.%d"), 3, 16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forHTTPHeaderField:", v10, CFSTR("Client-iTunes-Sharing-Version"));

  return v8;
}

- (id)canonicalResponseForResponse:(id)a3
{
  return a3;
}

- (BOOL)acceptsGzipEncoding
{
  return 1;
}

- (NSString)action
{
  return self->_action;
}

- (BOOL)isConcurrent
{
  return self->_concurrent;
}

- (int64_t)method
{
  return self->_method;
}

- (void)setMethod:(int64_t)a3
{
  self->_method = a3;
}

- (NSData)bodyData
{
  return self->_bodyData;
}

- (void)setBodyData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_arguments, 0);
}

void __44__HSRequest_requestURLForBaseURL_sessionID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@=%@"), a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

+ (id)request
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("subclass must implement"));
  return objc_alloc_init((Class)objc_opt_class());
}

@end
