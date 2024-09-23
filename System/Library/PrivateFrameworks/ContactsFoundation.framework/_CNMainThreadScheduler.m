@implementation _CNMainThreadScheduler

- (void)performBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNMainThreadScheduler schedulerForImmediateExecution](self, "schedulerForImmediateExecution");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performBlock:", v4);

}

- (id)performCancelableBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[_CNMainThreadScheduler schedulerForImmediateExecution](self, "schedulerForImmediateExecution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performCancelableBlock:qualityOfService:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)schedulerForImmediateExecution
{
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    -[_CNMainThreadScheduler inlineScheduler](self, "inlineScheduler");
  else
    -[_CNMainThreadScheduler jumpToMainScheduler](self, "jumpToMainScheduler");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (CNScheduler)jumpToMainScheduler
{
  return self->_jumpToMainScheduler;
}

- (CNScheduler)inlineScheduler
{
  return self->_inlineScheduler;
}

- (_CNMainThreadScheduler)init
{
  _CNMainThreadScheduler *v2;
  _CNInlineScheduler *v3;
  CNScheduler *inlineScheduler;
  _BOOL4 v5;
  __objc2_class **v6;
  CNScheduler *v7;
  CNScheduler *jumpToMainScheduler;
  _CNMainThreadScheduler *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_CNMainThreadScheduler;
  v2 = -[_CNMainThreadScheduler init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_CNInlineScheduler);
    inlineScheduler = v2->_inlineScheduler;
    v2->_inlineScheduler = (CNScheduler *)v3;

    v5 = +[_CNJumpToMainRunLoopScheduler isAvailable](_CNJumpToMainRunLoopScheduler, "isAvailable");
    v6 = off_1E29B6AD8;
    if (v5)
      v6 = off_1E29B6AE0;
    v7 = (CNScheduler *)objc_alloc_init(*v6);
    jumpToMainScheduler = v2->_jumpToMainScheduler;
    v2->_jumpToMainScheduler = v7;

    v9 = v2;
  }

  return v2;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[_CNMainThreadScheduler schedulerForDelayedExecution](self, "schedulerForDelayedExecution");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "afterDelay:performBlock:", v6, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)performBlock:(id)a3 qualityOfService:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[_CNMainThreadScheduler schedulerForImmediateExecution](self, "schedulerForImmediateExecution");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performBlock:qualityOfService:", v6, a4);

}

- (id)performCancelableBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[_CNMainThreadScheduler schedulerForImmediateExecution](self, "schedulerForImmediateExecution");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performCancelableBlock:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)afterDelay:(double)a3 performBlock:(id)a4 qualityOfService:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  -[_CNMainThreadScheduler schedulerForDelayedExecution](self, "schedulerForDelayedExecution");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "afterDelay:performBlock:qualityOfService:", v8, a5, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (double)timestamp
{
  void *v2;
  double v3;
  double v4;

  -[_CNMainThreadScheduler schedulerForImmediateExecution](self, "schedulerForImmediateExecution");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timestamp");
  v4 = v3;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jumpToMainScheduler, 0);
  objc_storeStrong((id *)&self->_inlineScheduler, 0);
}

@end
