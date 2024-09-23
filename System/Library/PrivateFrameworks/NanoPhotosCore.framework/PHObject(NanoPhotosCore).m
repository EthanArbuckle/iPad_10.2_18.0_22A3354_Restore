@implementation PHObject(NanoPhotosCore)

+ (id)npto_localIdentifiersWithUUIDs:()NanoPhotosCore
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "UUIDString", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "localIdentifierWithUUID:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

- (id)npto_uuid
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  objc_getAssociatedObject(a1, sel_npto_uuid);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDD1880]);
    v4 = (void *)MEMORY[0x24BDE35D0];
    objc_msgSend(a1, "localIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uuidFromLocalIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v3, "initWithUUIDString:", v6);

  }
  return v2;
}

- (void)npto_setUUID:()NanoPhotosCore
{
  objc_setAssociatedObject(a1, sel_npto_uuid, a3, (void *)1);
}

@end
