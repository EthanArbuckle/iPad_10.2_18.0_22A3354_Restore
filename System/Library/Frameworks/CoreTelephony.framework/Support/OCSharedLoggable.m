@implementation OCSharedLoggable

- (OsLogContext)getLogContext
{
  ctu::OsLogContext *v2;
  char *v3;
  os_log_s *v4;
  OsLogContext result;

  v3 = (char *)ctu::OsLogContext::OsLogContext(v2, (const ctu::OsLogContext *)&self->_logContext);
  result.handle.fRef = v4;
  result.domain = v3;
  return result;
}

- (queue)getQueue
{
  NSObject **v2;
  NSObject *fObj;

  fObj = self->_queue.fObj.fObj;
  *v2 = fObj;
  if (fObj)
    dispatch_retain(fObj);
  return (queue)fObj;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (void).cxx_destruct
{
  NSObject *fObj;

  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)&self->_logContext);
  fObj = self->_queue.fObj.fObj;
  if (fObj)
    dispatch_release(fObj);
}

- (OCSharedLoggable)initWithQueue:(queue)a3 logContext:(OsLogContext)a4
{
  OCSharedLoggable *v5;
  OCSharedLoggable *v6;
  dispatch_object_s *v7;
  NSObject *fObj;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OCSharedLoggable;
  v5 = -[OCSharedLoggable init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = *(dispatch_object_s **)a3.fObj.fObj;
    *(_QWORD *)a3.fObj.fObj = 0;
    fObj = v5->_queue.fObj.fObj;
    v6->_queue.fObj.fObj = v7;
    if (fObj)
      dispatch_release(fObj);
    ctu::OsLogContext::operator=();
  }
  return v6;
}

- (void)executeFunction:(function<void)(
{
  NSObject *fObj;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  fObj = self->_queue.fObj.fObj;
  v5 = (void *)operator new();
  std::__function::__value_func<void ()(void)>::__value_func[abi:ne180100]((uint64_t)v5, (uint64_t)a3);
  v6 = 0;
  v7 = 0;
  dispatch_async_f(fObj, v5, (dispatch_function_t)dispatch::async<std::function<void ()(void)>>(dispatch_queue_s *,std::unique_ptr<std::function<void ()(void)>>)::{lambda(void *)#1}::__invoke);
  std::unique_ptr<std::function<void ()(void)>>::reset[abi:ne180100](&v6);
  std::unique_ptr<std::function<void ()(void)>>::reset[abi:ne180100](&v7);
}

- (OCSharedLoggable)initWithName:(const char *)a3 qosClass:(unsigned int)a4 logContext:(OsLogContext)a5
{
  char *domain;
  NSObject *v8;
  OCSharedLoggable *v9;
  _BYTE v11[16];
  dispatch_object_t object;

  domain = a5.domain;
  v8 = dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a4, 0);
  object = dispatch_queue_create(a3, v8);
  ctu::OsLogContext::OsLogContext((ctu::OsLogContext *)v11, (const ctu::OsLogContext *)domain);
  v9 = -[OCSharedLoggable initWithQueue:logContext:](self, "initWithQueue:logContext:", &object, v11);
  ctu::OsLogContext::~OsLogContext((ctu::OsLogContext *)v11);
  if (object)
    dispatch_release(object);
  return v9;
}

- (void)executeBlock:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_queue.fObj.fObj, a3);
}

- (void)setQueue:(queue)a3
{
  dispatch_object_s *v4;
  NSObject *fObj;

  v4 = *(dispatch_object_s **)a3.fObj.fObj;
  if (*(_QWORD *)a3.fObj.fObj)
    dispatch_retain(*(dispatch_object_t *)a3.fObj.fObj);
  fObj = self->_queue.fObj.fObj;
  self->_queue.fObj.fObj = v4;
  if (fObj)
    dispatch_release(fObj);
}

- (void)setLogContext:(OsLogContext)a3
{
  ctu::OsLogContext::operator=();
}

@end
