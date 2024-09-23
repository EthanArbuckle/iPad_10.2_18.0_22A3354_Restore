@implementation KMAppGlobalVocabularyBridge

- (KMAppGlobalVocabularyBridge)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (KMAppGlobalVocabularyBridge)initWithOriginAppId:(id)a3 cascadeItemType:(unsigned __int16)a4 items:(id)a5
{
  id v9;
  id v10;
  KMAppGlobalVocabularyBridge *v11;
  KMAppGlobalVocabularyBridge *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)KMAppGlobalVocabularyBridge;
  v11 = -[KMAppGlobalVocabularyBridge init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_appId, a3);
    v12->_cascadeItemType = a4;
    objc_storeStrong((id *)&v12->_items, a5);
  }

  return v12;
}

- (unsigned)cascadeItemType
{
  return self->_cascadeItemType;
}

- (id)originAppId
{
  return self->_appId;
}

- (BOOL)enumerateItemsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t (**v5)(id, _QWORD);
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = (uint64_t (**)(id, _QWORD))a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_items;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x219A1AD04](v7);
        LODWORD(v11) = v5[2](v5, v11);
        objc_autoreleasePoolPop(v12);
        if (!(_DWORD)v11)
        {
          v13 = 0;
          goto LABEL_11;
        }
        ++v10;
      }
      while (v8 != v10);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v8 = v7;
      if (v7)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_11:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_appId, 0);
}

@end
