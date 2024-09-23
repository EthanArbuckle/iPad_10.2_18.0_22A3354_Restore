@implementation TRIPBStruct(MLRuntime)

- (id)mlr_arrayWithTRIPBListValue:()MLRuntime
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "valuesArray", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "mlr_objectForTRIPBValue:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)mlr_objectForTRIPBValue:()MLRuntime
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  switch(objc_msgSend(v4, "kindOneOfCase"))
  {
    case 1u:
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2u:
      v7 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v4, "numberValue");
      objc_msgSend(v7, "numberWithDouble:");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3u:
      objc_msgSend(v4, "stringValue");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4u:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "BOOLValue"));
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v6 = (void *)v5;
      break;
    case 5u:
      objc_msgSend(v4, "structValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "mlr_dictionaryRepresentation");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 6u:
      objc_msgSend(v4, "listValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "mlr_arrayWithTRIPBListValue:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v6 = (void *)v9;

      break;
    default:
      v6 = 0;
      break;
  }

  return v6;
}

- (id)mlr_dictionaryRepresentation
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(a1, "fields");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v6);
        objc_msgSend(a1, "fields");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v13 = (void *)MEMORY[0x24BDBCE88];
          v14 = *MEMORY[0x24BDBCAB8];
          v27 = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("value class=%@, key=%@"), objc_opt_class(), v7);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v15;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, CFSTR("Unexpected type in TRIPBStruct"), v16);
          v17 = (id)objc_claimAutoreleasedReturnValue();

          objc_exception_throw(v17);
        }
        objc_msgSend(a1, "mlr_objectForTRIPBValue:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, v7);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BE2D120], "coreChannel");
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v24 = v7;
            v25 = 2112;
            v26 = v9;
            _os_log_error_impl(&dword_2112F5000, v11, OS_LOG_TYPE_ERROR, "Nil obj in TRIPBStruct key%@, value=%@", buf, 0x16u);
          }

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v4);
  }

  return v2;
}

@end
