@implementation AXHAListenerHelper

- (AXHAListenerHelper)initWithListenerAddress:(id)a3
{
  id v5;
  AXHAListenerHelper *v6;
  AXHAListenerHelper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXHAListenerHelper;
  v6 = -[AXHAListenerHelper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_listenerAddress, a3);

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[AXHAServer sharedInstance](AXHAServer, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterUpdateListenerHash:", self->_listenerAddress);

  v4.receiver = self;
  v4.super_class = (Class)AXHAListenerHelper;
  -[AXHAListenerHelper dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listenerAddress, 0);
}

@end
