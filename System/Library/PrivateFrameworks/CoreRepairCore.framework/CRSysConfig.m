@implementation CRSysConfig

+ (id)sharedAccess
{
  if (qword_254D7B098 != -1)
    dispatch_once(&qword_254D7B098, &unk_24D1AA0F0);
  return (id)qword_254D7B090;
}

- (CRSysConfig)init
{
  CRSysConfig *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRSysConfig;
  result = -[CRSysConfig init](&v3, sel_init);
  if (result)
  {
    result->_syscfgAccess = 0;
    result->_isADDASysCfgAccessType = 0;
  }
  return result;
}

- (BOOL)writeSystemConfig:(unsigned int)a3 inBuffer:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  const char *v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  BOOL v64;
  int v66;
  const char *v67;
  uint64_t v68;

  v4 = *(_QWORD *)&a3;
  v68 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  handleForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v66 = 136315138;
    v67 = "-[CRSysConfig writeSystemConfig:inBuffer:]";
    _os_log_impl(&dword_214503000, v7, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v66, 0xCu);
  }

  if (!(_DWORD)v4 || !v6)
  {
    handleForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_21456858C();
    goto LABEL_26;
  }
  if ((objc_msgSend_findSyscfgAccess(self, v8, v9, v10) & 1) == 0)
  {
    handleForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_214568560();
    goto LABEL_26;
  }
  if (!self->_isADDASysCfgAccessType)
  {
    objc_msgSend_dictionaryWithCapacity_(MEMORY[0x24BDBCED8], v11, 0, v13);
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x24BDD16E0], v50, v4, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v18, v53, (uint64_t)v52, (uint64_t)CFSTR("HorizonDataAccessKey"));

    objc_msgSend_setObject_forKey_(v18, v54, (uint64_t)v6, (uint64_t)CFSTR("HorizonDataAccessBuffer"));
    v55 = IORegistryEntrySetCFProperties(self->_syscfgAccess, v18);
    if ((_DWORD)v55)
    {
      v56 = v55;
      handleForCategory(0);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_2145684A4(v56, v19, v57, v58, v59, v60, v61, v62);
      goto LABEL_25;
    }
LABEL_29:
    v64 = 1;
    goto LABEL_27;
  }
  objc_msgSend_readSystemConfigArea(self, v11, v12, v13);
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    handleForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_214568508();
    goto LABEL_26;
  }
  v18 = v14;
  v19 = objc_retainAutorelease((id)objc_msgSend_mutableCopy(v14, v15, v16, v17));
  v23 = objc_msgSend_mutableBytes(v19, v20, v21, v22);
  v24 = objc_retainAutorelease(v6);
  v28 = objc_msgSend_bytes(v24, v25, v26, v27);
  v32 = objc_msgSend_length(v24, v29, v30, v31);
  if ((objc_msgSend_syscfgUpdate_key_buffer_length_(self, v33, v23, v4, v28, v32) & 1) == 0)
  {
    handleForCategory(0);
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      sub_214568534();

    goto LABEL_25;
  }
  objc_msgSend_dictionaryWithCapacity_(MEMORY[0x24BDBCED8], v34, 0, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(v36, v37, (uint64_t)CFSTR("AppleDiagnosticDataSysCfg"), (uint64_t)CFSTR("AppleDiagnosticDataSet"));
  objc_msgSend_setObject_forKey_(v36, v38, MEMORY[0x24BDBD1C8], (uint64_t)CFSTR("AppleDiagnosticDataCommit"));
  objc_msgSend_setObject_forKey_(v36, v39, (uint64_t)&unk_24D1B7BC0, (uint64_t)CFSTR("AppleDiagnosticDataOffset"));
  objc_msgSend_setObject_forKey_(v36, v40, (uint64_t)v19, (uint64_t)CFSTR("AppleDiagnosticDataBuffer"));
  v41 = IORegistryEntrySetCFProperties(self->_syscfgAccess, v36);
  if (!(_DWORD)v41)
  {

    goto LABEL_29;
  }
  v42 = v41;
  handleForCategory(0);
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    sub_2145684A4(v42, v43, v44, v45, v46, v47, v48, v49);

LABEL_25:
LABEL_26:
  v64 = 0;
LABEL_27:

  return v64;
}

- (id)readSystemConfigAll
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  _DWORD *v22;
  const char *v23;
  _DWORD *v24;
  uint64_t v25;
  id v26;
  unsigned int *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  int v35;
  const char *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  handleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v35 = 136315138;
    v36 = "-[CRSysConfig readSystemConfigAll]";
    _os_log_impl(&dword_214503000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v35, 0xCu);
  }

  objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_readSystemConfigArea(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v11;
  if (!v11)
  {
    handleForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_2145685B8();
    goto LABEL_15;
  }
  v16 = objc_msgSend_length(v11, v12, v13, v14);
  if (v16 <= 0x17)
  {
    handleForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_2145685E4(v16, v17);
LABEL_15:

    v26 = 0;
    goto LABEL_16;
  }
  v18 = objc_retainAutorelease(v15);
  v22 = (_DWORD *)objc_msgSend_bytes(v18, v19, v20, v21);
  if (*v22 != 1396926055)
  {
    handleForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_214568668();
    goto LABEL_15;
  }
  v24 = v22;
  v25 = v22[5];
  if (v16 < 20 * (unint64_t)v25 + 24)
  {
    handleForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v35 = 134218496;
      v36 = (const char *)v16;
      v37 = 2048;
      v38 = 20 * v25 + 24;
      v39 = 1024;
      v40 = v25;
      _os_log_error_impl(&dword_214503000, v17, OS_LOG_TYPE_ERROR, "readSystemConfigAll: syscfg length %lu is too small, should be at least %lu to contain %u entries", (uint8_t *)&v35, 0x1Cu);
    }
    goto LABEL_15;
  }
  if ((_DWORD)v25)
  {
    v28 = v22 + 9;
    do
    {
      v29 = *(v28 - 3);
      if ((_DWORD)v29 == 1129206850)
      {
        v29 = *(v28 - 2);
        objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v23, (uint64_t)v24 + *v28, *(v28 - 1));
      }
      else
      {
        objc_msgSend_dataWithBytes_length_(MEMORY[0x24BDBCE50], v23, (uint64_t)(v28 - 2), 16);
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v28 += 5;
      objc_msgSend_createStringForKey_(self, v31, v29, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKey_(v7, v34, (uint64_t)v30, (uint64_t)v33);

      --v25;
    }
    while (v25);
  }
  v26 = v7;
LABEL_16:

  return v26;
}

- (BOOL)findSyscfgAccess
{
  NSObject *v3;
  CRSysConfig *v4;
  BOOL v5;
  NSObject *v6;
  const __CFDictionary *v7;
  mach_port_t v8;
  io_service_t MatchingService;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  const __CFDictionary *v13;
  io_service_t v14;
  NSObject *v15;
  const __CFDictionary *v16;
  io_service_t v17;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  handleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315138;
    v20 = "-[CRSysConfig findSyscfgAccess]";
    _os_log_impl(&dword_214503000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v19, 0xCu);
  }

  v4 = self;
  objc_sync_enter(v4);
  if (!v4->_syscfgAccess)
  {
    handleForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_214503000, v6, OS_LOG_TYPE_DEFAULT, "Finding HorizonDataAccess ...", (uint8_t *)&v19, 2u);
    }

    v7 = IOServiceMatching("HorizonDataAccess");
    v8 = *MEMORY[0x24BDD8B18];
    MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B18], v7);
    v4->_syscfgAccess = MatchingService;
    if (MatchingService)
    {
      handleForCategory(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        v11 = "Found HorizonDataAccess";
LABEL_20:
        _os_log_impl(&dword_214503000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v19, 2u);
      }
    }
    else
    {
      handleForCategory(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_214503000, v12, OS_LOG_TYPE_DEFAULT, "Finding AppleDiagnosticDataAccess ...", (uint8_t *)&v19, 2u);
      }

      v13 = IOServiceMatching("AppleDiagnosticDataAccess");
      v14 = IOServiceGetMatchingService(v8, v13);
      v4->_syscfgAccess = v14;
      if (v14)
      {
        v4->_isADDASysCfgAccessType = 1;
        handleForCategory(0);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v19) = 0;
          v11 = "Found AppleDiagnosticDataAccess";
          goto LABEL_20;
        }
      }
      else
      {
        handleForCategory(0);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_214503000, v15, OS_LOG_TYPE_DEFAULT, "Finding AppleDiagnosticDataAccessReadOnly ...", (uint8_t *)&v19, 2u);
        }

        v16 = IOServiceMatching("AppleDiagnosticDataAccessReadOnly");
        v17 = IOServiceGetMatchingService(v8, v16);
        v4->_syscfgAccess = v17;
        if (!v17)
        {
          handleForCategory(0);
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            sub_214568694();
          v5 = 0;
          goto LABEL_22;
        }
        v4->_isADDASysCfgAccessType = 1;
        handleForCategory(0);
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v19) = 0;
          v11 = "Found AppleDiagnosticDataAccessReadOnly";
          goto LABEL_20;
        }
      }
    }
    v5 = 1;
LABEL_22:

    goto LABEL_23;
  }
  v5 = 1;
LABEL_23:
  objc_sync_exit(v4);

  return v5;
}

- (BOOL)dataIsValid:(_syscfgEntry *)a3 length:(unsigned int)a4
{
  NSObject *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[CRSysConfig dataIsValid:length:]";
    _os_log_impl(&dword_214503000, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  if (!a3 || !a4)
  {
    handleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_21456858C();
    goto LABEL_11;
  }
  if (a3->var0 == 1129206850)
  {
    if (a3->var1.var1.var1 != a4)
    {
      handleForCategory(0);
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
LABEL_11:

        return 0;
      }
LABEL_8:
      sub_2145686C0();
      goto LABEL_11;
    }
  }
  else if (a4 >= 0x11)
  {
    handleForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    goto LABEL_8;
  }
  return 1;
}

- (_syscfgEntry)findEntry:(char *)a3 key:(unsigned int)a4
{
  NSObject *v6;
  uint64_t v7;
  _syscfgEntry *result;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  handleForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315138;
    v11 = "-[CRSysConfig findEntry:key:]";
    _os_log_impl(&dword_214503000, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v10, 0xCu);
  }

  if (!a3 || !a4)
  {
    handleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_21456858C();
    goto LABEL_15;
  }
  v7 = *((unsigned int *)a3 + 5);
  if (!(_DWORD)v7)
  {
LABEL_11:
    handleForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_2145686EC();
LABEL_15:

    return 0;
  }
  result = (_syscfgEntry *)(a3 + 24);
  while (result->var0 != a4 && (result->var0 != 1129206850 || result->var1.var1.var0 != a4))
  {
    ++result;
    if (!--v7)
      goto LABEL_11;
  }
  return result;
}

- (BOOL)syscfgUpdate:(char *)a3 key:(unsigned int)a4 buffer:(const char *)a5 length:(unsigned int)a6
{
  uint64_t v6;
  NSObject *v11;
  const char *v12;
  uint64_t Entry_key;
  const char *v14;
  _DWORD *v15;
  uint64_t v16;
  NSObject *v17;
  int v19;
  const char *v20;
  uint64_t v21;

  v6 = *(_QWORD *)&a6;
  v21 = *MEMORY[0x24BDAC8D0];
  handleForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315138;
    v20 = "-[CRSysConfig syscfgUpdate:key:buffer:length:]";
    _os_log_impl(&dword_214503000, v11, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v19, 0xCu);
  }

  if (!(_DWORD)v6 || !a3 || !a4 || !a5)
  {
    handleForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_21456858C();
    goto LABEL_22;
  }
  if (a4 == 1400000109)
    Entry_key = objc_msgSend_findEntry_key_(self, v12, (uint64_t)a3, 1482183502);
  else
    Entry_key = objc_msgSend_findEntry_key_(self, v12, (uint64_t)a3, a4);
  if (!Entry_key)
  {
    handleForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_214568718();
    goto LABEL_22;
  }
  v15 = (_DWORD *)Entry_key;
  if ((objc_msgSend_dataIsValid_length_(self, v14, Entry_key, v6) & 1) == 0)
  {
    handleForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_214568744();
    goto LABEL_22;
  }
  if (*v15 == 1129206850)
  {
    v16 = v15[3];
    if ((v16 + v6) > *((_DWORD *)a3 + 2))
    {
      handleForCategory(0);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_2145686C0();
LABEL_22:

      return 0;
    }
    memcpy(&a3[v16], a5, v6);
  }
  else
  {
    memcpy(v15 + 1, a5, v6);
    if (a4 == 1400000109)
      *v15 = 1400000109;
  }
  return 1;
}

- (id)readSystemConfigArea
{
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  CFTypeRef CFProperty;
  void *v8;
  CFTypeID v9;
  NSObject *v10;
  NSObject *v11;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  handleForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315138;
    v14 = "-[CRSysConfig readSystemConfigArea]";
    _os_log_impl(&dword_214503000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v13, 0xCu);
  }

  if ((objc_msgSend_findSyscfgAccess(self, v4, v5, v6) & 1) == 0)
  {
    handleForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_2145687C8();
    goto LABEL_13;
  }
  CFProperty = IORegistryEntryCreateCFProperty(self->_syscfgAccess, CFSTR("AppleDiagnosticDataSysCfg"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (!CFProperty)
  {
    handleForCategory(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_214568770();
LABEL_13:

LABEL_14:
    v8 = 0;
    return v8;
  }
  v8 = (void *)CFProperty;
  v9 = CFGetTypeID(CFProperty);
  if (v9 != CFDataGetTypeID())
  {
    handleForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_21456879C();

    CFRelease(v8);
    goto LABEL_14;
  }
  return v8;
}

- (id)createStringForKey:(unsigned int)a3
{
  UInt8 bytes[4];

  *(_DWORD *)bytes = bswap32(a3);
  return (id)(id)CFStringCreateWithBytes(0, bytes, 4, 0x8000100u, 0);
}

- (unsigned)syscfgAccess
{
  return self->_syscfgAccess;
}

- (void)setSyscfgAccess:(unsigned int)a3
{
  self->_syscfgAccess = a3;
}

- (BOOL)isADDASysCfgAccessType
{
  return self->_isADDASysCfgAccessType;
}

- (void)setIsADDASysCfgAccessType:(BOOL)a3
{
  self->_isADDASysCfgAccessType = a3;
}

@end
