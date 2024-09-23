@implementation IDSTransactionLogTaskHandler

+ (id)handlerWithTask:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  IDSTransactionLogBaseTaskHandler *v12;
  id v13;
  void *v14;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v9, "isMemberOfClass:", objc_opt_class()))
  {
    v12 = -[IDSTransactionLogBaseTaskHandler initWithTask:delegate:queue:]([IDSTransactionLogBaseTaskHandler alloc], "initWithTask:delegate:queue:", v9, v10, v11);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v9;
      v12 = -[IDSTransactionLogSyncTaskHandler initWithTask:delegate:queue:]([IDSTransactionLogSyncTaskHandler alloc], "initWithTask:delegate:queue:", v13, v10, v11);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("IDSTransactionLogTaskHandler.m"), 55, CFSTR("Unexpected task type"));

      v12 = 0;
    }
  }

  return v12;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IDSTransactionLogTaskHandler;
  return -[IDSTransactionLogTaskHandler init](&v3, sel_init);
}

- (void)perform
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("IDSTransactionLogTaskHandler.m"), 65, CFSTR("Abstract method"));

}

@end
