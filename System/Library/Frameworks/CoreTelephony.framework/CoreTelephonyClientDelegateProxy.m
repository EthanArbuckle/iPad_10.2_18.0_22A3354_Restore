@implementation CoreTelephonyClientDelegateProxy

- (CoreTelephonyClientDelegateProxy)initWithQueue:(queue)a3
{
  dispatch_object_s *v4;
  NSObject *fObj;

  v4 = *(dispatch_object_s **)a3.fObj.fObj;
  if (*(_QWORD *)a3.fObj.fObj)
    dispatch_retain(*(dispatch_object_t *)a3.fObj.fObj);
  fObj = self->_userQueue.fObj.fObj;
  self->_userQueue.fObj.fObj = v4;
  if (fObj)
    dispatch_release(fObj);
  return self;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  CoreTelephonyClientDelegateProxy *v8;
  id v9;
  NSObject *fObj;
  _QWORD *v11;
  CoreTelephonyClientDelegateProxy *v12;
  id *v13;
  id *v14;
  uint8_t buf[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained)
  {
    v6 = CTLogClient();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector((SEL)objc_msgSend(v4, "selector"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreTelephonyClientDelegateProxy forwardInvocation:].cold.1(v7, (uint64_t)WeakRetained, buf, v6);
    }
    objc_msgSend(v4, "retainArguments");
    v8 = self;
    v9 = v4;
    fObj = self->_userQueue.fObj.fObj;
    v11 = (_QWORD *)operator new();
    *v11 = v8;
    v11[1] = v9;
    v13 = 0;
    v14 = 0;
    v12 = v8;
    dispatch_async_f(fObj, v11, (dispatch_function_t)dispatch::async<-[CoreTelephonyClientDelegateProxy forwardInvocation:]::$_0>(dispatch_queue_s *,std::unique_ptr<-[CoreTelephonyClientDelegateProxy forwardInvocation:]::$_0>)::{lambda(void *)#1}::__invoke);
    std::unique_ptr<-[CoreTelephonyClientDelegateProxy forwardInvocation:]::$_0>::~unique_ptr[abi:nn180100](&v13);
    std::unique_ptr<-[CoreTelephonyClientDelegateProxy forwardInvocation:]::$_0>::~unique_ptr[abi:nn180100](&v14);

  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  BOOL *v4;
  objc_method_description MethodDescription;
  void *v6;

  v4 = (BOOL *)&-[CoreTelephonyClientDelegateProxy methodSignatureForSelector:]::opts;
  while (1)
  {
    MethodDescription = protocol_getMethodDescription((Protocol *)&unk_1EDD12A88, a3, *v4, v4[1]);
    if (MethodDescription.name)
      break;
    v4 += 2;
    if (v4 == (BOOL *)&jpt_18428B2BC)
    {
      v6 = 0;
      return v6;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", MethodDescription.types);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (void).cxx_destruct
{
  NSObject *fObj;

  objc_destroyWeak(&self->_delegate);
  fObj = self->_userQueue.fObj.fObj;
  if (fObj)
    dispatch_release(fObj);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (id)forwardInvocation:(id *)a1
{
  id *v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {

    MEMORY[0x186DBA454](v2, 0xC0C402DE288CCLL);
  }
  return a1;
}

- (id)forwardInvocation:(dispatch_queue_s *)
{
  id v2;
  id WeakRetained;
  id *v5;

  v5 = a1;
  v2 = a1[1];
  WeakRetained = objc_loadWeakRetained((id *)*a1 + 2);
  objc_msgSend(v2, "setTarget:", WeakRetained);

  objc_msgSend(a1[1], "invoke");
  return std::unique_ptr<-[CoreTelephonyClientDelegateProxy forwardInvocation:]::$_0>::~unique_ptr[abi:nn180100](&v5);
}

- (void)forwardInvocation:(uint8_t *)buf .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_18425C000, log, OS_LOG_TYPE_DEBUG, "Invoking \"%@\" for delegate %@", buf, 0x16u);

}

@end
