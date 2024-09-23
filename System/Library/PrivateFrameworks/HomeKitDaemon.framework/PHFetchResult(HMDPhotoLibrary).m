@implementation PHFetchResult(HMDPhotoLibrary)

- (id)faceCropDataByUUID
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("B8AC1970-2A44-4E05-A0DB-ED720A1D910C"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = a1;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x24BDD1880];
        objc_msgSend(v9, "localIdentifier", (_QWORD)v17);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dataUsingEncoding:", 4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "hmf_UUIDWithNamespace:data:", v3, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "resourceData");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v14, v13);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  v15 = (void *)objc_msgSend(v2, "copy");
  return v15;
}

- (id)objects
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "fetchedObjects");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
    v1 = (void *)MEMORY[0x24BDBD1A8];
  v3 = v1;

  return v3;
}

@end
