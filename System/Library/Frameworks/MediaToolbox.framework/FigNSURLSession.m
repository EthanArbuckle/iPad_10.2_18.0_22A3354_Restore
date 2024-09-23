@implementation FigNSURLSession

- (FigOpaqueAssertion)acquireAssertion
{
  FigNSURLSession *v3;
  OpaqueFigCFWeakReferenceHolder *weakAssertion;
  FigOpaqueAssertion *result;
  CFTypeRef cf;

  cf = 0;
  if (self->_weakAssertion)
  {
    cf = (CFTypeRef)FigCFWeakReferenceHolderCopyReferencedObject();
    if (cf)
    {
LABEL_7:
      -[FigNSURLSession setDoomTime:](self, "setDoomTime:", 0);
      return (FigOpaqueAssertion *)cf;
    }
  }
  if (!FigNSURLSessionAssertionCreate(*MEMORY[0x1E0C9AE00], (uint64_t)self, (uint64_t)figNSURLSessionAssertionFinalize, &cf))
  {
    -[FigNSURLSession setAssertionCount:](self, "setAssertionCount:", -[FigNSURLSession assertionCount](self, "assertionCount") + 1);
    v3 = self;
    weakAssertion = self->_weakAssertion;
    if (weakAssertion)
      CFRelease(weakAssertion);
    self->_weakAssertion = (OpaqueFigCFWeakReferenceHolder *)FigCFWeakReferenceHolderCreateWithReferencedObject();
    goto LABEL_7;
  }
  FigSignalErrorAt();
  result = (FigOpaqueAssertion *)cf;
  if (cf)
  {
    CFRelease(cf);
    return 0;
  }
  return result;
}

- (void)debug
{
  -[FigNSURLSession retainCount](self, "retainCount");
  fig_log();
}

- (FigNSURLSession)initWithClientBundleIdentifier:(id)a3 clientPersonaIdentifier:(id)a4 dispatchQueue:(id)a5
{
  FigNSURLSession *v5;
  NSURLSessionConfiguration *v9;
  int NSURLSessionDataDelegate;
  NSOperationQueue *v11;
  NSURLSession *v12;
  NSURLSession *v13;
  objc_super v15;

  v5 = self;
  if (!a3 || !a5)
    goto LABEL_15;
  v15.receiver = self;
  v15.super_class = (Class)FigNSURLSession;
  v5 = -[FigNSURLSession init](&v15, sel_init);
  if (!v5)
    return v5;
  v5->_clientBundleIdentifier = (NSString *)a3;
  v5->_clientPersonaIdentifier = (NSString *)a4;
  dispatch_retain((dispatch_object_t)a5);
  v5->_dispatchQueue = (OS_dispatch_queue *)a5;
  v9 = (NSURLSessionConfiguration *)objc_msgSend(MEMORY[0x1E0C92CA0], "ephemeralSessionConfiguration");
  v5->_configuration = v9;
  if (!v9
    || (-[NSURLSessionConfiguration set_timingDataOptions:](v9, "set_timingDataOptions:", -1),
        NSURLSessionDataDelegate = _FigHTTPRequestSessionCreateNSURLSessionDataDelegate(0, &v5->_dataDelegate),
        !v5->_dataDelegate)
    || (v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]), (v5->_opQueue = v11) == 0)
    || (-[NSOperationQueue setUnderlyingQueue:](v11, "setUnderlyingQueue:", a5),
        v12 = (NSURLSession *)objc_msgSend(MEMORY[0x1E0C92C98], "sessionWithConfiguration:delegate:delegateQueue:", v5->_configuration, v5->_dataDelegate, v5->_opQueue), (v5->_session = v12) == 0))
  {
LABEL_15:
    if (!FigSignalErrorAt())
      return v5;
    goto LABEL_9;
  }
  v13 = v12;
  if (NSURLSessionDataDelegate)
  {
LABEL_9:

    return 0;
  }
  return v5;
}

- (unsigned)acquireOSTransaction
{
  OS_os_transaction *transaction;

  transaction = self->_transaction;
  if (!transaction)
  {
    transaction = (OS_os_transaction *)FigOSTransactionCreate();
    self->_transaction = transaction;
  }
  return transaction != 0;
}

- (void)releaseOSTransaction
{
  OS_os_transaction *transaction;

  transaction = self->_transaction;
  if (transaction)
  {

    self->_transaction = 0;
  }
}

- (void)dealloc
{
  NSObject *dispatchQueue;
  OpaqueFigCFWeakReferenceHolder *weakAssertion;
  objc_super v5;

  -[NSURLSession invalidateAndCancel](self->_session, "invalidateAndCancel");

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
    dispatch_release(dispatchQueue);
  weakAssertion = self->_weakAssertion;
  if (weakAssertion)
    CFRelease(weakAssertion);

  v5.receiver = self;
  v5.super_class = (Class)FigNSURLSession;
  -[FigNSURLSession dealloc](&v5, sel_dealloc);
}

- (NSURLSession)session
{
  return self->_session;
}

- (NSURLSessionDataDelegate)dataDelegate
{
  return self->_dataDelegate;
}

- (NSOperationQueue)opQueue
{
  return self->_opQueue;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (NSString)clientPersonaIdentifier
{
  return self->_clientPersonaIdentifier;
}

- (int64_t)doomTime
{
  return self->_doomTime;
}

- (void)setDoomTime:(int64_t)a3
{
  self->_doomTime = a3;
}

- (BOOL)doomCheckScheduled
{
  return self->_doomCheckScheduled;
}

- (void)setDoomCheckScheduled:(BOOL)a3
{
  self->_doomCheckScheduled = a3;
}

- (int)deferReleaseSeconds
{
  return self->_deferReleaseSeconds;
}

- (void)setDeferReleaseSeconds:(int)a3
{
  self->_deferReleaseSeconds = a3;
}

- (int)assertionCount
{
  return self->_assertionCount;
}

- (void)setAssertionCount:(int)a3
{
  self->_assertionCount = a3;
}

@end
