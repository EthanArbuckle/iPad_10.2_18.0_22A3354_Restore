@implementation CBFrameLink

- (void)frameSync:(id)a3
{
  NSObject *queue;
  NSObject *v4;
  NSObject *log;
  os_signpost_type_t type;
  os_signpost_id_t spid;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(uint64_t);
  void *v14;
  CBFrameLink *v15;
  uint64_t block;
  int v17;
  int v18;
  void (*v19)(uint64_t);
  void *v20;
  CBFrameLink *v21;
  uint8_t v22[16];
  unint64_t v23;
  os_signpost_type_t v24;
  NSObject *v25;
  id v26;
  SEL v27;
  CBFrameLink *v28;

  v28 = self;
  v27 = a2;
  v26 = a3;
  v25 = 0;
  if (self->_logHandle)
  {
    logHandle = v28->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v25 = logHandle;
  v24 = OS_SIGNPOST_EVENT;
  v23 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(logHandle))
  {
    log = v25;
    type = v24;
    spid = v23;
    __os_log_helper_16_0_0(v22);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, log, type, spid, "FrameSync", (const char *)&unk_1B546AB41, v22, 2u);
  }
  if (v28->_fadeCallbackBlock)
  {
    queue = v28->_queue;
    block = MEMORY[0x1E0C809B0];
    v17 = -1073741824;
    v18 = 0;
    v19 = __25__CBFrameLink_frameSync___block_invoke;
    v20 = &unk_1E68E9E60;
    v21 = v28;
    dispatch_async(queue, &block);
  }
  if (v28->_frameNotificationBlock)
  {
    v4 = v28->_queue;
    v10 = MEMORY[0x1E0C809B0];
    v11 = -1073741824;
    v12 = 0;
    v13 = __25__CBFrameLink_frameSync___block_invoke_22;
    v14 = &unk_1E68E9E60;
    v15 = v28;
    dispatch_async(v4, &v10);
  }
}

void __25__CBFrameLink_frameSync___block_invoke(uint64_t a1)
{
  NSObject *v1;
  os_signpost_type_t v2;
  os_signpost_id_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *log;
  os_signpost_type_t type;
  os_signpost_id_t spid;
  uint64_t inited;
  NSObject *v10;
  uint8_t v12[8];
  unint64_t v13;
  char v14;
  NSObject *v15;
  uint8_t v16[8];
  unint64_t v17;
  char v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;

  v21 = a1;
  v20 = a1;
  v19 = 0;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v10 = inited;
  }
  v19 = v10;
  v18 = 1;
  v17 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(v10))
  {
    log = v19;
    type = v18;
    spid = v17;
    __os_log_helper_16_0_0(v16);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, log, type, spid, "FrameSyncFadeCallbackBlock", (const char *)&unk_1B546AB41, v16, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();
  v15 = 0;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v4 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v4 = init_default_corebrightness_log();
    v5 = v4;
  }
  v15 = v5;
  v14 = 2;
  v13 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(v5))
  {
    v1 = v15;
    v2 = v14;
    v3 = v13;
    __os_log_helper_16_0_0(v12);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, v1, v2, v3, "FrameSyncFadeCallbackBlock", (const char *)&unk_1B546AB41, v12, 2u);
  }
}

void __40__CBFrameLink_initWithDisplay_andQueue___block_invoke(uint64_t a1)
{
  __DisplayFadeCallback(*(_BYTE **)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)setPreferredFramesPerSecond:(float)a3
{
  -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", (uint64_t)a3);
}

- (void)resume
{
  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 0, a2, self);
}

- (BOOL)isPaused
{
  return -[CADisplayLink isPaused](self->_displayLink, "isPaused", a2, self);
}

- (CBFrameLink)init
{
  os_log_t v2;
  uint64_t v3;
  CBSharedFrameLinkRunLoop *v4;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *logHandle;
  uint8_t v14[7];
  char v15;
  NSObject *v16;
  uint8_t v17[15];
  char v18;
  NSObject *v19;
  objc_super v20;
  SEL v21;
  CBFrameLink *v22;

  v22 = self;
  v21 = a2;
  v20.receiver = self;
  v20.super_class = (Class)CBFrameLink;
  v22 = -[CBFrameLink init](&v20, sel_init);
  if (v22)
  {
    v2 = os_log_create("com.apple.CoreBrightness.FrameLink", "default");
    v22->_logHandle = (OS_os_log *)v2;
    v3 = objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", v22, sel_frameSync_);
    v22->_displayLink = (CADisplayLink *)v3;
    if (!v22->_displayLink)
    {
      v19 = 0;
      if (v22->_logHandle)
      {
        logHandle = v22->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        logHandle = inited;
      }
      v19 = logHandle;
      v18 = 16;
      if (os_log_type_enabled(logHandle, OS_LOG_TYPE_ERROR))
      {
        log = v19;
        type = v18;
        __os_log_helper_16_0_0(v17);
        _os_log_error_impl(&dword_1B5291000, log, type, "Cannot create CBFrameLink without CADisplayLink", v17, 2u);
      }
LABEL_23:

      v22 = 0;
      return 0;
    }
    -[CADisplayLink setPaused:](v22->_displayLink, "setPaused:", 1);
    v4 = +[CBSharedFrameLinkRunLoop addDisplayLinkToRunLoop:forMode:](CBSharedFrameLinkRunLoop, "addDisplayLinkToRunLoop:forMode:", v22->_displayLink, *MEMORY[0x1E0C99748]);
    v22->_runLoopRef = v4;
    if (!v22->_runLoopRef)
    {
      v16 = 0;
      if (v22->_logHandle)
      {
        v9 = v22->_logHandle;
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v8 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v8 = init_default_corebrightness_log();
        v9 = v8;
      }
      v16 = v9;
      v15 = 16;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v6 = v16;
        v7 = v15;
        __os_log_helper_16_0_0(v14);
        _os_log_error_impl(&dword_1B5291000, v6, v7, "Failed to add CADisplayLink to shared runloop", v14, 2u);
      }
      goto LABEL_23;
    }
  }
  return v22;
}

- (CBFrameLink)initWithDisplay:(__Display *)a3 andQueue:(id)a4
{
  os_log_t v4;
  dispatch_block_t v5;
  uint64_t v6;
  id v7;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *log;
  os_log_type_t type;
  uint64_t inited;
  NSObject *v28;
  uint8_t v29[7];
  char v30;
  NSObject *v31;
  uint8_t v32[7];
  char v33;
  NSObject *v34;
  uint8_t v35[15];
  char v36;
  NSObject *v37;
  uint64_t block;
  int v39;
  int v40;
  void (*v41)(uint64_t);
  void *v42;
  id v43;
  uint8_t v44[7];
  char v45;
  NSObject *v46;
  uint8_t v47[15];
  char v48;
  NSObject *v49;
  objc_super v50;
  id v51;
  __Display *v52;
  SEL v53;
  id v54;

  v54 = self;
  v53 = a2;
  v52 = a3;
  v51 = a4;
  v50.receiver = self;
  v50.super_class = (Class)CBFrameLink;
  v54 = -[CBFrameLink init](&v50, sel_init);
  if (v54)
  {
    v4 = os_log_create("com.apple.CoreBrightness.FrameLink", "default");
    *((_QWORD *)v54 + 1) = v4;
    if (!v52)
    {
      v49 = 0;
      if (*((_QWORD *)v54 + 1))
      {
        v28 = *((_QWORD *)v54 + 1);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          inited = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          inited = init_default_corebrightness_log();
        v28 = inited;
      }
      v49 = v28;
      v48 = 16;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        log = v49;
        type = v48;
        __os_log_helper_16_0_0(v47);
        _os_log_error_impl(&dword_1B5291000, log, type, "Cannot create CBFrameLink without Display", v47, 2u);
      }
LABEL_53:

      v54 = 0;
      return 0;
    }
    *((_QWORD *)v54 + 2) = v52;
    if (!v51)
    {
      v46 = 0;
      if (*((_QWORD *)v54 + 1))
      {
        v24 = *((_QWORD *)v54 + 1);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v23 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v23 = init_default_corebrightness_log();
        v24 = v23;
      }
      v46 = v24;
      v45 = 16;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v21 = v46;
        v22 = v45;
        __os_log_helper_16_0_0(v44);
        _os_log_error_impl(&dword_1B5291000, v21, v22, "Cannot create CBFrameLink without a queue", v44, 2u);
      }
      goto LABEL_53;
    }
    *((_QWORD *)v54 + 3) = v51;
    dispatch_retain(*((dispatch_object_t *)v54 + 3));
    block = MEMORY[0x1E0C809B0];
    v39 = -1073741824;
    v40 = 0;
    v41 = __40__CBFrameLink_initWithDisplay_andQueue___block_invoke;
    v42 = &unk_1E68E9E60;
    v43 = v54;
    v5 = dispatch_block_create_with_qos_class((dispatch_block_flags_t)0, QOS_CLASS_USER_INTERACTIVE, 0, &block);
    *((_QWORD *)v54 + 4) = v5;
    if (!*((_QWORD *)v54 + 4))
    {
      v37 = 0;
      if (*((_QWORD *)v54 + 1))
      {
        v20 = *((_QWORD *)v54 + 1);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v19 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v19 = init_default_corebrightness_log();
        v20 = v19;
      }
      v37 = v20;
      v36 = 16;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v17 = v37;
        v18 = v36;
        __os_log_helper_16_0_0(v35);
        _os_log_error_impl(&dword_1B5291000, v17, v18, "Cannot create CBFrameLink without high QOS dispatch block", v35, 2u);
      }
      goto LABEL_53;
    }
    v6 = objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", v54, sel_frameSync_);
    *((_QWORD *)v54 + 5) = v6;
    if (!*((_QWORD *)v54 + 5))
    {
      v34 = 0;
      if (*((_QWORD *)v54 + 1))
      {
        v16 = *((_QWORD *)v54 + 1);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v15 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v15 = init_default_corebrightness_log();
        v16 = v15;
      }
      v34 = v16;
      v33 = 16;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v13 = v34;
        v14 = v33;
        __os_log_helper_16_0_0(v32);
        _os_log_error_impl(&dword_1B5291000, v13, v14, "Cannot create CBFrameLink without CADisplayLink", v32, 2u);
      }
      goto LABEL_53;
    }
    objc_msgSend(*((id *)v54 + 5), "setPaused:", 1);
    v7 = +[CBSharedFrameLinkRunLoop addDisplayLinkToRunLoop:forMode:](CBSharedFrameLinkRunLoop, "addDisplayLinkToRunLoop:forMode:", *((_QWORD *)v54 + 5), *MEMORY[0x1E0C99748]);
    *((_QWORD *)v54 + 7) = v7;
    if (!*((_QWORD *)v54 + 7))
    {
      v31 = 0;
      if (*((_QWORD *)v54 + 1))
      {
        v12 = *((_QWORD *)v54 + 1);
      }
      else
      {
        if (_COREBRIGHTNESS_LOG_DEFAULT)
          v11 = _COREBRIGHTNESS_LOG_DEFAULT;
        else
          v11 = init_default_corebrightness_log();
        v12 = v11;
      }
      v31 = v12;
      v30 = 16;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v9 = v31;
        v10 = v30;
        __os_log_helper_16_0_0(v29);
        _os_log_error_impl(&dword_1B5291000, v9, v10, "Failed to add CADisplayLink to shared runloop", v29, 2u);
      }
      goto LABEL_53;
    }
  }
  return (CBFrameLink *)v54;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBFrameLink *v4;

  v4 = self;
  v3 = a2;
  if (self->_runLoopRef)
  {

    v4->_runLoopRef = 0;
  }
  if (v4->_displayLink)
  {
    -[CADisplayLink invalidate](v4->_displayLink, "invalidate");
    v4->_displayLink = 0;
  }
  if (v4->_logHandle)

  if (v4->_queue)
    dispatch_release((dispatch_object_t)v4->_queue);
  if (v4->_fadeCallbackBlock)
    _Block_release(v4->_fadeCallbackBlock);
  if (v4->_frameNotificationBlock)
  {
    _Block_release(v4->_frameNotificationBlock);
    v4->_frameNotificationBlock = 0;
  }
  v2.receiver = v4;
  v2.super_class = (Class)CBFrameLink;
  -[CBFrameLink dealloc](&v2, sel_dealloc);
}

- (void)scheduleWithDispatchQueue:(id)a3
{
  if (self->_queue)
  {
    dispatch_release((dispatch_object_t)self->_queue);
    self->_queue = 0;
  }
  if (a3)
  {
    self->_queue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)self->_queue);
  }
}

- (void)pause
{
  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 1, a2, self);
}

void __25__CBFrameLink_frameSync___block_invoke_22(uint64_t a1)
{
  NSObject *v1;
  os_signpost_type_t v2;
  os_signpost_id_t v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *log;
  os_signpost_type_t type;
  os_signpost_id_t spid;
  uint64_t inited;
  NSObject *v10;
  uint8_t v12[8];
  unint64_t v13;
  char v14;
  NSObject *v15;
  uint8_t v16[8];
  unint64_t v17;
  char v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;

  v21 = a1;
  v20 = a1;
  v19 = 0;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v10 = inited;
  }
  v19 = v10;
  v18 = 1;
  v17 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(v10))
  {
    log = v19;
    type = v18;
    spid = v17;
    __os_log_helper_16_0_0(v16);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, log, type, spid, "FrameSyncFrameNotificationBlock", (const char *)&unk_1B546AB41, v16, 2u);
  }
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16))();
  v15 = 0;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8))
  {
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v4 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v4 = init_default_corebrightness_log();
    v5 = v4;
  }
  v15 = v5;
  v14 = 2;
  v13 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(v5))
  {
    v1 = v15;
    v2 = v14;
    v3 = v13;
    __os_log_helper_16_0_0(v12);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, v1, v2, v3, "FrameSyncFrameNotificationBlock", (const char *)&unk_1B546AB41, v12, 2u);
  }
}

- (void)invalidate
{
  -[CADisplayLink invalidate](self->_displayLink, "invalidate", a2, self);
}

- (void)setFrameNotificationBlock:(id)a3
{
  if (self->_frameNotificationBlock)
  {
    _Block_release(self->_frameNotificationBlock);
    self->_frameNotificationBlock = 0;
  }
  if (a3)
    self->_frameNotificationBlock = _Block_copy(a3);
}

- (double)targetTimestamp
{
  double result;

  -[CADisplayLink targetTimestamp](self->_displayLink, "targetTimestamp", a2, self);
  return result;
}

@end
