@implementation UIDocumentBrowserTransitionController

- (UIDocumentBrowserTransitionController)init
{

  return 0;
}

- (UIDocumentBrowserTransitionController)initWithItemURL:(id)a3 documentBrowserProxy:(id)a4 referenceView:(id)a5
{
  id v9;
  id v10;
  id v11;
  UIDocumentBrowserTransitionController *v12;
  UIDocumentBrowserTransitionController *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9
    && (v15.receiver = self,
        v15.super_class = (Class)UIDocumentBrowserTransitionController,
        v12 = -[UIDocumentBrowserTransitionController init](&v15, sel_init),
        (self = v12) != 0))
  {
    objc_storeStrong((id *)&v12->_itemURL, a3);
    objc_storeStrong((id *)&self->_serviceDocumentBrowserProxy, a4);
    objc_storeStrong((id *)&self->_referenceView, a5);
    -[UIDocumentBrowserTransitionController doc_commonInit](self, "doc_commonInit");
    self = self;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)isCoordinatingForURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a3;
  if ((-[NSURL isEqual:](self->_itemURL, "isEqual:", v4) & 1) != 0
    || (-[NSURL standardizedURL](self->_itemURL, "standardizedURL"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "standardizedURL"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "isEqual:", v6),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    v8 = 1;
  }
  else
  {
    -[NSURL URLByStandardizingPath](self->_itemURL, "URLByStandardizingPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByStandardizingPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "isEqual:", v10);

  }
  return v8;
}

- (void)doc_commonInit
{
  OUTLINED_FUNCTION_0_1(&dword_209052000, a2, a3, "Retrieving transition controller from itemURL: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __55__UIDocumentBrowserTransitionController_doc_commonInit__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject **v3;
  NSObject *v4;

  v2 = a2;
  if (v2)
  {
    v3 = (NSObject **)MEMORY[0x24BE2DF90];
    v4 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v4 = *v3;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __55__UIDocumentBrowserTransitionController_doc_commonInit__block_invoke_cold_1((uint64_t)v2, v4);
  }

}

void __55__UIDocumentBrowserTransitionController_doc_commonInit__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject **v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a2;
  v4 = (NSObject **)MEMORY[0x24BE2DF90];
  v5 = *MEMORY[0x24BE2DF90];
  if (!*MEMORY[0x24BE2DF90])
  {
    DOCInitLogging();
    v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __55__UIDocumentBrowserTransitionController_doc_commonInit__block_invoke_2_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  objc_msgSend(*(id *)(a1 + 32), "setTransitionController:", v3);
  objc_msgSend(*(id *)(a1 + 32), "transitionControllerQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSuspended:", 0);

  if (*(_BYTE *)(a1 + 40))
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "stopAccessingSecurityScopedResource");

}

void __55__UIDocumentBrowserTransitionController_doc_commonInit__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject **v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a2;
  v4 = (NSObject **)MEMORY[0x24BE2DF90];
  v5 = *MEMORY[0x24BE2DF90];
  if (!*MEMORY[0x24BE2DF90])
  {
    DOCInitLogging();
    v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __55__UIDocumentBrowserTransitionController_doc_commonInit__block_invoke_2_cold_1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  objc_msgSend(*(id *)(a1 + 32), "setTransitionController:", v3);
  objc_msgSend(*(id *)(a1 + 32), "transitionControllerQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSuspended:", 0);

}

- (void)setLoadingProgress:(NSProgress *)loadingProgress
{
  NSProgress *v5;
  id *p_loadingProgress;
  UIDocumentBrowserTransitionController *v7;
  NSObject **v8;
  NSObject *v9;
  id v10;
  NSOperationQueue *transitionControllerQueue;
  UIDocumentBrowserTransitionController *v12;
  NSObject **v13;
  NSObject *v14;
  id v15;
  _QWORD v16[5];
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = loadingProgress;
  p_loadingProgress = (id *)&self->_loadingProgress;
  if (self->_loadingProgress != v5)
  {
    v7 = self;
    objc_sync_enter(v7);
    if (v7->_shouldStopObservingProgress && *p_loadingProgress)
    {
      v8 = (NSObject **)MEMORY[0x24BE2DFF0];
      v9 = *MEMORY[0x24BE2DFF0];
      if (!*MEMORY[0x24BE2DFF0])
      {
        DOCInitLogging();
        v9 = *v8;
      }
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *p_loadingProgress;
        *(_DWORD *)buf = 138543362;
        v18 = v10;
        _os_log_impl(&dword_209052000, v9, OS_LOG_TYPE_DEFAULT, "Progress: [Transition Controller] REMOVE fractionCompleted observer for: %{public}@", buf, 0xCu);
      }
      objc_msgSend(*p_loadingProgress, "removeObserver:forKeyPath:", v7, CFSTR("fractionCompleted"));
      objc_msgSend(*p_loadingProgress, "removeObserver:forKeyPath:", v7, CFSTR("isIndeterminate"));
      v7->_shouldStopObservingProgress = 0;
    }
    objc_sync_exit(v7);

    objc_storeStrong(p_loadingProgress, loadingProgress);
    transitionControllerQueue = v7->_transitionControllerQueue;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __60__UIDocumentBrowserTransitionController_setLoadingProgress___block_invoke;
    v16[3] = &unk_24C0F0C70;
    v16[4] = v7;
    -[NSOperationQueue addOperationWithBlock:](transitionControllerQueue, "addOperationWithBlock:", v16);
    if (*p_loadingProgress && (objc_msgSend(*p_loadingProgress, "isFinished") & 1) == 0)
    {
      v12 = v7;
      objc_sync_enter(v12);
      v13 = (NSObject **)MEMORY[0x24BE2DFF0];
      v14 = *MEMORY[0x24BE2DFF0];
      if (!*MEMORY[0x24BE2DFF0])
      {
        DOCInitLogging();
        v14 = *v13;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *p_loadingProgress;
        *(_DWORD *)buf = 138543362;
        v18 = v15;
        _os_log_impl(&dword_209052000, v14, OS_LOG_TYPE_DEFAULT, "Progress: [Transition Controller] ADD fractionCompleted observer for: %{public}@", buf, 0xCu);
      }
      objc_msgSend(*p_loadingProgress, "addObserver:forKeyPath:options:context:", v12, CFSTR("fractionCompleted"), 1, &UIDocumentBrowserTransitionControllerKVOContext);
      objc_msgSend(*p_loadingProgress, "addObserver:forKeyPath:options:context:", v12, CFSTR("isIndeterminate"), 1, &UIDocumentBrowserTransitionControllerKVOContext);
      v7->_shouldStopObservingProgress = 1;
      objc_sync_exit(v12);

    }
  }

}

void __60__UIDocumentBrowserTransitionController_setLoadingProgress___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "loadingProgress");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (v5 != 0) & ~objc_msgSend(*(id *)(a1 + 32), "transitionDidFinish");
  objc_msgSend(*(id *)(a1 + 32), "transitionController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fractionCompleted");
  objc_msgSend(v3, "setHasProgress:loadingFractionCompleted:setIsIndeterminate:", v2, objc_msgSend(v5, "isIndeterminate"), v4);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  DOCServiceTransitionProtocol *transitionController;
  NSProgress *loadingProgress;
  _BOOL8 v10;
  double v11;
  objc_super v12;

  if (a6 == &UIDocumentBrowserTransitionControllerKVOContext)
  {
    transitionController = self->_transitionController;
    loadingProgress = self->_loadingProgress;
    v10 = !self->_transitionDidFinish && loadingProgress != 0;
    -[NSProgress fractionCompleted](loadingProgress, "fractionCompleted", a3, a4, a5);
    -[DOCServiceTransitionProtocol setHasProgress:loadingFractionCompleted:setIsIndeterminate:](transitionController, "setHasProgress:loadingFractionCompleted:setIsIndeterminate:", v10, -[NSProgress isIndeterminate](self->_loadingProgress, "isIndeterminate"), v11);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIDocumentBrowserTransitionController;
    -[UIDocumentBrowserTransitionController observeValueForKeyPath:ofObject:change:context:](&v12, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)dealloc
{
  UIDocumentBrowserTransitionController *v2;
  void *v3;
  _BOOL4 v4;
  NSObject **v5;
  NSObject *v6;
  NSProgress *loadingProgress;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  NSProgress *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  -[UIDocumentBrowserTransitionController loadingProgress](v2, "loadingProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[UIDocumentBrowserTransitionController shouldStopObservingProgress](v2, "shouldStopObservingProgress");

    if (v4)
    {
      v5 = (NSObject **)MEMORY[0x24BE2DFF0];
      v6 = *MEMORY[0x24BE2DFF0];
      if (!*MEMORY[0x24BE2DFF0])
      {
        DOCInitLogging();
        v6 = *v5;
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        loadingProgress = v2->_loadingProgress;
        *(_DWORD *)buf = 138543362;
        v12 = loadingProgress;
        _os_log_impl(&dword_209052000, v6, OS_LOG_TYPE_DEFAULT, "Progress: [Transition Controller] REMOVE-DEALLOC fractionCompleted observer for: %{public}@", buf, 0xCu);
      }
      -[UIDocumentBrowserTransitionController loadingProgress](v2, "loadingProgress");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObserver:forKeyPath:", v2, CFSTR("fractionCompleted"));

      -[UIDocumentBrowserTransitionController loadingProgress](v2, "loadingProgress");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObserver:forKeyPath:", v2, CFSTR("isIndeterminate"));

      -[UIDocumentBrowserTransitionController setShouldStopObservingProgress:](v2, "setShouldStopObservingProgress:", 0);
    }
  }
  objc_sync_exit(v2);

  v10.receiver = v2;
  v10.super_class = (Class)UIDocumentBrowserTransitionController;
  -[UIDocumentBrowserTransitionController dealloc](&v10, sel_dealloc);
}

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)animateTransition:(id)a3
{
  id v5;
  NSObject **v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  char v14;
  int v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject **v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  DOCServiceTransitionProtocol *v27;
  UIView *v28;
  NSOperationQueue *transitionControllerQueue;
  id v30;
  id v31;
  UIView *v32;
  DOCServiceTransitionProtocol *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  DOCServiceTransitionProtocol *v37;
  UIView *v38;
  id v39;
  id v40;
  char v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  UIDocumentBrowserTransitionController *v46;
  id v47;
  char v48;
  uint8_t buf[4];
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (-[UIDocumentBrowserTransitionController encounteredUnrecoverableError](self, "encounteredUnrecoverableError"))
  {
    v6 = (NSObject **)MEMORY[0x24BE2DF90];
    v7 = *MEMORY[0x24BE2DF90];
    if (!*MEMORY[0x24BE2DF90])
    {
      DOCInitLogging();
      v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[UIDocumentBrowserTransitionController animateTransition:].cold.1(v7);
    objc_msgSend(v5, "completeTransition:", 1);
    goto LABEL_24;
  }
  objc_msgSend(v5, "viewControllerForKey:", *MEMORY[0x24BEBE9A0]);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerForKey:", *MEMORY[0x24BEBE9B0]);
  v9 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isEqualToString:", CFSTR("DOCServiceBrowserViewController")) & 1) != 0)
      {
LABEL_12:

        goto LABEL_13;
      }
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("DOCServiceBrowserViewController"));

      if ((v14 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDocumentBrowserTransitionController.m"), 192, CFSTR("UIDocumentBrowserTransitionController can only be used when transitioning from or to a viewController of type UIDocumentBrowserViewController. sourceViewController: %@, destinationViewController: %@"), v8, v9);
        goto LABEL_12;
      }
    }
  }
LABEL_13:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = 1;
  }
  else
  {
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v17, "isEqualToString:", CFSTR("DOCServiceBrowserViewController"));

  }
  objc_msgSend(v5, "containerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewForKey:", *MEMORY[0x24BEBE9A8]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewForKey:", *MEMORY[0x24BEBE9B8]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAutoresizingMask:", 18);
  objc_msgSend(v18, "bounds");
  objc_msgSend(v20, "setFrame:");
  objc_msgSend(v20, "setAlpha:", 0.0);
  v34 = (void *)v9;
  if (v15)
    objc_msgSend(v18, "insertSubview:belowSubview:", v20, v19);
  else
    objc_msgSend(v18, "addSubview:", v20);
  v21 = (NSObject **)MEMORY[0x24BE2DF90];
  v22 = *MEMORY[0x24BE2DF90];
  if (!*MEMORY[0x24BE2DF90])
  {
    DOCInitLogging();
    v22 = *v21;
  }
  v35 = (void *)v8;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v50 = v15;
    _os_log_impl(&dword_209052000, v22, OS_LOG_TYPE_INFO, "Starting transition. Presenting: %d", buf, 8u);
  }
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __59__UIDocumentBrowserTransitionController_animateTransition___block_invoke;
  v42[3] = &unk_24C0F1438;
  v23 = v18;
  v43 = v23;
  v44 = v19;
  v45 = v20;
  v46 = self;
  v47 = v5;
  v48 = v15;
  v24 = v20;
  v25 = v19;
  v26 = (void *)MEMORY[0x20BD0CEF0](v42);
  v27 = self->_transitionController;
  v28 = self->_referenceView;
  transitionControllerQueue = self->_transitionControllerQueue;
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __59__UIDocumentBrowserTransitionController_animateTransition___block_invoke_3;
  v36[3] = &unk_24C0F14B0;
  v41 = v15;
  v37 = v27;
  v38 = v28;
  v39 = v23;
  v40 = v26;
  v30 = v26;
  v31 = v23;
  v32 = v28;
  v33 = v27;
  -[NSOperationQueue addOperationWithBlock:](transitionControllerQueue, "addOperationWithBlock:", v36);

LABEL_24:
}

void __59__UIDocumentBrowserTransitionController_animateTransition___block_invoke(uint64_t a1, void *a2, uint64_t a3, double a4, double a5, double a6, double a7)
{
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  id v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;

  v13 = a2;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "transitionDuration:", *(_QWORD *)(a1 + 64));
  v18 = v17;
  objc_msgSend(*(id *)(a1 + 56), "targetView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *(_BYTE *)(a1 + 72);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __59__UIDocumentBrowserTransitionController_animateTransition___block_invoke_2;
  v24[3] = &unk_24C0F1410;
  v21 = *(void **)(a1 + 64);
  v24[4] = *(_QWORD *)(a1 + 56);
  v25 = v21;
  v26 = *(id *)(a1 + 48);
  v27 = v13;
  v22 = v13;
  LOWORD(v23) = v20;
  +[DOCTransitionUtils performZoomTransitionInContainer:withSourceView:destinationView:duration:alterativeView:thumbnail:thumbnailStyle:location:presenting:fadingSource:completion:](DOCTransitionUtils, "performZoomTransitionInContainer:withSourceView:destinationView:duration:alterativeView:thumbnail:thumbnailStyle:location:presenting:fadingSource:completion:", v14, v15, v16, v19, v22, a3, v18, a4, a5, a6, a7, v23, v24);

}

void __59__UIDocumentBrowserTransitionController_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "setTransitionDidFinish:", 1);
  objc_msgSend(*(id *)(a1 + 32), "transitionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHasProgress:loadingFractionCompleted:setIsIndeterminate:", 0, 0, 0.0);

  objc_msgSend(*(id *)(a1 + 40), "completeTransition:", a2);
  objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "setLoadingProgress:", 0);
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "transitionController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endTransition");

  }
}

void __59__UIDocumentBrowserTransitionController_animateTransition___block_invoke_3(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  uint8_t buf[16];

  v2 = (NSObject **)MEMORY[0x24BE2DF90];
  v3 = *MEMORY[0x24BE2DF90];
  if (*(_QWORD *)(a1 + 32))
  {
    if (!v3)
    {
      DOCInitLogging();
      v3 = *v2;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209052000, v3, OS_LOG_TYPE_INFO, "Item has a service browser, trying to get the display information", buf, 2u);
    }
    v4 = *(void **)(a1 + 32);
    v5 = *(unsigned __int8 *)(a1 + 64);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __59__UIDocumentBrowserTransitionController_animateTransition___block_invoke_24;
    v6[3] = &unk_24C0F1488;
    v7 = v4;
    v8 = *(id *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    v10 = *(id *)(a1 + 56);
    objc_msgSend(v7, "getDisplayInformation:withCompletionBlock:", v5, v6);

  }
  else
  {
    if (!v3)
    {
      DOCInitLogging();
      v3 = *v2;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209052000, v3, OS_LOG_TYPE_INFO, "No item service browser. Just adding the view.", buf, 2u);
    }
    (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 56) + 16))(*MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }
}

void __59__UIDocumentBrowserTransitionController_animateTransition___block_invoke_24(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v5 = a1[4];
  v6 = a1[5];
  v7 = a1[6];
  v8 = a1[7];
  v4 = v3;
  DOCRunInMainThread();

}

uint64_t __59__UIDocumentBrowserTransitionController_animateTransition___block_invoke_2_25(uint64_t a1)
{
  NSObject **v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  NSObject *v10;
  void *v11;
  _QWORD block[4];
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;
  CGRect v22;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (NSObject **)MEMORY[0x24BE2DF90];
  v3 = *MEMORY[0x24BE2DF90];
  if (!*MEMORY[0x24BE2DF90])
  {
    DOCInitLogging();
    v3 = *v2;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 72);
    v6 = *(double *)(a1 + 80);
    v7 = *(double *)(a1 + 88);
    v8 = *(double *)(a1 + 96);
    v9 = *(double *)(a1 + 104);
    v10 = v3;
    v22.origin.x = v6;
    v22.origin.y = v7;
    v22.size.width = v8;
    v22.size.height = v9;
    NSStringFromCGRect(v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = v4;
    v17 = 2048;
    v18 = v5;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_209052000, v10, OS_LOG_TYPE_INFO, "Display information received thumbnail: %@ style: %lu sourceRect: %@. Starting transition.", buf, 0x20u);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__UIDocumentBrowserTransitionController_animateTransition___block_invoke_26;
    block[3] = &unk_24C0F0C70;
    v14 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  objc_msgSend(*(id *)(a1 + 48), "convertRect:toView:", *(_QWORD *)(a1 + 56), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

uint64_t __59__UIDocumentBrowserTransitionController_animateTransition___block_invoke_26(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startTransition");
}

- (NSProgress)loadingProgress
{
  return self->_loadingProgress;
}

- (UIView)targetView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_targetView);
}

- (void)setTargetView:(UIView *)targetView
{
  objc_storeWeak((id *)&self->_targetView, targetView);
}

- (NSURL)itemURL
{
  return self->_itemURL;
}

- (void)setItemURL:(id)a3
{
  objc_storeStrong((id *)&self->_itemURL, a3);
}

- (BOOL)transitionDidFinish
{
  return self->_transitionDidFinish;
}

- (void)setTransitionDidFinish:(BOOL)a3
{
  self->_transitionDidFinish = a3;
}

- (DOCServiceTransitionProtocol)transitionController
{
  return self->_transitionController;
}

- (void)setTransitionController:(id)a3
{
  objc_storeStrong((id *)&self->_transitionController, a3);
}

- (NSOperationQueue)transitionControllerQueue
{
  return self->_transitionControllerQueue;
}

- (void)setTransitionControllerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_transitionControllerQueue, a3);
}

- (BOOL)encounteredUnrecoverableError
{
  return self->_encounteredUnrecoverableError;
}

- (void)setEncounteredUnrecoverableError:(BOOL)a3
{
  self->_encounteredUnrecoverableError = a3;
}

- (BOOL)shouldStopObservingProgress
{
  return self->_shouldStopObservingProgress;
}

- (void)setShouldStopObservingProgress:(BOOL)a3
{
  self->_shouldStopObservingProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionControllerQueue, 0);
  objc_storeStrong((id *)&self->_transitionController, 0);
  objc_storeStrong((id *)&self->_itemURL, 0);
  objc_destroyWeak((id *)&self->_targetView);
  objc_storeStrong((id *)&self->_loadingProgress, 0);
  objc_storeStrong((id *)&self->_referenceView, 0);
  objc_storeStrong((id *)&self->_serviceDocumentBrowserProxy, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

void __55__UIDocumentBrowserTransitionController_doc_commonInit__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_209052000, a2, OS_LOG_TYPE_ERROR, "Remote object proxy disconnected with error: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

void __55__UIDocumentBrowserTransitionController_doc_commonInit__block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_209052000, a2, a3, "Transition controller received %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)animateTransition:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209052000, log, OS_LOG_TYPE_ERROR, "UIDocumentBrowserTransitionController: Encountered an unrecoverable error creating the remote transition coordinator. Falling back to a no animation transition", v1, 2u);
}

@end
