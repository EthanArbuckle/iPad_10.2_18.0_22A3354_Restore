@implementation ACSURLSessionTask

- (unint64_t)taskIdentifier
{
  void *v2;
  unint64_t v3;

  -[ACSURLSessionTask _nsurlTaskToOrigin](self, "_nsurlTaskToOrigin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "taskIdentifier");

  return v3;
}

- (NSURLRequest)originalRequest
{
  void *v2;
  void *v3;

  -[ACSURLSessionTask _nsurlTaskToOrigin](self, "_nsurlTaskToOrigin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "originalRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURLRequest *)v3;
}

- (NSURLRequest)currentRequest
{
  void *v3;
  void *v4;
  void *v5;

  -[ACSURLSessionTask _nsurlTaskToCachingServer](self, "_nsurlTaskToCachingServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[ACSURLSessionTask _tryCachingServer](self, "_tryCachingServer"))
  {
    objc_msgSend(v3, "currentRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ACSURLSessionTask _nsurlTaskToOrigin](self, "_nsurlTaskToOrigin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSURLRequest *)v4;
}

- (NSURLResponse)response
{
  void *v3;
  void *v4;
  void *v5;

  -[ACSURLSessionTask _nsurlTaskToCachingServer](self, "_nsurlTaskToCachingServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[ACSURLSessionTask _tryCachingServer](self, "_tryCachingServer"))
  {
    objc_msgSend(v3, "response");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ACSURLSessionTask _nsurlTaskToOrigin](self, "_nsurlTaskToOrigin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "response");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSURLResponse *)v4;
}

- (NSProgress)progress
{
  void *v3;
  void *v4;
  void *v5;

  -[ACSURLSessionTask _nsurlTaskToCachingServer](self, "_nsurlTaskToCachingServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[ACSURLSessionTask _tryCachingServer](self, "_tryCachingServer"))
  {
    objc_msgSend(v3, "progress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ACSURLSessionTask _nsurlTaskToOrigin](self, "_nsurlTaskToOrigin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "progress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSProgress *)v4;
}

- (int64_t)countOfBytesClientExpectsToSend
{
  void *v3;
  int64_t v4;
  void *v5;

  -[ACSURLSessionTask _nsurlTaskToCachingServer](self, "_nsurlTaskToCachingServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[ACSURLSessionTask _tryCachingServer](self, "_tryCachingServer"))
  {
    v4 = objc_msgSend(v3, "countOfBytesClientExpectsToSend");
  }
  else
  {
    -[ACSURLSessionTask _nsurlTaskToOrigin](self, "_nsurlTaskToOrigin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "countOfBytesClientExpectsToSend");

  }
  return v4;
}

- (void)setCountOfBytesClientExpectsToSend:(int64_t)a3
{
  void *v5;
  id v6;

  -[ACSURLSessionTask _nsurlTaskToCachingServer](self, "_nsurlTaskToCachingServer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v6, "setCountOfBytesClientExpectsToSend:", a3);
  -[ACSURLSessionTask _nsurlTaskToOrigin](self, "_nsurlTaskToOrigin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCountOfBytesClientExpectsToSend:", a3);

}

- (int64_t)countOfBytesClientExpectsToReceive
{
  void *v3;
  int64_t v4;
  void *v5;

  -[ACSURLSessionTask _nsurlTaskToCachingServer](self, "_nsurlTaskToCachingServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[ACSURLSessionTask _tryCachingServer](self, "_tryCachingServer"))
  {
    v4 = objc_msgSend(v3, "countOfBytesClientExpectsToReceive");
  }
  else
  {
    -[ACSURLSessionTask _nsurlTaskToOrigin](self, "_nsurlTaskToOrigin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "countOfBytesClientExpectsToReceive");

  }
  return v4;
}

- (void)setCountOfBytesClientExpectsToReceive:(int64_t)a3
{
  void *v5;
  id v6;

  -[ACSURLSessionTask _nsurlTaskToCachingServer](self, "_nsurlTaskToCachingServer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v6, "setCountOfBytesClientExpectsToReceive:", a3);
  -[ACSURLSessionTask _nsurlTaskToOrigin](self, "_nsurlTaskToOrigin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCountOfBytesClientExpectsToReceive:", a3);

}

- (int64_t)countOfBytesReceived
{
  void *v3;
  int64_t v4;
  void *v5;

  -[ACSURLSessionTask _nsurlTaskToCachingServer](self, "_nsurlTaskToCachingServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[ACSURLSessionTask _tryCachingServer](self, "_tryCachingServer"))
  {
    v4 = objc_msgSend(v3, "countOfBytesReceived");
  }
  else
  {
    -[ACSURLSessionTask _nsurlTaskToOrigin](self, "_nsurlTaskToOrigin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "countOfBytesReceived");

  }
  return v4;
}

- (int64_t)countOfBytesSent
{
  void *v3;
  int64_t v4;
  void *v5;

  -[ACSURLSessionTask _nsurlTaskToCachingServer](self, "_nsurlTaskToCachingServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[ACSURLSessionTask _tryCachingServer](self, "_tryCachingServer"))
  {
    v4 = objc_msgSend(v3, "countOfBytesSent");
  }
  else
  {
    -[ACSURLSessionTask _nsurlTaskToOrigin](self, "_nsurlTaskToOrigin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "countOfBytesSent");

  }
  return v4;
}

- (int64_t)countOfBytesExpectedToSend
{
  void *v3;
  int64_t v4;
  void *v5;

  -[ACSURLSessionTask _nsurlTaskToCachingServer](self, "_nsurlTaskToCachingServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[ACSURLSessionTask _tryCachingServer](self, "_tryCachingServer"))
  {
    v4 = objc_msgSend(v3, "countOfBytesExpectedToSend");
  }
  else
  {
    -[ACSURLSessionTask _nsurlTaskToOrigin](self, "_nsurlTaskToOrigin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "countOfBytesExpectedToSend");

  }
  return v4;
}

- (int64_t)countOfBytesExpectedToReceive
{
  void *v3;
  int64_t v4;
  void *v5;

  -[ACSURLSessionTask _nsurlTaskToCachingServer](self, "_nsurlTaskToCachingServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[ACSURLSessionTask _tryCachingServer](self, "_tryCachingServer"))
  {
    v4 = objc_msgSend(v3, "countOfBytesExpectedToReceive");
  }
  else
  {
    -[ACSURLSessionTask _nsurlTaskToOrigin](self, "_nsurlTaskToOrigin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "countOfBytesExpectedToReceive");

  }
  return v4;
}

- (NSString)taskDescription
{
  void *v2;
  void *v3;

  -[ACSURLSessionTask _nsurlTaskToOrigin](self, "_nsurlTaskToOrigin");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "taskDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTaskDescription:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ACSURLSessionTask _nsurlTaskToOrigin](self, "_nsurlTaskToOrigin");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTaskDescription:", v4);

}

- (void)cancel
{
  id v3;

  if (-[ACSURLSessionTask _internalState](self, "_internalState") != 2)
  {
    -[ACSURLSessionTask _weakSession](self, "_weakSession");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_cancelTask:", self);

  }
}

- (int64_t)state
{
  int64_t v3;
  void *v4;
  void *v5;

  if (-[ACSURLSessionTask _internalState](self, "_internalState") == 2)
    return 3;
  -[ACSURLSessionTask _nsurlTaskToCachingServer](self, "_nsurlTaskToCachingServer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && -[ACSURLSessionTask _tryCachingServer](self, "_tryCachingServer"))
  {
    v3 = objc_msgSend(v4, "state");
  }
  else
  {
    -[ACSURLSessionTask _nsurlTaskToOrigin](self, "_nsurlTaskToOrigin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "state");

  }
  return v3;
}

- (NSError)error
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[ACSURLSessionTask _nsurlTaskToCachingServer](self, "_nsurlTaskToCachingServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[ACSURLSessionTask _tryCachingServer](self, "_tryCachingServer"))
  {
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ACSURLSessionTask _nsurlTaskToOrigin](self, "_nsurlTaskToOrigin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[ACSURLSessionTask _weakSession](self, "_weakSession");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSURLSessionTask originalRequest](self, "originalRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSURLSessionTask currentRequest](self, "currentRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_errorWithResumeDataFromError:originalRequest:currentRequest:", v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSError *)v9;
}

- (void)suspend
{
  id v3;

  if (-[ACSURLSessionTask _internalState](self, "_internalState") != 2)
  {
    -[ACSURLSessionTask _weakSession](self, "_weakSession");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_suspendTask:", self);

  }
}

- (void)resume
{
  id v3;

  -[ACSURLSessionTask _weakSession](self, "_weakSession");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_resumeTask:", self);

}

- (float)priority
{
  void *v3;
  float v4;
  float v5;
  void *v6;
  float v7;

  -[ACSURLSessionTask _nsurlTaskToCachingServer](self, "_nsurlTaskToCachingServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && -[ACSURLSessionTask _tryCachingServer](self, "_tryCachingServer"))
  {
    objc_msgSend(v3, "priority");
    v5 = v4;
  }
  else
  {
    -[ACSURLSessionTask _nsurlTaskToOrigin](self, "_nsurlTaskToOrigin");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "priority");
    v5 = v7;

  }
  return v5;
}

- (void)setPriority:(float)a3
{
  double v5;
  void *v6;
  double v7;
  id v8;

  -[ACSURLSessionTask _nsurlTaskToCachingServer](self, "_nsurlTaskToCachingServer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    *(float *)&v5 = a3;
    objc_msgSend(v8, "setPriority:", v5);
  }
  -[ACSURLSessionTask _nsurlTaskToOrigin](self, "_nsurlTaskToOrigin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(v6, "setPriority:", v7);

}

- (ACSURLSessionTask)initWithNSURLTaskCreator:(id)a3 initialRequest:(id)a4 forSession:(id)a5
{
  void (**v8)(id, id);
  id v9;
  id v10;
  ACSURLSessionTask *v11;
  ACSURLSessionTask *v12;
  void *v13;
  objc_super v15;

  v8 = (void (**)(id, id))a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ACSURLSessionTask;
  v11 = -[ACSURLSessionTask init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    -[ACSURLSessionTask set_nsurlTaskCreator:](v11, "set_nsurlTaskCreator:", v8);
    v8[2](v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ACSURLSessionTask set_nsurlTaskToOrigin:](v12, "set_nsurlTaskToOrigin:", v13);

    -[ACSURLSessionTask set_weakSession:](v12, "set_weakSession:", v10);
    -[ACSURLSessionTask set_tryCachingServer:](v12, "set_tryCachingServer:", objc_msgSend(v10, "canUseCachingServer"));
    -[ACSURLSessionTask set_failBackToOrigin:](v12, "set_failBackToOrigin:", 1);
    -[ACSURLSessionTask set_internalState:](v12, "set_internalState:", 0);
  }

  return v12;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)ACSURLSessionTask;
  -[ACSURLSessionTask description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSURLSessionTask _nsurlTaskToOrigin](self, "_nsurlTaskToOrigin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "descriptionWithAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACSURLSessionTask _nsurlTaskToCachingServer](self, "_nsurlTaskToCachingServer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionWithAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ { taskToOrigin: %@, taskToCachingServer: %@, tryCachingServer: %d, failBackToOrigin: %d, suspended: %d }"), v4, v6, v8, -[ACSURLSessionTask _tryCachingServer](self, "_tryCachingServer"), -[ACSURLSessionTask _failBackToOrigin](self, "_failBackToOrigin"), -[ACSURLSessionTask _suspended](self, "_suspended"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)_isUpload
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("subclass %@ must implement %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (id)_nsurlTaskForRequest:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;

  v4 = a3;
  -[ACSURLSessionTask _nsurlTaskCreator](self, "_nsurlTaskCreator");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v5)[2](v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_nsurlTaskCreator
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)set_nsurlTaskCreator:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSURLSessionTask)_nsurlTaskToOrigin
{
  return (NSURLSessionTask *)objc_getProperty(self, a2, 24, 1);
}

- (void)set_nsurlTaskToOrigin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSURLSessionTask)_nsurlTaskToCachingServer
{
  return (NSURLSessionTask *)objc_getProperty(self, a2, 32, 1);
}

- (void)set_nsurlTaskToCachingServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (ACSURLSession)_weakSession
{
  return (ACSURLSession *)objc_loadWeakRetained((id *)&self->__weakSession);
}

- (void)set_weakSession:(id)a3
{
  objc_storeWeak((id *)&self->__weakSession, a3);
}

- (BOOL)_tryCachingServer
{
  return self->__tryCachingServer;
}

- (void)set_tryCachingServer:(BOOL)a3
{
  self->__tryCachingServer = a3;
}

- (BOOL)_failBackToOrigin
{
  return self->__failBackToOrigin;
}

- (void)set_failBackToOrigin:(BOOL)a3
{
  self->__failBackToOrigin = a3;
}

- (BOOL)_suspended
{
  return self->__suspended;
}

- (void)set_suspended:(BOOL)a3
{
  self->__suspended = a3;
}

- (int64_t)_internalState
{
  return self->__internalState;
}

- (void)set_internalState:(int64_t)a3
{
  self->__internalState = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__weakSession);
  objc_storeStrong((id *)&self->__nsurlTaskToCachingServer, 0);
  objc_storeStrong((id *)&self->__nsurlTaskToOrigin, 0);
  objc_storeStrong(&self->__nsurlTaskCreator, 0);
}

@end
