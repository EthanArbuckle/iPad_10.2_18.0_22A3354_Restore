@implementation DNDSPlaceholderModeManager

- (DNDSPlaceholderModeManager)initWithBackingStore:(id)a3
{
  id v5;
  DNDSPlaceholderModeManager *v6;
  DNDSPlaceholderModeManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDSPlaceholderModeManager;
  v6 = -[DNDSPlaceholderModeManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_backingStore, a3);

  return v7;
}

- (id)placeholderModesWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[DNDSPlaceholderModeManager _readPlaceholderModesReturningError:](self, "_readPlaceholderModesReturningError:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  currentDevicePlatformString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v16 = v3;
  objc_msgSend(v3, "placeholderModes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "placeholderExcludedPlatforms");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", v5);

        if ((v13 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0D1D5F0], "modeForRecord:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "semanticType") != 9
            || (_os_feature_enabled_impl() & 1) != 0
            || !+[DNDSPlatformEligibility isIntelligenceAvailable](DNDSPlatformEligibility, "isIntelligenceAvailable"))
          {
            objc_msgSend(v4, "addObject:", v14);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v4;
}

- (id)placeholderModeIgnoringExcludedPlatformsForSemanticType:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[DNDSPlaceholderModeManager _readPlaceholderModesReturningError:](self, "_readPlaceholderModesReturningError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "placeholderModes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "semanticType") == a3)
        {
          objc_msgSend(MEMORY[0x1E0D1D5F0], "modeForRecord:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)backingStore:(id)a3 migrateDictionaryRepresentation:(id)a4 fromVersionNumber:(unint64_t)a5 toVersionNumber:(unint64_t)a6
{
  return a4;
}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)CFSTR("com.apple.donotdisturb.PlaceholderModeManager");
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  void *v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("placeholderModes");
  -[DNDSPlaceholderModeManager placeholderModesWithError:](self, "placeholderModesWithError:", 0, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_readPlaceholderModesReturningError:(id *)a3
{
  DNDSBackingStore *backingStore;
  DNDSPlaceholderModesRecord *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v10;

  backingStore = self->_backingStore;
  v10 = 0;
  -[DNDSBackingStore readRecordWithError:](backingStore, "readRecordWithError:", &v10);
  v5 = (DNDSPlaceholderModesRecord *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  v7 = v6;
  if (v6)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v6);
    v8 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR))
      -[DNDSPlaceholderModeManager _readPlaceholderModesReturningError:].cold.1((uint64_t)v7, v8);
    _DNDSRequestRadar(CFSTR("Failed to load placeholder Focus modes"), v7, 0, CFSTR("/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSPlaceholderModeManager.m"), 109);
  }
  if (!v5)
    v5 = objc_alloc_init(DNDSPlaceholderModesRecord);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingStore, 0);
}

- (void)_readPlaceholderModesReturningError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1CB895000, a2, OS_LOG_TYPE_ERROR, "Failed to load placeholder modes, will request a radar; error=%{public}@",
    (uint8_t *)&v2,
    0xCu);
}

@end
