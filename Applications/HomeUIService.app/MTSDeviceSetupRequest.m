@implementation MTSDeviceSetupRequest

- (BOOL)hs_shouldShowAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v4 = a3;
  if (objc_msgSend(v4, "supportsCHIP") && objc_msgSend(v4, "knownToSystemCommissioner"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commissioningID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "vendorID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "productID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serialNumber"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootPublicKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nodeID"));
    v11 = -[MTSDeviceSetupRequest shouldShowDeviceWithUUID:vendorID:productID:serialNumber:rootPublicKey:nodeID:](self, "shouldShowDeviceWithUUID:vendorID:productID:serialNumber:rootPublicKey:nodeID:", v5, v6, v7, v8, v9, v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
