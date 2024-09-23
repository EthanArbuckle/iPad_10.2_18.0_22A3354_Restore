@implementation DataDetectorsSourceAccess

- (void)fileForSourceRead:(id)a3 resourceType:(unint64_t)a4 withReply:(id)a5
{
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = (void (**)(id, void *))a5;
  v9 = (void *)MEMORY[0x1A1ACABBC]();
  -[DataDetectorsSourceAccess fileHandleForSourceRead:resourceType:](self, "fileHandleForSourceRead:resourceType:", objc_msgSend(v11, "intValue"), a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v10);

  objc_autoreleasePoolPop(v9);
}

- (void)filesForSourceRead:(id)a3 resourceType:(unint64_t)a4 withReply:(id)a5
{
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *context;
  void (**v18)(id, void *);
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v18 = (void (**)(id, void *))a5;
  context = (void *)MEMORY[0x1A1ACABBC]();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        -[DataDetectorsSourceAccess fileHandleForSourceRead:resourceType:](self, "fileHandleForSourceRead:resourceType:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "intValue"), a4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(v9, "addObject:", v15);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v16);

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  v18[2](v18, v9);
  objc_autoreleasePoolPop(context);

}

- (void)writeSourceFromRawData:(id)a3 source:(id)a4 signature:(id)a5 withReply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  DataDetectorsSourceAccess *v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  _dd_dispatch_get_queue_for_writing();
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__DataDetectorsSourceAccess_writeSourceFromRawData_source_signature_withReply___block_invoke;
  block[3] = &unk_1E3C95A30;
  v20 = v11;
  v21 = self;
  v22 = v10;
  v23 = v12;
  v24 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v10;
  v18 = v11;
  dispatch_sync(v14, block);

}

- (void)writeSourceFromJSONFile:(id)a3 source:(id)a4 withReply:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  DataDetectorsSourceAccess *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  _dd_dispatch_get_queue_for_writing();
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__DataDetectorsSourceAccess_writeSourceFromJSONFile_source_withReply___block_invoke;
  v15[3] = &unk_1E3C95A58;
  v16 = v9;
  v17 = self;
  v18 = v8;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (BOOL)privacyUserReadEntitled
{
  _QWORD block[5];

  if (_dd_dispatch_get_queue_for_read_entitlements_onceToken != -1)
    dispatch_once(&_dd_dispatch_get_queue_for_read_entitlements_onceToken, &__block_literal_global_79);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__DataDetectorsSourceAccess_privacyUserReadEntitled__block_invoke;
  block[3] = &unk_1E3C95AC0;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)_dd_dispatch_get_queue_for_read_entitlements_sQueue, block);
  return self->_privacyUserReadEntitled;
}

- (BOOL)privacyUserWriteEntitled
{
  __SecTask *v3;
  __SecTask *v4;
  CFTypeRef v5;
  const void *v6;
  CFTypeID TypeID;
  NSObject *v8;
  int clientpid;
  audit_token_t v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_privacyUserWriteEntitlementChecked)
  {
    -[DataDetectorsSourceAccess auditToken](self, "auditToken");
    v3 = SecTaskCreateWithAuditToken(0, &v11);
    if (v3)
    {
      v4 = v3;
      v5 = SecTaskCopyValueForEntitlement(v3, CFSTR("com.apple.datadetectors.source-write.user"), 0);
      if (v5)
      {
        v6 = v5;
        TypeID = CFBooleanGetTypeID();
        if (TypeID == CFGetTypeID(v6) && CFEqual(v6, (CFTypeRef)*MEMORY[0x1E0C9AE50]))
          self->_privacyUserWriteEntitled = 1;
        CFRelease(v6);
      }
      CFRelease(v4);
    }
    if (!self->_privacyUserWriteEntitled)
    {
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v8 = (id)DDLogHandle_error_log_handle;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        clientpid = self->_clientpid;
        *(_DWORD *)buf = 67109378;
        v13 = clientpid;
        v14 = 2112;
        v15 = CFSTR("com.apple.datadetectors.source-write.user");
        _os_log_error_impl(&dword_19BC07000, v8, OS_LOG_TYPE_ERROR, "Client pid %d is missing the %@ entitlement", buf, 0x12u);
      }

    }
    self->_privacyUserWriteEntitlementChecked = 1;
  }
  return self->_privacyUserWriteEntitled;
}

- (BOOL)privacySystemWriteEntitled
{
  __SecTask *v3;
  __SecTask *v4;
  CFTypeRef v5;
  const void *v6;
  CFTypeID TypeID;
  NSObject *v8;
  int clientpid;
  audit_token_t v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!self->_privacySystemWriteEntitlementChecked)
  {
    -[DataDetectorsSourceAccess auditToken](self, "auditToken");
    v3 = SecTaskCreateWithAuditToken(0, &v11);
    if (v3)
    {
      v4 = v3;
      v5 = SecTaskCopyValueForEntitlement(v3, CFSTR("com.apple.datadetectors.source-write.system"), 0);
      if (v5)
      {
        v6 = v5;
        TypeID = CFBooleanGetTypeID();
        if (TypeID == CFGetTypeID(v6) && CFEqual(v6, (CFTypeRef)*MEMORY[0x1E0C9AE50]))
          self->_privacySystemWriteEntitled = 1;
        CFRelease(v6);
      }
      CFRelease(v4);
    }
    if (!self->_privacySystemWriteEntitled)
    {
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v8 = (id)DDLogHandle_error_log_handle;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        clientpid = self->_clientpid;
        *(_DWORD *)buf = 67109378;
        v13 = clientpid;
        v14 = 2112;
        v15 = CFSTR("com.apple.datadetectors.source-write.system");
        _os_log_error_impl(&dword_19BC07000, v8, OS_LOG_TYPE_ERROR, "Client pid %d is missing the %@ entitlement", buf, 0x12u);
      }

    }
    self->_privacySystemWriteEntitlementChecked = 1;
  }
  return self->_privacySystemWriteEntitled;
}

- (id)fileHandleForSourceRead:(int)a3 resourceType:(unint64_t)a4
{
  BOOL v7;
  uint64_t v8;
  char v10[256];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (altPath)
    v7 = 0;
  else
    v7 = (a3 & 0xFFFFFFFD) == 4;
  if ((!v7 || -[DataDetectorsSourceAccess privacyUserReadEntitled](self, "privacyUserReadEntitled"))
    && _DDTriePathForSource(a3, v10, a4 == 1, 1, self->_clientuid)
    && (v8 = open(v10, 0), (int)v8 >= 3))
  {
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v8, 1);
  }
  else
  {
    return 0;
  }
}

- (BOOL)clientCanWriteSource:(int)a3
{
  if (altPath)
    return 1;
  if ((a3 & 0xFFFFFFFD) == 4)
    return -[DataDetectorsSourceAccess privacyUserWriteEntitled](self, "privacyUserWriteEntitled");
  return -[DataDetectorsSourceAccess privacySystemWriteEntitled](self, "privacySystemWriteEntitled");
}

- (BOOL)pushSourcesContent:(id)a3 forSource:(int)a4 signature:(id)a5
{
  id v8;
  __CFString *v9;
  unint64_t v10;
  _BOOL4 v11;
  const void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char isKindOfClass;
  double v24;
  const __CFString *v25;
  int v26;
  const UInt8 *FinalizedSourceContent;
  int v28;
  size_t Length;
  int v30;
  int v31;
  const UInt8 *BytePtr;
  const __CFAllocator *v33;
  CFArrayRef v34;
  CFArrayRef v35;
  void *v36;
  CFDictionaryRef v37;
  CFDictionaryRef v38;
  uint64_t StreamCompressorQueueWithOptions;
  ssize_t v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  int *v46;
  char *v47;
  std::error_code *v48;
  int v49;
  uint64_t v50;
  int *v51;
  char *v52;
  const char *v53;
  NSObject *v54;
  uint32_t v55;
  uint64_t v56;
  uint64_t v57;
  int *v58;
  char *v59;
  int *v61;
  char *v62;
  int *v63;
  char *v64;
  int *v65;
  char *v66;
  _QWORD v67[2];
  const __CFString *v68;
  int v69;
  void *v70;
  const void *StreamCompressor;
  id v72;
  const UInt8 *v73;
  const void *v74[5];
  std::__fs::filesystem::path v75[10];
  std::__fs::filesystem::path v76[10];
  void *keys[5];

  keys[3] = *(void **)MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (__CFString *)a5;
  if (objc_msgSend(v8, "count"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v68 = v9;
      v69 = a4;
      v67[0] = self;
      if ((a4 - 1) > 5)
        v10 = 0;
      else
        v10 = qword_19BC3F970[a4 - 1];
      StreamCompressor = (const void *)DDLookupTableCreate();
      v67[1] = v67;
      MEMORY[0x1E0C80A78](StreamCompressor);
      v73 = (const UInt8 *)v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
      v72 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (objc_msgSend(v8, "count"))
      {
        v14 = 0;
        v15 = 0;
        v70 = (void *)*MEMORY[0x1E0C9B0D0];
        do
        {
          objc_msgSend(v8, "firstObject", v67[0]);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "removeObjectAtIndex:", 0);
          if (objc_msgSend(v8, "count") < v10)
          {
            *(_DWORD *)&v73[4 * v14] = 0;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = v16;
              objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("threshold"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("domain"));
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("entities"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("keywords"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19)
                v22 = v19;
              else
                v22 = v70;
              objc_msgSend(v72, "addObject:", v22);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  DDSourceAddDomainContent((uint64_t)StreamCompressor, v69, v14, v20, v21);
                  objc_opt_class();
                  isKindOfClass = objc_opt_isKindOfClass();
                  LODWORD(v24) = 0;
                  if ((isKindOfClass & 1) != 0)
                    objc_msgSend(v18, "floatValue", v24);
                  *(_DWORD *)&v73[4 * v14] = LODWORD(v24);
                }
              }

              v15 = 1;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                DDSourceAddDomainContent((uint64_t)StreamCompressor, v69, v14, v16, 0);
            }
            ++v14;
          }

        }
        while (objc_msgSend(v8, "count"));
        if (v14 >= 1)
        {
          if ((v15 & 1) != 0)
            DDLookupTableSetContextThresholds((uint64_t)StreamCompressor, v69, (uint64_t)v73, v14);
          v25 = v68;
          if (v68)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              v25 = 0;
          }
          if (objc_msgSend(v72, "count") || v25)
            DDSourceAddDomainsNames((uint64_t)StreamCompressor, v69, (CFArrayRef)v72, v25);
        }
      }
      v12 = StreamCompressor;
      if (!StreamCompressor)
        goto LABEL_67;
      v26 = *(_DWORD *)(v67[0] + 44);
      FinalizedSourceContent = DDSourceCreateFinalizedSourceContent((uint64_t)StreamCompressor);
      CFRelease(v12);
      if (FinalizedSourceContent)
      {
        v28 = v69;
        if (_DDTriePathForSource(v69, (const char *)v76, 0, 1, v26))
        {
          Length = CFDataGetLength((CFDataRef)FinalizedSourceContent);
          if (_DDTriePathForSource(v28, (const char *)v75, 0, 0, v26))
          {
            v30 = mkstemp((char *)v75);
            if (v30 != -1)
            {
              v31 = v30;
              BytePtr = CFDataGetBytePtr((CFDataRef)FinalizedSourceContent);
              if (Length)
              {
                if (VolumeSupportsCompression())
                {
                  v33 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
                  v34 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B378]);
                  if (v34)
                  {
                    v35 = v34;
                    v73 = BytePtr;
                    v74[0] = *(const void **)MEMORY[0x1E0C9AE50];
                    v74[1] = v74[0];
                    v74[2] = v34;
                    v36 = (void *)*MEMORY[0x1E0CFCE98];
                    keys[0] = *(void **)MEMORY[0x1E0CFCEA0];
                    keys[1] = v36;
                    keys[2] = *(void **)MEMORY[0x1E0CFCE90];
                    v37 = CFDictionaryCreate(v33, (const void **)keys, v74, 3, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
                    if (v37)
                    {
                      v38 = v37;
                      StreamCompressorQueueWithOptions = CreateStreamCompressorQueueWithOptions();
                      CFRelease(v38);
                      CFRelease(v35);
                      BytePtr = v73;
                      if (StreamCompressorQueueWithOptions)
                      {
                        StreamCompressor = (const void *)CreateStreamCompressor();
                        if (StreamCompressor)
                        {
                          v40 = Length;
                          if (WriteToStreamCompressor() != Length)
                          {
                            if (DDLogHandle_onceToken != -1)
                              dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
                            v41 = DDLogHandle_error_log_handle;
                            if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
                            {
                              v65 = __error();
                              v66 = strerror(*v65);
                              LODWORD(v74[0]) = 136315138;
                              *(const void **)((char *)v74 + 4) = v66;
                              _os_log_error_impl(&dword_19BC07000, v41, OS_LOG_TYPE_ERROR, "DD Failed writing stream (error: %s)", (uint8_t *)v74, 0xCu);
                            }
                            v40 = 0;
                          }
                          if (!CloseStreamCompressor())
                          {
LABEL_57:
                            if (FinishStreamCompressorQueue())
                            {
                              if (DDLogHandle_onceToken != -1)
                                dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
                              v43 = DDLogHandle_error_log_handle;
                              if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
                              {
                                v61 = __error();
                                v62 = strerror(*v61);
                                LODWORD(v74[0]) = 136315138;
                                *(const void **)((char *)v74 + 4) = v62;
                                _os_log_error_impl(&dword_19BC07000, v43, OS_LOG_TYPE_ERROR, "DD Failed compressing (error: %s)", (uint8_t *)v74, 0xCu);
                              }
                              v40 = 0;
                            }
                            BytePtr = v73;
                            if (StreamCompressor)
                              goto LABEL_78;
                            goto LABEL_77;
                          }
                          if (DDLogHandle_onceToken != -1)
                            dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
                          v42 = DDLogHandle_error_log_handle;
                          if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
                          {
                            v63 = __error();
                            v64 = strerror(*v63);
                            LODWORD(v74[0]) = 136315138;
                            *(const void **)((char *)v74 + 4) = v64;
                            _os_log_error_impl(&dword_19BC07000, v42, OS_LOG_TYPE_ERROR, "DD Failed closing stream (error: %s)", (uint8_t *)v74, 0xCu);
                          }
                        }
                        v40 = 0;
                        goto LABEL_57;
                      }
                    }
                    else
                    {
                      CFRelease(v35);
                      BytePtr = v73;
                    }
                  }
                }
              }
LABEL_77:
              v40 = write(v31, BytePtr, Length);
LABEL_78:
              if ((v28 & 0xFFFFFFFD) != 4)
                fchmod(v31, 0x184u);
              close(v31);
              if (v40 != Length)
              {
                if (DDLogHandle_onceToken != -1)
                  dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
                v9 = (__CFString *)v68;
                v56 = DDLogHandle_error_log_handle;
                if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
                  goto LABEL_97;
                LODWORD(v74[0]) = 136315138;
                *(const void **)((char *)v74 + 4) = v75;
                v53 = "DDCore: Could not write tmp lookup file %s";
                v54 = v56;
                v55 = 12;
                goto LABEL_96;
              }
              if (unlink((const char *)v76) && *__error() != 2)
              {
                if (DDLogHandle_onceToken != -1)
                  dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
                v9 = (__CFString *)v68;
                v57 = DDLogHandle_error_log_handle;
                if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
                  goto LABEL_97;
                v58 = __error();
                v59 = strerror(*v58);
                LODWORD(v74[0]) = 136315394;
                *(const void **)((char *)v74 + 4) = v59;
                WORD2(v74[1]) = 2080;
                *(const void **)((char *)&v74[1] + 6) = v75;
                v53 = "DDCore: Could not unlink lookup file (%s) %s";
                v54 = v57;
                v55 = 22;
                goto LABEL_96;
              }
              rename(v75, v76, v48);
              if (v49)
              {
                if (DDLogHandle_onceToken != -1)
                  dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
                v9 = (__CFString *)v68;
                v50 = DDLogHandle_error_log_handle;
                if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
                  goto LABEL_97;
                v51 = __error();
                v52 = strerror(*v51);
                LODWORD(v74[0]) = 136315650;
                *(const void **)((char *)v74 + 4) = v75;
                WORD2(v74[1]) = 2080;
                *(const void **)((char *)&v74[1] + 6) = v76;
                HIWORD(v74[2]) = 2080;
                v74[3] = v52;
                v53 = "DDCore: Could not move lookup file from %s to %s (error: %s)";
                v54 = v50;
                v55 = 32;
LABEL_96:
                _os_log_error_impl(&dword_19BC07000, v54, OS_LOG_TYPE_ERROR, v53, (uint8_t *)v74, v55);
LABEL_97:
                unlink((const char *)v75);
LABEL_98:
                CFRelease(FinalizedSourceContent);
                LOBYTE(v12) = 0;
                goto LABEL_99;
              }
              CFRelease(FinalizedSourceContent);
              LOBYTE(v12) = 1;
              DDSourceRemoveFile(v28, v26, 1);
LABEL_67:
              v9 = (__CFString *)v68;
LABEL_99:

              goto LABEL_100;
            }
          }
          else
          {
            if (DDLogHandle_onceToken != -1)
              dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
            v9 = (__CFString *)v68;
            v44 = DDLogHandle_error_log_handle;
            if (!os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
              goto LABEL_74;
            LODWORD(v74[0]) = 136315138;
            *(const void **)((char *)v74 + 4) = v76;
            _os_log_error_impl(&dword_19BC07000, v44, OS_LOG_TYPE_ERROR, "DDCore: Could create tmp path file for %s", (uint8_t *)v74, 0xCu);
          }
          v9 = (__CFString *)v68;
          if (DDLogHandle_onceToken != -1)
            dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
LABEL_74:
          v45 = DDLogHandle_error_log_handle;
          if (os_log_type_enabled((os_log_t)DDLogHandle_error_log_handle, OS_LOG_TYPE_ERROR))
          {
            v46 = __error();
            v47 = strerror(*v46);
            LODWORD(v74[0]) = 136315394;
            *(const void **)((char *)v74 + 4) = v47;
            WORD2(v74[1]) = 2080;
            *(const void **)((char *)&v74[1] + 6) = v75;
            _os_log_error_impl(&dword_19BC07000, v45, OS_LOG_TYPE_ERROR, "DDCore: Could not create tmp lookup file (%s) %s", (uint8_t *)v74, 0x16u);
          }
          goto LABEL_98;
        }
        CFRelease(FinalizedSourceContent);
      }
      LOBYTE(v12) = 0;
      goto LABEL_67;
    }
    LOBYTE(v12) = 0;
  }
  else
  {
    LODWORD(v12) = self->_clientuid;
    v11 = DDSourceRemoveFile(a4, (int)v12, 0);
    DDSourceRemoveFile(a4, (int)v12, 1);
    LOBYTE(v12) = v11;
  }
LABEL_100:

  return (char)v12;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  $115C4C562B26FF47E01F9F4EA65B5887 *result;

  objc_copyStruct(retstr, &self->_auditToken, 32, 1, 0);
  return result;
}

- (void)setAuditToken:(id *)a3
{
  objc_copyStruct(&self->_auditToken, a3, 32, 1, 0);
}

- (int)processIdentifier
{
  return self->_clientpid;
}

- (void)setProcessIdentifier:(int)a3
{
  self->_clientpid = a3;
}

- (unsigned)userIdentifier
{
  return self->_clientuid;
}

- (void)setUserIdentifier:(unsigned int)a3
{
  self->_clientuid = a3;
}

void __52__DataDetectorsSourceAccess_privacyUserReadEntitled__block_invoke(uint64_t a1)
{
  _BYTE *v2;
  __SecTask *v3;
  __SecTask *v4;
  CFTypeRef v5;
  const void *v6;
  CFTypeID TypeID;
  uint64_t v8;
  NSObject *v9;
  int v10;
  audit_token_t v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[49])
  {
    objc_msgSend(v2, "auditToken");
    v3 = SecTaskCreateWithAuditToken(0, &v11);
    if (v3)
    {
      v4 = v3;
      v5 = SecTaskCopyValueForEntitlement(v3, CFSTR("com.apple.datadetectors.source-read.user"), 0);
      if (v5)
      {
        v6 = v5;
        TypeID = CFBooleanGetTypeID();
        if (TypeID == CFGetTypeID(v6) && CFEqual(v6, (CFTypeRef)*MEMORY[0x1E0C9AE50]))
          *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 1;
        CFRelease(v6);
      }
      CFRelease(v4);
    }
    v8 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v8 + 48))
    {
      if (DDLogHandle_onceToken != -1)
        dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
      v9 = (id)DDLogHandle_error_log_handle;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 40);
        *(_DWORD *)buf = 67109378;
        v13 = v10;
        v14 = 2112;
        v15 = CFSTR("com.apple.datadetectors.source-read.user");
        _os_log_error_impl(&dword_19BC07000, v9, OS_LOG_TYPE_ERROR, "Client pid %d is missing the %@ entitlement", buf, 0x12u);
      }

      v8 = *(_QWORD *)(a1 + 32);
    }
    *(_BYTE *)(v8 + 49) = 1;
  }
}

void __70__DataDetectorsSourceAccess_writeSourceFromJSONFile_source_withReply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1ACABBC]();
  v3 = objc_msgSend(*(id *)(a1 + 32), "intValue");
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = v3;
    if (objc_msgSend(*(id *)(a1 + 40), "clientCanWriteSource:", v3))
    {
      v5 = *(void **)(a1 + 48);
      if (v5)
      {
        if ((int)objc_msgSend(v5, "fileDescriptor") >= 3)
        {
          v6 = (void *)MEMORY[0x1A1ACABBC]();
          objc_msgSend(*(id *)(a1 + 48), "readDataToEndOfFile");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 0;
          objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 1, &v20);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v20;
          if (v9)
          {
            v10 = 0;
            v11 = 0;
          }
          else
          {
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("domains"));
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              if (DDLogHandle_onceToken != -1)
                dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
              v15 = (id)DDLogHandle_error_log_handle;
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                v18 = objc_opt_class();
                *(_DWORD *)buf = 138412290;
                v22 = v18;
                _os_log_error_impl(&dword_19BC07000, v15, OS_LOG_TYPE_ERROR, "Domains is not a NSMutableDictionary (%@)", buf, 0xCu);
              }

              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DataDetectorsCoreSourceAccess"), 2, 0);
              v9 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v9 = 0;
            }
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("signature"));
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (v10)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (DDLogHandle_onceToken != -1)
                  dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
                v16 = (id)DDLogHandle_error_log_handle;
                if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
                {
                  v19 = objc_opt_class();
                  *(_DWORD *)buf = 138412546;
                  v22 = v19;
                  v23 = 2112;
                  v24 = v10;
                  _os_log_error_impl(&dword_19BC07000, v16, OS_LOG_TYPE_ERROR, "Signature is not a NSString (%@:%@)", buf, 0x16u);
                }

                objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("DataDetectorsCoreSourceAccess"), 1, 0);
                v17 = objc_claimAutoreleasedReturnValue();

                v9 = (id)v17;
              }
            }
          }

          objc_autoreleasePoolPop(v6);
          if (v9)
          {
            if (DDLogHandle_onceToken != -1)
              dispatch_once(&DDLogHandle_onceToken, &__block_literal_global_1000);
            v12 = (id)DDLogHandle_error_log_handle;
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v22 = (uint64_t)v9;
              _os_log_error_impl(&dword_19BC07000, v12, OS_LOG_TYPE_ERROR, "Could not read JSON content (%@)", buf, 0xCu);
            }

          }
          else
          {
            objc_msgSend(*(id *)(a1 + 40), "pushSourcesContent:forSource:signature:", v11, v4, v10);
          }

        }
      }
      else
      {
        v13 = objc_msgSend(*(id *)(a1 + 32), "intValue");
        v14 = *(_DWORD *)(*(_QWORD *)(a1 + 40) + 44);
        DDSourceRemoveFile(v13, v14, 0);
        DDSourceRemoveFile(v13, v14, 1);
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __79__DataDetectorsSourceAccess_writeSourceFromRawData_source_signature_withReply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1A1ACABBC]();
  v3 = objc_msgSend(*(id *)(a1 + 32), "intValue");
  if (*(_QWORD *)(a1 + 32))
  {
    v4 = v3;
    if (objc_msgSend(*(id *)(a1 + 40), "clientCanWriteSource:", v3))
      objc_msgSend(*(id *)(a1 + 40), "pushSourcesContent:forSource:signature:", *(_QWORD *)(a1 + 48), v4, *(_QWORD *)(a1 + 56));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_autoreleasePoolPop(v2);
}

@end
