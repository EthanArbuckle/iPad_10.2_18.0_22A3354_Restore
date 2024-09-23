@implementation _LABKMatchOperation

- (BKMatchOperationDelegate)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_LABKMatchOperation;
  -[_LABKOperation delegate](&v3, sel_delegate);
  return (BKMatchOperationDelegate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  objc_super v15;
  _QWORD v16[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  NSStringFromSelector(sel_biometricMethodResult);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "isEqualToString:", v13);

  if (v14)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __70___LABKMatchOperation_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v16[3] = &unk_1E707AAC8;
    v16[4] = self;
    -[_LABKOperation dispatchDelegateSelector:block:](self, "dispatchDelegateSelector:block:", sel_matchOperation_matchedWithResult_, v16);
  }
  v15.receiver = self;
  v15.super_class = (Class)_LABKMatchOperation;
  -[_LABKOperation observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);

}

- (void)matchOperation:(id)a3 matchedWithResult:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a3;
  +[_LABKLog logClass:selector:message:](_LABKLog, "logClass:selector:message:", objc_opt_class(), a2, CFSTR("%@,%@"), v7, v10);

  -[_LABKMatchOperation delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a2) = objc_opt_respondsToSelector();

  if ((a2 & 1) != 0)
  {
    -[_LABKMatchOperation delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "matchOperation:matchedWithResult:", self, v10);

  }
}

- (void)matchOperation:(id)a3 presenceDetectedInLockout:(int64_t)a4
{
  id v7;
  void *v8;
  char v9;
  id v10;

  v7 = a3;
  +[_LABKLog logClass:selector:message:](_LABKLog, "logClass:selector:message:", objc_opt_class(), a2, CFSTR("%@,%d"), v7, a4);

  -[_LABKMatchOperation delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[_LABKMatchOperation delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "matchOperation:presenceDetectedInLockout:", self, a4);

  }
}

- (void)matchOperation:(id)a3 failedWithReason:(int64_t)a4
{
  id v7;
  void *v8;
  char v9;
  id v10;

  v7 = a3;
  +[_LABKLog logClass:selector:message:](_LABKLog, "logClass:selector:message:", objc_opt_class(), a2, CFSTR("%@,%d"), v7, a4);

  -[_LABKMatchOperation delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[_LABKMatchOperation delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "matchOperation:failedWithReason:", self, a4);

  }
}

@end
