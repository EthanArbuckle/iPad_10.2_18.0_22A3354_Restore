@implementation NPKTransientPassAssertion

- (NPKTransientPassAssertion)initWithPassWithUniqueID:(id)a3
{
  id v5;
  NPKTransientPassAssertion *v6;
  NPKTransientPassAssertion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKTransientPassAssertion;
  v6 = -[NPKTransientAssertion initWithQueue:](&v9, sel_initWithQueue_, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_uniqueID, a3);
    -[NPKTransientPassAssertion _resyncState](v7, "_resyncState");
  }

  return v7;
}

- (void)setRequestServiceMode:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_requestServiceMode != a3)
  {
    v3 = a3;
    self->_requestServiceMode = a3;
    -[NPKTransientAssertion _remoteObjectProxy](self, "_remoteObjectProxy");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setServiceModeRequested:", v3);

  }
}

- (void)setDisableCardSelection:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_disableCardSelection != a3)
  {
    v3 = a3;
    self->_disableCardSelection = a3;
    -[NPKTransientAssertion _remoteObjectProxy](self, "_remoteObjectProxy");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDisableCardSelection:", v3);

  }
}

- (void)_resyncState
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pk_General_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_General_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v10 = 138412290;
      *(_QWORD *)&v10[4] = objc_opt_class();
      v6 = *(id *)&v10[4];
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: %@: Transient pass assertion: resyncing state", v10, 0xCu);

    }
  }
  -[NPKTransientAssertion _remoteObjectProxy](self, "_remoteObjectProxy", *(_OWORD *)v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTransientPassUniqueID:", self->_uniqueID);

  -[NPKTransientAssertion _remoteObjectProxy](self, "_remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setServiceModeRequested:", self->_requestServiceMode);

  -[NPKTransientAssertion _remoteObjectProxy](self, "_remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDisableCardSelection:", self->_disableCardSelection);

}

- (BOOL)requestServiceMode
{
  return self->_requestServiceMode;
}

- (BOOL)disableCardSelection
{
  return self->_disableCardSelection;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
}

@end
