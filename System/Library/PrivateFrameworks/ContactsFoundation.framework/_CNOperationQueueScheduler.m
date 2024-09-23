@implementation _CNOperationQueueScheduler

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  CNOperationQueueSchedulerCancelationToken *v7;
  uint64_t v8;
  id v9;
  CNOperationQueueSchedulerCancelationToken *v10;
  void *v11;
  void *v12;
  void *v13;
  CNOperationQueueSchedulerCancelationToken *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;
  _QWORD aBlock[4];
  CNOperationQueueSchedulerCancelationToken *v23;
  id v24;

  v6 = a3;
  v7 = objc_alloc_init(CNOperationQueueSchedulerCancelationToken);
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70___CNOperationQueueScheduler_performCancelableBlock_qualityOfService___block_invoke;
  aBlock[3] = &unk_1E29B8D88;
  v9 = v6;
  v24 = v9;
  v10 = v7;
  v23 = v10;
  v11 = _Block_copy(aBlock);
  -[_CNOperationQueueScheduler blockWithCurrentQualityOfServiceForBlock:ifAllowedForRequestedQualityOfService:](self, "blockWithCurrentQualityOfServiceForBlock:ifAllowedForRequestedQualityOfService:", v11, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "operationWithQualityOfService:block:", a4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v13);
  v16 = v8;
  v17 = 3221225472;
  v18 = __70___CNOperationQueueScheduler_performCancelableBlock_qualityOfService___block_invoke_2;
  v19 = &unk_1E29BA1A8;
  objc_copyWeak(&v20, &location);
  -[CNCancelationToken addCancelationBlock:](v10, "addCancelationBlock:", &v16);
  -[NSOperationQueue addOperation:](self->_queue, "addOperation:", v13, v16, v17, v18, v19);
  v14 = v10;
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v14;
}

- (id)blockWithCurrentQualityOfServiceForBlock:(id)a3 ifAllowedForRequestedQualityOfService:(unint64_t)a4
{
  id v6;
  void *v7;
  dispatch_block_t v8;
  void *v9;

  v6 = a3;
  v7 = _Block_copy(v6);
  if (!a4 && !self->_isQualityOfServiceSpecified)
  {
    v8 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v6);

    v7 = v8;
  }
  v9 = _Block_copy(v7);

  return v9;
}

+ (id)operationWithQualityOfService:(unint64_t)a3 block:(id)a4
{
  void *v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (a3 - 2 >= 4)
    v7 = -1;
  else
    v7 = 8 * (a3 - 2) + 9;
  if (objc_msgSend(v5, "qualityOfService") != v7)
    objc_msgSend(v6, "setQualityOfService:", v7);
  return v6;
}

- (void)performBlock:(id)a3
{
  -[_CNOperationQueueScheduler performBlock:qualityOfService:](self, "performBlock:qualityOfService:", a3, 0);
}

- (double)timestamp
{
  double result;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return result;
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;

  -[_CNOperationQueueScheduler blockWithCurrentQualityOfServiceForBlock:ifAllowedForRequestedQualityOfService:](self, "blockWithCurrentQualityOfServiceForBlock:ifAllowedForRequestedQualityOfService:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_CNOperationQueueScheduler _enqueueBlock:qualityOfService:](self, "_enqueueBlock:qualityOfService:", v6, a4);

}

- (void)_enqueueBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "operationWithQualityOfService:block:", a4, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NSOperationQueue addOperation:](self->_queue, "addOperation:", v7);
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v8;
  CNOperationQueueSchedulerCancelationToken *v9;
  void *v10;
  void *v11;
  CNOperationQueueSchedulerCancelationToken *v12;
  id v13;
  void *v14;
  CNOperationQueueSchedulerCancelationToken *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  CNOperationQueueSchedulerCancelationToken *v21;
  _CNOperationQueueScheduler *v22;
  id v23;
  unint64_t v24;

  v8 = a4;
  v9 = objc_alloc_init(CNOperationQueueSchedulerCancelationToken);
  -[_CNOperationQueueScheduler blockWithCurrentQualityOfServiceForBlock:ifAllowedForRequestedQualityOfService:](self, "blockWithCurrentQualityOfServiceForBlock:ifAllowedForRequestedQualityOfService:", v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNScheduler globalAsyncScheduler](CNScheduler, "globalAsyncScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __71___CNOperationQueueScheduler_afterDelay_performBlock_qualityOfService___block_invoke;
  v20 = &unk_1E29BA1D0;
  v12 = v9;
  v21 = v12;
  v22 = self;
  v23 = v10;
  v24 = a5;
  v13 = v10;
  objc_msgSend(v11, "afterDelay:performBlock:", &v17, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNCancelationToken addCancelable:](v12, "addCancelable:", v14, v17, v18, v19, v20);
  v15 = v12;

  return v15;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  return -[_CNOperationQueueScheduler afterDelay:performBlock:qualityOfService:](self, "afterDelay:performBlock:qualityOfService:", a4, 0, a3);
}

- (_CNOperationQueueScheduler)initWithMaxConcurrentOperationCount:(int64_t)a3 qualityOfService:(unint64_t)a4
{
  _CNOperationQueueScheduler *v6;
  NSOperationQueue *v7;
  NSOperationQueue *queue;
  uint64_t v9;
  _CNOperationQueueScheduler *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_CNOperationQueueScheduler;
  v6 = -[_CNOperationQueueScheduler init](&v12, sel_init);
  if (v6)
  {
    v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    queue = v6->_queue;
    v6->_queue = v7;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v6->_queue, "setMaxConcurrentOperationCount:", a3);
    v9 = 33;
    switch(a4)
    {
      case 0uLL:
        goto LABEL_8;
      case 2uLL:
        v9 = 9;
        goto LABEL_7;
      case 3uLL:
        v9 = 17;
        goto LABEL_7;
      case 4uLL:
        v9 = 25;
        goto LABEL_7;
      case 5uLL:
        goto LABEL_7;
      default:
        v9 = -1;
LABEL_7:
        -[NSOperationQueue setQualityOfService:](v6->_queue, "setQualityOfService:", v9);
        v6->_isQualityOfServiceSpecified = 1;
LABEL_8:
        v10 = v6;
        break;
    }
  }

  return v6;
}

- (_CNOperationQueueScheduler)initWithMaxConcurrentOperationCount:(int64_t)a3
{
  return -[_CNOperationQueueScheduler initWithMaxConcurrentOperationCount:qualityOfService:](self, "initWithMaxConcurrentOperationCount:qualityOfService:", a3, 0);
}

- (_CNOperationQueueScheduler)init
{
  return -[_CNOperationQueueScheduler initWithMaxConcurrentOperationCount:qualityOfService:](self, "initWithMaxConcurrentOperationCount:qualityOfService:", -1, 0);
}

- (_CNOperationQueueScheduler)initWithQualityOfService:(unint64_t)a3
{
  return -[_CNOperationQueueScheduler initWithMaxConcurrentOperationCount:qualityOfService:](self, "initWithMaxConcurrentOperationCount:qualityOfService:", -1, a3);
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", CFSTR("width"), -[NSOperationQueue maxConcurrentOperationCount](self->_queue, "maxConcurrentOperationCount"));
  v5 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", CFSTR("blocks"), -[NSOperationQueue operationCount](self->_queue, "operationCount"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)performCancelableBlock:(id)a3
{
  return -[_CNOperationQueueScheduler performCancelableBlock:qualityOfService:](self, "performCancelableBlock:qualityOfService:", a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
