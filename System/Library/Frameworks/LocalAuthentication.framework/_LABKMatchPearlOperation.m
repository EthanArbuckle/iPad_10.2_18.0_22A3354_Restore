@implementation _LABKMatchPearlOperation

- (BKMatchPearlOperationDelegate)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_LABKMatchPearlOperation;
  -[_LABKMatchOperation delegate](&v3, sel_delegate);
  return (BKMatchPearlOperationDelegate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)matchOperation:(id)a3 providedFeedback:(int64_t)a4
{
  id v7;
  void *v8;
  char v9;
  id v10;

  v7 = a3;
  +[_LABKLog logClass:selector:message:](_LABKLog, "logClass:selector:message:", objc_opt_class(), a2, CFSTR("%@,%d"), v7, a4);

  -[_LABKMatchPearlOperation delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[_LABKMatchPearlOperation delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "matchOperation:providedFeedback:", self, a4);

  }
}

- (void)matchOperation:(id)a3 providedFaceOcclusionInfo:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a3;
  +[_LABKLog logClass:selector:message:](_LABKLog, "logClass:selector:message:", objc_opt_class(), a2, CFSTR("%@,%@"), v7, v10);

  -[_LABKMatchPearlOperation delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a2) = objc_opt_respondsToSelector();

  if ((a2 & 1) != 0)
  {
    -[_LABKMatchPearlOperation delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "matchOperation:providedFaceOcclusionInfo:", self, v10);

  }
}

- (void)matchOperation:(id)a3 providedFaceWUPoseEligibilityInfo:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a3;
  +[_LABKLog logClass:selector:message:](_LABKLog, "logClass:selector:message:", objc_opt_class(), a2, CFSTR("%@,%@"), v7, v10);

  -[_LABKMatchPearlOperation delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a2) = objc_opt_respondsToSelector();

  if ((a2 & 1) != 0)
  {
    -[_LABKMatchPearlOperation delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "matchOperation:providedFaceWUPoseEligibilityInfo:", self, v10);

  }
}

- (void)matchOperation:(id)a3 requestedPasscodeShortcutWithReason:(unint64_t)a4
{
  id v7;
  void *v8;
  char v9;
  id v10;

  v7 = a3;
  +[_LABKLog logClass:selector:message:](_LABKLog, "logClass:selector:message:", objc_opt_class(), a2, CFSTR("%@,%d"), v7, a4);

  -[_LABKMatchPearlOperation delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[_LABKMatchPearlOperation delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "matchOperation:requestedPasscodeShortcutWithReason:", self, a4);

  }
}

@end
