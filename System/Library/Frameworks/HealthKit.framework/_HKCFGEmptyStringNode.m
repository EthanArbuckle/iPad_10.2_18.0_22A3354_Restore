@implementation _HKCFGEmptyStringNode

+ (id)nodeWithEvaluator:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithRangeOfString:", 0, 0);
  v6 = objc_msgSend(v4, "copy");

  v7 = (void *)v5[3];
  v5[3] = v6;

  return v5;
}

- (id)evaluate
{
  return (id)(*((uint64_t (**)(void))self->_evaluator + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_evaluator, 0);
}

@end
