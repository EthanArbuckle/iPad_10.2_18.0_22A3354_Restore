@implementation HUCCDashboardContainerViewController

- (HUCCDashboardContainerViewController)initWithDelegate:(id)a3
{
  id v4;
  HUCCDashboardContainerViewController *v5;
  HUCCDashboardContainerViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUCCDashboardContainerViewController;
  v5 = -[HUCCDashboardContainerViewController init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)loadView
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  id v16;

  v3 = objc_alloc(MEMORY[0x24BDF6F90]);
  objc_msgSend_expandedContentFrame(self, v4, v5);
  v8 = (void *)objc_msgSend_initWithFrame_(v3, v6, v7);
  objc_msgSend_setView_(self, v9, (uint64_t)v8);

  objc_msgSend_sharedDispatcher(MEMORY[0x24BE4D0B0], v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_home(v12, v13, v14);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend__requestRemoteViewControllerForHome_(self, v15, (uint64_t)v16);
}

- (void)willBeginTransition:(BOOL)a3 forCompactModule:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  id v16;

  v4 = a4;
  v5 = a3;
  if (a3)
  {
    objc_msgSend_view(self, a2, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_remoteDashboardViewController(self, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_view(v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addSubview_(v7, v14, (uint64_t)v13);

  }
  objc_msgSend_serviceViewControllerProxy(self, a2, a3);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_willBeginTransition_forCompactModule_(v16, v15, v5, v4);

}

- (void)willFinishTransition:(BOOL)a3 forCompactModule:(BOOL)a4
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  id v9;

  if (!a3)
  {
    objc_msgSend_remoteDashboardViewController(self, a2, a3, a4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_view(v9, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeFromSuperview(v6, v7, v8);

  }
}

- (id)serviceViewControllerProxy
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_remoteDashboardViewController(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_serviceViewControllerProxy(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGRect)expandedContentFrame
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  const char *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  objc_msgSend_currentDevice(MEMORY[0x24BDF69C8], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_userInterfaceIdiom(v4, v5, v6);

  objc_msgSend_preferredExpandedSize(self, v8, v9);
  v13 = v12;
  if (v7 == 1)
  {
    CCUIExpandedModuleEdgeInsets();
    v13 = v13 + v14 * 2.0;
    objc_msgSend_preferredExpandedSize(self, v15, v16);
    v18 = v17;
    CCUIExpandedModuleEdgeInsets();
    v20 = v18 + v19 * -4.0;
  }
  else
  {
    objc_msgSend_preferredExpandedSize(self, v10, v11);
    v20 = v21;
  }
  v22 = 0.0;
  v23 = 0.0;
  v24 = v13;
  result.size.height = v20;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGSize)preferredExpandedSize
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  CGFloat Width;
  double Height;
  double v10;
  double v11;
  CGSize result;
  CGRect v13;
  CGRect v14;

  objc_msgSend_currentDevice(MEMORY[0x24BDF69C8], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_userInterfaceIdiom(v3, v4, v5);

  if (v6 == 1)
  {
    CCUIDefaultExpandedContentModuleWidth();
    Width = v7;
    CCUIMaximumExpandedContentModuleHeight();
  }
  else
  {
    CCUIScreenBounds();
    Width = CGRectGetWidth(v13);
    CCUIScreenBounds();
    Height = CGRectGetHeight(v14);
  }
  v10 = Height;
  v11 = Width;
  result.height = v10;
  result.width = v11;
  return result;
}

- (void)_requestRemoteViewControllerForHome:(id)a3
{
  id v4;
  const char *v5;
  id v6;
  const char *v7;
  void *v8;
  const char *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v4 = a3;
  objc_msgSend__beginDelayingPresentation_cancellationHandler_(self, v5, (uint64_t)&unk_24FFD84B8, 5.0);
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_230FE8F9C;
  v10[3] = &unk_24FFD84E0;
  objc_copyWeak(&v12, &location);
  v6 = v4;
  v11 = v6;
  objc_msgSend_requestViewControllerWithConnectionHandler_(HUCCRemoteDashboardViewController, v7, (uint64_t)v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCancelServiceInvocation_(self, v9, (uint64_t)v8);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)_configureAndAddRemoteViewController:(id)a3 forHome:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  _QWORD v26[4];
  id v27;
  id location;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  v8 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    objc_msgSend__addNewRemoteViewController_(self, v11, (uint64_t)v10);
    objc_msgSend_serviceViewControllerProxy(self, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_uniqueIdentifier(v7, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_configureHomeControlServiceWithHomeUUID_(v14, v21, (uint64_t)v20);

    objc_initWeak(&location, self);
    objc_msgSend_serviceViewControllerProxy(self, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = sub_230FE91D4;
    v26[3] = &unk_24FFD8508;
    objc_copyWeak(&v27, &location);
    objc_msgSend_getTransitionSubviewFramesWithCompletion_(v24, v25, (uint64_t)v26);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
    NSLog(CFSTR("Unexpected remote view controller: %@"), v8);
  }

}

- (void)_stopAndRemoveRemoteViewController
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  id v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  const char *v37;

  objc_msgSend_remoteDashboardViewController(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend_remoteDashboardViewController(self, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_beginAppearanceTransition_animated_(v7, v8, 0, 0);

    objc_msgSend_remoteDashboardViewController(self, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_willMoveToParentViewController_(v11, v12, 0);

    objc_msgSend_remoteDashboardViewController(self, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_view(v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeFromSuperview(v18, v19, v20);

    objc_msgSend_remoteDashboardViewController(self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (id)objc_msgSend_disconnect(v23, v24, v25);

    objc_msgSend_remoteDashboardViewController(self, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_removeFromParentViewController(v29, v30, v31);

    objc_msgSend_remoteDashboardViewController(self, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_endAppearanceTransition(v34, v35, v36);

    objc_msgSend_setRemoteDashboardViewController_(self, v37, 0);
  }
}

- (void)_addNewRemoteViewController:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  const char *v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  id v56;

  v4 = a3;
  objc_msgSend__stopAndRemoveRemoteViewController(self, v5, v6);
  objc_msgSend_setRemoteDashboardViewController_(self, v7, (uint64_t)v4);

  objc_msgSend_remoteDashboardViewController(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDelegate_(v10, v11, (uint64_t)self);

  objc_msgSend_remoteDashboardViewController(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_beginAppearanceTransition_animated_(v14, v15, 1, 0);

  objc_msgSend_remoteDashboardViewController(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addChildViewController_(self, v19, (uint64_t)v18);

  objc_msgSend_view(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bounds(v22, v23, v24);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  objc_msgSend_remoteDashboardViewController(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFrame_(v38, v39, v40, v26, v28, v30, v32);

  objc_msgSend_remoteDashboardViewController(self, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_view(v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAutoresizingMask_(v46, v47, 18);

  objc_msgSend_remoteDashboardViewController(self, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_didMoveToParentViewController_(v50, v51, (uint64_t)self);

  objc_msgSend_remoteDashboardViewController(self, v52, v53);
  v56 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_endAppearanceTransition(v56, v54, v55);

}

- (void)remoteDashboard:(id)a3 viewServiceDidTerminateWithError:(id)a4
{
  id v5;
  NSObject *v6;
  const char *v7;

  v5 = a4;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_230FF4550((uint64_t)v5, v6);

  objc_msgSend_setRemoteDashboardViewController_(self, v7, 0);
}

- (void)requestDismissal
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_delegate(self, a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requestDismissal(v5, v3, v4);

}

- (void)requestLockAuthenticationForRemoteDashboard:(id)a3
{
  void *v4;
  const char *v5;
  _QWORD v6[5];

  objc_msgSend_delegate(self, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_230FE959C;
  v6[3] = &unk_24FFD8530;
  v6[4] = self;
  objc_msgSend_requestAuthenticationIfLockedWithCompletionHandler_(v4, v5, (uint64_t)v6);

}

- (void)quickControlsPresentationDidUpdate:(BOOL)a3
{
  _BOOL8 v3;
  const char *v4;
  id v5;

  v3 = a3;
  objc_msgSend_delegate(self, a2, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_quickControlsPresentationDidUpdate_(v5, v4, v3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSDictionary)transitionSubviewFrames
{
  return self->_transitionSubviewFrames;
}

- (void)setTransitionSubviewFrames:(id)a3
{
  objc_storeStrong((id *)&self->_transitionSubviewFrames, a3);
}

- (HUCCRemoteDashboardViewController)remoteDashboardViewController
{
  return self->_remoteDashboardViewController;
}

- (void)setRemoteDashboardViewController:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDashboardViewController, a3);
}

- (_UIAsyncInvocation)cancelServiceInvocation
{
  return self->_cancelServiceInvocation;
}

- (void)setCancelServiceInvocation:(id)a3
{
  objc_storeStrong((id *)&self->_cancelServiceInvocation, a3);
}

- (HUCCDashboardContainerViewControllerDelegate)delegate
{
  return (HUCCDashboardContainerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_cancelServiceInvocation, 0);
  objc_storeStrong((id *)&self->_remoteDashboardViewController, 0);
  objc_storeStrong((id *)&self->_transitionSubviewFrames, 0);
}

@end
