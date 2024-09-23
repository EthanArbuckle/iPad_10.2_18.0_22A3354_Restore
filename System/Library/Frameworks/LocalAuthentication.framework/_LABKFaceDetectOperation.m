@implementation _LABKFaceDetectOperation

- (BKFaceDetectOperationDelegate)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_LABKFaceDetectOperation;
  -[_LABKOperation delegate](&v3, sel_delegate);
  return (BKFaceDetectOperationDelegate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)operation:(id)a3 faceDetectStateChanged:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a3;
  +[_LABKLog logClass:selector:message:](_LABKLog, "logClass:selector:message:", objc_opt_class(), a2, CFSTR("%@,%@"), v7, v10);

  -[_LABKFaceDetectOperation delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a2) = objc_opt_respondsToSelector();

  if ((a2 & 1) != 0)
  {
    -[_LABKFaceDetectOperation delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "operation:faceDetectStateChanged:", self, v10);

  }
}

@end
