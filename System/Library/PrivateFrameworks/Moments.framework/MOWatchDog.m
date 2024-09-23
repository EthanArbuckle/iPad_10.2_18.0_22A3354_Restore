@implementation MOWatchDog

- (MOWatchDog)initWithName:(id)a3 cadenceInSeconds:(float)a4 andHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  const char *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  void *v17;
  dispatch_source_t v18;
  void *v19;
  NSObject *v20;
  double v21;
  id v22;
  _QWORD handler[4];
  id v25;
  id location;
  objc_super v27;

  v8 = a3;
  v9 = a5;
  v27.receiver = self;
  v27.super_class = (Class)MOWatchDog;
  v10 = -[MOWatchDog init](&v27, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    v12 = (void *)*((_QWORD *)v10 + 1);
    *((_QWORD *)v10 + 1) = v11;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MOWatchDog:%@"), v8);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = (const char *)objc_msgSend(v13, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create(v14, v15);
    v17 = (void *)*((_QWORD *)v10 + 4);
    *((_QWORD *)v10 + 4) = v16;

    v18 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v10 + 4));
    v19 = (void *)*((_QWORD *)v10 + 3);
    *((_QWORD *)v10 + 3) = v18;

    objc_initWeak(&location, v10);
    v20 = *((_QWORD *)v10 + 3);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __55__MOWatchDog_initWithName_cadenceInSeconds_andHandler___block_invoke;
    handler[3] = &unk_1E8541EE0;
    objc_copyWeak(&v25, &location);
    dispatch_source_set_event_handler(v20, handler);
    dispatch_resume(*((dispatch_object_t *)v10 + 3));
    *(float *)&v21 = a4;
    objc_msgSend(v10, "setCadenceSeconds:", v21);
    v22 = v10;
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return (MOWatchDog *)v10;
}

void __55__MOWatchDog_initWithName_cadenceInSeconds_andHandler___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  double v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(id, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[3];
  uint8_t buf[4];
  id *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  double v23;
  __int16 v24;
  int v25;
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *((_DWORD *)WeakRetained + 5);
    _mo_log_facility_get_os_log(MOLogFacilityWatchDog);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3 >= 18)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        __55__MOWatchDog_initWithName_cadenceInSeconds_andHandler___block_invoke_cold_1();

      v26[0] = CFSTR("Name");
      v13 = (void *)objc_msgSend(v2[1], "copy");
      v27[0] = v13;
      v26[1] = CFSTR("SuccessiveWarningCount");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v2 + 5));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26[2] = CFSTR("Fatal");
      v27[1] = v14;
      v27[2] = &unk_1E855DBF0;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      AnalyticsSendEvent();

      exit(255);
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(v2[1], "UTF8String");
      v7 = *((float *)v2 + 4);
      v8 = *((_DWORD *)v2 + 5);
      *(_DWORD *)buf = 134218754;
      v19 = v2;
      v20 = 2080;
      v21 = v6;
      v22 = 2048;
      v23 = v7;
      v24 = 1024;
      v25 = v8;
      _os_log_impl(&dword_1CAE42000, v5, OS_LOG_TYPE_DEFAULT, "Watch dog [0x%p:%s] was not petted on time; [%f] seconds elapsed, this happened %i time(s) before!",
        buf,
        0x26u);
    }

    ++*((_DWORD *)v2 + 5);
    v9 = (void *)objc_msgSend(v2[1], "copy", CFSTR("Name"));
    v17[0] = v9;
    v16[1] = CFSTR("SuccessiveWarningCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *((unsigned int *)v2 + 5));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = CFSTR("Fatal");
    v17[1] = v10;
    v17[2] = &unk_1E855DC08;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

    v12 = (void (**)(id, _QWORD))v2[5];
    if (v12)
      v12[2](v12, *((unsigned int *)v2 + 5));
  }

}

- (void)dealloc
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_2(v0);
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_0_4(&dword_1CAE42000, v1, v2, "Watch dog [0x%p:%s] destructing", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4();
}

- (float)getCadenceSeconds
{
  return self->_cadenceSeconds;
}

- (BOOL)setCadenceSeconds:(float)a3
{
  NSObject *v4;

  if (a3 <= 0.0)
  {
    _mo_log_facility_get_os_log(MOLogFacilityWatchDog);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[MOWatchDog setCadenceSeconds:].cold.1(v4, a3);

  }
  else
  {
    self->_cadenceSeconds = a3;
    -[MOWatchDog pet](self, "pet");
  }
  return a3 > 0.0;
}

- (void)pet
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __17__MOWatchDog_pet__block_invoke;
  v4[3] = &unk_1E8541EE0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __17__MOWatchDog_pet__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_pet");
    WeakRetained = v2;
  }

}

- (void)_pet
{
  NSObject *v3;
  const char *v4;
  int failureCount;
  NSObject *v6;
  unint64_t v7;
  NSObject *source;
  dispatch_time_t v9;
  int v10;
  MOWatchDog *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_failureCount)
  {
    _mo_log_facility_get_os_log(MOLogFacilityWatchDog);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = -[NSString UTF8String](self->_name, "UTF8String");
      failureCount = self->_failureCount;
      v10 = 134218498;
      v11 = self;
      v12 = 2080;
      v13 = v4;
      v14 = 1024;
      v15 = failureCount;
      _os_log_impl(&dword_1CAE42000, v3, OS_LOG_TYPE_DEFAULT, "Watch dog [0x%p:%s] recovered from %i earlier failures!", (uint8_t *)&v10, 0x1Cu);
    }

  }
  -[MOWatchDog _cancel](self, "_cancel");
  _mo_log_facility_get_os_log(MOLogFacilityWatchDog);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[MOWatchDog _pet].cold.1();

  v7 = (unint64_t)(float)(self->_cadenceSeconds * 1000000000.0);
  source = self->_source;
  v9 = dispatch_time(0, v7);
  dispatch_source_set_timer(source, v9, v7, 0);
}

- (void)cancel
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __20__MOWatchDog_cancel__block_invoke;
  v4[3] = &unk_1E8541EE0;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __20__MOWatchDog_cancel__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_cancel");
    WeakRetained = v2;
  }

}

- (void)_cancel
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_2(v0);
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_0_4(&dword_1CAE42000, v1, v2, "Watch dog [0x%p:%s] canceling check-in callback", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_4();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __55__MOWatchDog_initWithName_cadenceInSeconds_andHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_2(v1);
  OUTLINED_FUNCTION_0_10();
  _os_log_fault_impl(&dword_1CAE42000, v0, OS_LOG_TYPE_FAULT, "Watch dog [0x%p:%s] died of no petting - Exiting process!", v2, 0x16u);
  OUTLINED_FUNCTION_4();
}

- (void)setCadenceSeconds:(os_log_t)log .cold.1(os_log_t log, float a2)
{
  int v2;
  double v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a2;
  _os_log_error_impl(&dword_1CAE42000, log, OS_LOG_TYPE_ERROR, "Invalid cadence value %f", (uint8_t *)&v2, 0xCu);
}

- (double)_pet
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  double result;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  OUTLINED_FUNCTION_4_1();
  v12 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(*(id *)(v2 + 8), "UTF8String");
  v4 = *(float *)(v1 + 16);
  v6 = 134218498;
  v7 = v1;
  v8 = 2080;
  v9 = v3;
  v10 = 2048;
  v11 = v4;
  _os_log_debug_impl(&dword_1CAE42000, v0, OS_LOG_TYPE_DEBUG, "Watch dog [0x%p:%s] scheduling check-in callback (%f seconds timeout)", (uint8_t *)&v6, 0x20u);
  return result;
}

@end
