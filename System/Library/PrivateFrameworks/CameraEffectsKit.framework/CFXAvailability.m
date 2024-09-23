@implementation CFXAvailability

+ (id)availableEffects
{
  if (availableEffects_onceToken != -1)
    dispatch_once(&availableEffects_onceToken, &__block_literal_global_3);
  return (id)availableEffects_s_availableEffects;
}

void __35__CFXAvailability_availableEffects__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  +[CFXEffectType effectTypeIdentifiers](CFXEffectType, "effectTypeIdentifiers");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEE0]), "initWithCapacity:", objc_msgSend(v0, "count"));
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = v0;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        +[CFXEffectType effectTypeWithIdentifier:](CFXEffectType, "effectTypeWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6), (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          objc_msgSend(v1, "addObject:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  v8 = (void *)availableEffects_s_availableEffects;
  availableEffects_s_availableEffects = (uint64_t)v1;

}

@end
