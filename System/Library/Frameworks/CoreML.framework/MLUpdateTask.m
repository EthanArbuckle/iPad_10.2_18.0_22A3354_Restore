@implementation MLUpdateTask

- (MLUpdateTask)initWithModelAtURL:(id)a3 trainingData:(id)a4 configuration:(id)a5 progressHandlers:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  MLModelConfiguration *v15;
  id v16;
  MLUpdateTask *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  MLUpdatable *updatableModel;
  MLUpdateTask *v23;
  MLUpdateProgressHandlers *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  MLUpdateProgressHandlers *v28;
  NSObject *v29;
  dispatch_queue_t v30;
  OS_dispatch_queue *updateQueue;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v13 = a3;
  v14 = a4;
  v15 = (MLModelConfiguration *)a5;
  v16 = a6;
  v36.receiver = self;
  v36.super_class = (Class)MLUpdateTask;
  v17 = -[MLTask initWithState:](&v36, sel_initWithState_, 1);
  if (!v17)
    goto LABEL_10;
  v34 = v14;
  if (v15)
  {
    v18 = v13;
    v19 = -[MLModelConfiguration copy](v15, "copy");

    v15 = (MLModelConfiguration *)v19;
    v13 = v18;
  }
  else
  {
    v15 = objc_alloc_init(MLModelConfiguration);
  }
  v35 = 0;
  v33 = v13;
  +[MLLoader loadUpdatableModelFromAssetAtURL:configuration:error:](MLLoader, "loadUpdatableModelFromAssetAtURL:configuration:error:", v13, v15, &v35);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v35;
  updatableModel = v17->_updatableModel;
  v17->_updatableModel = (MLUpdatable *)v20;

  objc_storeStrong((id *)&v17->_updatableModelURL, a3);
  if (!v21)
  {
    v24 = [MLUpdateProgressHandlers alloc];
    v25 = objc_msgSend(v16, "interestedEvents");
    -[MLUpdateTask _progressHandlerBlock](v17, "_progressHandlerBlock");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLUpdateTask _completionHandlerBlock](v17, "_completionHandlerBlock");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[MLUpdateProgressHandlers initForEvents:progressHandler:completionHandler:](v24, "initForEvents:progressHandler:completionHandler:", v25, v26, v27);

    -[MLUpdatable setUpdateProgressHandlers:dispatchQueue:](v17->_updatableModel, "setUpdateProgressHandlers:dispatchQueue:", v28, 0);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = dispatch_queue_create("com.apple.coreml.mlupdatetask_update_queue", v29);
    updateQueue = v17->_updateQueue;
    v17->_updateQueue = (OS_dispatch_queue *)v30;

    objc_storeStrong((id *)&v17->_trainingData, a4);
    objc_storeStrong((id *)&v17->_progressHandlers, a6);
    v17->_updateHasStarted = 0;

    v13 = v33;
    v14 = v34;
LABEL_10:
    v23 = v17;
    goto LABEL_11;
  }
  if (a7)
    *a7 = objc_retainAutorelease(v21);

  v23 = 0;
  v13 = v33;
  v14 = v34;
LABEL_11:

  return v23;
}

- (void)resumeWithParameters:(NSDictionary *)updateParameters
{
  void *v4;
  void *v5;
  objc_super v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("kUpdateParametersKey");
  v4 = (void *)-[NSDictionary copy](updateParameters, "copy");
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)MLUpdateTask;
  -[MLTask resumeWithTaskContext:](&v6, sel_resumeWithTaskContext_, v5);

}

- (void)_invokeProgressHandlerForContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD);
  void (**v21)(_QWORD, _QWORD);
  id v22;

  v22 = a3;
  objc_msgSend(v22, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    -[MLUpdateTask updatableModel](self, "updatableModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLWritableWrappedModel wrapperAroundWritableModel:](MLWritableWrappedModel, "wrapperAroundWritableModel:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v7 = objc_msgSend(v22, "event");
  objc_msgSend(v22, "metrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "parameters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLUpdateContext updateContextWithTask:model:event:metrics:parameters:](MLUpdateContext, "updateContextWithTask:model:event:metrics:parameters:", self, v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v22, "event");
  -[MLUpdateTask progressHandlers](self, "progressHandlers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v11)
  {
    objc_msgSend(v12, "completionHandler");
    v21 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v21)[2](v21, v10);

    goto LABEL_9;
  }
  objc_msgSend(v12, "progressHandler");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
LABEL_9:

    goto LABEL_10;
  }
  v15 = (void *)v14;
  -[MLUpdateTask progressHandlers](self, "progressHandlers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "interestedEvents");
  v18 = objc_msgSend(v22, "event") & v17;

  if (v18)
  {
    -[MLUpdateTask progressHandlers](self, "progressHandlers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "progressHandler");
    v20 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v20)[2](v20, v10);

    objc_msgSend(v5, "clearInnerModelWithReason:", CFSTR("Model is no longer valid outside update callback"));
    -[MLTask resume](self, "resume");
  }
LABEL_10:

}

- (void)onCancellation
{
  id v2;

  -[MLUpdateTask updatableModel](self, "updatableModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelUpdate");

}

- (void)onResumptionWithTaskContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[5];

  v4 = a3;
  if (-[MLUpdateTask updateHasStarted](self, "updateHasStarted"))
  {
    if (v4
      && (objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kUpdateParametersKey")),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          v5))
    {
      -[MLUpdateTask updatableModel](self, "updatableModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kUpdateParametersKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "resumeUpdateWithParameters:", v7);

    }
    else
    {
      -[MLUpdateTask updatableModel](self, "updatableModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "resumeUpdate");
    }

  }
  else
  {
    -[MLUpdateTask setUpdateHasStarted:](self, "setUpdateHasStarted:", 1);
    -[MLUpdateTask updateQueue](self, "updateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__MLUpdateTask_onResumptionWithTaskContext___block_invoke;
    block[3] = &unk_1E3D66E48;
    block[4] = self;
    dispatch_async(v8, block);

  }
}

- (id)_progressHandlerBlock
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__MLUpdateTask__progressHandlerBlock__block_invoke;
  v4[3] = &unk_1E3D66A38;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (id)_completionHandlerBlock
{
  void *v2;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__MLUpdateTask__completionHandlerBlock__block_invoke;
  v4[3] = &unk_1E3D66A38;
  objc_copyWeak(&v5, &location);
  v2 = _Block_copy(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[MLUpdateTask updatableModelURL](self, "updatableModelURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("updatableModelURL: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v6);

  v7 = (void *)MEMORY[0x1E0CB3940];
  -[MLUpdateTask trainingData](self, "trainingData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLUpdateTask trainingData](self, "trainingData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("\ntrainingData: %@  count: %zd"), v8, objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v10);

  v11 = (void *)MEMORY[0x1E0CB3940];
  -[MLUpdateTask progressHandlers](self, "progressHandlers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("\nprogressHandlers: %@"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v13);

  v14 = (void *)MEMORY[0x1E0CB3940];
  -[MLTask taskStatesToString:](self, "taskStatesToString:", -[MLTask state](self, "state"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("\nstate: %@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v16);

  return (NSString *)v3;
}

- (MLUpdatable)updatableModel
{
  return self->_updatableModel;
}

- (MLBatchProvider)trainingData
{
  return self->_trainingData;
}

- (MLUpdateProgressHandlers)progressHandlers
{
  return self->_progressHandlers;
}

- (BOOL)updateHasStarted
{
  return self->_updateHasStarted;
}

- (void)setUpdateHasStarted:(BOOL)a3
{
  self->_updateHasStarted = a3;
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (NSURL)updatableModelURL
{
  return self->_updatableModelURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatableModelURL, 0);
  objc_storeStrong((id *)&self->_updateQueue, 0);
  objc_storeStrong((id *)&self->_progressHandlers, 0);
  objc_storeStrong((id *)&self->_trainingData, 0);
  objc_storeStrong((id *)&self->_updatableModel, 0);
}

void __39__MLUpdateTask__completionHandlerBlock__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v6, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v6, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "failWithError:taskContext:", v5, v6);

  }
  else
  {
    objc_msgSend(WeakRetained, "completeWithTaskContext:", v6);
  }

}

void __37__MLUpdateTask__progressHandlerBlock__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "suspendWithTaskContext:", v3);

}

void __44__MLUpdateTask_onResumptionWithTaskContext___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "updatableModel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "trainingData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateModelWithData:", v2);

}

+ (BOOL)updateModelAtURL:(id)a3 trainingData:(id)a4 configuration:(id)a5 writeToURL:(id)a6 error:(id *)a7
{
  return 1;
}

+ (MLUpdateTask)updateTaskForModelAtURL:(NSURL *)modelURL trainingData:(id)trainingData configuration:(MLModelConfiguration *)configuration completionHandler:(void *)completionHandler error:(NSError *)error
{
  void *v11;
  MLModelConfiguration *v12;
  id v13;
  NSURL *v14;
  MLUpdateProgressHandlers *v15;
  void *v16;

  v11 = completionHandler;
  v12 = configuration;
  v13 = trainingData;
  v14 = modelURL;
  v15 = -[MLUpdateProgressHandlers initForEvents:progressHandler:completionHandler:]([MLUpdateProgressHandlers alloc], "initForEvents:progressHandler:completionHandler:", 0, 0, v11);

  +[MLUpdateTask updateTaskForModelAtURL:trainingData:configuration:progressHandlers:error:](MLUpdateTask, "updateTaskForModelAtURL:trainingData:configuration:progressHandlers:error:", v14, v13, v12, v15, error);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLUpdateTask *)v16;
}

+ (MLUpdateTask)updateTaskForModelAtURL:(NSURL *)modelURL trainingData:(id)trainingData completionHandler:(void *)completionHandler error:(NSError *)error
{
  void *v9;
  id v10;
  NSURL *v11;
  MLModelConfiguration *v12;
  void *v13;

  v9 = completionHandler;
  v10 = trainingData;
  v11 = modelURL;
  v12 = objc_alloc_init(MLModelConfiguration);
  +[MLUpdateTask updateTaskForModelAtURL:trainingData:configuration:completionHandler:error:](MLUpdateTask, "updateTaskForModelAtURL:trainingData:configuration:completionHandler:error:", v11, v10, v12, v9, error);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLUpdateTask *)v13;
}

+ (MLUpdateTask)updateTaskForModelAtURL:(NSURL *)modelURL trainingData:(id)trainingData configuration:(MLModelConfiguration *)configuration progressHandlers:(MLUpdateProgressHandlers *)progressHandlers error:(NSError *)error
{
  MLUpdateProgressHandlers *v11;
  MLModelConfiguration *v12;
  id v13;
  NSURL *v14;
  MLUpdateTask *v15;

  v11 = progressHandlers;
  v12 = configuration;
  v13 = trainingData;
  v14 = modelURL;
  v15 = -[MLUpdateTask initWithModelAtURL:trainingData:configuration:progressHandlers:error:]([MLUpdateTask alloc], "initWithModelAtURL:trainingData:configuration:progressHandlers:error:", v14, v13, v12, v11, error);

  return v15;
}

+ (MLUpdateTask)updateTaskForModelAtURL:(NSURL *)modelURL trainingData:(id)trainingData progressHandlers:(MLUpdateProgressHandlers *)progressHandlers error:(NSError *)error
{
  MLUpdateProgressHandlers *v9;
  id v10;
  NSURL *v11;
  MLModelConfiguration *v12;
  void *v13;

  v9 = progressHandlers;
  v10 = trainingData;
  v11 = modelURL;
  v12 = objc_alloc_init(MLModelConfiguration);
  +[MLUpdateTask updateTaskForModelAtURL:trainingData:configuration:progressHandlers:error:](MLUpdateTask, "updateTaskForModelAtURL:trainingData:configuration:progressHandlers:error:", v11, v10, v12, v9, error);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (MLUpdateTask *)v13;
}

@end
