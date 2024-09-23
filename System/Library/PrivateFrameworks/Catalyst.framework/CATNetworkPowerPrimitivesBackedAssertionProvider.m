@implementation CATNetworkPowerPrimitivesBackedAssertionProvider

- (CATNetworkPowerPrimitivesBackedAssertionProvider)initWithNetworkPowerPrimitives:(id)a3
{
  id v5;
  CATNetworkPowerPrimitivesBackedAssertionProvider *v6;
  CATNetworkPowerPrimitivesBackedAssertionProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CATNetworkPowerPrimitivesBackedAssertionProvider;
  v6 = -[CATNetworkPowerPrimitivesBackedAssertionProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_networkPowerPrimitives, a3);

  return v7;
}

- (id)acquireAssertion
{
  void *v2;
  void *v3;

  -[CATNetworkPowerPrimitivesBackedAssertionProvider networkPowerPrimitives](self, "networkPowerPrimitives");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assertNetworkPowerOn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CATNetworkPowerPrimitives)networkPowerPrimitives
{
  return self->_networkPowerPrimitives;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkPowerPrimitives, 0);
}

@end
