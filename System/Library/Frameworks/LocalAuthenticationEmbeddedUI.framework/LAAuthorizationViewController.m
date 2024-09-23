@implementation LAAuthorizationViewController

- (LAAuthorizationViewController)initWithConfiguration:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  LAAuthorizationViewController *v9;
  LAAuthorizationViewController *v10;
  uint64_t v11;
  id completion;
  void *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)LAAuthorizationViewController;
  v9 = -[LAAuthorizationViewController initWithNibName:bundle:](&v15, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_configuration, a3);
    v11 = MEMORY[0x2348AF9C0](v8);
    completion = v10->_completion;
    v10->_completion = (id)v11;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v10, sel__applicationDidEnterBackground_, *MEMORY[0x24BEBDF98], 0);

  }
  return v10;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  void *v7;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)LAAuthorizationViewController;
  -[LAAuthorizationViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4);
  -[LAAuthorizationViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, width, height);

}

- (int64_t)modalPresentationStyle
{
  if (-[LACUIAuthenticatorServiceConfiguration style](self->_configuration, "style"))
    return 0;
  else
    return 6;
}

- (int64_t)modalTransitionStyle
{
  return 2 * (-[LACUIAuthenticatorServiceConfiguration style](self->_configuration, "style") == 0);
}

- (int64_t)preferredStatusBarStyle
{
  int64_t v2;
  void *v3;

  if (-[LACUIAuthenticatorServiceConfiguration style](self->_configuration, "style"))
    return 0;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "userInterfaceIdiom") != 1;

  return v2;
}

- (void)loadView
{
  void *v3;

  v3 = (void *)objc_opt_new();
  -[LAAuthorizationViewController setView:](self, "setView:", v3);

  -[LAAuthorizationViewController _prepareRemoteView]((id *)&self->super.super.super.isa);
}

- (void)_prepareRemoteView
{
  id WeakRetained;
  _QWORD v3[4];
  id v4;
  id location;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 121);

    if (!WeakRetained)
    {
      objc_initWeak(&location, a1);
      v3[0] = MEMORY[0x24BDAC760];
      v3[1] = 3221225472;
      v3[2] = __51__LAAuthorizationViewController__prepareRemoteView__block_invoke;
      v3[3] = &unk_24FDCD9D0;
      objc_copyWeak(&v4, &location);
      +[_AuthorizationRemoteViewControllerHost requestViewControllerWithConnectionHandler:](_AuthorizationRemoteViewControllerHost, "requestViewControllerWithConnectionHandler:", v3);
      objc_destroyWeak(&v4);
      objc_destroyWeak(&location);
    }
  }
}

void __51__LAAuthorizationViewController__prepareRemoteView__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *WeakRetained;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      LA_LOG_0();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = LALogTypeForInternalError();
      if (os_log_type_enabled(v8, v9))
      {
        v15 = 138412290;
        v16 = v6;
        _os_log_impl(&dword_22FE91000, v8, v9, "Could not obtain remote VC %@", (uint8_t *)&v15, 0xCu);
      }

      v10 = (uint64_t)WeakRetained;
      v11 = v6;
LABEL_11:
      -[LAAuthorizationViewController _finishWithError:](v10, v11);
      goto LABEL_12;
    }
    if ((objc_msgSend(v5, "conformsToProtocol:", &unk_255E609D0) & 1) == 0)
    {
      LA_LOG_0();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = LALogTypeForInternalError();
      if (os_log_type_enabled(v13, v14))
      {
        v15 = 138412290;
        v16 = v5;
        _os_log_impl(&dword_22FE91000, v13, v14, "Received remote VC has unexpected type %@", (uint8_t *)&v15, 0xCu);
      }

      v10 = (uint64_t)WeakRetained;
      v11 = 0;
      goto LABEL_11;
    }
    objc_storeWeak(WeakRetained + 121, v5);
    v12 = objc_loadWeakRetained(WeakRetained + 121);
    objc_msgSend(v12, "setDelegate:", WeakRetained);

    -[LAAuthorizationViewController _presentRemoteView]((uint64_t)WeakRetained);
  }
LABEL_12:

}

- (void)_finishWithError:(uint64_t)a1
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  id v6;

  v6 = a2;
  if (a1)
  {
    v3 = *(void **)(a1 + 976);
    if (v3)
    {
      v4 = (void (**)(_QWORD, _QWORD))objc_msgSend(v3, "copy");
      v5 = *(void **)(a1 + 976);
      *(_QWORD *)(a1 + 976) = 0;

      objc_msgSend((id)a1, "dismissViewControllerAnimated:completion:", objc_msgSend(*(id *)(a1 + 984), "style") == 1, &__block_literal_global_62);
      ((void (**)(_QWORD, id))v4)[2](v4, v6);

    }
  }

}

- (void)_presentRemoteView
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  id *v43;
  _QWORD v44[4];
  id v45;
  _QWORD block[4];
  id v47;
  id buf[2];

  if (a1)
  {
    if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
    {
      objc_initWeak(buf, (id)a1);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __51__LAAuthorizationViewController__presentRemoteView__block_invoke;
      block[3] = &unk_24FDCD9F8;
      v43 = &v47;
      objc_copyWeak(&v47, buf);
      dispatch_async(MEMORY[0x24BDAC9B8], block);
LABEL_9:
      objc_destroyWeak(v43);
      objc_destroyWeak(buf);
      return;
    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 968));
    if (WeakRetained)
    {
      v3 = WeakRetained;
      objc_msgSend((id)a1, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "subviews");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_loadWeakRetained((id *)(a1 + 968));
      objc_msgSend(v6, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v5, "containsObject:", v7);

      if ((v8 & 1) == 0)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.LocalAuthentication.ui.presented"), 0, 0, 1u);
        LA_LOG_0();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_22FE91000, v10, OS_LOG_TYPE_INFO, "Presenting remote UI", (uint8_t *)buf, 2u);
        }

        objc_msgSend((id)a1, "view");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_loadWeakRetained((id *)(a1 + 968));
        objc_msgSend(v12, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addSubview:", v13);

        v14 = objc_loadWeakRetained((id *)(a1 + 968));
        objc_msgSend(v14, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

        v16 = objc_loadWeakRetained((id *)(a1 + 968));
        objc_msgSend(v16, "view");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "topAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1, "view");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "topAnchor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "constraintEqualToAnchor:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setActive:", 1);

        v22 = objc_loadWeakRetained((id *)(a1 + 968));
        objc_msgSend(v22, "view");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "bottomAnchor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1, "view");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "bottomAnchor");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "constraintEqualToAnchor:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setActive:", 1);

        v28 = objc_loadWeakRetained((id *)(a1 + 968));
        objc_msgSend(v28, "view");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "leadingAnchor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1, "view");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "leadingAnchor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "constraintEqualToAnchor:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setActive:", 1);

        v34 = objc_loadWeakRetained((id *)(a1 + 968));
        objc_msgSend(v34, "view");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "trailingAnchor");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1, "view");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "trailingAnchor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "constraintEqualToAnchor:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setActive:", 1);

        v40 = objc_loadWeakRetained((id *)(a1 + 968));
        objc_msgSend((id)a1, "addChildViewController:", v40);

        objc_initWeak(buf, (id)a1);
        v41 = objc_loadWeakRetained((id *)(a1 + 968));
        v42 = *(_QWORD *)(a1 + 984);
        v44[0] = MEMORY[0x24BDAC760];
        v44[1] = 3221225472;
        v44[2] = __51__LAAuthorizationViewController__presentRemoteView__block_invoke_58;
        v44[3] = &unk_24FDCD7C8;
        v43 = &v45;
        objc_copyWeak(&v45, buf);
        objc_msgSend(v41, "startWithConfiguration:reply:", v42, v44);

        goto LABEL_9;
      }
    }
  }
}

void __51__LAAuthorizationViewController__presentRemoteView__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[LAAuthorizationViewController _presentRemoteView]();
    WeakRetained = v2;
  }

}

void __51__LAAuthorizationViewController__presentRemoteView__block_invoke_58(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (v3 && WeakRetained)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __51__LAAuthorizationViewController__presentRemoteView__block_invoke_2;
    v7[3] = &unk_24FDCD780;
    objc_copyWeak(&v9, v4);
    v8 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v7);

    objc_destroyWeak(&v9);
  }

}

void __51__LAAuthorizationViewController__presentRemoteView__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    LA_LOG_0();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = LALogTypeForInternalError();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_22FE91000, v3, v4, "Failed to start with error (%@).", (uint8_t *)&v6, 0xCu);
    }

    -[LAAuthorizationViewController _finishWithError:]((uint64_t)WeakRetained, *(void **)(a1 + 32));
  }

}

- (void)dismiss
{
  id WeakRetained;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location[2];

  if (-[LAAuthorizationViewController active](self, "active"))
  {
    objc_initWeak(location, self);
    WeakRetained = objc_loadWeakRetained((id *)&self->_remoteVC);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __40__LAAuthorizationViewController_dismiss__block_invoke;
    v5[3] = &unk_24FDCD7C8;
    objc_copyWeak(&v6, location);
    objc_msgSend(WeakRetained, "stopWithReply:", v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(location);
  }
  else
  {
    LA_LOG_0();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_22FE91000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring dismiss request for inactive sheet", (uint8_t *)location, 2u);
    }

  }
}

void __40__LAAuthorizationViewController_dismiss__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v6;
  os_log_type_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.LocalAuthentication.ui.dismissed"), 0, 0, 1u);
  if (v3 && WeakRetained)
  {
    LA_LOG_0();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = LALogTypeForInternalError();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_22FE91000, v6, v7, "Failed to dismiss with error (%@).", (uint8_t *)&v8, 0xCu);
    }

    -[LAAuthorizationViewController _finishWithError:]((uint64_t)WeakRetained, v3);
  }

}

- (BOOL)active
{
  return self->_completion != 0;
}

- (void)presentInContainerViewController:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (-[LAAuthorizationViewController active](self, "active"))
  {
    objc_msgSend(v4, "presentViewController:animated:completion:", self, 1, &__block_literal_global_4);
  }
  else
  {
    LA_LOG_0();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_22FE91000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring presentation request for inactive sheet", v6, 2u);
    }

  }
}

- (id)dismissFromContainerViewController
{
  if (result)
    return (id *)objc_msgSend(result, "dismissViewControllerAnimated:completion:", objc_msgSend(result[123], "style") == 1, &__block_literal_global_62);
  return result;
}

- (void)sheetDidFinishWithError:(id)a3
{
  -[LAAuthorizationViewController _finishWithError:]((uint64_t)self, a3);
}

- (void)didProvideAuthorizationRequirementWithReply:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a3;
  -[LAAuthorizationViewController delegate](self, "delegate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        -[LAAuthorizationViewController delegate](self, "delegate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_opt_respondsToSelector(),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    -[LAAuthorizationViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "authorizationController:didProvideAuthorizationRequirementWithReply:", self, v9);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDDA9C8], "internalErrorWithMessage:", CFSTR("Password validation not available"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v8);
  }

}

- (void)_applicationDidEnterBackground:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDDA9C8], "errorWithCode:", -4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[LAAuthorizationViewController _finishWithError:]((uint64_t)self, v4);

}

- (LAAuthorizationViewControllerDelegate)delegate
{
  return (LAAuthorizationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_destroyWeak((id *)&self->_remoteVC);
}

@end
