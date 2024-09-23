@implementation BWFigCaptureDevice

- (NSDictionary)supportedProperties
{
  return self->_supportedProperties;
}

- (BWFigCaptureDevice)initWithFigCaptureDevice:(OpaqueFigCaptureDevice *)a3 deviceID:(id)a4
{
  BWFigCaptureDevice *v4;
  BWFigCaptureDevice *v7;
  OpaqueFigCaptureDevice *v8;
  uint64_t v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  unsigned int v11;
  unsigned int v12;
  NSString *loggingPrefix;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BWFigCaptureStream *v21;
  BWFigCaptureStream *v22;
  NSObject *v23;
  unsigned int v24;
  unsigned int v25;
  NSString *v26;
  NSObject *v27;
  unsigned int v28;
  unsigned int v29;
  NSString *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  BWFigCaptureSynchronizedStreamsGroup *v39;
  BWFigCaptureSynchronizedStreamsGroup *v40;
  int v41;
  NSObject *v42;
  int *v44;
  int *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BOOL4 v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  os_log_type_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  objc_super v66;
  os_log_type_t type;
  unsigned int v68;
  int v69;
  _BYTE v70[128];
  int v71;
  const char *v72;
  __int16 v73;
  NSString *v74;
  __int16 v75;
  void *v76;
  _BYTE v77[128];
  uint64_t v78;

  v4 = self;
  v78 = *MEMORY[0x1E0C80C00];
  v69 = 0;
  if (a3)
  {
    v66.receiver = self;
    v66.super_class = (Class)BWFigCaptureDevice;
    v7 = -[BWFigCaptureDevice init](&v66, sel_init);
    v4 = v7;
    if (v7)
    {
      v7->_lock._os_unfair_lock_opaque = 0;
      v8 = (OpaqueFigCaptureDevice *)CFRetain(a3);
      v9 = sNextUniqueID++;
      v4->_device = v8;
      v4->_uniqueID = v9;
      v4->_deviceID = (NSString *)objc_msgSend(a4, "copy");
      v4->_loggingPrefix = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%p FigCaptureDeviceRef(%p), %ld, %@>"), v4, a3, v4->_uniqueID, v4->_deviceID);
      if (dword_1ECFE9410)
      {
        v68 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        v11 = v68;
        if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
          v12 = v11;
        else
          v12 = v11 & 0xFFFFFFFE;
        if (v12)
        {
          loggingPrefix = v4->_loggingPrefix;
          v71 = 136315394;
          v72 = "-[BWFigCaptureDevice initWithFigCaptureDevice:deviceID:]";
          v73 = 2114;
          v74 = loggingPrefix;
          LODWORD(v46) = 22;
          v44 = &v71;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v4->_supportedProperties = (NSDictionary *)-[BWFigCaptureDevice copyProperty:error:](v4, "copyProperty:error:", CFSTR("SupportedPropertiesDictionary"), &v69, v44, v46);
      if (!v69)
      {
        v14 = -[BWFigCaptureDevice copyProperty:error:](v4, "copyProperty:error:", CFSTR("StreamArray"), &v69);
        if (v69)
          goto LABEL_71;
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v14, "count"));
        type = OS_LOG_TYPE_DEFAULT;
        v52 = 0;
        if (FigCaptureExternalCameraReplacesBuiltIn(&type))
          v52 = -[NSString isEqualToString:](v4->_deviceID, "isEqualToString:", CFSTR("Default"));
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v62, v77, 16);
        if (!v17)
        {
LABEL_43:
          v68 = 0;
          v61 = OS_LOG_TYPE_DEFAULT;
          v27 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          v28 = v68;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            v29 = v28;
          else
            v29 = v28 & 0xFFFFFFFE;
          if (v29)
          {
            v30 = v4->_loggingPrefix;
            v71 = 136315650;
            v72 = "-[BWFigCaptureDevice initWithFigCaptureDevice:deviceID:]";
            v73 = 2114;
            v74 = v30;
            v75 = 2114;
            v76 = v15;
            LODWORD(v47) = 32;
            v45 = &v71;
            _os_log_send_and_compose_impl();
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
          goto LABEL_49;
        }
        v18 = v17;
        v55 = 0;
        v19 = *(_QWORD *)v63;
        v56 = *MEMORY[0x1E0D05A38];
        v53 = *MEMORY[0x1E0D05A50];
        v51 = *MEMORY[0x1E0D05A18];
        v50 = *MEMORY[0x1E0D05A30];
        v49 = *MEMORY[0x1E0D05A28];
        v48 = *MEMORY[0x1E0D05A20];
        while (1)
        {
          v20 = 0;
          v54 = v18;
          do
          {
            if (*(_QWORD *)v63 != v19)
              objc_enumerationMutation(v14);
            v21 = -[BWFigCaptureStream initWithFigCaptureStream:deviceID:errOut:]([BWFigCaptureStream alloc], "initWithFigCaptureStream:deviceID:errOut:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v20), a4, &v69);
            if (v21)
            {
              v22 = v21;
              objc_msgSend(v15, "addObject:", v21);
              objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, -[BWFigCaptureStream portType](v22, "portType"));
              if (-[NSString isEqualToString:](-[BWFigCaptureStream portType](v22, "portType"), "isEqualToString:", v56)|| -[NSString isEqualToString:](-[BWFigCaptureStream portType](v22, "portType"), "isEqualToString:", v53))
              {
                if (type)
                {
                  objc_msgSend(v15, "removeObject:", v22);
                  objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, -[BWFigCaptureStream portType](v22, "portType"));

                  v55 = 1;
                  goto LABEL_40;
                }
                v55 = 1;
                goto LABEL_39;
              }
              if (-[NSString isEqualToString:](-[BWFigCaptureStream portType](v22, "portType"), "isEqualToString:", v51)|| -[NSString isEqualToString:](-[BWFigCaptureStream portType](v22, "portType"), "isEqualToString:", v50)|| -[NSString isEqualToString:](-[BWFigCaptureStream portType](v22, "portType"), "isEqualToString:", v49))
              {
                if (v52)
                {
LABEL_34:
                  if (type == OS_LOG_TYPE_DEFAULT)
                  {
                    objc_msgSend(v15, "removeObject:", v22);
                    objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, -[BWFigCaptureStream portType](v22, "portType"));
                  }
                }
              }
              else if (-[NSString isEqualToString:](-[BWFigCaptureStream portType](v22, "portType"), "isEqualToString:", v48)&& v52)
              {
                goto LABEL_34;
              }
LABEL_39:

              goto LABEL_40;
            }
            v68 = 0;
            v61 = OS_LOG_TYPE_DEFAULT;
            v23 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v24 = v68;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              v25 = v24;
            else
              v25 = v24 & 0xFFFFFFFE;
            if (v25)
            {
              v26 = v4->_loggingPrefix;
              v71 = 136315394;
              v72 = "-[BWFigCaptureDevice initWithFigCaptureDevice:deviceID:]";
              v73 = 2114;
              v74 = v26;
              LODWORD(v47) = 22;
              v45 = &v71;
              _os_log_send_and_compose_impl();
            }
            fig_log_call_emit_and_clean_up_after_send_and_compose();
            if (v69 != -12787)
              goto LABEL_42;
            v69 = 0;
            v18 = v54;
LABEL_40:
            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v62, v77, 16);
          if (!v18)
          {
LABEL_42:
            if ((v55 & 1) == 0)
              goto LABEL_43;
LABEL_49:
            v4->_streams = (NSArray *)objc_msgSend(v15, "copy", v45, v47);
            v4->_streamsByPortType = (NSDictionary *)objc_msgSend(v16, "copy");

            if (!v69)
            {
              v31 = *MEMORY[0x1E0D059D8];
              if (-[NSDictionary objectForKeyedSubscript:](v4->_supportedProperties, "objectForKeyedSubscript:", *MEMORY[0x1E0D059D8]))
              {
                v32 = -[BWFigCaptureDevice copyProperty:error:](v4, "copyProperty:error:", v31, &v69);
                if (v69)
                  goto LABEL_72;
                v33 = v14;
                v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v32, "count"));
                v57 = 0u;
                v58 = 0u;
                v59 = 0u;
                v60 = 0u;
                v35 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
                if (v35)
                {
                  v36 = v35;
                  v37 = *(_QWORD *)v58;
                  while (2)
                  {
                    for (i = 0; i != v36; ++i)
                    {
                      if (*(_QWORD *)v58 != v37)
                        objc_enumerationMutation(v32);
                      v39 = -[BWFigCaptureSynchronizedStreamsGroup initWithFigCaptureSynchronizedStreamsGroup:captureDevice:]([BWFigCaptureSynchronizedStreamsGroup alloc], "initWithFigCaptureSynchronizedStreamsGroup:captureDevice:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * i), v4);
                      if (!v39)
                      {
                        v69 = -12785;
                        goto LABEL_62;
                      }
                      v40 = v39;
                      objc_msgSend(v34, "addObject:", v39);

                    }
                    v36 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
                    if (v36)
                      continue;
                    break;
                  }
                }
LABEL_62:
                v4->_synchronizedStreamsGroups = (NSArray *)objc_msgSend(v34, "copy");

                v14 = v33;
                if (v69)
                {
LABEL_72:
                  FigDebugAssert3();
                  goto LABEL_74;
                }
              }
              else
              {
                v32 = 0;
              }
              if (*MEMORY[0x1E0CA1FC0])
                v41 = 822152000;
              else
                v41 = 0;
              v4->_ktraceCodePrefix = v41;
              goto LABEL_74;
            }
LABEL_71:
            FigDebugAssert3();
            v32 = 0;
            goto LABEL_74;
          }
        }
      }
      FigDebugAssert3();
    }
  }
  else
  {
    v69 = -12780;
    v68 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v42 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v32 = 0;
  v14 = 0;
LABEL_74:

  if (v69)
  {

    return 0;
  }
  return v4;
}

- (id)copyProperty:(__CFString *)a3 error:(int *)a4
{
  return (id)-[BWFigCaptureDevice _copyProperty:requireSupported:error:]((uint64_t)self, a3, 1, a4);
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
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD v17[25];

  v17[24] = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v7 = result;
    v17[0] = 0;
    v8 = *(_DWORD *)(result + 80);
    v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    if (v8)
    {
      v10 = v8 & 0xFFFFFFC0 | 0x10;
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
    os_unfair_lock_lock((os_unfair_lock_t)(v7 + 76));
    if (*(_BYTE *)(v7 + 72))
    {
      v12 = -12785;
    }
    else
    {
      v13 = *(void **)(v7 + 32);
      if (v13 && !objc_msgSend(v13, "objectForKeyedSubscript:", cf))
      {
        if (a3)
          v12 = -12787;
        else
          v12 = 0;
      }
      else
      {
        FigBaseObject = FigCaptureDeviceGetFigBaseObject(*(_QWORD *)(v7 + 8));
        v15 = *(uint64_t (**)(uint64_t, CFTypeRef, _QWORD, _QWORD *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48);
        if (v15)
          v12 = v15(FigBaseObject, cf, *MEMORY[0x1E0C9AE00], v17);
        else
          v12 = -12782;
      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(v7 + 76));
    if (v11 && *v9 == 1)
      kdebug_trace();
    if (v12 || dword_1ECFE9410)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    if (a4)
      *a4 = v12;
    return v17[0];
  }
  return result;
}

- (NSArray)streams
{
  return self->_streams;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[BWFigCaptureDevice debugDescription](self, "debugDescription"));
}

- (NSString)debugDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FigCaptureDeviceRef (%p) %ld %@"), self->_device, self->_uniqueID, self->_deviceID);
}

- (int)registerForNotification:(__CFString *)a3 listener:(const void *)a4 callback:(void *)a5
{
  FigCaptureDeviceGetNotificationCenter(self);
  return FigNotificationCenterAddWeakListener();
}

- (int)setProperty:(__CFString *)a3 value:(id)a4
{
  return -[BWFigCaptureDevice _setProperty:value:requireSupported:]((uint64_t)self, a3, (uint64_t)a4, 1);
}

- (id)copySynchronizedStreamsGroupForStreams:(id)a3 error:(int *)a4
{
  uint64_t v6;
  NSArray *synchronizedStreamsGroups;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a3, "firstObject");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  synchronizedStreamsGroups = self->_synchronizedStreamsGroups;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](synchronizedStreamsGroups, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v8)
  {
LABEL_13:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v12 = 0;
    v13 = -12784;
    if (!a4)
      return v12;
LABEL_14:
    *a4 = v13;
    return v12;
  }
  v9 = v8;
  v10 = *(_QWORD *)v17;
LABEL_3:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v17 != v10)
      objc_enumerationMutation(synchronizedStreamsGroups);
    v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
    if ((objc_msgSend((id)objc_msgSend(v12, "streams"), "containsObject:", v6) & 1) != 0)
      break;
    if (v9 == ++v11)
    {
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](synchronizedStreamsGroups, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        goto LABEL_3;
      goto LABEL_13;
    }
  }
  if (!v12)
    goto LABEL_13;
  v13 = 0;
  if (a4)
    goto LABEL_14;
  return v12;
}

- (id)copyStreamsWithPortTypes:(id)a3 error:(int *)a4
{
  NSArray *v5;
  void *v7;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  int v15;
  NSObject *v17;
  unsigned int v18;
  unsigned int v19;
  NSString *loggingPrefix;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  os_log_type_t type;
  unsigned int v28;
  _BYTE v29[128];
  int v30;
  const char *v31;
  __int16 v32;
  NSString *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v5 = (NSArray *)a3;
  v36 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  if (dword_1ECFE9410)
  {
    v28 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (!v5)
    v5 = -[NSDictionary allKeys](self->_streamsByPortType, "allKeys");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v29, 16, v21, v22);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
LABEL_7:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v11)
        objc_enumerationMutation(v5);
      v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v12);
      v14 = -[NSDictionary objectForKeyedSubscript:](self->_streamsByPortType, "objectForKeyedSubscript:", v13);
      if (!v14)
        break;
      objc_msgSend(v7, "addObject:", v14);
      if (v10 == ++v12)
      {
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
        if (v10)
          goto LABEL_7;
        goto LABEL_13;
      }
    }
    v28 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v18 = v28;
    if (os_log_type_enabled(v17, type))
      v19 = v18;
    else
      v19 = v18 & 0xFFFFFFFE;
    if (v19)
    {
      loggingPrefix = self->_loggingPrefix;
      v30 = 136315650;
      v31 = "-[BWFigCaptureDevice copyStreamsWithPortTypes:error:]";
      v32 = 2114;
      v33 = loggingPrefix;
      v34 = 2114;
      v35 = v13;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();

    v7 = 0;
    v15 = -12780;
    if (a4)
      goto LABEL_14;
  }
  else
  {
LABEL_13:
    v15 = 0;
    if (a4)
LABEL_14:
      *a4 = v15;
  }
  return v7;
}

- (BOOL)invalidated
{
  BWFigCaptureDevice *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_invalidated;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (uint64_t)_setProperty:(uint64_t)a3 value:(int)a4 requireSupported:
{
  int v8;
  _DWORD *v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  uint64_t FigBaseObject;
  uint64_t (*v15)(uint64_t, CFTypeRef, uint64_t);
  NSObject *v16;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (!a1)
    return 0;
  v8 = *(_DWORD *)(a1 + 80);
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
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 76));
  if (*(_BYTE *)(a1 + 72))
  {
    v12 = 4294954511;
  }
  else
  {
    v13 = *(void **)(a1 + 32);
    if (v13 && !objc_msgSend(v13, "objectForKeyedSubscript:", cf))
    {
      if (a4)
        v12 = 4294954509;
      else
        v12 = 0;
    }
    else
    {
      FigBaseObject = FigCaptureDeviceGetFigBaseObject(*(_QWORD *)(a1 + 8));
      v15 = *(uint64_t (**)(uint64_t, CFTypeRef, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
      if (v15)
        v12 = v15(FigBaseObject, cf, a3);
      else
        v12 = 4294954514;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 76));
  if (v11 && *v9 == 1)
    kdebug_trace();
  if (!(_DWORD)v12)
  {
    if (dword_1ECFE9410)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    return 0;
  }
  v16 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  return v12;
}

- (int)setPropertyIfSupported:(__CFString *)a3 value:(id)a4
{
  return -[BWFigCaptureDevice _setProperty:value:requireSupported:]((uint64_t)self, a3, (uint64_t)a4, 0);
}

- (void)resetSynchronizedStreamsGroups
{
  NSArray *synchronizedStreamsGroups;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  synchronizedStreamsGroups = self->_synchronizedStreamsGroups;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](synchronizedStreamsGroups, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    v6 = *MEMORY[0x1E0D081A0];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(synchronizedStreamsGroups);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "setProperty:value:", v6, 0);
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](synchronizedStreamsGroups, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }
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

- (void)dealloc
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigCaptureDevice *device;
  objc_super v5;
  os_log_type_t type;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE9410)
  {
    v7 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }

  device = self->_device;
  if (device)
    CFRelease(device);

  v5.receiver = self;
  v5.super_class = (Class)BWFigCaptureDevice;
  -[BWFigCaptureDevice dealloc](&v5, sel_dealloc);
}

- (id)copyStreamWithPortType:(__CFString *)a3 error:(int *)a4
{
  id v4;
  id v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = a3;
  v4 = -[BWFigCaptureDevice copyStreamsWithPortTypes:error:](self, "copyStreamsWithPortTypes:error:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1), a4);
  v5 = (id)objc_msgSend(v4, "firstObject");

  return v5;
}

- (int)requestControlOfStreams:(id)a3 clientPriority:(int)a4
{
  uint64_t v4;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  unsigned int ktraceCodePrefix;
  _DWORD *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v19;
  OpaqueFigCaptureDevice *device;
  _QWORD *v21;
  uint64_t (*v22)(OpaqueFigCaptureDevice *, void *, uint64_t);
  int v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  NSObject *v31;
  unsigned int v32;
  unsigned int v33;
  NSString *loggingPrefix;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  os_log_type_t type;
  unsigned int v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  int v49;
  const char *v50;
  __int16 v51;
  NSString *v52;
  __int16 v53;
  id v54;
  _QWORD v55[2];
  _QWORD v56[2];
  _BYTE v57[128];
  uint64_t v58;

  v4 = *(_QWORD *)&a4;
  v58 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v45 != v10)
          objc_enumerationMutation(a3);
        objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "figCaptureStream"));
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
    }
    while (v9);
  }
  ktraceCodePrefix = self->_ktraceCodePrefix;
  v13 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (ktraceCodePrefix)
  {
    v14 = ktraceCodePrefix & 0xFFFFFFC0;
    if (*MEMORY[0x1E0CA1FC0])
      v15 = v14;
    else
      v15 = 0;
    if (*MEMORY[0x1E0CA1FC0] == 1)
      kdebug_trace();
  }
  else
  {
    v15 = 0;
  }
  if ((int)FigCapturePlatformIdentifier() < 10)
  {
    v17 = 0;
  }
  else
  {
    v55[0] = CFSTR("ClientPriority");
    v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
    v55[1] = CFSTR("DefaultFormatIndexDisabled");
    v56[0] = v16;
    v56[1] = MEMORY[0x1E0C9AAB0];
    v17 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
  }
  if (dword_1ECFE9410)
  {
    v43 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    v19 = -12785;
  }
  else
  {
    device = self->_device;
    v21 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
    if (*v21 >= 2uLL && (v22 = (uint64_t (*)(OpaqueFigCaptureDevice *, void *, uint64_t))v21[2]) != 0)
      v19 = v22(device, v7, v17);
    else
      v19 = -12782;
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v15 && *v13 == 1)
    kdebug_trace();

  if (v19 == -12782)
    v23 = 0;
  else
    v23 = v19;
  if (v23)
  {
    v43 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
LABEL_47:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return v23;
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v25 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v39;
    v28 = *MEMORY[0x1E0D076D0];
    v29 = MEMORY[0x1E0C9AAB0];
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v39 != v27)
          objc_enumerationMutation(a3);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "setProperty:value:", v28, v29, v36, v37);
      }
      v26 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    }
    while (v26);
  }
  if (dword_1ECFE9410)
  {
    v43 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v31 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v32 = v43;
    if (os_log_type_enabled(v31, type))
      v33 = v32;
    else
      v33 = v32 & 0xFFFFFFFE;
    if (v33)
    {
      loggingPrefix = self->_loggingPrefix;
      v49 = 136315650;
      v50 = "-[BWFigCaptureDevice requestControlOfStreams:clientPriority:]";
      v51 = 2114;
      v52 = loggingPrefix;
      v53 = 2114;
      v54 = a3;
      _os_log_send_and_compose_impl();
    }
    goto LABEL_47;
  }
  return v23;
}

- (int)relinquishControlOfStreams:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  unsigned int ktraceCodePrefix;
  _DWORD *v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  OpaqueFigCaptureDevice *device;
  _QWORD *v17;
  uint64_t (*v18)(OpaqueFigCaptureDevice *, void *, _QWORD);
  int v19;
  NSObject *v20;
  unsigned int v21;
  unsigned int v22;
  NSString *loggingPrefix;
  NSObject *v24;
  unsigned int v25;
  unsigned int v26;
  NSString *v27;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  os_log_type_t type;
  unsigned int v36;
  int v37;
  const char *v38;
  __int16 v39;
  NSString *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  int v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (dword_1ECFE9410)
  {
    v36 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(a3);
        objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * i), "figCaptureStream", v29, v30));
      }
      v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v31, v45, 16);
    }
    while (v8);
  }
  ktraceCodePrefix = self->_ktraceCodePrefix;
  v12 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (ktraceCodePrefix)
  {
    v13 = ktraceCodePrefix & 0xFFFFFFC0 | 4;
    if (*MEMORY[0x1E0CA1FC0])
      v14 = v13;
    else
      v14 = 0;
    if (*MEMORY[0x1E0CA1FC0] == 1)
      kdebug_trace();
  }
  else
  {
    v14 = 0;
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    v15 = -12785;
  }
  else
  {
    device = self->_device;
    v17 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
    if (*v17 >= 2uLL && (v18 = (uint64_t (*)(OpaqueFigCaptureDevice *, void *, _QWORD))v17[3]) != 0)
      v15 = v18(device, v6, 0);
    else
      v15 = -12782;
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v14 && *v12 == 1)
    kdebug_trace();

  if (v15 == -12782)
    v19 = 0;
  else
    v19 = v15;
  if (v19)
  {
    v36 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v21 = v36;
    if (os_log_type_enabled(v20, type))
      v22 = v21;
    else
      v22 = v21 & 0xFFFFFFFE;
    if (v22)
    {
      loggingPrefix = self->_loggingPrefix;
      v37 = 136315906;
      v38 = "-[BWFigCaptureDevice relinquishControlOfStreams:]";
      v39 = 2114;
      v40 = loggingPrefix;
      v41 = 2114;
      v42 = a3;
      v43 = 1024;
      v44 = v19;
      _os_log_send_and_compose_impl();
    }
LABEL_41:
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return v19;
  }
  if (dword_1ECFE9410)
  {
    v36 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    v24 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v25 = v36;
    if (os_log_type_enabled(v24, type))
      v26 = v25;
    else
      v26 = v25 & 0xFFFFFFFE;
    if (v26)
    {
      v27 = self->_loggingPrefix;
      v37 = 136315650;
      v38 = "-[BWFigCaptureDevice relinquishControlOfStreams:]";
      v39 = 2114;
      v40 = v27;
      v41 = 2114;
      v42 = a3;
      _os_log_send_and_compose_impl();
    }
    goto LABEL_41;
  }
  return v19;
}

- (id)copyISPProcessingSessionWithType:(int)a3 error:(int *)a4
{
  uint64_t v6;
  unsigned int ktraceCodePrefix;
  _DWORD *v8;
  unsigned int v9;
  unsigned int v10;
  BWFigCaptureISPProcessingSession *v11;
  int v12;
  OpaqueFigCaptureDevice *device;
  uint64_t (*v15)(OpaqueFigCaptureDevice *, _QWORD, uint64_t, CFTypeRef *);
  BWFigCaptureISPProcessingSession *v16;
  CFTypeRef cf;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v18 = CFSTR("SessionType");
  v19[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v6 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  cf = 0;
  ktraceCodePrefix = self->_ktraceCodePrefix;
  v8 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (ktraceCodePrefix)
  {
    v9 = ktraceCodePrefix & 0xFFFFFFC0 | 8;
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
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    v11 = 0;
    v12 = -12785;
  }
  else
  {
    device = self->_device;
    v15 = *(uint64_t (**)(OpaqueFigCaptureDevice *, _QWORD, uint64_t, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                           + 8);
    if (v15)
    {
      v12 = v15(device, *MEMORY[0x1E0C9AE00], v6, &cf);
      if (cf)
      {
        v16 = [BWFigCaptureISPProcessingSession alloc];
        v11 = -[BWFigCaptureISPProcessingSession initWithFigCaptureISPProcessingSession:](v16, "initWithFigCaptureISPProcessingSession:", cf);
        -[BWFigCaptureISPProcessingSession setDelegate:](v11, "setDelegate:", self);
        if (!self->_activeProcessingSessions)
          self->_activeProcessingSessions = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
        -[NSMutableArray addObject:](self->_activeProcessingSessions, "addObject:", +[FigWeakReference weakReferenceToObject:](FigWeakReference, "weakReferenceToObject:", v11, cf));
        if (cf)
          CFRelease(cf);
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
      v12 = -12782;
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  if (v10 && *v8 == 1)
    kdebug_trace();
  if (a4)
    *a4 = v12;
  return v11;
}

- (int)enqueueReactionEffect:(id)a3
{
  return -12782;
}

- (int)unregisterForNotification:(__CFString *)a3 listener:(const void *)a4
{
  FigCaptureDeviceGetNotificationCenter(self);
  return FigNotificationCenterRemoveWeakListener();
}

- (id)copyPropertyIfSupported:(__CFString *)a3 error:(int *)a4
{
  return (id)-[BWFigCaptureDevice _copyProperty:requireSupported:error:]((uint64_t)self, a3, 0, a4);
}

- (id)getProperty:(__CFString *)a3 error:(int *)a4
{
  return (id)-[BWFigCaptureDevice _copyProperty:requireSupported:error:]((uint64_t)self, a3, 1, a4);
}

- (id)getPropertyIfSupported:(__CFString *)a3 error:(int *)a4
{
  return (id)-[BWFigCaptureDevice _copyProperty:requireSupported:error:]((uint64_t)self, a3, 0, a4);
}

- (id)copyStreamForFigCaptureStream:(OpaqueFigCaptureStream *)a3 error:(int *)a4
{
  NSArray *streams;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  streams = self->_streams;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](streams, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v7)
  {
LABEL_13:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v11 = 0;
    v12 = -12784;
    if (!a4)
      return v11;
LABEL_14:
    *a4 = v12;
    return v11;
  }
  v8 = v7;
  v9 = *(_QWORD *)v16;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v16 != v9)
      objc_enumerationMutation(streams);
    v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
    if ((OpaqueFigCaptureStream *)objc_msgSend(v11, "figCaptureStream") == a3)
      break;
    if (v8 == ++v10)
    {
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](streams, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        goto LABEL_3;
      goto LABEL_13;
    }
  }
  if (!v11)
    goto LABEL_13;
  v12 = 0;
  if (a4)
    goto LABEL_14;
  return v11;
}

- (id)copySyncGroupForFigCaptureSynchronizedStreamsGroup:(OpaqueFigCaptureSynchronizedStreamsGroup *)a3 error:(int *)a4
{
  NSArray *synchronizedStreamsGroups;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  synchronizedStreamsGroups = self->_synchronizedStreamsGroups;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](synchronizedStreamsGroups, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v7)
  {
LABEL_13:
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    v11 = 0;
    v12 = -12784;
    if (!a4)
      return v11;
LABEL_14:
    *a4 = v12;
    return v11;
  }
  v8 = v7;
  v9 = *(_QWORD *)v16;
LABEL_3:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v16 != v9)
      objc_enumerationMutation(synchronizedStreamsGroups);
    v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
    if ((OpaqueFigCaptureSynchronizedStreamsGroup *)objc_msgSend(v11, "figCaptureSynchronizedStreamsGroup") == a3)
      break;
    if (v8 == ++v10)
    {
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](synchronizedStreamsGroups, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        goto LABEL_3;
      goto LABEL_13;
    }
  }
  if (!v11)
    goto LABEL_13;
  v12 = 0;
  if (a4)
    goto LABEL_14;
  return v11;
}

- (OpaqueFigCaptureDevice)figCaptureDevice
{
  os_unfair_lock_s *p_lock;
  OpaqueFigCaptureDevice *device;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
    device = 0;
  else
    device = self->_device;
  os_unfair_lock_unlock(p_lock);
  return device;
}

- (void)invalidate
{
  unsigned int ktraceCodePrefix;
  _DWORD *v4;
  unsigned int v5;
  unsigned int v6;
  os_unfair_lock_s *p_lock;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  NSObject *v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  NSMutableArray *activeProcessingSessions;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  uint64_t FigBaseObject;
  uint64_t v32;
  void (*v33)(uint64_t);
  uint64_t v34;
  int *v35;
  uint64_t v36;
  uint64_t v37;
  os_unfair_lock_s *v38;
  unsigned int v39;
  BWFigCaptureDevice *v40;
  NSArray *obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  os_log_type_t type;
  unsigned int v51;
  _BYTE v52[128];
  int v53;
  const char *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  int v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
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
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
  {
    v38 = &self->_lock;
    v39 = v6;
    if (dword_1ECFE9410)
    {
      v51 = 0;
      type = OS_LOG_TYPE_DEFAULT;
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v40 = self;
    obj = self->_streams;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v59, 16, v34, v36);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v47;
      v12 = *MEMORY[0x1E0D07878];
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v47 != v11)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "setPropertyIfSupported:value:", v12, MEMORY[0x1E0C9AAA0], v35, v37);
          if (v15)
          {
            v16 = v15;
            v51 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            v17 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v18 = v51;
            if (os_log_type_enabled(v17, type))
              v19 = v18;
            else
              v19 = v18 & 0xFFFFFFFE;
            if (v19)
            {
              v20 = objc_msgSend(v14, "portType");
              v53 = 136315650;
              v54 = "-[BWFigCaptureDevice invalidate]";
              v55 = 2112;
              v56 = v20;
              v57 = 1024;
              v58 = v16;
              LODWORD(v37) = 28;
              v35 = &v53;
              _os_log_send_and_compose_impl();
            }
          }
          else
          {
            if (!dword_1ECFE9410)
              continue;
            v51 = 0;
            type = OS_LOG_TYPE_DEFAULT;
            v21 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
            v22 = v51;
            if (os_log_type_enabled(v21, type))
              v23 = v22;
            else
              v23 = v22 & 0xFFFFFFFE;
            if (v23)
            {
              v24 = objc_msgSend(v14, "portType");
              v53 = 136315394;
              v54 = "-[BWFigCaptureDevice invalidate]";
              v55 = 2112;
              v56 = v24;
              LODWORD(v37) = 22;
              v35 = &v53;
              _os_log_send_and_compose_impl();
            }
          }
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v59, 16);
      }
      while (v10);
    }
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    activeProcessingSessions = v40->_activeProcessingSessions;
    v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](activeProcessingSessions, "countByEnumeratingWithState:objects:count:", &v42, v52, 16, v35, v37);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v43 != v28)
            objc_enumerationMutation(activeProcessingSessions);
          v30 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "referencedObject");
          objc_msgSend(v30, "setDelegate:", 0);
          objc_msgSend(v30, "invalidate");
        }
        v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](activeProcessingSessions, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
      }
      while (v27);
    }

    v40->_activeProcessingSessions = 0;
    FigBaseObject = FigCaptureDeviceGetFigBaseObject(v40->_device);
    if (FigBaseObject)
    {
      v32 = FigBaseObject;
      v33 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
      if (v33)
        v33(v32);
    }
    v40->_invalidated = 1;
    v4 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    v6 = v39;
    p_lock = v38;
  }
  os_unfair_lock_unlock(p_lock);
  if (v6)
  {
    if (*v4 == 1)
      kdebug_trace();
  }
}

- (void)processingSessionHasBeenInvalidated:(id)a3
{
  unsigned int ktraceCodePrefix;
  _DWORD *v6;
  unsigned int v7;
  unsigned int v8;
  NSMutableArray *activeProcessingSessions;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  ktraceCodePrefix = self->_ktraceCodePrefix;
  v6 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (ktraceCodePrefix)
  {
    v7 = ktraceCodePrefix & 0xFFFFFFC0 | 0x18;
    if (*MEMORY[0x1E0CA1FC0])
      v8 = v7;
    else
      v8 = 0;
    if (*MEMORY[0x1E0CA1FC0] == 1)
      kdebug_trace();
  }
  else
  {
    v8 = 0;
  }
  os_unfair_lock_lock(&self->_lock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  activeProcessingSessions = self->_activeProcessingSessions;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](activeProcessingSessions, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(activeProcessingSessions);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((id)objc_msgSend(v14, "referencedObject") == a3)
        {
          if (v14)
          {
            -[NSMutableArray removeObject:](self->_activeProcessingSessions, "removeObject:", v14);
            if (!-[NSMutableArray count](self->_activeProcessingSessions, "count"))
            {

              self->_activeProcessingSessions = 0;
            }
          }
          goto LABEL_20;
        }
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](activeProcessingSessions, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_20:
  os_unfair_lock_unlock(&self->_lock);
  if (v8)
  {
    if (*v6 == 1)
      kdebug_trace();
  }
}

- (int64_t)uniqueID
{
  return self->_uniqueID;
}

- (NSArray)synchronizedStreamsGroups
{
  return self->_synchronizedStreamsGroups;
}

@end
