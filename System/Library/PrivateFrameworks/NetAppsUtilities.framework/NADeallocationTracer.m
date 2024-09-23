@implementation NADeallocationTracer

- (NADeallocationTracer)initWithDelegate:(id)a3
{
  NADeallocationTracer *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NADeallocationTracer;
  result = -[NADeallocationTracer init](&v5, sel_init);
  if (result)
    result->_delegate = (NADeallocationTracerDelegate *)a3;
  return result;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NADeallocationTracer delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tracerIsDeallocating");

  v4.receiver = self;
  v4.super_class = (Class)NADeallocationTracer;
  -[NADeallocationTracer dealloc](&v4, sel_dealloc);
}

- (NADeallocationTracerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (NADeallocationTracerDelegate *)a3;
}

@end
