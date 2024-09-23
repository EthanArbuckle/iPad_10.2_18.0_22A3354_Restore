@implementation MTROperationalStateClusterOperationCompletionEvent

- (MTROperationalStateClusterOperationCompletionEvent)init
{
  MTROperationalStateClusterOperationCompletionEvent *v2;
  MTROperationalStateClusterOperationCompletionEvent *v3;
  NSNumber *completionErrorCode;
  NSNumber *totalOperationalTime;
  NSNumber *pausedTime;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTROperationalStateClusterOperationCompletionEvent;
  v2 = -[MTROperationalStateClusterOperationCompletionEvent init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    completionErrorCode = v2->_completionErrorCode;
    v2->_completionErrorCode = (NSNumber *)&unk_250591B18;

    totalOperationalTime = v3->_totalOperationalTime;
    v3->_totalOperationalTime = 0;

    pausedTime = v3->_pausedTime;
    v3->_pausedTime = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTROperationalStateClusterOperationCompletionEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;

  v4 = objc_alloc_init(MTROperationalStateClusterOperationCompletionEvent);
  objc_msgSend_completionErrorCode(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCompletionErrorCode_(v4, v8, (uint64_t)v7);

  objc_msgSend_totalOperationalTime(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTotalOperationalTime_(v4, v12, (uint64_t)v11);

  objc_msgSend_pausedTime(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPausedTime_(v4, v16, (uint64_t)v15);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: completionErrorCode:%@; totalOperationalTime:%@; pausedTime:%@; >"),
    v5,
    self->_completionErrorCode,
    self->_totalOperationalTime,
    self->_pausedTime);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)completionErrorCode
{
  return self->_completionErrorCode;
}

- (void)setCompletionErrorCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)totalOperationalTime
{
  return self->_totalOperationalTime;
}

- (void)setTotalOperationalTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)pausedTime
{
  return self->_pausedTime;
}

- (void)setPausedTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pausedTime, 0);
  objc_storeStrong((id *)&self->_totalOperationalTime, 0);
  objc_storeStrong((id *)&self->_completionErrorCode, 0);
}

@end
