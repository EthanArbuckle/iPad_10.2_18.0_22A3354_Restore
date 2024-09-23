@implementation IASTextInputActionsAnalyzer

- (NSString)name
{
  uint64_t v2;
  uint64_t v3;

  return (NSString *)objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], a2, (uint64_t)CFSTR("%@|%@|%@"), v2, v3, self->_name, self->_mostRecentAppBundleId, self->_mostRecentProcessId);
}

- (IASTextInputActionsAnalyzer)initWithEventHandler:(id)a3
{
  id v4;
  IASTextInputActionsAnalyzer *v5;
  IASTextInputActionsAnalyzer *v6;
  NSString *name;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableDictionary *entries;
  NSMutableSet *v14;
  NSMutableSet *sessionErrors;
  void *v16;
  id eventHandler;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)IASTextInputActionsAnalyzer;
  v5 = -[IASTextInputActionsAnalyzer init](&v32, sel_init);
  v6 = v5;
  if (v5)
  {
    name = v5->_name;
    v5->_name = (NSString *)CFSTR("TextInputActionsAnalyzer");

    v8 = objc_alloc(MEMORY[0x24BDBCED8]);
    v12 = objc_msgSend_initWithCapacity_(v8, v9, 1, v10, v11);
    entries = v6->_entries;
    v6->_entries = (NSMutableDictionary *)v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    sessionErrors = v6->_sessionErrors;
    v6->_sessionErrors = v14;

    v16 = _Block_copy(v4);
    eventHandler = v6->_eventHandler;
    v6->_eventHandler = v16;

    v18 = objc_alloc_init(MEMORY[0x24BDD1880]);
    objc_msgSend_setAnalyzerSessionId_(v6, v19, (uint64_t)v18, v20, v21);

    objc_msgSend_date(MEMORY[0x24BDBCE60], v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDateOfLastAction_(v6, v27, (uint64_t)v26, v28, v29);

    sub_23F09723C();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      sub_23F09FDF4();

  }
  return v6;
}

- (IASTextInputActionsAnalyzer)initWithAnalyzerSessionId:(id)a3 sessionManagerDelegate:(id)a4
{
  id v6;
  id v7;
  IASTextInputActionsAnalyzer *v8;
  IASTextInputActionsAnalyzer *v9;
  NSString *name;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableDictionary *entries;
  NSMutableSet *v17;
  NSMutableSet *sessionErrors;
  id eventHandler;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  objc_super v36;

  v6 = a3;
  v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)IASTextInputActionsAnalyzer;
  v8 = -[IASTextInputActionsAnalyzer init](&v36, sel_init);
  v9 = v8;
  if (v8)
  {
    name = v8->_name;
    v8->_name = (NSString *)CFSTR("TextInputActionsAnalyzer");

    v11 = objc_alloc(MEMORY[0x24BDBCED8]);
    v15 = objc_msgSend_initWithCapacity_(v11, v12, 1, v13, v14);
    entries = v9->_entries;
    v9->_entries = (NSMutableDictionary *)v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    sessionErrors = v9->_sessionErrors;
    v9->_sessionErrors = v17;

    eventHandler = v9->_eventHandler;
    v9->_eventHandler = &unk_250F8F258;

    objc_msgSend_setAnalyzerSessionId_(v9, v20, (uint64_t)v6, v21, v22);
    objc_msgSend_setSessionManagerDelegate_(v9, v23, (uint64_t)v7, v24, v25);
    objc_msgSend_date(MEMORY[0x24BDBCE60], v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDateOfLastAction_(v9, v31, (uint64_t)v30, v32, v33);

    sub_23F09723C();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      sub_23F09FDF4();

  }
  return v9;
}

- (IASTextInputActionsAnalyzer)initWithAnalyzerSessionId:(id)a3 sessionManagerDelegate:(id)a4 eventHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  IASTextInputActionsAnalyzer *v11;
  IASTextInputActionsAnalyzer *v12;
  NSString *name;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSMutableDictionary *entries;
  NSMutableSet *v20;
  NSMutableSet *sessionErrors;
  void *v22;
  id eventHandler;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  objc_super v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v40.receiver = self;
  v40.super_class = (Class)IASTextInputActionsAnalyzer;
  v11 = -[IASTextInputActionsAnalyzer init](&v40, sel_init);
  v12 = v11;
  if (v11)
  {
    name = v11->_name;
    v11->_name = (NSString *)CFSTR("TextInputActionsAnalyzer");

    v14 = objc_alloc(MEMORY[0x24BDBCED8]);
    v18 = objc_msgSend_initWithCapacity_(v14, v15, 1, v16, v17);
    entries = v12->_entries;
    v12->_entries = (NSMutableDictionary *)v18;

    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    sessionErrors = v12->_sessionErrors;
    v12->_sessionErrors = v20;

    v22 = _Block_copy(v10);
    eventHandler = v12->_eventHandler;
    v12->_eventHandler = v22;

    objc_msgSend_setAnalyzerSessionId_(v12, v24, (uint64_t)v8, v25, v26);
    objc_msgSend_setSessionManagerDelegate_(v12, v27, (uint64_t)v9, v28, v29);
    objc_msgSend_date(MEMORY[0x24BDBCE60], v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setDateOfLastAction_(v12, v35, (uint64_t)v34, v36, v37);

    sub_23F09723C();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      sub_23F09FDF4();

  }
  return v12;
}

+ (IASTextInputActionsAnalyzer)analyzerWithName:(id)a3
{
  id v3;
  _QWORD *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v9 = objc_msgSend_copy(v3, v5, v6, v7, v8);

  v10 = (void *)v4[10];
  v4[10] = v9;

  objc_msgSend_reset(v4, v11, v12, v13, v14);
  return (IASTextInputActionsAnalyzer *)v4;
}

- (void)logErrorCodeIfNotNil:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;

  v4 = a3;
  if (v4)
  {
    v14 = v4;
    if (objc_msgSend_length(v4, v5, v6, v7, v8) == 1)
    {
      v12 = (uint64_t)v14;
    }
    else
    {
      objc_msgSend_stringByAppendingString_(CFSTR("E"), v9, (uint64_t)v14, v10, v11);
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = v13;
    }
    v15 = (id)v12;
    objc_msgSend_addObject_(self->_sessionErrors, v9, v12, v10, v11);

  }
}

+ (id)getOrInitializeArrayFromDictionary:(id)a3 forKey:(id)a4 initCapacity:(unint64_t)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;

  v7 = a3;
  v8 = a4;
  objc_msgSend_valueForKey_(v7, v9, (uint64_t)v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v13 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v12 = (void *)objc_msgSend_initWithCapacity_(v13, v14, a5, v15, v16);
    if (a5)
    {
      v21 = a5;
      do
      {
        objc_msgSend_null(MEMORY[0x24BDBCEF8], v17, v18, v19, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v12, v23, (uint64_t)v22, v24, v25);

        --v21;
      }
      while (v21);
    }
    objc_msgSend_setObject_forKey_(v7, v17, (uint64_t)v12, (uint64_t)v8, v20);
    sub_23F09723C();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      sub_23F09FE20();

  }
  return v12;
}

+ (id)getOrInitializeArrayFromArray:(id)a3 forKey:(unint64_t)a4 initCapacity:(unint64_t)a5
{
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  int isEqual;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  unint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;

  v9 = a3;
  if (objc_msgSend_count(v9, v10, v11, v12, v13) <= a4)
  {
    sub_23F09723C();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_23F09FEE0(v9, (const char *)a4, (uint64_t)v17, v18, v19);

    if (a4 >= 0x14)
    {
      objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v20, v21, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, (uint64_t)a1, (uint64_t)CFSTR("IASTextInputActionsAnalyzer.m"), 307, CFSTR("Attempt to access index %lu, which is much larger than expected"), a4);

    }
    while (objc_msgSend_count(v9, v20, v21, v22, v23) <= a4)
    {
      objc_msgSend_null(MEMORY[0x24BDBCEF8], v14, v30, v15, v16);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v9, v27, (uint64_t)v26, v28, v29);

    }
  }
  objc_msgSend_objectAtIndexedSubscript_(v9, v14, a4, v15, v16);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v31, v37, (uint64_t)v36, v38, v39);

  if (isEqual)
  {
    v44 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v52 = (void *)objc_msgSend_initWithCapacity_(v44, v45, a5, v46, v47);
    if (a5)
    {
      v53 = a5;
      do
      {
        objc_msgSend_null(MEMORY[0x24BDBCEF8], v48, v49, v50, v51);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v52, v55, (uint64_t)v54, v56, v57);

        --v53;
      }
      while (v53);
    }
    objc_msgSend_setObject_atIndexedSubscript_(v9, v48, (uint64_t)v52, a4, v51);
    sub_23F09723C();
    v58 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      sub_23F09FE80();

  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v9, v41, a4, v42, v43);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v52;
}

+ (id)getOrInitializeDictionaryFrom:(id)a3 forKey:(unint64_t)a4 initCapacity:(int64_t)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  int isEqual;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  NSObject *v28;

  v7 = a3;
  objc_msgSend_objectAtIndexedSubscript_(v7, v8, a4, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  isEqual = objc_msgSend_isEqual_(v11, v17, (uint64_t)v16, v18, v19);

  if (isEqual)
  {
    v21 = objc_alloc(MEMORY[0x24BDBCED8]);
    v25 = objc_msgSend_initWithCapacity_(v21, v22, a5, v23, v24);

    objc_msgSend_setObject_atIndexedSubscript_(v7, v26, v25, a4, v27);
    sub_23F09723C();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      sub_23F09FF68();

    v11 = (void *)v25;
  }

  return v11;
}

- (void)increaseCountForAppBundleId:(id)a3 forSource:(int64_t)a4 forActionType:(int64_t)a5 forFlagOptions:(int64_t)a6 forInputModeKey:(id)a7 byAnalyzerEntry:(id)a8
{
  __CFString *v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  IASTextInputActionsAnalyzerEntry *v32;
  const char *v33;
  uint64_t v34;
  NSObject *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  int64_t v88;
  __int16 v89;
  int64_t v90;
  __int16 v91;
  int64_t v92;
  __int16 v93;
  id v94;
  __int16 v95;
  uint64_t v96;
  __int16 v97;
  uint64_t v98;
  __int16 v99;
  uint64_t v100;
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  uint64_t v104;
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v14 = (__CFString *)a3;
  v15 = a7;
  v16 = a8;
  if ((objc_msgSend_isAllZeroes(v16, v17, v18, v19, v20) & 1) == 0)
  {
    if (v15)
    {
      if (!v14)
        v14 = &stru_250F901F0;
      objc_msgSend_getOrInitializeArrayFromDictionary_forKey_initCapacity_(IASTextInputActionsAnalyzer, v21, (uint64_t)self->_entries, (uint64_t)v14, 15);
      v22 = objc_claimAutoreleasedReturnValue();
      objc_msgSend_getOrInitializeArrayFromArray_forKey_initCapacity_(IASTextInputActionsAnalyzer, v23, (uint64_t)v22, a4, 17);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_getOrInitializeArrayFromArray_forKey_initCapacity_(IASTextInputActionsAnalyzer, v24, (uint64_t)v83, a5, 8);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_getOrInitializeDictionaryFrom_forKey_initCapacity_(IASTextInputActionsAnalyzer, v25, (uint64_t)v82, a6, 1);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v84, v26, (uint64_t)v15, v27, v28);
      v32 = (IASTextInputActionsAnalyzerEntry *)objc_claimAutoreleasedReturnValue();
      if (!v32)
      {
        v32 = objc_alloc_init(IASTextInputActionsAnalyzerEntry);
        objc_msgSend_setObject_forKeyedSubscript_(v84, v33, (uint64_t)v32, (uint64_t)v15, v34);
        sub_23F09723C();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend_analyzerSessionId(self, v36, v37, v38, v39);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_description(v81, v71, v72, v73, v74);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138478851;
          v86 = v79;
          v87 = 2048;
          v88 = a4;
          v89 = 2048;
          v90 = a5;
          v91 = 2048;
          v92 = a6;
          v93 = 2113;
          v94 = v15;
          _os_log_debug_impl(&dword_23F08C000, v35, OS_LOG_TYPE_DEBUG, "[%{private}@][IASTextInputActionsAnalyzer] New input mode key found - initializing new entry for source:%lu actionType:%lu flagOptions%lu inputMode:\"%{private}@\", buf, 0x34u);

        }
      }
      objc_msgSend_increaseWithEntry_(v32, v29, (uint64_t)v16, v30, v31);
      sub_23F09723C();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_analyzerSessionId(self, v41, v42, v43, v44);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_description(v80, v45, v46, v47, v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend_netCharacters(v16, v50, v51, v52, v53);
        v77 = objc_msgSend_userRemovedCharacters(v16, v54, v55, v56, v57);
        v76 = objc_msgSend_netEmojiCharacters(v16, v58, v59, v60, v61);
        v75 = objc_msgSend_userRemovedEmojiCharacters(v16, v62, v63, v64, v65);
        v70 = objc_msgSend_inputActions(v16, v66, v67, v68, v69);
        *(_DWORD *)buf = 138480131;
        v86 = v49;
        v87 = 2048;
        v88 = a4;
        v89 = 2048;
        v90 = a5;
        v91 = 2048;
        v92 = a6;
        v93 = 2113;
        v94 = v15;
        v95 = 2048;
        v96 = v78;
        v97 = 2048;
        v98 = v77;
        v99 = 2048;
        v100 = v76;
        v101 = 2048;
        v102 = v75;
        v103 = 2048;
        v104 = v70;
        _os_log_debug_impl(&dword_23F08C000, v40, OS_LOG_TYPE_DEBUG, "[%{private}@][IASTextInputActionsAnalyzer] Updated entry for source:%lu actionType:%lu flagOptions%lu inputMode:\"%{private}@\" by netChars:%ld userRemovedChars:%ld netEmojiChars:%ld userRemovedEmojiChars:%ld actions:%ld", buf, 0x66u);

      }
    }
    else
    {
      sub_23F09723C();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        sub_23F09FFC8();
    }

  }
}

- (void)consumeAction:(id)a3
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  IATextInputActionsInputMode *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  unint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  NSObject *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  NSObject *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  NSObject *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  NSObject *v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  void *v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  NSString *v229;
  NSString *mostRecentProcessId;
  uint64_t v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  void *v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  NSString *v243;
  NSString *mostRecentAppBundleId;
  void *v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  void *v250;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  void *v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  NSObject *v259;
  void *v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  void *v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  const char *v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  void *v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  void *v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  void *v325;
  unint64_t charsRemovedBeforeFirstInsertionCount;
  unint64_t emojisRemovedBeforeFirstInsertionCount;
  void *v328;
  const char *v329;
  const char *v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  void *v334;
  const char *v335;
  unint64_t largestSessionInsertionLength;
  void *v337;
  void *v338;
  unint64_t largestSessionDeletionLength;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  uint8_t buf[4];
  void *v345;
  __int16 v346;
  unint64_t v347;
  __int16 v348;
  uint64_t v349;
  __int16 v350;
  uint64_t v351;
  __int16 v352;
  uint64_t v353;
  __int16 v354;
  uint64_t v355;
  __int16 v356;
  uint64_t v357;
  __int16 v358;
  uint64_t v359;
  __int16 v360;
  uint64_t v361;
  __int16 v362;
  void *v363;
  uint64_t v364;

  v364 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v10 = v5;
  if (v5)
  {
    v11 = v5;
  }
  else
  {
    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v6, v7, v8, v9);
    v328 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v328, v329, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("IASTextInputActionsAnalyzer.m"), 404, CFSTR("nil raw action passed to [IASTextInputActionsAnalyzer consumeAction:]"));

    objc_msgSend_currentHandler(MEMORY[0x24BDD1448], v330, v331, v332, v333);
    v334 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v334, v335, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("IASTextInputActionsAnalyzer.m"), 410, CFSTR("Failed to cast raw action to TextInputActionsSessionAction and is now nil"));

  }
  objc_msgSend_inputMode(v10, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v20 = objc_alloc_init(IATextInputActionsInputMode);
    objc_msgSend_setInputMode_(v10, v21, (uint64_t)v20, v22, v23);

    sub_23F09723C();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      sub_23F0A004C(self, (char *)v10, (uint64_t)v24, v25, v26);

  }
  objc_msgSend_generateAnalyzerEntryFromAction_(IASTextInputActionsAnalyzerEntry, v17, (uint64_t)v10, v18, v19);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputMode(v10, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputModeUniqueString(v32, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  sub_23F09723C();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_analyzerSessionId(self, v39, v40, v41, v42);
    v340 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_description(v340, v264, v265, v266, v267);
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138480131;
    v345 = v268;
    v346 = 2113;
    v347 = (unint64_t)v10;
    v348 = 2048;
    v349 = objc_msgSend_netCharacters(v27, v269, v270, v271, v272);
    v350 = 2048;
    v351 = objc_msgSend_userRemovedCharacters(v27, v273, v274, v275, v276);
    v352 = 2048;
    v353 = objc_msgSend_netEmojiCharacters(v27, v277, v278, v279, v280);
    v354 = 2048;
    v355 = objc_msgSend_userRemovedEmojiCharacters(v27, v281, v282, v283, v284);
    v356 = 2048;
    v357 = objc_msgSend_inputActions(v27, v285, v286, v287, v288);
    v358 = 2048;
    v359 = objc_msgSend_source(v10, v289, v290, v291, v292);
    v360 = 2048;
    v361 = objc_msgSend_textInputActionsType(v10, v293, v294, v295, v296);
    v362 = 2113;
    v363 = v37;
    _os_log_debug_impl(&dword_23F08C000, v38, OS_LOG_TYPE_DEBUG, "[%{private}@][IASTextInputActionsAnalyzer] consumeAction(): %{private}@ netCharactersDelta:%ld userRemovedCharactersDelta:%ld netEmojiCharactersDelta:%ld sysRemovedObjectsDelta:%ld inputActionsDelta:%ld for source:%lu type:%lu inputMode:%{private}@", buf, 0x66u);

  }
  objc_msgSend_appBundleId(v10, v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend_source(v10, v48, v49, v50, v51);
  v57 = objc_msgSend_textInputActionsType(v10, v53, v54, v55, v56);
  v62 = objc_msgSend_flagOptions(v10, v58, v59, v60, v61);
  objc_msgSend_increaseCountForAppBundleId_forSource_forActionType_forFlagOptions_forInputModeKey_byAnalyzerEntry_(self, v63, (uint64_t)v47, v52, v57, v62, v37, v27);

  objc_msgSend_inputMode(v10, v64, v65, v66, v67);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_language(v68, v69, v70, v71, v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (v73)
  {

  }
  else
  {
    objc_msgSend_inputMode(v10, v74, v75, v76, v77);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_region(v82, v83, v84, v85, v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v87)
      goto LABEL_14;
  }
  if (objc_msgSend_source(v10, v78, v79, v80, v81) == 4)
  {
    objc_msgSend_inputMode(v10, v78, v79, v80, v81);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_language(v88, v89, v90, v91, v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_validateLanguage_(IASTextInputActionsErrorChecking, v94, (uint64_t)v93, v95, v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_logErrorCodeIfNotNil_(self, v98, (uint64_t)v97, v99, v100);

    objc_msgSend_inputMode(v10, v101, v102, v103, v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_region(v105, v106, v107, v108, v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_validateRegion_(IASTextInputActionsErrorChecking, v111, (uint64_t)v110, v112, v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_logErrorCodeIfNotNil_(self, v115, (uint64_t)v114, v116, v117);

  }
LABEL_14:
  objc_msgSend_asDictationBegan(v10, v78, v79, v80, v81);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v118;
  if (v118 && objc_msgSend_modelessUsedAtLeastOnceCount(v118, v119, v120, v121, v122))
    self->_sessionIsModeless = 1;
  v124 = objc_msgSend_largestSingleInsertionLength(v10, v119, v120, v121, v122);
  v129 = objc_msgSend_largestSingleDeletionLength(v10, v125, v126, v127, v128);
  v134 = objc_msgSend_netCharacterCount(v10, v130, v131, v132, v133);
  v139 = objc_msgSend_flagOptions(v10, v135, v136, v137, v138);
  if (objc_msgSend_isEmojiSearchSetInFlagOptions_(IATextInputActionsUtils, v140, v139, v141, v142))
  {
    v124 = objc_msgSend_insertedEmojiCount(v10, v143, v144, v145, v146);
    v129 = objc_msgSend_removedEmojiCount(v10, v147, v148, v149, v150);
    v155 = objc_msgSend_insertedEmojiCount(v10, v151, v152, v153, v154);
    v134 = v155 - objc_msgSend_removedEmojiCount(v10, v156, v157, v158, v159);
    sub_23F09723C();
    v160 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v160, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_analyzerSessionId(self, v161, v162, v163, v164);
      v341 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_description(v341, v297, v298, v299, v300);
      v337 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478595;
      v345 = v337;
      v346 = 2048;
      v347 = v124;
      v348 = 2048;
      v349 = v129;
      v350 = 2048;
      v351 = v134;
      _os_log_debug_impl(&dword_23F08C000, v160, OS_LOG_TYPE_DEBUG, "[%{private}@][IASTextInputActionsAnalyzer] emoji search - override insertion %lu, deletion %lu, net %ld", buf, 0x2Au);

    }
  }
  if (v124 > self->_largestSessionInsertionLength)
  {
    sub_23F09723C();
    v165 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v165, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_analyzerSessionId(self, v166, v167, v168, v169);
      v338 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_description(v338, v301, v302, v303, v304);
      v342 = (void *)objc_claimAutoreleasedReturnValue();
      largestSessionInsertionLength = self->_largestSessionInsertionLength;
      v309 = objc_msgSend_largestSingleInsertionLength(v10, v305, v306, v307, v308);
      *(_DWORD *)buf = 138478339;
      v345 = v342;
      v346 = 2048;
      v347 = largestSessionInsertionLength;
      v348 = 2048;
      v349 = v309;
      _os_log_debug_impl(&dword_23F08C000, v165, OS_LOG_TYPE_DEBUG, "[%{private}@][IASTextInputActionsAnalyzer] largestSessionInsertionLength %lu -> %lu", buf, 0x20u);

    }
    self->_largestSessionInsertionLength = v124;
  }
  if (v129 > self->_largestSessionDeletionLength)
  {
    sub_23F09723C();
    v170 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v170, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend_analyzerSessionId(self, v171, v172, v173, v174);
      v343 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_description(v343, v310, v311, v312, v313);
      v314 = (void *)objc_claimAutoreleasedReturnValue();
      largestSessionDeletionLength = self->_largestSessionDeletionLength;
      v319 = objc_msgSend_largestSingleDeletionLength(v10, v315, v316, v317, v318);
      *(_DWORD *)buf = 138478339;
      v345 = v314;
      v346 = 2048;
      v347 = largestSessionDeletionLength;
      v348 = 2048;
      v349 = v319;
      _os_log_debug_impl(&dword_23F08C000, v170, OS_LOG_TYPE_DEBUG, "[%{private}@][IASTextInputActionsAnalyzer] largestSessionDeletionLength %lu -> %lu", buf, 0x20u);

    }
    self->_largestSessionDeletionLength = v129;
  }
  v175 = objc_msgSend_flagOptions(v10, v143, v144, v145, v146);
  if ((objc_msgSend_isMarkedTextSetInFlagOptions_(IATextInputActionsUtils, v176, v175, v177, v178) & 1) == 0)
    self->_sessionNetCharacters += v134;
  if (objc_msgSend_isCapableOfTextInsertion(v10, v179, v180, v181, v182))
  {
    v187 = objc_msgSend_flagOptions(v10, v183, v184, v185, v186);
    if (!objc_msgSend_isEmojiSearchSetInFlagOptions_(IATextInputActionsUtils, v188, v187, v189, v190)|| (v195 = objc_msgSend_flagOptions(v10, v191, v192, v193, v194), objc_msgSend_isEmojiSearchSetInFlagOptions_(IATextInputActionsUtils, v196, v195, v197, v198))&& objc_msgSend_insertedEmojiCount(v10, v183, v184, v185, v186))
    {
      self->_insertionObservedInSession = 1;
      sub_23F09723C();
      v199 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v199, OS_LOG_TYPE_DEBUG))
        sub_23F0A0020();
LABEL_41:

      goto LABEL_42;
    }
  }
  if (!self->_insertionObservedInSession)
  {
    v200 = objc_msgSend_flagOptions(v10, v183, v184, v185, v186);
    if ((objc_msgSend_isEmojiSearchSetInFlagOptions_(IATextInputActionsUtils, v201, v200, v202, v203) & 1) == 0)
    {
      v204 = objc_msgSend_removedTextLength(v10, v183, v184, v185, v186);
      self->_charsRemovedBeforeFirstInsertionCount += v204 - objc_msgSend_removedEmojiCount(v10, v205, v206, v207, v208);
      self->_emojisRemovedBeforeFirstInsertionCount += objc_msgSend_removedEmojiCount(v10, v209, v210, v211, v212);
      sub_23F09723C();
      v199 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v199, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend_analyzerSessionId(self, v213, v214, v215, v216);
        v320 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_description(v320, v321, v322, v323, v324);
        v325 = (void *)objc_claimAutoreleasedReturnValue();
        charsRemovedBeforeFirstInsertionCount = self->_charsRemovedBeforeFirstInsertionCount;
        emojisRemovedBeforeFirstInsertionCount = self->_emojisRemovedBeforeFirstInsertionCount;
        *(_DWORD *)buf = 138478339;
        v345 = v325;
        v346 = 2048;
        v347 = charsRemovedBeforeFirstInsertionCount;
        v348 = 2048;
        v349 = emojisRemovedBeforeFirstInsertionCount;
        _os_log_debug_impl(&dword_23F08C000, v199, OS_LOG_TYPE_DEBUG, "[%{private}@][IASTextInputActionsAnalyzer] Initial deletion %lu, %lu", buf, 0x20u);

      }
      goto LABEL_41;
    }
  }
LABEL_42:
  objc_msgSend_processBundleId(v10, v183, v184, v185, v186);
  v217 = objc_claimAutoreleasedReturnValue();
  if (v217)
  {
    v222 = (void *)v217;
    objc_msgSend_processBundleId(v10, v218, v219, v220, v221);
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    v228 = objc_msgSend_length(v223, v224, v225, v226, v227);

    if (v228)
    {
      objc_msgSend_processBundleId(v10, v218, v219, v220, v221);
      v229 = (NSString *)objc_claimAutoreleasedReturnValue();
      mostRecentProcessId = self->_mostRecentProcessId;
      self->_mostRecentProcessId = v229;

    }
  }
  objc_msgSend_appBundleId(v10, v218, v219, v220, v221);
  v231 = objc_claimAutoreleasedReturnValue();
  if (v231)
  {
    v236 = (void *)v231;
    objc_msgSend_appBundleId(v10, v232, v233, v234, v235);
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    v242 = objc_msgSend_length(v237, v238, v239, v240, v241);

    if (v242)
    {
      objc_msgSend_appBundleId(v10, v232, v233, v234, v235);
      v243 = (NSString *)objc_claimAutoreleasedReturnValue();
      mostRecentAppBundleId = self->_mostRecentAppBundleId;
      self->_mostRecentAppBundleId = v243;

    }
  }
  objc_msgSend_asEnd(v10, v232, v233, v234, v235);
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_keyboardTrialParameters(v245, v246, v247, v248, v249);
  v250 = (void *)objc_claimAutoreleasedReturnValue();

  if (v250)
  {
    objc_msgSend_keyboardTrialParameters(v245, v251, v252, v253, v254);
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setKeyboardTrialParameters_(self, v256, (uint64_t)v255, v257, v258);

    sub_23F09723C();
    v259 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v259, OS_LOG_TYPE_DEBUG))
      sub_23F09FFF4();

  }
  objc_msgSend_date(MEMORY[0x24BDBCE60], v251, v252, v253, v254);
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDateOfLastAction_(self, v261, (uint64_t)v260, v262, v263);

}

- (void)reset
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;

  objc_msgSend_removeAllObjects(self->_entries, a2, v2, v3, v4);
  objc_msgSend_removeAllObjects(self->_sessionErrors, v6, v7, v8, v9);
  self->_sessionIsModeless = 0;
  self->_largestSessionDeletionLength = 0;
  self->_sessionNetCharacters = 0;
  self->_largestSessionInsertionLength = 0;
  self->_insertionObservedInSession = 0;
  self->_charsRemovedBeforeFirstInsertionCount = 0;
  self->_emojisRemovedBeforeFirstInsertionCount = 0;
  sub_23F09723C();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_23F0A010C();

}

- (id)computeSessionActionsStringOnSession:(id)a3
{
  id v5;
  IATextInputActionsSessionActionInformation *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  IATextInputActionsSessionActionInformation *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  int isEqualToString;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  IATextInputActionsSessionActionInformation *v87;
  IATextInputActionsSessionActionInformation *v88;
  uint64_t v90;
  uint64_t v91;
  void (*v92)(uint64_t, void *, uint64_t);
  void *v93;
  IATextInputActionsSessionActionInformation *v94;
  _QWORD v95[5];
  id v96;
  SEL v97;

  v5 = a3;
  v6 = objc_alloc_init(IATextInputActionsSessionActionInformation);
  v7 = 13;
  objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], v8, 13, v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  do
  {
    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v11, 0, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v14, v16, (uint64_t)v15, v17, v18);

    --v7;
  }
  while (v7);
  v19 = MEMORY[0x24BDAC760];
  v95[0] = MEMORY[0x24BDAC760];
  v95[1] = 3221225472;
  v95[2] = sub_23F094500;
  v95[3] = &unk_250F8F890;
  v97 = a2;
  v95[4] = self;
  v20 = v14;
  v96 = v20;
  objc_msgSend_enumerateObjectsUsingBlock_(v5, v21, (uint64_t)v95, v22, v23);
  objc_msgSend_setSessionActionsString_(v6, v24, (uint64_t)&stru_250F901F0, v25, v26);
  v90 = v19;
  v91 = 3221225472;
  v92 = sub_23F094748;
  v93 = &unk_250F8F8B8;
  v27 = v6;
  v94 = v27;
  objc_msgSend_enumerateObjectsUsingBlock_(v20, v28, (uint64_t)&v90, v29, v30);
  objc_msgSend_objectAtIndexedSubscript_(v20, v31, 4, v32, v33, v90, v91, v92, v93);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_BOOLValue(v34, v35, v36, v37, v38))
  {
    objc_msgSend_setSessionHasOnlyPrimaryInput_(v27, v39, 0, v40, v41);
  }
  else
  {
    objc_msgSend_objectAtIndexedSubscript_(v20, v39, 5, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend_BOOLValue(v42, v43, v44, v45, v46) & 1) != 0)
    {
      objc_msgSend_setSessionHasOnlyPrimaryInput_(v27, v47, 0, v48, v49);
    }
    else
    {
      objc_msgSend_objectAtIndexedSubscript_(v20, v47, 8, v48, v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_BOOLValue(v50, v51, v52, v53, v54) & 1) != 0)
      {
        objc_msgSend_setSessionHasOnlyPrimaryInput_(v27, v55, 0, v56, v57);
      }
      else
      {
        objc_msgSend_objectAtIndexedSubscript_(v20, v55, 9, v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_BOOLValue(v58, v59, v60, v61, v62) & 1) != 0)
        {
          objc_msgSend_setSessionHasOnlyPrimaryInput_(v27, v63, 0, v65, v66);
        }
        else
        {
          objc_msgSend_sessionActionsString(v27, v63, v64, v65, v66);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToString = objc_msgSend_isEqualToString_(v67, v68, (uint64_t)CFSTR("U"), v69, v70);
          objc_msgSend_setSessionHasOnlyPrimaryInput_(v27, v72, isEqualToString ^ 1u, v73, v74);

        }
      }

    }
  }

  objc_msgSend_objectAtIndexedSubscript_(v20, v75, 3, v76, v77);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend_BOOLValue(v78, v79, v80, v81, v82);
  objc_msgSend_setSessionHasDictation_(v27, v84, v83, v85, v86);

  v87 = v94;
  v88 = v27;

  return v88;
}

- (id)generateSessionErrorStringFromSet:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend_count(v3, v4, v5, v6, v7))
  {
    v8 = objc_alloc(MEMORY[0x24BDD17C0]);
    v11 = (void *)objc_msgSend_initWithKey_ascending_(v8, v9, (uint64_t)CFSTR("self"), 1, v10);
    v24[0] = v11;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v12, (uint64_t)v24, 1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sortedArrayUsingDescriptors_(v3, v15, (uint64_t)v14, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_componentsJoinedByString_(v18, v19, (uint64_t)&stru_250F901F0, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)cleanIdForPublishing:(id)a3
{
  void *v3;
  __CFString *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;

  v3 = (void *)MEMORY[0x24BEB4CF0];
  v4 = (__CFString *)a3;
  if (objc_msgSend_isReportableClientId_(v3, v5, (uint64_t)v4, v6, v7))
    v8 = v4;
  else
    v8 = CFSTR("other");
  v9 = v8;

  return v9;
}

- (void)enumerateAnalytics
{
  ((void (*)(IASTextInputActionsAnalyzer *, char *, id))MEMORY[0x24BEDD108])(self, sel_enumerateTextInputActionsAnalytics_, self->_eventHandler);
}

- (void)enumerateTextInputActionsAnalytics:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableDictionary *entries;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;

  v4 = a3;
  sub_23F09723C();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      sub_23F0A0164();

    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x3032000000;
    v23[3] = sub_23F094AD4;
    v23[4] = sub_23F094AE4;
    objc_msgSend_cleanIdForPublishing_(self, v7, (uint64_t)self->_mostRecentProcessId, v8, v9);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = sub_23F094AD4;
    v21[4] = sub_23F094AE4;
    objc_msgSend_generateSessionErrorStringFromSet_(self, v10, (uint64_t)self->_sessionErrors, v11, v12);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    entries = self->_entries;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = sub_23F094AEC;
    v17[3] = &unk_250F8F980;
    v17[4] = self;
    v19 = v23;
    v20 = v21;
    v18 = v4;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(entries, v14, (uint64_t)v17, v15, v16);

    _Block_object_dispose(v21, 8);
    _Block_object_dispose(v23, 8);

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_23F0A0138();

  }
}

- (BOOL)shouldBeGarbageCollected
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend_date(MEMORY[0x24BDBCE60], a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dateWithTimeInterval_sinceDate_(v6, v8, (uint64_t)v7, v9, v10, -86400.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_dateOfLastAction(self, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend_compare_(v11, v17, (uint64_t)v16, v18, v19);

  if (v20 != -1)
  {
    objc_msgSend_addObject_(self->_sessionErrors, v21, 0x250F90890, v22, v23);
    objc_msgSend_enumerateAnalytics(self, v24, v25, v26, v27);
  }

  return v20 != -1;
}

- (_NSRange)depthRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->depthRange.length;
  location = self->depthRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (IASSessionManager)sessionManagerDelegate
{
  return (IASSessionManager *)objc_loadWeakRetained((id *)&self->sessionManagerDelegate);
}

- (void)setSessionManagerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->sessionManagerDelegate, a3);
}

- (NSUUID)analyzerSessionId
{
  return self->analyzerSessionId;
}

- (void)setAnalyzerSessionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDictionary)keyboardTrialParameters
{
  return self->_keyboardTrialParameters;
}

- (void)setKeyboardTrialParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSDate)dateOfLastAction
{
  return self->_dateOfLastAction;
}

- (void)setDateOfLastAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfLastAction, 0);
  objc_storeStrong((id *)&self->_keyboardTrialParameters, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->analyzerSessionId, 0);
  objc_destroyWeak((id *)&self->sessionManagerDelegate);
  objc_storeStrong((id *)&self->_mostRecentProcessId, 0);
  objc_storeStrong((id *)&self->_mostRecentAppBundleId, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_sessionErrors, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

@end
