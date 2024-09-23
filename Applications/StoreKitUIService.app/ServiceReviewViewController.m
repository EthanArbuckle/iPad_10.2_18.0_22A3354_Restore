@implementation ServiceReviewViewController

- (SKUIConfigurationPreloader)configurationPreloader
{
  SKUIConfigurationPreloader *configurationPreloader;
  SKUIConfigurationPreloader *v4;
  SKUIConfigurationPreloader *v5;

  configurationPreloader = self->_configurationPreloader;
  if (!configurationPreloader)
  {
    v4 = (SKUIConfigurationPreloader *)objc_alloc_init((Class)SKUIConfigurationPreloader);
    v5 = self->_configurationPreloader;
    self->_configurationPreloader = v4;

    configurationPreloader = self->_configurationPreloader;
  }
  return configurationPreloader;
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SKUIServiceReviewViewController);
}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SKUIClientReviewViewController);
}

- (void)setupWithParameters:(id)a3
{
  id v4;
  id v5;
  void ***v6;
  void *v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, void *);
  void *v11;
  id v12;
  ServiceReviewViewController *v13;
  id v14;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_10000AAFC;
  v11 = &unk_100049518;
  objc_copyWeak(&v14, &location);
  v5 = v4;
  v12 = v5;
  v13 = self;
  v6 = objc_retainBlock(&v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceReviewViewController configurationPreloader](self, "configurationPreloader", v8, v9, v10, v11));
  objc_msgSend(v7, "preloadConfigurationForPurpose:withCompletionBlock:", 1, v6);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)finishImmediately:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceReviewViewController presentedViewController](self, "presentedViewController"));

  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000B2E4;
    v6[3] = &unk_1000490B8;
    v6[4] = self;
    -[ServiceReviewViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", objc_msgSend(v4, "BOOLValue"), v6);
  }

}

- (void)_buildReviewInAppConfigurationWithParameters:(id)a3 clientContext:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void (**v23)(id, _QWORD);
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  unsigned int v30;
  NSObject *v31;
  uint64_t v32;
  id v33;
  void *v34;
  NSMutableArray *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  id v41;
  void (**v42)(id, _QWORD);
  char v43;
  _QWORD v44[5];
  id v45;
  int v46;
  id v47;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceReviewViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier"));
  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("bundleID")));
    v13 = v12;
    v14 = v12 ? v12 : (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v11 = v14;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    if (v11 == v15)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
      v29 = objc_msgSend(v28, "shouldLog");
      if (objc_msgSend(v28, "shouldLogToDisk"))
        v30 = v29 | 2;
      else
        v30 = v29;
      v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "OSLogObject"));
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        v32 = v30;
      else
        v32 = v30 & 2;
      if ((_DWORD)v32)
      {
        v46 = 138412290;
        v47 = (id)objc_opt_class(self);
        v33 = v47;
        v34 = (void *)_os_log_send_and_compose_impl(v32, 0, 0, 0, &_mh_execute_header, v31, 16, "[%@]: Bundle identifier is unexpectedly null; refusing to display review prompt",
                        &v46,
                        12);

        if (!v34)
        {
LABEL_22:

          v10[2](v10, 0);
          goto LABEL_11;
        }
        v31 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v34, 4));
        free(v34);
        SSFileLog(v28, CFSTR("%@"));
      }

      goto LABEL_22;
    }
  }
  v36 = v9;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:](LSApplicationProxy, "applicationProxyForIdentifier:", v11));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceReviewViewController _iconForApplication:](self, "_iconForApplication:", v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", SKUIServiceReviewSandboxMode));
  v19 = objc_msgSend(v18, "BOOLValue");

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "itemID"));
  v21 = objc_msgSend(v20, "unsignedIntegerValue");

  if (v21 || (v19 & 1) != 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "itemID"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedName"));
    v9 = v36;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceReviewViewController _inAppConfigurationWithItemID:title:icon:sandboxed:clientContext:](self, "_inAppConfigurationWithItemID:title:icon:sandboxed:clientContext:", v25, v26, v17, v19, v36));

    ((void (**)(id, void *))v10)[2](v10, v27);
  }
  else
  {
    v35 = objc_opt_new(NSMutableArray);
    -[NSMutableArray addObject:](v35, "addObject:", v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SKServiceBroker defaultBroker](SKServiceBroker, "defaultBroker"));
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_10000B754;
    v44[3] = &unk_100049540;
    v44[4] = self;
    v23 = v10;
    v45 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "storeKitServiceWithErrorHandler:", v44));

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10000B8E0;
    v37[3] = &unk_100049568;
    v37[4] = self;
    v42 = v23;
    v38 = v11;
    v39 = v16;
    v40 = v17;
    v43 = 0;
    v9 = v36;
    v41 = v36;
    objc_msgSend(v24, "lookUpItemIDsForDeletableSystemAppsWithBundleIDs:reply:", v35, v37);

  }
LABEL_11:

}

- (id)_inAppConfigurationWithItemID:(id)a3 title:(id)a4 icon:(id)a5 sandboxed:(BOOL)a6 clientContext:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v7 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = objc_alloc_init((Class)SKUIReviewInAppConfiguration);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringValue"));

  objc_msgSend(v16, "setItemID:", v17);
  objc_msgSend(v16, "setTitle:", v14);

  objc_msgSend(v16, "setViewController:", self);
  objc_msgSend(v16, "setClientContext:", v12);

  objc_msgSend(v16, "setIcon:", v13);
  objc_msgSend(v16, "setSandboxed:", v7);
  objc_msgSend(v16, "setIsNativeVisionApp:", 0);
  return v16;
}

- (id)_iconForApplication:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  CGImage *v11;
  void *v12;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v4, "scale");
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v6 == 3.0)
  {
    v9 = 32;
  }
  else if (v6 == 2.0)
  {
    if (v8 == (id)1)
      v9 = 24;
    else
      v9 = 15;
  }
  else
  {
    v9 = v8 == (id)1;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "iconDataForVariant:", v9));

  v11 = (CGImage *)LICreateIconFromCachedBitmap(v10);
  if (v11)
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", v11, 0, v6));
  else
    v12 = 0;
  CGImageRelease(v11);

  return v12;
}

- (void)_loadDidFailWithError:(id)a3
{
  id v4;
  NSBundle *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  NSErrorUserInfoKey v24;
  void *v25;

  v4 = a3;
  if (!v4)
  {
    v24 = NSLocalizedDescriptionKey;
    v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(SSLookupRequest));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DEFAULT_ERROR_TITLE"), &stru_10004A1F0, 0));
    v25 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", SKErrorDomain, 5, v8));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v10 = objc_msgSend(v9, "shouldLog");
  if (objc_msgSend(v9, "shouldLogToDisk"))
    LODWORD(v11) = v10 | 2;
  else
    LODWORD(v11) = v10;
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "OSLogObject"));
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    v11 = v11;
  else
    v11 &= 2u;
  if ((_DWORD)v11)
  {
    v20 = 138543618;
    v21 = (id)objc_opt_class(self);
    v22 = 2114;
    v23 = v4;
    v13 = v21;
    v14 = (void *)_os_log_send_and_compose_impl(v11, 0, 0, 0, &_mh_execute_header, v12, 16, "[%{public}@]: Load failed with error: %{public}@.", &v20, 22);

    if (!v14)
      goto LABEL_13;
    v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4));
    free(v14);
    SSFileLog(v9, CFSTR("%@"));
  }

LABEL_13:
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[SKUIErrorHelper errorWithSafeUserInfo:](SKUIErrorHelper, "errorWithSafeUserInfo:", v4));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceReviewViewController presentedViewController](self, "presentedViewController"));

  if (v16)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000C0F4;
    v18[3] = &unk_100049590;
    v18[4] = self;
    v19 = v15;
    -[ServiceReviewViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v18);

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ServiceReviewViewController _clientViewControllerProxy](self, "_clientViewControllerProxy"));
    objc_msgSend(v17, "didFinishWithResult:error:", &off_10004CE80, v15);

  }
}

- (void)setConfigurationPreloader:(id)a3
{
  objc_storeStrong((id *)&self->_configurationPreloader, a3);
}

- (SKUIReviewInAppController)reviewInAppController
{
  return self->_reviewInAppController;
}

- (void)setReviewInAppController:(id)a3
{
  objc_storeStrong((id *)&self->_reviewInAppController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reviewInAppController, 0);
  objc_storeStrong((id *)&self->_configurationPreloader, 0);
}

@end
