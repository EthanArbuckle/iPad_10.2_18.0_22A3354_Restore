@implementation DADiscoveryExtensionSession

- (void)invalidate
{
  id eventHandler;

  eventHandler = self->_eventHandler;
  self->_eventHandler = 0;

}

- (void)reportEvent:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = _Block_copy(self->_eventHandler);
  v5 = v4;
  if (v4)
    (*((void (**)(void *, id))v4 + 2))(v4, v6);

}

- (id)eventHandler
{
  return self->_eventHandler;
}

- (void)setEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandler, 0);
}

@end
