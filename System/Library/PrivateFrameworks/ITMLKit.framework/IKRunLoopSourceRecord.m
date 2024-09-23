@implementation IKRunLoopSourceRecord

- (IKRunLoopSourceRecord)initWithEvaluateBlock:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  IKRunLoopSourceRecord *v8;
  uint64_t v9;
  id evaluateBlock;
  uint64_t v11;
  id completionBlock;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IKRunLoopSourceRecord;
  v8 = -[IKRunLoopSourceRecord init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    evaluateBlock = v8->_evaluateBlock;
    v8->_evaluateBlock = (id)v9;

    v11 = objc_msgSend(v7, "copy");
    completionBlock = v8->_completionBlock;
    v8->_completionBlock = (id)v11;

  }
  return v8;
}

- (id)evaluateBlock
{
  return self->_evaluateBlock;
}

- (void)setEvaluateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_evaluateBlock, 0);
}

@end
