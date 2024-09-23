@implementation _COClusterRealmDynamicGroup

+ (id)realmForCurrent
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE64BE0], "predicateForCurrentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  objc_msgSend(MEMORY[0x24BE64BC0], "predicateForCurrentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14C0], "orPredicateWithSubpredicates:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[COClusterRealm _initWithPredicate:]([_COClusterRealmDynamicGroup alloc], "_initWithPredicate:", v5);

  return v6;
}

- (id)_identifierForGroupResult:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v4)
  {
    v6 = 0;
    v7 = 0;
    goto LABEL_14;
  }
  v5 = v4;
  v6 = 0;
  v7 = 0;
  v8 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v22 != v8)
        objc_enumerationMutation(v3);
      v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v6;
        v6 = v10;
        v12 = v7;
      }
      else
      {
        objc_opt_class();
        v11 = v7;
        v12 = v10;
        if ((objc_opt_isKindOfClass() & 1) == 0)
          continue;
      }
      v13 = v10;

      v7 = v12;
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  }
  while (v5);
LABEL_14:
  _os_feature_enabled_impl();
  if (v6)
  {
    objc_msgSend(v6, "HomeKitMediaSystemIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = CFSTR("pair");
    if (v15)
      goto LABEL_20;
  }
  else
  {
    v15 = 0;
    v16 = 0;
  }
  if (v7)
  {
    objc_msgSend(v7, "HomeKitAccesoryIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = CFSTR("solo");
  }
LABEL_20:
  v18 = (void *)-[__CFString length](v16, "length");
  if (v18)
  {
    objc_msgSend(v15, "length");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v16, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;

  return v19;
}

@end
