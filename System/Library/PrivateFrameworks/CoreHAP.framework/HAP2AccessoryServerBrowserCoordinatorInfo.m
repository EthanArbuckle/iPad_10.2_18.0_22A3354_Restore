@implementation HAP2AccessoryServerBrowserCoordinatorInfo

- (HAP2AccessoryServerCoordinatorPrivate)coordinator
{
  return self->_coordinator;
}

- (HAP2AccessoryServerBrowserCoordinatorInfo)initWithCoordinator:(id)a3
{
  id v5;
  HAP2AccessoryServerBrowserCoordinatorInfo *v6;
  HAP2AccessoryServerBrowserCoordinatorInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HAP2AccessoryServerBrowserCoordinatorInfo;
  v6 = -[HAP2AccessoryServerBrowserCoordinatorInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_coordinator, a3);

  return v7;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end
