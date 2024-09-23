@implementation HKHealthPrivacyServiceRecalibrateEstimatesViewController

- (void)setRequestRecord:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id requestCompletion;
  id v9;
  id v10;
  HKAuthorizationStore *v11;
  HKAuthorizationStore *authorizationStore;
  HKAuthorizationStore *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v6 = a3;
  v7 = objc_retainBlock(a4);
  requestCompletion = self->_requestCompletion;
  self->_requestCompletion = v7;

  v9 = objc_alloc((Class)HKAuthorizationStore);
  v10 = objc_alloc_init((Class)HKHealthStore);
  v11 = (HKAuthorizationStore *)objc_msgSend(v9, "initWithHealthStore:", v10);
  authorizationStore = self->_authorizationStore;
  self->_authorizationStore = v11;

  v13 = self->_authorizationStore;
  v19 = 0;
  LOBYTE(v10) = -[HKAuthorizationStore validateRecalibrateEstimatesRequestRecord:error:](v13, "validateRecalibrateEstimatesRequestRecord:error:", v6, &v19);
  v14 = v19;
  if ((v10 & 1) != 0)
  {
    -[HKHealthPrivacyServiceRecalibrateEstimatesViewController _configureApplicationStateMonitor](self, "_configureApplicationStateMonitor");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "source"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sampleType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "effectiveDate"));
    -[HKHealthPrivacyServiceRecalibrateEstimatesViewController _configureAlertControllerWithSourceName:sampleType:effectiveDate:](self, "_configureAlertControllerWithSourceName:sampleType:effectiveDate:", v16, v17, v18);

  }
  else
  {
    -[HKHealthPrivacyServiceRecalibrateEstimatesViewController _finishRequestWithError:](self, "_finishRequestWithError:", v14);
  }

}

- (void)_hostApplicationStateDidChange:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v7;
  _QWORD block[11];

  if (a3 <= 3)
  {
    block[9] = v3;
    block[10] = v4;
    _HKInitializeLogging(self, a2);
    v7 = HKLogAuthorization;
    if (os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_DEBUG))
      sub_100007610(a3, v7);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100003178;
    block[3] = &unk_10000C340;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_configureApplicationStateMonitor
{
  HKHealthPrivacyServiceRecalibrateEstimatesViewController *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;
  void *v12;

  v2 = self;
  objc_initWeak(&location, self);
  v3 = objc_alloc((Class)BKSApplicationStateMonitor);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceRecalibrateEstimatesViewController _hostApplicationBundleIdentifier](v2, "_hostApplicationBundleIdentifier"));
  v12 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
  v6 = objc_msgSend(v3, "initWithBundleIDs:states:", v5, BKSApplicationStateAll);
  v2 = (HKHealthPrivacyServiceRecalibrateEstimatesViewController *)((char *)v2 + 40);
  v7 = *(void **)v2->HKViewController_opaque;
  *(_QWORD *)v2->HKViewController_opaque = v6;

  v8 = *(void **)v2->HKViewController_opaque;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000032E8;
  v9[3] = &unk_10000C368;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v8, "setHandler:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_hostDidTerminate
{
  BKSApplicationStateMonitor *applicationStateMonitor;
  id v4;

  applicationStateMonitor = self->_applicationStateMonitor;
  self->_applicationStateMonitor = 0;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", HKErrorDomain, 5, 0));
  -[HKHealthPrivacyServiceRecalibrateEstimatesViewController _finishRequestWithError:](self, "_finishRequestWithError:", v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  UIAlertController *alertViewController;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKHealthPrivacyServiceRecalibrateEstimatesViewController;
  -[HKHealthPrivacyServiceRecalibrateEstimatesViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  alertViewController = self->_alertViewController;
  if (alertViewController)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIAlertController presentingViewController](alertViewController, "presentingViewController"));

    if (!v5)
      -[HKHealthPrivacyServiceRecalibrateEstimatesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_alertViewController, 1, 0);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  NSError *transactionError;
  NSError *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKHealthPrivacyServiceRecalibrateEstimatesViewController;
  -[HKHealthPrivacyServiceRecalibrateEstimatesViewController viewDidDisappear:](&v6, "viewDidDisappear:", a3);
  transactionError = self->_transactionError;
  self->_transactionError = 0;
  v5 = transactionError;

  (*((void (**)(id, BOOL, NSError *))self->_requestCompletion + 2))(self->_requestCompletion, v5 == 0, v5);
}

- (void)_configureAlertControllerWithSourceName:(id)a3 sampleType:(id)a4 effectiveDate:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  UIAlertController *v20;
  UIAlertController *alertViewController;
  UIAlertController *v22;
  void *v23;
  void *v24;
  void *v25;
  UIAlertController *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  id v40;
  _QWORD v41[6];

  v33 = a4;
  v35 = a5;
  v8 = a3;
  v9 = HKLocalizedStringForDateAndTemplate(v35, 10);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (objc_msgSend(v33, "code") == (id)183)
    v11 = CFSTR("6MWD");
  else
    v11 = &stru_10000C628;
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("RECALIBRATE_ESTIMATES_ALERT_TITLE_%@_"), "stringByAppendingString:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI")));
  v36 = (void *)v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", v12, &stru_10000C628, CFSTR("HealthUI-Localizable")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v8));

  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("RECALIBRATE_ESTIMATES_ALERT_MESSAGE_%@_"), "stringByAppendingString:", v11));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI")));
  v34 = (void *)v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", v16, &stru_10000C628, CFSTR("HealthUI-Localizable")));
  v37 = (void *)v10;
  v19 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v10));

  v32 = (void *)v19;
  v20 = (UIAlertController *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v15, v19, 1));
  alertViewController = self->_alertViewController;
  self->_alertViewController = v20;

  v22 = self->_alertViewController;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI")));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("RECALIBRATE_ESTIMATES_ALERT_CANCEL"), &stru_10000C628, CFSTR("HealthUI-Localizable")));
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100003870;
  v41[3] = &unk_10000C390;
  v41[4] = self;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v24, 1, v41));
  -[UIAlertController addAction:](v22, "addAction:", v25);

  v26 = self->_alertViewController;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI")));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("RECALIBRATE_ESTIMATES_ALERT_RESET"), &stru_10000C628, CFSTR("HealthUI-Localizable")));
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1000038C4;
  v38[3] = &unk_10000C408;
  v38[4] = self;
  v29 = v33;
  v39 = v29;
  v30 = v35;
  v40 = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v28, 0, v38));
  -[UIAlertController addAction:](v26, "addAction:", v31);

  if (-[HKHealthPrivacyServiceRecalibrateEstimatesViewController isViewLoaded](self, "isViewLoaded"))
    -[HKHealthPrivacyServiceRecalibrateEstimatesViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_alertViewController, 1, 0);

}

- (void)_finishRequestWithError:(id)a3
{
  id v4;

  v4 = a3;
  -[HKHealthPrivacyServiceRecalibrateEstimatesViewController _finishWithError:](self, "_finishWithError:", v4);
  (*((void (**)(id, BOOL))self->_requestCompletion + 2))(self->_requestCompletion, v4 == 0);

}

- (void)_finishWithError:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_transactionError, a3);
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceRecalibrateEstimatesViewController _healthPrivacyHostViewController](self, "_healthPrivacyHostViewController"));
  objc_msgSend(v6, "didFinishWithError:", v5);

}

- (id)_healthPrivacyHostViewController
{
  return -[HKHealthPrivacyServiceRecalibrateEstimatesViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
}

- (HKAuthorizationStore)authorizationStore
{
  return self->_authorizationStore;
}

- (void)setAuthorizationStore:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationStore, a3);
}

- (UIAlertController)alertViewController
{
  return self->_alertViewController;
}

- (void)setAlertViewController:(id)a3
{
  objc_storeStrong((id *)&self->_alertViewController, a3);
}

- (NSError)transactionError
{
  return self->_transactionError;
}

- (void)setTransactionError:(id)a3
{
  objc_storeStrong((id *)&self->_transactionError, a3);
}

- (id)requestCompletion
{
  return self->_requestCompletion;
}

- (void)setRequestCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BKSApplicationStateMonitor)applicationStateMonitor
{
  return self->_applicationStateMonitor;
}

- (void)setApplicationStateMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_applicationStateMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationStateMonitor, 0);
  objc_storeStrong(&self->_requestCompletion, 0);
  objc_storeStrong((id *)&self->_transactionError, 0);
  objc_storeStrong((id *)&self->_alertViewController, 0);
  objc_storeStrong((id *)&self->_authorizationStore, 0);
}

@end
