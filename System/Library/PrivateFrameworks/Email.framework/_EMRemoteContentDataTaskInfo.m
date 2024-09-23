@implementation _EMRemoteContentDataTaskInfo

- (_EMRemoteContentDataTaskInfo)initWithDataTask:(id)a3 isSynthetic:(BOOL)a4 failOpen:(BOOL)a5 completion:(id)a6
{
  id v11;
  id v12;
  _EMRemoteContentDataTaskInfo *v13;
  _EMRemoteContentDataTaskInfo *v14;
  uint64_t v15;
  id completion;
  objc_super v18;

  v11 = a3;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_EMRemoteContentDataTaskInfo;
  v13 = -[_EMRemoteContentDataTaskInfo init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_dataTask, a3);
    v15 = objc_msgSend(v12, "copy");
    completion = v14->_completion;
    v14->_completion = (id)v15;

    v14->_isSynthetic = a4;
    v14->_failOpen = a5;
  }

  return v14;
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = CFSTR(" (synthetic)");
  if (!self->_isSynthetic)
    v5 = &stru_1E70F6E90;
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@>%@ %@"), v4, self, v5, self->_dataTask);
}

- (NSData)data
{
  return (NSData *)self->_data;
}

- (void)cancel
{
  -[NSURLSessionDataTask cancel](self->_dataTask, "cancel");
}

- (void)receiveData:(id)a3
{
  NSObject *v4;
  NSObject *data;
  OS_dispatch_data *concat;
  OS_dispatch_data *v7;
  NSObject *v8;

  v4 = a3;
  if (self->_completion)
  {
    data = self->_data;
    v8 = v4;
    if (data)
      concat = (OS_dispatch_data *)dispatch_data_create_concat(data, v4);
    else
      concat = v4;
    v7 = self->_data;
    self->_data = concat;

    v4 = v8;
  }

}

- (void)finishWithError:(id)a3
{
  id v4;
  void (**completion)(id, _QWORD, void *, id);
  void *v6;
  OS_dispatch_data *data;
  id v8;
  id v9;

  v4 = a3;
  completion = (void (**)(id, _QWORD, void *, id))self->_completion;
  if (completion)
  {
    v9 = v4;
    if (v4)
    {
      -[NSURLSessionDataTask response](self->_dataTask, "response");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      completion[2](completion, 0, v6, v9);
    }
    else
    {
      data = self->_data;
      -[NSURLSessionDataTask response](self->_dataTask, "response");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, OS_dispatch_data *, void *, id))completion)[2](completion, data, v6, 0);
    }

    v8 = self->_completion;
    self->_completion = 0;

    v4 = v9;
  }

}

- (NSURLSessionDataTask)dataTask
{
  return self->_dataTask;
}

- (id)completion
{
  return self->_completion;
}

- (BOOL)isSynthetic
{
  return self->_isSynthetic;
}

- (BOOL)failOpen
{
  return self->_failOpen;
}

- (BOOL)didComplete
{
  return self->_didComplete;
}

- (void)setDidComplete:(BOOL)a3
{
  self->_didComplete = a3;
}

- (BOOL)didCollectMetrics
{
  return self->_didCollectMetrics;
}

- (void)setDidCollectMetrics:(BOOL)a3
{
  self->_didCollectMetrics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
