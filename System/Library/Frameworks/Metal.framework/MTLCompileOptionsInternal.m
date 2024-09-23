@implementation MTLCompileOptionsInternal

- (int64_t)libraryType
{
  return self->_libraryType;
}

- (int64_t)optimizationLevel
{
  return self->_optimizationLevel;
}

- (unsigned)sourceLanguage
{
  return self->_sourceLanguage;
}

- (BOOL)tracingEnabled
{
  return self->_tracingEnabled;
}

- (BOOL)preserveInvariance
{
  return self->_preserveInvariance;
}

- (id)preprocessorMacros
{
  return self->_preprocessorMacros;
}

- (unint64_t)maxTotalThreadsPerThreadgroup
{
  return self->_maxTotalThreadsPerThreadgroup;
}

- (id)libraries
{
  return self->_libraries;
}

- (unint64_t)languageVersion
{
  return self->_languageVersion;
}

- (id)installName
{
  return self->_installName;
}

- (BOOL)glBufferBindPoints
{
  return self->_glBufferBindPoints;
}

- (BOOL)fastMathEnabled
{
  return self->_mathMode == 2 && self->_mathFloatingPointFunctions == 0;
}

- (BOOL)debuggingEnabled
{
  return self->_debuggingEnabled;
}

- (BOOL)compileTimeStatisticsEnabled
{
  return self->_compileTimeStatisticsEnabled;
}

- (int64_t)compileSymbolVisibility
{
  return self->_compileSymbolVisibility;
}

- (BOOL)allowReferencingUndefinedSymbols
{
  return self->_allowReferencingUndefinedSymbols;
}

- (id)additionalCompilerArguments
{
  return self->_additionalCompilerArguments;
}

- (void)setLanguageVersion:(unint64_t)a3
{
  self->_userSetLanguageVersion = 1;
  self->_languageVersion = a3;
}

- (void)setPreprocessorMacros:(id)a3
{
  NSDictionary *preprocessorMacros;

  preprocessorMacros = self->_preprocessorMacros;
  if (preprocessorMacros != a3)
  {

    self->_preprocessorMacros = (NSDictionary *)objc_msgSend(a3, "copy");
  }
}

- (void)setAdditionalCompilerArguments:(id)a3
{
  NSString *additionalCompilerArguments;

  additionalCompilerArguments = self->_additionalCompilerArguments;
  if (additionalCompilerArguments != a3)
  {

    self->_additionalCompilerArguments = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLCompileOptionsInternal;
  -[MTLCompileOptionsInternal dealloc](&v3, sel_dealloc);
}

- (MTLCompileOptionsInternal)init
{
  MTLCompileOptionsInternal *v2;
  MTLCompileOptionsInternal *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTLCompileOptionsInternal;
  v2 = -[MTLCompileOptionsInternal init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_mathMode = 2;
    v2->_mathFloatingPointFunctions = 0;
    if (getDefaultLanguageVersion(int)::pred != -1)
      dispatch_once(&getDefaultLanguageVersion(int)::pred, &__block_literal_global_1317);
    v4 = getDefaultLanguageVersion(int)::maxAllowedMTLLanguageVersion;
    if ((unint64_t)getDefaultLanguageVersion(int)::maxAllowedMTLLanguageVersion >= 0x30002)
      v4 = 196610;
    v3->_languageVersion = v4;
    v3->_tracingEnabled = 0;
    v3->_compileTimeStatisticsEnabled = 0;
    v3->_additionalCompilerArguments = 0;
    v3->_sourceLanguage = 0;
    v3->_libraryType = 0;
    v3->_libraries = 0;
    v3->_preserveInvariance = 0;
    v3->_optimizationLevel = 0;
    v3->_compileSymbolVisibility = 0;
    v3->_allowReferencingUndefinedSymbols = 0;
    v3->_maxTotalThreadsPerThreadgroup = 0;
    v3->_enableLogging = 0;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  int v6;
  NSDictionary *preprocessorMacros;
  NSString *additionalCompilerArguments;
  int v9;
  NSString *installName;

  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    Class = object_getClass(self);
    if (Class != object_getClass(a3))
    {
LABEL_3:
      LOBYTE(v6) = 0;
      return v6;
    }
    preprocessorMacros = self->_preprocessorMacros;
    if (preprocessorMacros == *((NSDictionary **)a3 + 2)
      || (v6 = -[NSDictionary isEqual:](preprocessorMacros, "isEqual:")) != 0)
    {
      if (self->_mathMode != *((_QWORD *)a3 + 3)
        || self->_mathFloatingPointFunctions != *((_QWORD *)a3 + 4)
        || self->_debuggingEnabled != *((unsigned __int8 *)a3 + 42)
        || self->_glBufferBindPoints != *((unsigned __int8 *)a3 + 40)
        || self->_tracingEnabled != *((unsigned __int8 *)a3 + 41)
        || self->_compileTimeStatisticsEnabled != *((unsigned __int8 *)a3 + 56))
      {
        goto LABEL_3;
      }
      additionalCompilerArguments = self->_additionalCompilerArguments;
      if (additionalCompilerArguments == *((NSString **)a3 + 8)
        || (v6 = -[NSString isEqualToString:](additionalCompilerArguments, "isEqualToString:")) != 0)
      {
        if (self->_userSetLanguageVersion != *((unsigned __int8 *)a3 + 8)
          || self->_languageVersion != *((_QWORD *)a3 + 6)
          || self->_optimizationLevel != *((_QWORD *)a3 + 14)
          || self->_sourceLanguage != *((unsigned __int8 *)a3 + 72)
          || self->_libraryType != *((_QWORD *)a3 + 10))
        {
          goto LABEL_3;
        }
        v9 = MTLCompareArray(self->_libraries, *((void **)a3 + 11), 1, 0);
        LOBYTE(v6) = 0;
        if (v9)
        {
          installName = self->_installName;
          if (installName == *((NSString **)a3 + 12)
            || (v6 = -[NSString isEqualToString:](installName, "isEqualToString:")) != 0)
          {
            if (self->_preserveInvariance != *((unsigned __int8 *)a3 + 104)
              || self->_compileSymbolVisibility != *((_QWORD *)a3 + 15)
              || self->_allowReferencingUndefinedSymbols != *((unsigned __int8 *)a3 + 128)
              || self->_maxTotalThreadsPerThreadgroup != *((_QWORD *)a3 + 17))
            {
              goto LABEL_3;
            }
            LOBYTE(v6) = self->_enableLogging == *((unsigned __int8 *)a3 + 144);
          }
        }
      }
    }
  }
  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  int64_t mathMode;
  int64_t mathFloatingPointFunctions;
  int64_t libraryType;
  int64_t optimizationLevel;
  int64_t compileSymbolVisibility;
  BOOL allowReferencingUndefinedSymbols;
  _QWORD v11[3];
  BOOL debuggingEnabled;
  BOOL glBufferBindPoints;
  BOOL userSetLanguageVersion;
  unint64_t languageVersion;
  BOOL tracingEnabled;
  char v17;
  NSUInteger v18;
  unsigned __int8 sourceLanguage;
  int64_t v20;
  uint64_t v21;
  NSUInteger v22;
  BOOL preserveInvariance;
  int64_t v24;
  int64_t v25;
  BOOL v26;
  unint64_t maxTotalThreadsPerThreadgroup;
  BOOL enableLogging;

  bzero(v11, 0x88uLL);
  v3 = -[NSDictionary hash](self->_preprocessorMacros, "hash");
  mathMode = self->_mathMode;
  mathFloatingPointFunctions = self->_mathFloatingPointFunctions;
  v11[0] = v3;
  v11[1] = mathMode;
  v11[2] = mathFloatingPointFunctions;
  debuggingEnabled = self->_debuggingEnabled;
  glBufferBindPoints = self->_glBufferBindPoints;
  userSetLanguageVersion = self->_userSetLanguageVersion;
  languageVersion = self->_languageVersion;
  LOBYTE(mathFloatingPointFunctions) = self->_compileTimeStatisticsEnabled;
  tracingEnabled = self->_tracingEnabled;
  v17 = mathFloatingPointFunctions;
  v18 = -[NSString hash](self->_additionalCompilerArguments, "hash");
  libraryType = self->_libraryType;
  sourceLanguage = self->_sourceLanguage;
  v20 = libraryType;
  v21 = MTLHashArray(self->_libraries, 1, 0);
  v22 = -[NSString hash](self->_installName, "hash");
  optimizationLevel = self->_optimizationLevel;
  compileSymbolVisibility = self->_compileSymbolVisibility;
  preserveInvariance = self->_preserveInvariance;
  allowReferencingUndefinedSymbols = self->_allowReferencingUndefinedSymbols;
  v24 = optimizationLevel;
  v25 = compileSymbolVisibility;
  v26 = allowReferencingUndefinedSymbols;
  maxTotalThreadsPerThreadgroup = self->_maxTotalThreadsPerThreadgroup;
  enableLogging = self->_enableLogging;
  return _MTLHashState((int *)v11, 0x88uLL);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    *(_QWORD *)(v5 + 16) = -[NSDictionary copyWithZone:](self->_preprocessorMacros, "copyWithZone:", a3);
    *(_QWORD *)(v5 + 24) = self->_mathMode;
    *(_QWORD *)(v5 + 32) = self->_mathFloatingPointFunctions;
    *(_BYTE *)(v5 + 42) = self->_debuggingEnabled;
    *(_BYTE *)(v5 + 40) = self->_glBufferBindPoints;
    *(_BYTE *)(v5 + 8) = self->_userSetLanguageVersion;
    *(_QWORD *)(v5 + 48) = self->_languageVersion;
    *(_BYTE *)(v5 + 41) = self->_tracingEnabled;
    *(_BYTE *)(v5 + 56) = self->_compileTimeStatisticsEnabled;
    *(_QWORD *)(v5 + 64) = -[NSString copy](self->_additionalCompilerArguments, "copy");
    *(_BYTE *)(v5 + 72) = self->_sourceLanguage;
    *(_QWORD *)(v5 + 80) = self->_libraryType;
    *(_QWORD *)(v5 + 88) = -[NSArray copy](self->_libraries, "copy");
    *(_QWORD *)(v5 + 96) = -[NSString copy](self->_installName, "copy");
    *(_BYTE *)(v5 + 104) = self->_preserveInvariance;
    *(_QWORD *)(v5 + 112) = self->_optimizationLevel;
    *(_QWORD *)(v5 + 120) = self->_compileSymbolVisibility;
    *(_BYTE *)(v5 + 128) = self->_allowReferencingUndefinedSymbols;
    *(_QWORD *)(v5 + 136) = self->_maxTotalThreadsPerThreadgroup;
    *(_BYTE *)(v5 + 144) = self->_enableLogging;
  }
  return (id)v5;
}

- (void)setLibraries:(id)a3
{
  NSArray *libraries;

  libraries = self->_libraries;
  if (libraries != a3)
  {

    self->_libraries = (NSArray *)objc_msgSend(a3, "copy");
  }
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  NSDictionary *preprocessorMacros;
  NSArray *v8;
  NSArray *v9;
  uint64_t v10;
  __CFString *v11;
  unsigned int v12;
  void *v14;
  id v15;
  const __CFString *v16;
  unint64_t mathMode;
  const __CFString *v18;
  int64_t mathFloatingPointFunctions;
  const __CFString *v20;
  BOOL v21;
  const __CFString *v22;
  uint64_t v23;
  int64_t optimizationLevel;
  const __CFString *v25;
  const __CFString *v26;
  int64_t libraryType;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *installName;
  const __CFString *v31;
  unsigned int languageVersion;
  objc_super v34;
  _QWORD v35[36];
  _QWORD v36[6];

  v36[4] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 8, CFSTR(" "), 0);
  languageVersion = self->_languageVersion;
  preprocessorMacros = self->_preprocessorMacros;
  if (preprocessorMacros
    && (v8 = -[NSDictionary allKeys](preprocessorMacros, "allKeys"),
        v9 = -[NSDictionary allValues](self->_preprocessorMacros, "allValues"),
        -[NSDictionary count](self->_preprocessorMacros, "count")))
  {
    v10 = 0;
    v11 = &stru_1E0FE5DC8;
    v12 = 1;
    do
    {
      v36[0] = v6;
      v36[1] = -[NSArray objectAtIndexedSubscript:](v8, "objectAtIndexedSubscript:", v10);
      v36[2] = CFSTR("=");
      v36[3] = -[NSArray objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", v10);
      v11 = (__CFString *)-[__CFString stringByAppendingString:](v11, "stringByAppendingString:", objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4), "componentsJoinedByString:", CFSTR(" ")));
      v10 = v12;
    }
    while (-[NSDictionary count](self->_preprocessorMacros, "count") > v12++);
  }
  else
  {
    v11 = &stru_1E0FE5DC8;
  }
  v14 = (void *)MEMORY[0x1E0CB3940];
  v34.receiver = self;
  v34.super_class = (Class)MTLCompileOptionsInternal;
  v15 = -[MTLCompileOptionsInternal description](&v34, sel_description);
  v35[0] = v5;
  v35[1] = CFSTR("preprocessorMacros:");
  if (v11)
    v16 = v11;
  else
    v16 = CFSTR("<null>");
  v35[2] = v16;
  v35[3] = v5;
  v35[4] = CFSTR("mathMode =");
  mathMode = self->_mathMode;
  v18 = CFSTR("<unknown>");
  if (mathMode <= 2)
    v18 = (const __CFString *)*((_QWORD *)&off_1E0FE4A40 + mathMode);
  v35[5] = v18;
  v35[6] = v5;
  mathFloatingPointFunctions = self->_mathFloatingPointFunctions;
  v20 = CFSTR("MTLMathFloatingPointFunctionsFast");
  if (mathFloatingPointFunctions)
    v20 = CFSTR("<unknown>");
  v21 = mathFloatingPointFunctions == 1;
  v22 = CFSTR("MTLMathFloatingPointFunctionsPrecise");
  if (!v21)
    v22 = v20;
  v35[7] = CFSTR("mathFloatingPointFunctions =");
  v35[8] = v22;
  v35[9] = v5;
  v35[10] = CFSTR("preserveInvariance =");
  v23 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_preserveInvariance);
  optimizationLevel = self->_optimizationLevel;
  v35[11] = v23;
  v35[12] = v5;
  v25 = CFSTR("MTLLibraryOptimizationLevelSize");
  if (optimizationLevel != 1)
    v25 = CFSTR("<unknown>");
  v21 = optimizationLevel == 0;
  v26 = CFSTR("MTLLibraryOptimizationLevelDefault");
  if (!v21)
    v26 = v25;
  v35[13] = CFSTR("optimizationLevel =");
  v35[14] = v26;
  libraryType = self->_libraryType;
  v35[15] = v5;
  v35[16] = CFSTR("libraryType =");
  v28 = CFSTR("MTLLibraryTypeDynamic");
  if (libraryType != 1)
    v28 = CFSTR("<unknown>");
  if (libraryType)
    v29 = v28;
  else
    v29 = CFSTR("MTLLibraryTypeExecutable");
  v35[17] = v29;
  v35[18] = v5;
  installName = (const __CFString *)self->_installName;
  if (!installName)
    installName = CFSTR("<null>");
  v35[19] = CFSTR("installName =");
  v35[20] = installName;
  v35[21] = v5;
  v35[22] = CFSTR("compileSymbolVisibility = ");
  v35[23] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_compileSymbolVisibility);
  v35[24] = v5;
  v35[25] = CFSTR("allowReferencingUndefinedSymbols = ");
  v35[26] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_allowReferencingUndefinedSymbols);
  v35[27] = v5;
  v35[28] = CFSTR("maxTotalThreadsPerThreadgroup = ");
  v35[29] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maxTotalThreadsPerThreadgroup);
  v35[30] = v5;
  v35[31] = CFSTR("enableLogging =");
  v35[32] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enableLogging);
  v35[33] = v5;
  v35[34] = CFSTR("languageVersion =");
  if (self->_userSetLanguageVersion)
    v31 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u:%u"), HIWORD(languageVersion), (unsigned __int16)languageVersion);
  else
    v31 = CFSTR("default");
  v35[35] = v31;
  return (id)objc_msgSend(v14, "stringWithFormat:", CFSTR("%@%@"), v15, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 36), "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  return -[MTLCompileOptionsInternal formattedDescription:](self, "formattedDescription:", 0);
}

- (id)exportDictionary
{
  id v3;
  id v4;
  const __CFString *v5;
  const __CFString *v6;
  id v7;
  id v8;
  const __CFString *v9;
  const __CFString *v10;
  _QWORD v12[20];
  _QWORD v13[21];

  v13[20] = *MEMORY[0x1E0C80C00];
  v12[0] = CFSTR("preprocessorMacros");
  v3 = -[MTLCompileOptionsInternal preprocessorMacros](self, "preprocessorMacros");
  v4 = (id)MEMORY[0x1E0C9AA70];
  if (v3)
    v4 = v3;
  v13[0] = v4;
  v12[1] = CFSTR("fastMathEnabled");
  v13[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MTLCompileOptionsInternal fastMathEnabled](self, "fastMathEnabled"));
  v12[2] = CFSTR("mathMode");
  v13[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MTLCompileOptionsInternal mathMode](self, "mathMode"));
  v12[3] = CFSTR("mathFloatingPointFunctions");
  v13[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MTLCompileOptionsInternal mathFloatingPointFunctions](self, "mathFloatingPointFunctions"));
  v12[4] = CFSTR("languageVersion");
  v13[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MTLCompileOptionsInternal languageVersion](self, "languageVersion"));
  v12[5] = CFSTR("tracingEnabled");
  v13[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MTLCompileOptionsInternal tracingEnabled](self, "tracingEnabled"));
  v12[6] = CFSTR("glBufferBindPoints");
  v13[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MTLCompileOptionsInternal glBufferBindPoints](self, "glBufferBindPoints"));
  v12[7] = CFSTR("debuggingEnabled");
  v13[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MTLCompileOptionsInternal debuggingEnabled](self, "debuggingEnabled"));
  v12[8] = CFSTR("compileTimeStatisticsEnabled");
  v13[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MTLCompileOptionsInternal compileTimeStatisticsEnabled](self, "compileTimeStatisticsEnabled"));
  v12[9] = CFSTR("additionalCompilerArguments");
  v5 = -[MTLCompileOptionsInternal additionalCompilerArguments](self, "additionalCompilerArguments");
  if (v5)
    v6 = v5;
  else
    v6 = &stru_1E0FE5DC8;
  v13[9] = v6;
  v12[10] = CFSTR("sourceLanguage");
  v13[10] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MTLCompileOptionsInternal sourceLanguage](self, "sourceLanguage"));
  v12[11] = CFSTR("type");
  v13[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MTLCompileOptionsInternal libraryType](self, "libraryType"));
  v12[12] = CFSTR("libraries");
  v7 = -[MTLCompileOptionsInternal libraries](self, "libraries");
  v8 = (id)MEMORY[0x1E0C9AA60];
  if (v7)
    v8 = v7;
  v13[12] = v8;
  v12[13] = CFSTR("installName");
  v9 = -[MTLCompileOptionsInternal installName](self, "installName");
  if (v9)
    v10 = v9;
  else
    v10 = &stru_1E0FE5DC8;
  v13[13] = v10;
  v12[14] = CFSTR("preserveInvariance");
  v13[14] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MTLCompileOptionsInternal preserveInvariance](self, "preserveInvariance"));
  v12[15] = CFSTR("optimizationLevel");
  v13[15] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MTLCompileOptionsInternal optimizationLevel](self, "optimizationLevel"));
  v12[16] = CFSTR("compileSymbolVisibility");
  v13[16] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MTLCompileOptionsInternal compileSymbolVisibility](self, "compileSymbolVisibility"));
  v12[17] = CFSTR("allowReferencingUndefinedSymbols");
  v13[17] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MTLCompileOptionsInternal allowReferencingUndefinedSymbols](self, "allowReferencingUndefinedSymbols"));
  v12[18] = CFSTR("maxTotalThreadsPerThreadgroup");
  v13[18] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[MTLCompileOptionsInternal maxTotalThreadsPerThreadgroup](self, "maxTotalThreadsPerThreadgroup"));
  v12[19] = CFSTR("enableLogging");
  v13[19] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MTLCompileOptionsInternal enableLogging](self, "enableLogging"));
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 20);
}

- (void)importDictionary:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v5 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("preprocessorMacros"));
  if (v5)
    -[MTLCompileOptionsInternal setPreprocessorMacros:](self, "setPreprocessorMacros:", v5);
  v6 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("fastMathEnabled"));
  if (v6)
    -[MTLCompileOptionsInternal setFastMathEnabled:](self, "setFastMathEnabled:", objc_msgSend(v6, "BOOLValue"));
  v7 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("mathMode"));
  if (v7)
    -[MTLCompileOptionsInternal setMathMode:](self, "setMathMode:", objc_msgSend(v7, "unsignedLongValue"));
  v8 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("mathFloatingPointFunctions"));
  if (v8)
    -[MTLCompileOptionsInternal setMathFloatingPointFunctions:](self, "setMathFloatingPointFunctions:", objc_msgSend(v8, "unsignedLongValue"));
  v9 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("languageVersion"));
  if (v9)
    -[MTLCompileOptionsInternal setLanguageVersion:](self, "setLanguageVersion:", objc_msgSend(v9, "unsignedLongValue"));
  v10 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("tracingEnabled"));
  if (v10)
    -[MTLCompileOptionsInternal setTracingEnabled:](self, "setTracingEnabled:", objc_msgSend(v10, "BOOLValue"));
  v11 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("glBufferBindPoints"));
  if (v11)
    -[MTLCompileOptionsInternal setGlBufferBindPoints:](self, "setGlBufferBindPoints:", objc_msgSend(v11, "BOOLValue"));
  v12 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("debuggingEnabled"));
  if (v12)
    -[MTLCompileOptionsInternal setDebuggingEnabled:](self, "setDebuggingEnabled:", objc_msgSend(v12, "BOOLValue"));
  v13 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("compileTimeStatisticsEnabled"));
  if (v13)
    -[MTLCompileOptionsInternal setCompileTimeStatisticsEnabled:](self, "setCompileTimeStatisticsEnabled:", objc_msgSend(v13, "BOOLValue"));
  v14 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("additionalCompilerArguments"));
  if (v14)
    -[MTLCompileOptionsInternal setAdditionalCompilerArguments:](self, "setAdditionalCompilerArguments:", v14);
  v15 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("sourceLanguage"));
  if (v15)
    -[MTLCompileOptionsInternal setSourceLanguage:](self, "setSourceLanguage:", objc_msgSend(v15, "unsignedLongValue"));
  v16 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("libraryType"));
  if (v16)
    -[MTLCompileOptionsInternal setLibraryType:](self, "setLibraryType:", objc_msgSend(v16, "unsignedLongValue"));
  v17 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("libraries"));
  if (v17)
    -[MTLCompileOptionsInternal setLibraries:](self, "setLibraries:", v17);
  v18 = objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("installName"));
  if (v18)
    -[MTLCompileOptionsInternal setInstallName:](self, "setInstallName:", v18);
  v19 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("preserveInvariance"));
  if (v19)
    -[MTLCompileOptionsInternal setPreserveInvariance:](self, "setPreserveInvariance:", objc_msgSend(v19, "BOOLValue"));
  v20 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("optimizationLevel"));
  if (v20)
    -[MTLCompileOptionsInternal setOptimizationLevel:](self, "setOptimizationLevel:", objc_msgSend(v20, "unsignedLongValue"));
  v21 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("compileSymbolVisibility"));
  if (v21)
    -[MTLCompileOptionsInternal setCompileSymbolVisibility:](self, "setCompileSymbolVisibility:", objc_msgSend(v21, "unsignedLongValue"));
  v22 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("allowReferencingUndefinedSymbols"));
  if (v22)
    -[MTLCompileOptionsInternal setAllowReferencingUndefinedSymbols:](self, "setAllowReferencingUndefinedSymbols:", objc_msgSend(v22, "BOOLValue"));
  v23 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("maxTotalThreadsPerThreadgroup"));
  if (v23)
    -[MTLCompileOptionsInternal setMaxTotalThreadsPerThreadgroup:](self, "setMaxTotalThreadsPerThreadgroup:", objc_msgSend(v23, "unsignedLongValue"));
  v24 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("enableLogging"));
  if (v24)
    -[MTLCompileOptionsInternal setEnableLogging:](self, "setEnableLogging:", objc_msgSend(v24, "BOOLValue"));
}

- (void)setFastMathEnabled:(BOOL)a3
{
  int64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  self->_mathMode = v3;
  self->_mathFloatingPointFunctions = !a3;
}

- (int64_t)mathMode
{
  return self->_mathMode;
}

- (void)setMathMode:(int64_t)a3
{
  self->_mathMode = a3;
}

- (int64_t)mathFloatingPointFunctions
{
  return self->_mathFloatingPointFunctions;
}

- (void)setMathFloatingPointFunctions:(int64_t)a3
{
  self->_mathFloatingPointFunctions = a3;
}

- (void)setDebuggingEnabled:(BOOL)a3
{
  self->_debuggingEnabled = a3;
}

- (void)setGlBufferBindPoints:(BOOL)a3
{
  self->_glBufferBindPoints = a3;
}

- (void)setTracingEnabled:(BOOL)a3
{
  self->_tracingEnabled = a3;
}

- (void)setCompileTimeStatisticsEnabled:(BOOL)a3
{
  self->_compileTimeStatisticsEnabled = a3;
}

- (void)setSourceLanguage:(unsigned __int8)a3
{
  self->_sourceLanguage = a3;
}

- (void)setLibraryType:(int64_t)a3
{
  self->_libraryType = a3;
}

- (void)setInstallName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setPreserveInvariance:(BOOL)a3
{
  self->_preserveInvariance = a3;
}

- (void)setOptimizationLevel:(int64_t)a3
{
  self->_optimizationLevel = a3;
}

- (void)setCompileSymbolVisibility:(int64_t)a3
{
  self->_compileSymbolVisibility = a3;
}

- (void)setAllowReferencingUndefinedSymbols:(BOOL)a3
{
  self->_allowReferencingUndefinedSymbols = a3;
}

- (void)setMaxTotalThreadsPerThreadgroup:(unint64_t)a3
{
  self->_maxTotalThreadsPerThreadgroup = a3;
}

- (BOOL)enableLogging
{
  return self->_enableLogging;
}

- (void)setEnableLogging:(BOOL)a3
{
  self->_enableLogging = a3;
}

@end
