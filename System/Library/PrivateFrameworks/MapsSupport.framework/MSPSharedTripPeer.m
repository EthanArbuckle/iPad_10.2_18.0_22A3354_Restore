@implementation MSPSharedTripPeer

- (BOOL)canControlSharing
{
  return self->_canControlSharing;
}

- (MSPSharedTripPeer)initWithConnection:(id)a3
{
  id v4;
  MSPSharedTripPeer *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSPSharedTripPeer;
  v5 = -[MSPSharedTripPeer init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.Maps.tripsharing.sharing"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_canControlSharing = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.Maps.tripsharing.receiving"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_canControlReceiving = objc_msgSend(v7, "BOOLValue");

  }
  return v5;
}

- (BOOL)canControlReceiving
{
  return self->_canControlReceiving;
}

@end
