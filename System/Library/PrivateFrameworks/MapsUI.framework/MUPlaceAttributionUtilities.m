@implementation MUPlaceAttributionUtilities

+ (BOOL)shouldPresentStoreProductViewControllerWithAttribution:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "shouldOpenInAppStore"))
  {
    MUGetPlaceCardLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_191DB8000, v5, OS_LOG_TYPE_INFO, "Attribution allows opening in app store", buf, 2u);
    }

    if (+[MapsUIUtilities deviceIsLockedAndNeedsPasscode](MapsUIUtilities, "deviceIsLockedAndNeedsPasscode"))
    {
      MUGetPlaceCardLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_191DB8000, v6, OS_LOG_TYPE_INFO, "Should not present store product VC, device is locked", buf, 2u);
      }
    }
    else
    {
      objc_msgSend(v4, "appAdamID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "overriddenIfNecessaryAppAdamID:", v8);
      v6 = objc_claimAutoreleasedReturnValue();

      if (-[NSObject length](v6, "length"))
      {
        v16 = 0;
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithStoreItemIdentifier:error:", -[NSObject longLongValue](v6, "longLongValue"), &v16);
        v10 = v16;
        objc_msgSend(v9, "applicationState");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isInstalled");

        if (v10)
        {
          MUGetPlaceCardLog();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v18 = v10;
            _os_log_impl(&dword_191DB8000, v13, OS_LOG_TYPE_ERROR, "Unable to check install state with error %@", buf, 0xCu);
          }

        }
        v7 = v12 ^ 1;
        if (v12)
        {
          MUGetPlaceCardLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_191DB8000, v14, OS_LOG_TYPE_INFO, "Cannot present store product VC", buf, 2u);
          }

        }
        goto LABEL_19;
      }
    }
    v7 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v7 = 0;
LABEL_20:

  return v7;
}

+ (void)presentStoreProductViewControllerWithAppAdamID:(id)a3 bundleIdentifier:(id)a4 presentingViewController:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(a1, "overriddenIfNecessaryAppAdamID:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CD8070]);
    v11 = *MEMORY[0x1E0CD8110];
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "loadProductWithParameters:completionBlock:", v10, 0);

    objc_msgSend(v7, "presentViewController:animated:completion:", v9, 1, 0);
  }

}

+ (id)overriddenIfNecessaryAppAdamID:(id)a3
{
  __CFString *v3;
  void *v4;
  int v5;

  v3 = (__CFString *)a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("MKPlacecardOverridePhotosAttributionYelpAdamID"));

  if (v5)
  {

    v3 = CFSTR("284910350");
  }
  return v3;
}

@end
