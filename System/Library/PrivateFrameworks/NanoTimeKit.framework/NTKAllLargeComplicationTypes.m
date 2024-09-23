@implementation NTKAllLargeComplicationTypes

void __NTKAllLargeComplicationTypes_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  NTKAllRegularComplicationTypes();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = objc_msgSend(&unk_1E6CAAC78, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v10;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(&unk_1E6CAAC78);
        objc_msgSend(v1, "removeIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v5++), "unsignedIntegerValue"));
      }
      while (v3 != v5);
      v3 = objc_msgSend(&unk_1E6CAAC78, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }
  NTKLauncherIconComplicationTypes();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeIndexes:", v6);

  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexSet:", v1);
  v8 = (void *)NTKAllLargeComplicationTypes_allLarge;
  NTKAllLargeComplicationTypes_allLarge = v7;

}

@end
