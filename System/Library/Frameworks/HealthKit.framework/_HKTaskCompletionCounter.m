@implementation _HKTaskCompletionCounter

+ (id)counterWithTargetCount:(int64_t)a3 queue:(id)a4 completion:(id)a5
{
  id v10;
  id v11;
  void *v12;
  _HKTaskCompletionCounter *v13;
  void *v14;
  id completion;
  void *v17;
  void *v18;

  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKUtilities.m"), 205, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue != NULL"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKUtilities.m"), 206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != NULL"));

LABEL_3:
  v13 = objc_alloc_init(_HKTaskCompletionCounter);
  if (v13)
  {
    v14 = _Block_copy(v12);
    completion = v13->_completion;
    v13->_completion = v14;

    objc_storeStrong((id *)&v13->_queue, a4);
    v13->_target = a3;
  }

  return v13;
}

- (void)decrementCounter
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44___HKTaskCompletionCounter_decrementCounter__block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)incrementCounter
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44___HKTaskCompletionCounter_incrementCounter__block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)allTasksEnqueued
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44___HKTaskCompletionCounter_allTasksEnqueued__block_invoke;
  block[3] = &unk_1E37E6770;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_invalidate
{
  id completion;

  completion = self->_completion;
  self->_completion = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
