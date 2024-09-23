@implementation TraceArgs

- (TraceArgs)init
{
  TraceArgs *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TraceArgs;
  result = -[TraceArgs init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_arg3 = 0u;
    *(_OWORD *)&result->_arg1 = 0u;
  }
  return result;
}

- (TraceArgs)initWithArg1:(unint64_t)a3
{
  TraceArgs *result;

  result = -[TraceArgs init](self, "init");
  if (result)
    result->_arg1 = a3;
  return result;
}

- (TraceArgs)initWithArg1:(unint64_t)a3 arg2:(unint64_t)a4
{
  TraceArgs *result;

  result = -[TraceArgs init](self, "init");
  if (result)
  {
    result->_arg1 = a3;
    result->_arg2 = a4;
  }
  return result;
}

- (TraceArgs)initWithArg1:(unint64_t)a3 arg2:(unint64_t)a4 arg3:(unint64_t)a5
{
  TraceArgs *result;

  result = -[TraceArgs init](self, "init");
  if (result)
  {
    result->_arg1 = a3;
    result->_arg2 = a4;
    result->_arg3 = a5;
  }
  return result;
}

- (TraceArgs)initWithArg1:(unint64_t)a3 arg2:(unint64_t)a4 arg3:(unint64_t)a5 arg4:(unint64_t)a6
{
  TraceArgs *result;

  result = -[TraceArgs init](self, "init", a3, a4, a5, a6);
  if (result)
  {
    result->_arg1 = a3;
    result->_arg2 = a4;
    result->_arg3 = a5;
  }
  return result;
}

- (unint64_t)arg1
{
  return self->_arg1;
}

- (void)setArg1:(unint64_t)a3
{
  self->_arg1 = a3;
}

- (unint64_t)arg2
{
  return self->_arg2;
}

- (void)setArg2:(unint64_t)a3
{
  self->_arg2 = a3;
}

- (unint64_t)arg3
{
  return self->_arg3;
}

- (void)setArg3:(unint64_t)a3
{
  self->_arg3 = a3;
}

- (unint64_t)arg4
{
  return self->_arg4;
}

- (void)setArg4:(unint64_t)a3
{
  self->_arg4 = a3;
}

@end
