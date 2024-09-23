@implementation BCMessageData

- (BCMessageData)initWithUrl:(id)a3 data:(id)a4
{
  id v5;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  BCMessageData *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  uint8_t v34[128];
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v5 = a3;
  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  LogCategory_Daemon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v36 = v10;
    v37 = 2112;
    v38 = v11;
    _os_log_impl(&dword_21C655000, v9, OS_LOG_TYPE_DEFAULT, "BCMessageData: initWithUrl: %@ data: %@", buf, 0x16u);

  }
  v33.receiver = self;
  v33.super_class = (Class)BCMessageData;
  v12 = -[BCMessageData init](&v33, sel_init);
  if (v12)
  {
    if (v7)
    {
      v25 = v8;
      v26 = v5;
      v27 = a4;
      v28 = v7;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v7, 0);
      objc_msgSend(v24, "queryItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v30 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_msgSend(v18, "value");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSString normalizedBase64Encoded](v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBase64EncodedString:options:", v20, 0);
            objc_msgSend(v18, "name");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[BCMessageData decodeData:dictionaryKey:](v12, v21, v22);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        }
        while (v15);
      }

      a4 = v27;
      v7 = v28;
      v8 = v25;
      v5 = v26;
    }
    if (v8)
      -[BCMessageData decodeData:dictionaryKey:](v12, v8, CFSTR("data"));
    objc_storeStrong((id *)&v12->_url, v5);
    objc_storeStrong((id *)&v12->_data, a4);
  }

  return v12;
}

- (void)decodeData:(void *)a3 dictionaryKey:
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  LogCategory_Daemon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = v6;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_21C655000, v7, OS_LOG_TYPE_DEFAULT, "BCMessageData: decodeDataKey %@ %@", buf, 0x16u);
  }

  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v5, 4, &v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v14;
  if (v9)
  {
    LogCategory_Daemon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v9;
      _os_log_error_impl(&dword_21C655000, v10, OS_LOG_TYPE_ERROR, "BCMessageData: error serializing JSON for key %@, error: %@", buf, 0x16u);
    }
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("replyMessage")))
  {
    v11 = v8;
    v10 = a1[4];
    a1[4] = v11;
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("receivedMessage")))
  {
    v12 = v8;
    v10 = a1[5];
    a1[5] = v12;
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("data")))
  {
    v13 = v8;
    v10 = a1[3];
    a1[3] = v13;
  }
  else
  {
    LogCategory_Daemon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_21C655000, v10, OS_LOG_TYPE_DEFAULT, "BCMessageData: unrecognized key in the url %@", buf, 0xCu);
    }
  }

}

- (NSDictionary)combinedDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[BCMessageData jsonDictionary](self, "jsonDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[BCMessageData replyMessageDictionary](self, "replyMessageDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[BCMessageData replyMessageDictionary](self, "replyMessageDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("replyMessage"));

  }
  -[BCMessageData receivedMessageDictionary](self, "receivedMessageDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[BCMessageData receivedMessageDictionary](self, "receivedMessageDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("receivedMessage"));

  }
  return (NSDictionary *)v4;
}

- (NSArray)imagesArray
{
  void *v2;
  void *v3;

  -[BCMessageData jsonDictionary](self, "jsonDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("images"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSURL)url
{
  return self->_url;
}

- (NSData)data
{
  return self->_data;
}

- (NSDictionary)jsonDictionary
{
  return self->_jsonDictionary;
}

- (NSDictionary)replyMessageDictionary
{
  return self->_replyMessageDictionary;
}

- (NSDictionary)receivedMessageDictionary
{
  return self->_receivedMessageDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivedMessageDictionary, 0);
  objc_storeStrong((id *)&self->_replyMessageDictionary, 0);
  objc_storeStrong((id *)&self->_jsonDictionary, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
