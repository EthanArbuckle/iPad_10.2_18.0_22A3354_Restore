@implementation CHE5MLExecutionContext

- (CHE5MLExecutionContext)initWithFunction:(id)a3
{
  id v5;
  CHE5MLExecutionContext *v6;
  CHE5MLExecutionContext *v7;
  dispatch_block_t v8;
  id prewarmBlock;
  NSObject *v10;
  qos_class_t v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *contextQueue;
  NSObject *v15;
  CHE5MLExecutionContext *v16;
  CHE5MLExecutionContext *v17;
  _QWORD block[4];
  CHE5MLExecutionContext *v20;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CHE5MLExecutionContext;
  v6 = -[CHE5MLExecutionContext init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_functionDescriptor, a3);
    v7->_executionLock._os_unfair_lock_opaque = 0;
    v8 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &unk_1E77F18B0);
    prewarmBlock = v7->_prewarmBlock;
    v7->_prewarmBlock = v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = qos_class_self();
    dispatch_queue_attr_make_with_qos_class(v10, v11, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = dispatch_queue_create("com.apple.CoreHandwriting.E5MLExecutionContextQueue", v12);
    contextQueue = v7->_contextQueue;
    v7->_contextQueue = (OS_dispatch_queue *)v13;

    v15 = v7->_contextQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1BE7B3658;
    block[3] = &unk_1E77F29A0;
    v16 = v7;
    v20 = v16;
    dispatch_async(v15, block);
    v17 = v16;

  }
  return v7;
}

- (id)newE5RTExecutionContextForFunctionDescriptor:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v6 = (objc_class *)MEMORY[0x1E0DC6C28];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  dispatch_block_wait(self->_prewarmBlock, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend_setPrewarmedState_(v8, v9, (uint64_t)self->_prewarmedState, v10, v11, v12);
  objc_msgSend_function(v7, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_msgSend_newExecutionContextWithConfiguration_error_(v18, v19, (uint64_t)v8, (uint64_t)a4, v20, v21);
  return v22;
}

- (id)newE5RTExecutionContextForFunctionDescriptor:(id)a3 preboundInputs:(id)a4 preboundOutputs:(id)a5 error:(id *)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;

  v10 = (objc_class *)MEMORY[0x1E0DC6C28];
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v10);
  dispatch_block_wait(self->_prewarmBlock, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend_setPrewarmedState_(v14, v15, (uint64_t)self->_prewarmedState, v16, v17, v18);
  objc_msgSend_setBoundInputObjects_(v14, v19, (uint64_t)v12, v20, v21, v22);

  objc_msgSend_setBoundOutputObjects_(v14, v23, (uint64_t)v11, v24, v25, v26);
  objc_msgSend_setPrewireInUseAllocations_(v14, v27, 1, v28, v29, v30);
  objc_msgSend_function(v13, v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = (void *)objc_msgSend_newExecutionContextWithConfiguration_error_(v36, v37, (uint64_t)v14, (uint64_t)a6, v38, v39);
  return v40;
}

- (id)sharedExecutionContextWithError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  VisionCoreE5RTExecutionContext *executionContext;
  VisionCoreE5RTExecutionContext *v7;
  VisionCoreE5RTExecutionContext *v8;

  executionContext = self->_executionContext;
  if (!executionContext)
  {
    v7 = (VisionCoreE5RTExecutionContext *)objc_msgSend_newE5RTExecutionContextForFunctionDescriptor_error_(self, a2, (uint64_t)self->_functionDescriptor, (uint64_t)a3, v3, v4);
    v8 = self->_executionContext;
    self->_executionContext = v7;

    executionContext = self->_executionContext;
  }
  return executionContext;
}

- (id)predictionFromInputObjects:(id)a3 error:(id *)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  os_unfair_lock_s *p_executionLock;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  unint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  uint8_t v25[16];
  uint8_t v26[16];
  uint8_t v27[16];
  uint8_t buf[16];

  v10 = a3;
  if (v10)
  {
    objc_msgSend_sharedExecutionContextWithError_(self, v6, (uint64_t)a4, v7, v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v21 = 0;
      goto LABEL_23;
    }
    p_executionLock = &self->_executionLock;
    os_unfair_lock_lock(p_executionLock);
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v13 = (id)qword_1EF568E50;
    v14 = os_signpost_id_generate(v13);

    if (qword_1EF568E88 == -1)
    {
      v15 = (id)qword_1EF568E50;
      v16 = v14 - 1;
      if (v14 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_9;
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v15 = (id)qword_1EF568E50;
      v16 = v14 - 1;
      if (v14 - 1 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_9;
    }
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE607000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v14, "CHE5MLContextExecution", ", buf, 2u);
    }
LABEL_9:

    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v17 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_1BE607000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHE5MLContextExecution\", v27, 2u);
    }

    objc_msgSend_executeWithInputObjects_error_(v11, v18, (uint64_t)v10, (uint64_t)a4, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1EF568E88 == -1)
    {
      v22 = (id)qword_1EF568E50;
      if (v16 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_17;
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v22 = (id)qword_1EF568E50;
      if (v16 > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_17;
    }
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)v26 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE607000, v22, OS_SIGNPOST_INTERVAL_END, v14, "CHE5MLContextExecution", ", v26, 2u);
    }
LABEL_17:

    if (qword_1EF568E88 == -1)
    {
      v23 = (id)qword_1EF568E18[0];
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
LABEL_20:

        os_unfair_lock_unlock(p_executionLock);
LABEL_23:

        goto LABEL_24;
      }
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v23 = (id)qword_1EF568E18[0];
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        goto LABEL_20;
    }
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_1BE607000, v23, OS_LOG_TYPE_DEFAULT, "END \"CHE5MLContextExecution\", v25, 2u);
    goto LABEL_20;
  }
  v21 = 0;
LABEL_24:

  return v21;
}

- (void)prebindInputs:(id)a3
{
  VisionCoreE5RTExecutionContext *preboundExecutionContext;
  id v6;

  objc_storeStrong((id *)&self->_preboundInputObjects, a3);
  v6 = a3;
  preboundExecutionContext = self->_preboundExecutionContext;
  self->_preboundExecutionContext = 0;

}

- (void)unbindInputs
{
  VisionCoreNamedObjects *preboundInputObjects;
  VisionCoreE5RTExecutionContext *preboundExecutionContext;

  preboundInputObjects = self->_preboundInputObjects;
  self->_preboundInputObjects = 0;

  preboundExecutionContext = self->_preboundExecutionContext;
  self->_preboundExecutionContext = 0;

}

- (BOOL)predictFromPreboundInputsWithError:(id *)a3
{
  os_unfair_lock_s *p_executionLock;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  VisionCoreNamedObjects *v9;
  VisionCoreNamedObjects *preboundOutputObjects;
  VisionCoreE5RTExecutionContext *v11;
  VisionCoreE5RTExecutionContext *preboundExecutionContext;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  unint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  uint8_t v25[16];
  uint8_t v26[16];
  uint8_t v27[16];
  uint8_t buf[16];

  p_executionLock = &self->_executionLock;
  os_unfair_lock_lock(&self->_executionLock);
  if (self->_preboundOutputObjects)
  {
    if (self->_preboundExecutionContext)
      goto LABEL_6;
  }
  else
  {
    v9 = (VisionCoreNamedObjects *)objc_msgSend_newE5RTExecutionOutputsForFunctionDescriptor_error_(CHE5MLUtilities, v6, (uint64_t)self->_functionDescriptor, (uint64_t)a3, v7, v8);
    preboundOutputObjects = self->_preboundOutputObjects;
    self->_preboundOutputObjects = v9;

    if (self->_preboundExecutionContext)
      goto LABEL_6;
  }
  v11 = (VisionCoreE5RTExecutionContext *)objc_msgSend_newE5RTExecutionContextForFunctionDescriptor_preboundInputs_preboundOutputs_error_(self, v6, (uint64_t)self->_functionDescriptor, (uint64_t)self->_preboundInputObjects, (uint64_t)self->_preboundOutputObjects, (uint64_t)a3);
  preboundExecutionContext = self->_preboundExecutionContext;
  self->_preboundExecutionContext = v11;

  if (!self->_preboundExecutionContext)
  {
LABEL_25:
    os_unfair_lock_unlock(p_executionLock);
    return 0;
  }
LABEL_6:
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v13 = (id)qword_1EF568E50;
  v14 = os_signpost_id_generate(v13);

  if (qword_1EF568E88 == -1)
  {
    v15 = (id)qword_1EF568E50;
    v16 = v14 - 1;
    if (v14 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_12;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v15 = (id)qword_1EF568E50;
    v16 = v14 - 1;
    if (v14 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_12;
  }
  if (os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v14, "CHE5MLContextExecution", ", buf, 2u);
  }
LABEL_12:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v17 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_1BE607000, v17, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHE5MLContextExecution\", v27, 2u);
  }

  objc_msgSend_executeAndReturnError_(self->_preboundExecutionContext, v18, (uint64_t)a3, v19, v20, v21);
  if (qword_1EF568E88 == -1)
  {
    v22 = (id)qword_1EF568E50;
    if (v16 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_20;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v22 = (id)qword_1EF568E50;
    if (v16 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_20;
  }
  if (os_signpost_enabled(v22))
  {
    *(_WORD *)v26 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v22, OS_SIGNPOST_INTERVAL_END, v14, "CHE5MLContextExecution", ", v26, 2u);
  }
LABEL_20:

  if (qword_1EF568E88 != -1)
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v23 = (id)qword_1EF568E18[0];
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    goto LABEL_22;
  }
  v23 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
LABEL_22:
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_1BE607000, v23, OS_LOG_TYPE_DEFAULT, "END \"CHE5MLContextExecution\", v25, 2u);
  }
LABEL_23:

  if (a3 && *a3)
    goto LABEL_25;
  os_unfair_lock_unlock(p_executionLock);
  return 1;
}

- (void)predictFromPreboundInputsAsync:(id)a3
{
  void (**v4)(id, _QWORD, id);
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  VisionCoreE5RTInferenceFunctionDescriptor *functionDescriptor;
  VisionCoreNamedObjects *v11;
  VisionCoreNamedObjects *preboundOutputObjects;
  void *v13;
  VisionCoreE5RTInferenceFunctionDescriptor *v14;
  VisionCoreNamedObjects *preboundInputObjects;
  VisionCoreNamedObjects *v16;
  const char *v17;
  VisionCoreE5RTExecutionContext *v18;
  VisionCoreE5RTExecutionContext *preboundExecutionContext;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  VisionCoreE5RTExecutionContext *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];
  void (**v30)(id, _QWORD, id);
  os_signpost_id_t v31;
  uint8_t buf[16];
  id v33;
  id v34;

  v4 = (void (**)(id, _QWORD, id))a3;
  os_unfair_lock_lock(&self->_executionLock);
  if (self->_preboundOutputObjects)
  {
    v8 = 0;
    if (self->_preboundExecutionContext)
    {
LABEL_3:
      v9 = v8;
      goto LABEL_6;
    }
  }
  else
  {
    functionDescriptor = self->_functionDescriptor;
    v34 = 0;
    v11 = (VisionCoreNamedObjects *)objc_msgSend_newE5RTExecutionOutputsForFunctionDescriptor_error_(CHE5MLUtilities, v5, (uint64_t)functionDescriptor, (uint64_t)&v34, v6, v7);
    v8 = v34;
    preboundOutputObjects = self->_preboundOutputObjects;
    self->_preboundOutputObjects = v11;

    if (self->_preboundExecutionContext)
      goto LABEL_3;
  }
  v13 = (void *)objc_opt_class();
  v14 = self->_functionDescriptor;
  preboundInputObjects = self->_preboundInputObjects;
  v16 = self->_preboundOutputObjects;
  v33 = v8;
  v18 = (VisionCoreE5RTExecutionContext *)objc_msgSend_newE5RTExecutionContextForFunctionDescriptor_preboundInputs_preboundOutputs_error_(v13, v17, (uint64_t)v14, (uint64_t)preboundInputObjects, (uint64_t)v16, (uint64_t)&v33);
  v9 = v33;

  preboundExecutionContext = self->_preboundExecutionContext;
  self->_preboundExecutionContext = v18;

  if (!self->_preboundExecutionContext)
  {
    os_unfair_lock_unlock(&self->_executionLock);
    v4[2](v4, 0, v9);
    goto LABEL_17;
  }
LABEL_6:
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v20 = (id)qword_1EF568E50;
  v21 = os_signpost_id_generate(v20);

  if (qword_1EF568E88 == -1)
  {
    v22 = (id)qword_1EF568E50;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_10;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v22 = (id)qword_1EF568E50;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
LABEL_10:
      if (os_signpost_enabled(v22))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1BE607000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v21, "CHE5MLContextExecution", ", buf, 2u);
      }
    }
  }

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v23 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v23, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHE5MLContextExecution\", buf, 2u);
  }

  v24 = self->_preboundExecutionContext;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = sub_1BE7B42A8;
  v29[3] = &unk_1E77F50A0;
  v31 = v21;
  v29[4] = self;
  v30 = v4;
  objc_msgSend_executeWithCompletionHandler_(v24, v25, (uint64_t)v29, v26, v27, v28);

LABEL_17:
}

- (VisionCoreE5RTInferenceFunctionDescriptor)functionDescriptor
{
  return self->_functionDescriptor;
}

- (VisionCoreNamedObjects)preboundOutputObjects
{
  return self->_preboundOutputObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preboundExecutionContext, 0);
  objc_storeStrong((id *)&self->_preboundOutputObjects, 0);
  objc_storeStrong((id *)&self->_preboundInputObjects, 0);
  objc_storeStrong((id *)&self->_executionContext, 0);
  objc_storeStrong((id *)&self->_contextQueue, 0);
  objc_storeStrong(&self->_prewarmBlock, 0);
  objc_storeStrong((id *)&self->_prewarmedState, 0);
  objc_storeStrong((id *)&self->_functionDescriptor, 0);
}

@end
