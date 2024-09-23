@implementation NUSoftwareVersion

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NUSoftwareVersion platform](self, "platform");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUSoftwareVersion buildNumber](self, "buildNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUSoftwareVersion appVersion](self, "appVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p platform=%@ buildNumber=%@ appVersion=%@ schemaRevision=%ld>"), v4, self, v5, v6, v7, -[NUSoftwareVersion schemaRevision](self, "schemaRevision"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NUSoftwareVersion *v4;

  v4 = +[NUSoftwareVersion allocWithZone:](NUSoftwareVersion, "allocWithZone:", a3);
  objc_storeStrong((id *)&v4->_platform, self->_platform);
  objc_storeStrong((id *)&v4->_buildNumber, self->_buildNumber);
  objc_storeStrong((id *)&v4->_appVersion, self->_appVersion);
  v4->_schemaRevision = self->_schemaRevision;
  return v4;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  -[NUSoftwareVersion platform](self, "platform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0x191F1574B62ABFLL * objc_msgSend(v3, "hash");

  -[NUSoftwareVersion buildNumber](self, "buildNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0x1C0BFE615F565DLL * objc_msgSend(v5, "hash");

  -[NUSoftwareVersion appVersion](self, "appVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0x3BB41398110FFLL * objc_msgSend(v7, "hash");

  return v6 ^ v4 ^ v8 ^ (0x23338B35E717C9 * -[NUSoftwareVersion schemaRevision](self, "schemaRevision"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[NUSoftwareVersion isEqualToSoftwareVersion:](self, "isEqualToSoftwareVersion:", v4);

  return v5;
}

- (BOOL)isEqualToSoftwareVersion:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  BOOL v19;

  v5 = a3;
  -[NUSoftwareVersion platform](self, "platform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 || (objc_msgSend(v5, "platform"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v5, "platform");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUSoftwareVersion platform](self, "platform");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (v6)
    {

      if (!v9)
        goto LABEL_19;
    }
    else
    {

      if ((v9 & 1) == 0)
        goto LABEL_19;
    }
  }
  -[NUSoftwareVersion buildNumber](self, "buildNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 || (objc_msgSend(v5, "buildNumber"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v5, "buildNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUSoftwareVersion buildNumber](self, "buildNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqualToString:", v12);

    if (v10)
    {

      if (!v13)
        goto LABEL_19;
    }
    else
    {

      if ((v13 & 1) == 0)
        goto LABEL_19;
    }
  }
  -[NUSoftwareVersion appVersion](self, "appVersion");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(v5, "appVersion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_17;
  }
  objc_msgSend(v5, "appVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUSoftwareVersion appVersion](self, "appVersion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqualToString:", v16);

  if (!v14)
  {

    if ((v17 & 1) != 0)
      goto LABEL_17;
LABEL_19:
    v19 = 0;
    goto LABEL_20;
  }

  if (!v17)
    goto LABEL_19;
LABEL_17:
  v18 = objc_msgSend(v5, "schemaRevision");
  v19 = v18 == -[NUSoftwareVersion schemaRevision](self, "schemaRevision");
LABEL_20:

  return v19;
}

- (NSString)platform
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPlatform:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSString)buildNumber
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBuildNumber:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)appVersion
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAppVersion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (int64_t)schemaRevision
{
  return self->_schemaRevision;
}

- (void)setSchemaRevision:(int64_t)a3
{
  self->_schemaRevision = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_buildNumber, 0);
  objc_storeStrong((id *)&self->_platform, 0);
}

+ (id)currentSoftwareVersion
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setPlatform:", CFSTR("iOS"));
  objc_msgSend(a1, "systemBuildVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBuildNumber:", v4);

  objc_msgSend(a1, "frameworkVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAppVersion:", v5);

  objc_msgSend(v3, "setSchemaRevision:", 1);
  return v3;
}

+ (id)systemBuildVersion
{
  if (systemBuildVersion_onceToken != -1)
    dispatch_once(&systemBuildVersion_onceToken, &__block_literal_global_4714);
  return (id)systemBuildVersion_buildVersion;
}

+ (id)frameworkVersion
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__NUSoftwareVersion_frameworkVersion__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (frameworkVersion_onceToken != -1)
    dispatch_once(&frameworkVersion_onceToken, block);
  return (id)frameworkVersion_version;
}

+ (id)_frameworkVersion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v10;
  void *v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    NUAssertLogger_4693();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Bundle not found for class: %@"), a1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v65 = v11;
      _os_log_error_impl(&dword_1A6553000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4693();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v35 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v36 = (void *)MEMORY[0x1E0CB3978];
        v37 = v35;
        objc_msgSend(v36, "callStackSymbols");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v65 = v35;
        v66 = 2114;
        v67 = v39;
        _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v65 = v16;
      _os_log_error_impl(&dword_1A6553000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler((uint64_t)"+[NUSoftwareVersion _frameworkVersion]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSoftwareVersion.m", 85, CFSTR("Bundle not found for class: %@"), v40, v41, v42, v43, (uint64_t)a1);
  }
  v4 = v3;
  objc_msgSend(v3, "infoDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    NUAssertLogger_4693();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "bundlePath");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("Failed to load Info.plist for bundle at path: %@"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v65 = v20;
      _os_log_error_impl(&dword_1A6553000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v21 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4693();
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if (v21)
    {
      if (v23)
      {
        v44 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v45 = (void *)MEMORY[0x1E0CB3978];
        v46 = v44;
        objc_msgSend(v45, "callStackSymbols");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "componentsJoinedByString:", CFSTR("\n"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v65 = v44;
        v66 = 2114;
        v67 = v48;
        _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v23)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v65 = v25;
      _os_log_error_impl(&dword_1A6553000, v22, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    objc_msgSend(v4, "bundlePath");
    v49 = objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler((uint64_t)"+[NUSoftwareVersion _frameworkVersion]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSoftwareVersion.m", 88, CFSTR("Failed to load Info.plist for bundle at path: %@"), v50, v51, v52, v53, v49);
  }
  v6 = v5;
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0C9AE90]);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    NUAssertLogger_4693();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "bundlePath");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFormat:", CFSTR("Failed to get version for bundle at path: %@"), v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v65 = v29;
      _os_log_error_impl(&dword_1A6553000, v26, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v30 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    NUAssertLogger_4693();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v32)
      {
        v54 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v55 = (void *)MEMORY[0x1E0CB3978];
        v56 = v54;
        objc_msgSend(v55, "callStackSymbols");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "componentsJoinedByString:", CFSTR("\n"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v65 = v54;
        v66 = 2114;
        v67 = v58;
        _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v32)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "componentsJoinedByString:", CFSTR("\n"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v65 = v34;
      _os_log_error_impl(&dword_1A6553000, v31, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    objc_msgSend(v4, "bundlePath");
    v59 = objc_claimAutoreleasedReturnValue();
    _NUAssertFailHandler((uint64_t)"+[NUSoftwareVersion _frameworkVersion]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Schema/NUSoftwareVersion.m", 91, CFSTR("Failed to get version for bundle at path: %@"), v60, v61, v62, v63, v59);
  }
  v8 = (void *)v7;

  return v8;
}

void __37__NUSoftwareVersion_frameworkVersion__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_frameworkVersion");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)frameworkVersion_version;
  frameworkVersion_version = v1;

}

void __39__NUSoftwareVersion_systemBuildVersion__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = _CFCopySystemVersionDictionaryValue();
  v1 = (void *)systemBuildVersion_buildVersion;
  systemBuildVersion_buildVersion = v0;

}

- (id)archivalRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  -[NUSoftwareVersion platform](self, "platform");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NUSoftwareVersion platform](self, "platform");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("platform"));

  }
  -[NUSoftwareVersion buildNumber](self, "buildNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NUSoftwareVersion buildNumber](self, "buildNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("buildNumber"));

  }
  -[NUSoftwareVersion appVersion](self, "appVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NUSoftwareVersion appVersion](self, "appVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("appVersion"));

  }
  if (-[NUSoftwareVersion schemaRevision](self, "schemaRevision"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[NUSoftwareVersion schemaRevision](self, "schemaRevision"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("schemaRevision"));

  }
  return v3;
}

+ (id)softwareVersionFromArchivalRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_opt_new();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("platform"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setPlatform:", v5);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("buildNumber"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setBuildNumber:", v6);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("appVersion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setAppVersion:", v7);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("schemaRevision"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "setSchemaRevision:", objc_msgSend(v8, "integerValue"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
