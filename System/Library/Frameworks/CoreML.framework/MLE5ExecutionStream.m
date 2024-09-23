@implementation MLE5ExecutionStream

- (MLE5ExecutionStream)init
{
  MLE5ExecutionStream *v2;
  uint64_t v3;
  NSObject *v4;
  NSArray *operations;
  MLE5ExecutionStreamOperationPool *operationPool;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *resetQueue;
  OS_dispatch_source *resetTimer;
  uint64_t last_error_message;
  objc_super v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)MLE5ExecutionStream;
  v2 = -[MLE5ExecutionStream init](&v13, sel_init);
  if (v2)
  {
    v3 = e5rt_execution_stream_create();
    if ((_DWORD)v3)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        last_error_message = e5rt_get_last_error_message();
        *(_DWORD *)buf = 136315394;
        v15 = last_error_message;
        v16 = 1024;
        v17 = v3;
        _os_log_error_impl(&dword_19C486000, v4, OS_LOG_TYPE_ERROR, "Failed to create a stream. E5RT: %s (%d)", buf, 0x12u);
      }

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Failed to create a stream. E5RT: %s (%d)"), e5rt_get_last_error_message(), v3);
    }
    operations = v2->_operations;
    v2->_operations = (NSArray *)MEMORY[0x1E0C9AA60];

    operationPool = v2->_operationPool;
    v2->_operationPool = 0;

    v2->_state = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.coreml.MLE5ExecutionStream.resetQueue", v7);
    resetQueue = v2->_resetQueue;
    v2->_resetQueue = (OS_dispatch_queue *)v8;

    resetTimer = v2->_resetTimer;
    v2->_resetTimer = 0;

  }
  return v2;
}

- (void)dealloc
{
  NSObject *resetTimer;
  objc_super v4;

  resetTimer = self->_resetTimer;
  if (resetTimer)
    dispatch_source_cancel(resetTimer);
  if (self->_streamHandle)
    e5rt_execution_stream_release();
  v4.receiver = self;
  v4.super_class = (Class)MLE5ExecutionStream;
  -[MLE5ExecutionStream dealloc](&v4, sel_dealloc);
}

- (BOOL)_reusableForInputFeatures:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MLE5ExecutionStream operations](self, "operations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[MLE5ExecutionStream operations](self, "operations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11 != 1)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        -[MLE5ExecutionStream operations](self, "operations");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134217984;
        v22 = objc_msgSend(v20, "count");
        _os_log_error_impl(&dword_19C486000, v12, OS_LOG_TYPE_ERROR, "MLE5ExecutionStream has %tu operations, which is unexpected.", buf, 0xCu);

      }
      v13 = (void *)MEMORY[0x1E0C99DA0];
      -[MLE5ExecutionStream operations](self, "operations");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");
      objc_msgSend(v13, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("MLE5ExecutionStream has %tu operations, which is unexpected."), v15);

    }
    -[MLE5ExecutionStream operations](self, "operations");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_msgSend(v17, "reusableForInputFeatures:options:", v6, v7);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)reusableForAsyncSubmissionForInputFeatures:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  v8 = -[MLE5ExecutionStream state](self, "state") == 2
    && -[MLE5ExecutionStream _reusableForInputFeatures:options:](self, "_reusableForInputFeatures:options:", v6, v7);

  return v8;
}

- (BOOL)reusableForSyncPredictionForInputFeatures:(id)a3 options:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  v8 = -[MLE5ExecutionStream state](self, "state") == 1
    && -[MLE5ExecutionStream _reusableForInputFeatures:options:](self, "_reusableForInputFeatures:options:", v6, v7);

  return v8;
}

- (BOOL)_prepareForInputFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t last_error_message;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  int v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v23 = a4;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[MLE5ExecutionStream operations](self, "operations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "prepareForInputFeatures:options:error:", v22, v23, a5) & 1) == 0)
        {

          v12 = 0;
          goto LABEL_24;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      if (v9)
        continue;
      break;
    }
  }

  -[MLE5ExecutionStream _setANEExecutionPriorityWithOptions:](self, "_setANEExecutionPriorityWithOptions:", v23);
  if (-[MLE5ExecutionStream state](self, "state") == 1)
  {
    v12 = 1;
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[MLE5ExecutionStream operations](self, "operations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v25;
      v16 = *MEMORY[0x1E0C99750];
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v17), "operationHandle");
          v18 = e5rt_execution_stream_encode_operation();
          if ((_DWORD)v18)
          {
            +[MLLogging coreChannel](MLLogging, "coreChannel");
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              last_error_message = e5rt_get_last_error_message();
              *(_DWORD *)buf = 136315394;
              v33 = last_error_message;
              v34 = 1024;
              v35 = v18;
              _os_log_error_impl(&dword_19C486000, v19, OS_LOG_TYPE_ERROR, "Failed to add operation to E5 stream. E5RT: %s (%d)", buf, 0x12u);
            }

            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v16, CFSTR("Failed to add operation to E5 stream. E5RT: %s (%d)"), e5rt_get_last_error_message(), v18);
          }
          ++v17;
        }
        while (v14 != v17);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      }
      while (v14);
    }

    v12 = 1;
    -[MLE5ExecutionStream setState:](self, "setState:", 1);
  }
LABEL_24:

  return v12;
}

- (BOOL)prepareAsyncSubmissionForInputFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t last_error_message;
  BOOL v20;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  int v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v23 = a4;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[MLE5ExecutionStream operations](self, "operations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "prepareAsyncSubmissionForInputFeatures:options:error:", v22, v23, a5) & 1) == 0)
        {

          v20 = 0;
          goto LABEL_24;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      if (v9)
        continue;
      break;
    }
  }

  -[MLE5ExecutionStream _setANEExecutionPriorityWithOptions:](self, "_setANEExecutionPriorityWithOptions:", v23);
  if (-[MLE5ExecutionStream state](self, "state") != 2)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[MLE5ExecutionStream operations](self, "operations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v25;
      v15 = *MEMORY[0x1E0C99750];
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v16), "operationHandle");
          v17 = e5rt_execution_stream_encode_operation();
          if ((_DWORD)v17)
          {
            +[MLLogging coreChannel](MLLogging, "coreChannel");
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              last_error_message = e5rt_get_last_error_message();
              *(_DWORD *)buf = 136315394;
              v33 = last_error_message;
              v34 = 1024;
              v35 = v17;
              _os_log_error_impl(&dword_19C486000, v18, OS_LOG_TYPE_ERROR, "Failed to add operation to E5 stream. E5RT: %s (%d)", buf, 0x12u);
            }

            objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v15, CFSTR("Failed to add operation to E5 stream. E5RT: %s (%d)"), e5rt_get_last_error_message(), v17);
          }
          ++v16;
        }
        while (v13 != v16);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      }
      while (v13);
    }

    -[MLE5ExecutionStream setState:](self, "setState:", 2);
  }
  v20 = 1;
LABEL_24:

  return v20;
}

- (BOOL)setupOperationForInputFeatures:(id)a3 operationPool:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "takeOutOperationForFeatures:error:", v8, a5);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
  {
    v14[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLE5ExecutionStream setOperations:](self, "setOperations:", v12);

    -[MLE5ExecutionStream setOperationPool:](self, "setOperationPool:", v9);
  }

  return v11 != 0;
}

- (BOOL)executeForInputFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  BOOL v10;

  v8 = a3;
  v9 = a4;
  v10 = -[MLE5ExecutionStream _prepareForInputFeatures:options:error:](self, "_prepareForInputFeatures:options:error:", v8, v9, a5)&& -[MLE5ExecutionStream _executeStream:error:](self, "_executeStream:error:", self->_streamHandle, a5);

  return v10;
}

- (BOOL)_executeStream:(e5rt_execution_stream *)a3 error:(id *)a4
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint8_t buf[4];
  uint64_t last_error_message;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  v5 = e5rt_execution_stream_execute_sync();
  if ((_DWORD)v5)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      last_error_message = e5rt_get_last_error_message();
      v11 = 1024;
      v12 = v5;
      _os_log_error_impl(&dword_19C486000, v6, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
    }

    if (a4)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("E5RT: %s (%d)"), e5rt_get_last_error_message(), v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, v7, CFSTR("Unable to compute the prediction using ML Program. It can be an invalid input data or broken/unsupported model."));
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  kdebug_trace();
  return (_DWORD)v5 == 0;
}

- (void)submitWithCompletionHandler:(id)a3
{
  id v4;
  _DWORD *v5;
  id v6;
  void (**v7)(void *, unint64_t, _QWORD, uint64_t);
  uint64_t v8;
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v13;
  MLE5ExecutionStream *v14;
  id v15;
  _QWORD *v16;
  _QWORD v17[6];
  _DWORD *v18;

  v4 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3812000000;
  v17[3] = __Block_byref_object_copy__20334;
  v17[4] = __Block_byref_object_dispose__20335;
  v17[5] = 0;
  v5 = (_DWORD *)operator new();
  *v5 = 0;
  v18 = v5;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __51__MLE5ExecutionStream_submitWithCompletionHandler___block_invoke;
  v13 = &unk_1E3D669C8;
  v16 = v17;
  v14 = self;
  v6 = v4;
  v15 = v6;
  v7 = (void (**)(void *, unint64_t, _QWORD, uint64_t))_Block_copy(&v10);
  -[MLE5ExecutionStream streamHandle](self, "streamHandle", v10, v11, v12, v13, v14);
  v8 = e5rt_execution_stream_submit_async();
  if ((_DWORD)v8)
    v7[2](v7, -[MLE5ExecutionStream streamId](self, "streamId"), 0, v8);

  _Block_object_dispose(v17, 8);
  v9 = v18;
  v18 = 0;
  if (v9)
    MEMORY[0x1A1AD6260](v9, 0x1000C4052888210);

}

- (int)_aneExecutionPriorityForQos:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v3 = *(_QWORD *)&a3;
  v8 = *MEMORY[0x1E0C80C00];
  if ((int)a3 <= 20)
  {
    switch(a3)
    {
      case 0u:
        return 5;
      case 9u:
        return 7;
      case 0x11u:
        return 5;
    }
    goto LABEL_12;
  }
  if (a3 != 21)
  {
    if (a3 == 33)
      return 3;
    if (a3 == 25)
      return 4;
LABEL_12:
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v7 = v3;
      _os_log_error_impl(&dword_19C486000, v5, OS_LOG_TYPE_ERROR, "Unable to find the correspondent e5rt_ane_execution_priority_t for qos %u", buf, 8u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unable to find the correspondent e5rt_ane_execution_priority_t for qos %u"), v3);
  }
  return 5;
}

- (void)_setANEExecutionPriorityWithOptions:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t last_error_message;
  uint8_t buf[4];
  _BYTE v13[14];
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "reconcileExecutionPriorityWithCurrentQoS:", qos_class_self());
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == CFSTR("MLANEExecutionPriority_2"))
  {
    v8 = 2;
    goto LABEL_17;
  }
  if (v5 == CFSTR("MLANEExecutionPriority_3"))
  {
    v8 = 3;
    goto LABEL_17;
  }
  if (v5 == CFSTR("MLANEExecutionPriority_4"))
  {
    v8 = 4;
    goto LABEL_17;
  }
  if (v5 == CFSTR("MLANEExecutionPriority_5"))
    goto LABEL_14;
  if (v5 == CFSTR("MLANEExecutionPriority_6"))
  {
    v8 = 6;
    goto LABEL_17;
  }
  if (v5 == CFSTR("MLANEExecutionPriority_7"))
  {
    v8 = 7;
    goto LABEL_17;
  }
  if (v5 == CFSTR("MLANEExecutionPriority_Unspecified"))
  {
LABEL_14:
    v8 = 5;
    goto LABEL_17;
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v13 = v6;
    _os_log_error_impl(&dword_19C486000, v7, OS_LOG_TYPE_ERROR, "Unrecognized ANE execution priority %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unrecognized ANE execution priority %@"), v6);
  v8 = 0;
LABEL_17:
  -[MLE5ExecutionStream streamHandle](self, "streamHandle");
  v9 = e5rt_execution_stream_set_ane_execution_priority();
  if ((_DWORD)v9)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      last_error_message = e5rt_get_last_error_message();
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v13 = v8;
      *(_WORD *)&v13[4] = 2080;
      *(_QWORD *)&v13[6] = last_error_message;
      v14 = 1024;
      v15 = v9;
      _os_log_error_impl(&dword_19C486000, v10, OS_LOG_TYPE_ERROR, "Failed to set execution priority %u for ane operations E5RT: %s (%d)", buf, 0x18u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Failed to set execution priority %u for ane operations E5RT: %s (%d)"), v8, e5rt_get_last_error_message(), v9);
  }

}

- (void)resetAfterLingering:(double)a3
{
  void *v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  if (a3 == 0.0)
  {
    -[MLE5ExecutionStream _reset](self, "_reset");
  }
  else
  {
    -[MLE5ExecutionStream resetTimer](self, "resetTimer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[MLE5ExecutionStream resetTimer](self, "resetTimer");
      v6 = objc_claimAutoreleasedReturnValue();
      dispatch_suspend(v6);
    }
    else
    {
      v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_resetQueue);
      -[MLE5ExecutionStream setResetTimer:](self, "setResetTimer:", v6);
    }

    -[MLE5ExecutionStream resetTimer](self, "resetTimer");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);

    objc_initWeak(&location, self);
    -[MLE5ExecutionStream resetTimer](self, "resetTimer");
    v9 = objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __43__MLE5ExecutionStream_resetAfterLingering___block_invoke;
    v14 = &unk_1E3D669F0;
    objc_copyWeak(&v15, &location);
    dispatch_source_set_event_handler(v9, &v11);

    -[MLE5ExecutionStream resetTimer](self, "resetTimer", v11, v12, v13, v14);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v10);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)cancelPendingReset
{
  void *v3;
  NSObject *v4;
  NSObject *v5;

  -[MLE5ExecutionStream resetTimer](self, "resetTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MLE5ExecutionStream resetTimer](self, "resetTimer");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v4);

    -[MLE5ExecutionStream resetQueue](self, "resetQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_barrier_sync(v5, &__block_literal_global_45_20323);

  }
}

- (void)_reset
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  uint64_t last_error_message;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (-[MLE5ExecutionStream streamHandle](self, "streamHandle"))
  {
    -[MLE5ExecutionStream streamHandle](self, "streamHandle");
    v3 = e5rt_execution_stream_reset();
    if ((_DWORD)v3)
    {
      v4 = v3;
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        last_error_message = e5rt_get_last_error_message();
        v19 = 1024;
        v20 = v4;
        _os_log_error_impl(&dword_19C486000, v5, OS_LOG_TYPE_ERROR, "Failed to reset the stream. E5RT: %s (%d)", buf, 0x12u);
      }

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Failed to reset the stream. E5RT: %s (%d)"), e5rt_get_last_error_message(), v4);
    }
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[MLE5ExecutionStream operations](self, "operations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "reset");
        -[MLE5ExecutionStream operationPool](self, "operationPool");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "putBack:", v10);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[MLE5ExecutionStream setOperations:](self, "setOperations:", MEMORY[0x1E0C9AA60]);
  -[MLE5ExecutionStream setOperationPool:](self, "setOperationPool:", 0);
  -[MLE5ExecutionStream setState:](self, "setState:", 0);
}

- (unint64_t)streamId
{
  NSObject *v2;
  uint8_t v4[8];
  unint64_t v5;

  v5 = 0;
  if (e5rt_execution_stream_get_stream_id())
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl(&dword_19C486000, v2, OS_LOG_TYPE_ERROR, "Unexpected failure when getting execution stream id.", v4, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unexpected failure when getting execution stream id."));
  }
  return v5;
}

- (NSArray)operations
{
  return self->_operations;
}

- (void)setOperations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (MLE5ExecutionStreamOperationPool)operationPool
{
  return self->_operationPool;
}

- (void)setOperationPool:(id)a3
{
  objc_storeStrong((id *)&self->_operationPool, a3);
}

- (e5rt_execution_stream)streamHandle
{
  return self->_streamHandle;
}

- (void)setStreamHandle:(e5rt_execution_stream *)a3
{
  self->_streamHandle = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (OS_dispatch_queue)resetQueue
{
  return self->_resetQueue;
}

- (OS_dispatch_source)resetTimer
{
  return self->_resetTimer;
}

- (void)setResetTimer:(id)a3
{
  objc_storeStrong((id *)&self->_resetTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resetTimer, 0);
  objc_storeStrong((id *)&self->_resetQueue, 0);
  objc_storeStrong((id *)&self->_operationPool, 0);
  objc_storeStrong((id *)&self->_operations, 0);
}

void __43__MLE5ExecutionStream_resetAfterLingering___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_reset");

}

void __51__MLE5ExecutionStream_submitWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  uint8_t buf[4];
  uint64_t last_error_message;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = *(unsigned int **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48);
  do
    v8 = __ldaxr(v7);
  while (__stlxr(v8 + 1, v7));
  if (v8 < 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "operations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v9 = objc_claimAutoreleasedReturnValue();

    -[NSObject asyncSubmissionError](v9, "asyncSubmissionError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = *(_QWORD *)(a1 + 40);
      -[NSObject asyncSubmissionError](v9, "asyncSubmissionError");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

      goto LABEL_19;
    }
    if ((_DWORD)a4 == 10)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        last_error_message = e5rt_get_last_error_message();
        v22 = 1024;
        v23 = 10;
        _os_log_error_impl(&dword_19C486000, v16, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
      }

      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("E5RT: %s (%d)"), e5rt_get_last_error_message(), 10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, v17, CFSTR("Timeout occurred while computing the asynchronous prediction using ML Program."));
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!(_DWORD)a4)
      {
        v14 = 0;
        -[NSObject outputFeatures](v9, "outputFeatures");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

        goto LABEL_19;
      }
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        last_error_message = e5rt_get_last_error_message();
        v22 = 1024;
        v23 = a4;
        _os_log_error_impl(&dword_19C486000, v19, OS_LOG_TYPE_ERROR, "E5RT: %s (%d)", buf, 0x12u);
      }

      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("E5RT: %s (%d)"), e5rt_get_last_error_message(), a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, v17, CFSTR("Unable to compute the asynchronous prediction using ML Program. It can be an invalid input data or broken/unsupported model."));
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v18;

    v15 = 0;
    goto LABEL_18;
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    last_error_message = a2;
    v22 = 1024;
    v23 = a4;
    _os_log_error_impl(&dword_19C486000, v9, OS_LOG_TYPE_ERROR, "e5rt_execution_stream_submit_async called the completion handler more than once for stream_id = %llu and error: %d", buf, 0x12u);
  }
LABEL_19:

}

@end
