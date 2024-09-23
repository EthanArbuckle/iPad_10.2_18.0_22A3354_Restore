@implementation GTTelemetryRequestBatch

- (GTTelemetryRequestBatch)init
{
  GTTelemetryRequestBatch *v2;
  GTTelemetryRequestBatch *v3;
  unsigned int v4;
  GTTelemetryRequestBatch *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GTTelemetryRequestBatch;
  v2 = -[GTTelemetryRequestBatch init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    do
      v4 = __ldaxr((unsigned int *)&globalRequestID_0);
    while (__stlxr(v4 + 1, (unsigned int *)&globalRequestID_0));
    v2->_requestID = v4;
    v5 = v2;
  }

  return v3;
}

- (id)initNoRequestID
{
  GTTelemetryRequestBatch *v2;
  GTTelemetryRequestBatch *v3;
  GTTelemetryRequestBatch *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GTTelemetryRequestBatch;
  v2 = -[GTTelemetryRequestBatch init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(unint64_t)a3
{
  self->_requestID = a3;
}

- (NSArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
  objc_storeStrong((id *)&self->_requests, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end
