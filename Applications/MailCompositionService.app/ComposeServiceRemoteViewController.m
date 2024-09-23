@implementation ComposeServiceRemoteViewController

- (ComposeServiceRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  ComposeServiceRemoteViewController *v8;
  id v9;
  uint64_t v10;
  MFAttachmentComposeManager *attachmentManager;
  MFAttachmentComposeManager *v12;
  uint64_t v13;
  uint64_t v14;
  MFAttachmentComposeManager *v15;
  MFAttachmentComposeManager *v16;
  ComposeNavigationController *v17;
  ComposeNavigationController *navigationController;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  objc_super v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  ComposeServiceRemoteViewController *v34;

  v6 = a3;
  v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)ComposeServiceRemoteViewController;
  v8 = -[ComposeServiceRemoteViewController initWithNibName:bundle:](&v30, "initWithNibName:bundle:", v6, v7);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc((Class)_MFMailCompositionContext), "initWithComposeType:", 1);
    v10 = objc_claimAutoreleasedReturnValue(+[MFAttachmentManager defaultManager](MFAttachmentManager, "defaultManager"));
    attachmentManager = v8->_attachmentManager;
    v8->_attachmentManager = (MFAttachmentComposeManager *)v10;

    v12 = v8->_attachmentManager;
    v14 = objc_opt_class(MFAttachmentComposeManager, v13);
    if ((objc_opt_isKindOfClass(v12, v14) & 1) == 0)
    {
      v15 = (MFAttachmentComposeManager *)objc_alloc_init((Class)MFAttachmentComposeManager);
      v16 = v8->_attachmentManager;
      v8->_attachmentManager = v15;

    }
    v17 = -[ComposeNavigationController initWithComposition:mailComposeControllerOptions:]([ComposeNavigationController alloc], "initWithComposition:mailComposeControllerOptions:", v9, 2);
    navigationController = v8->_navigationController;
    v8->_navigationController = v17;

    -[ComposeNavigationController setMailComposeDelegate:](v8->_navigationController, "setMailComposeDelegate:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v19, "addObserver:selector:name:object:", v8, "_firstDraw:", MFMailComposeViewFirstDraw, 0);

    -[ComposeServiceRemoteViewController addChildViewController:](v8, "addChildViewController:", v8->_navigationController);
    +[NSURLProtocol registerClass:](NSURLProtocol, "registerClass:", objc_opt_class(MFMessageURLProtocol, v20));
    v21 = +[MailAccount reloadAccounts](MailAccount, "reloadAccounts");
    v23 = MFLogGeneral(v21, v22);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v26 = (objc_class *)objc_opt_class(v8, v25);
      v27 = NSStringFromClass(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      *(_DWORD *)buf = 138412546;
      v32 = v28;
      v33 = 2048;
      v34 = v8;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "#CompositionServices <%@:%p> initialized", buf, 0x16u);

    }
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  objc_super v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  ComposeServiceRemoteViewController *v13;

  v3 = MFLogGeneral(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class(self, v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    *(_DWORD *)buf = 138412546;
    v11 = v8;
    v12 = 2048;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "#CompositionServices <%@:%p> deallocating", buf, 0x16u);

  }
  v9.receiver = self;
  v9.super_class = (Class)ComposeServiceRemoteViewController;
  -[ComposeServiceRemoteViewController dealloc](&v9, "dealloc");
}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ComposeServiceRemoteViewController;
  -[ComposeServiceRemoteViewController loadView](&v7, "loadView");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeServiceRemoteViewController view](self, "view"));
  objc_msgSend(v3, "setAutoresizingMask:", 18);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeServiceRemoteViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController view](self->_navigationController, "view"));
  objc_msgSend(v4, "addSubview:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeView](self->_navigationController, "_mailComposeView"));
  objc_msgSend(v6, "setIsForEditing:", 1);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ComposeServiceRemoteViewController;
  -[ComposeServiceRemoteViewController viewDidAppear:](&v7, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeServiceRemoteViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_rootSheetPresentationController"));

  objc_msgSend(v6, "_setAllowsTearOff:", 1);
  objc_msgSend(v6, "setPrefersGrabberVisible:", +[UIDevice mf_isPad](UIDevice, "mf_isPad"));
  objc_msgSend(v6, "setDelegate:", self);

}

- (void)_willAppearInRemoteViewController
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  ComposeServiceRemoteViewController *v11;
  __int16 v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeServiceRemoteViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeController](self->_navigationController, "_mailComposeController"));
  objc_msgSend(v4, "setRemoteViewControllerProxy:", v3);

  v7 = MFLogGeneral(v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeServiceRemoteViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier"));
    v10 = 134218242;
    v11 = self;
    v12 = 2112;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "#CompositionServices %p: will appear in host %@", (uint8_t *)&v10, 0x16u);

  }
}

- (void)_hostApplicationDidEnterBackground
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  ComposeServiceRemoteViewController *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeController](self->_navigationController, "_mailComposeController"));
  objc_msgSend(v3, "hostApplicationDidEnterBackground");

  v6 = MFLogGeneral(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#CompositionServices %p: host did enter background", (uint8_t *)&v8, 0xCu);
  }

}

- (void)_hostApplicationWillEnterForeground
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  ComposeServiceRemoteViewController *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeController](self->_navigationController, "_mailComposeController"));
  objc_msgSend(v3, "hostApplicationWillEnterForeground");

  v6 = MFLogGeneral(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "#CompositionServices %p: host will enter foreground", (uint8_t *)&v8, 0xCu);
  }

}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  _BYTE v17[24];
  const char *v18;
  __int16 v19;
  const __CFString *v20;

  v7 = (__CFString *)a5;
  v9 = MFLogGeneral(v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = " and error: ";
    if (!v7)
      v11 = "";
    *(_DWORD *)v17 = 134218754;
    *(_QWORD *)&v17[4] = self;
    *(_WORD *)&v17[12] = 2048;
    *(_QWORD *)&v17[14] = a4;
    v12 = &stru_100018898;
    if (v7)
      v12 = v7;
    *(_WORD *)&v17[22] = 2080;
    v18 = v11;
    v19 = 2112;
    v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "#CompositionServices %p: Composition finished with result %ld%s%@", v17, 0x2Au);
  }

  if (a4 == 2)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeController](self->_navigationController, "_mailComposeController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "compositionContext"));
    v15 = objc_msgSend(v14, "hasDuetDonationContext");

    if (v15)
      -[ComposeServiceRemoteViewController donateShareInteractionToDuet](self, "donateShareInteractionToDuet");
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeServiceRemoteViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy", *(_OWORD *)v17, *(_QWORD *)&v17[16]));
  objc_msgSend(v16, "serviceCompositionFinishedWithResult:error:", a4, v7);

}

- (void)mailComposeController:(id)a3 shouldSendMail:(id)a4 toRecipients:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, uint64_t);
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  int v16;
  ComposeServiceRemoteViewController *v17;

  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, uint64_t))a6;
  v13 = MFLogGeneral(v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v16 = 134217984;
    v17 = self;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "#CompositionServices %p: Composition requests send", (uint8_t *)&v16, 0xCu);
  }

  -[ComposeServiceRemoteViewController _hostAuditToken](self, "_hostAuditToken", 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL, 0xAAAAAAAAAAAAAAAALL);
  if (UIAuditTokenTaskHasEntitlement(&v16, CFSTR("com.apple.private.mobilemail.mail-recipient-vetting")))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeServiceRemoteViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    objc_msgSend(v15, "serviceCompositionRequestsSendWithBody:recipients:completion:", v9, v10, v11);

  }
  else
  {
    v11[2](v11, 1);
  }

}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  ComposeServiceRemoteViewController *v16;
  __int16 v17;
  void *v18;

  v4 = a3;
  v6 = MFLogGeneral(v4, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v9 = (objc_class *)objc_opt_class(self, v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_publicDescription"));
    v13 = 138412802;
    v14 = v11;
    v15 = 2048;
    v16 = self;
    v17 = 2114;
    v18 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "#CompositionServices <%@:%p> %{public}@", (uint8_t *)&v13, 0x20u);

  }
}

- (void)_firstDraw:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  objc_msgSend(v4, "removeObserver:name:object:", self, v5, 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeServiceRemoteViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v6, "bodyFinishedDrawing");

}

- (void)setCompositionValues:(id)a3
{
  id v4;
  void *v5;
  _MFMailCompositionContext *v6;
  _MFMailCompositionContext *compositionContext;
  id v8;

  v8 = a3;
  v4 = objc_alloc((Class)_MFMailCompositionContext);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeServiceRemoteViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier"));
  v6 = (_MFMailCompositionContext *)objc_msgSend(v4, "initWithCompositionValueRepresentation:hostApplicationBundleIdentifier:", v8, v5);
  compositionContext = self->_compositionContext;
  self->_compositionContext = v6;

}

- (void)setUICustomizationData:(id)a3
{
  -[ComposeNavigationController mf_setDataForUICustomization:](self->_navigationController, "mf_setDataForUICustomization:", a3);
}

- (void)addAttachmentWithPlaceholderData:(id)a3
{
  id v4;
  void *v5;
  _MFMailCompositionContext *compositionContext;
  _MFMailCompositionContext *v7;
  _MFMailCompositionContext *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *attachmentIdentifiersMap;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  int v25;
  ComposeServiceRemoteViewController *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MFAttachmentPlaceholder placeholderFromSerializedRepresentation:](MFAttachmentPlaceholder, "placeholderFromSerializedRepresentation:", v4));
  compositionContext = self->_compositionContext;
  if (!compositionContext)
  {
    v7 = (_MFMailCompositionContext *)objc_msgSend(objc_alloc((Class)_MFMailCompositionContext), "initWithComposeType:", 0);
    v8 = self->_compositionContext;
    self->_compositionContext = v7;

    compositionContext = self->_compositionContext;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_MFMailCompositionContext addAttachmentData:mimeType:fileName:contentID:](compositionContext, "addAttachmentData:mimeType:fileName:contentID:", v4, 0, v9, v10));

  objc_msgSend(v11, "setIsPlaceholder:", 1);
  objc_msgSend(v11, "setPlaceholder:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[_MFMailCompositionContext attachmentContext](self->_compositionContext, "attachmentContext"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentID"));
  objc_msgSend(v12, "setHostIdentifier:forAttachment:", v13, v11);

  if (!self->_attachmentIdentifiersMap)
  {
    v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    attachmentIdentifiersMap = self->_attachmentIdentifiersMap;
    self->_attachmentIdentifiersMap = v16;

  }
  v18 = MFLogGeneral(v14, v15);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentID"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "url"));
    v25 = 134218498;
    v26 = self;
    v27 = 2112;
    v28 = v20;
    v29 = 2112;
    v30 = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "#CompositionServices %p: Mapping attachment with remote identifier %@ to local identifier %@", (uint8_t *)&v25, 0x20u);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentID"));

  if (v22)
  {
    v23 = self->_attachmentIdentifiersMap;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentID"));
    -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v11, v24);

  }
}

- (void)addAttachmentWithData:(id)a3 mimeType:(id)a4 fileName:(id)a5 hostIdentifier:(id)a6
{
  -[ComposeServiceRemoteViewController _addAttachmentData:itemProvider:mimeType:fileName:hostIdentifier:](self, "_addAttachmentData:itemProvider:mimeType:fileName:hostIdentifier:", a3, 0, a4, a5, a6);
}

- (void)addAttachmentWithItemProvider:(id)a3 mimeType:(id)a4 filename:(id)a5 hostIdentifier:(id)a6
{
  -[ComposeServiceRemoteViewController _addAttachmentData:itemProvider:mimeType:fileName:hostIdentifier:](self, "_addAttachmentData:itemProvider:mimeType:fileName:hostIdentifier:", 0, a3, a4, a5, a6);
}

- (void)_addAttachmentData:(id)a3 itemProvider:(id)a4 mimeType:(id)a5 fileName:(id)a6 hostIdentifier:(id)a7
{
  unint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  _MFMailCompositionContext *v21;
  _MFMailCompositionContext *compositionContext;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSMutableDictionary *v29;
  NSMutableDictionary *attachmentIdentifiersMap;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  NSMutableDictionary *v36;
  void *v37;
  void *v38;
  id v39;
  uint8_t buf[4];
  ComposeServiceRemoteViewController *v41;
  __int16 v42;
  unint64_t v43;
  __int16 v44;
  unint64_t v45;

  v13 = (unint64_t)a3;
  v14 = (unint64_t)a4;
  v39 = a5;
  v15 = a6;
  v16 = a7;
  v18 = v16;
  if (!(v13 | v14))
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ComposeServiceRemoteViewController.m"), 199, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data || itemProvider"));

  }
  v19 = MFLogGeneral(v16, v17);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218496;
    v41 = self;
    v42 = 2048;
    v43 = v13;
    v44 = 2048;
    v45 = v14;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "#CompositionServices %p: creating attachment for data:%p itemProvider:%p", buf, 0x20u);
  }

  if (!self->_compositionContext)
  {
    v21 = (_MFMailCompositionContext *)objc_msgSend(objc_alloc((Class)_MFMailCompositionContext), "initWithComposeType:", 0);
    compositionContext = self->_compositionContext;
    self->_compositionContext = v21;

  }
  if (v13)
  {
    v23 = objc_claimAutoreleasedReturnValue(-[_MFMailCompositionContext addAttachmentData:mimeType:fileName:](self->_compositionContext, "addAttachmentData:mimeType:fileName:", v13, v39, v15));
LABEL_11:
    v24 = (void *)v23;
    goto LABEL_12;
  }
  if (v14)
  {
    v23 = objc_claimAutoreleasedReturnValue(-[_MFMailCompositionContext addAttachmentDataItemProvider:mimeType:filename:contentID:](self->_compositionContext, "addAttachmentDataItemProvider:mimeType:filename:contentID:", v14, v39, v15, 0));
    goto LABEL_11;
  }
  v24 = 0;
LABEL_12:
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[_MFMailCompositionContext attachmentContext](self->_compositionContext, "attachmentContext"));
  objc_msgSend(v25, "setHostIdentifier:forAttachment:", v18, v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "contentID"));
  -[_MFMailCompositionContext setContentVariationAttachmentCID:](self->_compositionContext, "setContentVariationAttachmentCID:", v26);

  if (!self->_attachmentIdentifiersMap)
  {
    v29 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    attachmentIdentifiersMap = self->_attachmentIdentifiersMap;
    self->_attachmentIdentifiersMap = v29;

  }
  v31 = MFLogGeneral(v27, v28);
  v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "contentID"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "url"));
    *(_DWORD *)buf = 134218498;
    v41 = self;
    v42 = 2112;
    v43 = (unint64_t)v33;
    v44 = 2112;
    v45 = (unint64_t)v34;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "#CompositionServices %p: Mapping attachment with remote identifier %@ to local identifier %@", buf, 0x20u);

  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "contentID"));

  if (v35)
  {
    v36 = self->_attachmentIdentifiersMap;
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "contentID"));
    -[NSMutableDictionary setObject:forKey:](v36, "setObject:forKey:", v24, v37);

  }
}

- (void)commitCompositionValuesWithReply:(id)a3
{
  void *v4;
  _MFMailCompositionContext *compositionContext;
  dispatch_block_t block;

  block = a3;
  if (self->_compositionContext)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeController](self->_navigationController, "_mailComposeController"));
    objc_msgSend(v4, "setCompositionContext:", self->_compositionContext);

    compositionContext = self->_compositionContext;
    self->_compositionContext = 0;

  }
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (void)setContentVisible:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  int v8;
  ComposeServiceRemoteViewController *v9;
  __int16 v10;
  const char *v11;

  v3 = a3;
  v5 = MFLogGeneral(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = "NO";
    if (v3)
      v7 = "YES";
    v8 = 134218242;
    v9 = self;
    v10 = 2080;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#CompositionServices %p: Setting content visible: %s", (uint8_t *)&v8, 0x16u);
  }

  -[ComposeNavigationController setContentVisible:](self->_navigationController, "setContentVisible:", v3);
}

- (void)framesForAttachmentsWithIdentifiers:(id)a3 withReply:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void (**v23)(id, void *);
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  unint64_t v33;
  uint8_t v34[128];
  uint8_t buf[4];
  ComposeServiceRemoteViewController *v36;
  __int16 v37;
  id v38;

  v24 = a3;
  v23 = (void (**)(id, void *))a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0xAAAAAAAAAAAAAAAALL;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_10000A1AC;
  v29[3] = &unk_100018690;
  v29[4] = &v30;
  v7 = objc_msgSend(v6, "beginBackgroundTaskWithExpirationHandler:", v29);

  v31[3] = (uint64_t)v7;
  v10 = MFLogGeneral(v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v36 = self;
    v37 = 2112;
    v38 = v24;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "#CompositionServices %p: Requested attachment frames for remote identifiers %@", buf, 0x16u);
  }

  if (objc_msgSend(v24, "count")
    && (v13 = objc_opt_class(NSString, v12), _ArrayContainsKindOfObjects(v24, v13)))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v24, "count")));
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v15 = v24;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v17)
            objc_enumerationMutation(v15);
          v19 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_attachmentIdentifiersMap, "objectForKeyedSubscript:", v19));
          if (v20)
          {
            -[ComposeNavigationController frameForAttachmentWithIdentifier:](self->_navigationController, "frameForAttachmentWithIdentifier:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:"));
            objc_msgSend(v14, "setObject:forKey:", v21, v19);

          }
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      }
      while (v16);
    }

    v23[2](v23, v14);
  }
  else
  {
    v23[2](v23, 0);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  objc_msgSend(v22, "endBackgroundTask:", v31[3]);

  _Block_object_dispose(&v30, 8);
}

- (void)autosaveWithReply:(id)a3
{
  id v4;
  void *v5;
  id v6;
  ComposeNavigationController *navigationController;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0xAAAAAAAAAAAAAAAALL;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000A3A0;
  v12[3] = &unk_100018690;
  v12[4] = &v13;
  v6 = objc_msgSend(v5, "beginBackgroundTaskWithExpirationHandler:", v12);

  v14[3] = (uint64_t)v6;
  navigationController = self->_navigationController;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000A440;
  v9[3] = &unk_1000186B8;
  v9[4] = self;
  v8 = v4;
  v10 = v8;
  v11 = &v13;
  -[ComposeNavigationController autosaveWithHandler:](navigationController, "autosaveWithHandler:", v9);

  _Block_object_dispose(&v13, 8);
}

- (void)serializedPlaceholderForFileName:(id)a3 fileSize:(int64_t)a4 mimeType:(id)a5 contentID:(id)a6 withReply:(id)a7
{
  id v12;
  ComposeNavigationController *navigationController;
  id v14;
  _QWORD v15[4];
  id v16;

  v12 = a7;
  navigationController = self->_navigationController;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000A630;
  v15[3] = &unk_100018560;
  v16 = v12;
  v14 = v12;
  -[ComposeNavigationController serializedPlaceholderForFileName:fileSize:mimeType:contentID:withHandler:](navigationController, "serializedPlaceholderForFileName:fileSize:mimeType:contentID:withHandler:", a3, a4, a5, a6, v15);

}

- (void)securityScopeForURL:(id)a3 withReply:(id)a4
{
  id v6;
  ComposeNavigationController *navigationController;
  id v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  navigationController = self->_navigationController;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000A6E8;
  v9[3] = &unk_100018560;
  v10 = v6;
  v8 = v6;
  -[ComposeNavigationController securityScopeForURL:withHandler:](navigationController, "securityScopeForURL:withHandler:", a3, v9);

}

- (void)donateShareInteractionToDuet
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[5];
  id v40;

  v3 = objc_alloc_init((Class)_CDInteraction);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeServiceRemoteViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier"));
  objc_msgSend(v3, "setBundleId:", v4);

  objc_msgSend(v3, "setTargetBundleId:", UIActivityTypeMail);
  objc_msgSend(v3, "setDirection:", 1);
  objc_msgSend(v3, "setMechanism:", 13);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v3, "setEndDate:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeController](self->_navigationController, "_mailComposeController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "toRecipients"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ef_compactMap:", &stru_1000186F8));

  if (v8)
    objc_msgSend(v3, "setRecipients:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeController](self->_navigationController, "_mailComposeController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "compositionContext"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "UTITypes"));
  v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ef_map:", &stru_100018738));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeController](self->_navigationController, "_mailComposeController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "compositionContext"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "photoIDs"));
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "ef_map:", &stru_100018758));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeController](self->_navigationController, "_mailComposeController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "compositionContext"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "cloudPhotoIDs"));
  v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ef_map:", &stru_100018778));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeController](self->_navigationController, "_mailComposeController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "compositionContext"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "contentURLs"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "ef_map:", &stru_100018798));

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeController](self->_navigationController, "_mailComposeController"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "compositionContext"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "contentText"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "ef_map:", &stru_1000187B8));

  if (v15 | v19)
  {
    if (v15)
      v28 = (void *)v15;
    else
      v28 = &__NSArray0__struct;
    if (v19)
      v29 = (void *)v19;
    else
      v29 = &__NSArray0__struct;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "arrayByAddingObjectsFromArray:", v29, v37));
  }
  else
  {
    if (v27)
      v31 = v27;
    else
      v31 = &__NSArray0__struct;
    if (v23)
      v32 = v23;
    else
      v32 = &__NSArray0__struct;
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "arrayByAddingObjectsFromArray:", v32, v37));
    if (v38)
      v34 = v38;
    else
      v34 = &__NSArray0__struct;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "arrayByAddingObjectsFromArray:", v33));

  }
  objc_msgSend(v3, "setAttachments:", v30);
  v40 = v3;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v40, 1));
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[_CDInteractionRecorder interactionRecorder](_CDInteractionRecorder, "interactionRecorder"));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10000AFB8;
  v39[3] = &unk_1000187E0;
  v39[4] = self;
  objc_msgSend(v36, "recordInteractions:completionHandler:", v35, v39);

}

- (id)_sheetPresentationControllerUserActivityForTearOff:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeController](self->_navigationController, "_mailComposeController", a3));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = nullsub_1;
  v8[3] = &unk_100018808;
  v5 = v4;
  v9 = v5;
  objc_msgSend(v5, "autosaveWithHandler:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController userActivityForRestoration](self->_navigationController, "userActivityForRestoration"));

  return v6;
}

- (void)_sheetPresentationControllerDidTearOff:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ComposeServiceRemoteViewController _remoteViewControllerProxy](self, "_remoteViewControllerProxy", a3));
  objc_msgSend(v3, "serviceCompositionFinishedWithResult:error:", 1, 0);

}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return !-[ComposeNavigationController isDirty](self->_navigationController, "isDirty", a3);
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  void *v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ComposeNavigationController _mailComposeController](self->_navigationController, "_mailComposeController", a3));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000B2B8;
  block[3] = &unk_100018830;
  v6 = v3;
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

+ (id)_remoteViewControllerInterface
{
  return +[NSXPCInterface mf_mailComposeRemoteHostInterface](NSXPCInterface, "mf_mailComposeRemoteHostInterface");
}

+ (id)_exportedInterface
{
  return +[NSXPCInterface mf_mailComposeRemoteServiceInterface](NSXPCInterface, "mf_mailComposeRemoteServiceInterface");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentManager, 0);
  objc_storeStrong((id *)&self->_attachmentIdentifiersMap, 0);
  objc_storeStrong((id *)&self->_compositionContext, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
}

@end
