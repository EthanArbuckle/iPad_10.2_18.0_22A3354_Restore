@implementation AMSUIWebFlowController

- (AMSUIWebFlowController)initWithRootContainer:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  AMSUIWebFlowController *v8;
  AMSUIWebFlowController *v9;
  NSMutableSet *v10;
  NSMutableSet *timeouts;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)AMSUIWebFlowController;
  v8 = -[AMSUIWebFlowController init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_context, v7);
    objc_storeWeak((id *)&v9->_rootContainer, v6);
    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    timeouts = v9->_timeouts;
    v9->_timeouts = v10;

  }
  return v9;
}

- (AMSUIWebContainerViewController)currentContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[AMSUIWebFlowController rootContainer](self, "rootContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    do
    {
      objc_msgSend(v3, "nextContainer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "nextContainer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v3 = v5;
    }
    while (v6);
  }
  else
  {
    v5 = v3;
  }
  return (AMSUIWebContainerViewController *)v5;
}

- (void)dismissViewController
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[AMSUIWebFlowController currentContainer](self, "currentContainer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE08328], "currentProcess");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.ios.StoreKitUIService"));

  v7 = v3;
  if (v6)
  {
    -[AMSUIWebFlowController currentContainer](self, "currentContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationController");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = v3;
    v7 = v11;

  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __47__AMSUIWebFlowController_dismissViewController__block_invoke;
  v13[3] = &unk_24CB4F0E8;
  v14 = v3;
  v12 = v3;
  objc_msgSend(v7, "ams_dismissViewControllerAnimated:includePresented:completion:", 1, 1, v13);

}

uint64_t __47__AMSUIWebFlowController_dismissViewController__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleModalDismissal");
}

- (void)performSafeTransitionFrom:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__AMSUIWebFlowController_performSafeTransitionFrom_block___block_invoke;
  v9[3] = &unk_24CB4F3C0;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

void __58__AMSUIWebFlowController_performSafeTransitionFrom_block___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "transitionCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInteractive");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "transitionCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __58__AMSUIWebFlowController_performSafeTransitionFrom_block___block_invoke_2;
    v5[3] = &unk_24CB51418;
    v6 = *(id *)(a1 + 40);
    objc_msgSend(v4, "notifyWhenInteractionChangesUsingBlock:", v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __58__AMSUIWebFlowController_performSafeTransitionFrom_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)popViewController
{
  void *v3;
  void *v4;
  unint64_t v5;
  id v6;
  id v7;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[AMSUIWebFlowController currentContainer](self, "currentContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebFlowController navigationControllerForViewController:](self, "navigationControllerForViewController:", v3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 >= 2)
    v6 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);

}

- (void)popViewControllerToRelativeIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  unint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[AMSUIWebFlowController context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "flowController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "pushPresentationDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    do
    {
      objc_msgSend(v7, "pushPresentationDelegate");
      v19 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "pushPresentationDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v19;
      v7 = v19;
    }
    while (v9);
  }
  else
  {
    v10 = v7;
  }
  v20 = v10;
  -[AMSUIWebFlowController navigationControllerForViewController:](self, "navigationControllerForViewController:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewControllers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  while (--v13 >= 0)
  {
    objc_msgSend(v12, "objectAtIndexedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "ams_hasDescendentChildViewController:", v20);

    if (v15)
      goto LABEL_10;
  }
  v13 = 0;
LABEL_10:
  v16 = v13 + a3;
  if (a3 || v16 != objc_msgSend(v12, "count") - 1)
  {
    if ((v16 & 0x8000000000000000) != 0 || v16 >= objc_msgSend(v12, "count"))
    {
      -[AMSUIWebFlowController popViewController](self, "popViewController");
    }
    else
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (id)objc_msgSend(v11, "popToViewController:animated:", v17, 1);

    }
  }

}

- (void)presentWithOptions:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  AMSUIWebPlaceholderViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  AMSUIWebPlaceholderViewController *v20;
  AMSUIWebContainerViewController *v21;
  void *v22;
  void *v23;
  AMSUIWebContainerViewController *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  AMSUIWebContainerViewController *v31;
  id v32;
  AMSUIWebContainerViewController *v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  AMSUIWebFlowController *v38;
  AMSUIWebContainerViewController *v39;
  id v40;
  _QWORD aBlock[4];
  AMSUIWebContainerViewController *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "OSLogObject");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = objc_opt_class();
    -[AMSUIWebFlowController context](self, "context");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v47 = v7;
    v48 = 2114;
    v49 = v9;
    _os_log_impl(&dword_211102000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Presenting new page", buf, 0x16u);

  }
  -[AMSUIWebFlowController currentContainer](self, "currentContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadingPage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "navigationBar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v4, "navigationBar");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  v16 = [AMSUIWebPlaceholderViewController alloc];
  objc_msgSend(v4, "loadingPage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebFlowController context](self, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appearance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[AMSUIWebPlaceholderViewController initWithModel:context:appearance:](v16, "initWithModel:context:appearance:", v17, v18, v19);

  -[AMSUIWebPlaceholderViewController setAnimateFadeIn:](v20, "setAnimateFadeIn:", 1);
  v21 = [AMSUIWebContainerViewController alloc];
  objc_msgSend(v10, "appearance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebFlowController context](self, "context");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[AMSUIWebContainerViewController initWithViewController:appearance:navigationBar:context:](v21, "initWithViewController:appearance:navigationBar:context:", v20, v22, v15, v23);

  objc_msgSend(v4, "pageData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebContainerViewController setPageInfo:](v24, "setPageInfo:", v25);

  -[AMSUIWebContainerViewController appearance](v24, "appearance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "updateBackgroundColorWithJSString:", v27);

  -[AMSUIWebContainerViewController setModalPresentationDelegate:](v24, "setModalPresentationDelegate:", v10);
  -[AMSUIWebContainerViewController setContainerIndex:](v24, "setContainerIndex:", objc_msgSend(v10, "containerIndex") + 1);
  objc_msgSend(v10, "setNextContainer:", v24);
  v28 = 2 * (objc_msgSend(v4, "modalPresentationStyle") != 1);
  v29 = 2 * (objc_msgSend(v4, "modalTransitionStyle") == 1);
  v30 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__AMSUIWebFlowController_presentWithOptions___block_invoke;
  aBlock[3] = &unk_24CB51440;
  v31 = v24;
  v44 = v28;
  v45 = v29;
  v42 = v31;
  v43 = v10;
  v32 = v10;
  v36[0] = v30;
  v36[1] = 3221225472;
  v36[2] = __45__AMSUIWebFlowController_presentWithOptions___block_invoke_2;
  v36[3] = &unk_24CB51490;
  v37 = v4;
  v38 = self;
  v39 = v31;
  v40 = _Block_copy(aBlock);
  v33 = v31;
  v34 = v40;
  v35 = v4;
  -[AMSUIWebFlowController _takeSnapshotFromContainer:completion:](self, "_takeSnapshotFromContainer:completion:", v32, v36);

}

void __45__AMSUIWebFlowController_presentWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7A0]), "initWithRootViewController:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setModalPresentationStyle:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setModalTransitionStyle:", *(_QWORD *)(a1 + 56));
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "presentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", v2);

  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v4, 1, 0);
}

void __45__AMSUIWebFlowController_presentWithOptions___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  if ((objc_msgSend(a1[4], "deferredPresentation") & 1) != 0)
  {
    objc_msgSend(a1[5], "context");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "flowController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "refreshPageForContainer:options:", a1[6], a1[4]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __45__AMSUIWebFlowController_presentWithOptions___block_invoke_3;
    v5[3] = &unk_24CB51468;
    v6 = a1[6];
    v7 = a1[7];
    objc_msgSend(v4, "addFinishBlock:", v5);

  }
  else
  {
    (*((void (**)(void))a1[7] + 2))();
  }
}

uint64_t __45__AMSUIWebFlowController_presentWithOptions___block_invoke_3(uint64_t a1)
{
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(*(id *)(a1 + 32), "setShouldSkipInitialRefresh:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)navigationControllerForViewController:(id)a3
{
  return (id)objc_msgSend(a3, "ams_navigationController");
}

- (void)pushWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  AMSUIWebPlaceholderViewController *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  AMSUIWebPlaceholderViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  AMSUIWebContainerViewController *v26;
  void *v27;
  void *v28;
  AMSUIWebContainerViewController *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  AMSUIWebContainerViewController *v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t);
  void *v40;
  id v41;
  AMSUIWebFlowController *v42;
  id v43;
  AMSUIWebContainerViewController *v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[AMSUIWebFlowController currentContainer](self, "currentContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSUIWebFlowController navigationControllerForViewController:](self, "navigationControllerForViewController:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (AMSUIWebPlaceholderViewController *)v7;
  if (v6)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v8 = (AMSUIWebPlaceholderViewController *)objc_claimAutoreleasedReturnValue();
    }
    -[AMSUIWebPlaceholderViewController OSLogObject](v8, "OSLogObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = objc_opt_class();
      -[AMSUIWebFlowController context](self, "context");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v10;
      v47 = 2114;
      v48 = v12;
      _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Pushing new page", buf, 0x16u);

    }
    -[AMSUIWebFlowController currentContainer](self, "currentContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = [AMSUIWebPlaceholderViewController alloc];
    objc_msgSend(v4, "loadingPage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebFlowController context](self, "context");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appearance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[AMSUIWebPlaceholderViewController initWithModel:context:appearance:](v14, "initWithModel:context:appearance:", v15, v16, v17);

    -[AMSUIWebPlaceholderViewController setAnimateFadeIn:](v8, "setAnimateFadeIn:", 1);
    objc_msgSend(v4, "loadingPage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "navigationBar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v21 = v19;
    }
    else
    {
      objc_msgSend(v4, "navigationBar");
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v22 = v21;

    v26 = [AMSUIWebContainerViewController alloc];
    objc_msgSend(v13, "appearance");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebFlowController context](self, "context");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[AMSUIWebContainerViewController initWithViewController:appearance:navigationBar:context:](v26, "initWithViewController:appearance:navigationBar:context:", v8, v27, v22, v28);

    -[AMSUIWebContainerViewController appearance](v29, "appearance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "backgroundColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "updateBackgroundColorWithJSString:", v31);

    objc_msgSend(v4, "pageData");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebContainerViewController setPageInfo:](v29, "setPageInfo:", v32);

    objc_msgSend(v13, "modalPresentationDelegate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebContainerViewController setModalPresentationDelegate:](v29, "setModalPresentationDelegate:", v33);

    -[AMSUIWebContainerViewController setPushPresentationDelegate:](v29, "setPushPresentationDelegate:", v13);
    -[AMSUIWebContainerViewController setContainerIndex:](v29, "setContainerIndex:", objc_msgSend(v13, "containerIndex") + 1);
    objc_msgSend(v13, "setNextContainer:", v29);
    v37 = MEMORY[0x24BDAC760];
    v38 = 3221225472;
    v39 = __42__AMSUIWebFlowController_pushWithOptions___block_invoke;
    v40 = &unk_24CB4F940;
    v41 = v4;
    v42 = self;
    v43 = v13;
    v44 = v29;
    v34 = v29;
    v35 = v13;
    v36 = _Block_copy(&v37);
    -[AMSUIWebFlowController _takeSnapshotFromContainer:completion:](self, "_takeSnapshotFromContainer:completion:", v35, v36, v37, v38, v39, v40);

  }
  else
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v8 = (AMSUIWebPlaceholderViewController *)objc_claimAutoreleasedReturnValue();
    }
    -[AMSUIWebPlaceholderViewController OSLogObject](v8, "OSLogObject");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = objc_opt_class();
      -[AMSUIWebFlowController context](self, "context");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "logKey");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v46 = v23;
      v47 = 2114;
      v48 = v25;
      _os_log_impl(&dword_211102000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Push failed, no navigation controller found.", buf, 0x16u);

    }
  }

}

void __42__AMSUIWebFlowController_pushWithOptions___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v2 = objc_msgSend(*(id *)(a1 + 32), "deferredPresentation");
  v3 = *(void **)(a1 + 40);
  if ((v2 & 1) != 0)
  {
    objc_msgSend(v3, "context");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "flowController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "refreshPageForContainer:options:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __42__AMSUIWebFlowController_pushWithOptions___block_invoke_2;
    v11[3] = &unk_24CB4FE98;
    v7 = *(id *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(a1 + 48);
    v12 = v7;
    v13 = v8;
    v14 = v9;
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v6, "addFinishBlock:", v11);

  }
  else
  {
    objc_msgSend(v3, "navigationControllerForViewController:", *(_QWORD *)(a1 + 48));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pushViewController:animated:", *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 32), "animated"));

  }
}

void __42__AMSUIWebFlowController_pushWithOptions___block_invoke_2(uint64_t a1)
{
  id v2;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(*(id *)(a1 + 32), "setShouldSkipInitialRefresh:", 1);
  objc_msgSend(*(id *)(a1 + 40), "navigationControllerForViewController:", *(_QWORD *)(a1 + 48));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushViewController:animated:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 56), "animated"));

}

- (id)replaceWithPageModel:(id)a3 forContainer:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v17[5];
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id from;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(v8, "loadPage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v9);
  objc_initWeak(&from, self);
  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __68__AMSUIWebFlowController_replaceWithPageModel_forContainer_options___block_invoke;
  v18[3] = &unk_24CB514E0;
  v18[4] = self;
  v13 = v8;
  v19 = v13;
  v14 = v9;
  v20 = v14;
  objc_copyWeak(&v22, &location);
  objc_copyWeak(&v23, &from);
  v15 = v10;
  v21 = v15;
  objc_msgSend(v11, "addSuccessBlock:", v18);
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __68__AMSUIWebFlowController_replaceWithPageModel_forContainer_options___block_invoke_11;
  v17[3] = &unk_24CB4F560;
  v17[4] = self;
  objc_msgSend(v11, "addErrorBlock:", v17);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v11;
}

void __68__AMSUIWebFlowController_replaceWithPageModel_forContainer_options___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __68__AMSUIWebFlowController_replaceWithPageModel_forContainer_options___block_invoke_2;
  v3[3] = &unk_24CB514E0;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  v5 = *(id *)(a1 + 48);
  objc_copyWeak(&v7, (id *)(a1 + 64));
  objc_copyWeak(&v8, (id *)(a1 + 72));
  v6 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x24BDAC9B8], v3);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);

}

void __68__AMSUIWebFlowController_replaceWithPageModel_forContainer_options___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "windowSize");
  v4 = v3;
  v6 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__AMSUIWebFlowController_replaceWithPageModel_forContainer_options___block_invoke_3;
  v8[3] = &unk_24CB514B8;
  objc_copyWeak(&v11, (id *)(a1 + 64));
  objc_copyWeak(&v12, (id *)(a1 + 72));
  v9 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_setWindowSize:onContainer:completion:", v7, v8, v4, v6);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
}

void __68__AMSUIWebFlowController_replaceWithPageModel_forContainer_options___block_invoke_3(id *a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  char isKindOfClass;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = objc_loadWeakRetained(a1 + 7);
  if (objc_msgSend(a1[4], "reuseExistingPage")
    && (objc_msgSend(WeakRetained, "containedViewController"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) == 0))
  {
    objc_msgSend(WeakRetained, "containedViewController");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1[5], "createViewControllerForContainer:", WeakRetained);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  if (v6)
  {
    objc_msgSend(WeakRetained, "appearance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "backgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateBackgroundColorWithJSString:", v9);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v10 = a1[5];
      objc_msgSend(WeakRetained, "appearance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "willPresentPageModel:appearance:", v10, v11);

    }
    objc_msgSend(WeakRetained, "updateSafeAreaEdgesForPageModel:", a1[5]);
    objc_msgSend(a1[5], "navigationBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "applyNavigationModel:", v12);

    objc_msgSend(WeakRetained, "setupToolbarAnimated:", 0);
    objc_msgSend(WeakRetained, "containedViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 != v7)
    {
      objc_msgSend(WeakRetained, "setDisableReappearPlaceholder:", objc_msgSend(a1[5], "disableReappearPlaceholder"));
      objc_msgSend(WeakRetained, "replaceContentWithViewController:animated:completion:", v7, objc_msgSend(a1[4], "animated"), 0);
      objc_msgSend(a1[5], "impressionEvent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v3, "context");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "metrics");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "impressionEvent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "enqueueEvent:", v17);

      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v18, "OSLogObject");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_opt_class();
      objc_msgSend(v3, "context");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "logKey");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v20;
      v25 = 2114;
      v26 = v22;
      _os_log_impl(&dword_211102000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Unable to present a nil view controller", (uint8_t *)&v23, 0x16u);

    }
  }

}

void __68__AMSUIWebFlowController_replaceWithPageModel_forContainer_options___block_invoke_11(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "OSLogObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_211102000, v3, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Encountered error when loading page.", (uint8_t *)&v7, 0x16u);

  }
}

- (id)refreshPageForContainer:(id)a3 options:(id)a4
{
  return -[AMSUIWebFlowController _refreshPageWithForContainer:options:isRetry:](self, "_refreshPageWithForContainer:options:isRetry:", a3, a4, 0);
}

- (void)startTimeoutInterruption
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[AMSUIWebFlowController timeoutLock](self, "timeoutLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_opt_class();
    -[AMSUIWebFlowController context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v6;
    v22 = 2114;
    v23 = v8;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Starting timeout interruption.", buf, 0x16u);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[AMSUIWebFlowController timeouts](self, "timeouts", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13++), "pause");
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  -[AMSUIWebFlowController timeoutLock](self, "timeoutLock");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "unlock");

}

- (void)startTimeout:(double)a3 queue:(id)a4 block:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, void *);
  void *v24;
  AMSUIWebFlowController *v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = (void *)MEMORY[0x24BE081D8];
  v10 = a4;
  objc_msgSend(v9, "sharedWebUIConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "OSLogObject");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = objc_opt_class();
    -[AMSUIWebFlowController context](self, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v13;
    v29 = 2114;
    v30 = v15;
    _os_log_impl(&dword_211102000, v12, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Starting timeout...", buf, 0x16u);

  }
  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __51__AMSUIWebFlowController_startTimeout_queue_block___block_invoke;
  v24 = &unk_24CB51508;
  v25 = self;
  v26 = v8;
  v16 = v8;
  +[AMSUIWebFlowTimeout timeoutWithTimeout:queue:block:](AMSUIWebFlowTimeout, "timeoutWithTimeout:queue:block:", v10, &v21, a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSUIWebFlowController timeoutLock](self, "timeoutLock", v21, v22, v23, v24, v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lock");

  -[AMSUIWebFlowController timeouts](self, "timeouts");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObject:", v17);

  objc_msgSend(v17, "start");
  -[AMSUIWebFlowController timeoutLock](self, "timeoutLock");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "unlock");

}

uint64_t __51__AMSUIWebFlowController_startTimeout_queue_block___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "timeoutLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  objc_msgSend(*(id *)(a1 + 32), "timeouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v4);

  objc_msgSend(*(id *)(a1 + 32), "timeoutLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)stopTimeoutInterruption
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[AMSUIWebFlowController timeoutLock](self, "timeoutLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "OSLogObject");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_opt_class();
    -[AMSUIWebFlowController context](self, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v6;
    v23 = 2114;
    v24 = v8;
    _os_log_impl(&dword_211102000, v5, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Stopping timeout interruption.", buf, 0x16u);

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[AMSUIWebFlowController timeouts](self, "timeouts", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v14, "reset");
        objc_msgSend(v14, "start");
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  -[AMSUIWebFlowController timeoutLock](self, "timeoutLock");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "unlock");

}

- (id)_refreshPageWithForContainer:(id)a3 options:(id)a4 isRetry:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  AMSUIWebLoadingPageModel *v16;
  AMSUIWebLoadingPageModel *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id from;
  id location;
  _QWORD v53[6];
  _QWORD v54[8];

  v5 = a5;
  v54[6] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v38 = objc_alloc_init(MEMORY[0x24BE08340]);
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSUIWebFlowController setCurrentRefreshToken:](self, "setCurrentRefreshToken:", v37);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v8);
  v47[0] = MEMORY[0x24BDAC760];
  v47[1] = 3221225472;
  v47[2] = __71__AMSUIWebFlowController__refreshPageWithForContainer_options_isRetry___block_invoke;
  v47[3] = &unk_24CB51558;
  objc_copyWeak(&v49, &location);
  objc_copyWeak(&v50, &from);
  v11 = v9;
  v48 = v11;
  objc_msgSend(v38, "addErrorBlock:", v47);
  if ((objc_msgSend(v11, "disableTimeout") & 1) == 0)
  {
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __71__AMSUIWebFlowController__refreshPageWithForContainer_options_isRetry___block_invoke_2_25;
    v45[3] = &unk_24CB4F0E8;
    v46 = v38;
    -[AMSUIWebFlowController startTimeout:queue:block:](self, "startTimeout:queue:block:", MEMORY[0x24BDAC9B8], v45, 10.0);

  }
  if ((objc_msgSend(v11, "deferredPresentation") & 1) == 0)
  {
    objc_msgSend(v8, "containedViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      objc_msgSend(v11, "loadingPage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = v14;
      }
      else
      {
        v17 = [AMSUIWebLoadingPageModel alloc];
        -[AMSUIWebFlowController context](self, "context");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[AMSUIWebLoadingPageModel initWithContext:](v17, "initWithContext:", v18);

      }
      v19 = -[AMSUIWebFlowController replaceWithPageModel:forContainer:options:](self, "replaceWithPageModel:forContainer:options:", v16, v8, 0);

    }
  }
  v53[0] = CFSTR("data");
  objc_msgSend(v11, "pageData");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)v20;
  v22 = MEMORY[0x24BDBD1B8];
  if (v20)
    v22 = v20;
  v54[0] = v22;
  v53[1] = CFSTR("isRetry");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = v23;
  v53[2] = CFSTR("navigationIndex");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "ams_navigationIndex"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v54[2] = v24;
  v53[3] = CFSTR("previousNavigationIndex");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[AMSUIWebFlowController previousNavigationIndex](self, "previousNavigationIndex"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v54[3] = v25;
  v53[4] = CFSTR("pageIndex");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", objc_msgSend(v8, "containerIndex"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v54[4] = v26;
  v53[5] = CFSTR("previousPageIndex");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", -[AMSUIWebFlowController previousPageIndex](self, "previousPageIndex"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v54[5] = v27;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSUIWebFlowController context](self, "context");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "dataProvider");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "loadPageModelWithInfo:", v28);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[AMSUIWebFlowController setPreviousNavigationIndex:](self, "setPreviousNavigationIndex:", objc_msgSend(v8, "ams_navigationIndex"));
  -[AMSUIWebFlowController setPreviousPageIndex:](self, "setPreviousPageIndex:", objc_msgSend(v8, "containerIndex"));
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __71__AMSUIWebFlowController__refreshPageWithForContainer_options_isRetry___block_invoke_3;
  v39[3] = &unk_24CB515A8;
  objc_copyWeak(&v43, &location);
  objc_copyWeak(&v44, &from);
  v32 = v38;
  v40 = v32;
  v33 = v37;
  v41 = v33;
  v34 = v11;
  v42 = v34;
  objc_msgSend(v31, "addFinishBlock:", v39);
  objc_msgSend(v32, "binaryPromiseAdapter");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v44);
  objc_destroyWeak(&v43);

  objc_destroyWeak(&v50);
  objc_destroyWeak(&v49);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v35;
}

void __71__AMSUIWebFlowController__refreshPageWithForContainer_options_isRetry___block_invoke(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __71__AMSUIWebFlowController__refreshPageWithForContainer_options_isRetry___block_invoke_2;
  v5[3] = &unk_24CB514B8;
  objc_copyWeak(&v8, a1 + 5);
  objc_copyWeak(&v9, a1 + 6);
  v6 = a1[4];
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
}

void __71__AMSUIWebFlowController__refreshPageWithForContainer_options_isRetry___block_invoke_2(id *a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  AMSUIWebErrorPageModel *v19;
  id v20;
  void *v21;
  AMSUIWebErrorPageModel *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v4 = objc_loadWeakRetained(a1 + 7);
  if ((objc_msgSend(a1[4], "suppressErrorPage") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "currentContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v8, "OSLogObject");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_opt_class();
        AMSLogKey();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v10;
        v32 = 2114;
        v33 = v11;
        _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping error page since container is currently an error.", buf, 0x16u);

      }
LABEL_7:

      goto LABEL_17;
    }
    objc_msgSend(a1[5], "userInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("skipErrorView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(a1[5], "userInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("skipErrorView"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "BOOLValue");

      if (v16)
      {
        objc_msgSend(MEMORY[0x24BE081D8], "sharedWebUIConfig");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          objc_msgSend(MEMORY[0x24BE081D8], "sharedConfig");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v8, "OSLogObject");
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v17 = objc_opt_class();
          AMSLogKey();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v31 = v17;
          v32 = 2114;
          v33 = v18;
          _os_log_impl(&dword_211102000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping error page.", buf, 0x16u);

        }
        goto LABEL_7;
      }
    }
    else
    {

    }
    v19 = [AMSUIWebErrorPageModel alloc];
    v20 = a1[5];
    objc_msgSend(WeakRetained, "context");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __71__AMSUIWebFlowController__refreshPageWithForContainer_options_isRetry___block_invoke_23;
    v26[3] = &unk_24CB51530;
    objc_copyWeak(&v28, v2);
    objc_copyWeak(&v29, a1 + 7);
    v27 = a1[4];
    v22 = -[AMSUIWebErrorPageModel initWithError:context:actionBlock:](v19, "initWithError:context:actionBlock:", v20, v21, v26);

    objc_msgSend(WeakRetained, "context");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "flowController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (id)objc_msgSend(v24, "replaceWithPageModel:forContainer:options:", v22, v4, 0);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v28);
  }
LABEL_17:

}

void __71__AMSUIWebFlowController__refreshPageWithForContainer_options_isRetry___block_invoke_23(uint64_t a1, char a2)
{
  id v4;
  id v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_loadWeakRetained((id *)(a1 + 48));
  if ((a2 & 1) == 0)
    v5 = (id)objc_msgSend(WeakRetained, "_refreshPageWithForContainer:options:isRetry:", v4, *(_QWORD *)(a1 + 32), 1);

}

void __71__AMSUIWebFlowController__refreshPageWithForContainer_options_isRetry___block_invoke_2_25(uint64_t a1)
{
  id v2;

  if ((objc_msgSend(*(id *)(a1 + 32), "isFinished") & 1) == 0)
  {
    AMSErrorWithFormat();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v2);

  }
}

void __71__AMSUIWebFlowController__refreshPageWithForContainer_options_isRetry___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, uint64_t);
  void *v24;
  id v25;
  id v26;

  v5 = a2;
  v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "context");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "loadPageRenderData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = MEMORY[0x24BDAC760];
  v22 = 3221225472;
  v23 = __71__AMSUIWebFlowController__refreshPageWithForContainer_options_isRetry___block_invoke_4;
  v24 = &unk_24CB51580;
  v12 = v8;
  v25 = v12;
  v13 = v5;
  v26 = v13;
  objc_msgSend(v11, "addFinishBlock:", &v21);
  if ((objc_msgSend(*(id *)(a1 + 32), "isFinished", v21, v22, v23, v24) & 1) == 0)
  {
    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v6);
      goto LABEL_11;
    }
    objc_msgSend(WeakRetained, "currentContainer");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14 == v12)
    {
      v16 = *(void **)(a1 + 40);
      objc_msgSend(WeakRetained, "currentRefreshToken");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v16) = objc_msgSend(v16, "isEqualToString:", v17);

      if ((v16 & 1) != 0)
      {
        objc_msgSend(WeakRetained, "replaceWithPageModel:forContainer:options:", v13, v12, *(_QWORD *)(a1 + 48));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(a1 + 32);
        objc_msgSend(v18, "promiseAdapter");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "finishWithPromise:", v20);

LABEL_10:
        goto LABEL_11;
      }
      v15 = *(void **)(a1 + 32);
    }
    else
    {
      v15 = *(void **)(a1 + 32);
    }
    AMSCustomError();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "finishWithError:", v18);
    goto LABEL_10;
  }
LABEL_11:

}

void __71__AMSUIWebFlowController__refreshPageWithForContainer_options_isRetry___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v5 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(*(id *)(a1 + 32), "pageMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "navigationBar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("pageType"));

  objc_msgSend(*(id *)(a1 + 32), "pageRenderPresenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endWithActivity:pageMetrics:", 0, v7);

  if (!a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "pageRenderPresenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("properties"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "importTimings:", v12);

  }
  objc_msgSend(*(id *)(a1 + 32), "pageRenderPresenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "enqueueEvent");

}

- (void)_setWindowSize:(CGSize)a3 onContainer:(id)a4 completion:(id)a5
{
  (*((void (**)(id, CGSize, __n128))a5 + 2))(a5, a3, *(__n128 *)&a3.height);
}

- (void)_takeSnapshotFromContainer:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  char isKindOfClass;
  void *v10;
  AMSUIWebPlaceholderViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(_QWORD);
  uint64_t *v18;
  id v19;
  id location;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  AMSUIWebPlaceholderViewController *v26;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(v6, "containedViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "containedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cacheScrollViewPositionFor:", v10);

    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__5;
    v25 = __Block_byref_object_dispose__5;
    v11 = [AMSUIWebPlaceholderViewController alloc];
    objc_msgSend(v6, "containedViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUIWebFlowController context](self, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appearance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[AMSUIWebPlaceholderViewController initWithSnapshot:context:appearance:](v11, "initWithSnapshot:context:appearance:", v12, v13, v14);

    objc_initWeak(&location, v6);
    v15 = (void *)v22[5];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __64__AMSUIWebFlowController__takeSnapshotFromContainer_completion___block_invoke;
    v16[3] = &unk_24CB515D0;
    objc_copyWeak(&v19, &location);
    v18 = &v21;
    v17 = v7;
    objc_msgSend(v15, "awaitSnapshotWithCompletion:", v16);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v21, 8);

  }
  else if (v7)
  {
    v7[2](v7);
  }

}

void __64__AMSUIWebFlowController__takeSnapshotFromContainer_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "containedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setOriginalViewController:", v2);

  objc_msgSend(WeakRetained, "replaceContentWithViewController:animated:completion:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 0, *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (AMSUIWebContainerViewController)rootContainer
{
  return (AMSUIWebContainerViewController *)objc_loadWeakRetained((id *)&self->_rootContainer);
}

- (AMSUIWebClientContext)context
{
  return (AMSUIWebClientContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (NSString)currentRefreshToken
{
  return self->_currentRefreshToken;
}

- (void)setCurrentRefreshToken:(id)a3
{
  objc_storeStrong((id *)&self->_currentRefreshToken, a3);
}

- (NSLock)timeoutLock
{
  return self->_timeoutLock;
}

- (void)setTimeoutLock:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutLock, a3);
}

- (NSMutableSet)timeouts
{
  return self->_timeouts;
}

- (void)setTimeouts:(id)a3
{
  objc_storeStrong((id *)&self->_timeouts, a3);
}

- (unint64_t)previousNavigationIndex
{
  return self->_previousNavigationIndex;
}

- (void)setPreviousNavigationIndex:(unint64_t)a3
{
  self->_previousNavigationIndex = a3;
}

- (int64_t)previousPageIndex
{
  return self->_previousPageIndex;
}

- (void)setPreviousPageIndex:(int64_t)a3
{
  self->_previousPageIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeouts, 0);
  objc_storeStrong((id *)&self->_timeoutLock, 0);
  objc_storeStrong((id *)&self->_currentRefreshToken, 0);
  objc_destroyWeak((id *)&self->_context);
  objc_destroyWeak((id *)&self->_rootContainer);
}

@end
