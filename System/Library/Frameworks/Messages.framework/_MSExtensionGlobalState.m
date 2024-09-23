@implementation _MSExtensionGlobalState

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_sharedInstance;
}

- (void)setActiveExtensionContext:(id)a3
{
  objc_storeStrong((id *)&self->_activeExtensionContext, a3);
}

- (_MSMessageComposeExtensionImplProtocol)activeExtensionContext
{
  return self->_activeExtensionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeExtensionContext, 0);
}

@end
