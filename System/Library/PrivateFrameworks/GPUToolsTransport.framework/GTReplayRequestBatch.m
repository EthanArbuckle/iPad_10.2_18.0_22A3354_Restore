@implementation GTReplayRequestBatch

- (GTReplayRequestBatch)init
{
  GTReplayRequestBatch *v2;
  GTReplayRequestBatch *v3;
  unsigned int v4;
  GTReplayRequestBatch *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GTReplayRequestBatch;
  v2 = -[GTReplayRequestBatch init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    do
      v4 = __ldaxr((unsigned int *)&globalRequestID);
    while (__stlxr(v4 + 1, (unsigned int *)&globalRequestID));
    v2->_requestID = v4;
    v5 = v2;
  }

  return v3;
}

- (id)initNoRequestID
{
  GTReplayRequestBatch *v2;
  GTReplayRequestBatch *v3;
  GTReplayRequestBatch *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GTReplayRequestBatch;
  v2 = -[GTReplayRequestBatch init](&v6, sel_init);
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

- (unsigned)priority
{
  return self->_priority;
}

- (void)setPriority:(unsigned int)a3
{
  self->_priority = a3;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end
