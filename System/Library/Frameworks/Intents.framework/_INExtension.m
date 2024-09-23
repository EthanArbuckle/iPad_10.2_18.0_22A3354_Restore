@implementation _INExtension

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;
  NSObject *v5;
  INExtensionContext *v6;
  INExtensionContext *extensionContext;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[_INExtension beginRequestWithExtensionContext:]";
    _os_log_impl(&dword_18BEBC000, v5, OS_LOG_TYPE_INFO, "%s Extension bring-up", (uint8_t *)&v8, 0xCu);
  }
  _INExtensionContextWithContext(v4);
  v6 = (INExtensionContext *)objc_claimAutoreleasedReturnValue();
  extensionContext = self->_extensionContext;
  self->_extensionContext = v6;

}

- (id)handlerForIntent:(id)a3
{
  return __INExtensionGetDefaultIntentHandler(self, a3);
}

- (INExtensionContext)_extensionContext
{
  return self->_extensionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionContext, 0);
}

+ (void)initialize
{
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    if (INLogInitIfNeeded_once != -1)
      dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_66271);
    v3 = (void *)objc_opt_class();
    __INExtensionInitialize(a1, v3);
  }
}

@end
