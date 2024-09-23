@implementation _SYQueuedStartSession

- (_SYQueuedStartSession)initWithRequest:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  _SYQueuedStartSession *v9;
  _SYQueuedStartSession *v10;
  uint64_t v11;
  id completion;
  _SYQueuedStartSession *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_SYQueuedStartSession;
  v9 = -[_SYQueuedStartSession init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    v11 = objc_msgSend(v8, "copy");
    completion = v10->_completion;
    v10->_completion = (id)v11;

    v13 = v10;
  }

  return v10;
}

- (SYStartSyncSession)request
{
  return self->_request;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
