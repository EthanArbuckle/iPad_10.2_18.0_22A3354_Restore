@implementation IDSTransactionLogBaseTaskHandler

- (IDSTransactionLogBaseTaskHandler)initWithTask:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id *v10;
  IDSTransactionLogBaseTaskHandler *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)IDSTransactionLogBaseTaskHandler;
  v10 = -[IDSTransactionLogTaskHandler _init](&v13, sel__init);
  v11 = (IDSTransactionLogBaseTaskHandler *)v10;
  if (v10)
  {
    objc_storeStrong(v10 + 1, a3);
    objc_storeStrong((id *)&v11->_queue, a5);
  }

  return v11;
}

- (void)perform
{
  void *v2;
  id v3;

  -[IDSTransactionLogBaseTaskHandler task](self, "task");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", IDSTransactionLogErrorDomain, -1000, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_completeWithError:", v2);

}

- (IDSTransactionLogTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
  objc_storeStrong((id *)&self->_task, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

@end
