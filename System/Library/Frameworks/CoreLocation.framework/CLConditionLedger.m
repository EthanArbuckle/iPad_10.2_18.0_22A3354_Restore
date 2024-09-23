@implementation CLConditionLedger

- (CLConditionLedger)initWithStoreType:(int64_t)a3 domain:(int64_t)a4 monitorConfiguration:(id)a5
{
  const char *v9;
  uint64_t v10;
  CLConditionLedger *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v38;
  const char *v39;
  void *v40;
  const char *v41;
  objc_super v42;

  v42.receiver = self;
  v42.super_class = (Class)CLConditionLedger;
  v11 = -[CLConditionLedger init](&v42, sel_init);
  if (v11)
  {
    v12 = objc_msgSend_objectForKeyedSubscript_(a5, v9, (uint64_t)CFSTR("kCLMonitorLedgerPathKey"), v10);
    v15 = (void *)objc_msgSend_objectForKeyedSubscript_(a5, v13, (uint64_t)CFSTR("kCLMonitorLedgerNameKey"), v14);
    v18 = (void *)objc_msgSend_objectForKeyedSubscript_(a5, v16, (uint64_t)CFSTR("kCLMonitorLedgerAccessKey"), v17);
    v24 = objc_msgSend_objectForKeyedSubscript_(a5, v19, (uint64_t)CFSTR("kCLMonitorLedgerProcessNameKey"), v20);
    if (v15)
    {
      if (v18)
      {
LABEL_4:
        objc_msgSend_setLedgerForType_domain_monitor_client_path_(v11, v21, a3, a4, v15, v24, v12);
        v11->_recordTable = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v11->_encryptionKey = (NSData *)objc_msgSend_copy(v18, v25, v26, v27);
        v11->_ledgerName = (NSString *)objc_msgSend_copy(v15, v28, v29, v30);
        v11->_readSucceeded = objc_msgSend_readConditionsFromFile(v11, v31, v32, v33);
        objc_msgSend_performMigration(v11, v34, v35, v36);
        return v11;
      }
    }
    else
    {
      v38 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v21, v22, v23);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v38, v39, (uint64_t)a2, (uint64_t)v11, CFSTR("CLConditionLedger.mm"), 94, CFSTR("Monitor name is nil"));
      if (v18)
        goto LABEL_4;
    }
    v40 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v21, v22, v23);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v40, v41, (uint64_t)a2, (uint64_t)v11, CFSTR("CLConditionLedger.mm"), 95, CFSTR("Key is nil to read/store %@ monitor's contents"), v15);
    goto LABEL_4;
  }
  return v11;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  v5 = (void *)objc_msgSend_allMonitoringRecordsByIdentifier(self, a2, v2, v3);
  if (!objc_msgSend_count(v5, v6, v7, v8))
    objc_msgSend_deleteLedgerFile(self, v9, v10, v11);

  self->_ledgerFile = 0;
  self->_encryptionKey = 0;

  self->_recordTable = 0;
  self->_ledgerName = 0;
  v12.receiver = self;
  v12.super_class = (Class)CLConditionLedger;
  -[CLConditionLedger dealloc](&v12, sel_dealloc);
}

- (BOOL)persistentFileReadSucceeded
{
  return self->_readSucceeded;
}

- (BOOL)shouldMigrate
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = (void *)objc_msgSend_ledgerVersionNumber(self, a2, v2, v3);
  return (int)objc_msgSend_intValue(v4, v5, v6, v7) < 1;
}

- (void)performMigration
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  if (objc_msgSend_shouldMigrate(self, a2, v2, v3))
    MEMORY[0x1E0DE7D20](self, sel_setLedgerVersionNumber_, 1, v5);
}

- (void)setLedgerVersionNumber:(int)a3
{
  uint64_t v3;
  id v5;
  const char *v6;
  uint64_t v7;

  v3 = *(_QWORD *)&a3;
  v5 = objc_alloc(MEMORY[0x1E0CB37E8]);
  self->_ledgerVersionNumber = (NSNumber *)objc_msgSend_initWithInt_(v5, v6, v3, v7);
}

- (void)setLedgerForType:(int64_t)a3 domain:(int64_t)a4 monitor:(id)a5 client:(id)a6 path:(id)a7
{
  int v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *isDirectory_relativeToURL;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  void **p_cache;
  void **v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  void *v63;
  NSObject *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  const char *v75;
  NSObject *v76;
  NSObject *v77;
  NSObject *v78;
  void *v79;
  const char *v80;
  NSObject *v81;
  NSObject *v82;
  NSObject *v83;
  NSObject *v84;
  NSObject *v85;
  NSObject *v86;
  uint8_t buf[4];
  int v88;
  __int16 v89;
  const char *v90;
  __int16 v91;
  const char *v92;
  __int16 v93;
  const char *v94;
  __int16 v95;
  const char *v96;
  uint64_t v97;

  v97 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_ledgerFile(self, a2, a3, a4))
    return;
  v14 = _sandbox_in_a_container();
  v20 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v15, (uint64_t)CFSTR("%@.monitor"), v16, a5);
  if (a3 == 1 && a4 == 1)
  {
    if (!a7)
    {
      v79 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], v17, v18, v19);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v79, v80, (uint64_t)a2, (uint64_t)self, CFSTR("CLConditionLedger.mm"), 169, CFSTR("#monitor Invalid path for custom store for %@ monitor"), a5);
    }
    isDirectory_relativeToURL = (void *)objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(MEMORY[0x1E0C99E98], v17, (uint64_t)a7, 1, 0);
    v26 = (void *)objc_msgSend_stringWithString_(MEMORY[0x1E0CB37A0], v22, (uint64_t)&stru_1E2993188, v23);
    p_cache = (void **)(&OBJC_METACLASS___CLAssertion + 16);
    v28 = (void **)(&OBJC_METACLASS___CLAssertion + 16);
    goto LABEL_29;
  }
  v26 = (void *)objc_msgSend_stringWithString_(MEMORY[0x1E0CB37A0], v17, (uint64_t)CFSTR("CoreLocation/"), v19);
  if (a3)
  {
    p_cache = &OBJC_METACLASS___CLAssertion.cache;
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
    v32 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      v88 = 0;
      v89 = 2082;
      v90 = "";
      _os_log_impl(&dword_18F5B3000, v32, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Custom store type cannot use on NSSearchPathDirectory\"}", buf, 0x12u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
    }
    v33 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289026;
      v88 = 0;
      v89 = 2082;
      v90 = "";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Custom store type cannot use on NSSearchPathDirectory", "{\"msg%{public}.0s\":\"Custom store type cannot use on NSSearchPathDirectory\"}", buf, 0x12u);
    }
    v34 = 5;
  }
  else
  {
    if (v14)
      v34 = 9;
    else
      v34 = 5;
    p_cache = &OBJC_METACLASS___CLAssertion.cache;
  }
  if (a4)
    v35 = 8;
  else
    v35 = 1;
  v36 = (void *)objc_msgSend_defaultFileManager(self, v29, v30, v31);
  v38 = (void *)objc_msgSend_URLsForDirectory_inDomains_(v36, v37, v34, v35);
  isDirectory_relativeToURL = (void *)objc_msgSend_firstObject(v38, v39, v40, v41);
  v28 = &OBJC_METACLASS___CLAssertion.cache;
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
  v42 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v88 = 0;
    v89 = 2082;
    v90 = "";
    v91 = 2114;
    v92 = (const char *)a6;
    _os_log_impl(&dword_18F5B3000, v42, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor App is not sanboxed\", \"client\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  v45 = objc_msgSend_URLByAppendingPathComponent_(isDirectory_relativeToURL, v43, (uint64_t)v26, v44);
  if ((objc_msgSend_directoryExists_(self, v46, v45, v47) & 1) == 0)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
    v81 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289795;
      v88 = 0;
      v89 = 2082;
      v90 = "";
      v91 = 2114;
      v92 = (const char *)v45;
      v93 = 2082;
      v94 = "assert";
      v95 = 2081;
      v96 = "clDirExists";
      _os_log_impl(&dword_18F5B3000, v81, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor Unable to create intermediate dir\", \"path\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
    }
    v82 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289795;
      v88 = 0;
      v89 = 2082;
      v90 = "";
      v91 = 2114;
      v92 = (const char *)v45;
      v93 = 2082;
      v94 = "assert";
      v95 = 2081;
      v96 = "clDirExists";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v82, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor Unable to create intermediate dir", "{\"msg%{public}.0s\":\"#monitor Unable to create intermediate dir\", \"path\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
    }
    v83 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289795;
      v88 = 0;
      v89 = 2082;
      v90 = "";
      v91 = 2114;
      v92 = (const char *)v45;
      v93 = 2082;
      v94 = "assert";
      v95 = 2081;
      v96 = "clDirExists";
      _os_log_impl(&dword_18F5B3000, v83, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#monitor Unable to create intermediate dir\", \"path\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
    }
LABEL_74:
    abort_report_np();
  }
  if ((v14 & 1) != 0)
  {
LABEL_29:
    v48 = 0x1E0CB3000;
    goto LABEL_35;
  }
  v48 = 0x1E0CB3000uLL;
  v49 = objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v24, (uint64_t)CFSTR("%@/"), v25, a6);
  objc_msgSend_appendString_(v26, v50, v49, v51);
  v54 = objc_msgSend_URLByAppendingPathComponent_(isDirectory_relativeToURL, v52, (uint64_t)v26, v53);
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
  v55 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    v88 = 0;
    v89 = 2082;
    v90 = "";
    v91 = 2114;
    v92 = (const char *)v54;
    _os_log_impl(&dword_18F5B3000, v55, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor process is not containerized\", \"path\":%{public, location:escape_only}@}", buf, 0x1Cu);
  }
  if ((objc_msgSend_directoryExists_(self, v56, v54, v57) & 1) == 0)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
    v84 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289795;
      v88 = 0;
      v89 = 2082;
      v90 = "";
      v91 = 2114;
      v92 = (const char *)v54;
      v93 = 2082;
      v94 = "assert";
      v95 = 2081;
      v96 = "processDirExists";
      _os_log_impl(&dword_18F5B3000, v84, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor Unable to create dir\", \"path\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
    }
    v85 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289795;
      v88 = 0;
      v89 = 2082;
      v90 = "";
      v91 = 2114;
      v92 = (const char *)v54;
      v93 = 2082;
      v94 = "assert";
      v95 = 2081;
      v96 = "processDirExists";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v85, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor Unable to create dir", "{\"msg%{public}.0s\":\"#monitor Unable to create dir\", \"path\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
    }
    v86 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289795;
      v88 = 0;
      v89 = 2082;
      v90 = "";
      v91 = 2114;
      v92 = (const char *)v54;
      v93 = 2082;
      v94 = "assert";
      v95 = 2081;
      v96 = "processDirExists";
      _os_log_impl(&dword_18F5B3000, v86, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#monitor Unable to create dir\", \"path\":%{public, location:escape_only}@, \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x30u);
    }
    goto LABEL_74;
  }
LABEL_35:
  if (!isDirectory_relativeToURL)
  {
    if (v28[235] != (void *)-1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
    v76 = p_cache[234];
    if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289539;
      v88 = 0;
      v89 = 2082;
      v90 = "";
      v91 = 2082;
      v92 = "assert";
      v93 = 2081;
      v94 = "basePath";
      _os_log_impl(&dword_18F5B3000, v76, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor Unable to determine the path to store conditions\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (v28[235] != (void *)-1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
    }
    v77 = p_cache[234];
    if (os_signpost_enabled(v77))
    {
      *(_DWORD *)buf = 68289539;
      v88 = 0;
      v89 = 2082;
      v90 = "";
      v91 = 2082;
      v92 = "assert";
      v93 = 2081;
      v94 = "basePath";
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v77, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor Unable to determine the path to store conditions", "{\"msg%{public}.0s\":\"#monitor Unable to determine the path to store conditions\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
      if (v28[235] != (void *)-1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
    }
    v78 = p_cache[234];
    if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289539;
      v88 = 0;
      v89 = 2082;
      v90 = "";
      v91 = 2082;
      v92 = "assert";
      v93 = 2081;
      v94 = "basePath";
      _os_log_impl(&dword_18F5B3000, v78, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#monitor Unable to determine the path to store conditions\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
    }
    goto LABEL_74;
  }
  v58 = objc_msgSend_stringWithFormat_(*(void **)(v48 + 2368), v24, (uint64_t)CFSTR("%@"), v25, v20);
  objc_msgSend_appendString_(v26, v59, v58, v60);
  v63 = (void *)objc_msgSend_URLByAppendingPathComponent_(isDirectory_relativeToURL, v61, (uint64_t)v26, v62);
  if (v28[235] != (void *)-1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
  v64 = p_cache[234];
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
  {
    v68 = (void *)objc_msgSend_path(v63, v65, v66, v67);
    v72 = objc_msgSend_UTF8String(v68, v69, v70, v71);
    *(_DWORD *)buf = 68289282;
    v88 = 0;
    v89 = 2082;
    v90 = "";
    v91 = 2082;
    v92 = (const char *)v72;
    _os_log_impl(&dword_18F5B3000, v64, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#monitor Conditions store\", \"path\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v73 = (void *)MEMORY[0x1E0C99E98];
  v74 = objc_msgSend_path(v63, v65, v66, v67);
  self->_ledgerFile = (NSURL *)(id)objc_msgSend_fileURLWithPath_isDirectory_(v73, v75, v74, 0);
}

- (BOOL)directoryExists:(id)a3
{
  uint64_t v3;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL result;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v6 = (void *)objc_msgSend_defaultFileManager(self, a2, (uint64_t)a3, v3);
  if (qword_1ECD8F898 != -1)
    dispatch_once(&qword_1ECD8F898, &unk_1E29921B0);
  if ((objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v6, v5, (uint64_t)a3, 0, qword_1ECD8F890, &v13) & 1) != 0|| objc_msgSend_code(v13, v7, v8, v9) == 516)
  {
    return 1;
  }
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
  v11 = qword_1ECD8E750;
  v12 = os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v12)
  {
    *(_DWORD *)buf = 68289538;
    v15 = 0;
    v16 = 2082;
    v17 = "";
    v18 = 2114;
    v19 = v13;
    v20 = 2114;
    v21 = a3;
    _os_log_impl(&dword_18F5B3000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor #warning unable to check for directory\", \"error\":%{public, location:escape_only}@, \"pathURL\":%{public, location:escape_only}@}", buf, 0x26u);
    return 0;
  }
  return result;
}

- (NSFileManager)defaultFileManager
{
  uint64_t v2;
  uint64_t v3;

  return (NSFileManager *)objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], a2, v2, v3);
}

- (BOOL)readConditionsFromFile
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  int v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  _BOOL4 v37;
  _BOOL4 v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  const char *v42;
  const char *v43;
  NSObject *v44;
  uint32_t v45;
  NSObject *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unsigned __int8 v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  NSObject *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  NSObject *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  NSObject *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  void *v131;
  uint8_t buf[4];
  int v133;
  __int16 v134;
  const char *v135;
  __int16 v136;
  _BYTE v137[18];
  uint64_t v138;

  v138 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend_ledgerFile(self, a2, v2, v3);
  if (!v5)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
    v40 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289026;
      v133 = 0;
      v134 = 2082;
      v135 = "";
      _os_log_impl(&dword_18F5B3000, v40, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor path is nil for ledger file\"}", buf, 0x12u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
    }
    v41 = qword_1ECD8E750;
    v38 = os_signpost_enabled((os_log_t)qword_1ECD8E750);
    if (!v38)
      return v38;
    *(_DWORD *)buf = 68289026;
    v133 = 0;
    v134 = 2082;
    v135 = "";
    v42 = "#monitor path is nil for ledger file";
    v43 = "{\"msg%{public}.0s\":\"#monitor path is nil for ledger file\"}";
    v44 = v41;
    v45 = 18;
LABEL_45:
    _os_signpost_emit_with_name_impl(&dword_18F5B3000, v44, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v42, v43, buf, v45);
    goto LABEL_46;
  }
  v7 = (void *)v5;
  v131 = 0;
  v11 = (void *)objc_msgSend_dataWithContentsOfURL_options_error_(MEMORY[0x1E0C99D50], v6, v5, 1, &v131);
  if (v131 && objc_msgSend_code(v131, v8, v9, v10) != 260)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
    v46 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      v50 = (void *)objc_msgSend_path(v7, v47, v48, v49);
      v54 = objc_msgSend_UTF8String(v50, v51, v52, v53);
      *(_DWORD *)buf = 68289538;
      v133 = 0;
      v134 = 2082;
      v135 = "";
      v136 = 2082;
      *(_QWORD *)v137 = v54;
      *(_WORD *)&v137[8] = 2114;
      *(_QWORD *)&v137[10] = v131;
      _os_log_impl(&dword_18F5B3000, v46, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor #Warning Unable to read the contents of file\", \"file\":%{public, location:escape_only}s, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
    }
    v55 = qword_1ECD8E750;
    v38 = os_signpost_enabled((os_log_t)qword_1ECD8E750);
    if (!v38)
      return v38;
    v59 = (void *)objc_msgSend_path(v7, v56, v57, v58);
    v63 = objc_msgSend_UTF8String(v59, v60, v61, v62);
    *(_DWORD *)buf = 68289538;
    v133 = 0;
    v134 = 2082;
    v135 = "";
    v136 = 2082;
    *(_QWORD *)v137 = v63;
    *(_WORD *)&v137[8] = 2114;
    *(_QWORD *)&v137[10] = v131;
    v42 = "#monitor #Warning Unable to read the contents of file";
    v43 = "{\"msg%{public}.0s\":\"#monitor #Warning Unable to read the contents of file\", \"file\":%{public, location:es"
          "cape_only}s, \"error\":%{public, location:escape_only}@}";
LABEL_44:
    v44 = v55;
    v45 = 38;
    goto LABEL_45;
  }
  if (!v11)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
    v64 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
    {
      v68 = (void *)objc_msgSend_path(v7, v65, v66, v67);
      v72 = objc_msgSend_UTF8String(v68, v69, v70, v71);
      *(_DWORD *)buf = 68289282;
      v133 = 0;
      v134 = 2082;
      v135 = "";
      v136 = 2082;
      *(_QWORD *)v137 = v72;
      _os_log_impl(&dword_18F5B3000, v64, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor no conditions were saved\", \"file\":%{public, location:escape_only}s}", buf, 0x1Cu);
    }
    goto LABEL_53;
  }
  v12 = objc_msgSend_length(v11, v8, v9, v10);
  v13 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v14 = v12 - 32;
  v17 = (id)objc_msgSend_initWithLength_(v13, v15, v12 - 32, v16);
  v21 = objc_msgSend_bytes(v11, v18, v19, v20);
  objc_msgSend_bytes(self->_encryptionKey, v22, v23, v24);
  objc_msgSend_length(self->_encryptionKey, v25, v26, v27);
  v126 = v21 + 16 + v14;
  v127 = 16;
  v124 = v14;
  v125 = objc_msgSend_mutableBytes(v17, v28, v29, v30);
  v32 = CCCryptorGCMOneshotDecrypt();
  if (!v32)
  {
    v73 = atomic_load((unsigned __int8 *)&qword_1ECD8F888);
    if ((v73 & 1) == 0 && __cxa_guard_acquire(&qword_1ECD8F888))
    {
      v130 = (void *)MEMORY[0x1E0C99E60];
      v129 = objc_opt_class();
      v128 = objc_opt_class();
      v113 = objc_opt_class();
      v114 = objc_opt_class();
      v115 = objc_opt_class();
      v116 = objc_opt_class();
      v117 = objc_opt_class();
      v118 = objc_opt_class();
      v119 = objc_opt_class();
      v120 = objc_opt_class();
      qword_1ECD8F880 = (uint64_t)(id)objc_msgSend_setWithObjects_(v130, v121, v129, v122, v128, v113, v114, v115, v116, v117, v118, v119, v120, 0);
      __cxa_guard_release(&qword_1ECD8F888);
    }
    v74 = objc_msgSend_unarchivedObjectOfClasses_fromData_error_(MEMORY[0x1E0CB3710], v31, qword_1ECD8F880, (uint64_t)v17, &v131, v124, v125, v126, v127);
    if (!v131)
    {
      v78 = (void *)v74;
      if (v74)
      {
        v79 = (void *)objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v75, v76, v77);
        objc_msgSend_addEntriesFromDictionary_(v79, v80, (uint64_t)v78, v81);
        if (objc_msgSend_objectForKeyedSubscript_(v78, v82, (uint64_t)CFSTR("kCLLedgerVersionNumber"), v83))
        {
          self->_ledgerVersionNumber = (NSNumber *)objc_msgSend_objectForKeyedSubscript_(v78, v84, (uint64_t)CFSTR("kCLLedgerVersionNumber"), v85);
          if (qword_1ECD8E748 != -1)
            dispatch_once(&qword_1ECD8E748, &unk_1E29921D0);
          v86 = qword_1ECD8E740;
          if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEFAULT))
          {
            v90 = objc_msgSend_ledgerVersionNumber(self, v87, v88, v89);
            *(_DWORD *)buf = 68289282;
            v133 = 0;
            v134 = 2082;
            v135 = "";
            v136 = 2114;
            *(_QWORD *)v137 = v90;
            _os_log_impl(&dword_18F5B3000, v86, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor Found ledger version number\", \"ledgerVersion\":%{public, location:escape_only}@}", buf, 0x1Cu);
          }
          objc_msgSend_removeObjectForKey_(v79, v87, (uint64_t)CFSTR("kCLLedgerVersionNumber"), v89);
        }
        else
        {
          self->_ledgerVersionNumber = (NSNumber *)&unk_1E29B5C08;
        }
        if (qword_1ECD8E758 != -1)
          dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
        v108 = qword_1ECD8E750;
        if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
        {
          v112 = objc_msgSend_count(v79, v109, v110, v111);
          *(_DWORD *)buf = 68289282;
          v133 = 0;
          v134 = 2082;
          v135 = "";
          v136 = 2050;
          *(_QWORD *)v137 = v112;
          _os_log_impl(&dword_18F5B3000, v108, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor file has conditions saved\", \"count\":%{public}ld}", buf, 0x1Cu);
        }
        objc_msgSend_addEntriesFromDictionary_(self->_recordTable, v109, (uint64_t)v79, v111);
LABEL_53:
        LOBYTE(v38) = 1;
        return v38;
      }
    }
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
    v91 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      v95 = (void *)objc_msgSend_path(v7, v92, v93, v94);
      v99 = objc_msgSend_UTF8String(v95, v96, v97, v98);
      *(_DWORD *)buf = 68289539;
      v133 = 0;
      v134 = 2082;
      v135 = "";
      v136 = 2081;
      *(_QWORD *)v137 = v99;
      *(_WORD *)&v137[8] = 2114;
      *(_QWORD *)&v137[10] = v131;
      _os_log_impl(&dword_18F5B3000, v91, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor #Warning unable to read conditions from file\", \"file\":%{private, location:escape_only}s, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
    }
    v55 = qword_1ECD8E750;
    v38 = os_signpost_enabled((os_log_t)qword_1ECD8E750);
    if (!v38)
      return v38;
    v103 = (void *)objc_msgSend_path(v7, v100, v101, v102);
    v107 = objc_msgSend_UTF8String(v103, v104, v105, v106);
    *(_DWORD *)buf = 68289539;
    v133 = 0;
    v134 = 2082;
    v135 = "";
    v136 = 2081;
    *(_QWORD *)v137 = v107;
    *(_WORD *)&v137[8] = 2114;
    *(_QWORD *)&v137[10] = v131;
    v42 = "#monitor #Warning unable to read conditions from file";
    v43 = "{\"msg%{public}.0s\":\"#monitor #Warning unable to read conditions from file\", \"file\":%{private, location:e"
          "scape_only}s, \"error\":%{public, location:escape_only}@}";
    goto LABEL_44;
  }
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
  v33 = qword_1ECD8E750;
  v37 = os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT);
  LOBYTE(v38) = 0;
  if (v37)
  {
    v39 = objc_msgSend_ledgerFile(self, v34, v35, v36, v124, v125, v126, 16);
    *(_DWORD *)buf = 68289538;
    v133 = 0;
    v134 = 2082;
    v135 = "";
    v136 = 1026;
    *(_DWORD *)v137 = v32;
    *(_WORD *)&v137[4] = 2114;
    *(_QWORD *)&v137[6] = v39;
    _os_log_impl(&dword_18F5B3000, v33, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor #Warning unable to decrypt the conditions\", \"error\":%{public}d, \"ledger\":%{public, location:escape_only}@}", buf, 0x22u);
LABEL_46:
    LOBYTE(v38) = 0;
  }
  return v38;
}

- (BOOL)writeToFile
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  const char *v39;
  uint64_t v40;
  id v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  NSObject *v55;
  NSObject *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  NSObject *v71;
  uint64_t v72;
  const char *v73;
  const char *v74;
  NSObject *v75;
  uint32_t v76;
  NSObject *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  _BOOL4 v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  char v97;
  NSObject *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v117;
  uint64_t v118;
  uint8_t buf[4];
  int v120;
  __int16 v121;
  const char *v122;
  __int16 v123;
  uint64_t v124;
  __int16 v125;
  uint64_t v126;
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend_ledgerFile(self, a2, v2, v3);
  if (!v5)
    return v5;
  v9 = (void *)objc_msgSend_allMonitoringRecordsByIdentifier(self, v6, v7, v8);
  if (!objc_msgSend_count(v9, v10, v11, v12))
  {
    if (qword_1ECD8E748 != -1)
      dispatch_once(&qword_1ECD8E748, &unk_1E29921D0);
    v77 = qword_1ECD8E740;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E740, OS_LOG_TYPE_DEBUG))
    {
      v81 = (void *)objc_msgSend_ledgerFile(self, v78, v79, v80);
      *(_DWORD *)buf = 68289282;
      v120 = 0;
      v121 = 2082;
      v122 = "";
      v123 = 2114;
      v124 = objc_msgSend_path(v81, v82, v83, v84);
      _os_log_impl(&dword_18F5B3000, v77, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#monitor nothing to write; Removing existing file\", \"file\":%{public, location:escape_only}@}",
        buf,
        0x1Cu);
    }
    objc_msgSend_deleteLedgerFile(self, v78, v79, v80);
    goto LABEL_26;
  }
  v16 = (void *)objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v13, v14, v15);
  v20 = objc_msgSend_allMonitoringRecordsByIdentifier(self, v17, v18, v19);
  objc_msgSend_addEntriesFromDictionary_(v16, v21, v20, v22);
  v26 = objc_msgSend_ledgerVersionNumber(self, v23, v24, v25);
  objc_msgSend_setObject_forKey_(v16, v27, v26, (uint64_t)CFSTR("kCLLedgerVersionNumber"));
  v30 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x1E0C99D80], v28, (uint64_t)v16, v29);
  v118 = 0;
  v32 = (void *)objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v31, v30, 1, &v118);
  if (v118 || (v36 = v32) == 0)
  {
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
    v85 = qword_1ECD8E750;
    v89 = os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT);
    LOBYTE(v5) = 0;
    if (v89)
    {
      v90 = (void *)objc_msgSend_ledgerFile(self, v86, v87, v88);
      v94 = objc_msgSend_path(v90, v91, v92, v93);
      *(_DWORD *)buf = 68289538;
      v120 = 0;
      v121 = 2082;
      v122 = "";
      v123 = 2114;
      v124 = v94;
      v125 = 2114;
      v126 = v118;
      _os_log_impl(&dword_18F5B3000, v85, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor Unable to store conditions\", \"file\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
LABEL_41:
      LOBYTE(v5) = 0;
      return v5;
    }
    return v5;
  }
  v37 = objc_msgSend_length(v32, v33, v34, v35) + 32;
  v38 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v41 = (id)objc_msgSend_initWithLength_(v38, v39, v37, v40);
  v45 = (char *)objc_msgSend_mutableBytes(v41, v42, v43, v44);
  v49 = (uint64_t)&v45[objc_msgSend_length(v36, v46, v47, v48) + 16];
  v50 = SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], 0x10uLL, v45);
  if (v50)
  {
    v54 = v50;
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
    v55 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289282;
      v120 = 0;
      v121 = 2082;
      v122 = "";
      v123 = 1026;
      LODWORD(v124) = v54;
      _os_log_impl(&dword_18F5B3000, v55, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor unable to init random vector\", \"error\":%{public}d}", buf, 0x18u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
    }
    v56 = qword_1ECD8E750;
    if (os_signpost_enabled((os_log_t)qword_1ECD8E750))
    {
      *(_DWORD *)buf = 68289282;
      v120 = 0;
      v121 = 2082;
      v122 = "";
      v123 = 1026;
      LODWORD(v124) = v54;
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v56, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#monitor unable to init random vector", "{\"msg%{public}.0s\":\"#monitor unable to init random vector\", \"error\":%{public}d}", buf, 0x18u);
    }
  }
  objc_msgSend_bytes(self->_encryptionKey, v51, v52, v53);
  objc_msgSend_length(self->_encryptionKey, v57, v58, v59);
  objc_msgSend_bytes(v36, v60, v61, v62);
  v117 = objc_msgSend_length(v36, v63, v64, v65);
  v66 = CCCryptorGCMOneshotEncrypt();
  if (v66)
  {
    v70 = v66;
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
    v71 = qword_1ECD8E750;
    if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 68289282;
      v120 = 0;
      v121 = 2082;
      v122 = "";
      v123 = 1026;
      LODWORD(v124) = v70;
      _os_log_impl(&dword_18F5B3000, v71, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#monitor unable to encrypt the conditions\", \"error\":%{public}d}", buf, 0x18u);
      if (qword_1ECD8E758 != -1)
        dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
    }
    v72 = qword_1ECD8E750;
    LODWORD(v5) = os_signpost_enabled((os_log_t)qword_1ECD8E750);
    if ((_DWORD)v5)
    {
      *(_DWORD *)buf = 68289282;
      v120 = 0;
      v121 = 2082;
      v122 = "";
      v123 = 1026;
      LODWORD(v124) = v70;
      v73 = "#monitor unable to encrypt the conditions";
      v74 = "{\"msg%{public}.0s\":\"#monitor unable to encrypt the conditions\", \"error\":%{public}d}";
      v75 = v72;
      v76 = 24;
LABEL_40:
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v75, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v73, v74, buf, v76);
      goto LABEL_41;
    }
    return v5;
  }
  v95 = objc_msgSend_ledgerFile(self, v67, v68, v69, v117, v45 + 16, v49, 16);
  v97 = objc_msgSend_writeToURL_options_error_(v41, v96, v95, 1073741825, &v118);
  if (!v118 && (v97 & 1) != 0)
  {
LABEL_26:
    LOBYTE(v5) = 1;
    return v5;
  }
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
  v98 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_ERROR))
  {
    v102 = (void *)objc_msgSend_ledgerFile(self, v99, v100, v101);
    v106 = objc_msgSend_path(v102, v103, v104, v105);
    *(_DWORD *)buf = 68289538;
    v120 = 0;
    v121 = 2082;
    v122 = "";
    v123 = 2114;
    v124 = v106;
    v125 = 2114;
    v126 = v118;
    _os_log_impl(&dword_18F5B3000, v98, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#monitor #Warning unable to write to file\", \"file\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
    if (qword_1ECD8E758 != -1)
      dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
  }
  v107 = qword_1ECD8E750;
  LODWORD(v5) = os_signpost_enabled((os_log_t)qword_1ECD8E750);
  if ((_DWORD)v5)
  {
    v111 = (void *)objc_msgSend_ledgerFile(self, v108, v109, v110);
    v115 = objc_msgSend_path(v111, v112, v113, v114);
    *(_DWORD *)buf = 68289538;
    v120 = 0;
    v121 = 2082;
    v122 = "";
    v123 = 2114;
    v124 = v115;
    v125 = 2114;
    v126 = v118;
    v73 = "#monitor #Warning unable to write to file";
    v74 = "{\"msg%{public}.0s\":\"#monitor #Warning unable to write to file\", \"file\":%{public, location:escape_only}@,"
          " \"error\":%{public, location:escape_only}@}";
    v75 = v107;
    v76 = 38;
    goto LABEL_40;
  }
  return v5;
}

- (void)deleteLedgerFile
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v5 = (void *)objc_msgSend_defaultFileManager(self, a2, v2, v3);
  v9 = objc_msgSend_ledgerFile(self, v6, v7, v8);
  objc_msgSend_removeItemAtURL_error_(v5, v10, v9, (uint64_t)&v16);
  if (qword_1ECD8E758 != -1)
    dispatch_once(&qword_1ECD8E758, &unk_1E2990830);
  v11 = qword_1ECD8E750;
  if (os_log_type_enabled((os_log_t)qword_1ECD8E750, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend_ledgerFile(self, v12, v13, v14);
    *(_DWORD *)buf = 68289538;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    v21 = 2114;
    v22 = v15;
    v23 = 2114;
    v24 = v16;
    _os_log_impl(&dword_18F5B3000, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor deleting\", \"file\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", buf, 0x26u);
  }
}

- (BOOL)addRecordForMonitoring:(id)a3 identifier:(id)a4 persist:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v7;
  uint64_t v8;

  v5 = a5;
  objc_msgSend_setObject_forKeyedSubscript_(self->_recordTable, a2, (uint64_t)a3, (uint64_t)a4);
  if (v5)
    return MEMORY[0x1E0DE7D20](self, sel_writeToFile, v7, v8);
  else
    return 1;
}

- (void)updateRecord:(id)a3 identifier:(id)a4
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_recordTable, a2, (uint64_t)a3, (uint64_t)a4);
}

- (BOOL)removeRecordFromMonitoringWithIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend_removeObjectForKey_(self->_recordTable, a2, (uint64_t)a3, v3);
  return MEMORY[0x1E0DE7D20](self, sel_writeToFile, v5, v6);
}

- (void)updateEvent:(id)a3 forIdentifier:(id)a4
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = (void *)objc_msgSend_objectForKeyedSubscript_(self->_recordTable, a2, (uint64_t)a4, (uint64_t)a4);
  objc_msgSend_updateEvent_(v6, v7, (uint64_t)a3, v8);
  MEMORY[0x1E0DE7D20](self, sel_writeToFile, v9, v10);
}

- (id)monitoringRecordForIdentifier:(id)a3
{
  uint64_t v3;

  return (id)objc_msgSend_objectForKeyedSubscript_(self->_recordTable, a2, (uint64_t)a3, v3);
}

- (NSDictionary)allMonitoringRecordsByIdentifier
{
  return &self->_recordTable->super;
}

- (NSArray)allMonitoringIdentifiers
{
  uint64_t v2;
  uint64_t v3;

  return (NSArray *)objc_msgSend_allKeys(self->_recordTable, a2, v2, v3);
}

- (NSString)ledgerName
{
  return self->_ledgerName;
}

- (NSNumber)ledgerVersionNumber
{
  return self->_ledgerVersionNumber;
}

- (NSURL)ledgerFile
{
  return self->_ledgerFile;
}

@end
