@implementation CRXUDeferredTrace

+ (id)deferredTraceWithCode:(unint64_t)a3 arg1:(unint64_t)a4 arg2:(unint64_t)a5 arg3:(unint64_t)a6 arg4:(unint64_t)a7
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithCode:arg1:arg2:arg3:arg4:", a3, a4, a5, a6, a7);
}

- (CRXUDeferredTrace)initWithCode:(unint64_t)a3 arg1:(unint64_t)a4 arg2:(unint64_t)a5 arg3:(unint64_t)a6 arg4:(unint64_t)a7
{
  CRXUDeferredTrace *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CRXUDeferredTrace;
  result = -[CRXUDeferredTrace init](&v13, sel_init);
  if (result)
  {
    result->_code = a3;
    result->_arg1 = a4;
    result->_arg2 = a5;
    result->_arg3 = a6;
    result->_arg4 = a7;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  kdebug_trace();
  v3.receiver = self;
  v3.super_class = (Class)CRXUDeferredTrace;
  -[CRXUDeferredTrace dealloc](&v3, sel_dealloc);
}

- (unint64_t)code
{
  return self->_code;
}

- (void)setCode:(unint64_t)a3
{
  self->_code = a3;
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
