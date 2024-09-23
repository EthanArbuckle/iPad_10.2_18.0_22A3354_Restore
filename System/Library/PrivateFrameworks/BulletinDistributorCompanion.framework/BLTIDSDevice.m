@implementation BLTIDSDevice

- (BLTIDSDevice)initWithIDSDevice:(id)a3
{
  id v5;
  BLTIDSDevice *v6;
  BLTIDSDevice *v7;
  id v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BLTIDSDevice;
  v6 = -[BLTIDSDevice init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = +[BLTReachabilityManager sharedInstance](BLTReachabilityManager, "sharedInstance");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)BLTIDSDevice;
  -[BLTIDSDevice dealloc](&v2, sel_dealloc);
}

- (BOOL)isDefaultPairedDevice
{
  return -[IDSDevice isDefaultPairedDevice](self->_device, "isDefaultPairedDevice");
}

- (BOOL)isNearby
{
  return -[IDSDevice isNearby](self->_device, "isNearby");
}

- (BOOL)isConnected
{
  return -[IDSDevice isConnected](self->_device, "isConnected");
}

- (BOOL)isCloudReachable
{
  void *v2;
  char v3;

  +[BLTReachabilityManager sharedInstance](BLTReachabilityManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInternetReachable");

  return v3;
}

- (NSString)description
{
  return (NSString *)-[BLTIDSDevice descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BLTIDSDevice succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BLTIDSDevice descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  -[BLTIDSDevice succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendPointer:withName:", self->_device, CFSTR("device"));
  v6 = (id)objc_msgSend(v4, "appendBool:withName:", -[BLTIDSDevice isDefaultPairedDevice](self, "isDefaultPairedDevice"), CFSTR("isDefaultPairedDevice"));
  v7 = (id)objc_msgSend(v4, "appendBool:withName:", -[BLTIDSDevice isNearby](self, "isNearby"), CFSTR("isNearby"));
  v8 = (id)objc_msgSend(v4, "appendBool:withName:", -[BLTIDSDevice isConnected](self, "isConnected"), CFSTR("isConnected"));
  v9 = (id)objc_msgSend(v4, "appendBool:withName:", -[BLTIDSDevice isCloudReachable](self, "isCloudReachable"), CFSTR("isCloudReachable"));
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
