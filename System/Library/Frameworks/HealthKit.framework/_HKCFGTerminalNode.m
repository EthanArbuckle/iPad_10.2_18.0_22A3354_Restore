@implementation _HKCFGTerminalNode

+ (id)nodeWithValue:(id)a3 rangeOfString:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  _QWORD *v8;
  void *v9;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v8 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithRangeOfString:", location, length);
  v9 = (void *)v8[3];
  v8[3] = v7;

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

- (id)evaluate
{
  return self->_value;
}

@end
