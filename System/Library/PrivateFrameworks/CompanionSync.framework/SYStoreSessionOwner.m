@implementation SYStoreSessionOwner

- (BOOL)isResetSync
{
  return 0;
}

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  if (a5)
    *a5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2001, 0);
  return 5;
}

- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4
{
  if (a4)
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2001, 0);
  return 0;
}

- (BOOL)syncSession:(id)a3 rollbackChangesWithError:(id *)a4
{
  if (a4)
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithSYError:userInfo:", 2008, 0);
  return 0;
}

- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5
{
  objc_class *v6;
  id v7;
  id v8;

  v6 = (objc_class *)MEMORY[0x24BDD1540];
  v7 = a5;
  v8 = (id)objc_msgSend([v6 alloc], "initWithSYError:userInfo:", 2001, 0);
  (*((void (**)(id, _QWORD, id))a5 + 2))(v7, 0, v8);

}

- (void)syncSession:(id)a3 didEndWithError:(id)a4
{
  id v6;
  _WORD *WeakRetained;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  id v12;

  v12 = a4;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_store);
  objc_msgSend(WeakRetained, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isResetSync");

  if (!v12)
  {
    if (!v9)
      goto LABEL_10;
    objc_msgSend(WeakRetained, "persistentStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCompletedSync:", 1);
LABEL_9:

    goto LABEL_10;
  }
  if (!v9)
  {
    if ((WeakRetained[8] & 0x400) == 0)
      goto LABEL_10;
    -[SYStoreSessionOwner context](self, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "syncStore:encounteredError:context:", WeakRetained, v12, v10);
    goto LABEL_9;
  }
  if ((WeakRetained[8] & 0x200) != 0)
    objc_msgSend(v8, "syncStore:encounteredErrorInFullSync:", WeakRetained, v12);
LABEL_10:
  if (self->_onComplete)
  {
    objc_msgSend(WeakRetained, "delegateQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v11, self->_onComplete);

  }
}

- (NSDictionary)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDictionary)idsOptions
{
  return self->_idsOptions;
}

- (void)setIdsOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (SYStore)store
{
  return (SYStore *)objc_loadWeakRetained((id *)&self->_store);
}

- (void)setStore:(id)a3
{
  objc_storeWeak((id *)&self->_store, a3);
}

- (id)errorCallback
{
  return self->_errorCallback;
}

- (void)setErrorCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)onComplete
{
  return self->_onComplete;
}

- (void)setOnComplete:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (SYSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong(&self->_onComplete, 0);
  objc_storeStrong(&self->_errorCallback, 0);
  objc_destroyWeak((id *)&self->_store);
  objc_storeStrong((id *)&self->_idsOptions, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

@end
