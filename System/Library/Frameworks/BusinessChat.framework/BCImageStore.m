@implementation BCImageStore

- (BCImageStore)initWithData:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  BCImageStore *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BCImageStore *v13;
  BCImageStore *v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  LogCategory_Daemon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v7;
    _os_log_impl(&dword_21C655000, v6, OS_LOG_TYPE_DEFAULT, "BCImageStore: initWithData %@", buf, 0xCu);

  }
  v16.receiver = self;
  v16.super_class = (Class)BCImageStore;
  v8 = -[BCImageStore init](&v16, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v5, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("images"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCImageStore setRawArray:](v8, "setRawArray:", v10);
    -[BCImageStore generateImageDictionaryFromArray:](v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCImageStore setDictionary:](v8, "setDictionary:", v11);

    objc_storeStrong((id *)&v8->_data, a3);
  }
  -[BCImageStore dictionary](v8, "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = v8;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

- (id)generateImageDictionaryFromArray:(void *)a1
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  const __CFString *v14;
  const __CFString *v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  BCImage *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v27;
  void *v28;
  uint64_t v29;
  id obj;
  uint8_t buf[16];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (v1)
  {
    v27 = v1;
    v28 = (void *)objc_opt_new();
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = v1;
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v3)
    {
      v4 = v3;
      v5 = CFSTR("data");
      v6 = CFSTR("identifier");
      v7 = *(_QWORD *)v33;
      do
      {
        v8 = 0;
        v29 = v4;
        do
        {
          if (*(_QWORD *)v33 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v8);
          objc_msgSend(v9, "objectForKeyedSubscript:", v5, v27);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            v12 = v10 == 0;
          else
            v12 = 1;
          if (v12)
          {
            LogCategory_Daemon();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_error_impl(&dword_21C655000, v13, OS_LOG_TYPE_ERROR, "BCImageStore: image is missing data or identifier", buf, 2u);
            }
          }
          else
          {
            v14 = v6;
            v15 = v5;
            v16 = objc_alloc(MEMORY[0x24BDBCE50]);
            v17 = v10;
            v18 = objc_msgSend(v17, "length");
            if ((v18 & 0xFFFFFFFFFFFFFFFCLL) == 0xFFFFFFFFFFFFFFFCLL)
            {
              v19 = v17;
            }
            else
            {
              objc_msgSend(v17, "stringByPaddingToLength:withString:startingAtIndex:", (v18 & 0xFFFFFFFFFFFFFFFCLL) + 4, CFSTR("="), 0);
              v19 = (id)objc_claimAutoreleasedReturnValue();
            }
            v20 = v19;

            v13 = objc_msgSend(v16, "initWithBase64EncodedString:options:", v20, 0);
            if (v13)
            {
              v21 = [BCImage alloc];
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("description"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = -[BCImage initWithImageData:identifier:description:](v21, "initWithImageData:identifier:description:", v13, v11, v22);

              objc_msgSend(v28, "setObject:forKeyedSubscript:", v23, v11);
            }
            else
            {
              LogCategory_Daemon();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_21C655000, v23, OS_LOG_TYPE_ERROR, "BCImageStore: image data cannot be decoded", buf, 2u);
              }
            }
            v5 = v15;
            v6 = v14;
            v4 = v29;

          }
          ++v8;
        }
        while (v4 != v8);
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v4);
    }

    objc_msgSend(v28, "allKeys");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "count"))
      v25 = v28;
    else
      v25 = 0;
    v2 = v25;

    v1 = v27;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (BCImageStore)initWithArray:(id)a3
{
  id v4;
  NSObject *v5;
  BCImageStore *v6;
  BCImageStore *v7;
  void *v8;
  NSData *data;
  void *v10;
  BCImageStore *v11;
  BCImageStore *v12;
  objc_super v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v4;
    _os_log_impl(&dword_21C655000, v5, OS_LOG_TYPE_DEFAULT, "BCImageStore: initWithArray %@", buf, 0xCu);
  }

  v14.receiver = self;
  v14.super_class = (Class)BCImageStore;
  v6 = -[BCImageStore init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    -[BCImageStore setRawArray:](v6, "setRawArray:", v4);
    -[BCImageStore generateImageDictionaryFromArray:](v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCImageStore setDictionary:](v7, "setDictionary:", v8);

    data = v7->_data;
    v7->_data = 0;

  }
  -[BCImageStore dictionary](v7, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    v11 = v7;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (BCImageStore)initWithImages:(id)a3
{
  id v4;
  NSObject *v5;
  BCImageStore *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSData *data;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v4;
    _os_log_impl(&dword_21C655000, v5, OS_LOG_TYPE_DEFAULT, "BCImageStore: initWithImages %@", buf, 0xCu);
  }

  v21.receiver = self;
  v21.super_class = (Class)BCImageStore;
  v6 = -[BCImageStore init](&v21, sel_init);
  if (v6)
  {
    v7 = (void *)objc_opt_new();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v13, "identifier", (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v13, v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v10);
    }

    -[BCImageStore setDictionary:](v6, "setDictionary:", v7);
    -[BCImageStore setRawArray:](v6, "setRawArray:", 0);
    data = v6->_data;
    v6->_data = 0;

  }
  return v6;
}

- (NSArray)rawArray
{
  return self->_rawArray;
}

- (void)setRawArray:(id)a3
{
  objc_storeStrong((id *)&self->_rawArray, a3);
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_dictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_rawArray, 0);
}

@end
