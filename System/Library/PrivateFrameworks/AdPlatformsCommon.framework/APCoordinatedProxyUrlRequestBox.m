@implementation APCoordinatedProxyUrlRequestBox

- (APCoordinatedProxyUrlRequestBox)initWithDelegate:(id)a3 handler:(id)a4
{
  id v6;
  APCoordinatedProxyUrlRequestBox *v7;
  uint64_t v8;
  id completionHandler;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)APCoordinatedProxyUrlRequestBox;
  v7 = -[APCoordinatedRetryBox initWithType:delegate:](&v11, sel_initWithType_delegate_, 2, a3);
  if (v7)
  {
    v8 = MEMORY[0x22073D7EC](v6);
    completionHandler = v7->_completionHandler;
    v7->_completionHandler = (id)v8;

  }
  return v7;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
