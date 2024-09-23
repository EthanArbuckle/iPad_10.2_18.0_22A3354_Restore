@implementation RepairToolURLFactory

- (RepairToolURLFactory)initWithRequestItems:(id)a3
{
  id v5;
  RepairToolURLFactory *v6;
  RepairToolURLFactory *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RepairToolURLFactory;
  v6 = -[RepairToolURLFactory init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_requestItems, a3);
    v7->_currentIndex = 0;
  }

  return v7;
}

- (id)urlRequest
{
  void *v3;
  unint64_t v4;
  int v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[RepairToolURLFactory requestItems](self, "requestItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = -[RepairToolURLFactory currentIndex](self, "currentIndex");

  if (v4 < v5)
    return 0;
  -[RepairToolURLFactory requestItems](self, "requestItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", -[RepairToolURLFactory currentIndex](self, "currentIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v8, "destination");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLWithString:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  v23 = (void *)v11;
  objc_msgSend(MEMORY[0x24BDD16B0], "requestWithURL:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHTTPMethod:", CFSTR("POST"));
  objc_msgSend(v8, "token");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forHTTPHeaderField:", v13, CFSTR("X-Apple-File-Upload-Token"));

  objc_msgSend(v8, "encryptionKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setValue:forHTTPHeaderField:", v14, CFSTR("X-Apple-Encrypted-key"));

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v8, "extraHeaders");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v19);
        objc_msgSend(v8, "extraHeaders");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setValue:forHTTPHeaderField:", v22, v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v17);
  }

  -[RepairToolURLFactory setCurrentIndex:](self, "setCurrentIndex:", -[RepairToolURLFactory currentIndex](self, "currentIndex") + 1);
  return v12;
}

- (NSString)encryptionKey
{
  return self->_encryptionKey;
}

- (void)setEncryptionKey:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionKey, a3);
}

- (NSArray)requestItems
{
  return self->_requestItems;
}

- (void)setRequestItems:(id)a3
{
  objc_storeStrong((id *)&self->_requestItems, a3);
}

- (int)currentIndex
{
  return self->_currentIndex;
}

- (void)setCurrentIndex:(int)a3
{
  self->_currentIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestItems, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
}

@end
