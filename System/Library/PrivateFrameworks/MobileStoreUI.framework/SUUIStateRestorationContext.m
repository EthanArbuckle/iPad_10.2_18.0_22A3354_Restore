@implementation SUUIStateRestorationContext

+ (void)setSharedContext:(id)a3
{
  objc_storeStrong((id *)&sContext, a3);
}

+ (id)sharedContext
{
  return (id)sContext;
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
