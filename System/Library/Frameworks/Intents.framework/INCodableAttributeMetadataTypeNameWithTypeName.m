@implementation INCodableAttributeMetadataTypeNameWithTypeName

void __INCodableAttributeMetadataTypeNameWithTypeName_block_invoke()
{
  id v0;
  void *v1;
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
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)INCodableAttributeMetadataTypeNameWithTypeName_metadataTypeToAttributeNameMapping;
  INCodableAttributeMetadataTypeNameWithTypeName_metadataTypeToAttributeNameMapping = (uint64_t)v0;

  +[INSchema _supportedTypesDictionary](INSchema, "_supportedTypesDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MetadataTypeName"), (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)INCodableAttributeMetadataTypeNameWithTypeName_metadataTypeToAttributeNameMapping;
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Name"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

@end
