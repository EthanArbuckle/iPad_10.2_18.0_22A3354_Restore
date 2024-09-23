@implementation NRPairingCompatibilityVersionInfo

- (int64_t)maxPairingCompatibilityVersion
{
  return qword_1ECE237E0;
}

- (int64_t)minPairingCompatibilityVersion
{
  void *v3;
  int64_t v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend((id)objc_opt_class(), "valueForToken:", _MergedGlobals_9));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NRPairingCompatibilityVersionInfo minPairingCompatibilityVersionForChipID:](self, "minPairingCompatibilityVersionForChipID:", v3);

  return v4;
}

- (int64_t)minQuickSwitchCompatibilityVersion
{
  void *v3;
  int64_t v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend((id)objc_opt_class(), "valueForToken:", _MergedGlobals_9));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NRPairingCompatibilityVersionInfo minQuickSwitchPairingCompatibilityVersionForChipID:](self, "minQuickSwitchPairingCompatibilityVersionForChipID:", v3);

  return v4;
}

- (int64_t)minPairingCompatibilityVersionWithChipID
{
  return qword_1ECE237E8;
}

- (int64_t)pairingCompatibilityVersion
{
  return objc_msgSend((id)objc_opt_class(), "valueForToken:", dword_1EE5CDB94);
}

- (int64_t)minPairingCompatibilityVersionForProductType:(id)a3
{
  int64_t v3;
  void *v4;
  void *v5;

  v3 = qword_1ECE237F0;
  if (a3)
  {
    objc_msgSend((id)qword_1ECE237F8, "objectForKeyedSubscript:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v3 = objc_msgSend(v4, "integerValue");

  }
  return v3;
}

- (int64_t)minPairingCompatibilityVersionForChipID:(id)a3
{
  return -[NRPairingCompatibilityVersionInfo minPairingCompatibilityVersionForChipID:name:defaultVersion:](self, "minPairingCompatibilityVersionForChipID:name:defaultVersion:", a3, CFSTR("Minimum pairing compatibility version"), qword_1ECE237F0);
}

- (int64_t)minQuickSwitchPairingCompatibilityVersionForChipID:(id)a3
{
  return -[NRPairingCompatibilityVersionInfo minPairingCompatibilityVersionForChipID:name:defaultVersion:](self, "minPairingCompatibilityVersionForChipID:name:defaultVersion:", a3, CFSTR("QuickSwitch pairing compatibility version"), qword_1ECE23800);
}

- (int64_t)minPairingCompatibilityVersionForChipID:(id)a3 name:(id)a4 defaultVersion:(int64_t)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v7 = (id)qword_1ECE23808;
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E4499C68);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "componentsSeparatedByString:", CFSTR(","));
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v9)
      {
        v10 = v9;
        v20 = v8;
        v11 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v23 != v11)
              objc_enumerationMutation(obj);
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "componentsSeparatedByString:", CFSTR("="));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "integerValue"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v6, "isEqual:", v16);

            if (v17)
            {
              objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              a5 = objc_msgSend(v18, "integerValue");

              goto LABEL_13;
            }

          }
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v10)
            continue;
          break;
        }
LABEL_13:
        v8 = v20;
      }

      v7 = v8;
    }

  }
  return a5;
}

- (BOOL)isOverrideActive
{
  return _MergedGlobals_10;
}

- (BOOL)isRevlockFeatureFlagActive
{
  return byte_1ECE237D9;
}

- (id)initInternal
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NRPairingCompatibilityVersionInfo;
  return -[NRPairingCompatibilityVersionInfo init](&v3, sel_init);
}

+ (id)stringFromCFPrefs:(id)a3
{
  CFPropertyListRef v3;
  void *v4;
  CFTypeID v5;
  id v6;

  v3 = CFPreferencesCopyValue((CFStringRef)a3, CFSTR("com.apple.NanoRegistry"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = CFGetTypeID(v3);
    if (v5 == CFStringGetTypeID())
      v6 = v4;
    else
      v6 = 0;
    CFRelease(v4);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)systemVersions
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__NRPairingCompatibilityVersionInfo_systemVersions__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ECE23818 != -1)
    dispatch_once(&qword_1ECE23818, block);
  return (id)qword_1ECE23810;
}

void __51__NRPairingCompatibilityVersionInfo_systemVersions__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  id v18;
  void *v19;
  uint8_t v20[16];
  uint8_t v21[16];
  uint8_t buf[16];

  nr_framework_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A0BDB000, v2, OS_LOG_TYPE_DEFAULT, "Revlock is set to shipping behavior", buf, 2u);
  }

  byte_1ECE237D9 = 1;
  qword_1ECE237E0 = 23;
  numberFromCFPrefs(CFSTR("maxPairingCompatibilityVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    qword_1ECE237E0 = objc_msgSend(v3, "integerValue");
    _MergedGlobals_10 = 1;
  }
  qword_1ECE237F0 = 22;
  numberFromCFPrefs(CFSTR("minPairingCompatibilityVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    qword_1ECE237F0 = objc_msgSend(v5, "integerValue");
    _MergedGlobals_10 = 1;
  }
  qword_1ECE237E8 = 10;
  numberFromCFPrefs(CFSTR("minPairingCompatibilityVersionWithChipID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    qword_1ECE237E8 = objc_msgSend(v6, "integerValue");
    _MergedGlobals_10 = 1;
  }
  qword_1ECE23800 = 6;
  numberFromCFPrefs(CFSTR("minQuickSwitchCompatibilityVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    qword_1ECE23800 = objc_msgSend(v7, "integerValue");
    _MergedGlobals_10 = 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "_minPairingCompatibilityVersionWatchProductTypes");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)qword_1ECE237F8;
  qword_1ECE237F8 = v8;

  v10 = (void *)qword_1ECE23808;
  qword_1ECE23808 = (uint64_t)CFSTR("28674=10,32770=14,32772=18");

  objc_msgSend(*(id *)(a1 + 32), "stringFromCFPrefs:", CFSTR("IOS_PAIRING_EOL_MIN_PAIRING_COMPATIBILITY_VERSION_CHIPIDS"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_storeStrong((id *)&qword_1ECE23808, v11);
    _MergedGlobals_10 = 1;
  }
  if (notify_register_check("com.apple.nanoregistry.pairingcompatibilityversion", &dword_1EE5CDB94))
  {
    nr_framework_log();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      nr_framework_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1A0BDB000, v14, OS_LOG_TYPE_DEFAULT, "Failed to register for version notify token", v21, 2u);
      }

    }
  }
  if (notify_register_check("com.apple.nanoregistry.activedevicechipid", &_MergedGlobals_9))
  {
    nr_framework_log();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      nr_framework_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_1A0BDB000, v17, OS_LOG_TYPE_DEFAULT, "Failed to register for active device chip id notify token", v20, 2u);
      }

    }
  }
  v18 = -[NRPairingCompatibilityVersionInfo initInternal]([NRPairingCompatibilityVersionInfo alloc], "initInternal");
  v19 = (void *)qword_1ECE23810;
  qword_1ECE23810 = (uint64_t)v18;

}

+ (id)_minPairingCompatibilityVersionWatchProductTypes
{
  return &unk_1E44A55B0;
}

+ (unint64_t)valueForToken:(int)a3
{
  uint32_t state;
  uint32_t v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t state64;
  uint8_t buf[4];
  uint32_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3 == -1)
    return 0;
  state64 = 0;
  state = notify_get_state(a3, &state64);
  if (state)
  {
    v4 = state;
    nr_framework_log();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      nr_framework_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v11 = v4;
        _os_log_impl(&dword_1A0BDB000, v7, OS_LOG_TYPE_DEFAULT, "Failed to get version notify token with result %d", buf, 8u);
      }

    }
    return 0;
  }
  return state64;
}

- (void)setPairingCompatibilityVersion:(int64_t)a3
{
  self->_pairingCompatibilityVersion = a3;
}

- (void)setMaxPairingCompatibilityVersion:(int64_t)a3
{
  self->_maxPairingCompatibilityVersion = a3;
}

- (void)setMinPairingCompatibilityVersion:(int64_t)a3
{
  self->_minPairingCompatibilityVersion = a3;
}

- (void)setMinPairingCompatibilityVersionWithChipID:(int64_t)a3
{
  self->_minPairingCompatibilityVersionWithChipID = a3;
}

- (void)setMinQuickSwitchCompatibilityVersion:(int64_t)a3
{
  self->_minQuickSwitchCompatibilityVersion = a3;
}

- (void)setIsOverrideActive:(BOOL)a3
{
  self->_isOverrideActive = a3;
}

- (void)setIsRevlockFeatureFlagActive:(BOOL)a3
{
  self->_isRevlockFeatureFlagActive = a3;
}

@end
