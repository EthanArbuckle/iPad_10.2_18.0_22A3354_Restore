@implementation CAMPendingRemotePersistenceWrapper

- (CAMPendingRemotePersistenceWrapper)initWithRequest:(id)a3 creationDate:(id)a4 job:(id)a5 loggingIdentifier:(id)a6 completionHandler:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  CAMPendingRemotePersistenceWrapper *v18;
  CAMPendingRemotePersistenceWrapper *v19;
  uint64_t v20;
  NSString *loggingIdentifier;
  uint64_t v22;
  id completionHandler;
  CAMPendingRemotePersistenceWrapper *v24;
  objc_super v26;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v26.receiver = self;
  v26.super_class = (Class)CAMPendingRemotePersistenceWrapper;
  v18 = -[CAMPendingRemotePersistenceWrapper init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_request, a3);
    objc_storeStrong((id *)&v19->_creationDate, a4);
    objc_storeStrong((id *)&v19->_job, a5);
    v20 = objc_msgSend(v16, "copy");
    loggingIdentifier = v19->_loggingIdentifier;
    v19->_loggingIdentifier = (NSString *)v20;

    v22 = objc_msgSend(v17, "copy");
    completionHandler = v19->_completionHandler;
    v19->_completionHandler = (id)v22;

    v24 = v19;
  }

  return v19;
}

- (CAMCaptureRequest)request
{
  return self->_request;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSMutableDictionary)job
{
  return self->_job;
}

- (NSString)loggingIdentifier
{
  return self->_loggingIdentifier;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_loggingIdentifier, 0);
  objc_storeStrong((id *)&self->_job, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
