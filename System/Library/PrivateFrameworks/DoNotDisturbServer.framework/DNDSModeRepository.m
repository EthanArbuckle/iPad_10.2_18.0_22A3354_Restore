@implementation DNDSModeRepository

- (id)modeDetailsForIdentifiers:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  DNDSModeDetails *v14;
  void *v15;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    v9 = *MEMORY[0x1E0D1D3C0];
    v10 = *MEMORY[0x1E0D1D4C8];
    v17 = *MEMORY[0x1E0DA8430];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_msgSend(v12, "isEqualToString:", v9) & 1) != 0)
        {
          v13 = 1;
LABEL_12:
          v14 = -[DNDSModeDetails initWithInterruptionSuppression:]([DNDSModeDetails alloc], "initWithInterruptionSuppression:", v13);
          objc_msgSend(v4, "addObject:", v14);

          continue;
        }
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.donotdisturb.mode.driving")) & 1) != 0
          || (objc_msgSend(v12, "isEqualToString:", v10) & 1) != 0
          || objc_msgSend(v12, "isEqualToString:", v17))
        {
          v13 = 2;
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
