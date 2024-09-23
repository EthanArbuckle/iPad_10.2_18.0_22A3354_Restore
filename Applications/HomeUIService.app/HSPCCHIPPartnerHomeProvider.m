@implementation HSPCCHIPPartnerHomeProvider

- (id)loadData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HSPCDataProvider config](self, "config"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "matterDeviceSetupRequest"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topology"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "homes"));
    -[HSPCDataProvider setItems:](self, "setItems:", v6);

    -[HSPCDataProvider setLoaded:](self, "setLoaded:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithNoResult](NAFuture, "futureWithNoResult"));
  }
  else
  {
    v8 = HFLogForCategory(58);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100060E5C(v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hmfErrorWithCode:](NSError, "hmfErrorWithCode:", 8));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v10));

  }
  return v7;
}

- (id)userFacingStringForItem:(id)a3
{
  return objc_msgSend(a3, "name");
}

@end
