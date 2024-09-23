@implementation ESAccountClassNames

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:\n\tAccountClassName=%@\n\tClientAccountClassName=%@\n\tDaemonAccountClassName=%@\n\tAgentClassName=%@"), v5, self->_accountClassName, self->_clientAccountClassName, self->_daemonAccountClassName, self->_agentClassName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)accountClassName
{
  return self->_accountClassName;
}

- (void)setAccountClassName:(id)a3
{
  objc_storeStrong((id *)&self->_accountClassName, a3);
}

- (NSString)clientAccountClassName
{
  return self->_clientAccountClassName;
}

- (void)setClientAccountClassName:(id)a3
{
  objc_storeStrong((id *)&self->_clientAccountClassName, a3);
}

- (NSString)daemonAccountClassName
{
  return self->_daemonAccountClassName;
}

- (void)setDaemonAccountClassName:(id)a3
{
  objc_storeStrong((id *)&self->_daemonAccountClassName, a3);
}

- (NSString)agentClassName
{
  return self->_agentClassName;
}

- (void)setAgentClassName:(id)a3
{
  objc_storeStrong((id *)&self->_agentClassName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agentClassName, 0);
  objc_storeStrong((id *)&self->_daemonAccountClassName, 0);
  objc_storeStrong((id *)&self->_clientAccountClassName, 0);
  objc_storeStrong((id *)&self->_accountClassName, 0);
}

@end
