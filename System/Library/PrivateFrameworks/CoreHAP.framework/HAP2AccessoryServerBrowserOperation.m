@implementation HAP2AccessoryServerBrowserOperation

- (HAP2AccessoryServerBrowserOperation)initWithType:(unint64_t)a3
{
  HAP2AccessoryServerBrowserOperation *v4;
  HAP2AccessoryServerBrowserOperation *v5;
  uint64_t v6;
  NSMutableSet *pendingCoordinators;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HAP2AccessoryServerBrowserOperation;
  v4 = -[HAP2AccessoryServerBrowserOperation init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    pendingCoordinators = v5->_pendingCoordinators;
    v5->_pendingCoordinators = (NSMutableSet *)v6;

  }
  return v5;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSMutableSet)pendingCoordinators
{
  return self->_pendingCoordinators;
}

- (void)setPendingCoordinators:(id)a3
{
  objc_storeStrong((id *)&self->_pendingCoordinators, a3);
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
  objc_storeStrong((id *)&self->_pendingCoordinators, 0);
}

@end
