@implementation CalFileSensor

- (CalFileSensor)init
{
  CalDoNotCallThisInitializer();
}

- (CalFileSensor)initWithPath:(id)a3 eventBlock:(id)a4
{
  id v7;
  id v8;
  void *v9;
  CalFileSensor *v10;
  CalFileSensor *v11;
  uint64_t v12;
  id eventBlock;
  id v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  id v18;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  if (!v7 || (v9 = v8, !objc_msgSend(v7, "length")))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("The 'path' parameter must be non-nil and non-empty"), 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  v19.receiver = self;
  v19.super_class = (Class)CalFileSensor;
  v10 = -[CalFileSensor init](&v19, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_path, a3);
    v12 = MEMORY[0x19400A168](v9);
    eventBlock = v11->_eventBlock;
    v11->_eventBlock = (id)v12;

    v11->_started = 0;
    CalGenerateRandomDispatchQueueName((__CFString *)v11->_path);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = dispatch_queue_create((const char *)objc_msgSend(v14, "UTF8String"), 0);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v15;

  }
  return v11;
}

- (void)dealloc
{
  NSObject *source;
  objc_super v4;

  source = self->_source;
  if (source)
    dispatch_source_cancel(source);
  v4.receiver = self;
  v4.super_class = (Class)CalFileSensor;
  -[CalFileSensor dealloc](&v4, sel_dealloc);
}

- (id)description
{
  CalDescriptionBuilder *v3;
  void *v4;
  CalDescriptionBuilder *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = [CalDescriptionBuilder alloc];
  v9.receiver = self;
  v9.super_class = (Class)CalFileSensor;
  -[CalFileSensor description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CalDescriptionBuilder initWithSuperclassDescription:](v3, "initWithSuperclassDescription:", v4);

  -[CalDescriptionBuilder setKey:withString:](v5, "setKey:withString:", CFSTR("_path"), self->_path);
  -[CalDescriptionBuilder setKey:withDispatchQueue:](v5, "setKey:withDispatchQueue:", CFSTR("_queue"), self->_queue);
  -[CalDescriptionBuilder setKey:withDispatchSource:](v5, "setKey:withDispatchSource:", CFSTR("_source"), self->_source);
  v6 = (void *)MEMORY[0x19400A168](self->_eventBlock);
  -[CalDescriptionBuilder setKey:withObject:](v5, "setKey:withObject:", CFSTR("_eventBlock"), v6);

  -[CalDescriptionBuilder setKey:withBoolean:](v5, "setKey:withBoolean:", CFSTR("_started"), self->_started);
  -[CalDescriptionBuilder build](v5, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)start
{
  OUTLINED_FUNCTION_0(&dword_18FC12000, a2, a3, "This sensor has already been started: [%@]", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __22__CalFileSensor_start__block_invoke(uint64_t a1)
{
  dispatch_source_t *WeakRetained;
  char data;
  dispatch_source_t *v4;

  WeakRetained = (dispatch_source_t *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    data = dispatch_source_get_data(v4[2]);
    WeakRetained = v4;
    if ((data & 1) != 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      -[dispatch_source_t stop](v4, "stop");
      WeakRetained = v4;
    }
  }

}

void __22__CalFileSensor_start__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_sync_enter(v4);
    if (*((_QWORD *)v4 + 2))
    {
      +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        __22__CalFileSensor_start__block_invoke_2_cold_1((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11);

      close(*(_DWORD *)(a1 + 48));
      v12 = (void *)*((_QWORD *)v4 + 2);
      *((_QWORD *)v4 + 2) = 0;

      *((_BYTE *)v4 + 32) = 0;
    }
    objc_sync_exit(v4);

    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_BYTE *)(v13 + 24))
    {
      *(_BYTE *)(v13 + 24) = 0;
      objc_msgSend(v4, "start");
    }
  }

}

- (void)stop
{
  NSObject *source;
  CalFileSensor *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_started = 0;
  source = obj->_source;
  if (source)
    dispatch_source_cancel(source);
  objc_sync_exit(obj);

}

- (NSString)path
{
  return self->_path;
}

- (BOOL)started
{
  return self->_started;
}

- (id)eventBlock
{
  return self->_eventBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong(&self->_eventBlock, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __22__CalFileSensor_start__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_18FC12000, a2, a3, "Unregistering a file sensor for path: [%@]", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

@end
