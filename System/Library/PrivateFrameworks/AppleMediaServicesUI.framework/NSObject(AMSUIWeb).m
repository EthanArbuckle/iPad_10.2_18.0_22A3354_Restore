@implementation NSObject(AMSUIWeb)

- (uint64_t)ams_sanitizeServerObject
{
  return objc_msgSend(a1, "_sanitizedServerObject:", a1);
}

- (id)_sanitizedServerObject:()AMSUIWeb
{
  id v4;
  id v5;
  id v6;
  void *v8;
  double v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v22;
  id v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
LABEL_5:
    v6 = v5;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "timeIntervalSince1970");
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%lld"), (uint64_t)v9);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@"), v11);
    v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_32:

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v11 = v4;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v32 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(a1, "_sanitizedServerObject:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(v6, "addObject:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v13);
    }
    goto LABEL_32;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v11 = v4;
    v17 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v11);
          objc_msgSend(a1, "_sanitizedServerObject:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            objc_msgSend(v6, "addObject:", v21);

        }
        v18 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v18);
    }
    goto LABEL_32;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __45__NSObject_AMSUIWeb___sanitizedServerObject___block_invoke;
    v25[3] = &unk_24CB522F8;
    v25[4] = a1;
    v23 = v22;
    v26 = v23;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v25);
    v24 = v26;
    v6 = v23;

  }
  else
  {
    v6 = 0;
  }
LABEL_6:

  return v6;
}

@end
