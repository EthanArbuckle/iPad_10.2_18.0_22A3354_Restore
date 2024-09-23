@implementation BWFigCaptureISPProcessingSession

+ (void)initialize
{
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  if ((id)objc_opt_class() == a1)
  {
    v2[0] = CFSTR("SupportedPropertiesDictionary");
    sCacheableProperties_0 = (uint64_t)(id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  }
}

- (BWFigCaptureISPProcessingSession)initWithFigCaptureISPProcessingSession:(OpaqueFigCaptureISPProcessingSession *)a3
{
  BWFigCaptureISPProcessingSession *v3;
  BWFigCaptureISPProcessingSession *v5;
  objc_super v7;
  int v8;

  v3 = self;
  v8 = 0;
  if (!a3)
    goto LABEL_6;
  v7.receiver = self;
  v7.super_class = (Class)BWFigCaptureISPProcessingSession;
  v5 = -[BWFigCaptureISPProcessingSession init](&v7, sel_init);
  v3 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v5->_cachedProperties = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3->_session = (OpaqueFigCaptureISPProcessingSession *)CFRetain(a3);
    v3->_supportedProperties = (NSDictionary *)-[BWFigCaptureISPProcessingSession copyProperty:error:](v3, "copyProperty:error:", CFSTR("SupportedPropertiesDictionary"), &v8);
    if (v8)
    {
      fig_log_get_emitter();
      FigDebugAssert3();
LABEL_6:

      return 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  OpaqueFigCaptureISPProcessingSession *session;
  objc_super v4;

  -[BWFigCaptureISPProcessingSession invalidate](self, "invalidate");
  session = self->_session;
  if (session)
    CFRelease(session);

  v4.receiver = self;
  v4.super_class = (Class)BWFigCaptureISPProcessingSession;
  -[BWFigCaptureISPProcessingSession dealloc](&v4, sel_dealloc);
}

- (NSDictionary)supportedProperties
{
  return self->_supportedProperties;
}

- (OpaqueFigCaptureISPProcessingSession)figCaptureISPProcessingSession
{
  return self->_session;
}

- (int)setProperty:(__CFString *)a3 value:(id)a4
{
  os_unfair_lock_s *p_lock;
  int v8;
  OpaqueFigCaptureISPProcessingSession *session;
  uint64_t (*v10)(OpaqueFigCaptureISPProcessingSession *, __CFString *, id);

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    v8 = -12785;
    goto LABEL_10;
  }
  if ((objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedProperties, "objectForKeyedSubscript:", a3), "isEqual:", a4) & 1) != 0)
  {
LABEL_4:
    v8 = 0;
    goto LABEL_10;
  }
  session = self->_session;
  v10 = *(uint64_t (**)(OpaqueFigCaptureISPProcessingSession *, __CFString *, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                           + 56);
  if (!v10)
  {
    v8 = -12782;
    goto LABEL_10;
  }
  v8 = v10(session, a3, a4);
  if (!v8)
  {
    if (objc_msgSend((id)sCacheableProperties_0, "containsObject:", a3))
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedProperties, "setObject:forKeyedSubscript:", a4, a3);
    goto LABEL_4;
  }
LABEL_10:
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)copyProperty:(__CFString *)a3 error:(int *)a4
{
  os_unfair_lock_s *p_lock;
  int v8;
  OpaqueFigCaptureISPProcessingSession *session;
  uint64_t (*v11)(OpaqueFigCaptureISPProcessingSession *, __CFString *, _QWORD, id *);
  id v12;

  v12 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    v8 = -12785;
    goto LABEL_5;
  }
  v12 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_cachedProperties, "objectForKeyedSubscript:", a3);
  if (v12)
    goto LABEL_4;
  session = self->_session;
  v11 = *(uint64_t (**)(OpaqueFigCaptureISPProcessingSession *, __CFString *, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v11)
  {
    v8 = v11(session, a3, *MEMORY[0x1E0C9AE00], &v12);
    if (!v8)
    {
      if (objc_msgSend((id)sCacheableProperties_0, "containsObject:", a3))
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cachedProperties, "setObject:forKeyedSubscript:", v12, a3);
LABEL_4:
      v8 = 0;
    }
  }
  else
  {
    v8 = -12782;
  }
LABEL_5:
  os_unfair_lock_unlock(p_lock);
  if (a4)
    *a4 = v8;
  return v12;
}

- (id)getProperty:(__CFString *)a3 error:(int *)a4
{
  return -[BWFigCaptureISPProcessingSession copyProperty:error:](self, "copyProperty:error:", a3, a4);
}

- (int)prepareWithHandler:(id)a3
{
  os_unfair_lock_s *p_lock;
  int v6;
  OpaqueFigCaptureISPProcessingSession *session;
  uint64_t (*v8)(OpaqueFigCaptureISPProcessingSession *, id);

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    v6 = -12785;
  }
  else
  {
    session = self->_session;
    v8 = *(uint64_t (**)(OpaqueFigCaptureISPProcessingSession *, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                              + 8);
    if (v8)
      v6 = v8(session, a3);
    else
      v6 = -12782;
  }
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (int)processBuffer:(__CVBuffer *)a3 refCon:(void *)a4 outputDescriptors:(id *)a5 numOutputDescriptors:(int)a6 parameters:(id)a7
{
  uint64_t v8;
  os_unfair_lock_s *p_lock;
  int v14;
  OpaqueFigCaptureISPProcessingSession *session;
  uint64_t (*v16)(OpaqueFigCaptureISPProcessingSession *, void *, __CVBuffer *, uint64_t, $9E4E0039428142913583DCEF048FEFF1 *, id);

  v8 = *(_QWORD *)&a6;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    v14 = -12785;
  }
  else
  {
    session = self->_session;
    v16 = *(uint64_t (**)(OpaqueFigCaptureISPProcessingSession *, void *, __CVBuffer *, uint64_t, $9E4E0039428142913583DCEF048FEFF1 *, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
    if (v16)
      v14 = v16(session, a4, a3, v8, a5, a7);
    else
      v14 = -12782;
  }
  os_unfair_lock_unlock(p_lock);
  return v14;
}

- (int)flush
{
  os_unfair_lock_s *p_lock;
  int v4;
  OpaqueFigCaptureISPProcessingSession *session;
  uint64_t (*v6)(OpaqueFigCaptureISPProcessingSession *);

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    v4 = -12785;
  }
  else
  {
    session = self->_session;
    v6 = *(uint64_t (**)(OpaqueFigCaptureISPProcessingSession *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                          + 24);
    if (v6)
      v4 = v6(session);
    else
      v4 = -12782;
  }
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (int)invalidate
{
  os_unfair_lock_s *p_lock;
  int v4;
  OpaqueFigCaptureISPProcessingSession *session;
  uint64_t (*v6)(OpaqueFigCaptureISPProcessingSession *);

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_invalidated)
  {
    os_unfair_lock_unlock(p_lock);
    return 0;
  }
  else
  {
    session = self->_session;
    if (session)
    {
      v6 = *(uint64_t (**)(OpaqueFigCaptureISPProcessingSession *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                            + 24);
      if (v6)
        v4 = v6(session);
      else
        v4 = -12782;
    }
    else
    {
      v4 = -12780;
    }
    self->_invalidated = 1;
    os_unfair_lock_unlock(p_lock);
    -[BWFigCaptureISPProcessingSessionDelegate processingSessionHasBeenInvalidated:](self->_delegate, "processingSessionHasBeenInvalidated:", self);
  }
  return v4;
}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_invalidated)
    self->_delegate = (BWFigCaptureISPProcessingSessionDelegate *)a3;
  os_unfair_lock_unlock(p_lock);
}

- (BWFigCaptureISPProcessingSessionDelegate)delegate
{
  return self->_delegate;
}

@end
