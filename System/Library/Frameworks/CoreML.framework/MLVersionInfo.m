@implementation MLVersionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantString, 0);
}

+ (MLVersionInfo)versionInfoWithMajor:(int64_t)a3 minor:(int64_t)a4 patch:(int64_t)a5 variant:(id)a6
{
  id v9;
  MLVersionInfo *v10;

  v9 = a6;
  v10 = -[MLVersionInfo initWithMajor:minor:patch:variant:]([MLVersionInfo alloc], "initWithMajor:minor:patch:variant:", a3, a4, a5, v9);

  return v10;
}

- (MLVersionInfo)initWithMajor:(int64_t)a3 minor:(int64_t)a4 patch:(int64_t)a5 variant:(id)a6
{
  id v11;
  MLVersionInfo *v12;
  MLVersionInfo *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)MLVersionInfo;
  v12 = -[MLVersionInfo init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_majorVersion = a3;
    v12->_minorVersion = a4;
    v12->_patchVersion = a5;
    objc_storeStrong((id *)&v12->_variantString, a6);
  }

  return v13;
}

- (BOOL)olderThan:(id)a3
{
  id v4;
  int64_t majorVersion;
  BOOL v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t minorVersion;
  int64_t patchVersion;

  v4 = a3;
  majorVersion = self->_majorVersion;
  if (majorVersion < objc_msgSend(v4, "majorVersion")
    || (v7 = self->_majorVersion, v7 == objc_msgSend(v4, "majorVersion"))
    && (v8 = self->_minorVersion, v8 < objc_msgSend(v4, "minorVersion")))
  {
    v6 = 1;
  }
  else
  {
    v9 = self->_majorVersion;
    if (v9 == objc_msgSend(v4, "majorVersion")
      && (minorVersion = self->_minorVersion, minorVersion == objc_msgSend(v4, "minorVersion")))
    {
      patchVersion = self->_patchVersion;
      v6 = patchVersion < objc_msgSend(v4, "patchVersion");
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (int64_t)majorVersion
{
  return self->_majorVersion;
}

- (int64_t)minorVersion
{
  return self->_minorVersion;
}

- (int64_t)patchVersion
{
  return self->_patchVersion;
}

- (NSString)versionNumberString
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lld.%lld.%lld"), self->_majorVersion, self->_minorVersion, self->_patchVersion);
}

- (NSString)versionString
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *variantString;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MLVersionInfo versionNumberString](self, "versionNumberString");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  variantString = (const __CFString *)self->_variantString;
  if (!variantString)
    variantString = &stru_1E3D68DC8;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@"), v4, variantString);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)variantString
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

+ (MLVersionInfo)versionInfoWithString:(id)a3
{
  void *v3;
  MLVersionInfo *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  MLVersionInfo *v9;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v4 = 0;
  if (objc_msgSend(v3, "scanInteger:", &v14))
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "scanUpToCharactersFromSet:intoString:", v5, 0);

    v4 = 0;
    if (objc_msgSend(v3, "scanInteger:", &v13))
    {
      v12 = 0;
      objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "scanUpToCharactersFromSet:intoString:", v6, 0);

      v4 = 0;
      if (objc_msgSend(v3, "scanInteger:", &v12))
      {
        v11 = 0;
        objc_msgSend(v3, "scanUpToString:intoString:", &stru_1E3D68DC8, &v11);
        v7 = (__CFString *)v11;
        if (v7)
          v8 = v7;
        else
          v8 = &stru_1E3D68DC8;
        v9 = [MLVersionInfo alloc];
        v4 = -[MLVersionInfo initWithMajor:minor:patch:variant:](v9, "initWithMajor:minor:patch:variant:", v14, v13, v12, v8);

      }
    }
  }

  return v4;
}

+ (MLVersionInfo)versionInfoWithStringProgressive:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  MLVersionInfo *v8;
  MLVersionInfo *v9;
  MLVersionInfo *v10;
  uint64_t v11;
  uint64_t v12;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  if ((objc_msgSend(v3, "scanInteger:", &v17) & 1) == 0)
  {
    v10 = [MLVersionInfo alloc];
    v11 = 0;
LABEL_10:
    v12 = 0;
LABEL_11:
    v9 = -[MLVersionInfo initWithMajor:minor:patch:variant:](v10, "initWithMajor:minor:patch:variant:", v11, v12, 0, &stru_1E3D68DC8);
    goto LABEL_12;
  }
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scanUpToCharactersFromSet:intoString:", v4, 0);

  if ((objc_msgSend(v3, "scanInteger:", &v16) & 1) == 0)
  {
    v10 = [MLVersionInfo alloc];
    v11 = v17;
    goto LABEL_10;
  }
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scanUpToCharactersFromSet:intoString:", v5, 0);

  if ((objc_msgSend(v3, "scanInteger:", &v15) & 1) == 0)
  {
    v10 = [MLVersionInfo alloc];
    v12 = v16;
    v11 = v17;
    goto LABEL_11;
  }
  v14 = 0;
  objc_msgSend(v3, "scanUpToString:intoString:", &stru_1E3D68DC8, &v14);
  v6 = (__CFString *)v14;
  if (v6)
    v7 = v6;
  else
    v7 = &stru_1E3D68DC8;
  v8 = [MLVersionInfo alloc];
  v9 = -[MLVersionInfo initWithMajor:minor:patch:variant:](v8, "initWithMajor:minor:patch:variant:", v17, v16, v15, v7);

LABEL_12:
  return v9;
}

@end
