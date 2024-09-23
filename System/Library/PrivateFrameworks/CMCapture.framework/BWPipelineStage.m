@implementation BWPipelineStage

- (BOOL)stillImagePipelineStage
{
  return self->_stillImagePipelineStage;
}

id *__39__BWPipelineStage_sendMessage_toInput___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  return -[BWPipelineStage _serviceQueuedMessages](*(id **)(a1 + 32));
}

- (void)sendMessage:(id)a3 toInput:(id)a4
{
  NSObject *v7;
  NSObject *executionGroup;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  _QWORD block[7];
  _QWORD v13[5];
  id v14;
  _QWORD v15[5];
  id v16;

  if (!a4)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v11 = CFSTR("input not provided");
    goto LABEL_16;
  }
  if (!a3)
  {
    v9 = (void *)MEMORY[0x1E0C99DA0];
    v10 = *MEMORY[0x1E0C99778];
    v11 = CFSTR("message is nil");
LABEL_16:
    objc_exception_throw((id)objc_msgSend(v9, "exceptionWithName:reason:userInfo:", v10, v11, 0));
  }
  if (self && +[BWPipelineStage _currentPipelineStage]() == self)
  {
    -[NSMutableArray addObject:](self->_queuedMessages, "addObject:", a3);
    -[NSMutableArray addObject:](self->_inputsForQueuedMessages, "addObject:", a4);
  }
  else if (*((_DWORD *)a3 + 2) != 2 || (v7 = self->_executionGroup) == 0 || !dispatch_group_wait(v7, 0))
  {
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x3052000000;
    v15[3] = __Block_byref_object_copy__8;
    v15[4] = __Block_byref_object_dispose__8;
    v16 = 0;
    v16 = a3;
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3052000000;
    v13[3] = __Block_byref_object_copy__8;
    v13[4] = __Block_byref_object_dispose__8;
    v14 = 0;
    v14 = a4;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__BWPipelineStage_sendMessage_toInput___block_invoke;
    block[3] = &unk_1E491F8B0;
    block[4] = self;
    block[5] = v15;
    block[6] = v13;
    executionGroup = self->_executionGroup;
    if (executionGroup)
      dispatch_group_async(executionGroup, (dispatch_queue_t)self->_executionQueue, block);
    else
      dispatch_async((dispatch_queue_t)self->_executionQueue, block);
    _Block_object_dispose(v13, 8);
    _Block_object_dispose(v15, 8);
  }
}

+ (void)_currentPipelineStage
{
  objc_opt_self();
  if (_getCurrentPipelineStageKey_onceToken != -1)
    dispatch_once(&_getCurrentPipelineStageKey_onceToken, &__block_literal_global_25);
  return pthread_getspecific(_getCurrentPipelineStageKey_key);
}

- (id)_serviceQueuedMessages
{
  id *v1;
  id v2;
  id v3;

  if (result)
  {
    v1 = result;
    +[BWPipelineStage _setCurrentPipelineStage:]((uint64_t)BWPipelineStage, result);
    while (objc_msgSend(v1[3], "count"))
    {
      v2 = (id)objc_msgSend(v1[3], "objectAtIndexedSubscript:", 0);
      objc_msgSend(v1[3], "removeObjectAtIndex:", 0);
      v3 = (id)objc_msgSend(v1[4], "objectAtIndexedSubscript:", 0);
      objc_msgSend(v1[4], "removeObjectAtIndex:", 0);
      objc_msgSend(v3, "handleMessage:", v2);

    }
    return (id *)+[BWPipelineStage _setCurrentPipelineStage:]((uint64_t)BWPipelineStage, 0);
  }
  return result;
}

+ (uint64_t)_setCurrentPipelineStage:(uint64_t)a1
{
  objc_opt_self();
  if (_getCurrentPipelineStageKey_onceToken != -1)
    dispatch_once(&_getCurrentPipelineStageKey_onceToken, &__block_literal_global_25);
  return pthread_setspecific(_getCurrentPipelineStageKey_key, a2);
}

- (unsigned)priority
{
  return self->_priority;
}

id *__55__BWPipelineStage_sendMessagesToInput_messageProvider___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;

  v2 = (void *)MEMORY[0x1A858DD40]();
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObjectsFromArray:", v3);
    if (objc_msgSend(v4, "count"))
    {
      v5 = 0;
      do
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
        ++v5;
      }
      while (objc_msgSend(v4, "count") > v5);
    }
  }

  objc_autoreleasePoolPop(v2);
  return -[BWPipelineStage _serviceQueuedMessages](*(id **)(a1 + 32));
}

+ (BWPipelineStage)pipelineStageWithName:(id)a3 priority:(unsigned int)a4 workgroup:(id)a5 discardsLateSampleData:(BOOL)a6
{
  return (BWPipelineStage *)-[BWPipelineStage _initWithName:priority:workgroup:discardsLateSampleData:]([BWPipelineStage alloc], a3, a4, (OS_os_workgroup *)a5, a6);
}

- (void)sendMessagesToInput:(id)a3 messageProvider:(id)a4
{
  NSObject *executionGroup;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  _QWORD block[7];
  _QWORD v12[5];
  id v13;

  if (!a3)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = CFSTR("input not provided");
    goto LABEL_12;
  }
  if (!a4)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = CFSTR("messageProvider is nil");
    goto LABEL_12;
  }
  if (self && +[BWPipelineStage _currentPipelineStage]() == self)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    v10 = CFSTR("Already executing on pipeline stage");
LABEL_12:
    objc_exception_throw((id)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, v10, 0));
  }
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3052000000;
  v12[3] = __Block_byref_object_copy__8;
  v12[4] = __Block_byref_object_dispose__8;
  v13 = 0;
  v13 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__BWPipelineStage_sendMessagesToInput_messageProvider___block_invoke;
  block[3] = &unk_1E491F8D8;
  block[4] = self;
  block[5] = a4;
  block[6] = v12;
  executionGroup = self->_executionGroup;
  if (executionGroup)
    dispatch_group_async(executionGroup, (dispatch_queue_t)self->_executionQueue, block);
  else
    dispatch_async((dispatch_queue_t)self->_executionQueue, block);
  _Block_object_dispose(v12, 8);
}

- (OS_dispatch_queue)queue
{
  return self->_executionQueue;
}

+ (BWPipelineStage)pipelineStageWithName:(id)a3 priority:(unsigned int)a4 discardsLateSampleData:(BOOL)a5
{
  return (BWPipelineStage *)-[BWPipelineStage _initWithName:priority:workgroup:discardsLateSampleData:]([BWPipelineStage alloc], a3, a4, 0, a5);
}

+ (BWPipelineStage)pipelineStageWithName:(id)a3 priority:(unsigned int)a4 workgroup:(id)a5
{
  return (BWPipelineStage *)-[BWPipelineStage _initWithName:priority:workgroup:discardsLateSampleData:]([BWPipelineStage alloc], a3, a4, (OS_os_workgroup *)a5, 0);
}

+ (BWPipelineStage)pipelineStageWithName:(id)a3 priority:(unsigned int)a4
{
  return (BWPipelineStage *)-[BWPipelineStage _initWithName:priority:workgroup:discardsLateSampleData:]([BWPipelineStage alloc], a3, a4, 0, 0);
}

- (_QWORD)_initWithName:(int)a3 priority:(OS_os_workgroup *)a4 workgroup:(int)a5 discardsLateSampleData:
{
  _QWORD *v9;
  const char *v10;
  const char *v11;
  NSObject *inactive;
  objc_super v14;

  if (!a1)
    return 0;
  if (!a2)
  {

    return 0;
  }
  v14.receiver = a1;
  v14.super_class = (Class)BWPipelineStage;
  v9 = objc_msgSendSuper2(&v14, sel_init);
  if (v9)
  {
    v9[5] = objc_msgSend(a2, "copy");
    *((_DWORD *)v9 + 12) = a3;
    v10 = (const char *)objc_msgSend(a2, "cStringUsingEncoding:", 4);
    v11 = v10;
    if (a4)
    {
      inactive = dispatch_workloop_create_inactive(v10);
      FigThreadGetMachThreadPriorityValue();
      dispatch_workloop_set_scheduler_priority();
      dispatch_workloop_set_os_workgroup(inactive, a4);
      dispatch_activate(inactive);
      v9[1] = dispatch_queue_create_with_target_V2(v11, 0, inactive);
      dispatch_release(inactive);
    }
    else
    {
      v9[1] = FigDispatchQueueCreateWithPriority();
    }
    v9[3] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9[4] = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (a5)
      v9[2] = dispatch_group_create();
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWPipelineStage;
  -[BWPipelineStage dealloc](&v3, sel_dealloc);
}

+ (void)initialize
{
  objc_opt_class();
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> %@"), NSStringFromClass(v4), self, self->_name);
}

- (NSString)name
{
  return self->_name;
}

@end
