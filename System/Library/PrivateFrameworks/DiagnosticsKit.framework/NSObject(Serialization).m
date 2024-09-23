@implementation NSObject(Serialization)

- (id)dropNonSerializableDataWithError:()Serialization
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  void *v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a1, "isJSONSerializable"))
    return a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v7 = a1;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v46 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "dropNonSerializableDataWithError:", a3);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v6, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      }
      while (v9);
    }
LABEL_36:

    if (objc_msgSend(v6, "count"))
      v30 = v6;
    else
      v30 = 0;
    v31 = v30;

    return v31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = a1;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v13, "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v42 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
          objc_msgSend(v13, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "dropNonSerializableDataWithError:", a3);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, v20);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
      }
      while (v17);
    }

    if (objc_msgSend(v14, "count"))
      v23 = v14;
    else
      v23 = 0;
    v24 = v23;

    return v24;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v7 = a1;
      v25 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v38;
        do
        {
          for (k = 0; k != v26; ++k)
          {
            if (*(_QWORD *)v38 != v27)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * k), "dropNonSerializableDataWithError:", a3);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29)
              objc_msgSend(v6, "addObject:", v29);

          }
          v26 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
        }
        while (v26);
      }
      goto LABEL_36;
    }
    if (objc_msgSend(a1, "isSecureCodable"))
      return a1;
    v32 = (void *)MEMORY[0x24BDD17C8];
    DKErrorLocalizedDescriptionForCode(-1009);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", v33, a1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      v35 = (void *)MEMORY[0x24BDD1540];
      v49 = *MEMORY[0x24BDD0FC8];
      v50 = v34;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("DKErrorDomain"), -1009, v36);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    return 0;
  }
}

- (uint64_t)isSecureCodable
{
  return objc_msgSend(a1, "conformsToProtocol:", &unk_255DCF8B0);
}

- (uint64_t)isJSONSerializable
{
  return objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", a1);
}

@end
