@implementation EDMigrateUserDefaultsUpgradeStep

+ (BOOL)run
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(a1, "propertiesToMigrate", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(MEMORY[0x1E0C99EA0], "em_migrateDefault:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5++));
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

  return 1;
}

+ (id)propertiesToMigrate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[7];

  v6[6] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D1E050];
  v6[0] = *MEMORY[0x1E0D1E008];
  v6[1] = v2;
  v3 = *MEMORY[0x1E0D1E058];
  v6[2] = *MEMORY[0x1E0D1E030];
  v6[3] = v3;
  v4 = *MEMORY[0x1E0D1E078];
  v6[4] = *MEMORY[0x1E0D1E060];
  v6[5] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
