@implementation _CNTimeProfilingTask

- (_CNTimeProfilingTask)init
{
  id v2;

  CNInitializerUnavailableException(self, a2, sel_initWithTask_timeProvider_logger_);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (_CNTimeProfilingTask)initWithName:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  CNInitializerUnavailableException(self, a2, sel_initWithTask_timeProvider_logger_);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (_CNTimeProfilingTask)initWithTask:(id)a3 timeProvider:(id)a4 os_log:(id)a5
{
  id v8;
  id v9;
  id v10;
  _CNTimeProfilingTaskOSLogger *v11;
  _CNTimeProfilingTask *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[_CNTimeProfilingTaskOSLogger initWithOSLog:]([_CNTimeProfilingTaskOSLogger alloc], "initWithOSLog:", v8);

  v12 = -[_CNTimeProfilingTask initWithTask:timeProvider:logger:](self, "initWithTask:timeProvider:logger:", v10, v9, v11);
  return v12;
}

- (_CNTimeProfilingTask)initWithTask:(id)a3 timeProvider:(id)a4 logger:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  _CNTimeProfilingTask *v32;
  _CNTimeProfilingTask *v33;
  _CNTimeProfilingTask *v34;
  objc_super v36;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_6;
  }
  if (CNGuardOSLog_cn_once_token_0_3 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_3, &__block_literal_global_30);
  v12 = (void *)CNGuardOSLog_cn_once_object_0_3;
  if (!os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_3, OS_LOG_TYPE_FAULT))
  {
LABEL_6:
    if (v10)
      goto LABEL_11;
  }
  else
  {
    -[_CNTimeProfilingTask initWithTask:timeProvider:logger:].cold.3(v12);
    if (v10)
      goto LABEL_11;
  }
  if (CNGuardOSLog_cn_once_token_0_3 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_3, &__block_literal_global_30);
  v13 = CNGuardOSLog_cn_once_object_0_3;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_3, OS_LOG_TYPE_FAULT))
    -[_CNTimeProfilingTask initWithTask:timeProvider:logger:].cold.2(v13, v14, v15, v16, v17, v18, v19, v20);
LABEL_11:
  if (!v11)
  {
    if (CNGuardOSLog_cn_once_token_0_3 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_3, &__block_literal_global_30);
    v21 = CNGuardOSLog_cn_once_object_0_3;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_3, OS_LOG_TYPE_FAULT))
      -[_CNTimeProfilingTask initWithTask:timeProvider:logger:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);
  }
  v29 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "name");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", CFSTR("%@.time-profile"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v36.receiver = self;
  v36.super_class = (Class)_CNTimeProfilingTask;
  v32 = -[CNTask initWithName:](&v36, sel_initWithName_, v31);
  v33 = v32;
  if (v32)
  {
    objc_storeStrong((id *)&v32->_task, a3);
    objc_storeStrong((id *)&v33->_timeProvider, a4);
    objc_storeStrong((id *)&v33->_logger, a5);
    v34 = v33;
  }

  return v33;
}

- (id)run
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  CNTaskTimeProfileLogging *logger;
  CNTask *task;
  void *v10;

  -[CNTaskTimeProfileLogging taskWillBegin:](self->_logger, "taskWillBegin:", self->_task);
  -[CNTimeProvider timestamp](self->_timeProvider, "timestamp");
  v4 = v3;
  -[CNTask run](self->_task, "run");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNTimeProvider timestamp](self->_timeProvider, "timestamp");
  v7 = v6 - v4;
  if (objc_msgSend(v5, "isSuccess"))
    -[CNTaskTimeProfileLogging task:didCompleteAfter:](self->_logger, "task:didCompleteAfter:", self->_task, v7);
  if (objc_msgSend(v5, "isFailure"))
  {
    logger = self->_logger;
    task = self->_task;
    objc_msgSend(v5, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNTaskTimeProfileLogging task:didFailWithError:after:](logger, "task:didFailWithError:after:", task, v10, v7);

  }
  return v5;
}

- (CNTask)task
{
  return (CNTask *)objc_getProperty(self, a2, 24, 1);
}

- (CNTimeProvider)timeProvider
{
  return (CNTimeProvider *)objc_getProperty(self, a2, 32, 1);
}

- (CNTaskTimeProfileLogging)logger
{
  return (CNTaskTimeProfileLogging *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_timeProvider, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

- (void)initWithTask:(uint64_t)a3 timeProvider:(uint64_t)a4 logger:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_18F80C000, a1, a3, "parameter ‘logger’ must be nonnull", a5, a6, a7, a8, 0);
}

- (void)initWithTask:(uint64_t)a3 timeProvider:(uint64_t)a4 logger:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_18F80C000, a1, a3, "parameter ‘timeProvider’ must be nonnull", a5, a6, a7, a8, 0);
}

- (void)initWithTask:(void *)a1 timeProvider:logger:.cold.3(void *a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = 138543362;
  v3 = objc_opt_class();
  _os_log_fault_impl(&dword_18F80C000, v1, OS_LOG_TYPE_FAULT, "parameter ‘task’ must be nonnull and of type %{public}@", (uint8_t *)&v2, 0xCu);

}

@end
