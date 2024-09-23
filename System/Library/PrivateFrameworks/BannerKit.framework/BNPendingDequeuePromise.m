@implementation BNPendingDequeuePromise

- (BNPendingDequeuePromise)initWithPostingContext:(id)a3 dequeueBlock:(id)a4
{
  id v8;
  id v9;
  void *v10;
  BNPendingDequeuePromise *v11;
  BNPendingDequeuePromise *v12;
  uint64_t v13;
  id dequeueBlock;
  void *v16;
  void *v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNPresentableQueue.m"), 200, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("postingContext"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNPresentableQueue.m"), 201, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dequeueBlock"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)BNPendingDequeuePromise;
  v11 = -[BNPendingDequeuePromise init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_postingContext, a3);
    v13 = objc_msgSend(v10, "copy");
    dequeueBlock = v12->_dequeueBlock;
    v12->_dequeueBlock = (id)v13;

  }
  return v12;
}

- (BOOL)isValid
{
  return self->_dequeueBlock != 0;
}

- (void)dequeue
{
  id dequeueBlock;
  void *v4;
  id v5;

  v5 = (id)MEMORY[0x1BCCC21C4](self->_dequeueBlock, a2);
  dequeueBlock = self->_dequeueBlock;
  self->_dequeueBlock = 0;

  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, BNPostingContext *))v5 + 2))(v5, self->_postingContext);
    v4 = v5;
  }

}

- (BNPostingContext)postingContext
{
  return self->_postingContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postingContext, 0);
  objc_storeStrong(&self->_dequeueBlock, 0);
}

@end
