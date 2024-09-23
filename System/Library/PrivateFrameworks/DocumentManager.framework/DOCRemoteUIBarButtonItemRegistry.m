@implementation DOCRemoteUIBarButtonItemRegistry

+ (id)shared
{
  if (shared_onceToken_0 != -1)
    dispatch_once(&shared_onceToken_0, &__block_literal_global_5);
  return (id)shared_sharedInstance;
}

void __42__DOCRemoteUIBarButtonItemRegistry_shared__block_invoke()
{
  DOCRemoteUIBarButtonItemRegistry *v0;
  void *v1;

  v0 = objc_alloc_init(DOCRemoteUIBarButtonItemRegistry);
  v1 = (void *)shared_sharedInstance;
  shared_sharedInstance = (uint64_t)v0;

}

- (DOCRemoteUIBarButtonItemRegistry)init
{
  DOCRemoteUIBarButtonItemRegistry *v2;
  uint64_t v3;
  NSMutableDictionary *instancesByUUID;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCRemoteUIBarButtonItemRegistry;
  v2 = -[DOCRemoteUIBarButtonItemRegistry init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    instancesByUUID = v2->_instancesByUUID;
    v2->_instancesByUUID = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)registerInstance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "uuid");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_instancesByUUID, "objectForKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(v8, "addPointer:", v4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_instancesByUUID, "setObject:forKeyedSubscript:", v8, v9);

}

- (id)barButtonItemPresentedInNavigationBar:(id)a3 uuid:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_instancesByUUID, "objectForKeyedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v7;
    v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v12, "_doc_ipi_view", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v13, "isDescendantOfView:", v6) & 1) != 0)
          {
            v9 = v12;

            goto LABEL_12;
          }

        }
        v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instancesByUUID, 0);
}

@end
