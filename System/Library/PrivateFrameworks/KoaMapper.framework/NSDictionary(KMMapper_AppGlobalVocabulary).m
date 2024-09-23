@implementation NSDictionary(KMMapper_AppGlobalVocabulary)

- (id)arrayValueForKey:()KMMapper_AppGlobalVocabulary expectedObjectsType:keyRequired:error:
{
  id v10;
  void *v11;

  v10 = a3;
  objc_msgSend(a1, "_collectionValueForKey:collectonType:expectedObjectsType:keyRequired:error:", v10, objc_opt_class(), a4, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)setValueForKey:()KMMapper_AppGlobalVocabulary expectedObjectsType:keyRequired:error:
{
  id v10;
  void *v11;

  v10 = a3;
  objc_msgSend(a1, "_collectionValueForKey:collectonType:expectedObjectsType:keyRequired:error:", v10, objc_opt_class(), a4, a5, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_collectionValueForKey:()KMMapper_AppGlobalVocabulary collectonType:expectedObjectsType:keyRequired:error:
{
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;
  void *v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  objc_msgSend(a1, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    if (a6)
    {
      v18 = (void *)MEMORY[0x24BDD1540];
      v43 = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No value associated with key: %@"), v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v19;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.koa.mapper"), 9, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      KVSetError();

    }
LABEL_17:
    v17 = 0;
    goto LABEL_18;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v22 = (void *)MEMORY[0x24BDD1540];
    v41 = *MEMORY[0x24BDD0BA0];
    v23 = (void *)MEMORY[0x24BDD17C8];
    NSStringFromClass(a4);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("Value for key %@ is not of expected class %@"), v10, v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.koa.mapper"), 9, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    KVSetError();

LABEL_16:
    goto LABEL_17;
  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v12);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v27 = (void *)MEMORY[0x24BDD1540];
          v38 = *MEMORY[0x24BDD0BA0];
          v28 = (void *)MEMORY[0x24BDD17C8];
          NSStringFromClass(a5);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "stringWithFormat:", CFSTR("Object in collection for key %@ is not of expected class %@"), v10, v29, v34);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v30;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.koa.mapper"), 9, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          KVSetError();

          goto LABEL_16;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      if (v14)
        continue;
      break;
    }
  }

  v17 = v12;
LABEL_18:

  return v17;
}

- (id)stringValueForKey:()KMMapper_AppGlobalVocabulary error:
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void **v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("No value associated with key: %@"), v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v8;
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = (void **)v18;
    v11 = &v17;
LABEL_6:
    objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.koa.mapper"), 9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    KVSetError();

    v6 = 0;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Value for key %@ is not a string"), v4, *MEMORY[0x24BDD0BA0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v8;
    v9 = (void *)MEMORY[0x24BDBCE70];
    v10 = &v16;
    v11 = &v15;
    goto LABEL_6;
  }
  v6 = v5;
LABEL_7:

  return v6;
}

@end
