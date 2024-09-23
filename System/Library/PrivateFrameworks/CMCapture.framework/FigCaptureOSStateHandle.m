@implementation FigCaptureOSStateHandle

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (id)_initWithTitle:(id)a3 queue:(id)a4 dataProvider:(id)a5 dataProviderBlock:(id)a6
{
  FigCaptureOSStateHandle *v10;
  NSObject *v11;
  FigWeakReference *v12;
  uint64_t v13;
  objc_super v15;

  if (!((unint64_t)a5 | (unint64_t)a6))
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("A data provider or data provider block is required to create a FigCaptureOSStateHandle."), 0));
  }
  v15.receiver = self;
  v15.super_class = (Class)FigCaptureOSStateHandle;
  v10 = -[FigCaptureOSStateHandle init](&v15, sel_init);
  if (v10)
  {
    v10->_title = (NSString *)a3;
    if (a4)
      v11 = a4;
    else
      v11 = dispatch_get_global_queue(0, 0);
    v10->_queue = (OS_dispatch_queue *)v11;
    if (a5)
    {
      v12 = -[FigWeakReference initWithReferencedObject:]([FigWeakReference alloc], "initWithReferencedObject:", a5);
      v13 = 24;
    }
    else
    {
      v12 = (FigWeakReference *)objc_msgSend(a6, "copy");
      v13 = 32;
    }
    *(Class *)((char *)&v10->super.isa + v13) = (Class)v12;
    v10->_osStateHandle = os_state_add_handler();
  }
  return v10;
}

uint64_t __79__FigCaptureOSStateHandle__initWithTitle_queue_dataProvider_dataProviderBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_osStateData:", a2);
}

- (FigCaptureOSStateHandle)initWithTitle:(id)a3 queue:(id)a4 dataProvider:(id)a5
{
  return (FigCaptureOSStateHandle *)-[FigCaptureOSStateHandle _initWithTitle:queue:dataProvider:dataProviderBlock:](self, "_initWithTitle:queue:dataProvider:dataProviderBlock:", a3, a4, a5, 0);
}

- (FigCaptureOSStateHandle)initWithTitle:(id)a3 queue:(id)a4 dataProviderBlock:(id)a5
{
  return (FigCaptureOSStateHandle *)-[FigCaptureOSStateHandle _initWithTitle:queue:dataProvider:dataProviderBlock:](self, "_initWithTitle:queue:dataProvider:dataProviderBlock:", a3, a4, 0, a5);
}

- (void)dealloc
{
  objc_super v3;

  os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureOSStateHandle;
  -[FigCaptureOSStateHandle dealloc](&v3, sel_dealloc);
}

- (id)debugDescription
{
  return self->_title;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[FigCaptureOSStateHandle debugDescription](self, "debugDescription"));
}

- (os_state_data_s)_osStateData:(os_state_hints_s *)a3
{
  uint64_t v3;
  uint64_t v6;
  FigWeakReference *dataProviderWeakReference;
  uint64_t v8;
  uint64_t v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  os_state_data_s *v15;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[25];

  v19[24] = *MEMORY[0x1E0C80C00];
  if (!_FigIsCurrentDispatchQueue())
  {
    v18 = v3;
    LODWORD(v17) = 0;
    FigDebugAssert3();
  }
  if (a3->var2 != 3)
    return 0;
  dataProviderWeakReference = self->_dataProviderWeakReference;
  if (dataProviderWeakReference)
    v8 = objc_msgSend(-[FigWeakReference referencedObject](dataProviderWeakReference, "referencedObject"), "osStatePropertyList");
  else
    v8 = (*((uint64_t (**)(id, uint64_t))self->_dataProviderBlock + 2))(self->_dataProviderBlock, v6);
  v9 = v8;
  if (dword_1EE6BE898)
  {
    LODWORD(v19[0]) = 0;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v19[0] = 0;
  v11 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v9, 100, 0, v19, v17, v18);
  if (v19[0])
  {
    v12 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    return 0;
  }
  v13 = v11;
  v14 = objc_msgSend(v11, "length");
  v15 = (os_state_data_s *)malloc_type_calloc(1uLL, v14 + 200, 0x2FA4A4A7uLL);
  -[NSString UTF8String](self->_title, "UTF8String");
  __strlcpy_chk();
  v15->var0 = 1;
  v15->var1.var1 = v14;
  objc_msgSend(v13, "getBytes:length:", v15->var4, v14);
  return v15;
}

@end
