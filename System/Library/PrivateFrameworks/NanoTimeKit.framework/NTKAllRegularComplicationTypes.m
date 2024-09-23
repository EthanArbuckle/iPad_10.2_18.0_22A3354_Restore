@implementation NTKAllRegularComplicationTypes

void __NTKAllRegularComplicationTypes_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  NTKAllComplicationTypes();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = objc_msgSend(&unk_1E6CAAC00, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(&unk_1E6CAAC00);
        objc_msgSend(v1, "removeIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v5++), "unsignedIntegerValue"));
      }
      while (v3 != v5);
      v3 = objc_msgSend(&unk_1E6CAAC00, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexSet:", v1);
  v7 = (void *)NTKAllRegularComplicationTypes_allRegular;
  NTKAllRegularComplicationTypes_allRegular = v6;

}

@end
