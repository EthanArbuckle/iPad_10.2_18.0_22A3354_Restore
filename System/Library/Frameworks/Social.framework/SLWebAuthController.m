@implementation SLWebAuthController

- (SLWebAuthController)initWithAccountDescription:(id)a3 presentationBlock:(id)a4
{
  id v6;
  id v7;
  SLWebAuthController *v8;
  SLWebAuthController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SLWebAuthController;
  v8 = -[SLWebAuthController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
    -[SLWebAuthController _commonInitializationWithAccount:accountStore:username:accountDescription:youTube:presentationBlock:](v8, "_commonInitializationWithAccount:accountStore:username:accountDescription:youTube:presentationBlock:", 0, 0, 0, v6, 0, v7);

  return v9;
}

- (SLWebAuthController)initWithAccount:(id)a3 accountStore:(id)a4 presentationBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  SLWebAuthController *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SLWebAuthController;
  v11 = -[SLWebAuthController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  if (v11)
  {
    objc_msgSend(v8, "accountDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLWebAuthController _commonInitializationWithAccount:accountStore:username:accountDescription:youTube:presentationBlock:](v11, "_commonInitializationWithAccount:accountStore:username:accountDescription:youTube:presentationBlock:", v8, v9, 0, v12, 0, v10);

  }
  return v11;
}

- (SLWebAuthController)initWithNibName:(id)a3 bundle:(id)a4
{
  SLWebAuthController *v4;
  SLWebAuthController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SLWebAuthController;
  v4 = -[SLWebAuthController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[SLWebAuthController _commonInitializationWithAccount:accountStore:username:accountDescription:youTube:presentationBlock:](v4, "_commonInitializationWithAccount:accountStore:username:accountDescription:youTube:presentationBlock:", 0, 0, 0, 0, 0, 0);
  return v5;
}

- (SLWebAuthController)init
{
  -[SLWebAuthController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SLWebAuthController;
  return -[SLWebAuthController initWithNibName:bundle:](&v3, sel_initWithNibName_bundle_, 0, 0);
}

- (id)_extensionItemForAccount:(id)a3 accountDescription:(id)a4 username:(id)a5 youTube:(BOOL)a6
{
  uint64_t v6;
  _BOOL4 v7;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v20;
  id v21;

  v7 = a6;
  v11 = a5;
  v12 = a4;
  _SLLog(v6, 5, CFSTR("SLWebAuthController initializing for description %@ username %@"));
  v13 = objc_alloc_init(MEMORY[0x1E0CB35E8]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", v12, CFSTR("description"), v12, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, CFSTR("username"));
  if (v7)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("YES"), CFSTR("youTube"));
  v15 = (void *)MEMORY[0x1E0CB36F8];
  -[SLWebAuthController _webClient](self, "_webClient");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v15, "archivedDataWithRootObject:requiringSecureCoding:error:", v16, 1, &v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v21;
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("webClient"));

  if (v18)
  {
    v20 = v18;
    _SLLog(v6, 3, CFSTR("Error while archiving we client, error: %@"));
  }
  objc_msgSend(v13, "setUserInfo:", v14, v20);

  return v13;
}

- (void)_commonInitializationWithAccount:(id)a3 accountStore:(id)a4 username:(id)a5 accountDescription:(id)a6 youTube:(BOOL)a7 presentationBlock:(id)a8
{
  uint64_t v8;
  id v15;
  id v16;
  __CFString *v17;
  void *v18;
  id presentationBlock;
  void *v20;
  void *v21;
  NSExtension *v22;
  NSExtension *extension;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSExtension *v28;
  void *v29;
  NSExtension *v30;
  id v31;
  id v32;
  _BOOL4 v33;
  id v34;
  _QWORD v35[5];
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  id location;
  id v41;
  _QWORD v42[3];

  v33 = a7;
  v42[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v31 = a4;
  v16 = a5;
  v17 = (__CFString *)a6;
  v34 = a8;
  objc_storeStrong((id *)&self->_account, a3);
  objc_storeStrong((id *)&self->_accountStore, a4);
  v18 = (void *)MEMORY[0x1C3B6C8B8](v34);
  presentationBlock = self->_presentationBlock;
  self->_presentationBlock = v18;

  if (!self->_presentationBlock)
    _SLLog(v8, 3, CFSTR("SLWebAuthController Client did not pass a presentationBlock to the init method. Your presentation animation will probably look horrible. Please pass a presentationBlock."));
  -[SLWebAuthController setModalPresentationStyle:](self, "setModalPresentationStyle:", 0);
  v20 = (void *)MEMORY[0x1E0CB35D8];
  -[SLWebAuthController _extentionIdentifier](self, "_extentionIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v20, "extensionWithIdentifier:error:", v21, &v41);
  v22 = (NSExtension *)objc_claimAutoreleasedReturnValue();
  v32 = v41;
  extension = self->_extension;
  self->_extension = v22;

  v30 = self->_extension;
  _SLLog(v8, 7, CFSTR("SLWebAuthController got extension %@"));
  objc_initWeak(&location, self);
  v24 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __123__SLWebAuthController__commonInitializationWithAccount_accountStore_username_accountDescription_youTube_presentationBlock___block_invoke;
  v38[3] = &unk_1E75906A0;
  objc_copyWeak(&v39, &location);
  -[NSExtension setRequestCancellationBlock:](self->_extension, "setRequestCancellationBlock:", v38, v30);
  v36[0] = v24;
  v36[1] = 3221225472;
  v36[2] = __123__SLWebAuthController__commonInitializationWithAccount_accountStore_username_accountDescription_youTube_presentationBlock___block_invoke_3;
  v36[3] = &unk_1E75906F0;
  objc_copyWeak(&v37, &location);
  -[NSExtension set_requestPostCompletionBlockWithItems:](self->_extension, "set_requestPostCompletionBlockWithItems:", v36);
  if (v15)
  {
    objc_msgSend(v15, "username");
    v25 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "accountDescription");
    v26 = objc_claimAutoreleasedReturnValue();

    v17 = (__CFString *)v26;
    v16 = (id)v25;
  }
  if (!v17)
    v17 = &stru_1E7592238;
  -[SLWebAuthController _extensionItemForAccount:accountDescription:username:youTube:](self, "_extensionItemForAccount:accountDescription:username:youTube:", v15, v17, v16, v33);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = self->_extension;
  v42[0] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v24;
  v35[1] = 3221225472;
  v35[2] = __123__SLWebAuthController__commonInitializationWithAccount_accountStore_username_accountDescription_youTube_presentationBlock___block_invoke_5;
  v35[3] = &unk_1E7590718;
  v35[4] = self;
  -[NSExtension instantiateViewControllerWithInputItems:listenerEndpoint:connectionHandler:](v28, "instantiateViewControllerWithInputItems:listenerEndpoint:connectionHandler:", v29, 0, v35);

  objc_destroyWeak(&v37);
  objc_destroyWeak(&v39);
  objc_destroyWeak(&location);

}

void __123__SLWebAuthController__commonInitializationWithAccount_accountStore_username_accountDescription_youTube_presentationBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __123__SLWebAuthController__commonInitializationWithAccount_accountStore_username_accountDescription_youTube_presentationBlock___block_invoke_2;
  block[3] = &unk_1E7590678;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __123__SLWebAuthController__commonInitializationWithAccount_accountStore_username_accountDescription_youTube_presentationBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    _SLLog(v1, 7, CFSTR("SLWebAuthController extension requestCancellationBlock requestIdentifier %@ error %{public}@"));
    objc_msgSend(WeakRetained, "_extensionRequestDidCancelWithError:", *(_QWORD *)(a1 + 40), v3, v4);
  }

}

void __123__SLWebAuthController__commonInitializationWithAccount_accountStore_username_accountDescription_youTube_presentationBlock___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __123__SLWebAuthController__commonInitializationWithAccount_accountStore_username_accountDescription_youTube_presentationBlock___block_invoke_4;
  v13[3] = &unk_1E75906C8;
  objc_copyWeak(&v17, (id *)(a1 + 32));
  v14 = v7;
  v15 = v8;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  v12 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v13);

  objc_destroyWeak(&v17);
}

void __123__SLWebAuthController__commonInitializationWithAccount_accountStore_username_accountDescription_youTube_presentationBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    _SLLog(v1, 7, CFSTR("SLWebAuthController extension _requestPostCompletionBlockWithItems requestIdentifier %@ items %@"));
    objc_msgSend(WeakRetained, "_extensionRequestDidCompleteWithTokens:extensionCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v3, v4);
  }

}

void __123__SLWebAuthController__commonInitializationWithAccount_accountStore_username_accountDescription_youTube_presentationBlock___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  v10 = a3;
  _SLLog(v4, 5, CFSTR("SLWebAuthController finished instantiate remote view controller %@ error %{public}@ extension request identifier %@"));
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 992);
  *(_QWORD *)(v8 + 992) = v10;
  v11 = v10;

  objc_msgSend(*(id *)(a1 + 32), "_didInstantiateRemoteViewController", v10, a4, a2);
}

- (void)_didInstantiateRemoteViewController
{
  UIViewController *serviceViewController;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**presentationBlock)(id, SLWebAuthController *);
  id v20;
  _QWORD v21[4];
  id v22;
  id location;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __58__SLWebAuthController__didInstantiateRemoteViewController__block_invoke;
    v21[3] = &unk_1E7590740;
    objc_copyWeak(&v22, &location);
    -[UIViewController setViewServiceTerminationBlock:](self->_serviceViewController, "setViewServiceTerminationBlock:", v21);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  serviceViewController = self->_serviceViewController;
  if (serviceViewController && !self->_extensionCancellationError)
  {
    -[UIViewController willMoveToParentViewController:](serviceViewController, "willMoveToParentViewController:", self);
    -[SLWebAuthController addChildViewController:](self, "addChildViewController:", self->_serviceViewController);
    -[SLWebAuthController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self->_serviceViewController, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", v5);

    -[SLWebAuthController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIViewController view](self->_serviceViewController, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bringSubviewToFront:", v7);

    -[UIViewController didMoveToParentViewController:](self->_serviceViewController, "didMoveToParentViewController:", self);
    -[UIViewController view](self->_serviceViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = (void *)MEMORY[0x1E0CB3718];
    v26 = CFSTR("serviceView");
    -[UIViewController view](self->_serviceViewController, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[serviceView]|"), 0, 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v13);

    v14 = (void *)MEMORY[0x1E0CB3718];
    v24 = CFSTR("serviceView");
    -[UIViewController view](self->_serviceViewController, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[serviceView]|"), 0, 0, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v17);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v9);
    -[SLWebAuthController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setNeedsLayout");

    presentationBlock = (void (**)(id, SLWebAuthController *))self->_presentationBlock;
    if (presentationBlock)
      presentationBlock[2](presentationBlock, self);

  }
  v20 = self->_presentationBlock;
  self->_presentationBlock = 0;

}

void __58__SLWebAuthController__didInstantiateRemoteViewController__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _BYTE *WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !WeakRetained[1016])
  {
    v3 = WeakRetained;
    _SLLog(v1, 3, CFSTR("SLWebAuthController observed unexpected extension termination. Probably a crash."));
    objc_msgSend(v3, "_extensionRequestDidCompleteWithTokens:extensionCompletion:", 0, 0);
    WeakRetained = v3;
  }

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SLWebAuthController;
  -[SLWebAuthController loadView](&v6, sel_loadView);
  -[SLWebAuthController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setOpaque:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLWebAuthController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)_extensionRequestDidCancelWithError:(id)a3
{
  objc_storeStrong((id *)&self->_extensionCancellationError, a3);
}

- (void)_extensionRequestDidCompleteWithTokens:(id)a3 extensionCompletion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD block[4];
  id v14;
  SLWebAuthController *v15;
  id v16;
  _QWORD v17[5];
  id v18;

  v6 = a4;
  v7 = v6;
  self->_extensionRequestDidComplete = 1;
  if (a3)
  {
    objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attachments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_get_global_queue(25, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__SLWebAuthController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_2;
    block[3] = &unk_1E75903E0;
    v14 = v10;
    v15 = self;
    v16 = v7;
    v12 = v10;
    dispatch_async(v11, block);

  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __82__SLWebAuthController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke;
    v17[3] = &unk_1E7590480;
    v17[4] = self;
    v18 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v17);

  }
}

void __82__SLWebAuthController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 1008);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 1008);
  v8 = v3;
  if (v4)
  {
    objc_msgSend(v4, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB32E8]) & 1) != 0)
    {
      v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "code");

      v3 = v8;
      if (v6 == -1009)
      {
        _SLLog(v1, 3, CFSTR("SLWebAuthController will dismiss because not connected to internet."));
        objc_msgSend(*(id *)(a1 + 32), "_presentInternetOfflineError");

LABEL_9:
        v8 = 0;
        goto LABEL_10;
      }
    }
    else
    {

      v3 = v8;
    }
  }
  if (!v3)
  {
    _SLLog(v1, 5, CFSTR("SLWebAuthController will dismiss because of user cancel."));
    goto LABEL_9;
  }
  v7 = v3;
  _SLLog(v1, 3, CFSTR("SLWebAuthController will dismiss because of error %{public}@"));
LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "_dismissAndCompleteWithIdentity:error:extensionCompletion:", 0, v8, *(_QWORD *)(a1 + 40), v7);

}

void __82__SLWebAuthController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_2(uint64_t a1)
{
  dispatch_semaphore_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  _QWORD block[4];
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t *v37;
  _QWORD *v38;
  _QWORD v39[4];
  NSObject *v40;
  _QWORD *v41;
  uint64_t *v42;
  _QWORD v43[5];
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _QWORD v51[4];
  NSObject *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;

  v2 = dispatch_semaphore_create(0);
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = __Block_byref_object_copy_;
  v58 = __Block_byref_object_dispose_;
  v59 = 0;
  v3 = *(void **)(a1 + 32);
  v4 = MEMORY[0x1E0C809B0];
  v5 = *MEMORY[0x1E0CA5B20];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __82__SLWebAuthController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_54;
  v51[3] = &unk_1E7590768;
  v53 = &v54;
  v6 = v2;
  v52 = v6;
  objc_msgSend(v3, "loadItemForTypeIdentifier:options:completionHandler:", v5, 0, v51);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy_;
  v49 = __Block_byref_object_dispose_;
  objc_msgSend((id)v55[5], "objectForKeyedSubscript:", CFSTR("token"));
  v50 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v55[5], "objectForKeyedSubscript:", CFSTR("refreshToken"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v55[5], "objectForKeyedSubscript:", CFSTR("usernames"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v55[5], "objectForKeyedSubscript:", CFSTR("displayName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = __Block_byref_object_copy_;
  v43[4] = __Block_byref_object_dispose_;
  v44 = 0;
  v10 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v10 + 968))
  {
    if (v46[5])
    {
      if (v7)
      {
        objc_msgSend(v8, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = *(_QWORD *)(a1 + 40);
        if (v11)
        {
          objc_msgSend(*(id *)(v10 + 968), "username");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "compare:options:", v13, 1);

          v10 = *(_QWORD *)(a1 + 40);
          if (v14)
          {
            objc_msgSend(*(id *)(v10 + 968), "username");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "firstObject");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            _SLLog(v30, 3, CFSTR("SLWebAuthController got mismatch between _account.username %@ and attempted username %@"));

            objc_msgSend(*(id *)(a1 + 40), "_presentUsernameMismatchAlert", v15, v29);
            v16 = (void *)v46[5];
            v46[5] = 0;

            v10 = *(_QWORD *)(a1 + 40);
          }
        }
      }
    }
  }
  if (*(_QWORD *)(v10 + 968))
  {
    if (v46[5])
    {
      if (v7)
      {
        objc_msgSend(v8, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v18 = objc_alloc(MEMORY[0x1E0C8F2B0]);
          v19 = (void *)objc_msgSend(v18, "initWithOAuth2Token:refreshToken:expiryDate:", v46[5], v7, 0);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 968), "setCredential:", v19);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 968), "setSupportsAuthentication:", 1);
          _SLLog(v30, 5, CFSTR("SLWebAuthController will save account with new credential"));
          v20 = *(_QWORD *)(a1 + 40);
          v21 = *(void **)(v20 + 976);
          v22 = *(_QWORD *)(v20 + 968);
          v39[0] = v4;
          v39[1] = 3221225472;
          v39[2] = __82__SLWebAuthController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_2_76;
          v39[3] = &unk_1E7590790;
          v41 = v43;
          v42 = &v45;
          v23 = v6;
          v40 = v23;
          objc_msgSend(v21, "saveAccount:withCompletionHandler:", v22, v39);
          dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);

        }
      }
    }
  }
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __82__SLWebAuthController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_3;
  block[3] = &unk_1E75907B8;
  v32 = v8;
  v33 = v9;
  v24 = *(_QWORD *)(a1 + 40);
  v25 = *(void **)(a1 + 48);
  v34 = v7;
  v35 = v24;
  v37 = &v45;
  v38 = v43;
  v36 = v25;
  v26 = v7;
  v27 = v9;
  v28 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v43, 8);
  _Block_object_dispose(&v45, 8);

  _Block_object_dispose(&v54, 8);
}

intptr_t __82__SLWebAuthController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_54(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  if (a3)
    v5 = 3;
  else
    v5 = 7;
  v6 = a2;
  _SLLog(v3, v5, CFSTR("SLWebAuthController did loadItemForTypeIdentifier for response, got error %{public}@"));
  v7 = (void *)MEMORY[0x1E0CB3710];
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unarchivedObjectOfClasses:fromData:error:", v11, v6, 0);
  v12 = objc_claimAutoreleasedReturnValue();

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _SLLog(v3, 3, CFSTR("SLWebAuthController loadItemForTypeIdentifier did not return a dictionary"));
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = 0;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __82__SLWebAuthController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_2_76(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v3, 5, CFSTR("SLWebAuthController did save account with success %@ error %{public}@"));

  if ((a2 & 1) == 0)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __82__SLWebAuthController__extensionRequestDidCompleteWithTokens_extensionCompletion___block_invoke_3(uint64_t a1)
{
  void *v2;
  SLWebAuthIdentity *v3;
  void *v4;
  SLWebAuthIdentity *v5;

  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = [SLWebAuthIdentity alloc];
    objc_msgSend(*(id *)(a1 + 32), "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SLWebAuthIdentity initWithUsername:token:displayName:refreshToken:youTubeUsername:idToken:](v3, "initWithUsername:token:displayName:refreshToken:youTubeUsername:idToken:", v4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 0, 0);

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 56), "_dismissAndCompleteWithIdentity:error:extensionCompletion:", v5, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 64));

}

- (void)_dismissAndCompleteWithIdentity:(id)a3 error:(id)a4 extensionCompletion:(id)a5
{
  uint64_t v5;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  SLWebAuthController *v19;
  id v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  _SLLog(v5, 5, CFSTR("SLWebAuthController will dismiss"));
  -[SLWebAuthController presentingViewController](self, "presentingViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81__SLWebAuthController__dismissAndCompleteWithIdentity_error_extensionCompletion___block_invoke;
  v16[3] = &unk_1E75907E0;
  v17 = v10;
  v18 = v9;
  v19 = self;
  v20 = v11;
  v13 = v9;
  v14 = v10;
  v15 = v11;
  objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, v16);

}

void __81__SLWebAuthController__dismissAndCompleteWithIdentity_error_extensionCompletion___block_invoke(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _SLLog(v1, 5, CFSTR("SLWebAuthController did dismiss"));
  v3 = a1[7];
  if (v3)
    (*(void (**)(void))(v3 + 16))();
  if (a1[4])
    v4 = 3;
  else
    v4 = 5;
  _SLLog(v1, v4, CFSTR("SLWebAuthController completing with success %d error %{public}@"));
  v5 = a1[4];
  _ACLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __81__SLWebAuthController__dismissAndCompleteWithIdentity_error_extensionCompletion___block_invoke_cold_1(a1 + 5, a1 + 4, v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = a1[5] != 0;
    *(_DWORD *)buf = 67109120;
    v13 = v8;
    _os_log_impl(&dword_1BCD7C000, v7, OS_LOG_TYPE_DEFAULT, "\"SLWebAuthController completing with success %d\", buf, 8u);
  }

  v9 = *(_QWORD *)(a1[6] + 1024);
  if (v9)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v9, a1[5], a1[4]);
    v10 = a1[6];
    v11 = *(void **)(v10 + 1024);
    *(_QWORD *)(v10 + 1024) = 0;

  }
}

- (void)_presentUsernameMismatchAlert
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFDictionary *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD block[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  CFUserNotificationRef v20;

  v14 = (void *)MEMORY[0x1E0C99E08];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("_EMAIL_MISMATCH_TITLE"), &stru_1E7592238, CFSTR("Localizable"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0C9B800];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("_EMAIL_MISMATCH_MESSAGE"), &stru_1E7592238, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C9B810];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("_EMAIL_MISMATCH_OK"), &stru_1E7592238, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0C9B838];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resourceURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v2, v13, v4, v5, v7, v8, v10, *MEMORY[0x1E0C9B860], 0);
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v20 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 0, 0, v11);
  if (v18[3])
  {
    dispatch_get_global_queue(25, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__SLWebAuthController__presentUsernameMismatchAlert__block_invoke;
    block[3] = &unk_1E7590808;
    block[4] = &v17;
    dispatch_async(v12, block);

  }
  _Block_object_dispose(&v17, 8);

}

void __52__SLWebAuthController__presentUsernameMismatchAlert__block_invoke(uint64_t a1)
{
  CFOptionFlags responseFlags;

  responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 0.0, &responseFlags);
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

- (void)_presentInternetOfflineError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFDictionary *v10;
  NSObject *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  CFUserNotificationRef v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v17[0] = *MEMORY[0x1E0C9B800];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_ERROR_TITLE"), &stru_1E7592238, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0C9B810];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_ERROR_MESSAGE_NO_CONNECTION"), &stru_1E7592238, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v5;
  v17[2] = *MEMORY[0x1E0C9B838];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_ERROR_OK"), &stru_1E7592238, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v7;
  v17[3] = *MEMORY[0x1E0C9B860];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resourceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v16 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 0, 0, v10);
  if (v14[3])
  {
    dispatch_get_global_queue(25, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__SLWebAuthController__presentInternetOfflineError__block_invoke;
    v12[3] = &unk_1E7590808;
    v12[4] = &v13;
    dispatch_async(v11, v12);

  }
  _Block_object_dispose(&v13, 8);

}

void __51__SLWebAuthController__presentInternetOfflineError__block_invoke(uint64_t a1)
{
  CFOptionFlags responseFlags;

  responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 0.0, &responseFlags);
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1024);
}

- (SLWebClient)_webClient
{
  return self->__webClient;
}

- (NSString)_extentionIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1040, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__extentionIdentifier, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_extensionCancellationError, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_serviceViewController, 0);
  objc_storeStrong(&self->_presentationBlock, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

void __81__SLWebAuthController__dismissAndCompleteWithIdentity_error_extensionCompletion___block_invoke_cold_1(_QWORD *a1, uint64_t *a2, os_log_t log)
{
  _BOOL4 v3;
  uint64_t v4;
  _DWORD v5[2];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1 != 0;
  v4 = *a2;
  v5[0] = 67109378;
  v5[1] = v3;
  v6 = 2114;
  v7 = v4;
  _os_log_error_impl(&dword_1BCD7C000, log, OS_LOG_TYPE_ERROR, "\"SLWebAuthController completing with success %d error %{public}@\", (uint8_t *)v5, 0x12u);
}

@end
