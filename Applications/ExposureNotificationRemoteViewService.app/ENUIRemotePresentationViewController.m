@implementation ENUIRemotePresentationViewController

- (ENUIRemotePresentationViewController)init
{
  id v2;
  id v3;
  void *v4;
  dispatch_group_t v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ENUIRemotePresentationViewController;
  v2 = -[ENUIRemotePresentationViewController initWithNibName:bundle:](&v11, "initWithNibName:bundle:", 0, 0);
  if (v2)
  {
    v3 = objc_alloc_init((Class)ENManager);
    v4 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v3;

    objc_msgSend(*((id *)v2 + 3), "setDispatchQueue:", &_dispatch_main_q);
    v5 = dispatch_group_create();
    v6 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v5;

    dispatch_group_enter(*((dispatch_group_t *)v2 + 4));
    v7 = (void *)*((_QWORD *)v2 + 3);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100002104;
    v9[3] = &unk_100004178;
    v10 = v2;
    objc_msgSend(v7, "activateWithCompletionHandler:", v9);

  }
  return (ENUIRemotePresentationViewController *)v2;
}

- (void)dealloc
{
  objc_super v3;

  -[ENManager invalidate](self->_manager, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ENUIRemotePresentationViewController;
  -[ENUIRemotePresentationViewController dealloc](&v3, "dealloc");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ENUIRemotePresentationViewController;
  -[ENUIRemotePresentationViewController viewDidLoad](&v3, "viewDidLoad");
  if (self->_showAtViewLoad)
    -[ENUIRemotePresentationViewController show](self, "show");
}

- (void)setPresentationRequest:(id)a3
{
  ENRemotePresentationRequest **p_presentationRequest;

  p_presentationRequest = &self->_presentationRequest;
  objc_storeStrong((id *)&self->_presentationRequest, a3);
  if (*p_presentationRequest)
    -[ENUIRemotePresentationViewController show](self, "show");
}

- (void)show
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];

  if ((-[ENUIRemotePresentationViewController isViewLoaded](self, "isViewLoaded") & 1) == 0)
  {
    v4 = 8;
LABEL_8:
    *((_BYTE *)&self->super.super.super.isa + v4) = 1;
    return;
  }
  if (!self->_presentationRequest)
  {
    v4 = 9;
    goto LABEL_8;
  }
  self->_showAtViewLoad = 0;
  self->_showAfterPresentationRequest = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ENUIRemotePresentationViewController _viewControllerToShowForPresentationRequest:](self, "_viewControllerToShowForPresentationRequest:", self->_presentationRequest));
  if (v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000022FC;
    v5[3] = &unk_1000041A0;
    v5[4] = self;
    -[ENUIRemotePresentationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, v5);
  }

}

- (ENUIHostViewControllerProtocol)_hostViewController
{
  return (ENUIHostViewControllerProtocol *)-[ENUIRemotePresentationViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
}

- (void)_finishWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ENUIRemotePresentationViewController _hostViewController](self, "_hostViewController"));
  objc_msgSend(v5, "didFinishWithError:", v4);

}

- (id)_viewControllerToShowForPresentationRequest:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;

  v4 = a3;
  v5 = objc_msgSend(v4, "requestType");
  if (v5 == (id)3)
  {
    location = 0;
    objc_initWeak(&location, self);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ENUIViewControllerFactory sharedInstance](ENUIViewControllerFactory, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appBundleIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "agencyRegion"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100002950;
    v20[3] = &unk_1000041F0;
    v15 = &v21;
    objc_copyWeak(&v21, &location);
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "createPreApprovalDialogueWithBundleIdentifier:region:completion:", v13, v14, v20));
LABEL_8:
    v11 = (void *)v16;

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
    goto LABEL_14;
  }
  if (v5 == (id)2)
  {
    location = 0;
    objc_initWeak(&location, self);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ENUIViewControllerFactory sharedInstance](ENUIViewControllerFactory, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "appBundleIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "agencyRegion"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100002854;
    v22[3] = &unk_1000041F0;
    v15 = &v23;
    objc_copyWeak(&v23, &location);
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "createKeyReleaseDialogueWithBundleIdentifier:region:completion:", v13, v14, v22));
    goto LABEL_8;
  }
  if (v5 == (id)1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "agencyRegion"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "regionCode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel regionForRegionCode:](_TtC28HealthExposureNotificationUI27ENUIPublicHealthAgencyModel, "regionForRegionCode:", v7));

    if (v8)
    {
      location = 0;
      objc_initWeak(&location, self);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[ENUIViewControllerFactory sharedInstance](ENUIViewControllerFactory, "sharedInstance"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[_TtC28HealthExposureNotificationUI16ENManagerAdapter defaultAdapter](_TtC28HealthExposureNotificationUI16ENManagerAdapter, "defaultAdapter"));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100002758;
      v24[3] = &unk_1000041C8;
      objc_copyWeak(&v25, &location);
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "createOnboardingStackForAgencyModel:exposureManager:fromAvailabilityAlert:fromDeepLink:subsequentFlow:completion:", v8, v10, 0, 0, 0, v24));

      objc_msgSend(v11, "setModalPresentationStyle:", 0);
      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
    else
    {
      v17 = ENUILogForCategory(0);
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_100002F10(v18);

      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (void)_performAfterActivation:(id)a3
{
  dispatch_group_notify((dispatch_group_t)self->_activationGroup, (dispatch_queue_t)&_dispatch_main_q, a3);
}

- (void)_handleOnboardingResult:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ENUIRemotePresentationViewController presentationRequest](self, "presentationRequest"));
  objc_msgSend(v7, "onboardingRequestCompletedWithDecision:", a3 != 0);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100002B0C;
  v9[3] = &unk_100004240;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[ENUIRemotePresentationViewController _performAfterActivation:](self, "_performAfterActivation:", v9);

}

- (void)_handleKeyReleaseDecision:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ENUIRemotePresentationViewController presentationRequest](self, "presentationRequest"));
  objc_msgSend(v7, "keyReleaseRequestCompletedWithDecision:", v4);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100002C60;
  v9[3] = &unk_100004240;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[ENUIRemotePresentationViewController _performAfterActivation:](self, "_performAfterActivation:", v9);

}

- (void)_handlePreApprovalDecision:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ENUIRemotePresentationViewController presentationRequest](self, "presentationRequest"));
  objc_msgSend(v7, "preApprovalRequestCompletedWithDecision:", v4);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100002DB4;
  v9[3] = &unk_100004240;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  -[ENUIRemotePresentationViewController _performAfterActivation:](self, "_performAfterActivation:", v9);

}

- (ENRemotePresentationRequest)presentationRequest
{
  return self->_presentationRequest;
}

- (ENManager)manager
{
  return self->_manager;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (OS_dispatch_group)activationGroup
{
  return self->_activationGroup;
}

- (void)setActivationGroup:(id)a3
{
  objc_storeStrong((id *)&self->_activationGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationGroup, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_presentationRequest, 0);
}

@end
