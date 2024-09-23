@implementation _EXNSExtensionShimExtension

- (Class)delegateClass
{
  return 0;
}

- (void)willFinishLaunching
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromClass(*a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_debug_impl(&dword_190C25000, a2, OS_LOG_TYPE_DEBUG, "NSExtension shim launched with principal class: %{public}@", (uint8_t *)&v4, 0xCu);

}

- (BOOL)shouldAcceptConnection:(id)a3
{
  return 0;
}

- (Class)principalClass
{
  return (Class)objc_getProperty(self, a2, 40, 1);
}

- (void)setPrincipalClass:(Class)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (Class)extensionContextClass
{
  return (Class)objc_getProperty(self, a2, 48, 1);
}

- (void)setExtensionContextClass:(Class)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionContextClass, 0);
  objc_storeStrong((id *)&self->_principalClass, 0);
}

@end
