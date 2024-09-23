@implementation __NSCFURLLocalTCPIOStreamTaskFromDataTask

- (__NSCFURLLocalTCPIOStreamTaskFromDataTask)initWithTask:(id)a3 connection:(shared_ptr<TransportConnection>)a4 extraBytes:(id)a5 disavow:(id)a6
{
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  __NSCFURLLocalTCPIOStreamTaskFromDataTask *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  objc_super v14;
  uint64_t v15;
  std::__shared_weak_count *v16;

  v6 = (std::__shared_weak_count *)*((_QWORD *)a4.__ptr_ + 1);
  v15 = *(_QWORD *)a4.__ptr_;
  v16 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v14.receiver = self;
  v14.super_class = (Class)__NSCFURLLocalTCPIOStreamTaskFromDataTask;
  v9 = -[__NSCFTCPIOStreamTask initWithTask:connection:extraBytes:disavow:](&v14, sel_initWithTask_connection_extraBytes_disavow_, a3, &v15, a4.__cntrl_, a5, a6);
  v10 = v16;
  if (v16)
  {
    v11 = (unint64_t *)&v16->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  __NSCFURLLocalTCPIOStreamTaskFromDataTask *v4;

  v4 = self;
  return self;
}

- (void)connection:(id)a3 _conditionalRequirementsChanged:(BOOL)a4
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  subclassMissingImplementation((objc_selector *)a2, v5);
}

- (void)connection:(id)a3 _willSendRequestForEstablishedConnection:(id)a4 completion:(id)a5
{
  objc_class *v6;

  v6 = (objc_class *)objc_opt_class();
  subclassMissingImplementation((objc_selector *)a2, v6);
}

- (void)connection:(id)a3 challenged:(id)a4 authCallback:(id)a5
{
  objc_class *v6;

  v6 = (objc_class *)objc_opt_class();
  subclassMissingImplementation((objc_selector *)a2, v6);
}

- (void)connection:(id)a3 didFinishLoadingWithError:(id)a4
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  subclassMissingImplementation((objc_selector *)a2, v5);
}

- (void)connection:(id)a3 didReceiveData:(id)a4 completion:(id)a5
{
  objc_class *v6;

  v6 = (objc_class *)objc_opt_class();
  subclassMissingImplementation((objc_selector *)a2, v6);
}

- (void)connection:(id)a3 didReceiveInformationalResponse:(id)a4
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  subclassMissingImplementation((objc_selector *)a2, v5);
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4 completion:(id)a5
{
  objc_class *v6;

  v6 = (objc_class *)objc_opt_class();
  subclassMissingImplementation((objc_selector *)a2, v6);
}

- (void)connection:(id)a3 didReceiveSocketInputStream:(id)a4 outputStream:(id)a5
{
  objc_class *v6;

  v6 = (objc_class *)objc_opt_class();
  subclassMissingImplementation((objc_selector *)a2, v6);
}

- (void)connection:(id)a3 didReceiveTCPConnection:(shared_ptr<TransportConnection>)a4 extraBytes:(id)a5
{
  objc_class *v6;

  v6 = (objc_class *)objc_opt_class();
  subclassMissingImplementation((objc_selector *)a2, v6);
}

- (void)connection:(id)a3 request:(id)a4 needsNewBodyStreamCallback:(id)a5
{
  objc_class *v6;

  v6 = (objc_class *)objc_opt_class();
  subclassMissingImplementation((objc_selector *)a2, v6);
}

- (void)connection:(id)a3 request:(id)a4 needsNewBodyStreamFromOffset:(int64_t)a5 callback:(id)a6
{
  objc_class *v7;

  v7 = (objc_class *)objc_opt_class();
  subclassMissingImplementation((objc_selector *)a2, v7);
}

- (void)connection:(id)a3 sentBodyBytes:(id)a4 totalBytes:(id)a5 expectedBytes:(id)a6
{
  objc_class *v7;

  v7 = (objc_class *)objc_opt_class();
  subclassMissingImplementation((objc_selector *)a2, v7);
}

- (void)connection:(id)a3 waitingWithReason:(int64_t)a4
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  subclassMissingImplementation((objc_selector *)a2, v5);
}

- (void)connection:(id)a3 alternatePathAvailable:(int)a4
{
  objc_class *v5;

  v5 = (objc_class *)objc_opt_class();
  subclassMissingImplementation((objc_selector *)a2, v5);
}

- (void)connection:(id)a3 wasRedirected:(id)a4 newRequest:(id)a5 responseCallback:(id)a6
{
  objc_class *v7;

  v7 = (objc_class *)objc_opt_class();
  subclassMissingImplementation((objc_selector *)a2, v7);
}

- (void)connection:(id)a3 willCacheResponse:(id)a4 responseCallback:(id)a5
{
  objc_class *v6;

  v6 = (objc_class *)objc_opt_class();
  subclassMissingImplementation((objc_selector *)a2, v6);
}

- (void)connectionWillFinishLoading:(id)a3
{
  objc_class *v4;

  v4 = (objc_class *)objc_opt_class();
  subclassMissingImplementation((objc_selector *)a2, v4);
}

@end
