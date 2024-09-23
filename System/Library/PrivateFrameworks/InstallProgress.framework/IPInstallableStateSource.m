@implementation IPInstallableStateSource

- (id)associatedRegistry
{
  return objc_loadWeakRetained((id *)&self->_associatedRegistry);
}

- (IPInstallableStateSource)initWithRegistry:(id)a3
{
  id v4;
  IPInstallableStateSource *v5;
  IPInstallableStateSource *v6;

  v4 = a3;
  v5 = -[IPInstallableStateSource init](self, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_associatedRegistry, v4);
    v6->_resumed = 0;
  }

  return v6;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  objc_storeWeak((id *)&self->_observer, 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_associatedRegistry);
  objc_msgSend(WeakRetained, "unregisterStateSource:", self);

  v4.receiver = self;
  v4.super_class = (Class)IPInstallableStateSource;
  -[IPInstallableStateSource dealloc](&v4, sel_dealloc);
}

- (void)resume
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_fault_impl(&dword_23F108000, a2, OS_LOG_TYPE_FAULT, "Attempted to resume %@, which was already resumed!", (uint8_t *)&v2, 0xCu);
}

- (IPStateObserver)observer
{
  return (IPStateObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_destroyWeak((id *)&self->_associatedRegistry);
}

- (id)collationKey
{
  id result;

  OUTLINED_FUNCTION_1_1();
  objc_opt_class();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0();
  return result;
}

- (unint64_t)installableType
{
  unint64_t result;

  OUTLINED_FUNCTION_1_1();
  objc_opt_class();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0();
  return result;
}

- (id)currentStateWithError:(id *)a3
{
  id result;

  OUTLINED_FUNCTION_1_1();
  objc_opt_class();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0();
  return result;
}

- (id)progressSourceWithError:(id *)a3
{
  id result;

  OUTLINED_FUNCTION_1_1();
  objc_opt_class();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0();
  return result;
}

- (id)currentProgressForSource:(id)a3 error:(id *)a4
{
  id result;

  OUTLINED_FUNCTION_1_1();
  objc_opt_class();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_0();
  return result;
}

- (void)noteInstallStarted
{
  OUTLINED_FUNCTION_1_1();
  objc_opt_class();
  OUTLINED_FUNCTION_2_1();
}

- (void)notifyOfUpdate:(id)a3
{
  OUTLINED_FUNCTION_1_1();
  objc_opt_class();
  OUTLINED_FUNCTION_2_1();
}

@end
