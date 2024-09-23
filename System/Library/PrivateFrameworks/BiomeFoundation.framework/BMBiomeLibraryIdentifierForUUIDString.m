@implementation BMBiomeLibraryIdentifierForUUIDString

void __BMBiomeLibraryIdentifierForUUIDString_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_opt_new();
  __softlink__BiomeLibraryAndInternalLibraryNode();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allStreams");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "valueForKeyPath:", CFSTR("configuration.streamUUID.UUIDString"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "valueForKeyPath:", CFSTR("configuration.streamIdentifier"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "setObject:forKeyedSubscript:", v9, v8);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)BMBiomeLibraryIdentifierForUUIDString_mapping;
  BMBiomeLibraryIdentifierForUUIDString_mapping = v10;

}

@end
