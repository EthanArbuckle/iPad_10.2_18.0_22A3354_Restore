@implementation PageLoadTestRunner

- (PageLoadTestRunner)initWithTestName:(id)a3 browserController:(id)a4
{
  id v6;
  id v7;
  PageLoadTestRunner *v8;
  PageLoadTestRunner *v9;
  NSMutableArray *v10;
  NSMutableArray *pageLoadArray;
  id v12;
  NSMutableArray *pagesNeedingMemoryWarningSent;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PageLoadTestRunner;
  v8 = -[PageLoadTestRunner init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PageLoadTestRunner setTestName:](v8, "setTestName:", v6);
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pageLoadArray = v9->_pageLoadArray;
    v9->_pageLoadArray = v10;

    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSMutableArray addObject:](v9->_pageLoadArray, "addObject:", v12);
    pagesNeedingMemoryWarningSent = v9->_pagesNeedingMemoryWarningSent;
    v9->_pagesNeedingMemoryWarningSent = 0;

    v9->_cacheClearDirective = 0;
    v9->_pageRestInterval = 3.0;
    v9->_measureTime = 1;
    *(_DWORD *)&v9->_disableProgressBar = 65792;
    objc_storeStrong((id *)&v9->_browserController, a4);
    v9->_version = 4;
    v9->_allSubresourcesFinishedLoadingDelay = 1.0;
    *(_QWORD *)&v9->_currentTestIteration = 0x100000000;
    v9->_initialDelay = 0.0;

  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[PageLoadTestRunner _closeLogStream](self, "_closeLogStream");
  v3.receiver = self;
  v3.super_class = (Class)PageLoadTestRunner;
  -[PageLoadTestRunner dealloc](&v3, sel_dealloc);
}

- (void)_closeLogStream
{
  NSOutputStream *logStream;
  NSOutputStream *v4;

  logStream = self->_logStream;
  if (logStream)
  {
    -[NSOutputStream close](logStream, "close");
    v4 = self->_logStream;
    self->_logStream = 0;

  }
}

- (void)setExistingProperty:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  objc_property *Property;
  int v10;
  uint64_t v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = (objc_class *)objc_opt_class();
  v12 = objc_retainAutorelease(v6);
  Property = class_getProperty(v8, (const char *)objc_msgSend(v12, "UTF8String"));
  if (Property)
  {
    v10 = *((unsigned __int8 *)property_getAttributes(Property) + 1);
    if (v10 == 99 || v10 == 81)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "intValue"));
        v11 = objc_claimAutoreleasedReturnValue();

        v7 = (id)v11;
      }
    }
    -[PageLoadTestRunner setValue:forKey:](self, "setValue:forKey:", v7, v12);
  }

}

- (void)setTestOptions:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__PageLoadTestRunner_setTestOptions___block_invoke;
  v3[3] = &unk_1E9CF5468;
  v3[4] = self;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v3);
}

void __37__PageLoadTestRunner_setTestOptions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "isEqual:", CFSTR("suiteName")))
  {
    objc_msgSend(*(id *)(a1 + 32), "loadTestSuiteFile:", v6);
  }
  else if (objc_msgSend(v5, "isEqual:", CFSTR("url")))
  {
    v7 = *(void **)(a1 + 32);
    v8 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v6, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addPageURL:withProcessSwap:", v10, 0);

  }
  else if (objc_msgSend(v5, "isEqual:", CFSTR("URLs")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v22 = v6;
      v11 = v6;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v24;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(a1 + 32);
            v17 = (void *)MEMORY[0x1E0C99E98];
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v15), "description");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "URLWithString:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addPageURL:withProcessSwap:", v19, 0);

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v13);
      }

      v6 = v22;
    }
  }
  else
  {
    v20 = objc_msgSend(v5, "isEqual:", CFSTR("outputFilename"));
    v21 = *(void **)(a1 + 32);
    if (v20)
      objc_msgSend(v21, "setOutputFilename:", v6);
    else
      objc_msgSend(v21, "setExistingProperty:to:", v5, v6);
  }

}

- (void)addPageURL:(id)a3 withProcessSwap:(BOOL)a4
{
  _BOOL8 v4;
  unint64_t v6;
  PageLoad *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  if (v9 && self->_testIterations)
  {
    v6 = 0;
    do
    {
      v7 = -[PageLoad initWithURL:withProcessSwap:]([PageLoad alloc], "initWithURL:withProcessSwap:", v9, v4);
      -[NSMutableArray objectAtIndexedSubscript:](self->_pageLoadArray, "objectAtIndexedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v7);

      ++v6;
    }
    while (v6 < self->_testIterations);
  }

}

- (void)removeURLsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  length = a3.length;
  location = a3.location;
  -[NSMutableArray objectAtIndexedSubscript:](self->_pageLoadArray, "objectAtIndexedSubscript:", self->_currentTestIteration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 > location && self->_testIterations)
  {
    v8 = 0;
    if (location + length > v7)
      length = v7 - location;
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_pageLoadArray, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectsInRange:", location, length);

      ++v8;
    }
    while (v8 < self->_testIterations);
  }
}

- (BOOL)loadTestSuiteFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  double v31;
  void *v32;
  char v33;
  void *v34;
  double v35;
  void *v36;
  char v37;
  void *v38;
  unsigned int v39;
  unsigned int v40;
  NSMutableArray *pageLoadArray;
  id v42;
  void *v43;
  char v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  NSMutableArray *pagesNeedingMemoryWarningSent;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  BOOL v60;
  int *v61;
  char *v62;
  void *v64;
  void *v65;
  void *v66;
  char v67;
  void *v68;
  void *v69;

  v4 = objc_retainAutorelease(a3);
  syslog(4, "safari-plt-test: pathToTestSuite=%s", (const char *)objc_msgSend(v4, "UTF8String"));
  if (!v4)
    goto LABEL_46;
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PageLoadTestRunner setSuiteName:](self, "setSuiteName:", v5);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentsAtPath:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v61 = __error();
    v62 = strerror(*v61);
    NSLog((NSString *)CFSTR("safari-plt-test: Could not load test suite '%@': %s"), v4, v62);
LABEL_46:
    v60 = 0;
    goto LABEL_49;
  }
  v8 = malloc_type_malloc(objc_msgSend(v7, "length") + 1, 0xA53EC697uLL);
  v9 = objc_retainAutorelease(v7);
  memcpy(v8, (const void *)objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"));
  *((_BYTE *)v8 + objc_msgSend(v9, "length")) = 0;
  syslog(4, "safari-plt-test: testSuite=%s", (const char *)v8);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  free(v8);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("files"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contentsAtPath:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v69 = v13;
  if (v13)
  {
    v14 = malloc_type_malloc(objc_msgSend(v13, "length") + 1, 0xDC7BE519uLL);
    v15 = objc_retainAutorelease(v13);
    memcpy(v14, (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));
    *((_BYTE *)v14 + objc_msgSend(v15, "length")) = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    free(v14);
    objc_msgSend(v16, "componentsSeparatedByString:", CFSTR("\n"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
    {
      v19 = 0;
      do
      {
        objc_msgSend(v17, "objectAtIndexedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v20, "length"))
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "_web_URLWithDataAsString:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v21);

        }
        ++v19;
      }
      while (v19 < objc_msgSend(v17, "count"));
    }

    v13 = v69;
  }
  objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("\n"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v22, "count"))
  {
    v60 = 1;
    goto LABEL_48;
  }
  v68 = v10;
  v67 = 0;
  v23 = 0;
  while (1)
  {
    objc_msgSend(v22, "objectAtIndexedSubscript:", v23);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v24, "length"))
      goto LABEL_34;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "version=");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "hasPrefix:", v25);

    if ((v26 & 1) == 0)
      break;

    objc_msgSend(v22, "objectAtIndexedSubscript:", v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "substringFromIndex:", 8);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    self->_version = objc_msgSend(v24, "intValue");
LABEL_35:

    if (++v23 >= (unint64_t)objc_msgSend(v22, "count"))
    {
      v60 = 1;
      goto LABEL_44;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "pageRestIntervalInSeconds=");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v24, "hasPrefix:", v28);

  if ((v29 & 1) != 0)
  {

    objc_msgSend(v22, "objectAtIndexedSubscript:", v23);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "substringFromIndex:", 26);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "doubleValue");
    self->_pageRestInterval = v31;
    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "allSubresourcesFinishedLoadingDelayInSeconds=");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v24, "hasPrefix:", v32);

  if ((v33 & 1) != 0)
  {

    objc_msgSend(v22, "objectAtIndexedSubscript:", v23);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "substringFromIndex:", 45);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "doubleValue");
    self->_allSubresourcesFinishedLoadingDelay = v35;
    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "iterations=");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v24, "hasPrefix:", v36);

  if ((v37 & 1) != 0)
  {

    objc_msgSend(v22, "objectAtIndexedSubscript:", v23);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "substringFromIndex:", 11);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    v39 = objc_msgSend(v24, "intValue");
    self->_testIterations = v39;
    if (v39 >= 2)
    {
      v40 = 1;
      do
      {
        pageLoadArray = self->_pageLoadArray;
        v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[NSMutableArray addObject:](pageLoadArray, "addObject:", v42);

        ++v40;
      }
      while (v40 < self->_testIterations);
    }
    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "initialDelayInSeconds=");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v24, "hasPrefix:", v43);

  if ((v44 & 1) != 0)
  {

    objc_msgSend(v22, "objectAtIndexedSubscript:", v23);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "substringFromIndex:", 22);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "doubleValue");
    self->_initialDelay = v46;
    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringByTrimmingCharactersInSet:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v48, "length"))
  {

LABEL_34:
    goto LABEL_35;
  }
  if (objc_msgSend(v48, "characterAtIndex:", 0) == 35)
  {
    objc_msgSend(v48, "substringFromIndex:", 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v47;
    v66 = v47;
    v51 = v49;
    objc_msgSend(v49, "stringByTrimmingCharactersInSet:", v50);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v52, "hasPrefix:", CFSTR("["))
      && objc_msgSend(v52, "hasSuffix:", CFSTR("]"))
      && (objc_msgSend(v52, "substringWithRange:", 1, objc_msgSend(v52, "length") - 2),
          v64 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v64, "stringByTrimmingCharactersInSet:", v66),
          v65 = (void *)objc_claimAutoreleasedReturnValue(),
          v64,
          v53 = objc_msgSend(v65, "caseInsensitiveCompare:", CFSTR("SwapProcess")),
          v65,
          !v53))
    {

      v67 = 1;
    }
    else
    {

    }
    goto LABEL_35;
  }

  objc_msgSend(v22, "objectAtIndexedSubscript:", v23);
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v24, "hasPrefix:", CFSTR("[MemoryWarning]"));
  pagesNeedingMemoryWarningSent = self->_pagesNeedingMemoryWarningSent;
  if (pagesNeedingMemoryWarningSent)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v54);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](pagesNeedingMemoryWarningSent, "addObject:", v56);

  }
  if ((_DWORD)v54)
  {
    objc_msgSend(v24, "substringFromIndex:", 15);
    v57 = objc_claimAutoreleasedReturnValue();

    v24 = (id)v57;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "_web_URLWithDataAsString:", v24);
  v58 = objc_claimAutoreleasedReturnValue();
  if (v58)
  {
    v59 = (void *)v58;
    -[PageLoadTestRunner addPageURL:withProcessSwap:](self, "addPageURL:withProcessSwap:", v58, v67 & 1);

    v67 = 0;
    goto LABEL_35;
  }

  v60 = 0;
LABEL_44:
  v10 = v68;
  v13 = v69;
LABEL_48:

LABEL_49:
  return v60;
}

- (void)start
{
  NSString *logFile;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSOutputStream *v20;
  NSOutputStream *logStream;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  double initialDelay;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  unint64_t v43;
  dispatch_time_t v44;
  _QWORD block[5];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  id v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  logFile = self->_logFile;
  if (logFile && !self->_logStream)
  {
    -[NSString stringByExpandingTildeInPath](logFile, "stringByExpandingTildeInPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0;
      objc_msgSend(v7, "attributesOfItemAtPath:error:", v4, &v51);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v51;

      if (v9)
      {
        NSLog((NSString *)CFSTR("safari-plt-test: PageLoadTestRunner could not get attributes of log file: %@"), v9);
      }
      else
      {
        v10 = objc_alloc(MEMORY[0x1E0CB37A0]);
        objc_msgSend(v4, "stringByDeletingPathExtension");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v10, "initWithString:", v11);

        v13 = objc_alloc_init(MEMORY[0x1E0CB3578]);
        objc_msgSend(v13, "setDateFormat:", CFSTR("-yyyy-MM-dd-HH-mm-ss"));
        objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CB2A38]);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringFromDate:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "appendString:", v15);

        objc_msgSend(v4, "pathExtension");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "length");

        if (v17)
        {
          objc_msgSend(v12, "appendString:", CFSTR("."));
          objc_msgSend(v4, "pathExtension");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "appendString:", v18);

        }
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 0;
        objc_msgSend(v19, "moveItemAtPath:toPath:error:", v4, v12, &v50);
        v9 = v50;

        if (v9)
          NSLog((NSString *)CFSTR("safari-plt-test: PageLoadTestRunner could not rename log file: %@"), v9);

      }
    }
    v20 = (NSOutputStream *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E48]), "initToFileAtPath:append:", v4, 0);
    logStream = self->_logStream;
    self->_logStream = v20;

    -[NSOutputStream open](self->_logStream, "open");
  }
  -[PageLoadTestRunner log:](self, "log:", CFSTR("PageLoadTest Initialized."));
  -[BrowserController setFavoritesState:](self->_browserController, "setFavoritesState:", 0);
  -[BrowserController tabController](self->_browserController, "tabController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "tabCollectionViewProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "tabThumbnailCollectionView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = v24;
  if (objc_msgSend(v25, "presentationState") == 1)
  {

  }
  else
  {
    v26 = objc_msgSend(v25, "presentationState");

    if (v26 != 2)
      goto LABEL_17;
  }
  objc_msgSend(v25, "dismissAnimated:", 0);
LABEL_17:
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v22, "currentTabDocuments");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v28)
  {
    v29 = v28;
    v30 = 0;
    v31 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v47 != v31)
          objc_enumerationMutation(v27);
        v33 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        if (objc_msgSend(v33, "isLoading"))
        {
          objc_msgSend(v33, "URL");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[PageLoadTestRunner log:](self, "log:", CFSTR("%@ is loading %@, delaying start for 1 second"), v33, v34);

          objc_msgSend(v33, "stopLoading");
          v30 = 1;
        }
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v29);
  }
  else
  {
    v30 = 0;
  }

  initialDelay = self->_initialDelay;
  if (initialDelay != 0.0 || (v30 & 1) != 0)
  {
    if (initialDelay == 0.0)
    {
      v43 = 1;
    }
    else
    {
      v43 = llround(initialDelay);
      self->_initialDelay = 0.0;
    }
    -[PageLoadTestRunner log:](self, "log:", CFSTR("Test requested delay at start, delaying start for %lld second"), v43);
    v44 = dispatch_time(0, 1000000000 * v43);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__PageLoadTestRunner_start__block_invoke;
    block[3] = &unk_1E9CF1900;
    block[4] = self;
    dispatch_after(v44, MEMORY[0x1E0C80D38], block);
  }
  else
  {
    -[BrowserController processPool](self->_browserController, "processPool");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "_setObject:forBundleParameter:", MEMORY[0x1E0C9AAB0], CFSTR("enablePageLoadMeasurementCollection"));

    -[BrowserController processPool](self->_browserController, "processPool");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "_setObject:forBundleParameter:", v38, CFSTR("pageLoadMeasurementVersionNumber"));

    -[BrowserController processPool](self->_browserController, "processPool");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_allSubresourcesFinishedLoadingDelay);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "_setObject:forBundleParameter:", v40, CFSTR("pageLoadMeasurementAllSubresourcesFinishedLoadingDelay"));

    if (self->_pageRestInterval == 0.0)
      +[PageLoadTestStatistics setRestInterval:](PageLoadTestStatistics, "setRestInterval:");
    -[PageLoadTestRunner removeURLsInRange:](self, "removeURLsInRange:", 0, self->_skipCount);
    if (!-[PageLoadTestRunner checkForWorldLeaksNow](self, "checkForWorldLeaksNow"))
    {
      if (self->_cacheClearDirective == 1)
        -[PageLoadTestRunner clearCacheWithURL:](self, "clearCacheWithURL:", 0);
      objc_msgSend(MEMORY[0x1E0C92C80], "defaultTimeoutInterval");
      self->_savedDefaultTimeoutInterval = v41;
      if (self->_disableProgressBar)
      {
        objc_msgSend(MEMORY[0x1E0C92C80], "setDefaultTimeoutInterval:", 5.0);
        -[BrowserController setProgressEnabled:](self->_browserController, "setProgressEnabled:", 0);
      }
      -[BrowserController rootViewController](self->_browserController, "rootViewController");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "updateWebViewSizeAttributes");

      srand(1u);
      -[PageLoadTestRunner startNextPage](self, "startNextPage");
    }
  }

}

uint64_t __27__PageLoadTestRunner_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "start");
}

- (void)startNextPage
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PageLoadTestRunner_startNextPage__block_invoke;
  block[3] = &unk_1E9CF1900;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __35__PageLoadTestRunner_startNextPage__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startNextPageNow");
}

- (void)_startNextPageNow
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  TabDocument *v26;
  TabDocument *v27;
  TabDocument *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (!self->_started)
  {
    if (!self->_currentTestIteration)
      -[PageLoadTestRunner startingTestRunner](self, "startingTestRunner");
    self->_started = 1;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[NSMutableArray objectAtIndexedSubscript:](self->_pageLoadArray, "objectAtIndexedSubscript:", self->_currentTestIteration);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (!v4)
  {
LABEL_16:

LABEL_17:
    -[BrowserController tabController](self->_browserController, "tabController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activeTabDocument");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "closeTabDocument:animated:", v11, 1);
    -[PageLoadTestRunner finish](self, "finish");
    goto LABEL_42;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v34;
LABEL_7:
  v8 = 0;
  v9 = v6;
  while (1)
  {
    if (*(_QWORD *)v34 != v7)
      objc_enumerationMutation(v3);
    v6 = *(id *)(*((_QWORD *)&v33 + 1) + 8 * v8);

    if (self->_failFast && objc_msgSend(v6, "status") == 6)
      goto LABEL_15;
    if (!objc_msgSend(v6, "status"))
      break;
    ++v8;
    v9 = v6;
    if (v5 == v8)
    {
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v5)
        goto LABEL_7;
LABEL_15:

      goto LABEL_16;
    }
  }

  if (!v6)
    goto LABEL_17;
  objc_msgSend(v6, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "absoluteString");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  syslog(4, "safari-plt-test: Loading next url=%s", (const char *)objc_msgSend(v13, "UTF8String"));

  if (self->_cacheClearDirective == 2)
  {
    objc_msgSend(v6, "URL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PageLoadTestRunner clearCacheWithURL:](self, "clearCacheWithURL:", v14);

  }
  if (self->_pageTimeout > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__pageTimeoutExpired_, v6, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTimer:", v15);

  }
  if (self->_collectHeapStatistics)
    objc_msgSend(v6, "setHeapBefore:", +[PageLoadTestRunner heapStatistics](PageLoadTestRunner, "heapStatistics"));
  if (self->_measureTime)
  {
    objc_msgSend(v6, "setUiProcessStartTime:", mach_continuous_time());
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUiProcessStartDate:", v16);

    v17 = WBS_LOG_CHANNEL_PREFIXPLT();
    if (os_signpost_enabled(v17))
    {
      v18 = v17;
      objc_msgSend(v6, "URL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v19;
      _os_signpost_emit_with_name_impl(&dword_1D7CA3000, v18, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PLT_FirstMeaningfulPaint", "%{public}@", buf, 0xCu);

    }
    v20 = WBS_LOG_CHANNEL_PREFIXPLT();
    if (os_signpost_enabled(v20))
    {
      v21 = v20;
      objc_msgSend(v6, "URL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v22;
      _os_signpost_emit_with_name_impl(&dword_1D7CA3000, v21, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PLT_DOMContentLoaded", "%{public}@", buf, 0xCu);

    }
    v23 = WBS_LOG_CHANNEL_PREFIXPLT();
    if (os_signpost_enabled(v23))
    {
      v24 = v23;
      objc_msgSend(v6, "URL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v38 = v25;
      _os_signpost_emit_with_name_impl(&dword_1D7CA3000, v24, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PLT_AllSubresourcesLoaded", "%{public}@", buf, 0xCu);

    }
  }
  objc_msgSend(v6, "setStatus:", 1);
  -[PageLoadTestRunner startingTestPage:](self, "startingTestPage:", v6);
  -[BrowserController tabController](self->_browserController, "tabController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activeTabDocument");
  v26 = (TabDocument *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (self->_loadURLInNewTab && !-[TabDocument isBlank](v26, "isBlank"))
  {
    v28 = -[TabDocument initWithBrowserController:]([TabDocument alloc], "initWithBrowserController:", self->_browserController);
    objc_msgSend(v11, "insertNewTabDocument:forcingOrderAfterTabDocument:inBackground:animated:", v28, v27, 0, 0);
  }
  else
  {
    if (!objc_msgSend(v6, "swapProcess"))
      goto LABEL_38;
    v28 = -[TabDocument initWithBrowserController:]([TabDocument alloc], "initWithBrowserController:", self->_browserController);
    objc_msgSend(v11, "insertNewTabDocument:forcingOrderAfterTabDocument:inBackground:animated:", v28, v27, 0, 0);
    objc_msgSend(v11, "setActiveTabDocument:animated:", v28, 0);
    objc_msgSend(v11, "closeTabDocument:animated:", v27, 1);
  }

  v27 = v28;
LABEL_38:
  objc_msgSend(v6, "URL");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __39__PageLoadTestRunner__startNextPageNow__block_invoke;
  v31[3] = &unk_1E9CF5490;
  v31[4] = self;
  v10 = v6;
  v32 = v10;
  -[TabDocument loadTestURL:withCallback:pagesNeedingMemoryWarningSent:](v27, "loadTestURL:withCallback:pagesNeedingMemoryWarningSent:", v29, v31, self->_pagesNeedingMemoryWarningSent);

  if (objc_msgSend(v10, "status") == 1)
  {
    objc_msgSend(v10, "setStatus:", 2);
    if (self->_measureTime)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWebContentProcessStartLoadDate:", v30);

    }
  }

LABEL_42:
}

void __39__PageLoadTestRunner__startNextPageNow__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "loadError");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishPage:stats:error:", v3, v4, v5);

}

- (void)finish
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  unsigned int testIterations;
  unsigned int v10;
  dispatch_time_t v11;
  _QWORD block[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableArray objectAtIndexedSubscript:](self->_pageLoadArray, "objectAtIndexedSubscript:", self->_currentTestIteration);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v8, "status") <= 4)
          objc_msgSend(v8, "setStatus:", 6);
        objc_msgSend(v8, "setTimer:", 0);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0C92C80], "setDefaultTimeoutInterval:", self->_savedDefaultTimeoutInterval);
  -[PageLoadTestRunner checkForWorldLeaksSoon](self, "checkForWorldLeaksSoon");
  -[PageLoadTestRunner finishedTestRunnerIteration](self, "finishedTestRunnerIteration");
  testIterations = self->_testIterations;
  v10 = self->_currentTestIteration + 1;
  self->_currentTestIteration = v10;
  if (testIterations && v10 < testIterations)
  {
    self->_started = 0;
    v11 = dispatch_time(0, 5000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__PageLoadTestRunner_finish__block_invoke;
    block[3] = &unk_1E9CF1900;
    block[4] = self;
    dispatch_after(v11, MEMORY[0x1E0C80D38], block);
  }
  else
  {
    -[PageLoadTestRunner finishedTestRunner](self, "finishedTestRunner");
    -[PageLoadTestRunner _closeLogStream](self, "_closeLogStream");
  }
}

uint64_t __28__PageLoadTestRunner_finish__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "start");
}

- (id)_pageLoadForTabDocument:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableArray objectAtIndexedSubscript:](self->_pageLoadArray, "objectAtIndexedSubscript:", self->_currentTestIteration, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "status") && objc_msgSend(v7, "status") < 5)
        {
          v4 = v7;
          goto LABEL_12;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  return v4;
}

- (void)_pageTimeoutExpired:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endLoadDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(v10, "fireDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEndLoadDate:", v6);

  }
  v7 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Page load timed out"), *MEMORY[0x1E0CB2D50], 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("PageLoadErrorDomain"), -2, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setTimer:", 0);
  -[PageLoadTestRunner finishPage:stats:error:](self, "finishPage:stats:error:", v4, 0, v9);

}

- (void)_pageRestExpired:(id)a3
{
  id v4;

  objc_msgSend(a3, "userInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "status") == 4)
  {
    objc_msgSend(v4, "setTimer:", 0);
    -[PageLoadTestRunner finishPage:stats:error:](self, "finishPage:stats:error:", v4, 0, 0);
  }

}

- (void)_checkRedirect:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[BrowserController tabController](self->_browserController, "tabController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeTabDocument");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v7, "isEqual:", v6);

  if ((v5 & 1) == 0)
    objc_msgSend(v8, "setRedirectURL:", v6);

}

- (void)_updatePageLoad:(id)a3 stats:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  NSObject *v22;
  NSObject *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  NSObject *v29;
  NSObject *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  int v34;
  unint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "loadStartDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v6, "setWebContentProcessStartLoadDate:", v9);
    objc_msgSend(v8, "lastPageLoadEventDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v6, "setEndLoadDate:", v10);
    objc_msgSend(v8, "firstVisualLayoutDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      objc_msgSend(v6, "setFirstVisualLayoutDate:", v11);
    objc_msgSend(v8, "domContentLoadedDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v6, "setDomContentLoadedDate:", v12);
      objc_msgSend(v6, "uiProcessStartDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", v13);
      v15 = v14;

      v16 = WBS_LOG_CHANNEL_PREFIXPLT();
      if (os_signpost_enabled(v16))
      {
        v17 = v16;
        v34 = 134217984;
        v35 = continuousTimeAddInterval(objc_msgSend(v6, "uiProcessStartTime"), v15);
        _os_signpost_emit_with_name_impl(&dword_1D7CA3000, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PLT_DOMContentLoaded", "%{signpost.description:end_time}llu", (uint8_t *)&v34, 0xCu);

      }
    }
    objc_msgSend(v8, "firstMeaningfulPaintDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v6, "setFirstMeaningfulPaintDate:", v18);
      objc_msgSend(v6, "uiProcessStartDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeIntervalSinceDate:", v19);
      v21 = v20;

      v22 = WBS_LOG_CHANNEL_PREFIXPLT();
      if (os_signpost_enabled(v22))
      {
        v23 = v22;
        v24 = continuousTimeAddInterval(objc_msgSend(v6, "uiProcessStartTime"), v21);
        v34 = 134217984;
        v35 = v24;
        _os_signpost_emit_with_name_impl(&dword_1D7CA3000, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PLT_FirstMeaningfulPaint", "%{signpost.description:end_time}llu", (uint8_t *)&v34, 0xCu);

      }
    }
    objc_msgSend(v8, "allSubresourcesLoadedDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v6, "setAllSubresourcesLoadedDate:", v25);
      objc_msgSend(v6, "uiProcessStartDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "timeIntervalSinceDate:", v26);
      v28 = v27;

      v29 = WBS_LOG_CHANNEL_PREFIXPLT();
      if (os_signpost_enabled(v29))
      {
        v30 = v29;
        v31 = continuousTimeAddInterval(objc_msgSend(v6, "uiProcessStartTime"), v28);
        v34 = 134217984;
        v35 = v31;
        _os_signpost_emit_with_name_impl(&dword_1D7CA3000, v30, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PLT_AllSubresourcesLoaded", "%{signpost.description:end_time}llu", (uint8_t *)&v34, 0xCu);

      }
    }

  }
  objc_msgSend(v6, "endLoadDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEndLoadDate:", v33);

  }
  if (self->_collectHeapStatistics)
    objc_msgSend(v6, "setHeapAfter:", +[PageLoadTestRunner heapStatistics](PageLoadTestRunner, "heapStatistics"));

}

- (void)finishPage:(id)a3 stats:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v16, "status") <= 4)
  {
    if (v9)
    {
      objc_msgSend(v16, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        objc_msgSend(v16, "setError:", v9);
    }
    if (objc_msgSend(v16, "status") == 2
      && (-[PageLoadTestRunner _updatePageLoad:stats:](self, "_updatePageLoad:stats:", v16, v8),
          -[PageLoadTestRunner _checkRedirect:](self, "_checkRedirect:", v16),
          objc_msgSend(v16, "error"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v11,
          !v11)
      && -[PageLoadTestRunner startPageAction:](self, "startPageAction:", v16))
    {
      objc_msgSend(v16, "setStatus:", 3);
    }
    else if (objc_msgSend(v16, "status") > 3 || self->_pageRestInterval == 0.0)
    {
      if (objc_msgSend(v16, "status") != 4
        || (objc_msgSend(v16, "timer"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, !v13))
      {
        objc_msgSend(v16, "setTimer:", 0);
        objc_msgSend(v16, "error");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          v15 = 6;
        else
          v15 = 5;
        objc_msgSend(v16, "setStatus:", v15);
        -[PageLoadTestRunner finishedTestPage:](self, "finishedTestPage:", v16);
        -[PageLoadTestRunner startNextPage](self, "startNextPage");
      }
    }
    else
    {
      objc_msgSend(v16, "setStatus:", 4);
      objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__pageRestExpired_, v16, 0, self->_pageRestInterval);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTimer:", v12);

    }
  }

}

- (BOOL)startPageAction:(id)a3
{
  double pageActionInterval;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  pageActionInterval = self->_pageActionInterval;
  if (pageActionInterval > 0.0)
  {
    v5 = (void *)MEMORY[0x1E0C99D68];
    v6 = a3;
    objc_msgSend(v5, "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startRenderFps:", v7);

    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__handleActionTimer_, v6, 1, self->_pageActionInterval);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTimer:", v8);

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addTimer:forMode:", v10, *MEMORY[0x1E0DC55B0]);
  }
  return pageActionInterval > 0.0;
}

- (BOOL)performActionForPage:(id)a3
{
  return 0;
}

- (void)_handleActionTimer:(id)a3
{
  void *v4;
  double v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[PageLoadTestRunner performActionForPage:](self, "performActionForPage:"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finishRenderFps:", v4);

    if (-[PageLoadTestRunner resetsZoomBetweenPages](self, "resetsZoomBetweenPages"))
    {
      LODWORD(v5) = 1.0;
      -[BrowserController setZoomScale:](self->_browserController, "setZoomScale:", v5);
    }
    -[PageLoadTestRunner finishPage:stats:error:](self, "finishPage:stats:error:", v6, 0, 0);
  }

}

- (void)startingTestRunner
{
  -[PageLoadTestRunner log:](self, "log:", CFSTR("PageLoadTest Started."));
}

- (void)finishedTestRunnerIteration
{
  -[PageLoadTestRunner log:](self, "log:", CFSTR("PageLoadTest Iteration %u of %u Complete."), self->_currentTestIteration + 1, self->_testIterations);
}

- (void)finishedTestRunner
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pageLoadTestRunnerFinished:", self);

  -[PageLoadTestRunner log:](self, "log:", CFSTR("PageLoadTest Finished."));
}

- (void)startingTestPage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PageLoadTestRunner browserController](self, "browserController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeTabDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStoreBannersAreDisabled:", 1);

  -[PageLoadTestRunner browserController](self, "browserController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFavoritesState:animated:", 0, 0);

}

- (void)finishedTestPage:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t buf[16];

  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXPLT();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7CA3000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "UIProcessPageLoad", (const char *)&unk_1D7ED143D, buf, 2u);
  }
  -[PageLoadTestRunner log:](self, "log:", CFSTR("%@"), v4);

}

- (void)log:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  NSOutputStream *logStream;
  id v8;
  uint64_t v9;

  v4 = (objc_class *)MEMORY[0x1E0CB37A0];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithFormat:arguments:", v5, &v9);

  objc_msgSend(v6, "insertString:atIndex:", CFSTR("safari-plt-test Page Load: "), 0);
  NSLog((NSString *)CFSTR("%@"), v6);
  if (self->_logStream)
  {
    objc_msgSend(v6, "appendString:", CFSTR("\n"));
    logStream = self->_logStream;
    v8 = objc_retainAutorelease(v6);
    -[NSOutputStream write:maxLength:](logStream, "write:maxLength:", objc_msgSend(v8, "UTF8String"), objc_msgSend(v8, "lengthOfBytesUsingEncoding:", 4));
  }

}

- (void)clearCacheWithURL:(id)a3
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C92C50], "sharedURLCache", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllCachedResponses");

  objc_msgSend(MEMORY[0x1E0DD9730], "emptyCache");
}

+ (void)addLeakToArray:(id)a3 count:(int)a4 name:(id)a5
{
  uint64_t v6;
  void *v7;
  const char *v8;
  id v9;
  id v10;

  if (a4)
  {
    v6 = *(_QWORD *)&a4;
    v7 = (void *)MEMORY[0x1E0CB3940];
    if (a4 == 1)
      v8 = "";
    else
      v8 = "s";
    v9 = a3;
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%d %@%s"), v6, a5, v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
}

+ (BOOL)closingBrowserWindowsForWorldLeakTest
{
  return 0;
}

+ (id)worldLeaksString
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addLeakToArray:count:name:", v3, objc_msgSend(MEMORY[0x1E0DD9770], "webViewCount"), CFSTR("WebView object"));
  objc_msgSend(a1, "addLeakToArray:count:name:", v3, objc_msgSend(MEMORY[0x1E0DD9770], "frameCount"), CFSTR("WebFrame object"));
  objc_msgSend(a1, "addLeakToArray:count:name:", v3, objc_msgSend(MEMORY[0x1E0DD9770], "dataSourceCount"), CFSTR("WebDataSource object"));
  objc_msgSend(a1, "addLeakToArray:count:name:", v3, objc_msgSend(MEMORY[0x1E0DD9770], "viewCount"), CFSTR("WebFrameView object"));
  objc_msgSend(a1, "addLeakToArray:count:name:", v3, objc_msgSend(MEMORY[0x1E0DD9770], "HTMLRepresentationCount"), CFSTR("WebHTMLRepresentation object"));
  objc_msgSend(a1, "addLeakToArray:count:name:", v3, objc_msgSend(MEMORY[0x1E0DD9770], "bridgeCount"), CFSTR("WebBridge object"));
  objc_msgSend(a1, "addLeakToArray:count:name:", v3, objc_msgSend(MEMORY[0x1E0DD9730], "javaScriptInterpretersCount"), CFSTR("JavaScript interpreter"));
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)finishCheckingForWorldLeaks
{
  void *v2;
  BOOL v3;

  objc_msgSend((id)objc_opt_class(), "worldLeaksString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)closeBrowserWindowsAndFinishCheckingForWorldLeaks
{
  if (self->_checkForWorldLeaks)
  {
    -[PageLoadTestRunner closeBrowserWindows](self, "closeBrowserWindows");
    -[PageLoadTestRunner performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_finishCheckingForWorldLeaks, 0, 2.5);
  }
}

- (void)checkForWorldLeaksSoon
{
  if (self->_checkForWorldLeaks)
    -[PageLoadTestRunner performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_closeBrowserWindowsAndFinishCheckingForWorldLeaks, 0, 0.0);
}

- (BOOL)checkForWorldLeaksNow
{
  if (!self->_checkForWorldLeaks)
    return 0;
  -[PageLoadTestRunner closeBrowserWindows](self, "closeBrowserWindows");
  return -[PageLoadTestRunner finishCheckingForWorldLeaks](self, "finishCheckingForWorldLeaks");
}

+ ($2825F4736939C4A6D3AD43837233062D)heapStatistics
{
  unsigned int *v2;
  unint64_t v3;
  unint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v10;
  int v11;

  v2 = (unsigned int *)MEMORY[0x1E0C83ED0];
  v3 = *MEMORY[0x1E0C83ED0];
  if ((_DWORD)v3)
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = (uint64_t *)MEMORY[0x1E0C83FC0];
    v8 = *MEMORY[0x1E0C83FC0];
    do
    {
      if (*(_QWORD *)(*(_QWORD *)(v8 + 8 * v4) + 24) == *(_QWORD *)(*(_QWORD *)v8 + 24))
      {
        scalable_zone_info();
        v5 += v10;
        v6 = (v11 + v6);
        v8 = *v7;
        v3 = *v2;
      }
      ++v4;
    }
    while (v4 < v3);
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  return ($2825F4736939C4A6D3AD43837233062D)(v5 | (unint64_t)(v6 << 32));
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)logFile
{
  return self->_logFile;
}

- (void)setLogFile:(id)a3
{
  objc_storeStrong((id *)&self->_logFile, a3);
}

- (NSString)outputFilename
{
  return self->_outputFilename;
}

- (void)setOutputFilename:(id)a3
{
  objc_storeStrong((id *)&self->_outputFilename, a3);
}

- (NSString)suiteName
{
  return self->_suiteName;
}

- (void)setSuiteName:(id)a3
{
  objc_storeStrong((id *)&self->_suiteName, a3);
}

- (unint64_t)skipCount
{
  return self->_skipCount;
}

- (void)setSkipCount:(unint64_t)a3
{
  self->_skipCount = a3;
}

- (BOOL)disableProgressBar
{
  return self->_disableProgressBar;
}

- (void)setDisableProgressBar:(BOOL)a3
{
  self->_disableProgressBar = a3;
}

- (BOOL)failFast
{
  return self->_failFast;
}

- (void)setFailFast:(BOOL)a3
{
  self->_failFast = a3;
}

- (BOOL)resetsZoomBetweenPages
{
  return self->_resetsZoomBetweenPages;
}

- (void)setResetsZoomBetweenPages:(BOOL)a3
{
  self->_resetsZoomBetweenPages = a3;
}

- (double)pageTimeout
{
  return self->_pageTimeout;
}

- (void)setPageTimeout:(double)a3
{
  self->_pageTimeout = a3;
}

- (double)pageActionInterval
{
  return self->_pageActionInterval;
}

- (void)setPageActionInterval:(double)a3
{
  self->_pageActionInterval = a3;
}

- (double)pageRestInterval
{
  return self->_pageRestInterval;
}

- (void)setPageRestInterval:(double)a3
{
  self->_pageRestInterval = a3;
}

- (int)cacheClearDirective
{
  return self->_cacheClearDirective;
}

- (void)setCacheClearDirective:(int)a3
{
  self->_cacheClearDirective = a3;
}

- (BOOL)collectHeapStatistics
{
  return self->_collectHeapStatistics;
}

- (void)setCollectHeapStatistics:(BOOL)a3
{
  self->_collectHeapStatistics = a3;
}

- (BOOL)checkForWorldLeaks
{
  return self->_checkForWorldLeaks;
}

- (void)setCheckForWorldLeaks:(BOOL)a3
{
  self->_checkForWorldLeaks = a3;
}

- (PageLoadTestRunnerDelegate)delegate
{
  return (PageLoadTestRunnerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)tabCount
{
  return self->_tabCount;
}

- (void)setTabCount:(unint64_t)a3
{
  self->_tabCount = a3;
}

- (BOOL)loadURLInNewTab
{
  return self->_loadURLInNewTab;
}

- (void)setLoadURLInNewTab:(BOOL)a3
{
  self->_loadURLInNewTab = a3;
}

- (BrowserController)browserController
{
  return self->_browserController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suiteName, 0);
  objc_storeStrong((id *)&self->_outputFilename, 0);
  objc_storeStrong((id *)&self->_logFile, 0);
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong((id *)&self->_logStream, 0);
  objc_storeStrong((id *)&self->_pageLoadArray, 0);
  objc_storeStrong((id *)&self->_pagesNeedingMemoryWarningSent, 0);
}

@end
