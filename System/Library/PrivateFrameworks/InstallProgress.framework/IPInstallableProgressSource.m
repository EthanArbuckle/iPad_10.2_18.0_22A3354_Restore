@implementation IPInstallableProgressSource

- (IPInstallableProgressSource)initWithStateSource:(id)a3
{
  id v5;
  IPInstallableProgressSource *v6;
  IPInstallableProgressSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IPInstallableProgressSource;
  v6 = -[IPInstallableProgressSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_installableStateSource, a3);
    v7->_resumed = 0;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_storeWeak((id *)&self->_observer, 0);
  -[IPInstallableStateSource associatedRegistry](self->_installableStateSource, "associatedRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterProgressSource:", self);

  v4.receiver = self;
  v4.super_class = (Class)IPInstallableProgressSource;
  -[IPInstallableProgressSource dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p { %@ }>"), objc_opt_class(), self, self->_installableStateSource);
}

- (id)currentProgressWithError:(id *)a3
{
  void *v4;
  IPInstallableProgress *v5;

  -[IPInstallableStateSource currentProgressForSource:error:](self->_installableStateSource, "currentProgressForSource:error:", self, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[IPInstallableProgress initWithSource:progressSnapshot:]([IPInstallableProgress alloc], "initWithSource:progressSnapshot:", self, v4);
  else
    v5 = 0;

  return v5;
}

- (void)resume
{
  NSObject *v3;
  void *v4;
  int v5;
  IPInstallableProgressSource *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (self->_resumed)
  {
    _IPDefaultLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      -[IPInstallableStateSource resume].cold.1((uint64_t)self, v3);
  }
  else
  {
    self->_resumed = 1;
    -[IPInstallableStateSource associatedRegistry](self->_installableStateSource, "associatedRegistry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "registerProgressSource:", self);

    _IPClientLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = self;
      _os_log_impl(&dword_23F108000, v3, OS_LOG_TYPE_DEFAULT, "Progress source resumed: %@", (uint8_t *)&v5, 0xCu);
    }
  }

}

- (id)collationKey
{
  return -[IPInstallableStateSource collationKey](self->_installableStateSource, "collationKey");
}

- (void)notifyOfUpdate:(id)a3
{
  id v4;
  id WeakRetained;
  IPInstallableProgress *v6;

  v4 = a3;
  v6 = -[IPInstallableProgress initWithSource:progressSnapshot:]([IPInstallableProgress alloc], "initWithSource:progressSnapshot:", self, v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  objc_msgSend(WeakRetained, "progressSource:progressDidChange:", self, v6);

}

- (void)finishWithReason:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  objc_msgSend(WeakRetained, "progressSource:didEndForReason:", self, a3);

}

- (IPInstallableStateSource)installableStateSource
{
  return (IPInstallableStateSource *)objc_getProperty(self, a2, 16, 1);
}

- (IPProgressObserver)observer
{
  return (IPProgressObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_installableStateSource, 0);
}

@end
