@implementation AVFigAssetInspectorLoader

- (BOOL)isComposable
{
  char v3;
  char v4;

  v3 = -[AVFigAssetInspectorLoader _isStreaming](self, "_isStreaming");
  v4 = objc_msgSend(-[AVFigAssetInspectorLoader assetInspector](self, "assetInspector"), "isComposable");
  return (-[AVFigAssetInspectorLoader statusOfValueForKey:error:](self, "statusOfValueForKey:error:", CFSTR("composable"), 0) == 2) & ~v3 & v4;
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 completionHandler:(id)a4
{
  -[AVFigAssetInspectorLoader loadValuesAsynchronouslyForKeys:keysForCollectionKeys:completionHandler:](self, "loadValuesAsynchronouslyForKeys:keysForCollectionKeys:completionHandler:", a3, 0, a4);
}

- (int64_t)statusOfValueForKey:(id)a3 error:(id *)a4
{
  return -[AVFigAssetInspectorLoader _statusOfValueForKey:error:firstNonLoadedDependencyKey:](self, "_statusOfValueForKey:error:firstNonLoadedDependencyKey:", a3, a4, 0);
}

- (void)loadValuesAsynchronouslyForKeys:(id)a3 keysForCollectionKeys:(id)a4 completionHandler:(id)a5
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  OpaqueFigAsset *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  unsigned int v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t (*v34)(OpaqueFigAsset *, void *, char *, unsigned int *);
  int v35;
  NSObject *v36;
  CFNumberRef v37;
  CFNumberRef v38;
  void *v39;
  NSObject *v40;
  uint64_t (*v41)(OpaqueFigAsset *, _QWORD, void *, char *, unsigned int *);
  int v42;
  NSObject *v43;
  CFNumberRef v44;
  CFNumberRef v45;
  void *v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v54;
  _QWORD v55[7];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  unsigned int valuePtr;
  _BYTE v61[128];
  int v62;
  const char *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (dword_1ECDECF18)
  {
    valuePtr = 0;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v46 = (void *)MEMORY[0x1E0C99DA0];
      v47 = *MEMORY[0x1E0C99778];
      v48 = "(keys == nil) || [keys isKindOfClass:[NSArray class]]";
      goto LABEL_67;
    }
  }
  if (!a4)
    goto LABEL_15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v46 = (void *)MEMORY[0x1E0C99DA0];
    v47 = *MEMORY[0x1E0C99778];
    v48 = "[keysForCollectionKeys isKindOfClass:[NSDictionary class]]";
LABEL_67:
    v49 = (void *)objc_msgSend(v46, "exceptionWithName:reason:userInfo:", v47, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v10, v11, v12, v13, v14, (uint64_t)v48), 0);
    objc_exception_throw(v49);
  }
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v15 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (!v15)
    goto LABEL_15;
  v16 = v15;
  v17 = *(_QWORD *)v57;
  do
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v57 != v17)
        objc_enumerationMutation(a4);
      objc_msgSend(a4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i), v50, v52);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v46 = (void *)MEMORY[0x1E0C99DA0];
        v47 = *MEMORY[0x1E0C99778];
        v48 = "[[keysForCollectionKeys objectForKey:thisKey] isKindOfClass:[NSArray class]]";
        goto LABEL_67;
      }
    }
    v16 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  }
  while (v16);
LABEL_15:
  MEMORY[0x194033BF8](self->_loadingMutex);
  v19 = -[AVFigAssetInspectorLoader _figAsset](self, "_figAsset");
  if (objc_msgSend(a3, "count"))
  {
    if (!v19)
    {
LABEL_21:
      v20 = 0;
      goto LABEL_22;
    }
LABEL_20:
    if (self->_loadingCanceled)
      goto LABEL_21;
    v20 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
    v25 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
    objc_msgSend(v25, "addObjectsFromArray:", a3);
    if (a4)
      objc_msgSend(v25, "addObjectsFromArray:", objc_msgSend(a4, "allKeys"));
    v26 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0, v50);
    v27 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
    objc_msgSend((id)objc_opt_class(), "_mapAssetKeys:toFigAssetPropertySet:figAssetTrackPropertySet:callerName:", v25, v26, v27, CFSTR("-[AVAsset loadValuesAsynchronouslyForKeys:completionHandler:]"));
    if (a4)
    {
      v28 = objc_msgSend(a4, "objectForKey:", CFSTR("tracks"));
      if (v28)
      {
        v29 = (void *)v28;
        v30 = dictionaryOfFigAssetTrackPropertiesForTrackKeys(self->_prefersNominalDurations);
        v31 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __101__AVFigAssetInspectorLoader_loadValuesAsynchronouslyForKeys_keysForCollectionKeys_completionHandler___block_invoke;
        v55[3] = &unk_1E3034698;
        v55[4] = v30;
        v55[5] = v27;
        v55[6] = v31;
        objc_msgSend(v29, "enumerateObjectsUsingBlock:", v55);
        if (objc_msgSend(v31, "count"))
          NSLog(CFSTR("-[AVAsset loadValuesAsynchronouslyForKeys:keysForCollectionKeys:completionHandler:] invoked with unrecognized AVAssetTrack keys %@."), objc_msgSend(v31, "allObjects"));
      }
    }
    v32 = (void *)objc_msgSend(v26, "allObjects");
    if (objc_msgSend(v32, "count"))
    {
      valuePtr = 0;
      v54 = 0;
      if (dword_1ECDECF18)
      {
        v33 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v34 = *(uint64_t (**)(OpaqueFigAsset *, void *, char *, unsigned int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                       + 16);
      if (v34)
        v35 = v34(v19, v32, &v54, &valuePtr);
      else
        v35 = -12782;
      if (dword_1ECDECF18)
      {
        v36 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (!v35 && !v54)
      {
        v37 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &valuePtr);
        if (v37)
        {
          v38 = v37;
          objc_msgSend(v20, "setObject:forKey:", v37, CFSTR("AVAsynchronousLoadingPropertyBatchIDKey"));
          CFRelease(v38);
        }
      }
    }
    v39 = (void *)objc_msgSend(v27, "allObjects", v51, v52);
    if (objc_msgSend(v39, "count"))
    {
      valuePtr = 0;
      v54 = 0;
      if (dword_1ECDECF18)
      {
        v40 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v41 = *(uint64_t (**)(OpaqueFigAsset *, _QWORD, void *, char *, unsigned int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                               + 80);
      if (v41)
        v42 = v41(v19, 0, v39, &v54, &valuePtr);
      else
        v42 = -12782;
      if (dword_1ECDECF18)
      {
        v43 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      if (!v42 && !v54)
      {
        v44 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &valuePtr);
        if (v44)
        {
          v45 = v44;
          objc_msgSend(v20, "setObject:forKey:", v44, CFSTR("AVAsynchronousLoadingTrackPropertyBatchIDKey"));
          CFRelease(v45);
        }
      }
    }
  }
  else
  {
    v20 = 0;
    if (objc_msgSend(a4, "count") && v19)
      goto LABEL_20;
  }
LABEL_22:
  if (objc_msgSend(v20, "count", v50, v52))
  {
    if (a5)
    {
      v21 = (void *)objc_msgSend(a5, "copy");
      objc_msgSend(v20, "setObject:forKey:", v21, CFSTR("AVAsynchronousLoadingCompletionHandlerKey"));

    }
    -[NSMutableArray addObject:](self->_loadingBatches, "addObject:", v20);
    MEMORY[0x194033C04](self->_loadingMutex);
  }
  else
  {
    MEMORY[0x194033C04](self->_loadingMutex);
    if (a5)
    {
      if (dword_1ECDECF18)
      {
        valuePtr = 0;
        v22 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v23 = valuePtr;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          v24 = v23;
        else
          v24 = v23 & 0xFFFFFFFE;
        if (v24)
        {
          v62 = 136315394;
          v63 = "-[AVFigAssetInspectorLoader loadValuesAsynchronouslyForKeys:keysForCollectionKeys:completionHandler:]";
          v64 = 2048;
          v65 = v20;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      (*((void (**)(id))a5 + 2))(a5);
    }
  }
}

+ (void)_mapAssetKeys:(id)a3 toFigAssetPropertySet:(id)a4 figAssetTrackPropertySet:(id)a5 callerName:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[9];

  v11 = objc_msgSend(a1, "_figAssetPropertiesForKeys");
  v12 = objc_msgSend(a1, "_figAssetTrackPropertiesForKeys");
  v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 0);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __101__AVFigAssetInspectorLoader__mapAssetKeys_toFigAssetPropertySet_figAssetTrackPropertySet_callerName___block_invoke;
  v14[3] = &unk_1E3034670;
  v14[4] = v11;
  v14[5] = v12;
  v14[6] = v13;
  v14[7] = a4;
  v14[8] = a5;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v14);
  if (objc_msgSend(v13, "count"))
    NSLog(CFSTR("%@ invoked with unrecognized keys %@."), a6, objc_msgSend(v13, "allObjects"));
}

+ (id)_figAssetTrackPropertiesForKeys
{
  if (ensureDictionariesOfFigPropertiesForKeys_buildFigPropertiesForKeysOnce != -1)
    dispatch_once(&ensureDictionariesOfFigPropertiesForKeys_buildFigPropertiesForKeysOnce, &__block_literal_global_304);
  return (id)sFigAssetTrackPropertiesForKeys;
}

- (id)_loadingBatches
{
  return self->_loadingBatches;
}

- (int64_t)_statusOfValueForKey:(id)a3 error:(id *)a4 firstNonLoadedDependencyKey:(id *)a5
{
  OpaqueFigAsset *v9;
  void *v10;
  int64_t v11;
  OpaqueFigAsset *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id *v20;
  uint64_t v21;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  id v29;
  BOOL v30;
  void *v32;
  void *v33;
  uint64_t v34;
  id *v36;
  id *v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v48 = 0;
  MEMORY[0x194033BF8](self->_loadingMutex, a2);
  v9 = -[AVFigAssetInspectorLoader _figAsset](self, "_figAsset");
  if (self->_loadingCanceled)
  {
    v10 = 0;
    v11 = 4;
    goto LABEL_49;
  }
  v12 = v9;
  if (!v9)
  {
    v29 = -[AVAssetInspectorLoader _createAVErrorForError:andFigErrorCode:](self, "_createAVErrorForError:andFigErrorCode:", 0, self->_figAssetCreationStatus);
    v10 = 0;
    goto LABEL_48;
  }
  v13 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "_figAssetPropertiesForKeys"), "objectForKey:", a3);
  v14 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (!v13)
  {
    NSLog(CFSTR("-[AVAsset statusOfValueForKey:error:] invoked with unrecognized key %@."), a3);
    v11 = -[AVFigAssetInspectorLoader _loadStatusForProperty:figAsset:error:](self, "_loadStatusForProperty:figAsset:error:", *MEMORY[0x1E0CC39C8], v12, &v48);
    v10 = 0;
    goto LABEL_49;
  }
  v15 = (void *)v14;
  v37 = a4;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (!v16)
  {
    v10 = 0;
    v11 = 2;
    goto LABEL_39;
  }
  v17 = v16;
  v36 = a5;
  v18 = *(_QWORD *)v45;
  v11 = 2;
  v38 = *(_QWORD *)v45;
  v39 = v13;
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v45 != v18)
        objc_enumerationMutation(v13);
      v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
      if (v11 >= 3)
        v20 = 0;
      else
        v20 = &v48;
      v21 = -[AVFigAssetInspectorLoader _loadStatusForProperty:figAsset:error:](self, "_loadStatusForProperty:figAsset:error:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i), v12, v20);
      if (v21 <= 1 && v11 != 3)
      {
        v11 = v21;
        goto LABEL_36;
      }
      if (v21 == 3)
      {
        if (!objc_msgSend(v10, "isEqualToString:", CFSTR("availableMediaCharacteristicsWithMediaSelectionOptions")))
        {
          objc_msgSend(v15, "addObject:", v10);
LABEL_31:
          v11 = 3;
          continue;
        }
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v23 = +[AVFigAssetInspectorLoader _figAssetMediaSelectionPropertiesArray](AVFigAssetInspectorLoader, "_figAssetMediaSelectionPropertiesArray");
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        if (!v24)
          goto LABEL_31;
        v25 = v24;
        v26 = *(_QWORD *)v41;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v41 != v26)
              objc_enumerationMutation(v23);
            v28 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j);
            if (-[AVFigAssetInspectorLoader _loadStatusForProperty:figAsset:error:](self, "_loadStatusForProperty:figAsset:error:", v28, v12, 0) == 3)objc_msgSend(v15, "addObject:", v28);
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        }
        while (v25);
        v11 = 3;
        v18 = v38;
        v13 = v39;
      }
    }
    v17 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  }
  while (v17);
  v10 = 0;
LABEL_36:
  a5 = v36;
LABEL_39:
  a4 = v37;
  if (v37)
  {
    v30 = v11 != 3 || v48 == 0;
    if (!v30 && v15 != 0)
    {
      v32 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", objc_msgSend(v48, "userInfo"));
      objc_msgSend(v32, "setObject:forKey:", v15, CFSTR("AVErrorFailedDependenciesKey"));
      v33 = (void *)MEMORY[0x1E0CB35C8];
      v34 = objc_msgSend(v48, "domain");
      v29 = (id)objc_msgSend(v33, "errorWithDomain:code:userInfo:", v34, objc_msgSend(v48, "code"), v32);
LABEL_48:
      v48 = v29;
      v11 = 3;
    }
  }
LABEL_49:
  MEMORY[0x194033C04](self->_loadingMutex);
  if (a4 && v11 == 3)
    *a4 = v48;
  if (a5)
    *a5 = v10;
  return v11;
}

- (OpaqueFigAsset)_figAsset
{
  return self->_figAsset;
}

- (int64_t)_loadStatusForProperty:(id)a3 figAsset:(OpaqueFigAsset *)a4 error:(id *)a5
{
  uint64_t (*v9)(OpaqueFigAsset *, id, char *, uint64_t *, void **);
  unsigned int v10;
  void *v11;
  id v12;
  int v13;
  unsigned int v14;
  uint64_t v15;
  void *v17;
  uint64_t v18;

  v17 = 0;
  v18 = 0;
  v9 = *(uint64_t (**)(OpaqueFigAsset *, id, char *, uint64_t *, void **))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                              + 16)
                                                                                  + 8);
  if (v9)
  {
    v10 = v9(a4, a3, (char *)&v18 + 4, &v18, &v17);
    v11 = v17;
  }
  else
  {
    v11 = 0;
    v10 = -12782;
  }
  v12 = v11;
  if (v10)
    v13 = 3;
  else
    v13 = HIDWORD(v18);
  if (a5 && v13 == 3)
  {
    if (HIDWORD(v18) == 3)
      v14 = v18;
    else
      v14 = 0;
    if (v10)
      v15 = v10;
    else
      v15 = v14;
    *a5 = -[AVAssetInspectorLoader _createAVErrorForError:andFigErrorCode:](self, "_createAVErrorForError:andFigErrorCode:", v12, v15, v17);
  }
  return v13;
}

+ (id)_figAssetPropertiesForKeys
{
  if (ensureDictionariesOfFigPropertiesForKeys_buildFigPropertiesForKeysOnce != -1)
    dispatch_once(&ensureDictionariesOfFigPropertiesForKeys_buildFigPropertiesForKeysOnce, &__block_literal_global_304);
  return (id)sFigAssetPropertiesForKeys;
}

- (OpaqueFigSimpleMutex)_loadingMutex
{
  return self->_loadingMutex;
}

- (void)_invokeCompletionHandlerForLoadingBatches:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v3)
  {
    v4 = v3;
    v19 = *(_QWORD *)v21;
    do
    {
      v5 = 0;
      v16 = v4;
      do
      {
        if (*(_QWORD *)v21 != v19)
          objc_enumerationMutation(a3);
        v6 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v5);
        v7 = objc_msgSend(v6, "objectForKey:", CFSTR("AVAsynchronousLoadingCompletionHandlerKey"), v14, v15);
        if (v7)
        {
          v8 = (void *)v7;
          v9 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AVAsynchronousLoadingPropertyBatchIDKey"));
          if (v9)
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", batchID = %ld"), objc_msgSend(v9, "longValue"));
          v11 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AVAsynchronousLoadingTrackPropertyBatchIDKey"));
          if (v11)
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", track batchID = %ld"), objc_msgSend(v11, "longValue"));
          if (dword_1ECDECF18)
          {
            os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            v4 = v16;
          }
          dispatch_async((dispatch_queue_t)self->_completionHandlerQueue, v8);
        }
        else if (dword_1ECDECF18)
        {
          v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        ++v5;
      }
      while (v4 != v5);
      v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v4);
  }
  if (!objc_msgSend(a3, "count", v14, v15))
  {
    if (dword_1ECDECF18)
    {
      v13 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
}

uint64_t __101__AVFigAssetInspectorLoader__mapAssetKeys_toFigAssetPropertySet_figAssetTrackPropertySet_callerName___block_invoke(id *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = objc_msgSend(a1[4], "objectForKey:", a2);
  result = objc_msgSend(a1[5], "objectForKey:", a2);
  if (v4 | result)
  {
    v6 = result;
    if (v4)
      result = objc_msgSend(a1[7], "addObjectsFromArray:", v4);
    if (v6)
      return objc_msgSend(a1[8], "addObjectsFromArray:", v6);
  }
  else
  {
    objc_msgSend(a1[6], "addObject:", a2);
    return objc_msgSend(a1[7], "addObject:", *MEMORY[0x1E0CC39C8]);
  }
  return result;
}

- (AVFigAssetInspectorLoader)initWithURL:(id)a3 figAssetCreationFlags:(unint64_t)a4 figAssetCreationOptions:(id)a5 avAssetInitializationOptions:(id)a6 forAsset:(id)a7 figErr:(int *)a8
{
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;

  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a5);
  if (objc_msgSend(a7, "_hasResourceLoaderDelegate"))
  {
    v13 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    objc_msgSend(v12, "setObject:forKey:", v13, *MEMORY[0x1E0CC3710]);
  }
  v14 = (void *)objc_msgSend(a6, "objectForKey:", CFSTR("AVAssetRequiresInProcessOperationKey"));
  if (v14 && (objc_msgSend(v14, "BOOLValue") & 1) != 0)
    v15 = FigAssetCreateWithURL();
  else
    v15 = FigAssetRemoteCreateWithURLAndRetry();
  v16 = v15;

  if (a8)
    *a8 = v16;
  return 0;
}

- (void)_removeFigAssetNotifications
{
  id v3;
  AVWeakReference *v4;

  if (self->_figAsset)
  {
    if (self->_registeredForFigAssetNotifications)
    {
      v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
      v4 = -[AVAssetInspectorLoader _weakReference](self, "_weakReference");
      objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, handleFigAssetLoadingNotification, *MEMORY[0x1E0CC3648], self->_figAsset);
      objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, handleAndReflectFigAssetNotification, *MEMORY[0x1E0CC3668], self->_figAsset);
      objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, handleAndReflectFigAssetNotification, *MEMORY[0x1E0CC3660], self->_figAsset);
      objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, handleAndReflectFigAssetNotification, *MEMORY[0x1E0CC3688], self->_figAsset);
      objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, handleAndReflectFigAssetNotification, *MEMORY[0x1E0CC3690], self->_figAsset);
      objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, handleAndReflectFigAssetNotification, *MEMORY[0x1E0CC3680], self->_figAsset);
      objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, handleAndReflectFigAssetNotification, *MEMORY[0x1E0CC3678], self->_figAsset);
      CFRelease(v4);
      self->_registeredForFigAssetNotifications = 0;
    }
  }
}

- (AVFigAssetInspectorLoader)initWithFigAsset:(OpaqueFigAsset *)a3 forAsset:(id)a4
{
  AVFigAssetInspectorLoader *v6;
  OpaqueFigAsset *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  uint64_t v10;
  uint64_t CMBaseObject;
  NSURL *v12;
  uint64_t v13;
  void (*v14)(uint64_t, _QWORD, uint64_t, CFTypeRef *);
  void *v15;
  OpaqueFigAsset *figAsset;
  id v18;
  _QWORD *v19;
  void (*v20)(OpaqueFigAsset *, const __CFString *, id);
  uint64_t v21;
  OpaqueFigAsset *v22;
  _QWORD *v23;
  void (*v24)(OpaqueFigAsset *, const __CFString *, uint64_t);
  OpaqueFigAsset *v25;
  uint64_t v26;
  _QWORD *v27;
  void (*v28)(OpaqueFigAsset *, const __CFString *, uint64_t);
  uint64_t v29;
  OpaqueFigAsset *v30;
  _QWORD *v31;
  void (*v32)(OpaqueFigAsset *, const __CFString *, uint64_t);
  NSURL *v33;
  objc_super v34;
  CFTypeRef cf;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v34.receiver = self;
  v34.super_class = (Class)AVFigAssetInspectorLoader;
  cf = 0;
  v6 = -[AVAssetInspectorLoader init](&v34, sel_init);
  if (v6)
  {
    v6->_assetInspectorOnce = objc_alloc_init(AVDispatchOnce);
    v6->_weakReferenceToAsset = (AVWeakReference *)(id)objc_msgSend(a4, "_weakReference");
    if (a3)
      v7 = (OpaqueFigAsset *)CFRetain(a3);
    else
      v7 = 0;
    v6->_figAsset = v7;
    v6->_loadingMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v6->_loadingBatches = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = dispatch_queue_create("com.apple.avfoundation.avasset.completionsQueue", v8);
    v6->_completionHandlerQueue = (OS_dispatch_queue *)v9;
    if (v6->_loadingMutex && v6->_loadingBatches && v9)
    {
      if (v6->_figAsset)
      {
        v33 = 0;
        -[AVFigAssetInspectorLoader _addFigAssetNotifications](v6, "_addFigAssetNotifications");
        v10 = *MEMORY[0x1E0C9AE00];
        CMBaseObject = FigAssetGetCMBaseObject();
        v12 = *(NSURL **)(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
        if (v12)
        {
          ((void (*)(uint64_t, _QWORD, uint64_t, NSURL **))v12)(CMBaseObject, *MEMORY[0x1E0CC3998], v10, &v33);
          v12 = v33;
        }
        v6->_URL = v12;
        v13 = FigAssetGetCMBaseObject();
        v14 = *(void (**)(uint64_t, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
        if (v14)
        {
          v14(v13, *MEMORY[0x1E0CC3988], v10, &cf);
          v15 = (void *)cf;
        }
        else
        {
          v15 = 0;
        }
        v6->_prefersNominalDurations = ((unsigned __int16)objc_msgSend(v15, "longLongValue") >> 8) & 1;
        figAsset = v6->_figAsset;
        v18 = +[AVFigAssetInspectorLoader _figAssetTrackMediaSelectionPropertiesArray](AVFigAssetInspectorLoader, "_figAssetTrackMediaSelectionPropertiesArray");
        v19 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
        if (*v19 >= 2uLL)
        {
          v20 = (void (*)(OpaqueFigAsset *, const __CFString *, id))v19[13];
          if (v20)
            v20(figAsset, CFSTR("trackPropertyForMediaSelectionOptions"), v18);
        }
        v21 = objc_msgSend(+[AVFigAssetInspectorLoader _figAssetMediaSelectionPropertiesArray](AVFigAssetInspectorLoader, "_figAssetMediaSelectionPropertiesArray"), "arrayByAddingObject:", CFSTR("trackPropertyForMediaSelectionOptions"));
        v22 = v6->_figAsset;
        v23 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
        if (*v23 >= 2uLL)
        {
          v24 = (void (*)(OpaqueFigAsset *, const __CFString *, uint64_t))v23[11];
          if (v24)
            v24(v22, CFSTR("availableMediaCharacteristicsWithMediaSelectionOptions"), v21);
        }
        v25 = v6->_figAsset;
        v37[0] = *MEMORY[0x1E0CC5FE8];
        v26 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
        v27 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
        if (*v27 >= 2uLL)
        {
          v28 = (void (*)(OpaqueFigAsset *, const __CFString *, uint64_t))v27[13];
          if (v28)
            v28(v25, CFSTR("trackPropertyForPlaybackCapabilities"), v26);
        }
        v36 = *MEMORY[0x1E0CC39E0];
        v29 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1), "arrayByAddingObject:", CFSTR("trackPropertyForPlaybackCapabilities"));
        v30 = v6->_figAsset;
        v31 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
        if (*v31 >= 2uLL)
        {
          v32 = (void (*)(OpaqueFigAsset *, const __CFString *, uint64_t))v31[11];
          if (v32)
            v32(v30, CFSTR("playbackCapabilities"), v29);
        }
        if (cf)
          CFRelease(cf);
      }
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)_addFigAssetNotifications
{
  id v3;
  AVWeakReference *v4;

  if (self->_figAsset)
  {
    if (!self->_registeredForFigAssetNotifications)
    {
      v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
      v4 = -[AVAssetInspectorLoader _weakReference](self, "_weakReference");
      CFRetain(v4);
      objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, handleFigAssetLoadingNotification, *MEMORY[0x1E0CC3648], self->_figAsset, 0);
      objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, handleAndReflectFigAssetNotification, *MEMORY[0x1E0CC3668], self->_figAsset, 0);
      objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, handleAndReflectFigAssetNotification, *MEMORY[0x1E0CC3660], self->_figAsset, 0);
      objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, handleAndReflectFigAssetNotification, *MEMORY[0x1E0CC3688], self->_figAsset, 0);
      objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, handleAndReflectFigAssetNotification, *MEMORY[0x1E0CC3690], self->_figAsset, 0);
      objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, handleAndReflectFigAssetNotification, *MEMORY[0x1E0CC3680], self->_figAsset, 0);
      objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, handleAndReflectFigAssetNotification, *MEMORY[0x1E0CC3678], self->_figAsset, 0);
      self->_registeredForFigAssetNotifications = 1;
    }
  }
}

+ (id)_figAssetTrackMediaSelectionPropertiesArray
{
  if (ensureDictionariesOfFigPropertiesForKeys_buildFigPropertiesForKeysOnce != -1)
    dispatch_once(&ensureDictionariesOfFigPropertiesForKeys_buildFigPropertiesForKeysOnce, &__block_literal_global_304);
  return (id)sFigAssetTrackMediaSelectionProperties;
}

+ (id)_figAssetMediaSelectionPropertiesArray
{
  if (ensureDictionariesOfFigPropertiesForKeys_buildFigPropertiesForKeysOnce != -1)
    dispatch_once(&ensureDictionariesOfFigPropertiesForKeys_buildFigPropertiesForKeysOnce, &__block_literal_global_304);
  return (id)sFigAssetMediaSelectionProperties;
}

- (BOOL)_prefersNominalDurations
{
  return self->_prefersNominalDurations;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  result = -[AVFigAssetInspectorLoader assetInspector](self, "assetInspector");
  if (result)
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE duration](result, "duration");
  retstr->var0 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  return result;
}

- (void)_ensureAllDependenciesOfKeyAreLoaded:(id)a3
{
  id v5;
  uint64_t v6;
  double v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[AVFigAssetInspectorLoader statusOfValueForKey:error:](self, "statusOfValueForKey:error:", a3, 0) <= 1)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v5 = objc_alloc_init(MEMORY[0x1E0CB3530]);
    v6 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", a3);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __66__AVFigAssetInspectorLoader__ensureAllDependenciesOfKeyAreLoaded___block_invoke;
    v12[3] = &unk_1E302FDB0;
    v12[4] = v5;
    v12[5] = &v13;
    -[AVFigAssetInspectorLoader loadValuesAsynchronouslyForKeys:completionHandler:](self, "loadValuesAsynchronouslyForKeys:completionHandler:", v6, v12);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
    objc_msgSend(v5, "lock");
    if (!*((_BYTE *)v14 + 24))
    {
      v7 = 5.0;
      do
      {
        objc_msgSend(v5, "waitUntilDate:", objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v7, v9, v10));
        if (*((_BYTE *)v14 + 24))
          break;
        v11 = 0;
        -[AVFigAssetInspectorLoader _statusOfValueForKey:error:firstNonLoadedDependencyKey:](self, "_statusOfValueForKey:error:firstNonLoadedDependencyKey:", a3, 0, &v11);
        if (dword_1ECDECF18)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v7 = v7 + v7;
      }
      while (!*((_BYTE *)v14 + 24));
    }
    objc_msgSend(v5, "unlock", v9, v10);

    _Block_object_dispose(&v13, 8);
  }
}

- (BOOL)_isStreaming
{
  return objc_msgSend(-[AVFigAssetInspectorLoader assetInspector](self, "assetInspector"), "_isStreaming");
}

- (id)assetInspector
{
  AVDispatchOnce *assetInspectorOnce;
  _QWORD v5[5];

  assetInspectorOnce = self->_assetInspectorOnce;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__AVFigAssetInspectorLoader_assetInspector__block_invoke;
  v5[3] = &unk_1E302FA10;
  v5[4] = self;
  -[AVDispatchOnce runBlockOnce:](assetInspectorOnce, "runBlockOnce:", v5);
  return self->_assetInspector;
}

- (Class)_classForTrackInspectors
{
  return (Class)objc_opt_class();
}

AVFigAssetInspector *__43__AVFigAssetInspectorLoader_assetInspector__block_invoke(uint64_t a1)
{
  AVFigAssetInspector *result;

  result = -[AVFigAssetInspector initWithFigAsset:]([AVFigAssetInspector alloc], "initWithFigAsset:", objc_msgSend(*(id *)(a1 + 32), "_figAsset"));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = result;
  return result;
}

- (id)figChapters
{
  return (id)objc_msgSend(-[AVFigAssetInspectorLoader assetInspector](self, "assetInspector"), "figChapters");
}

- (id)figChapterGroupInfo
{
  return (id)objc_msgSend(-[AVFigAssetInspectorLoader assetInspector](self, "assetInspector"), "figChapterGroupInfo");
}

- (BOOL)hasProtectedContent
{
  return objc_msgSend(-[AVFigAssetInspectorLoader assetInspector](self, "assetInspector"), "hasProtectedContent");
}

- (BOOL)isPlayable
{
  return objc_msgSend(-[AVFigAssetInspectorLoader assetInspector](self, "assetInspector"), "isPlayable");
}

- (void)dealloc
{
  NSObject *completionHandlerQueue;
  OpaqueFigAsset *figAsset;
  objc_super v5;

  -[AVFigAssetInspectorLoader _removeFigAssetNotifications](self, "_removeFigAssetNotifications");

  completionHandlerQueue = self->_completionHandlerQueue;
  if (completionHandlerQueue)
    dispatch_release(completionHandlerQueue);
  figAsset = self->_figAsset;
  if (figAsset)
    CFRelease(figAsset);
  if (self->_loadingMutex)
    FigSimpleMutexDestroy();
  v5.receiver = self;
  v5.super_class = (Class)AVFigAssetInspectorLoader;
  -[AVAssetInspectorLoader dealloc](&v5, sel_dealloc);
}

- (OpaqueFigFormatReader)_copyFormatReader
{
  return (OpaqueFigFormatReader *)objc_msgSend(-[AVFigAssetInspectorLoader assetInspector](self, "assetInspector"), "_copyFormatReader");
}

- (id)asset
{
  return -[AVWeakReference referencedObject](self->_weakReferenceToAsset, "referencedObject");
}

- (id)_completionHandlerQueue
{
  return self->_completionHandlerQueue;
}

uint64_t __101__AVFigAssetInspectorLoader_loadValuesAsynchronouslyForKeys_keysForCollectionKeys_completionHandler___block_invoke(id *a1, uint64_t a2)
{
  uint64_t v4;

  v4 = objc_msgSend(a1[4], "objectForKey:", a2);
  if (v4)
    return objc_msgSend(a1[5], "addObjectsFromArray:", v4);
  else
    return objc_msgSend(a1[6], "addObject:", a2);
}

- (void)cancelLoading
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  MEMORY[0x194033BF8](self->_loadingMutex, a2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", self->_loadingBatches);
  -[NSMutableArray removeAllObjects](self->_loadingBatches, "removeAllObjects");
  self->_loadingCanceled = 1;
  MEMORY[0x194033C04](self->_loadingMutex);
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
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "objectForKey:", CFSTR("AVAsynchronousLoadingCompletionHandlerKey"));
        if (v8)
          (*(void (**)(void))(v8 + 16))();
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

uint64_t __66__AVFigAssetInspectorLoader__ensureAllDependenciesOfKeyAreLoaded___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "lock");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 32), "signal");
  return objc_msgSend(*(id *)(a1 + 32), "unlock");
}

- (id)variants
{
  return (id)objc_msgSend(-[AVFigAssetInspectorLoader assetInspector](self, "assetInspector"), "variants");
}

- (id)lyrics
{
  return (id)objc_msgSend(-[AVFigAssetInspectorLoader assetInspector](self, "assetInspector"), "lyrics");
}

- (BOOL)isExportable
{
  char v3;
  char v4;

  v3 = -[AVFigAssetInspectorLoader _isStreaming](self, "_isStreaming");
  v4 = objc_msgSend(-[AVFigAssetInspectorLoader assetInspector](self, "assetInspector"), "isExportable");
  return (-[AVFigAssetInspectorLoader statusOfValueForKey:error:](self, "statusOfValueForKey:error:", CFSTR("exportable"), 0) == 2) & ~v3 & v4;
}

- (BOOL)isReadable
{
  char v3;
  char v4;

  v3 = -[AVFigAssetInspectorLoader _isStreaming](self, "_isStreaming");
  v4 = objc_msgSend(-[AVFigAssetInspectorLoader assetInspector](self, "assetInspector"), "isReadable");
  return (-[AVFigAssetInspectorLoader statusOfValueForKey:error:](self, "statusOfValueForKey:error:", CFSTR("readable"), 0) == 2) & ~v3 & v4;
}

- (BOOL)isCompatibleWithSavedPhotosAlbum
{
  return objc_msgSend(-[AVFigAssetInspectorLoader assetInspector](self, "assetInspector"), "isCompatibleWithSavedPhotosAlbum");
}

- (id)URL
{
  return self->_URL;
}

- (id)resolvedURL
{
  return (id)objc_msgSend(-[AVFigAssetInspectorLoader assetInspector](self, "assetInspector"), "resolvedURL");
}

- (id)originalNetworkContentURL
{
  return (id)objc_msgSend(-[AVFigAssetInspectorLoader assetInspector](self, "assetInspector"), "originalNetworkContentURL");
}

- (unint64_t)downloadToken
{
  return objc_msgSend(-[AVFigAssetInspectorLoader assetInspector](self, "assetInspector"), "downloadToken");
}

- (id)contentKeySpecifiersEligibleForPreloading
{
  return (id)objc_msgSend(-[AVFigAssetInspectorLoader assetInspector](self, "assetInspector"), "contentKeySpecifiersEligibleForPreloading");
}

- (int64_t)firstFragmentSequenceNumber
{
  return objc_msgSend(-[AVFigAssetInspectorLoader assetInspector](self, "assetInspector"), "firstFragmentSequenceNumber");
}

- (int64_t)fragmentCount
{
  return objc_msgSend(-[AVFigAssetInspectorLoader assetInspector](self, "assetInspector"), "fragmentCount");
}

- (double)_fragmentMindingInterval
{
  uint64_t CMBaseObject;
  void (*v3)(uint64_t, _QWORD, _QWORD, const __CFNumber **);
  const __CFNumber *valuePtr;

  -[AVFigAssetInspectorLoader _figAsset](self, "_figAsset");
  valuePtr = 0;
  CMBaseObject = FigAssetGetCMBaseObject();
  v3 = *(void (**)(uint64_t, _QWORD, _QWORD, const __CFNumber **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                           + 48);
  if (v3)
  {
    v3(CMBaseObject, *MEMORY[0x1E0CC3A10], *MEMORY[0x1E0C9AE00], &valuePtr);
    if (valuePtr)
    {
      CFNumberGetValue(valuePtr, kCFNumberSInt64Type, &valuePtr);
      if (valuePtr)
        CFRelease(valuePtr);
    }
  }
  return 0.0;
}

- (void)_setFragmentMindingInterval:(double)a3
{
  CFNumberRef v4;
  uint64_t CMBaseObject;
  void (*v6)(uint64_t, _QWORD, CFNumberRef);
  uint64_t valuePtr;

  -[AVFigAssetInspectorLoader _figAsset](self, "_figAsset");
  valuePtr = (uint64_t)(a3 * 1000.0);
  v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt64Type, &valuePtr);
  CMBaseObject = FigAssetGetCMBaseObject();
  v6 = *(void (**)(uint64_t, _QWORD, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v6)
    v6(CMBaseObject, *MEMORY[0x1E0CC3A10], v4);
  if (v4)
    CFRelease(v4);
}

- (BOOL)isAssociatedWithFragmentMinder
{
  return self->_fragmentMinderAssociationCount > 0;
}

- (void)_setIsAssociatedWithFragmentMinder:(BOOL)a3
{
  int64_t fragmentMinderAssociationCount;
  int64_t v4;

  fragmentMinderAssociationCount = self->_fragmentMinderAssociationCount;
  if (a3)
    v4 = fragmentMinderAssociationCount + 1;
  else
    v4 = fragmentMinderAssociationCount - 1;
  self->_fragmentMinderAssociationCount = v4;
}

@end
