@implementation MBSystemDomainsVersions

- (MBSystemDomainsVersions)init
{
  MBSystemDomainsVersions *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MBSystemDomainsVersions;
  result = -[MBSystemDomainsVersions init](&v8, sel_init);
  if (result)
  {
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&result->_version = _Q0;
    result->_maxSupportedVersion = 2.0;
  }
  return result;
}

- (MBSystemDomainsVersions)initWithVersion:(double)a3 minSupportedVersion:(double)a4 maxSupportedVersion:(double)a5
{
  MBSystemDomainsVersions *result;

  result = -[MBSystemDomainsVersions init](self, "init");
  if (result)
  {
    result->_version = a3;
    result->_minSupportedVersion = a4;
    result->_maxSupportedVersion = a5;
  }
  return result;
}

- (MBSystemDomainsVersions)initWithDefaultSystemDomainsPlist
{
  MBSystemDomainsVersions *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  double version;
  double minSupportedVersion;
  double maxSupportedVersion;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  MBException *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  __int16 v40;
  double v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v2 = -[MBSystemDomainsVersions init](self, "init");
  if (!v2)
    return v2;
  v3 = (void *)MEMORY[0x1D8270CF0]();
  _systemDomainsPlistPath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MBGetDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v35 = v4;
    _os_log_impl(&dword_1D5213000, v5, OS_LOG_TYPE_DEFAULT, "Loading system domains versions from %{public}@", buf, 0xCu);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"Loading system domains versions from %{public}@", v6, v7, v8, v9, v10, v11, (uint64_t)v4);
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v12, &v33);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v33;
  if (!v13)
  {
    v30 = -[MBException initWithCode:format:]([MBException alloc], "initWithCode:format:", 11, CFSTR("Error loading system domains from %@: %@"), v4, v14);
    goto LABEL_12;
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("SystemDomains"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v30 = -[MBException initWithCode:format:]([MBException alloc], "initWithCode:format:", 11, CFSTR("SystemDomains value not a dictionary"), v31, v32);
LABEL_12:
    objc_exception_throw(v30);
  }
  +[MBDomain doubleFromStringValueForKey:plist:](MBDomain, "doubleFromStringValueForKey:plist:", CFSTR("Version"), v13);
  v2->_version = v16;
  +[MBDomain doubleFromStringValueForKey:plist:](MBDomain, "doubleFromStringValueForKey:plist:", CFSTR("MinSupportedVersion"), v13);
  v2->_minSupportedVersion = v17;
  +[MBDomain doubleFromStringValueForKey:plist:](MBDomain, "doubleFromStringValueForKey:plist:", CFSTR("MaxSupportedVersion"), v13);
  v2->_maxSupportedVersion = v18;
  MBGetDefaultLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    version = v2->_version;
    minSupportedVersion = v2->_minSupportedVersion;
    maxSupportedVersion = v2->_maxSupportedVersion;
    *(_DWORD *)buf = 138544130;
    v35 = v4;
    v36 = 2048;
    v37 = version;
    v38 = 2048;
    v39 = minSupportedVersion;
    v40 = 2048;
    v41 = maxSupportedVersion;
    _os_log_impl(&dword_1D5213000, v19, OS_LOG_TYPE_DEFAULT, "Loaded system domains versions from %{public}@: (%.1f,%.1f,%.1f)", buf, 0x2Au);
    _MBLog(CFSTR("DEFAULT"), (uint64_t)"Loaded system domains versions from %{public}@: (%.1f,%.1f,%.1f)", v23, v24, v25, v26, v27, v28, (uint64_t)v4);
  }

  objc_autoreleasePoolPop(v3);
  return v2;
}

- (double)version
{
  return self->_version;
}

- (void)setVersion:(double)a3
{
  self->_version = a3;
}

- (double)minSupportedVersion
{
  return self->_minSupportedVersion;
}

- (void)setMinSupportedVersion:(double)a3
{
  self->_minSupportedVersion = a3;
}

- (double)maxSupportedVersion
{
  return self->_maxSupportedVersion;
}

- (void)setMaxSupportedVersion:(double)a3
{
  self->_maxSupportedVersion = a3;
}

@end
