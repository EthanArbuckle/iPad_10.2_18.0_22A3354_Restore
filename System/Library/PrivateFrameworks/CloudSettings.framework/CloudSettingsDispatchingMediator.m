@implementation CloudSettingsDispatchingMediator

- (CloudSettingsDispatchingMediator)init
{
  CloudSettingsDispatchingMediator *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CloudSettingsDispatchingMediator;
  v2 = -[CloudSettingsDispatchingMediator init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[CloudSettingsDispatchingMediator setKeysMap:](v2, "setKeysMap:", v3);

    -[CloudSettingsDispatchingMediator setDispatchSettersOnMain:](v2, "setDispatchSettersOnMain:", 1);
    -[CloudSettingsDispatchingMediator registerKeys](v2, "registerKeys");
  }
  return v2;
}

- (void)registerKeys
{
  uint8_t v2[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "NO OVERRIDE FOUND FOR registerKeys, YOU MUST OVERIDE registerKeys in your subclass of CloudSettingsDispatchingMediator", v2, 2u);
  }
}

- (void)registerKey:(id)a3 getter:(SEL)a4 setter:(SEL)a5
{
  -[CloudSettingsDispatchingMediator registerKey:getter:setter:merger:type:](self, "registerKey:getter:setter:merger:type:", a3, a4, a5, 0, 0);
}

- (void)registerKey:(id)a3 getter:(SEL)a4 setter:(SEL)a5 merger:(SEL)a6 type:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a7;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v12;
    _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "registerKey: %@", buf, 0xCu);
  }
  NSStringFromSelector(a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6)
  {
    NSStringFromSelector(a6);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = &stru_24C86F7F8;
  }
  v19[0] = v14;
  v19[1] = v15;
  v19[2] = v16;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CloudSettingsDispatchingMediator keysMap](self, "keysMap");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v12);

}

- (id)deviceSettingsForKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSString *v16;
  SEL v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  if (!v4)
  {
    -[CloudSettingsDispatchingMediator keysMap](self, "keysMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allKeys");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v22;
    *(_QWORD *)&v9 = 138412290;
    v20 = v9;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v12);
        -[CloudSettingsDispatchingMediator keysMap](self, "keysMap", v20, (_QWORD)v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
          v16 = (NSString *)objc_claimAutoreleasedReturnValue();
          v17 = NSSelectorFromString(v16);

          ((void (*)(CloudSettingsDispatchingMediator *, SEL))-[CloudSettingsDispatchingMediator methodForSelector:](self, "methodForSelector:", v17))(self, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, v13);

        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v20;
          v26 = v13;
          _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ERROR | deviceSettingsForKeys - unknown key: %@", buf, 0xCu);
        }

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v10);
  }

  return v5;
}

- (id)mergeSettings:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSString *v12;
  SEL v13;
  void (*v14)(_QWORD, _QWORD, _QWORD);
  NSString *v15;
  SEL v16;
  void (*v17)(_QWORD, _QWORD, _QWORD);
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  BOOL v24;
  void *v25;
  __int128 v27;
  void *v28;
  id obj;
  void *v30;
  _QWORD block[5];
  id v32;
  uint64_t v33;
  __int128 *p_buf;
  void (*v35)(_QWORD, _QWORD, _QWORD);
  SEL v36;
  _QWORD v37[5];
  id v38;
  uint64_t v39;
  void (*v40)(_QWORD, _QWORD, _QWORD);
  SEL v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 buf;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v28 = (void *)objc_opt_new();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v30 = v4;
  objc_msgSend(v4, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v5)
  {
    v7 = *(_QWORD *)v43;
    *(_QWORD *)&v6 = 138412290;
    v27 = v6;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v43 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v8);
        -[CloudSettingsDispatchingMediator keysMap](self, "keysMap", v27);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", 2);
          v12 = (NSString *)objc_claimAutoreleasedReturnValue();
          if (-[NSString length](v12, "length"))
          {
            v13 = NSSelectorFromString(v12);
            v14 = (void (*)(_QWORD, _QWORD, _QWORD))-[CloudSettingsDispatchingMediator methodForSelector:](self, "methodForSelector:", v13);
            *(_QWORD *)&buf = 0;
            *((_QWORD *)&buf + 1) = &buf;
            v47 = 0x3032000000;
            v48 = __Block_byref_object_copy_;
            v49 = __Block_byref_object_dispose_;
            v50 = 0;
            if (-[CloudSettingsDispatchingMediator dispatchSettersOnMain](self, "dispatchSettersOnMain"))
            {
              block[0] = MEMORY[0x24BDAC760];
              block[1] = 3221225472;
              block[2] = __50__CloudSettingsDispatchingMediator_mergeSettings___block_invoke_3;
              block[3] = &unk_24C86F4B8;
              p_buf = &buf;
              v35 = v14;
              block[4] = self;
              v36 = v13;
              v32 = v30;
              v33 = v9;
              dispatch_sync(MEMORY[0x24BDAC9B8], block);

            }
            else
            {
              objc_msgSend(v30, "objectForKeyedSubscript:", v9);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v14(self, v13, v18);
              v19 = objc_claimAutoreleasedReturnValue();
              v20 = *(void **)(*((_QWORD *)&buf + 1) + 40);
              *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v19;

            }
            v21 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
            if (v21)
              objc_msgSend(v28, "setObject:forKeyedSubscript:", v21, v9);
            _Block_object_dispose(&buf, 8);

          }
          else
          {
            objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
            v15 = (NSString *)objc_claimAutoreleasedReturnValue();
            v16 = NSSelectorFromString(v15);

            v17 = (void (*)(_QWORD, _QWORD, _QWORD))-[CloudSettingsDispatchingMediator methodForSelector:](self, "methodForSelector:", v16);
            if (-[CloudSettingsDispatchingMediator dispatchSettersOnMain](self, "dispatchSettersOnMain"))
            {
              v37[0] = MEMORY[0x24BDAC760];
              v37[1] = 3221225472;
              v37[2] = __50__CloudSettingsDispatchingMediator_mergeSettings___block_invoke;
              v37[3] = &unk_24C86F490;
              v40 = v17;
              v41 = v16;
              v37[4] = self;
              v38 = v30;
              v39 = v9;
              dispatch_sync(MEMORY[0x24BDAC9B8], v37);

            }
            else
            {
              objc_msgSend(v30, "objectForKeyedSubscript:", v9);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v17(self, v16, v22);

            }
          }

        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = v27;
          *(_QWORD *)((char *)&buf + 4) = v9;
          _os_log_impl(&dword_20DD2C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ERROR | applySettings - unknown key: %@", (uint8_t *)&buf, 0xCu);
        }

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    }
    while (v5);
  }

  objc_msgSend(v28, "allKeys");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count") == 0;

  if (v24)
  {
    v25 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v28);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

void __50__CloudSettingsDispatchingMediator_mergeSettings___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t, id);
  uint64_t v3;
  id v4;

  v2 = *(void (**)(uint64_t, uint64_t, id))(a1 + 56);
  v1 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2(v3, v1, v4);

}

void __50__CloudSettingsDispatchingMediator_mergeSettings___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, id);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(void (**)(uint64_t, uint64_t, id))(a1 + 64);
  v2 = *(_QWORD *)(a1 + 72);
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3(v4, v2, v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (BOOL)dispatchSettersOnMain
{
  return self->_dispatchSettersOnMain;
}

- (void)setDispatchSettersOnMain:(BOOL)a3
{
  self->_dispatchSettersOnMain = a3;
}

- (NSMutableDictionary)keysMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setKeysMap:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysMap, 0);
}

@end
