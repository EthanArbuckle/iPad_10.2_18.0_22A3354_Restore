@implementation WCQueuedMessage

- (WCQueuedMessage)initWithMessage:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  WCQueuedMessage *v9;
  WCQueuedMessage *v10;
  uint64_t v11;
  NSDate *creationDate;
  uint64_t v13;
  id completionHandler;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)WCQueuedMessage;
  v9 = -[WCQueuedMessage init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_retryCount = 0;
    objc_storeStrong((id *)&v9->_message, a3);
    v11 = objc_opt_new();
    creationDate = v10->_creationDate;
    v10->_creationDate = (NSDate *)v11;

    v13 = objc_msgSend(v8, "copy");
    completionHandler = v10->_completionHandler;
    v10->_completionHandler = (id)v13;

  }
  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCQueuedMessage message](self, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCQueuedMessage creationDate](self, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, message id: %@, creation date: %@>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[WCQueuedMessage creationDate](self, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (WCMessage)message
{
  return (WCMessage *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMessage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (id)completionHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSDate)creationDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(int64_t)a3
{
  self->_retryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
