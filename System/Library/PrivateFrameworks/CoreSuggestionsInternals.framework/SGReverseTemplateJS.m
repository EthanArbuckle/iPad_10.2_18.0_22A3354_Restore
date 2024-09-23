@implementation SGReverseTemplateJS

- (SGReverseTemplateJS)init
{
  id v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  dispatch_source_t v16;
  void *v17;
  NSObject *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  NSObject *v23;
  id v24;
  id location;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)SGReverseTemplateJS;
  v2 = -[SGReverseTemplateJS init](&v26, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    v4 = (void *)*((_QWORD *)v2 + 5);
    *((_QWORD *)v2 + 5) = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.suggestions.reversetemplatejs", v5);

    objc_storeStrong((id *)v2 + 9, v6);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.suggestions.reversetemplatejs.pressure", v8);
    v10 = (void *)*((_QWORD *)v2 + 10);
    *((_QWORD *)v2 + 10) = v9;

    location = 0;
    objc_initWeak(&location, v2);
    +[SGAsset asset](SGAsset, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __27__SGReverseTemplateJS_init__block_invoke;
    v22[3] = &unk_1E7DAC510;
    v13 = v6;
    v23 = v13;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v11, "registerUpdateHandler:", v22);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v14;

    v16 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 0x37uLL, *((dispatch_queue_t *)v2 + 10));
    v17 = (void *)*((_QWORD *)v2 + 11);
    *((_QWORD *)v2 + 11) = v16;

    v18 = *((_QWORD *)v2 + 11);
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __27__SGReverseTemplateJS_init__block_invoke_3;
    v20[3] = &unk_1E7DB7010;
    objc_copyWeak(&v21, &location);
    dispatch_source_set_event_handler(v18, v20);
    dispatch_resume(*((dispatch_object_t *)v2 + 11));
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v24);

    objc_destroyWeak(&location);
  }
  return (SGReverseTemplateJS *)v2;
}

- (id)_callJSFunction:(id)a3 withArguments:(id)a4
{
  NSObject *v6;
  id v7;
  id v8;
  NSObject *v9;
  dispatch_time_t v10;
  void *v11;

  dispatch_get_global_queue(2, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = a4;
  v8 = a3;
  v9 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v6);

  dispatch_source_set_event_handler(v9, &__block_literal_global_12775);
  v10 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_resume(v9);
  objc_msgSend(v8, "callWithArguments:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_source_cancel(v9);
  return v11;
}

- (void)_handleMemoryPressureStatus:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  _BYTE buf[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  sgEventsLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[SGReverseTemplateJS _stringFromMemoryPressureStatus:](self, "_stringFromMemoryPressureStatus:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_INFO, "SGReverseTemplateJS: Received %@ notification.", buf, 0xCu);

  }
  if (a3 == 32 || a3 == 16)
  {
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    objc_copyWeak(&v7, (id *)buf);
    SGThrottle();
    objc_destroyWeak(&v7);
    objc_destroyWeak((id *)buf);
  }
}

- (id)_stringFromMemoryPressureStatus:(unint64_t)a3
{
  if ((uint64_t)a3 > 3)
  {
    if (a3 == 4)
      return CFSTR("DISPATCH_MEMORYPRESSURE_CRITICAL");
    if (a3 == 16)
      return CFSTR("DISPATCH_MEMORYPRESSURE_PROC_LIMIT_WARN");
  }
  else
  {
    if (a3 == 1)
      return CFSTR("DISPATCH_MEMORYPRESSURE_NORMAL");
    if (a3 == 2)
      return CFSTR("DISPATCH_MEMORYPRESSURE_WARN");
  }
  if (a3 == 32)
    return CFSTR("DISPATCH_MEMORYPRESSURE_PROC_LIMIT_CRITICAL");
  else
    return CFSTR("UNKNOWN");
}

- (void)dealloc
{
  void *v3;
  NSObject *memoryPressureSource;
  objc_super v5;

  +[SGAsset asset](SGAsset, "asset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deregisterUpdateHandlerAsyncWithToken:", self->_assetUpdateToken);

  memoryPressureSource = self->_memoryPressureSource;
  if (memoryPressureSource)
    dispatch_source_cancel(memoryPressureSource);
  v5.receiver = self;
  v5.super_class = (Class)SGReverseTemplateJS;
  -[SGReverseTemplateJS dealloc](&v5, sel_dealloc);
}

- (id)getJSContext
{
  JSContext *jsContext;
  void *v4;
  id v5;
  JSVirtualMachine *v6;
  JSVirtualMachine *jsVM;
  JSContext *v8;
  JSContext *v9;
  NSMutableArray *v10;
  NSMutableArray *memoryMappedFiles;
  NSMutableArray *v12;
  NSMutableArray *memoryMappedFileNames;
  NSObject *v14;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[SGReverseTemplateJS refreshAssetPath](self, "refreshAssetPath");
  jsContext = self->_jsContext;
  if (jsContext)
    return jsContext;
  if (!self->_assetPath)
  {
    jsContext = 0;
    return jsContext;
  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v4 = (void *)getJSVirtualMachineClass_softClass;
  v20 = getJSVirtualMachineClass_softClass;
  if (!getJSVirtualMachineClass_softClass)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __getJSVirtualMachineClass_block_invoke;
    v16[3] = &unk_1E7DB7220;
    v16[4] = &v17;
    __getJSVirtualMachineClass_block_invoke((uint64_t)v16);
    v4 = (void *)v18[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v17, 8);
  v6 = (JSVirtualMachine *)objc_opt_new();
  jsVM = self->_jsVM;
  self->_jsVM = v6;

  v8 = (JSContext *)objc_msgSend(objc_alloc((Class)getJSContextClass()), "initWithVirtualMachine:", self->_jsVM);
  v9 = self->_jsContext;
  self->_jsContext = v8;

  -[JSContext setName:](self->_jsContext, "setName:", CFSTR("SGReverseTemplateJS"));
  v10 = (NSMutableArray *)objc_opt_new();
  memoryMappedFiles = self->_memoryMappedFiles;
  self->_memoryMappedFiles = v10;

  v12 = (NSMutableArray *)objc_opt_new();
  memoryMappedFileNames = self->_memoryMappedFileNames;
  self->_memoryMappedFileNames = v12;

  sgEventsLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    LOWORD(v16[0]) = 0;
    _os_log_impl(&dword_1C3607000, v14, OS_LOG_TYPE_INFO, "SGReverseTemplateJS: initialized JS context.", (uint8_t *)v16, 2u);
  }

  -[SGReverseTemplateJS initCurrentAsset](self, "initCurrentAsset");
  return self->_jsContext;
}

- (void)freeJSContext
{
  NSObject *v3;
  JSVirtualMachine *jsVM;
  JSContext *jsContext;
  NSMutableArray *memoryMappedFiles;
  NSMutableArray *memoryMappedFileNames;
  uint8_t v8[16];

  sgEventsLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_INFO, "SGReverseTemplateJS: freeing JS context.", v8, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  jsVM = self->_jsVM;
  self->_jsVM = 0;

  jsContext = self->_jsContext;
  self->_jsContext = 0;

  memoryMappedFiles = self->_memoryMappedFiles;
  self->_memoryMappedFiles = 0;

  memoryMappedFileNames = self->_memoryMappedFileNames;
  self->_memoryMappedFileNames = 0;

}

- (void)refreshAssetPath
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  +[SGAsset asset](SGAsset, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filesystemPathForAssetDataRelativePath:", CFSTR("ReverseTemplateJS"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGReverseTemplateJS.m"), 246, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetPath"));

    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGReverseTemplateJS setAssetPath:](self, "setAssetPath:", v6);

}

- (void)setAssetPath:(id)a3
{
  NSObject *queue;
  id v5;
  NSURL *assetPath;
  id obj;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  objc_msgSend(v5, "URLByStandardizingPath");
  obj = (id)objc_claimAutoreleasedReturnValue();

  assetPath = self->_assetPath;
  if (!assetPath || (-[NSURL isEqual:](assetPath, "isEqual:", obj) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_assetPath, obj);
    -[SGReverseTemplateJS freeJSContext](self, "freeJSContext");
  }

}

- (id)processLoadRequestWithFileName:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(getJSValueClass(), "valueWithUndefinedInContext:", self->_jsContext);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (unint64_t)objc_msgSend(v5, "length") > 2)
  {
    objc_msgSend(v5, "substringFromIndex:", objc_msgSend(v5, "length") - 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR(".js")) & 1) != 0)
    {
      sgEventsLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v5;
        _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_INFO, "SGReverseTemplateJS: loading %@ in JS context.", buf, 0xCu);
      }

      +[SGAsset asset](SGAsset, "asset");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "filesystemPathForAssetDataRelativePath:", CFSTR("ReverseTemplateJS"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGReverseTemplateJS.m"), 278, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentDir"));

      }
      v12 = (void *)MEMORY[0x1C3BD4F6C]();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "URLByAppendingPathComponent:", v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(v12);
      -[SGReverseTemplateJS loadJSFromASCIIFile:](self, "loadJSFromASCIIFile:", v14);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = v6;
    }

  }
  else
  {
    v7 = v6;
  }

  return v7;
}

- (id)loadTrieWithFileName:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SGJSBurstTrie *v10;
  void *v12;
  void *v13;

  v5 = a3;
  objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("trie"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGReverseTemplateJS.m"), 286, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fileNameWithPathExtension"));

  }
  v7 = (void *)MEMORY[0x1C3BD4F6C]();
  +[SGAsset asset](SGAsset, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filesystemPathForAssetDataRelativePath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v7);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGReverseTemplateJS.m"), 288, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  v10 = -[_PASCFBurstTrie initWithPath:]([SGJSBurstTrie alloc], "initWithPath:", v9);

  return v10;
}

- (void)initCurrentAsset
{
  NSString *v3;
  OS_dispatch_queue *v4;
  uint64_t v5;
  void *v6;
  OS_dispatch_queue *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SGReverseTemplatesJSDataDetectors *v13;
  SGReverseTemplatesJSDataDetectors *v14;
  void *v15;
  SGReverseTemplatesJSDataDetectors *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSString *v22;
  void *v23;
  NSString *v24;
  void *v25;
  void *v26;
  OS_dispatch_queue *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  uint8_t buf[16];
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  OS_dispatch_queue *v46;
  id v47;
  _QWORD v48[5];
  _QWORD v49[4];
  NSString *v50;
  _QWORD v51[4];
  NSString *v52;
  _QWORD v53[4];
  SGReverseTemplatesJSDataDetectors *v54;
  _QWORD v55[4];
  SGReverseTemplatesJSDataDetectors *v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  OS_dispatch_queue *v60;
  uint64_t *v61;
  _QWORD *v62;
  id v63;
  _QWORD v64[4];
  id v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  char v69;
  _QWORD v70[4];
  id location;
  const __CFString *v72;
  _QWORD v73[3];

  v73[1] = *MEMORY[0x1E0C80C00];
  v3 = self->_localeIdentifier;
  v4 = self->_queue;
  location = 0;
  objc_initWeak(&location, self);
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x2020000000;
  v70[3] = 0;
  v66 = 0;
  v67 = &v66;
  v68 = 0x2020000000;
  v69 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v64[0] = MEMORY[0x1E0C809B0];
  v64[1] = 3221225472;
  v64[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke;
  v64[3] = &unk_1E7DAC580;
  objc_copyWeak(&v65, &location);
  v6 = (void *)MEMORY[0x1C3BD5158](v64);
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", v6, CFSTR("load"));

  v59[0] = v5;
  v59[1] = 3221225472;
  v59[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_2;
  v59[3] = &unk_1E7DAC5A8;
  v61 = &v66;
  v62 = v70;
  v7 = v4;
  v60 = v7;
  objc_copyWeak(&v63, &location);
  v8 = (void *)MEMORY[0x1C3BD5158](v59);
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", v8, CFSTR("loadWithVmGrowthCounter"));

  v57[0] = v5;
  v57[1] = 3221225472;
  v57[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_4;
  v57[3] = &unk_1E7DAC580;
  objc_copyWeak(&v58, &location);
  v9 = (void *)MEMORY[0x1C3BD5158](v57);
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", v9, CFSTR("loadNoVmGrowthCounter"));

  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", &__block_literal_global_57_12625, CFSTR("debug"));
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", &__block_literal_global_61, CFSTR("developerLog"));
  -[JSContext objectForKeyedSubscript:](self->_jsContext, "objectForKeyedSubscript:", CFSTR("console"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = v10 == 0;

  if ((_DWORD)v9)
  {
    v72 = CFSTR("log");
    -[JSContext objectForKeyedSubscript:](self->_jsContext, "objectForKeyedSubscript:", CFSTR("debug"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, &v72, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", v12, CFSTR("console"));

  }
  v13 = self->_dd;
  v55[0] = v5;
  v55[1] = 3221225472;
  v55[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_69;
  v55[3] = &unk_1E7DAC630;
  v14 = v13;
  v56 = v14;
  v15 = (void *)MEMORY[0x1C3BD5158](v55);
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", v15, CFSTR("runDataDetectors"));

  v53[0] = v5;
  v53[1] = 3221225472;
  v53[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_2_73;
  v53[3] = &unk_1E7DAC658;
  v16 = v14;
  v54 = v16;
  v17 = (void *)MEMORY[0x1C3BD5158](v53);
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", v17, CFSTR("runDataDetectorsWithMetadata"));

  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", &__block_literal_global_81, CFSTR("parseMicrodata"));
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", &__block_literal_global_86_12633, CFSTR("tokenizeString"));
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", &__block_literal_global_92, CFSTR("decodeEntitiesInString"));
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", &__block_literal_global_96, CFSTR("detectLanguageForString"));
  +[SGAsset asset](SGAsset, "asset");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "assetVersion");

  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
    v20 = 0;
  else
    v20 = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", v21, CFSTR("ASSET_VERSION"));

  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", &__block_literal_global_104_12638, CFSTR("htmlToPlainText"));
  v51[0] = v5;
  v51[1] = 3221225472;
  v51[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_8;
  v51[3] = &unk_1E7DB15E8;
  v22 = v3;
  v52 = v22;
  v23 = (void *)MEMORY[0x1C3BD5158](v51);
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", v23, CFSTR("getCurrentLocale"));

  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", &__block_literal_global_115_12641, CFSTR("getLinguisticTagsForString"));
  v49[0] = v5;
  v49[1] = 3221225472;
  v49[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_11;
  v49[3] = &unk_1E7DAC7E0;
  v24 = v22;
  v50 = v24;
  v25 = (void *)MEMORY[0x1C3BD5158](v49);
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", v25, CFSTR("getPreferredLocalizationsFromArray"));

  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", &__block_literal_global_133, CFSTR("getLocalizedFormattedDatetimeString"));
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", &__block_literal_global_140, CFSTR("isInternalDevice"));
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", &__block_literal_global_143_12646, CFSTR("isSplashScreenAcknowledged"));
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", &__block_literal_global_147, CFSTR("allowAnyDomainForMarkup"));
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", &__block_literal_global_150, CFSTR("allowUnverifiedSourceForMarkup"));
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", &__block_literal_global_154, CFSTR("getSystemVersion"));
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", &__block_literal_global_159, CFSTR("getGMTOffsetFromDateTimeAndTimeZoneOlsonCode"));
  if (initCurrentAsset_onceToken != -1)
    dispatch_once(&initCurrentAsset_onceToken, &__block_literal_global_164);
  v48[0] = v5;
  v48[1] = 3221225472;
  v48[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_21;
  v48[3] = &__block_descriptor_40_e5_d8__0l;
  v48[4] = mach_absolute_time();
  v26 = (void *)MEMORY[0x1C3BD5158](v48);
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", v26, CFSTR("secondsForTiming"));

  v45[0] = v5;
  v45[1] = 3221225472;
  v45[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_22;
  v45[3] = &unk_1E7DB10C8;
  v27 = v7;
  v46 = v27;
  objc_copyWeak(&v47, &location);
  v28 = (void *)MEMORY[0x1C3BD5158](v45);
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", v28, CFSTR("freeJSContext"));

  v43[0] = v5;
  v43[1] = 3221225472;
  v43[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_24;
  v43[3] = &unk_1E7DAC9A8;
  objc_copyWeak(&v44, &location);
  v29 = (void *)MEMORY[0x1C3BD5158](v43);
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", v29, CFSTR("getFlightInformation"));

  v41[0] = v5;
  v41[1] = 3221225472;
  v41[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_25;
  v41[3] = &unk_1E7DAC9D0;
  objc_copyWeak(&v42, &location);
  v30 = (void *)MEMORY[0x1C3BD5158](v41);
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", v30, CFSTR("getMD5Hash"));

  v39[0] = v5;
  v39[1] = 3221225472;
  v39[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_26;
  v39[3] = &unk_1E7DAC9F8;
  objc_copyWeak(&v40, &location);
  v31 = (void *)MEMORY[0x1C3BD5158](v39);
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", v31, CFSTR("loadBurstTrie"));

  v37[0] = v5;
  v37[1] = 3221225472;
  v37[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_27;
  v37[3] = &unk_1E7DAC580;
  objc_copyWeak(&v38, &location);
  v32 = (void *)MEMORY[0x1C3BD5158](v37);
  -[JSContext setObject:forKeyedSubscript:](self->_jsContext, "setObject:forKeyedSubscript:", v32, CFSTR("loadMappedData"));

  -[JSContext objectForKeyedSubscript:](self->_jsContext, "objectForKeyedSubscript:", CFSTR("load"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[SGReverseTemplateJS _callJSFunction:withArguments:](self, "_callJSFunction:withArguments:", v33, &unk_1E7E10800);

  *((_BYTE *)v67 + 24) = 1;
  sgEventsLogHandle();
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v35, OS_LOG_TYPE_INFO, "SGReverseTemplateJS: completed initialization of JS context.", buf, 2u);
  }

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&v42);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&v47);

  objc_destroyWeak(&v58);
  objc_destroyWeak(&v63);

  objc_destroyWeak(&v65);
  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(v70, 8);
  objc_destroyWeak(&location);

}

- (id)mappedArrayBufferForFileName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  OpaqueJSContext *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v19;
  void *v20;
  id v21;
  id v23;
  _BYTE buf[24];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[SGAsset asset](SGAsset, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filesystemPathForAssetDataRelativePath:", CFSTR("ReverseTemplateJS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v6);
  v23 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v7, 1, &v23);
  v21 = v23;
  if (v8)
  {
    CFRetain(v8);
    v9 = -[JSContext JSGlobalContextRef](self->_jsContext, "JSGlobalContextRef");
    v10 = objc_retainAutorelease(v8);
    v11 = objc_msgSend(v10, "bytes");
    v12 = objc_msgSend(v10, "length");
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v13 = getJSObjectMakeArrayBufferWithBytesNoCopySymbolLoc_ptr;
    v25 = getJSObjectMakeArrayBufferWithBytesNoCopySymbolLoc_ptr;
    if (!getJSObjectMakeArrayBufferWithBytesNoCopySymbolLoc_ptr)
    {
      v14 = JavaScriptCoreLibrary();
      v13 = dlsym(v14, "JSObjectMakeArrayBufferWithBytesNoCopy");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v13;
      getJSObjectMakeArrayBufferWithBytesNoCopySymbolLoc_ptr = v13;
    }
    _Block_object_dispose(buf, 8);
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "JSObjectRef SGJSObjectMakeArrayBufferWithBytesNoCopy(JSContextRef, void *, size_t, JSTypedArrayBytesDeallocator, void *, JSValueRef *)");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("SGReverseTemplateJS.m"), 49, CFSTR("%s"), dlerror());

      __break(1u);
    }
    v15 = ((uint64_t (*)(OpaqueJSContext *, uint64_t, uint64_t, void (*)(int, CFTypeRef), id, _QWORD))v13)(v9, v11, v12, typedArrayDeallocatorRelease, v10, 0);
    objc_msgSend(getJSValueClass(), "valueWithJSValueRef:inContext:", v15, self->_jsContext);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    sgEventsLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v21;
      _os_log_fault_impl(&dword_1C3607000, v17, OS_LOG_TYPE_FAULT, "Could not load data asset %@: %@", buf, 0x16u);
    }

    v16 = 0;
  }

  return v16;
}

- (id)preprocessPackedSGMessage:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("html"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v6 = (void *)objc_msgSend(v3, "mutableCopy");
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("html"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_pas_stringWithDataNoCopy:encoding:nullTerminated:", v8, 4, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("html"));

    v3 = v6;
  }
  return v3;
}

- (id)md5Hash:(id)a3
{
  return (id)objc_msgSend(a3, "sg_md5Hash");
}

- (id)flightInformationWithAirlineCode:(id)a3 flightNumber:(id)a4 flightDate:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  NSObject *v17;
  void *v18;
  dispatch_semaphore_t v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  const char *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  id v47;
  NSObject *v48;
  uint64_t *v49;
  uint8_t *v50;
  uint8_t buf[8];
  uint8_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  _QWORD v63[3];
  _QWORD v64[3];
  void *v65;
  uint8_t v66[4];
  id v67;
  __int16 v68;
  id v69;
  __int16 v70;
  id v71;
  __int16 v72;
  uint64_t v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  v57 = 0;
  v58 = &v57;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__12386;
  v61 = __Block_byref_object_dispose__12387;
  v62 = 0;
  if (!v9)
  {
    sgEventsLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v27 = "SGReverseTemplateJS flightInformationWithAirlineCode: Can't get flightInformation, airlineCode is nil";
LABEL_19:
    _os_log_fault_impl(&dword_1C3607000, v13, OS_LOG_TYPE_FAULT, v27, buf, 2u);
    goto LABEL_20;
  }
  if (!v10)
  {
    sgEventsLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v27 = "SGReverseTemplateJS flightInformationWithAirlineCode: Can't get flightInformation, flightNumber is nil";
    goto LABEL_19;
  }
  if (!v11)
  {
    sgEventsLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v27 = "SGReverseTemplateJS flightInformationWithAirlineCode: Can't get flightInformation, flightDate is nil";
      goto LABEL_19;
    }
LABEL_20:
    v26 = 0;
    goto LABEL_32;
  }
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@"), v9, v10);
  v43 = (void *)objc_opt_new();
  objc_msgSend(v43, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss"));
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setTimeZone:", v14);

  objc_msgSend(v43, "dateFromString:", v12);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleIdentifier");
    v16 = (const __CFString *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      sgEventsLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1C3607000, v17, OS_LOG_TYPE_ERROR, "SGReverseTemplateJS flightInformationWithAirlineCode: bundleIdentifier is undefined.", buf, 2u);
      }

      v16 = CFSTR("com.apple.undefined");
    }
    v39 = v16;
    objc_msgSend(MEMORY[0x1E0D177B0], "flightRequestForQuery:date:appBundleId:", v13, v42, v16);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v41)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGReverseTemplateJS.m"), 589, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

    }
    objc_msgSend(MEMORY[0x1E0D177D8], "sharedSession");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    v52 = buf;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__12386;
    v55 = __Block_byref_object_dispose__12387;
    v56 = 0;
    v19 = dispatch_semaphore_create(0);
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __80__SGReverseTemplateJS_flightInformationWithAirlineCode_flightNumber_flightDate___block_invoke;
    v44[3] = &unk_1E7DACA20;
    v49 = &v57;
    v50 = buf;
    v44[4] = self;
    v20 = v9;
    v45 = v20;
    v21 = v10;
    v46 = v21;
    v22 = v12;
    v47 = v22;
    v23 = v19;
    v48 = v23;
    v40 = v18;
    objc_msgSend(v18, "taskWithRequest:completion:", v41, v44);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "resume");
    if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v23, 60.0))
    {
      v25 = v24;
      v26 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      sgEventsLogHandle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        v37 = v58[5];
        *(_DWORD *)v66 = 138413058;
        v67 = v20;
        v68 = 2112;
        v69 = v21;
        v70 = 2112;
        v71 = v22;
        v72 = 2112;
        v73 = v37;
        _os_log_debug_impl(&dword_1C3607000, v29, OS_LOG_TYPE_DEBUG, "SGReverseTemplateJS flightInformationWithAirlineCode: CoreParsec results for: %@, %@, %@ = %@", v66, 0x2Au);
      }

      if (!objc_msgSend((id)v58[5], "count"))
      {
        v30 = (void *)*((_QWORD *)v52 + 5);
        if (v30)
        {
          v64[0] = CFSTR("error");
          v63[0] = CFSTR("type");
          v63[1] = CFSTR("errorCode");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v30, "code"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v64[1] = v31;
          v63[2] = CFSTR("userInfo");
          objc_msgSend(*((id *)v52 + 5), "userInfo");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v64[2] = v32;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 3);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = v33;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
          v34 = objc_claimAutoreleasedReturnValue();
          v35 = (void *)v58[5];
          v58[5] = v34;

        }
      }
      v25 = v24;
      v26 = (id)v58[5];
    }

    _Block_object_dispose(buf, 8);
    v28 = v39;
  }
  else
  {
    sgEventsLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C3607000, v28, OS_LOG_TYPE_ERROR, "SGReverseTemplateJS flightInformationWithAirlineCode: Can't get flightInformation, flightDate is malformed", buf, 2u);
    }
    v26 = 0;
  }

LABEL_32:
  _Block_object_dispose(&v57, 8);

  return v26;
}

- (void)flightInformationWithAirlineCode:(id)a3 flightNumber:(id)a4 flightDate:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1E0D81658];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __86__SGReverseTemplateJS_flightInformationWithAirlineCode_flightNumber_flightDate_reply___block_invoke;
  v19[3] = &unk_1E7DACA48;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  objc_msgSend(v14, "runWithExceptionBarrier:", v19);

}

- (id)sfFlightsToDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id obj;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  id v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v76 = (void *)objc_opt_new();
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  obj = v4;
  v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v94, 16);
  if (v77)
  {
    v75 = *(_QWORD *)v90;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v90 != v75)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v5);
        v7 = MEMORY[0x1C3BD4F6C]();
        v8 = (void *)objc_opt_new();
        objc_msgSend(v6, "flightNumber");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = v8;
        if (v9)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("flightNumber"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "setObject:forKeyedSubscript:", v10, CFSTR("flightNumber"));

          v8 = v80;
        }

        objc_msgSend(v6, "carrierCode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("carrierCode"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "setObject:forKeyedSubscript:", v12, CFSTR("carrierCode"));

          v8 = v80;
        }

        objc_msgSend(v6, "carrierName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("carrierName"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "setObject:forKeyedSubscript:", v14, CFSTR("carrierName"));

          v8 = v80;
        }

        objc_msgSend(v6, "carrierPhoneNumber");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("carrierPhoneNumber"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "setObject:forKeyedSubscript:", v16, CFSTR("carrierPhoneNumber"));

          v8 = v80;
        }

        objc_msgSend(v6, "flightID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("flightID"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "setObject:forKeyedSubscript:", v18, CFSTR("flightID"));

          v8 = v80;
        }

        objc_msgSend(v6, "operatorCarrierCode");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("operatorCarrierCode"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "setObject:forKeyedSubscript:", v20, CFSTR("operatorCarrierCode"));

          v8 = v80;
        }

        objc_msgSend(v6, "operatorFlightNumber");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = (void *)v7;
        v79 = v5;
        if (v21)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, CFSTR("operatorFlightNumber"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v22 = objc_claimAutoreleasedReturnValue();
          v23 = v8;
          v24 = (void *)v22;
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, CFSTR("operatorFlightNumber"));

        }
        v25 = (void *)objc_opt_new();
        v85 = 0u;
        v86 = 0u;
        v87 = 0u;
        v88 = 0u;
        objc_msgSend(v6, "legs");
        v81 = (id)objc_claimAutoreleasedReturnValue();
        v84 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
        if (v84)
        {
          v82 = *(_QWORD *)v86;
          v83 = v25;
          do
          {
            for (i = 0; i != v84; ++i)
            {
              if (*(_QWORD *)v86 != v82)
                objc_enumerationMutation(v81);
              v27 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
              v28 = (void *)objc_opt_new();
              -[SGReverseTemplateJS sfFlightStatusToString:](self, "sfFlightStatusToString:", objc_msgSend(v27, "status"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (v29)
              {
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v29, CFSTR("status"));
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v30, CFSTR("status"));

              }
              objc_msgSend(v27, "title");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              if (v31)
              {
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v31, CFSTR("title"));
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v32, CFSTR("title"));

              }
              objc_msgSend(v27, "departurePublishedTime");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "departureAirport");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "timezone");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              -[SGReverseTemplateJS formattedDate:withTimezone:](self, "formattedDate:withTimezone:", v33, v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              if (v36)
              {
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v36, CFSTR("departurePublishedTime"));
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v37, CFSTR("departurePublishedTime"));

              }
              objc_msgSend(v27, "departureActualTime");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "departureAirport");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "timezone");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              -[SGReverseTemplateJS formattedDate:withTimezone:](self, "formattedDate:withTimezone:", v38, v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              if (v41)
              {
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v41, CFSTR("departureActualTime"));
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v42, CFSTR("departureActualTime"));

              }
              objc_msgSend(v27, "departureTerminal");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              if (v43)
              {
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v43, CFSTR("departureTerminal"));
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v44, CFSTR("departureTerminal"));

              }
              objc_msgSend(v27, "departureGate");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              if (v45)
              {
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v45, CFSTR("departureGate"));
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v46, CFSTR("departureGate"));

              }
              objc_msgSend(v27, "arrivalPublishedTime");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "arrivalAirport");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "timezone");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              -[SGReverseTemplateJS formattedDate:withTimezone:](self, "formattedDate:withTimezone:", v47, v49);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              if (v50)
              {
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v50, CFSTR("arrivalPublishedTime"));
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v51, CFSTR("arrivalPublishedTime"));

              }
              objc_msgSend(v27, "arrivalActualTime");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "arrivalAirport");
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "timezone");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              -[SGReverseTemplateJS formattedDate:withTimezone:](self, "formattedDate:withTimezone:", v52, v54);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              if (v55)
              {
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v55, CFSTR("arrivalActualTime"));
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v56, CFSTR("arrivalActualTime"));

              }
              objc_msgSend(v27, "arrivalTerminal");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              if (v57)
              {
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v57, CFSTR("arrivalTerminal"));
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v58, CFSTR("arrivalTerminal"));

              }
              v25 = v83;

              objc_msgSend(v27, "arrivalGate");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              if (v59)
              {
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v59, CFSTR("arrivalGate"));
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v60, CFSTR("arrivalGate"));

              }
              objc_msgSend(v27, "departureAirport");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              -[SGReverseTemplateJS sfAirportToDictionnary:](self, "sfAirportToDictionnary:", v61);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              if (v62)
              {
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v62, CFSTR("departureAirport"));
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v63, CFSTR("departureAirport"));

              }
              objc_msgSend(v27, "arrivalAirport");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              -[SGReverseTemplateJS sfAirportToDictionnary:](self, "sfAirportToDictionnary:", v64);
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              if (v65)
              {
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v65, CFSTR("arrivalAirport"));
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v66, CFSTR("arrivalAirport"));

              }
              objc_msgSend(v27, "divertedAirport");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              -[SGReverseTemplateJS sfAirportToDictionnary:](self, "sfAirportToDictionnary:", v67);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              if (v68)
              {
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v68, CFSTR("divertedAirport"));
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "setObject:forKeyedSubscript:", v69, CFSTR("divertedAirport"));

              }
              objc_msgSend(v83, "addObject:", v28);

            }
            v84 = objc_msgSend(v81, "countByEnumeratingWithState:objects:count:", &v85, v93, 16);
          }
          while (v84);
        }

        if (v25)
        {
          v70 = v80;
          objc_msgSend(v80, "setObject:forKeyedSubscript:", v25, CFSTR("legs"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = v80;
          objc_msgSend(v80, "setObject:forKeyedSubscript:", v71, CFSTR("legs"));

        }
        objc_msgSend(v76, "addObject:", v70);

        objc_autoreleasePoolPop(v78);
        v5 = v79 + 1;
      }
      while (v79 + 1 != v77);
      v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v94, 16);
    }
    while (v77);
  }

  v72 = (void *)objc_msgSend(v76, "copy");
  return v72;
}

- (id)formattedDate:(id)a3 withTimezone:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSISO8601DateFormatter *dateFormatter;
  NSISO8601DateFormatter *v11;
  unint64_t v12;
  NSISO8601DateFormatter *v13;
  void *v14;
  NSISO8601DateFormatter *v15;
  void *v16;
  void *v17;
  void *v19;

  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1C3BD4F6C]();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGReverseTemplateJS.m"), 676, CFSTR("Can't create formattedDate, date is nil"));

  }
  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    dateFormatter = (NSISO8601DateFormatter *)objc_opt_new();
    v13 = self->_dateFormatter;
    self->_dateFormatter = dateFormatter;

    if (v8)
      goto LABEL_5;
LABEL_7:
    v14 = (void *)MEMORY[0x1E0C99E80];
    v15 = dateFormatter;
    objc_msgSend(v14, "timeZoneForSecondsFromGMT:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSISO8601DateFormatter setTimeZone:](v15, "setTimeZone:", v16);

    v12 = -[NSISO8601DateFormatter formatOptions](v15, "formatOptions") & 0xFFFFFFFFFFFFFFBFLL;
    goto LABEL_8;
  }
  if (!v8)
    goto LABEL_7;
LABEL_5:
  v11 = dateFormatter;
  -[NSISO8601DateFormatter setTimeZone:](v11, "setTimeZone:", v8);
  v12 = -[NSISO8601DateFormatter formatOptions](v11, "formatOptions") | 0x40;
LABEL_8:
  -[NSISO8601DateFormatter setFormatOptions:](dateFormatter, "setFormatOptions:", v12);
  -[NSISO8601DateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v9);
  return v17;
}

- (id)sfAirportToDictionnary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v4 = a3;
  v5 = (void *)MEMORY[0x1C3BD4F6C]();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v4, "code");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("code"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("code"));

  }
  objc_msgSend(v4, "timezone");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGReverseTemplateJS dictionaryFromTimezone:](self, "dictionaryFromTimezone:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("timezone"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("timezone"));

  }
  objc_msgSend(v4, "city");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("city"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("city"));

  }
  objc_msgSend(v4, "street");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("street"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("street"));

  }
  objc_msgSend(v4, "district");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("district"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("district"));

  }
  objc_msgSend(v4, "state");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("state"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("state"));

  }
  objc_msgSend(v4, "postalCode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("postalCode"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("postalCode"));

  }
  objc_msgSend(v4, "countryCode");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v22, CFSTR("countryCode"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, CFSTR("countryCode"));

  }
  objc_msgSend(v4, "country");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("country"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v25, CFSTR("country"));

  }
  objc_msgSend(v4, "name");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, CFSTR("name"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v27, CFSTR("name"));

  }
  v28 = (void *)objc_opt_new();
  v29 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "location");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "lat");
  objc_msgSend(v29, "numberWithDouble:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v31, CFSTR("lat"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v32, CFSTR("lat"));

  }
  v33 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "location");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "lng");
  objc_msgSend(v33, "numberWithDouble:");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v35, CFSTR("lng"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setObject:forKeyedSubscript:", v36, CFSTR("lng"));

  }
  if (v28)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, CFSTR("location"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v37, CFSTR("location"));

  }
  v38 = (void *)objc_msgSend(v6, "copy");

  objc_autoreleasePoolPop(v5);
  return v38;
}

- (id)dictionaryFromTimezone:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("name"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "secondsFromGMT"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("secondsFromGMT"));

  return v4;
}

- (id)sfFlightStatusToString:(int)a3
{
  if ((a3 - 1) > 8)
    return CFSTR("unknown");
  else
    return off_1E7DACAD0[a3 - 1];
}

- (id)loadJSFromASCIIFile:(id)a3
{
  id v5;
  void *v6;
  OpaqueJSContext *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *context;
  id v46;
  os_log_t oslog;
  id v48;
  _BYTE buf[24];
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    context = (void *)MEMORY[0x1C3BD4F6C]();
    v48 = 0;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v5, 1, &v48);
    v46 = v48;
    if (v6)
    {
      objc_msgSend(v5, "lastPathComponent");
      oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (!oslog)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGReverseTemplateJS.m"), 771, CFSTR("File URL must be a valid path."));

      }
      -[NSMutableArray addObject:](self->_memoryMappedFiles, "addObject:", v6);
      -[NSMutableArray addObject:](self->_memoryMappedFileNames, "addObject:", oslog);
      v7 = -[JSContext JSGlobalContextRef](self->_jsContext, "JSGlobalContextRef");
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      v8 = getJSContextGetGroupSymbolLoc_ptr;
      v50 = getJSContextGetGroupSymbolLoc_ptr;
      if (!getJSContextGetGroupSymbolLoc_ptr)
      {
        v9 = JavaScriptCoreLibrary();
        v8 = dlsym(v9, "JSContextGetGroup");
        *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v8;
        getJSContextGetGroupSymbolLoc_ptr = v8;
      }
      _Block_object_dispose(buf, 8);
      if (v8)
      {
        v10 = ((uint64_t (*)(OpaqueJSContext *))v8)(v7);
        objc_msgSend(v5, "absoluteString");
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v12 = objc_msgSend(v11, "UTF8String");
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v13 = getJSStringCreateWithUTF8CStringSymbolLoc_ptr;
        v50 = getJSStringCreateWithUTF8CStringSymbolLoc_ptr;
        if (!getJSStringCreateWithUTF8CStringSymbolLoc_ptr)
        {
          v14 = JavaScriptCoreLibrary();
          v13 = dlsym(v14, "JSStringCreateWithUTF8CString");
          *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v13;
          getJSStringCreateWithUTF8CStringSymbolLoc_ptr = v13;
        }
        _Block_object_dispose(buf, 8);
        if (v13)
        {
          v15 = ((uint64_t (*)(uint64_t))v13)(v12);

          v16 = objc_retainAutorelease(v6);
          v17 = objc_msgSend(v16, "bytes");
          v18 = objc_msgSend(v16, "length");
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          v19 = getJSScriptCreateReferencingImmortalASCIITextSymbolLoc_ptr;
          v50 = getJSScriptCreateReferencingImmortalASCIITextSymbolLoc_ptr;
          if (!getJSScriptCreateReferencingImmortalASCIITextSymbolLoc_ptr)
          {
            v20 = JavaScriptCoreLibrary();
            v19 = dlsym(v20, "JSScriptCreateReferencingImmortalASCIIText");
            *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v19;
            getJSScriptCreateReferencingImmortalASCIITextSymbolLoc_ptr = v19;
          }
          _Block_object_dispose(buf, 8);
          if (v19)
          {
            v21 = ((uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD))v19)(v10, v15, 0, v17, v18, 0, 0);
            *(_QWORD *)buf = 0;
            *(_QWORD *)&buf[8] = buf;
            *(_QWORD *)&buf[16] = 0x2020000000;
            v22 = getJSStringReleaseSymbolLoc_ptr;
            v50 = getJSStringReleaseSymbolLoc_ptr;
            if (!getJSStringReleaseSymbolLoc_ptr)
            {
              v23 = JavaScriptCoreLibrary();
              v22 = dlsym(v23, "JSStringRelease");
              *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v22;
              getJSStringReleaseSymbolLoc_ptr = v22;
            }
            _Block_object_dispose(buf, 8);
            if (v22)
            {
              ((void (*)(uint64_t))v22)(v15);
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x2020000000;
              v24 = getJSScriptEvaluateSymbolLoc_ptr;
              v50 = getJSScriptEvaluateSymbolLoc_ptr;
              if (!getJSScriptEvaluateSymbolLoc_ptr)
              {
                v25 = JavaScriptCoreLibrary();
                v24 = dlsym(v25, "JSScriptEvaluate");
                *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v24;
                getJSScriptEvaluateSymbolLoc_ptr = v24;
              }
              _Block_object_dispose(buf, 8);
              if (v24)
              {
                v26 = ((uint64_t (*)(OpaqueJSContext *, uint64_t, _QWORD, _QWORD))v24)(v7, v21, 0, 0);
                *(_QWORD *)buf = 0;
                *(_QWORD *)&buf[8] = buf;
                *(_QWORD *)&buf[16] = 0x2020000000;
                v27 = getJSScriptReleaseSymbolLoc_ptr;
                v50 = getJSScriptReleaseSymbolLoc_ptr;
                if (!getJSScriptReleaseSymbolLoc_ptr)
                {
                  v28 = JavaScriptCoreLibrary();
                  v27 = dlsym(v28, "JSScriptRelease");
                  *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v27;
                  getJSScriptReleaseSymbolLoc_ptr = v27;
                }
                _Block_object_dispose(buf, 8);
                if (v27)
                {
                  ((void (*)(uint64_t))v27)(v21);
                  objc_msgSend(getJSValueClass(), "valueWithJSValueRef:inContext:", v26, self->_jsContext);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:

                  objc_autoreleasePoolPop(context);
                  goto LABEL_31;
                }
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void SGJSScriptRelease(JSScriptRef)");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, CFSTR("SGReverseTemplateJS.m"), 55, CFSTR("%s"), dlerror());

              }
              else
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "JSValueRef SGJSScriptEvaluate(JSContextRef, JSScriptRef, JSValueRef, JSValueRef *)");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, CFSTR("SGReverseTemplateJS.m"), 54, CFSTR("%s"), dlerror());

              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void SGJSStringRelease(JSStringRef)");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("SGReverseTemplateJS.m"), 53, CFSTR("%s"), dlerror());

            }
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "JSScriptRef SGJSScriptCreateReferencingImmortalASCIIText(JSContextGroupRef, JSStringRef, int, const char *, size_t, JSStringRef *, int *)");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("SGReverseTemplateJS.m"), 52, CFSTR("%s"), dlerror());

          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "JSStringRef SGJSStringCreateWithUTF8CString(const char *)");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, CFSTR("SGReverseTemplateJS.m"), 51, CFSTR("%s"), dlerror());

        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "JSContextGroupRef SGJSContextGetGroup(JSContextRef)");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("SGReverseTemplateJS.m"), 50, CFSTR("%s"), dlerror());

      }
      __break(1u);
    }
    sgEventsLogHandle();
    oslog = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v46;
      _os_log_fault_impl(&dword_1C3607000, oslog, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS loadJSFromASCIIFile: Error loading JS file %@: %@", buf, 0x16u);
    }
    v29 = 0;
    goto LABEL_30;
  }
  sgEventsLogHandle();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1C3607000, v30, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS loadJSFromASCIIFile: no file defined.", buf, 2u);
  }

  v29 = 0;
LABEL_31:

  return v29;
}

- (void)holdXpcTransactionForShortDelay
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  +[SGXpcTransaction transactionWithName:](SGXpcTransaction, "transactionWithName:", "SGReverseTemplateJS.holdXpcTransactionForShortDelay");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D81598];
  dispatch_get_global_queue(9, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__SGReverseTemplateJS_holdXpcTransactionForShortDelay__block_invoke;
  v6[3] = &unk_1E7DB56F0;
  v7 = v2;
  v5 = v2;
  objc_msgSend(v3, "runAsyncOnQueue:afterDelaySeconds:block:", v4, v6, 0.1);

}

- (BOOL)shouldDownloadFull:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SGReverseTemplateJS_shouldDownloadFull___block_invoke;
  block[3] = &unk_1E7DB7878;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

- (id)_eventClassificationForEntity:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint8_t *v12;
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  sgEventsLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEFAULT, "SGReverseTemplateJS: Calling js for event classification", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v14 = buf;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__12386;
  v17 = __Block_byref_object_dispose__12387;
  v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SGReverseTemplateJS__eventClassificationForEntity___block_invoke;
  block[3] = &unk_1E7DB7878;
  v11 = v4;
  v12 = buf;
  block[4] = self;
  v7 = v4;
  dispatch_sync(queue, block);
  v8 = *((id *)v14 + 5);

  _Block_object_dispose(buf, 8);
  return v8;
}

- (id)_resolveCandidatesForJSDict:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint8_t *v12;
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  sgEventsLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEFAULT, "SGReverseTemplateJS: Calling JS to resolve candidates", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v14 = buf;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__12386;
  v17 = __Block_byref_object_dispose__12387;
  v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SGReverseTemplateJS__resolveCandidatesForJSDict___block_invoke;
  block[3] = &unk_1E7DB7878;
  v11 = v4;
  v12 = buf;
  block[4] = self;
  v7 = v4;
  dispatch_sync(queue, block);
  v8 = *((id *)v14 + 5);

  _Block_object_dispose(buf, 8);
  return v8;
}

- (id)_privacyAwareLogsForMLExtractions:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint8_t *v12;
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  sgEventsLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEFAULT, "SGReverseTemplateJS: Calling JS to get privacy aware logging", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v14 = buf;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__12386;
  v17 = __Block_byref_object_dispose__12387;
  v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SGReverseTemplateJS__privacyAwareLogsForMLExtractions___block_invoke;
  block[3] = &unk_1E7DB7878;
  v11 = v4;
  v12 = buf;
  block[4] = self;
  v7 = v4;
  dispatch_sync(queue, block);
  v8 = *((id *)v14 + 5);

  _Block_object_dispose(buf, 8);
  return v8;
}

- (id)_getFlightReferencesAndReservationId:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  id v8;
  _QWORD block[5];
  id v11;
  uint8_t *v12;
  uint8_t buf[8];
  uint8_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  sgEventsLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_DEFAULT, "SGReverseTemplateJS: Calling JS to get flight references and reservation id given text message", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v14 = buf;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__12386;
  v17 = __Block_byref_object_dispose__12387;
  v18 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__SGReverseTemplateJS__getFlightReferencesAndReservationId___block_invoke;
  block[3] = &unk_1E7DB7878;
  v11 = v4;
  v12 = buf;
  block[4] = self;
  v7 = v4;
  dispatch_sync(queue, block);
  v8 = *((id *)v14 + 5);

  _Block_object_dispose(buf, 8);
  return v8;
}

- (id)_diffSchemas:(id)a3 withExpectedSchemas:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t *v17;
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  sgEventsLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEFAULT, "SGReverseTemplateJS: Calling JS to diff schemas", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v19 = buf;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__12386;
  v22 = __Block_byref_object_dispose__12387;
  v23 = 0;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__SGReverseTemplateJS__diffSchemas_withExpectedSchemas___block_invoke;
  v14[3] = &unk_1E7DB4620;
  v14[4] = self;
  v15 = v7;
  v16 = v6;
  v17 = buf;
  v10 = v6;
  v11 = v7;
  dispatch_sync(queue, v14);
  v12 = *((id *)v19 + 5);

  _Block_object_dispose(buf, 8);
  return v12;
}

- (id)_mergeSchemas:(id)a3 withExpectedSchemas:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  id v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  uint8_t *v17;
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a3;
  v7 = a4;
  sgEventsLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEFAULT, "SGReverseTemplateJS: Calling JS to merge schemas", buf, 2u);
  }

  *(_QWORD *)buf = 0;
  v19 = buf;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__12386;
  v22 = __Block_byref_object_dispose__12387;
  v23 = 0;
  queue = self->_queue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__SGReverseTemplateJS__mergeSchemas_withExpectedSchemas___block_invoke;
  v14[3] = &unk_1E7DB4620;
  v14[4] = self;
  v15 = v7;
  v16 = v6;
  v17 = buf;
  v10 = v6;
  v11 = v7;
  dispatch_sync(queue, v14);
  v12 = *((id *)v19 + 5);

  _Block_object_dispose(buf, 8);
  return v12;
}

- (id)reverseMapEntity:(id)a3 forCategory:(id)a4 withSchemaExpectation:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__12386;
  v26 = __Block_byref_object_dispose__12387;
  v27 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__SGReverseTemplateJS_reverseMapEntity_forCategory_withSchemaExpectation___block_invoke;
  block[3] = &unk_1E7DACA70;
  v20 = v10;
  v21 = &v22;
  block[4] = self;
  v18 = v8;
  v19 = v9;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(queue, block);
  v15 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v15;
}

- (id)payloadToOutputWithEntryPoint:(id)a3 arguments:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  SGReverseTemplateJS *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__12386;
  v25 = __Block_byref_object_dispose__12387;
  v26 = 0;
  queue = self->_queue;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __63__SGReverseTemplateJS_payloadToOutputWithEntryPoint_arguments___block_invoke;
  v16 = &unk_1E7DB4620;
  v17 = self;
  v20 = &v21;
  v9 = v6;
  v18 = v9;
  v10 = v7;
  v19 = v10;
  dispatch_sync(queue, &v13);
  v11 = (void *)objc_msgSend((id)v22[5], "copy", v13, v14, v15, v16, v17);

  _Block_object_dispose(&v21, 8);
  return v11;
}

- (void)shouldDownloadFull:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D81658];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__SGReverseTemplateJS_shouldDownloadFull_reply___block_invoke;
  v11[3] = &unk_1E7DB6F48;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "runWithExceptionBarrier:", v11);

}

- (void)eventClassificationForEntity:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D81658];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __58__SGReverseTemplateJS_eventClassificationForEntity_reply___block_invoke;
  v11[3] = &unk_1E7DB6F48;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "runWithExceptionBarrier:", v11);

}

- (void)privacyAwareLogsForMLExtractions:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D81658];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__SGReverseTemplateJS_privacyAwareLogsForMLExtractions_reply___block_invoke;
  v11[3] = &unk_1E7DB6F48;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "runWithExceptionBarrier:", v11);

}

- (void)getFlightReferencesAndReservationId:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D81658];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__SGReverseTemplateJS_getFlightReferencesAndReservationId_reply___block_invoke;
  v11[3] = &unk_1E7DB6F48;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "runWithExceptionBarrier:", v11);

}

- (void)resolveCandidatesForJSDict:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D81658];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__SGReverseTemplateJS_resolveCandidatesForJSDict_reply___block_invoke;
  v11[3] = &unk_1E7DB6F48;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "runWithExceptionBarrier:", v11);

}

- (void)diffSchemas:(id)a3 withExpectedSchemas:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0D81658];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__SGReverseTemplateJS_diffSchemas_withExpectedSchemas_reply___block_invoke;
  v15[3] = &unk_1E7DACA98;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "runWithExceptionBarrier:", v15);

}

- (void)mergeSchemas:(id)a3 withExpectedSchemas:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0D81658];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__SGReverseTemplateJS_mergeSchemas_withExpectedSchemas_reply___block_invoke;
  v15[3] = &unk_1E7DACA98;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "runWithExceptionBarrier:", v15);

}

- (void)parseHTML:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  SGReverseTemplateJS *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D81658];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __39__SGReverseTemplateJS_parseHTML_reply___block_invoke;
  v11[3] = &unk_1E7DB6F48;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "runWithExceptionBarrier:", v11);

}

- (void)payloadToOutputWithEntryPoint:(id)a3 arguments:(id)a4 reply:(id)a5
{
  void (**v8)(id, void *, void *, void *, void *);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = (void (**)(id, void *, void *, void *, void *))a5;
  -[SGReverseTemplateJS payloadToOutputWithEntryPoint:arguments:](self, "payloadToOutputWithEntryPoint:arguments:", a3, a4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("outputs"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sourceMetadata"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGReverseTemplateJS outputExceptionsFromOutput:](self, "outputExceptionsFromOutput:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("jsMessageLogs"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGReverseTemplateJS holdXpcTransactionForShortDelay](self, "holdXpcTransactionForShortDelay");
  v8[2](v8, v9, v10, v11, v12);

}

- (void)emailToOutput:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__12386;
  v31 = __Block_byref_object_dispose__12387;
  v32 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __43__SGReverseTemplateJS_emailToOutput_reply___block_invoke;
  v26[3] = &unk_1E7DB0C20;
  v26[4] = &v27;
  -[SGReverseTemplateJS privacyAwareLogsForMLExtractions:reply:](self, "privacyAwareLogsForMLExtractions:reply:", v6, v26);
  sgLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v19 = v7;
    objc_msgSend((id)v28[5], "objectForKeyedSubscript:", CFSTR("domain"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v28[5], "objectForKeyedSubscript:", CFSTR("documentDateReceived"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v28[5], "objectForKeyedSubscript:", CFSTR("hashedSubject"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v28[5], "objectForKeyedSubscript:", CFSTR("privacyAwareSubject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v28[5], "objectForKeyedSubscript:", CFSTR("tdDistrib"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v28[5], "objectForKeyedSubscript:", CFSTR("tdCount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v28[5], "objectForKeyedSubscript:", CFSTR("deviceLocale"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v28[5], "objectForKeyedSubscript:", CFSTR("messageLength"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v28[5], "objectForKeyedSubscript:", CFSTR("documentDateProcessed"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v28[5], "objectForKeyedSubscript:", CFSTR("containsSchemaorg"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138414594;
    v34 = v22;
    v35 = 2112;
    v36 = v21;
    v37 = 2112;
    v38 = v20;
    v39 = 2112;
    v40 = v9;
    v41 = 2112;
    v42 = v10;
    v43 = 2112;
    v44 = v11;
    v45 = 2112;
    v46 = v12;
    v47 = 2112;
    v48 = v13;
    v49 = 2112;
    v50 = v14;
    v51 = 2112;
    v52 = v15;
    _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_DEFAULT, "Email: %@ %@ %@ %@ %@ %@ %@ %@ %@ %@", buf, 0x66u);

    v7 = v19;
  }

  v16 = (void *)MEMORY[0x1E0D81658];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __43__SGReverseTemplateJS_emailToOutput_reply___block_invoke_355;
  v23[3] = &unk_1E7DB6F48;
  v23[4] = self;
  v17 = v6;
  v24 = v17;
  v18 = v7;
  v25 = v18;
  objc_msgSend(v16, "runWithExceptionBarrier:", v23);

  _Block_object_dispose(&v27, 8);
}

- (void)textMessageToOutput:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D81658];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__SGReverseTemplateJS_textMessageToOutput_reply___block_invoke;
  v11[3] = &unk_1E7DB6F48;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "runWithExceptionBarrier:", v11);

}

- (void)schemaOrgToOutput:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D81658];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__SGReverseTemplateJS_schemaOrgToOutput_reply___block_invoke;
  v11[3] = &unk_1E7DB6F48;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "runWithExceptionBarrier:", v11);

}

- (void)emailToJsonLd:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D81658];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__SGReverseTemplateJS_emailToJsonLd_reply___block_invoke;
  v11[3] = &unk_1E7DB6F48;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "runWithExceptionBarrier:", v11);

}

- (void)schemaOrgToJsonLd:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D81658];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__SGReverseTemplateJS_schemaOrgToJsonLd_reply___block_invoke;
  v11[3] = &unk_1E7DB6F48;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "runWithExceptionBarrier:", v11);

}

- (id)outputExceptionsFromOutput:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("exceptions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D19828], "simpleDedupe:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_prepareEntity:(id)a3
{
  id v5;
  void *v7;

  v5 = a3;
  if (!self->_jsContext)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGReverseTemplateJS.m"), 1179, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_jsContext"));

  }
  return v5;
}

- (id)_prepareArguments:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[SGReverseTemplateJS _prepareEntity:](self, "_prepareEntity:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        else
        {
          objc_msgSend(v5, "addObject:", v11, (_QWORD)v14);
        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
  objc_storeStrong((id *)&self->_memoryPressureQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_assetPath, 0);
  objc_storeStrong((id *)&self->_assetUpdateToken, 0);
  objc_storeStrong((id *)&self->_dd, 0);
  objc_storeStrong((id *)&self->_jsContext, 0);
  objc_storeStrong((id *)&self->_memoryMappedFileNames, 0);
  objc_storeStrong((id *)&self->_memoryMappedFiles, 0);
  objc_storeStrong((id *)&self->_jsVM, 0);
}

void __47__SGReverseTemplateJS_schemaOrgToJsonLd_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "preprocessPackedSGMessage:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "payloadToOutputWithEntryPoint:arguments:", CFSTR("schemaOrgToJsonLdWithExceptions"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "holdXpcTransactionForShortDelay");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __43__SGReverseTemplateJS_emailToJsonLd_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "preprocessPackedSGMessage:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "payloadToOutputWithEntryPoint:arguments:", CFSTR("emailToJsonLdWithExceptions"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "holdXpcTransactionForShortDelay");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __47__SGReverseTemplateJS_schemaOrgToOutput_reply___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  objc_msgSend(v2, "preprocessPackedSGMessage:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "payloadToOutputWithEntryPoint:arguments:reply:", CFSTR("schemaOrgToOutputWithTiming"), v4, a1[6]);

}

void __49__SGReverseTemplateJS_textMessageToOutput_reply___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  objc_msgSend(v2, "preprocessPackedSGMessage:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "payloadToOutputWithEntryPoint:arguments:reply:", CFSTR("textMessageToOutputWithTiming"), v4, a1[6]);

}

void __43__SGReverseTemplateJS_emailToOutput_reply___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __43__SGReverseTemplateJS_emailToOutput_reply___block_invoke_355(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  objc_msgSend(v2, "preprocessPackedSGMessage:", a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "payloadToOutputWithEntryPoint:arguments:reply:", CFSTR("emailToOutputWithTiming"), v4, a1[6]);

}

void __39__SGReverseTemplateJS_parseHTML_reply___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_opt_new();
  objc_msgSend(v3, "parseHTML:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "holdXpcTransactionForShortDelay");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __62__SGReverseTemplateJS_mergeSchemas_withExpectedSchemas_reply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_mergeSchemas:withExpectedSchemas:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "holdXpcTransactionForShortDelay");
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __61__SGReverseTemplateJS_diffSchemas_withExpectedSchemas_reply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_diffSchemas:withExpectedSchemas:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "holdXpcTransactionForShortDelay");
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void __56__SGReverseTemplateJS_resolveCandidatesForJSDict_reply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_resolveCandidatesForJSDict:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "holdXpcTransactionForShortDelay");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __65__SGReverseTemplateJS_getFlightReferencesAndReservationId_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "preprocessPackedSGMessage:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_getFlightReferencesAndReservationId:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "holdXpcTransactionForShortDelay");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __62__SGReverseTemplateJS_privacyAwareLogsForMLExtractions_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "preprocessPackedSGMessage:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_privacyAwareLogsForMLExtractions:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "holdXpcTransactionForShortDelay");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __58__SGReverseTemplateJS_eventClassificationForEntity_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "preprocessPackedSGMessage:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_eventClassificationForEntity:", v3);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "holdXpcTransactionForShortDelay");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __48__SGReverseTemplateJS_shouldDownloadFull_reply___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "preprocessPackedSGMessage:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shouldDownloadFull:", v3);

  objc_msgSend(*(id *)(a1 + 32), "holdXpcTransactionForShortDelay");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __63__SGReverseTemplateJS_payloadToOutputWithEntryPoint_arguments___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "getJSContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  sgEventsLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = *(void **)(a1 + 40);
      v19 = 138412290;
      v20 = v6;
      _os_log_impl(&dword_1C3607000, v5, OS_LOG_TYPE_INFO, "SGReverseTemplateJS: Calling payloadToOutput with entry point: %@", (uint8_t *)&v19, 0xCu);
    }

    v7 = *(void **)(a1 + 32);
    objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_prepareArguments:", *(_QWORD *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_callJSFunction:withArguments:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "toDictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    objc_msgSend(v3, "exception");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      sgEventsLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v3, "exception");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412290;
        v20 = v18;
        _os_log_fault_impl(&dword_1C3607000, v15, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS payloadToOutputWithEntryPoint: JS exception during messageToOutput: %@", (uint8_t *)&v19, 0xCu);

      }
    }
    SGJSGarbageCollect(objc_msgSend(v3, "JSGlobalContextRef"));
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v19) = 0;
      _os_log_fault_impl(&dword_1C3607000, v5, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS payloadToOutputWithEntryPoint: Tried to call messageToOutput without JS assets", (uint8_t *)&v19, 2u);
    }

    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = 0;

  }
  objc_autoreleasePoolPop(v2);
}

void __74__SGReverseTemplateJS_reverseMapEntity_forCategory_withSchemaExpectation___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  SGTaggedCharacterRange *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  void *v38;
  _BYTE v39[128];
  _QWORD v40[5];

  v40[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "getJSContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_opt_new();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    v7 = *(void **)(a1 + 32);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("reverseMapForEntity"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v11 = &stru_1E7DB83A8;
    if (!v9)
      v9 = MEMORY[0x1E0C9AA70];
    v12 = *(_QWORD *)(a1 + 56);
    if (*(_QWORD *)(a1 + 48))
      v11 = *(const __CFString **)(a1 + 48);
    v40[0] = v9;
    v40[1] = v11;
    if (v12)
      v13 = v12;
    else
      v13 = MEMORY[0x1E0C9AA70];
    v40[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_prepareArguments:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_callJSFunction:withArguments:", v8, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "toDictionary");
    v17 = objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[NSObject objectForKeyedSubscript:](v17, "objectForKeyedSubscript:", CFSTR("taggedCharacterRanges"));
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v34;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v34 != v21)
              objc_enumerationMutation(v18);
            v23 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
            v24 = [SGTaggedCharacterRange alloc];
            v25 = -[SGTaggedCharacterRange initWithDict:](v24, "initWithDict:", v23, (_QWORD)v33);
            if (!v25)
            {
              sgEventsLogHandle();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_1C3607000, v27, OS_LOG_TYPE_ERROR, "SGReverseTemplateJS: Unable to convert JS taggedCharacterRange to Objective-C", buf, 2u);
              }

              v28 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
              v29 = *(void **)(v28 + 40);
              *(_QWORD *)(v28 + 40) = 0;

              goto LABEL_24;
            }
            v26 = (void *)v25;
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v25);

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
          if (v20)
            continue;
          break;
        }
      }
LABEL_24:

    }
    objc_msgSend(v3, "exception", (_QWORD)v33);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      sgEventsLogHandle();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v3, "exception");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v38 = v32;
        _os_log_fault_impl(&dword_1C3607000, v31, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS: JS Exception during reverseMapEntity %@", buf, 0xCu);

      }
    }
    SGJSGarbageCollect(objc_msgSend(v3, "JSGlobalContextRef"));
  }
  else
  {
    sgEventsLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1C3607000, v17, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS: Tried to call reverseMapEntity without JS assets", buf, 2u);
    }
  }

  objc_autoreleasePoolPop(v2);
}

void __57__SGReverseTemplateJS__mergeSchemas_withExpectedSchemas___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "getJSContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v25[0] = CFSTR("expected");
    v25[1] = CFSTR("predicted");
    v4 = *(_QWORD *)(a1 + 48);
    v26[0] = *(_QWORD *)(a1 + 40);
    v26[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("mergeSchemasArrays"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    v24 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_prepareArguments:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_callJSFunction:withArguments:", v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "toDictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    sgEventsLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v22 = 138412290;
      v23 = v20;
      _os_log_debug_impl(&dword_1C3607000, v15, OS_LOG_TYPE_DEBUG, "SGReverseTemplateJS: Called mergeSchemasArrays with result: %@", (uint8_t *)&v22, 0xCu);
    }

    objc_msgSend(v3, "exception");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      sgEventsLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v3, "exception");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412290;
        v23 = v21;
        _os_log_fault_impl(&dword_1C3607000, v17, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS _mergeSchemas: JS Exception during mergeSchemasArrays: %@", (uint8_t *)&v22, 0xCu);

      }
    }
    SGJSGarbageCollect(objc_msgSend(v3, "JSGlobalContextRef"));
  }
  else
  {
    sgEventsLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v22) = 0;
      _os_log_fault_impl(&dword_1C3607000, v18, OS_LOG_TYPE_FAULT, "Tried to call mergeSchemas without JS assets", (uint8_t *)&v22, 2u);
    }

    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = 0;
  }

  objc_autoreleasePoolPop(v2);
}

void __56__SGReverseTemplateJS__diffSchemas_withExpectedSchemas___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "getJSContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v25[0] = CFSTR("expected");
    v25[1] = CFSTR("predicted");
    v4 = *(_QWORD *)(a1 + 48);
    v26[0] = *(_QWORD *)(a1 + 40);
    v26[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("diffSchemasArrays"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    v24 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_prepareArguments:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_callJSFunction:withArguments:", v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "toDictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    sgEventsLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v22 = 138412290;
      v23 = v20;
      _os_log_debug_impl(&dword_1C3607000, v15, OS_LOG_TYPE_DEBUG, "SGReverseTemplateJS: Called diffSchemasArrays with result: %@", (uint8_t *)&v22, 0xCu);
    }

    objc_msgSend(v3, "exception");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      sgEventsLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v3, "exception");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412290;
        v23 = v21;
        _os_log_fault_impl(&dword_1C3607000, v17, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS _diffSchemas: JS Exception during diffSchemasArrays: %@", (uint8_t *)&v22, 0xCu);

      }
    }
    SGJSGarbageCollect(objc_msgSend(v3, "JSGlobalContextRef"));
  }
  else
  {
    sgEventsLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v22) = 0;
      _os_log_fault_impl(&dword_1C3607000, v18, OS_LOG_TYPE_FAULT, "Tried to call diffSchemas without JS assets", (uint8_t *)&v22, 2u);
    }

    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = 0;
  }

  objc_autoreleasePoolPop(v2);
}

void __60__SGReverseTemplateJS__getFlightReferencesAndReservationId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "getJSContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("getFlightReferencesAndReservationId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    v24[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_prepareArguments:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_callJSFunction:withArguments:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "toDictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    sgEventsLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v22 = 138412290;
      v23 = v20;
      _os_log_debug_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEBUG, "SGReverseTemplateJS: Called getFlightReferencesAndReservationId with result: %@", (uint8_t *)&v22, 0xCu);
    }

    objc_msgSend(v4, "exception");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      sgEventsLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v4, "exception");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412290;
        v23 = v21;
        _os_log_fault_impl(&dword_1C3607000, v16, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS: JS Exception during getFlightReferencesAndReservationId: %@", (uint8_t *)&v22, 0xCu);

      }
    }
    SGJSGarbageCollect(objc_msgSend(v4, "JSGlobalContextRef"));
  }
  else
  {
    sgEventsLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v22) = 0;
      _os_log_fault_impl(&dword_1C3607000, v17, OS_LOG_TYPE_FAULT, "Tried to call getFlightReferencesAndReservationId without JS assets", (uint8_t *)&v22, 2u);
    }

    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = 0;

  }
  objc_autoreleasePoolPop(v2);
}

void __57__SGReverseTemplateJS__privacyAwareLogsForMLExtractions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "getJSContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("getPrivacyAwareMlLogs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    v24[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_prepareArguments:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_callJSFunction:withArguments:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "toDictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    sgEventsLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v22 = 138412290;
      v23 = v20;
      _os_log_debug_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEBUG, "SGReverseTemplateJS: Called getPrivacyAwareMlLogs with result: %@", (uint8_t *)&v22, 0xCu);
    }

    objc_msgSend(v4, "exception");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      sgEventsLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v4, "exception");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412290;
        v23 = v21;
        _os_log_fault_impl(&dword_1C3607000, v16, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS: JS Exception during getPrivacyAwareMlLogs: %@", (uint8_t *)&v22, 0xCu);

      }
    }
    SGJSGarbageCollect(objc_msgSend(v4, "JSGlobalContextRef"));
  }
  else
  {
    sgEventsLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v22) = 0;
      _os_log_fault_impl(&dword_1C3607000, v17, OS_LOG_TYPE_FAULT, "Tried to call getPrivacyAwareMlLogs without JS assets", (uint8_t *)&v22, 2u);
    }

    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = 0;

  }
  objc_autoreleasePoolPop(v2);
}

void __51__SGReverseTemplateJS__resolveCandidatesForJSDict___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "getJSContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("resolveCandidatesForJSDict"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    v23[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_prepareArguments:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_callJSFunction:withArguments:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v10, "isNull") & 1) == 0)
    {
      objc_msgSend(v10, "toString");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

    }
    sgEventsLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v21 = 138412290;
      v22 = v19;
      _os_log_debug_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEBUG, "SGReverseTemplateJS: Called resolveCandidatesForJSDict with result: %@", (uint8_t *)&v21, 0xCu);
    }

    objc_msgSend(v4, "exception");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      sgEventsLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v4, "exception");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412290;
        v22 = v20;
        _os_log_fault_impl(&dword_1C3607000, v16, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS: JS Exception during resolveCandidatesForJSDict: %@", (uint8_t *)&v21, 0xCu);

      }
    }
    SGJSGarbageCollect(objc_msgSend(v4, "JSGlobalContextRef"));
  }
  else
  {
    sgEventsLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v21) = 0;
      _os_log_fault_impl(&dword_1C3607000, v17, OS_LOG_TYPE_FAULT, "Tried to call resolveCandidatesForJSDict without JS assets", (uint8_t *)&v21, 2u);
    }

    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = 0;
  }

  objc_autoreleasePoolPop(v2);
}

void __53__SGReverseTemplateJS__eventClassificationForEntity___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "getJSContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("eventClassificationForEntity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    v24[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_prepareArguments:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_callJSFunction:withArguments:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "toDictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    sgEventsLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v20 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v22 = 138412290;
      v23 = v20;
      _os_log_debug_impl(&dword_1C3607000, v14, OS_LOG_TYPE_DEBUG, "SGReverseTemplateJS: Called eventClassificationForEntity with result: %@", (uint8_t *)&v22, 0xCu);
    }

    objc_msgSend(v4, "exception");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      sgEventsLogHandle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v4, "exception");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412290;
        v23 = v21;
        _os_log_fault_impl(&dword_1C3607000, v16, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS _eventClassificationForEntity: JS Exception during eventClassificationForEntity: %@", (uint8_t *)&v22, 0xCu);

      }
    }
    SGJSGarbageCollect(objc_msgSend(v4, "JSGlobalContextRef"));
  }
  else
  {
    sgEventsLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v22) = 0;
      _os_log_fault_impl(&dword_1C3607000, v17, OS_LOG_TYPE_FAULT, "Tried to call eventClassificationForEntity without JS assets", (uint8_t *)&v22, 2u);
    }

    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = 0;

  }
  objc_autoreleasePoolPop(v2);
}

void __42__SGReverseTemplateJS_shouldDownloadFull___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(*(id *)(a1 + 32), "getJSContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("shouldDownloadFull"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    v19[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_prepareArguments:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_callJSFunction:withArguments:", v6, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v10, "toBool");

    sgEventsLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v15 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      v17 = 67109120;
      LODWORD(v18) = v15;
      _os_log_debug_impl(&dword_1C3607000, v11, OS_LOG_TYPE_DEBUG, "SGReverseTemplateJS Called shouldDownloadFull with result = %d", (uint8_t *)&v17, 8u);
    }

    objc_msgSend(v4, "exception");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      sgEventsLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v4, "exception");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138412290;
        v18 = v16;
        _os_log_fault_impl(&dword_1C3607000, v13, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS JS exception during shouldDownloadFull: %@.", (uint8_t *)&v17, 0xCu);

      }
    }
    SGJSGarbageCollect(objc_msgSend(v4, "JSGlobalContextRef"));
  }
  else
  {
    sgEventsLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v17) = 0;
      _os_log_fault_impl(&dword_1C3607000, v14, OS_LOG_TYPE_FAULT, "SGReverseTemplateJS Tried to call shouldDownloadFull without JS assets", (uint8_t *)&v17, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

  objc_autoreleasePoolPop(v2);
}

uint64_t __54__SGReverseTemplateJS_holdXpcTransactionForShortDelay__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "done");
}

void __86__SGReverseTemplateJS_flightInformationWithAirlineCode_flightNumber_flightDate_reply___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "flightInformationWithAirlineCode:flightNumber:flightDate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "holdXpcTransactionForShortDelay");
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void __80__SGReverseTemplateJS_flightInformationWithAirlineCode_flightNumber_flightDate___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = *(void **)(a1 + 32);
  objc_msgSend(a3, "flightResults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sfFlightsToDictionary:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), a4);
    sgEventsLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(_QWORD *)(a1 + 48);
      v16 = *(_QWORD *)(a1 + 56);
      v17 = 138413058;
      v18 = v14;
      v19 = 2112;
      v20 = v15;
      v21 = 2112;
      v22 = v16;
      v23 = 2112;
      v24 = v7;
      _os_log_error_impl(&dword_1C3607000, v13, OS_LOG_TYPE_ERROR, "flightInformationWithAirlineCode flightInformationWithAirlineCode: error when calling CoreParsec for: %@, %@, %@ = %@", (uint8_t *)&v17, 0x2Au);
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));

}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "processLoadRequestWithFileName:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  _QWORD block[4];
  id v11;

  v3 = a2;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(_QWORD *)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v5 + 1;
    if (v5 == 20)
    {
      v6 = *(NSObject **)(a1 + 32);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_3;
      block[3] = &unk_1E7DB7010;
      objc_copyWeak(&v11, (id *)(a1 + 56));
      dispatch_async(v6, block);
      objc_destroyWeak(&v11);
    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "processLoadRequestWithFileName:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "processLoadRequestWithFileName:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_69(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "runDataDetectors:locale:epoch:metadataForTypes:", a3, a2, 0);
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_2_73(uint64_t a1, void *a2, void *a3, void *a4, double a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "count"))
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v11);
  else
    v12 = 0;
  objc_msgSend(*(id *)(a1 + 32), "runDataDetectors:locale:epoch:metadataForTypes:", v10, v9, v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_8(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;

  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    v2 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localeIdentifier");
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_11(uint64_t a1, void *a2)
{
  char *v2;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id JSValueClass;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = a2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v5)
  {
    v2 = (char *)v5;
    v6 = *(_QWORD *)v18;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v4);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          JSValueClass = getJSValueClass();
          objc_msgSend(getJSContextClass(), "currentContext", v17);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(JSValueClass, "valueWithNewErrorFromMessage:inContext:", CFSTR("getPreferredLocalizationsFromArray must be called with an array of strings"), v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(getJSContextClass(), "currentContext");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setException:", v14);

          v12 = 0;
          v2 = v4;
          goto LABEL_14;
        }
        ++v7;
      }
      while (v2 != v7);
      v2 = (char *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      if (v2)
        continue;
      break;
    }
  }

  v8 = (void *)MEMORY[0x1E0CB34D0];
  v9 = *(void **)(a1 + 32);
  v10 = v9;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale", v17);
    v2 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v21 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferredLocalizationsFromArray:forPreferences:", v4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_14:

  }
  return v12;
}

double __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_21(uint64_t a1)
{
  return (double)((mach_absolute_time() - *(_QWORD *)(a1 + 32))
                * initCurrentAsset_machTimebaseInfo
                / *(unsigned int *)algn_1ED52975C)
       * 0.000000001;
}

void __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_22(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_23;
  block[3] = &unk_1E7DB7010;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_24(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  v8 = a3;
  v9 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "flightInformationWithAirlineCode:flightNumber:flightDate:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_25(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "md5Hash:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_26(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "loadTrieWithFileName:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_27(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "mappedArrayBufferForFileName:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_23(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "freeJSContext");

}

uint64_t __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_20()
{
  return mach_timebase_info((mach_timebase_info_t)&initCurrentAsset_machTimebaseInfo);
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_19(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(a2, "doubleValue");
  objc_msgSend(v4, "dateWithTimeIntervalSince1970:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDateFormat:", CFSTR("ZZZZZ"));
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setTimeZone:", v8);
  objc_msgSend(v7, "stringFromDate:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_17()
{
  if (_block_invoke_onceToken != -1)
    dispatch_once(&_block_invoke_onceToken, &__block_literal_global_155);
  return (id)_block_invoke_version;
}

void __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_18()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = _CFCopyServerVersionDictionary();
  v1 = (void *)_block_invoke_version;
  _block_invoke_version = v0;

  if (!_block_invoke_version)
  {
    v2 = _CFCopySystemVersionDictionary();
    v3 = (void *)_block_invoke_version;
    _block_invoke_version = v2;

  }
}

uint64_t __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_16()
{
  return objc_msgSend(MEMORY[0x1E0D198F0], "allowUnverifiedSourceForMarkup");
}

uint64_t __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_15()
{
  return objc_msgSend(MEMORY[0x1E0D198F0], "allowAnyDomainForMarkup");
}

uint64_t __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_14()
{
  return objc_msgSend(MEMORY[0x1E0D198F0], "allowGeocode");
}

uint64_t __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_13()
{
  return os_variant_has_internal_diagnostics();
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_12(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = a2;
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setFormatterBehavior:", 1040);
  v13 = objc_msgSend(v10, "unsignedIntegerValue");

  objc_msgSend(v12, "setDateStyle:", v13);
  v14 = objc_msgSend(v9, "unsignedIntegerValue");

  objc_msgSend(v12, "setTimeStyle:", v14);
  v15 = (void *)MEMORY[0x1E0C99E80];
  if (v8)
    v16 = objc_msgSend(v8, "unsignedIntegerValue");
  else
    v16 = 0;
  objc_msgSend(v15, "timeZoneForSecondsFromGMT:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTimeZone:", v17);

  v18 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v11, "doubleValue");
  v20 = v19;

  objc_msgSend(v18, "dateWithTimeIntervalSince1970:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringFromDate:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_9(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  v10 = a2;
  v11 = objc_msgSend(v10, "length");
  objc_msgSend(MEMORY[0x1E0CB3840], "defaultOrthographyForLanguage:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  objc_msgSend(v10, "linguisticTagsInRange:scheme:options:orthography:tokenRanges:", 0, v11, v8, a5, v12, &v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v18;
  if (objc_msgSend(v14, "count"))
  {
    sgMap();
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = (id)v15;
  }
  v19[0] = CFSTR("tags");
  v19[1] = CFSTR("ranges");
  v20[0] = v13;
  v20[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a2, "rangeValue");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

__CFString *__39__SGReverseTemplateJS_initCurrentAsset__block_invoke_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  +[SGMonochrome stringByExtractingPlainTextFromHTML:tableDelimiters:stripLinks:](SGMonochrome, "stringByExtractingPlainTextFromHTML:tableDelimiters:stripLinks:", a2, 1, a3);
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &stru_1E7DB83A8;
  v5 = v3;

  return v5;
}

uint64_t __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0D19EC0], "dominantLanguageTagFromText:", a2);
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_5_90(uint64_t a1, uint64_t a2)
{
  return +[SGHtmlEntities decodeEntities:](SGHtmlEntities, "decodeEntities:", a2);
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_4_85(uint64_t a1, uint64_t a2)
{
  return +[SGTokenizer tokenize:](SGTokenizer, "tokenize:", a2);
}

id __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_3_79(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[SGMicrodataParser parse:](SGMicrodataParser, "parse:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asJsonLd");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_60(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  sgDeveloperLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  sgEventsLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_debug_impl(&dword_1C3607000, v3, OS_LOG_TYPE_DEBUG, "JS log: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __39__SGReverseTemplateJS_initCurrentAsset__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "freeJSContext");

}

void __51__SGReverseTemplateJS__handleMemoryPressureStatus___block_invoke(uint64_t a1, unsigned int a2)
{
  NSObject **WeakRetained;
  NSObject **v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[9];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__SGReverseTemplateJS__handleMemoryPressureStatus___block_invoke_2;
    block[3] = &unk_1E7DB56F0;
    block[4] = v4;
    dispatch_async(v5, block);
    if (a2)
    {
      sgEventsLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v9 = a2;
        _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_INFO, "SGReverseTemplateJS: suppressed process memory warning %lu times", buf, 0xCu);
      }

    }
  }

}

uint64_t __51__SGReverseTemplateJS__handleMemoryPressureStatus___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  sgEventsLogHandle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_1C3607000, v2, OS_LOG_TYPE_INFO, "SGReverseTemplateJS: Queuing request to free JS context.", (uint8_t *)&v9, 2u);
  }

  sgEventsLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    +[SGAsset asset](SGAsset, "asset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "assetVersion");
    v9 = 134217984;
    v10 = v5;
    _os_log_impl(&dword_1C3607000, v3, OS_LOG_TYPE_INFO, "SGReverseTemplateJS: Asset version = %lu", (uint8_t *)&v9, 0xCu);

  }
  sgEventsLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "_pas_componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = (uint64_t)v7;
    _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_INFO, "SGReverseTemplateJS: List of loaded JS files in context = %@", (uint8_t *)&v9, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "freeJSContext");
}

void __53__SGReverseTemplateJS__callJSFunction_withArguments___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  sgLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_fault_impl(&dword_1C3607000, v0, OS_LOG_TYPE_FAULT, "JS not interrupted after timeout!", v1, 2u);
  }

  if (!_PASEvaluateLogFaultAndProbCrashCriteria())
    exit(1);
  abort();
}

void __27__SGReverseTemplateJS_init__block_invoke(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  id v3;

  v1 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__SGReverseTemplateJS_init__block_invoke_2;
  block[3] = &unk_1E7DB7010;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  dispatch_async(v1, block);
  objc_destroyWeak(&v3);
}

void __27__SGReverseTemplateJS_init__block_invoke_3(uint64_t a1)
{
  dispatch_source_t *WeakRetained;
  dispatch_source_t *v2;

  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[dispatch_source_t _handleMemoryPressureStatus:](WeakRetained, "_handleMemoryPressureStatus:", dispatch_source_get_data(WeakRetained[11]));
    WeakRetained = v2;
  }

}

void __27__SGReverseTemplateJS_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "freeJSContext");

}

+ (id)fakeFlightInformationWithAirlineCode:(id)a3 flightNumber:(id)a4 flightDate:(id)a5
{
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGReverseTemplateJS.m"), 1198, CFSTR("This method must be stubbed!"));

  return 0;
}

@end
