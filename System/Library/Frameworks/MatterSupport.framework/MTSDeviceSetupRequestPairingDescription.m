@implementation MTSDeviceSetupRequestPairingDescription

- (MTSDeviceSetupRequestPairingDescription)initWithRootPublicKey:(id)a3 nodeID:(id)a4
{
  id v7;
  id v8;
  MTSDeviceSetupRequestPairingDescription *v9;
  MTSDeviceSetupRequestPairingDescription *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MTSDeviceSetupRequestPairingDescription;
  v9 = -[MTSDeviceSetupRequestPairingDescription init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rootPublicKey, a3);
    objc_storeStrong((id *)&v10->_nodeID, a4);
  }

  return v10;
}

- (NSData)rootPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)nodeID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_storeStrong((id *)&self->_rootPublicKey, 0);
}

@end
