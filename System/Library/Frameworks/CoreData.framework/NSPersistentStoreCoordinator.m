@implementation NSPersistentStoreCoordinator

- (id)executeRequest:(NSPersistentStoreRequest *)request withContext:(NSManagedObjectContext *)context error:(NSError *)error
{
  NSPersistentStoreRequest *v6;
  NSPersistentStoreRequestType v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  NSArray *persistentStoreIdentifiers;
  NSQueryGenerationToken *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  BOOL v31;
  id v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  NSObject *v36;
  os_signpost_id_t v37;
  uint32_t v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  NSError *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSArray *v72;
  NSPersistentStoreRequest *v73;
  void *v74;
  void *v75;
  char exception_object;
  char v77;
  os_signpost_id_t spid;
  _QWORD v80[14];
  char v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  NSError *v86;
  _QWORD v87[5];
  uint64_t v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  char v92;
  uint64_t v93;
  uint64_t *v94;
  uint64_t v95;
  void (*v96)(uint64_t, uint64_t);
  void (*v97)(uint64_t);
  uint64_t v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  void (*v102)(uint64_t, uint64_t);
  void (*v103)(uint64_t);
  uint64_t v104;
  const __CFString *v105;
  uint64_t v106;
  uint8_t v107[128];
  uint8_t buf[4];
  const char *v109;
  __int16 v110;
  int v111;
  uint64_t v112;

  v6 = request;
  v112 = *MEMORY[0x1E0C80C00];
  v99 = 0;
  v100 = &v99;
  v101 = 0x3052000000;
  v102 = __Block_byref_object_copy__18;
  v103 = __Block_byref_object_dispose__18;
  v104 = 0;
  v93 = 0;
  v94 = &v93;
  v95 = 0x3052000000;
  v96 = __Block_byref_object_copy__18;
  v97 = __Block_byref_object_dispose__18;
  v98 = 0;
  v89 = 0;
  v90 = &v89;
  v91 = 0x2020000000;
  v92 = 0;
  v9 = -[NSPersistentStoreRequest requestType](request, "requestType");
  v10 = v9;
  if (v9 == NSFetchRequestType)
  {
    v11 = -[NSPersistentStoreRequest resultType](v6, "resultType");
    LOBYTE(v12) = -[NSPersistentStoreRequest _isAsyncRequest](v6, "_isAsyncRequest");
    v77 = 0;
    v75 = 0;
    if (v11 == 4)
      v10 = 3;
    else
      v10 = 1;
    v88 = 0;
    goto LABEL_11;
  }
  v88 = 0;
  if (v9 - 5 < 3 || v9 == NSSaveRequestType)
    goto LABEL_10;
  if (v9 == 8)
  {
    v12 = -[NSPersistentStoreRequest isDelete](v6, "isDelete");
    if (v12)
    {
LABEL_10:
      v75 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, (uint64_t)CFSTR("CoreData: Executing write request"), &v88);
      LOBYTE(v12) = 0;
      v77 = 1;
      goto LABEL_11;
    }
    v77 = 0;
    v75 = 0;
    v10 = 8;
  }
  else
  {
    v77 = 0;
    LOBYTE(v12) = 0;
    v75 = 0;
  }
LABEL_11:
  if (context && (v12 & 1) == 0 && _PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)context, a2);
  v13 = PFInstrumentsRecordingEnabled();
  v14 = MEMORY[0x1E0C809B0];
  if (!v13)
    goto LABEL_27;
  if (v10 == 1 || v10 == 3)
  {
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_382;
    v87[3] = &unk_1E1EDEB50;
    v87[4] = v6;
    spid = __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_382((uint64_t)v87);
    goto LABEL_29;
  }
  if (v10 != 2)
  {
LABEL_27:
    spid = 0;
LABEL_29:
    v86 = 0;
    v17 = 1;
    if (v10 > 7 || ((1 << v10) & 0xE4) == 0)
      goto LABEL_32;
    goto LABEL_31;
  }
  v15 = MEMORY[0x1E0C809B0];
  if (PFInstrumentsGetLog_logtoken != -1)
    dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_23);
  spid = os_signpost_id_generate((os_log_t)PFInstrumentsGetLog_coreDataInstrumentsLog);
  if (PFInstrumentsGetLog_logtoken != -1)
    dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_23);
  v16 = PFInstrumentsGetLog_coreDataInstrumentsLog;
  kdebug_trace();
  v14 = v15;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18A253000, v16, OS_SIGNPOST_INTERVAL_BEGIN, spid, "Save", (const char *)&unk_18A57BACF, buf, 2u);
  }
  v86 = 0;
LABEL_31:
  v17 = 0;
LABEL_32:
  if (context)
    persistentStoreIdentifiers = context->_persistentStoreIdentifiers;
  else
    persistentStoreIdentifiers = 0;
  v19 = +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken");
  if (v19 != (NSQueryGenerationToken *)-[NSManagedObjectContext _queryGenerationToken](context, "_queryGenerationToken"))
  {
    exception_object = 1;
    goto LABEL_36;
  }
  v30 = -[NSPersistentStoreCoordinator _retainedCurrentQueryGeneration:](self, "_retainedCurrentQueryGeneration:");
  if (v30)
  {
    v31 = -[NSManagedObjectContext _setQueryGenerationFromToken:error:](context, "_setQueryGenerationFromToken:error:", v30, &v86);

    if (v31)
    {
      exception_object = 1;
      v14 = MEMORY[0x1E0C809B0];
      goto LABEL_36;
    }
  }
  else
  {
    v86 = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134502, 0);
  }
  if (!v17)
  {
    v40 = +[NSQueryGenerationToken unpinnedQueryGenerationToken](NSQueryGenerationToken, "unpinnedQueryGenerationToken");
    v14 = MEMORY[0x1E0C809B0];
    -[NSManagedObjectContext _setQueryGenerationFromToken:error:](context, "_setQueryGenerationFromToken:error:", v40, 0);
    exception_object = 0;
LABEL_36:
    if (v10 != 8 || !-[NSPersistentStoreRequest token](v6, "token"))
    {
LABEL_50:
      v80[0] = v14;
      v80[1] = 3221225472;
      v80[2] = __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_387;
      v80[3] = &unk_1E1EDEB78;
      v80[4] = v6;
      v80[5] = persistentStoreIdentifiers;
      v80[6] = self;
      v80[7] = context;
      v81 = exception_object;
      v80[8] = &v93;
      v80[9] = &v89;
      v80[10] = &v99;
      v80[11] = v10;
      v80[12] = spid;
      v80[13] = error;
      -[NSPersistentStoreCoordinator _routeHeavyweightBlock:]((uint64_t)self, (uint64_t)v80);
      if (*((_BYTE *)v90 + 24))
      {
        pthread_yield_np();
        v29 = -[NSPersistentStoreCoordinator executeRequest:withContext:error:](self, "executeRequest:withContext:error:", v6, context, error);
LABEL_92:
        v39 = v29;
        goto LABEL_93;
      }
      if (v6 && v10 == 2)
        v6[3].super.isa = (Class)((unint64_t)v6[3].super.isa & 0xFFFFFF00);
      v32 = (id)v100[5];
      if (error && !v94[5])
        *error = (NSError *)v100[5];
      if (spid)
      {
        if (v10 == 1 || v10 == 3)
        {
          if (PFInstrumentsGetLog_logtoken != -1)
            dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_23);
          if (spid != -1)
          {
            v44 = PFInstrumentsGetLog_coreDataInstrumentsLog;
            if (os_signpost_enabled((os_log_t)PFInstrumentsGetLog_coreDataInstrumentsLog))
            {
              v45 = objc_msgSend((id)v94[5], "count");
              *(_DWORD *)buf = 67109120;
              LODWORD(v109) = v45;
              v34 = "Fetch";
              v35 = "%d";
              v36 = v44;
              v37 = spid;
              v38 = 8;
              goto LABEL_84;
            }
          }
        }
        else if (v10 == 2)
        {
          if (PFInstrumentsGetLog_logtoken != -1)
            dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_23);
          if (spid != -1)
          {
            v33 = PFInstrumentsGetLog_coreDataInstrumentsLog;
            if (os_signpost_enabled((os_log_t)PFInstrumentsGetLog_coreDataInstrumentsLog))
            {
              *(_WORD *)buf = 0;
              v34 = "Save";
              v35 = (const char *)&unk_18A57BACF;
              v36 = v33;
              v37 = spid;
              v38 = 2;
LABEL_84:
              _os_signpost_emit_with_name_impl(&dword_18A253000, v36, OS_SIGNPOST_INTERVAL_END, v37, v34, v35, buf, v38);
            }
          }
        }
      }
      v46 = v100[5];
      if (v94[5])
      {
        if (!v46)
          goto LABEL_91;
      }
      else if (v46)
      {
LABEL_91:
        v29 = (id)v94[5];
        goto LABEL_92;
      }
      v47 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Either a non nil result OR an error");
      _NSCoreDataLog(17, v47, v48, v49, v50, v51, v52, v53, v71);
      v54 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_18A253000, v54, OS_LOG_TYPE_FAULT, "CoreData: Either a non nil result OR an error", buf, 2u);
      }
      goto LABEL_91;
    }
    v74 = (void *)-[NSPersistentStoreRequest token](v6, "token");
    v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(v74, "storeTokens"), "count"));
    v21 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)objc_msgSend(v74, "storeTokens"), "count"));
    v72 = persistentStoreIdentifiers;
    v73 = v6;
    v84 = 0u;
    v85 = 0u;
    v83 = 0u;
    v82 = 0u;
    v22 = (void *)objc_msgSend(v74, "storeTokens");
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v82, v107, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v83 != v24)
            objc_enumerationMutation(v22);
          v26 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * i);
          v27 = -[NSPersistentStoreCoordinator persistentStoreForIdentifier:](self, "persistentStoreForIdentifier:", v26);
          if (v27)
            objc_msgSend(v20, "addObject:", v27);
          else
            objc_msgSend(v21, "addObject:", v26);
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v82, v107, 16);
      }
      while (v23);
    }
    v28 = objc_msgSend(v20, "count");
    persistentStoreIdentifiers = v72;
    v6 = v73;
    v14 = MEMORY[0x1E0C809B0];
    if (v28)
    {
      -[NSPersistentStoreRequest setAffectedStores:](v73, "setAffectedStores:", v20);
      goto LABEL_50;
    }
    v41 = (void *)MEMORY[0x1E0CB35C8];
    v105 = CFSTR("Reason");
    v106 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to find stores referenced in History Token (%@) - %@"), v74, v21);
    v42 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
    v43 = (NSError *)objc_msgSend(v41, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134501, v42);
    v100[5] = (uint64_t)v43;
    if (v43)
    {
      if (error)
      {
        v39 = 0;
        *error = v43;
        goto LABEL_93;
      }
      goto LABEL_101;
    }
    v64 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v64, v65, v66, v67, v68, v69, v70, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
    v63 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      goto LABEL_101;
    *(_DWORD *)buf = 136315394;
    v109 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
    v110 = 1024;
    v111 = 2774;
LABEL_103:
    _os_log_fault_impl(&dword_18A253000, v63, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    goto LABEL_101;
  }
  if (v86)
  {
    if (error)
    {
      v39 = 0;
      *error = v86;
      goto LABEL_93;
    }
    goto LABEL_101;
  }
  v56 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
  _NSCoreDataLog(17, v56, v57, v58, v59, v60, v61, v62, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
  v63 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v109 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
    v110 = 1024;
    v111 = 2751;
    goto LABEL_103;
  }
LABEL_101:
  v39 = 0;
LABEL_93:
  if ((v77 & 1) != 0)
    +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v88, v75);
  _Block_object_dispose(&v89, 8);
  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(&v99, 8);
  return v39;
}

- (id)newValuesForObjectWithID:(id)a3 withContext:(id)a4 error:(id *)a5
{
  uint64_t v9;
  uint64_t v10;
  NSQueryGenerationToken *v11;
  id v12;
  void *v13;
  void *v14;
  id v16;
  char v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  _QWORD v27[9];
  void *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  uint64_t v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v35 = 0;
  v36 = &v35;
  v37 = 0x3052000000;
  v38 = __Block_byref_object_copy__18;
  v39 = __Block_byref_object_dispose__18;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3052000000;
  v32 = __Block_byref_object_copy__18;
  v33 = __Block_byref_object_dispose__18;
  v34 = 0;
  if (a4 && _PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)a4, a2);
  v9 = objc_msgSend(a3, "persistentStore");
  v28 = 0;
  if (a4)
    v10 = *((_QWORD *)a4 + 22);
  else
    v10 = 0;
  v11 = +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken");
  if (v11 != (NSQueryGenerationToken *)objc_msgSend(a4, "_queryGenerationToken"))
    goto LABEL_7;
  v16 = -[NSPersistentStoreCoordinator _retainedCurrentQueryGeneration:](self, "_retainedCurrentQueryGeneration:", v10);
  if (!v16)
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134502, 0);
    v28 = v18;
    if (!v18)
    {
LABEL_15:
      v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v19, v20, v21, v22, v23, v24, v25, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
      v26 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v42 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
        v43 = 1024;
        v44 = 4557;
        _os_log_fault_impl(&dword_18A253000, v26, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
      goto LABEL_20;
    }
LABEL_18:
    if (a5)
    {
      v14 = 0;
      *a5 = v18;
      goto LABEL_11;
    }
LABEL_20:
    v14 = 0;
    goto LABEL_11;
  }
  v17 = objc_msgSend(a4, "_setQueryGenerationFromToken:error:", v16, &v28);

  if ((v17 & 1) == 0)
  {
    v18 = v28;
    if (!v28)
      goto LABEL_15;
    goto LABEL_18;
  }
LABEL_7:
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __95__NSPersistentStoreCoordinator__NSInternalMethods__newValuesForObjectWithID_withContext_error___block_invoke;
  v27[3] = &unk_1E1EDEC38;
  v27[4] = self;
  v27[5] = a4;
  v27[6] = a3;
  v27[7] = &v35;
  v27[8] = &v29;
  -[NSPersistentStoreCoordinator _routeLightweightBlock:toStore:]((uint64_t)self, (uint64_t)v27, v9);
  v12 = (id)v30[5];
  if (a5)
  {
    v13 = (void *)v30[5];
    if (v13)
      *a5 = v13;
  }
  v14 = (void *)v36[5];
LABEL_11:
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
  return v14;
}

- (void)_routeHeavyweightBlock:(uint64_t)a1
{
  id v3;
  id v4;
  _QWORD v5[8];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  if (a1)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    v6 = 0;
    v7 = &v6;
    v8 = 0x3052000000;
    v9 = __Block_byref_object_copy__18;
    v10 = __Block_byref_object_dispose__18;
    v11 = 0;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __55__NSPersistentStoreCoordinator__routeHeavyweightBlock___block_invoke;
    v5[3] = &unk_1E1EDE9D0;
    v5[6] = &v12;
    v5[7] = &v6;
    v5[4] = a1;
    v5[5] = a2;
    _perform_0(a1, (uint64_t)v5);
    if (*((_BYTE *)v13 + 24))
    {
      if (v7[5])
      {
        v3 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
        (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, v7[5]);

        objc_msgSend(v3, "drain");
        v4 = 0;
      }
    }
    _Block_object_dispose(&v6, 8);
    _Block_object_dispose(&v12, 8);
  }
}

- (void)_routeLightweightBlock:(uint64_t)a3 toStore:
{
  id v4;
  id v5;
  _QWORD v6[9];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  if (a1)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v7 = 0;
    v8 = &v7;
    v9 = 0x3052000000;
    v10 = __Block_byref_object_copy__18;
    v11 = __Block_byref_object_dispose__18;
    v12 = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__NSPersistentStoreCoordinator__routeLightweightBlock_toStore___block_invoke;
    v6[3] = &unk_1E1EDE9A8;
    v6[4] = a1;
    v6[5] = a3;
    v6[7] = &v13;
    v6[8] = &v7;
    v6[6] = a2;
    _perform_0(a1, (uint64_t)v6);
    if (*((_BYTE *)v14 + 24))
    {
      if (v8[5])
      {
        v4 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
        (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, v8[5]);

        objc_msgSend(v4, "drain");
        v5 = 0;
      }
    }
    _Block_object_dispose(&v7, 8);
    _Block_object_dispose(&v13, 8);
  }
}

- (BOOL)_canRouteToStore:(void *)a3 forContext:
{
  void *v4;

  if (result)
  {
    v4 = (void *)objc_msgSend(a3, "_queryGenerationToken");
    if (objc_msgSend(v4, "_isEnabled"))
      return +[NSQueryGenerationToken nostoresQueryGenerationToken](NSQueryGenerationToken, "nostoresQueryGenerationToken") != v4&& -[_NSQueryGenerationToken _generationalComponentForStore:]((uint64_t)v4, a2) != 0;
    else
      return 1;
  }
  return result;
}

void __109__NSPersistentStoreCoordinator__NSInternalMethods__managedObjectContextDidRegisterObjectsWithIDs_generation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  const __CFDictionary *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  const void *v16;
  void *Value;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  const void *v23;
  uint64_t v24;
  const __CFAllocator *allocator;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CFDictionaryValueCallBacks valueCallBacks;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 48) == 1)
  {
    v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 0), "persistentStore");
    if (v4)
    {
      v5 = (void *)v4;
      if (objc_msgSend(a2, "indexOfObjectIdenticalTo:", v4) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v6 = objc_msgSend(v5, "supportsGenerationalQuerying");
        v7 = *(_QWORD *)(a1 + 32);
        if (v6)
          objc_msgSend(v5, "managedObjectContextDidRegisterObjectsWithIDs:generation:", v7, *(_QWORD *)(a1 + 40));
        else
          objc_msgSend(v5, "managedObjectContextDidRegisterObjectsWithIDs:", v7);
      }
    }
  }
  else
  {
    valueCallBacks.version = 0;
    valueCallBacks.retain = 0;
    *(_OWORD *)&valueCallBacks.release = *(_OWORD *)(MEMORY[0x1E0C9B3A0] + 16);
    valueCallBacks.equal = 0;
    allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v8 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, &valueCallBacks);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v24 = a1;
    v9 = *(void **)(a1 + 32);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v31 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "persistentStore");
          if (v15)
          {
            v16 = (const void *)v15;
            if (objc_msgSend(a2, "indexOfObjectIdenticalTo:", v15) != 0x7FFFFFFFFFFFFFFFLL)
            {
              Value = (void *)CFDictionaryGetValue(v8, v16);
              if (!Value)
              {
                Value = CFArrayCreateMutable(allocator, 0, 0);
                CFDictionarySetValue(v8, v16, Value);
              }
              CFArrayAppendValue((CFMutableArrayRef)Value, v14);
            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v11);
    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v18 = -[__CFDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v8);
          v22 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
          v23 = CFDictionaryGetValue(v8, v22);
          if (objc_msgSend(v22, "supportsGenerationalQuerying"))
            objc_msgSend(v22, "managedObjectContextDidRegisterObjectsWithIDs:generation:", v23, *(_QWORD *)(v24 + 40));
          else
            objc_msgSend(v22, "managedObjectContextDidRegisterObjectsWithIDs:", v23);
        }
        v19 = -[__CFDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v19);
    }
    CFRelease(v8);
  }
}

void __82__NSPersistentStoreCoordinator_QueryGenerations___retainedCurrentQueryGeneration___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(a2);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", objc_msgSend(v9, "identifier")))
            objc_msgSend(v4, "addObject:", v9);
        }
        v6 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }
  }
  else
  {
    v4 = 0;
  }
  if (v4)
    v10 = v4;
  else
    v10 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = -[NSPersistentStoreCoordinator _retainedIdentifierFromStores:](*(_NSQueryGenerationToken **)(a1 + 40), v10);

}

- (id)_retainedCurrentQueryGeneration:(id)a3
{
  void *v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__18;
  v10 = __Block_byref_object_dispose__18;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__NSPersistentStoreCoordinator_QueryGenerations___retainedCurrentQueryGeneration___block_invoke;
  v5[3] = &unk_1E1EDEDA0;
  v5[5] = self;
  v5[6] = &v6;
  v5[4] = a3;
  -[NSPersistentStoreCoordinator _routeHeavyweightBlock:]((uint64_t)self, (uint64_t)v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __63__NSPersistentStoreCoordinator_setMetadata_forPersistentStore___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setMetadata:", *(_QWORD *)(a1 + 32));
}

void __111__NSPersistentStoreCoordinator__NSInternalMethods__managedObjectContextDidUnregisterObjectsWithIDs_generation___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  const __CFDictionary *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  const void *v14;
  void *Value;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  const void *v21;
  const __CFAllocator *allocator;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CFDictionaryValueCallBacks valueCallBacks;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 56) == 1)
  {
    v2 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", 0), "persistentStore");
    if (v2)
    {
      v3 = (void *)v2;
      if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "indexOfObjectIdenticalTo:", v2) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v4 = objc_msgSend(v3, "supportsGenerationalQuerying");
        v5 = *(_QWORD *)(a1 + 32);
        if (v4)
          objc_msgSend(v3, "managedObjectContextDidUnregisterObjectsWithIDs:generation:", v5, *(_QWORD *)(a1 + 40));
        else
          objc_msgSend(v3, "managedObjectContextDidUnregisterObjectsWithIDs:", v5);
      }
    }

  }
  else
  {
    valueCallBacks.version = 0;
    valueCallBacks.retain = 0;
    *(_OWORD *)&valueCallBacks.release = *(_OWORD *)(MEMORY[0x1E0C9B3A0] + 16);
    valueCallBacks.equal = 0;
    allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v6 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, &valueCallBacks);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v7 = *(void **)(a1 + 32);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "persistentStore");
          if (v13)
          {
            v14 = (const void *)v13;
            if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "indexOfObjectIdenticalTo:", v13) != 0x7FFFFFFFFFFFFFFFLL)
            {
              Value = (void *)CFDictionaryGetValue(v6, v14);
              if (!Value)
              {
                Value = CFArrayCreateMutable(allocator, 0, 0);
                CFDictionarySetValue(v6, v14, Value);
              }
              CFArrayAppendValue((CFMutableArrayRef)Value, v12);
            }
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      }
      while (v9);
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v16 = -[__CFDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v6);
          v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
          v21 = CFDictionaryGetValue(v6, v20);
          if (objc_msgSend(v20, "supportsGenerationalQuerying"))
            objc_msgSend(v20, "managedObjectContextDidUnregisterObjectsWithIDs:generation:", v21, *(_QWORD *)(a1 + 40));
          else
            objc_msgSend(v20, "managedObjectContextDidUnregisterObjectsWithIDs:", v21);
        }
        v17 = -[__CFDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      }
      while (v17);
    }
    CFRelease(v6);

  }
}

void __63__NSPersistentStoreCoordinator__routeLightweightBlock_toStore___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) & 2) == 0)
    goto LABEL_2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  os_unfair_lock_lock_with_options();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "indexOfObjectIdenticalTo:", *(_QWORD *)(a1 + 40)) != 0x7FFFFFFFFFFFFFFFLL)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = *(id *)(a1 + 40);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v2 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "_persistentStoreCoordinator");
    _NSCoreDataLog(1, (uint64_t)CFSTR(" API Misuse: Attempt to serialize store access on non-owning coordinator (PSC = %p, store PSC = %p)"), v3, v4, v5, v6, v7, v8, v2);
    if (!HIBYTE(dword_1ECD8DE18))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
LABEL_2:
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
  }
}

void __55__NSPersistentStoreCoordinator__routeHeavyweightBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = a1[4];
  if ((*(_BYTE *)(v2 + 24) & 2) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    os_unfair_lock_lock_with_options();
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = objc_msgSend(*(id *)(a1[4] + 48), "mutableCopy");
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 32));
  }
  else
  {
    v3 = -[NSPersistentStoreCoordinator _retainedPersistentStores](v2);
    (*(void (**)(void))(a1[5] + 16))();

  }
}

- (void)release
{
  int *p_cd_rc;
  int v3;
  unsigned int v4;

  p_cd_rc = &self->_cd_rc;
  do
    v3 = __ldaxr((unsigned int *)p_cd_rc);
  while (__stlxr(v3 - 2, (unsigned int *)p_cd_rc));
  if (v3 <= 0)
  {
    if ((v3 & 0x80000000) == 0)
    {
      while (1)
      {
        v4 = __ldaxr((unsigned int *)p_cd_rc);
        if (v4 != -2)
          break;
        if (!__stlxr(1u, (unsigned int *)p_cd_rc))
        {
          -[NSPersistentStoreCoordinator dealloc](self, "dealloc");
          return;
        }
      }
      __clrex();
    }
    __break(1u);
  }
}

void __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_3(uint64_t a1)
{
  _NSPersistentHistoryToken *v2;

  v2 = -[NSPersistentStoreCoordinator _retainedChangeTokenFromStores:](*(_NSPersistentHistoryToken **)(a1 + 32), *(void **)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "_setChangeTrackingTokenFromToken:error:", v2, 0);

}

uint64_t __36__NSPersistentStoreCoordinator_name__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __95__NSPersistentStoreCoordinator__NSInternalMethods__newValuesForObjectWithID_withContext_error___block_invoke(uint64_t a1, void *a2)
{
  id result;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  if (a2
    && !-[NSPersistentStoreCoordinator _canRouteToStore:forContext:](*(_QWORD *)(a1 + 32), a2, *(void **)(a1 + 40)))
  {
    v6[0] = CFSTR("Reason");
    v6[1] = CFSTR("store");
    v7[0] = CFSTR("Store is not valid for this context's generation");
    v7[1] = a2;
    v6[2] = CFSTR("context");
    v7[2] = *(_QWORD *)(a1 + 40);
    v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
    result = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v5);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = result;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(a2, "newValuesForObjectWithID:withContext:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  }
  return result;
}

- (void)managedObjectContextDidRegisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  uint64_t v7;
  _QWORD v8[7];

  v7 = objc_msgSend(a3, "count");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __109__NSPersistentStoreCoordinator__NSInternalMethods__managedObjectContextDidRegisterObjectsWithIDs_generation___block_invoke;
  v8[3] = &unk_1E1EDECB0;
  v8[5] = a4;
  v8[6] = v7;
  v8[4] = a3;
  -[NSPersistentStoreCoordinator _routeHeavyweightBlock:]((uint64_t)self, (uint64_t)v8);
}

- (NSManagedObjectModel)managedObjectModel
{
  return self->_managedObjectModel;
}

- (BOOL)_isDeallocating
{
  int cd_rc;

  cd_rc = self->_cd_rc;
  if (cd_rc == -2)
  {
    LOBYTE(self) = 1;
  }
  else if (cd_rc <= -3)
  {
    __break(1u);
  }
  else
  {
    LOBYTE(self) = cd_rc & 1;
  }
  return (char)self;
}

- (NSManagedObjectID)managedObjectIDForURIRepresentation:(NSURL *)url
{
  NSTemporaryObjectID *v4;
  id v6;

  if (!url)
    return 0;
  v6 = 0;
  v4 = -[NSPersistentStoreCoordinator managedObjectIDForURIRepresentation:error:](self, (CFURLRef)url, &v6);
  if (!v4 && (!v6 || objc_msgSend(v6, "code") != 134000))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The specified URI is not a valid Core Data URI: %@"), url), 0));
  return &v4->super;
}

- (NSTemporaryObjectID)managedObjectIDForURIRepresentation:(_QWORD *)a3 error:
{
  NSTemporaryObjectID *v3;
  UInt8 *v7;
  CFIndex v8;
  CFIndex v9;
  id *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v20;
  const __CFString *v21;
  CFURLRef v22;
  const __CFString *v23;
  CFURLRef v24;
  UInt8 buffer[512];
  uint64_t v26;

  v3 = 0;
  v26 = *MEMORY[0x1E0C80C00];
  if (a1 && url)
  {
    v20 = 0;
    v7 = buffer;
    v8 = CFURLGetBytes(url, buffer, 511);
    if (v8 < 0)
    {
      v9 = CFURLGetBytes(url, 0, 0);
      v7 = (UInt8 *)malloc_type_malloc(v9 + 1, 0x100004077774924uLL);
      v8 = CFURLGetBytes(url, v7, v9);
    }
    if (v8 <= 0)
    {
      if (v7 != buffer)
        free(v7);
      return 0;
    }
    else
    {
      v7[v8] = 0;
      if (a3)
        v10 = &v20;
      else
        v10 = 0;
      v3 = -[NSPersistentStoreCoordinator managedObjectIDFromUTF8String:length:error:](a1, (char *)v7, v8, v10);
      if (v7 != buffer)
        free(v7);
      if (a3 && !v3)
      {
        v11 = (void *)MEMORY[0x1E0CB35C8];
        if (v20)
        {
          v12 = objc_msgSend(v20, "domain");
          v13 = objc_msgSend(v20, "code");
          v23 = CFSTR("URI is not a valid Core Data URI");
          v24 = url;
          v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
          v15 = v11;
          v16 = v12;
          v17 = v13;
        }
        else
        {
          v18 = *MEMORY[0x1E0CB28A8];
          v21 = CFSTR("URI is not a valid Core Data URI");
          v22 = url;
          v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
          v15 = v11;
          v16 = v18;
          v17 = 134060;
        }
        v3 = 0;
        *a3 = objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, v17, v14, v20);
      }
    }
  }
  return v3;
}

- (NSTemporaryObjectID)managedObjectIDFromUTF8String:(uint64_t)a3 length:(_QWORD *)a4 error:
{
  NSTemporaryObjectID *v8;
  uint64_t v10;
  const __CFAllocator *v11;
  const __CFAllocator *v12;
  const __CFString *v13;
  CFStringRef v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  const __CFString *v18;
  CFStringRef v19;
  char *v20;
  char *v21;
  uint64_t v22;
  CFStringRef v23;
  CFStringRef v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD *v28;
  uint64_t v29;
  int v30;
  char *v31;
  char *v32;
  CFStringRef v33;
  __CFString *v34;
  uint64_t v35;
  unint64_t v36[258];
  CFRange v37;
  CFRange v38;

  v36[256] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (a3 < 14 || __s1[a3] || strncmp(__s1, "x-coredata://", 0xDuLL))
  {
    if (a4)
    {
      v8 = 0;
      *a4 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, 0);
      return v8;
    }
    return 0;
  }
  v10 = 134060;
  v11 = _PFStackAllocatorCreate(v36, 2048);
  v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE20];
  v13 = CFStringCreateWithBytesNoCopy(v11, (const UInt8 *)__s1 + 13, a3 - 13, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  if (__s1[13] == 47)
  {
    v14 = 0;
    v15 = 14;
  }
  else
  {
    v16 = strchr(__s1 + 13, 47);
    if (v16)
    {
      v17 = v16 - __s1;
      v37.length = v16 - __s1 - 13;
      v37.location = 0;
      v14 = CFStringCreateWithSubstring(v11, v13, v37);
      v15 = v17 + 1;
      if (v14)
      {
        v18 = (const __CFString *)-[NSPersistentStoreCoordinator _persistentStoreForIdentifier:]((uint64_t)a1, (uint64_t)v14);
        v19 = v14;
        v14 = v18;
        CFRelease(v19);
        if (!v14)
        {
          if (!a4)
          {
            v8 = 0;
            goto LABEL_31;
          }
          v10 = 134000;
          goto LABEL_30;
        }
      }
    }
    else
    {
      v14 = 0;
      v15 = 13;
    }
  }
  if (v15 >= a3)
  {
    v8 = 0;
  }
  else
  {
    v20 = &__s1[v15];
    v21 = strchr(&__s1[v15], 47);
    if (!v21)
      goto LABEL_27;
    v34 = (__CFString *)v14;
    v22 = v21 - v20;
    v38.location = v15 - 13;
    v38.length = v21 - v20;
    v23 = CFStringCreateWithSubstring(v11, v13, v38);
    if (!v23)
      goto LABEL_27;
    v24 = v23;
    v35 = v22;
    v25 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "managedObjectModel"), "entitiesByName"), "objectForKey:", v23);
    if (v25)
    {
      v26 = (void *)v25;
      CFRelease(v24);
      v27 = v26;
      v22 = v35;
    }
    else
    {
      v28 = (_QWORD *)objc_msgSend(a1, "persistentStoreCoordinator");
      if (v28)
        v28 = (_QWORD *)v28[12];
      v27 = -[_PFModelMap ancillaryEntityWithName:](v28, (uint64_t)v24);
      CFRelease(v24);
      if (!v27)
        goto LABEL_27;
    }
    v29 = v22 + 2;
    if (v22 + 2 > a3)
    {
LABEL_27:
      v8 = 0;
      v10 = 134060;
      goto LABEL_28;
    }
    v30 = v20[v22 + 1];
    v31 = &v20[v29];
    v32 = (char *)(__s1 - &v20[v29] + a3);
    if (v30 == 116)
    {
      v33 = CFStringCreateWithBytesNoCopy(v11, (const UInt8 *)&v20[v29], (CFIndex)v32, 0x8000100u, 0, v12);
      v8 = -[NSTemporaryObjectID initWithEntity:andUUIDString:]([NSTemporaryObjectID alloc], "initWithEntity:andUUIDString:", v27, v33);
      if (v33)
        CFRelease(v33);
      v10 = 134060;
      if (v34)
        -[NSTemporaryObjectID _setPersistentStore:](v8, "_setPersistentStore:");
    }
    else
    {
      v8 = 0;
      v10 = 134060;
      if (v30 == 112 && v34)
        v8 = (NSTemporaryObjectID *)objc_msgSend((id)-[__CFString objectIDFactoryForEntity:](v34, "objectIDFactoryForEntity:", v27), "managedObjectIDFromUTF8String:length:", v31, v32);
    }
  }
LABEL_28:
  if (a4 && !v8)
  {
LABEL_30:
    v8 = 0;
    *a4 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], v10, 0, v34);
  }
LABEL_31:
  if (v36[3] && v13)
    CFRelease(v13);
  return v8;
}

- (void)_persistentStoreForIdentifier:(uint64_t)a1
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (!a1)
    return 0;
  v3 = -[NSPersistentStoreCoordinator _retainedPersistentStores](a1);
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    while (1)
    {
      v7 = (void *)objc_msgSend(v3, "objectAtIndex:", v6);
      if (objc_msgSend((id)objc_msgSend(v7, "identifier"), "isEqual:", a2))
        break;
      if (v5 == ++v6)
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    v7 = 0;
  }

  return v7;
}

- (void)managedObjectContextDidUnregisterObjectsWithIDs:(id)a3 generation:(id)a4
{
  uint64_t v7;
  NSObject *dispatchQueue;
  _QWORD *v9;
  _QWORD v10[8];
  _QWORD v11[5];
  _QWORD *v12;

  v7 = objc_msgSend(a3, "count");
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3052000000;
  v11[3] = __Block_byref_object_copy__18;
  v11[4] = __Block_byref_object_dispose__18;
  v12 = 0;
  v12 = -[NSPersistentStoreCoordinator _retainedPersistentStores]((uint64_t)self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __111__NSPersistentStoreCoordinator__NSInternalMethods__managedObjectContextDidUnregisterObjectsWithIDs_generation___block_invoke;
  v10[3] = &unk_1E1EDECD8;
  v10[6] = v11;
  v10[7] = v7;
  v10[4] = a3;
  v10[5] = a4;
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    v9 = malloc_type_malloc(0x28uLL, 0x80040B8603338uLL);
    *v9 = _Block_copy(v10);
    v9[1] = CFRetain(self);
    v9[2] = 8199;
    v9[3] = 0;
    v9[4] = 0;
    dispatch_async_f(dispatchQueue, v9, (dispatch_function_t)internalBlockToNSPersistentStoreCoordinatorPerform);
  }
  _Block_object_dispose(v11, 8);
}

- (NSPersistentStoreCoordinator)retain
{
  int *p_cd_rc;
  int v3;

  p_cd_rc = &self->_cd_rc;
  do
    v3 = __ldaxr((unsigned int *)p_cd_rc);
  while (__stlxr(v3 + 2, (unsigned int *)p_cd_rc));
  if (v3 <= -3)
    __break(1u);
  return self;
}

- (_QWORD)_retainedPersistentStores
{
  _QWORD *v1;
  os_unfair_lock_s *v2;
  _QWORD *v3;

  v1 = (_QWORD *)a1;
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock_with_options();
    v1 = (_QWORD *)v1[6];
    v3 = v1;
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

id __110__NSPersistentStoreCoordinator__NSInternalMethods__newValueForRelationship_forObjectWithID_withContext_error___block_invoke(uint64_t a1, void *a2)
{
  id result;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  if (a2
    && !-[NSPersistentStoreCoordinator _canRouteToStore:forContext:](*(_QWORD *)(a1 + 32), a2, *(void **)(a1 + 40)))
  {
    v6[0] = CFSTR("Reason");
    v6[1] = CFSTR("store");
    v7[0] = CFSTR("Store is not valid for this context's generation");
    v7[1] = a2;
    v6[2] = CFSTR("context");
    v7[2] = *(_QWORD *)(a1 + 40);
    v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
    result = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v5);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = result;
  }
  else
  {
    if ((objc_msgSend(*(id *)(a1 + 48), "isTransient") & 1) != 0)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = NSArray_EmptyArray;
    else
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = objc_msgSend(a2, "newValueForRelationship:forObjectWithID:withContext:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  }
  return result;
}

- (id)newValueForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  uint64_t v11;
  uint64_t v12;
  NSQueryGenerationToken *v13;
  id v14;
  void *v15;
  void *v16;
  id v18;
  char v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  _QWORD v29[10];
  void *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  uint64_t v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v37 = 0;
  v38 = &v37;
  v39 = 0x3052000000;
  v40 = __Block_byref_object_copy__18;
  v41 = __Block_byref_object_dispose__18;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3052000000;
  v34 = __Block_byref_object_copy__18;
  v35 = __Block_byref_object_dispose__18;
  v36 = 0;
  if (a5 && _PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)a5, a2);
  v11 = objc_msgSend(a4, "persistentStore");
  v30 = 0;
  if (a5)
    v12 = *((_QWORD *)a5 + 22);
  else
    v12 = 0;
  v13 = +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken");
  if (v13 != (NSQueryGenerationToken *)objc_msgSend(a5, "_queryGenerationToken"))
    goto LABEL_7;
  v18 = -[NSPersistentStoreCoordinator _retainedCurrentQueryGeneration:](self, "_retainedCurrentQueryGeneration:", v12);
  if (!v18)
  {
    v20 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134502, 0);
    v30 = v20;
    if (!v20)
    {
LABEL_15:
      v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
      v28 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v44 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
        v45 = 1024;
        v46 = 4615;
        _os_log_fault_impl(&dword_18A253000, v28, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
      goto LABEL_20;
    }
LABEL_18:
    if (a6)
    {
      v16 = 0;
      *a6 = v20;
      goto LABEL_11;
    }
LABEL_20:
    v16 = 0;
    goto LABEL_11;
  }
  v19 = objc_msgSend(a5, "_setQueryGenerationFromToken:error:", v18, &v30);

  if ((v19 & 1) == 0)
  {
    v20 = v30;
    if (!v30)
      goto LABEL_15;
    goto LABEL_18;
  }
LABEL_7:
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __110__NSPersistentStoreCoordinator__NSInternalMethods__newValueForRelationship_forObjectWithID_withContext_error___block_invoke;
  v29[3] = &unk_1E1EDEC60;
  v29[4] = self;
  v29[5] = a5;
  v29[6] = a3;
  v29[7] = a4;
  v29[8] = &v37;
  v29[9] = &v31;
  -[NSPersistentStoreCoordinator _routeLightweightBlock:toStore:]((uint64_t)self, (uint64_t)v29, v11);
  v14 = (id)v32[5];
  if (a6)
  {
    v15 = (void *)v32[5];
    if (v15)
      *a6 = v15;
  }
  v16 = (void *)v38[5];
LABEL_11:
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
  return v16;
}

- (void)_conflictsWithRowCacheForObject:(_DWORD *)a1 withContext:(_QWORD *)a2 andStore:(void *)a3
{
  uint64_t v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a1, "objectID");
  v7 = objc_msgSend(a1, "_versionReference");
  if (objc_msgSend(a1, "isFault"))
    -[NSFaultHandler fulfillFault:withContext:]((id)_insertion_fault_handler, a1, (uint64_t)a2);
  v20 = 0;
  v8 = (void *)objc_msgSend(a3, "newValuesForObjectWithID:withContext:error:", v6, a2, &v20);
  v9 = v8;
  if (v8)
  {
    if (v7 >= objc_msgSend(v8, "_versionNumber"))
    {
      v13 = 0;
      goto LABEL_12;
    }
    v10 = a1;
    v11 = (unint64_t)v9;
  }
  else
  {
    if (v20)
    {
      v12 = (void *)objc_msgSend(v20, "domain");
      if (!objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB28A8])
        || objc_msgSend(v20, "code") != 133000)
      {
        v16 = *MEMORY[0x1E0C99778];
        v17 = objc_msgSend(v20, "code");
        v18 = *MEMORY[0x1E0CB3388];
        v23[0] = v20;
        v22[0] = v18;
        v22[1] = CFSTR("NSAffectedObjectsErrorKey");
        v21 = v6;
        v23[1] = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
        v19 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v16, v17, (uint64_t)CFSTR("An error occurred while trying to fetch a row for conflict detection."), (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2));
        -[_NSCoreDataException _setDomain:]((uint64_t)v19, (void *)objc_msgSend(v20, "domain"));
        objc_exception_throw(v19);
      }
    }
    v10 = a1;
    v11 = 0;
  }
  v13 = (void *)-[NSPersistentStoreCoordinator _newConflictRecordForObject:andOriginalRow:withContext:](v10, v11, a2);
  v14 = v13;
LABEL_12:

  return v13;
}

- (void)replaceResultTypeOfRequestIfNecessary:(unsigned __int8 *)a3 store:(uint64_t)a4 requestType:(_QWORD *)a5 originalResultType:
{
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1
    && objc_msgSend((id)objc_msgSend(a3, "type"), "isEqualToString:", CFSTR("SQLite"))
    && objc_msgSend(a3, "coreSpotlightExporter"))
  {
    if (a3)
      v9 = (a3[193] >> 2) & 1;
    else
      LOBYTE(v9) = 0;
    if ((unint64_t)(a4 - 8) >= 0xFFFFFFFFFFFFFFFDLL && (v9 & 1) == 0)
    {
      if (a4 == 7 || a4 == 6 || a4 == 5)
      {
        *a5 = objc_msgSend(a2, "resultType");
        objc_msgSend(a2, "setResultType:", 1);
      }
      else
      {
        v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Unknown Batch Request with CoreSpotlight Exporter: %lu");
        _NSCoreDataLog(17, v10, v11, v12, v13, v14, v15, v16, a4);
        v17 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          v19 = a4;
          _os_log_fault_impl(&dword_18A253000, v17, OS_LOG_TYPE_FAULT, "CoreData: Unknown Batch Request with CoreSpotlight Exporter: %lu", buf, 0xCu);
        }
      }
    }
  }
}

- (NSPersistentStoreCoordinator)initWithManagedObjectModel:(NSManagedObjectModel *)model
{
  NSPersistentStoreCoordinator *v5;
  void *v6;
  NSString *v7;
  _persistentStoreCoordinatorFlags flags;
  NSObject *v9;
  NSObject *v10;
  objc_super v12;
  char __str[512];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  objc_opt_class();
  v12.receiver = self;
  v12.super_class = (Class)NSPersistentStoreCoordinator;
  v5 = -[NSPersistentStoreCoordinator init](&v12, sel_init);
  if (v5)
  {
    if (!model)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot create an NSPersistentStoreCoordinator with a nil model"), 0));
    v6 = (void *)MEMORY[0x18D76B4E4]();
    v5->_persistentStores = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    v5->_miniLock._os_unfair_lock_opaque = 0;
    v5->_managedObjectModel = model;
    __str[0] = 0;
    v7 = -[NSPersistentStoreCoordinator name](v5, "name");
    if (v7)
    {
      snprintf(__str, 0x1FFuLL, "NSPersistentStoreCoordinator %p: ", v5);
      -[NSString UTF8String](v7, "UTF8String");
      __strlcat_chk();
    }
    else
    {
      snprintf(__str, 0x1FFuLL, "NSPersistentStoreCoordinator %p", v5);
    }
    flags = v5->_flags;
    if ((*(unsigned int *)&flags >> 3))
      v9 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)(*(unsigned int *)&flags >> 3), 0);
    else
      v9 = 0;
    v10 = dispatch_queue_create(__str, v9);
    dispatch_set_context(v10, v5);
    v5->_dispatchQueue = v10;
    -[NSManagedObjectModel _setIsEditable:](v5->_managedObjectModel, "_setIsEditable:", 0);
    *(_DWORD *)&v5->_flags |= 2u;
    v5->_modelMap = (_PFModelMap *)-[_PFModelMap initWithClientModel:]([_PFModelMap alloc], model);
    objc_autoreleasePoolPop(v6);
  }
  return v5;
}

- (NSString)name
{
  void *v2;
  NSString *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__18;
  v10 = __Block_byref_object_dispose__18;
  v11 = 0;
  if (self->_dispatchQueue)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __36__NSPersistentStoreCoordinator_name__block_invoke;
    v5[3] = &unk_1E1EDD618;
    v5[4] = self;
    v5[5] = &v6;
    -[NSPersistentStoreCoordinator performBlockAndWait:](self, "performBlockAndWait:", v5);
    v2 = (void *)v7[5];
  }
  else
  {
    v2 = (void *)-[NSString copy](self->_queueLabel, "copy");
    v7[5] = (uint64_t)v2;
  }
  v3 = v2;
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)performBlockAndWait:(void *)block
{
  NSObject *dispatchQueue;
  NSPersistentStoreCoordinator *v4;
  NSPersistentStoreCoordinator *v5;
  NSPersistentStoreCoordinator *v6;
  NSPersistentStoreCoordinator *v7;
  NSPersistentStoreCoordinator *v8;
  id v9;
  id v10;
  _QWORD v11[2];
  uint64_t v12;
  NSPersistentStoreCoordinator *v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  dispatchQueue = self->_dispatchQueue;
  if (!dispatchQueue)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can only use -performBlockAndWait: on an NSPersistentStoreCoordinator that was created with a queue."), 0));
  v4 = *(NSPersistentStoreCoordinator **)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 712);
  v11[0] = block;
  v11[1] = self;
  v12 = 8196;
  v13 = v4;
  v14 = 0;
  if (v4)
  {
    v5 = 0;
    __dmb(0xBu);
    v6 = v4;
    while (v6 != self && v6 != v5)
    {
      if (!v5)
        v5 = v6;
      v6 = (NSPersistentStoreCoordinator *)v6->_queueOwner;
      if (!v6)
      {
        v7 = 0;
        __dmb(0xBu);
        v8 = self;
        while (v8 != v4 && v8 != v7)
        {
          if (!v7)
            v7 = v8;
          v8 = (NSPersistentStoreCoordinator *)v8->_queueOwner;
          if (!v8)
          {
            dispatchQueue = self->_dispatchQueue;
            goto LABEL_16;
          }
        }
        break;
      }
    }
    gutsOfBlockToNSPersistentStoreCoordinatorPerform(v11);
  }
  else
  {
LABEL_16:
    v12 = 8196;
    dispatch_sync_f(dispatchQueue, v11, (dispatch_function_t)developerSubmittedBlockToNSPersistentStoreCoordinatorPerform);
  }
  v9 = v14;
  if (v14)
  {
    v10 = v14;
    objc_exception_throw(v9);
  }
}

- (NSArray)persistentStores
{
  os_unfair_lock_s *p_miniLock;
  NSArray *persistentStores;
  NSArray *v5;

  p_miniLock = &self->_miniLock;
  os_unfair_lock_lock_with_options();
  persistentStores = self->_persistentStores;
  v5 = persistentStores;
  os_unfair_lock_unlock(p_miniLock);
  return persistentStores;
}

- (unint64_t)retainCount
{
  return (unint64_t)(self->_cd_rc + 2) >> 1;
}

- (void)_setXPCProcessName:(uint64_t)a1
{
  os_unfair_lock_s *v4;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock_with_options();

    *(_QWORD *)(a1 + 88) = objc_msgSend(a2, "copy");
    os_unfair_lock_unlock(v4);
  }
}

- (void)_setXPCBundleIdentifier:(uint64_t)a1
{
  os_unfair_lock_s *v4;

  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 32);
    os_unfair_lock_lock_with_options();

    *(_QWORD *)(a1 + 80) = objc_msgSend(a2, "copy");
    os_unfair_lock_unlock(v4);
  }
}

uint64_t __39__NSPersistentStoreCoordinator_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  _QWORD *v10;
  const __CFString *v11;
  BOOL v12;
  uint64_t v13;
  _PFGarbageManager *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  _QWORD *v19;
  void *v20;
  const void *v21;
  void *context;
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
  const __CFString *v38;
  _QWORD *v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    v1 = a1;
    v24 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    if (-[NSPersistentStoreCoordinator _hasHistoryTracking:](*(_QWORD *)(v1 + 40), *(void **)(v1 + 32)))
      +[_PFPersistentHistoryModel resetCaches]();
    v25 = v1;
    v2 = *(void **)(*(_QWORD *)(v1 + 40) + 64);
    if (v2 || *(_QWORD *)(v1 + 32))
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v3)
      {
        v4 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v3; ++i)
          {
            if (*(_QWORD *)v35 != v4)
              objc_enumerationMutation(v2);
            -[_PFGarbageManager doCleanupForURL:]((uint64_t)+[_PFGarbageManager defaultInstance](_PFGarbageManager, "defaultInstance"), *(void **)(*((_QWORD *)&v34 + 1) + 8 * i));
          }
          v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        }
        while (v3);
      }

      *(_QWORD *)(*(_QWORD *)(v25 + 40) + 64) = 0;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v6 = *(void **)(v25 + 32);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v31;
        do
        {
          for (j = 0; j != v7; ++j)
          {
            if (*(_QWORD *)v31 != v8)
              objc_enumerationMutation(v6);
            v10 = *(_QWORD **)(*((_QWORD *)&v30 + 1) + 8 * j);
            v11 = (const __CFString *)objc_msgSend(v10, "type");
            if (v10)
              v12 = v11 == CFSTR("SQLite");
            else
              v12 = 0;
            if (v12)
            {
              v13 = v10[21];
              if (v13)
              {
                v14 = +[_PFGarbageManager defaultInstance](_PFGarbageManager, "defaultInstance");
                -[_PFGarbageManager doCleanupForURL:]((uint64_t)v14, (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v13, 1));
              }
            }
          }
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v41, 16);
        }
        while (v7);
      }
    }
    context = (void *)MEMORY[0x18D76B4E4]();
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v15 = *(void **)(v25 + 32);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v27;
      do
      {
        for (k = 0; k != v16; ++k)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(v15);
          v19 = *(_QWORD **)(*((_QWORD *)&v26 + 1) + 8 * k);
          v20 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v38 = CFSTR("removed");
          v39 = v19;
          objc_msgSend(v20, "postNotificationName:object:userInfo:", CFSTR("_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification"), 0, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
          objc_msgSend(v19, "willRemoveFromPersistentStoreCoordinator:", 0);
          if (v19 && v19[1])
            v19[1] = 0;
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
      }
      while (v16);
    }
    v21 = *(const void **)(v25 + 32);
    if (v21)
      CFRelease(v21);
    objc_autoreleasePoolPop(context);

    *(_QWORD *)(*(_QWORD *)(v25 + 40) + 72) = 0;
    *(_QWORD *)(*(_QWORD *)(v25 + 40) + 80) = 0;

    *(_QWORD *)(*(_QWORD *)(v25 + 40) + 88) = 0;
    *(_QWORD *)(*(_QWORD *)(v25 + 40) + 96) = 0;

    *(_QWORD *)(*(_QWORD *)(v25 + 40) + 40) = 0;
    objc_storeWeak((id *)(*(_QWORD *)(v25 + 40) + 104), 0);
    a1 = objc_msgSend(v24, "drain");
  }
  return MEMORY[0x18D76C0C0](a1);
}

- (uint64_t)_hasHistoryTracking:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v8 = 0u;
    v9 = 0u;
    v6 = 0u;
    v7 = 0u;
    result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    if (result)
    {
      v3 = result;
      v4 = *(_QWORD *)v7;
      while (2)
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v7 != v4)
            objc_enumerationMutation(a2);
          if (objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5), "options"), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey")))
          {
            return 1;
          }
          ++v5;
        }
        while (v3 != v5);
        result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
        v3 = result;
        if (result)
          continue;
        break;
      }
    }
  }
  return result;
}

+ (NSDictionary)metadataForPersistentStoreOfType:(NSString *)storeType URL:(NSURL *)url options:(NSDictionary *)options error:(NSError *)error
{
  NSXPCStore *v10;
  NSXPCStore *v11;
  NSDictionary *v12;
  NSDictionary *result;
  NSString *v14;
  uint64_t v15;
  void *v16;
  NSString *v17;
  off_t st_size;
  void *v19;
  void *v20;
  NSError *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  NSError *v34;
  NSError **v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  stat v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(CFSTR("NSXPCStore"), "isEqual:"))
  {
    v10 = -[NSXPCStore initWithPersistentStoreCoordinator:configurationName:URL:options:]([NSXPCStore alloc], "initWithPersistentStoreCoordinator:configurationName:URL:options:", 0, 0, url, options);
    if (v10)
    {
      v11 = v10;
      if (-[NSXPCStore loadMetadata:](v10, "loadMetadata:", error))
      {
        v12 = -[NSXPCStore metadata](v11, "metadata");

        return v12;
      }

    }
    else if (error)
    {
      NSLog((NSString *)CFSTR("Can't create store"));
      v21 = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, 0);
      result = 0;
      *error = v21;
      return result;
    }
    return 0;
  }
  if (-[NSString length](storeType, "length"))
    v14 = storeType;
  else
    v14 = 0;
  v15 = objc_opt_self();
  if (!url)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Invalid store URL: nil"), 0));
  v16 = (void *)v15;
  objc_opt_class();
  objc_opt_class();
  v35 = error;
  v36 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v41 = 0;
  if (-[NSURL isFileURL](url, "isFileURL"))
  {
    v17 = -[NSURL path](url, "path");
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "isReadableFileAtPath:", v17) & 1) == 0)
    {
      if (error)
      {
        v22 = objc_alloc(MEMORY[0x1E0C99D80]);
        v23 = (void *)objc_msgSend(v22, "initWithObjectsAndKeys:", url, *MEMORY[0x1E0CB3308], 0);
        v41 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 260, v23);
        *error = (NSError *)v41;

        v24 = 0;
        LODWORD(error) = 0;
        goto LABEL_47;
      }
      goto LABEL_44;
    }
    memset(&v42, 0, sizeof(v42));
    if (stat(-[NSString fileSystemRepresentation](v17, "fileSystemRepresentation"), &v42))
      st_size = 0;
    else
      st_size = v42.st_size;
    if (!v14)
      goto LABEL_18;
LABEL_17:
    v19 = (void *)+[NSPersistentStoreCoordinator _storeClassForStoreType:]((uint64_t)NSPersistentStoreCoordinator, (uint64_t)v14);
    if (v19)
      goto LABEL_19;
    goto LABEL_18;
  }
  st_size = 1;
  if (v14)
    goto LABEL_17;
LABEL_18:
  v19 = (void *)+[NSPersistentStoreCoordinator _classForPersistentStoreAtURL:]((uint64_t)NSPersistentStoreCoordinator, url);
LABEL_19:
  if (v19 && st_size)
  {
    v20 = (void *)((objc_opt_respondsToSelector() & 1) != 0
                 ? objc_msgSend(v19, "metadataForPersistentStoreWithURL:options:error:", url, options, &v41)
                 : objc_msgSend(v19, "metadataForPersistentStoreWithURL:error:", url, &v41));
    v24 = v20;
    if (v24)
    {
LABEL_46:
      LODWORD(error) = 1;
      goto LABEL_47;
    }
  }
  v24 = 0;
  LODWORD(error) = 1;
  if (!-[NSString length](v14, "length") && st_size)
  {
    objc_sync_enter(v16);
    v25 = (void *)objc_msgSend((id)qword_1ECD8DA70, "allKeys");
    objc_sync_exit(v16);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, &v42, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v38;
      while (2)
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v38 != v27)
            objc_enumerationMutation(v25);
          v29 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
          v41 = 0;
          v30 = (void *)+[NSPersistentStoreCoordinator _storeClassForStoreType:]((uint64_t)NSPersistentStoreCoordinator, v29);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v31 = (void *)objc_msgSend(v30, "metadataForPersistentStoreWithURL:options:error:", url, options, &v41);
          else
            v31 = (void *)objc_msgSend(v30, "metadataForPersistentStoreWithURL:error:", url, &v41);
          v24 = v31;
          if (v24)
          {
            v41 = 0;
            goto LABEL_46;
          }
        }
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, &v42, 16);
        v24 = 0;
        LODWORD(error) = 1;
        if (v26)
          continue;
        goto LABEL_47;
      }
    }
LABEL_44:
    v24 = 0;
  }
LABEL_47:
  v32 = v41;
  objc_msgSend(v36, "drain");
  v33 = v41;
  if (!(_DWORD)error)
    return 0;
  if (v35 && !v24)
  {
    v34 = (NSError *)v41;
    if (!v41)
      v34 = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134000, 0);
    *v35 = v34;
  }
  return (NSDictionary *)v24;
}

- (void)_postStoreRemoteChangeNotificationsForStore:(uint64_t)a3 andState:
{
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  _NSPersistentHistoryToken *v12;
  _NSPersistentHistoryToken *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (id)objc_msgSend(a2, "identifier");
    v8 = (id)objc_msgSend(a2, "URL");
    v9 = objc_alloc(MEMORY[0x1E0C99E08]);
    v21[0] = v7;
    v10 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v20 = CFSTR("NSStoreUUID");
    v11 = (void *)objc_msgSend(v9, "initWithObjects:forKeys:", v10, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1));
    if (!v7)
    {
      v13 = 0;
LABEL_12:

      return;
    }
    if (a3)
    {
      v12 = [_NSPersistentHistoryToken alloc];
      v13 = -[_NSPersistentHistoryToken initWithTransactionNumber:andStoreID:](v12, "initWithTransactionNumber:andStoreID:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3), v7);
      objc_msgSend(v11, "setObject:forKey:", v13, CFSTR("historyToken"));
      if (!v8)
        goto LABEL_9;
    }
    else
    {
      v13 = 0;
      if (!v8)
      {
LABEL_9:
        if (+[NSSQLCore debugDefault](NSSQLCore, "debugDefault") >= 1)
          _NSCoreDataLog(9, (uint64_t)CFSTR("Remote Change Notification - posting for store  %@ with userInfo %@"), v14, v15, v16, v17, v18, v19, (uint64_t)v7);
        objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("NSPersistentStoreRemoteChangeNotification"), a1, v11);
        goto LABEL_12;
      }
    }
    objc_msgSend(v11, "setObject:forKey:", v8, CFSTR("storeURL"));
    goto LABEL_9;
  }
}

- (_NSPersistentHistoryToken)_retainedChangeTokenFromStores:(_NSPersistentHistoryToken *)result
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  uint64_t v16;
  void *v17;
  _OWORD v18[4];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    result = (_NSPersistentHistoryToken *)objc_msgSend(a2, "count");
    if (result)
    {
      v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v4 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v25 != v6)
              objc_enumerationMutation(a2);
            v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            v9 = objc_msgSend(v8, "currentChangeToken");
            if (v9)
              objc_msgSend(v3, "setObject:forKey:", v9, objc_msgSend(v8, "identifier"));
          }
          v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
        }
        while (v5);
      }
      v23 = 0;
      if (objc_msgSend(v3, "count") == 1)
      {
        objc_msgSend(v3, "getObjects:andKeys:count:", &v23, 0, 1);
        v10 = v23;
        return (_NSPersistentHistoryToken *)v23;
      }
      else
      {
        result = (_NSPersistentHistoryToken *)objc_msgSend(v3, "count");
        if (result)
        {
          v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v12 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v20;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v20 != v14)
                  objc_enumerationMutation(v3);
                v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j);
                v17 = (void *)objc_msgSend(v3, "objectForKey:", v16);
                memset(v18, 0, sizeof(v18));
                if (objc_msgSend((id)objc_msgSend(v17, "storeTokens", 0), "countByEnumeratingWithState:objects:count:", v18, v28, 16))
                {
                  objc_msgSend(v11, "setObject:forKey:", objc_msgSend((id)objc_msgSend(v17, "storeTokens"), "objectForKey:", **((_QWORD **)&v18[0] + 1)), v16);
                }
              }
              v13 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
            }
            while (v13);
          }
          return -[_NSPersistentHistoryToken initWithDictionary:]([_NSPersistentHistoryToken alloc], "initWithDictionary:", v11);
        }
      }
    }
  }
  return result;
}

+ (void)initialize
{
  void *v3;

  objc_opt_self();
  if ((id)objc_opt_class() == a1)
  {
    v3 = (void *)objc_opt_self();
    objc_msgSend(v3, "_registerCoreDataStoreClass:forStoreType:", objc_opt_class(), CFSTR("SQLite"));
    objc_msgSend(v3, "_registerCoreDataStoreClass:forStoreType:", objc_opt_class(), CFSTR("Binary"));
    objc_msgSend(v3, "_registerCoreDataStoreClass:forStoreType:", objc_opt_class(), CFSTR("InMemory"));
    objc_msgSend(v3, "_registerCoreDataStoreClass:forStoreType:", objc_opt_class(), CFSTR("NSXPCStore"));
  }
}

+ (void)_registerCoreDataStoreClass:(Class)a3 forStoreType:(id)a4
{
  uint64_t v6;

  if (!qword_1ECD8DA68)
    qword_1ECD8DA68 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 5);
  v6 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3);
  objc_msgSend((id)qword_1ECD8DA68, "setObject:forKey:", v6, a4);
}

id __59__NSPersistentStoreCoordinator_metadataForPersistentStore___block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = objc_msgSend(a2, "metadata");
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
}

- (NSPersistentStore)addPersistentStoreWithType:(NSString *)storeType configuration:(NSString *)configuration URL:(NSURL *)storeURL options:(NSDictionary *)options error:(NSError *)error
{
  NSManagedObjectModel *v13;
  int v14;
  char v15;
  id v16;
  uint64_t v17;
  id v18;
  NSString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSDictionary *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  id v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSPersistentStore *v66;
  uint64_t v68;
  uint64_t v69;
  _QWORD v70[6];
  _QWORD v71[6];
  _QWORD v72[13];
  char v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  void (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  void (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  void (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  NSString *v91;

  v86 = 0;
  v87 = &v86;
  v88 = 0x3052000000;
  v89 = __Block_byref_object_copy__18;
  v90 = __Block_byref_object_dispose__18;
  v91 = configuration;
  v80 = 0;
  v81 = &v80;
  v82 = 0x3052000000;
  v83 = __Block_byref_object_copy__18;
  v84 = __Block_byref_object_dispose__18;
  v85 = 0;
  v74 = 0;
  v75 = &v74;
  v76 = 0x3052000000;
  v77 = __Block_byref_object_copy__18;
  v78 = __Block_byref_object_dispose__18;
  v79 = 0;
  v13 = -[NSPersistentStoreCoordinator managedObjectModel](self, "managedObjectModel");
  v14 = objc_msgSend(-[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("NSPersistentStoreForceLightweightMigrationOption")), "BOOLValue");
  v15 = v14;
  if (v14)
  {
    v16 = (id)-[NSDictionary mutableCopy](options, "mutableCopy");
    objc_msgSend(v16, "removeObjectForKey:", CFSTR("NSPersistentStoreForceLightweightMigrationOption"));
    options = (NSDictionary *)(id)objc_msgSend(v16, "copy");
  }
  v17 = MEMORY[0x1E0C809B0];
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __91__NSPersistentStoreCoordinator_addPersistentStoreWithType_configuration_URL_options_error___block_invoke;
  v72[3] = &unk_1E1EDEA98;
  v72[4] = options;
  v72[5] = self;
  v72[6] = storeType;
  v72[7] = storeURL;
  v72[8] = v13;
  v72[9] = &v74;
  v72[10] = &v86;
  v72[11] = &v80;
  v72[12] = error;
  v73 = v15;
  _perform_0((uint64_t)self, (uint64_t)v72);
  v18 = (id)v81[5];
  if (v75[5])
  {
    v19 = NSStringFromSelector(a2);
    objc_msgSend((id)v75[5], "domain");
    objc_msgSend((id)v75[5], "code");
    _NSCoreDataLog(1, (uint64_t)CFSTR("%@ returned error %@ (%ld)"), v20, v21, v22, v23, v24, v25, (uint64_t)v19);
    if (objc_msgSend((id)objc_msgSend((id)v75[5], "userInfo"), "count"))
    {
      _NSCoreDataLog(1, (uint64_t)CFSTR("userInfo:"), v26, v27, v28, v29, v30, v31, v69);
      objc_msgSend((id)objc_msgSend((id)v75[5], "userInfo"), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_311);
    }
    _NSCoreDataLog(1, (uint64_t)CFSTR("storeType: %@"), v26, v27, v28, v29, v30, v31, (uint64_t)storeType);
    _NSCoreDataLog(1, (uint64_t)CFSTR("configuration: %@"), v32, v33, v34, v35, v36, v37, v87[5]);
    _NSCoreDataLog(1, (uint64_t)CFSTR("URL: %@"), v38, v39, v40, v41, v42, v43, (uint64_t)storeURL);
    if (-[NSDictionary count](options, "count"))
    {
      _NSCoreDataLog(4, (uint64_t)CFSTR("options:"), v44, v45, v46, v47, v48, v49, v68);
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](options, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_322);
    }
    if (objc_msgSend((id)v75[5], "code") == 134130 || objc_msgSend((id)v75[5], "code") == 134020)
    {
      v50 = -[NSManagedObjectModel entityVersionHashesByName](-[NSPersistentStoreCoordinator managedObjectModel](self, "managedObjectModel"), "entityVersionHashesByName");
      _NSCoreDataLog(1, (uint64_t)CFSTR("NSPersistentStoreCoordinator's current model hashes are %@"), v51, v52, v53, v54, v55, v56, (uint64_t)v50);
    }
    v57 = (void *)v75[5];
    if (error)
    {
      *error = (NSError *)v57;
    }
    else
    {

      v75[5] = 0;
    }
  }
  if (v81[5])
  {
    v58 = -[NSDictionary valueForKey:](options, "valueForKey:", CFSTR("NSCoreDataCoreSpotlightExporter"));
    if (v58)
      -[NSCoreDataCoreSpotlightDelegate _initializePersistentStore]((uint64_t)v58);
    if (objc_msgSend((id)objc_msgSend((id)v81[5], "type"), "isEqualToString:", CFSTR("SQLite")))
      -[NSSQLCore _initializeQueryGenerationConnectionForProtectionClasses]((_QWORD *)v81[5]);
    if ((objc_msgSend((id)v81[5], "isReadOnly") & 1) == 0
      && objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v81[5], "metadata"), "objectForKey:", CFSTR("NSPersistentStoreRebuildIndicies")), "BOOLValue"))
    {
      v59 = getprogname();
      if (v59 && (!strncmp("assetsd", v59, 7uLL) || !strncmp("photolibraryd", v59, 0xDuLL)))
      {
        v71[0] = v17;
        v71[1] = 3221225472;
        v71[2] = __91__NSPersistentStoreCoordinator_addPersistentStoreWithType_configuration_URL_options_error___block_invoke_4;
        v71[3] = &unk_1E1EDD0E0;
        v71[4] = self;
        v71[5] = &v80;
        -[NSPersistentStoreCoordinator performBlockAndWait:](self, "performBlockAndWait:", v71);
      }
      else if (-[NSDictionary valueForKey:](options, "valueForKey:", CFSTR("NSPersistentStoreCoordinatorIsMigratingStoreWithStagedMigrationOptionKey")))
      {
        _NSCoreDataLog(4, (uint64_t)CFSTR("Deferring index repair until after migration is complete (NSPersistentStoreCoordinatorIsMigratingStoreWithStagedMigrationOptionKey is set)."), v60, v61, v62, v63, v64, v65, v68);
      }
      else
      {
        v70[0] = v17;
        v70[1] = 3221225472;
        v70[2] = __91__NSPersistentStoreCoordinator_addPersistentStoreWithType_configuration_URL_options_error___block_invoke_5;
        v70[3] = &unk_1E1EDD0E0;
        v70[4] = self;
        v70[5] = &v80;
        -[NSPersistentStoreCoordinator performBlock:](self, "performBlock:", v70);
      }
    }
  }
  v66 = (NSPersistentStore *)v81[5];
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v86, 8);
  return v66;
}

void __91__NSPersistentStoreCoordinator_addPersistentStoreWithType_configuration_URL_options_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  uint64_t v31;
  objc_class *v32;
  NSString *v33;
  objc_class *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  NSString *v44;
  objc_class *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  objc_class *v51;
  NSString *v52;
  objc_class *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  id v63;
  void *v64;
  uint64_t actualStoreFileURL;
  void *v66;
  uint64_t v67;
  void *v68;
  objc_class *v69;
  char v70;
  char v71;
  int v72;
  unsigned __int8 *v73;
  uint64_t v74;
  char v75;
  uint64_t v76;
  void *v77;
  uint64_t *v78;
  void *v79;
  id v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  id v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  void *v94;
  char v95;
  char v96;
  const __CFString *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  void *v112;
  NSPersistentStoreCoordinatorMigrationContext *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  uint64_t *v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v124;
  id v125;
  uint64_t v126;
  void *v127;
  id v128;
  uint64_t v129;
  void *v130;
  void *v131;
  uint64_t v132;
  void *v133;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  PFUbiquitySetupAssistant *v141;
  id obj;
  id v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  uint64_t v161;
  uint64_t v162;
  uint8_t v163[128];
  uint8_t v164[4];
  const char *v165;
  __int16 v166;
  int v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  uint64_t v172[16];
  id v173[16];
  _BYTE buf[12];
  __int16 v175;
  int v176;
  uint64_t v177;

  v177 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey"))
    || objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("NSPersistentStoreRemoveUbiquitousMetadataOption")))
  {
    v141 = -[PFUbiquitySetupAssistant initWithPersistentStoreCoordinator:andStoreOptions:forPersistentStoreOfType:atURL:]([PFUbiquitySetupAssistant alloc], "initWithPersistentStoreCoordinator:andStoreOptions:forPersistentStoreOfType:atURL:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    if ((-[PFUbiquitySetupAssistant validateOptionsWithError:]((uint64_t)v141, (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)) & 1) == 0)
    {
      v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      if (v2)
      {
        v3 = *(_QWORD **)(a1 + 96);
        if (v3)
          *v3 = v2;
      }
      else
      {
        v4 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v4, v5, v6, v7, v8, v9, v10, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
        v11 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
          v175 = 1024;
          v176 = 1490;
          _os_log_fault_impl(&dword_18A253000, v11, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
      v12 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);

      return;
    }
  }
  else
  {
    v141 = 0;
  }
  v147 = 0u;
  v148 = 0u;
  v145 = 0u;
  v146 = 0u;
  v13 = objc_msgSend(&unk_1E1F523B0, "countByEnumeratingWithState:objects:count:", &v145, v163, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v146;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v146 != v14)
          objc_enumerationMutation(&unk_1E1F523B0);
        v16 = *(_QWORD *)(*((_QWORD *)&v145 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v16))
        {
          v43 = (void *)MEMORY[0x1E0CB3940];
          v44 = NSStringFromSelector(sel_setOption_forMirroringKey_);
          v45 = (objc_class *)objc_opt_class();
          v46 = objc_msgSend(v43, "stringWithFormat:", CFSTR("%@ is only valid as a mirroring option. It should be set using '%@' on '%@'"), v16, v44, NSStringFromClass(v45));
          v47 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v161 = *MEMORY[0x1E0CB2D68];
          v162 = v46;
          v48 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v162, &v161, 1);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = objc_msgSend(v47, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v48);
          return;
        }
      }
      v13 = objc_msgSend(&unk_1E1F523B0, "countByEnumeratingWithState:objects:count:", &v145, v163, 16);
    }
    while (v13);
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey")))
  {
LABEL_63:
    v173[0] = 0;
    v64 = *(void **)(a1 + 48);
    actualStoreFileURL = *(_QWORD *)(a1 + 56);
    v172[0] = 0;
    v66 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, (uint64_t)CFSTR("CoreData: Adding persistent store"), v172);
    if (v64)
      goto LABEL_68;
    if (*(_QWORD *)(a1 + 40))
    {
      v64 = *(void **)(a1 + 48);
      v67 = *(_QWORD *)(a1 + 32);
      *(_QWORD *)buf = 0;
      v68 = (void *)objc_msgSend((id)objc_opt_class(), "metadataForPersistentStoreOfType:URL:options:error:", v64, actualStoreFileURL, v67, buf);
      if (v68)
      {
        v64 = (void *)objc_msgSend(v68, "objectForKey:", CFSTR("NSStoreType"));
      }
      else
      {
        v87 = (void *)objc_msgSend(*(id *)buf, "domain");
        if (!objc_msgSend(v87, "isEqualToString:", *MEMORY[0x1E0CB28A8])
          || objc_msgSend(*(id *)buf, "code") != 4 && objc_msgSend(*(id *)buf, "code") != 260)
        {
          v88 = *(id *)buf;
          v173[0] = *(id *)buf;
LABEL_103:
          if (!v88)
            v88 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134000, &unk_1E1F4AC28);
          v77 = 0;
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = v88;
          goto LABEL_179;
        }
      }
      if (v64)
      {
LABEL_68:
        v69 = (objc_class *)+[NSPersistentStoreCoordinator _storeClassForStoreType:]((uint64_t)NSPersistentStoreCoordinator, (uint64_t)v64);
        if (!v69)
          objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Unsupported store type."), 0));
        v70 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("NSIgnorePersistentStoreVersioningOption")), "BOOLValue");
        if ((_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88)
          v71 = v70;
        else
          v71 = 1;
        if ((v71 & 1) != 0)
          v72 = 0;
        else
          v72 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("NSMigratePersistentStoresAutomaticallyOption")), "BOOLValue");
        if (v141 && v141->_ubiquityEnabled)
          actualStoreFileURL = (uint64_t)v141->_actualStoreFileURL;
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40)
          && objc_msgSend(CFSTR("Default"), "isEqual:")
          && !objc_msgSend(*(id *)(a1 + 64), "entitiesForConfiguration:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40)))
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) = 0;
        }
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40) = objc_msgSend(objc_allocWithZone(v69), "initWithPersistentStoreCoordinator:configurationName:URL:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80)+ 8)+ 40), actualStoreFileURL, *(_QWORD *)(a1 + 32));
        v73 = *(unsigned __int8 **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
        if (v73)
          v74 = (v73[56] >> 2) & 1;
        else
          v74 = 0;
        v75 = objc_msgSend(v73, "loadMetadata:", v173);
        v76 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
        v77 = *(void **)(v76 + 40);
        if ((v75 & 1) == 0)
        {
          if (v77)
          {
            *(_QWORD *)(v76 + 40) = 0;
          }
          else if (!v173[0])
          {
            v85 = (void *)MEMORY[0x1E0CB35C8];
            v86 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Unable to initialize store."), CFSTR("reason"), 0);
            v173[0] = (id)objc_msgSend(v85, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v86);
          }
          if (*(_QWORD *)(a1 + 96))
            *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = v173[0];
          goto LABEL_179;
        }
        objc_msgSend(*(id *)(v76 + 40), "_didLoadMetadata");
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "_setMetadataDirty:", v74);
        v77 = 0;
        v78 = (uint64_t *)(a1 + 88);
        v79 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
        if (v79)
        {
          v80 = (id)objc_msgSend((id)objc_msgSend(v79, "metadata"), "copy");
          v81 = v80;
          if (!v80 && *(_QWORD *)(a1 + 96))
          {
            v92 = (void *)MEMORY[0x1E0CB35C8];
            v93 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("Can't read store metadata."), CFSTR("reason"), 0);
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = objc_msgSend(v92, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v93);
            v91 = *(_QWORD *)(a1 + 88);
LABEL_111:
            v82 = *(_QWORD *)(v91 + 8);
            if (*(_QWORD *)(v82 + 40))
              v77 = *(void **)(v82 + 40);
            goto LABEL_154;
          }
          if ((objc_msgSend(v64, "isEqual:", objc_msgSend(v80, "objectForKey:", CFSTR("NSStoreType"))) & 1) == 0)
          {
            if (*(_QWORD *)(a1 + 96))
            {
              v89 = (void *)MEMORY[0x1E0CB35C8];
              v90 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("The store type in the metadata does not match the specified store type."), CFSTR("reason"), v81, CFSTR("metadata"), 0);
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = objc_msgSend(v89, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134010, v90);
            }
            v91 = *v78;
            goto LABEL_111;
          }
          if ((v71 & 1) == 0)
          {
            v94 = (void *)objc_msgSend(v81, "objectForKey:", CFSTR("NSStoreModelVersionHashesVersion"));
            if (objc_msgSend(v94, "intValue") >= 4)
            {
              if (*(_QWORD *)(a1 + 96))
              {
                v114 = (void *)MEMORY[0x1E0CB35C8];
                v115 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("The version hash version (and associated hashes) are incompatible with the current Core Data version."), CFSTR("reason"), v81, CFSTR("metadata"), 0);
                *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = objc_msgSend(v114, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134100, v115);
              }
              v82 = *(_QWORD *)(*v78 + 8);
              v116 = *(void **)(v82 + 40);
              if (!v116)
                goto LABEL_154;
              *(_QWORD *)(v82 + 40) = 0;
              v117 = *v78;
              goto LABEL_153;
            }
            if (v94 && objc_msgSend(v81, "objectForKey:", CFSTR("NSStoreModelVersionHashes")))
            {
              v95 = objc_msgSend(*(id *)(a1 + 64), "isConfiguration:compatibleWithStoreMetadata:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v81);
              v96 = *(_BYTE *)(a1 + 104) ? 0 : v95;
              if ((v96 & 1) == 0
                && (*(_BYTE *)(a1 + 104)
                 || (-[NSPersistentStoreCoordinator _checkForSkewedEntityHashes:metadata:](*(_QWORD *)(a1 + 40), v81) & 1) == 0
                 && (!+[_PFPersistentHistoryModel _hasTombstonesInUserInfo:]((uint64_t)_PFPersistentHistoryModel, *(void **)(a1 + 64))|| (-[NSPersistentStoreCoordinator _checkForTombstoneSkew:metadata:configuration:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 64), (uint64_t)v81, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40)) & 1) == 0)))
              {
                if (+[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel"))
                {
                  if (v72)
                    v97 = CFSTR(" ");
                  else
                    v97 = CFSTR(" NOT ");
                  objc_msgSend(*(id *)(a1 + 64), "entityVersionHashesByName");
                  _NSCoreDataLog(4, (uint64_t)CFSTR("Incompatible version schema for persistent store '%@'.  store metadata = %@ and current model versions = %@"), v98, v99, v100, v101, v102, v103, actualStoreFileURL);
                  _NSCoreDataLog(4, (uint64_t)CFSTR("(migration)\t will%@attempt automatic schema migration"), v104, v105, v106, v107, v108, v109, (uint64_t)v97);
                }
                v110 = *(_QWORD *)(*v78 + 8);
                v111 = *(void **)(v110 + 40);
                if (v111)
                {
                  *(_QWORD *)(v110 + 40) = 0;
                  v77 = v111;
                }
                if (v72)
                {
                  v112 = (void *)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
                  objc_msgSend(v112, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("NSPersistentStoreCoordinatorIsMigratingStoreWithStagedMigrationOptionKey"));
                  v113 = -[NSPersistentStoreCoordinatorMigrationContext initWithStoreURL:type:options:]([NSPersistentStoreCoordinatorMigrationContext alloc], "initWithStoreURL:type:options:", actualStoreFileURL, v64, v112);

                  -[NSPersistentStoreCoordinatorMigrationContext setConfigurationName:](v113, "setConfigurationName:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
                  -[NSPersistentStoreCoordinatorMigrationContext setDestinationConfigurationForCloudKitValidation:](v113, "setDestinationConfigurationForCloudKitValidation:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
                  -[NSPersistentStoreCoordinatorMigrationContext setMetadata:](v113, "setMetadata:", v81);
                  -[NSPersistentStoreCoordinatorMigrationContext setForceMigration:](v113, "setForceMigration:", *(unsigned __int8 *)(a1 + 104));
                  -[NSPersistentStoreCoordinatorMigrationContext setUbiquitySetupAssistant:](v113, "setUbiquitySetupAssistant:", v141);
                  if (-[NSPersistentStoreCoordinator migrateStoreWithContext:error:](*(_QWORD *)(a1 + 40), v113, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40)))*(_QWORD *)(*(_QWORD *)(*v78 + 8) + 40) = -[NSPersistentStoreCoordinatorMigrationContext migratedStore](v113, "migratedStore");

                  goto LABEL_179;
                }
                if (*(_QWORD *)(a1 + 96))
                {
                  v122 = (void *)MEMORY[0x1E0CB35C8];
                  v123 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("The model used to open the store is incompatible with the one used to create the store"), CFSTR("reason"), v81, CFSTR("metadata"), 0);
                  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = objc_msgSend(v122, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134100, v123);
                }
                v82 = *(_QWORD *)(*v78 + 8);
                goto LABEL_154;
              }
            }
          }
          v82 = *(_QWORD *)(*v78 + 8);
          v83 = *(void **)(v82 + 40);
          if (!v83)
          {
            if (*(_QWORD *)(a1 + 96))
            {
              *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = v173[0];
              v82 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
            }
            goto LABEL_154;
          }
          if ((objc_msgSend(v83, "load:", v173) & 1) != 0)
          {
            -[NSPersistentStoreCoordinator _addPersistentStore:identifier:](*(_QWORD *)(a1 + 40), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "identifier"));

            -[NSPersistentStore _updateMetadata](*(_BYTE **)(*(_QWORD *)(*v78 + 8) + 40));
            objc_msgSend(*(id *)(*(_QWORD *)(*v78 + 8) + 40), "_setupObserver");
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "didAddToPersistentStoreCoordinator:", *(_QWORD *)(a1 + 40));
            v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", *(_QWORD *)(*(_QWORD *)(*v78 + 8) + 40), 0);
            -[NSPersistentStoreCoordinator _postStoresChangedNotificationsForStores:changeKey:options:](*(_QWORD *)(a1 + 40), (uint64_t)v84, (uint64_t)CFSTR("added"), *(void **)(a1 + 32));

          }
          else
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*v78 + 8) + 40), "_unload:", 0);
            v118 = *(_QWORD *)(*v78 + 8);
            v119 = *(void **)(v118 + 40);
            if (v119)
            {
              *(_QWORD *)(v118 + 40) = 0;
              v77 = v119;
            }
            if (*(_QWORD *)(a1 + 96))
              *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = v173[0];
          }
        }
        if (v141)
        {
          v120 = (uint64_t *)(a1 + 88);
          v121 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
          if (v141->_ubiquityEnabled && *(_QWORD *)(v121 + 40))
          {
            if (-[PFUbiquitySetupAssistant performCoordinatorPostStoreSetup:error:]((uint64_t)v141, *(void **)(v121 + 40), v173))
            {
              if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 3))
              {
                NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Post store setup succeded. %@"), "-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:]_block_invoke", 1858, *(_QWORD *)(*(_QWORD *)(*v120 + 8) + 40));
              }
              goto LABEL_179;
            }
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  An error occurred while setting up the ubiquity integration: %@\nuserInfo: %@"), "-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:]_block_invoke", 1860, v173[0], objc_msgSend(v173[0], "userInfo"));
            }
            *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = v173[0];
            -[NSPersistentStoreCoordinator _removePersistentStore:](*(_QWORD *)(a1 + 40), *(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
            v82 = *(_QWORD *)(*v120 + 8);
            v116 = *(void **)(v82 + 40);
            if (!v116)
            {
LABEL_154:
              *(_QWORD *)(v82 + 40) = 0;
LABEL_179:
              +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v172[0], v66);
              v125 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);

              if (v77)
              {
                objc_msgSend(v77, "willRemoveFromPersistentStoreCoordinator:", 0);

              }
              v126 = a1;
              v127 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
              if (v127)
              {
                v128 = v127;
                v129 = a1;
                v130 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
                if (v130 != *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
                {

                  v129 = a1;
                  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) = 0;
                }
                if (objc_msgSend(*(id *)(v129 + 56), "isFileURL"))
                {
                  v131 = (void *)MEMORY[0x1E0C99E08];
                  v132 = objc_msgSend(*(id *)(a1 + 56), "path");
                  v133 = (void *)objc_msgSend(v131, "dictionaryWithObjectsAndKeys:", v132, *MEMORY[0x1E0CB2AA0], 0);
                }
                else
                {
                  v133 = 0;
                }
                v134 = objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "userInfo"), "objectForKey:", CFSTR("NSSQLiteErrorDomain"));
                if (v134)
                {
                  if (!v133)
                    v133 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  objc_msgSend(v133, "setObject:forKey:", v134, CFSTR("NSSQLiteErrorDomain"));
                }
                v135 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "userInfo");
                v136 = *MEMORY[0x1E0CB2FE0];
                v137 = objc_msgSend(v135, "objectForKey:", *MEMORY[0x1E0CB2FE0]);
                if (v137)
                {
                  if (!v133)
                    v133 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  objc_msgSend(v133, "setObject:forKey:", v137, v136);
                }
                v138 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "domain"), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "code"), v133);
                v126 = a1;
                *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) = v138;
              }
              if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v126 + 88) + 8) + 40))
              {

                *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) = 0;
              }
              v139 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
              if (v139 && (objc_msgSend(v139, "supportsConcurrentRequestHandling") & 1) == 0)
                *(_DWORD *)(*(_QWORD *)(a1 + 40) + 24) &= ~2u;
              return;
            }
            *(_QWORD *)(v82 + 40) = 0;
            v117 = *v120;
LABEL_153:
            v82 = *(_QWORD *)(v117 + 8);
            v77 = v116;
            goto LABEL_154;
          }
        }
        else
        {
          v120 = (uint64_t *)(a1 + 88);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("NSUbiquityOptionsRemovedDuringAutomaticMigrationKey")), "BOOLValue") & 1) == 0&& objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("NSPersistentStoreRemoveUbiquitousMetadataOption")), "BOOLValue")&& (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("NSReadOnlyPersistentStoreOption")), "BOOLValue") & 1) == 0)
        {
          +[PFUbiquitySetupAssistant removeUbiquityMetadataFromStore:]((uint64_t)PFUbiquitySetupAssistant, *(void **)(*(_QWORD *)(*v120 + 8) + 40));
        }
        if (objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*v120 + 8) + 40), "metadata"), "objectForKey:", CFSTR("com.apple.coredata.ubiquity.ubiquitized")))
        {
          v124 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("NSReadOnlyPersistentStoreOption"));
          if ((!objc_msgSend(v124, "isNSNumber") || (objc_msgSend(v124, "BOOLValue") & 1) == 0)
            && (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("NSUbiquityImporterPrivateStoreKey")), "BOOLValue") & 1) == 0&& (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("NSUbiquityOptionsRemovedDuringAutomaticMigrationKey")), "BOOLValue") & 1) == 0)
          {
            if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
            {
              NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Error: A persistent store which has been previously added to a coordinator using the iCloud integration options must always be added to the coordinator with the options present in the options dictionary. If you wish to use the store without iCloud, migrate the data from the iCloud store file to a new store file in local storage. %@\nThis will be a fatal error in a future release."), "-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:]_block_invoke", 1896, objc_msgSend(*(id *)(*(_QWORD *)(*v120 + 8) + 40), "URL"));
            }
            if (HIBYTE(z9dsptsiQ80etb9782fsrs98bfdle88))
              objc_msgSend(*(id *)(*(_QWORD *)(*v120 + 8) + 40), "setReadOnly:", 1);
          }
        }
        goto LABEL_179;
      }
    }
    v88 = v173[0];
    goto LABEL_103;
  }
  v17 = a1;
  if (!*(_QWORD *)(a1 + 40))
    goto LABEL_61;
  v18 = *(void **)(a1 + 64);
  v140 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v19 = (void *)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("NSPersistentHistoryTrackingKey"));
  if (!objc_msgSend(v19, "isNSDictionary"))
  {
    if ((objc_msgSend(v19, "isNSNumber") & 1) == 0)
    {
      v49 = (void *)MEMORY[0x1E0CB35C8];
      v168 = *MEMORY[0x1E0CB2D68];
      v50 = (void *)MEMORY[0x1E0CB3940];
      v51 = (objc_class *)objc_opt_class();
      v52 = NSStringFromClass(v51);
      v53 = (objc_class *)objc_opt_class();
      v169 = objc_msgSend(v50, "stringWithFormat:", CFSTR("%@ expects an instance of %@ as its value but found: %@"), CFSTR("NSPersistentHistoryTrackingKey"), v52, NSStringFromClass(v53));
      v54 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v169, &v168, 1);
      v42 = objc_msgSend(v49, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v54);
      if (v42)
        goto LABEL_54;
      goto LABEL_59;
    }
    goto LABEL_63;
  }
  v144 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v159 = 0u;
  v160 = 0u;
  v157 = 0u;
  v158 = 0u;
  obj = (id)objc_msgSend(v18, "entities");
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v157, buf, 16);
  if (!v20)
    goto LABEL_45;
  v21 = *(_QWORD *)v158;
  do
  {
    for (j = 0; j != v20; ++j)
    {
      if (*(_QWORD *)v158 != v21)
        objc_enumerationMutation(obj);
      v23 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * j);
      v24 = (void *)objc_msgSend((id)objc_msgSend(v23, "userInfo"), "objectForKey:", CFSTR("NSPersistentHistoryTombstoneAttributes"));
      v25 = v24;
      if (!v24)
        continue;
      if (!objc_msgSend(v24, "isNSString"))
      {
        v30 = (void *)MEMORY[0x1E0CB3940];
        v31 = objc_msgSend(v23, "name");
        v32 = (objc_class *)objc_opt_class();
        v33 = NSStringFromClass(v32);
        v34 = (objc_class *)objc_opt_class();
        v35 = objc_msgSend(v30, "stringWithFormat:", CFSTR("%@ - Wrong type: %@ but should be %@"), v31, v33, NSStringFromClass(v34));
LABEL_42:
        objc_msgSend(v144, "addObject:", v35);
        continue;
      }
      if (!objc_msgSend(v25, "length"))
      {
        goto LABEL_42;
      }
      v26 = (void *)objc_msgSend(v25, "componentsSeparatedByString:", CFSTR(","));
      v155 = 0u;
      v156 = 0u;
      v153 = 0u;
      v154 = 0u;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v153, v173, 16);
      if (v27)
      {
        v28 = *(_QWORD *)v154;
        while (2)
        {
          for (k = 0; k != v27; ++k)
          {
            if (*(_QWORD *)v154 != v28)
              objc_enumerationMutation(v26);
            if (!objc_msgSend((id)objc_msgSend(v23, "attributesByName"), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v153 + 1) + 8 * k)))
            {
              v35 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - One or more unknown attributes: %@"), objc_msgSend(v23, "name"), v25);
              goto LABEL_42;
            }
          }
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v153, v173, 16);
          if (v27)
            continue;
          break;
        }
      }
    }
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v157, buf, 16);
  }
  while (v20);
LABEL_45:
  if (!objc_msgSend(v144, "count"))
  {

    goto LABEL_63;
  }
  objc_msgSend(v144, "sortUsingSelector:", sel_localizedCaseInsensitiveCompare_);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("The following entities did not have a valid configuration for %@. It should be a string of comma separated attribute names to tombstone on delete."), CFSTR("NSPersistentHistoryTombstoneAttributes"));
  v151 = 0u;
  v152 = 0u;
  v149 = 0u;
  v150 = 0u;
  v37 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v149, v172, 16);
  if (v37)
  {
    v38 = *(_QWORD *)v150;
    do
    {
      for (m = 0; m != v37; ++m)
      {
        if (*(_QWORD *)v150 != v38)
          objc_enumerationMutation(v144);
        objc_msgSend(v36, "appendFormat:", CFSTR("\n%@"), *(_QWORD *)(*((_QWORD *)&v149 + 1) + 8 * m));
      }
      v37 = objc_msgSend(v144, "countByEnumeratingWithState:objects:count:", &v149, v172, 16);
    }
    while (v37);
  }
  v40 = (void *)MEMORY[0x1E0CB35C8];
  v170 = *MEMORY[0x1E0CB2D68];
  v171 = v36;
  v41 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v171, &v170, 1);
  v42 = objc_msgSend(v40, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v41);

  if (v42)
  {
LABEL_54:
    *(_QWORD *)(v140 + 40) = v42;
    v17 = a1;
    goto LABEL_61;
  }
LABEL_59:
  v55 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
  _NSCoreDataLog(17, v55, v56, v57, v58, v59, v60, v61, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
  v62 = __pflogFaultLog;
  v17 = a1;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)v164 = 136315394;
    v165 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
    v166 = 1024;
    v167 = 6511;
    _os_log_fault_impl(&dword_18A253000, v62, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", v164, 0x12u);
  }
LABEL_61:
  v63 = *(id *)(*(_QWORD *)(*(_QWORD *)(v17 + 72) + 8) + 40);
}

+ (uint64_t)_beginPowerAssertionNamed:(_QWORD *)a3 withAssert:
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD block[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;

  v5 = objc_opt_self();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3052000000;
  v27 = __Block_byref_object_copy__18;
  v28 = __Block_byref_object_dispose__18;
  v29 = 0;
  MEMORY[0x18D76C0B4](v5);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__NSPersistentStoreCoordinator__NSInternalMethods___beginPowerAssertionNamed_withAssert___block_invoke;
  block[3] = &unk_1E1EDD108;
  block[4] = &v24;
  if (qword_1ECD8DA78 != -1)
    dispatch_once(&qword_1ECD8DA78, block);
  v6 = (id)qword_1ECD8DA80;
  if (!qword_1ECD8DA80 && _MergedGlobals_79)
  {
    if (!v25[5])
    {
LABEL_18:
      v6 = 0;
      goto LABEL_19;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = objc_msgSend((id)v25[5], sel_sharedApplication);
    else
      v6 = 0;
    v13 = objc_opt_respondsToSelector();
    if (byte_1ECD8DA61)
      _NSCoreDataLog(9, (uint64_t)CFSTR("Registration for _beginPowerAssertionNamed completed with class %p on app %p and result %@"), v7, v8, v9, v10, v11, v12, v25[5]);
    if ((v13 & 1) == 0)
    {
      v6 = (id)qword_1ECD8DA80;
      if (!qword_1ECD8DA80)
        goto LABEL_19;
      goto LABEL_14;
    }
    qword_1ECD8DA80 = (uint64_t)v6;
  }
  if (!v6)
    goto LABEL_19;
LABEL_14:
  v14 = objc_msgSend(v6, (SEL)qword_1ECD8DA88, a2, &__block_literal_global_611);
  v6 = v14;
  if (!v14)
  {
    _NSCoreDataLog(1, (uint64_t)CFSTR("Failed to acquire background task assertion for task '%@'."), v15, v16, v17, v18, v19, v20, a2);
    goto LABEL_18;
  }
  if (byte_1ECD8DA61)
    _NSCoreDataLog(9, (uint64_t)CFSTR("Successfully acquired background task assertion %d for task '%@'."), v15, v16, v17, v18, v19, v20, (uint64_t)v14);
LABEL_19:
  *a3 = v6;
  v21 = qword_1ECD8DA80;
  _Block_object_dispose(&v24, 8);
  return v21;
}

+ (void)_endPowerAssertionWithAssert:(void *)a3 andApp:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = objc_opt_self();
  MEMORY[0x18D76C0C0](v5);
  if (a2 && a3)
  {
    objc_msgSend(a3, sel_endBackgroundTask_, a2);
    if (byte_1ECD8DA61)
      _NSCoreDataLog(9, (uint64_t)CFSTR("Ended background task assertion %d."), v6, v7, v8, v9, v10, v11, a2);
  }
}

+ (uint64_t)_storeClassForStoreType:(uint64_t)a1
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_self();
  objc_sync_enter(v3);
  v4 = (void *)objc_msgSend((id)qword_1ECD8DA68, "objectForKey:", a2);
  if (!v4)
    v4 = (void *)objc_msgSend((id)qword_1ECD8DA70, "objectForKey:", a2);
  objc_sync_exit(v3);
  return objc_msgSend(v4, "pointerValue");
}

- (void)_postStoresChangedNotificationsForStores:(uint64_t)a3 changeKey:(void *)a4 options:
{
  void *v8;
  id v9;
  void *v10;
  void *v11;

  if (a1)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = objc_alloc(MEMORY[0x1E0C99D80]);
    if (!a2)
      a2 = objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v10 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", a2, a3, 0);
    if ((!a4
       || (v11 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("_NSNotifyObserversOfStoreChange"))) == 0
       || (objc_msgSend(v11, "BOOLValue") & 1) != 0)
      && (*(_BYTE *)(a1 + 25) & 8) == 0)
    {
      objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("_NSPersistentStoreCoordinatorStoresDidChangePrivateNotification"), a1, v10);
      objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("NSPersistentStoreCoordinatorStoresDidChangeNotification"), a1, v10);
    }

  }
}

- (void)_addPersistentStore:(uint64_t)a3 identifier:
{
  uint64_t v6;
  void *v7;
  const void *v8;
  id v9;

  if (a1)
  {
    v6 = objc_msgSend(a2, "URL");
    if (v6 && objc_msgSend((id)a1, "persistentStoreForURL:", v6)
      || -[NSPersistentStoreCoordinator _persistentStoreForIdentifier:](a1, a3))
    {
      v9 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99778], 134081, (uint64_t)CFSTR("Can't add the same store twice"), 0);
      objc_exception_throw(v9);
    }
    __dmb(0xBu);
    while (1)
    {
      os_unfair_lock_lock_with_options();
      v7 = *(void **)(a1 + 48);
      v8 = (const void *)objc_msgSend(v7, "arrayByAddingObject:", a2);
      CFRetain(v8);
      if (*(void **)(a1 + 48) == v7)
        break;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
      if (v8)
        CFRelease(v8);
    }
    *(_QWORD *)(a1 + 48) = v8;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
    if (v7)
      CFRelease(v7);
  }
}

- (NSPersistentStore)persistentStoreForURL:(NSURL *)URL
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSPersistentStore *v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  if (!URL)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Invalid store URL: nil"), 0));
  v4 = -[NSPersistentStoreCoordinator _retainedPersistentStores]((uint64_t)self);
  v5 = objc_msgSend(v4, "count");
  if (v5 < 1)
  {
LABEL_9:
    v8 = 0;
  }
  else
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      v8 = (NSPersistentStore *)objc_msgSend(v4, "objectAtIndex:", v7);
      if ((-[NSURL isEqual:](-[NSPersistentStore URL](v8, "URL"), "isEqual:", URL) & 1) != 0)
        break;
      v9 = -[NSDictionary objectForKey:](-[NSPersistentStore metadata](v8, "metadata"), "objectForKey:", CFSTR("PFUbiquitySetupOriginalStoreURLAbsoluteStringKey"));
      if (v9)
      {
        v10 = v9;
        if (objc_msgSend(v9, "isNSString"))
        {
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v10);
          v12 = objc_msgSend(v11, "isEqual:", URL);

          if ((v12 & 1) != 0)
            break;
        }
      }
      if (v6 == ++v7)
        goto LABEL_9;
    }
  }

  return v8;
}

void __89__NSPersistentStoreCoordinator__NSInternalMethods___beginPowerAssertionNamed_withAssert___block_invoke(uint64_t a1)
{
  const char *v2;
  Class Class;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char str[16];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  byte_1ECD8DA61 = +[_PFRoutines integerValueForOverride:]((uint64_t)_PFRoutines, (uint64_t)CFSTR("com.apple.CoreData.PowerAssertionsDebug"));
  v2 = getprogname();
  if (strcmp("chronod", v2) && strcmp("SpringBoard", v2))
  {
    Class = objc_getClass("UIApplication");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = Class;
    if (Class)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), sel_sharedApplication);
      else
        v4 = 0;
      v18 = 0;
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      *(_OWORD *)str = 0u;
      v13 = 0u;
      __strlcpy_chk();
      qword_1ECD8DA88 = (uint64_t)sel_registerName(str);
      v11 = objc_opt_respondsToSelector();
      if (byte_1ECD8DA61)
        _NSCoreDataLog(9, (uint64_t)CFSTR("Registration for _beginPowerAssertionNamed completed with class %p on app %p and result %@"), v5, v6, v7, v8, v9, v10, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
      if ((v11 & 1) != 0)
        qword_1ECD8DA80 = (uint64_t)v4;
    }
    if (!qword_1ECD8DA80 && !strcmp("Podcasts", v2))
      _MergedGlobals_79 = 1;
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)persistentStoreForIdentifier:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = -[NSPersistentStoreCoordinator _retainedPersistentStores]((uint64_t)self);
  v5 = objc_msgSend(v4, "count");
  if (v5 < 1)
  {
LABEL_5:
    v8 = 0;
  }
  else
  {
    v6 = v5;
    v7 = 0;
    while (1)
    {
      v8 = (void *)objc_msgSend(v4, "objectAtIndex:", v7);
      if (objc_msgSend((id)objc_msgSend(v8, "identifier"), "isEqual:", a3))
        break;
      if (v6 == ++v7)
        goto LABEL_5;
    }
  }

  return v8;
}

- (BOOL)_validateQueryGeneration:(id)a3 error:(id *)a4
{
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  _QWORD v19[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (+[NSQueryGenerationToken nostoresQueryGenerationToken](NSQueryGenerationToken, "nostoresQueryGenerationToken") == a3|| +[NSQueryGenerationToken unpinnedQueryGenerationToken](NSQueryGenerationToken, "unpinnedQueryGenerationToken") == a3)
  {
    return 1;
  }
  v7 = 1;
  if (+[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken") != a3)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2020000000;
    v29 = 1;
    v20 = 0;
    v21 = &v20;
    v22 = 0x3052000000;
    v23 = __Block_byref_object_copy__18;
    v24 = __Block_byref_object_dispose__18;
    v25 = 0;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __81__NSPersistentStoreCoordinator_QueryGenerations___validateQueryGeneration_error___block_invoke;
    v19[3] = &unk_1E1EDEDF0;
    v19[4] = a3;
    v19[5] = &v20;
    v19[6] = &v26;
    -[NSPersistentStoreCoordinator _routeHeavyweightBlock:]((uint64_t)self, (uint64_t)v19);
    if (!*((_BYTE *)v27 + 24))
    {
      v8 = (void *)v21[5];
      if (v8)
      {
        if (a4)
          *a4 = v8;
      }
      else
      {
        v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
        _NSCoreDataLog(17, v9, v10, v11, v12, v13, v14, v15, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
        v16 = __pflogFaultLog;
        if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v31 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
          v32 = 1024;
          v33 = 6271;
          _os_log_fault_impl(&dword_18A253000, v16, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
        }
      }
      v17 = (id)v21[5];
      v7 = *((_BYTE *)v27 + 24) != 0;
    }
    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v26, 8);
  }
  return v7;
}

- (_NSQueryGenerationToken)_retainedIdentifierFromStores:(_NSQueryGenerationToken *)result
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    if (objc_msgSend(a2, "count"))
    {
      v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v4 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v16;
        while (2)
        {
          v7 = 0;
          do
          {
            if (*(_QWORD *)v16 != v6)
              objc_enumerationMutation(a2);
            v8 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v7), "currentQueryGeneration");
            if (!v8)
            {
              _NSCoreDataLog(1, (uint64_t)CFSTR("Store currentQueryGeneration returned nil unexpectedly"), v9, v10, v11, v12, v13, v14, v15);
              return 0;
            }
            objc_msgSend(v3, "addObject:", v8);
            ++v7;
          }
          while (v5 != v7);
          v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v5)
            continue;
          break;
        }
      }
      if (objc_msgSend(v3, "count") == 1)
      {
        return (_NSQueryGenerationToken *)(id)objc_msgSend(v3, "lastObject");
      }
      else
      {
        result = [_NSQueryGenerationToken alloc];
        if (result)
        {
          result = (_NSQueryGenerationToken *)-[_NSQueryGenerationToken _initWithValue:singleton:](result, v3, 0);
          if (result)
            *(_WORD *)&result->_flags |= 1u;
        }
      }
    }
    else
    {
      return (_NSQueryGenerationToken *)+[NSQueryGenerationToken nostoresQueryGenerationToken](NSQueryGenerationToken, "nostoresQueryGenerationToken");
    }
  }
  return result;
}

+ (NSPersistentStoreCoordinator)alloc
{
  return (NSPersistentStoreCoordinator *)_PFAllocateObject((Class)a1, 0);
}

- (void)addPersistentStoreWithDescription:(NSPersistentStoreDescription *)storeDescription completionHandler:(void *)block
{
  void *v7;
  int v8;
  NSObject *global_queue;
  _QWORD blocka[8];
  char v11;

  v7 = (void *)-[NSPersistentStoreDescription copy](storeDescription, "copy");
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v8 = !-[NSPersistentStoreDescription shouldInvokeCompletionHandlerConcurrently](storeDescription, "shouldInvokeCompletionHandlerConcurrently");
  else
    v8 = 0;
  if (objc_msgSend(v7, "shouldAddStoreAsynchronously"))
  {
    global_queue = dispatch_get_global_queue(0, 0);
    blocka[0] = MEMORY[0x1E0C809B0];
    blocka[1] = 3221225472;
    blocka[2] = __84__NSPersistentStoreCoordinator_addPersistentStoreWithDescription_completionHandler___block_invoke;
    blocka[3] = &unk_1E1EDEA70;
    blocka[4] = self;
    blocka[5] = storeDescription;
    v11 = v8;
    blocka[6] = v7;
    blocka[7] = block;
    dispatch_async(global_queue, blocka);
  }
  else
  {
    -[NSPersistentStoreCoordinator _doAddPersistentStoreWithDescription:privateCopy:completeOnMainThread:withHandler:](self, storeDescription, v7, v8, (uint64_t)block);
  }

}

- (id)_doAddPersistentStoreWithDescription:(void *)a3 privateCopy:(int)a4 completeOnMainThread:(uint64_t)a5 withHandler:
{
  void *v9;
  id v10;
  NSCloudKitMirroringDelegate *v11;
  NSCloudKitMirroringDelegate *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  int v23;
  id v24;
  id v25;
  NSObject *global_queue;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  _QWORD block[7];
  id v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v9 = result;
  v10 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v53 = 0;
  if (objc_msgSend((id)objc_msgSend(a3, "mirroringOptions"), "count"))
  {
    v11 = (NSCloudKitMirroringDelegate *)(id)objc_msgSend(a3, "mirroringDelegate");
  }
  else
  {
    if (!objc_msgSend(a3, "cloudKitContainerOptions"))
    {
      v11 = 0;
      v51 = 1;
LABEL_13:
      v19 = objc_msgSend(v9, "addPersistentStoreWithType:configuration:URL:options:error:", objc_msgSend(a3, "type"), objc_msgSend(a3, "configuration"), objc_msgSend(a3, "URL"), objc_msgSend(a3, "options"), &v53);
      if (v19)
        goto LABEL_14;
      v27 = v53;
      _NSCoreDataLog(1, (uint64_t)CFSTR("%@: Attempting recovery from error encountered during addPersistentStore: %p %@"), v13, v14, v15, v16, v17, v18, (uint64_t)v9);
      v28 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v29 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "URL"), "path"), "stringByDeletingLastPathComponent");
      v30 = (void *)objc_msgSend(v27, "domain");
      if (objc_msgSend(v30, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
      {
        if (objc_msgSend(v27, "code") != 512 && objc_msgSend(v27, "code") != 4 && objc_msgSend(v27, "code") != 514)
          goto LABEL_17;
      }
      else
      {
        v31 = (void *)objc_msgSend(v27, "domain");
        if (!objc_msgSend(v31, "isEqualToString:", *MEMORY[0x1E0CB2FE0])
          || objc_msgSend(v27, "code") != 2)
        {
          goto LABEL_17;
        }
      }
      if ((objc_msgSend(a3, "isReadOnly") & 1) == 0)
      {
        if ((objc_msgSend(v28, "fileExistsAtPath:", v29) & 1) != 0)
        {
          _NSCoreDataLog(1, (uint64_t)CFSTR("During recovery, parent directory path reported to exist"), v32, v33, v34, v35, v36, v37, v50);
        }
        else
        {
          _NSCoreDataLog(1, (uint64_t)CFSTR("During recovery, parent directory path reported as missing"), v32, v33, v34, v35, v36, v37, v50);
          v54 = 0;
          if ((objc_msgSend(v28, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v29, 1, 0, &v54) & 1) == 0)
          {
            objc_msgSend(v27, "userInfo");
            _NSCoreDataLog(1, (uint64_t)CFSTR("During recovery, failed to create directory structure '%@' with error %@ and userInfo %@"), v38, v39, v40, v41, v42, v43, v29);
          }
        }
        v53 = 0;
        v19 = objc_msgSend(v9, "addPersistentStoreWithType:configuration:URL:options:error:", objc_msgSend(a3, "type"), objc_msgSend(a3, "configuration"), objc_msgSend(a3, "URL"), objc_msgSend(a3, "options"), &v53);
        if (v19)
        {
          _NSCoreDataLog(1, (uint64_t)CFSTR("Recovery attempt while adding %@ was successful!"), v44, v45, v46, v47, v48, v49, (uint64_t)a3);
LABEL_14:
          if ((v51 & 1) == 0)
            -[NSCloudKitMirroringDelegate persistentStoreCoordinator:didSuccessfullyAddPersistentStore:withDescription:](v11, "persistentStoreCoordinator:didSuccessfullyAddPersistentStore:withDescription:", v9, v19, a3);
          goto LABEL_17;
        }
        _NSCoreDataLog(1, (uint64_t)CFSTR("Recovery attempt while adding %@ FAILED with error %@"), v44, v45, v46, v47, v48, v49, (uint64_t)a3);
      }
      goto LABEL_17;
    }
    objc_msgSend(a3, "cloudKitContainerOptions");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = -[NSCloudKitMirroringDelegate initWithOptions:]([NSCloudKitMirroringDelegate alloc], "initWithOptions:", objc_msgSend(a3, "cloudKitContainerOptions"));
    else
      v12 = -[NSCloudKitMirroringDelegate initWithCloudKitContainerOptions:]([NSCloudKitMirroringDelegate alloc], "initWithCloudKitContainerOptions:", objc_msgSend(a3, "cloudKitContainerOptions"));
    v11 = v12;
    objc_msgSend(a3, "setMirroringDelegate:", v12);
  }
  if (!v11)
  {
    v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Use of the mirroring options requires that a mirroring delegate also be provided. The following options were set, but a mirroring delegate was not found at '%@':\n%@"), CFSTR("NSPersistentStoreMirroringDelegateOptionKey"), objc_msgSend(a3, "mirroringOptions"));
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v55 = *MEMORY[0x1E0CB2D68];
    v56[0] = v20;
    v22 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);
    v11 = 0;
    v53 = (id)objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v22);
    goto LABEL_17;
  }
  if (-[NSCloudKitMirroringDelegate validateManagedObjectModel:forUseWithStoreWithDescription:error:](v11, "validateManagedObjectModel:forUseWithStoreWithDescription:error:", objc_msgSend(v9, "managedObjectModel"), a3, &v53))
  {
    v51 = 0;
    goto LABEL_13;
  }
LABEL_17:
  v23 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  if (((objc_msgSend(a3, "shouldInvokeCompletionHandlerConcurrently") | v23 ^ a4) & 1) != 0)
  {
    v24 = v53;
    v25 = a2;
    if ((a4 & 1) != 0)
      global_queue = MEMORY[0x1E0C80D38];
    else
      global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __114__NSPersistentStoreCoordinator__doAddPersistentStoreWithDescription_privateCopy_completeOnMainThread_withHandler___block_invoke;
    block[3] = &unk_1E1EDEA48;
    block[4] = a2;
    block[5] = v53;
    block[6] = a5;
    dispatch_async(global_queue, block);
  }
  else
  {
    (*(void (**)(uint64_t, void *, id))(a5 + 16))(a5, a2, v53);
  }

  objc_msgSend(v10, "drain");
  return 0;
}

void __87__NSPersistentStoreCoordinator__NSInternalMethods__obtainPermanentIDsForObjects_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  id v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  id v32;
  void *v33;
  id v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
    goto LABEL_14;
  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v3 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v49 != v4)
          objc_enumerationMutation(a2);
        v6 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", objc_msgSend(v6, "identifier")))
          objc_msgSend(v34, "addObject:", v6);
      }
      v3 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    }
    while (v3);
  }
  if (v34)
  {
    v33 = v34;
    if (!objc_msgSend(v34, "count"))
    {
LABEL_56:
      v32 = objc_retain(+[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 134020, (uint64_t)CFSTR("Can't resolve how to assign objects to stores; Coordinator does not have any stores"),
                0));
      objc_exception_throw(v32);
    }
  }
  else
  {
LABEL_14:
    v33 = a2;
    v34 = 0;
  }
  if (!objc_msgSend(a2, "count"))
    goto LABEL_56;
  v7 = 0;
  v8 = 1;
  do
  {
    -[NSPersistentStoreCoordinator _doPreSaveAssignmentsForObjects:intoStores:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 48), v33);
    if (v7)

    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v9 = *(void **)(a1 + 48);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v10; ++j)
        {
          if (*(_QWORD *)v45 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
          v14 = (void *)objc_msgSend(v13, "objectID");
          if (objc_msgSend(v14, "isTemporaryID"))
          {
            v15 = objc_msgSend(v14, "persistentStore");
            if (v15)
            {
              v16 = (id)objc_msgSend(v7, "objectForKey:", v15);
              if (!v16)
              {
                v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                objc_msgSend(v7, "setObject:forKey:", v16, v15);

              }
              objc_msgSend(v16, "addObject:", v13);
            }
            else
            {
              v8 = 0;
            }
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
      }
      while (v10);
    }
    v17 = v8;
    v8 = 0;
  }
  while ((v17 & 1) == 0);
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v41;
LABEL_35:
    v20 = 0;
    while (1)
    {
      if (*(_QWORD *)v41 != v19)
        objc_enumerationMutation(v7);
      v21 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v20);
      v22 = (void *)objc_msgSend(v7, "objectForKey:", v21);
      v23 = (void *)objc_msgSend(v21, "obtainPermanentIDsForObjects:error:", v22, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v24 = v23;
      if (!v23)
        break;
      if (objc_msgSend(v23, "count"))
      {
        v25 = -[NSManagedObjectContext _changeIDsForManagedObjects:toIDs:](*(_QWORD **)(a1 + 56), v22, v24);
        if (v25)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObject:", v25);

        }
      }
      if (v18 == ++v20)
      {
        v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
        if (v18)
          goto LABEL_35;
        goto LABEL_44;
      }
    }
  }
  else
  {
LABEL_44:
    LODWORD(v24) = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
  }

  v26 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count"))
  {
    v27 = (void *)MEMORY[0x18D76B4E4]();
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v28 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
    if (v29)
    {
      v30 = *(_QWORD *)v37;
      do
      {
        for (k = 0; k != v29; ++k)
        {
          if (*(_QWORD *)v37 != v30)
            objc_enumerationMutation(v28);
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * k));
        }
        v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
      }
      while (v29);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "removeAllObjects");
    objc_autoreleasePoolPop(v27);
  }
  if ((_DWORD)v24)
    objc_exception_rethrow();
}

- (BOOL)_canSaveGraphRootedAtObject:(void *)value intoStore:(uint64_t)a2 withPreviouslyChecked:(CFSetRef)theSet withAcceptableEntities:(const __CFSet *)a4
{
  __CFSet *Mutable;
  CFIndex Count;
  CFIndex v10;
  unint64_t v11;
  uint64_t v12;
  const void **v13;
  unint64_t v14;
  int v15;
  id **v16;
  uint64_t v17;
  unint64_t *v18;
  BOOL v19;
  unint64_t *v20;
  id **v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  const void *v31;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  unint64_t v43;
  char v44;
  _BYTE v45[4];
  _BOOL4 v46;
  _BYTE *v47;
  CFSetRef v48;
  const void **v49;
  unint64_t v50;
  CFMutableSetRef v51;
  int v52;
  unint64_t v53;
  uint64_t v54;
  id **v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[116];
  uint64_t v61;

  v48 = a4;
  v61 = *MEMORY[0x1E0C80C00];
  if (_PF_Threading_Debugging_level)
  {
    _PFAssertSafeMultiThreadedAccess_impl(objc_msgSend(value, "managedObjectContext"), sel__canSaveGraphRootedAtObject_intoStore_withPreviouslyChecked_withAcceptableEntities_);
    if (!value)
      return 1;
  }
  else if (!value)
  {
    return 1;
  }
  if (CFSetContainsValue(theSet, value))
    return 1;
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  CFSetAddValue(Mutable, value);
  v51 = theSet;
  do
  {
    Count = CFSetGetCount(Mutable);
    v46 = Count == 0;
    if (!Count)
      break;
    v10 = Count;
    v47 = v45;
    v11 = MEMORY[0x1E0C80A78]();
    v13 = (const void **)&v45[-v12];
    if (v11 > 0x200)
      v13 = (const void **)NSAllocateScannedUncollectable();
    else
      bzero(&v45[-v12], 8 * v11);
    CFSetGetValues(Mutable, v13);
    CFSetRemoveAllValues(Mutable);
    v14 = 0;
    v15 = 0;
    v50 = v10;
    v49 = v13;
    while (1)
    {
      v52 = v15;
      v55 = (id **)v13[v14];
      if (!CFSetContainsValue(theSet, v55))
        break;
LABEL_39:
      v14 = (v52 + 1);
      v15 = v52 + 1;
      v43 = v50;
      theSet = v51;
      v13 = v49;
      if (v50 <= v14)
      {
        v44 = 1;
        goto LABEL_42;
      }
    }
    v16 = v55;
    v17 = objc_msgSend((id)objc_msgSend(v55, "objectID"), "persistentStore");
    v18 = (unint64_t *)objc_msgSend(v16, "entity");
    if (v17)
      v19 = v17 == a2;
    else
      v19 = 1;
    if (v19)
    {
      v20 = v18;
      if (CFSetContainsValue(v48, v18))
      {
        v21 = v55;
        CFSetAddValue(v51, v55);
        if ((objc_msgSend(v21, "isFault") & 1) == 0)
        {
          v22 = (_QWORD *)v20[14];
          v23 = *(_QWORD *)(v20[13] + 40);
          v54 = _kvcPropertysPrimitiveGetters(v20);
          v28 = v22[12];
          v29 = v22[13];
          if (v28 < v29 + v28)
          {
            do
            {
              _PF_Handler_Primitive_GetProperty(v55, v28, *(_QWORD *)(v23 + 8 * v28), *(_QWORD *)(v54 + 8 * v28), v24, v25, v26, v27);
              if (v30)
              {
                v31 = v30;
                v32 = (void *)objc_msgSend(v30, "objectID");
                if ((objc_msgSend(v32, "isTemporaryID") & 1) != 0 || objc_msgSend(v32, "persistentStore") != a2)
                  CFSetAddValue(Mutable, v31);
              }
              ++v28;
              --v29;
            }
            while (v29);
          }
          v33 = v22[18];
          v53 = v22[19] + v33;
          if (v33 < v53)
          {
            do
            {
              v34 = v23;
              _PF_Handler_Primitive_GetProperty(v55, v33, *(_QWORD *)(v23 + 8 * v33), *(_QWORD *)(v54 + 8 * v33), v24, v25, v26, v27);
              v36 = v35;
              if ((objc_msgSend(v35, "isFault") & 1) == 0)
              {
                if (objc_msgSend(v36, "count"))
                {
                  v58 = 0u;
                  v59 = 0u;
                  v57 = 0u;
                  v56 = 0u;
                  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
                  if (v37)
                  {
                    v38 = v37;
                    v39 = *(_QWORD *)v57;
                    do
                    {
                      for (i = 0; i != v38; ++i)
                      {
                        if (*(_QWORD *)v57 != v39)
                          objc_enumerationMutation(v36);
                        v41 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
                        v42 = (void *)objc_msgSend(v41, "objectID");
                        if ((objc_msgSend(v42, "isTemporaryID") & 1) != 0 || objc_msgSend(v42, "persistentStore") != a2)
                          CFSetAddValue(Mutable, v41);
                      }
                      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
                    }
                    while (v38);
                  }
                }
              }
              ++v33;
              v23 = v34;
            }
            while (v33 != v53);
          }
        }
        goto LABEL_39;
      }
    }
    v44 = 0;
    theSet = v51;
    v43 = v50;
    v13 = v49;
LABEL_42:
    if (v43 >= 0x201)
      NSZoneFree(0, v13);
  }
  while ((v44 & 1) != 0);
  CFRelease(Mutable);
  return v46;
}

- (uint64_t)_doPreSaveAssignmentsForObjects:(void *)a3 intoStores:
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFSet *Mutable;
  __CFSet *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  const __CFAllocator *allocator;
  void *v34;
  uint64_t v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v34 = (void *)result;
  if (result)
  {
    if (_PF_Threading_Debugging_level)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v28 = (void *)objc_msgSend(a2, "anyObject");
      else
        v28 = (void *)objc_msgSend(a2, "lastObject");
      _PFAssertSafeMultiThreadedAccess_impl(objc_msgSend(v28, "managedObjectContext"), sel__doPreSaveAssignmentsForObjects_intoStores_);
    }
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    if (result)
    {
      v4 = result;
      v5 = *(_QWORD *)v46;
      allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v29 = *(_QWORD *)v46;
      v30 = a2;
      do
      {
        v6 = 0;
        v31 = v4;
        do
        {
          if (*(_QWORD *)v46 != v5)
            objc_enumerationMutation(a2);
          v7 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v6);
          if (!objc_msgSend((id)objc_msgSend(v7, "objectID", v29, v30), "persistentStore"))
          {
            v32 = v6;
            v43 = 0u;
            v44 = 0u;
            v41 = 0u;
            v42 = 0u;
            v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
            if (v8)
            {
              v9 = v8;
              v10 = *(_QWORD *)v42;
              do
              {
                v11 = 0;
                v35 = v9;
                do
                {
                  if (*(_QWORD *)v42 != v10)
                    objc_enumerationMutation(a3);
                  v12 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v11);
                  if ((objc_msgSend(v12, "isReadOnly") & 1) == 0)
                  {
                    v13 = v7;
                    v14 = (void *)objc_msgSend((id)objc_msgSend(v34, "managedObjectModel"), "entitiesForConfiguration:", objc_msgSend(v12, "configurationName"));
                    Mutable = CFSetCreateMutable(allocator, 0, 0);
                    v16 = CFSetCreateMutable(allocator, 0, 0);
                    v37 = 0u;
                    v38 = 0u;
                    v39 = 0u;
                    v40 = 0u;
                    v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
                    if (v17)
                    {
                      v18 = v17;
                      v19 = *(_QWORD *)v38;
                      do
                      {
                        for (i = 0; i != v18; ++i)
                        {
                          if (*(_QWORD *)v38 != v19)
                            objc_enumerationMutation(v14);
                          CFSetAddValue(v16, *(const void **)(*((_QWORD *)&v37 + 1) + 8 * i));
                        }
                        v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v37, v53, 16);
                      }
                      while (v18);
                    }
                    v7 = v13;
                    v21 = -[NSPersistentStoreCoordinator _canSaveGraphRootedAtObject:intoStore:withPreviouslyChecked:withAcceptableEntities:](v13, (uint64_t)v12, Mutable, v16);
                    CFRelease(v16);
                    if (v21)
                    {
                      v49 = 0u;
                      v50 = 0u;
                      v51 = 0u;
                      v52 = 0u;
                      v22 = -[__CFSet countByEnumeratingWithState:objects:count:](Mutable, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
                      if (v22)
                      {
                        v23 = v22;
                        v24 = *(_QWORD *)v50;
                        do
                        {
                          for (j = 0; j != v23; ++j)
                          {
                            if (*(_QWORD *)v50 != v24)
                              objc_enumerationMutation(Mutable);
                            v26 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "objectID");
                            if (objc_msgSend(v26, "isTemporaryID"))
                            {
                              if (!objc_msgSend(v26, "persistentStore"))
                                objc_msgSend(v26, "_setPersistentStore:", v12);
                            }
                          }
                          v23 = -[__CFSet countByEnumeratingWithState:objects:count:](Mutable, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
                        }
                        while (v23);
                      }
                      CFRelease(Mutable);
                      v5 = v29;
                      a2 = v30;
                      v4 = v31;
                      v6 = v32;
                      goto LABEL_38;
                    }
                    CFRelease(Mutable);
                    v9 = v35;
                  }
                  ++v11;
                }
                while (v11 != v9);
                v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
              }
              while (v9);
            }
            v27 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 134020, (uint64_t)CFSTR("Can't resolve how to assign objects to stores; some objects may have been assigned to stores; use [[managedObject objectID] persistentStore] to find out what is going where now; use [managedObjectContext assignObject:toStore:] to straighten things out"),
                    (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v7, CFSTR("problemObject")));
            objc_exception_throw(v27);
          }
LABEL_38:
          ++v6;
        }
        while (v6 != v4);
        result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
        v4 = result;
      }
      while (result);
    }
  }
  return result;
}

- (BOOL)obtainPermanentIDsForObjects:(id)a3 error:(id *)a4
{
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  NSQueryGenerationToken *v17;
  id v18;
  char v19;
  id v20;
  void *v21;
  void *v23;
  _QWORD v24[11];
  _QWORD v25[5];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a3, "count"))
    return 1;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (!v8)
    goto LABEL_10;
  v9 = *(_QWORD *)v40;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v40 != v9)
        objc_enumerationMutation(a3);
      v11 = objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "managedObjectContext");
      v12 = (_QWORD *)v11;
      if (v11)
      {
        v38 = 0;
        if (_PF_Threading_Debugging_level)
          _PFAssertSafeMultiThreadedAccess_impl(v11, a2);
        v32 = 0;
        v33 = &v32;
        v34 = 0x3052000000;
        v35 = __Block_byref_object_copy__18;
        v36 = __Block_byref_object_dispose__18;
        v37 = 0;
        v28 = 0;
        v29 = &v28;
        v30 = 0x2020000000;
        v31 = 0;
        v23 = (void *)+[NSPersistentStoreCoordinator _beginPowerAssertionNamed:withAssert:]((uint64_t)NSPersistentStoreCoordinator, (uint64_t)CFSTR("CoreData: Executing obtain objectID request"), &v38);
        v27 = 0;
        v16 = v12[22];
        v17 = +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken");
        if (v17 != (NSQueryGenerationToken *)objc_msgSend(v12, "_queryGenerationToken"))
          goto LABEL_22;
        v18 = -[NSPersistentStoreCoordinator _retainedCurrentQueryGeneration:](self, "_retainedCurrentQueryGeneration:", v16);
        if (v18)
        {
          v19 = objc_msgSend(v12, "_setQueryGenerationFromToken:error:", v18, &v27);

          if ((v19 & 1) != 0)
          {
LABEL_22:
            v25[0] = 0;
            v25[1] = v25;
            v25[2] = 0x3052000000;
            v25[3] = __Block_byref_object_copy__18;
            v25[4] = __Block_byref_object_dispose__18;
            v26 = 0;
            v26 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v24[0] = MEMORY[0x1E0C809B0];
            v24[1] = 3221225472;
            v24[2] = __87__NSPersistentStoreCoordinator__NSInternalMethods__obtainPermanentIDsForObjects_error___block_invoke;
            v24[3] = &unk_1E1EDED00;
            v24[4] = v16;
            v24[5] = self;
            v24[6] = a3;
            v24[7] = v12;
            v24[8] = &v32;
            v24[9] = v25;
            v24[10] = &v28;
            -[NSPersistentStoreCoordinator _routeHeavyweightBlock:]((uint64_t)self, (uint64_t)v24);
            _Block_object_dispose(v25, 8);
            +[NSPersistentStoreCoordinator _endPowerAssertionWithAssert:andApp:]((uint64_t)NSPersistentStoreCoordinator, v38, v23);
            v20 = (id)v33[5];
            if (a4)
            {
              v21 = (void *)v33[5];
              if (v21)
                *a4 = v21;
            }
            v15 = *((_BYTE *)v29 + 24) != 0;
            _Block_object_dispose(&v28, 8);
            _Block_object_dispose(&v32, 8);
            return v15;
          }
        }
        else
        {
          v27 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134502, 0);
        }
        objc_msgSend(v12, "_setQueryGenerationFromToken:error:", +[NSQueryGenerationToken unpinnedQueryGenerationToken](NSQueryGenerationToken, "unpinnedQueryGenerationToken"), 0);
        goto LABEL_22;
      }
    }
    v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v8)
      continue;
    break;
  }
LABEL_10:
  if (!a4)
    return 0;
  v13 = (void *)MEMORY[0x1E0CB35C8];
  v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a3, CFSTR("NSManagedObjectContext is nil for objects passed to obtainPermanentIDsForObjects"));
  v15 = 0;
  *a4 = (id)objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v14);
  return v15;
}

+ (NSPersistentStoreCoordinator)allocWithZone:(_NSZone *)a3
{
  return (NSPersistentStoreCoordinator *)_PFAllocateObject((Class)a1, 0);
}

- (NSPersistentHistoryToken)currentPersistentHistoryTokenFromStores:(NSArray *)stores
{
  NSArray *v4;

  if (!stores || (v4 = stores, !-[NSArray count](stores, "count")))
    v4 = -[NSPersistentStoreCoordinator persistentStores](self, "persistentStores");
  return (NSPersistentHistoryToken *)-[NSPersistentStoreCoordinator _retainedChangeTokenFromStores:]((_NSPersistentHistoryToken *)self, v4);
}

id __81__NSPersistentStoreCoordinator_QueryGenerations___validateQueryGeneration_error___block_invoke(uint64_t a1, void *a2)
{
  id result;

  result = (id)objc_msgSend(-[_NSQueryGenerationToken _storesForRequestRoutingFrom:error:](*(_WORD **)(a1 + 32), a2, (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)), "count");
  if (!result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      result = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, &unk_1E1F4AC78);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
    }
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  return result;
}

- (NSDictionary)metadataForPersistentStore:(NSPersistentStore *)store
{
  NSDictionary *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__18;
  v10 = __Block_byref_object_dispose__18;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__NSPersistentStoreCoordinator_metadataForPersistentStore___block_invoke;
  v5[3] = &unk_1E1EDEA20;
  v5[4] = &v6;
  -[NSPersistentStoreCoordinator _routeLightweightBlock:toStore:]((uint64_t)self, (uint64_t)v5, (uint64_t)store);
  v3 = (NSDictionary *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __39__NSPersistentStoreCoordinator_dealloc__block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    dispatch_set_context(v2, 0);
    dispatch_release(*(dispatch_object_t *)(a1 + 32));
  }
  _PFDeallocateObject(*(id *)(a1 + 40));
}

+ (NSDictionary)metadataForPersistentStoreOfType:(NSString *)storeType URL:(NSURL *)url error:(NSError *)error
{
  if (!objc_msgSend(CFSTR("NSXPCStore"), "isEqual:"))
    return (NSDictionary *)objc_msgSend(a1, "metadataForPersistentStoreOfType:URL:options:error:", storeType, url, 0, error);
  if (error)
  {
    NSLog((NSString *)CFSTR("This is not the API you're looking for."));
    *error = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("This is not the API you're looking for"), 134060, 0);
  }
  return 0;
}

- (void)setMetadata:(NSDictionary *)metadata forPersistentStore:(NSPersistentStore *)store
{
  _QWORD v7[5];

  if (-[NSPersistentStore isReadOnly](store, "isReadOnly"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot set metadata in read-only store."), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", store), CFSTR("NSAffectedStoresErrorKey"), 0)));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__NSPersistentStoreCoordinator_setMetadata_forPersistentStore___block_invoke;
  v7[3] = &unk_1E1EDE9F8;
  v7[4] = metadata;
  -[NSPersistentStoreCoordinator _routeLightweightBlock:toStore:]((uint64_t)self, (uint64_t)v7, (uint64_t)store);
}

- (void)dealloc
{
  NSPersistentStoreCoordinator *v2;
  NSArray *persistentStores;
  uint64_t v4;
  _QWORD block[5];
  _QWORD v6[6];

  v2 = self;
  if (self && (*(_BYTE *)&self->_flags & 1) != 0)
  {
    objc_opt_self();
    self = (NSPersistentStoreCoordinator *)-[PFUbiquitySwitchboard unregisterCoordinator:](_sharedSwitchboard, v2);
  }
  MEMORY[0x18D76C0B4](self, a2);
  os_unfair_lock_lock_with_options();
  persistentStores = v2->_persistentStores;
  v2->_persistentStores = 0;
  __dmb(0xBu);
  os_unfair_lock_unlock(&v2->_miniLock);
  if (persistentStores)
  {
    v4 = MEMORY[0x1E0C809B0];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__NSPersistentStoreCoordinator_dealloc__block_invoke;
    v6[3] = &unk_1E1EDD430;
    v6[4] = persistentStores;
    v6[5] = v2;
    _perform_0((uint64_t)v2, (uint64_t)v6);
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __39__NSPersistentStoreCoordinator_dealloc__block_invoke_217;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v2;
    dispatch_async((dispatch_queue_t)v2->_dispatchQueue, block);
  }
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (void)performBlock:(void *)block
{
  _QWORD *v5;

  if (!self->_dispatchQueue)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Can only use -performBlock: on an NSPersistentStoreCoordinator that was created with a queue."), 0));
  v5 = malloc_type_malloc(0x28uLL, 0x80040B8603338uLL);
  *v5 = _Block_copy(block);
  v5[1] = CFRetain(self);
  v5[2] = 8199;
  v5[3] = 0;
  v5[4] = 0;
  dispatch_async_f((dispatch_queue_t)self->_dispatchQueue, v5, (dispatch_function_t)developerSubmittedBlockToNSPersistentStoreCoordinatorPerform);
}

- (void)setName:(NSString *)name
{
  uint64_t v4;
  NSString *v5;
  _QWORD v6[6];

  v4 = -[NSString copy](name, "copy");
  v5 = (NSString *)v4;
  if (self->_dispatchQueue)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__NSPersistentStoreCoordinator_setName___block_invoke;
    v6[3] = &unk_1E1EDD430;
    v6[4] = self;
    v6[5] = v4;
    -[NSPersistentStoreCoordinator performBlockAndWait:](self, "performBlockAndWait:", v6);
  }
  else
  {

    self->_queueLabel = v5;
  }
}

void __40__NSPersistentStoreCoordinator_setName___block_invoke(uint64_t a1)
{
  char *v2;
  unint64_t *v3;
  unint64_t v4;
  unint64_t v5;
  void (*v6)(uint64_t);
  uint64_t *p_block;
  uint64_t v8;
  uint64_t block;
  char __str[512];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = *(_QWORD *)(a1 + 40);
  __str[0] = 0;
  if (*(_QWORD *)(a1 + 40))
  {
    snprintf(__str, 0x1FFuLL, "NSPersistentStoreCoordinator %p: ", *(const void **)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "UTF8String");
    __strlcat_chk();
  }
  else
  {
    snprintf(__str, 0x1FFuLL, "NSPersistentStoreCoordinator %p", *(const void **)(a1 + 32));
  }
  v2 = strdup(__str);
  __dmb(0xBu);
  v3 = (unint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + *(unsigned __int16 *)(MEMORY[0x1E0C82E70] + 2));
  v4 = *v3;
  do
  {
    v5 = __ldaxr(v3);
    if (v5 != v4)
    {
      __clrex();
      block = MEMORY[0x1E0C809B0];
      v6 = __40__NSPersistentStoreCoordinator_setName___block_invoke_2;
      p_block = &block;
      goto LABEL_10;
    }
  }
  while (__stlxr((unint64_t)v2, v3));
  if (!v4)
    return;
  v8 = MEMORY[0x1E0C809B0];
  v6 = __40__NSPersistentStoreCoordinator_setName___block_invoke_3;
  p_block = &v8;
  v2 = (char *)v4;
LABEL_10:
  p_block[1] = 3221225472;
  p_block[2] = (uint64_t)v6;
  p_block[3] = (uint64_t)&__block_descriptor_40_e5_v8__0l;
  p_block[4] = (uint64_t)v2;
  dispatch_async(MEMORY[0x1E0C80D38], p_block);
}

void __40__NSPersistentStoreCoordinator_setName___block_invoke_2(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

void __40__NSPersistentStoreCoordinator_setName___block_invoke_3(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

+ (void)registerStoreClass:(Class)storeClass forStoreType:(NSString *)storeType
{
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  if (!storeType)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot register a store class using a 'nil' type."), 0));
  objc_sync_enter(a1);
  if (qword_1ECD8DA68 && objc_msgSend((id)qword_1ECD8DA68, "objectForKey:", storeType))
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Store type '%@' is reserved for Core Data, and cannot be re-registered."), storeType);
    objc_exception_throw((id)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v10, 0));
  }
  v7 = (void *)qword_1ECD8DA70;
  if (!qword_1ECD8DA70)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 4);
    qword_1ECD8DA70 = (uint64_t)v7;
    if (storeClass)
      goto LABEL_6;
LABEL_8:
    objc_msgSend(v7, "removeObjectForKey:", storeType);
    goto LABEL_9;
  }
  if (!storeClass)
    goto LABEL_8;
LABEL_6:
  v8 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", storeClass);
  objc_msgSend((id)qword_1ECD8DA70, "setObject:forKey:", v8, storeType);
LABEL_9:
  objc_sync_exit(a1);
}

+ (NSDictionary)registeredStoreTypes
{
  void *v3;

  objc_sync_enter(a1);
  if (qword_1ECD8DA70)
  {
    v3 = (void *)objc_msgSend((id)qword_1ECD8DA70, "mutableCopy");
    objc_msgSend(v3, "addEntriesFromDictionary:", qword_1ECD8DA68);
  }
  else
  {
    v3 = (void *)objc_msgSend((id)qword_1ECD8DA68, "copy");
  }
  objc_sync_exit(a1);
  return (NSDictionary *)v3;
}

+ (const)_classForPersistentStoreAtURL:(uint64_t)a1
{
  const char *result;
  int v4;
  int v5;
  ssize_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  if (objc_msgSend(a2, "isFileURL"))
  {
    result = (const char *)objc_msgSend((id)objc_msgSend(a2, "path"), "fileSystemRepresentation");
    if (!result)
      return result;
    v4 = open(result, 0);
    if ((v4 & 0x80000000) == 0)
    {
      v5 = v4;
      v6 = read(v4, v7, 8uLL);
      close(v5);
      if (v6 == 8 && (v7[0] == 0x66206574694C5153 || v7[0] == 0x6174614465726F43))
        return (const char *)objc_opt_class();
    }
  }
  return 0;
}

+ (BOOL)setMetadata:(NSDictionary *)metadata forPersistentStoreOfType:(NSString *)storeType URL:(NSURL *)url options:(NSDictionary *)options error:(NSError *)error
{
  NSXPCStore *v12;
  NSXPCStore *v13;
  id v14;
  BOOL result;
  NSError *v16;
  const __CFString *v17;
  const __CFString *v18;

  if (!-[NSString isEqualToString:](storeType, "isEqualToString:", CFSTR("NSXPCStore")))
    return +[NSPersistentStoreCoordinator _setMetadata:forPersistentStoreOfType:URL:options:error:]((uint64_t)NSPersistentStoreCoordinator, (uint64_t)metadata, storeType, url, (uint64_t)options, error);
  v12 = -[NSXPCStore initWithPersistentStoreCoordinator:configurationName:URL:options:]([NSXPCStore alloc], "initWithPersistentStoreCoordinator:configurationName:URL:options:", 0, 0, url, options);
  if (v12)
  {
    v13 = v12;
    v18 = 0;
    if (-[NSXPCStore loadMetadata:](v12, "loadMetadata:", &v18))
    {
      -[NSXPCStore setMetadata:](v13, "setMetadata:", metadata);
      v14 = -[NSXPCStore executeRequest:withContext:error:](v13, "executeRequest:withContext:error:", objc_alloc_init(NSSaveChangesRequest), 0, error);

      return objc_msgSend(v14, "BOOLValue");
    }
    if (error)
    {
      if (v18)
        v17 = v18;
      else
        v17 = CFSTR("Unknown");
      *error = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v17, *MEMORY[0x1E0CB3388]));
    }

  }
  else if (error)
  {
    NSLog((NSString *)CFSTR("Can't create store"));
    v16 = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, 0);
    result = 0;
    *error = v16;
    return result;
  }
  return 0;
}

+ (uint64_t)_setMetadata:(void *)a3 forPersistentStoreOfType:(void *)a4 URL:(uint64_t)a5 options:(_QWORD *)a6 error:
{
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  char v23;
  char v24;
  _QWORD *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v11 = objc_opt_self();
  if (!a4)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Invalid store URL: nil"), 0));
  v12 = (void *)v11;
  objc_opt_class();
  objc_opt_class();
  v27 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v32 = 0;
  if ((a3
     && (v13 = (void *)+[NSPersistentStoreCoordinator _storeClassForStoreType:]((uint64_t)NSPersistentStoreCoordinator, (uint64_t)a3)) != 0|| (v13 = (void *)+[NSPersistentStoreCoordinator _classForPersistentStoreAtURL:]((uint64_t)NSPersistentStoreCoordinator, a4)) != 0)&& ((objc_opt_respondsToSelector() & 1) == 0? (v14 = objc_msgSend(v13, "setMetadata:forPersistentStoreWithURL:error:", a2, a4, &v32)): (v14 = objc_msgSend(v13, "setMetadata:forPersistentStoreWithURL:options:error:", a2, a4, a5, &v32)), (v14 & 1) != 0))
  {
    v15 = 1;
  }
  else
  {
    v26 = a6;
    if (!objc_msgSend(a3, "length"))
    {
      objc_sync_enter(v12);
      v17 = (void *)objc_msgSend((id)qword_1ECD8DA70, "allKeys");
      objc_sync_exit(v12);
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v29;
        while (2)
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v29 != v19)
              objc_enumerationMutation(v17);
            v21 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
            v32 = 0;
            v22 = (void *)+[NSPersistentStoreCoordinator _storeClassForStoreType:]((uint64_t)NSPersistentStoreCoordinator, v21);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v23 = objc_msgSend(v22, "setMetadata:forPersistentStoreWithURL:options:error:", a2, a4, a5, &v32);
            else
              v23 = objc_msgSend(v22, "setMetadata:forPersistentStoreWithURL:error:", a2, a4, &v32);
            if ((v23 & 1) != 0)
            {
              v15 = 1;
              a6 = v26;
              goto LABEL_27;
            }
          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
          if (v18)
            continue;
          break;
        }
      }
    }
    a6 = v26;
    if (v26)
      v16 = v32;
    v15 = 0;
  }
LABEL_27:
  objc_msgSend(v27, "drain", v26);
  if (a6)
    v24 = v15;
  else
    v24 = 1;
  if ((v24 & 1) == 0)
    *a6 = v32;
  return v15;
}

+ (BOOL)setMetadata:(NSDictionary *)metadata forPersistentStoreOfType:(NSString *)storeType URL:(NSURL *)url error:(NSError *)error
{
  return +[NSPersistentStoreCoordinator _setMetadata:forPersistentStoreOfType:URL:options:error:]((uint64_t)NSPersistentStoreCoordinator, (uint64_t)metadata, storeType, url, 0, error);
}

- (BOOL)_tryRetain
{
  int *p_cd_rc;
  uint64_t v3;
  BOOL v4;
  BOOL result;
  unsigned int v6;

  p_cd_rc = &self->_cd_rc;
  while (1)
  {
    v3 = *p_cd_rc;
    v4 = (v3 & 1) != 0 || v3 == 4294967294;
    result = !v4;
    if (v4)
      break;
    if ((int)v3 <= -3)
    {
      __break(1u);
      return result;
    }
    while (1)
    {
      v6 = __ldaxr((unsigned int *)p_cd_rc);
      if (v6 != (_DWORD)v3)
        break;
      if (!__stlxr(v3 + 2, (unsigned int *)p_cd_rc))
        return result;
    }
    __clrex();
  }
  return result;
}

void __39__NSPersistentStoreCoordinator_dealloc__block_invoke_217(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t StatusReg;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  NSObject *global_queue;
  uint64_t v9;
  _QWORD v10[6];

  v2 = *(_QWORD *)(a1 + 32);

  *(_QWORD *)(v2 + 56) = 0;
  v3 = *(_QWORD *)(v2 + 16);
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v5 = *(_QWORD *)(StatusReg + 712);
  if (v5 == v2)
  {
    v6 = (_QWORD *)(StatusReg + 712);
LABEL_6:
    *v6 = 0;
    goto LABEL_7;
  }
  if (v5)
  {
    v7 = *(_QWORD *)(v5 + 8);
    v6 = (_QWORD *)(v5 + 8);
    if (v7 == v2)
      goto LABEL_6;
  }
LABEL_7:
  *(_QWORD *)(v2 + 8) = 0;
  __dmb(0xBu);
  *(_QWORD *)(v2 + 16) = 0;
  global_queue = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__NSPersistentStoreCoordinator_dealloc__block_invoke_2;
  v10[3] = &unk_1E1EDE568;
  v9 = *(_QWORD *)(a1 + 32);
  v10[4] = v3;
  v10[5] = v9;
  dispatch_async(global_queue, v10);
}

- (NSPersistentStoreCoordinator)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSManagedObjectModel *v9;
  NSPersistentStoreCoordinator *v10;
  uint64_t v12;

  _NSCoreDataLog(2, (uint64_t)CFSTR("client failed to call designated initializer on NSPersistentStoreCoordinator"), v2, v3, v4, v5, v6, v7, v12);
  v9 = objc_alloc_init(NSManagedObjectModel);
  v10 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:](self, "initWithManagedObjectModel:", v9);

  return v10;
}

- (BOOL)tryLock
{
  return 1;
}

- (uint64_t)_checkForSkewedEntityHashes:(uint64_t)result metadata:(void *)a2
{
  void *v3;
  float v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = (void *)result;
    objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("NSPersistenceFrameworkVersion")), "floatValue");
    if ((int)v4 <= 386)
    {
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      v5 = (void *)objc_msgSend(v3, "managedObjectModel", 0);
      result = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (result)
      {
        v6 = result;
        v7 = *(_QWORD *)v10;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v10 != v7)
              objc_enumerationMutation(v5);
            if ((-[NSEntityDescription _hasPotentialHashSkew](*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i)) & 1) != 0)
              return objc_msgSend(-[NSManagedObjectModel _entityVersionHashesByNameInStyle:]((id)objc_msgSend(v3, "managedObjectModel"), 1), "isEqual:", objc_msgSend(a2, "valueForKey:", CFSTR("NSStoreModelVersionHashes")));
          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
          result = 0;
          if (v6)
            continue;
          break;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_checkForTombstoneSkew:(uint64_t)a3 metadata:(uint64_t)a4 configuration:
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  if (!a1)
    return 0;
  v7 = objc_msgSend(a2, "mutableCopy");
  v8 = (void *)v7;
  if (v7)
    -[NSManagedObjectModel _traverseTombstonesAndMark:](v7, 1);
  if ((objc_msgSend(v8, "isConfiguration:compatibleWithStoreMetadata:", a4, a3) & 1) != 0)
  {
    v9 = 1;
  }
  else
  {

    v10 = objc_msgSend(a2, "mutableCopy");
    v8 = (void *)v10;
    if (v10)
      -[NSManagedObjectModel _traverseTombstonesAndMark:](v10, 0);
    v9 = objc_msgSend(v8, "isConfiguration:compatibleWithStoreMetadata:", a4, a3);
  }

  return v9;
}

void __114__NSPersistentStoreCoordinator__doAddPersistentStoreWithDescription_privateCopy_completeOnMainThread_withHandler___block_invoke(uint64_t a1)
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(v2, "drain");

}

id __84__NSPersistentStoreCoordinator_addPersistentStoreWithDescription_completionHandler___block_invoke(uint64_t a1)
{
  return -[NSPersistentStoreCoordinator _doAddPersistentStoreWithDescription:privateCopy:completeOnMainThread:withHandler:](*(id *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

- (uint64_t)migrateStoreWithContext:(_QWORD *)a3 error:
{
  uint64_t v3;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  const __CFString **v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  uint8_t buf[4];
  const char *v61;
  __int16 v62;
  int v63;
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;
  const __CFString *v67;
  uint64_t v68;
  const __CFString *v69;
  uint64_t v70;
  const __CFString *v71;
  uint64_t v72;
  _QWORD v73[4];

  v3 = a1;
  v73[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v6 = objc_msgSend(a2, "configurationName");
    objc_msgSend(a2, "setConfigurationName:", 0);
    v59 = 0;
    v7 = (void *)objc_msgSend((id)objc_msgSend(a2, "options"), "objectForKey:", CFSTR("NSPersistentStoreStagedMigrationManagerOptionKey"));
    if (v7
      && (!objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "options"), "objectForKey:", CFSTR("NSMigratePersistentStoresAutomaticallyOption")), "BOOLValue")|| (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "options"), "objectForKey:", CFSTR("NSInferMappingModelAutomaticallyOption")), "BOOLValue") & 1) == 0))
    {
      v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v13 = *MEMORY[0x1E0CB28A8];
      v72 = *MEMORY[0x1E0CB2D50];
      v73[0] = CFSTR("Staged Migration was requested with NSPersistentStoreStagedMigrationManagerOptionKey but without setting NSMigratePersistentStoresAutomaticallyOption and NSInferMappingModelAutomaticallyOption to YES.");
      v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, &v72, 1);
      v15 = 134100;
      goto LABEL_14;
    }
    objc_msgSend(a2, "setStagedMigrationManager:", v7);
    if (!objc_msgSend((id)objc_msgSend(v7, "stages"), "count"))
    {
      v18 = 0;
LABEL_21:
      *(_DWORD *)(v3 + 24) |= 0x800u;
      if (objc_msgSend(v18, "count"))
      {
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v25 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v56;
          while (2)
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v56 != v27)
                objc_enumerationMutation(v18);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v53 = 0u;
                v54 = 0u;
                v51 = 0u;
                v52 = 0u;
                v31 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
                if (v31)
                {
                  v32 = v31;
                  v33 = *(_QWORD *)v52;
                  while (2)
                  {
                    for (j = 0; j != v32; ++j)
                    {
                      if (*(_QWORD *)v52 != v33)
                        objc_enumerationMutation(v18);
                      v35 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * j);
                      v36 = (void *)MEMORY[0x18D76B4E4]();
                      if ((-[NSPersistentStoreCoordinator applyMigrationStage:withContext:error:]((void *)v3, v35, a2, &v59) & 1) == 0)
                      {
                        v39 = v59;
                        objc_autoreleasePoolPop(v36);
                        goto LABEL_47;
                      }
                      objc_autoreleasePoolPop(v36);
                    }
                    v32 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v51, v64, 16);
                    if (v32)
                      continue;
                    break;
                  }
                }
                goto LABEL_42;
              }
            }
            v26 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
            if (v26)
              continue;
            break;
          }
        }
        v29 = (void *)objc_msgSend(v18, "lastObject");
        v30 = (void *)v3;
      }
      else
      {
        v30 = (void *)v3;
        v29 = 0;
      }
      if ((-[NSPersistentStoreCoordinator applyMigrationStage:withContext:error:](v30, v29, a2, &v59) & 1) == 0)
      {
        v38 = v59;
LABEL_47:
        *(_DWORD *)(v3 + 24) &= ~0x800u;
LABEL_50:
        v41 = v59;
        if (v41)
        {
          if (a3)
          {
            v3 = 0;
            *a3 = v41;
            goto LABEL_56;
          }
        }
        else
        {
          v42 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
          _NSCoreDataLog(17, v42, v43, v44, v45, v46, v47, v48, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
          v49 = __pflogFaultLog;
          if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 136315394;
            v61 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
            v62 = 1024;
            v63 = 3819;
            _os_log_fault_impl(&dword_18A253000, v49, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
          }
        }
        v3 = 0;
        goto LABEL_56;
      }
LABEL_42:
      *(_DWORD *)(v3 + 24) &= ~0x800u;
      -[NSPersistentStoreCoordinator _removePersistentStore:](v3, (_QWORD *)objc_msgSend((id)v3, "persistentStoreForURL:", objc_msgSend(a2, "storeURL")));
      v37 = objc_msgSend((id)v3, "addPersistentStoreWithType:configuration:URL:options:error:", objc_msgSend(a2, "storeType"), v6, objc_msgSend(a2, "storeURL"), objc_msgSend(a2, "options"), &v59);
      v19 = v59;
      if (v37 && !v59)
      {
        objc_msgSend(a2, "setMigratedStore:", v37);
        v3 = 1;
LABEL_56:

        return v3;
      }
LABEL_49:
      v40 = v19;
      goto LABEL_50;
    }
    v8 = objc_msgSend((id)objc_msgSend(a2, "metadata"), "objectForKey:", CFSTR("NSStoreModelVersionChecksumKey"));
    if (!v8)
      goto LABEL_61;
    v9 = v8;
    v10 = objc_msgSend(v7, "_findCurrentMigrationStageFromModelChecksum:", v8);
    if ((objc_msgSend(v7, "_shouldAttemptStagedMigrationWithStoreModelVersionChecksum:coordinatorModelVersionChecksum:error:", v9, objc_msgSend((id)objc_msgSend((id)v3, "managedObjectModel"), "versionChecksum"), &v59) & 1) == 0)
    {
      v19 = v59;
      goto LABEL_49;
    }
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_61:
      if (objc_msgSend((id)objc_msgSend(a2, "storeType"), "isEqualToString:", CFSTR("SQLite")))
      {
        v11 = +[NSPersistentStore cachedModelForPersistentStoreWithURL:options:error:](NSPersistentStore, "cachedModelForPersistentStoreWithURL:options:error:", objc_msgSend(a2, "storeURL"), objc_msgSend(a2, "options"), &v59);
        objc_msgSend(v11, "_setIsEditable:", 0);
        if (v11)
        {
          v10 = objc_msgSend(v7, "_findCurrentMigrationStageFromModelChecksum:", objc_msgSend(v11, "versionChecksum"));
          if (v10 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v13 = *MEMORY[0x1E0CB28A8];
            v70 = *MEMORY[0x1E0CB2D50];
            v71 = CFSTR("Cannot use staged migration with an unknown model version.");
            v14 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
            v15 = 134504;
LABEL_14:
            v16 = v12;
            v17 = v13;
LABEL_15:
            v59 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, v15, v14);
            goto LABEL_50;
          }
          goto LABEL_20;
        }
        v19 = v59;
        if (v59)
          goto LABEL_49;
        v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v21 = *MEMORY[0x1E0CB28A8];
        v68 = *MEMORY[0x1E0CB2D50];
        v69 = CFSTR("The store must be opened one time without Staged Migration to update store metadata to be able to use Staged Migration.");
        v22 = (void *)MEMORY[0x1E0C99D80];
        v23 = &v69;
        v24 = &v68;
      }
      else
      {
        v20 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v21 = *MEMORY[0x1E0CB28A8];
        v66 = *MEMORY[0x1E0CB2D50];
        v67 = CFSTR("The store must be opened one time without Staged Migration to update store metadata to be able to use Staged Migration.");
        v22 = (void *)MEMORY[0x1E0C99D80];
        v23 = &v67;
        v24 = &v66;
      }
      v14 = objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
      v16 = v20;
      v17 = v21;
      v15 = 134505;
      goto LABEL_15;
    }
LABEL_20:
    v18 = (void *)objc_msgSend((id)objc_msgSend(v7, "stages"), "subarrayWithRange:", v10, objc_msgSend((id)objc_msgSend(v7, "stages"), "count") - v10);
    goto LABEL_21;
  }
  return v3;
}

- (uint64_t)_removePersistentStore:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t result;
  unint64_t StatusReg;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (!a1)
    return a1 != 0;
  if (!_PF_Threading_Debugging_level)
  {
LABEL_3:
    objc_msgSend(a2, "willRemoveFromPersistentStoreCoordinator:", a1);
    __dmb(0xBu);
    while (1)
    {
      os_unfair_lock_lock_with_options();
      v4 = *(void **)(a1 + 48);
      v5 = (void *)objc_msgSend(v4, "mutableCopy");
      objc_msgSend(v5, "removeObjectIdenticalTo:", a2);
      v6 = (id)objc_msgSend(v5, "copy");

      CFRetain(v6);
      if (*(void **)(a1 + 48) == v4)
        break;
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
      if (v6)
        CFRelease(v6);
    }
    *(_QWORD *)(a1 + 48) = v6;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
    if (a2 && a2[1])
      a2[1] = 0;
    if (v4)
      CFRelease(v4);
    return a1 != 0;
  }
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v9 = *(_QWORD *)(StatusReg + 712);
  if (v9)
  {
    v10 = 0;
    __dmb(0xBu);
    while (v9 != a1 && v9 != v10)
    {
      if (!v10)
        v10 = v9;
      v9 = *(_QWORD *)(v9 + 8);
      if (!v9)
      {
        v11 = *(_QWORD *)(StatusReg + 712);
        if (!v11)
          goto LABEL_28;
        v12 = 0;
        __dmb(0xBu);
        v13 = a1;
        while (v13 != v11 && v13 != v12)
        {
          if (!v12)
            v12 = v13;
          v13 = *(_QWORD *)(v13 + 8);
          if (!v13)
            goto LABEL_28;
        }
        goto LABEL_3;
      }
    }
    goto LABEL_3;
  }
LABEL_28:
  result = objc_opt_self();
  __break(1u);
  return result;
}

void __91__NSPersistentStoreCoordinator_addPersistentStoreWithType_configuration_URL_options_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _NSCoreDataLog(1, (uint64_t)CFSTR("\t%@ : %@"), a3, a4, a5, a6, a7, a8, a2);
}

void __91__NSPersistentStoreCoordinator_addPersistentStoreWithType_configuration_URL_options_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _NSCoreDataLog(4, (uint64_t)CFSTR("\t%@ : %@"), a3, a4, a5, a6, a7, a8, a2);
}

uint64_t __91__NSPersistentStoreCoordinator_addPersistentStoreWithType_configuration_URL_options_error___block_invoke_4(uint64_t a1)
{
  return -[NSPersistentStoreCoordinator _repairIndiciesForStoreWithIdentifier:synchronous:](*(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "identifier"), 1);
}

- (uint64_t)_repairIndiciesForStoreWithIdentifier:(uint64_t)a3 synchronous:
{
  void *v4;

  if (result)
  {
    v4 = (void *)objc_msgSend((id)result, "persistentStoreForIdentifier:", a2);
    result = objc_msgSend(v4, "isReadOnly");
    if ((result & 1) == 0)
    {
      result = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v4, "metadata"), "objectForKey:", CFSTR("NSPersistentStoreRebuildIndicies")), "BOOLValue");
      if ((_DWORD)result)
        return objc_msgSend(v4, "_rebuildIndiciesSynchronously:", a3);
    }
  }
  return result;
}

uint64_t __91__NSPersistentStoreCoordinator_addPersistentStoreWithType_configuration_URL_options_error___block_invoke_5(uint64_t a1)
{
  return -[NSPersistentStoreCoordinator _repairIndiciesForStoreWithIdentifier:synchronous:](*(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "identifier"), 0);
}

- (BOOL)removePersistentStore:(NSPersistentStore *)store error:(NSError *)error
{
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (store)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = CFSTR("removed");
    v10[0] = store;
    objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification"), self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
  }
  return -[NSPersistentStoreCoordinator _removePersistentStore:error:]((uint64_t)self, store, error);
}

- (BOOL)_removePersistentStore:(_QWORD *)a3 error:
{
  id v6;
  void *v7;
  id v8;
  _BOOL8 v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  if (!a1)
    return 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3052000000;
  v15 = __Block_byref_object_copy__18;
  v16 = __Block_byref_object_dispose__18;
  v17 = 0;
  if (objc_msgSend((id)objc_msgSend(a2, "type"), "isEqualToString:", CFSTR("NSXPCStore")))
  {
    v6 = a2;
    objc_msgSend(a2, "_prepareStoreForRemovalFromCoordinator:", a1);

  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__NSPersistentStoreCoordinator__removePersistentStore_error___block_invoke;
  v11[3] = &unk_1E1EDD7B8;
  v11[4] = a2;
  v11[5] = a1;
  v11[6] = &v18;
  v11[7] = &v12;
  _perform_0(a1, (uint64_t)v11);
  v7 = (void *)v13[5];
  if (v7)
  {
    v8 = v7;
    if (a3)
      *a3 = v13[5];
  }
  v9 = *((_BYTE *)v19 + 24) != 0;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v18, 8);
  return v9;
}

- (BOOL)_removeAllPersistentStores:(id *)a3
{
  id v4;
  void *v5;
  char v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__18;
  v13 = __Block_byref_object_dispose__18;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__NSPersistentStoreCoordinator__removeAllPersistentStores___block_invoke;
  v8[3] = &unk_1E1EDDC88;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = &v15;
  -[NSPersistentStoreCoordinator performBlockAndWait:](self, "performBlockAndWait:", v8);
  v4 = (id)v10[5];
  if (a3)
  {
    v5 = (void *)v10[5];
    if (v5)
      *a3 = v5;
  }
  v6 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);
  return v6;
}

void __59__NSPersistentStoreCoordinator__removeAllPersistentStores___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x18D76B4E4]();
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "persistentStores");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(a1 + 32), "removePersistentStore:error:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) & 1) == 0)*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  v8 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_autoreleasePoolPop(v2);
}

void __61__NSPersistentStoreCoordinator__removePersistentStore_error___block_invoke(uint64_t a1)
{
  id *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (id *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32)
    && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "persistentStores"), "indexOfObjectIdenticalTo:", *(_QWORD *)(a1 + 32)) != 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = *(id *)(a1 + 32);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = -[NSPersistentStoreCoordinator _removePersistentStore:](*(_QWORD *)(a1 + 40), *(_QWORD **)(a1 + 32));
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v2, 1);
    -[NSPersistentStoreCoordinator _postStoresChangedNotificationsForStores:changeKey:options:](*(_QWORD *)(a1 + 40), (uint64_t)v4, (uint64_t)CFSTR("removed"), 0);

    if ((__CFString *)objc_msgSend(*(id *)(a1 + 32), "type") == CFSTR("SQLite")
      && !*(_QWORD *)(*(_QWORD *)(a1 + 40) + 64))
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v5 = *(_QWORD *)(a1 + 32);
      if (v5)
      {
        v6 = *(_QWORD *)(v5 + 168);
        if (v6)
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "addObject:", objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 1));
      }
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, &unk_1E1F4AC50);
  }
}

- (NSURL)URLForPersistentStore:(NSPersistentStore *)store
{
  NSURL *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  if (!store)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("nil is not a valid store."), 0));
  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__18;
  v10 = __Block_byref_object_dispose__18;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__NSPersistentStoreCoordinator_URLForPersistentStore___block_invoke;
  v5[3] = &unk_1E1EDEA20;
  v5[4] = &v6;
  -[NSPersistentStoreCoordinator _routeLightweightBlock:toStore:]((uint64_t)self, (uint64_t)v5, (uint64_t)store);
  v3 = (NSURL *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __54__NSPersistentStoreCoordinator_URLForPersistentStore___block_invoke(uint64_t a1, void *a2)
{
  id result;

  result = (id)objc_msgSend(a2, "URL");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  return result;
}

- (BOOL)setURL:(NSURL *)url forPersistentStore:(NSPersistentStore *)store
{
  char v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__NSPersistentStoreCoordinator_setURL_forPersistentStore___block_invoke;
  v6[3] = &unk_1E1EDEB00;
  v6[4] = url;
  v6[5] = &v7;
  -[NSPersistentStoreCoordinator _routeLightweightBlock:toStore:]((uint64_t)self, (uint64_t)v6, (uint64_t)store);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __58__NSPersistentStoreCoordinator_setURL_forPersistentStore___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;

  if (*(_QWORD *)(result + 32))
  {
    v2 = result;
    result = objc_msgSend(a2, "setURL:");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (NSPersistentStore)migratePersistentStore:(NSPersistentStore *)store toURL:(NSURL *)URL options:(NSDictionary *)options withType:(NSString *)storeType error:(NSError *)error
{
  id v13;
  NSError *v14;
  NSPersistentStore *v15;
  const __CFString *v17;
  _QWORD v18[12];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  uint64_t v30;

  v25 = 0;
  v26 = &v25;
  v27 = 0x3052000000;
  v28 = __Block_byref_object_copy__18;
  v29 = __Block_byref_object_dispose__18;
  v30 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__18;
  v23 = __Block_byref_object_dispose__18;
  v24 = 0;
  if (!store)
  {
    v17 = CFSTR("nil is not a valid persistent store");
    goto LABEL_10;
  }
  if (!URL && !-[NSString isEqualToString:](storeType, "isEqualToString:", CFSTR("InMemory")))
  {
    v17 = CFSTR("nil is not a valid persistent store URL");
LABEL_10:
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v17, 0, storeType, error));
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __84__NSPersistentStoreCoordinator_migratePersistentStore_toURL_options_withType_error___block_invoke;
  v18[3] = &unk_1E1EDEB28;
  v18[4] = store;
  v18[5] = self;
  v18[6] = options;
  v18[7] = storeType;
  v18[8] = URL;
  v18[9] = &v25;
  v18[10] = &v19;
  v18[11] = error;
  _perform_0((uint64_t)self, (uint64_t)v18);
  v13 = (id)v26[5];
  if (error)
  {
    v14 = (NSError *)v26[5];
    if (v14)
      *error = v14;
  }
  v15 = (NSPersistentStore *)v20[5];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  return v15;
}

void __84__NSPersistentStoreCoordinator_migratePersistentStore_toURL_options_withType_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD **v22;
  _QWORD **v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  unint64_t v31;
  unint64_t j;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  id v42;
  _QWORD v43[8];
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  const __CFString *v53;
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  void (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v44 = 0;
  v42 = (id)objc_msgSend(*(id *)(a1 + 32), "configurationName");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)objc_opt_self();
  objc_sync_enter(v3);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v4 = (void *)qword_1ECD8DA68;
  v5 = objc_msgSend((id)qword_1ECD8DA68, "countByEnumeratingWithState:objects:count:", &v49, &v56, 16);
  if (!v5)
  {
LABEL_9:
    v10 = (void *)qword_1ECD8DA70;
    if (qword_1ECD8DA70)
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v11 = objc_msgSend((id)qword_1ECD8DA70, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v46 != v12)
              objc_enumerationMutation(v10);
            v8 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            v14 = objc_opt_class();
            if (v14 == objc_msgSend((id)objc_msgSend((id)qword_1ECD8DA70, "objectForKey:", v8), "pointerValue"))
              goto LABEL_19;
          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
        }
        while (v11);
      }
    }
    objc_sync_exit(v3);
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't find store type for store %@ (class == %@) in %@."), v2, objc_opt_class(), objc_msgSend(v3, "registeredStoreTypes")), 0);
    objc_exception_throw(v15);
  }
  v6 = *(_QWORD *)v50;
LABEL_3:
  v7 = 0;
  while (1)
  {
    if (*(_QWORD *)v50 != v6)
      objc_enumerationMutation(v4);
    v8 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v7);
    v9 = objc_opt_class();
    if (v9 == objc_msgSend((id)objc_msgSend((id)qword_1ECD8DA68, "objectForKey:", v8), "pointerValue"))
      break;
    if (v5 == ++v7)
    {
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v49, &v56, 16);
      if (!v5)
        goto LABEL_9;
      goto LABEL_3;
    }
  }
LABEL_19:
  objc_sync_exit(v3);
  v16 = v8;
  v17 = (id)objc_msgSend(*(id *)(a1 + 32), "URL");
  v18 = (void *)objc_msgSend(objc_allocWithZone((Class)NSPersistentStoreCoordinator), "initWithManagedObjectModel:", objc_msgSend(*(id *)(a1 + 40), "managedObjectModel"));
  v19 = *(void **)(a1 + 48);
  if (v19)
    v20 = (id)objc_msgSend(v19, "mutableCopy");
  else
    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v21 = v20;
  if (!objc_msgSend(v20, "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey")))
    objc_msgSend(v21, "setObject:forKey:", &unk_1E1F4B510, CFSTR("NSPersistentStoreRemoveUbiquitousMetadataOption"));
  objc_msgSend(v21, "removeObjectForKey:", CFSTR("NSReadOnlyPersistentStoreOption"));
  v22 = (_QWORD **)objc_msgSend(v18, "addPersistentStoreWithType:configuration:URL:options:error:", *(_QWORD *)(a1 + 56), v42, *(_QWORD *)(a1 + 64), v21, &v44);

  if (v22)
  {
    v23 = v22;
    v24 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    v56 = 0;
    v57 = &v56;
    v58 = 0x3052000000;
    v59 = __Block_byref_object_copy__18;
    v60 = __Block_byref_object_dispose__18;
    v61 = 0;
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __84__NSPersistentStoreCoordinator_migratePersistentStore_toURL_options_withType_error___block_invoke_344;
    v43[3] = &unk_1E1EDE590;
    v25 = *(_QWORD *)(a1 + 32);
    v43[4] = v18;
    v43[5] = v25;
    v43[6] = v22;
    v43[7] = &v56;
    objc_msgSend(v18, "performBlockAndWait:", v43);
    v26 = (void *)v57[5];
    _Block_object_dispose(&v56, 8);
    v27 = v44;

    objc_msgSend(v24, "drain");
    if (v44)
    {
      v28 = v44;
      if (*(_QWORD *)(a1 + 88))
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = v44;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) = 0;
    }
    else if (v26)
    {
      v29 = *(id *)(a1 + 32);
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", *(_QWORD *)(a1 + 48));
      objc_msgSend(v30, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0), CFSTR("_NSNotifyObserversOfStoreChange"));
      if (objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", CFSTR("InMemory")))
        objc_msgSend(v30, "setObject:forKey:", -[NSDictionaryStoreMap _archivedData](v22[12]), 0x1E1EEFE70);
      if (!objc_msgSend(v30, "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey")))
        objc_msgSend(v30, "setObject:forKey:", &unk_1E1F4B510, CFSTR("NSPersistentStoreRemoveUbiquitousMetadataOption"));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) = objc_msgSend(*(id *)(a1 + 40), "addPersistentStoreWithType:configuration:URL:options:error:", *(_QWORD *)(a1 + 56), v42, *(_QWORD *)(a1 + 64), v30, &v44);

      if (v44)
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = v44;
      v31 = objc_msgSend(v26, "count");
      if (v31 >= 2)
      {
        for (j = 1; j < v31; j += 2)
          objc_msgSend(v26, "replaceObjectAtIndex:withObject:", j, objc_msgSend(*(id *)(a1 + 40), "managedObjectIDForURIRepresentation:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v26, "objectAtIndex:", j), "objectID"), "URIRepresentation")));
      }

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
      {
        v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v26, 0);
        -[NSPersistentStoreCoordinator _postStoresChangedNotificationsForStores:changeKey:options:](*(_QWORD *)(a1 + 40), (uint64_t)v33, (uint64_t)CFSTR("changedUUID"), 0);

        if (*(_QWORD *)(a1 + 32))
        {
          v34 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v35 = *(_QWORD *)(a1 + 32);
          v36 = *(_QWORD *)(a1 + 40);
          v53 = CFSTR("removed");
          v54 = v35;
          objc_msgSend(v34, "postNotificationName:object:userInfo:", CFSTR("_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification"), v36, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1));
          v37 = *(void **)(a1 + 32);
        }
        else
        {
          v37 = 0;
        }
        -[NSPersistentStoreCoordinator _removePersistentStore:error:](*(_QWORD *)(a1 + 40), v37, &v44);

      }
      else
      {

      }
    }
    else
    {

      if (*(_QWORD *)(a1 + 88))
      {
        v38 = (void *)MEMORY[0x1E0CB35C8];
        if (v44)
          v39 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v44, *MEMORY[0x1E0CB3388]);
        else
          v39 = 0;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = objc_msgSend(v38, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134030, v39);
      }
    }
  }
  else
  {
    if (*(_QWORD *)(a1 + 88))
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = v44;

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) = 0;
  }
  v40 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (v40)
    v41 = v40;
}

void __84__NSPersistentStoreCoordinator_migratePersistentStore_toURL_options_withType_error___block_invoke_344(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  NSManagedObjectContext *v5;
  NSFetchRequest *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSManagedObjectContext *v15;
  NSSet *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  uint64_t v23;
  NSSet *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t k;
  _BYTE *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  void *v49;
  void *v50;
  NSTemporaryObjectID *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t StatusReg;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  const __CFString *v77;
  NSManagedObjectContext *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  void *v85;
  uint64_t v86;
  id obj;
  _QWORD *v88;
  NSManagedObjectContext *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint64_t v98;
  _QWORD v99[16];
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _BYTE v104[128];
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  uint64_t v109;

  v1 = (_QWORD *)a1;
  v109 = *MEMORY[0x1E0C80C00];
  -[NSPersistentStoreCoordinator _addPersistentStore:identifier:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), objc_msgSend(*(id *)(a1 + 40), "identifier"));
  v2 = v1[4];
  if (!v2)
  {
    v60 = 0;
    goto LABEL_72;
  }
  v3 = (_QWORD *)v1[5];
  v4 = (void *)v1[6];
  v5 = -[NSManagedObjectContext initWithConcurrencyType:]([NSManagedObjectContext alloc], "initWithConcurrencyType:", 3);
  -[NSManagedObjectContext setPersistentStoreCoordinator:](v5, "setPersistentStoreCoordinator:", v2);
  -[NSManagedObjectContext setRetainsRegisteredObjects:](v5, "setRetainsRegisteredObjects:", 1);
  -[NSManagedObjectContext setUndoManager:](v5, "setUndoManager:", 0);
  if (_PF_Threading_Debugging_level)
  {
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v70 = *(_QWORD *)(StatusReg + 712);
    if (!v70)
      goto LABEL_91;
    v71 = 0;
    __dmb(0xBu);
    do
    {
      if (v70 == v2 || v70 == v71)
        goto LABEL_3;
      if (!v71)
        v71 = v70;
      v70 = *(_QWORD *)(v70 + 8);
    }
    while (v70);
    v72 = *(_QWORD *)(StatusReg + 712);
    if (!v72)
    {
LABEL_91:
      objc_opt_self();
      __break(1u);
LABEL_92:
      v75 = (void *)MEMORY[0x1E0C99DA0];
      v76 = *MEMORY[0x1E0C99778];
      v77 = CFSTR("Can't reassign an object to a different store once it has been saved.");
      goto LABEL_94;
    }
    v73 = 0;
    __dmb(0xBu);
    v74 = v2;
    while (v74 != v72 && v74 != v73)
    {
      if (!v73)
        v73 = v74;
      v74 = *(_QWORD *)(v74 + 8);
      if (!v74)
        goto LABEL_91;
    }
  }
LABEL_3:
  v88 = v3;
  v89 = v5;
  v84 = v1;
  v6 = objc_alloc_init(NSFetchRequest);
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v86 = v2;
  v7 = *(void **)(v2 + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v105, v104, 16);
  v85 = v4;
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v106;
    v12 = *MEMORY[0x1E0C99768];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v106 != v11)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
        if (!objc_msgSend(v14, "superentity"))
        {
          v98 = 0;
          -[NSFetchRequest setEntity:](v6, "setEntity:", v14);
          -[NSFetchRequest setAffectedStores:](v6, "setAffectedStores:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v88));
          if (!-[NSManagedObjectContext executeFetchRequest:error:](v5, "executeFetchRequest:error:", v6, &v98))
            v10 = (id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v12, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fetch instances of entity %@ from store %@ failed, reason: %@"), v14, v88, v98), 0);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v105, v104, 16);
    }
    while (v9);

    v15 = v5;
    if (v10)
      goto LABEL_95;
  }
  else
  {

    v15 = v5;
  }
  v16 = -[NSManagedObjectContext registeredObjects](v15, "registeredObjects");
  v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSSet count](v16, "count"));
  v83 = -[NSSet count](-[NSManagedObjectContext deletedObjects](v15, "deletedObjects"), "count");
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v18 = -[NSSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v94, &v100, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v95;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v95 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * j);
        if ((_QWORD *)objc_msgSend((id)objc_msgSend(v22, "objectID"), "persistentStore") == v88)
        {
          objc_msgSend(v17, "addObject:", v22);
          if (v22)
            v23 = _insertion_fault_handler;
          else
            v23 = 0;
          -[NSFaultHandler _fireFirstAndSecondLevelFaultsForObject:withContext:](v23, v22);
        }
      }
      v19 = -[NSSet countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v94, &v100, 16);
    }
    while (v19);
  }
  obj = v17;
  v24 = -[NSManagedObjectContext registeredObjects](v15, "registeredObjects");
  v25 = -[NSSet count](-[NSManagedObjectContext deletedObjects](v15, "deletedObjects"), "count");
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v26 = -[NSSet countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
  if (!v26)
  {
    v28 = 0;
    goto LABEL_46;
  }
  v27 = v26;
  v28 = 0;
  v29 = *(_QWORD *)v91;
  do
  {
    for (k = 0; k != v27; ++k)
    {
      if (*(_QWORD *)v91 != v29)
        objc_enumerationMutation(v24);
      v31 = *(_BYTE **)(*((_QWORD *)&v90 + 1) + 8 * k);
      if ((_QWORD *)objc_msgSend((id)objc_msgSend(v31, "objectID"), "persistentStore") == v88)
      {
        ++v28;
        if ((objc_msgSend(obj, "containsObject:", v31) & 1) == 0)
        {
          v32 = (void *)objc_msgSend(v31, "objectID");
          if ((v31[16] & 0x12) != 0 || (v33 = v32, (objc_msgSend(v32, "isTemporaryID") & 1) != 0))
          {
LABEL_42:
            v35 = *MEMORY[0x1E0C99768];
            v36 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v31, CFSTR("object"), 0);
            v37 = CFSTR("Save failed during during migratePersistentStore:toURL:options:withType:error:, object added to store during fetch.");
            v38 = v35;
            v39 = 134030;
          }
          else
          {
            v98 = 0;
            v34 = (void *)objc_msgSend(v88, "newValuesForObjectWithID:withContext:error:", v33, v15, &v98);
            if (v34)
            {

              goto LABEL_42;
            }
            v61 = v98;
            v82 = *MEMORY[0x1E0CB2FA8];
            v62 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CoreData could not fulfill a fault for '%@'"), v33);
            v63 = (void *)MEMORY[0x1E0C99D80];
            v64 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v31);
            if (v61)
              v65 = (void *)objc_msgSend(v63, "dictionaryWithObjectsAndKeys:", v64, CFSTR("NSAffectedObjectsErrorKey"), v98, *MEMORY[0x1E0CB3388], 0);
            else
              v65 = (void *)objc_msgSend(v63, "dictionaryWithObjectsAndKeys:", v64, CFSTR("NSAffectedObjectsErrorKey"), 0, v80, v81);
            v66 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v82, 133000, v62, v65);
            v67 = *MEMORY[0x1E0C99768];
            v68 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Referential integrity problem found during migratePersistentStore:toURL:options:withType:error: %@"), objc_msgSend(v66, "reason"));
            v36 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v66, CFSTR("NSUnderlyingException"), 0);
            v38 = v67;
            v39 = 133000;
            v37 = (const __CFString *)v68;
          }
          v10 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v38, v39, (uint64_t)v37, v36);
          if (!v10)
            goto LABEL_46;
LABEL_95:

          objc_exception_throw(v10);
        }
      }
    }
    v27 = -[NSSet countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v90, v99, 16);
  }
  while (v27);
LABEL_46:
  if (objc_msgSend(obj, "count") == v28)
  {
    if (v25 != v83)
    {
      v40 = *MEMORY[0x1E0C99768];
      v41 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Save failed during migratePersistentStore:toURL:options:withType:error:, %d objects in store were removed during fetch."), v25 - v83);
      goto LABEL_50;
    }
    goto LABEL_51;
  }
  v40 = *MEMORY[0x1E0C99768];
  v41 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Save failed during migratePersistentStore:toURL:options:withType:error:, %d objects in store were removed during fetch."), objc_msgSend(obj, "count") - v28);
LABEL_50:
  v10 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v40, 134030, v41, 0);
  if (v10)
    goto LABEL_95;
LABEL_51:
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(obj, "count"));
  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(obj, "count"));
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(obj, "count"));
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v104, 16);
  if (v45)
  {
    v46 = v45;
    v47 = *(_QWORD *)v101;
    do
    {
      for (m = 0; m != v46; ++m)
      {
        if (*(_QWORD *)v101 != v47)
          objc_enumerationMutation(obj);
        v49 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * m);
        v50 = (void *)objc_msgSend(v49, "objectID");
        objc_msgSend(v42, "addObject:", v50);
        v51 = -[NSTemporaryObjectID initWithEntity:]([NSTemporaryObjectID alloc], "initWithEntity:", objc_msgSend(v49, "entity"));
        objc_msgSend(v42, "addObject:", v49);
        objc_msgSend(v43, "addObject:", v49);
        objc_msgSend(v44, "addObject:", v51);

        -[NSManagedObjectContext _insertObjectWithGlobalID:globalID:](v89, (uint64_t)v49, v50);
      }
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v104, 16);
    }
    while (v46);
  }
  if (objc_msgSend(v43, "count"))
  {

    v52 = objc_msgSend(v43, "count");
    v53 = objc_msgSend(*(id *)(v86 + 40), "entitiesForConfiguration:", objc_msgSend(v85, "configurationName"));
    if (v52)
    {
      v54 = (void *)v53;
      v55 = 0;
      while (1)
      {
        v56 = (void *)objc_msgSend(v43, "objectAtIndex:", v55);
        v57 = v56;
        if (_PF_Threading_Debugging_level)
          _PFAssertSafeMultiThreadedAccess_impl(objc_msgSend(v56, "managedObjectContext"), sel__assignObject_toPersistentStore_forConfiguration_);
        v58 = (void *)objc_msgSend(v57, "objectID");
        if (!objc_msgSend(v58, "isTemporaryID"))
          goto LABEL_92;
        if (objc_msgSend(v54, "indexOfObjectIdenticalTo:", objc_msgSend(v58, "entity")) == 0x7FFFFFFFFFFFFFFFLL)
          break;
        objc_msgSend(v58, "_setPersistentStore:", v85);
        if (v52 == ++v55)
          goto LABEL_66;
      }
      v75 = (void *)MEMORY[0x1E0C99DA0];
      v76 = *MEMORY[0x1E0C99778];
      v77 = CFSTR("Can't assign an object to a store that does not contain the object's entity.");
LABEL_94:
      objc_exception_throw((id)objc_msgSend(v75, "exceptionWithName:reason:userInfo:", v76, v77, 0));
    }
  }
LABEL_66:

  -[NSPersistentStoreCoordinator _copyMetadataFromStore:toStore:migrationManager:](v86, v88, v85, 0);
  if (v88)
  {
    v59 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    *(_QWORD *)&v105 = CFSTR("removed");
    v99[0] = v88;
    objc_msgSend(v59, "postNotificationName:object:userInfo:", CFSTR("_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification"), v86, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, &v105, 1));
  }
  -[NSPersistentStoreCoordinator _removePersistentStore:](v86, v88);
  *(_QWORD *)&v94 = 0;
  -[NSManagedObjectContext save:](v89, "save:", &v94);
  v1 = v84;
  if ((_QWORD)v94)
  {

    v78 = v89;
    v79 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 134030, (uint64_t)CFSTR("Save failed."), (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", (_QWORD)v94, CFSTR("NSCoreDataPrimaryError"), 0));
    objc_exception_throw(v79);
  }
  -[NSManagedObjectContext reset](v89, "reset");

  if ((_QWORD)v94)
    v60 = 0;
  else
    v60 = v42;
LABEL_72:
  *(_QWORD *)(*(_QWORD *)(v1[7] + 8) + 40) = v60;
}

- (BOOL)finishDeferredLightweightMigration:(NSError *)error
{
  return -[NSPersistentStoreCoordinator _finishDeferredLightweightMigrationTasks:withError:](self, 1, error);
}

- (BOOL)_finishDeferredLightweightMigrationTasks:(_QWORD *)a3 withError:
{
  id v4;
  uint64_t *v5;
  int v6;
  _BOOL8 v7;
  _QWORD v9[7];
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  if (!a1)
    return 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 1;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__18;
  v15 = __Block_byref_object_dispose__18;
  v16 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __113__NSPersistentStoreCoordinator_DeferredLightweightMigration___finishDeferredLightweightMigrationTasks_withError___block_invoke;
  v9[3] = &unk_1E1EDEE40;
  v10 = a2;
  v9[4] = a1;
  v9[5] = &v11;
  v9[6] = &v17;
  objc_msgSend(a1, "performBlockAndWait:", v9);
  v4 = (id)v12[5];
  v5 = v18;
  v6 = *((unsigned __int8 *)v18 + 24);
  if (a3 && !*((_BYTE *)v18 + 24))
  {
    *a3 = v12[5];
    v6 = *((unsigned __int8 *)v5 + 24);
  }
  v7 = v6 != 0;
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v7;
}

- (BOOL)finishDeferredLightweightMigrationTask:(NSError *)error
{
  return -[NSPersistentStoreCoordinator _finishDeferredLightweightMigrationTasks:withError:](self, 0, error);
}

- (id)_exceptionNoStoreSaveFailureForError:(id)a3 recommendedFrame:(int *)a4
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  const __CFString *v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (a4)
    *a4 = 0;
  if (a3)
  {
    v6 = objc_msgSend(a3, "code");
    v7 = (void *)objc_msgSend(a3, "domain");
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("NSSQLiteErrorDomain")))
      v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    else
      v8 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("NSSQLiteErrorDomain"));
    v16 = (void *)v8;
    v17 = *MEMORY[0x1E0CB2FE0];
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
      v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    else
      v18 = objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", v17);
    v19 = (void *)v18;
    if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      if (v6 == 134020 || v6 == 134100)
      {
        if (!a4)
          goto LABEL_19;
        goto LABEL_18;
      }
      v20 = v6 - 134171;
      if (a4 && v20 >= 0xFFFFFFFFFFFFFFB9)
      {
LABEL_18:
        *a4 = 2;
LABEL_19:
        v21 = CFSTR("(schema mismatch or migration failure)");
LABEL_34:
        v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This NSPersistentStoreCoordinator has no persistent stores %@.  It cannot perform a save operation."), v21);
        objc_msgSend(a3, "domain");
        objc_msgSend(a3, "code");
        objc_msgSend(a3, "userInfo");
        _NSCoreDataLog(1, (uint64_t)CFSTR("Illegal attempt to save to a file that was never opened.  \"%@\".  Last recorded error = %@(%ld) / %@\n"), v23, v24, v25, v26, v27, v28, (uint64_t)v9);
        return v9;
      }
      if (v20 > 0xFFFFFFFFFFFFFFB8)
        goto LABEL_19;
    }
    if (v16)
    {
      v22 = objc_msgSend(v16, "integerValue");
      switch(v22)
      {
        case 3:
          if (a4)
            *a4 = 5;
          v21 = CFSTR("(permission denied)");
          goto LABEL_34;
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 12:
          goto LABEL_31;
        case 10:
          if (a4)
            *a4 = 8;
          v21 = CFSTR("(I/O error)");
          goto LABEL_34;
        case 11:
          goto LABEL_28;
        case 13:
          if (a4)
            *a4 = 7;
          v21 = CFSTR("(disk full)");
          goto LABEL_34;
        case 14:
          if (a4)
            *a4 = 6;
          v21 = CFSTR("(can't open)");
          goto LABEL_34;
        default:
          if (v22 == 23)
          {
            if (a4)
              *a4 = 3;
            v21 = CFSTR("(device locked)");
          }
          else
          {
            if (v22 != 26)
              goto LABEL_31;
LABEL_28:
            if (a4)
              *a4 = 1;
            v21 = CFSTR("(corrupt file)");
          }
          break;
      }
    }
    else
    {
LABEL_31:
      if (v19)
        objc_msgSend(v19, "integerValue");
      v21 = CFSTR("(unknown)");
    }
    goto LABEL_34;
  }
  v9 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("This NSPersistentStoreCoordinator has no persistent stores %@.  It cannot perform a save operation."), CFSTR("(unknown)"));
  _NSCoreDataLog(1, (uint64_t)CFSTR("Illegal attempt to save to a file that was never opened. \"%@\". No last error recorded."), v10, v11, v12, v13, v14, v15, (uint64_t)v9);
  return v9;
}

- (_QWORD)_introspectLastErrorAndThrow
{
  uint64_t v1;
  int v2;

  if (result)
  {
    v2 = 0;
    v1 = objc_msgSend(result, "_exceptionNoStoreSaveFailureForError:recommendedFrame:", result[9], &v2);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v1, 0));
  }
  return result;
}

os_signpost_id_t __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_382(uint64_t a1)
{
  os_signpost_id_t v2;
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (PFInstrumentsGetLog_logtoken != -1)
    dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_23);
  v2 = os_signpost_id_generate((os_log_t)PFInstrumentsGetLog_coreDataInstrumentsLog);
  if (PFInstrumentsGetLog_logtoken != -1)
    dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_23);
  v3 = PFInstrumentsGetLog_coreDataInstrumentsLog;
  kdebug_trace();
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "entity"), "name");
    v6 = 138412290;
    v7 = v4;
    _os_signpost_emit_with_name_impl(&dword_18A253000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v2, "Fetch", "%@", (uint8_t *)&v6, 0xCu);
  }
  return v2;
}

void __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_387(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  unint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t m;
  _BYTE *v31;
  _WORD *v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  os_signpost_id_t v40;
  NSObject *v41;
  const __CFString *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i2;
  uint64_t v49;
  _BYTE *v50;
  _QWORD *v51;
  char v52;
  _QWORD *v53;
  _QWORD *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i3;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i4;
  _DWORD *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _DWORD *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t i5;
  _DWORD *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  NSSaveChangesRequest *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  NSSaveChangesRequest *v93;
  NSSaveChangesRequest *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  id v98;
  void *v99;
  uint64_t v100;
  id v101;
  void *v102;
  uint64_t v103;
  id v104;
  os_signpost_id_t v105;
  NSObject *v106;
  int v107;
  uint64_t v108;
  unsigned int *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  NSPersistentHistoryResult *v116;
  uint64_t v117;
  uint64_t i1;
  void *v119;
  void *v120;
  void *v121;
  _BOOL4 v122;
  id v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  id v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  unsigned __int8 *v134;
  id v135;
  uint64_t v136;
  unsigned int *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  id *v166;
  void *v167;
  uint64_t v168;
  unsigned int *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  id v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t i6;
  _QWORD *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  NSObject *v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  _QWORD *v215;
  int v216;
  int v217;
  uint64_t v218;
  uint64_t v219;
  void *v220;
  const __CFSet *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t jj;
  void *v225;
  void *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t kk;
  _DWORD *v230;
  void *v231;
  void *v232;
  void *v233;
  uint64_t v234;
  void *v235;
  uint64_t v236;
  uint64_t mm;
  _DWORD *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  int v243;
  uint64_t v244;
  void *v245;
  void *v246;
  _BOOL4 v247;
  NSPersistentHistoryResult *v248;
  uint64_t v249;
  uint64_t v250;
  id v251;
  uint64_t v252;
  _QWORD *v253;
  void *v254;
  uint64_t v255;
  NSPersistentCloudKitContainerEventResult *v256;
  NSSQLiteIndexStatisticsResult *v257;
  uint64_t v258;
  uint64_t v259;
  void *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t nn;
  _DWORD *v264;
  void *v265;
  void *v266;
  NSPersistentHistoryResult *v267;
  void *v268;
  uint64_t v269;
  __objc2_class **v270;
  id v271;
  int v272;
  uint64_t v273;
  os_signpost_id_t v274;
  NSObject *v275;
  unsigned int *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  int v283;
  NSPersistentHistoryResult *v284;
  unint64_t v285;
  void *v287;
  void *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t n;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  id v297;
  void *v298;
  id v299;
  uint64_t v300;
  void *v301;
  id v302;
  id v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t ii;
  void *v307;
  void *v308;
  void *v309;
  id v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  void *v314;
  void *v315;
  id v316;
  void *v317;
  id v318;
  void *v319;
  id v320;
  void *v321;
  uint64_t v322;
  id v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  void *v329;
  const __CFString *v330;
  id v331;
  uint64_t v332;
  os_signpost_id_t v333;
  NSObject *v334;
  void *v335;
  id v336;
  os_signpost_id_t v337;
  NSObject *v338;
  uint64_t v339;
  void *v340;
  uint64_t v341;
  const __CFString *v342;
  id v343;
  void *v344;
  id v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  void *v349;
  uint64_t v350;
  unint64_t v351;
  id v352;
  void *v353;
  void *v354;
  _WORD *obj;
  uint64_t v356;
  void *v357;
  int v358;
  void *v359;
  _QWORD *v360;
  _QWORD **context;
  void *contexta;
  void *contextb;
  void *contextc;
  unsigned __int8 *v365;
  void *v366;
  uint64_t v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  _QWORD v372[2];
  void (*v373)(uint64_t);
  void *v374;
  uint64_t v375;
  _WORD *v376;
  void *v377;
  _QWORD v378[2];
  void (*v379)(uint64_t);
  void *v380;
  uint64_t v381;
  void *v382;
  __int128 v383;
  __int128 v384;
  __int128 v385;
  __int128 v386;
  _QWORD v387[2];
  void (*v388)(uint64_t);
  void *v389;
  uint64_t v390;
  _WORD *v391;
  void *v392;
  __int128 v393;
  __int128 v394;
  __int128 v395;
  __int128 v396;
  id v397;
  __int128 v398;
  __int128 v399;
  __int128 v400;
  __int128 v401;
  __int128 v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  __int128 v406;
  __int128 v407;
  __int128 v408;
  __int128 v409;
  __int128 v410;
  __int128 v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  __int128 v416;
  __int128 v417;
  __int128 v418;
  __int128 v419;
  __int128 v420;
  __int128 v421;
  __int128 v422;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  __int128 v426;
  __int128 v427;
  __int128 v428;
  __int128 v429;
  const __CFString *v430;
  id v431;
  _BYTE v432[128];
  _BYTE v433[128];
  _QWORD v434[3];
  _QWORD v435[3];
  _QWORD v436[3];
  _QWORD v437[3];
  _QWORD v438[3];
  _QWORD v439[3];
  const __CFString *v440;
  _WORD *v441;
  _BYTE v442[128];
  uint64_t v443;
  uint64_t v444;
  _BYTE v445[128];
  _BYTE v446[128];
  const __CFString *v447;
  uint64_t v448;
  _BYTE v449[128];
  _BYTE v450[128];
  _BYTE v451[128];
  uint8_t v452[128];
  uint8_t v453[4];
  int v454;
  _BYTE buf[132];
  uint64_t v456;

  v456 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "affectedStores");
  v356 = a1;
  if (objc_msgSend(v4, "count"))
  {
    obj = (_WORD *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v406 = 0u;
    v407 = 0u;
    v408 = 0u;
    v409 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v406, v449, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v407;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v407 != v6)
            objc_enumerationMutation(v4);
          v8 = *(_QWORD *)(*((_QWORD *)&v406 + 1) + 8 * i);
          if (objc_msgSend(a2, "containsObject:", v8))
            objc_msgSend(obj, "addObject:", v8);
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v406, v449, 16);
      }
      while (v5);
    }
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    obj = (_WORD *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v410 = 0u;
    v411 = 0u;
    v412 = 0u;
    v413 = 0u;
    v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v410, v450, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v411;
      do
      {
        for (j = 0; j != v9; ++j)
        {
          if (*(_QWORD *)v411 != v10)
            objc_enumerationMutation(a2);
          v12 = *(void **)(*((_QWORD *)&v410 + 1) + 8 * j);
          if (objc_msgSend(*(id *)(v356 + 40), "containsObject:", objc_msgSend(v12, "identifier")))
            objc_msgSend(obj, "addObject:", v12);
        }
        v9 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v410, v450, 16);
      }
      while (v9);
    }
  }
  else
  {
    obj = a2;
  }
  v13 = *(_QWORD *)(v356 + 88);
  v14 = v13 > 7;
  v15 = (1 << v13) & 0xE4;
  if (v14 || v15 == 0)
  {
    if (!*(_QWORD *)(v356 + 48))
    {
      obj = 0;
      v17 = objc_msgSend(0, "count");
      goto LABEL_29;
    }
    v32 = (_WORD *)objc_msgSend(*(id *)(v356 + 56), "_queryGenerationToken");
    if (objc_msgSend(v32, "_isEnabled"))
    {
      if (+[NSQueryGenerationToken nostoresQueryGenerationToken](NSQueryGenerationToken, "nostoresQueryGenerationToken") == v32)
      {
        obj = (_WORD *)NSArray_EmptyArray;
        v17 = objc_msgSend((id)NSArray_EmptyArray, "count");
      }
      else
      {
        obj = -[_NSQueryGenerationToken _storesForRequestRoutingFrom:error:](v32, obj, 0);
        v17 = objc_msgSend(obj, "count");
      }
      goto LABEL_29;
    }
  }
  v17 = objc_msgSend(obj, "count");
LABEL_29:
  v351 = v17;
  if (objc_msgSend(obj, "count"))
  {
    if ((*(_QWORD *)(v356 + 88) | 2) != 3
      || ((v18 = (void *)objc_msgSend(*(id *)(v356 + 32), "entity"),
           v19 = objc_msgSend(v18, "managedObjectModel"),
           v20 = *(_QWORD *)(v356 + 48),
           v19 == *(_QWORD *)(v20 + 40))
       || (v21 = *(_QWORD *)(v20 + 96), v22 = _PFModelMapPathForEntity(v18), v21)
       && objc_msgSend(*(id *)(v21 + 56), "objectForKey:", v22))
      && *(_BYTE *)(v356 + 112))
    {
LABEL_37:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(*(id *)(v356 + 32), "_incrementInUseCounter");
      if (v351 >= 2)
      {
        v23 = *(_QWORD *)(v356 + 88);
        if (v23 > 7 || ((1 << v23) & 0xEA) == 0)
        {
          v397 = 0;
          goto LABEL_93;
        }
        v24 = (void *)objc_msgSend(obj, "mutableCopy");
        v25 = *(void **)(v356 + 32);
        if (*(_QWORD *)(v356 + 88) == 7)
          v25 = (void *)objc_msgSend(v25, "fetchRequest");
        v26 = (void *)objc_msgSend(v25, "entity");
        if (objc_msgSend((id)objc_msgSend(v26, "managedObjectModel"), "_modelsReferenceIDOffset") < 15001)
        {
          v400 = 0uLL;
          v401 = 0uLL;
          v398 = 0uLL;
          v399 = 0uLL;
          v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v398, v445, 16);
          if (v33)
          {
            v34 = 0;
            v35 = *(_QWORD *)v399;
            do
            {
              for (k = 0; k != v33; ++k)
              {
                if (*(_QWORD *)v399 != v35)
                  objc_enumerationMutation(obj);
                v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v398 + 1) + 8 * k), "configurationName");
                if (objc_msgSend(v37, "isEqualToString:", CFSTR("PF_DEFAULT_CONFIGURATION_NAME"))
                  || objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(v356 + 48) + 40), "entitiesForConfiguration:", v37), "indexOfObjectIdenticalTo:", v26) != 0x7FFFFFFFFFFFFFFFLL)
                {
                  ++v34;
                }
                else
                {
                  objc_msgSend(v24, "removeObjectAtIndex:", v34);
                }
              }
              v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v398, v445, 16);
            }
            while (v33);
          }
        }
        else
        {
          v404 = 0uLL;
          v405 = 0uLL;
          v402 = 0uLL;
          v403 = 0uLL;
          v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v402, v446, 16);
          if (v27)
          {
            v28 = 0;
            v29 = *(_QWORD *)v403;
            do
            {
              for (m = 0; m != v27; ++m)
              {
                if (*(_QWORD *)v403 != v29)
                  objc_enumerationMutation(obj);
                v31 = *(_BYTE **)(*((_QWORD *)&v402 + 1) + 8 * m);
                if (objc_msgSend((id)objc_msgSend(v31, "type"), "isEqualToString:", CFSTR("SQLite"))
                  && v31
                  && (v31[193] & 4) != 0)
                {
                  ++v28;
                }
                else
                {
                  objc_msgSend(v24, "removeObjectAtIndex:", v28);
                }
              }
              v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v402, v446, 16);
            }
            while (v27);
          }
        }
        if (objc_msgSend(v24, "count") == v351)
        {

        }
        else
        {
          obj = v24;
          v351 = objc_msgSend(obj, "count");
        }
      }
      v397 = 0;
      if (v351 == 1)
      {
        v365 = (unsigned __int8 *)objc_msgSend(obj, "objectAtIndex:", 0);
        v38 = v356;
        v39 = *(_QWORD *)(v356 + 88);
        if (v39 != 2)
        {
          *(_QWORD *)buf = 0;
          -[NSPersistentStoreCoordinator replaceResultTypeOfRequestIfNecessary:store:requestType:originalResultType:](*(_QWORD *)(v356 + 48), *(void **)(v356 + 32), v365, v39, buf);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v356 + 64) + 8) + 40) = objc_msgSend(v365, "executeRequest:withContext:error:", *(_QWORD *)(v356 + 32), *(_QWORD *)(v356 + 56), &v397);
          if (*(_QWORD *)(v356 + 88) == 1 && *(_QWORD *)(v356 + 96))
          {
            if (PFInstrumentsGetLog_logtoken != -1)
              dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_23);
            v38 = v356;
            v105 = *(_QWORD *)(v356 + 96);
            if (v105 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v106 = PFInstrumentsGetLog_coreDataInstrumentsLog;
              if (os_signpost_enabled((os_log_t)PFInstrumentsGetLog_coreDataInstrumentsLog))
              {
                v107 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v356 + 64) + 8) + 40), "count");
                *(_DWORD *)v453 = 67109120;
                v454 = v107;
                _os_signpost_emit_with_name_impl(&dword_18A253000, v106, OS_SIGNPOST_INTERVAL_END, v105, "Fetch", "%d", v453, 8u);
                v38 = v356;
              }
            }
          }
          if (*(_QWORD *)(v38 + 48))
          {
            if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v38 + 64) + 8) + 40))
            {
              v108 = *(_QWORD *)(v38 + 88);
              if (objc_msgSend((id)objc_msgSend(v365, "type"), "isEqualToString:", CFSTR("SQLite")))
              {
                if (objc_msgSend(v365, "coreSpotlightExporter") && (unint64_t)(v108 - 5) <= 2)
                {
                  v109 = (unsigned int *)objc_msgSend(v365, "coreSpotlightExporter");
                  -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexFromBatchResult:](v109, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v38 + 64) + 8) + 40), v110, v111, v112, v113, v114, v115, v347);
                  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v38 + 64) + 8) + 40) = -[NSPersistentStoreCoordinator restoreOriginalRequestIfNecessary:store:swizzledResults:originalRequestType:originalResultType:](*(_QWORD *)(v38 + 48), *(void **)(v38 + 32), (uint64_t)v365, *(void **)(*(_QWORD *)(*(_QWORD *)(v38 + 64) + 8)+ 40), *(_QWORD *)(v38 + 88), *(uint64_t *)buf);
                }
              }
            }
          }
          if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v38 + 64) + 8) + 40) && *(_QWORD *)(v38 + 104))
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v38 + 80) + 8) + 40) = v397;
          goto LABEL_428;
        }
        if (objc_msgSend(v365, "isReadOnly"))
        {
          if (*(_QWORD *)(v356 + 96))
          {
            if (PFInstrumentsGetLog_logtoken != -1)
              dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_23);
            v40 = *(_QWORD *)(v356 + 96);
            if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v41 = PFInstrumentsGetLog_coreDataInstrumentsLog;
              if (os_signpost_enabled((os_log_t)PFInstrumentsGetLog_coreDataInstrumentsLog))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_18A253000, v41, OS_SIGNPOST_INTERVAL_END, v40, "Save", (const char *)&unk_18A57BACF, buf, 2u);
              }
            }
          }
          if (objc_msgSend((id)objc_msgSend(v365, "options"), "objectForKey:", CFSTR("NSReadOnlyPersistentStoreOption")))
          {
            v42 = CFSTR("Unable to write to file opened Read Only.");
          }
          else
          {
            v42 = CFSTR("File is in Read Only mode due to Persistent History being detected but NSPersistentHistoryTrackingKey was not included.");
          }
          v43 = (void *)MEMORY[0x1E0C99D80];
          v44 = objc_msgSend((id)objc_msgSend(v365, "URL"), "path");
          v45 = objc_msgSend(v365, "options");
          if (!v45)
            v45 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v46 = objc_msgSend(v43, "dictionaryWithObjectsAndKeys:", v44, CFSTR("storeURL"), v45, CFSTR("NSPersistentStoreOptions"), v42, CFSTR("reason"), 0);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v356 + 80) + 8) + 40) = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 513, v46);
          v47 = *(_QWORD *)(v356 + 64);
LABEL_387:
          *(_QWORD *)(*(_QWORD *)(v47 + 8) + 40) = 0;
LABEL_428:
          v285 = *(_QWORD *)(v356 + 88);
          if (v285 <= 7 && ((1 << v285) & 0xE4) != 0)
          {
            if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v356 + 64) + 8) + 40))
            {
              v287 = *(void **)(v356 + 56);
              if (v287)
              {
                if (v285 == 2
                  && objc_msgSend((id)objc_msgSend(v287, "_queryGenerationToken"), "_isEnabled"))
                {
                  v387[0] = MEMORY[0x1E0C809B0];
                  v387[1] = 3221225472;
                  v388 = __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_430;
                  v389 = &unk_1E1EDD790;
                  v288 = *(void **)(v356 + 56);
                  v390 = *(_QWORD *)(v356 + 48);
                  v391 = obj;
                  v392 = v288;
                  if (objc_msgSend(v288, "concurrencyType"))
                    objc_msgSend(*(id *)(v356 + 48), "performBlockAndWait:", v387);
                  else
                    v388((uint64_t)v387);
                }
                else
                {
                  v385 = 0u;
                  v386 = 0u;
                  v383 = 0u;
                  v384 = 0u;
                  v289 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v383, v433, 16);
                  if (v289)
                  {
                    v290 = *(_QWORD *)v384;
                    v291 = MEMORY[0x1E0C809B0];
                    do
                    {
                      for (n = 0; n != v289; ++n)
                      {
                        if (*(_QWORD *)v384 != v290)
                          objc_enumerationMutation(obj);
                        v293 = *(void **)(*((_QWORD *)&v383 + 1) + 8 * n);
                        if (objc_msgSend(v293, "supportsGenerationalQuerying")
                          && objc_msgSend(v293, "_hasActiveGenerations"))
                        {
                          v378[0] = v291;
                          v378[1] = 3221225472;
                          v379 = __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_2;
                          v380 = &unk_1E1EDD430;
                          v294 = *(void **)(v356 + 56);
                          v381 = *(_QWORD *)(v356 + 48);
                          v382 = v293;
                          if (objc_msgSend(v294, "concurrencyType"))
                            objc_msgSend(*(id *)(v356 + 48), "performBlockAndWait:", v378);
                          else
                            v379((uint64_t)v378);
                        }
                      }
                      v289 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v383, v433, 16);
                    }
                    while (v289);
                  }
                }
                if (-[NSPersistentStoreCoordinator _hasHistoryTracking:](*(_QWORD *)(v356 + 48), obj))
                {
                  v372[0] = MEMORY[0x1E0C809B0];
                  v372[1] = 3221225472;
                  v373 = __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_3;
                  v374 = &unk_1E1EDD790;
                  v295 = *(void **)(v356 + 56);
                  v375 = *(_QWORD *)(v356 + 48);
                  v376 = obj;
                  v377 = v295;
                  if (objc_msgSend(v295, "concurrencyType"))
                    objc_msgSend(*(id *)(v356 + 48), "performBlockAndWait:", v372);
                  else
                    v373((uint64_t)v372);
                }
              }
            }
          }
          v296 = *(void **)(*(_QWORD *)(*(_QWORD *)(v356 + 80) + 8) + 40);
          if (v296)
            v297 = v296;
          v298 = *(void **)(*(_QWORD *)(*(_QWORD *)(v356 + 64) + 8) + 40);
          if (v298)
            v299 = v298;
          if (*(_QWORD *)(v356 + 88) == 2)
          {
            v300 = *(_QWORD *)(v356 + 32);
            if (v300)
              v301 = *(_QWORD *)(v300 + 56) ? *(void **)(v300 + 56) : (void *)MEMORY[0x1E0C9AA60];
            else
              v301 = 0;
            if (objc_msgSend(v301, "count"))
            {
              v302 = (id)objc_msgSend(v301, "firstObject");
              if ((unint64_t)objc_msgSend(v301, "count") >= 2)
              {
                contextc = (void *)MEMORY[0x18D76B4E4]();
                v303 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                v370 = 0u;
                v371 = 0u;
                v368 = 0u;
                v369 = 0u;
                v304 = objc_msgSend(v301, "countByEnumeratingWithState:objects:count:", &v368, v432, 16);
                if (v304)
                {
                  v305 = *(_QWORD *)v369;
                  do
                  {
                    for (ii = 0; ii != v304; ++ii)
                    {
                      if (*(_QWORD *)v369 != v305)
                        objc_enumerationMutation(v301);
                      v307 = *(void **)(*((_QWORD *)&v368 + 1) + 8 * ii);
                      v308 = (void *)MEMORY[0x18D76B4E4]();
                      v309 = (void *)objc_msgSend((id)objc_msgSend(v307, "userInfo"), "objectForKey:", CFSTR("_NSManagedObjectContextObjectIDMutationMappingKey"));
                      if (objc_msgSend(v309, "count"))
                        objc_msgSend(v303, "addEntriesFromDictionary:", v309);
                      objc_autoreleasePoolPop(v308);
                    }
                    v304 = objc_msgSend(v301, "countByEnumeratingWithState:objects:count:", &v368, v432, 16);
                  }
                  while (v304);
                }
                v310 = objc_alloc(MEMORY[0x1E0CB37C0]);
                v311 = objc_msgSend(v302, "name");
                v312 = objc_msgSend(v302, "object");
                v430 = CFSTR("_NSManagedObjectContextObjectIDMutationMappingKey");
                v431 = v303;
                v313 = objc_msgSend(v310, "initWithName:object:userInfo:", v311, v312, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v431, &v430, 1));

                objc_autoreleasePoolPop(contextc);
                v302 = (id)v313;
              }
              v314 = (void *)MEMORY[0x18D76B4E4]();
              objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v302);
              if (v300)
              {

                *(_QWORD *)(v300 + 56) = 0;
              }

              objc_autoreleasePoolPop(v314);
            }
          }
          return;
        }
        objc_msgSend(v365, "_preflightCrossCheck");
        contextb = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        if (!*(_QWORD *)(v356 + 48))
        {
LABEL_394:
          if (objc_msgSend(contextb, "count"))
          {
            if (*(_QWORD *)(v356 + 96))
            {
              if (PFInstrumentsGetLog_logtoken != -1)
                dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_23);
              v337 = *(_QWORD *)(v356 + 96);
              if (v337 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
              {
                v338 = PFInstrumentsGetLog_coreDataInstrumentsLog;
                if (os_signpost_enabled((os_log_t)PFInstrumentsGetLog_coreDataInstrumentsLog))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_18A253000, v338, OS_SIGNPOST_INTERVAL_END, v337, "Save", (const char *)&unk_18A57BACF, buf, 2u);
                }
              }
            }
            v339 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", contextb, CFSTR("conflictList"));
            objc_exception_throw(+[_NSCoreDataOptimisticLockingException exceptionWithName:reason:userInfo:](_NSCoreDataOptimisticLockingException, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("optimistic locking failure"), v339));
          }
          v272 = objc_msgSend(v365, "_prepareForExecuteRequest:withContext:error:", *(_QWORD *)(v356 + 32), *(_QWORD *)(v356 + 56), &v397);
          if (v272)
            v273 = objc_msgSend(v365, "executeRequest:withContext:error:", *(_QWORD *)(v356 + 32), *(_QWORD *)(v356 + 56), &v397);
          else
            v273 = 0;
          if (*(_QWORD *)(v356 + 96))
          {
            if (PFInstrumentsGetLog_logtoken != -1)
              dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_23);
            v274 = *(_QWORD *)(v356 + 96);
            if (v274 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v275 = PFInstrumentsGetLog_coreDataInstrumentsLog;
              if (os_signpost_enabled((os_log_t)PFInstrumentsGetLog_coreDataInstrumentsLog))
              {
                *(_WORD *)buf = 0;
                _os_signpost_emit_with_name_impl(&dword_18A253000, v275, OS_SIGNPOST_INTERVAL_END, v274, "Save", (const char *)&unk_18A57BACF, buf, 2u);
              }
            }
          }
          if (v273)
          {
            if (objc_msgSend(v365, "coreSpotlightExporter"))
            {
              v276 = (unsigned int *)objc_msgSend(v365, "coreSpotlightExporter");
              -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexFromSaveRequest:](v276, *(_QWORD *)(v356 + 32), v277, v278, v279, v280, v281, v282, v347);
            }
          }
          else
          {
            if (v397)
              v283 = v272;
            else
              v283 = 0;
            if (v283 == 1 && objc_msgSend(v397, "code") == 134050)
            {
              v346 = objc_msgSend(v397, "userInfo");
              objc_exception_throw(+[_NSCoreDataOptimisticLockingException exceptionWithName:reason:userInfo:](_NSCoreDataOptimisticLockingException, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("optimistic locking failure"), v346));
            }
            if (*(_QWORD *)(v356 + 104))
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v356 + 80) + 8) + 40) = v397;
          }
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v356 + 64) + 8) + 40) = v273;
          goto LABEL_428;
        }
        v215 = *(_QWORD **)(v356 + 56);
        v360 = *(_QWORD **)(v356 + 32);
        if (_PF_Threading_Debugging_level)
          _PFAssertSafeMultiThreadedAccess_impl((uint64_t)v215, sel__checkRequestForStore_withContext_originalRequest_andOptimisticLocking_);
        v216 = objc_msgSend(v365, "isReadOnly");
        if (objc_msgSend((id)objc_msgSend(v360, "insertedObjects"), "count"))
          v217 = v216;
        else
          v217 = 0;
        if (v217 == 1)
        {
          v335 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v365), CFSTR("NSAffectedStoresErrorKey"), 0);
          v336 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99778], 134030, (uint64_t)CFSTR("Cannot insert objects into a read only store."), v335);
          objc_exception_throw(v336);
        }
        objc_msgSend(v215, "stalenessInterval");
        v219 = v218;
        if (v215)
          v215[18] = NSSQLDistantPastTimeInterval;
        v352 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
        v354 = (void *)objc_msgSend(v215, "_queryGenerationToken");
        v358 = objc_msgSend(v354, "_isEnabled");
        if (v358)
          objc_msgSend(v215, "_setQueryGenerationFromToken:error:", +[NSQueryGenerationToken unpinnedQueryGenerationToken](NSQueryGenerationToken, "unpinnedQueryGenerationToken"), 0);
        v220 = (void *)objc_msgSend(v360, "insertedObjects");
        if (objc_msgSend(v220, "count"))
        {
          if (objc_msgSend(v365, "configurationName"))
          {
            v221 = (const __CFSet *)objc_msgSend(v365, "_entitiesForConfiguration");
            v429 = 0u;
            v428 = 0u;
            v426 = 0u;
            v427 = 0u;
            v222 = objc_msgSend(v220, "countByEnumeratingWithState:objects:count:", &v426, buf, 16);
            if (v222)
            {
              v223 = *(_QWORD *)v427;
              do
              {
                for (jj = 0; jj != v222; ++jj)
                {
                  if (*(_QWORD *)v427 != v223)
                    objc_enumerationMutation(v220);
                  v225 = *(void **)(*((_QWORD *)&v426 + 1) + 8 * jj);
                  if (!CFSetContainsValue(v221, (const void *)objc_msgSend(v225, "entity")))
                  {
                    v321 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v225, CFSTR("NSAffectedObjectsErrorKey"), 0);
                    v322 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Store %@ cannot hold instances of entity %@"), v365, objc_msgSend(v225, "entity"));
                    v323 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99778], 134020, v322, v321);
                    objc_exception_throw(v323);
                  }
                }
                v222 = objc_msgSend(v220, "countByEnumeratingWithState:objects:count:", &v426, buf, 16);
              }
              while (v222);
            }
          }
        }
        v226 = (void *)objc_msgSend(v360, "updatedObjects");
        if (objc_msgSend(v226, "count"))
        {
          if (v216)
          {
            v340 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v365), CFSTR("NSAffectedStoresErrorKey"), 0);
            v341 = *MEMORY[0x1E0C99778];
            v342 = CFSTR("Cannot update objects into a read only store.");
            goto LABEL_514;
          }
          v424 = 0u;
          v425 = 0u;
          v422 = 0u;
          v423 = 0u;
          v227 = objc_msgSend(v226, "countByEnumeratingWithState:objects:count:", &v422, v453, 16);
          if (v227)
          {
            v228 = *(_QWORD *)v423;
            do
            {
              for (kk = 0; kk != v227; ++kk)
              {
                if (*(_QWORD *)v423 != v228)
                  objc_enumerationMutation(v226);
                v230 = *(_DWORD **)(*((_QWORD *)&v422 + 1) + 8 * kk);
                v231 = (void *)MEMORY[0x18D76B4E4]();
                if (objc_msgSend((id)objc_msgSend(v230, "objectID"), "isTemporaryID"))
                {
                  v315 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v230), CFSTR("NSAffectedObjectsErrorKey"), 0);
                  v316 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99778], 134030, (uint64_t)CFSTR("Cannot update object that was never inserted."), v315);
                  objc_exception_throw(v316);
                }
                v232 = -[NSPersistentStoreCoordinator _conflictsWithRowCacheForObject:withContext:andStore:](v230, (_QWORD **)v215, v365);
                if (v232)
                  objc_msgSend(contextb, "addObject:", v232);
                objc_autoreleasePoolPop(v231);
              }
              v227 = objc_msgSend(v226, "countByEnumeratingWithState:objects:count:", &v422, v453, 16);
            }
            while (v227);
          }
        }
        v233 = (void *)objc_msgSend(v360, "deletedObjects");
        if (!objc_msgSend(v233, "count"))
          goto LABEL_359;
        if (!v216)
        {
          v420 = 0u;
          v421 = 0u;
          v418 = 0u;
          v419 = 0u;
          v234 = objc_msgSend(v233, "countByEnumeratingWithState:objects:count:", &v418, v452, 16);
          if (v234)
          {
            v235 = 0;
            v236 = *(_QWORD *)v419;
            do
            {
              for (mm = 0; mm != v234; ++mm)
              {
                if (*(_QWORD *)v419 != v236)
                  objc_enumerationMutation(v233);
                v238 = *(_DWORD **)(*((_QWORD *)&v418 + 1) + 8 * mm);
                v239 = (void *)MEMORY[0x18D76B4E4]();
                if (objc_msgSend((id)objc_msgSend(v238, "objectID"), "isTemporaryID"))
                {
                  v317 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v238), CFSTR("NSAffectedObjectsErrorKey"), 0);
                  v318 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99778], 134030, (uint64_t)CFSTR("Cannot delete object that was never inserted."), v317);
                  objc_exception_throw(v318);
                }
                v240 = -[NSPersistentStoreCoordinator _conflictsWithRowCacheForObject:withContext:andStore:](v238, (_QWORD **)v215, v365);
                v241 = v240;
                if (v240)
                {
                  if (objc_msgSend((id)objc_msgSend(v240, "objectForKey:", CFSTR("newVersion")), "intValue"))
                  {
                    objc_msgSend(contextb, "addObject:", v241);
                  }
                  else
                  {
                    v242 = v235;
                    if (!v235)
                      v242 = (void *)objc_msgSend((id)objc_msgSend(v360, "deletedObjects"), "mutableCopy");
                    v235 = v242;
                    objc_msgSend(v242, "removeObject:", v238);
                  }
                }
                objc_autoreleasePoolPop(v239);
              }
              v234 = objc_msgSend(v233, "countByEnumeratingWithState:objects:count:", &v418, v452, 16);
            }
            while (v234);
LABEL_360:
            if (v215)
              v215[18] = v219;
            v260 = (void *)objc_msgSend(v360, "lockedObjects");
            if (objc_msgSend(v260, "count"))
            {
              v416 = 0u;
              v417 = 0u;
              v414 = 0u;
              v415 = 0u;
              v261 = objc_msgSend(v260, "countByEnumeratingWithState:objects:count:", &v414, v451, 16);
              if (v261)
              {
                v262 = *(_QWORD *)v415;
                do
                {
                  for (nn = 0; nn != v261; ++nn)
                  {
                    if (*(_QWORD *)v415 != v262)
                      objc_enumerationMutation(v260);
                    v264 = *(_DWORD **)(*((_QWORD *)&v414 + 1) + 8 * nn);
                    v265 = (void *)MEMORY[0x18D76B4E4]();
                    if (objc_msgSend((id)objc_msgSend(v264, "objectID"), "isTemporaryID"))
                    {
                      v319 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v264), CFSTR("NSAffectedObjectsErrorKey"), 0);
                      v320 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99778], 134030, (uint64_t)CFSTR("Cannot lock object that was never inserted."), v319);
                      objc_exception_throw(v320);
                    }
                    v266 = -[NSPersistentStoreCoordinator _conflictsWithRowCacheForObject:withContext:andStore:](v264, (_QWORD **)v215, v365);
                    if (v266)
                      objc_msgSend(contextb, "addObject:", v266);
                    objc_autoreleasePoolPop(v265);
                  }
                  v261 = objc_msgSend(v260, "countByEnumeratingWithState:objects:count:", &v414, v451, 16);
                }
                while (v261);
              }
              if (!v215)
                goto LABEL_390;
            }
            else if (!v215)
            {
LABEL_390:
              if (v358)
                objc_msgSend(v215, "_setQueryGenerationFromToken:error:", v354, 0);
              objc_msgSend(v352, "drain");
              v271 = 0;
              if (v235)
              {
                -[NSSaveChangesRequest setDeletedObjects:](v360, v235);

              }
              goto LABEL_394;
            }
            v215[18] = v219;
            goto LABEL_390;
          }
LABEL_359:
          v235 = 0;
          goto LABEL_360;
        }
        v340 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v365), CFSTR("NSAffectedStoresErrorKey"), 0);
        v341 = *MEMORY[0x1E0C99778];
        v342 = CFSTR("Cannot delete objects into a read only store.");
LABEL_514:
        v343 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v341, 134030, (uint64_t)v342, v340);
        objc_exception_throw(v343);
      }
      v23 = *(_QWORD *)(v356 + 88);
LABEL_93:
      switch(v23)
      {
        case 1uLL:
          v121 = (void *)objc_msgSend(*(id *)(v356 + 32), "sortDescriptors");
          v122 = objc_msgSend(v121, "count")
              && objc_msgSend(*(id *)(v356 + 32), "includesPropertyValues")
              && objc_msgSend(*(id *)(v356 + 32), "resultType") != 1;
          objc_msgSend((id)objc_msgSend(*(id *)(v356 + 32), "propertiesToGroupBy"), "count");
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v356 + 64) + 8) + 40) = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v351);
          if (!v351)
          {
            v243 = 0;
LABEL_379:
            if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v356 + 64) + 8) + 40), "count") >= 2
              && ((v243 ^ 1) & 1) == 0
              && v122)
            {
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v356 + 64) + 8) + 40), "sortUsingDescriptors:", v121);
            }
            goto LABEL_428;
          }
          v243 = 0;
          v244 = 0;
          while (1)
          {
            v245 = (void *)objc_msgSend((id)objc_msgSend(obj, "objectAtIndex:", v244), "executeRequest:withContext:error:", *(_QWORD *)(v356 + 32), *(_QWORD *)(v356 + 56), &v397);
            v246 = v245;
            if (!v245)
              break;
            if (objc_msgSend(v245, "count"))
            {
              v247 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v356 + 64) + 8) + 40), "count") != 0;
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v356 + 64) + 8) + 40), "addObjectsFromArray:", v246);
              v243 |= v247;
            }
            if (v351 == ++v244)
              goto LABEL_379;
          }
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v356 + 80) + 8) + 40) = v397;
          v47 = *(_QWORD *)(v356 + 64);
          goto LABEL_387;
        case 3uLL:
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v356 + 64) + 8) + 40) = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v351);
          if (v351)
          {
            v117 = 0;
            for (i1 = 0; i1 != v351; ++i1)
            {
              v119 = (void *)objc_msgSend((id)objc_msgSend(obj, "objectAtIndex:", i1), "executeRequest:withContext:error:", *(_QWORD *)(v356 + 32), *(_QWORD *)(v356 + 56), *(_QWORD *)(*(_QWORD *)(v356 + 80) + 8) + 40);
              v120 = v119;
              if (v119 && objc_msgSend(v119, "count"))
                v117 = objc_msgSend((id)objc_msgSend(v120, "lastObject"), "unsignedIntValue")
                     + v117;
            }
          }
          else
          {
            v117 = 0;
          }
          v267 = (NSPersistentHistoryResult *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v117));
          break;
        case 2uLL:
          if (v351)
          {
            for (i2 = 0; i2 != v351; ++i2)
              objc_msgSend((id)objc_msgSend(obj, "objectAtIndex:", i2), "_preflightCrossCheck");
          }
          -[NSPersistentStoreCoordinator _doPreSaveAssignmentsForObjects:intoStores:](*(_QWORD *)(v356 + 48), (void *)objc_msgSend(*(id *)(v356 + 32), "insertedObjects"), obj);
          v349 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v351);
          v359 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          if (v351)
          {
            v49 = 0;
            v348 = *MEMORY[0x1E0C99778];
            do
            {
              v350 = v49;
              v50 = (_BYTE *)objc_msgSend(obj, "objectAtIndex:");
              if (*(_QWORD *)(v356 + 48))
              {
                v51 = *(_QWORD **)(v356 + 56);
                v353 = *(void **)(v356 + 32);
                if (_PF_Threading_Debugging_level)
                  _PFAssertSafeMultiThreadedAccess_impl((uint64_t)v51, sel__saveRequestForStore_withContext_originalRequest_andOptimisticLocking_);
                v52 = objc_msgSend(v50, "isReadOnly");
                objc_msgSend(v51, "stalenessInterval");
                v54 = v53;
                if (v51)
                  v51[18] = NSSQLDistantPastTimeInterval;
                context = (_QWORD **)v51;
                v55 = (void *)objc_msgSend(v353, "insertedObjects");
                v429 = 0u;
                v428 = 0u;
                v426 = 0u;
                v427 = 0u;
                v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v426, buf, 16);
                if (v56)
                {
                  v366 = 0;
                  v57 = *(_QWORD *)v427;
                  do
                  {
                    for (i3 = 0; i3 != v56; ++i3)
                    {
                      if (*(_QWORD *)v427 != v57)
                        objc_enumerationMutation(v55);
                      v59 = *(void **)(*((_QWORD *)&v426 + 1) + 8 * i3);
                      if ((_BYTE *)objc_msgSend((id)objc_msgSend(v59, "objectID"), "persistentStore") == v50)
                      {
                        if ((v52 & 1) != 0)
                        {

                          v96 = (void *)MEMORY[0x1E0C99D80];
                          v97 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v50);
                          v98 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v348, 134030, (uint64_t)CFSTR("Cannot insert objects into a read only store."), (void *)objc_msgSend(v96, "dictionaryWithObjectsAndKeys:", v97, CFSTR("NSAffectedStoresErrorKey"), objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v59), CFSTR("NSAffectedObjectsErrorKey"), 0));
                          objc_exception_throw(v98);
                        }
                        v60 = v366;
                        if (!v366)
                          v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(v353, "insertedObjects"), "count"));
                        v366 = v60;
                        objc_msgSend(v60, "addObject:", v59);
                      }
                    }
                    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v426, buf, 16);
                  }
                  while (v56);
                }
                else
                {
                  v366 = 0;
                }
                v61 = (void *)objc_msgSend(v353, "updatedObjects");
                v424 = 0u;
                v425 = 0u;
                v422 = 0u;
                v423 = 0u;
                v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v422, v453, 16);
                if (v62)
                {
                  v357 = 0;
                  v63 = *(_QWORD *)v423;
                  do
                  {
                    for (i4 = 0; i4 != v62; ++i4)
                    {
                      if (*(_QWORD *)v423 != v63)
                        objc_enumerationMutation(v61);
                      v65 = *(_DWORD **)(*((_QWORD *)&v422 + 1) + 8 * i4);
                      v66 = (void *)MEMORY[0x18D76B4E4]();
                      if ((_BYTE *)objc_msgSend((id)objc_msgSend(v65, "objectID"), "persistentStore") == v50)
                      {
                        if ((v52 & 1) != 0)
                        {

                          v99 = (void *)MEMORY[0x1E0C99D80];
                          v100 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v50);
                          v101 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v348, 134030, (uint64_t)CFSTR("Cannot update objects into a read only store."), (void *)objc_msgSend(v99, "dictionaryWithObjectsAndKeys:", v100, CFSTR("NSAffectedStoresErrorKey"), objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v65), CFSTR("NSAffectedObjectsErrorKey"), 0));
                          objc_exception_throw(v101);
                        }
                        v67 = -[NSPersistentStoreCoordinator _conflictsWithRowCacheForObject:withContext:andStore:](v65, context, v50);
                        if (v67)
                        {
                          objc_msgSend(v359, "addObject:", v67);
                        }
                        else
                        {
                          v68 = v357;
                          if (!v357)
                            v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(v353, "updatedObjects"), "count"));
                          v357 = v68;
                          objc_msgSend(v68, "addObject:", v65);
                        }
                      }
                      objc_autoreleasePoolPop(v66);
                    }
                    v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v422, v453, 16);
                  }
                  while (v62);
                }
                else
                {
                  v357 = 0;
                }
                v69 = (void *)objc_msgSend(v353, "deletedObjects");
                v420 = 0u;
                v421 = 0u;
                v418 = 0u;
                v419 = 0u;
                v70 = 0;
                v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v418, v452, 16);
                if (v71)
                {
                  v72 = *(_QWORD *)v419;
                  do
                  {
                    v73 = 0;
                    do
                    {
                      if (*(_QWORD *)v419 != v72)
                        objc_enumerationMutation(v69);
                      v74 = *(_DWORD **)(*((_QWORD *)&v418 + 1) + 8 * v73);
                      v75 = (void *)MEMORY[0x18D76B4E4]();
                      if ((_BYTE *)objc_msgSend((id)objc_msgSend(v74, "objectID"), "persistentStore") == v50)
                      {
                        if ((v52 & 1) != 0)
                        {

                          v102 = (void *)MEMORY[0x1E0C99D80];
                          v103 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v50);
                          v104 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, v348, 134030, (uint64_t)CFSTR("Cannot delete objects into a read only store."), (void *)objc_msgSend(v102, "dictionaryWithObjectsAndKeys:", v103, CFSTR("NSAffectedStoresErrorKey"), objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v74), CFSTR("NSAffectedObjectsErrorKey"), 0));
                          objc_exception_throw(v104);
                        }
                        v76 = -[NSPersistentStoreCoordinator _conflictsWithRowCacheForObject:withContext:andStore:](v74, context, v50);
                        v77 = v76;
                        if (v76)
                        {
                          if (objc_msgSend((id)objc_msgSend(v76, "objectForKey:", CFSTR("newVersion")), "intValue"))
                          {
                            objc_msgSend(v359, "addObject:", v77);
                          }
                          else if (!v70)
                          {
                            v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(v353, "deletedObjects"), "count"));
                          }
                        }
                        else
                        {
                          if (!v70)
                            v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(v353, "deletedObjects"), "count"));
                          objc_msgSend(v70, "addObject:", v74);
                        }
                      }
                      objc_autoreleasePoolPop(v75);
                      ++v73;
                    }
                    while (v71 != v73);
                    v78 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v418, v452, 16);
                    v71 = v78;
                  }
                  while (v78);
                }
                if (context)
                  context[18] = v54;
                v79 = (void *)objc_msgSend(v353, "lockedObjects");
                v416 = 0u;
                v417 = 0u;
                v414 = 0u;
                v415 = 0u;
                v80 = 0;
                v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v414, v451, 16);
                if (v81)
                {
                  v82 = *(_QWORD *)v415;
                  do
                  {
                    for (i5 = 0; i5 != v81; ++i5)
                    {
                      if (*(_QWORD *)v415 != v82)
                        objc_enumerationMutation(v79);
                      v84 = *(_DWORD **)(*((_QWORD *)&v414 + 1) + 8 * i5);
                      v85 = (void *)MEMORY[0x18D76B4E4]();
                      if ((_BYTE *)objc_msgSend((id)objc_msgSend(v84, "objectID"), "persistentStore") == v50)
                      {
                        v86 = -[NSPersistentStoreCoordinator _conflictsWithRowCacheForObject:withContext:andStore:](v84, context, v50);
                        if (v86)
                        {
                          objc_msgSend(v359, "addObject:", v86);
                        }
                        else
                        {
                          if (!v80)
                            v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(v353, "lockedObjects"), "count"));
                          objc_msgSend(v80, "addObject:", v84);
                        }
                      }
                      objc_autoreleasePoolPop(v85);
                    }
                    v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v414, v451, 16);
                  }
                  while (v81);
                }
                if (context)
                  context[18] = v54;
                v87 = objc_msgSend(v359, "count");
                v88 = [NSSaveChangesRequest alloc];
                if (v87)
                  v89 = 0;
                else
                  v89 = v366;
                if (v87)
                  v90 = 0;
                else
                  v90 = v357;
                if (v87)
                  v91 = 0;
                else
                  v91 = v70;
                if (v87)
                  v92 = 0;
                else
                  v92 = v80;
                v93 = -[NSSaveChangesRequest initWithInsertedObjects:updatedObjects:deletedObjects:lockedObjects:](v88, "initWithInsertedObjects:updatedObjects:deletedObjects:lockedObjects:", v89, v90, v91, v92);

                v94 = v93;
              }
              else
              {
                v94 = 0;
              }
              if ((objc_msgSend(v50, "isReadOnly") & 1) == 0
                && (-[NSSaveChangesRequest hasChanges]((_BOOL8)v94) || v50 && (v50[56] & 4) != 0))
              {
                v347 = 0;
                v95 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v50);
                -[NSPersistentStoreRequest setAffectedStores:](v94, "setAffectedStores:", v95);

                objc_msgSend(v349, "addObject:", v94);
              }
              v49 = v350 + 1;
            }
            while (v350 + 1 != v351);
          }
          if (objc_msgSend(v359, "count"))
          {
            v332 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v359, CFSTR("conflictList"));
            if (*(_QWORD *)(v356 + 96))
            {
              if (PFInstrumentsGetLog_logtoken != -1)
                dispatch_once(&PFInstrumentsGetLog_logtoken, &__block_literal_global_23);
              v333 = *(_QWORD *)(v356 + 96);
              if (v333 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
              {
                v334 = PFInstrumentsGetLog_coreDataInstrumentsLog;
                if (os_signpost_enabled((os_log_t)PFInstrumentsGetLog_coreDataInstrumentsLog))
                {
                  *(_WORD *)buf = 0;
                  _os_signpost_emit_with_name_impl(&dword_18A253000, v334, OS_SIGNPOST_INTERVAL_END, v333, "Save", (const char *)&unk_18A57BACF, buf, 2u);
                }
              }
            }
            objc_exception_throw(+[_NSCoreDataOptimisticLockingException exceptionWithName:reason:userInfo:](_NSCoreDataOptimisticLockingException, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("optimistic locking failure"), v332));
          }
          v162 = objc_msgSend(v349, "count");
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v356 + 64) + 8) + 40) = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v162);
          if (!v162)
            goto LABEL_428;
          v163 = 0;
          v164 = 1;
          contexta = (void *)*MEMORY[0x1E0CB28A8];
          v367 = *MEMORY[0x1E0CB3388];
          v165 = (void *)MEMORY[0x1E0C9AA60];
          while (1)
          {
            v166 = (id *)objc_msgSend(v349, "objectAtIndex:", v163);
            v167 = (void *)objc_msgSend((id)objc_msgSend(v166, "affectedStores"), "objectAtIndex:", 0);
            if (objc_msgSend(v167, "_prepareForExecuteRequest:withContext:error:", v166, *(_QWORD *)(v356 + 56), *(_QWORD *)(*(_QWORD *)(v356 + 80) + 8) + 40))break;
LABEL_286:
            ++v163;
            ++v164;
            if (v163 == v162)
              goto LABEL_428;
          }
          v168 = objc_msgSend(v167, "executeRequest:withContext:error:", v166, *(_QWORD *)(v356 + 56), *(_QWORD *)(*(_QWORD *)(v356 + 80) + 8) + 40);
          if (v168)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v356 + 64) + 8) + 40), "addObject:", v168);
            if (objc_msgSend(v167, "coreSpotlightExporter"))
            {
              v169 = (unsigned int *)objc_msgSend(v167, "coreSpotlightExporter");
              -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexFromSaveRequest:](v169, (uint64_t)v166, v170, v171, v172, v173, v174, v175, v347);
            }
            if (v166)
            {
              if (v166[7])
                v176 = v166[7];
              else
                v176 = v165;
            }
            else
            {
              v176 = 0;
            }
            if (objc_msgSend(v176, "count"))
            {
              v395 = 0u;
              v396 = 0u;
              v393 = 0u;
              v394 = 0u;
              v177 = objc_msgSend(v176, "countByEnumeratingWithState:objects:count:", &v393, v442, 16);
              if (v177)
              {
                v178 = *(_QWORD *)v394;
                do
                {
                  for (i6 = 0; i6 != v177; ++i6)
                  {
                    if (*(_QWORD *)v394 != v178)
                      objc_enumerationMutation(v176);
                    -[NSSaveChangesRequest _addChangedObjectIDsNotification:](*(_QWORD *)(v356 + 32), *(_QWORD *)(*((_QWORD *)&v393 + 1) + 8 * i6));
                  }
                  v177 = objc_msgSend(v176, "countByEnumeratingWithState:objects:count:", &v393, v442, 16);
                }
                while (v177);
              }
            }
            if (!v166)
              goto LABEL_286;

            v180 = v166 + 7;
            goto LABEL_285;
          }
          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v356 + 80) + 8) + 40))
          {
LABEL_282:
            if (v162 != 1)
            {
              v325 = *(_QWORD *)(v356 + 80);
              if (v163
                || (v326 = objc_msgSend(*(id *)(*(_QWORD *)(v325 + 8) + 40), "code", v168),
                    v325 = *(_QWORD *)(v356 + 80),
                    v326 != 134050))
              {
                v327 = objc_msgSend(*(id *)(*(_QWORD *)(v325 + 8) + 40), "code", v168);
                v328 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v356 + 80) + 8) + 40), "localizedFailureReason");
                v443 = v367;
                v444 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v356 + 80) + 8) + 40);
                v329 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v444, &v443, 1);
                if (v328)
                  v330 = (const __CFString *)v328;
                else
                  v330 = CFSTR("Save failed");
                v331 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], v327, (uint64_t)v330, v329);
                -[_NSCoreDataException _setDomain:]((uint64_t)v331, (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v356 + 80) + 8) + 40), "domain"));
                objc_exception_throw(v331);
              }
              v324 = objc_msgSend(*(id *)(*(_QWORD *)(v325 + 8) + 40), "userInfo");
LABEL_488:
              objc_exception_throw(+[_NSCoreDataOptimisticLockingException exceptionWithName:reason:userInfo:](_NSCoreDataOptimisticLockingException, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("optimistic locking failure"), v324));
            }
            if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v356 + 80) + 8) + 40), "code", v168) == 134050)
            {
              v324 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v356 + 80) + 8) + 40), "userInfo");
              goto LABEL_488;
            }
            v180 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(v356 + 64) + 8) + 40);
LABEL_285:
            *v180 = 0;
            goto LABEL_286;
          }
          if (objc_msgSend((id)objc_msgSend(v167, "type", 0), "isEqualToString:", CFSTR("SQLite")))
          {
            v181 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "A sqlite store save failed but did not return an error: %@");
            _NSCoreDataLog(17, v181, v182, v183, v184, v185, v186, v187, (uint64_t)v167);
            v188 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v167;
              v189 = v188;
              v190 = "CoreData: A sqlite store save failed but did not return an error: %@";
LABEL_280:
              _os_log_fault_impl(&dword_18A253000, v189, OS_LOG_TYPE_FAULT, v190, buf, 0xCu);
            }
          }
          else if (objc_msgSend((id)objc_msgSend(v167, "type"), "isEqualToString:", CFSTR("NSXPCStore")))
          {
            v191 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "A xpc store save failed but did not return an error: %@");
            _NSCoreDataLog(17, v191, v192, v193, v194, v195, v196, v197, (uint64_t)v167);
            v198 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v167;
              v189 = v198;
              v190 = "CoreData: A xpc store save failed but did not return an error: %@";
              goto LABEL_280;
            }
          }
          else
          {
            if (!objc_msgSend((id)objc_msgSend(v167, "type"), "isEqualToString:", CFSTR("Binary")))
            {
              if (!objc_msgSend((id)objc_msgSend(v167, "type"), "isEqualToString:", CFSTR("InMemory")))
                goto LABEL_281;
              v207 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "An in-memory store save failed but did not return an error: %@");
              _NSCoreDataLog(17, v207, v208, v209, v210, v211, v212, v213, (uint64_t)v167);
              v214 = __pflogFaultLog;
              if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
                goto LABEL_281;
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v167;
              v189 = v214;
              v190 = "CoreData: An in-memory store save failed but did not return an error: %@";
              goto LABEL_280;
            }
            v199 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "A binary store save failed but did not return an error: %@");
            _NSCoreDataLog(17, v199, v200, v201, v202, v203, v204, v205, (uint64_t)v167);
            v206 = __pflogFaultLog;
            if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v167;
              v189 = v206;
              v190 = "CoreData: A binary store save failed but did not return an error: %@";
              goto LABEL_280;
            }
          }
LABEL_281:
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v356 + 80) + 8) + 40) = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", contexta, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Unknown"), v367));
          goto LABEL_282;
        default:
          v123 = *(id *)(v356 + 32);
          if (v23 == 8)
          {
            if (objc_msgSend(*(id *)(v356 + 32), "resultType") == 4)
            {
              _NSCoreDataLog(1, (uint64_t)CFSTR("NSPersistentHistoryResultTypeChangesOnly unsupported for multiple stores [%@]"), v124, v125, v126, v127, v128, v129, (uint64_t)obj);
              v440 = CFSTR("NSAffectedStoresErrorKey");
              v441 = obj;
              v344 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v441, &v440, 1);
              v345 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0C99768], 134091, (uint64_t)CFSTR("NSPersistentHistoryResultTypeChangesOnly unsupported for multiple stores"), v344);
              objc_exception_throw(v345);
            }
            if (objc_msgSend(v123, "fetchBatchSize"))
            {
              v123 = (id)objc_msgSend(v123, "copy");
              objc_msgSend(v123, "setFetchBatchSize:", 0);
            }
          }
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v356 + 64) + 8) + 40) = objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v351);
          v130 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v131 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          if (v351)
          {
            v132 = 0;
            v133 = *MEMORY[0x1E0CB28A8];
            do
            {
              v134 = (unsigned __int8 *)objc_msgSend(obj, "objectAtIndex:", v132);
              *(_QWORD *)buf = 0;
              -[NSPersistentStoreCoordinator replaceResultTypeOfRequestIfNecessary:store:requestType:originalResultType:](*(_QWORD *)(v356 + 48), v123, v134, *(_QWORD *)(v356 + 88), buf);
              v135 = (id)objc_msgSend(v134, "executeRequest:withContext:error:", v123, *(_QWORD *)(v356 + 56), *(_QWORD *)(*(_QWORD *)(v356 + 80) + 8) + 40);
              if (v135)
              {
                if (*(_QWORD *)(v356 + 48))
                {
                  v136 = *(_QWORD *)(v356 + 88);
                  if (objc_msgSend((id)objc_msgSend(v134, "type"), "isEqualToString:", CFSTR("SQLite")))
                  {
                    if (objc_msgSend(v134, "coreSpotlightExporter") && (unint64_t)(v136 - 5) <= 2)
                    {
                      v137 = (unsigned int *)objc_msgSend(v134, "coreSpotlightExporter");
                      -[NSCoreDataCoreSpotlightDelegate _updateSpotlightIndexFromBatchResult:](v137, (uint64_t)v135, v138, v139, v140, v141, v142, v143, v347);
                      v135 = -[NSPersistentStoreCoordinator restoreOriginalRequestIfNecessary:store:swizzledResults:originalRequestType:originalResultType:](*(_QWORD *)(v356 + 48), v123, (uint64_t)v134, v135, *(_QWORD *)(v356 + 88), *(uint64_t *)buf);
                    }
                  }
                }
                v144 = *(void **)(*(_QWORD *)(*(_QWORD *)(v356 + 64) + 8) + 40);
              }
              else
              {
                v145 = *(void **)(*(_QWORD *)(*(_QWORD *)(v356 + 80) + 8) + 40);
                if (v145)
                {
                  v146 = objc_msgSend(v145, "code");
                  v147 = *(_QWORD *)(*(_QWORD *)(v356 + 80) + 8);
                  v135 = *(id *)(v147 + 40);
                  if (v146 != 134091)
                  {
                    objc_msgSend(v131, "addObject:", *(_QWORD *)(v147 + 40));
                    break;
                  }
                  v144 = v130;
                }
                else
                {
                  v148 = (void *)MEMORY[0x1E0CB35C8];
                  v439[0] = *(_QWORD *)(v356 + 32);
                  v438[0] = CFSTR("NSPersistentStoreRequest");
                  v438[1] = CFSTR("NSPersistentStore");
                  v149 = objc_msgSend(obj, "objectAtIndex:", v132);
                  v438[2] = CFSTR("reason");
                  v439[1] = v149;
                  v439[2] = CFSTR("Store returned nil but no error.");
                  v135 = (id)objc_msgSend(v148, "errorWithDomain:code:userInfo:", v133, 134070, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v439, v438, 3));
                  v144 = v131;
                }
              }
              objc_msgSend(v144, "addObject:", v135);
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v356 + 80) + 8) + 40) = 0;
              ++v132;
            }
            while (v351 != v132);
          }
          if (objc_msgSend(v130, "count") == v351)
          {
            _NSCoreDataLog(1, (uint64_t)CFSTR("NSPersistentStoreRequest failed unsupported by all stores on this coordinator.  Request: '%@' and stores [%@]"), v150, v151, v152, v153, v154, v155, *(_QWORD *)(v356 + 32));
            v156 = (void *)MEMORY[0x1E0CB35C8];
            v157 = *(_QWORD *)(v356 + 32);
            v436[0] = CFSTR("NSPersistentStoreRequest");
            v436[1] = CFSTR("NSPersistentStores");
            v437[0] = v157;
            v437[1] = obj;
            v436[2] = CFSTR("reason");
            v437[2] = CFSTR("Operation unsupported by all stores on this coordinator.");
            v158 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v437, v436, 3);
            objc_msgSend(v131, "addObject:", objc_msgSend(v156, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134091, v158));
          }
          if (objc_msgSend(v131, "count"))
          {
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v356 + 64) + 8) + 40) = 0;
            if (*(_QWORD *)(v356 + 104))
            {
              v159 = (void *)MEMORY[0x1E0CB35C8];
              v160 = *(_QWORD *)(v356 + 32);
              v434[0] = CFSTR("NSPersistentStoreRequest");
              v434[1] = CFSTR("Underlying errors");
              v435[0] = v160;
              v435[1] = v131;
              v434[2] = CFSTR("reason");
              v435[2] = CFSTR("One or more stores returned an error.");
              v161 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v435, v434, 3);
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v356 + 80) + 8) + 40) = objc_msgSend(v159, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134070, v161);
            }

            goto LABEL_428;
          }

          if (*(_QWORD *)(v356 + 48))
          {
            v268 = *(void **)(*(_QWORD *)(*(_QWORD *)(v356 + 64) + 8) + 40);
            v269 = objc_msgSend(*(id *)(v356 + 32), "requestType");
            v270 = off_1E1EDA8E8;
            switch(v269)
            {
              case 5:
                goto LABEL_425;
              case 6:
                v270 = off_1E1EDA8F8;
                goto LABEL_425;
              case 7:
                v270 = off_1E1EDA8D8;
                goto LABEL_425;
              case 8:
                if (!v268)
                  goto LABEL_480;
                if (objc_msgSend(v268, "count") == 1)
                  goto LABEL_419;
                v284 = -[NSPersistentHistoryResult initWithSubresults:]([NSPersistentHistoryResult alloc], "initWithSubresults:", v268);
                goto LABEL_426;
              case 10:
                v270 = off_1E1EDAD48;
                goto LABEL_425;
              case 11:
                v270 = off_1E1EDAC20;
                goto LABEL_425;
              default:
                if (objc_msgSend(v268, "count") == 1)
                {
LABEL_419:
                  v267 = (NSPersistentHistoryResult *)objc_msgSend(v268, "lastObject");
                }
                else
                {
                  v270 = &off_1E1EDADB8;
LABEL_425:
                  v284 = (NSPersistentHistoryResult *)objc_msgSend(objc_alloc(*v270), "initWithSubresults:", v268);
LABEL_426:
                  v267 = v284;
                }
                break;
            }
          }
          else
          {
LABEL_480:
            v267 = 0;
          }
          break;
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v356 + 64) + 8) + 40) = v267;
      goto LABEL_428;
    }
  }
  switch(*(_QWORD *)(v356 + 88))
  {
    case 1:
    case 3:
      v116 = (NSPersistentHistoryResult *)(id)NSArray_EmptyArray;
      goto LABEL_353;
    case 2:
      v258 = *(_QWORD *)(v356 + 32);
      if (!v258)
        goto LABEL_357;
      v259 = *(_QWORD *)(v258 + 48);
      if ((_BYTE)v259)
      {
LABEL_36:
        -[NSPersistentStoreCoordinator _introspectLastErrorAndThrow](*(_QWORD **)(v356 + 48));
        goto LABEL_37;
      }
      *(_QWORD *)(v258 + 48) = v259 & 0xFFFFFF00 | 1;
LABEL_357:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v356 + 72) + 8) + 24) = 1;
      return;
    case 5:
    case 6:
    case 7:
      goto LABEL_36;
    case 8:
      v248 = [NSPersistentHistoryResult alloc];
      v249 = objc_msgSend(*(id *)(v356 + 32), "resultType");
      v116 = -[NSPersistentHistoryResult initWithResultType:andResult:](v248, "initWithResultType:andResult:", v249, NSArray_EmptyArray);
      goto LABEL_353;
    case 9:
      *(_DWORD *)buf = 0;
      v250 = objc_msgSend(*(id *)(v356 + 48), "_exceptionNoStoreSaveFailureForError:recommendedFrame:", *(_QWORD *)(*(_QWORD *)(v356 + 48) + 72), buf);
      v251 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v447 = CFSTR("reason");
      v448 = v250;
      v252 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v448, &v447, 1);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v356 + 80) + 8) + 40) = objc_msgSend(v251, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134098, v252);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v356 + 64) + 8) + 40) = 0;
      return;
    case 0xALL:
      v257 = [NSSQLiteIndexStatisticsResult alloc];
      v116 = -[NSSQLiteIndexStatisticsResult initWithResult:](v257, "initWithResult:", NSArray_EmptyArray);
      goto LABEL_353;
    case 0xBLL:
      v256 = [NSPersistentCloudKitContainerEventResult alloc];
      v116 = -[NSPersistentCloudKitContainerEventResult initWithResult:ofType:](v256, "initWithResult:ofType:", NSArray_EmptyArray, objc_msgSend(*(id *)(v356 + 32), "resultType"));
LABEL_353:
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v356 + 64) + 8) + 40) = v116;
      return;
    default:
      v253 = *(_QWORD **)(v356 + 48);
      if (v253)
      {
        v254 = (void *)MEMORY[0x1E0C99DA0];
        v255 = objc_msgSend(v253, "_exceptionNoStoreSaveFailureForError:recommendedFrame:", v253[9], 0);
        objc_exception_throw((id)objc_msgSend(v254, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v255, 0));
      }
      goto LABEL_37;
  }
}

- (id)restoreOriginalRequestIfNecessary:(uint64_t)a3 store:(void *)a4 swizzledResults:(uint64_t)a5 originalRequestType:(uint64_t)a6 originalResultType:
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __objc2_class **v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  if (!a1)
    return 0;
  if (a3 && (*(_BYTE *)(a3 + 193) & 4) != 0)
    return a4;
  if (a5 != 5 || a6 == 1)
  {
    if (a5 != 6 || a6 == 1)
    {
      if (a5 != 7 || a6 == 1)
        return a4;
      objc_msgSend(a2, "setResultType:", a6);
      v11 = objc_msgSend((id)objc_msgSend(a4, "result"), "count");
      if (a6 == 2)
      {
        v15 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
        if (!v15)
          return a4;
        v9 = v15;
      }
      else
      {
        if (a6)
          return a4;
        if (v11)
          v9 = MEMORY[0x1E0C9AAB0];
        else
          v9 = MEMORY[0x1E0C9AAA0];
      }
      v13 = off_1E1EDA8D8;
    }
    else
    {
      objc_msgSend(a2, "setResultType:", a6);
      v10 = objc_msgSend((id)objc_msgSend(a4, "result"), "count");
      if (a6 == 2)
      {
        v14 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
        if (!v14)
          return a4;
        v9 = v14;
      }
      else
      {
        if (a6)
          return a4;
        if (v10)
          v9 = MEMORY[0x1E0C9AAB0];
        else
          v9 = MEMORY[0x1E0C9AAA0];
      }
      v13 = off_1E1EDA8F8;
    }
  }
  else
  {
    objc_msgSend(a2, "setResultType:", a6);
    v8 = objc_msgSend((id)objc_msgSend(a4, "result"), "count");
    if (a6 == 2)
    {
      v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
      if (!v12)
        return a4;
      v9 = v12;
    }
    else
    {
      if (a6)
        return a4;
      if (v8)
        v9 = MEMORY[0x1E0C9AAB0];
      else
        v9 = MEMORY[0x1E0C9AAA0];
    }
    v13 = off_1E1EDA8E8;
  }
  v16 = (void *)objc_msgSend(objc_alloc(*v13), "initWithResultType:andObject:", a6, v9);
  if (v16)
    return v16;
  return a4;
}

void __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_430(uint64_t a1)
{
  _NSQueryGenerationToken *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _NSQueryGenerationToken *v10;

  v2 = -[NSPersistentStoreCoordinator _retainedIdentifierFromStores:](*(_NSQueryGenerationToken **)(a1 + 32), *(void **)(a1 + 40));
  if (!v2)
  {
    _NSCoreDataLog(1, (uint64_t)CFSTR("Coordinator failed to create a new query generation post save"), v3, v4, v5, v6, v7, v8, v9);
    v2 = +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken");
  }
  v10 = v2;
  objc_msgSend(*(id *)(a1 + 48), "_setQueryGenerationFromToken:error:", v2, 0);

}

void __65__NSPersistentStoreCoordinator_executeRequest_withContext_error___block_invoke_2(uint64_t a1)
{
  _NSQueryGenerationToken *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_NSQueryGenerationToken **)(a1 + 32);
  v2[0] = *(_QWORD *)(a1 + 40);

}

+ (BOOL)removeUbiquitousContentAndPersistentStoreAtURL:(NSURL *)storeURL options:(NSDictionary *)options error:(NSError *)error
{
  id v7;
  NSPersistentStoreCoordinator *v8;
  PFUbiquitySetupAssistant *v9;
  int v10;
  int v11;
  NSURL *actualStoreFileURL;
  NSURL *v13;
  void *v14;
  NSURL *ubiquityRootURL;
  NSURL *v16;
  NSURL *v17;
  NSString *localPeerID;
  uint64_t v19;
  void *v20;
  NSURL *v21;
  char v22;
  _QWORD v24[8];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 1;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3052000000;
  v32 = __Block_byref_object_copy__18;
  v33 = __Block_byref_object_dispose__18;
  v34 = 0;
  if (!-[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("NSPersistentStoreUbiquitousContentNameKey")))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Must pass in a store name"), 0));
  objc_opt_self();
  v7 = -[PFUbiquityMetadataFactory newMetadataManagedObjectModel](_sharedFactory);
  v8 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", v7);
  v9 = -[PFUbiquitySetupAssistant initWithPersistentStoreCoordinator:andStoreOptions:forPersistentStoreOfType:atURL:]([PFUbiquitySetupAssistant alloc], "initWithPersistentStoreCoordinator:andStoreOptions:forPersistentStoreOfType:atURL:", v8, options, CFSTR("SQLite"), storeURL);
  v10 = -[PFUbiquitySetupAssistant validateOptionsWithError:]((uint64_t)v9, v30 + 5);
  *((_BYTE *)v36 + 24) = v10;
  if (!v10)
    goto LABEL_21;
  if (v9)
    v9->_cacheFilePresenterForUbiquityRoot = 1;
  v11 = -[PFUbiquitySetupAssistant canReadFromUbiquityRootLocation:]((uint64_t)v9, v30 + 5);
  *((_BYTE *)v36 + 24) = v11;
  if (v11)
  {
    if (v9)
      actualStoreFileURL = v9->_actualStoreFileURL;
    else
      actualStoreFileURL = 0;
    v13 = actualStoreFileURL;
    v14 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    if (objc_msgSend(v14, "fileExistsAtPath:", -[NSURL path](v13, "path"))
      && !-[NSPersistentStoreCoordinator _destroyPersistentStoreAtURL:withType:options:error:](v8, "_destroyPersistentStoreAtURL:withType:options:error:", v13, CFSTR("SQLite"), options, v30 + 5)&& +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Couldn't delete store file: %@\n%@\nWill still try to nuke the container."), "+[NSPersistentStoreCoordinator removeUbiquitousContentAndPersistentStoreAtURL:options:error:]", 3626, v13, v30[5]);
    }
    if (v9)
      ubiquityRootURL = v9->_ubiquityRootURL;
    else
      ubiquityRootURL = 0;
    v16 = ubiquityRootURL;
    v17 = -[NSURL URLByDeletingLastPathComponent](v16, "URLByDeletingLastPathComponent");
    if (v9)
      localPeerID = v9->_localPeerID;
    else
      localPeerID = 0;
    v19 = -[NSURL URLByAppendingPathComponent:](v17, "URLByAppendingPathComponent:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OldUbiquitousContent-%@"), localPeerID));
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", 0);
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __93__NSPersistentStoreCoordinator_removeUbiquitousContentAndPersistentStoreAtURL_options_error___block_invoke;
    v24[3] = &unk_1E1EDEBA0;
    v24[4] = v14;
    v24[5] = &v25;
    v24[6] = &v35;
    v24[7] = &v29;
    objc_msgSend(v20, "coordinateWritingItemAtURL:options:writingItemAtURL:options:error:byAccessor:", v16, 2, v19, 8, v30 + 5, v24);
    if (!*((_BYTE *)v36 + 24)
      && !*((_BYTE *)v26 + 24)
      && +[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  The coordinated write to remove the ubiquitous contents failed: %@"), "+[NSPersistentStoreCoordinator removeUbiquitousContentAndPersistentStoreAtURL:options:error:]", 3659, v30[5]);
    }

    _Block_object_dispose(&v25, 8);
    v21 = v13;
  }
  else
  {
LABEL_21:
    v16 = 0;
    v21 = 0;
  }

  v22 = *((_BYTE *)v36 + 24);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
  return v22;
}

void __93__NSPersistentStoreCoordinator_removeUbiquitousContentAndPersistentStoreAtURL_options_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  if (objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:", objc_msgSend(a3, "path")))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "moveItemAtURL:toURL:error:", a2, a3, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    }
    else if (+[PFUbiquityLogging canLogMessageAtLevel:](PFUbiquityLogging, "canLogMessageAtLevel:", 0))
    {
      NSLog((NSString *)CFSTR("%s(%d): CoreData: Ubiquity:  Unable to move content directory to new location: %@\nNew: %@\n%@"), "+[NSPersistentStoreCoordinator removeUbiquitousContentAndPersistentStoreAtURL:options:error:]_block_invoke", 3652, a2, a3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    }
  }
}

- (uint64_t)applyMigrationStage:(void *)a3 withContext:(_QWORD *)a4 error:
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  NSStoreMigrationPolicy *v37;
  _BOOL4 v39;
  _QWORD *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  uint64_t v46;
  uint64_t v47;
  NSPersistentStoreCoordinator *v48;
  NSPersistentStoreCoordinator *v49;
  char v50;
  uint64_t v51;
  void *v52;
  NSString *stageLabel;
  uint64_t v54;
  void *v55;
  NSString *destinationConfigurationForCloudKitValidation;
  uint64_t v57;
  void *v58;
  _QWORD *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t j;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  NSObject *v96;
  uint64_t v97;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  NSObject *v107;
  uint64_t v108;
  void *v109;
  _BOOL4 v110;
  _QWORD v111[9];
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _QWORD v116[9];
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  void (*v124)(uint64_t, uint64_t);
  void (*v125)(uint64_t);
  uint64_t v126;
  uint64_t v127;
  uint64_t *v128;
  uint64_t v129;
  char v130;
  uint8_t buf[4];
  const char *v132;
  __int16 v133;
  int v134;
  _BYTE v135[128];
  _BYTE v136[128];
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  v127 = 0;
  v128 = &v127;
  v129 = 0x2020000000;
  v130 = 1;
  v121 = 0;
  v122 = &v121;
  v123 = 0x3052000000;
  v124 = __Block_byref_object_copy__18;
  v125 = __Block_byref_object_dispose__18;
  v126 = 0;
  v8 = (void *)objc_opt_class();
  v9 = objc_msgSend(a3, "storeType");
  v10 = objc_msgSend(a3, "storeURL");
  v11 = objc_msgSend(a3, "options");
  objc_msgSend(a3, "setMetadata:", objc_msgSend(v8, "metadataForPersistentStoreOfType:URL:options:error:", v9, v10, v11, v122 + 5));
  v12 = v122;
  if (v122[5])
  {
    *((_BYTE *)v128 + 24) = 0;
    v13 = (id)v12[5];
  }
  if (!*((_BYTE *)v128 + 24))
    goto LABEL_93;
  if (!a2)
    goto LABEL_23;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(a2, "subsequentStage"))
    {
      objc_msgSend(a2, "subsequentStage");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)objc_msgSend(a2, "subsequentStage");
        v15 = (void *)objc_msgSend(v14, "currentModel");
        if (objc_msgSend(v15, "resolve:", v122 + 5))
        {
          v16 = objc_msgSend((id)objc_msgSend(v14, "currentModel"), "resolvedModel");
LABEL_15:
          v19 = v16;
          goto LABEL_24;
        }
        goto LABEL_22;
      }
      v29 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "I don't know what to do with lightweight stages that aren't followed by a custom stage yet: %@");
      _NSCoreDataLog(17, v29, v30, v31, v32, v33, v34, v35, (uint64_t)a2);
      v27 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v132 = (const char *)a2;
        v28 = "CoreData: I don't know what to do with lightweight stages that aren't followed by a custom stage yet: %@";
        goto LABEL_21;
      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = (void *)objc_msgSend(a2, "currentModel");
      if (!objc_msgSend(v17, "resolve:", v122 + 5)
        || (v18 = (void *)objc_msgSend(a2, "nextModel"), !objc_msgSend(v18, "resolve:", v122 + 5)))
      {
LABEL_22:
        *((_BYTE *)v128 + 24) = 0;
        v36 = (id)v122[5];
        goto LABEL_23;
      }
      if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "nextModel"), "resolvedModel"), "versionHash"), "isEqualToData:", objc_msgSend((id)objc_msgSend(a1, "managedObjectModel"), "versionHash")) & 1) == 0)
      {
        v16 = objc_msgSend((id)objc_msgSend(a2, "nextModel"), "resolvedModel");
        goto LABEL_15;
      }
    }
    else
    {
      v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "I don't know how to handle this type of stage yet: %@");
      _NSCoreDataLog(17, v20, v21, v22, v23, v24, v25, v26, (uint64_t)a2);
      v27 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v132 = (const char *)a2;
        v28 = "CoreData: I don't know how to handle this type of stage yet: %@";
LABEL_21:
        _os_log_fault_impl(&dword_18A253000, v27, OS_LOG_TYPE_FAULT, v28, buf, 0xCu);
      }
    }
  }
LABEL_23:
  v19 = 0;
LABEL_24:
  v37 = objc_alloc_init(NSStoreMigrationPolicy);
  v39 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "stagedMigrationManager"), "stages"), "lastObject") != a2
     || v19 != 0;
  v110 = v39;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a2, "willMigrateHandler"))
  {
    v109 = a1;
    v40 = a4;
    v41 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "currentModel"), "resolvedModel"), "copy");
    v42 = v41;
    if (v41)
    {
      v119 = 0u;
      v120 = 0u;
      v117 = 0u;
      v118 = 0u;
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v117, v136, 16);
      if (v43)
      {
        v44 = *(_QWORD *)v118;
        do
        {
          for (i = 0; i != v43; ++i)
          {
            if (*(_QWORD *)v118 != v44)
              objc_enumerationMutation(v42);
            v46 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * i);
            if (v46)
            {

              *(_QWORD *)(v46 + 48) = 0;
            }
          }
          v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v117, v136, 16);
        }
        while (v43);
      }
    }
    v47 = objc_msgSend(a3, "stagedMigrationManager");
    a4 = v40;
    a1 = v109;
    v116[0] = MEMORY[0x1E0C809B0];
    v116[1] = 3221225472;
    v116[2] = __70__NSPersistentStoreCoordinator_applyMigrationStage_withContext_error___block_invoke;
    v116[3] = &unk_1E1EDEBF0;
    v116[4] = v47;
    v116[5] = a2;
    v116[6] = a3;
    v116[7] = &v121;
    v116[8] = &v127;
    -[NSPersistentStoreCoordinator createPersistentContainerForMigrationContext:withModel:andExecuteBlock:](a3, (uint64_t)v42, (uint64_t)v116);

  }
  if (*((_BYTE *)v128 + 24))
  {
    if (v19)
      v48 = -[NSPersistentStoreCoordinator initWithManagedObjectModel:]([NSPersistentStoreCoordinator alloc], "initWithManagedObjectModel:", v19);
    else
      v48 = a1;
    v49 = v48;
    -[NSPersistentStoreCoordinator _setIsMigrating:]((uint64_t)v48, 1);
    -[NSStoreMigrationPolicy setPersistentStoreCoordinator:sourceURL:configuration:metadata:options:](v37, v49, (void *)objc_msgSend(a3, "storeURL"), (void *)objc_msgSend(a3, "configurationName"), (void *)objc_msgSend(a3, "metadata"), (void *)objc_msgSend(a3, "options"));
    v50 = objc_msgSend(a3, "forceMigration");
    if (v37)
      v37->_forcedMigration = v50;
    v51 = objc_msgSend(a2, "label");
    if (v37)
    {
      v52 = (void *)v51;
      stageLabel = v37->_stageLabel;
      if (stageLabel != (NSString *)v51)
      {

        v37->_stageLabel = 0;
        v37->_stageLabel = (NSString *)objc_msgSend(v52, "copy");
      }
    }
    v54 = objc_msgSend(a3, "destinationConfigurationForCloudKitValidation");
    if (v37)
    {
      v55 = (void *)v54;
      destinationConfigurationForCloudKitValidation = v37->_destinationConfigurationForCloudKitValidation;
      if (destinationConfigurationForCloudKitValidation != (NSString *)v54)
      {

        v37->_destinationConfigurationForCloudKitValidation = 0;
        v37->_destinationConfigurationForCloudKitValidation = (NSString *)objc_msgSend(v55, "copy");
      }
    }
    v57 = -[NSStoreMigrationPolicy _gatherDataAndPerformMigration:]((uint64_t)v37, v122 + 5);
    if (v57)
    {
      objc_msgSend(a3, "setMigratedStore:", v57);
      v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", objc_msgSend(a3, "storeURL"), CFSTR("storeURL"), 0);
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("NSPersistentStoreCoordinatorDidAutomigrateStoreNotification"), a1, v58);

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a2, "didMigrateHandler"))
      {
        v59 = a4;
        v60 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "nextModel"), "resolvedModel"), "copy");
        v61 = v60;
        if (v60)
        {
          v114 = 0u;
          v115 = 0u;
          v112 = 0u;
          v113 = 0u;
          v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v112, v135, 16);
          if (v62)
          {
            v63 = *(_QWORD *)v113;
            do
            {
              for (j = 0; j != v62; ++j)
              {
                if (*(_QWORD *)v113 != v63)
                  objc_enumerationMutation(v61);
                v65 = *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * j);
                if (v65)
                {

                  *(_QWORD *)(v65 + 48) = 0;
                }
              }
              v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v112, v135, 16);
            }
            while (v62);
          }
        }
        v66 = objc_msgSend(a3, "stagedMigrationManager");
        a4 = v59;
        v111[0] = MEMORY[0x1E0C809B0];
        v111[1] = 3221225472;
        v111[2] = __70__NSPersistentStoreCoordinator_applyMigrationStage_withContext_error___block_invoke_2;
        v111[3] = &unk_1E1EDEBF0;
        v111[4] = v66;
        v111[5] = a2;
        v111[6] = a3;
        v111[7] = &v121;
        v111[8] = &v127;
        -[NSPersistentStoreCoordinator createPersistentContainerForMigrationContext:withModel:andExecuteBlock:](a3, (uint64_t)v61, (uint64_t)v111);

      }
      v67 = objc_msgSend(a3, "ubiquitySetupAssistant");
      if (v67)
        *(_BYTE *)(v67 + 276) = 1;
      if (+[NSMappingModel migrationDebugLevel](NSMappingModel, "migrationDebugLevel"))
      {
        v68 = objc_msgSend(a3, "storeURL");
        if (a2)
          _NSCoreDataLog(4, (uint64_t)CFSTR("(migration)\t Automatic schema migration succeeded for store at '%@' with migration stage: %@"), v69, v70, v71, v72, v73, v74, v68);
        else
          _NSCoreDataLog(4, (uint64_t)CFSTR("(migration)\t Automatic schema migration succeeded for store at '%@'"), v69, v70, v71, v72, v73, v74, v68);
      }
    }
    else
    {
      *((_BYTE *)v128 + 24) = 0;
      v75 = (id)v122[5];
      if (v122[5]
        && +[NSStoreMigrationPolicy migrationDebugLevel](NSStoreMigrationPolicy, "migrationDebugLevel") >= 1)
      {
        v76 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
        objc_msgSend(v76, "appendFormat:", CFSTR("CoreData: error: (migration) migration failed with error %@"), v122[5]);
        v83 = (id)objc_msgSend((id)v122[5], "userInfo");
        if (v83)
        {
          v84 = *MEMORY[0x1E0CB3388];
          do
          {
            objc_msgSend(v76, "appendFormat:", CFSTR("\nError User Info: %@"), v83);
            v85 = objc_msgSend(v83, "objectForKey:", v84);
            v86 = (void *)v85;
            if (!v85)
              break;
            objc_msgSend(v76, "appendFormat:", CFSTR("\nUnderlying error: %@"), v85);
            v83 = (id)objc_msgSend(v86, "userInfo");
          }
          while (v83);
        }
        _NSCoreDataLog(1, (uint64_t)CFSTR("%@"), v77, v78, v79, v80, v81, v82, (uint64_t)v76);

      }
    }

  }
  if (v110)
    -[NSPersistentStoreCoordinator _removePersistentStore:]((uint64_t)a1, (_QWORD *)objc_msgSend(a1, "persistentStoreForURL:", objc_msgSend(a3, "storeURL")));
  if (a2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v87 = (void *)objc_msgSend((id)objc_msgSend(a2, "subsequentStage"), "currentModel");
LABEL_90:
      objc_msgSend(v87, "unresolve");
      goto LABEL_93;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend((id)objc_msgSend(a2, "currentModel"), "unresolve");
      v87 = (void *)objc_msgSend(a2, "nextModel");
      goto LABEL_90;
    }
    v88 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "I don't know how to handle this stage type %@");
    v89 = objc_opt_class();
    _NSCoreDataLog(17, v88, v90, v91, v92, v93, v94, v95, v89);
    v96 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      v108 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v132 = (const char *)v108;
      _os_log_fault_impl(&dword_18A253000, v96, OS_LOG_TYPE_FAULT, "CoreData: I don't know how to handle this stage type %@", buf, 0xCu);
    }
  }
LABEL_93:
  if (!*((_BYTE *)v128 + 24))
  {
    objc_msgSend(a3, "setMigratedStore:", 0);
    v99 = (id)v122[5];
    if (v99)
    {
      if (a4)
        *a4 = v99;
    }
    else
    {
      v100 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v100, v101, v102, v103, v104, v105, v106, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
      v107 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v132 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
        v133 = 1024;
        v134 = 4085;
        _os_log_fault_impl(&dword_18A253000, v107, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }

  v122[5] = 0;
  v97 = *((unsigned __int8 *)v128 + 24);
  _Block_object_dispose(&v121, 8);
  _Block_object_dispose(&v127, 8);
  return v97;
}

- (void)createPersistentContainerForMigrationContext:(void *)a1 withModel:(uint64_t)a2 andExecuteBlock:(uint64_t)a3
{
  void *v6;
  NSPersistentContainer *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[6];
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v6 = (void *)MEMORY[0x18D76B4E4]();
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__18;
  v18 = __Block_byref_object_dispose__18;
  v19 = 0;
  v7 = +[NSPersistentContainer persistentContainerWithPath:managedObjectModel:](NSPersistentContainer, "persistentContainerWithPath:managedObjectModel:", objc_msgSend((id)objc_msgSend(a1, "storeURL"), "path"), a2);
  v8 = -[NSArray firstObject](-[NSPersistentContainer persistentStoreDescriptions](v7, "persistentStoreDescriptions"), "firstObject");
  objc_msgSend(v8, "setType:", objc_msgSend(a1, "storeType"));
  objc_msgSend(v8, "setConfiguration:", objc_msgSend(a1, "configurationName"));
  v9 = (void *)objc_msgSend(a1, "options");
  v10 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __103__NSPersistentStoreCoordinator_createPersistentContainerForMigrationContext_withModel_andExecuteBlock___block_invoke;
  v13[3] = &unk_1E1EDEBC8;
  v13[4] = v8;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v13);
  objc_msgSend(v8, "setShouldMigrateStoreAutomatically:", 0);
  objc_msgSend(v8, "setShouldInferMappingModelAutomatically:", 0);
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __103__NSPersistentStoreCoordinator_createPersistentContainerForMigrationContext_withModel_andExecuteBlock___block_invoke_2;
  v12[3] = &unk_1E1EDD7E0;
  v12[4] = &v20;
  v12[5] = &v14;
  -[NSPersistentContainer loadPersistentStoresWithCompletionHandler:](v7, "loadPersistentStoresWithCompletionHandler:", v12);
  if (*((_BYTE *)v21 + 24))
  {
    v11 = 0;
  }
  else
  {
    v7 = 0;
    v11 = v15[5];
  }
  (*(void (**)(uint64_t, NSPersistentContainer *, uint64_t))(a3 + 16))(a3, v7, v11);

  v15[5] = 0;
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  objc_autoreleasePoolPop(v6);
}

uint64_t __103__NSPersistentStoreCoordinator_createPersistentContainerForMigrationContext_withModel_andExecuteBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOption:forKey:", a3, a2);
}

_QWORD *__103__NSPersistentStoreCoordinator_createPersistentContainerForMigrationContext_withModel_andExecuteBlock___block_invoke_2(_QWORD *result, uint64_t a2, void *a3)
{
  _QWORD *v3;

  if (a3)
  {
    v3 = result;
    *(_BYTE *)(*(_QWORD *)(result[4] + 8) + 24) = 0;
    result = a3;
    *(_QWORD *)(*(_QWORD *)(v3[5] + 8) + 40) = result;
  }
  return result;
}

id __70__NSPersistentStoreCoordinator_applyMigrationStage_withContext_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;
  id result;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setContainer:", a2);
    v4 = objc_msgSend(*(id *)(a1 + 40), "willMigrateHandler");
    if (((*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(v4 + 16))(v4, objc_msgSend(*(id *)(a1 + 48), "stagedMigrationManager"), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) & 1) == 0)
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        v7 = *MEMORY[0x1E0C99778];
        v8 = *(_QWORD *)(a1 + 40);
        v9 = CFSTR("offendingStage");
        v10[0] = v8;
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v7, CFSTR("willMigrate must return YES or NO with an error"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      v5 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    }
    return (id)objc_msgSend(*(id *)(a1 + 32), "setContainer:", 0);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    result = a3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
  }
  return result;
}

- (void)_setIsMigrating:(uint64_t)a1
{
  _QWORD v2[5];
  char v3;

  if (a1)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __68__NSPersistentStoreCoordinator__NSInternalMethods___setIsMigrating___block_invoke;
    v2[3] = &unk_1E1EDE5B8;
    v2[4] = a1;
    v3 = a2;
    _perform_0(a1, (uint64_t)v2);
  }
}

id __70__NSPersistentStoreCoordinator_applyMigrationStage_withContext_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;
  id result;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setContainer:", a2);
    v4 = objc_msgSend(*(id *)(a1 + 40), "didMigrateHandler");
    if (((*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(v4 + 16))(v4, objc_msgSend(*(id *)(a1 + 48), "stagedMigrationManager"), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) & 1) == 0)
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        v7 = *MEMORY[0x1E0C99778];
        v8 = *(_QWORD *)(a1 + 40);
        v9 = CFSTR("offendingStage");
        v10[0] = v8;
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", v7, CFSTR("didMigrate must return YES or NO with an error"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      v5 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    }
    return (id)objc_msgSend(*(id *)(a1 + 32), "setContainer:", 0);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    result = a3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = result;
  }
  return result;
}

- (id)managedObjectIDFromUTF8String:(const char *)a3 length:(unint64_t)a4
{
  return -[NSPersistentStoreCoordinator managedObjectIDFromUTF8String:length:error:](self, (char *)a3, a4, 0);
}

void __89__NSPersistentStoreCoordinator__NSInternalMethods___beginPowerAssertionNamed_withAssert___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _NSCoreDataLog(1, (uint64_t)CFSTR("Unexpected background task assertion cancellation."), a3, a4, a5, a6, a7, a8, a9);
}

- (id)_lastOpenError
{
  if (result)
    return (id *)result[9];
  return result;
}

- (id)_newOrderedRelationshipInformationForRelationship:(id)a3 forObjectWithID:(id)a4 withContext:(id)a5 error:(id *)a6
{
  uint64_t v11;
  uint64_t v12;
  NSQueryGenerationToken *v13;
  id v14;
  void *v15;
  void *v16;
  id v18;
  char v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  _QWORD v29[10];
  void *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  uint64_t v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  int v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v37 = 0;
  v38 = &v37;
  v39 = 0x3052000000;
  v40 = __Block_byref_object_copy__18;
  v41 = __Block_byref_object_dispose__18;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3052000000;
  v34 = __Block_byref_object_copy__18;
  v35 = __Block_byref_object_dispose__18;
  v36 = 0;
  v11 = objc_msgSend(a4, "persistentStore");
  v30 = 0;
  if (a5)
    v12 = *((_QWORD *)a5 + 22);
  else
    v12 = 0;
  v13 = +[NSQueryGenerationToken currentQueryGenerationToken](NSQueryGenerationToken, "currentQueryGenerationToken");
  if (v13 != (NSQueryGenerationToken *)objc_msgSend(a5, "_queryGenerationToken"))
    goto LABEL_4;
  v18 = -[NSPersistentStoreCoordinator _retainedCurrentQueryGeneration:](self, "_retainedCurrentQueryGeneration:", v12);
  if (!v18)
  {
    v20 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134502, 0);
    v30 = v20;
    if (!v20)
    {
LABEL_12:
      v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
      v28 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v44 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
        v45 = 1024;
        v46 = 4673;
        _os_log_fault_impl(&dword_18A253000, v28, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
      goto LABEL_17;
    }
LABEL_15:
    if (a6)
    {
      v16 = 0;
      *a6 = v20;
      goto LABEL_8;
    }
LABEL_17:
    v16 = 0;
    goto LABEL_8;
  }
  v19 = objc_msgSend(a5, "_setQueryGenerationFromToken:error:", v18, &v30);

  if ((v19 & 1) == 0)
  {
    v20 = v30;
    if (!v30)
      goto LABEL_12;
    goto LABEL_15;
  }
LABEL_4:
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __136__NSPersistentStoreCoordinator__NSInternalMethods___newOrderedRelationshipInformationForRelationship_forObjectWithID_withContext_error___block_invoke;
  v29[3] = &unk_1E1EDEC60;
  v29[4] = self;
  v29[5] = a5;
  v29[6] = a3;
  v29[7] = a4;
  v29[8] = &v37;
  v29[9] = &v31;
  -[NSPersistentStoreCoordinator _routeLightweightBlock:toStore:]((uint64_t)self, (uint64_t)v29, v11);
  v14 = (id)v32[5];
  if (a6)
  {
    v15 = (void *)v32[5];
    if (v15)
      *a6 = v15;
  }
  v16 = (void *)v38[5];
LABEL_8:
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
  return v16;
}

id __136__NSPersistentStoreCoordinator__NSInternalMethods___newOrderedRelationshipInformationForRelationship_forObjectWithID_withContext_error___block_invoke(uint64_t a1, void *a2)
{
  id result;
  uint64_t v5;
  _QWORD v6[3];
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  if (a2
    && !-[NSPersistentStoreCoordinator _canRouteToStore:forContext:](*(_QWORD *)(a1 + 32), a2, *(void **)(a1 + 40)))
  {
    v6[0] = CFSTR("Reason");
    v6[1] = CFSTR("store");
    v7[0] = CFSTR("Store is not valid for this context's generation");
    v7[1] = a2;
    v6[2] = CFSTR("context");
    v7[2] = *(_QWORD *)(a1 + 40);
    v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
    result = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134060, v5);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40) = result;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = objc_msgSend(a2, "_newOrderedRelationshipInformationForRelationship:forObjectWithID:withContext:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  }
  return result;
}

- (id)_allOrderKeysForDestination:(id)a3 inRelationship:(id)a4 error:(id *)a5
{
  uint64_t v9;
  id v10;
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__18;
  v23 = __Block_byref_object_dispose__18;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__18;
  v17 = __Block_byref_object_dispose__18;
  v18 = 0;
  v9 = objc_msgSend(a3, "persistentStore");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __101__NSPersistentStoreCoordinator__NSInternalMethods___allOrderKeysForDestination_inRelationship_error___block_invoke;
  v12[3] = &unk_1E1EDEC88;
  v12[4] = a3;
  v12[5] = a4;
  v12[6] = &v19;
  v12[7] = &v13;
  -[NSPersistentStoreCoordinator _routeLightweightBlock:toStore:]((uint64_t)self, (uint64_t)v12, v9);
  if (a5)
    *a5 = (id)v14[5];
  v10 = (id)v20[5];
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

id __101__NSPersistentStoreCoordinator__NSInternalMethods___allOrderKeysForDestination_inRelationship_error___block_invoke(_QWORD *a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = (id)objc_msgSend(a2, "_allOrderKeysForDestination:inRelationship:error:", a1[4], a1[5], *(_QWORD *)(a1[7] + 8) + 40);
  return *(id *)(*(_QWORD *)(a1[7] + 8) + 40);
}

- (uint64_t)_newConflictRecordForObject:(void *)a1 andOriginalRow:(unint64_t)a2 withContext:(_QWORD *)a3
{
  unint64_t v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  NSKnownKeysDictionary *v7;
  uint64_t v8;
  NSKnownKeysDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  void **v18;
  void *v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t *v24;
  void **v25;
  void *v26;
  uint64_t v27;
  id v28;
  NSMergeConflict *v29;
  uint64_t v30;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSKnownKeysDictionary *v35;
  unint64_t v36;
  void *v37;
  void *v38;

  v3 = a2;
  v4 = a1;
  if (a2 && objc_msgSend(a1, "managedObjectContext"))
  {
    v5 = (_QWORD *)objc_msgSend(v4, "entity");
    v38 = (void *)objc_msgSend(v4, "objectID");
    v37 = (void *)objc_msgSend(v38, "persistentStore");
    v36 = -[NSPersistentStore faultHandler]((unint64_t)v37);
    v6 = objc_msgSend((id)objc_msgSend(v5, "propertiesByName"), "values");
    v7 = [NSKnownKeysDictionary alloc];
    if (v5)
      v8 = v5[13];
    else
      v8 = 0;
    v9 = -[NSKnownKeysDictionary initWithSearchStrategy:](v7, "initWithSearchStrategy:", v8);
    v34 = -[NSKnownKeysDictionary values](v9, "values");
    v10 = objc_msgSend((id)v3, "knownKeyValuesPointer");
    v11 = -[NSKnownKeysMappingStrategy keys](-[NSKnownKeysDictionary mapping](v9, "mapping"), "keys");
    v12 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (_QWORD *)v5[14];
    v14 = v13[6];
    v15 = v13[7];
    v35 = v9;
    if (v14 < v15 + v14)
    {
      v32 = v6;
      v16 = (_QWORD *)(v11 + 8 * v14);
      v17 = (_QWORD *)(v34 + 8 * v14);
      v18 = (void **)(v10 + 8 * v14);
      do
      {
        if (v10)
          v19 = *v18;
        else
          v19 = (void *)objc_msgSend((id)v3, "valueForKey:", *v16);
        v20 = (id)v12;
        if (v19)
          v20 = v19;
        *v17++ = v20;
        ++v16;
        ++v18;
        --v15;
      }
      while (v15);
      v13 = (_QWORD *)v5[14];
      v9 = v35;
      v6 = v32;
    }
    v21 = v13[12];
    v22 = v13[13];
    if (v21 < v22 + v21)
    {
      v33 = v4;
      v23 = (_QWORD *)(v6 + 8 * v21);
      v24 = (uint64_t *)(v34 + 8 * v21);
      v25 = (void **)(v10 + 8 * v21);
      do
      {
        if (v10)
          v26 = *v25;
        else
          v26 = (void *)objc_msgSend(v37, "newValueForRelationship:forObjectWithID:withContext:error:", *v23, v38, a3, 0);
        v27 = v12;
        if (v26)
        {
          v28 = (_BYTE)z9dsptsiQ80etb9782fsrs98bfdle88
              ? v26
              : -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](a3, v26, v36);
          v27 = (uint64_t)v28;
          if (!v10)

        }
        *v24++ = v27;
        ++v23;
        ++v25;
        --v22;
      }
      while (v22);
      v4 = v33;
      v9 = v35;
    }
  }
  else
  {
    v9 = (NSKnownKeysDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
  }
  v29 = [NSMergeConflict alloc];
  if (v3)
    v3 = objc_msgSend((id)v3, "_versionNumber");
  v30 = -[NSMergeConflict initWithSource:newVersion:oldVersion:cachedSnapshot:persistedSnapshot:](v29, "initWithSource:newVersion:oldVersion:cachedSnapshot:persistedSnapshot:", v4, v3, objc_msgSend(v4, "_versionReference"), v9, 0);

  return v30;
}

- (const)_storeClassForStoreWithType:(const char *)result URL:(uint64_t)a2 options:(void *)a3
{
  char *v4;

  if (result)
  {
    v4 = (char *)result;
    result = (const char *)+[NSPersistentStoreCoordinator _storeClassForStoreType:]((uint64_t)NSPersistentStoreCoordinator, a2);
    if (!result)
    {
      if (!objc_msgSend(v4, "persistentStoreForURL:", a3))
        return +[NSPersistentStoreCoordinator _classForPersistentStoreAtURL:]((uint64_t)NSPersistentStoreCoordinator, a3);
      result = (const char *)objc_opt_class();
      if (!result)
        return +[NSPersistentStoreCoordinator _classForPersistentStoreAtURL:]((uint64_t)NSPersistentStoreCoordinator, a3);
    }
  }
  return result;
}

- (void)_copyMetadataFromStore:(void *)a3 toStore:(uint64_t)a4 migrationManager:
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v6 = (void *)objc_msgSend(a2, "metadata");
    v7 = (void *)objc_msgSend(a3, "metadata");
    v8 = (void *)objc_msgSend(v6, "mutableCopyWithZone:", 0);
    v9 = v8;
    if (!a4)
      objc_msgSend(v8, "removeObjectForKey:", CFSTR("NSStoreUUID"));
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("NSStoreModelVersionHashesVersion"), CFSTR("NSStoreModelVersionHashes"), CFSTR("NSStoreModelVersionIdentifiers"), CFSTR("NSPersistenceFrameworkVersion"), 0, 0);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          v16 = objc_msgSend(v7, "objectForKey:", v15);
          objc_msgSend(v9, "removeObjectForKey:", v15);
          if (v16)
            objc_msgSend(v9, "setObject:forKey:", v16, v15);
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }
    objc_msgSend(a3, "setMetadata:", v9);

  }
}

uint64_t __68__NSPersistentStoreCoordinator__NSInternalMethods___setIsMigrating___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 24) & 0xFFFFF7FF | (*(unsigned __int8 *)(result + 40) << 11);
  return result;
}

- (void)_setIsRegisteredWithUbiquity:(uint64_t)a1
{
  _QWORD v2[5];
  char v3;

  if (a1)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __81__NSPersistentStoreCoordinator__NSInternalMethods___setIsRegisteredWithUbiquity___block_invoke;
    v2[3] = &unk_1E1EDE5B8;
    v2[4] = a1;
    v3 = a2;
    _perform_0(a1, (uint64_t)v2);
  }
}

uint64_t __81__NSPersistentStoreCoordinator__NSInternalMethods___setIsRegisteredWithUbiquity___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 24) & 0xFFFFFFFE | *(unsigned __int8 *)(result + 40);
  return result;
}

+ (id)ubiquityStoreURLForStoreURL:(id)a3 ubiquityIdentityToken:(id)a4 ubiquityName:(id)a5
{
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  id v11;

  objc_opt_self();
  v8 = 0;
  v9 = +[PFUbiquitySetupAssistant findContainerIDForToken:storeName:haveExistingMappings:]((uint64_t)PFUbiquitySetupAssistant, (uint64_t)a4, (uint64_t)a5, 0);
  v10 = (const __CFString *)v9;
  if (a4 && v9 || !((unint64_t)a4 | v9))
  {
    v8 = +[PFUbiquitySetupAssistant createDefaultLocalPeerID]();
    v11 = +[PFUbiquitySetupAssistant createActualStoreURLForStoreURL:localPeerID:containerIdentifier:andStoreName:]((uint64_t)PFUbiquitySetupAssistant, a3, (uint64_t)v8, v10, (uint64_t)a5);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)currentQueryGenerationTokenFromStores:(id)a3
{
  return -[NSPersistentStoreCoordinator _retainedCurrentQueryGeneration:](self, "_retainedCurrentQueryGeneration:", a3);
}

- (BOOL)_replacePersistentStoreAtURL:(id)a3 destinationOptions:(id)a4 withPersistentStoreFromURL:(id)a5 sourceOptions:(id)a6 storeType:(id)a7 error:(id *)a8
{
  BOOL v15;
  NSPersistentStore *v16;
  void *v17;
  id v18;
  void *v19;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  _QWORD v24[13];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  uint64_t v34;
  const __CFString *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99778];
    v23 = CFSTR("Invalid destination store URL: nil");
    goto LABEL_14;
  }
  if (!a5)
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99778];
    v23 = CFSTR("Invalid source store URL: nil");
LABEL_14:
    objc_exception_throw((id)objc_msgSend(v21, "exceptionWithName:reason:userInfo:", v22, v23, 0, a6, a7, a8));
  }
  if ((objc_msgSend(a5, "isEqual:") & 1) != 0)
    return 1;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3052000000;
  v32 = __Block_byref_object_copy__18;
  v33 = __Block_byref_object_dispose__18;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v16 = -[NSPersistentStoreCoordinator persistentStoreForURL:](self, "persistentStoreForURL:", a3);
  if (v16)
  {
    v17 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v35 = CFSTR("removed");
    v36[0] = v16;
    objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification"), self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1));
  }
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __182__NSPersistentStoreCoordinator__NSPersistentStoreCoordinatorPrivateMethods___replacePersistentStoreAtURL_destinationOptions_withPersistentStoreFromURL_sourceOptions_storeType_error___block_invoke;
  v24[3] = &unk_1E1EDED28;
  v24[4] = self;
  v24[5] = a7;
  v24[6] = a5;
  v24[7] = a6;
  v24[8] = a3;
  v24[9] = a4;
  v24[10] = &v29;
  v24[11] = &v25;
  v24[12] = a8;
  _perform_0((uint64_t)self, (uint64_t)v24);
  v18 = (id)v30[5];
  if (a8)
  {
    v19 = (void *)v30[5];
    if (v19)
      *a8 = v19;
  }
  v15 = *((_BYTE *)v26 + 24) != 0;
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  return v15;
}

id __182__NSPersistentStoreCoordinator__NSPersistentStoreCoordinatorPrivateMethods___replacePersistentStoreAtURL_destinationOptions_withPersistentStoreFromURL_sourceOptions_storeType_error___block_invoke(uint64_t a1)
{
  char *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  int v9;
  id result;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = (char *)-[NSPersistentStoreCoordinator _storeClassForStoreWithType:URL:options:](*(const char **)(a1 + 32), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48));
  if (!v2)
    v2 = (char *)-[NSPersistentStoreCoordinator _storeClassForStoreWithType:URL:options:](*(const char **)(a1 + 32), *(_QWORD *)(a1 + 40), *(void **)(a1 + 64));
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "persistentStoreForURL:", *(_QWORD *)(a1 + 64));
  if (v3)
  {
    v4 = objc_opt_class();
    if (!-[NSPersistentStoreCoordinator _removePersistentStore:error:](*(_QWORD *)(a1 + 32), v3, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40)))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
      goto LABEL_25;
    }
  }
  else
  {
    v4 = 0;
  }
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "persistentStoreForURL:", *(_QWORD *)(a1 + 48));
  if (v5)
  {
    v6 = objc_opt_class();
    v7 = (void *)objc_msgSend(*(id *)(a1 + 56), "objectForKey:", CFSTR("NSPersistentStoreUnlinkDestroyOption"));
    if (v7)
      v8 = objc_msgSend(v7, "BOOLValue");
    else
      v8 = 0;
    if (objc_msgSend((id)objc_msgSend(v5, "type"), "isEqual:", CFSTR("SQLite")))
      -[NSSQLCore _disconnectAllConnections]((uint64_t)v5);
    if (v4 && v6 && v4 != v6)
    {
      v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("source and destination store are different classes of store: %@ != %@"), v4, v6);
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v19, 0));
    }
  }
  else
  {
    v8 = 0;
  }
  if (v2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = objc_msgSend(v2, "_replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:error:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
    v9 = v8;
  else
    v9 = 0;
  if (v9 == 1)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "setURL:forPersistentStore:", *(_QWORD *)(a1 + 64), v5);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = (void *)MEMORY[0x1E0C99D80];
      v17 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), 0);
      v18 = objc_msgSend(v16, "dictionaryWithObjectsAndKeys:", v17, *MEMORY[0x1E0CB3308], 0);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) = objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134080, v18);
    }
  }
LABEL_25:
  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24)
    && *(_QWORD *)(a1 + 96)
    && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), 0);
    v14 = objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v13, *MEMORY[0x1E0CB3308], 0);
    result = (id)objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134000, v14);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) = result;
  }
  return result;
}

- (BOOL)_destroyPersistentStoreAtURL:(id)a3 withType:(id)a4 options:(id)a5 error:(id *)a6
{
  NSPersistentStore *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  _QWORD v17[11];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Invalid store URL: nil"), 0, a6));
  v22 = 0;
  v23 = &v22;
  v24 = 0x3052000000;
  v25 = __Block_byref_object_copy__18;
  v26 = __Block_byref_object_dispose__18;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v11 = -[NSPersistentStoreCoordinator persistentStoreForURL:](self, "persistentStoreForURL:");
  if (v11)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v28 = CFSTR("removed");
    v29[0] = v11;
    objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification"), self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1));
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __129__NSPersistentStoreCoordinator__NSPersistentStoreCoordinatorPrivateMethods___destroyPersistentStoreAtURL_withType_options_error___block_invoke;
  v17[3] = &unk_1E1EDED50;
  v17[4] = self;
  v17[5] = a4;
  v17[6] = a3;
  v17[7] = a5;
  v17[8] = &v22;
  v17[9] = &v18;
  v17[10] = a6;
  _perform_0((uint64_t)self, (uint64_t)v17);
  v13 = (id)v23[5];
  if (a6)
  {
    v14 = (void *)v23[5];
    if (v14)
      *a6 = v14;
  }
  v15 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  return v15;
}

id __129__NSPersistentStoreCoordinator__NSPersistentStoreCoordinatorPrivateMethods___destroyPersistentStoreAtURL_withType_options_error___block_invoke(uint64_t a1)
{
  char *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;

  v2 = (char *)-[NSPersistentStoreCoordinator _storeClassForStoreWithType:URL:options:](*(const char **)(a1 + 32), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48));
  v3 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 40);
  v6 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "persistentStoreForURL:", *(_QWORD *)(a1 + 48));
  if (v7)
    v8 = !-[NSPersistentStoreCoordinator _removePersistentStore:error:](*(_QWORD *)(a1 + 32), v7, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  else
    v8 = 0;
  v9 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(v6, "drain");
  v10 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (!v8)
  {
    if (v2)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v2, "_destroyPersistentStoreAtURL:options:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    }
    else if (*(_QWORD *)(a1 + 80))
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *(_QWORD *)(a1 + 48), *MEMORY[0x1E0CB3308], 0);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134000, v12);
    }
  }

  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
}

- (BOOL)_destroyPersistentStoreAtURL:(id)a3 withType:(id)a4 error:(id *)a5
{
  return -[NSPersistentStoreCoordinator _destroyPersistentStoreAtURL:withType:options:error:](self, "_destroyPersistentStoreAtURL:withType:options:error:", a3, a4, 0, a5);
}

- (BOOL)_rekeyPersistentStoreAtURL:(id)a3 type:(id)a4 options:(id)a5 withKey:(id)a6 error:(id *)a7
{
  void *v13;
  uint64_t v14;
  id v15;
  char v16;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  _QWORD v27[13];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  NSPersistentStore *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  uint64_t v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  int v47;
  const __CFString *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Invalid store URL: nil"), 0, a6, a7));
  v38 = 0;
  v39 = &v38;
  v40 = 0x3052000000;
  v41 = __Block_byref_object_copy__18;
  v42 = __Block_byref_object_dispose__18;
  v43 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3052000000;
  v31 = __Block_byref_object_copy__18;
  v32 = __Block_byref_object_dispose__18;
  v33 = 0;
  v33 = -[NSPersistentStoreCoordinator persistentStoreForURL:](self, "persistentStoreForURL:");
  if (v29[5])
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = v29[5];
    v48 = CFSTR("removed");
    v49[0] = v14;
    objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("_NSPersistentStoreCoordinatorPrivateWillRemoveStoreNotification"), self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1));
  }
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __131__NSPersistentStoreCoordinator__NSPersistentStoreCoordinatorPrivateMethods___rekeyPersistentStoreAtURL_type_options_withKey_error___block_invoke;
  v27[3] = &unk_1E1EDED78;
  v27[4] = self;
  v27[5] = a4;
  v27[6] = a3;
  v27[7] = a5;
  v27[10] = &v38;
  v27[11] = &v34;
  v27[8] = a6;
  v27[9] = &v28;
  v27[12] = a7;
  _perform_0((uint64_t)self, (uint64_t)v27);
  v15 = (id)v39[5];
  if (!*((_BYTE *)v35 + 24))
  {
    v18 = (void *)v39[5];
    if (v18)
    {
      if (a7)
        *a7 = v18;
    }
    else
    {
      v19 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v19, v20, v21, v22, v23, v24, v25, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
      v26 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v45 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
        v46 = 1024;
        v47 = 6132;
        _os_log_fault_impl(&dword_18A253000, v26, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  v16 = *((_BYTE *)v35 + 24);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(&v38, 8);
  return v16;
}

id __131__NSPersistentStoreCoordinator__NSPersistentStoreCoordinatorPrivateMethods___rekeyPersistentStoreAtURL_type_options_withKey_error___block_invoke(uint64_t a1)
{
  char *v2;
  id v3;
  void *v4;
  BOOL v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  uint64_t v13;

  v2 = (char *)-[NSPersistentStoreCoordinator _storeClassForStoreWithType:URL:options:](*(const char **)(a1 + 32), *(_QWORD *)(a1 + 40), *(void **)(a1 + 48));
  v3 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (v4)
    v5 = !-[NSPersistentStoreCoordinator _removePersistentStore:error:](*(_QWORD *)(a1 + 32), v4, (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  else
    v5 = 0;
  v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  objc_msgSend(v3, "drain");
  v7 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  if (!v5)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v10 = *(_QWORD *)(v8 + 40);
    v9 = v8 + 40;
    if (!v10)
    {
      if (v2)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = objc_msgSend(v2, "_rekeyPersistentStoreAtURL:options:withKey:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v9);
      }
      else if (*(_QWORD *)(a1 + 96))
      {
        v12 = (void *)MEMORY[0x1E0CB35C8];
        v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", *(_QWORD *)(a1 + 48), *MEMORY[0x1E0CB3308], 0);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40) = objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134000, v13);
      }
    }
  }
  return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)delegate
{
  return objc_loadWeak((id *)&self->_delegate);
}

- (id)_reopenQueryGenerationWithIdentifier:(uint64_t)a3 inStoreWithIdentifier:(_QWORD *)a4 error:
{
  uint64_t *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;

  if (!a1)
    return 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__18;
  v21 = __Block_byref_object_dispose__18;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__18;
  v15 = __Block_byref_object_dispose__18;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __115__NSPersistentStoreCoordinator_QueryGenerations___reopenQueryGenerationWithIdentifier_inStoreWithIdentifier_error___block_invoke;
  v10[3] = &unk_1E1EDEDC8;
  v10[4] = a3;
  v10[5] = a2;
  v10[6] = &v17;
  v10[7] = &v11;
  -[NSPersistentStoreCoordinator _routeHeavyweightBlock:](a1, (uint64_t)v10);
  v5 = v12;
  v6 = (void *)v12[5];
  if (v6)
  {
    if (a4)
    {
      *a4 = v6;
      v6 = (void *)v5[5];
    }
    v7 = v6;
  }
  v8 = (id)v18[5];
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v8;
}

uint64_t __115__NSPersistentStoreCoordinator_QueryGenerations___reopenQueryGenerationWithIdentifier_inStoreWithIdentifier_error___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(a2);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if (objc_msgSend((id)objc_msgSend(v8, "identifier"), "isEqual:", a1[4]))
        {
          *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = (id)objc_msgSend(v8, "reopenQueryGenerationWithIdentifier:error:", a1[5], *(_QWORD *)(a1[7] + 8) + 40);
          v9 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
          if (v9)
            v10 = v9;
        }
        ++v7;
      }
      while (v5 != v7);
      result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

- (BOOL)_refreshTriggerValuesInStore:(id)a3 error:(id *)a4
{
  NSPersistentStoreCoordinator *v7;
  id v8;
  char v9;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[7];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3052000000;
  v26 = __Block_byref_object_copy__18;
  v27 = __Block_byref_object_dispose__18;
  v28 = 0;
  v7 = (NSPersistentStoreCoordinator *)objc_msgSend(a3, "_persistentStoreCoordinator");
  if (v7 != self)
  {
    v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Provided persistent store must be from this coordinator: %@\n%@\n%@"), self, v7, a3);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v20, 0));
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Provided persistent store must be of type NSSQLiteStoreType: %@"), a3);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v21, 0));
  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __77__NSPersistentStoreCoordinator_Triggers___refreshTriggerValuesInStore_error___block_invoke;
  v22[3] = &unk_1E1EDEE18;
  v22[4] = a3;
  v22[5] = &v29;
  v22[6] = &v23;
  -[NSPersistentStoreCoordinator performBlockAndWait:](self, "performBlockAndWait:", v22);
  v8 = (id)v24[5];
  if (!*((_BYTE *)v30 + 24))
  {
    v11 = (void *)v24[5];
    if (v11)
    {
      if (a4)
        *a4 = v11;
    }
    else
    {
      v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
      _NSCoreDataLog(17, v12, v13, v14, v15, v16, v17, v18, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m");
      v19 = __pflogFaultLog;
      if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentStoreCoordinator.m";
        v35 = 1024;
        v36 = 6310;
        _os_log_fault_impl(&dword_18A253000, v19, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
      }
    }
  }
  v9 = *((_BYTE *)v30 + 24);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);
  return v9;
}

id __77__NSPersistentStoreCoordinator_Triggers___refreshTriggerValuesInStore_error___block_invoke(uint64_t *a1)
{
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = -[NSSQLCore _refreshTriggerValues:](a1[4], (id *)(*(_QWORD *)(a1[6] + 8) + 40));
  return *(id *)(*(_QWORD *)(a1[6] + 8) + 40);
}

+ (BOOL)removePersistentHistoryFromPersistentStoreAtURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  char *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  char v19;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v29 = *MEMORY[0x1E0CB2AA0];
    if (objc_msgSend(a3, "path"))
      v22 = objc_msgSend(a3, "path");
    else
      v22 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v30[0] = v22;
    v23 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    objc_exception_throw((id)objc_msgSend(v21, "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Invalid store URL"), v23));
  }
  objc_opt_class();
  objc_opt_class();
  v8 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v24 = 0;
  v9 = (char *)+[NSPersistentStoreCoordinator _classForPersistentStoreAtURL:]((uint64_t)NSPersistentStoreCoordinator, a3);
  if (v9)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = objc_msgSend(v9, "dropPersistentHistoryforPersistentStoreWithURL:options:error:", a3, a4, &v24);
      goto LABEL_15;
    }
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v27 = *MEMORY[0x1E0CB2AA0];
    if (objc_msgSend(a3, "path", v24))
      v14 = objc_msgSend(a3, "path");
    else
      v14 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v28 = v14;
    v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v16 = (void *)objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 134091, v15);
  }
  else
  {
    if (!a5)
      goto LABEL_18;
    v11 = (void *)MEMORY[0x1E0CB35C8];
    if (objc_msgSend(a3, "path", v24, *MEMORY[0x1E0CB2AA0]))
      v12 = objc_msgSend(a3, "path");
    else
      v12 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = v12;
    v17 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v16 = (void *)objc_msgSend(v11, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, v17);
  }
  v10 = 0;
  v24 = v16;
LABEL_15:
  if (!a5 || (v10 & 1) != 0)
    goto LABEL_19;
  v18 = v24;
LABEL_18:
  v10 = 0;
LABEL_19:
  objc_msgSend(v8, "drain", v24);
  if (a5)
    v19 = v10;
  else
    v19 = 1;
  if ((v19 & 1) == 0)
    *a5 = v24;
  return v10;
}

- (os_unfair_lock_s)_xpcBundleIdentifier
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  id v3;

  if (result)
  {
    v1 = result;
    v2 = result + 8;
    os_unfair_lock_lock_with_options();
    v3 = *(id *)&v1[20]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)v3;
  }
  return result;
}

- (os_unfair_lock_s)_xpcProcessName
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  id v3;

  if (result)
  {
    v1 = result;
    v2 = result + 8;
    os_unfair_lock_lock_with_options();
    v3 = *(id *)&v1[22]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)v3;
  }
  return result;
}

id __113__NSPersistentStoreCoordinator_DeferredLightweightMigration___finishDeferredLightweightMigrationTasks_withError___block_invoke(uint64_t a1)
{
  void *v2;
  id result;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "persistentStores", 0);
  result = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v8;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "finishDeferredLightweightMigration:withError:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) & 1) == 0)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
          return *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      result = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      v4 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (uint64_t)_handleFaultingError:(uint64_t)a3 fromContext:
{
  uint64_t v5;
  void *v6;

  if (result)
  {
    v5 = objc_msgSend((id)result, "delegate");
    if (v5 && (v6 = (void *)v5, (objc_opt_respondsToSelector() & 1) != 0))
      return objc_msgSend(v6, "handleFaultingError:fromContext:", a2, a3);
    else
      return 1;
  }
  return result;
}

@end
