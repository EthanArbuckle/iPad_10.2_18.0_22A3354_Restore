@implementation _AFUIQueuedOperations

+ (id)queuedOperationsWithSecureAppID:(id)a3 processID:(int)a4 textOperations:(id)a5 completionHandler:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  id v11;
  void *v12;

  v7 = *(_QWORD *)&a4;
  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSecureAppID:processID:textOperations:completionHandler:", v11, v7, v10, v9);

  return v12;
}

- (_AFUIQueuedOperations)initWithSecureAppID:(id)a3 processID:(int)a4 textOperations:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  _AFUIQueuedOperations *v13;
  uint64_t v14;
  NSString *secureAppID;
  uint64_t v16;
  id completionHandler;
  objc_super v19;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v19.receiver = self;
  v19.super_class = (Class)_AFUIQueuedOperations;
  v13 = -[_AFUIQueuedOperations init](&v19, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    secureAppID = v13->_secureAppID;
    v13->_secureAppID = (NSString *)v14;

    v13->_processID = a4;
    objc_storeStrong((id *)&v13->_textOperations, a5);
    v16 = MEMORY[0x23B803E10](v12);
    completionHandler = v13->_completionHandler;
    v13->_completionHandler = (id)v16;

  }
  return v13;
}

- (NSString)secureAppID
{
  return self->_secureAppID;
}

- (int)processID
{
  return self->_processID;
}

- (RTITextOperations)textOperations
{
  return self->_textOperations;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_textOperations, 0);
  objc_storeStrong((id *)&self->_secureAppID, 0);
}

@end
