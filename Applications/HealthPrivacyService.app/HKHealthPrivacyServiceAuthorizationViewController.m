@implementation HKHealthPrivacyServiceAuthorizationViewController

- (HKHealthPrivacyServiceAuthorizationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  HKHealthPrivacyServiceAuthorizationViewController *v4;
  HKHealthStore *v5;
  HKHealthStore *healthStore;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKHealthPrivacyServiceAuthorizationViewController;
  v4 = -[HKHealthPrivacyServiceAuthorizationViewController initWithNibName:bundle:](&v8, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = (HKHealthStore *)objc_alloc_init((Class)HKHealthStore);
    healthStore = v4->_healthStore;
    v4->_healthStore = v5;

  }
  return v4;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKHealthPrivacyServiceAuthorizationViewController;
  -[HKHealthPrivacyServiceAuthorizationViewController viewDidLoad](&v3, "viewDidLoad");
  if (self->_showAtViewLoad)
    -[HKHealthPrivacyServiceAuthorizationViewController show](self, "show");
}

- (void)setRequestRecord:(id)a3 presentationRequests:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a3;
  if ((objc_msgSend(v11, "hk_allElementsUnique") & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthPrivacyServiceAuthorizationViewController.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[presentationRequests hk_allElementsUnique]"));

  }
  if (!objc_msgSend(v11, "count"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthPrivacyServiceAuthorizationViewController.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationRequests.count > 0"));

  }
  -[HKHealthPrivacyServiceAuthorizationViewController setRequestRecord:](self, "setRequestRecord:", v7);
  -[HKHealthPrivacyServiceAuthorizationViewController setPresentationRequests:](self, "setPresentationRequests:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sessionIdentifier"));

  -[HKHealthPrivacyServiceAuthorizationViewController _beginAuthorizationSessionWithIdentifier:](self, "_beginAuthorizationSessionWithIdentifier:", v8);
}

- (void)show
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if ((-[HKHealthPrivacyServiceAuthorizationViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
  {
    self->_showAtViewLoad = 1;
    return;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController currentTransactionSource](self, "currentTransactionSource"));
  if (!v4)
  {
    self->_showAtNextSourceFetch = 1;
    goto LABEL_8;
  }
  v11 = v4;
  self->_showAtViewLoad = 0;
  self->_showAtNextSourceFetch = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController requestRecord](self, "requestRecord"));
  v6 = objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController presentationRequests](self, "presentationRequests"));
  v7 = (void *)v6;
  if (!v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthPrivacyServiceAuthorizationViewController.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("requestRecord != nil"));

    if (v7)
      goto LABEL_5;
LABEL_10:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthPrivacyServiceAuthorizationViewController.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentationRequests != nil"));

    goto LABEL_5;
  }
  if (!v6)
    goto LABEL_10;
LABEL_5:
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  -[HKHealthPrivacyServiceAuthorizationViewController _presentRequestIfNeeded:](self, "_presentRequestIfNeeded:", v8);

  v4 = v11;
LABEL_8:

}

- (void)_presentRequestIfNeeded:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController currentTransactionSessionIdentifier](self, "currentTransactionSessionIdentifier"));

  if (!v5)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthPrivacyServiceAuthorizationViewController.m"), 112, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.currentTransactionSessionIdentifier != nil"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController currentTransactionSource](self, "currentTransactionSource"));
  if (!v6)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthPrivacyServiceAuthorizationViewController.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source != nil"));

  }
  -[HKHealthPrivacyServiceAuthorizationViewController setPresentedRequest:](self, "setPresentedRequest:", v14);
  v7 = objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController _promptControllerForPresentationRequest:source:](self, "_promptControllerForPresentationRequest:source:", v14, v6));
  v8 = (void *)v7;
  if (v7
    && ((objc_opt_respondsToSelector(v7, "shouldPresent") & 1) == 0
     || (objc_msgSend(v8, "shouldPresent") & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController presentationRequests](self, "presentationRequests"));
    v10 = objc_msgSend(v9, "indexOfObject:", v14) != 0;

    v11 = objc_msgSend(objc_alloc((Class)HKNavigationController), "initWithRootViewController:", v8);
    objc_msgSend(v11, "setModalInPresentation:", 1);
    objc_msgSend(v11, "setModalPresentationStyle:", 5);
    -[HKHealthPrivacyServiceAuthorizationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, v10, 0);

  }
  else
  {
    -[HKHealthPrivacyServiceAuthorizationViewController _didFinishPresentingRequestWithError:](self, "_didFinishPresentingRequestWithError:", 0);
  }

}

- (BOOL)_isPresentingLastRequest
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController presentedRequest](self, "presentedRequest"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController presentationRequests](self, "presentationRequests"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
    v6 = objc_msgSend(v3, "isEqual:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_presentNextRequest
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController presentedRequest](self, "presentedRequest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController currentTransactionSessionIdentifier](self, "currentTransactionSessionIdentifier"));

  if (!v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthPrivacyServiceAuthorizationViewController.m"), 144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.currentTransactionSessionIdentifier != nil"));

  }
  if (!v10)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthPrivacyServiceAuthorizationViewController.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentedRequest != nil"));

  }
  if (-[HKHealthPrivacyServiceAuthorizationViewController _isPresentingLastRequest](self, "_isPresentingLastRequest"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthPrivacyServiceAuthorizationViewController.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _isPresentingLastRequest] == NO"));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController presentationRequests](self, "presentationRequests"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", (char *)objc_msgSend(v5, "indexOfObject:", v10) + 1));
  -[HKHealthPrivacyServiceAuthorizationViewController _presentRequestIfNeeded:](self, "_presentRequestIfNeeded:", v6);

}

- (void)_didFinishPresentingRequestWithError:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[HKHealthPrivacyServiceAuthorizationViewController _isPresentingLastRequest](self, "_isPresentingLastRequest")
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController currentTransactionSessionIdentifier](self, "currentTransactionSessionIdentifier")), v4, !v4))
  {
    -[HKHealthPrivacyServiceAuthorizationViewController _finishWithError:](self, "_finishWithError:", v5);
  }
  else
  {
    -[HKHealthPrivacyServiceAuthorizationViewController _presentNextRequest](self, "_presentNextRequest");
  }

}

- (id)_promptControllerForPresentationRequest:(id)a3 source:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "type");
  if (v8 == (id)1)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController _promptControllerForHealthDataPresentationRequest:source:](self, "_promptControllerForHealthDataPresentationRequest:source:", v6, v7));
  }
  else
  {
    if (v8)
    {
      v10 = 0;
      goto LABEL_7;
    }
    v9 = objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController _promptControllerForClinicalHealthRecordsPresentationRequest:source:](self, "_promptControllerForClinicalHealthRecordsPresentationRequest:source:", v6, v7));
  }
  v10 = (void *)v9;
LABEL_7:

  return v10;
}

- (id)_promptControllerForClinicalHealthRecordsPresentationRequest:(id)a3 source:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v7 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "type"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthPrivacyServiceAuthorizationViewController.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request.type == HKAuthorizationPresentationTypeClinicalHealthRecords"));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController healthStore](self, "healthStore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[HKClinicalAuthorizationSequenceContext contextWithHealthStore:request:source:](HKClinicalAuthorizationSequenceContext, "contextWithHealthStore:request:source:", v9, v8, v7));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "createInitialViewControllerWithDelegate:", self));
  return v11;
}

- (id)_promptControllerForHealthDataPresentationRequest:(id)a3 source:(id)a4
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;

  v7 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "type") != (id)1)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthPrivacyServiceAuthorizationViewController.m"), 197, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request.type == HKAuthorizationPresentationTypeHealthData"));

  }
  v9 = objc_alloc((Class)HKAuthorizationSettingsViewController);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController healthStore](self, "healthStore"));
  v11 = objc_msgSend(v9, "initWithHealthStore:style:", v10, 1);

  objc_msgSend(v11, "setDelegate:", self);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "typesRequiringReadAuthorization"));
  objc_msgSend(v11, "setTypesToRead:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "typesRequiringShareAuthorization"));
  objc_msgSend(v11, "setTypesToShare:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shareUsageDescription"));
  objc_msgSend(v11, "setUpdateDescription:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "readUsageDescription"));
  objc_msgSend(v11, "setShareDescription:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "researchStudyUsageDescription"));
  objc_msgSend(v11, "setResearchStudyUsageDescription:", v16);

  objc_msgSend(v11, "setSource:", v7);
  return v11;
}

- (unsigned)_appStateTerminationUpperBound
{
  void *v2;
  unsigned int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController presentedRequest](self, "presentedRequest"));
  if (objc_msgSend(v2, "shouldDismissWhenBackgrounded"))
    v3 = 4;
  else
    v3 = 2;

  return v3;
}

- (void)_hostApplicationStateDidChange:(unsigned int)a3
{
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD block[5];

  v5 = -[HKHealthPrivacyServiceAuthorizationViewController _appStateTerminationUpperBound](self, "_appStateTerminationUpperBound");
  if (v5 > a3)
  {
    _HKInitializeLogging(v5, v6);
    v7 = HKLogAuthorization;
    if (os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_DEBUG))
      sub_1000079E4(a3, v7);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006BC8;
    block[3] = &unk_10000C340;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_configureApplicationStateMonitor
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id location;
  void *v13;

  objc_initWeak(&location, self);
  v3 = objc_alloc((Class)BKSApplicationStateMonitor);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier"));
  v13 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  v6 = objc_msgSend(v3, "initWithBundleIDs:states:", v5, BKSApplicationStateAll);

  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_100006D40;
  v10 = &unk_10000C368;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v6, "setHandler:", &v7);
  -[HKHealthPrivacyServiceAuthorizationViewController setApplicationStateMonitor:](self, "setApplicationStateMonitor:", v6, v7, v8, v9, v10);
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

- (void)_hostDidTerminate
{
  void *v3;
  id v4;

  -[HKHealthPrivacyServiceAuthorizationViewController setApplicationStateMonitor:](self, "setApplicationStateMonitor:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController currentTransactionSessionIdentifier](self, "currentTransactionSessionIdentifier"));

  if (v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", HKErrorDomain, 5, 0));
    -[HKHealthPrivacyServiceAuthorizationViewController _finishWithError:](self, "_finishWithError:", v4);

  }
}

- (void)_beginAuthorizationSessionWithIdentifier:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD *v11;
  id v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;

  v5 = a3;
  if (!v5)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthPrivacyServiceAuthorizationViewController.m"), 255, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionIdentifier != nil"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController currentTransactionSessionIdentifier](self, "currentTransactionSessionIdentifier"));

  if (v6)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKHealthPrivacyServiceAuthorizationViewController.m"), 256, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.currentTransactionSessionIdentifier == nil"));

  }
  _HKInitializeLogging(v7, v8);
  v9 = (void *)HKLogAuthorization;
  if (os_log_type_enabled(HKLogAuthorization, OS_LOG_TYPE_DEBUG))
    sub_100007A5C(v9, (uint64_t)self, (uint64_t)v5);
  -[HKHealthPrivacyServiceAuthorizationViewController setCurrentTransactionSessionIdentifier:](self, "setCurrentTransactionSessionIdentifier:", v5);
  -[HKHealthPrivacyServiceAuthorizationViewController _configureApplicationStateMonitor](self, "_configureApplicationStateMonitor");
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100007030;
  v19[3] = &unk_10000C518;
  v19[4] = self;
  v10 = v5;
  v20 = v10;
  v11 = objc_retainBlock(v19);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000717C;
  v17[3] = &unk_10000C5E0;
  v17[4] = self;
  v18 = v10;
  v12 = v10;
  v13 = objc_retainBlock(v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController healthStore](self, "healthStore"));
  objc_msgSend(v14, "beginAuthorizationDelegateTransactionWithSessionIdentifier:sourceHandler:errorHandler:", v12, v13, v11);

}

- (void)promptControllerDidFinish:(id)a3 error:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  BOOL v10;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController presentedViewController](self, "presentedViewController"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007380;
  v8[3] = &unk_10000C608;
  v10 = v5 == 0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v8);

}

- (void)_finishWithError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController currentTransactionSessionIdentifier](self, "currentTransactionSessionIdentifier"));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController healthStore](self, "healthStore"));
    objc_msgSend(v5, "endAuthorizationDelegateTransactionWithSessionIdentifier:error:", v4, v7);

  }
  -[HKHealthPrivacyServiceAuthorizationViewController setCurrentTransactionSessionIdentifier:](self, "setCurrentTransactionSessionIdentifier:", 0);
  -[HKHealthPrivacyServiceAuthorizationViewController setCurrentTransactionSource:](self, "setCurrentTransactionSource:", 0);
  -[HKHealthPrivacyServiceAuthorizationViewController setPresentedRequest:](self, "setPresentedRequest:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HKHealthPrivacyServiceAuthorizationViewController _healthPrivacyHostViewController](self, "_healthPrivacyHostViewController"));
  objc_msgSend(v6, "didFinishWithError:", v7);

}

- (HKHealthPrivacyHostRemoteViewController)_healthPrivacyHostViewController
{
  return (HKHealthPrivacyHostRemoteViewController *)-[HKHealthPrivacyServiceAuthorizationViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKNavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (HKAuthorizationRequestRecord)requestRecord
{
  return self->_requestRecord;
}

- (void)setRequestRecord:(id)a3
{
  objc_storeStrong((id *)&self->_requestRecord, a3);
}

- (NSArray)presentationRequests
{
  return self->_presentationRequests;
}

- (void)setPresentationRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSUUID)currentTransactionSessionIdentifier
{
  return self->_currentTransactionSessionIdentifier;
}

- (void)setCurrentTransactionSessionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (HKSource)currentTransactionSource
{
  return self->_currentTransactionSource;
}

- (void)setCurrentTransactionSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (HKAuthorizationPresentationRequest)presentedRequest
{
  return self->_presentedRequest;
}

- (void)setPresentedRequest:(id)a3
{
  objc_storeStrong((id *)&self->_presentedRequest, a3);
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
  objc_storeStrong((id *)&self->_presentedRequest, 0);
  objc_storeStrong((id *)&self->_currentTransactionSource, 0);
  objc_storeStrong((id *)&self->_currentTransactionSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_presentationRequests, 0);
  objc_storeStrong((id *)&self->_requestRecord, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
