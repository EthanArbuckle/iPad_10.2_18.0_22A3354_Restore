@implementation CHSynchronizedLoggable

- (id)logHandle
{
  return -[CHLogger logHandle](self->_logger, "logHandle");
}

- (void)executeSync:(id)a3
{
  -[CHSynchronizable executeSync:](self->_synchronizable, "executeSync:", a3);
}

- (id)executeSyncWithResult:(id)a3
{
  return -[CHSynchronizable executeSyncWithResult:](self->_synchronizable, "executeSyncWithResult:", a3);
}

- (void)execute:(id)a3
{
  -[CHSynchronizable execute:](self->_synchronizable, "execute:", a3);
}

- (id)queue
{
  return -[CHSynchronizable queue](self->_synchronizable, "queue");
}

- (CHSynchronizedLoggable)initWithName:(const char *)a3
{
  CHSynchronizedLoggable *v4;
  CHLogger *v5;
  CHLogger *logger;
  CHSynchronizable *v7;
  CHSynchronizable *synchronizable;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CHSynchronizedLoggable;
  v4 = -[CHSynchronizedLoggable init](&v10, sel_init);
  if (v4)
  {
    v5 = -[CHLogger initWithDomain:]([CHLogger alloc], "initWithDomain:", a3);
    logger = v4->_logger;
    v4->_logger = v5;

    v7 = -[CHSynchronizable initWithName:]([CHSynchronizable alloc], "initWithName:", a3);
    synchronizable = v4->_synchronizable;
    v4->_synchronizable = v7;

  }
  return v4;
}

- (CHSynchronizedLoggable)initWithName:(const char *)a3 queue:(id)a4
{
  id v6;
  CHSynchronizedLoggable *v7;
  CHLogger *v8;
  CHLogger *logger;
  CHSynchronizable *v10;
  CHSynchronizable *synchronizable;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CHSynchronizedLoggable;
  v7 = -[CHSynchronizedLoggable init](&v13, sel_init);
  if (v7)
  {
    v8 = -[CHLogger initWithDomain:]([CHLogger alloc], "initWithDomain:", a3);
    logger = v7->_logger;
    v7->_logger = v8;

    v10 = -[CHSynchronizable initWithQueue:]([CHSynchronizable alloc], "initWithQueue:", v6);
    synchronizable = v7->_synchronizable;
    v7->_synchronizable = v10;

  }
  return v7;
}

- (BOOL)executeSyncWithBOOL:(id)a3
{
  return -[CHSynchronizable executeSyncWithBOOL:](self->_synchronizable, "executeSyncWithBOOL:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronizable, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
