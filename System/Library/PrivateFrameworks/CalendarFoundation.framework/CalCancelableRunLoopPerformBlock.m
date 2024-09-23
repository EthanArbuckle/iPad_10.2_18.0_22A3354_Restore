@implementation CalCancelableRunLoopPerformBlock

- (CalCancelableRunLoopPerformBlock)initWithBlock:(id)a3 inRunLoop:(id)a4
{
  id v7;
  id v8;
  void *v9;
  CalCancelableRunLoopPerformBlock *v10;
  CalCancelableRunLoopPerformBlock *v11;
  void *v13;
  void *v14;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CalCancelableRunLoopPerformBlock.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CalCancelableRunLoopPerformBlock.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("runLoop != nil"));

LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)CalCancelableRunLoopPerformBlock;
  v10 = -[CalCancelableRunLoopPerformBlock init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_runLoop, a4);
    -[CalCancelableRunLoopPerformBlock setBlock:](v11, "setBlock:", v7);
  }

  return v11;
}

- (void)performAfterDelay:(double)a3
{
  void *v5;
  __CFRunLoop *v6;
  const void *v7;
  void *v8;
  _QWORD v9[6];

  -[CalCancelableRunLoopPerformBlock runLoop](self, "runLoop");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (__CFRunLoop *)objc_msgSend(v5, "getCFRunLoop");
  v7 = (const void *)*MEMORY[0x1E0C99748];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__CalCancelableRunLoopPerformBlock_performAfterDelay___block_invoke;
  v9[3] = &unk_1E2A846D0;
  v9[4] = self;
  *(double *)&v9[5] = a3;
  CFRunLoopPerformBlock(v6, v7, v9);

  -[CalCancelableRunLoopPerformBlock runLoop](self, "runLoop");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CFRunLoopWakeUp((CFRunLoopRef)objc_msgSend(v8, "getCFRunLoop"));

}

void __54__CalCancelableRunLoopPerformBlock_performAfterDelay___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "block");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "block");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x19400A168]();
    objc_msgSend(v3, "performSelector:withObject:afterDelay:", sel__performBlock_, v4, *(double *)(a1 + 40));

  }
}

- (void)cancel
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18FC12000, log, OS_LOG_TYPE_ERROR, "[CalCancelableRunLoopPerformBlock cancel] called after block was already canceled", v1, 2u);
}

- (void)_performBlock:(id)a3
{
  (*((void (**)(id, CalCancelableRunLoopPerformBlock *))a3 + 2))(a3, self);
}

- (NSRunLoop)runLoop
{
  return self->_runLoop;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_runLoop, 0);
}

@end
