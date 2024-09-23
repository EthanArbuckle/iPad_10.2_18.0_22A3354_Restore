@implementation CKFunCameraViewController

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  objc_super v5;
  uint8_t buf[4];
  CKFunCameraViewController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v7 = self;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "CKFunCameraViewController (%p) being torn down", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)CKFunCameraViewController;
  -[CKFunCameraViewController dealloc](&v5, sel_dealloc);
}

- (CKFunCameraViewController)initWithConversation:(id)a3
{
  id v5;
  CKFunCameraViewController *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  IMBalloonPlugin *balloonPlugin;
  void *v12;
  void *v13;
  CKBrowserViewControllerProtocol *v14;
  CKBrowserViewControllerProtocol *v15;
  CKBrowserViewControllerProtocol *funCameraAppViewController;
  CKBrowserViewControllerProtocol *v17;
  uint64_t v18;
  UIView *funCameraView;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  CKCamPhysicalCaptureNotifier *v33;
  CKCamPhysicalCaptureNotifier *physicalCaptureNotifier;
  void *v35;
  NSObject *v36;
  CKFunCameraViewController *v37;
  objc_super v39;
  uint8_t buf[4];
  CKFunCameraViewController *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v39.receiver = self;
  v39.super_class = (Class)CKFunCameraViewController;
  v6 = -[CKFunCameraViewController init](&v39, sel_init);
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v41 = v6;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "CKFunCameraViewController (%p) being created", buf, 0xCu);
      }

    }
    objc_storeStrong((id *)&v6->_conversation, a3);
    objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    IMBalloonExtensionIDWithSuffix();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "balloonPluginForBundleID:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    balloonPlugin = v6->_balloonPlugin;
    v6->_balloonPlugin = (IMBalloonPlugin *)v10;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel__handleRemoteConnectionInterrupted_, *MEMORY[0x1E0D37E88], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v6, sel__handleRemoteConnectionInterrupted_, CFSTR("CKRemoteViewFailedInstantiationNotification"), 0);

    -[CKFunCameraViewController configuredContentViewControllerForPlugin:](v6, "configuredContentViewControllerForPlugin:", v6->_balloonPlugin);
    v14 = (CKBrowserViewControllerProtocol *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      -[CKBrowserViewControllerProtocol setSendDelegate:](v14, "setSendDelegate:", v6);
      funCameraAppViewController = v6->_funCameraAppViewController;
      v6->_funCameraAppViewController = v15;
      v17 = v15;

      -[CKBrowserViewControllerProtocol view](v17, "view");
      v18 = objc_claimAutoreleasedReturnValue();
      funCameraView = v6->_funCameraView;
      v6->_funCameraView = (UIView *)v18;

      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v6->_funCameraView, "setBackgroundColor:", v20);

      -[CKFunCameraViewController view](v6, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "bounds");
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;
      -[CKBrowserViewControllerProtocol view](v17, "view");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setFrame:", v23, v25, v27, v29);

      -[CKFunCameraViewController addChildViewController:](v6, "addChildViewController:", v17);
      -[CKFunCameraViewController view](v6, "view");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBrowserViewControllerProtocol view](v17, "view");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addSubview:", v32);

      v33 = objc_alloc_init(CKCamPhysicalCaptureNotifier);
      physicalCaptureNotifier = v6->_physicalCaptureNotifier;
      v6->_physicalCaptureNotifier = v33;

      -[CKCamPhysicalCaptureNotifier setDelegate:](v6->_physicalCaptureNotifier, "setDelegate:", v6);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addObserver:selector:name:object:", v6, sel__checkExtensionAliveOnAppResume_, *MEMORY[0x1E0CEB350], 0);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        -[IMBalloonPlugin identifier](v6->_balloonPlugin, "identifier");
        v37 = (CKFunCameraViewController *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v41 = v37;
        _os_log_impl(&dword_18DFCD000, v36, OS_LOG_TYPE_INFO, "CKFunCameraViewController: Unable to load plugin or view controller for fun camera, plugin id %@", buf, 0xCu);

      }
    }
  }

  return v6;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKFunCameraViewController;
  -[CKFunCameraViewController viewWillLayoutSubviews](&v13, sel_viewWillLayoutSubviews);
  -[CKFunCameraViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[CKFunCameraViewController funCameraView](self, "funCameraView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKFunCameraViewController;
  -[CKFunCameraViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  -[CKFunCameraViewController physicalCaptureNotifier](self, "physicalCaptureNotifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 1);

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdleTimerDisabled:", 1);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Enabled idle timer and volume button handler", v7, 2u);
    }

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKFunCameraViewController;
  -[CKFunCameraViewController viewDidDisappear:](&v8, sel_viewDidDisappear_, a3);
  -[CKFunCameraViewController physicalCaptureNotifier](self, "physicalCaptureNotifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdleTimerDisabled:", 0);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Disabled idle timer and volume button handler", v7, 2u);
    }

  }
}

- (id)traitCollection
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)CKFunCameraViewController;
  -[CKFunCameraViewController traitCollection](&v8, sel_traitCollection);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithUserInterfaceStyle:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CEAB40];
  v9[0] = v2;
  v9[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollectionWithTraitsFromCollections:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)configuredContentViewControllerForPlugin:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v14[16];

  v4 = a3;
  if (v4)
  {
    -[CKFunCameraViewController contentViewControllerForPlugin:](self, "contentViewControllerForPlugin:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = objc_msgSend(v5, "isLoaded") ^ 1;
    else
      v6 = 0;
    -[CKFunCameraViewController funCameraAppViewController](self, "funCameraAppViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v5 != v8 || v6) && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "loadRemoteViewWithCompletion:", 0);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CKFunCameraViewController conversation](self, "conversation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "senderIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setSender:", v10);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[CKFunCameraViewController conversation](self, "conversation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "recipientStrings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "setRecipients:", v12);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "contentViewControllerForPlugin: Called with nil plugin", v14, 2u);
      }

    }
    v5 = 0;
  }

  return v5;
}

- (id)contentViewControllerForPlugin:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v3 = a3;
    +[CKBalloonPluginManager sharedInstance](CKBalloonPluginManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "viewControllerForPluginIdentifier:dataSource:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)_checkExtensionAliveOnAppResume:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  -[CKFunCameraViewController funCameraAppViewController](self, "funCameraAppViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAlive");

  if ((v6 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Extension connection was dead on app resume, dismissing", v8, 2u);
      }

    }
    -[CKFunCameraViewController dismiss](self, "dismiss");
  }

}

- (void)_handleRemoteConnectionInterrupted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0D37E80]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    IMBalloonExtensionIDWithSuffix();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToIgnoringCase:", v6))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v9 = 0;
          _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Dismissing due to extension interruption for camera", v9, 2u);
        }

      }
      -[CKFunCameraViewController dismiss](self, "dismiss");
    }

  }
}

- (void)commitPayload:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CKFunCameraViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CKFunCameraViewController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startCommitPayload:forConversation:", v4, v5);

}

- (BOOL)commitPayload:(id)a3 forPlugin:(id)a4 allowAllCommits:(BOOL)a5 error:(id *)a6
{
  -[CKFunCameraViewController commitPayload:](self, "commitPayload:", a3, a4, a5, a6);
  return 1;
}

- (void)startEditingPayload:(id)a3
{
  -[CKFunCameraViewController startEditingPayload:dismiss:](self, "startEditingPayload:dismiss:", a3, 0);
}

- (void)startEditingPayload:(id)a3 dismiss:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  -[CKFunCameraViewController delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CKFunCameraViewController conversation](self, "conversation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startDeferredEditingPayload:forConversation:", v5, v6);

}

- (void)dismiss
{
  -[CKFunCameraViewController _dismissAndPresentPhotosApp:](self, "_dismissAndPresentPhotosApp:", 0);
}

- (void)dismissAndPresentPhotosApp
{
  -[CKFunCameraViewController _dismissAndPresentPhotosApp:](self, "_dismissAndPresentPhotosApp:", 1);
}

- (id)dragControllerTranscriptDelegate
{
  return 0;
}

- (void)stageAssetArchive:(id)a3 skipShelf:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;

  LODWORD(v5) = a4;
  v8 = a5;
  v9 = a3;
  -[CKFunCameraViewController conversation](self, "conversation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "recipientCount");

  if (v11)
    v5 = v5;
  else
    v5 = 0;
  -[CKFunCameraViewController delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stageAssetArchive:skipShelf:completionHandler:", v9, v5, v8);

}

- (void)_dismissAndPresentPhotosApp:(BOOL)a3
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  BOOL v11;

  -[CKFunCameraViewController setIsDismissing:](self, "setIsDismissing:", 1);
  -[CKFunCameraViewController funCameraAppViewController](self, "funCameraAppViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[CKFunCameraViewController funCameraAppViewController](self, "funCameraAppViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dropAssertion");

  }
  -[CKFunCameraViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "willDismissFunCamera:", self);

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIdleTimerDisabled:", 0);

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__CKFunCameraViewController__dismissAndPresentPhotosApp___block_invoke;
  v10[3] = &unk_1E274CA88;
  v10[4] = self;
  v11 = a3;
  -[CKFunCameraViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v10);
}

void __57__CKFunCameraViewController__dismissAndPresentPhotosApp___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setIsDismissing:", 0);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didDismissFunCamera:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "funCameraAppViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "killExtensionProcess");
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentPhotosApp");

  }
}

- (void)physicalCaptureNotifierDidChangeState:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  id v10;

  v4 = objc_msgSend(a3, "state");
  -[CKFunCameraViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isKeyWindow");

  if (v7)
  {
    -[CKFunCameraViewController funCameraAppViewController](self, "funCameraAppViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[CKFunCameraViewController funCameraAppViewController](self, "funCameraAppViewController");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "volumeButtonPressed:", v4 == 1);

    }
  }
}

- (CKFunCameraViewControllerDelegate)delegate
{
  return (CKFunCameraViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (IMBalloonPlugin)balloonPlugin
{
  return self->_balloonPlugin;
}

- (void)setBalloonPlugin:(id)a3
{
  objc_storeStrong((id *)&self->_balloonPlugin, a3);
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void)setIsDismissing:(BOOL)a3
{
  self->_isDismissing = a3;
}

- (UIView)funCameraView
{
  return self->_funCameraView;
}

- (void)setFunCameraView:(id)a3
{
  objc_storeStrong((id *)&self->_funCameraView, a3);
}

- (CKBrowserViewControllerProtocol)funCameraAppViewController
{
  return self->_funCameraAppViewController;
}

- (void)setFunCameraAppViewController:(id)a3
{
  objc_storeStrong((id *)&self->_funCameraAppViewController, a3);
}

- (CKCamPhysicalCaptureNotifier)physicalCaptureNotifier
{
  return self->_physicalCaptureNotifier;
}

- (void)setPhysicalCaptureNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_physicalCaptureNotifier, a3);
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_physicalCaptureNotifier, 0);
  objc_storeStrong((id *)&self->_funCameraAppViewController, 0);
  objc_storeStrong((id *)&self->_funCameraView, 0);
  objc_storeStrong((id *)&self->_balloonPlugin, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
