@implementation HKUIConnectedGymIconUtilties

+ (void)initialize
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)__HKUIManufacturerNameToLogoNameMapping;
  __HKUIManufacturerNameToLogoNameMapping = (uint64_t)&unk_1E9CED768;

  v3 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v4 = (void *)_iconCache;
  _iconCache = (uint64_t)v3;

}

+ (id)iconForConnectedGymDevice:(id)a3 preferredIconWidth:(double)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  objc_msgSend(a3, "manufacturer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1E9C4C428);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)__HKUIManufacturerNameToLogoNameMapping, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@_%.0f"), v9, *(_QWORD *)&a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)_iconCache, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hk_watchIconImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend((id)_iconCache, "setObject:forKeyedSubscript:", v11, v10);
    }
    else
    {
      _HKInitializeLogging();
      v14 = *MEMORY[0x1E0CB52C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
        +[HKUIConnectedGymIconUtilties iconForConnectedGymDevice:preferredIconWidth:].cold.1((uint64_t)v10, (uint64_t)v7, v14);
    }

  }
  return v11;
}

+ (void)iconForConnectedGymDevice:(os_log_t)log preferredIconWidth:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1D7813000, log, OS_LOG_TYPE_ERROR, "No GymKit icon found with name '%{public}@' for manufacturer '%{public}@'", (uint8_t *)&v3, 0x16u);
}

@end
