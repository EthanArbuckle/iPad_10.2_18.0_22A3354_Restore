@implementation BWDeferredContainerManagerBase

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (BWDeferredContainerManagerBase)initWithQueuePriority:(unsigned int)a3
{
  BWDeferredContainerManagerBase *v3;
  BWDeferredContainerManagerBase *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWDeferredContainerManagerBase;
  v3 = -[BWDeferredContainerManagerBase init](&v6, sel_init);
  v4 = v3;
  if (v3)
  {
    pthread_rwlock_init(&v3->_lock, 0);
    v4->_timerQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
  }
  return v4;
}

- (void)dealloc
{
  __assert_rtn("-[BWDeferredContainerManagerBase dealloc]", "BWDeferredContainerManager.m", 226, "0");
}

- (void)_containerURLForApplicationID:(uint64_t)a3 captureRequestIdentifier:(int)a4 processingContainer:(char *)a5 exists:(_BYTE *)a6 isDirectory:(_QWORD *)a7 resolvedApplicationID:
{
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  char *v23;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD *v26;
  void *v27;
  char v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  char v34;
  const __CFString *v35;
  void *v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v11 = a2;
  v35 = CFSTR("/var/mobile/Media/Deferred/CaptureContainers");
  v36 = a2;
  v37 = a3;
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 3));
  v13 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v34 = 0;
  if ((objc_msgSend(v13, "fileExistsAtPath:isDirectory:", objc_msgSend(v12, "path"), &v34) & 1) != 0)
  {
    v14 = 1;
LABEL_22:
    v23 = a5;
    v22 = (void *)objc_msgSend(v11, "copy");
    goto LABEL_23;
  }
  v27 = v11;
  v28 = a4;
  if ((objc_msgSend(v11, "isEqualToString:", 0x1E493D4D8) & 1) != 0)
  {
    if (!a4)
      goto LABEL_18;
  }
  else if (!objc_msgSend(v11, "isEqualToString:", 0x1E493D478) || (a4 & 1) == 0)
  {
    goto LABEL_18;
  }
  v15 = (void *)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/var/mobile/Media/Deferred/CaptureContainers"));
  v17 = (void *)objc_msgSend(v15, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v16, MEMORY[0x1E0C9AA60], 5, 0);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v31;
    v26 = a7;
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v17);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "lastPathComponent");
        if ((objc_msgSend(v11, "isEqualToString:", 0x1E493D4D8) & 1) == 0)
        {
          v35 = CFSTR("/var/mobile/Media/Deferred/CaptureContainers");
          v36 = v11;
          v37 = a3;
          v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 3));
          if ((objc_msgSend(v13, "fileExistsAtPath:isDirectory:", objc_msgSend(v12, "path"), &v34) & 1) != 0)
          {
            v14 = 1;
            a7 = v26;
            goto LABEL_22;
          }
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      a7 = v26;
      if (v19)
        continue;
      break;
    }
  }
LABEL_18:
  if ((v28 & 1) == 0)
  {
    v11 = v27;
    v35 = CFSTR("/var/mobile/Media/Deferred/CaptureContainers");
    v36 = v27;
    v37 = a3;
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 3));
    v14 = 0;
    goto LABEL_22;
  }
  v14 = 0;
  v22 = 0;
  v23 = a5;
LABEL_23:
  if (dword_1ECFE99D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v23)
    *v23 = v14;
  if (a6)
    *a6 = v34;
  if (a7)
    *a7 = v22;

  return v12;
}

- (uint64_t)_insertUniqueManifestIntoTimeSortedArray:(void *)a3 manifestArray:
{
  unint64_t v5;

  if (result)
  {
    if (a2
      && a3
      && ((v5 = objc_msgSend(a3, "indexOfObject:inSortedRange:options:usingComparator:", a2, 0, objc_msgSend(a3, "count"), 1280, &__block_literal_global_47), v5 >= objc_msgSend(a3, "count"))|| !objc_msgSend(+[BWDeferredCaptureContainer captureRequestIdentifierForManifest:](BWDeferredCaptureContainer, "captureRequestIdentifierForManifest:", a2), "isEqualToString:", +[BWDeferredCaptureContainer captureRequestIdentifierForManifest:](BWDeferredCaptureContainer, "captureRequestIdentifierForManifest:", objc_msgSend(a3, "objectAtIndexedSubscript:", v5)))))
    {
      objc_msgSend(a3, "insertObject:atIndex:", a2, v5);
      return 1;
    }
    else
    {
      FigDebugAssert3();
      return 0;
    }
  }
  return result;
}

uint64_t __89__BWDeferredContainerManagerBase__insertUniqueManifestIntoTimeSortedArray_manifestArray___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;
  id v5;
  BOOL v6;
  uint64_t v7;

  v4 = +[BWDeferredCaptureContainer timeForManifest:index:](BWDeferredCaptureContainer, "timeForManifest:index:", a2, 0);
  v5 = +[BWDeferredCaptureContainer timeForManifest:index:](BWDeferredCaptureContainer, "timeForManifest:index:", a3, 0);
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (!v6)
    return objc_msgSend(v4, "compare:", v5);
  if (v5)
    v7 = -1;
  else
    v7 = 0;
  if (v4)
    return 1;
  else
    return v7;
}

- (id)manifestsForApplicationID:(id)a3 err:(int *)a4
{
  if (a4)
    *a4 = -16134;
  return 0;
}

- (id)manifestForApplicationID:(id)a3 captureRequestIdentifier:(id)a4 err:(int *)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  int v10;
  uint64_t v12;
  id v13;
  _QWORD v14[2];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v13 = 0;
  if (!a3)
  {
    FigDebugAssert3();
    v6 = 0;
    goto LABEL_5;
  }
  v6 = a4;
  if (!a4)
  {
    FigDebugAssert3();
    goto LABEL_5;
  }
  v12 = 0;
  -[BWDeferredContainerManagerBase _containerURLForApplicationID:captureRequestIdentifier:processingContainer:exists:isDirectory:resolvedApplicationID:]((uint64_t)self, a3, (uint64_t)a4, 1, 0, 0, &v12);
  v7 = (void *)MEMORY[0x1E0C99E98];
  v15[0] = CFSTR("/var/mobile/Media/Deferred/CaptureContainers");
  v15[1] = v12;
  v15[2] = v6;
  v14[0] = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3)), "path");
  v14[1] = CFSTR("manifest.plist");
  v8 = objc_msgSend(v7, "fileURLWithPathComponents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2));
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:error:", v8, &v13);
  if (objc_msgSend(v6, "count"))
  {
    v9 = v6;
LABEL_5:
    v10 = 0;
    goto LABEL_10;
  }
  if (v13)
    v10 = objc_msgSend(v13, "code");
  else
    v10 = -16824;

LABEL_10:
  *a5 = v10;
  return v6;
}

- (int)deleteContainerForApplicationID:(id)a3 captureRequestIdentifier:(id)a4
{
  void *v4;
  void *v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int result;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  id v12[17];

  v12[16] = *(id *)MEMORY[0x1E0C80C00];
  if (!a3 || !a4)
  {
    FigDebugAssert3();
    return 0;
  }
  v11 = 0;
  v10 = 0;
  v4 = -[BWDeferredContainerManagerBase _containerURLForApplicationID:captureRequestIdentifier:processingContainer:exists:isDirectory:resolvedApplicationID:]((uint64_t)self, a3, (uint64_t)a4, 1, &v10, 0, &v11);
  if (!v10)
    return 0;
  v5 = v4;
  if (dword_1ECFE99D0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v12[0] = 0;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", v8, v9), "removeItemAtPath:error:", objc_msgSend(v5, "path"), v12);
  result = (int)v12[0];
  if (v12[0])
    return objc_msgSend(v12[0], "code");
  return result;
}

@end
