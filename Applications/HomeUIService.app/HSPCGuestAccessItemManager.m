@implementation HSPCGuestAccessItemManager

- (HSPCGuestAccessItemManager)initWithDelegate:(id)a3 sourceItem:(id)a4
{
  void *v6;
  NSString *v7;
  void *v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4));
  v7 = NSStringFromSelector("initWithPinCodeManager:delegate:home:forAccessory:");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HSPCGuestAccessItemManager.m"), 26, CFSTR("%s is unavailable; use %@ instead"),
    "-[HSPCGuestAccessItemManager initWithDelegate:sourceItem:]",
    v8);

  return 0;
}

- (HSPCGuestAccessItemManager)initWithDelegate:(id)a3
{
  void *v5;
  NSString *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  v6 = NSStringFromSelector("initWithPinCodeManager:delegate:home:forAccessory:");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HSPCGuestAccessItemManager.m"), 31, CFSTR("%s is unavailable; use %@ instead"),
    "-[HSPCGuestAccessItemManager initWithDelegate:]",
    v7);

  return 0;
}

- (HSPCGuestAccessItemManager)initWithPinCodeManager:(id)a3 delegate:(id)a4 home:(id)a5 forAccessory:(id)a6
{
  id v11;
  id v12;
  id v13;
  HSPCGuestAccessItemManager *v14;
  HSPCGuestAccessItemManager *v15;
  objc_super v17;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HSPCGuestAccessItemManager;
  v14 = -[HSPCGuestAccessItemManager initWithDelegate:sourceItem:](&v17, "initWithDelegate:sourceItem:", a4, 0);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_pinCodeManager, a3);
    objc_storeStrong((id *)&v15->_overrideHome, a5);
    objc_storeStrong((id *)&v15->_accessory, a6);
  }

  return v15;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v11;

  v4 = objc_alloc((Class)HFPinCodeItemProvider);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessItemManager home](self, "home"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessItemManager pinCodeManager](self, "pinCodeManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessItemManager accessory](self, "accessory"));
  v8 = objc_msgSend(v4, "initWithHome:pinCodeManager:listType:forAccessory:", v5, v6, 2, v7);

  v11 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));

  return v9;
}

- (id)_itemsToHideInSet:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HSPCGuestAccessItemManager;
  v3 = a3;
  v4 = -[HSPCGuestAccessItemManager _itemsToHideInSet:](&v9, "_itemsToHideInSet:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend(v5, "mutableCopy", v9.receiver, v9.super_class);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "na_filter:", &stru_1000A1EC0));
  objc_msgSend(v6, "unionSet:", v7);

  return v6;
}

- (void)_registerForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HSPCGuestAccessItemManager;
  -[HSPCGuestAccessItemManager _registerForExternalUpdates](&v4, "_registerForExternalUpdates");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessItemManager pinCodeManager](self, "pinCodeManager"));
  objc_msgSend(v3, "addObserver:", self);

}

- (void)_unregisterForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HSPCGuestAccessItemManager;
  -[HSPCGuestAccessItemManager _unregisterForExternalUpdates](&v4, "_unregisterForExternalUpdates");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessItemManager pinCodeManager](self, "pinCodeManager"));
  objc_msgSend(v3, "removeObserver:", self);

}

- (id)_homeFuture
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCGuestAccessItemManager overrideHome](self, "overrideHome"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v2));

  return v3;
}

- (HFPinCodeManager)pinCodeManager
{
  return self->_pinCodeManager;
}

- (void)setPinCodeManager:(id)a3
{
  objc_storeStrong((id *)&self->_pinCodeManager, a3);
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (HMHome)overrideHome
{
  return self->_overrideHome;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideHome, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_pinCodeManager, 0);
}

@end
