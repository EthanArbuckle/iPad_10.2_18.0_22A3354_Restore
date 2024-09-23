@implementation AVOperation

+ (void)initialize
{
  objc_opt_class();
}

- (AVOperation)init
{
  uint64_t v4;
  AVOperation *v5;
  objc_super v7;

  v4 = objc_opt_class();
  AVRequireConcreteObject(self, a2, v4);
  v7.receiver = self;
  v7.super_class = (Class)AVOperation;
  v5 = -[AVOperation init](&v7, sel_init);
  if (v5)
    v5->_ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avoperation.ivars");
  return v5;
}

- (void)dealloc
{
  NSObject *ivarAccessQueue;
  objc_super v4;

  ivarAccessQueue = self->_ivarAccessQueue;
  if (ivarAccessQueue)
    dispatch_release(ivarAccessQueue);

  v4.receiver = self;
  v4.super_class = (Class)AVOperation;
  -[AVOperation dealloc](&v4, sel_dealloc);
}

- (int64_t)status
{
  NSObject *ivarAccessQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __21__AVOperation_status__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __21__AVOperation_status__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 256);
  return result;
}

- (NSError)error
{
  NSObject *ivarAccessQueue;
  NSError *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__28;
  v10 = __Block_byref_object_dispose__28;
  v11 = 0;
  ivarAccessQueue = self->_ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __20__AVOperation_error__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSError *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __20__AVOperation_error__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 264), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)evaluateDependenciesAndMarkAsExecuting
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v24 = 0;
  v25 = 0;
  if (!-[AVOperation _setStatus:error:resultingStatus:failureReason:](self, "_setStatus:error:resultingStatus:failureReason:", 1, 0, &v25, &v24))
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("%@"), v4, v5, v6, v7, v8, v24), 0);
    objc_exception_throw(v18);
  }
  if (-[AVOperation isCancelled](self, "isCancelled"))
    goto LABEL_15;
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = (void *)-[AVOperation dependencies](self, "dependencies");
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v9, "addObject:", v15);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v12);
  }
  v19 = 0;
  v16 = +[AVOperation statusOfOperations:error:](AVOperation, "statusOfOperations:error:", v9, &v19);
  if (v16 != 2)
  {
    if (v16 == 4)
    {
      -[AVOperation markAsFailedWithError:](self, "markAsFailedWithError:", v19);
      return -[AVOperation status](self, "status") == 1;
    }
LABEL_15:
    -[AVOperation markAsCancelled](self, "markAsCancelled");
  }
  return -[AVOperation status](self, "status") == 1;
}

- (BOOL)isExecuting
{
  return -[AVOperation status](self, "status") == 1;
}

- (BOOL)isFinished
{
  return -[AVOperation status](self, "status") > 1;
}

- (BOOL)isReady
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)-[AVOperation dependencies](self, "dependencies", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v5)
        objc_enumerationMutation(v2);
      v7 = objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "isFinished");
      if (!v7)
        break;
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (BOOL)_setStatus:(int64_t)a3 error:(id)a4 resultingStatus:(int64_t *)a5 failureReason:(id *)a6
{
  uint64_t v6;
  uint64_t v7;
  NSObject *ivarAccessQueue;
  int v14;
  uint64_t v15;
  uint64_t *v16;
  BOOL v17;
  void *v19;
  _QWORD block[12];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  if (!a3)
  {
    v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, v6, v7, (uint64_t)"requestedStatus != AVOperationStatusUnknown"), 0);
    objc_exception_throw(v19);
  }
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 1;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3052000000;
  v24 = __Block_byref_object_copy__10;
  v25 = __Block_byref_object_dispose__11;
  v26 = 0;
  -[AVOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  -[AVOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  ivarAccessQueue = self->_ivarAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__AVOperation__setStatus_error_resultingStatus_failureReason___block_invoke;
  block[3] = &unk_1E3034630;
  block[6] = &v35;
  block[7] = &v31;
  block[10] = a3;
  block[11] = a6;
  block[4] = self;
  block[5] = a4;
  block[8] = &v27;
  block[9] = &v21;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, block);
  v14 = *((unsigned __int8 *)v36 + 24);
  if (*((_BYTE *)v36 + 24))
  {
    if (*((_BYTE *)v28 + 24))
    {
      v15 = v22[5];
      if (v15)
        (*(void (**)(void))(v15 + 16))();
    }
    -[AVOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
    -[AVOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
    if (*((_BYTE *)v28 + 24))
      -[AVOperation didEnterTerminalState](self, "didEnterTerminalState");

    v16 = v36;
    v14 = *((unsigned __int8 *)v36 + 24);
    if (a5 && *((_BYTE *)v36 + 24))
    {
      *a5 = v32[3];
      v14 = *((unsigned __int8 *)v16 + 24);
    }
  }
  v17 = v14 != 0;
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  return v17;
}

const __CFString *__62__AVOperation__setStatus_error_resultingStatus_failureReason___block_invoke(const __CFString *result)
{
  const __CFString *v1;
  uint64_t v2;
  uint64_t data;
  BOOL v4;
  _QWORD *length;
  BOOL v6;
  char v8;

  v1 = result;
  v2 = *((_QWORD *)result[1].isa + 32);
  data = (uint64_t)result[2].data;
  if (v2)
    v4 = 0;
  else
    v4 = data == 3;
  if (v4)
  {
    v2 = 0;
LABEL_18:
    *(_QWORD *)(*(_QWORD *)(result[1].length + 8) + 24) = v2;
    v8 = 1;
    goto LABEL_22;
  }
  length = (_QWORD *)result[2].length;
  if (v2)
    v6 = 1;
  else
    v6 = data <= 1;
  if (!v6)
  {
    result = CFSTR("Cannot enter a terminal state until the receiver starts executing");
    goto LABEL_20;
  }
  if (v2 < 2 || data > 1)
  {
    if (v2 < 2)
      v2 = (uint64_t)result[2].data;
    goto LABEL_18;
  }
  result = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot regress from a terminal state %d to a non-terminal state %d"), v2, data);
LABEL_20:
  v8 = 0;
  if (length)
    *length = result;
LABEL_22:
  *(_BYTE *)(*((_QWORD *)v1[1].data + 1) + 24) = v8;
  if (*(_BYTE *)(*((_QWORD *)v1[1].data + 1) + 24)
    && *(_QWORD *)(*(_QWORD *)(v1[1].length + 8) + 24) != *((_QWORD *)v1[1].isa + 32))
  {
    *(_BYTE *)(*((_QWORD *)v1[2].isa + 1) + 24) = (uint64_t)v1[2].data > 1;
    result = (const __CFString *)objc_msgSend((id)v1[1].info, "copy");
    *((_QWORD *)v1[1].isa + 33) = result;
    *((_QWORD *)v1[1].isa + 32) = v1[2].data;
    if (*(_BYTE *)(*((_QWORD *)v1[2].isa + 1) + 24))
    {
      *(_QWORD *)(*(_QWORD *)(v1[2].info + 8) + 40) = objc_msgSend((id)objc_msgSend(v1[1].isa, "completionBlock"), "copy");
      return (const __CFString *)objc_msgSend(v1[1].isa, "setCompletionBlock:", 0);
    }
  }
  return result;
}

- (void)markAsCompleted
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v10 = 0;
  if (!-[AVOperation _setStatus:error:resultingStatus:failureReason:](self, "_setStatus:error:resultingStatus:failureReason:", 2, 0, 0, &v10))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("%@"), v4, v5, v6, v7, v8, v10), 0);
    objc_exception_throw(v9);
  }
}

- (void)markAsFailedWithError:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v11 = 0;
  if (!-[AVOperation _setStatus:error:resultingStatus:failureReason:](self, "_setStatus:error:resultingStatus:failureReason:", 4, a3, 0, &v11))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("%@"), v5, v6, v7, v8, v9, v11), 0);
    objc_exception_throw(v10);
  }
}

- (void)markAsCancelled
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v10 = 0;
  if (!-[AVOperation _setStatus:error:resultingStatus:failureReason:](self, "_setStatus:error:resultingStatus:failureReason:", 3, 0, 0, &v10))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("%@"), v4, v5, v6, v7, v8, v10), 0);
    objc_exception_throw(v9);
  }
}

+ (int64_t)statusOfOperations:(id)a3 error:(id *)a4
{
  uint64_t v6;
  int64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int64_t result;
  int v15;
  int64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v18;
LABEL_3:
    v11 = 0;
    v12 = v9;
    while (2)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(a3);
      v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
      result = objc_msgSend(v13, "status");
      v9 = 1;
      switch(result)
      {
        case 1:
          goto LABEL_8;
        case 2:
          v8 = 1;
          v9 = v12;
LABEL_8:
          ++v11;
          v12 = v9;
          if (v7 != v11)
            continue;
          result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          v7 = result;
          if (result)
            goto LABEL_3;
          v15 = 1;
          LOBYTE(v12) = v9;
          if ((v8 & 1) != 0)
          {
LABEL_18:
            if ((v12 & 1) != 0)
            {
              v16 = 0;
LABEL_20:
              if ((v15 & 1) != 0)
                return v16;
              return result;
            }
          }
          else
          {
LABEL_11:
            if ((v12 & 1) != 0)
            {
              v16 = 1;
              goto LABEL_20;
            }
          }
          if (!v15)
            return result;
          break;
        case 3:
          goto LABEL_17;
        case 4:
          if (a4)
            *a4 = (id)objc_msgSend(v13, "error");
          result = 4;
          goto LABEL_17;
        default:
          result = 0;
LABEL_17:
          v15 = 0;
          if ((v8 & 1) != 0)
            goto LABEL_18;
          goto LABEL_11;
      }
      break;
    }
  }
  return 2;
}

@end
