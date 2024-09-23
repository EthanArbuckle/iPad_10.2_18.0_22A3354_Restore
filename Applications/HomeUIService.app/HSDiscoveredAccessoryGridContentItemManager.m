@implementation HSDiscoveredAccessoryGridContentItemManager

- (HSDiscoveredAccessoryGridContentItemManager)initWithDelegate:(id)a3 shouldGroupByRoom:(BOOL)a4 itemProvidersCreator:(id)a5
{
  void *v7;
  NSString *v8;
  void *v9;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4, a5));
  v8 = NSStringFromSelector("initWithAccessoryBrowsingManager:delegate:discoveredAccessoryFilter:");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HSDiscoveredAccessoryGridContentItemManager.m"), 25, CFSTR("%s is unavailable; use %@ instead"),
    "-[HSDiscoveredAccessoryGridContentItemManager initWithDelegate:shouldGroupByRoom:itemProvidersCreator:]",
    v9);

  return 0;
}

- (HSDiscoveredAccessoryGridContentItemManager)initWithAccessoryBrowsingManager:(id)a3 delegate:(id)a4 discoveredAccessoryFilter:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  HSDiscoveredAccessoryGridContentItemManager *v13;
  HSDiscoveredAccessoryGridContentItemManager *v14;
  objc_super v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v9 = a3;
  v10 = a5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100052E7C;
  v17[3] = &unk_1000A3378;
  v11 = v9;
  v18 = v11;
  v12 = v10;
  v19 = v12;
  v16.receiver = self;
  v16.super_class = (Class)HSDiscoveredAccessoryGridContentItemManager;
  v13 = -[HSDiscoveredAccessoryGridContentItemManager initWithDelegate:shouldGroupByRoom:itemProvidersCreator:](&v16, "initWithDelegate:shouldGroupByRoom:itemProvidersCreator:", a4, 0, v17);
  v14 = v13;
  if (v13)
    objc_storeStrong((id *)&v13->_accessoryBrowsingManager, a3);

  return v14;
}

- (void)_registerForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HSDiscoveredAccessoryGridContentItemManager;
  -[HSDiscoveredAccessoryGridContentItemManager _registerForExternalUpdates](&v4, "_registerForExternalUpdates");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryGridContentItemManager accessoryBrowsingManager](self, "accessoryBrowsingManager"));
  objc_msgSend(v3, "addBrowsingObserver:", self);

}

- (void)_unregisterForExternalUpdates
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HSDiscoveredAccessoryGridContentItemManager;
  -[HSDiscoveredAccessoryGridContentItemManager _unregisterForExternalUpdates](&v4, "_unregisterForExternalUpdates");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryGridContentItemManager accessoryBrowsingManager](self, "accessoryBrowsingManager"));
  objc_msgSend(v3, "removeBrowsingObserver:", self);

}

- (BOOL)_shouldBuildItemProvidersAndModulesForNilHome
{
  return 1;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "na_filter:", &stru_1000A3398));
  if (objc_msgSend(v6, "count"))
  {
    v7 = objc_msgSend(objc_alloc((Class)HFMutableItemSection), "initWithIdentifier:", CFSTR("HSDiscoveredAccessoryGridContentUnpairedSectionIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
    v10 = objc_msgSend((id)objc_opt_class(self, v9), "_discoveredAccessoryItemComparator");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sortedArrayUsingComparator:", v11));
    objc_msgSend(v7, "setItems:", v12);

    v13 = HULocalizedString(CFSTR("HUProximityCardSelectNearbyAccessorySectionUnpaired"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    objc_msgSend(v7, "setHeaderTitle:", v14);

    objc_msgSend(v5, "addObject:", v7);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "na_setByRemovingObjectsFromSet:", v6));
  if (objc_msgSend(v15, "count"))
  {
    v16 = objc_msgSend(objc_alloc((Class)HFMutableItemSection), "initWithIdentifier:", CFSTR("HSDiscoveredAccessoryGridContentPairedSectionIdentifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allObjects"));
    v19 = objc_msgSend((id)objc_opt_class(self, v18), "_discoveredAccessoryItemComparator");
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "sortedArrayUsingComparator:", v20));
    objc_msgSend(v16, "setItems:", v21);

    v22 = HULocalizedString(CFSTR("HUProximityCardSelectNearbyAccessorySectionPaired"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    objc_msgSend(v16, "setHeaderTitle:", v23);

    objc_msgSend(v5, "addObject:", v16);
  }

  return v5;
}

+ (id)_discoveredAccessoryItemComparator
{
  return &stru_1000A33D8;
}

- (void)accessoryBrowsingManager:(id)a3 didFindNewAccessory:(id)a4
{
  -[HSDiscoveredAccessoryGridContentItemManager _reloadDiscoveredAccessoryItemProviderWithSenderSelector:](self, "_reloadDiscoveredAccessoryItemProviderWithSenderSelector:", a2, a4);
}

- (void)accessoryBrowsingManager:(id)a3 didRemoveNewAccessory:(id)a4
{
  -[HSDiscoveredAccessoryGridContentItemManager _reloadDiscoveredAccessoryItemProviderWithSenderSelector:](self, "_reloadDiscoveredAccessoryItemProviderWithSenderSelector:", a2, a4);
}

- (void)accessoryBrowsingManager:(id)a3 didFindNewSharingDevice:(id)a4
{
  -[HSDiscoveredAccessoryGridContentItemManager _reloadDiscoveredAccessoryItemProviderWithSenderSelector:](self, "_reloadDiscoveredAccessoryItemProviderWithSenderSelector:", a2, a4);
}

- (void)accessoryBrowsingManager:(id)a3 didRemoveNewSharingDevice:(id)a4
{
  -[HSDiscoveredAccessoryGridContentItemManager _reloadDiscoveredAccessoryItemProviderWithSenderSelector:](self, "_reloadDiscoveredAccessoryItemProviderWithSenderSelector:", a2, a4);
}

- (void)_reloadDiscoveredAccessoryItemProviderWithSenderSelector:(SEL)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HSDiscoveredAccessoryGridContentItemManager itemProviders](self, "itemProviders", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "na_firstObjectPassingTest:", &stru_1000A3418));

  if (v6)
  {
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    v8 = -[HSDiscoveredAccessoryGridContentItemManager reloadAndUpdateItemsForProviders:senderSelector:](self, "reloadAndUpdateItemsForProviders:senderSelector:", v7, a2);

  }
  else
  {
    NSLog(CFSTR("Could not find discoveredAccessoryItemProvider"));
  }

}

- (HFAccessoryBrowsingManager)accessoryBrowsingManager
{
  return self->_accessoryBrowsingManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryBrowsingManager, 0);
}

@end
