@implementation IKDOMXPathExpression

- (IKDOMXPathExpression)initWithAppContext:(id)a3 evaluatingBlock:(id)a4
{
  id v6;
  IKDOMXPathExpression *v7;
  uint64_t v8;
  id evaluatingBlock;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IKDOMXPathExpression;
  v7 = -[IKJSObject initWithAppContext:](&v11, sel_initWithAppContext_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    evaluatingBlock = v7->_evaluatingBlock;
    v7->_evaluatingBlock = (id)v8;

  }
  return v7;
}

- (id)evaluate:(id)a3 :(int64_t)a4 :(id)a5
{
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;

  v7 = a3;
  -[IKDOMXPathExpression evaluatingBlock](self, "evaluatingBlock");
  v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, int64_t))v8)[2](v8, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)evaluatingBlock
{
  return self->_evaluatingBlock;
}

- (void)setEvaluatingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_evaluatingBlock, 0);
}

@end
