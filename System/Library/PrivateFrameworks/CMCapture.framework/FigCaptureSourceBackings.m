@implementation FigCaptureSourceBackings

- (NSDictionary)hevcSettings
{
  return self->_hevcSettings;
}

- (NSDictionary)h264Settings
{
  return self->_h264Settings;
}

- (FigCaptureSourceCommonSettings)commonSettings
{
  return self->_commonSettings;
}

+ (id)sharedCaptureSourceBackings
{
  uint64_t v2;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  CFPropertyListRef v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  FigCaptureSourceBackings *v13;
  uint64_t v14;
  CFPropertyListRef v15;
  void *v16;
  NSObject *v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  FigCaptureSourceBackings *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  id v37;
  _BYTE *v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  os_log_type_t v44[8];
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  os_log_type_t type[8];
  _BYTE v52[12];
  __int16 v53;
  int v54;
  __CFString *v55;
  id v56[19];

  v56[16] = *(id *)MEMORY[0x1E0C80C00];
  pthread_mutex_lock((pthread_mutex_t *)gCaptureSourceBackingsLock);
  if (gSourceInfoArrayChanged == 1)
  {
    gSourceInfoArrayChanged = 0;
    if (dword_1ECFE9B90)
    {
      LODWORD(v46) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (gCaptureSourceBackings)
      goto LABEL_25;
  }
  else
  {
    v4 = (void *)gCaptureSourceBackings;
    if (gCaptureSourceBackings)
      goto LABEL_50;
  }
  v5 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v6 = (const __CFString *)*MEMORY[0x1E0C9B230];
  v7 = CFPreferencesCopyValue(CFSTR("CaptureSourceInfo"), CFSTR("com.apple.cameracapture.volatile"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v7)
  {
    v8 = (void *)v7;
    if (dword_1ECFE9B90)
    {
      LODWORD(v46) = 0;
      type[0] = OS_LOG_TYPE_DEFAULT;
      v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    gCaptureSourceBackings = (uint64_t)csu_createBackingsFromCaptureSourceInfoDict(v8);

  }
  if (!gCaptureSourceBackings)
  {
    if (dword_1ECFE9B90)
    {
      v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v55 = CFSTR("Default");
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1, v39, v40);
    v56[0] = 0;
    *(_QWORD *)v52 = 0;
    *(_QWORD *)&v46 = 0;
    *(_QWORD *)type = 0;
    v12 = csu_createSourceInfoDictionariesFromAVCaptureSessionPlistForCaptureDeviceIDs(v11, v56, v52, &v46, type);
    if (v12)
    {
      v40 = v2;
      LODWORD(v39) = v12;
      FigDebugAssert3();
      v14 = 0;
    }
    else
    {
      v13 = [FigCaptureSourceBackings alloc];
      v14 = -[FigCaptureSourceBackings initWithSourceInfoDictionaries:commonSettings:hevcSettings:h264Settings:](v13, "initWithSourceInfoDictionaries:commonSettings:hevcSettings:h264Settings:", v56[0], *(_QWORD *)v52, (_QWORD)v46, *(_QWORD *)type);
    }

    gCaptureSourceBackings = v14;
    v15 = CFPreferencesCopyValue(CFSTR("CaptureSourceInfo"), CFSTR("com.apple.cameracapture.volatile"), v5, v6);
    if (v15)
    {
      v16 = (void *)v15;

      gCaptureSourceBackings = (uint64_t)csu_createBackingsFromCaptureSourceInfoDict(v16);
    }
  }
  if (dword_1ECFE9B90)
  {
    LODWORD(v46) = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v18 = v46;
    if (os_log_type_enabled(v17, type[0]))
      v19 = v18;
    else
      v19 = v18 & 0xFFFFFFFE;
    if (v19)
    {
      v20 = objc_msgSend((id)objc_msgSend((id)gCaptureSourceBackings, "sourceInfoDictionaries"), "count");
      *(_DWORD *)v52 = 136315394;
      *(_QWORD *)&v52[4] = "cs_getBackingsForBuiltInCameras";
      v53 = 1024;
      v54 = v20;
      LODWORD(v40) = 18;
      v39 = v52;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
LABEL_25:
  v50 = 0;
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = (void *)objc_msgSend(+[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), "deviceIDs");
  v23 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v22);
  objc_msgSend(v23, "removeObject:", 0x1E492D2B8);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v24 = (void *)objc_msgSend((id)gCaptureSourceBackings, "sourceInfoDictionaries");
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
  v42 = v21;
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v47;
    v41 = v24;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v47 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("MediaType"), v39, v40), "isEqualToString:", CFSTR("vide")))
        {
          v30 = objc_msgSend((id)objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("Attributes")), "objectForKeyedSubscript:", CFSTR("CaptureDeviceID"));
          objc_msgSend(v23, "removeObject:", v30);
          if ((objc_msgSend(v22, "containsObject:", v30) & 1) == 0)
          {
            if (dword_1ECFE9B90)
            {
              LODWORD(v45) = 0;
              v44[0] = OS_LOG_TYPE_DEFAULT;
              v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
              os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
              fig_log_call_emit_and_clean_up_after_send_and_compose();
              v24 = v41;
              v21 = v42;
            }
            objc_msgSend(v21, "addObject:", v29, v39);
          }
        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    }
    while (v26);
  }
  *(_QWORD *)v44 = 0;
  v45 = 0;
  v43 = 0;
  if (csu_createSourceInfoDictionariesFromAVCaptureSessionPlistForCaptureDeviceIDs(v23, &v50, &v45, v44, &v43))
  {
    v32 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v21 = v42;
  }
  if (objc_msgSend(v50, "count", v39, v40))
  {
    if (gCaptureSourceBackings)
    {
      objc_msgSend((id)gCaptureSourceBackings, "addSourceInfoDictionaries:", v50);
    }
    else
    {
      v33 = [FigCaptureSourceBackings alloc];
      gCaptureSourceBackings = -[FigCaptureSourceBackings initWithSourceInfoDictionaries:commonSettings:hevcSettings:h264Settings:](v33, "initWithSourceInfoDictionaries:commonSettings:hevcSettings:h264Settings:", v50, v45, *(_QWORD *)v44, v43);
    }
  }
  if (objc_msgSend(v21, "count"))
    objc_msgSend((id)gCaptureSourceBackings, "removeSourceInfoDictionaries:", v21);
  if (dword_1ECFE9B90)
  {
    v34 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v21 = v42;
    if (dword_1ECFE9B90)
    {
      v35 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v21 = v42;
      if (dword_1ECFE9B90)
      {
        v36 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v21 = v42;
      }
    }
  }

  v4 = (void *)gCaptureSourceBackings;
LABEL_50:
  v37 = v4;
  pthread_mutex_unlock((pthread_mutex_t *)gCaptureSourceBackingsLock);
  return v37;
}

- (NSArray)sourceInfoDictionaries
{
  return &self->_sourceInfoDictionaries->super;
}

+ (void)initialize
{
  uint64_t v2;
  const __CFString *v3;
  const __CFString *v4;
  uint64_t v5;

  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
    gCaptureSourceBackingsLock = FigSimpleMutexCreate();
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserverForName:object:queue:usingBlock:", 0x1E4945038, +[BWFigCaptureDeviceVendor sharedCaptureDeviceVendor](BWFigCaptureDeviceVendor, "sharedCaptureDeviceVendor"), 0, &__block_literal_global_51);
    v2 = +[BWFigCaptureDeviceVendor videoCaptureDeviceFirmwareIsLoaded](BWFigCaptureDeviceVendor, "videoCaptureDeviceFirmwareIsLoaded");
    if ((v2 & 1) == 0)
    {
      v3 = (const __CFString *)*MEMORY[0x1E0C9B260];
      v4 = (const __CFString *)*MEMORY[0x1E0C9B230];
      CFPreferencesSetValue(CFSTR("CaptureSourceInfo"), 0, CFSTR("com.apple.cameracapture.volatile"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
      v2 = CFPreferencesSynchronize(CFSTR("com.apple.cameracapture.volatile"), v3, v4);
    }
    FigCaptureDeviceGetNotificationCenter(v2);
    v5 = FigNotificationCenterAddWeakListener();
    if ((_DWORD)v5)
      v5 = FigDebugAssert3();
    FigCaptureDeviceGetNotificationCenter(v5);
    if (FigNotificationCenterAddWeakListener())
      FigDebugAssert3();
  }
}

- (FigCaptureSourceBackings)initWithSourceInfoDictionaries:(id)a3 commonSettings:(id)a4 hevcSettings:(id)a5 h264Settings:(id)a6
{
  FigCaptureSourceBackings *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FigCaptureSourceBackings;
  v10 = -[FigCaptureSourceBackings init](&v12, sel_init);
  if (v10)
  {
    v10->_sourceInfoDictionaries = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[FigCaptureSourceBackings addSourceInfoDictionaries:](v10, "addSourceInfoDictionaries:", a3);
    v10->_commonSettings = (FigCaptureSourceCommonSettings *)-[FigCaptureSourceCommonSettings initWithCommonSettingsDictionary:]([FigCaptureSourceCommonSettings alloc], a4);
    v10->_hevcSettings = (NSDictionary *)a5;
    v10->_h264Settings = (NSDictionary *)a6;
  }
  return v10;
}

- (void)addSourceInfoDictionaries:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  FigSimpleMutexCheckIsLockedOnThisThread();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        FigSimpleMutexCheckIsLockedOnThisThread();
        if (objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MediaType")), "isEqualToString:", CFSTR("soun")))
        {
          if (self->_hasMicSource)
            continue;
          self->_hasMicSource = 1;
        }
        -[NSMutableArray addObject:](self->_sourceInfoDictionaries, "addObject:", v9);
      }
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
}

uint64_t __38__FigCaptureSourceBackings_initialize__block_invoke(uint64_t a1, void *a2)
{
  if ((objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", 0x1E4945038) & 1) != 0)
    return csu_postSourceInfoArrayChangedNotificationIfNecessary(0);
  else
    return FigDebugAssert3();
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSourceBackings;
  -[FigCaptureSourceBackings dealloc](&v3, sel_dealloc);
}

- (void)removeSourceInfoDictionaries:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  FigSimpleMutexCheckIsLockedOnThisThread();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(a3);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        FigSimpleMutexCheckIsLockedOnThisThread();
        if (objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MediaType")), "isEqualToString:", CFSTR("soun")))self->_hasMicSource = 0;
        -[NSMutableArray removeObject:](self->_sourceInfoDictionaries, "removeObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
}

- (uint64_t)updateSourceInfoDictionariesWithEntriesByDeviceIDs:(uint64_t)result
{
  _QWORD *v2;
  uint64_t i;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  uint64_t v10;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id obj;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v2 = (_QWORD *)result;
    FigSimpleMutexCheckIsLockedOnThisThread();
    v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v14 = v2;
    obj = (id)v2[1];
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v20)
    {
      v18 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(obj);
          v4 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Attributes")), "objectForKeyedSubscript:", CFSTR("CaptureDeviceID"));
          v5 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:");
          if (objc_msgSend(v5, "count"))
          {
            v21 = v4;
            v22 = i;
            v6 = (void *)objc_msgSend(v4, "mutableCopy");
            v24 = 0u;
            v25 = 0u;
            v26 = 0u;
            v27 = 0u;
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v7)
            {
              v8 = v7;
              v23 = *(_QWORD *)v25;
              do
              {
                for (j = 0; j != v8; ++j)
                {
                  if (*(_QWORD *)v25 != v23)
                    objc_enumerationMutation(v5);
                  v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
                  if (dword_1ECFE9B90)
                  {
                    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
                    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
                    fig_log_call_emit_and_clean_up_after_send_and_compose();
                  }
                  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(v5, "objectForKeyedSubscript:", v10, v12, v13), v10);
                }
                v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
              }
              while (v8);
            }
            objc_msgSend(v17, "addObject:", v21);
            objc_msgSend(v16, "addObject:", v6);

            i = v22;
          }
        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v20);
    }
    objc_msgSend(v14, "removeSourceInfoDictionaries:", v17);
    return objc_msgSend(v14, "addSourceInfoDictionaries:", v16);
  }
  return result;
}

- (NSDictionary)continuityCaptureCameraCapabilities
{
  return self->_continuityCaptureCameraCapabilities;
}

@end
