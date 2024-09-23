@implementation BWFigCaptureSynchronizedStreamsGroup

- (BWFigCaptureStream)synchronizationMaster
{
  return self->_synchronizationMaster;
}

- (int)setActiveStreams:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  int v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v18 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a3, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(a3);
        objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9++), "figCaptureStream"));
      }
      while (v7 != v9);
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v7);
  }
  v10 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v11 = *MEMORY[0x1E0D081A0];
  v12 = -[BWFigCaptureSynchronizedStreamsGroup getProperty:error:](self, "getProperty:error:", *MEMORY[0x1E0D081A0], &v18);
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12), "isEqualToSet:", v10) & 1) == 0)
  {
    v18 = -[BWFigCaptureSynchronizedStreamsGroup setProperty:value:](self, "setProperty:value:", v11, v5);
    if (!v18)
    {

      self->_activeStreams = (NSArray *)objc_msgSend(a3, "copy");
    }
  }

  return v18;
}

- (id)getProperty:(__CFString *)a3 error:(int *)a4
{
  return -[BWFigCaptureSynchronizedStreamsGroup copyProperty:error:](self, "copyProperty:error:", a3, a4);
}

- (BWFigCaptureSynchronizedStreamsGroup)initWithFigCaptureSynchronizedStreamsGroup:(OpaqueFigCaptureSynchronizedStreamsGroup *)a3 captureDevice:(id)a4
{
  BWFigCaptureSynchronizedStreamsGroup *v4;
  BWFigCaptureSynchronizedStreamsGroup *v7;
  id v8;
  BWFigCaptureSynchronizedStreamsGroup *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSString *v17;
  NSString *v18;
  int v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  int v26;
  _BYTE v27[128];
  uint64_t v28;

  v4 = self;
  v28 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  if (!a3)
  {
    v9 = 0;
LABEL_35:

    v9 = v4;
    v4 = 0;
    goto LABEL_29;
  }
  v25.receiver = self;
  v25.super_class = (Class)BWFigCaptureSynchronizedStreamsGroup;
  v7 = -[BWFigCaptureSynchronizedStreamsGroup init](&v25, sel_init);
  v4 = v7;
  if (!v7)
  {
    v9 = 0;
    goto LABEL_29;
  }
  v7->_lock._os_unfair_lock_opaque = 0;
  v7->_syncGroup = (OpaqueFigCaptureSynchronizedStreamsGroup *)CFRetain(a3);
  v4->_supportedProperties = (NSDictionary *)-[BWFigCaptureSynchronizedStreamsGroup copyProperty:error:](v4, "copyProperty:error:", CFSTR("SupportedPropertiesDictionary"), &v26);
  v8 = -[BWFigCaptureSynchronizedStreamsGroup copyProperty:error:](v4, "copyProperty:error:", *MEMORY[0x1E0D08220], &v26);
  if (v26)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    v9 = 0;
    goto LABEL_33;
  }
  v9 = -[BWFigCaptureSynchronizedStreamsGroup copyProperty:error:](v4, "copyProperty:error:", *MEMORY[0x1E0D08218], &v26);
  if (v26)
  {
    fig_log_get_emitter();
    FigDebugAssert3();
LABEL_33:
    if (v8)
      CFRelease(v8);
    goto LABEL_35;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[BWFigCaptureSynchronizedStreamsGroup count](v9, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = (void *)objc_msgSend(a4, "streams");
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if ((id)objc_msgSend(v16, "figCaptureStream") == v8)
          v4->_synchronizationMaster = (BWFigCaptureStream *)v16;
        if (-[BWFigCaptureSynchronizedStreamsGroup containsObject:](v9, "containsObject:", objc_msgSend(v16, "figCaptureStream")))objc_msgSend(v10, "addObject:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v13);
  }
  v4->_streams = (NSArray *)objc_msgSend(v10, "copy");

  v4->_stopSupported = **(_QWORD **)(CMBaseObjectGetVTable() + 16) > 1uLL;
  v17 = -[BWFigCaptureStream portType](v4->_synchronizationMaster, "portType");
  if (!*MEMORY[0x1E0CA1FC0])
  {
LABEL_26:
    v19 = 0;
    goto LABEL_27;
  }
  v18 = v17;
  v19 = 822151936;
  if (!-[NSString isEqualToString:](v17, "isEqualToString:", *MEMORY[0x1E0D05A30])
    && !-[NSString isEqualToString:](v18, "isEqualToString:", *MEMORY[0x1E0D05A18])
    && !-[NSString isEqualToString:](v18, "isEqualToString:", *MEMORY[0x1E0D05A28])
    && !-[NSString isEqualToString:](v18, "isEqualToString:", *MEMORY[0x1E0D05A20]))
  {
    if (-[NSString isEqualToString:](v18, "isEqualToString:", *MEMORY[0x1E0D05A38])
      || -[NSString isEqualToString:](v18, "isEqualToString:", *MEMORY[0x1E0D05A40])
      || -[NSString isEqualToString:](v18, "isEqualToString:", *MEMORY[0x1E0D05A50]))
    {
      v19 = 822151872;
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_27:
  v4->_ktraceCodePrefix = v19;
  if (v8)
    CFRelease(v8);
LABEL_29:

  return v4;
}

- (NSDictionary)supportedProperties
{
  return self->_supportedProperties;
}

- (id)copyProperty:(__CFString *)a3 error:(int *)a4
{
  unsigned int ktraceCodePrefix;
  _DWORD *v8;
  unsigned int v9;
  os_unfair_lock_s *p_lock;
  int v11;
  NSDictionary *supportedProperties;
  uint64_t FigBaseObject;
  uint64_t (*v14)(uint64_t, __CFString *, _QWORD, void **);
  void *v16;

  v16 = 0;
  ktraceCodePrefix = self->_ktraceCodePrefix;
  v8 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (ktraceCodePrefix)
  {
    v9 = ktraceCodePrefix & 0xFFFFFFC0 | 4;
    if (*MEMORY[0x1E0CA1FC0] == 1)
    {
      CFHash(a3);
      kdebug_trace();
    }
  }
  else
  {
    v9 = 0;
  }
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    v11 = -12785;
  }
  else
  {
    supportedProperties = self->_supportedProperties;
    if (supportedProperties
      && !-[NSDictionary objectForKeyedSubscript:](supportedProperties, "objectForKeyedSubscript:", a3))
    {
      v11 = -12787;
    }
    else
    {
      FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject(self->_syncGroup);
      v14 = *(uint64_t (**)(uint64_t, __CFString *, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                             + 48);
      if (v14)
        v11 = v14(FigBaseObject, a3, *MEMORY[0x1E0C9AE00], &v16);
      else
        v11 = -12782;
    }
  }
  os_unfair_lock_unlock(p_lock);
  if (v9 && *v8 == 1)
    kdebug_trace();
  if (a4)
    *a4 = v11;
  return v16;
}

- (int)setProperty:(__CFString *)a3 value:(id)a4
{
  NSObject *specific;
  int v8;
  unsigned int ktraceCodePrefix;
  _DWORD *v10;
  unsigned int v11;
  os_unfair_lock_s *p_lock;
  NSDictionary *supportedProperties;
  uint64_t FigBaseObject;
  uint64_t (*v15)(uint64_t, __CFString *, id);
  _QWORD block[7];

  specific = dispatch_get_specific(CFSTR("BWFigCaptureStreamSetPropertySetPropertyAsyncQueue"));
  if (specific)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__BWFigCaptureSynchronizedStreamsGroup_setProperty_value___block_invoke;
    block[3] = &unk_1E491EC68;
    block[5] = a4;
    block[6] = a3;
    block[4] = self;
    dispatch_async(specific, block);
    return 0;
  }
  else
  {
    ktraceCodePrefix = self->_ktraceCodePrefix;
    v10 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    if (ktraceCodePrefix)
    {
      v11 = ktraceCodePrefix & 0xFFFFFFC0;
      if (*MEMORY[0x1E0CA1FC0] == 1)
      {
        CFHash(a3);
        kdebug_trace();
      }
    }
    else
    {
      v11 = 0;
    }
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_invalidated)
    {
      v8 = -12785;
    }
    else
    {
      supportedProperties = self->_supportedProperties;
      if (supportedProperties
        && !-[NSDictionary objectForKeyedSubscript:](supportedProperties, "objectForKeyedSubscript:", a3))
      {
        v8 = -12787;
      }
      else
      {
        FigBaseObject = FigCaptureSynchronizedStreamsGroupGetFigBaseObject(self->_syncGroup);
        v15 = *(uint64_t (**)(uint64_t, __CFString *, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
        if (v15)
          v8 = v15(FigBaseObject, a3, a4);
        else
          v8 = -12782;
      }
    }
    os_unfair_lock_unlock(p_lock);
    if (v11 && *v10 == 1)
      kdebug_trace();
  }
  return v8;
}

- (int)setMasterStream:(id)a3 slaveConfigurationsByPortType:(id)a4
{
  id v7;
  uint64_t v8;

  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = objc_msgSend(a3, "figCaptureStream");
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D08178]);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", a4, *MEMORY[0x1E0D08180]);
  LODWORD(a4) = -[BWFigCaptureSynchronizedStreamsGroup setProperty:value:](self, "setProperty:value:", *MEMORY[0x1E0D081B8], v7);

  return (int)a4;
}

- (int)setCameraControlsMasterStream:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1A858DD40](self, a2);
  v16[0] = *MEMORY[0x1E0D08168];
  v6 = objc_msgSend(a3, "figCaptureStream");
  v7 = *MEMORY[0x1E0C9B0D0];
  if (v6)
    v8 = v6;
  else
    v8 = *MEMORY[0x1E0C9B0D0];
  v17[0] = v8;
  v16[1] = *MEMORY[0x1E0D08160];
  v9 = objc_msgSend(a3, "figCaptureStream");
  if (v9)
    v10 = v9;
  else
    v10 = v7;
  v17[1] = v10;
  v16[2] = *MEMORY[0x1E0D08170];
  v11 = objc_msgSend(a3, "figCaptureStream");
  if (v11)
    v12 = v11;
  else
    v12 = v7;
  v17[2] = v12;
  v13 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v14 = -[BWFigCaptureSynchronizedStreamsGroup setProperty:value:](self, "setProperty:value:", *MEMORY[0x1E0D081B8], v13);
  objc_autoreleasePoolPop(v5);
  return v14;
}

- (NSArray)streams
{
  return self->_streams;
}

- (OpaqueFigCaptureSynchronizedStreamsGroup)figCaptureSynchronizedStreamsGroup
{
  os_unfair_lock_s *p_lock;
  OpaqueFigCaptureSynchronizedStreamsGroup *syncGroup;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
    syncGroup = 0;
  else
    syncGroup = self->_syncGroup;
  os_unfair_lock_unlock(p_lock);
  return syncGroup;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  OpaqueFigCaptureSynchronizedStreamsGroup *syncGroup;
  objc_super v4;

  syncGroup = self->_syncGroup;
  if (syncGroup)
    CFRelease(syncGroup);

  v4.receiver = self;
  v4.super_class = (Class)BWFigCaptureSynchronizedStreamsGroup;
  -[BWFigCaptureSynchronizedStreamsGroup dealloc](&v4, sel_dealloc);
}

uint64_t __58__BWFigCaptureSynchronizedStreamsGroup_setProperty_value___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setProperty:value:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (id)activeStreams
{
  return self->_activeStreams;
}

- (int)stop
{
  unsigned int ktraceCodePrefix;
  _DWORD *v4;
  unsigned int v5;
  os_unfair_lock_s *p_lock;
  NSArray *activeStreams;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  OpaqueFigCaptureSynchronizedStreamsGroup *syncGroup;
  _QWORD *v18;
  uint64_t (*v19)(OpaqueFigCaptureSynchronizedStreamsGroup *);
  int v20;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  BWFigCaptureStream *v26;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  __int128 v33;
  __int128 v34;
  __int128 v35;
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
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (self->_stopSupported)
  {
    ktraceCodePrefix = self->_ktraceCodePrefix;
    v4 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    if (ktraceCodePrefix)
    {
      v5 = ktraceCodePrefix & 0xFFFFFFC0 | 8;
      if (*MEMORY[0x1E0CA1FC0] == 1)
        kdebug_trace();
    }
    else
    {
      v5 = 0;
    }
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    activeStreams = self->_activeStreams;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](activeStreams, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v46;
LABEL_8:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v46 != v10)
          objc_enumerationMutation(activeStreams);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v11), "streaming") & 1) != 0)
          break;
        if (v9 == ++v11)
        {
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](activeStreams, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
          if (v9)
            goto LABEL_8;
          goto LABEL_38;
        }
      }
      if (**(_QWORD **)(CMBaseObjectGetVTable() + 16) >= 2uLL)
      {
        v43 = 0uLL;
        v44 = 0uLL;
        v41 = 0uLL;
        v42 = 0uLL;
        v12 = self->_activeStreams;
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v42;
          do
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v42 != v15)
                objc_enumerationMutation(v12);
              objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * i), "synchronizedStreamsGroupWillStop");
            }
            v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
          }
          while (v14);
        }
        syncGroup = self->_syncGroup;
        v18 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
        if (*v18 >= 2uLL && (v19 = (uint64_t (*)(OpaqueFigCaptureSynchronizedStreamsGroup *))v18[1]) != 0)
          v20 = v19(syncGroup);
        else
          v20 = -12782;
        v39 = 0u;
        v40 = 0u;
        v37 = 0u;
        v38 = 0u;
        v27 = self->_activeStreams;
        v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v38;
          do
          {
            for (j = 0; j != v29; ++j)
            {
              if (*(_QWORD *)v38 != v30)
                objc_enumerationMutation(v27);
              objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * j), "synchronizedStreamsGroupDidStop");
            }
            v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
          }
          while (v29);
        }
        goto LABEL_47;
      }
      v35 = 0uLL;
      v36 = 0uLL;
      v33 = 0uLL;
      v34 = 0uLL;
      v21 = self->_activeStreams;
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v34;
        do
        {
          for (k = 0; k != v23; ++k)
          {
            if (*(_QWORD *)v34 != v24)
              objc_enumerationMutation(v21);
            v26 = *(BWFigCaptureStream **)(*((_QWORD *)&v33 + 1) + 8 * k);
            if (-[BWFigCaptureStream streaming](v26, "streaming") && v26 != self->_synchronizationMaster)
              -[BWFigCaptureStream stop](v26, "stop");
          }
          v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v33, v49, 16);
        }
        while (v23);
      }
      if (-[BWFigCaptureStream streaming](self->_synchronizationMaster, "streaming"))
        -[BWFigCaptureStream stop](self->_synchronizationMaster, "stop");
    }
LABEL_38:
    v20 = 0;
LABEL_47:
    os_unfair_lock_unlock(p_lock);
    if (v5 && *v4 == 1)
      kdebug_trace();
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return -12782;
  }
  return v20;
}

- (void)invalidate
{
  unsigned int ktraceCodePrefix;
  _DWORD *v4;
  unsigned int v5;

  ktraceCodePrefix = self->_ktraceCodePrefix;
  v4 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (ktraceCodePrefix)
  {
    v5 = ktraceCodePrefix & 0xFFFFFFC0 | 0xC;
    if (*MEMORY[0x1E0CA1FC0] == 1)
      kdebug_trace();
  }
  else
  {
    v5 = 0;
  }
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
    self->_invalidated = 1;
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    if (*v4 == 1)
      kdebug_trace();
  }
}

- (BOOL)stopSupported
{
  return self->_stopSupported;
}

@end
