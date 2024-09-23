@implementation CKNSExtension

- (void)dealloc
{
  objc_super v3;

  -[CKNSExtension endMatchingExtensions](self, "endMatchingExtensions");
  v3.receiver = self;
  v3.super_class = (Class)CKNSExtension;
  -[CKNSExtension dealloc](&v3, sel_dealloc);
}

- (void)beginMatchingExtensions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id beginMappingID;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!self->_beginMappingID)
  {
    v11 = *MEMORY[0x24BDD0C48];
    v12[0] = *MEMORY[0x24BDD8FE0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDD1550];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __41__CKNSExtension_beginMatchingExtensions___block_invoke;
    v9[3] = &unk_24D076360;
    v10 = v4;
    objc_msgSend(v6, "beginMatchingExtensionsWithAttributes:completion:", v5, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    beginMappingID = self->_beginMappingID;
    self->_beginMappingID = v7;

  }
}

void __41__CKNSExtension_beginMatchingExtensions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__CKNSExtension_beginMatchingExtensions___block_invoke_2;
  block[3] = &unk_24D0752B8;
  v10 = v6;
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __41__CKNSExtension_beginMatchingExtensions___block_invoke_2(_QWORD *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  _QWORD *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (!a1[4])
  {
    v3 = (void *)a1[5];
    if (v3)
    {
      v4 = objc_msgSend(v3, "count");
      v5 = (void *)a1[5];
      if (v4)
      {
        v17 = a1;
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v6 = v5;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v19 != v9)
                objc_enumerationMutation(v6);
              objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "_plugIn");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "localizedContainingName");
              v12 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v2, "objectForKey:", v12);
              v13 = (void *)objc_claimAutoreleasedReturnValue();

              if (v13)
              {
                objc_msgSend(v2, "objectForKeyedSubscript:", v12);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v14, "intValue");

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (v15 + 1));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v2, "setObject:forKeyedSubscript:", v16, v12);

              }
              else
              {
                objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_24D094220, v12);
              }

            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          }
          while (v8);
        }

        a1 = v17;
      }
    }
    (*(void (**)(void))(a1[6] + 16))();
  }

}

- (void)endMatchingExtensions
{
  id beginMappingID;

  if (self->_beginMappingID)
  {
    objc_msgSend(MEMORY[0x24BDD1550], "endMatchingExtensions:");
    beginMappingID = self->_beginMappingID;
    self->_beginMappingID = 0;

  }
}

- (id)beginMappingID
{
  return self->_beginMappingID;
}

- (void)setBeginMappingID:(id)a3
{
  objc_storeStrong(&self->_beginMappingID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_beginMappingID, 0);
}

@end
