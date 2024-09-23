@implementation BWFigCaptureStream

- (int)setPropertyIfSupported:(__CFString *)a3 value:(id)a4
{
  return -[BWFigCaptureStream _setProperty:value:requireSupported:lockHeldByCaller:]((uint64_t)self, a3, a4, 0, 0);
}

- (NSString)portType
{
  return self->_portType;
}

- (int)registerForNotification:(__CFString *)a3 listener:(const void *)a4 callback:(void *)a5
{
  FigCaptureDeviceGetNotificationCenter(self);
  return FigNotificationCenterAddWeakListener();
}

- (id)getProperty:(__CFString *)a3 error:(int *)a4
{
  return (id)-[BWFigCaptureStream _copyProperty:requireSupported:error:]((uint64_t)self, a3, 1, a4);
}

- (id)getPropertyIfSupported:(__CFString *)a3 error:(int *)a4
{
  return (id)-[BWFigCaptureStream _copyProperty:requireSupported:error:]((uint64_t)self, a3, 0, a4);
}

- (uint64_t)_copyProperty:(int)a3 requireSupported:(int *)a4 error:
{
  uint64_t v7;
  int v8;
  _DWORD *v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  void *v13;
  uint64_t FigBaseObject;
  uint64_t (*v15)(uint64_t, CFTypeRef, _QWORD, _QWORD *);
  int v16;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD v18[23];

  v18[22] = *MEMORY[0x1E0C80C00];
  if (!result)
    return result;
  v7 = result;
  v18[0] = 0;
  v8 = *(_DWORD *)(result + 76);
  v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (v8)
  {
    v10 = v8 & 0xFFFFFFC0 | 0xC;
    if (*MEMORY[0x1E0CA1FC0])
      v11 = v10;
    else
      v11 = 0;
    if (*MEMORY[0x1E0CA1FC0] == 1)
    {
      CFHash(cf);
      kdebug_trace();
    }
  }
  else
  {
    v11 = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(v7 + 68));
  if (*(_BYTE *)(v7 + 65))
  {
    v12 = -12785;
    goto LABEL_23;
  }
  v13 = *(void **)(v7 + 48);
  if (v13 && !objc_msgSend(v13, "objectForKeyedSubscript:", cf))
  {
    if (a3)
      v12 = -12787;
    else
      v12 = 0;
    goto LABEL_23;
  }
  v18[0] = (id)objc_msgSend(*(id *)(v7 + 56), "objectForKeyedSubscript:", cf);
  if (v18[0])
    goto LABEL_14;
  FigBaseObject = FigCaptureStreamGetFigBaseObject(*(_QWORD *)(v7 + 8));
  v15 = *(uint64_t (**)(uint64_t, CFTypeRef, _QWORD, _QWORD *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v15)
  {
    v12 = v15(FigBaseObject, cf, *MEMORY[0x1E0C9AE00], v18);
    if (!v12)
    {
      if (objc_msgSend((id)sCacheableProperties, "containsObject:", cf))
        objc_msgSend(*(id *)(v7 + 56), "setObject:forKeyedSubscript:", v18[0], cf);
LABEL_14:
      v12 = 0;
    }
  }
  else
  {
    v12 = -12782;
  }
LABEL_23:
  os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 68));
  if (v11 && *v9 == 1)
    kdebug_trace();
  v16 = 0;
  if (v12 != -12783 && v12)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v16 = v12;
  }
  if (a4)
    *a4 = v16;
  return v18[0];
}

- (id)copyPropertyIfSupported:(__CFString *)a3 error:(int *)a4
{
  return (id)-[BWFigCaptureStream _copyProperty:requireSupported:error:]((uint64_t)self, a3, 0, a4);
}

- (id)copyProperty:(__CFString *)a3 error:(int *)a4
{
  return (id)-[BWFigCaptureStream _copyProperty:requireSupported:error:]((uint64_t)self, a3, 1, a4);
}

- (void)setStartStopDelegate:(id)a3
{
  id v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  FigWeakReference *v8;

  v5 = -[FigWeakReference referencedObject](self->_startStopDelegateWeakReference, "referencedObject");
  if (a3)
  {
    if (v5 && v5 != a3)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();

LABEL_9:
      v8 = -[FigWeakReference initWithReferencedObject:]([FigWeakReference alloc], "initWithReferencedObject:", a3);
      goto LABEL_10;
    }
  }

  if (a3)
    goto LABEL_9;
  v8 = 0;
LABEL_10:
  self->_startStopDelegateWeakReference = v8;
}

- (void)setCalibrationDataSent:(BOOL)a3
{
  self->_calibrationDataSent = a3;
}

- (BOOL)calibrationDataSent
{
  return self->_calibrationDataSent;
}

- (OpaqueFigCaptureStream)figCaptureStream
{
  os_unfair_lock_s *p_lock;
  OpaqueFigCaptureStream *stream;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
    stream = 0;
  else
    stream = self->_stream;
  os_unfair_lock_unlock(p_lock);
  return stream;
}

- (int)setProperty:(__CFString *)a3 value:(id)a4
{
  return -[BWFigCaptureStream _setProperty:value:requireSupported:lockHeldByCaller:]((uint64_t)self, a3, a4, 1, 0);
}

- (int)addAttachmentsToSampleBuffer:(opaqueCMSampleBuffer *)a3 options:(id)a4
{
  unsigned int ktraceCodePrefix;
  _DWORD *v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  OpaqueFigCaptureStream *stream;
  _QWORD *v13;
  uint64_t (*v14)(OpaqueFigCaptureStream *, opaqueCMSampleBuffer *, id);

  ktraceCodePrefix = self->_ktraceCodePrefix;
  v8 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (ktraceCodePrefix)
  {
    v9 = ktraceCodePrefix & 0xFFFFFFC0 | 0x10;
    if (*MEMORY[0x1E0CA1FC0])
      v10 = v9;
    else
      v10 = 0;
    if (*MEMORY[0x1E0CA1FC0] == 1)
      kdebug_trace();
  }
  else
  {
    v10 = 0;
  }
  if (self->_invalidated)
  {
    v11 = -12785;
  }
  else
  {
    stream = self->_stream;
    v13 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
    if (*v13 >= 2uLL
      && (v14 = (uint64_t (*)(OpaqueFigCaptureStream *, opaqueCMSampleBuffer *, id))v13[3]) != 0)
    {
      v11 = v14(stream, a3, a4);
    }
    else
    {
      v11 = -12782;
    }
  }
  if (v10 && *v8 == 1)
    kdebug_trace();
  return v11;
}

- (NSDictionary)supportedProperties
{
  return self->_supportedProperties;
}

- (BOOL)streaming
{
  return self->_streaming;
}

- (int)start
{
  unsigned int ktraceCodePrefix;
  _DWORD *v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigCaptureStream *stream;
  uint64_t (*v16)(OpaqueFigCaptureStream *);
  uint64_t v17;
  uint64_t v18;

  ktraceCodePrefix = self->_ktraceCodePrefix;
  v4 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (ktraceCodePrefix)
  {
    v5 = ktraceCodePrefix & 0xFFFFFFC0;
    if (*MEMORY[0x1E0CA1FC0])
      v6 = v5;
    else
      v6 = 0;
    if (*MEMORY[0x1E0CA1FC0] == 1)
      kdebug_trace();
  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    v7 = 0;
    v8 = -12785;
  }
  else if (self->_streaming)
  {
    v7 = 0;
    v8 = -12780;
  }
  else
  {
    if (dword_1ECFE96F0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    stream = self->_stream;
    v16 = *(uint64_t (**)(OpaqueFigCaptureStream *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v16)
    {
      v8 = v16(stream);
      if (v8)
      {
        v7 = 0;
      }
      else
      {
        v7 = 1;
        self->_streaming = 1;
      }
    }
    else
    {
      v7 = 0;
      v8 = -12782;
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v6 && *v4 == 1)
    kdebug_trace();
  if (v8)
  {
    v9 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    os_unfair_lock_lock(&self->_lock);
    -[BWFigCaptureStream _activateVibeMitigationIfEnabled]((uint64_t)self);
    os_unfair_lock_unlock(&self->_lock);
    goto LABEL_19;
  }
  if (!dword_1ECFE96F0)
  {
LABEL_19:
    if (!v7)
      return v8;
    goto LABEL_20;
  }
  v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  if (v7)
  {
LABEL_20:
    v11 = -[FigWeakReference referencedObject](self->_startStopDelegateWeakReference, "referencedObject", v17, v18);
    if (v11)
    {
      objc_msgSend(v11, "captureStreamDidStart");
    }
    else
    {
      v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return v8;
}

- (void)setReactionsInProgressChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)flushPropertyCache
{
  unsigned int ktraceCodePrefix;
  _DWORD *v4;
  unsigned int v5;
  unsigned int v6;

  ktraceCodePrefix = self->_ktraceCodePrefix;
  v4 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (ktraceCodePrefix)
  {
    v5 = ktraceCodePrefix & 0xFFFFFFC0 | 0x14;
    if (*MEMORY[0x1E0CA1FC0])
      v6 = v5;
    else
      v6 = 0;
    if (*MEMORY[0x1E0CA1FC0] == 1)
      kdebug_trace();
  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary removeObjectsForKeys:](self->_cachedProperties, "removeObjectsForKeys:", sDynamicCacheableProperties);
  os_unfair_lock_unlock(&self->_lock);
  if (v6)
  {
    if (*v4 == 1)
      kdebug_trace();
  }
}

+ (void)initialize
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
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
  _QWORD v38[49];
  _QWORD v39[28];

  v39[27] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
    v2 = *MEMORY[0x1E0D07500];
    v39[0] = *MEMORY[0x1E0D076B8];
    v39[1] = v2;
    v3 = *MEMORY[0x1E0D07708];
    v39[2] = *MEMORY[0x1E0D075E8];
    v39[3] = v3;
    v4 = *MEMORY[0x1E0D07560];
    v39[4] = *MEMORY[0x1E0D07530];
    v39[5] = v4;
    v5 = *MEMORY[0x1E0D077C8];
    v39[6] = CFSTR("SupportedFormatsArray");
    v39[7] = v5;
    v6 = *MEMORY[0x1E0D07880];
    v39[8] = *MEMORY[0x1E0D07780];
    v39[9] = v6;
    v7 = *MEMORY[0x1E0D07740];
    v39[10] = *MEMORY[0x1E0D07548];
    v39[11] = v7;
    v8 = *MEMORY[0x1E0D07498];
    v39[12] = *MEMORY[0x1E0D07748];
    v39[13] = v8;
    v9 = *MEMORY[0x1E0D07400];
    v39[14] = *MEMORY[0x1E0D07538];
    v39[15] = v9;
    v10 = *MEMORY[0x1E0D073E0];
    v39[16] = *MEMORY[0x1E0D073E8];
    v39[17] = v10;
    v11 = *MEMORY[0x1E0D07368];
    v39[18] = *MEMORY[0x1E0D074D0];
    v39[19] = v11;
    v12 = *MEMORY[0x1E0D075B8];
    v39[20] = *MEMORY[0x1E0D075B0];
    v39[21] = v12;
    v13 = *MEMORY[0x1E0D07460];
    v39[22] = *MEMORY[0x1E0D07520];
    v39[23] = v13;
    v14 = *MEMORY[0x1E0D077F0];
    v39[24] = *MEMORY[0x1E0D07468];
    v39[25] = v14;
    v39[26] = *MEMORY[0x1E0D077D0];
    sStaticCacheableProperties = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 27);
    v15 = *MEMORY[0x1E0D074F8];
    v38[0] = *MEMORY[0x1E0D07680];
    v38[1] = v15;
    v16 = *MEMORY[0x1E0D07568];
    v38[2] = *MEMORY[0x1E0D07840];
    v38[3] = v16;
    v17 = *MEMORY[0x1E0D07570];
    v38[4] = *MEMORY[0x1E0D07430];
    v38[5] = v17;
    v18 = *MEMORY[0x1E0D07590];
    v38[6] = *MEMORY[0x1E0D076C0];
    v38[7] = v18;
    v19 = *MEMORY[0x1E0D07588];
    v38[8] = *MEMORY[0x1E0D07580];
    v38[9] = v19;
    v20 = *MEMORY[0x1E0D077F8];
    v38[10] = *MEMORY[0x1E0D07408];
    v38[11] = v20;
    v21 = *MEMORY[0x1E0D07798];
    v38[12] = *MEMORY[0x1E0D07410];
    v38[13] = v21;
    v22 = *MEMORY[0x1E0D07718];
    v38[14] = *MEMORY[0x1E0D077A0];
    v38[15] = v22;
    v23 = *MEMORY[0x1E0D077A8];
    v38[16] = *MEMORY[0x1E0D07738];
    v38[17] = v23;
    v24 = *MEMORY[0x1E0D075A8];
    v38[18] = *MEMORY[0x1E0D075A0];
    v38[19] = v24;
    v25 = *MEMORY[0x1E0D07720];
    v38[20] = *MEMORY[0x1E0D074A0];
    v38[21] = v25;
    v26 = *MEMORY[0x1E0D07328];
    v38[22] = *MEMORY[0x1E0D07300];
    v38[23] = v26;
    v27 = *MEMORY[0x1E0D074E8];
    v38[24] = *MEMORY[0x1E0D076D8];
    v38[25] = v27;
    v28 = *MEMORY[0x1E0D07640];
    v38[26] = *MEMORY[0x1E0D07508];
    v38[27] = v28;
    v29 = *MEMORY[0x1E0D07600];
    v38[28] = *MEMORY[0x1E0D07608];
    v38[29] = v29;
    v38[30] = *MEMORY[0x1E0D074B8];
    v38[31] = CFSTR("DeferAdditionOfAttachments");
    v30 = *MEMORY[0x1E0D073C0];
    v38[32] = *MEMORY[0x1E0D07428];
    v38[33] = v30;
    v31 = *MEMORY[0x1E0D078E0];
    v38[34] = *MEMORY[0x1E0D073B8];
    v38[35] = v31;
    v32 = *MEMORY[0x1E0D07470];
    v38[36] = *MEMORY[0x1E0D075C8];
    v38[37] = v32;
    v33 = *MEMORY[0x1E0D07478];
    v38[38] = *MEMORY[0x1E0D075D8];
    v38[39] = v33;
    v34 = *MEMORY[0x1E0D07458];
    v38[40] = *MEMORY[0x1E0D07450];
    v38[41] = v34;
    v35 = *MEMORY[0x1E0D07540];
    v38[42] = *MEMORY[0x1E0D07650];
    v38[43] = v35;
    v36 = *MEMORY[0x1E0D074E0];
    v38[44] = *MEMORY[0x1E0D07710];
    v38[45] = v36;
    v37 = *MEMORY[0x1E0D076E8];
    v38[46] = *MEMORY[0x1E0D074D8];
    v38[47] = v37;
    v38[48] = *MEMORY[0x1E0D073F8];
    sDynamicCacheableProperties = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 49);
    sCacheableProperties = (uint64_t)(id)objc_msgSend((id)sDynamicCacheableProperties, "arrayByAddingObjectsFromArray:", sStaticCacheableProperties);
    sStaticCachedPropertiesByPortTypeLock = 0;
    sStaticCachedPropertiesByPortType = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
}

- (BWFigCaptureStream)initWithFigCaptureStream:(OpaqueFigCaptureStream *)a3 deviceID:(id)a4 errOut:(int *)a5
{
  BWFigCaptureStream *v6;
  BWFigCaptureStream *v9;
  NSObject *v10;
  unsigned int v11;
  unsigned int v12;
  NSString *v13;
  const char *v14;
  uint64_t v15;
  id v16;
  NSString *portType;
  int v18;
  NSObject *v19;
  unsigned int v20;
  unsigned int v21;
  NSString *v22;
  NSObject *v23;
  unsigned int v24;
  unsigned int v25;
  NSString *v26;
  int v27;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int *v30;
  uint64_t v31;
  objc_super v32;
  os_log_type_t type;
  unsigned int v34;
  int v35;
  int v36;
  const char *v37;
  __int16 v38;
  BWFigCaptureStream *v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v6 = self;
  v42 = *MEMORY[0x1E0C80C00];
  v35 = 0;
  if (!a3)
  {
    v34 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
LABEL_50:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_51;
  }
  v32.receiver = self;
  v32.super_class = (Class)BWFigCaptureStream;
  v9 = -[BWFigCaptureStream init](&v32, sel_init);
  v6 = v9;
  if (!v9)
    goto LABEL_51;
  v9->_lock._os_unfair_lock_opaque = 0;
  v9->_cachedProperties = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6->_stream = (OpaqueFigCaptureStream *)CFRetain(a3);
  if (dword_1ECFE96F0)
  {
    v34 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v10 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v11 = v34;
    if (os_log_type_enabled(v10, type))
      v12 = v11;
    else
      v12 = v11 & 0xFFFFFFFE;
    if (v12)
    {
      v36 = 136315394;
      v37 = "-[BWFigCaptureStream initWithFigCaptureStream:deviceID:errOut:]";
      v38 = 2114;
      v39 = v6;
      LODWORD(v31) = 22;
      v30 = &v36;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v6->_supportedProperties = (NSDictionary *)-[BWFigCaptureStream copyProperty:error:](v6, "copyProperty:error:", CFSTR("SupportedPropertiesDictionary"), &v35, v30, v31);
  if (!v35)
  {
    v13 = -[BWFigCaptureStream copyProperty:error:](v6, "copyProperty:error:", *MEMORY[0x1E0D07710], &v35);
    v6->_portType = v13;
    if (!v35)
    {
      v6->_portTypeShortString = (NSString *)(id)BWPortTypeToDisplayString(v13, v14);
      v6->_loggingPrefix = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%p FigCaptureStreamRef(%p), %@>"), v6, v6->_stream, v6->_portTypeShortString);
      if ((BWCaptureIsRunningInMacCatalystEnvironment() & 1) == 0
        && (BWCaptureIsRunningInIOSAppOnMacEnvironment() & 1) == 0)
      {
        v6->_staticPropertiesCacheEnabled = objc_msgSend(a4, "isEqualToString:", 0x1E492D2B8);
      }
      if (v6->_staticPropertiesCacheEnabled)
      {
        os_unfair_lock_lock((os_unfair_lock_t)&sStaticCachedPropertiesByPortTypeLock);
        -[NSMutableDictionary addEntriesFromDictionary:](v6->_cachedProperties, "addEntriesFromDictionary:", objc_msgSend((id)sStaticCachedPropertiesByPortType, "objectForKeyedSubscript:", v6->_portType));
        os_unfair_lock_unlock((os_unfair_lock_t)&sStaticCachedPropertiesByPortTypeLock);
      }
      v15 = *MEMORY[0x1E0D05A40];
      if (-[NSString isEqualToString:](v6->_portType, "isEqualToString:", *MEMORY[0x1E0D05A40]))
      {
        v16 = (id)-[NSDictionary mutableCopy](v6->_supportedProperties, "mutableCopy");
        objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D077F8]);
        objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D077F0]);
        objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D077E8]);

        v6->_supportedProperties = (NSDictionary *)objc_msgSend(v16, "copy");
      }
      v6->_uniqueID = (NSString *)-[BWFigCaptureStream copyPropertyIfSupported:error:](v6, "copyPropertyIfSupported:error:", CFSTR("UniqueID"), &v35);
      if (!v35)
      {
        if (*MEMORY[0x1E0CA1FC0])
        {
          portType = v6->_portType;
          v18 = 822151424;
          if (-[NSString isEqualToString:](portType, "isEqualToString:", *MEMORY[0x1E0D05A30]))
          {
            v18 = 822151552;
          }
          else if (-[NSString isEqualToString:](portType, "isEqualToString:", *MEMORY[0x1E0D05A18]))
          {
            v18 = 822151488;
          }
          else if (!-[NSString isEqualToString:](portType, "isEqualToString:", *MEMORY[0x1E0D05A28]))
          {
            if (-[NSString isEqualToString:](portType, "isEqualToString:", *MEMORY[0x1E0D05A38]))
            {
              v18 = 822151680;
            }
            else if (-[NSString isEqualToString:](portType, "isEqualToString:", *MEMORY[0x1E0D05A20]))
            {
              v18 = 822151616;
            }
            else if (-[NSString isEqualToString:](portType, "isEqualToString:", v15))
            {
              v18 = 822151744;
            }
            else if (-[NSString isEqualToString:](portType, "isEqualToString:", *MEMORY[0x1E0D05A50]))
            {
              v18 = 822152064;
            }
            else
            {
              v18 = 0;
            }
          }
        }
        else
        {
          v18 = 0;
        }
        v6->_ktraceCodePrefix = v18;
        -[BWFigCaptureStream registerForNotification:listener:callback:](v6, "registerForNotification:listener:callback:", CFSTR("StreamControlTakenByAnotherClient"), v6, fcs_handleStreamControlTakenByAnotherClientNotification);
        -[BWFigCaptureStream registerForNotification:listener:callback:](v6, "registerForNotification:listener:callback:", CFSTR("StreamControlRelinquishedByAnotherClient"), v6, fcs_handleStreamControlRelinquishedByAnotherClientNotification);
        -[BWFigCaptureStream registerForNotification:listener:callback:](v6, "registerForNotification:listener:callback:", *MEMORY[0x1E0D06FF8], v6, fcs_handleFrameReceiveTimeout);
        -[BWFigCaptureStream registerForNotification:listener:callback:](v6, "registerForNotification:listener:callback:", *MEMORY[0x1E0D07010], v6, fcs_reactionsInProgressChanged);
        v6->_vibeMitigationWhileCameraStreamingSupported = 0;
        v35 = -[BWFigCaptureStream setPropertyIfSupported:value:](v6, "setPropertyIfSupported:value:", *MEMORY[0x1E0D07878], MEMORY[0x1E0C9AAA0]);
        if (v35)
        {
          v34 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v20 = v34;
          if (os_log_type_enabled(v19, type))
            v21 = v20;
          else
            v21 = v20 & 0xFFFFFFFE;
          if (v21)
          {
            v22 = v6->_portType;
            v36 = 136315650;
            v37 = "-[BWFigCaptureStream initWithFigCaptureStream:deviceID:errOut:]";
            v38 = 2112;
            v39 = (BWFigCaptureStream *)v22;
            v40 = 1024;
            v41 = v35;
            _os_log_send_and_compose_impl();
          }
        }
        else
        {
          if (!dword_1ECFE96F0)
          {
            *a5 = 0;
            return v6;
          }
          v34 = 0;
          type = OS_LOG_TYPE_DEFAULT;
          v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v24 = v34;
          if (os_log_type_enabled(v23, type))
            v25 = v24;
          else
            v25 = v24 & 0xFFFFFFFE;
          if (v25)
          {
            v26 = v6->_portType;
            v36 = 136315394;
            v37 = "-[BWFigCaptureStream initWithFigCaptureStream:deviceID:errOut:]";
            v38 = 2112;
            v39 = (BWFigCaptureStream *)v26;
            _os_log_send_and_compose_impl();
          }
        }
        goto LABEL_50;
      }
    }
  }
  FigDebugAssert3();
LABEL_51:
  v27 = v35;
  *a5 = v35;
  if (v27)
  {

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigCaptureStream *stream;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  os_log_type_t type;
  int v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE96F0)
  {
    v20 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  -[BWFigCaptureStream unregisterForNotification:listener:](self, "unregisterForNotification:listener:", CFSTR("StreamControlTakenByAnotherClient"), self, v12, v13);
  -[BWFigCaptureStream unregisterForNotification:listener:](self, "unregisterForNotification:listener:", CFSTR("StreamControlRelinquishedByAnotherClient"), self);
  -[BWFigCaptureStream unregisterForNotification:listener:](self, "unregisterForNotification:listener:", *MEMORY[0x1E0D06FF8], self);
  -[BWFigCaptureStream unregisterForNotification:listener:](self, "unregisterForNotification:listener:", *MEMORY[0x1E0D07010], self);

  stream = self->_stream;
  if (stream)
    CFRelease(stream);
  if (self->_staticPropertiesCacheEnabled)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend((id)sStaticCacheableProperties, "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = (void *)sStaticCacheableProperties;
    v7 = objc_msgSend((id)sStaticCacheableProperties, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "setObject:forKeyedSubscript:", -[NSMutableDictionary objectForKeyedSubscript:](self->_cachedProperties, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i)), *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      }
      while (v8);
    }
    os_unfair_lock_lock((os_unfair_lock_t)&sStaticCachedPropertiesByPortTypeLock);
    v11 = (id)objc_msgSend(v5, "copy");
    objc_msgSend((id)sStaticCachedPropertiesByPortType, "setObject:forKeyedSubscript:", v11, self->_portType);
    os_unfair_lock_unlock((os_unfair_lock_t)&sStaticCachedPropertiesByPortTypeLock);
  }

  _Block_release(self->_reactionsInProgressChangedHandler);
  v14.receiver = self;
  v14.super_class = (Class)BWFigCaptureStream;
  -[BWFigCaptureStream dealloc](&v14, sel_dealloc);
}

- (BWFigCaptureStreamStartStopDelegate)startStopDelegate
{
  return (BWFigCaptureStreamStartStopDelegate *)-[FigWeakReference referencedObject](self->_startStopDelegateWeakReference, "referencedObject");
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ FigCaptureStreamRef (%p)"), self->_portTypeShortString, self->_stream);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[BWFigCaptureStream debugDescription](self, "debugDescription"));
}

- (int)unregisterForNotification:(__CFString *)a3 listener:(const void *)a4
{
  FigCaptureDeviceGetNotificationCenter(self);
  return FigNotificationCenterRemoveWeakListener();
}

- (void)_activateVibeMitigationIfEnabled
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v3;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 68));
    if (*(_BYTE *)(a1 + 105))
    {
      if (*(_BYTE *)(a1 + 104) && *(_BYTE *)(a1 + 72))
      {
        if (!dword_1ECFE96F0)
          return;
      }
      else
      {
        if (-[BWFigCaptureStream _setProperty:value:requireSupported:lockHeldByCaller:](a1, (const void *)*MEMORY[0x1E0D07878], (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 104) != 0), 0, 1))
        {
          FigDebugAssert3();
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
LABEL_11:
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          return;
        }
        if (!dword_1ECFE96F0)
          return;
      }
      v3 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
      goto LABEL_11;
    }
  }
}

- (int)stop
{
  unsigned int ktraceCodePrefix;
  _DWORD *v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  int v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigCaptureStream *stream;
  uint64_t (*v11)(OpaqueFigCaptureStream *);
  NSObject *v12;
  id v13;
  NSObject *v14;

  ktraceCodePrefix = self->_ktraceCodePrefix;
  v4 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (ktraceCodePrefix)
  {
    v5 = ktraceCodePrefix & 0xFFFFFFC0 | 4;
    if (*MEMORY[0x1E0CA1FC0])
      v6 = v5;
    else
      v6 = 0;
    if (*MEMORY[0x1E0CA1FC0] == 1)
      kdebug_trace();
  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    v7 = 0;
    v8 = -12785;
  }
  else if (self->_streaming)
  {
    if (dword_1ECFE96F0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    stream = self->_stream;
    v11 = *(uint64_t (**)(OpaqueFigCaptureStream *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
    if (v11)
      v8 = v11(stream);
    else
      v8 = -12782;
    self->_streaming = 0;
    v7 = 1;
  }
  else
  {
    v7 = 0;
    v8 = -12780;
  }
  -[BWFigCaptureStream _activateVibeMitigationIfEnabled]((uint64_t)self);
  os_unfair_lock_unlock(&self->_lock);
  if (v6 && *v4 == 1)
    kdebug_trace();
  if (v8 || dword_1ECFE96F0)
  {
    v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (v7)
  {
    v13 = -[FigWeakReference referencedObject](self->_startStopDelegateWeakReference, "referencedObject");
    if (v13)
    {
      objc_msgSend(v13, "captureStreamDidStop");
    }
    else
    {
      v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  return v8;
}

- (void)_resetStreamingState
{
  os_unfair_lock_s *v2;
  int v3;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 68);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 68));
    v3 = *(unsigned __int8 *)(a1 + 72);
    *(_BYTE *)(a1 + 72) = 0;
    -[BWFigCaptureStream _activateVibeMitigationIfEnabled](a1);
    os_unfair_lock_unlock(v2);
    if (v3)
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 88), "referencedObject"), "captureStreamDidStop");
  }
}

- (uint64_t)_setProperty:(void *)a3 value:(int)a4 requireSupported:(char)a5 lockHeldByCaller:
{
  NSObject *specific;
  uint64_t v11;
  int v12;
  _DWORD *v13;
  unsigned int v14;
  unsigned int v15;
  void *v16;
  uint64_t FigBaseObject;
  uint64_t (*v18)(uint64_t, const void *, void *);
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v21;
  _QWORD block[7];
  char v23;
  char v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  specific = dispatch_get_specific(CFSTR("BWFigCaptureStreamSetPropertySetPropertyAsyncQueue"));
  if (specific)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75__BWFigCaptureStream__setProperty_value_requireSupported_lockHeldByCaller___block_invoke;
    block[3] = &unk_1E49229C0;
    block[5] = a3;
    block[6] = a2;
    block[4] = a1;
    v23 = a4;
    v24 = a5;
    dispatch_async(specific, block);
    return 0;
  }
  v12 = *(_DWORD *)(a1 + 76);
  v13 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (v12)
  {
    v14 = v12 & 0xFFFFFFC0 | 8;
    if (*MEMORY[0x1E0CA1FC0])
      v15 = v14;
    else
      v15 = 0;
    if (*MEMORY[0x1E0CA1FC0] == 1)
    {
      CFHash(a2);
      kdebug_trace();
    }
    if ((a5 & 1) == 0)
      goto LABEL_12;
  }
  else
  {
    v15 = 0;
    if ((a5 & 1) == 0)
LABEL_12:
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 68));
  }
  if (*(_BYTE *)(a1 + 65))
  {
    v11 = 4294954511;
    if ((a5 & 1) == 0)
      goto LABEL_34;
LABEL_26:
    if (v15)
      goto LABEL_35;
    goto LABEL_37;
  }
  v16 = *(void **)(a1 + 48);
  if (v16 && !objc_msgSend(v16, "objectForKeyedSubscript:", a2))
  {
    if (a4)
      v11 = 4294954509;
    else
      v11 = 0;
    if ((a5 & 1) != 0)
      goto LABEL_26;
  }
  else
  {
    if ((objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", a2), "isEqual:", a3) & 1) == 0)
    {
      FigBaseObject = FigCaptureStreamGetFigBaseObject(*(_QWORD *)(a1 + 8));
      v18 = *(uint64_t (**)(uint64_t, const void *, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
      if (!v18)
      {
        v11 = 4294954514;
        if ((a5 & 1) == 0)
          goto LABEL_34;
        goto LABEL_26;
      }
      v11 = v18(FigBaseObject, a2, a3);
      if ((_DWORD)v11)
      {
        if ((a5 & 1) == 0)
          goto LABEL_34;
        goto LABEL_26;
      }
      if (objc_msgSend((id)sCacheableProperties, "containsObject:", a2))
      {
        v21 = (void *)objc_msgSend(a3, "copy");
        objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v21, a2);

      }
    }
    v11 = 0;
    if ((a5 & 1) != 0)
      goto LABEL_26;
  }
LABEL_34:
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 68));
  if (v15)
  {
LABEL_35:
    if (*v13 == 1)
      kdebug_trace();
  }
LABEL_37:
  if ((_DWORD)v11)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v11;
}

uint64_t __75__BWFigCaptureStream__setProperty_value_requireSupported_lockHeldByCaller___block_invoke(uint64_t a1)
{
  return -[BWFigCaptureStream _setProperty:value:requireSupported:lockHeldByCaller:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57));
}

- (int)sendCommandProperty:(__CFString *)a3
{
  return -[BWFigCaptureStream setProperty:value:](self, "setProperty:value:", a3, 0);
}

- (int)enqueueReactionEffect:(id)a3
{
  OpaqueFigCaptureStream *stream;
  _QWORD *v5;
  uint64_t (*v6)(OpaqueFigCaptureStream *, id);

  stream = self->_stream;
  v5 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
  if (*v5 >= 3uLL && (v6 = (uint64_t (*)(OpaqueFigCaptureStream *, id))v5[4]) != 0)
    return v6(stream, a3);
  else
    return -12782;
}

- (void)setVibeMitigationEnabled:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_vibeMitigationEnabled != v3)
  {
    self->_vibeMitigationEnabled = v3;
    -[BWFigCaptureStream _activateVibeMitigationIfEnabled]((uint64_t)self);
  }
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)vibeMitigationEnabled
{
  BWFigCaptureStream *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_vibeMitigationEnabled;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)invalidate
{
  unsigned int ktraceCodePrefix;
  _DWORD *v4;
  unsigned int v5;
  unsigned int v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigCaptureStream *stream;
  void (*v9)(OpaqueFigCaptureStream *);

  ktraceCodePrefix = self->_ktraceCodePrefix;
  v4 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (ktraceCodePrefix)
  {
    v5 = ktraceCodePrefix & 0xFFFFFFC0 | 0x18;
    if (*MEMORY[0x1E0CA1FC0])
      v6 = v5;
    else
      v6 = 0;
    if (*MEMORY[0x1E0CA1FC0] == 1)
      kdebug_trace();
  }
  else
  {
    v6 = 0;
  }
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    if (dword_1ECFE96F0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (self->_streaming)
    {
      stream = self->_stream;
      v9 = *(void (**)(OpaqueFigCaptureStream *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
      if (v9)
        v9(stream);
      self->_streaming = 0;
    }
    self->_invalidated = 1;
  }
  -[BWFigCaptureStream _activateVibeMitigationIfEnabled]((uint64_t)self);
  os_unfair_lock_unlock(&self->_lock);
  if (v6)
  {
    if (*v4 == 1)
      kdebug_trace();
  }
}

- (void)synchronizedStreamsGroupWillStop
{
  os_unfair_lock_lock(&self->_lock);
}

- (void)synchronizedStreamsGroupDidStop
{
  _BOOL4 streaming;

  streaming = self->_streaming;
  self->_streaming = 0;
  -[BWFigCaptureStream _activateVibeMitigationIfEnabled]((uint64_t)self);
  os_unfair_lock_unlock(&self->_lock);
  if (streaming)
    objc_msgSend(-[FigWeakReference referencedObject](self->_startStopDelegateWeakReference, "referencedObject"), "captureStreamDidStop");
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (id)reactionsInProgressChangedHandler
{
  return self->_reactionsInProgressChangedHandler;
}

@end
