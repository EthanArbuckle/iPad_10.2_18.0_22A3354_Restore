@implementation HMDFMFQuery

- (HMDFMFQuery)initWithResponseQueue:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  HMDFMFQuery *v9;
  void *v10;
  uint64_t v11;
  NSString *queryID;
  void *v13;
  id completion;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDFMFQuery;
  v9 = -[HMDFMFQuery init](&v16, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = objc_claimAutoreleasedReturnValue();
    queryID = v9->_queryID;
    v9->_queryID = (NSString *)v11;

    objc_storeStrong((id *)&v9->_responseQueue, a3);
    v13 = _Block_copy(v8);
    completion = v9->_completion;
    v9->_completion = v13;

  }
  return v9;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMDFMFQuery queryID](self, "queryID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[FMF-Query: %@]"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)queryID
{
  return self->_queryID;
}

- (OS_dispatch_queue)responseQueue
{
  return self->_responseQueue;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_responseQueue, 0);
  objc_storeStrong((id *)&self->_queryID, 0);
}

@end
