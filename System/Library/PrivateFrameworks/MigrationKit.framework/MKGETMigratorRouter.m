@implementation MKGETMigratorRouter

- (void)server:(id)a3 didReceiveRequest:(id)a4 response:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id obj;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  v24 = a4;
  v23 = a5;
  v27 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = objc_loadWeakRetained((id *)&self->_migrators);
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v30;
    do
    {
      v13 = 0;
      v14 = v11;
      do
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v13);
        -[MKGETMigratorRouter keyFromMigratorType:](self, "keyFromMigratorType:", objc_msgSend(v15, "type", v23, v24, v25));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v33[0] = CFSTR("import_count");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v15, "importCount"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v33[1] = CFSTR("import_error_count");
          v34[0] = v16;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v15, "importErrorCount"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v34[1] = v17;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
          v18 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v27, "setObject:forKey:", v18, v11);
          v10 = (void *)v18;
        }
        ++v13;
        v14 = v11;
      }
      while (v9 != v13);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
    v11 = 0;
  }

  v28 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v27, 0, &v28);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v28;
  if (v20)
  {
    +[MKLog log](MKLog, "log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[MKGETMigratorRouter server:didReceiveRequest:response:].cold.1(v20, v21);

  }
  v22 = v23;
  objc_msgSend(v23, "setBody:", v19, v23);

}

- (id)keyFromMigratorType:(int64_t)a3
{
  if ((unint64_t)a3 > 0x10)
    return 0;
  else
    return off_24E359148[a3];
}

- (NSHashTable)migrators
{
  return (NSHashTable *)objc_loadWeakRetained((id *)&self->_migrators);
}

- (void)setMigrators:(id)a3
{
  objc_storeWeak((id *)&self->_migrators, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_migrators);
}

- (void)server:(void *)a1 didReceiveRequest:(NSObject *)a2 response:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_21EC08000, a2, OS_LOG_TYPE_ERROR, "could not serialize data. error=%@", (uint8_t *)&v4, 0xCu);

}

@end
