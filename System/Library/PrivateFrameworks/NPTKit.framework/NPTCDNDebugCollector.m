@implementation NPTCDNDebugCollector

- (void)startCollectingWithCompletion:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  NPTCDNDebugCollector *v20;
  id v21;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NPTCDNDebugCollector setCachedMetadata:](self, "setCachedMetadata:", v6);

  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[NPTCDNDebugCollector cachedMetadata](self, "cachedMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("initial_state"));

  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[NPTCDNDebugCollector cachedMetadata](self, "cachedMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("events"));

  objc_msgSend(MEMORY[0x24BDB74B8], "ephemeralSessionConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimeoutIntervalForRequest:", 2.0);
  objc_msgSend(v11, "setTimeoutIntervalForResource:", 2.0);
  objc_msgSend(MEMORY[0x24BDB74B0], "sessionWithConfiguration:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTCDNDebugCollector setSession:](self, "setSession:", v12);

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("http://504sfaa.map.apple-dns.net/json"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPTCDNDebugCollector session](self, "session");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __54__NPTCDNDebugCollector_startCollectingWithCompletion___block_invoke;
  v18[3] = &unk_24C991600;
  v19 = v5;
  v20 = self;
  v21 = v4;
  v15 = v4;
  v16 = v5;
  objc_msgSend(v14, "dataTaskWithURL:completionHandler:", v13, v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "resume");
}

void __54__NPTCDNDebugCollector_startCollectingWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (v7)
  {
    objc_msgSend(v7, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v9, CFSTR("Error"));
  }
  else
  {
    if (!v6)
      goto LABEL_6;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addEntriesFromDictionary:", v9);
  }

LABEL_6:
  v27 = v7;
  v28 = v6;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v10, "valueForKey:", v15, v27);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = *(void **)(a1 + 32);
          objc_msgSend(CFSTR("cdn_debug_"), "stringByAppendingString:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "lowercaseString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKey:", v16, v19);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v12);
  }

  v20 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cachedMetadata");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, CFSTR("initial_state"));

  v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v23 = v22;
  if (v27)
    objc_msgSend(v22, "addObject:", v27);
  v24 = *(_QWORD *)(a1 + 48);
  if (v24)
  {
    v25 = *(_QWORD *)(a1 + 32);
    v26 = (void *)objc_msgSend(v23, "copy");
    (*(void (**)(uint64_t, uint64_t, void *))(v24 + 16))(v24, v25, v26);

  }
}

- (void)stopCollecting
{
  id v2;

  -[NPTCDNDebugCollector session](self, "session");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateAndCancel");

}

+ (id)collectorName
{
  return CFSTR("cdn_debug");
}

- (id)metadataDidChangeHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setMetadataDidChangeHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSMutableDictionary)cachedMetadata
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCachedMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSURLSession)session
{
  return (NSURLSession *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->cachedMetadata, 0);
  objc_storeStrong(&self->metadataDidChangeHandler, 0);
}

@end
