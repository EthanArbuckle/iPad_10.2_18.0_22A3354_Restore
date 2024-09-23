@implementation FFConfiguration

+ (FFConfiguration)shared
{
  if (ffConfigOnce != -1)
    _os_once();
  return (FFConfiguration *)(id)instance;
}

- (id)initPrivate
{
  FFConfiguration *v2;
  FFConfiguration *v3;
  char **v4;
  NSArray *v5;
  _QWORD *v6;
  void *v7;
  NSArray *searchPaths;
  NSArray *v10;
  FFDefaultFileWriter *v11;
  FFFileWriter *filewriter;
  FFDefaultFileReader *v13;
  FFFileReader *filereader;
  FFDefaultParseErrorReporter *v15;
  FFParseErrorReporter *parseerrorreporter;
  FFPlistParser *v17;
  FFPlistParser *plistparser;
  FFDefaultSafeModeChecker *v19;
  FFSafeModeChecker *safemodechecker;
  FFDefaultBuildVersionGetter *v21;
  FFBuildVersionGetter *buildVersionGetter;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)FFConfiguration;
  v2 = -[FFConfiguration init](&v24, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->lock._os_unfair_lock_opaque = 0;
    -[FFConfiguration clearCachedData](v2, "clearCachedData");
    v4 = _os_feature_search_paths();
    v5 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (*v4)
    {
      v6 = v4 + 1;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray addObject:](v5, "addObject:", v7);

      }
      while (*v6++);
    }
    searchPaths = v3->searchPaths;
    v3->searchPaths = v5;
    v10 = v5;

    v11 = objc_alloc_init(FFDefaultFileWriter);
    filewriter = v3->_filewriter;
    v3->_filewriter = (FFFileWriter *)v11;

    v13 = objc_alloc_init(FFDefaultFileReader);
    filereader = v3->_filereader;
    v3->_filereader = (FFFileReader *)v13;

    v15 = objc_alloc_init(FFDefaultParseErrorReporter);
    parseerrorreporter = v3->_parseerrorreporter;
    v3->_parseerrorreporter = (FFParseErrorReporter *)v15;

    v17 = objc_alloc_init(FFPlistParser);
    plistparser = v3->_plistparser;
    v3->_plistparser = v17;

    v19 = objc_alloc_init(FFDefaultSafeModeChecker);
    safemodechecker = v3->_safemodechecker;
    v3->_safemodechecker = (FFSafeModeChecker *)v19;

    v21 = objc_alloc_init(FFDefaultBuildVersionGetter);
    buildVersionGetter = v3->_buildVersionGetter;
    v3->_buildVersionGetter = (FFBuildVersionGetter *)v21;

  }
  return v3;
}

- (id)initPrivateForBootTask
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  FFImmutableOnlyFileReader *v6;
  void *v7;

  v2 = -[FFConfiguration initPrivate](self, "initPrivate");
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "safemodechecker");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isItSafeMode");

    if (v5)
    {
      v6 = objc_alloc_init(FFImmutableOnlyFileReader);
      objc_msgSend(v3, "filereader");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[FFImmutableOnlyFileReader setUnderlying:](v6, "setUnderlying:", v7);

      objc_msgSend(v3, "setFilereader:", v6);
    }
  }
  return v3;
}

+ (id)_configurationForTestingWithFileReader:(id)a3 fileWriter:(id)a4 buildVersionGetter:(id)a5 parseErrorReporter:(id)a6 safeModeChecker:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = -[FFConfiguration initPrivate]([FFConfiguration alloc], "initPrivate");
  v17 = v16;
  if (v16)
  {
    if (v11)
      objc_msgSend(v16, "setFilereader:", v11);
    if (v12)
      objc_msgSend(v17, "setFilewriter:", v12);
    if (v13)
      objc_msgSend(v17, "setBuildVersionGetter:", v13);
    if (v14)
      objc_msgSend(v17, "setParseerrorreporter:", v14);
    if (v15)
      objc_msgSend(v17, "setSafemodechecker:", v15);
  }

  return v17;
}

+ (id)configurationForTestingWithFileReader:(id)a3 parseErrorReporter:(id)a4 safeModeChecker:(id)a5
{
  return (id)objc_msgSend(a1, "_configurationForTestingWithFileReader:fileWriter:buildVersionGetter:parseErrorReporter:safeModeChecker:", a3, 0, 0, a4, a5);
}

+ (id)configurationForTestingWithFileReader:(id)a3 parseErrorReporter:(id)a4
{
  return (id)objc_msgSend(a1, "_configurationForTestingWithFileReader:fileWriter:buildVersionGetter:parseErrorReporter:safeModeChecker:", a3, 0, 0, a4, 0);
}

+ (id)configurationForTestingWithFileReader:(id)a3 fileWriter:(id)a4
{
  return (id)objc_msgSend(a1, "_configurationForTestingWithFileReader:fileWriter:buildVersionGetter:parseErrorReporter:safeModeChecker:", a3, a4, 0, 0, 0);
}

+ (id)configurationForTestingWithFileReader:(id)a3 fileWriter:(id)a4 buildVersionGetter:(id)a5
{
  return (id)objc_msgSend(a1, "_configurationForTestingWithFileReader:fileWriter:buildVersionGetter:parseErrorReporter:safeModeChecker:", a3, a4, a5, 0, 0);
}

+ (id)configurationForTestingWithFileReader:(id)a3
{
  return (id)objc_msgSend(a1, "_configurationForTestingWithFileReader:fileWriter:buildVersionGetter:parseErrorReporter:safeModeChecker:", a3, 0, 0, 0, 0);
}

+ (id)configurationForTestingWithFileWriter:(id)a3
{
  return (id)objc_msgSend(a1, "_configurationForTestingWithFileReader:fileWriter:buildVersionGetter:parseErrorReporter:safeModeChecker:", 0, a3, 0, 0, 0);
}

- (void)clearCachedData
{
  uint64_t v3;
  NSMutableDictionary *(*configByLevelIndex)[8];
  char v5;
  uint64_t v6;
  char v7;
  NSMutableDictionary **v8;
  NSMutableDictionary *v9;
  uint64_t v10;
  NSMutableDictionary **metaByLevelIndex;
  NSMutableDictionary *v12;
  uint64_t v13;
  NSMutableSet **disclosuresByLevelIndex;
  NSMutableSet *v15;

  v3 = 0;
  configByLevelIndex = self->configByLevelIndex;
  v5 = 1;
  do
  {
    v6 = 0;
    v7 = v5;
    v8 = configByLevelIndex[v3];
    do
    {
      v9 = v8[v6];
      v8[v6] = 0;

      ++v6;
    }
    while (v6 != 8);
    v5 = 0;
    v3 = 1;
  }
  while ((v7 & 1) != 0);
  v10 = 0;
  metaByLevelIndex = self->metaByLevelIndex;
  do
  {
    v12 = metaByLevelIndex[v10];
    metaByLevelIndex[v10] = 0;

    ++v10;
  }
  while (v10 != 8);
  -[NSMutableSet removeAllObjects](self->_domains, "removeAllObjects");
  v13 = 0;
  disclosuresByLevelIndex = self->disclosuresByLevelIndex;
  do
  {
    v15 = disclosuresByLevelIndex[v13];
    disclosuresByLevelIndex[v13] = 0;

    ++v13;
  }
  while (v13 != 8);
}

- (void)validateName:(id)a3
{
  id v4;

  v4 = a3;
  if (!-[FFConfiguration isValidName:](self, "isValidName:"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("FFInvalidName"), CFSTR("Invalid domain or feature name: %@"), v4);

}

- (id)fileURLForDomain:(id)a3 pathIndex:(int)a4
{
  NSArray *searchPaths;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  searchPaths = self->searchPaths;
  v5 = a4;
  v6 = a3;
  -[NSArray objectAtIndexedSubscript:](searchPaths, "objectAtIndexedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR(".plist"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("/Domain/"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)fileURLForLevelIndex:(unint64_t)a3 pathIndex:(int)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[NSArray objectAtIndexedSubscript:](self->searchPaths, "objectAtIndexedSubscript:", a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (a3 > 7 || ((1 << a3) & 0x92) == 0)
    -[FFConfiguration fileURLForLevelIndex:pathIndex:].cold.1(a3);
  v6 = (void *)v5;
  if (((0x6DuLL >> a3) & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v7 = fileNamesByLevelIndex[a3];
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)disclosureFileURLForLevelIndex:(unint64_t)a3 pathIndex:(int)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[NSArray objectAtIndexedSubscript:](self->searchPaths, "objectAtIndexedSubscript:", a4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (a3 > 7 || ((1 << a3) & 0x92) == 0)
    -[FFConfiguration disclosureFileURLForLevelIndex:pathIndex:].cold.1(a3);
  v6 = (void *)v5;
  if (((0x6DuLL >> a3) & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v7 = disclosureFileNamesByLevelIndex[a3];
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)internalDisclosureFileURLForLevelIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", _os_feature_internal_search_path());
  v5 = 0;
  if (a3 != 7 && a3 != 4)
  {
    if (a3 != 1)
      -[FFConfiguration disclosureFileURLForLevelIndex:pathIndex:].cold.1(a3);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", 0x1E987FFB8, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)featureSetsFileURLForLevelIndex:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[NSArray objectAtIndexedSubscript:](self->searchPaths, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 != 5 && a3 != 2)
    -[FFConfiguration featureSetsFileURLForLevelIndex:].cold.1(a3);
  v5 = featureSetsFileNamesByLevelIndex[a3];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)subscriptionsFileURLForLevelIndex:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[NSArray objectAtIndexedSubscript:](self->searchPaths, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 != 6 && a3 != 3)
    -[FFConfiguration subscriptionsFileURLForLevelIndex:].cold.1(a3);
  v5 = subscriptionsFileNamesByLevelIndex[a3];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)makeFeatureDictionaryFrom:(id)a3 forDomain:(id)a4 atDomainLevel:(BOOL)a5 reportableFilename:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  void *v23;
  BOOL v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  void *v34;
  FFFeatureAttribute *v35;
  FFFeatureState *v36;
  const __CFString *v37;
  id v39;
  uint64_t v40;
  FFConfiguration *v41;
  id v42;
  id v43;
  uint64_t v44;
  id v45;
  _BOOL4 v46;
  _BOOL4 v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;

  v46 = a5;
  v66 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v43 = a4;
  v39 = a6;
  v42 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0x1E0C99000uLL;
    v14 = *(_QWORD *)v61;
    v15 = CFSTR("DevelopmentPhase");
    v40 = *(_QWORD *)v61;
    v41 = self;
    v45 = v10;
    do
    {
      v16 = 0;
      v44 = v12;
      do
      {
        if (*(_QWORD *)v61 != v14)
          objc_enumerationMutation(v10);
        v17 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v16);
        v18 = (void *)MEMORY[0x1D82678C8]();
        if (-[FFConfiguration isValidName:](self, "isValidName:", v17))
        {
          v54 = v17;
          objc_msgSend(v10, "objectForKeyedSubscript:", v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Enabled"));
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            if (v46)
            {
              v20 = v13;
              objc_msgSend(v19, "objectForKeyedSubscript:", v15);
              v21 = objc_claimAutoreleasedReturnValue();
              v22 = v15;
              v23 = (void *)v21;
              if (v21)
                v24 = v55 == 0;
              else
                v24 = 1;
              if (!v24)
              {
                v37 = v22;
                -[FFConfiguration reportParseError:severity:whileParsingKey:inContext:inFile:](self, "reportParseError:severity:whileParsingKey:inContext:inFile:", CFSTR("A flag cannot have both Enabled and DevelopmentPhase keys"), FFParseErrorContextSeverityError);
                goto LABEL_28;
              }
              v37 = v22;
              v53 = (void *)v21;
            }
            else
            {
              v20 = v13;
              v37 = v15;
              v53 = 0;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v51 = v18;
              v52 = v16;
              v47 = objc_msgSend(v55, "intValue") != 0;
              goto LABEL_20;
            }
            objc_opt_class();
            v23 = v53;
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v51 = v18;
              v52 = v16;
              v47 = -[FFConfiguration phaseShouldBeEnabledByDefault:](self, "phaseShouldBeEnabledByDefault:", v53);
LABEL_20:
              objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("DisclosureRequired"));
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Attributes"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = v19;
              objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("BuildVersion"));
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v56 = 0u;
              v57 = 0u;
              v58 = 0u;
              v59 = 0u;
              v27 = v25;
              v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
              if (v28)
              {
                v29 = v28;
                v30 = *(_QWORD *)v57;
                do
                {
                  for (i = 0; i != v29; ++i)
                  {
                    if (*(_QWORD *)v57 != v30)
                      objc_enumerationMutation(v27);
                    v32 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
                    v33 = (void *)MEMORY[0x1D82678C8]();
                    objc_msgSend(v27, "objectForKeyedSubscript:", v32);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    v35 = -[FFFeatureAttribute initWithName:value:]([FFFeatureAttribute alloc], "initWithName:value:", v32, v34);
                    objc_msgSend(v26, "setObject:forKeyedSubscript:", v35, v32);

                    objc_autoreleasePoolPop(v33);
                  }
                  v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
                }
                while (v29);
              }

              v36 = -[FFFeatureState initWithDomain:feature:value:phase:disclosureRequired:attributes:buildVersion:]([FFFeatureState alloc], "initWithDomain:feature:value:phase:disclosureRequired:attributes:buildVersion:", v43, v54, v47, v53, v49, v26, v48);
              objc_msgSend(v42, "setObject:forKeyedSubscript:", v36, v54);

              v14 = v40;
              self = v41;
              v20 = 0x1E0C99000;
              v12 = v44;
              v37 = CFSTR("DevelopmentPhase");
              v23 = v53;
              v18 = v51;
              v16 = v52;
              v19 = v50;
            }
LABEL_28:

            v15 = v37;
            v13 = v20;
            v10 = v45;
          }

        }
        objc_autoreleasePoolPop(v18);
        ++v16;
      }
      while (v16 != v12);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
    }
    while (v12);
  }

  return v42;
}

- (void)recalculateFeatureSetEffectsAt:(unint64_t)a3
{
  Class *v5;
  Class v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  objc_class *obj;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->lock);
  if (a3 != 2 && a3 != 5)
    -[FFConfiguration recalculateFeatureSetEffectsAt:].cold.1(a3);
  v5 = &self->super.isa + a3;
  v6 = v5[12];
  v5[12] = 0;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v5[44];
  v20 = -[objc_class countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKeyedSubscript:](self->definedFeatureSets, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          v23 = 0u;
          v24 = 0u;
          v21 = 0u;
          v22 = 0u;
          objc_msgSend(v8, "features");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v22;
            do
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v22 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
                objc_msgSend(v15, "featureName");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "domainName");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                -[FFConfiguration setValue:feature:domain:levelIndex:](self, "setValue:feature:domain:levelIndex:", 1, v16, v17, a3);

              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            }
            while (v12);
          }

        }
      }
      v20 = -[objc_class countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v20);
  }

}

- (void)recalculateSubscriptionEffectsAt:(unint64_t)a3
{
  Class *v5;
  Class v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  id obj;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->lock);
  if (a3 != 3 && a3 != 6)
    -[FFConfiguration recalculateFeatureSetEffectsAt:].cold.1(a3);
  v5 = &self->super.isa + a3;
  v6 = v5[12];
  v5[12] = 0;

  v7 = (void *)-[NSMutableSet copy](self->_domains, "copy");
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v7;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v22)
  {
    v21 = *(_QWORD *)v35;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v35 != v21)
          objc_enumerationMutation(obj);
        v23 = v8;
        v9 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v8);
        -[FFConfiguration featuresForDomainAlreadyLocked:](self, "featuresForDomainAlreadyLocked:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v24 = v10;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
        if (v11)
        {
          v12 = v11;
          v25 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v31 != v25)
                objc_enumerationMutation(v24);
              v14 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
              v26 = 0u;
              v27 = 0u;
              v28 = 0u;
              v29 = 0u;
              v15 = self->subscriptionsByLevelIndex[a3];
              v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
              if (v16)
              {
                v17 = v16;
                v18 = *(_QWORD *)v27;
                do
                {
                  for (j = 0; j != v17; ++j)
                  {
                    if (*(_QWORD *)v27 != v18)
                      objc_enumerationMutation(v15);
                    if (objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "matchesFeature:inDomain:inAlreadyLockedConfiguration:", v14, v9, self))-[FFConfiguration setValue:feature:domain:levelIndex:](self, "setValue:feature:domain:levelIndex:", 1, v14, v9, a3);
                  }
                  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
                }
                while (v17);
              }

            }
            v12 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
          }
          while (v12);
        }

        v8 = v23 + 1;
      }
      while (v23 + 1 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v22);
  }

}

- (void)reportParseError:(id)a3 severity:(id)a4 whileParsingKey:(id)a5 inContext:(id)a6 inFile:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  v20[0] = FFParseErrorMessageKey;
  v20[1] = FFParseErrorContextKeyKey;
  v21[0] = a3;
  v21[1] = a5;
  v20[2] = FFParseErrorContextOtherKey;
  v20[3] = FFParseErrorContextFilenameKey;
  v21[2] = a6;
  v21[3] = a7;
  v20[4] = FFParseErrorContextSeverityKey;
  v21[4] = a4;
  v12 = (void *)MEMORY[0x1E0C99D80];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[FFConfiguration parseerrorreporter](self, "parseerrorreporter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "reportError:", v18);

}

- (void)loadFeatureSetDataForLevelIndex:(unint64_t)a3
{
  unint64_t v3;
  FFConfiguration *v4;
  NSMutableSet **enabledFeatureSetsByLevelIndex;
  NSMutableSet *v6;
  NSMutableSet *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  FFFeatureSetIdentifier *v32;
  NSMutableSet **v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  FFConfiguration *v44;
  NSMutableDictionary **enabledFeatureSetsAtLevelIndexByGroup;
  unint64_t v46;
  id v47;
  void *v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v3 = a3;
  v4 = self;
  v60 = *MEMORY[0x1E0C80C00];
  if (a3 != 2 && a3 != 5)
    abort();
  enabledFeatureSetsByLevelIndex = self->enabledFeatureSetsByLevelIndex;
  if (!self->enabledFeatureSetsByLevelIndex[a3])
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = enabledFeatureSetsByLevelIndex[v3];
    enabledFeatureSetsByLevelIndex[v3] = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = v4->enabledFeatureSetsAtLevelIndexByGroup[v3];
    v4->enabledFeatureSetsAtLevelIndexByGroup[v3] = v8;

    -[FFConfiguration featureSetsFileURLForLevelIndex:](v4, "featureSetsFileURLForLevelIndex:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[FFConfiguration filereader](v4, "filereader");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v10;
      v13 = v11;
      v38 = v12;
      objc_msgSend(v11, "dictionaryWithContentsOfURL:error:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v37 = v14;
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("TentpoleFeatureSets"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          enabledFeatureSetsAtLevelIndexByGroup = v4->enabledFeatureSetsAtLevelIndexByGroup;
          v46 = v3;
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          v16 = v15;
          v17 = v15;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v55;
            v44 = v4;
            v40 = v17;
            v41 = v16;
            v39 = *(_QWORD *)v55;
            do
            {
              v21 = 0;
              v42 = v19;
              do
              {
                if (*(_QWORD *)v55 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v21);
                if (-[FFConfiguration isValidName:](v4, "isValidName:", v22))
                {
                  objc_msgSend(v17, "objectForKeyedSubscript:", v22);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v49 = v22;
                    v43 = v21;
                    v52 = 0u;
                    v53 = 0u;
                    v50 = 0u;
                    v51 = 0u;
                    v24 = v23;
                    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
                    v26 = v23;
                    if (v25)
                    {
                      v27 = v25;
                      v28 = *(_QWORD *)v51;
                      v47 = v24;
                      v48 = v23;
                      do
                      {
                        for (i = 0; i != v27; ++i)
                        {
                          if (*(_QWORD *)v51 != v28)
                            objc_enumerationMutation(v24);
                          v30 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
                          if (-[FFConfiguration isValidName:](v4, "isValidName:", v30))
                          {
                            objc_msgSend(v24, "objectForKeyedSubscript:", v30);
                            v31 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v32 = -[FFFeatureSetIdentifier initWithGroup:set:]([FFFeatureSetIdentifier alloc], "initWithGroup:set:", v49, v30);
                              v33 = enabledFeatureSetsByLevelIndex;
                              -[NSMutableSet addObject:](enabledFeatureSetsByLevelIndex[v46], "addObject:", v32);
                              -[NSMutableDictionary objectForKeyedSubscript:](enabledFeatureSetsAtLevelIndexByGroup[v46], "objectForKeyedSubscript:", v49);
                              v34 = (void *)objc_claimAutoreleasedReturnValue();

                              if (!v34)
                              {
                                v35 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                                -[NSMutableDictionary setObject:forKeyedSubscript:](enabledFeatureSetsAtLevelIndexByGroup[v46], "setObject:forKeyedSubscript:", v35, v49);

                              }
                              -[NSMutableDictionary objectForKeyedSubscript:](enabledFeatureSetsAtLevelIndexByGroup[v46], "objectForKeyedSubscript:", v49);
                              v36 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v36, "addObject:", v32);

                              enabledFeatureSetsByLevelIndex = v33;
                              v4 = v44;
                              v24 = v47;
                              v26 = v48;
                            }

                          }
                        }
                        v27 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
                      }
                      while (v27);
                    }

                    v23 = v26;
                    v17 = v40;
                    v16 = v41;
                    v20 = v39;
                    v19 = v42;
                    v21 = v43;
                  }

                }
                ++v21;
              }
              while (v21 != v19);
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
            }
            while (v19);
          }

          v3 = v46;
          v15 = v16;
        }

        v14 = v37;
      }

      v10 = v38;
    }
    -[FFConfiguration recalculateFeatureSetEffectsAt:](v4, "recalculateFeatureSetEffectsAt:", v3);

  }
}

- (void)removeAllFeatureSetDataAtLevelIndex:(unint64_t)a3
{
  objc_class *v5;
  Class *v6;
  Class v7;
  objc_class *v8;
  Class v9;

  v5 = (objc_class *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6 = &self->super.isa + a3;
  v7 = v6[44];
  v6[44] = v5;

  v8 = (objc_class *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = v6[52];
  v6[52] = v8;

}

- (void)loadFeatureSetDefinitions
{
  NSMutableDictionary *v3;
  NSMutableDictionary *definedFeatureGroups;
  NSMutableDictionary *v5;
  NSMutableDictionary *definedFeatureSets;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!self->definedFeatureGroups && !self->definedFeatureSets)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    definedFeatureGroups = self->definedFeatureGroups;
    self->definedFeatureGroups = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    definedFeatureSets = self->definedFeatureSets;
    self->definedFeatureSets = v5;

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", _os_feature_internal_search_path());
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR("Tentpole/"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[FFConfiguration filereader](self, "filereader");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    objc_msgSend(v10, "contentsOfDirectoryAtURL:error:", v9, &v27);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v27;

    if (!v12)
    {
      v21 = v11;
      v22 = v7;
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v13 = v11;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v24 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            objc_msgSend(v18, "lastPathComponent", v21, v22, (_QWORD)v23);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "stringByDeletingPathExtension");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (-[FFConfiguration isValidName:](self, "isValidName:", v20))
              -[FFConfiguration loadFeatureSetDefinitionsNamed:fromURL:](self, "loadFeatureSetDefinitionsNamed:fromURL:", v20, v18);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v15);
      }

      v11 = v21;
      v7 = v22;
    }

  }
}

- (void)loadFeatureSetDefinitionsNamed:(id)a3 fromURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  FFFeatureGroup *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  FFFeatureAttribute *v20;
  FFFeatureGroup *v21;
  void *v22;
  id v23;
  uint64_t v24;
  id *p_isa;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  FFFeatureSetIdentifier *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  uint64_t v40;
  void *v41;
  FFFeatureSet *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  FFFeatureGroup *v47;
  FFConfiguration *v48;
  void *v49;
  uint64_t v50;
  id v51;
  id v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id obj;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v53 = v6;
  -[NSMutableDictionary objectForKeyedSubscript:](self->definedFeatureGroups, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    -[FFConfiguration loadFeatureSetDefinitionsNamed:fromURL:].cold.2();
  -[FFConfiguration filereader](self, "filereader");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryWithContentsOfURL:error:", v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = -[FFFeatureGroup initWithName:]([FFFeatureGroup alloc], "initWithName:", v6);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->definedFeatureGroups, "setObject:forKeyedSubscript:", v11, v6);
    v52 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[FFFeatureGroup setFeatureSets:](v11, "setFeatureSets:");
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DisclosureRequired"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v48 = self;
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v12 = 0;
    }
    v46 = v12;
    v47 = v11;
    -[FFFeatureGroup setDisclosure:](v11, "setDisclosure:", v12);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Attributes"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    obj = v13;
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v67 != v16)
            objc_enumerationMutation(obj);
          v18 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i);
          objc_msgSend(obj, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[FFFeatureAttribute initWithName:value:]([FFFeatureAttribute alloc], "initWithName:value:", v18, v19);
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v20, v18);

        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
      }
      while (v15);
    }

    v21 = v47;
    -[FFFeatureGroup setAttributes:](v47, "setAttributes:", v56);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("FeatureSets"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = v10;
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v44 = v22;
      v23 = v22;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
      p_isa = (id *)&v48->super.isa;
      if (v24)
      {
        v26 = v24;
        v27 = *(_QWORD *)v63;
        v50 = *(_QWORD *)v63;
        v51 = v23;
        do
        {
          v28 = 0;
          v54 = v26;
          do
          {
            if (*(_QWORD *)v63 != v27)
              objc_enumerationMutation(v23);
            v29 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v28);
            if (objc_msgSend(p_isa, "isValidName:", v29))
            {
              objc_msgSend(v23, "objectForKeyedSubscript:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v55 = v30;
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v31 = -[FFFeatureSetIdentifier initWithGroup:set:]([FFFeatureSetIdentifier alloc], "initWithGroup:set:", v53, v29);
                objc_msgSend(p_isa[60], "objectForKeyedSubscript:", v31);
                v32 = (void *)objc_claimAutoreleasedReturnValue();

                if (v32)
                  -[FFConfiguration loadFeatureSetDefinitionsNamed:fromURL:].cold.1();
                v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("FeatureFlags"));
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v60 = 0u;
                  v61 = 0u;
                  v58 = 0u;
                  v59 = 0u;
                  v49 = v34;
                  v35 = v34;
                  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
                  if (v36)
                  {
                    v37 = v36;
                    v38 = *(_QWORD *)v59;
                    do
                    {
                      for (j = 0; j != v37; ++j)
                      {
                        if (*(_QWORD *)v59 != v38)
                          objc_enumerationMutation(v35);
                        v40 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * j);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          +[FFFeatureIdentifier identifierFromString:](FFFeatureIdentifier, "identifierFromString:", v40);
                          v41 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v41)
                            objc_msgSend(v33, "addObject:", v41);

                        }
                      }
                      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
                    }
                    while (v37);
                  }

                  p_isa = (id *)&v48->super.isa;
                  v34 = v49;
                }
                v42 = -[FFFeatureSet initWithIdentifier:]([FFFeatureSet alloc], "initWithIdentifier:", v31);
                -[FFFeatureSet setFeatures:](v42, "setFeatures:", v33);
                objc_msgSend(p_isa[60], "setObject:forKeyedSubscript:", v42, v31);
                -[FFFeatureSetIdentifier featureSetName](v31, "featureSetName");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v52, "setObject:forKeyedSubscript:", v42, v43);

                v27 = v50;
                v23 = v51;
                v26 = v54;
              }

            }
            ++v28;
          }
          while (v28 != v26);
          v26 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
        }
        while (v26);
      }

      v10 = v45;
      v21 = v47;
      v22 = v44;
    }

  }
}

- (id)parseSubscriptionsDictionary:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
          -[FFConfiguration plistparser](self, "plistparser", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "parseSubscriptionsFromDictionary:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            objc_msgSend(v5, "addObject:", v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  return v5;
}

- (void)loadSubscriptionDataForLevelIndex:(unint64_t)a3
{
  NSMutableArray **subscriptionsByLevelIndex;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a3 != 3 && a3 != 6)
    -[FFConfiguration loadSubscriptionDataForLevelIndex:].cold.1(a3);
  subscriptionsByLevelIndex = self->subscriptionsByLevelIndex;
  if (!self->subscriptionsByLevelIndex[a3])
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = subscriptionsByLevelIndex[a3];
    subscriptionsByLevelIndex[a3] = v6;

    -[FFConfiguration subscriptionsFileURLForLevelIndex:](self, "subscriptionsFileURLForLevelIndex:", a3);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[FFConfiguration filereader](self, "filereader");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dictionaryWithContentsOfURL:error:", v12, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Subscriptions"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[FFConfiguration parseSubscriptionsDictionary:](self, "parseSubscriptionsDictionary:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObjectsFromArray:](subscriptionsByLevelIndex[a3], "addObjectsFromArray:", v11);

      }
    }
    -[FFConfiguration recalculateSubscriptionEffectsAt:](self, "recalculateSubscriptionEffectsAt:", a3);

  }
}

- (void)removeAllSubscriptionsAtLevelIndex:(unint64_t)a3
{
  NSMutableArray **subscriptionsByLevelIndex;
  objc_class *v6;
  Class *v7;
  Class v8;
  NSMutableArray *v9;
  NSMutableArray *v10;
  Class v11;

  os_unfair_lock_assert_owner(&self->lock);
  if (a3 != 3 && a3 != 6)
    -[FFConfiguration removeAllSubscriptionsAtLevelIndex:].cold.1(a3);
  subscriptionsByLevelIndex = self->subscriptionsByLevelIndex;
  if (-[NSMutableArray count](self->subscriptionsByLevelIndex[a3], "count"))
  {
    v6 = (objc_class *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = &self->super.isa + a3;
    v8 = v7[62];
    v7[62] = v6;

    -[objc_class setObject:forKeyedSubscript:](v7[62], "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("#MODIFIED#"));
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = subscriptionsByLevelIndex[a3];
    subscriptionsByLevelIndex[a3] = v9;

    v11 = v7[12];
    v7[12] = 0;

  }
}

- (void)loadCombinedDataForLevelIndex:(unint64_t)a3
{
  unint64_t v3;
  FFConfiguration *v4;
  uint64_t v5;
  NSMutableSet **disclosuresByLevelIndex;
  char v7;
  unint64_t v8;
  const __CFString *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  NSMutableSet **v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSMutableSet *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  uint64_t v56;
  NSMutableSet *v57;
  NSMutableSet **v59;
  void *v60;
  id v61;
  id *location;
  NSMutableDictionary *(*configByLevelIndex)[8];
  void *v64;
  void *v65;
  void *v66;
  char v67;
  id obj;
  NSMutableSet *v70;
  void *v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  if (!a3)
    abort();
  v3 = a3;
  v4 = self;
  configByLevelIndex = self->configByLevelIndex;
  if (!self->configByLevelIndex[0][a3])
  {
    v5 = 0;
    location = (id *)&self->metaByLevelIndex[a3];
    disclosuresByLevelIndex = self->disclosuresByLevelIndex;
    v7 = 1;
    v8 = 0x1E0C99000uLL;
    v9 = CFSTR("Disclosed");
    v59 = self->disclosuresByLevelIndex;
    do
    {
      v10 = v7;
      obj = objc_alloc_init(*(Class *)(v8 + 3592));
      -[FFConfiguration fileURLForLevelIndex:pathIndex:](v4, "fileURLForLevelIndex:pathIndex:", v3, v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v67 = v10;
      if (v11)
      {
        objc_msgSend(v11, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[FFConfiguration filereader](v4, "filereader");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "dictionaryWithContentsOfURL:error:", v12, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v64 = v12;
          v79 = 0u;
          v80 = 0u;
          v77 = 0u;
          v78 = 0u;
          v71 = v15;
          v16 = v15;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v78;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v78 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i);
                if (-[FFConfiguration isValidName:](v4, "isValidName:", v21))
                {
                  objc_msgSend(v16, "objectForKeyedSubscript:", v21);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    -[FFConfiguration makeFeatureDictionaryFrom:forDomain:atDomainLevel:reportableFilename:](v4, "makeFeatureDictionaryFrom:forDomain:atDomainLevel:reportableFilename:", v22, v21, 0, v13);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(obj, "setObject:forKeyedSubscript:", v23, v21);

                    v4 = self;
                  }

                }
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v77, v82, 16);
            }
            while (v18);
          }

          disclosuresByLevelIndex = v59;
          v8 = 0x1E0C99000uLL;
          v12 = v64;
          v15 = v71;
        }

        v9 = CFSTR("Disclosed");
      }
      objc_storeStrong((id *)&configByLevelIndex[v5][v3], obj);
      v24 = objc_alloc_init(*(Class *)(v8 + 3592));
      objc_msgSend(v24, "setObject:forKeyedSubscript:", v12, CFSTR("#FILE#"));
      objc_storeStrong(location, v24);
      v70 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      -[FFConfiguration disclosureFileURLForLevelIndex:pathIndex:](v4, "disclosureFileURLForLevelIndex:pathIndex:", v3, v5);
      v25 = objc_claimAutoreleasedReturnValue();
      -[FFConfiguration internalDisclosureFileURLForLevelIndex:](v4, "internalDisclosureFileURLForLevelIndex:", v3);
      v26 = objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v27 = disclosuresByLevelIndex;
        v28 = v26;
        -[FFConfiguration filereader](v4, "filereader");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)v25;
        objc_msgSend(v29, "dictionaryWithContentsOfURL:error:", v25, 0);
        v72 = objc_claimAutoreleasedReturnValue();

        v26 = v28;
        disclosuresByLevelIndex = v27;
      }
      else
      {
        v30 = 0;
        v72 = 0;
      }
      v66 = (void *)v26;
      if (v26)
      {
        v31 = v26;
        -[FFConfiguration filereader](v4, "filereader");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "dictionaryWithContentsOfURL:error:", v31, 0);
        v33 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v33 = 0;
      }
      v34 = v70;
      v35 = (void *)v72;
      v8 = 0x1E0C99000;
      if (v72 | v33)
      {
        v60 = v30;
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v72)
        {
          objc_msgSend((id)v72, "allKeys");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObjectsFromArray:", v37);

        }
        v61 = v24;
        v65 = v12;
        if (v33)
        {
          objc_msgSend((id)v33, "allKeys");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObjectsFromArray:", v38);

        }
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v39 = v36;
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
        if (v40)
        {
          v41 = v40;
          v42 = *(_QWORD *)v74;
          do
          {
            v43 = 0;
            do
            {
              if (*(_QWORD *)v74 != v42)
                objc_enumerationMutation(v39);
              v44 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * v43);
              if (+[FFConfiguration isValidDisclosureName:](FFConfiguration, "isValidDisclosureName:", v44))
              {
                objc_msgSend(v35, "objectForKeyedSubscript:", v44);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v45, "objectForKeyedSubscript:", v9);
                v46 = (void *)objc_claimAutoreleasedReturnValue();

                if (v46)
                {
                  objc_msgSend(v35, "objectForKeyedSubscript:", v44);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "objectForKeyedSubscript:", v9);
                  v48 = v9;
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = objc_msgSend(v49, "BOOLValue");

                }
                else
                {
                  v50 = 0;
                  v48 = v9;
                }
                objc_msgSend((id)v33, "objectForKeyedSubscript:", v44);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "objectForKeyedSubscript:", v48);
                v52 = (void *)objc_claimAutoreleasedReturnValue();

                if (v52)
                {
                  objc_msgSend((id)v33, "objectForKeyedSubscript:", v44);
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "objectForKeyedSubscript:", v48);
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  v55 = objc_msgSend(v54, "BOOLValue");

                  v9 = v48;
                  v35 = (void *)v72;
                  if ((v55 & 1) == 0)
                    goto LABEL_42;
LABEL_41:
                  -[NSMutableSet addObject:](v70, "addObject:", v44);
                  goto LABEL_42;
                }
                v9 = v48;
                v35 = (void *)v72;
                if (v50)
                  goto LABEL_41;
              }
LABEL_42:
              ++v43;
            }
            while (v41 != v43);
            v56 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
            v41 = v56;
          }
          while (v56);
        }

        v3 = a3;
        disclosuresByLevelIndex = v59;
        v8 = 0x1E0C99000;
        v12 = v65;
        v30 = v60;
        v24 = v61;
        v34 = v70;
      }
      if (disclosuresByLevelIndex[v3])
        -[NSMutableSet unionSet:](v34, "unionSet:");
      v57 = disclosuresByLevelIndex[v3];
      disclosuresByLevelIndex[v3] = v34;

      v7 = 0;
      v5 = 1;
      v4 = self;
    }
    while ((v67 & 1) != 0);
  }
}

- (void)addFeaturesForDomain:(id)a3 pathIndex:(int)a4 fromURL:(id)a5
{
  id v8;
  char *v9;
  id *v10;
  uint64_t v11;
  id v12;
  id v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v24 = a3;
  v8 = a5;
  v9 = (char *)self + 64 * (uint64_t)a4;
  v11 = *((_QWORD *)v9 + 4);
  v10 = (id *)(v9 + 32);
  if (!v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = *v10;
    *v10 = v12;

    if (a4 == 1)
    {
      v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v15 = self->metaByLevelIndex[0];
      self->metaByLevelIndex[0] = v14;

    }
  }
  objc_msgSend(*v10, "objectForKeyedSubscript:", v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*v10, "setObject:forKeyedSubscript:", v17, v24);

    if (a4 == 1)
    {
      v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->metaByLevelIndex[0], "setObject:forKeyedSubscript:", v18, v24);

    }
  }
  -[FFConfiguration filereader](self, "filereader");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dictionaryWithContentsOfURL:error:", v8, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "path");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[FFConfiguration makeFeatureDictionaryFrom:forDomain:atDomainLevel:reportableFilename:](self, "makeFeatureDictionaryFrom:forDomain:atDomainLevel:reportableFilename:", v20, v24, 1, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v10, "setObject:forKeyedSubscript:", v22, v24);

  if (a4 == 1)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->metaByLevelIndex[0], "objectForKeyedSubscript:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v8, CFSTR("#FILE#"));

  }
}

- (void)loadDomain:(id)a3 levelIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  v12 = v6;
  switch(a4)
  {
    case 0uLL:
      -[NSMutableDictionary objectForKeyedSubscript:](self->configByLevelIndex[0][0], "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v12;
      if (v7)
        goto LABEL_6;
      v8 = (void *)MEMORY[0x1D82678C8]();
      -[FFConfiguration fileURLForDomain:pathIndex:](self, "fileURLForDomain:pathIndex:", v12, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[FFConfiguration addFeaturesForDomain:pathIndex:fromURL:](self, "addFeaturesForDomain:pathIndex:fromURL:", v12, 0, v9);

      objc_autoreleasePoolPop(v8);
      v10 = (void *)MEMORY[0x1D82678C8]();
      -[FFConfiguration fileURLForDomain:pathIndex:](self, "fileURLForDomain:pathIndex:", v12, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[FFConfiguration addFeaturesForDomain:pathIndex:fromURL:](self, "addFeaturesForDomain:pathIndex:fromURL:", v12, 1, v11);

      objc_autoreleasePoolPop(v10);
LABEL_5:
      v6 = v12;
LABEL_6:

      return;
    case 1uLL:
    case 4uLL:
    case 7uLL:
      -[FFConfiguration loadCombinedDataForLevelIndex:](self, "loadCombinedDataForLevelIndex:", a4);
      goto LABEL_5;
    case 2uLL:
    case 5uLL:
      -[FFConfiguration loadFeatureSetDataForLevelIndex:](self, "loadFeatureSetDataForLevelIndex:", a4);
      goto LABEL_5;
    case 3uLL:
    case 6uLL:
      -[FFConfiguration loadSubscriptionDataForLevelIndex:](self, "loadSubscriptionDataForLevelIndex:", a4);
      goto LABEL_5;
    case 8uLL:
      abort();
    default:
      goto LABEL_6;
  }
}

- (void)loadAllLevelsForDomain:(id)a3
{
  id v4;

  v4 = a3;
  -[FFConfiguration loadDomain:levelIndex:](self, "loadDomain:levelIndex:", v4, 0);
  -[FFConfiguration loadFeatureSetDefinitions](self, "loadFeatureSetDefinitions");
  -[FFConfiguration loadDomain:levelIndex:](self, "loadDomain:levelIndex:", v4, 1);
  -[FFConfiguration loadDomain:levelIndex:](self, "loadDomain:levelIndex:", v4, 2);
  -[FFConfiguration loadDomain:levelIndex:](self, "loadDomain:levelIndex:", v4, 4);
  -[FFConfiguration loadDomain:levelIndex:](self, "loadDomain:levelIndex:", v4, 5);
  -[FFConfiguration loadDomain:levelIndex:](self, "loadDomain:levelIndex:", v4, 7);

}

- (void)loadAllData
{
  uint64_t v3;
  id v4;
  char v5;
  unint64_t v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  NSMutableSet *v23;
  NSMutableSet *domains;
  uint64_t v25;
  uint64_t v26;
  char v27;
  NSMutableDictionary *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  char v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->lock);
  v3 = 0;
  v4 = 0;
  v5 = 1;
  v6 = 0x1E0C99000uLL;
  do
  {
    v7 = v5;

    -[NSArray objectAtIndexedSubscript:](self->searchPaths, "objectAtIndexedSubscript:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v6 + 3736), "fileURLWithPath:isDirectory:", v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("/Domain/"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[FFConfiguration filereader](self, "filereader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    objc_msgSend(v11, "contentsOfDirectoryAtURL:error:", v10, &v44);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v44;

    if (!v4)
    {
      v33 = v10;
      v34 = v8;
      v35 = v7;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            v18 = v12;
            if (*(_QWORD *)v41 != v16)
              objc_enumerationMutation(v13);
            v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_msgSend(v19, "lastPathComponent", v33, v34);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "stringByDeletingPathExtension");
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            if (-[FFConfiguration isValidName:](self, "isValidName:", v21))
              -[FFConfiguration addFeaturesForDomain:pathIndex:fromURL:](self, "addFeaturesForDomain:pathIndex:fromURL:", v21, v3, v19);

            v12 = v18;
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
        }
        while (v15);
      }

      v4 = 0;
      v6 = 0x1E0C99000;
      v7 = v35;
      v10 = v33;
      v8 = v34;
    }

    v5 = 0;
    v3 = 1;
  }
  while ((v7 & 1) != 0);
  -[FFConfiguration loadFeatureSetDefinitions](self, "loadFeatureSetDefinitions");
  v22 = 1;
  -[FFConfiguration loadCombinedDataForLevelIndex:](self, "loadCombinedDataForLevelIndex:", 1);
  -[FFConfiguration loadCombinedDataForLevelIndex:](self, "loadCombinedDataForLevelIndex:", 4);
  -[FFConfiguration loadCombinedDataForLevelIndex:](self, "loadCombinedDataForLevelIndex:", 7);
  -[FFConfiguration loadFeatureSetDataForLevelIndex:](self, "loadFeatureSetDataForLevelIndex:", 2);
  -[FFConfiguration loadFeatureSetDataForLevelIndex:](self, "loadFeatureSetDataForLevelIndex:", 5);
  v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  domains = self->_domains;
  self->_domains = v23;

  v25 = 0;
  do
  {
    v26 = 0;
    v27 = v22;
    do
    {
      v28 = self->configByLevelIndex[v25][v26];
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v29 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v37;
        do
        {
          for (j = 0; j != v30; ++j)
          {
            if (*(_QWORD *)v37 != v31)
              objc_enumerationMutation(v28);
            -[NSMutableSet addObject:](self->_domains, "addObject:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j), v33, v34);
          }
          v30 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
        }
        while (v30);
      }

      ++v26;
    }
    while (v26 != 8);
    v22 = 0;
    v25 = 1;
  }
  while ((v27 & 1) != 0);
  -[FFConfiguration loadSubscriptionDataForLevelIndex:](self, "loadSubscriptionDataForLevelIndex:", 3);
  -[FFConfiguration loadSubscriptionDataForLevelIndex:](self, "loadSubscriptionDataForLevelIndex:", 6);

}

- (id)effectiveStateForFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  Class *v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v8 = a3;
  v9 = a4;
  -[FFConfiguration buildVersionGetter](self, "buildVersionGetter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getBuildVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_assert_owner(&self->lock);
  v12 = &self->super.isa + a5;
  for (i = 12; i != -4; i -= 8)
  {
    -[objc_class objectForKeyedSubscript:](v12[i], "objectForKeyedSubscript:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "disclosurerequired");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      objc_msgSend(v15, "disclosurerequired");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[FFConfiguration resolvedStateForDisclosure:](self, "resolvedStateForDisclosure:", v18);

      if (!v19)
        goto LABEL_13;
    }
    objc_msgSend(v15, "buildVersion");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      objc_msgSend(v15, "buildVersion");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22 != v11 || v15 == 0)
        goto LABEL_13;
    }
    else if (!v15)
    {
      goto LABEL_13;
    }
    if (objc_msgSend(v15, "value") != 2)
      goto LABEL_15;
LABEL_13:

  }
  v15 = 0;
LABEL_15:

  return v15;
}

- (BOOL)resolvedStateForDisclosure:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableSet **v6;
  BOOL v7;
  int v8;

  v4 = a3;
  if (v4)
  {
    os_unfair_lock_assert_owner(&self->lock);
    v5 = 0;
    v6 = &self->disclosuresByLevelIndex[7];
    do
    {
      v7 = v5 != -8;
      if (v5 == -8)
        break;
      v8 = -[NSMutableSet containsObject:](v6[v5--], "containsObject:", v4);
    }
    while (!v8);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)resolvedStateForFeature:(id)a3 domain:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_owner(&self->lock);
  v8 = 7;
  while (1)
  {
    -[FFConfiguration effectiveStateForFeature:domain:levelIndex:](self, "effectiveStateForFeature:domain:levelIndex:", v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "value") != 2)
        break;
    }

    if (--v8 == -1)
    {
      v10 = 0;
      goto LABEL_11;
    }
  }
  if (v8)
  {
    -[FFConfiguration effectiveStateForFeature:domain:levelIndex:](self, "effectiveStateForFeature:domain:levelIndex:", v6, v7, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "phase");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = (void *)objc_msgSend(v10, "copy");

        objc_msgSend(v12, "phase");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setPhase:", v15);

        v10 = v14;
      }
    }

  }
LABEL_11:

  return v10;
}

- (BOOL)isFeatureHidden:(id)a3 domain:(id)a4
{
  id v6;
  uint64_t v7;
  char v8;
  char v9;
  char *v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  BOOL v18;

  v6 = a3;
  v7 = 0;
  v8 = 1;
  while (2)
  {
    v9 = v8;
    v10 = (char *)self + 64 * v7;
    for (i = 88; i != 24; i -= 8)
    {
      objc_msgSend(*(id *)&v10[i], "objectForKeyedSubscript:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v13, "disclosurerequired");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
          objc_msgSend(v13, "disclosurerequired");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[FFConfiguration resolvedStateForDisclosure:](self, "resolvedStateForDisclosure:", v16);

          if (!v17)
          {

            v18 = 1;
            goto LABEL_10;
          }
        }
      }

    }
    v8 = 0;
    v18 = 0;
    v7 = 1;
    if ((v9 & 1) != 0)
      continue;
    break;
  }
LABEL_10:

  return v18;
}

- (void)createMutableDomainConfig:(id)a3 levelIndex:(unint64_t)a4
{
  id v6;
  NSMutableDictionary **v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  objc_class *v11;
  Class *v12;
  Class v13;
  void *v14;
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = self->configByLevelIndex[1];
  v8 = self->configByLevelIndex[1][a4];
  v17 = v6;
  if (!v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = v7[a4];
    v7[a4] = v9;

    v11 = (objc_class *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v12 = &self->super.isa + a4;
    v13 = v12[20];
    v12[20] = v11;

    v6 = v17;
    v8 = v7[a4];
  }
  -[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7[a4], "setObject:forKeyedSubscript:", v15, v17);

    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->metaByLevelIndex[a4], "setObject:forKeyedSubscript:", v16, v17);

  }
}

- (void)setValue:(int64_t)a3 feature:(id)a4 domain:(id)a5 levelIndex:(unint64_t)a6
{
  -[FFConfiguration setValue:feature:domain:levelIndex:buildVersion:](self, "setValue:feature:domain:levelIndex:buildVersion:", a3, a4, a5, a6, 0);
}

- (void)setValue:(int64_t)a3 feature:(id)a4 domain:(id)a5 levelIndex:(unint64_t)a6 buildVersion:(id)a7
{
  id v12;
  id v13;
  void *v14;
  FFFeatureState *v15;
  id *v16;
  void *v17;
  NSMutableSet *domains;
  id v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a4;
  v12 = a5;
  v13 = a7;
  os_unfair_lock_assert_owner(&self->lock);
  if (a6 - 2 >= 6)
    -[FFConfiguration setValue:feature:domain:levelIndex:buildVersion:].cold.2(a6);
  if (a6 == 4)
  {
    -[FFConfiguration profilePayloads](self, "profilePayloads");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      -[FFConfiguration setValue:feature:domain:levelIndex:buildVersion:].cold.1();
  }
  -[FFConfiguration createMutableDomainConfig:levelIndex:](self, "createMutableDomainConfig:levelIndex:", v12, a6);
  v15 = -[FFFeatureState initWithDomain:feature:value:buildVersion:]([FFFeatureState alloc], "initWithDomain:feature:value:buildVersion:", v12, v22, a3, v13);
  v16 = (id *)(&self->super.isa + a6);
  objc_msgSend(v16[12], "objectForKeyedSubscript:", v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, v22);

  if (a6 > 6 || ((1 << a6) & 0x6C) == 0)
  {
    v19 = v16[20];
    objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("#MODIFIED#"));
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("#FILE#"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      -[FFConfiguration fileURLForLevelIndex:pathIndex:](self, "fileURLForLevelIndex:pathIndex:", a6, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("#FILE#"));

    }
  }
  if (a3 != 2)
  {
    domains = self->_domains;
    if (domains)
      -[NSMutableSet addObject:](domains, "addObject:", v12);
  }

}

- (void)setFeaturesMatchingAttribute:(id)a3 levelIndex:(unint64_t)a4 value:(int64_t)a5
{
  id v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *(*configByLevelIndex)[8];
  char v23;
  id obj;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v30;
  id *v31;
  FFConfiguration *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[FFConfiguration loadAllData](self, "loadAllData");
  v7 = 0;
  v32 = self;
  configByLevelIndex = self->configByLevelIndex;
  v8 = 1;
  do
  {
    v9 = v8;
    if (a4 <= 7)
    {
      v23 = v8;
      v31 = (id *)configByLevelIndex[v7];
      do
      {
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        obj = *v31;
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        if (v26)
        {
          v25 = *(_QWORD *)v38;
          do
          {
            v10 = 0;
            do
            {
              if (*(_QWORD *)v38 != v25)
                objc_enumerationMutation(obj);
              v27 = v10;
              v11 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v10);
              v33 = 0u;
              v34 = 0u;
              v35 = 0u;
              v36 = 0u;
              objc_msgSend(*v31, "objectForKeyedSubscript:", v11);
              v30 = (id)objc_claimAutoreleasedReturnValue();
              v12 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
              if (v12)
              {
                v13 = v12;
                v14 = *(_QWORD *)v34;
                do
                {
                  for (i = 0; i != v13; ++i)
                  {
                    if (*(_QWORD *)v34 != v14)
                      objc_enumerationMutation(v30);
                    v16 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
                    objc_msgSend(*v31, "objectForKeyedSubscript:", v11);
                    v17 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v17, "objectForKeyedSubscript:", v16);
                    v18 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v18, "attributes");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v6, "name");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v19, "objectForKeyedSubscript:", v20);
                    v21 = (void *)objc_claimAutoreleasedReturnValue();

                    if (!-[FFConfiguration isFeatureHidden:domain:](v32, "isFeatureHidden:domain:", v16, v11)
                      && v21
                      && objc_msgSend(v6, "matchesAgainst:", v21))
                    {
                      -[FFConfiguration setValue:feature:domain:levelIndex:](v32, "setValue:feature:domain:levelIndex:", a5, v16, v11, a4);
                    }

                  }
                  v13 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
                }
                while (v13);
              }

              v10 = v27 + 1;
            }
            while (v27 + 1 != v26);
            v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
          }
          while (v26);
        }

        ++a4;
      }
      while (a4 != 8);
      a4 = 8;
      v9 = v23;
    }
    v8 = 0;
    v7 = 1;
  }
  while ((v9 & 1) != 0);

}

- (void)populateDictionary:(id)a3 withFeatures:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  const __CFString *v23;
  uint64_t v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "value");
        if (v13 != 2
          || (objc_msgSend(v12, "buildVersion"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v14,
              v14))
        {
          objc_msgSend(v12, "buildVersion");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = MEMORY[0x1E0C9AAA0];
          if (v13 == 1)
            v16 = MEMORY[0x1E0C9AAB0];
          if (v15)
          {
            v26[0] = v16;
            v25[0] = CFSTR("Enabled");
            v25[1] = CFSTR("BuildVersion");
            objc_msgSend(v12, "buildVersion");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v26[1] = v17;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, v11);

          }
          else
          {
            v23 = CFSTR("Enabled");
            v24 = v16;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, v11);
          }

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v8);
  }

}

- (BOOL)writeDomainUpdates:(id *)a3
{
  NSMutableDictionary *v5;
  char v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  id *v17;
  void *v18;
  FFConfiguration *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = self->metaByLevelIndex[0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v22 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v22)
  {
    v20 = self;
    v21 = *(_QWORD *)v24;
    v6 = 1;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v5);
        v8 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("#MODIFIED#"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("#FILE#"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "URLByDeletingLastPathComponent");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[FFConfiguration filewriter](v20, "filewriter");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "createDirectoryAtURL:error:", v12, a3);

          if (v14)
          {
            v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            -[NSMutableDictionary objectForKeyedSubscript:](v20->configByLevelIndex[1][0], "objectForKeyedSubscript:", v8);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[FFConfiguration populateDictionary:withFeatures:](v20, "populateDictionary:withFeatures:", v15, v16);
            -[FFConfiguration filewriter](v20, "filewriter");
            v17 = a3;
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = objc_msgSend(v18, "writeData:toFile:error:", v15, v11, v17);

            a3 = v17;
          }
          else
          {
            v6 = 0;
          }

        }
      }
      v22 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v22);
  }
  else
  {
    v6 = 1;
  }

  return v6 & 1;
}

- (BOOL)writeCombinedUpdatesAtLevelIndex:(unint64_t)a3 error:(id *)a4
{
  NSMutableDictionary **metaByLevelIndex;
  NSMutableDictionary *v6;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  NSMutableDictionary *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  char v24;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  metaByLevelIndex = self->metaByLevelIndex;
  v6 = self->metaByLevelIndex[a3];
  if (!v6)
    return 1;
  -[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("#MODIFIED#"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    return 1;
  -[NSMutableDictionary objectForKeyedSubscript:](metaByLevelIndex[a3], "objectForKeyedSubscript:", CFSTR("#FILE#"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByDeletingLastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FFConfiguration filewriter](self, "filewriter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "createDirectoryAtURL:error:", v11, a4);

  if (v13)
  {
    v26 = v11;
    v27 = v10;
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v15 = self->configByLevelIndex[1][a3];
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          -[NSMutableDictionary objectForKeyedSubscript:](v15, "objectForKeyedSubscript:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[FFConfiguration populateDictionary:withFeatures:](self, "populateDictionary:withFeatures:", v21, v22);
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, v20);

        }
        v17 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v17);
    }
    -[FFConfiguration filewriter](self, "filewriter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v27;
    v24 = objc_msgSend(v23, "writeData:toFile:error:", v14, v27, a4);

    v11 = v26;
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (BOOL)writeCombinedUpdates:(id *)a3
{
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;

  v5 = -[FFConfiguration writeCombinedUpdatesAtLevelIndex:error:](self, "writeCombinedUpdatesAtLevelIndex:error:", 1, a3);
  if (v5)
  {
    v6 = 2;
    do
    {
      v7 = v6;
      if (v6 == 8)
        break;
      v8 = -[FFConfiguration writeCombinedUpdatesAtLevelIndex:error:](self, "writeCombinedUpdatesAtLevelIndex:error:", v6, a3);
      v6 = v7 + 1;
    }
    while (v8);
    LOBYTE(v5) = (unint64_t)(v7 - 1) > 6;
  }
  return v5;
}

- (BOOL)writeDisclosureUpdatesAtlevelIndex:(unint64_t)a3 error:(id *)a4
{
  NSMutableDictionary *v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  NSMutableSet *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  char v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = self->metaByLevelIndex[a3];
  if (!v5)
    return 1;
  -[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("#DISCLOSURES_MODIFIED#"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    return 1;
  -[FFConfiguration disclosureFileURLForLevelIndex:pathIndex:](self, "disclosureFileURLForLevelIndex:pathIndex:", a3, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FFConfiguration filewriter](self, "filewriter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "createDirectoryAtURL:error:", v10, a4);

  if (v12)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v14 = self->disclosuresByLevelIndex[a3];
    v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(v13, "setObject:forKey:", &unk_1E98826C0, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i), (_QWORD)v22);
        }
        v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v16);
    }

    -[FFConfiguration filewriter](self, "filewriter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "writeData:toFile:error:", v13, v9, a4);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)writeDisclosureUpdates:(id *)a3
{
  uint64_t v5;
  BOOL result;

  v5 = 1;
  result = 1;
  do
    result = result
          && -[FFConfiguration writeDisclosureUpdatesAtlevelIndex:error:](self, "writeDisclosureUpdatesAtlevelIndex:error:", v5++, a3);
  while (v5 != 8);
  return result;
}

- (BOOL)writeFeatureSetUpdatesAtLevelIndex:(unint64_t)a3 withError:(id *)a4
{
  NSMutableDictionary **featureSetsMetaByLevelIndex;
  NSMutableDictionary *v6;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSMutableDictionary *definedFeatureGroups;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  id *v33;
  void *v34;
  id *v36;
  void *v37;
  void *v38;
  NSMutableDictionary **v39;
  unint64_t v40;
  NSMutableSet *obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  featureSetsMetaByLevelIndex = self->featureSetsMetaByLevelIndex;
  v6 = self->featureSetsMetaByLevelIndex[a3];
  if (!v6)
    return 1;
  v8 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("#MODIFIED#"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    return 1;
  -[FFConfiguration featureSetsFileURLForLevelIndex:](self, "featureSetsFileURLForLevelIndex:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByDeletingLastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FFConfiguration filewriter](self, "filewriter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "createDirectoryAtURL:error:", v11, a4);

  if (v13)
  {
    v36 = a4;
    v37 = v11;
    v38 = v10;
    v39 = featureSetsMetaByLevelIndex;
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v40 = v8;
    obj = self->enabledFeatureSetsByLevelIndex[v8];
    v15 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v43 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v19, "featureGroupName", v36, v37, v38, v39);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v21)
          {
            v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            objc_msgSend(v19, "featureGroupName");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v22, v23);

          }
          definedFeatureGroups = self->definedFeatureGroups;
          objc_msgSend(v19, "featureGroupName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](definedFeatureGroups, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "featureGroupName");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "featureSetName");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
            v30 = &unk_1E98826E8;
          else
            v30 = &unk_1E9882710;
          objc_msgSend(v28, "setObject:forKeyedSubscript:", v30, v29);

        }
        v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v16);
    }

    if (objc_msgSend(v14, "count"))
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v14, CFSTR("TentpoleFeatureSets"));
    else
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v38;
    featureSetsMetaByLevelIndex = v39;
    v33 = v36;
    v11 = v37;
    -[FFConfiguration filewriter](self, "filewriter", v36, v37, v38, v39);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v34, "writeData:toFile:error:", v32, v10, v33);

    v8 = v40;
  }
  else
  {
    v31 = 0;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](featureSetsMetaByLevelIndex[v8], "setObject:forKeyedSubscript:", 0, CFSTR("#MODIFIED#"));

  return v31;
}

- (BOOL)writeFeatureSetUpdates:(id *)a3
{
  -[FFConfiguration writeFeatureSetUpdatesAtLevelIndex:withError:](self, "writeFeatureSetUpdatesAtLevelIndex:withError:", 2, a3);
  -[FFConfiguration writeFeatureSetUpdatesAtLevelIndex:withError:](self, "writeFeatureSetUpdatesAtLevelIndex:withError:", 5, a3);
  return 1;
}

- (BOOL)writeSubscriptionUpdatesAtLevelIndex:(unint64_t)a3 withError:(id *)a4
{
  NSMutableDictionary *v5;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id *v26;
  void *v27;
  unint64_t v28;
  NSMutableArray *obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = self->subscriptionsMetaByLevelIndex[a3];
  if (!v5)
    return 1;
  v7 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("#MODIFIED#"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    return 1;
  -[FFConfiguration subscriptionsFileURLForLevelIndex:](self, "subscriptionsFileURLForLevelIndex:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FFConfiguration filewriter](self, "filewriter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "createDirectoryAtURL:error:", v10, a4);

  if (v12)
  {
    v26 = a4;
    v27 = v10;
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v28 = v7;
    obj = self->subscriptionsByLevelIndex[v7];
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v31 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v18, "nameOfClass", v26);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("SubscriptionClass"));
          objc_msgSend(v18, "encodeToDictionary");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v21, CFSTR("SubscriptionContents"));

          objc_msgSend(v13, "addObject:", v20);
        }
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v15);
    }

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v13, CFSTR("Subscriptions"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[FFConfiguration filewriter](self, "filewriter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "writeData:toFile:error:", v22, v9, v26);

    v7 = v28;
    v10 = v27;
  }
  else
  {
    v24 = 0;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->featureSetsMetaByLevelIndex[v7], "setObject:forKeyedSubscript:", 0, CFSTR("#MODIFIED#"), v26);

  return v24;
}

- (BOOL)writeSubscriptionUpdates:(id *)a3
{
  _BOOL4 v5;

  v5 = -[FFConfiguration writeSubscriptionUpdatesAtLevelIndex:withError:](self, "writeSubscriptionUpdatesAtLevelIndex:withError:", 3, a3);
  if (v5)
    LOBYTE(v5) = -[FFConfiguration writeSubscriptionUpdatesAtLevelIndex:withError:](self, "writeSubscriptionUpdatesAtLevelIndex:withError:", 6, a3);
  return v5;
}

- (NSSet)domains
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  v4 = (void *)-[NSMutableSet copy](self->_domains, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v4;
}

- (id)featuresForDomainAlreadyLocked:(id)a3
{
  char v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  char v19;
  NSMutableDictionary *(*configByLevelIndex)[8];
  id v21;
  uint64_t v22;
  uint64_t v23;
  FFConfiguration *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v24 = self;
  v25 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v22 = 0;
  configByLevelIndex = self->configByLevelIndex;
  v4 = 1;
  do
  {
    v5 = 0;
    v19 = v4;
    do
    {
      v23 = v5;
      -[NSMutableDictionary objectForKeyedSubscript:](configByLevelIndex[v22][v5], "objectForKeyedSubscript:", v21);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (!v7)
        goto LABEL_15;
      v8 = v7;
      v9 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "disclosurerequired");
          v13 = objc_claimAutoreleasedReturnValue();
          if (!v13)
          {

LABEL_12:
            objc_msgSend(v25, "addObject:", v11);
            continue;
          }
          v14 = (void *)v13;
          objc_msgSend(v6, "objectForKeyedSubscript:", v11);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "disclosurerequired");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[FFConfiguration resolvedStateForDisclosure:](v24, "resolvedStateForDisclosure:", v16);

          if (v17)
            goto LABEL_12;
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v8);
LABEL_15:

      v5 = v23 + 1;
    }
    while (v23 != 7);
    v4 = 0;
    v22 = 1;
  }
  while ((v19 & 1) != 0);

  return v25;
}

- (id)featuresForDomain:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  -[FFConfiguration validateName:](self, "validateName:", v4);
  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadAllLevelsForDomain:](self, "loadAllLevelsForDomain:", v4);
  -[FFConfiguration featuresForDomainAlreadyLocked:](self, "featuresForDomainAlreadyLocked:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)stateForFeature:(id)a3 domain:(id)a4
{
  return -[FFConfiguration stateForFeature:domain:level:](self, "stateForFeature:domain:level:", a3, a4, 4);
}

- (id)stateForFeature:(id)a3 domain:(id)a4 level:(int64_t)a5
{
  id v8;
  id v9;
  os_unfair_lock_s *p_lock;
  uint64_t v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  -[FFConfiguration validateName:](self, "validateName:", v9);
  -[FFConfiguration validateName:](self, "validateName:", v8);
  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  switch(a5)
  {
    case 0:
      goto LABEL_5;
    case 1:
      a5 = 1;
      goto LABEL_5;
    case 2:
      a5 = 4;
      goto LABEL_5;
    case 3:
      a5 = 7;
LABEL_5:
      -[FFConfiguration loadDomain:levelIndex:](self, "loadDomain:levelIndex:", v9, a5);
      -[FFConfiguration effectiveStateForFeature:domain:levelIndex:](self, "effectiveStateForFeature:domain:levelIndex:", v8, v9, a5);
      v11 = objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[FFConfiguration loadAllLevelsForDomain:](self, "loadAllLevelsForDomain:", v9);
      -[FFConfiguration resolvedStateForFeature:domain:](self, "resolvedStateForFeature:domain:", v8, v9);
      v11 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      -[FFConfiguration stateForFeature:domain:level:].cold.1(a5);
  }
  v12 = (void *)v11;
  os_unfair_lock_unlock(p_lock);

  return v12;
}

- (id)defaultStateForFeature:(id)a3 domain:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[FFConfiguration validateName:](self, "validateName:", v7);
  -[FFConfiguration validateName:](self, "validateName:", v6);
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadDomain:levelIndex:](self, "loadDomain:levelIndex:", v7, 0);
  v8 = 1;
  -[FFConfiguration loadDomain:levelIndex:](self, "loadDomain:levelIndex:", v7, 1);
  while (1)
  {
    -[FFConfiguration effectiveStateForFeature:domain:levelIndex:](self, "effectiveStateForFeature:domain:levelIndex:", v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      if (objc_msgSend(v9, "value") != 2)
        break;
    }

    if (--v8 == -1)
    {
      v10 = 0;
      break;
    }
  }
  os_unfair_lock_unlock(&self->lock);

  return v10;
}

- (void)enableFeature:(id)a3 domain:(id)a4 level:(int64_t)a5
{
  id v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v8 = a4;
  switch(a5)
  {
    case 1:
      v9 = 1;
      break;
    case 2:
      v9 = 4;
      break;
    case 3:
      v9 = 7;
      break;
    case 4:
      abort();
    default:
      v9 = 0;
      break;
  }
  -[FFConfiguration enableFeature:domain:levelIndex:](self, "enableFeature:domain:levelIndex:", v10, v8, v9);

}

- (void)enableFeature:(id)a3 domain:(id)a4 level:(int64_t)a5 transient:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  uint64_t v11;
  id v12;

  v6 = a6;
  v12 = a3;
  v10 = a4;
  switch(a5)
  {
    case 1:
      v11 = 1;
      break;
    case 2:
      v11 = 4;
      break;
    case 3:
      v11 = 7;
      break;
    case 4:
      abort();
    default:
      v11 = 0;
      break;
  }
  -[FFConfiguration enableFeature:domain:levelIndex:transient:](self, "enableFeature:domain:levelIndex:transient:", v12, v10, v11, v6);

}

- (void)enableFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5
{
  -[FFConfiguration enableFeature:domain:levelIndex:transient:](self, "enableFeature:domain:levelIndex:transient:", a3, a4, a5, 0);
}

- (void)enableFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5 transient:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a6;
  v13 = a3;
  v10 = a4;
  -[FFConfiguration validateName:](self, "validateName:", v10);
  -[FFConfiguration validateName:](self, "validateName:", v13);
  if (v6)
  {
    -[FFConfiguration buildVersionGetter](self, "buildVersionGetter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getBuildVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadDomain:levelIndex:](self, "loadDomain:levelIndex:", v10, a5);
  -[FFConfiguration setValue:feature:domain:levelIndex:buildVersion:](self, "setValue:feature:domain:levelIndex:buildVersion:", 1, v13, v10, a5, v12);

  os_unfair_lock_unlock(&self->lock);
}

- (void)enableFeaturesMatchingAttribute:(id)a3 level:(int64_t)a4
{
  uint64_t v6;
  id v7;

  v7 = a3;
  switch(a4)
  {
    case 1:
      v6 = 1;
      break;
    case 2:
      v6 = 4;
      break;
    case 3:
      v6 = 7;
      break;
    case 4:
      abort();
    default:
      v6 = 0;
      break;
  }
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration setFeaturesMatchingAttribute:levelIndex:value:](self, "setFeaturesMatchingAttribute:levelIndex:value:", v7, v6, 1);
  os_unfair_lock_unlock(&self->lock);

}

- (void)disableFeature:(id)a3 domain:(id)a4 level:(int64_t)a5
{
  id v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v8 = a4;
  switch(a5)
  {
    case 1:
      v9 = 1;
      break;
    case 2:
      v9 = 4;
      break;
    case 3:
      v9 = 7;
      break;
    case 4:
      abort();
    default:
      v9 = 0;
      break;
  }
  -[FFConfiguration disableFeature:domain:levelIndex:](self, "disableFeature:domain:levelIndex:", v10, v8, v9);

}

- (void)disableFeature:(id)a3 domain:(id)a4 level:(int64_t)a5 transient:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  uint64_t v11;
  id v12;

  v6 = a6;
  v12 = a3;
  v10 = a4;
  switch(a5)
  {
    case 1:
      v11 = 1;
      break;
    case 2:
      v11 = 4;
      break;
    case 3:
      v11 = 7;
      break;
    case 4:
      abort();
    default:
      v11 = 0;
      break;
  }
  -[FFConfiguration disableFeature:domain:levelIndex:transient:](self, "disableFeature:domain:levelIndex:transient:", v12, v10, v11, v6);

}

- (void)disableFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5
{
  -[FFConfiguration disableFeature:domain:levelIndex:transient:](self, "disableFeature:domain:levelIndex:transient:", a3, a4, a5, 0);
}

- (void)disableFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5 transient:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a6;
  v13 = a3;
  v10 = a4;
  -[FFConfiguration validateName:](self, "validateName:", v10);
  -[FFConfiguration validateName:](self, "validateName:", v13);
  if (v6)
  {
    -[FFConfiguration buildVersionGetter](self, "buildVersionGetter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "getBuildVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadDomain:levelIndex:](self, "loadDomain:levelIndex:", v10, a5);
  -[FFConfiguration setValue:feature:domain:levelIndex:buildVersion:](self, "setValue:feature:domain:levelIndex:buildVersion:", 0, v13, v10, a5, v12);

  os_unfair_lock_unlock(&self->lock);
}

- (void)disableFeaturesMatchingAttribute:(id)a3 level:(int64_t)a4
{
  uint64_t v6;
  id v7;

  v7 = a3;
  switch(a4)
  {
    case 1:
      v6 = 1;
      break;
    case 2:
      v6 = 4;
      break;
    case 3:
      v6 = 7;
      break;
    case 4:
      abort();
    default:
      v6 = 0;
      break;
  }
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration setFeaturesMatchingAttribute:levelIndex:value:](self, "setFeaturesMatchingAttribute:levelIndex:value:", v7, v6, 0);
  os_unfair_lock_unlock(&self->lock);

}

- (void)unsetFeature:(id)a3 domain:(id)a4 level:(int64_t)a5
{
  id v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v8 = a4;
  switch(a5)
  {
    case 1:
      v9 = 1;
      break;
    case 2:
      v9 = 4;
      break;
    case 3:
      v9 = 7;
      break;
    case 4:
      abort();
    default:
      v9 = 0;
      break;
  }
  -[FFConfiguration unsetFeature:domain:levelIndex:](self, "unsetFeature:domain:levelIndex:", v10, v8, v9);

}

- (void)unsetFeature:(id)a3 domain:(id)a4 levelIndex:(unint64_t)a5
{
  id v8;
  id v9;

  v8 = a4;
  v9 = a3;
  -[FFConfiguration validateName:](self, "validateName:", v8);
  -[FFConfiguration validateName:](self, "validateName:", v9);
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadDomain:levelIndex:](self, "loadDomain:levelIndex:", v8, a5);
  -[FFConfiguration setValue:feature:domain:levelIndex:](self, "setValue:feature:domain:levelIndex:", 2, v9, v8, a5);

  os_unfair_lock_unlock(&self->lock);
}

- (void)unsetFeaturesMatchingAttribute:(id)a3 level:(int64_t)a4
{
  uint64_t v6;
  id v7;

  v7 = a3;
  switch(a4)
  {
    case 1:
      v6 = 1;
      break;
    case 2:
      v6 = 4;
      break;
    case 3:
      v6 = 7;
      break;
    case 4:
      abort();
    default:
      v6 = 0;
      break;
  }
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration setFeaturesMatchingAttribute:levelIndex:value:](self, "setFeaturesMatchingAttribute:levelIndex:value:", v7, v6, 2);
  os_unfair_lock_unlock(&self->lock);

}

- (void)_enableFeatureSetAlreadyLocked:(id)a3 atLevelIndex:(unint64_t)a4
{
  NSMutableDictionary **enabledFeatureSetsAtLevelIndexByGroup;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  id v10;
  NSMutableDictionary *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  NSMutableDictionary **featureSetsMetaByLevelIndex;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  id v20;

  v20 = a3;
  os_unfair_lock_assert_owner(&self->lock);
  -[NSMutableSet addObject:](self->enabledFeatureSetsByLevelIndex[a4], "addObject:", v20);
  enabledFeatureSetsAtLevelIndexByGroup = self->enabledFeatureSetsAtLevelIndexByGroup;
  v7 = self->enabledFeatureSetsAtLevelIndexByGroup[a4];
  objc_msgSend(v20, "featureGroupName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v11 = enabledFeatureSetsAtLevelIndexByGroup[a4];
    objc_msgSend(v20, "featureGroupName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v10, v12);

  }
  v13 = enabledFeatureSetsAtLevelIndexByGroup[a4];
  objc_msgSend(v20, "featureGroupName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObject:", v20);

  featureSetsMetaByLevelIndex = self->featureSetsMetaByLevelIndex;
  v17 = self->featureSetsMetaByLevelIndex[a4];
  if (!v17)
  {
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v19 = featureSetsMetaByLevelIndex[a4];
    featureSetsMetaByLevelIndex[a4] = v18;

    v17 = featureSetsMetaByLevelIndex[a4];
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v17, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("#MODIFIED#"));
  -[FFConfiguration recalculateFeatureSetEffectsAt:](self, "recalculateFeatureSetEffectsAt:", a4);

}

- (void)_unsetFeatureSetAlreadyLocked:(id)a3 atLevelIndex:(unint64_t)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id *v8;
  id v9;
  void *v10;
  void *v11;
  NSMutableDictionary **featureSetsMetaByLevelIndex;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;

  p_lock = &self->lock;
  v7 = a3;
  os_unfair_lock_assert_owner(p_lock);
  v8 = (id *)(&self->super.isa + a4);
  objc_msgSend(v8[44], "removeObject:", v7);
  v9 = v8[52];
  objc_msgSend(v7, "featureGroupName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObject:", v7);

  featureSetsMetaByLevelIndex = self->featureSetsMetaByLevelIndex;
  v13 = self->featureSetsMetaByLevelIndex[a4];
  if (!v13)
  {
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v15 = featureSetsMetaByLevelIndex[a4];
    featureSetsMetaByLevelIndex[a4] = v14;

    v13 = featureSetsMetaByLevelIndex[a4];
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("#MODIFIED#"));
  -[FFConfiguration recalculateFeatureSetEffectsAt:](self, "recalculateFeatureSetEffectsAt:", a4);
}

- (void)addSubscriptionAlreadyLocked:(id)a3 atLevelIndex:(unint64_t)a4
{
  NSMutableArray **subscriptionsByLevelIndex;
  NSMutableArray *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  NSMutableDictionary **subscriptionsMetaByLevelIndex;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  id v14;

  v14 = a3;
  os_unfair_lock_assert_owner(&self->lock);
  subscriptionsByLevelIndex = self->subscriptionsByLevelIndex;
  v7 = self->subscriptionsByLevelIndex[a4];
  if (!v7)
  {
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = subscriptionsByLevelIndex[a4];
    subscriptionsByLevelIndex[a4] = v8;

    v7 = subscriptionsByLevelIndex[a4];
  }
  -[NSMutableArray addObject:](v7, "addObject:", v14);
  subscriptionsMetaByLevelIndex = self->subscriptionsMetaByLevelIndex;
  v11 = self->subscriptionsMetaByLevelIndex[a4];
  if (!v11)
  {
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v13 = subscriptionsMetaByLevelIndex[a4];
    subscriptionsMetaByLevelIndex[a4] = v12;

    v11 = subscriptionsMetaByLevelIndex[a4];
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("#MODIFIED#"));
  -[FFConfiguration recalculateSubscriptionEffectsAt:](self, "recalculateSubscriptionEffectsAt:", a4);

}

- (BOOL)commitUpdates:(id *)a3
{
  os_unfair_lock_s *p_lock;
  BOOL v6;

  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  v6 = -[FFConfiguration writeDomainUpdates:](self, "writeDomainUpdates:", a3)
    && -[FFConfiguration writeCombinedUpdates:](self, "writeCombinedUpdates:", a3)
    && -[FFConfiguration writeDisclosureUpdates:](self, "writeDisclosureUpdates:", a3)
    && -[FFConfiguration writeFeatureSetUpdates:](self, "writeFeatureSetUpdates:", a3)
    && -[FFConfiguration writeSubscriptionUpdates:](self, "writeSubscriptionUpdates:", a3);
  os_unfair_lock_unlock(p_lock);
  notify_post((const char *)objc_msgSend(CFSTR("com.apple.featureflags.changed"), "UTF8String"));
  return v6;
}

+ (BOOL)isValidName:(id)a3
{
  id v3;
  unsigned __int8 *v4;
  int v5;
  unsigned __int8 *v6;
  uint64_t v7;
  int v8;
  int v9;
  BOOL v10;

  v3 = objc_retainAutorelease(a3);
  v4 = (unsigned __int8 *)objc_msgSend(v3, "UTF8String");
  v5 = *v4;
  if (!*v4)
    goto LABEL_13;
  v6 = v4;
  v7 = MEMORY[0x1E0C80978];
  if (v5 == 95)
    goto LABEL_7;
  if (((char)v5 & 0x80000000) == 0)
  {
    if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * (char)v5 + 60) & 0x100) != 0)
      goto LABEL_7;
    goto LABEL_13;
  }
  if (!__maskrune((char)v5, 0x100uLL))
  {
LABEL_13:
    v10 = 0;
    goto LABEL_15;
  }
  while (1)
  {
    do
    {
LABEL_7:
      v9 = *v6++;
      v8 = v9;
    }
    while (v9 == 95);
    if (!v8)
      break;
    if ((char)v8 < 0)
    {
      if (!__maskrune((char)v8, 0x500uLL))
        goto LABEL_13;
    }
    else if ((*(_DWORD *)(v7 + 4 * (char)v8 + 60) & 0x500) == 0)
    {
      goto LABEL_13;
    }
  }
  v10 = 1;
LABEL_15:

  return v10;
}

- (BOOL)isValidName:(id)a3
{
  return +[FFConfiguration isValidName:](FFConfiguration, "isValidName:", a3);
}

+ (BOOL)isValidDisclosureName:(id)a3
{
  id v3;
  char *v4;
  char v5;
  char *v6;
  uint64_t v7;
  char v8;
  BOOL v9;

  v3 = objc_retainAutorelease(a3);
  v4 = (char *)objc_msgSend(v3, "UTF8String");
  v5 = *v4;
  if (*v4)
  {
    v6 = v4 + 1;
    v7 = MEMORY[0x1E0C80978];
    while (1)
    {
      if (v5 != 45 && v5 != 95)
      {
        if (!v5)
        {
          v9 = 1;
          goto LABEL_13;
        }
        if (v5 < 0)
        {
          if (!__maskrune(v5, 0x500uLL))
            break;
        }
        else if ((*(_DWORD *)(v7 + 4 * v5 + 60) & 0x500) == 0)
        {
          break;
        }
      }
      v8 = *v6++;
      v5 = v8;
    }
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (BOOL)resetDomain:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t i;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  BOOL v15;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[FFConfiguration validateName:](self, "validateName:", v5);
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadAllLevelsForDomain:](self, "loadAllLevelsForDomain:", v5);
  for (i = 4; i != 8; ++i)
  {
    v7 = self->configByLevelIndex[1][i];
    -[NSMutableDictionary objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          -[FFConfiguration setValue:feature:domain:levelIndex:](self, "setValue:feature:domain:levelIndex:", 2, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), v5, i);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

  }
  v15 = -[FFConfiguration writeDomainUpdates:](self, "writeDomainUpdates:", a4)
     && -[FFConfiguration writeCombinedUpdates:](self, "writeCombinedUpdates:", a4)
     && -[FFConfiguration writeFeatureSetUpdates:](self, "writeFeatureSetUpdates:", a4)
     && -[FFConfiguration writeSubscriptionUpdates:](self, "writeSubscriptionUpdates:", a4);
  os_unfair_lock_unlock(&self->lock);
  notify_post((const char *)objc_msgSend(CFSTR("com.apple.featureflags.changed"), "UTF8String"));

  return v15;
}

- (BOOL)reset:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  char v15;
  BOOL v16;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration fileURLForLevelIndex:pathIndex:](self, "fileURLForLevelIndex:pathIndex:", 7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "fileExistsAtPath:", v7);

  if (v8
    && (objc_msgSend(v6, "path"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v5, "removeItemAtPath:error:", v9, a3),
        v9,
        (v10 & 1) == 0))
  {
    os_unfair_lock_unlock(&self->lock);
    v16 = 0;
    v11 = v6;
  }
  else
  {
    -[FFConfiguration disclosureFileURLForLevelIndex:pathIndex:](self, "disclosureFileURLForLevelIndex:pathIndex:", 7, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v5, "fileExistsAtPath:", v12);

    if (v13
      && (objc_msgSend(v11, "path"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v5, "removeItemAtPath:error:", v14, a3),
          v14,
          (v15 & 1) == 0))
    {
      os_unfair_lock_unlock(&self->lock);
      v16 = 0;
    }
    else
    {
      -[FFConfiguration clearCachedData](self, "clearCachedData");
      os_unfair_lock_unlock(&self->lock);
      notify_post((const char *)objc_msgSend(CFSTR("com.apple.featureflags.changed"), "UTF8String"));
      v16 = 1;
    }
  }

  return v16;
}

- (BOOL)isSafeMode
{
  return -[FFSafeModeChecker isItSafeMode](self->_safemodechecker, "isItSafeMode");
}

- (BOOL)phaseShouldBeEnabledByDefault:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("FeatureComplete"));
}

- (unsigned)sortValueForPhase:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  if ((objc_msgSend(CFSTR("UnderDevelopment"), "isEqualToString:") & 1) != 0)
    return 10;
  v5 = 0;
  do
  {
    v6 = v5;
    v5 += 16;
  }
  while (v5 != 64
       && !objc_msgSend(*(id *)((char *)&FFKnownPhasesAndValues + v6 + 24), "isEqualToString:", a3));
  return *(_DWORD *)((char *)&FFKnownPhasesAndValues + v6 + 16);
}

- (FFFileWriter)filewriter
{
  return self->_filewriter;
}

- (void)setFilewriter:(id)a3
{
  objc_storeStrong((id *)&self->_filewriter, a3);
}

- (FFFileReader)filereader
{
  return self->_filereader;
}

- (void)setFilereader:(id)a3
{
  objc_storeStrong((id *)&self->_filereader, a3);
}

- (FFParseErrorReporter)parseerrorreporter
{
  return self->_parseerrorreporter;
}

- (void)setParseerrorreporter:(id)a3
{
  objc_storeStrong((id *)&self->_parseerrorreporter, a3);
}

- (FFPlistParser)plistparser
{
  return self->_plistparser;
}

- (void)setPlistparser:(id)a3
{
  objc_storeStrong((id *)&self->_plistparser, a3);
}

- (FFSafeModeChecker)safemodechecker
{
  return self->_safemodechecker;
}

- (void)setSafemodechecker:(id)a3
{
  objc_storeStrong((id *)&self->_safemodechecker, a3);
}

- (FFBuildVersionGetter)buildVersionGetter
{
  return self->_buildVersionGetter;
}

- (void)setBuildVersionGetter:(id)a3
{
  objc_storeStrong((id *)&self->_buildVersionGetter, a3);
}

- (NSMutableArray)profilePayloads
{
  return self->_profilePayloads;
}

- (void)setProfilePayloads:(id)a3
{
  objc_storeStrong((id *)&self->_profilePayloads, a3);
}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  uint64_t n;
  uint64_t ii;
  uint64_t jj;
  uint64_t kk;

  objc_storeStrong((id *)&self->_profilePayloads, 0);
  objc_storeStrong((id *)&self->_buildVersionGetter, 0);
  objc_storeStrong((id *)&self->_safemodechecker, 0);
  objc_storeStrong((id *)&self->_plistparser, 0);
  objc_storeStrong((id *)&self->_parseerrorreporter, 0);
  objc_storeStrong((id *)&self->_filereader, 0);
  objc_storeStrong((id *)&self->_filewriter, 0);
  for (i = 0; i != -8; --i)
    objc_storeStrong((id *)&self->subscriptionsByLevelIndex[i + 7], 0);
  for (j = 0; j != -8; --j)
    objc_storeStrong((id *)&self->subscriptionsMetaByLevelIndex[j + 7], 0);
  objc_storeStrong((id *)&self->definedFeatureGroups, 0);
  objc_storeStrong((id *)&self->definedFeatureSets, 0);
  for (k = 0; k != -8; --k)
    objc_storeStrong((id *)&self->enabledFeatureSetsAtLevelIndexByGroup[k + 7], 0);
  for (m = 0; m != -8; --m)
    objc_storeStrong((id *)&self->enabledFeatureSetsByLevelIndex[m + 7], 0);
  for (n = 0; n != -8; --n)
    objc_storeStrong((id *)&self->featureSetsMetaByLevelIndex[n + 7], 0);
  for (ii = 0; ii != -8; --ii)
    objc_storeStrong((id *)&self->disclosuresByLevelIndex[ii + 7], 0);
  for (jj = 0; jj != -8; --jj)
    objc_storeStrong((id *)&self->metaByLevelIndex[jj + 7], 0);
  for (kk = 152; kk != 24; kk -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + kk), 0);
  objc_storeStrong((id *)&self->_domains, 0);
  objc_storeStrong((id *)&self->searchPaths, 0);
}

- (id)definedFeatureGroupsFilteredByCurrentDisclosures
{
  uint64_t v3;
  NSMutableDictionary *definedFeatureGroups;
  void *v5;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[5];

  os_unfair_lock_assert_owner(&self->lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  v3 = MEMORY[0x1E0C809B0];
  definedFeatureGroups = self->definedFeatureGroups;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __79__FFConfiguration_Disclosure__definedFeatureGroupsFilteredByCurrentDisclosures__block_invoke;
  v16[3] = &unk_1E987FB68;
  v16[4] = self;
  -[NSMutableDictionary keysOfEntriesPassingTest:](definedFeatureGroups, "keysOfEntriesPassingTest:", v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->enabledFeatureSetsAtLevelIndexByGroup[5];
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __79__FFConfiguration_Disclosure__definedFeatureGroupsFilteredByCurrentDisclosures__block_invoke_2;
  v15[3] = &unk_1E987FB90;
  v15[4] = self;
  -[NSMutableDictionary keysOfEntriesPassingTest:](v6, "keysOfEntriesPassingTest:", v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary keysOfEntriesPassingTest:](self->enabledFeatureSetsAtLevelIndexByGroup[2], "keysOfEntriesPassingTest:", &__block_literal_global);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObjectsFromSet:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setByAddingObjectsFromSet:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = self->definedFeatureGroups;
  objc_msgSend(v10, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary dictionaryWithValuesForKeys:](v11, "dictionaryWithValuesForKeys:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __79__FFConfiguration_Disclosure__definedFeatureGroupsFilteredByCurrentDisclosures__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a3, "disclosure");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "resolvedStateForDisclosure:", v4);

  return v5;
}

uint64_t __79__FFConfiguration_Disclosure__definedFeatureGroupsFilteredByCurrentDisclosures__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 488), "objectForKeyedSubscript:", a2);
  v6 = objc_claimAutoreleasedReturnValue();

  if (v6)
    v6 = objc_msgSend(v5, "count") != 0;

  return v6;
}

BOOL __79__FFConfiguration_Disclosure__definedFeatureGroupsFilteredByCurrentDisclosures__block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "count") != 0;
}

- (id)definedFeatureSetsFilteredByCurrentDisclosures
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  os_unfair_lock_assert_owner(&self->lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  -[FFConfiguration definedFeatureGroupsFilteredByCurrentDisclosures](self, "definedFeatureGroupsFilteredByCurrentDisclosures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__FFConfiguration_Disclosure__definedFeatureSetsFilteredByCurrentDisclosures__block_invoke;
  v8[3] = &unk_1E987FC00;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

void __77__FFConfiguration_Disclosure__definedFeatureSetsFilteredByCurrentDisclosures__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(a2, "featureSets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__FFConfiguration_Disclosure__definedFeatureSetsFilteredByCurrentDisclosures__block_invoke_2;
  v4[3] = &unk_1E987FBD8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void __77__FFConfiguration_Disclosure__definedFeatureSetsFilteredByCurrentDisclosures__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, v5);

}

- (id)mutableDisclosureSetAtLevelIndex:(unint64_t)a3
{
  NSMutableSet **disclosuresByLevelIndex;
  NSMutableSet *v6;
  NSMutableSet *v7;
  NSMutableSet *v8;

  os_unfair_lock_assert_owner(&self->lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  disclosuresByLevelIndex = self->disclosuresByLevelIndex;
  v6 = disclosuresByLevelIndex[a3];
  if (!v6)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v8 = disclosuresByLevelIndex[a3];
    disclosuresByLevelIndex[a3] = v7;

    v6 = disclosuresByLevelIndex[a3];
  }
  return v6;
}

- (void)addDisclosure:(id)a3 atLevel:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v6 = a3;
  if ((unint64_t)(a4 - 4) <= 0xFFFFFFFFFFFFFFFDLL)
    -[FFConfiguration(Disclosure) addDisclosure:atLevel:].cold.1(a4);
  v9 = v6;
  if (a4 == 2)
  {
    -[FFConfiguration profilePayloads](self, "profilePayloads");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      -[FFConfiguration(Disclosure) addDisclosure:atLevel:].cold.2();
    v8 = 4;
  }
  else
  {
    v8 = 7;
  }
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration addDisclosureAlreadyLocked:atLevelIndex:](self, "addDisclosureAlreadyLocked:atLevelIndex:", v9, v8);
  os_unfair_lock_unlock(&self->lock);

}

- (void)addDisclosureAlreadyLocked:(id)a3 atLevelIndex:(unint64_t)a4
{
  void *v6;
  NSMutableDictionary **metaByLevelIndex;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;

  v11 = a3;
  -[FFConfiguration mutableDisclosureSetAtLevelIndex:](self, "mutableDisclosureSetAtLevelIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsObject:", v11) & 1) == 0)
  {
    objc_msgSend(v6, "addObject:", v11);
    metaByLevelIndex = self->metaByLevelIndex;
    v8 = self->metaByLevelIndex[a4];
    if (!v8)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = metaByLevelIndex[a4];
      metaByLevelIndex[a4] = v9;

      v8 = metaByLevelIndex[a4];
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("#DISCLOSURES_MODIFIED#"));
  }
  -[FFConfiguration recalculateSubscriptionEffectsAt:](self, "recalculateSubscriptionEffectsAt:", 3);
  -[FFConfiguration recalculateSubscriptionEffectsAt:](self, "recalculateSubscriptionEffectsAt:", 6);

}

- (void)removeDisclosure:(id)a3 atLevel:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v6 = a3;
  if ((unint64_t)(a4 - 4) <= 0xFFFFFFFFFFFFFFFDLL)
    -[FFConfiguration(Disclosure) removeDisclosure:atLevel:].cold.1(a4);
  v7 = v6;
  v10 = v6;
  if (a4 == 2)
  {
    -[FFConfiguration profilePayloads](self, "profilePayloads");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      -[FFConfiguration(Disclosure) removeDisclosure:atLevel:].cold.2();
    v9 = 4;
    v7 = v10;
  }
  else
  {
    v9 = 7;
  }
  -[FFConfiguration removeDisclosure:atLevelIndex:](self, "removeDisclosure:atLevelIndex:", v7, v9);

}

- (void)removeDisclosure:(id)a3 atLevelIndex:(unint64_t)a4
{
  void *v6;
  NSMutableDictionary **metaByLevelIndex;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;

  v11 = a3;
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration mutableDisclosureSetAtLevelIndex:](self, "mutableDisclosureSetAtLevelIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsObject:", v11))
  {
    objc_msgSend(v6, "removeObject:", v11);
    metaByLevelIndex = self->metaByLevelIndex;
    v8 = self->metaByLevelIndex[a4];
    if (!v8)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = metaByLevelIndex[a4];
      metaByLevelIndex[a4] = v9;

      v8 = metaByLevelIndex[a4];
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("#DISCLOSURES_MODIFIED#"));
  }
  -[FFConfiguration recalculateSubscriptionEffectsAt:](self, "recalculateSubscriptionEffectsAt:", 3);
  -[FFConfiguration recalculateSubscriptionEffectsAt:](self, "recalculateSubscriptionEffectsAt:", 6);
  os_unfair_lock_unlock(&self->lock);

}

- (void)removeAllDisclosuresAtLevelIndex:(unint64_t)a3
{
  void *v5;
  NSMutableDictionary **metaByLevelIndex;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  if (a3 == 4)
  {
    -[FFConfiguration profilePayloads](self, "profilePayloads");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      -[FFConfiguration(Disclosure) removeAllDisclosuresAtLevelIndex:].cold.2();
  }
  else if (a3 != 7)
  {
    -[FFConfiguration(Disclosure) removeAllDisclosuresAtLevelIndex:].cold.1(a3);
  }
  os_unfair_lock_assert_owner(&self->lock);
  -[FFConfiguration mutableDisclosureSetAtLevelIndex:](self, "mutableDisclosureSetAtLevelIndex:", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");
  metaByLevelIndex = self->metaByLevelIndex;
  v7 = metaByLevelIndex[a3];
  if (!v7)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v9 = metaByLevelIndex[a3];
    metaByLevelIndex[a3] = v8;

    v7 = metaByLevelIndex[a3];
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("#DISCLOSURES_MODIFIED#"));

}

- (id)currentDisclosuresAtLevel:(int64_t)a3
{
  uint64_t v3;

  switch(a3)
  {
    case 1:
      v3 = 1;
      break;
    case 2:
      v3 = 4;
      break;
    case 3:
      v3 = 7;
      break;
    case 4:
      abort();
    default:
      v3 = 0;
      break;
  }
  return -[FFConfiguration currentDisclosuresAtLevelIndex:](self, "currentDisclosuresAtLevelIndex:", v3);
}

- (id)currentDisclosuresAtLevelIndex:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;

  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  -[FFConfiguration mutableDisclosureSetAtLevelIndex:](self, "mutableDisclosureSetAtLevelIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)currentDisclosures
{
  os_unfair_lock_s *p_lock;
  id v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;

  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  for (i = 7; i != -1; --i)
  {
    v6 = (void *)MEMORY[0x1D82678C8]();
    -[FFConfiguration mutableDisclosureSetAtLevelIndex:](self, "mutableDisclosureSetAtLevelIndex:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unionSet:", v7);

    objc_autoreleasePoolPop(v6);
  }
  v8 = (void *)objc_msgSend(v4, "copy");
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (BOOL)isValidDisclosureName:(id)a3
{
  return +[FFConfiguration isValidDisclosureName:](FFConfiguration, "isValidDisclosureName:", a3);
}

- (id)disclosureForFeature:(id)a3 domain:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  char v9;
  char v10;
  char *v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  os_unfair_lock_t lock;

  v6 = a3;
  v7 = a4;
  lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  v8 = 0;
  v9 = 1;
  while (2)
  {
    v10 = v9;
    v11 = (char *)self + 64 * v8;
    for (i = 88; i != 24; i -= 8)
    {
      objc_msgSend(*(id *)&v11[i], "objectForKeyedSubscript:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v14, "disclosurerequired");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          objc_msgSend(v14, "disclosurerequired");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[FFConfiguration resolvedStateForDisclosure:](self, "resolvedStateForDisclosure:", v17);

          if (v18)
          {
            os_unfair_lock_unlock(lock);
            objc_msgSend(v14, "disclosurerequired");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_10;
          }
        }
      }

    }
    v9 = 0;
    v8 = 1;
    if ((v10 & 1) != 0)
      continue;
    break;
  }
  os_unfair_lock_unlock(lock);
  v19 = 0;
LABEL_10:

  return v19;
}

+ (id)configurationForProfileManagement
{
  return -[FFConfiguration initPrivate]([FFConfiguration alloc], "initPrivate");
}

- (void)prepareToAddProfilePayloads
{
  id v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  os_unfair_lock_t lock;
  id obj;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadCombinedDataForLevelIndex:](self, "loadCombinedDataForLevelIndex:", 4);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[FFConfiguration setProfilePayloads:](self, "setProfilePayloads:", v3);

  v4 = self->configByLevelIndex[1][4];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[NSMutableDictionary allKeys](v4, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v17 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        objc_msgSend(v9, "allKeys");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v19;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v19 != v13)
                objc_enumerationMutation(v10);
              -[FFConfiguration setValue:feature:domain:levelIndex:](self, "setValue:feature:domain:levelIndex:", 2, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), v8, 4);
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v12);
        }

        -[NSMutableDictionary removeObjectForKey:](v4, "removeObjectForKey:", v8);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

  -[FFConfiguration removeAllDisclosuresAtLevelIndex:](self, "removeAllDisclosuresAtLevelIndex:", 4);
  -[FFConfiguration removeAllFeatureSetDataAtLevelIndex:](self, "removeAllFeatureSetDataAtLevelIndex:", 2);
  -[FFConfiguration removeAllSubscriptionsAtLevelIndex:](self, "removeAllSubscriptionsAtLevelIndex:", 3);
  os_unfair_lock_unlock(lock);

}

- (BOOL)addProfilePayload:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  id v12;

  v6 = a3;
  v12 = 0;
  v7 = FFConfigurationValidateProfilePayload(v6, &v12);
  v8 = v12;
  v9 = v8;
  if ((v7 & 1) != 0)
  {
    -[FFConfiguration profilePayloads](self, "profilePayloads");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v6);

  }
  else if (a4)
  {
    *a4 = objc_retainAutorelease(v8);
  }

  return v7;
}

- (BOOL)commitProfilePayloadsAndReturnError:(id *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  const __CFString *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  char v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  const __CFString *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t k;
  void *v53;
  void *v54;
  FFFeatureSetIdentifier *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  char v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t m;
  uint64_t v65;
  void *v66;
  void *v67;
  _BOOL4 v68;
  id v69;
  void *v70;
  _BOOL4 v71;
  id v72;
  _BOOL4 v73;
  id v74;
  _BOOL4 v75;
  id v76;
  void *v77;
  uint64_t v78;
  void *v79;
  id *v81;
  uint64_t v82;
  uint64_t v83;
  id obj;
  uint64_t v85;
  void *v86;
  id v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  id v96;
  id v97;
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  uint64_t v134;
  _QWORD v135[3];

  v135[1] = *MEMORY[0x1E0C80C00];
  -[FFConfiguration profilePayloads](self, "profilePayloads");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v81 = a3;
    os_unfair_lock_lock(&self->lock);
    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    -[FFConfiguration profilePayloads](self, "profilePayloads");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v133, 16);
    if (v82)
    {
      v83 = *(_QWORD *)v124;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v124 != v83)
            objc_enumerationMutation(obj);
          v85 = v6;
          v7 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * v6);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_85;
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Features"));
          v8 = objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v9 = (void *)v8;
            objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Features"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) == 0)
              goto LABEL_85;
          }
          v121 = 0u;
          v122 = 0u;
          v119 = 0u;
          v120 = 0u;
          v86 = v7;
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Features"));
          v87 = (id)objc_claimAutoreleasedReturnValue();
          v91 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v119, v132, 16);
          if (v91)
          {
            v89 = *(_QWORD *)v120;
            do
            {
              v12 = 0;
              do
              {
                if (*(_QWORD *)v120 != v89)
                  objc_enumerationMutation(v87);
                v13 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * v12);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  goto LABEL_85;
                objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Domain"));
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Features"));
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v16 = objc_opt_isKindOfClass();

                if ((v16 & 1) == 0)
                  goto LABEL_85;
                v93 = v12;
                v117 = 0u;
                v118 = 0u;
                v115 = 0u;
                v116 = 0u;
                objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("Features"));
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v115, v131, 16);
                if (v18)
                {
                  v19 = v18;
                  v20 = *(_QWORD *)v116;
                  do
                  {
                    for (i = 0; i != v19; ++i)
                    {
                      if (*(_QWORD *)v116 != v20)
                        objc_enumerationMutation(v17);
                      v22 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * i);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                        goto LABEL_85;
                      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("FeatureName"));
                      v23 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Enabled"));
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      v25 = objc_msgSend(v24, "BOOLValue");

                      -[FFConfiguration setValue:feature:domain:levelIndex:](self, "setValue:feature:domain:levelIndex:", v25, v23, v14, 4);
                    }
                    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v115, v131, 16);
                  }
                  while (v19);
                }

                v12 = v93 + 1;
              }
              while (v93 + 1 != v91);
              v91 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v119, v132, 16);
            }
            while (v91);
          }

          objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("Disclosures"));
          v26 = objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            v27 = (void *)v26;
            objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("Disclosures"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v29 = objc_opt_isKindOfClass();

            if ((v29 & 1) == 0)
              goto LABEL_85;
          }
          v113 = 0u;
          v114 = 0u;
          v111 = 0u;
          v112 = 0u;
          objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("Disclosures"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v111, v130, 16);
          if (v31)
          {
            v32 = v31;
            v33 = *(_QWORD *)v112;
            do
            {
              for (j = 0; j != v32; ++j)
              {
                if (*(_QWORD *)v112 != v33)
                  objc_enumerationMutation(v30);
                v35 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  goto LABEL_85;
                objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("DisclosureName"));
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                -[FFConfiguration addDisclosureAlreadyLocked:atLevelIndex:](self, "addDisclosureAlreadyLocked:atLevelIndex:", v36, 4);

              }
              v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v111, v130, 16);
            }
            while (v32);
          }

          v37 = CFSTR("FeatureSets");
          objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("FeatureSets"));
          v38 = objc_claimAutoreleasedReturnValue();
          if (v38)
          {
            v39 = (void *)v38;
            objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("FeatureSets"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v41 = objc_opt_isKindOfClass();

            if ((v41 & 1) == 0)
              goto LABEL_85;
          }
          v109 = 0u;
          v110 = 0u;
          v107 = 0u;
          v108 = 0u;
          objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("FeatureSets"));
          v88 = (id)objc_claimAutoreleasedReturnValue();
          v92 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v107, v129, 16);
          if (v92)
          {
            v90 = *(_QWORD *)v108;
            do
            {
              v42 = 0;
              do
              {
                if (*(_QWORD *)v108 != v90)
                  objc_enumerationMutation(v88);
                v43 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * v42);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  goto LABEL_85;
                objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("FeatureSetGroupName"));
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "objectForKeyedSubscript:", v37);
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                v46 = objc_opt_isKindOfClass();

                if ((v46 & 1) == 0)
                  goto LABEL_85;
                v94 = v42;
                v105 = 0u;
                v106 = 0u;
                v103 = 0u;
                v104 = 0u;
                v47 = v37;
                objc_msgSend(v43, "objectForKeyedSubscript:", v37);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v103, v128, 16);
                if (v49)
                {
                  v50 = v49;
                  v51 = *(_QWORD *)v104;
                  do
                  {
                    for (k = 0; k != v50; ++k)
                    {
                      if (*(_QWORD *)v104 != v51)
                        objc_enumerationMutation(v48);
                      v53 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * k);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) == 0)
                        goto LABEL_85;
                      objc_msgSend(v53, "objectForKeyedSubscript:", CFSTR("FeatureSetName"));
                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                      v55 = -[FFFeatureSetIdentifier initWithGroup:set:]([FFFeatureSetIdentifier alloc], "initWithGroup:set:", v44, v54);
                      if (v55)
                        -[FFConfiguration _enableFeatureSetAlreadyLocked:atLevelIndex:](self, "_enableFeatureSetAlreadyLocked:atLevelIndex:", v55, 2);

                    }
                    v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v103, v128, 16);
                  }
                  while (v50);
                }

                v42 = v94 + 1;
                v37 = v47;
              }
              while (v94 + 1 != v92);
              v92 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v107, v129, 16);
            }
            while (v92);
          }

          objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("Subscriptions"));
          v56 = objc_claimAutoreleasedReturnValue();
          if (v56)
          {
            v57 = (void *)v56;
            objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("Subscriptions"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v59 = objc_opt_isKindOfClass();

            if ((v59 & 1) == 0)
LABEL_85:
              abort();
          }
          v101 = 0u;
          v102 = 0u;
          v99 = 0u;
          v100 = 0u;
          objc_msgSend(v86, "objectForKeyedSubscript:", CFSTR("Subscriptions"));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v99, v127, 16);
          if (v61)
          {
            v62 = v61;
            v63 = *(_QWORD *)v100;
            do
            {
              for (m = 0; m != v62; ++m)
              {
                if (*(_QWORD *)v100 != v63)
                  objc_enumerationMutation(v60);
                v65 = *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * m);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  goto LABEL_85;
                -[FFConfiguration plistparser](self, "plistparser");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v66, "parseSubscriptionsFromDictionary:", v65);
                v67 = (void *)objc_claimAutoreleasedReturnValue();

                if (v67)
                  -[FFConfiguration addSubscriptionAlreadyLocked:atLevelIndex:](self, "addSubscriptionAlreadyLocked:atLevelIndex:", v67, 3);

              }
              v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v99, v127, 16);
            }
            while (v62);
          }

          v6 = v85 + 1;
        }
        while (v85 + 1 != v82);
        v82 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v123, v133, 16);
      }
      while (v82);
    }

    v98 = 0;
    v68 = -[FFConfiguration writeCombinedUpdatesAtLevelIndex:error:](self, "writeCombinedUpdatesAtLevelIndex:error:", 4, &v98);
    v69 = v98;
    v70 = v69;
    if (v81 && !v68)
      *v81 = objc_retainAutorelease(v69);
    v97 = v70;
    v71 = -[FFConfiguration writeDisclosureUpdatesAtlevelIndex:error:](self, "writeDisclosureUpdatesAtlevelIndex:error:", 4, &v97);
    v72 = v97;

    if (v81 && !v71)
      *v81 = objc_retainAutorelease(v72);
    v96 = v72;
    v73 = -[FFConfiguration writeFeatureSetUpdatesAtLevelIndex:withError:](self, "writeFeatureSetUpdatesAtLevelIndex:withError:", 2, &v96);
    v74 = v96;

    if (v81 && !v73)
      *v81 = objc_retainAutorelease(v74);
    v95 = v74;
    v75 = -[FFConfiguration writeSubscriptionUpdatesAtLevelIndex:withError:](self, "writeSubscriptionUpdatesAtLevelIndex:withError:", 3, &v95);
    v76 = v95;

    if (v81 && !v75)
      *v81 = objc_retainAutorelease(v76);
    os_unfair_lock_unlock(&self->lock);
  }
  else
  {
    v77 = (void *)MEMORY[0x1E0CB35C8];
    v78 = *MEMORY[0x1E0CB2FE0];
    v134 = *MEMORY[0x1E0CB2938];
    v135[0] = CFSTR("Must prepareToAddProfilePayloads before committing");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v135, &v134, 1);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "errorWithDomain:code:userInfo:", v78, 22, v79);
    v76 = (id)objc_claimAutoreleasedReturnValue();

    if (a3)
      *a3 = objc_retainAutorelease(v76);
    notify_post((const char *)objc_msgSend(CFSTR("com.apple.featureflags.changed"), "UTF8String"));
    LOBYTE(v75) = 0;
  }

  return v75;
}

- (id)allFeatureGroups
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  v4 = (void *)MEMORY[0x1E0C99E60];
  -[FFConfiguration definedFeatureGroupsFilteredByCurrentDisclosures](self, "definedFeatureGroupsFilteredByCurrentDisclosures");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)attributesForFeatureGroup:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  p_lock = &self->lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  -[FFConfiguration definedFeatureGroupsFilteredByCurrentDisclosures](self, "definedFeatureGroupsFilteredByCurrentDisclosures");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)featureSetsInGroup:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  p_lock = &self->lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  -[FFConfiguration definedFeatureGroupsFilteredByCurrentDisclosures](self, "definedFeatureGroupsFilteredByCurrentDisclosures");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99E60];
  if (v7)
  {
    objc_msgSend(v7, "featureSets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  os_unfair_lock_unlock(p_lock);

  return v11;
}

- (id)featureFlagsInSet:(id)a3 inGroup:(id)a4
{
  id v6;
  id v7;
  FFFeatureSetIdentifier *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  FFFeatureSetIdentifier *v24;
  os_unfair_lock_t lock;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  v26 = v7;
  v27 = v6;
  v8 = -[FFFeatureSetIdentifier initWithGroup:set:]([FFFeatureSetIdentifier alloc], "initWithGroup:set:", v7, v6);
  -[FFConfiguration definedFeatureSetsFilteredByCurrentDisclosures](self, "definedFeatureSetsFilteredByCurrentDisclosures");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v8;
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(v10, "features");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v17, "domainName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, v18);

        }
        objc_msgSend(v11, "objectForKeyedSubscript:", v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "featureName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObject:", v22);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v14);
  }

  os_unfair_lock_unlock(lock);
  return v11;
}

- (int64_t)valueForFeatureSet:(id)a3 inGroup:(id)a4 atLevel:(int64_t)a5
{
  id v8;
  id v9;
  FFFeatureSetIdentifier *v10;
  int64_t v11;

  v8 = a4;
  v9 = a3;
  v10 = -[FFFeatureSetIdentifier initWithGroup:set:]([FFFeatureSetIdentifier alloc], "initWithGroup:set:", v8, v9);

  v11 = -[FFConfiguration _valueForFeatureSet:atLevel:](self, "_valueForFeatureSet:atLevel:", v10, a5);
  return v11;
}

- (int64_t)resolvedValueForFeatureSet:(id)a3 inGroup:(id)a4
{
  id v6;
  id v7;
  FFFeatureSetIdentifier *v8;
  int64_t v9;

  v6 = a4;
  v7 = a3;
  v8 = -[FFFeatureSetIdentifier initWithGroup:set:]([FFFeatureSetIdentifier alloc], "initWithGroup:set:", v6, v7);

  v9 = -[FFConfiguration _resolvedValueForFeatureSet:](self, "_resolvedValueForFeatureSet:", v8);
  return v9;
}

- (int64_t)_resolvedValueForFeatureSet:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  v5 = -[FFConfiguration _valueForFeatureSet:atLevel:](self, "_valueForFeatureSet:atLevel:", v4, 3);
  if (v5 == 2)
    v5 = -[FFConfiguration _valueForFeatureSet:atLevel:](self, "_valueForFeatureSet:atLevel:", v4, 2);

  return v5;
}

- (int64_t)_valueForFeatureSet:(id)a3 atLevel:(int64_t)a4
{
  id v6;
  int64_t v7;

  v6 = a3;
  if (a4 != 2)
  {
    if (a4 != 3)
      -[FFConfiguration(FeatureSets) _valueForFeatureSet:atLevel:].cold.1(a4);
    a4 = 5;
  }
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  if (-[NSMutableSet containsObject:](self->enabledFeatureSetsByLevelIndex[a4], "containsObject:", v6))
    v7 = 1;
  else
    v7 = 2;
  os_unfair_lock_unlock(&self->lock);

  return v7;
}

- (void)enableFeatureSet:(id)a3 inGroup:(id)a4 atLevel:(int64_t)a5
{
  id v8;
  FFFeatureSetIdentifier *v9;
  id v10;

  v10 = a3;
  v8 = a4;
  if (a5 != 2)
  {
    if (a5 != 3)
      -[FFConfiguration(FeatureSets) _valueForFeatureSet:atLevel:].cold.1(a5);
    a5 = 5;
  }
  v9 = -[FFFeatureSetIdentifier initWithGroup:set:]([FFFeatureSetIdentifier alloc], "initWithGroup:set:", v8, v10);
  if (v9)
  {
    os_unfair_lock_lock(&self->lock);
    -[FFConfiguration loadAllData](self, "loadAllData");
    -[FFConfiguration _enableFeatureSetAlreadyLocked:atLevelIndex:](self, "_enableFeatureSetAlreadyLocked:atLevelIndex:", v9, a5);
    os_unfair_lock_unlock(&self->lock);
  }

}

- (void)unsetFeatureSet:(id)a3 inGroup:(id)a4 atLevel:(int64_t)a5
{
  id v8;
  FFFeatureSetIdentifier *v9;
  id v10;

  v10 = a3;
  v8 = a4;
  if (a5 != 2)
  {
    if (a5 != 3)
      -[FFConfiguration(FeatureSets) _valueForFeatureSet:atLevel:].cold.1(a5);
    a5 = 5;
  }
  v9 = -[FFFeatureSetIdentifier initWithGroup:set:]([FFFeatureSetIdentifier alloc], "initWithGroup:set:", v8, v10);
  if (v9)
  {
    os_unfair_lock_lock(&self->lock);
    -[FFConfiguration loadAllData](self, "loadAllData");
    -[FFConfiguration _unsetFeatureSetAlreadyLocked:atLevelIndex:](self, "_unsetFeatureSetAlreadyLocked:atLevelIndex:", v9, a5);
    os_unfair_lock_unlock(&self->lock);
  }

}

- (id)disclosureForFeatureGroup:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  p_lock = &self->lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  -[NSMutableDictionary objectForKeyedSubscript:](self->definedFeatureGroups, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_5;
  objc_msgSend(v6, "disclosure");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  if (!v8 || !-[FFConfiguration resolvedStateForDisclosure:](self, "resolvedStateForDisclosure:", v8))
  {

LABEL_5:
    v8 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v8;
}

- (void)addSubscription:(id)a3 atLevel:(int64_t)a4
{
  uint64_t v6;
  id v7;

  v7 = a3;
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  if (a4 == 2)
  {
    v6 = 3;
  }
  else
  {
    if (a4 != 3)
      -[FFConfiguration(Subscriptions) addSubscription:atLevel:].cold.1((NSString *)a4);
    v6 = 6;
  }
  -[FFConfiguration addSubscriptionAlreadyLocked:atLevelIndex:](self, "addSubscriptionAlreadyLocked:atLevelIndex:", v7, v6);
  os_unfair_lock_unlock(&self->lock);

}

- (void)removeSubscription:(id)a3 atLevel:(int64_t)a4
{
  uint64_t v6;
  NSMutableDictionary **subscriptionsMetaByLevelIndex;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  id v11;

  v11 = a3;
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  if (a4 == 2)
  {
    v6 = 3;
  }
  else
  {
    if (a4 != 3)
      -[FFConfiguration(Subscriptions) addSubscription:atLevel:].cold.1((NSString *)a4);
    v6 = 6;
  }
  -[NSMutableArray removeObject:](self->subscriptionsByLevelIndex[v6], "removeObject:", v11);
  subscriptionsMetaByLevelIndex = self->subscriptionsMetaByLevelIndex;
  v8 = self->subscriptionsMetaByLevelIndex[v6];
  if (!v8)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = subscriptionsMetaByLevelIndex[v6];
    subscriptionsMetaByLevelIndex[v6] = v9;

    v8 = subscriptionsMetaByLevelIndex[v6];
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("#MODIFIED#"));
  -[FFConfiguration recalculateSubscriptionEffectsAt:](self, "recalculateSubscriptionEffectsAt:", v6);
  os_unfair_lock_unlock(&self->lock);

}

- (id)allSubscriptionsAtLevel:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  -[FFConfiguration loadAllData](self, "loadAllData");
  if (a3 == 2)
  {
    v6 = 584;
  }
  else
  {
    if (a3 != 3)
      -[FFConfiguration(Subscriptions) addSubscription:atLevel:].cold.1((NSString *)a3);
    v6 = 608;
  }
  v7 = (void *)objc_msgSend(*(id *)((char *)&self->super.isa + v6), "copy");
  os_unfair_lock_unlock(p_lock);
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (void)fileURLForLevelIndex:(uint64_t)a1 pathIndex:.cold.1(uint64_t a1)
{
  qword_1EFEC93C0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: Call to fileURLForLevel with unexpected level";
  qword_1EFEC93F0 = a1;
  __break(1u);
}

- (void)disclosureFileURLForLevelIndex:(uint64_t)a1 pathIndex:.cold.1(uint64_t a1)
{
  qword_1EFEC93C0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: Call to disclosureFileURLForLevel with unexpected level";
  qword_1EFEC93F0 = a1;
  __break(1u);
}

- (void)featureSetsFileURLForLevelIndex:(uint64_t)a1 .cold.1(uint64_t a1)
{
  qword_1EFEC93C0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: Call to featureSetsFileURLForLevelIndex with unexpected level";
  qword_1EFEC93F0 = a1;
  __break(1u);
}

- (void)subscriptionsFileURLForLevelIndex:(uint64_t)a1 .cold.1(uint64_t a1)
{
  qword_1EFEC93C0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: Call to subscriptionsFileURLForLevelIndex with unexpected level";
  qword_1EFEC93F0 = a1;
  __break(1u);
}

- (void)recalculateFeatureSetEffectsAt:(uint64_t)a1 .cold.1(uint64_t a1)
{
  qword_1EFEC93C0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: wrong level";
  qword_1EFEC93F0 = a1;
  __break(1u);
}

- (void)loadFeatureSetDefinitionsNamed:fromURL:.cold.1()
{
  qword_1EFEC93C0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: feature group/set name was duplicated, which shouldn't be possible";
  __break(1u);
}

- (void)loadFeatureSetDefinitionsNamed:fromURL:.cold.2()
{
  qword_1EFEC93C0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: feature group name was duplicated, which shouldn't be possible";
  __break(1u);
}

- (void)loadSubscriptionDataForLevelIndex:(uint64_t)a1 .cold.1(uint64_t a1)
{
  qword_1EFEC93C0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: call to loadSubscriptionDataForLevelIndex with a level that is not permitted";
  qword_1EFEC93F0 = a1;
  __break(1u);
}

- (void)removeAllSubscriptionsAtLevelIndex:(uint64_t)a1 .cold.1(uint64_t a1)
{
  qword_1EFEC93C0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: call to removeAllSubscriptionsAtLevelIndex with a level that is not permitted";
  qword_1EFEC93F0 = a1;
  __break(1u);
}

- (void)setValue:feature:domain:levelIndex:buildVersion:.cold.1()
{
  qword_1EFEC93C0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: call to setValue with a level that is not permitted";
  qword_1EFEC93F0 = 4;
  __break(1u);
}

- (void)setValue:(uint64_t)a1 feature:domain:levelIndex:buildVersion:.cold.2(uint64_t a1)
{
  qword_1EFEC93C0 = (uint64_t)"BUG IN LIBFEATUREFLAGS: call to setValue with a level that is not permitted";
  qword_1EFEC93F0 = a1;
  __break(1u);
}

- (void)stateForFeature:(uint64_t)a1 domain:level:.cold.1(uint64_t a1)
{
  qword_1EFEC93C0 = (uint64_t)"BUG IN CLIENT OF LIBFEATUREFLAGS: Call to this function with a level that is unknown/invalid/unsupported";
  qword_1EFEC93F0 = a1;
  __break(1u);
}

@end
