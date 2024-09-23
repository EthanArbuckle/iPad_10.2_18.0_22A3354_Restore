@implementation AVCaptureFigAudioDevice

- (BOOL)hasMediaType:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CF2B68]);
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (BOOL)isSoonToBeDisconnected
{
  return self->_isSoonToBeDisconnected;
}

- (int64_t)fallbackAudioCaptureModeIfApplicableForCurrentRoute:(int64_t)a3
{
  int64_t v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v3 = a3;
  if ((a3 | 4) == 6 && !-[AVCaptureFigAudioDevice isAudioInputRouteBuiltInMic](self, "isAudioInputRouteBuiltInMic"))
  {
    if (dword_1ECFED680)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return 0;
  }
  return v3;
}

- (OpaqueFigCaptureSource)figCaptureSource
{
  return self->_fcs;
}

- (id)clientAudioClockDeviceUID
{
  return (id)-[NSString copy](self->_clientAudioClockDeviceUID, "copy");
}

- (id)deviceType
{
  return CFSTR("AVCaptureDeviceTypeMicrophone");
}

- (OpaqueCMClock)deviceClock
{
  OpaqueCMClock **p_sharedAVAudioSessionClock;
  OpaqueCMClock *v4;
  CFTypeRef v5;

  if (AVCaptureAudiomxdSupportEnabled())
  {
    p_sharedAVAudioSessionClock = &self->_sharedAVAudioSessionClock;
    v4 = *p_sharedAVAudioSessionClock;
    if (*p_sharedAVAudioSessionClock
      || (objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance"),
          FigAudioSessionClockCreateForAVAudioSession(),
          (v4 = *p_sharedAVAudioSessionClock) != 0))
    {
      v5 = CFRetain(v4);
      return (OpaqueCMClock *)CFAutorelease(v5);
    }
  }
  else
  {
    v5 = -[AVCaptureFigAudioDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04C40]);
    if (v5)
      return (OpaqueCMClock *)CFAutorelease(v5);
  }
  return 0;
}

- (BOOL)supportsAVCaptureSessionPreset:(id)a3
{
  return 1;
}

+ (id)_devices
{
  return (id)objc_msgSend(a1, "_devicesWithPriorRegisteredDevices:", 0);
}

+ (id)_devicesWithPriorRegisteredDevices:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, id *);
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  id obj;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v22 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = +[AVCaptureFigAudioDevice _newFigCaptureSources](AVCaptureFigAudioDevice, "_newFigCaptureSources");
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v29;
    v19 = *MEMORY[0x1E0D04BB0];
    v18 = *MEMORY[0x1E0C9AE00];
    v21 = *MEMORY[0x1E0D04910];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v29 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (objc_msgSend(a3, "count"))
        {
          v27 = 0;
          v9 = *(void (**)(uint64_t, uint64_t, uint64_t, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
          if (v9)
            v9(v8, v19, v18, &v27);
          v10 = (id)objc_msgSend(v27, "objectForKeyedSubscript:", v21);

          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v24;
LABEL_11:
            v14 = 0;
            while (1)
            {
              if (*(_QWORD *)v24 != v13)
                objc_enumerationMutation(a3);
              v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v14);
              if ((objc_msgSend((id)objc_msgSend(v15, "uniqueID"), "isEqualToString:", v10) & 1) != 0)
                break;
              if (v12 == ++v14)
              {
                v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
                if (v12)
                  goto LABEL_11;
                goto LABEL_17;
              }
            }
            v16 = v15;

            if (v16)
              goto LABEL_20;
          }
          else
          {
LABEL_17:

          }
        }
        v16 = -[AVCaptureFigAudioDevice _initWithFigCaptureSource:]([AVCaptureFigAudioDevice alloc], "_initWithFigCaptureSource:", v8);
LABEL_20:
        objc_msgSend(v22, "addObject:", v16);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v5);
  }
  return v22;
}

+ (id)_newFigCaptureSources
{
  if ((AVCaptureIsRunningInMediaserverd() & 1) != 0)
    return (id)FigCaptureSourceCopySources();
  else
    return (id)FigCaptureSourceRemoteCopyCaptureSources();
}

void __53__AVCaptureFigAudioDevice__initWithFigCaptureSource___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = (id)objc_msgSend(v2, "attributeForKey:", *MEMORY[0x1E0D47E70]);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 96));
}

- (id)_initWithFigCaptureSource:(OpaqueFigCaptureSource *)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[5];
  _QWORD block[5];
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)AVCaptureFigAudioDevice;
  v4 = -[AVCaptureDevice initSubclass](&v20, sel_initSubclass);
  if (v4)
  {
    *((_QWORD *)v4 + 18) = objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", v4);
    *((_QWORD *)v4 + 6) = dispatch_queue_create("com.apple.avfoundation.audiocapturedevice.source_queue", 0);
    *((_QWORD *)v4 + 19) = dispatch_semaphore_create(0);
    objc_msgSend(v4, "_setFigCaptureSource:", a3);
    *((_QWORD *)v4 + 8) = objc_msgSend(v4, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04BB0]);
    *((_BYTE *)v4 + 72) = 0;
    v5 = (void *)objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
    *((_BYTE *)v4 + 73) = objc_msgSend((id)objc_msgSend(v5, "attributeForKey:", *MEMORY[0x1E0D482A0]), "BOOLValue");
    *((_BYTE *)v4 + 74) = 0;
    *((_QWORD *)v4 + 10) = dispatch_queue_create("com.apple.avfoundation.audiocapturedevice.localized_name_first_query_queue", 0);
    *((_DWORD *)v4 + 22) = 0;
    v6 = dispatch_group_create();
    *((_QWORD *)v4 + 12) = v6;
    dispatch_group_enter(v6);
    v7 = *((_QWORD *)v4 + 10);
    v8 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__AVCaptureFigAudioDevice__initWithFigCaptureSource___block_invoke;
    block[3] = &unk_1E42165A8;
    block[4] = v4;
    dispatch_async(v7, block);
    *((_QWORD *)v4 + 14) = dispatch_queue_create("com.apple.avfoundation.audiocapturedevice.audio_routes_info_update_queue", 0);
    *((_DWORD *)v4 + 30) = 0;
    v9 = dispatch_group_create();
    *((_QWORD *)v4 + 16) = v9;
    dispatch_group_enter(v9);
    v10 = *((_QWORD *)v4 + 14);
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __53__AVCaptureFigAudioDevice__initWithFigCaptureSource___block_invoke_2;
    v18[3] = &unk_1E42165A8;
    v18[4] = v4;
    dispatch_async(v10, v18);
    v11 = (void *)objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
    v12 = (_QWORD *)MEMORY[0x1E0D482A8];
    v13 = (_QWORD *)MEMORY[0x1E0D47E78];
    v14 = *MEMORY[0x1E0D47E78];
    v21[0] = *MEMORY[0x1E0D482A8];
    v21[1] = v14;
    v15 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    objc_msgSend(v11, "setAttribute:forKey:error:", v15, *MEMORY[0x1E0D48280], 0);
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v16, "addObserver:selector:name:object:", v4, sel_audioInputDevicesDidChangeHandler_, *v12, v11);
    objc_msgSend(v16, "addObserver:selector:name:object:", v4, sel_audioInputDeviceLocalizedNameDidChangeHandler_, *v13, v11);
  }
  return v4;
}

- (void)_setFigCaptureSource:(OpaqueFigCaptureSource *)a3
{
  NSObject *fcsQueue;
  _QWORD v4[6];

  fcsQueue = self->_fcsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__AVCaptureFigAudioDevice__setFigCaptureSource___block_invoke;
  v4[3] = &unk_1E4216650;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(fcsQueue, v4);
}

- (id)_copyFigCaptureSourceProperty:(__CFString *)a3
{
  NSObject *fcsQueue;
  void *v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__9;
  v11 = __Block_byref_object_dispose__9;
  v12 = 0;
  fcsQueue = self->_fcsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__AVCaptureFigAudioDevice__copyFigCaptureSourceProperty___block_invoke;
  block[3] = &unk_1E4217A38;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(fcsQueue, block);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)isAudioCaptureModeSupported:(int64_t)a3
{
  BOOL result;
  NSDictionary *attributes;
  _QWORD *v5;

  switch(a3)
  {
    case 0:
    case 3:
    case 4:
    case 5:
    case 6:
      result = 1;
      break;
    case 1:
      attributes = self->_attributes;
      v5 = (_QWORD *)MEMORY[0x1E0D047A0];
      goto LABEL_7;
    case 2:
      attributes = self->_attributes;
      v5 = (_QWORD *)MEMORY[0x1E0D047B0];
LABEL_7:
      result = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](attributes, "objectForKeyedSubscript:", *v5), "BOOLValue");
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

void __53__AVCaptureFigAudioDevice__initWithFigCaptureSource___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = objc_msgSend(objc_alloc(MEMORY[0x1E0C89AE8]), "initAuxiliarySession");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "setCategory:error:", *MEMORY[0x1E0C89688], 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 136) = objc_msgSend(*(id *)(a1 + 32), "currentAudioInputRouteIsBuiltInMic:", 0);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 128));
}

- (BOOL)currentAudioInputRouteIsBuiltInMic:(id)a3
{
  id v3;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  if (a3 || (v3 = -[AVCaptureFigAudioDevice localizedName](self, "localizedName")) != 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = -[AVAudioSession availableInputs](self->_auxiliarySession, "availableInputs", 0);
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v10, "portName"), "isEqualToString:", v3))
          {
            v12 = (void *)objc_msgSend(v10, "portType");
            return objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C897F8]);
          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }
  }
  return 1;
}

- (id)localizedName
{
  os_unfair_lock_s *p_localizedNameLock;
  NSString *v4;

  dispatch_group_wait((dispatch_group_t)self->_localizedNameFirstQueryGroup, 0xFFFFFFFFFFFFFFFFLL);
  p_localizedNameLock = &self->_localizedNameLock;
  os_unfair_lock_lock(&self->_localizedNameLock);
  v4 = self->_localizedName;
  os_unfair_lock_unlock(p_localizedNameLock);
  return v4;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (id)uniqueID
{
  return -[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04910]);
}

uint64_t __57__AVCaptureFigAudioDevice__copyFigCaptureSourceProperty___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t (*v5)(uint64_t, uint64_t, _QWORD, uint64_t);

  v1 = *(_QWORD *)(a1[4] + 56);
  v2 = a1[6];
  v3 = *(_QWORD *)(a1[5] + 8);
  result = CMBaseObjectGetVTable();
  v5 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 48);
  if (v5)
    return v5(v1, v2, *MEMORY[0x1E0C9AE00], v3 + 40);
  return result;
}

_QWORD *__48__AVCaptureFigAudioDevice__setFigCaptureSource___block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  unsigned int (*v5)(uint64_t, _QWORD, _QWORD, id *);
  int v7;
  int v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  const void *v11;
  id v12;

  v1 = result[5];
  v2 = *(_QWORD *)(result[4] + 56);
  if (v1 != v2)
  {
    v3 = result;
    if (v2)
    {
      if (v1 && (AVCaptureIsRunningInMediaserverd() & 1) == 0)
      {
        v12 = 0;
        v4 = *(_QWORD *)(v3[4] + 56);
        v5 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 48);
        if (v5)
        {
          if (!v5(v4, *MEMORY[0x1E0D04E40], *MEMORY[0x1E0C9AE00], &v12) && v12 != 0)
          {
            v7 = objc_msgSend(v12, "intValue");
            if (v7 >= 1)
            {
              v8 = v7;
              do
              {
                v9 = v3[5];
                v10 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
                if (v10)
                  v10(v9);
                --v8;
              }
              while (v8);
            }
          }
        }

      }
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", *(_QWORD *)(v3[4] + 144), fad_figCaptureSourceNotificationHandler, 0, *(_QWORD *)(v3[4] + 56));
      v11 = *(const void **)(v3[4] + 56);
      if (v11)
      {
        CFRelease(v11);
        *(_QWORD *)(v3[4] + 56) = 0;
      }
    }
    result = (_QWORD *)v3[5];
    if (result)
    {
      *(_QWORD *)(v3[4] + 56) = CFRetain(result);
      return (_QWORD *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "addListenerWithWeakReference:callback:name:object:flags:", *(_QWORD *)(v3[4] + 144), fad_figCaptureSourceNotificationHandler, 0, v3[5], 0);
    }
  }
  return result;
}

+ (void)_reconnectDevices:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t, id *);
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if ((AVCaptureIsRunningInMediaserverd() & 1) != 0)
    v4 = (void *)FigCaptureSourceCopySources();
  else
    v4 = (void *)FigCaptureSourceRemoteCopyCaptureSources();
  v5 = v4;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v6)
  {
    v7 = v6;
    v21 = *(_QWORD *)v28;
    v20 = *MEMORY[0x1E0D04BB0];
    v19 = *MEMORY[0x1E0C9AE00];
    v8 = *MEMORY[0x1E0D04910];
    obj = v5;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        v26 = 0;
        v11 = *(void (**)(uint64_t, uint64_t, uint64_t, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
        if (v11)
          v11(v10, v20, v19, &v26);
        v12 = (id)objc_msgSend(v26, "objectForKeyedSubscript:", v8, obj);

        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v23;
          while (2)
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v23 != v15)
                objc_enumerationMutation(a3);
              if (v12)
              {
                v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
                if (objc_msgSend((id)objc_msgSend(v17, "uniqueID"), "isEqualToString:", v12))
                {
                  objc_msgSend(v17, "_reconnectToFigCaptureSource:", v10);
                  goto LABEL_22;
                }
              }
            }
            v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
            if (v14)
              continue;
            break;
          }
        }
LABEL_22:

      }
      v5 = obj;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v7);
  }

}

- (AVCaptureFigAudioDevice)init
{
  AVCaptureFigAudioDevice *v2;
  AVCaptureFigAudioDevice *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCaptureFigAudioDevice;
  v2 = -[AVCaptureDevice init](&v5, sel_init);
  if (v2)
  {
    v3 = v2;
    NSLog(CFSTR("-[AVCaptureDevice init] - Cannot directly instantiate a AVCaptureDevice object."));

  }
  return 0;
}

- (void)dealloc
{
  OpaqueCMClock *sharedAVAudioSessionClock;
  objc_super v4;

  -[AVCaptureFigAudioDevice _setFigCaptureSource:](self, "_setFigCaptureSource:", 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);

  dispatch_release((dispatch_object_t)self->_localizedNameFirstQueryGroup);
  dispatch_release((dispatch_object_t)self->_audioRoutesInfoFirstQueryGroup);
  sharedAVAudioSessionClock = self->_sharedAVAudioSessionClock;
  if (sharedAVAudioSessionClock)
    CFRelease(sharedAVAudioSessionClock);
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureFigAudioDevice;
  -[AVCaptureDevice dealloc](&v4, sel_dealloc);
}

- (id)modelID
{
  return -[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04890]);
}

- (id)figCaptureSourceAudioSettingsForSessionPreset:(id)a3
{
  return (id)objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04780]), "objectForKeyedSubscript:", a3);
}

- (BOOL)isBuiltInStereoAudioCaptureSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D047A0]), "BOOLValue");
}

- (BOOL)isWindNoiseRemovalSupported
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_attributes, "objectForKeyedSubscript:", *MEMORY[0x1E0D04958]), "BOOLValue");
}

- (BOOL)shouldAudioCaptureModeTriggerGraphRebuildOnAudioRouteChange:(int64_t)a3
{
  return ((a3 - 2) & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (BOOL)isAudioInputRouteBuiltInMic
{
  AVCaptureFigAudioDevice *v2;
  os_unfair_lock_s *p_audioRoutesInfoLock;

  v2 = self;
  dispatch_group_wait((dispatch_group_t)self->_audioRoutesInfoFirstQueryGroup, 0xFFFFFFFFFFFFFFFFLL);
  p_audioRoutesInfoLock = &v2->_audioRoutesInfoLock;
  os_unfair_lock_lock(&v2->_audioRoutesInfoLock);
  LOBYTE(v2) = v2->_audioInputRouteIsBuiltInMic;
  os_unfair_lock_unlock(p_audioRoutesInfoLock);
  return (char)v2;
}

- (BOOL)startUsingDevice:(id *)a3
{
  return 1;
}

- (void)setClientAudioClockDeviceUID:(id)a3
{

  self->_clientAudioClockDeviceUID = (NSString *)a3;
}

- (void)audioInputDevicesDidChangeHandler:(id)a3
{
  void *v4;
  int v5;
  const __CFString *v6;

  -[AVCaptureFigAudioDevice willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("connected"));
  v4 = (void *)objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v5 = objc_msgSend((id)objc_msgSend(v4, "attributeForKey:", *MEMORY[0x1E0D482A0]), "BOOLValue");
  self->_isConnected = v5;
  if (v5)
  {
    v6 = CFSTR("AVCaptureDeviceWasConnectedNotification");
    self->_isSoonToBeDisconnected = 0;
  }
  else
  {
    v6 = CFSTR("AVCaptureDeviceWasDisconnectedNotification");
  }
  -[AVCaptureFigAudioDevice didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("connected"));
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", v6, self);
}

- (void)audioInputDeviceLocalizedNameDidChangeHandler:(id)a3
{
  NSObject *audioRoutesInfoUpdateQueue;
  _QWORD block[5];

  audioRoutesInfoUpdateQueue = self->_audioRoutesInfoUpdateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__AVCaptureFigAudioDevice_audioInputDeviceLocalizedNameDidChangeHandler___block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = self;
  dispatch_async(audioRoutesInfoUpdateQueue, block);
}

void __73__AVCaptureFigAudioDevice_audioInputDeviceLocalizedNameDidChangeHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  _QWORD block[6];
  char v6;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v3 = objc_msgSend(v2, "attributeForKey:", *MEMORY[0x1E0D47E70]);
  v4 = objc_msgSend(*(id *)(a1 + 32), "currentAudioInputRouteIsBuiltInMic:", v3);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__AVCaptureFigAudioDevice_audioInputDeviceLocalizedNameDidChangeHandler___block_invoke_2;
  block[3] = &unk_1E421D198;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = v3;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

unsigned __int8 *__73__AVCaptureFigAudioDevice_audioInputDeviceLocalizedNameDidChangeHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  unsigned __int8 *result;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "isEqualToString:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("localizedName"));
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 88));
    v2 = *(id *)(a1 + 40);

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = *(_QWORD *)(a1 + 40);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 88));
    objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("localizedName"));
  }
  result = *(unsigned __int8 **)(a1 + 32);
  if (result[136] != *(unsigned __int8 *)(a1 + 48))
  {
    objc_msgSend(result, "willChangeValueForKey:", CFSTR("audioInputRouteIsBuiltInMic"));
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 120));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 136) = *(_BYTE *)(a1 + 48);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 120));
    return (unsigned __int8 *)objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("audioInputRouteIsBuiltInMic"));
  }
  return result;
}

- (void)_reconnectToFigCaptureSource:(OpaqueFigCaptureSource *)a3
{
  id v5;
  const void *v6;

  v5 = -[AVCaptureFigAudioDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04E48]);
  v6 = v5;
  if (v5 == (id)*MEMORY[0x1E0C9AE50])
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_serverConnectionDiedSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v5)
LABEL_3:
    CFRelease(v6);
LABEL_4:
  -[AVCaptureFigAudioDevice _setFigCaptureSource:](self, "_setFigCaptureSource:", a3);
}

- (void)_handleNotification:(__CFString *)a3 payload:(id)a4
{
  id v5;
  const void *v6;

  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0D04B08]))
  {
    v5 = -[AVCaptureFigAudioDevice _copyFigCaptureSourceProperty:](self, "_copyFigCaptureSourceProperty:", *MEMORY[0x1E0D04E48]);
    if (v5 != (id)*MEMORY[0x1E0C9AE40])
    {
      v6 = v5;
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_serverConnectionDiedSemaphore);
      if (v6)
        CFRelease(v6);
    }
  }
}

@end
