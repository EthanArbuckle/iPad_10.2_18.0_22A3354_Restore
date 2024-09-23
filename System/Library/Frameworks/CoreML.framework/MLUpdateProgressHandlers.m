@implementation MLUpdateProgressHandlers

- (MLUpdateProgressHandlers)initForEvents:(MLUpdateProgressEvent)interestedEvents progressHandler:(void *)progressHandler completionHandler:(void *)completionHandler
{
  void *v8;
  void *v9;
  MLUpdateProgressHandlers *v10;
  MLUpdateProgressHandlers *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  objc_super v17;

  v8 = progressHandler;
  v9 = completionHandler;
  v17.receiver = self;
  v17.super_class = (Class)MLUpdateProgressHandlers;
  v10 = -[MLUpdateProgressHandlers init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_interestedEvents = interestedEvents;
    v12 = _Block_copy(v8);
    v13 = v11->_progressHandler;
    v11->_progressHandler = v12;

    v14 = _Block_copy(v9);
    v15 = v11->_completionHandler;
    v11->_completionHandler = v14;

  }
  return v11;
}

- (void)_dispatchUpdateProgressHandlerForEvent:(int64_t)a3 metrics:(id)a4 parameters:(id)a5 error:(id)a6 onQueue:(id)a7
{
  void (**v9)(_QWORD, _QWORD);
  id v10;

  +[MLUpdateContext updateContextForEvent:metrics:parameters:error:](MLUpdateContext, "updateContextForEvent:metrics:parameters:error:", a3, a4, a5, a6, a7);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
    -[MLUpdateProgressHandlers progressHandler](self, "progressHandler");
  else
    -[MLUpdateProgressHandlers completionHandler](self, "completionHandler");
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v9)[2](v9, v10);

}

- (void)dispatchTrainingBeginProgressHandlerWithMetrics:(id)a3 parameters:(id)a4 onQueue:(id)a5
{
  -[MLUpdateProgressHandlers _dispatchUpdateProgressHandlerForEvent:metrics:parameters:error:onQueue:](self, "_dispatchUpdateProgressHandlerForEvent:metrics:parameters:error:onQueue:", 1, a3, a4, 0, a5);
}

- (void)dispatchEpochEndProgressHandlerWithMetrics:(id)a3 parameters:(id)a4 onQueue:(id)a5
{
  -[MLUpdateProgressHandlers _dispatchUpdateProgressHandlerForEvent:metrics:parameters:error:onQueue:](self, "_dispatchUpdateProgressHandlerForEvent:metrics:parameters:error:onQueue:", 2, a3, a4, 0, a5);
}

- (void)dispatchMiniBatchEndProgressHandlerWithMetrics:(id)a3 parameters:(id)a4 onQueue:(id)a5
{
  -[MLUpdateProgressHandlers _dispatchUpdateProgressHandlerForEvent:metrics:parameters:error:onQueue:](self, "_dispatchUpdateProgressHandlerForEvent:metrics:parameters:error:onQueue:", 4, a3, a4, 0, a5);
}

- (void)dispatchTrainingCompletionHandlerWithMetrics:(id)a3 parameters:(id)a4 onQueue:(id)a5
{
  -[MLUpdateProgressHandlers _dispatchUpdateProgressHandlerForEvent:metrics:parameters:error:onQueue:](self, "_dispatchUpdateProgressHandlerForEvent:metrics:parameters:error:onQueue:", 0, a3, a4, 0, a5);
}

- (void)dispatchTrainingCompletionHandlerWithError:(id)a3 onQueue:(id)a4
{
  -[MLUpdateProgressHandlers _dispatchUpdateProgressHandlerForEvent:metrics:parameters:error:onQueue:](self, "_dispatchUpdateProgressHandlerForEvent:metrics:parameters:error:onQueue:", 0, MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70], a3, a4);
}

- (id)description
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MLUpdateProgressHandlers interestedEvents](self, "interestedEvents"))
  {
    +[MLUpdateProgressHandlersUtils progressEventsToString:](MLUpdateProgressHandlersUtils, "progressEventsToString:", -[MLUpdateProgressHandlers interestedEvents](self, "interestedEvents"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("interestedEvents: ()");
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\ninterestedEvents: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  -[MLUpdateProgressHandlers progressHandler](self, "progressHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = CFSTR("Supplied");
  else
    v7 = CFSTR("Not Supplied");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nprogressHandler: %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v8);

  -[MLUpdateProgressHandlers completionHandler](self, "completionHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = CFSTR("Supplied");
  else
    v10 = CFSTR("Not Supplied");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\ncompletionHandler: %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v11);

  return v3;
}

- (int64_t)interestedEvents
{
  return self->_interestedEvents;
}

- (void)setInterestedEvents:(int64_t)a3
{
  self->_interestedEvents = a3;
}

- (id)progressHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
}

@end
