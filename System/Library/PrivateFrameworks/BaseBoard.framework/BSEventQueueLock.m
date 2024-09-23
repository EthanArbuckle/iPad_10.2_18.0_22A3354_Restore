@implementation BSEventQueueLock

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

- (void)dealloc
{
  objc_super v3;

  -[BSEventQueueLock relinquish](self, "relinquish");
  v3.receiver = self;
  v3.super_class = (Class)BSEventQueueLock;
  -[BSEventQueueLock dealloc](&v3, sel_dealloc);
}

- (void)relinquish
{
  if (!self->_relinquished)
  {
    self->_relinquished = 1;
    -[BSEventQueue _removeEventQueueLock:]((id *)&self->_eventQueue->super.isa, (uint64_t)self);
  }
}

- (BSEventQueueLock)initWithEventQueue:(id)a3 reason:(id)a4
{
  BSEventQueueLock *v8;
  BSEventQueueLock *v9;
  uint64_t v10;
  NSString *reason;
  void *v13;
  void *v14;
  objc_super v15;

  if (a4)
  {
    if (a3)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSEventQueueLock.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    if (a3)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSEventQueueLock.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventQueue"));

LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)BSEventQueueLock;
  v8 = -[BSEventQueueLock init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_eventQueue, a3);
    -[BSEventQueue _addEventQueueLock:]((id *)&v9->_eventQueue->super.isa, (uint64_t)v9);
    v10 = objc_msgSend(a4, "copy");
    reason = v9->_reason;
    v9->_reason = (NSString *)v10;

  }
  return v9;
}

- (id)description
{
  void *v3;
  void *v4;

  -[BSEventQueueLock reason](self, "reason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BSDescriptionBuilder descriptionForObject:withObjectsAndNames:](BSDescriptionBuilder, "descriptionForObject:withObjectsAndNames:", self, v3, CFSTR("reason"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)reason
{
  return self->_reason;
}

@end
