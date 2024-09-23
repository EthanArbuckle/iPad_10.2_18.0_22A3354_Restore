@implementation CBDisplayStateClient

- (CBDisplayStateClient)init
{
  BrightnessSystemClientInternal *v2;
  dispatch_queue_t v3;
  os_log_t v4;
  objc_super v6;
  SEL v7;
  CBDisplayStateClient *v8;

  v8 = self;
  v7 = a2;
  v6.receiver = self;
  v6.super_class = (Class)CBDisplayStateClient;
  v8 = -[CBDisplayStateClient init](&v6, sel_init);
  if (v8)
  {
    v2 = objc_alloc_init(BrightnessSystemClientInternal);
    v8->_bsci = v2;
    v3 = dispatch_queue_create("CB - DisplayStateClient", 0);
    v8->_queue = (OS_dispatch_queue *)v3;
    v4 = os_log_create("com.apple.CoreBrightness.DisplayStateClient", "Default");
    v8->_logHandle = (OS_os_log *)v4;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  CBDisplayStateClient *v4;

  v4 = self;
  v3 = a2;

  if (v4->_queue)
    dispatch_release((dispatch_object_t)v4->_queue);
  if (v4->_logHandle)

  v2.receiver = v4;
  v2.super_class = (Class)CBDisplayStateClient;
  -[CBDisplayStateClient dealloc](&v2, sel_dealloc);
}

- (void)activate
{
  NSObject *queue;
  uint64_t block;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  CBDisplayStateClient *v8;
  SEL v9;
  CBDisplayStateClient *v10;

  v10 = self;
  v9 = a2;
  queue = self->_queue;
  block = MEMORY[0x1E0C809B0];
  v4 = -1073741824;
  v5 = 0;
  v6 = __32__CBDisplayStateClient_activate__block_invoke;
  v7 = &unk_1E68E9E60;
  v8 = v10;
  dispatch_sync(queue, &block);
}

uint64_t __32__CBDisplayStateClient_activate__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t, void *, void *);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = a1;
  v10 = a1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __32__CBDisplayStateClient_activate__block_invoke_2;
  v8 = &unk_1E68E9F38;
  v9 = *(_QWORD *)(a1 + 32);
  return objc_msgSend(v2, "registerNotificationBlock:", &v4);
}

void __32__CBDisplayStateClient_activate__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t block;
  int v8;
  int v9;
  void (*v10)(id *);
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;

  v18 = a1;
  v17 = a2;
  v16 = a3;
  v15 = a1;
  v3 = a2;
  v4 = v16;
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block = MEMORY[0x1E0C809B0];
  v8 = -1073741824;
  v9 = 0;
  v10 = __32__CBDisplayStateClient_activate__block_invoke_3;
  v11 = &unk_1E68EA150;
  v12 = v17;
  v13 = v16;
  v14 = *(_QWORD *)(a1 + 32);
  dispatch_async(v5, &block);
}

void __32__CBDisplayStateClient_activate__block_invoke_3(id *a1)
{
  uint64_t v1;
  NSObject *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1[4], "isEqual:", CFSTR("DisplayModeChangeComplete")) & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1[6], "_displayModeChangeCompletionHandler:", objc_msgSend(a1[5], "integerValue"));
    }
    else
    {
      v3 = *((_QWORD *)a1[6] + 2);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      {
        v1 = objc_opt_class();
        __os_log_helper_16_2_1_8_64((uint64_t)v4, v1);
        _os_log_fault_impl(&dword_1B5291000, v3, OS_LOG_TYPE_FAULT, "unexpected display mode payload type (%@)", v4, 0xCu);
      }
    }
  }

}

- (void)cancel
{
  NSObject *queue;
  uint64_t block;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  CBDisplayStateClient *v8;
  SEL v9;
  CBDisplayStateClient *v10;

  v10 = self;
  v9 = a2;
  queue = self->_queue;
  block = MEMORY[0x1E0C809B0];
  v4 = -1073741824;
  v5 = 0;
  v6 = __30__CBDisplayStateClient_cancel__block_invoke;
  v7 = &unk_1E68E9E60;
  v8 = v10;
  dispatch_sync(queue, &block);
}

uint64_t __30__CBDisplayStateClient_cancel__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "registerNotificationBlock:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_removeCompletionDelegate");
  result = a1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  return result;
}

- (void)setCompletionDelegate:(id)a3
{
  NSObject *queue;
  uint64_t block;
  int v5;
  int v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  CBDisplayStateClient *v9;
  id v10;
  id v11;
  SEL v12;
  CBDisplayStateClient *v13;

  v13 = self;
  v12 = a2;
  v11 = a3;
  queue = self->_queue;
  block = MEMORY[0x1E0C809B0];
  v5 = -1073741824;
  v6 = 0;
  v7 = __46__CBDisplayStateClient_setCompletionDelegate___block_invoke;
  v8 = &unk_1E68EA540;
  v9 = v13;
  v10 = a3;
  dispatch_sync(queue, &block);
}

uint64_t __46__CBDisplayStateClient_setCompletionDelegate___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_removeCompletionDelegate");
  result = a1;
  if (*(_QWORD *)(a1 + 40))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = *(id *)(a1 + 40);
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addPropertyForNotification:", CFSTR("DisplayModeChangeComplete"));
  }
  return result;
}

- (void)_removeCompletionDelegate
{

  self->_completionDelegate = 0;
  -[BrightnessSystemClientInternal removePropertyFromNotification:](self->_bsci, "removePropertyFromNotification:", CFSTR("DisplayModeChangeComplete"));
}

- (void)_displayModeChangeCompletionHandler:(int64_t)a3
{
  NSObject *v3;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t block;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  CBDisplayStateClientDelegate *v11;
  uint64_t v12;
  CBDisplayStateClientDelegate *v13;
  os_signpost_id_t v14;
  os_signpost_type_t v15;
  os_log_t v16;
  uint64_t v17;
  SEL v18;
  CBDisplayStateClient *v19;
  uint8_t v20[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v19 = self;
  v18 = a2;
  v17 = a3;
  v16 = 0;
  if (self->_logHandle)
  {
    logHandle = v19->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v16 = logHandle;
  v15 = OS_SIGNPOST_EVENT;
  v14 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(logHandle))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v20, v17);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, v16, v15, v14, "DisplayModeClientCompletionHandler", "mode: %ld", v20, 0xCu);
  }
  if (-[CBDisplayStateClientDelegate delegateQueue](v19->_completionDelegate, "delegateQueue"))
  {
    v13 = 0;
    v13 = v19->_completionDelegate;
    v3 = -[CBDisplayStateClientDelegate delegateQueue](v19->_completionDelegate, "delegateQueue");
    block = MEMORY[0x1E0C809B0];
    v7 = -1073741824;
    v8 = 0;
    v9 = __60__CBDisplayStateClient__displayModeChangeCompletionHandler___block_invoke;
    v10 = &unk_1E68EA3D8;
    v11 = v13;
    v12 = v17;
    dispatch_async(v3, &block);
  }
}

void __60__CBDisplayStateClient__displayModeChangeCompletionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didCompleteTransitionToDisplayMode:withError:", *(_QWORD *)(a1 + 40), 0);

}

- (BOOL)supported
{
  uint64_t v3;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  CBDisplayStateClient *v8;
  SEL v9;
  CBDisplayStateClient *v10;
  uint64_t *v11;
  dispatch_once_t *v12;

  v10 = self;
  v9 = a2;
  v3 = MEMORY[0x1E0C809B0];
  v4 = -1073741824;
  v5 = 0;
  v6 = __33__CBDisplayStateClient_supported__block_invoke;
  v7 = &unk_1E68E9E60;
  v8 = self;
  v12 = &supported_onceToken;
  v11 = &v3;
  if (supported_onceToken != -1)
    dispatch_once(v12, v11);
  return v10->_supported;
}

void __33__CBDisplayStateClient_supported__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t block;
  int v4;
  int v5;
  void (*v6)(uint64_t);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v10 = a1;
  v9 = a1;
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  block = MEMORY[0x1E0C809B0];
  v4 = -1073741824;
  v5 = 0;
  v6 = __33__CBDisplayStateClient_supported__block_invoke_2;
  v7 = &unk_1E68E9E60;
  v8 = *(_QWORD *)(a1 + 32);
  dispatch_sync(v2, &block);
}

void __33__CBDisplayStateClient_supported__block_invoke_2(uint64_t a1)
{
  id v2;

  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) & 1) != 0)
  {
    v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copyPropertyForKey:", CFSTR("DisplayStateControlSupported"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 33) = objc_msgSend(v2, "BOOLValue") & 1;

  }
}

- (int64_t)displayMode
{
  NSObject *queue;
  int64_t v4;
  uint64_t block;
  int v6;
  int v7;
  void (*v8)(uint64_t);
  void *v9;
  CBDisplayStateClient *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  int v14;
  int v15;
  uint64_t v16;
  SEL v17;
  CBDisplayStateClient *v18;

  v18 = self;
  v17 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x20000000;
  v15 = 32;
  v16 = 5;
  queue = self->_queue;
  block = MEMORY[0x1E0C809B0];
  v6 = -1073741824;
  v7 = 0;
  v8 = __35__CBDisplayStateClient_displayMode__block_invoke;
  v9 = &unk_1E68EABC8;
  v10 = v18;
  v11 = &v12;
  dispatch_sync(queue, &block);
  v4 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v4;
}

void __35__CBDisplayStateClient_displayMode__block_invoke(uint64_t a1)
{
  id v2;

  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) & 1) != 0)
  {
    v2 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "copyPropertyForKey:", CFSTR("DisplayMode"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (int)objc_msgSend(v2, "intValue");

  }
}

- (BOOL)transitionToDisplayMode:(int64_t)a3 withDuration:(double)a4 error:(id *)a5
{
  NSObject *queue;
  uint64_t v6;
  char v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t inited;
  NSObject *logHandle;
  uint64_t block;
  int v18;
  int v19;
  void (*v20)(uint64_t);
  void *v21;
  CBDisplayStateClient *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t *v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  int v34;
  int v35;
  char v36;
  os_signpost_id_t v37;
  os_signpost_type_t v38;
  os_log_t v39;
  os_log_type_t v40;
  os_log_t v41;
  id *v42;
  double v43;
  uint64_t v44;
  SEL v45;
  CBDisplayStateClient *v46;
  uint8_t v47[16];
  uint8_t v48[16];
  uint8_t v49[24];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v46 = self;
  v45 = a2;
  v44 = a3;
  v43 = a4;
  v42 = a5;
  v41 = 0;
  if (self->_logHandle)
  {
    logHandle = v46->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    logHandle = inited;
  }
  v41 = logHandle;
  v40 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(logHandle, OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v49, v44);
    _os_log_impl(&dword_1B5291000, v41, v40, "[Display Mode] Client request transition to display mode %ld", v49, 0xCu);
  }
  v39 = 0;
  if (v46->_logHandle)
  {
    v14 = v46->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v13 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v13 = init_default_corebrightness_log();
    v14 = v13;
  }
  v39 = v14;
  v38 = OS_SIGNPOST_INTERVAL_BEGIN;
  v37 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(v14))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v48, v44);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, v39, v38, v37, "DisplayModeClientTransitionToDisplayMode", "%ld", v48, 0xCu);
  }
  v32 = 0;
  v33 = &v32;
  v34 = 0x20000000;
  v35 = 32;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x20000000;
  v30 = 32;
  v31 = 0;
  queue = v46->_queue;
  block = MEMORY[0x1E0C809B0];
  v18 = -1073741824;
  v19 = 0;
  v20 = __67__CBDisplayStateClient_transitionToDisplayMode_withDuration_error___block_invoke;
  v21 = &unk_1E68EBCA0;
  v22 = v46;
  v25 = v44;
  v26 = v43;
  v23 = &v32;
  v24 = &v27;
  dispatch_sync(queue, &block);
  if (v42 && v28[3])
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", CBClientErrorDomain);
    v6 = objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, v28[3], 0);
    *v42 = (id)v6;
  }
  if (v46->_logHandle)
  {
    v10 = v46->_logHandle;
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v9 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v9 = init_default_corebrightness_log();
    v10 = v9;
  }
  if (os_signpost_enabled(v10))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v47, v44);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DisplayModeClientTransitionToDisplayMode", "%ld", v47, 0xCu);
  }
  v8 = *((_BYTE *)v33 + 24);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v32, 8);
  return v8 & 1;
}

void __67__CBDisplayStateClient_transitionToDisplayMode_withDuration_error___block_invoke(uint64_t a1)
{
  void *context;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1B5E4A8B0]();
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) & 1) != 0)
  {
    v3[0] = CFSTR("Value");
    v4[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 56));
    v3[1] = CFSTR("TransitionLength");
    v4[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setSyncProperty:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2), CFSTR("DisplayMode")) & 1;
    if ((*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) & 1) == 0)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 2;
  }
  objc_autoreleasePoolPop(context);
}

- (BOOL)switchToFlipbookState:(int64_t)a3 error:(id *)a4
{
  NSObject *queue;
  uint64_t block;
  int v7;
  int v8;
  void (*v9)(_QWORD *);
  void *v10;
  CBDisplayStateClient *v11;
  _QWORD *v12;
  int64_t v13;
  _QWORD v14[2];
  int v15;
  int v16;
  uint64_t v17;
  id *v18;
  int64_t v19;
  SEL v20;
  CBDisplayStateClient *v21;

  v21 = self;
  v20 = a2;
  v19 = a3;
  v18 = a4;
  v14[0] = 0;
  v14[1] = v14;
  v15 = 0x20000000;
  v16 = 32;
  v17 = 0;
  queue = self->_queue;
  block = MEMORY[0x1E0C809B0];
  v7 = -1073741824;
  v8 = 0;
  v9 = __52__CBDisplayStateClient_switchToFlipbookState_error___block_invoke;
  v10 = &unk_1E68EA658;
  v11 = v21;
  v13 = a3;
  v12 = v14;
  dispatch_sync(queue, &block);
  _Block_object_dispose(v14, 8);
  return 1;
}

void __52__CBDisplayStateClient_switchToFlipbookState_error___block_invoke(_QWORD *a1)
{
  NSObject *v1;
  uint64_t v2;
  NSObject *v3;
  void *context;
  uint64_t inited;
  NSObject *v6;
  uint64_t block;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  char v17;
  os_signpost_id_t v18;
  os_signpost_type_t v19;
  os_log_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint8_t v23[16];
  uint8_t v24[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v22 = a1;
  v21 = a1;
  v20 = 0;
  if (*(_QWORD *)(a1[4] + 16))
  {
    v6 = *(NSObject **)(a1[4] + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      inited = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      inited = init_default_corebrightness_log();
    v6 = inited;
  }
  v20 = v6;
  v19 = OS_SIGNPOST_INTERVAL_BEGIN;
  v18 = 0xEEEEB0B5B2B2EEEELL;
  if (os_signpost_enabled(v6))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v24, a1[6]);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, v20, v19, v18, "DisplayStateClientSwitchToFlipbookState", "%ld", v24, 0xCu);
  }
  context = (void *)MEMORY[0x1B5E4A8B0]();
  if ((*(_BYTE *)(a1[4] + 32) & 1) != 0)
  {
    v17 = 0;
    v17 = objc_msgSend(*(id *)(a1[4] + 8), "setSyncProperty:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]), CFSTR("FlipBookState")) & 1;
    if (!v17)
      *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = 2;
  }
  if (objc_msgSend(*(id *)(a1[4] + 40), "delegateQueue"))
  {
    v16 = 0;
    v16 = *(id *)(a1[4] + 40);
    v1 = objc_msgSend(*(id *)(a1[4] + 40), "delegateQueue");
    block = MEMORY[0x1E0C809B0];
    v9 = -1073741824;
    v10 = 0;
    v11 = __52__CBDisplayStateClient_switchToFlipbookState_error___block_invoke_22;
    v12 = &unk_1E68EA6A8;
    v14 = a1[5];
    v13 = v16;
    v15 = a1[6];
    dispatch_async(v1, &block);
  }
  objc_autoreleasePoolPop(context);
  if (*(_QWORD *)(a1[4] + 16))
  {
    v3 = *(NSObject **)(a1[4] + 16);
  }
  else
  {
    if (_COREBRIGHTNESS_LOG_DEFAULT)
      v2 = _COREBRIGHTNESS_LOG_DEFAULT;
    else
      v2 = init_default_corebrightness_log();
    v3 = v2;
  }
  if (os_signpost_enabled(v3))
  {
    __os_log_helper_16_0_1_8_0((uint64_t)v23, a1[6]);
    _os_signpost_emit_with_name_impl(&dword_1B5291000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "DisplayStateClientSwitchToFlipbookState", "%ld", v23, 0xCu);
  }
}

void __52__CBDisplayStateClient_switchToFlipbookState_error___block_invoke_22(uint64_t a1)
{
  void *context;
  uint64_t v3;

  context = (void *)MEMORY[0x1B5E4A8B0]();
  v3 = 0;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", CBClientErrorDomain), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), 0);
  objc_msgSend(*(id *)(a1 + 32), "didCompleteSwitchToFlipbookState:withError:", *(_QWORD *)(a1 + 48), v3);

  objc_autoreleasePoolPop(context);
}

- (CBDisplayStateClientDelegate)completionDelegate
{
  return self->_completionDelegate;
}

@end
