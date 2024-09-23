@implementation DSSourceWrapper

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.DigitalSeparation", "DSSourceWrapper");
    v3 = (void *)DSLog_4;
    DSLog_4 = (uint64_t)v2;

  }
}

+ (BOOL)shouldEnumerateResourceNamesForSource:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_25592C7B0))
  {
    objc_msgSend(v3, "resourceNames");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (unint64_t)objc_msgSend(v4, "count") > 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)wrapMultiSource:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[DSSourceWrapper shouldEnumerateResourceNamesForSource:](DSSourceWrapper, "shouldEnumerateResourceNamesForSource:", v3))
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v3, "resourceNames");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          v10 = -[DSSubSource init:withResourceName:]([DSSubSource alloc], "init:withResourceName:", v3, v9);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v9);

          v11 = (void *)DSLog_4;
          if (os_log_type_enabled((os_log_t)DSLog_4, OS_LOG_TYPE_DEFAULT))
          {
            v12 = v11;
            objc_msgSend(v3, "name");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v22 = v9;
            v23 = 2114;
            v24 = v13;
            _os_log_impl(&dword_227D24000, v12, OS_LOG_TYPE_DEFAULT, "Adding sharing sub source for %{public}@ from %{public}@", buf, 0x16u);

          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v6);
    }

  }
  else
  {
    v14 = (void *)DSLog_4;
    if (os_log_type_enabled((os_log_t)DSLog_4, OS_LOG_TYPE_ERROR))
      +[DSSourceWrapper wrapMultiSource:].cold.1(v14, v3);
  }

  return v4;
}

+ (void)wrapMultiSource:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_227D24000, v3, OS_LOG_TYPE_ERROR, "%{public}@ does not satisfy constraints to use DSResourceName", (uint8_t *)&v5, 0xCu);

}

@end
