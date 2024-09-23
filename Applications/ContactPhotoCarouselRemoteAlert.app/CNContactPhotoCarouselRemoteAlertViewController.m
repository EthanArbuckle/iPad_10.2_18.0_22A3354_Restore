@implementation CNContactPhotoCarouselRemoteAlertViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  BSAction *v12;
  BSAction *action;
  uint64_t v14;
  NSObject *v15;
  int v16;
  id v17;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = CNUILogRemoteAlert();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v16 = 134217984;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Configuring with context: %p", (uint8_t *)&v16, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CNContactPhotoCarouselRemoteAlertViewController _remoteViewControllerProxyWithErrorHandler:](self, "_remoteViewControllerProxyWithErrorHandler:", &stru_100008198));
  objc_msgSend(v10, "setAllowsAlertStacking:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actions"));
  v12 = (BSAction *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "anyObject"));
  action = self->_action;
  self->_action = v12;

  if (!self->_action)
  {
    v14 = CNUILogRemoteAlert();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v16) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "A response action is missing", (uint8_t *)&v16, 2u);
    }

  }
  if (v7)
    v7[2](v7);

}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  CNMutableContact *v18;
  id v19;
  CNMutableContact *requestContact;
  void *v21;
  void *v22;
  CNSNaPSetupFlowManager *v23;
  CNSNaPSetupFlowManager *flowManager;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  dispatch_time_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  _QWORD block[5];
  unsigned __int8 v33;
  id v34;
  uint8_t buf[4];
  id v36;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = CNUILogRemoteAlert();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v36 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Preparing for activation with context: %p", buf, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("mode")));
  v12 = objc_msgSend(v11, "integerValue");

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("contactData")));

  if ((*(unsigned int (**)(_QWORD, void *))(CNIsDataEmpty + 16))(CNIsDataEmpty, v14))
  {
    v15 = CNUILogRemoteAlert();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Contact data is missing for a request", buf, 2u);
    }

    if (v7)
      v7[2](v7);
  }
  else
  {
    v34 = 0;
    v17 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(CNMutableContact), v14, &v34);
    v18 = (CNMutableContact *)objc_claimAutoreleasedReturnValue(v17);
    v19 = v34;
    requestContact = self->_requestContact;
    self->_requestContact = v18;

    if (self->_requestContact)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "inProcessContactStore"));

      v23 = (CNSNaPSetupFlowManager *)objc_msgSend(objc_alloc((Class)CNSNaPSetupFlowManager), "initWithPresenterDelegate:contactStore:mode:", self, v22, v12);
      flowManager = self->_flowManager;
      self->_flowManager = v23;

      -[CNSNaPSetupFlowManager setDelegate:](self->_flowManager, "setDelegate:", self);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("isEditing")));
      v27 = objc_msgSend(v26, "BOOLValue");

      v28 = dispatch_time(0, 100000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000055B8;
      block[3] = &unk_1000081C0;
      block[4] = self;
      v33 = v27;
      dispatch_after(v28, (dispatch_queue_t)&_dispatch_main_q, block);
      if (v7)
        v7[2](v7);

    }
    else
    {
      v29 = CNUILogRemoteAlert();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedDescription"));
        *(_DWORD *)buf = 138412290;
        v36 = v31;
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Could not unarchive contact for a request: %@", buf, 0xCu);

      }
      if (v7)
        v7[2](v7);
    }

  }
}

- (void)_flowDidDismiss
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CNContactPhotoCarouselRemoteAlertViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v2, "dismiss");

}

- (void)sender:(id)a3 presentViewController:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(v5, "setModalPresentationStyle:", 0);
  -[CNContactPhotoCarouselRemoteAlertViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

- (void)sender:(id)a3 dismissViewController:(id)a4
{
  -[CNContactPhotoCarouselRemoteAlertViewController sender:dismissViewController:completionHandler:](self, "sender:dismissViewController:completionHandler:", a3, a4, 0);
}

- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v6;
  _QWORD v7[5];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000557C;
  v7[3] = &unk_1000081E8;
  v7[4] = self;
  v8 = a5;
  v6 = v8;
  objc_msgSend(a4, "dismissViewControllerAnimated:completion:", 1, v7);

}

- (BOOL)isPresentingModalViewController
{
  return 1;
}

- (void)avatarPosterEditorFromFlowManager:(id)a3 didUpdateContact:(id)a4 withVisualIdentity:(id)a5
{
  id v6;
  unsigned int v7;
  void *v8;
  id v9;
  NSObject *v10;
  BSAction *action;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;

  v6 = a4;
  v7 = -[BSAction canSendResponse](self->_action, "canSendResponse");
  if (v6 && v7)
  {
    v15 = 0;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v15));
    v9 = v15;
    if (v8)
    {
      v10 = objc_alloc_init((Class)BSMutableSettings);
      -[NSObject setObject:forSetting:](v10, "setObject:forSetting:", v8, 0);
      action = self->_action;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[BSActionResponse responseWithInfo:](BSActionResponse, "responseWithInfo:", v10));
      -[BSAction sendResponse:](action, "sendResponse:", v12);

    }
    else
    {
      v13 = CNUILogRemoteAlert();
      v10 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedDescription"));
        *(_DWORD *)buf = 138412290;
        v17 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Could not encode response contact: %@", buf, 0xCu);

      }
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_requestContact, 0);
  objc_storeStrong((id *)&self->_flowManager, 0);
}

@end
