@implementation MFMailComposeController

+ (NSArray)menuCommands
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)menuCommands_commands_0;
  if (!menuCommands_commands_0)
  {
    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("w"), 0x100000, sel_close_);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E5A6A588, CFSTR("Main"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDiscoverabilityTitle:", v5);

    objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", CFSTR("b"), 1572864, sel__focusBccHeaderCommandInvoked_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("FOCUS_BCC"), &stru_1E5A6A588, CFSTR("Main"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDiscoverabilityTitle:", v8);

    +[MFMailMenuCommand shortcutWithCommand:menu:](MFMailMenuCommand, "shortcutWithCommand:menu:", v3, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v9;
    +[MFMailMenuCommand shortcutWithCommand:menu:](MFMailMenuCommand, "shortcutWithCommand:menu:", v6, 7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)menuCommands_commands_0;
    menuCommands_commands_0 = v11;

    v2 = (void *)menuCommands_commands_0;
  }
  return (NSArray *)v2;
}

+ (id)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MFMailComposeController_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (signpostLog_onceToken_0 != -1)
    dispatch_once(&signpostLog_onceToken_0, block);
  return (id)signpostLog_log_0;
}

void __38__MFMailComposeController_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email.signposts", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)signpostLog_log_0;
  signpostLog_log_0 = (uint64_t)v1;

}

- (unint64_t)signpostID
{
  NSObject *v3;
  os_signpost_id_t v4;

  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_make_with_pointer(v3, self);

  return v4;
}

- (MFMailComposeController)initWithCompositionContext:(id)a3 options:(unint64_t)a4
{
  id v7;
  MFMailComposeController *v8;
  MFMailComposeController *v9;
  NSObject *v10;
  void *v11;
  MFMailAccountProxyGenerator *v12;
  MFMailAccountProxyGenerator *accountProxyGenerator;
  uint64_t v14;
  MFLock *autosaveLock;
  MFMailSignatureController *v16;
  MFMailSignatureController *signatureController;
  NSDictionary *v18;
  NSDictionary *securityScopes;
  NSMutableSet *v20;
  NSMutableSet *drawingFileAttachments;
  void *v22;
  uint64_t v23;
  EFScheduler *autosaveQueue;
  uint64_t v25;
  EFScheduler *prepareImagesForSendScheduler;
  uint64_t v27;
  EFScheduler *originalContentMessagesScheduler;
  id v29;
  void *v30;
  uint64_t v31;
  EFDebouncer *inputContextHistoryInvalidationDebouncer;
  void *v33;
  EMCoreAnalyticsCollector *v34;
  EMCoreAnalyticsCollector *analyticsCollector;
  _QWORD v37[4];
  id v38;
  objc_super v39;
  _BYTE buf[24];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v39.receiver = self;
  v39.super_class = (Class)MFMailComposeController;
  v8 = -[MFMailComposeController initWithNibName:bundle:](&v39, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    v8->_resolution = 0;
    MFComposeLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9->_resolution);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v11;
      _os_log_impl(&dword_1AB96A000, v10, OS_LOG_TYPE_DEFAULT, "_resolution is set to %@ as MFMailComposeController is initialized.", buf, 0xCu);

    }
    v9->_sendingEmailAddressIndex = 0x7FFFFFFFFFFFFFFFLL;
    v9->_selectedContentVariationIndex = 0x7FFFFFFFFFFFFFFFLL;
    v9->_allowRestrictedAccounts = (a4 & 2) == 0;
    v12 = -[MFMailAccountProxyGenerator initWithAllowsRestrictedAccounts:]([MFMailAccountProxyGenerator alloc], "initWithAllowsRestrictedAccounts:", v9->_allowRestrictedAccounts);
    accountProxyGenerator = v9->_accountProxyGenerator;
    v9->_accountProxyGenerator = v12;

    objc_storeStrong((id *)&v9->_compositionContext, a3);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D460A8]), "initWithName:andDelegate:", CFSTR("MFMailComposeController_autosaveLock"), 0);
    autosaveLock = v9->_autosaveLock;
    v9->_autosaveLock = (MFLock *)v14;

    v9->_autosaveIsValid = 1;
    v9->_sourceAccountManagement = objc_msgSend(v7, "sourceAccountManagement");
    v16 = objc_alloc_init(MFMailSignatureController);
    signatureController = v9->_signatureController;
    v9->_signatureController = v16;

    v18 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    securityScopes = v9->_securityScopes;
    v9->_securityScopes = v18;

    v9->_options = a4;
    v9->_hideMyEmailMultipleRecipient = 0;
    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    drawingFileAttachments = v9->_drawingFileAttachments;
    v9->_drawingFileAttachments = v20;

    -[MFMailComposeController setHosted:](v9, "setHosted:", MFIsMobileMail() ^ 1);
    v9->_contentVisible = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v9, sel__accountsChanged_, CFSTR("MFMailComposeControllerShouldReloadAccounts"), 0);

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.mobilemail.autosave"), 17);
    v23 = objc_claimAutoreleasedReturnValue();
    autosaveQueue = v9->_autosaveQueue;
    v9->_autosaveQueue = (EFScheduler *)v23;

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.prepareImagesForSend"), 25);
    v25 = objc_claimAutoreleasedReturnValue();
    prepareImagesForSendScheduler = v9->_prepareImagesForSendScheduler;
    v9->_prepareImagesForSendScheduler = (EFScheduler *)v25;

    objc_msgSend(MEMORY[0x1E0D1F070], "serialDispatchQueueSchedulerWithName:qualityOfService:", CFSTR("com.apple.mobilemail.originalContentMessagesScheduler"), 25);
    v27 = objc_claimAutoreleasedReturnValue();
    originalContentMessagesScheduler = v9->_originalContentMessagesScheduler;
    v9->_originalContentMessagesScheduler = (EFScheduler *)v27;

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v9);
    v29 = objc_alloc(MEMORY[0x1E0D1EEA0]);
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __62__MFMailComposeController_initWithCompositionContext_options___block_invoke;
    v37[3] = &unk_1E5A67920;
    objc_copyWeak(&v38, (id *)buf);
    v31 = objc_msgSend(v29, "initWithTimeInterval:scheduler:startAfter:block:", v30, 1, v37, 0.25);
    inputContextHistoryInvalidationDebouncer = v9->_inputContextHistoryInvalidationDebouncer;
    v9->_inputContextHistoryInvalidationDebouncer = (EFDebouncer *)v31;

    -[MFMailComposeController mailComposeView](v9, "mailComposeView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setSending:", 0);

    v34 = (EMCoreAnalyticsCollector *)objc_alloc_init(MEMORY[0x1E0D1E138]);
    analyticsCollector = v9->_analyticsCollector;
    v9->_analyticsCollector = v34;

    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)buf);
  }

  return v9;
}

void __62__MFMailComposeController_initWithCompositionContext_options___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_invalidateInputContextHistoryDebounced:", 0);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  -[MFMailComposeController messageLoadingTailspinCancellable](self, "messageLoadingTailspinCancellable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[MFMailComposeController setMessageLoadingTailspinCancellable:](self, "setMessageLoadingTailspinCancellable:", 0);
  -[MFMailComposeController userActivity](self, "userActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  -[MFMailComposeController userActivity](self, "userActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[MFMailComposeController setUserActivity:](self, "setUserActivity:", 0);
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setComposeRecipientDelegate:", 0);
  objc_msgSend(v6, "setComposeViewDelegate:", 0);
  objc_msgSend(v6, "setPopoverOwner:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  -[MFSecureMIMECompositionManager invalidate](self->_secureCompositionManager, "invalidate");
  v8.receiver = self;
  v8.super_class = (Class)MFMailComposeController;
  -[MFMailComposeController dealloc](&v8, sel_dealloc);
}

- (id)mailComposeView
{
  void *v3;

  if (-[MFMailComposeController isViewLoaded](self, "isViewLoaded"))
  {
    -[MFMailComposeController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)sendButtonItem
{
  return self->_sendButtonItem;
}

- (void)setHosted:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_BYTE *)self + 1352) = *((_BYTE *)self + 1352) & 0xBF | v3;
}

- (BOOL)hosted
{
  return (*((unsigned __int8 *)self + 1352) >> 6) & 1;
}

- (void)setPeoplePicker:(id)a3
{
  CNContactPickerViewController **p_peoplePicker;
  CNContactPickerViewController *v5;

  p_peoplePicker = &self->_peoplePicker;
  v5 = (CNContactPickerViewController *)a3;
  if (*p_peoplePicker != v5)
  {
    -[CNContactPickerViewController setDelegate:](*p_peoplePicker, "setDelegate:", 0);
    objc_storeStrong((id *)p_peoplePicker, a3);
  }

}

- (void)dismissSheet
{
  void *v3;
  char v4;

  -[MFMailComposeController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mf_supportsPopoverPresentation");

  if ((v4 & 1) == 0)
  {
    -[UIAlertController dismissViewControllerAnimated:completion:](self->_popoverAlert, "dismissViewControllerAnimated:completion:", 0, 0);
    -[MFMailComposeController setPopoverAlert:](self, "setPopoverAlert:", 0);
  }
}

- (void)clearAllFields
{
  void *v3;
  void *v4;

  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetContentSize");

  *((_BYTE *)self + 1352) &= ~2u;
  -[MFMailComposeController composeWebView](self, "composeWebView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMarkupString:", CFSTR("<BR class=\"webkit-block-placeholder\">"));

  -[MFMailComposeController setAddresses:field:](self, "setAddresses:field:", 0, 1);
  -[MFMailComposeController setAddresses:field:](self, "setAddresses:field:", 0, 2);
  -[MFMailComposeController setAddresses:field:](self, "setAddresses:field:", 0, 3);
  -[MFMailComposeController setSubject:](self, "setSubject:", 0);
  -[MFMailComposeController setUseMailDrop:](self, "setUseMailDrop:", 0);
  self->_selectedContentVariationIndex = 0x7FFFFFFFFFFFFFFFLL;
}

- (void)setIsModal:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_isModal = a3;
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsForEditing:", v3);

}

- (int64_t)countofDrawingAttachmentsLeftInCompose
{
  return -[NSMutableSet count](self->_drawingFileAttachments, "count");
}

- (NSString)documentID
{
  NSString *documentID;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  void *v8;
  NSString *v9;
  NSString *v10;

  documentID = self->_documentID;
  if (!documentID)
  {
    -[MFMutableMessageHeaders firstHeaderForKey:](self->_savedHeaders, "firstHeaderForKey:", *MEMORY[0x1E0D1E638]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    v6 = v5;
    if (v5)
    {
      v7 = v5;
      v8 = self->_documentID;
      self->_documentID = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "ef_UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (NSString *)objc_msgSend(v8, "copy");
      v10 = self->_documentID;
      self->_documentID = v9;

    }
    documentID = self->_documentID;
  }
  return documentID;
}

- (void)setDisplayMetrics:(id)a3
{
  MFComposeDisplayMetrics *v5;

  v5 = (MFComposeDisplayMetrics *)a3;
  if (self->_displayMetrics != v5)
  {
    objc_storeStrong((id *)&self->_displayMetrics, a3);
    -[MFMailComposeController _displayMetricsDidChange](self, "_displayMetricsDidChange");
  }

}

- (id)navigationBarTitle
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)-[NSString copy](self->_initialTitle, "copy");
  if (!objc_msgSend(v3, "length"))
  {
    -[MFComposeSubjectView text](self->_subjectField, "text");
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  if (!objc_msgSend(v3, "length"))
  {
    switch(-[MFMailComposeController composeType](self, "composeType"))
    {
      case 0:
      case 7:
        if (objc_msgSend(MEMORY[0x1E0DC3708], "mf_isPad"))
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("NEW_MESSAGE_LONG"), &stru_1E5A6A588, CFSTR("Main"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("NEW_MESSAGE"), &stru_1E5A6A588, CFSTR("Main"));
        }
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 2:
      case 8:
      case 9:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DRAFT"), &stru_1E5A6A588, CFSTR("Main"));
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 4:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("REPLY"), &stru_1E5A6A588, CFSTR("Main"));
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 5:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("REPLY_ALL"), &stru_1E5A6A588, CFSTR("Main"));
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      case 6:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("FORWARD"), &stru_1E5A6A588, CFSTR("Main"));
        v6 = objc_claimAutoreleasedReturnValue();
LABEL_13:
        v7 = (void *)v6;

        v3 = v7;
        break;
      default:
        return v3;
    }
  }
  return v3;
}

- (void)setInitialTitle:(id)a3
{
  NSString *v4;
  NSString *initialTitle;
  NSString *v6;

  v6 = (NSString *)a3;
  if (self->_initialTitle != v6)
  {
    v4 = (NSString *)-[NSString copy](v6, "copy");
    initialTitle = self->_initialTitle;
    self->_initialTitle = v4;

    -[MFMailComposeController _updateNavigationBarTitleAnimated:](self, "_updateNavigationBarTitleAnimated:", 0);
  }

}

- (void)clearInitialTitle
{
  NSString *initialTitle;

  initialTitle = self->_initialTitle;
  self->_initialTitle = 0;

  -[MFMailComposeController _updateNavigationBarTitleAnimated:](self, "_updateNavigationBarTitleAnimated:", 1);
}

- (id)_alternateTitleView
{
  UIView *alternateTitleView;
  MFMailComposeNavigationBarTitleView *v4;
  UIView *v5;
  UIView *v6;

  alternateTitleView = self->_alternateTitleView;
  if (!alternateTitleView)
  {
    v4 = [MFMailComposeNavigationBarTitleView alloc];
    v5 = -[MFMailComposeNavigationBarTitleView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_alternateTitleView;
    self->_alternateTitleView = v5;

    alternateTitleView = self->_alternateTitleView;
  }
  return alternateTitleView;
}

- (void)_setTitleBarSubtitleText:(id)a3 style:(unint64_t)a4
{
  __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  CGRect v15;
  CGRect v16;

  v6 = (__CFString *)a3;
  -[MFMailComposeController _alternateTitleView](self, "_alternateTitleView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = &stru_1E5A6A588;
  if (v6)
    v8 = v6;
  v14 = v8;

  objc_msgSend(v7, "setSubtitle:withStyle:", v14, a4);
  -[MFMailComposeController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "titleView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 != v7)
  {
    -[MFMailComposeController _updateNavigationBarTitleAnimated:](self, "_updateNavigationBarTitleAnimated:", 0);
    -[MFMailComposeController navigationController](self, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "navigationBar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v16 = CGRectInset(v15, 0.0, 0.0);
    objc_msgSend(v7, "setFrame:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);

    -[MFMailComposeController navigationItem](self, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTitleView:", v7);

  }
}

- (void)_updateNavigationBarTitleAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  -[MFMailComposeController navigationBarTitle](self, "navigationBarTitle");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setTitle:animated:", v9, v3);

  -[UIView setTitle:](self->_alternateTitleView, "setTitle:", v9);
  -[MFMailComposeController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v8, "mf_resetPreferredTitle");

}

- (void)_setupLargeTitleAccessory
{
  void *v3;
  void *v4;
  void *v5;
  UIButton *v6;
  UIButton *sendAccessoryButton;
  void *v8;
  void *v9;
  id v10;

  -[MFMailComposeController navigationItem](self, "navigationItem");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController _alternateTitleView](self, "_alternateTitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitleView:", v3);

  objc_msgSend(v10, "_setLargeTitleTwoLineMode:", 2);
  if ((objc_msgSend(MEMORY[0x1E0DC3708], "mf_isSmallPhone") & 1) == 0)
  {
    -[MFMailComposeController navigationController](self, "navigationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "navigationBar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPrefersLargeTitles:", 1);

    objc_msgSend(v10, "setLargeTitleDisplayMode:", 1);
    +[MFComposeSendAccessoryButton buttonWithType:](MFComposeSendAccessoryButton, "buttonWithType:", 0);
    v6 = (UIButton *)objc_claimAutoreleasedReturnValue();
    sendAccessoryButton = self->_sendAccessoryButton;
    self->_sendAccessoryButton = v6;

    -[UIButton addTarget:action:forControlEvents:](self->_sendAccessoryButton, "addTarget:action:forControlEvents:", self, sel_send_, 64);
    -[MFMailComposeController sendLaterMenu](self, "sendLaterMenu");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setMenu:](self->_sendAccessoryButton, "setMenu:", v8);

    objc_msgSend(v10, "_setLargeTitleAccessoryView:alignToBaseline:", self->_sendAccessoryButton, 0);
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "configureWithOpaqueBackground");
    objc_msgSend(v9, "setShadowColor:", 0);
    objc_msgSend(v10, "setScrollEdgeAppearance:", v9);

  }
}

- (void)_setupForQuickReply
{
  char v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v6, "isQuickReply");

  if ((v3 & 1) != 0)
  {
    -[MFMailComposeController quickReplyActionButtonProvider](self, "quickReplyActionButtonProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "quickReplySendButton");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[MFMailComposeController sendLaterMenu](self, "sendLaterMenu");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMenu:", v5);

    objc_msgSend(v7, "setEnabled:", 0);
  }
}

- (void)_setupNavigationBarItems
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *sendButtonItem;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  UIBarButtonItem *v14;
  UIBarButtonItem *closeButtonItem;
  id v16;

  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SEND"), &stru_1E5A6A588, CFSTR("Main"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E5A6A588, CFSTR("Main"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v3, "initWithObjects:", v5, v7, 0);

  -[MFMailComposeController _createSendButtonItemWithPossibleTitles:](self, "_createSendButtonItemWithPossibleTitles:", v16);
  v8 = (UIBarButtonItem *)objc_claimAutoreleasedReturnValue();
  sendButtonItem = self->_sendButtonItem;
  self->_sendButtonItem = v8;

  -[MFMailComposeController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E5A6A588, CFSTR("Main"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (UIBarButtonItem *)objc_msgSend(v11, "initWithTitle:style:target:action:", v13, 0, self, sel_close_);
  closeButtonItem = self->_closeButtonItem;
  self->_closeButtonItem = v14;

  -[UIBarButtonItem setPossibleTitles:](self->_closeButtonItem, "setPossibleTitles:", v16);
  objc_msgSend(v10, "setRightBarButtonItem:", self->_sendButtonItem);
  -[UIBarButtonItem setAccessibilityIdentifier:](self->_closeButtonItem, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46B18]);
  objc_msgSend(v10, "setLeftBarButtonItem:", self->_closeButtonItem);

}

- (id)_createSendButtonItemWithPossibleTitles:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.circle.fill"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithImage:style:target:action:", v5, 0, self, sel_send_);
  objc_msgSend(v6, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46BD0]);
  objc_msgSend(MEMORY[0x1E0DC3870], "mf_largeContentSizeImageNamed:", CFSTR("arrow.up.circle.fill"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLargeContentSizeImage:", v7);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SEND"), &stru_1E5A6A588, CFSTR("Main"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v9);

  -[MFMailComposeController sendLaterMenu](self, "sendLaterMenu");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMenu:", v10);

  objc_msgSend(v6, "setPossibleTitles:", v4);
  return v6;
}

- (void)_setupSendLaterOnboardingPaletteIfNecessary
{
  void *v3;
  MFComposeSendLaterOnboardingView *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;

  if (-[MFMailComposeController _shouldShowSendLaterOnboarding](self, "_shouldShowSendLaterOnboarding"))
  {
    -[MFMailComposeController navigationItem](self, "navigationItem");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(MFComposeSendLaterOnboardingView);
    _EFLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.up.circle.badge.clock"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __70__MFMailComposeController__setupSendLaterOnboardingPaletteIfNecessary__block_invoke;
    v16[3] = &unk_1E5A67948;
    v8 = v3;
    v17 = v8;
    objc_msgSend(v6, "actionWithTitle:image:identifier:handler:", v5, v7, 0, v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[MFComposeSendLaterOnboardingView cancelButton](v4, "cancelButton");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:forControlEvents:", v9, 64);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC4290]), "initWithContentView:", v4);
    -[MFComposeSendLaterOnboardingView systemLayoutSizeFittingSize:](v4, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
    v13 = v12;
    objc_msgSend(v8, "_setBottomPalette:", v11);
    objc_msgSend(v8, "_bottomPalette");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPreferredHeight:", v13);

    objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setBool:forKey:", 1, *MEMORY[0x1E0D1E090]);

  }
}

uint64_t __70__MFMailComposeController__setupSendLaterOnboardingPaletteIfNecessary__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setBottomPalette:", 0);
}

- (BOOL)_shouldShowSendLaterOnboarding
{
  void *v2;
  char v3;
  BOOL v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v14[16];
  uint8_t buf[16];

  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", *MEMORY[0x1E0D1E090]);

  if ((v3 & 1) != 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "launchedToTest") & 1) != 0 || objc_msgSend(v5, "isRunningTest"))
  {
    MFLogGeneral();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AB96A000, v6, OS_LOG_TYPE_DEFAULT, "Onboarding not presented -- test is running", buf, 2u);
    }
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0C99D48]);
    v8 = (void *)objc_msgSend(v7, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTimeZone:", v9);

    objc_msgSend(v8, "dateBySettingHour:minute:second:ofDate:options:", 9, 0, 0, v6, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dateBySettingHour:minute:second:ofDate:options:", 17, 0, 0, v6, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[NSObject ef_isEarlierThanDate:](v6, "ef_isEarlierThanDate:", v10) & 1) != 0
      || (-[NSObject ef_isLaterThanDate:](v6, "ef_isLaterThanDate:", v11) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      MFLogGeneral();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1AB96A000, v12, OS_LOG_TYPE_DEFAULT, "Not showing send later onboarding tip. Time out of bounds", v14, 2u);
      }

      v4 = 0;
    }

  }
  return v4;
}

- (BOOL)shouldShowSMIMEButton
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if ((_os_feature_enabled_impl() & 1) != 0)
    return 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6B8]), "initWithString:", self->_sendingEmailAddress);
  objc_msgSend(v4, "simpleAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFMailComposeController accountProxyGenerator](self, "accountProxyGenerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountProxyContainingEmailAddress:includingInactive:originatingBundleID:sourceAccountManagement:", v5, 0, self->_originatingBundleID, self->_sourceAccountManagement);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mailAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_msgSend(v8, "perMessageEncryptionEnabledForAddress:", v5);
  return v3;
}

- (void)tappedSMIMEButton
{
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    self->_encryptionOverrideSetting ^= 1u;
    -[MFMailComposeController _resetSecureCompositionManager](self, "_resetSecureCompositionManager");
  }
}

- (void)_updateSMIMEButtonEnabledForRecipientCount
{
  if ((_os_feature_enabled_impl() & 1) == 0)
    -[MFMailComposeToField setSmimeButtonEnabled:](self->_toField, "setSmimeButtonEnabled:", -[MFMailComposeController _secureCompositionManagerHasRecipients](self, "_secureCompositionManagerHasRecipients"));
}

+ (BOOL)isSetupForDeliveryAllowingRestrictedAccounts:(BOOL)a3
{
  uint64_t v3;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(a1, "isSetupForDeliveryAllowingRestrictedAccounts:originatingBundleID:sourceAccountManagement:", v3, v6, 0);

  return v3;
}

+ (BOOL)isSetupForDeliveryAllowingRestrictedAccounts:(BOOL)a3 originatingBundleID:(id)a4 sourceAccountManagement:(int)a5
{
  uint64_t v5;
  _BOOL8 v6;
  id v7;
  MFMailAccountProxyGenerator *v8;
  void *v9;

  v5 = *(_QWORD *)&a5;
  v6 = a3;
  v7 = a4;
  v8 = -[MFMailAccountProxyGenerator initWithAllowsRestrictedAccounts:]([MFMailAccountProxyGenerator alloc], "initWithAllowsRestrictedAccounts:", v6);
  -[MFMailAccountProxyGenerator defaultMailAccountProxyForDeliveryOriginatingBundleID:sourceAccountManagement:](v8, "defaultMailAccountProxyForDeliveryOriginatingBundleID:sourceAccountManagement:", v7, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = v9 != 0;

  return v5;
}

- (BOOL)_isSetupForDelivery
{
  void *v2;
  BOOL v3;

  -[MFMailComposeController _defaultAccount](self, "_defaultAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_defaultAccount
{
  void *v3;
  void *v4;

  -[MFMailComposeController accountProxyGenerator](self, "accountProxyGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultMailAccountProxyForDeliveryOriginatingBundleID:sourceAccountManagement:", self->_originatingBundleID, self->_sourceAccountManagement);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)preferenceForKey:(id)a3
{
  objc_msgSend(MEMORY[0x1E0D46AB8], "valueForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_accountsChanged:(id)a3
{
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__MFMailComposeController__accountsChanged___block_invoke;
  v4[3] = &unk_1E5A65480;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSyncBlock:", v4);

}

void __44__MFMailComposeController__accountsChanged___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  _DWORD v19[4];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "mailComposeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v2, "_resetProxyGenerator");
  objc_msgSend(*(id *)(a1 + 32), "emailAddresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "hideMyEmailAddressIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "hideMyEmailAddressIfExists");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v8;
  }
  objc_msgSend(v3, "fromField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAvailableAddresses:", v4);

  objc_msgSend(*(id *)(a1 + 32), "sendingEmailAddressIfExists");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emailAddressValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "simpleAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(v10, "stringValue");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  v16 = objc_msgSend(v4, "containsObject:", v15);
  if ((v16 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_setSendingEmailAddress:", 0);
  objc_msgSend(v3, "composeWebView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "updateInputAssistantItem");

  objc_msgSend(*(id *)(a1 + 32), "_resetSecureCompositionManager");
  MFLogGeneral();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19[0] = 67109120;
    v19[1] = v16;
    _os_log_impl(&dword_1AB96A000, v18, OS_LOG_TYPE_DEFAULT, "#CompositionServices Accounts changed. originalAddressIsAvailable: %d", (uint8_t *)v19, 8u);
  }

}

- (id)emailAddresses
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[MFMailComposeController _availableAccountProxies](self, "_availableAccountProxies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v24;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v7);
        v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v10 = (void *)MEMORY[0x1E0D1E6B8];
        objc_msgSend(v8, "fromEmailAddresses");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "emailAddressesFromStrings:invalidAddresses:", v11, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v13)
        {
          v14 = *(_QWORD *)v20;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v20 != v14)
                objc_enumerationMutation(v12);
              objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "simpleAddress");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v16);

              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          }
          while (v13);
        }

        objc_msgSend(v3, "addObjectsFromArray:", v9);
        ++v7;
      }
      while (v7 != v5);
      v4 = obj;
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)_emailAddressesWithHME
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[MFMailComposeController emailAddresses](self, "emailAddresses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("HIDE_MY_EMAIL_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_availableAccountProxies
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (!self->_primaryAddressForForcedSendingAccount)
    goto LABEL_4;
  -[MFMailComposeController accountProxyGenerator](self, "accountProxyGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountProxyContainingEmailAddress:includingInactive:originatingBundleID:sourceAccountManagement:", self->_primaryAddressForForcedSendingAccount, 0, self->_originatingBundleID, self->_sourceAccountManagement);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    || (v8[0] = v4,
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
LABEL_4:
    -[MFMailComposeController accountProxyGenerator](self, "accountProxyGenerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeAccountProxiesOriginatingBundleID:sourceAccountManagement:", self->_originatingBundleID, self->_sourceAccountManagement);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)_resetProxyGenerator
{
  MFMailAccountProxyGenerator *v3;

  v3 = -[MFMailAccountProxyGenerator initWithAllowsRestrictedAccounts:]([MFMailAccountProxyGenerator alloc], "initWithAllowsRestrictedAccounts:", self->_allowRestrictedAccounts);
  -[MFMailComposeController setAccountProxyGenerator:](self, "setAccountProxyGenerator:");

}

- (unint64_t)_reloadNumberOfReformattedAddressesWithMaximumWidth:(double)a3 defaultFontSize:(double)a4
{
  MFAddressPickerReformatter *addressPickerReformatter;
  MFAddressPickerReformatter *v9;
  MFAddressPickerReformatter *v10;
  void *v11;
  void *v13;

  if (pthread_main_np() != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailComposeController.m"), 1185, CFSTR("Current thread must be main"));

  }
  addressPickerReformatter = self->_addressPickerReformatter;
  if (!addressPickerReformatter)
  {
    v9 = objc_alloc_init(MFAddressPickerReformatter);
    v10 = self->_addressPickerReformatter;
    self->_addressPickerReformatter = v9;

    addressPickerReformatter = self->_addressPickerReformatter;
  }
  -[MFMailComposeController emailAddresses](self, "emailAddresses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAddressPickerReformatter setAddresses:](addressPickerReformatter, "setAddresses:", v11);

  -[MFAddressPickerReformatter setMaximumWidth:](self->_addressPickerReformatter, "setMaximumWidth:", a3);
  -[MFAddressPickerReformatter setMinimumFontSize:maximumFontSize:](self->_addressPickerReformatter, "setMinimumFontSize:maximumFontSize:", 15.0, a4);
  return -[MFAddressPickerReformatter numberOfReformattedAddresses](self->_addressPickerReformatter, "numberOfReformattedAddresses");
}

- (id)_reformattedAddressAtIndex:(unint64_t)a3
{
  return -[MFAddressPickerReformatter reformattedAddressAtIndex:](self->_addressPickerReformatter, "reformattedAddressAtIndex:", a3);
}

- (int64_t)composeType
{
  return -[_MFMailCompositionContext composeType](self->_compositionContext, "composeType");
}

- (BOOL)_isRestoredComposition
{
  unint64_t v2;

  v2 = -[MFMailComposeController composeType](self, "composeType");
  return (v2 < 0xA) & (0x38Cu >> v2);
}

- (BOOL)_isReplyOrForward
{
  return (unint64_t)(-[MFMailComposeController composeType](self, "composeType") - 4) < 3;
}

- (void)setCompositionContext:(id)a3
{
  _MFMailCompositionContext *compositionContext;
  _BOOL4 v6;
  _MFMailCompositionContext *v7;

  v7 = (_MFMailCompositionContext *)a3;
  compositionContext = self->_compositionContext;
  if (compositionContext)
    v6 = -[_MFMailCompositionContext composeType](compositionContext, "composeType") != 1;
  else
    v6 = 0;
  -[_MFMailCompositionContext setDelegate:](v7, "setDelegate:", self);
  if (self->_compositionContext != v7)
  {
    objc_storeStrong((id *)&self->_compositionContext, a3);
    -[MFMailComposeController setAutosaveIdentifier:](self, "setAutosaveIdentifier:", 0);
    -[MFMailComposeController setAutosaveSession:](self, "setAutosaveSession:", 0);
  }
  if (self->_progressIndicatorView)
    -[MFMailComposeController setProgressUIVisible:animated:](self, "setProgressUIVisible:animated:", 0, 1);
  if (v6)
    -[MFMailComposeController clearAllFields](self, "clearAllFields");
  -[MFMailComposeController _loadCompositionContext](self, "_loadCompositionContext");

}

- (void)_prepareCompositionContextForLoading:(id)a3
{
  unint64_t v3;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  v3 = objc_msgSend(v8, "composeType");
  if (v3 <= 9 && ((1 << v3) & 0x38C) != 0)
  {
    objc_msgSend(v8, "loadingContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "legacyMessage");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (!v5 && v6)
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D5A0]), "initWithMessage:attachmentManager:", v6, 0);
      objc_msgSend(v8, "setLoadingContext:", v5);
      objc_msgSend(v8, "setLoadRest:", 1);
      objc_msgSend(v8, "setIncludeAttachments:", 1);
    }

  }
}

- (void)_loadCompositionContext
{
  _MFMailCompositionContext *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  char v11;
  void *v12;
  NSString *v13;
  NSString *originatingBundleID;
  unint64_t v15;
  BOOL v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  unint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  os_signpost_id_t v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _BOOL4 v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  _MFMailCompositionContext *v56;
  id v57;
  _QWORD v58[4];
  id v59[2];
  id from;
  _QWORD v61[5];
  id v62;
  _QWORD v63[4];
  id v64;
  id location;
  void *v66;
  uint8_t buf[4];
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v3 = self->_compositionContext;
  -[_MFMailCompositionContext setDelegate:](v3, "setDelegate:", self);
  -[_MFMailCompositionContext originalMessage](v3, "originalMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController _originalContentOfMessagesInReplyToMessage:](self, "_originalContentOfMessagesInReplyToMessage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController setOriginalContentMessagesFuture:](self, "setOriginalContentMessagesFuture:", v5);

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[MFMailComposeController originalContentMessagesFuture](self, "originalContentMessagesFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v63[2] = __50__MFMailComposeController__loadCompositionContext__block_invoke;
  v63[3] = &unk_1E5A67970;
  objc_copyWeak(&v64, &location);
  objc_msgSend(v6, "onScheduler:addSuccessBlock:", v7, v63);

  if (self->_selectedContentVariationIndex == 0x7FFFFFFFFFFFFFFFLL)
    self->_selectedContentVariationIndex = -[_MFMailCompositionContext defaultContentVariationIndex](v3, "defaultContentVariationIndex");
  -[MFMailComposeController _prepareCompositionContextForLoading:](self, "_prepareCompositionContextForLoading:", v3);
  -[_MFMailCompositionContext legacyMessage](v3, "legacyMessage");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_MFMailCompositionContext loadRest](v3, "loadRest");
  v50 = -[_MFMailCompositionContext includeAttachments](v3, "includeAttachments")
     || -[_MFMailCompositionContext includeAttachmentsWhenAdding](v3, "includeAttachmentsWhenAdding");
  v49 = -[_MFMailCompositionContext isLoadingMessageData](v3, "isLoadingMessageData");
  v9 = v53 != 0;
  if (v53)
    v10 = v8;
  else
    v10 = 1;
  if (!v10)
    v9 = v50 | v49;
  if (v9)
    v11 = 32;
  else
    v11 = 0;
  *((_BYTE *)self + 1352) = *((_BYTE *)self + 1352) & 0xDF | v11;
  self->_initialAttachmentCount = 0;
  -[_MFMailCompositionContext originatingBundleID](self->_compositionContext, "originatingBundleID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (NSString *)objc_msgSend(v12, "copy");
  originatingBundleID = self->_originatingBundleID;
  self->_originatingBundleID = v13;

  self->_sourceAccountManagement = -[_MFMailCompositionContext sourceAccountManagement](v3, "sourceAccountManagement");
  -[MFMailComposeController _resetProxyGenerator](self, "_resetProxyGenerator");
  v15 = -[_MFMailCompositionContext composeType](v3, "composeType");
  -[MFMailComposeController setContentVisible:](self, "setContentVisible:", -[_MFMailCompositionContext showContentImmediately](v3, "showContentImmediately"));
  v16 = 0;
  switch(v15)
  {
    case 0uLL:
      goto LABEL_20;
    case 2uLL:
      goto LABEL_52;
    case 3uLL:
      if (v53)
        -[MFMailComposeController _setupForOutbox:](self, "_setupForOutbox:");
      goto LABEL_23;
    case 4uLL:
    case 5uLL:
    case 6uLL:
      +[MFComposeTypeFactory setupWithCompositionModel:delegate:](MFComposeTypeFactory, "setupWithCompositionModel:delegate:", v3, self);
      goto LABEL_23;
    case 7uLL:
      if (v53)
      {
        -[MFMailComposeController _setupForAutosavedMessage:](self, "_setupForAutosavedMessage:", v53);
        v16 = 1;
      }
      else
      {
LABEL_20:
        +[MFComposeTypeFactory setupWithCompositionModel:delegate:](MFComposeTypeFactory, "setupWithCompositionModel:delegate:", v3, self);
        -[_MFMailCompositionContext messageBody](self->_compositionContext, "messageBody");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "length"))
        {
          v16 = 1;
        }
        else
        {
          -[_MFMailCompositionContext subject](self->_compositionContext, "subject");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v44, "length"))
          {
            v16 = 1;
          }
          else
          {
            -[_MFMailCompositionContext toRecipients](self->_compositionContext, "toRecipients");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v45, "count"))
            {
              v16 = 1;
            }
            else
            {
              -[_MFMailCompositionContext ccRecipients](self->_compositionContext, "ccRecipients");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v52, "count"))
              {
                v16 = 1;
              }
              else
              {
                -[MFMailComposeController attachments](self, "attachments");
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = objc_msgSend(v48, "count") != 0;

              }
            }

          }
        }

LABEL_65:
        if (!v15)
        {
          -[_MFMailCompositionContext messageBody](self->_compositionContext, "messageBody");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *((_BYTE *)self + 1352) = *((_BYTE *)self + 1352) & 0xFD | (2 * (objc_msgSend(v46, "length") != 0));

          goto LABEL_26;
        }
        if (v15 == 1)
          goto LABEL_26;
      }
LABEL_24:
      -[MFMailComposeController mailComposeView](self, "mailComposeView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isQuickReply");

      if ((v19 & 1) == 0)
        *((_BYTE *)self + 1352) |= 2u;
LABEL_26:
      if ((*((_BYTE *)self + 1352) & 2) != 0)
        -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");
      -[MFMailComposeController _checkForReplyAndForwardRestriction](self, "_checkForReplyAndForwardRestriction");
      if (v53)
      {
        if (v15 == 1)
          goto LABEL_35;
        goto LABEL_30;
      }
      if (v15 > 9 || ((1 << v15) & 0x286) == 0)
LABEL_30:
        -[MFMailComposeController _updateOriginalBccStatusForRestoreAddingAddress:](self, "_updateOriginalBccStatusForRestoreAddingAddress:", -[MFMailComposeController _isRestoredComposition](self, "_isRestoredComposition") ^ 1);
      if (v15 - 4 <= 2)
        -[MFComposeSubjectView setNotifyOptionSelected:](self->_subjectField, "setNotifyOptionSelected:", objc_msgSend(v53, "conversationFlags") & 1);
LABEL_35:
      -[MFMailComposeController mailComposeView](self, "mailComposeView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "webContentVariationField");
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      -[_MFMailCompositionContext contentVariations](v3, "contentVariations");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "ef_map:", &__block_literal_global_20);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = -[MFMailComposeController contentVariationIndex](self, "contentVariationIndex");
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __50__MFMailComposeController__loadCompositionContext__block_invoke_3;
      v61[3] = &unk_1E5A66980;
      v61[4] = self;
      v23 = v47;
      v62 = v23;
      objc_msgSend(v23, "setupMenuItemTitles:currentSelection:handler:", v51, v22, v61);
      *((_BYTE *)self + 1352) = *((_BYTE *)self + 1352) & 0xFE | v16;
      -[MFComposeWebView setDirty:](self->_composeWebView, "setDirty:", 0);
      if ((*((_BYTE *)self + 1352) & 0x20) != 0)
      {
        -[MFMailComposeController messageLoadingTailspinCancellable](self, "messageLoadingTailspinCancellable");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "cancel");

        from = (id)0xAAAAAAAAAAAAAAAALL;
        objc_initWeak(&from, self);
        v25 = (void *)(-[MFMailComposeController currentlyLoadingCounter](self, "currentlyLoadingCounter") + 1);
        -[MFMailComposeController setCurrentlyLoadingCounter:](self, "setCurrentlyLoadingCounter:", v25);
        objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __50__MFMailComposeController__loadCompositionContext__block_invoke_4;
        v58[3] = &unk_1E5A679B8;
        objc_copyWeak(v59, &from);
        v59[1] = v25;
        objc_msgSend(v26, "afterDelay:performBlock:", v58, 1.5);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFMailComposeController setMessageLoadingTailspinCancellable:](self, "setMessageLoadingTailspinCancellable:", v27);

        -[MFMailComposeController _setIsLoading:](self, "_setIsLoading:", 1);
        if (v8)
        {
          -[_MFMailCompositionContext loadingContext](v3, "loadingContext");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          MFComposeLog();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v68 = v28;
            _os_log_impl(&dword_1AB96A000, v29, OS_LOG_TYPE_DEFAULT, "Issuing loading request for context context %p", buf, 0xCu);
          }

          MFMessageComposeLoadingSignpostLog();
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = -[_MFMailCompositionContext signpostID](v3, "signpostID");
          if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1AB96A000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v31, "LOAD COMPOSE MESSAGE BODY", "Start loading message body enableTelemetry=YES ", buf, 2u);
          }

          objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v54[0] = MEMORY[0x1E0C809B0];
          v54[1] = 3221225472;
          v54[2] = __50__MFMailComposeController__loadCompositionContext__block_invoke_212;
          v54[3] = &unk_1E5A679E0;
          objc_copyWeak(&v57, &from);
          v33 = v28;
          v55 = v33;
          v56 = v3;
          v34 = (id)objc_msgSend(v33, "onScheduler:addLoadObserver:", v32, v54);

          objc_msgSend(v33, "load:", 2);
          objc_destroyWeak(&v57);

        }
        else if (((v50 ^ 1 | v49) & 1) == 0)
        {
          -[MFMailComposeController _loadAttachments](self, "_loadAttachments");
        }
        objc_destroyWeak(v59);
        objc_destroyWeak(&from);
      }
      else
      {
        -[MFMailComposeController _setIsLoading:](self, "_setIsLoading:", 0);
      }
      -[MFMailComposeController mailComposeView](self, "mailComposeView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMailComposeController pickInitialFirstResponder](self, "pickInitialFirstResponder");
      if (-[_MFMailCompositionContext showKeyboardImmediately](self->_compositionContext, "showKeyboardImmediately")
        && (objc_msgSend(v35, "isKeyboardVisible") & 1) == 0)
      {
        objc_msgSend(v35, "setKeyboardVisible:animate:", 1, 1);
      }
      -[MFMailComposeController _updateNavigationBarTitleAnimated:](self, "_updateNavigationBarTitleAnimated:", 0);
      -[MFMailComposeController attachments](self, "attachments");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      self->_initialAttachmentCount = objc_msgSend(v36, "count");

      -[MFMailComposeController emailAddresses](self, "emailAddresses");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "fromField");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setAvailableAddresses:", v37);

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("HIDE_MY_EMAIL_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v40;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "fromField");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setDeferredAddresses:", v41);

      -[MFMailComposeController _updateImageSizeTitles](self, "_updateImageSizeTitles");
      -[MFMailComposeController mailComposeView](self, "mailComposeView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setNeedsLayout");

      objc_destroyWeak(&v64);
      objc_destroyWeak(&location);

      return;
    case 8uLL:
      -[MFMailComposeController _setupForExistingNewMessage:content:](self, "_setupForExistingNewMessage:content:", v53, 0);
LABEL_23:
      v16 = 0;
      goto LABEL_24;
    case 9uLL:
      v16 = 1;
LABEL_52:
      if (v53)
        -[MFMailComposeController _setupForDraft:](self, "_setupForDraft:");
      goto LABEL_24;
    default:
      goto LABEL_65;
  }
}

void __50__MFMailComposeController__loadCompositionContext__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_invalidateInputContextHistoryDebounced:", 1);

}

id __50__MFMailComposeController__loadCompositionContext__block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "name");
  return (id)objc_claimAutoreleasedReturnValue();
}

void __50__MFMailComposeController__loadCompositionContext__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v3, "setNumberStyle:", 0);
  objc_msgSend(v9, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberFromString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1376) = objc_msgSend(v5, "unsignedIntValue");

  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "contentVariationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelectedContentVariationLabel:", v7);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1200), "setMarkupString:", CFSTR("<BR class=\"webkit-block-placeholder\">"));
  objc_msgSend(*(id *)(a1 + 32), "sendingEmailAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "setPreferredSendingEmailAddress:", v8);

  +[MFComposeTypeFactory setupWithCompositionModel:delegate:](MFComposeTypeFactory, "setupWithCompositionModel:delegate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 976));
}

void __50__MFMailComposeController__loadCompositionContext__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "currentlyLoadingCounter") == *(_QWORD *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Compose contents didn't load within %.1fs"), 0x3FF8000000000000);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      EFSaveTailspin();

    }
    else
    {
      MFComposeLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = objc_msgSend(v3, "currentlyLoadingCounter");
        v7 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 134218240;
        v9 = v6;
        v10 = 2048;
        v11 = v7;
        _os_log_impl(&dword_1AB96A000, v5, OS_LOG_TYPE_DEFAULT, "Skip save tailspin, counter doesn't match (%ld != %ld)", buf, 0x16u);
      }

    }
  }

}

void __50__MFMailComposeController__loadCompositionContext__block_invoke_212(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  MFComposeLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v7 = 134217984;
    v8 = v4;
    _os_log_impl(&dword_1AB96A000, v3, OS_LOG_TYPE_DEFAULT, "Loading context complete for context %p", (uint8_t *)&v7, 0xCu);
  }

  MFMessageComposeLoadingSignpostLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    LOWORD(v7) = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v5, OS_SIGNPOST_INTERVAL_END, v6, "LOAD COMPOSE MESSAGE BODY", "Finish loading message body enableTelemetry=YES ", (uint8_t *)&v7, 2u);
  }

  objc_msgSend(WeakRetained, "_loadingContextDidLoadMessage");
}

- (void)_checkForReplyAndForwardRestriction
{
  BOOL v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *v8;
  NSString *primaryAddressForForcedSendingAccount;
  NSString *sendingEmailAddress;
  void *v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  BOOL v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (-[MFMailComposeController _isReplyOrForward](self, "_isReplyOrForward")
    || -[_MFMailCompositionContext originatingFromAttachmentMarkup](self->_compositionContext, "originatingFromAttachmentMarkup"))
  {
    v3 = 0;
  }
  else
  {
    if (!-[MFMailComposeController _isRestoredComposition](self, "_isRestoredComposition"))
    {
      v4 = self->_sendingEmailAddress;
      goto LABEL_13;
    }
    -[MFMailComposeController savedHeaders](self, "savedHeaders");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "references");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");
    v14 = v13 != 0;

    if (v13)
    {
      v14 = 1;
    }
    else
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v15 = (void *)_HeaderKeysForForwardsAndReplies_sHeaderKeys;
      if (!_HeaderKeysForForwardsAndReplies_sHeaderKeys)
      {
        v16 = objc_alloc(MEMORY[0x1E0C99D20]);
        v17 = objc_msgSend(v16, "initWithObjects:", *MEMORY[0x1E0D1E588], 0);
        v18 = (void *)_HeaderKeysForForwardsAndReplies_sHeaderKeys;
        _HeaderKeysForForwardsAndReplies_sHeaderKeys = v17;

        v15 = (void *)_HeaderKeysForForwardsAndReplies_sHeaderKeys;
      }
      v19 = v15;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v26;
        while (2)
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v26 != v21)
              objc_enumerationMutation(v19);
            objc_msgSend(v11, "firstHeaderForKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v23 == 0;

            if (!v24)
            {
              v14 = 1;
              goto LABEL_27;
            }
          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
          if (v20)
            continue;
          break;
        }
      }
      else
      {
        v14 = 0;
      }
LABEL_27:

    }
    v3 = !v14;
  }
  v4 = self->_sendingEmailAddress;
  if (v4 && !v3)
  {
    -[MFMailComposeController accountProxyGenerator](self, "accountProxyGenerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountProxyContainingEmailAddress:includingInactive:originatingBundleID:sourceAccountManagement:", v4, 0, self->_originatingBundleID, self->_sourceAccountManagement);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "restrictsRepliesAndForwards"))
    {
      objc_msgSend(v6, "firstEmailAddress");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (NSString *)objc_msgSend(v7, "copy");
      primaryAddressForForcedSendingAccount = self->_primaryAddressForForcedSendingAccount;
      self->_primaryAddressForForcedSendingAccount = v8;

      sendingEmailAddress = self->_sendingEmailAddress;
      self->_sendingEmailAddress = 0;

      -[MFMailComposeController setSendingEmailAddress:](self, "setSendingEmailAddress:", v4);
    }

  }
LABEL_13:
  -[MFMailComposeController _updateManagedPasteboardOwner](self, "_updateManagedPasteboardOwner");

}

- (id)compositionContext
{
  return self->_compositionContext;
}

- (void)_setupForDraft:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MFMailComposeController _setupForExistingNewMessage:content:](self, "_setupForExistingNewMessage:content:");
  -[MFMailComposeController compositionContext](self, "compositionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "originalMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController setDraftMessage:](self, "setDraftMessage:", v5);

  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAnimationDisabled:", 1);

}

- (void)_setupForOutbox:(id)a3
{
  id v4;
  dispatch_time_t v5;
  NSObject *v6;
  _QWORD block[5];

  v4 = a3;
  v5 = dispatch_time(0, 500000000);
  dispatch_get_global_queue(-2, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MFMailComposeController__setupForOutbox___block_invoke;
  block[3] = &unk_1E5A65480;
  block[4] = self;
  dispatch_after(v5, v6, block);

  -[MFMailComposeController _setupForDraft:](self, "_setupForDraft:", v4);
}

void __43__MFMailComposeController__setupForOutbox___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "originalMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D1E288]);
    v10[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithMessageListItems:origin:actor:specialDestinationMailboxType:flagChange:copyMessages:", v4, 4, 1, 3, 0, 0);

    objc_msgSend(v2, "repository");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "performMessageChangeActionReturningUndoAction:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 1480);
    *(_QWORD *)(v8 + 1480) = v7;

  }
}

- (void)_setupForAutosavedMessage:(id)a3
{
  -[MFMailComposeController _setupForExistingNewMessage:content:](self, "_setupForExistingNewMessage:content:", a3, 0);
}

- (void)_setupForExistingNewMessage:(id)a3 content:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t m;
  void *v35;
  void *v36;
  MFMutableMessageHeaders *savedHeaders;
  MFMutableMessageHeaders *v38;
  MFMutableMessageHeaders *v39;
  void *v40;
  int64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  NSString *v49;
  NSString *documentID;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v52 = a4;
  v54 = v5;
  objc_msgSend(v5, "headersIfAvailable");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v7 = (void *)objc_msgSend(v56, "copyAddressListForTo");
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v70 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
    }
    while (v8);
  }

  v11 = (void *)objc_msgSend(v6, "copy");
  if (objc_msgSend(v11, "count"))
    -[MFMailComposeController setToRecipients:](self, "setToRecipients:", v11);
  objc_msgSend(v6, "removeAllObjects");
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v12 = (void *)objc_msgSend(v56, "copyAddressListForCc");
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v66 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
    }
    while (v13);
  }

  v16 = (void *)objc_msgSend(v6, "copy");
  v17 = v16;
  if (objc_msgSend(v16, "count"))
    -[MFMailComposeController setCcRecipients:](self, "setCcRecipients:", v16);
  objc_msgSend(v6, "removeAllObjects");
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v18 = (void *)objc_msgSend(v56, "copyAddressListForBcc");
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v62;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v62 != v20)
          objc_enumerationMutation(v18);
        objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * k));
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
    }
    while (v19);
  }

  v53 = (void *)objc_msgSend(v6, "copy");
  if (objc_msgSend(v53, "count"))
    -[MFMailComposeController setBccRecipients:](self, "setBccRecipients:");
  objc_msgSend(v56, "firstHeaderForKey:", *MEMORY[0x1E0D1E578]);
  v22 = objc_claimAutoreleasedReturnValue();
  v51 = (void *)v22;
  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0D1E7B8], "tagValueListFromString:error:", v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D1DC30]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0D1DC48]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "BOOLValue");

    if (v24)
    {
      v27 = v24;
      -[MFMailComposeController _setSendingEmailAddressAsHME:](self, "_setSendingEmailAddressAsHME:", v27);
      -[MFMailComposeController mailComposeView](self, "mailComposeView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setReplyToHME:", v26);

      goto LABEL_36;
    }

  }
  objc_msgSend(v56, "firstSenderAddress", v22);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
    objc_msgSend(v54, "account");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "firstEmailAddress");
    v27 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v27, "length"))
    -[MFMailComposeController setSendingEmailAddress:](self, "setSendingEmailAddress:", v27);
LABEL_36:
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  objc_msgSend(v56, "allHeaderKeys");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v58;
    v33 = *MEMORY[0x1E0D1E5F8];
    do
    {
      for (m = 0; m != v31; ++m)
      {
        if (*(_QWORD *)v58 != v32)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * m);
        objc_msgSend(v56, "firstHeaderForKey:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          if (objc_msgSend(v35, "caseInsensitiveCompare:", v33))
          {
            if (objc_msgSend(MEMORY[0x1E0D460C8], "shouldDecodeHeaderForKey:", v35))
            {
              savedHeaders = self->_savedHeaders;
              if (!savedHeaders)
              {
                v38 = (MFMutableMessageHeaders *)objc_alloc_init(MEMORY[0x1E0D46110]);
                v39 = self->_savedHeaders;
                self->_savedHeaders = v38;

                savedHeaders = self->_savedHeaders;
              }
              -[MFMutableMessageHeaders setHeader:forKey:](savedHeaders, "setHeader:forKey:", v36, v35);
            }
          }
          else
          {
            -[MFMailComposeController setSubject:](self, "setSubject:", v36);
          }
        }

      }
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v57, v73, 16);
    }
    while (v31);
  }

  if ((*((_BYTE *)self + 1352) & 0x20) == 0)
  {
    if (v52
      || (objc_msgSend(v54, "messageBodyIfAvailable"),
          v40 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v40, "htmlContent"),
          v52 = (id)objc_claimAutoreleasedReturnValue(),
          v40,
          v52))
    {
      v41 = -[MFMailComposeController composeType](self, "composeType");
      if (v41 == 9)
      {
        -[MFMailComposeController composeWebView](self, "composeWebView");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setMarkupString:", CFSTR("<BR class=\"webkit-block-placeholder\">"));

      }
      +[MFComposeTypeFactory setupWithContent:delegate:signpostID:](MFComposeTypeFactory, "setupWithContent:delegate:signpostID:", v52, self, -[_MFMailCompositionContext signpostID](self->_compositionContext, "signpostID"));
      if (v41 == 9)
        -[MFMailComposeController updateSignature](self, "updateSignature");
    }
    else
    {
      v52 = 0;
    }
  }
  -[MFMutableMessageHeaders firstHeaderForKey:](self->_savedHeaders, "firstHeaderForKey:", *MEMORY[0x1E0D1E630]);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v43)
  {
    self->_encryptionOverrideSetting = objc_msgSend(v43, "BOOLValue");
    -[MFMailComposeController _resetSecureCompositionManager](self, "_resetSecureCompositionManager");
  }
  -[MFMutableMessageHeaders firstHeaderForKey:](self->_savedHeaders, "firstHeaderForKey:", *MEMORY[0x1E0D1E620]);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v45;
  if (v45)
    -[MFComposeSubjectView setNotifyOptionSelected:](self->_subjectField, "setNotifyOptionSelected:", objc_msgSend(v45, "BOOLValue"));
  objc_msgSend(v54, "documentID");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_msgSend(v54, "documentID");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "UUIDString");
    v49 = (NSString *)objc_claimAutoreleasedReturnValue();
    documentID = self->_documentID;
    self->_documentID = v49;

  }
}

- (void)_finishedLoadingAllContentAndAttachments
{
  unint64_t v3;
  void *v4;
  void *v5;
  id v6;

  -[MFMailComposeController _setIsLoading:](self, "_setIsLoading:", 0);
  *((_BYTE *)self + 1352) &= ~0x20u;
  v3 = -[MFMailComposeController composeType](self, "composeType");
  -[_MFMailCompositionContext legacyMessage](self->_compositionContext, "legacyMessage");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_MFMailCompositionContext originalContent](self->_compositionContext, "originalContent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 > 9)
    goto LABEL_7;
  if (((1 << v3) & 0x30C) != 0)
  {
    -[MFMailComposeController _setupForExistingNewMessage:content:](self, "_setupForExistingNewMessage:content:", v6, v4);
    if (v3 == 9)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (v3 != 7)
  {
LABEL_7:
    +[MFComposeTypeFactory setupWithCompositionModel:delegate:](MFComposeTypeFactory, "setupWithCompositionModel:delegate:", self->_compositionContext, self);
    -[MFComposeWebView setDirty:](self->_composeWebView, "setDirty:", 0);
LABEL_8:
    *((_BYTE *)self + 1352) &= ~1u;
    goto LABEL_9;
  }
  -[MFMailComposeController _setupForExistingNewMessage:content:](self, "_setupForExistingNewMessage:content:", v6, v4);
LABEL_9:
  -[MFMailComposeController pickInitialFirstResponder](self, "pickInitialFirstResponder");
  -[MFMailComposeController messageLoadingTailspinCancellable](self, "messageLoadingTailspinCancellable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");

  -[MFMailComposeController setMessageLoadingTailspinCancellable:](self, "setMessageLoadingTailspinCancellable:", 0);
  -[MFMailComposeController _invalidateInputContextHistory](self, "_invalidateInputContextHistory");

}

- (void)_loadAttachments
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_1AB96A000, v0, v1, "#Attachments Cannot load attachments yet, legacy message is missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __43__MFMailComposeController__loadAttachments__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v5[16];

  objc_msgSend(*(id *)(a1 + 32), "_attachmentLoaderFinishedWithOriginalContent:", a2);
  MFMessageComposeLoadingSignpostLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "signpostID");
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v3, OS_SIGNPOST_INTERVAL_END, v4, "LOAD COMPOSE ATTACHMENTS", "Finish loading attachments enableTelemetry=YES ", v5, 2u);
  }

}

- (void)_attachmentLoaderFinishedWithOriginalContent:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_MFMailCompositionContext setOriginalContent:](self->_compositionContext, "setOriginalContent:");
  -[MFMailComposeController _finishedLoadingAllContentAndAttachments](self, "_finishedLoadingAllContentAndAttachments");
  -[_MFMailCompositionContext deferredAttachments](self->_compositionContext, "deferredAttachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

}

- (void)_loadingContextDidLoadMessage
{
  if (-[_MFMailCompositionContext includeAttachments](self->_compositionContext, "includeAttachments"))
    -[MFMailComposeController _loadAttachments](self, "_loadAttachments");
  else
    -[MFMailComposeController _finishedLoadingAllContentAndAttachments](self, "_finishedLoadingAllContentAndAttachments");
}

- (BOOL)_shouldPrependBlankLineForAttachments
{
  return -[_MFMailCompositionContext composeType](self->_compositionContext, "composeType") == 0;
}

- (void)pickInitialFirstResponder
{
  char v3;
  MFMailComposeController *v4;
  id *p_savedFirstResponder;
  id WeakRetained;
  MFMailComposeController *v7;
  void *v8;
  uint64_t v9;
  MFComposeSubjectView *v10;
  MFMailComposeToField *v11;
  MFMailComposeToField *v12;
  void *v13;
  uint64_t v14;
  MFMailComposeToField *v15;
  void *v16;
  id v17;
  MFMailComposeToField *v18;
  MFMailComposeController *v19;

  if (!-[MFMailComposeController _isDummyViewController](self, "_isDummyViewController"))
  {
    -[MFMailComposeController compositionContext](self, "compositionContext");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v17, "isLoadingMessageData");

    if ((v3 & 1) == 0)
    {
      v4 = self;
      p_savedFirstResponder = (id *)&v4->_savedFirstResponder;
      WeakRetained = objc_loadWeakRetained((id *)&v4->_savedFirstResponder);

      if (WeakRetained)
      {
        v18 = (MFMailComposeToField *)objc_loadWeakRetained(p_savedFirstResponder);

        objc_storeWeak(p_savedFirstResponder, 0);
LABEL_18:
        v7 = (MFMailComposeController *)v18;
LABEL_19:
        v19 = v7;
        -[MFMailComposeController becomeFirstResponder](v7, "becomeFirstResponder");
        -[MFMailComposeController _makeComposeUserActivityCurrent](v4, "_makeComposeUserActivityCurrent");

        return;
      }
      if (!-[_MFMailCompositionContext showKeyboardImmediately](v4->_compositionContext, "showKeyboardImmediately"))
      {
        v7 = v4;
        if ((*((char *)v4 + 1352) & 0x80000000) == 0)
          goto LABEL_19;
      }
      v18 = v4->_toField;

      -[CNComposeRecipientTextView addresses](v4->_toField, "addresses");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9)
      {
        v10 = v4->_subjectField;

        v18 = (MFMailComposeToField *)v10;
      }
      -[MFMailComposeController composeWebView](v4, "composeWebView");
      v11 = (MFMailComposeToField *)objc_claimAutoreleasedReturnValue();
      v12 = v18;
      if (v18 == (MFMailComposeToField *)v4->_subjectField
        && (-[CNComposeRecipientTextView text](v18, "text"),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v13, "length"),
            v13,
            v12 = v18,
            v14))
      {
        v15 = v11;

        -[MFMailComposeController composeWebView](v4, "composeWebView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "placeCaretAtStartOfBodyField");

        v18 = v15;
      }
      else if (v12 != v11)
      {
LABEL_17:

        goto LABEL_18;
      }
      if (-[MFMailComposeToField isLoading](v11, "isLoading"))
        -[_MFMailCompositionContext setShowKeyboardImmediately:](v4->_compositionContext, "setShowKeyboardImmediately:", 0);
      goto LABEL_17;
    }
  }
}

- (void)saveFirstResponder
{
  id v3;

  -[MFMailComposeController firstResponder](self, "firstResponder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_savedFirstResponder, v3);

}

- (void)saveAndResignFirstResponder
{
  id v3;

  -[MFMailComposeController saveFirstResponder](self, "saveFirstResponder");
  -[MFMailComposeController firstResponder](self, "firstResponder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

}

- (BOOL)isDirty
{
  return *((_BYTE *)self + 1352) & 1;
}

- (void)setIsDirty:(BOOL)a3
{
  *((_BYTE *)self + 1352) = *((_BYTE *)self + 1352) & 0xFE | a3;
}

- (void)_draftContentDidChange
{
  -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");
  -[MFMailComposeController _makeComposeUserActivityCurrent](self, "_makeComposeUserActivityCurrent");
  -[MFMailComposeController _setAutosaveIsValid:](self, "_setAutosaveIsValid:", 0);
}

- (void)_subjectTextChanged:(id)a3
{
  *((_BYTE *)self + 1352) |= 1u;
  -[MFMailComposeController _draftContentDidChange](self, "_draftContentDidChange", a3);
  -[MFMailComposeController _invalidateInputContextHistory](self, "_invalidateInputContextHistory");
}

- (void)_recipientTextChanged:(id)a3
{
  id v4;
  char v5;
  id v6;
  _QWORD v7[4];
  id v8;
  MFMailComposeController *v9;

  v4 = a3;
  v5 = *((_BYTE *)self + 1352);
  *((_BYTE *)self + 1352) = v5 | 1;
  if ((v5 & 1) == 0)
    -[MFMailComposeController _draftContentDidChange](self, "_draftContentDidChange");
  -[MFMailComposeController _invalidateInputContextHistory](self, "_invalidateInputContextHistory");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__MFMailComposeController__recipientTextChanged___block_invoke;
  v7[3] = &unk_1E5A67A30;
  v6 = v4;
  v8 = v6;
  v9 = self;
  -[MFMailComposeController _performBlockWithStrongComposeCoordinator:](self, "_performBlockWithStrongComposeCoordinator:", v7);

}

void __49__MFMailComposeController__recipientTextChanged___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
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
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 1152);

  if (v3 == v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1152), "recipients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setToRecipients:", v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "object");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(*(_QWORD *)(a1 + 40) + 1160);

    if (v5 != v6)
      goto LABEL_6;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1160), "recipients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCcRecipients:", v7);
  }

LABEL_6:
  objc_msgSend(*(id *)(a1 + 32), "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "mailComposeView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bccField");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "mailComposeView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bccField");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recipients");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBccRecipients:", v13);

  }
}

- (void)_recipientTextChangedForHME
{
  NSString *sendingEmailAddress;
  void *v4;
  id v5;

  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isSending") & 1) == 0 && (objc_msgSend(v5, "isReplyToHME") & 1) == 0)
  {
    sendingEmailAddress = self->_sendingEmailAddress;
    -[MFMailComposeController hideMyEmailAddressIfExists](self, "hideMyEmailAddressIfExists");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(sendingEmailAddress) = -[NSString isEqualToString:](sendingEmailAddress, "isEqualToString:", v4);

    if ((_DWORD)sendingEmailAddress)
      -[MFMailComposeController _getHMEEmailFromOriginalAddress:](self, "_getHMEEmailFromOriginalAddress:", self->_sendingEmailAddress);
  }

}

- (void)_getHMEEmailFromOriginalAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
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
  NSString *v31;
  NSString *sendingEmailAddress;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  MFMailComposeController *v43;
  id v44;
  _QWORD v45[5];

  v4 = a3;
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLoadingFromAddress:", 0);
  objc_msgSend(MEMORY[0x1E0D1E190], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isConfigured:", 0))
  {

    goto LABEL_8;
  }
  v7 = -[MFMailComposeController _checkWhetherForwardingAddressIsPresent](self, "_checkWhetherForwardingAddressIsPresent");

  if (!v7)
  {
LABEL_8:
    v21 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("HME_NOT_CONFIGURED_ALERT_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("HME_NOT_CONFIGURED_ALERT_DESCRIPTION"), &stru_1E5A6A588, CFSTR("Main"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "alertControllerWithTitle:message:preferredStyle:", v23, v25, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E5A6A588, CFSTR("Main"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "actionWithTitle:style:handler:", v28, 1, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v29);

    -[MFMailComposeController _presentModalAlert:](self, "_presentModalAlert:", v10);
    -[MFMailComposeController setSendingEmailAddress:](self, "setSendingEmailAddress:", 0);
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLForKey:", *MEMORY[0x1E0D1DFF8]);

  if (v9)
    -[MFMailComposeController _removeAutoBccSendingAddress:](self, "_removeAutoBccSendingAddress:", v4);
  -[MFMailComposeController _allRecipients](self, "_allRecipients");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    v11 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("HME_MULTIPLE_RECEPIENT_ALERT_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("HME_MULTIPLE_RECEPIENT_ALERT_DESCRIPTION"), &stru_1E5A6A588, CFSTR("Main"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", v13, v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E5A6A588, CFSTR("Main"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __59__MFMailComposeController__getHMEEmailFromOriginalAddress___block_invoke;
    v45[3] = &unk_1E5A67A58;
    v45[4] = self;
    objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 1, v45);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAction:", v20);

    -[MFMailComposeController _presentModalAlert:](self, "_presentModalAlert:", v16);
    -[MFMailComposeController setSendingEmailAddress:](self, "setSendingEmailAddress:", 0);
LABEL_14:

    goto LABEL_9;
  }
  if (!objc_msgSend(v10, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("HIDE_MY_EMAIL_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeController _setSendingEmailAddressAsHME:](self, "_setSendingEmailAddressAsHME:", v39);

    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("HIDE_MY_EMAIL_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
  v31 = (NSString *)objc_claimAutoreleasedReturnValue();
  sendingEmailAddress = self->_sendingEmailAddress;
  self->_sendingEmailAddress = v31;

  objc_msgSend(v5, "setLoadingFromAddress:", 1);
  -[MFMailComposeController _resetSecureCompositionManagerUsingNewAccount:](self, "_resetSecureCompositionManagerUsingNewAccount:", 1);
  -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");
  objc_msgSend(MEMORY[0x1E0D1E190], "sharedInstance");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "emailAddressValue");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "simpleAddress");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v36)
  {
    v38 = v36;
  }
  else
  {
    objc_msgSend(v34, "stringValue");
    v38 = (id)objc_claimAutoreleasedReturnValue();
  }
  v40 = v38;

  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __59__MFMailComposeController__getHMEEmailFromOriginalAddress___block_invoke_2;
  v41[3] = &unk_1E5A67AE0;
  v42 = v5;
  v43 = self;
  v44 = v4;
  objc_msgSend(v33, "generateHideMyEmailAddressForEmailAddress:completion:", v40, v41);

LABEL_9:
}

uint64_t __59__MFMailComposeController__getHMEEmailFromOriginalAddress___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1544) = 1;
  return result;
}

void __59__MFMailComposeController__getHMEEmailFromOriginalAddress___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
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
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;

  v58 = a2;
  v5 = a3;
  if (!objc_msgSend(*(id *)(a1 + 32), "isLoadingFromAddress"))
    goto LABEL_20;
  if (!v58)
  {
    objc_msgSend(v5, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CFFF10]))
    {
      v7 = objc_msgSend(v5, "code");

      if (v7 == -7070)
      {
        v8 = (void *)MEMORY[0x1E0DC3450];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("HME_2FA_ALERT_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("HME_2FA_ALERT_DESCRIPTION"), &stru_1E5A6A588, CFSTR("Main"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v10, v12, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = (void *)MEMORY[0x1E0DC3448];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CONTINUE_IN_SETTINGS"), &stru_1E5A6A588, CFSTR("Main"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, &__block_literal_global_246);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addAction:", v17);

        v18 = (void *)MEMORY[0x1E0DC3448];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E5A6A588, CFSTR("Main"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 1, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addAction:", v21);

        objc_msgSend(*(id *)(a1 + 40), "_presentModalAlert:", v13);
LABEL_19:

        objc_msgSend(*(id *)(a1 + 40), "setSendingEmailAddress:", 0);
        objc_msgSend(*(id *)(a1 + 32), "setLoadingFromAddress:", 0);
        objc_msgSend(*(id *)(a1 + 40), "_updateSendAndCloseEnabled");
        goto LABEL_20;
      }
    }
    else
    {

    }
    objc_msgSend(v5, "domain");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x1E0D00040];
    if (objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0D00040]))
    {
      v24 = objc_msgSend(v5, "code");

      if (v24 == -11002)
      {
        v25 = (void *)MEMORY[0x1E0DC3450];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("HME_EMAIL_LIMIT_REACHED_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("HME_EMAIL_LIMIT_REACHED_DESCRIPTION"), &stru_1E5A6A588, CFSTR("Main"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "alertControllerWithTitle:message:preferredStyle:", v27, v29, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = (void *)MEMORY[0x1E0DC3448];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E5A6A588, CFSTR("Main"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "actionWithTitle:style:handler:", v32, 1, 0);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addAction:", v33);

        objc_msgSend(*(id *)(a1 + 40), "_presentModalAlert:", v13);
        goto LABEL_19;
      }
    }
    else
    {

    }
    objc_msgSend(v5, "domain");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "isEqualToString:", v23))
    {
      v35 = objc_msgSend(v5, "code");

      if (v35 == -11003)
      {
        v36 = (void *)MEMORY[0x1E0DC3450];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("HME_MAX_LIMIT_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("HME_MAX_LIMIT_DESCRIPTION"), &stru_1E5A6A588, CFSTR("Main"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "alertControllerWithTitle:message:preferredStyle:", v38, v40, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = (void *)MEMORY[0x1E0DC3448];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("CONTINUE_IN_SETTINGS"), &stru_1E5A6A588, CFSTR("Main"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "actionWithTitle:style:handler:", v43, 0, &__block_literal_global_257);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addAction:", v44);

        v45 = (void *)MEMORY[0x1E0DC3448];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E5A6A588, CFSTR("Main"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "actionWithTitle:style:handler:", v47, 1, 0);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addAction:", v48);

        objc_msgSend(*(id *)(a1 + 40), "_presentModalAlert:", v13);
        goto LABEL_19;
      }
    }
    else
    {

    }
    v49 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("HME_UNKNOWN_ERROR_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "localizedStringForKey:value:table:", CFSTR("HME_UNKNOWN_ERROR_DESCRIPTION"), &stru_1E5A6A588, CFSTR("Main"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "alertControllerWithTitle:message:preferredStyle:", v51, v53, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E5A6A588, CFSTR("Main"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "actionWithTitle:style:handler:", v56, 1, 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v57);

    objc_msgSend(*(id *)(a1 + 40), "_presentModalAlert:", v13);
    goto LABEL_19;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "_setSendingEmailAddressAsHME:"))
    objc_msgSend(*(id *)(a1 + 40), "_updateAutoBccSendingAddress:withNewSendingAddress:", *(_QWORD *)(a1 + 48), v58);
  objc_msgSend(*(id *)(a1 + 32), "setLoadingFromAddress:", 0);
  objc_msgSend(*(id *)(a1 + 40), "_resetSecureCompositionManagerUsingNewAccount:", 1);
  objc_msgSend(*(id *)(a1 + 40), "_updateSendAndCloseEnabled");
LABEL_20:

}

void __59__MFMailComposeController__getHMEEmailFromOriginalAddress___block_invoke_3()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=PASSWORD_AND_SECURITY"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v0, 0);

}

void __59__MFMailComposeController__getHMEEmailFromOriginalAddress___block_invoke_4()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/PRIVATE_EMAIL_MANAGE"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "openSensitiveURL:withOptions:", v0, 0);

}

- (BOOL)_checkWhetherForwardingAddressIsPresent
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[MFMailComposeController emailAddresses](self, "emailAddresses", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0D1E190], "sharedInstance");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "forwardingEmailForPrimaryAccount");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v6) = objc_msgSend(v6, "ef_caseInsensitiveIsEqualToString:", v8);

        if ((v6 & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)setHideMyEmailAddressForMailToURLAddressString:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
    -[MFMailComposeController setHideMyEmailAddressIfExists:](self, "setHideMyEmailAddressIfExists:", v4);

}

- (BOOL)isQuickReply
{
  void *v2;
  char v3;

  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isQuickReply");

  return v3;
}

- (void)setIsQuickReply:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQuickReply:", v3);

}

- (void)_composeViewDidDraw:(id)a3
{
  void *v4;
  dispatch_time_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!self->_initialAttachmentCount)
  {
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("_MFMailComposeViewControllerFirstDrawNotification"), self);
    -[MFMailComposeController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("MailComposeViewDidDraw"), v4);

  }
  if (-[MFMailComposeController markupReplyAttachmentLoadingProgress](self, "markupReplyAttachmentLoadingProgress") == 1)
  {
    v5 = dispatch_time(0, 100000000);
    dispatch_after(v5, MEMORY[0x1E0C80D38], &__block_literal_global_263);
    -[MFMailComposeController setMarkupReplyAttachmentLoadingProgress:](self, "setMarkupReplyAttachmentLoadingProgress:", 2);
    -[MFMailComposeController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("MailComposeViewDidDraw"), v6);

  }
}

- (void)didInsertBodyText:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(v5, "length");
  if (v4)
    LOWORD(v4) = objc_msgSend(v5, "characterAtIndex:", objc_msgSend(v5, "length") - 1);
  self->_lastTypedCharacter = v4;

}

- (id)sendingEmailAddress
{
  NSString *sendingEmailAddress;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  sendingEmailAddress = self->_sendingEmailAddress;
  if (!sendingEmailAddress)
  {
    -[MFMailComposeController _defaultAccount](self, "_defaultAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "firstEmailAddress");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fullUserName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6C0]), "initWithString:", v6);
      objc_msgSend(v8, "setDisplayName:", v7);
      objc_msgSend(v8, "emailAddressValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMailComposeController setSendingEmailAddress:](self, "setSendingEmailAddress:", v10);

    }
    sendingEmailAddress = self->_sendingEmailAddress;
  }
  return sendingEmailAddress;
}

- (id)sendingAccountProxy
{
  void *v3;
  void *v4;
  void *v5;

  -[MFMailComposeController sendingEmailAddress](self, "sendingEmailAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController accountProxyGenerator](self, "accountProxyGenerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountProxyContainingEmailAddress:includingInactive:originatingBundleID:sourceAccountManagement:", v3, 0, self->_originatingBundleID, self->_sourceAccountManagement);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)sendingEmailAddressIfExists
{
  return self->_sendingEmailAddress;
}

- (id)allRecipientNamesAndAddresses
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[MFMailComposeController _allRecipientViews](self, "_allRecipientViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    obj = v5;
    v20 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v8, "recipients", obj);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v22;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v22 != v11)
                objc_enumerationMutation(v9);
              v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * j);
              objc_msgSend(v13, "uncommentedAddress");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "ef_addOptionalObject:", v14);
              objc_msgSend(v13, "displayString");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v15;
              if (v15 && (objc_msgSend(v15, "isEqualToString:", v14) & 1) == 0)
                objc_msgSend(v4, "addObject:", v16);

            }
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
          }
          while (v10);
        }

      }
      v5 = obj;
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0D1EF38], "pairWithFirst:second:", v4, v3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_originalContentMessagesIfExists
{
  void *v3;
  void *v4;

  if (_os_feature_enabled_impl() && EMIsGreymatterAvailableWithOverride())
  {
    -[MFMailComposeController originalContentMessagesFuture](self, "originalContentMessagesFuture");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resultIfAvailable");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_senderEmailAddress
{
  void *v2;
  void *v3;

  -[MFMailComposeController sendingEmailAddressIfExists](self, "sendingEmailAddressIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6B8]), "initWithString:", v2);
  else
    v3 = 0;

  return v3;
}

- (id)_recipientsFromRecipientTextView:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "recipients");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ef_map:", &__block_literal_global_268);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __60__MFMailComposeController__recipientsFromRecipientTextView___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6B8]), "initWithString:", v2);

  return v3;
}

- (BOOL)_hasCustomSignatureConfigured
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  BOOL v7;

  -[MFMailComposeController hasCustomSignature](self, "hasCustomSignature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "BOOLValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MFMailSignatureController hasCustomSigntureForSender:](self->_signatureController, "hasCustomSigntureForSender:", self->_sendingEmailAddress));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeController setHasCustomSignature:](self, "setHasCustomSignature:", v6);

    v5 = objc_msgSend(0, "BOOLValue");
  }
  v7 = v5;

  return v7;
}

- (id)_originalMessageCategorySubtype
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (_os_feature_enabled_impl())
  {
    -[MFMailComposeController compositionContext](self, "compositionContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "originalMessage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "category");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subtype");
    EMStringFromSubtype();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lowercaseString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)inputContextHistory
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;

  if (_os_feature_enabled_impl() && EMIsGreymatterAvailableWithOverride())
  {
    v3 = objc_alloc(MEMORY[0x1E0D46DB0]);
    -[MFMailComposeController smartReplyThreadIdentifier](self, "smartReplyThreadIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeController _senderEmailAddress](self, "_senderEmailAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeController _recipientsFromRecipientTextView:]((uint64_t)self, self->_toField);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeController _recipientsFromRecipientTextView:]((uint64_t)self, self->_ccField);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeController subject](self, "subject");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v9 = (const __CFString *)v7;
    else
      v9 = &stru_1E5A6A588;
    v10 = -[MFMailComposeController _hasCustomSignatureConfigured](self, "_hasCustomSignatureConfigured");
    -[MFMailComposeController _originalMessageCategorySubtype](self, "_originalMessageCategorySubtype");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeController _originalContentMessagesIfExists](self, "_originalContentMessagesIfExists");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = 0;
    v13 = (void *)objc_msgSend(v3, "initWithThreadIdentifier:senderEmailAddress:toRecipients:ccRecipients:subject:hasCustomSignature:showSmartReplySuggestions:originalMessageCategorySubtype:originalContentMessages:", v16, v4, v5, v6, v9, v10, v15, v11, v12);

  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (void)_updateManagedPasteboardOwner
{
  int v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0D4D620], "accountContainingEmailAddress:", self->_sendingEmailAddress);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "sourceIsManaged");

  if (v3)
    v4 = 2;
  else
    v4 = 1;
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_setDataOwnerForCopy:", v4);

  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setDataOwnerForPaste:", v4);

}

- (BOOL)isAddressHideMyEmail:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (v4
    && (objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("HIDE_MY_EMAIL_TITLE"), &stru_1E5A6A588, CFSTR("Main")), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v4, "isEqualToString:", v6), v6, v5, (v7 & 1) != 0))
  {
    v8 = 1;
  }
  else
  {
    -[MFMailComposeController hideMyEmailAddressIfExists](self, "hideMyEmailAddressIfExists");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v8 = 0;
    if (v4 && v9)
    {
      -[MFMailComposeController hideMyEmailAddressIfExists](self, "hideMyEmailAddressIfExists");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v4, "isEqualToString:", v11);

    }
  }

  return v8;
}

- (BOOL)isHideMyEmailMessage
{
  void *v2;
  BOOL v3;

  -[MFMailComposeController hideMyEmailAddressIfExists](self, "hideMyEmailAddressIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (void)setSendingEmailAddress:(id)a3
{
  NSString *v4;
  _BOOL8 v5;
  id v6;

  v6 = a3;
  v4 = self->_sendingEmailAddress;
  if (-[MFMailComposeController isAddressHideMyEmail:](self, "isAddressHideMyEmail:", v6))
  {
    -[MFMailComposeController _getHMEEmailFromOriginalAddress:](self, "_getHMEEmailFromOriginalAddress:", self->_sendingEmailAddress);
  }
  else
  {
    v5 = -[MFMailComposeController isAddressHideMyEmail:](self, "isAddressHideMyEmail:", v4);
    if (-[MFMailComposeController _setSendingEmailAddress:](self, "_setSendingEmailAddress:", v6))
      -[MFMailComposeController _updateAutoBccSendingAddress:withNewSendingAddress:alwaysAdd:](self, "_updateAutoBccSendingAddress:withNewSendingAddress:alwaysAdd:", v4, v6, v5);
  }
  -[MFMailComposeController _presentSenderCollaborationAlertIfNecessaryForSendingAddress:](self, "_presentSenderCollaborationAlertIfNecessaryForSendingAddress:", self->_sendingEmailAddress);

}

- (BOOL)_setSendingEmailAddress:(id)a3
{
  NSString *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  unint64_t sendingEmailAddressIndex;
  void *v11;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  uint64_t v31;
  MFMailComposeController *v32;
  uint64_t v33;
  NSString *sendingEmailAddress;
  void *v35;
  void *v36;
  int HasSafeDomain;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  uint64_t v51;
  NSString *originalSendingEmailAddress;
  void *v54;
  id obj;
  void *v56;
  void *v57;
  MFMailComposeController *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v4 = (NSString *)a3;
  if (!v4)
  {
    -[MFMailComposeController _defaultAccount](self, "_defaultAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstEmailAddress");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (NSString *)v6;
  }
  v56 = v4;
  if (v4 != self->_sendingEmailAddress || !-[NSString isEqualToString:](v4, "isEqualToString:", v4))
  {
    -[MFMailComposeController emailAddresses](self, "emailAddresses");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6B8]), "initWithString:", v56);
    objc_msgSend(v8, "simpleAddress");
    v9 = objc_claimAutoreleasedReturnValue();

    sendingEmailAddressIndex = self->_sendingEmailAddressIndex;
    v57 = (void *)v9;
    v58 = self;
    if (sendingEmailAddressIndex == 0x7FFFFFFFFFFFFFFFLL
      || sendingEmailAddressIndex >= objc_msgSend(v54, "count")
      || (objc_msgSend(v54, "objectAtIndex:", self->_sendingEmailAddressIndex),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "isEqualToString:", v9),
          v11,
          (v12 & 1) == 0))
    {
      self->_sendingEmailAddressIndex = 0x7FFFFFFFFFFFFFFFLL;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      v13 = v54;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v68;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v68 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
            if (!objc_msgSend(v17, "caseInsensitiveCompare:", v9))
            {
              v58->_sendingEmailAddressIndex = objc_msgSend(v13, "indexOfObject:", v17);
              goto LABEL_19;
            }
          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
          if (v14)
            continue;
          break;
        }
      }
LABEL_19:

      self = v58;
    }
    if (self->_sendingEmailAddressIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      -[MFMailComposeController _availableAccountProxies](self, "_availableAccountProxies");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
      if (v19)
      {
        obj = v18;
        v20 = *(_QWORD *)v64;
        while (2)
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v64 != v20)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
            v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v61 = 0u;
            v62 = 0u;
            v59 = 0u;
            v60 = 0u;
            v24 = (void *)MEMORY[0x1E0D1E6B8];
            objc_msgSend(v22, "fromEmailAddressesIncludingDisabled");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "emailAddressesFromStrings:invalidAddresses:", v25, 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
            if (v27)
            {
              v28 = *(_QWORD *)v60;
              do
              {
                for (k = 0; k != v27; ++k)
                {
                  if (*(_QWORD *)v60 != v28)
                    objc_enumerationMutation(v26);
                  objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * k), "simpleAddress");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v23, "addObject:", v30);

                }
                v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
              }
              while (v27);
            }

            if (objc_msgSend(v23, "containsObject:", v57))
            {
              objc_msgSend(v22, "firstEmailAddress");
              v31 = objc_claimAutoreleasedReturnValue();

              v58->_sendingEmailAddressIndex = objc_msgSend(v54, "indexOfObject:", v31);
              goto LABEL_38;
            }

          }
          v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
          if (v19)
            continue;
          break;
        }
        v31 = (uint64_t)v56;
LABEL_38:
        v18 = obj;
      }
      else
      {
        v31 = (uint64_t)v56;
      }

      v32 = v58;
      if (v58->_sendingEmailAddressIndex == 0x7FFFFFFFFFFFFFFFLL)
      {
        v7 = 0;
        v56 = (void *)v31;
LABEL_57:
        -[MFMailComposeController _resetSecureCompositionManagerUsingNewAccount:](v32, "_resetSecureCompositionManagerUsingNewAccount:", 1);
        -[MFMailComposeController _updateManagedPasteboardOwner](v32, "_updateManagedPasteboardOwner");

        goto LABEL_58;
      }
      v56 = (void *)v31;
    }
    v33 = objc_msgSend(v56, "copy");
    sendingEmailAddress = v58->_sendingEmailAddress;
    v58->_sendingEmailAddress = (NSString *)v33;

    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6B8]), "initWithString:", v58->_sendingEmailAddress);
    objc_msgSend(v35, "simpleAddress");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    HasSafeDomain = MFAddressHasSafeDomain(v36);
    -[MFMailComposeController setHideMyEmailAddressIfExists:](v58, "setHideMyEmailAddressIfExists:", 0);
    -[MFMailComposeController mailComposeView](v58, "mailComposeView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "fromField");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setSelectedAddress:", v36);

    objc_msgSend(v38, "multiField");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setAccountDescription:", v36);

    objc_msgSend(v38, "multiField");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setAccountHasUnsafeDomain:", HasSafeDomain ^ 1u);

    objc_msgSend(v38, "multiField");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setAccountAutoselected:", 0);

    -[MFMailComposeController sendingAccountProxy](v58, "sendingAccountProxy");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "supportsThreadOperations");
    objc_msgSend(v38, "subjectField");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setAllowsNotifyOption:", v44);

    objc_msgSend(v38, "webContentVariationField");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeController contentVariationName](v58, "contentVariationName");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setSelectedContentVariationLabel:", v47);

    -[MFMailComposeController updateSignature](v58, "updateSignature");
    if (-[MFMailComposeController composeType](v58, "composeType"))
    {
      objc_msgSend(MEMORY[0x1E0D4D620], "accountContainingEmailAddress:", v58->_sendingEmailAddress);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v48;
      if (v48)
      {
        v50 = objc_msgSend(v48, "sourceIsManaged") ? 2 : 1;
        if (v50 != v58->_sourceAccountManagement)
        {
          v58->_sourceAccountManagement = v50;
          -[_MFMailCompositionContext setSourceAccountManagement:](v58->_compositionContext, "setSourceAccountManagement:");
          -[MFMailComposeController _accountsChanged:](v58, "_accountsChanged:", 0);
        }
      }
    }
    else
    {
      v49 = 0;
    }
    if (!v58->_originalSendingEmailAddress)
      goto LABEL_55;
    if (!-[NSString isEqualToString:](v58->_sendingEmailAddress, "isEqualToString:"))
      *((_BYTE *)v58 + 1352) |= 1u;
    if (!v58->_originalSendingEmailAddress)
    {
LABEL_55:
      v51 = objc_msgSend(v56, "copy");
      originalSendingEmailAddress = v58->_originalSendingEmailAddress;
      v58->_originalSendingEmailAddress = (NSString *)v51;

    }
    v7 = 1;
    v32 = v58;
    goto LABEL_57;
  }
  v7 = 0;
LABEL_58:

  return v7;
}

- (void)setSendingEmailAddressAsHME:(id)a3 isComposeTypeReply:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[MFMailComposeController _setSendingEmailAddressAsHME:](self, "_setSendingEmailAddressAsHME:");
  if (v4)
  {
    -[MFMailComposeController mailComposeView](self, "mailComposeView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setReplyToHME:", 1);

  }
}

- (BOOL)_setSendingEmailAddressAsHME:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString **p_sendingEmailAddress;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;

  v4 = (NSString *)a3;
  v5 = v4;
  if (!v4)
  {
    -[MFMailComposeController _setSendingEmailAddress:](self, "_setSendingEmailAddress:", 0);
LABEL_10:
    v22 = 0;
    goto LABEL_11;
  }
  p_sendingEmailAddress = &self->_sendingEmailAddress;
  if (self->_sendingEmailAddress == v4 && -[NSString isEqualToString:](v4, "isEqualToString:", v4))
    goto LABEL_10;
  -[MFMailComposeController _emailAddressesWithHME](self, "_emailAddressesWithHME");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("HIDE_MY_EMAIL_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  self->_sendingEmailAddressIndex = objc_msgSend(v7, "indexOfObject:", v9);

  if (self->_sendingEmailAddressIndex == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_10;
  v10 = (void *)-[NSString copy](v5, "copy");
  v11 = *p_sendingEmailAddress;
  objc_storeStrong((id *)&self->_sendingEmailAddress, v10);
  -[MFMailComposeController setHideMyEmailAddressIfExists:](self, "setHideMyEmailAddressIfExists:", v10);
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fromField");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSelectedAddressToHME:", v10);

  objc_msgSend(v12, "multiField");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAccountDescription:", v10);

  objc_msgSend(v12, "multiField");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccountHasUnsafeDomain:", 0);

  objc_msgSend(v12, "multiField");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccountAutoselected:", 0);

  -[MFMailComposeController sendingAccountProxy](self, "sendingAccountProxy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "supportsThreadOperations");
  objc_msgSend(v12, "subjectField");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAllowsNotifyOption:", v18);

  objc_msgSend(v12, "webContentVariationField");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController contentVariationName](self, "contentVariationName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSelectedContentVariationLabel:", v21);

  -[MFMailComposeController removeSignature](self, "removeSignature");
  if (v11 && !-[NSString isEqualToString:](*p_sendingEmailAddress, "isEqualToString:", v11))
    *((_BYTE *)self + 1352) |= 1u;

  v22 = 1;
LABEL_11:

  return v22;
}

- (void)setCaretPosition:(unint64_t)a3
{
  id v4;

  -[MFMailComposeController composeWebView](self, "composeWebView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCaretPosition:", a3);

}

- (void)changeQuoteLevel:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  int v7;
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  MFLogGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = a3;
    _os_log_impl(&dword_1AB96A000, v5, OS_LOG_TYPE_DEFAULT, "#CompositionServices Quote level changed: %ld", (uint8_t *)&v7, 0xCu);
  }

  -[MFMailComposeController composeWebView](self, "composeWebView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "changeQuoteLevel:", a3);

}

- (void)stripCustomBodyIdentifiers
{
  id v2;

  -[MFMailComposeController composeWebView](self, "composeWebView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stripCustomBodyIdentifiers");

}

- (id)_selectedAttachmentURLs
{
  return 0;
}

- (void)markupAttachment:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  int v8;
  _MFQLItemDataProvider *v9;
  void *v10;
  void *v11;
  _MFQLItemDataProvider *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  MFMailComposeController *v21;
  NSObject *v22;
  uint8_t buf[16];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MFLogGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB96A000, v5, OS_LOG_TYPE_DEFAULT, "#CompositionServices Attachment markup started", buf, 2u);
  }

  if (v4 && objc_msgSend(v4, "contentTypeConformsToMarkup"))
  {
    objc_msgSend(v4, "contentTypeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isDataAvailableLocally");
    if (v6)
      v8 = v7;
    else
      v8 = 0;
    if (v8 == 1)
    {
      v9 = [_MFQLItemDataProvider alloc];
      objc_msgSend(v4, "fetchLocalData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fileName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[_MFQLItemDataProvider initWithData:contentType:previewTitle:](v9, "initWithData:contentType:previewTitle:", v10, v6, v11);

      -[_MFQLItemDataProvider item](v12, "item");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        -[MFMailComposeController setPreviewingAttachment:](self, "setPreviewingAttachment:", v4);
        v14 = objc_alloc((Class)getQLPreviewControllerClass[0]());
        v24[0] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v14, "initWithPreviewItems:", v15);

        objc_msgSend(v16, "setIsContentManaged:", -[MFMailComposeController isManagedAccount](self, "isManagedAccount"));
        objc_msgSend(v16, "setAppearanceActions:", 4);
        objc_msgSend(v16, "setDelegate:", self);
        -[MFMailComposeController _backgroundColorForMarkupController](self, "_backgroundColorForMarkupController");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setBackgroundColor:", v17);

        -[MFMailComposeController setPreviewController:](self, "setPreviewController:", v16);
        objc_msgSend(v16, "setModalPresentationStyle:", 5);
        v20 = MEMORY[0x1E0C809B0];
        v21 = self;
        v18 = v16;
        v22 = v18;
        objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", v20, 3221225472, __44__MFMailComposeController_markupAttachment___block_invoke, &unk_1E5A65430, v21);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "performBlock:", &v20);

      }
      else
      {
        MFComposeLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[MFMailComposeController markupAttachment:].cold.1();
      }

    }
  }

}

void __44__MFMailComposeController_markupAttachment___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "saveFirstResponder");
  objc_msgSend(*(id *)(a1 + 32), "_dismissPresentedHalfSheet");
  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

- (void)insertDrawing
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _MFQLItemDataProvider *v24;
  void *v25;
  _MFQLItemDataProvider *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  objc_class *v34;
  id v35;
  __CFString *v36;
  _QWORD v37[5];
  NSObject *v38;
  _QWORD v39[8];
  void *v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  MFMailComposeController *v44;
  __int16 v45;
  __CFString *v46;
  uint64_t v47;
  CGRect v48;

  v47 = *MEMORY[0x1E0C80C00];
  MFLogGeneral();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB96A000, v3, OS_LOG_TYPE_DEFAULT, "#CompositionServices Insert drawing started", buf, 2u);
  }

  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isQuickReply"))
  {
    -[MFMailComposeController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

  }
  else
  {
    -[MFMailComposeController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v8 = v15;
    v10 = v16;
    v12 = v17;
    v14 = v18;
  }

  EMLogCompose();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v48.origin.x = v8;
    v48.origin.y = v10;
    v48.size.width = v12;
    v48.size.height = v14;
    NSStringFromCGRect(v48);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v42 = v20;
    _os_log_impl(&dword_1AB96A000, v19, OS_LOG_TYPE_DEFAULT, "Will use %{public}@ as drawing canvas frame", buf, 0xCu);

  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:", v12, v14);
  v22 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __40__MFMailComposeController_insertDrawing__block_invoke;
  v39[3] = &__block_descriptor_64_e40_v16__0__UIGraphicsImageRendererContext_8l;
  *(CGFloat *)&v39[4] = v8;
  *(CGFloat *)&v39[5] = v10;
  *(double *)&v39[6] = v12;
  *(double *)&v39[7] = v14;
  objc_msgSend(v21, "PNGDataWithActions:", v39);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = [_MFQLItemDataProvider alloc];
  -[MFMailComposeController _nextDrawingName](self, "_nextDrawingName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[_MFQLItemDataProvider initWithData:contentType:previewTitle:](v24, "initWithData:contentType:previewTitle:", v23, *MEMORY[0x1E0CA5C10], v25);

  -[_MFQLItemDataProvider item](v26, "item");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = objc_alloc((Class)getQLPreviewControllerClass[0]());
    v40 = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v28, "initWithPreviewItems:", v29);

    objc_msgSend(v30, "setAppearanceActions:", 4);
    objc_msgSend(v30, "setDelegate:", self);
    -[MFMailComposeController _backgroundColorForMarkupController](self, "_backgroundColorForMarkupController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBackgroundColor:", v31);

    self->_insertingDrawing = 1;
    -[MFMailComposeController setPreviewController:](self, "setPreviewController:", v30);
    objc_msgSend(v30, "setModalPresentationStyle:", 5);
    v37[0] = v22;
    v37[1] = 3221225472;
    v37[2] = __40__MFMailComposeController_insertDrawing__block_invoke_279;
    v37[3] = &unk_1E5A65430;
    v37[4] = self;
    v32 = v30;
    v38 = v32;
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "performBlock:", v37);

  }
  else
  {
    MFComposeLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v23, "length"));
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v36 = CFSTR("nil");
      }
      *(_DWORD *)buf = 138543874;
      v42 = v35;
      v43 = 2048;
      v44 = self;
      v45 = 2114;
      v46 = v36;
      _os_log_error_impl(&dword_1AB96A000, v32, OS_LOG_TYPE_ERROR, "<%{public}@: %p> Failed to insert drawing, image data: %{public}@", buf, 0x20u);
      if (v23)

    }
  }

}

void __40__MFMailComposeController_insertDrawing__block_invoke(double *a1, void *a2)
{
  CGContext *v3;
  id v4;
  id v5;

  v5 = a2;
  v3 = (CGContext *)objc_msgSend(v5, "CGContext");
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v3, (CGColorRef)objc_msgSend(v4, "CGColor"));

  objc_msgSend(v5, "fillRect:", a1[4], a1[5], a1[6], a1[7]);
}

void __40__MFMailComposeController_insertDrawing__block_invoke_279(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "saveFirstResponder");
  objc_msgSend(*(id *)(a1 + 32), "_dismissPresentedHalfSheet");
  objc_msgSend(*(id *)(a1 + 32), "parentViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);

}

- (id)_nextDrawingName
{
  void *v3;
  void *v4;
  unint64_t drawingSequenceNumber;
  void *v6;
  unint64_t v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DEFAULT_DRAWING_NAME"), &stru_1E5A6A588, CFSTR("Main"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  drawingSequenceNumber = self->_drawingSequenceNumber;
  if (drawingSequenceNumber)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = drawingSequenceNumber + 1;
    self->_drawingSequenceNumber = v7;
    objc_msgSend(v6, "localizedStringWithFormat:", CFSTR("%@ %ld"), v4, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    self->_drawingSequenceNumber = 1;
    v8 = v4;
  }
  v9 = v8;

  return v9;
}

- (void)scanDocument
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  MFLogGeneral();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AB96A000, v3, OS_LOG_TYPE_DEFAULT, "#CompositionServices Document scanning started", v6, 2u);
  }

  -[MFMailComposeController _dismissPresentedHalfSheet](self, "_dismissPresentedHalfSheet");
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setDelegate:", self);
  -[MFMailComposeController setDocumentCameraViewController:](self, "setDocumentCameraViewController:", v4);
  -[MFMailComposeController saveFirstResponder](self, "saveFirstResponder");
  -[MFMailComposeController parentViewController](self, "parentViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)documentCameraViewController:(id)a3 didFinishWithScan:(id)a4
{
  id v5;
  NSObject *v6;
  MFScannedDocumentConverter *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  uint8_t buf[16];

  v5 = a4;
  MFLogGeneral();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB96A000, v6, OS_LOG_TYPE_DEFAULT, "#CompositionServices Document scanning did finish scan", buf, 2u);
  }

  v7 = objc_alloc_init(MFScannedDocumentConverter);
  -[MFScannedDocumentConverter pdfDocumentFromScannedDocument:](v7, "pdfDocumentFromScannedDocument:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__MFMailComposeController_documentCameraViewController_didFinishWithScan___block_invoke;
  v13[3] = &unk_1E5A67B88;
  v13[4] = self;
  objc_msgSend(v8, "onScheduler:addSuccessBlock:", v9, v13);

  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __74__MFMailComposeController_documentCameraViewController_didFinishWithScan___block_invoke_2;
  v12[3] = &unk_1E5A67BB0;
  v12[4] = self;
  objc_msgSend(v8, "onScheduler:addFailureBlock:", v11, v12);

  -[MFMailComposeController _documentCameraViewControllerDidFinish](self, "_documentCameraViewControllerDidFinish");
}

uint64_t __74__MFMailComposeController_documentCameraViewController_didFinishWithScan___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1200), "insertScannedDocumentWithData:", a2);
}

void __74__MFMailComposeController_documentCameraViewController_didFinishWithScan___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
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
  _QWORD v15[9];

  v15[8] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MFLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v3, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __74__MFMailComposeController_documentCameraViewController_didFinishWithScan___block_invoke_2_cold_1();
  }

  v5 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SCAN_DOCUMENT_FAILED_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SCAN_DOCUMENT_FAILED_EXPLAIN"), &stru_1E5A6A588, CFSTR("Main"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v7, v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E5A6A588, CFSTR("Main"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__MFMailComposeController_documentCameraViewController_didFinishWithScan___block_invoke_291;
  v15[3] = &unk_1E5A67A58;
  v15[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 1, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addAction:", v14);

  objc_msgSend(*(id *)(a1 + 32), "_presentModalAlert:", v10);
}

uint64_t __74__MFMailComposeController_documentCameraViewController_didFinishWithScan___block_invoke_291(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishPopoverAlertClosingComposition:", 0);
}

- (void)documentCameraViewControllerDidCancel:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  MFLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "#CompositionServices Document scanning was cancelled", v5, 2u);
  }

  -[MFMailComposeController _documentCameraViewControllerDidFinish](self, "_documentCameraViewControllerDidFinish");
}

- (void)_documentCameraViewControllerDidFinish
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  MFLogGeneral();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AB96A000, v3, OS_LOG_TYPE_DEFAULT, "#CompositionServices Document scanning finished", v5, 2u);
  }

  -[MFMailComposeController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  -[MFMailComposeController setDocumentCameraViewController:](self, "setDocumentCameraViewController:", 0);
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "restoreFirstResponder");

  -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");
}

- (id)_backgroundColorForMarkupController
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.909803922, 1.0);
}

- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4
{
  return 2;
}

- (void)previewControllerDidDismiss:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  MFLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "#CompositionServices Drawing controller dismissed", v5, 2u);
  }

  self->_insertingDrawing = 0;
  -[MFMailComposeController setPreviewingAttachment:](self, "setPreviewingAttachment:", 0);
}

- (id)dismissActionsForPreviewController:(id)a3
{
  Class v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, void *);
  void *v12;
  id v13;
  id location;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (!self->_insertingDrawing)
    return 0;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = (Class)getQLDismissActionClass[0]();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("INSERT_DRAWING_BUTTON"), &stru_1E5A6A588, CFSTR("Main"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __62__MFMailComposeController_dismissActionsForPreviewController___block_invoke;
  v12 = &unk_1E5A67BD8;
  objc_copyWeak(&v13, &location);
  -[objc_class actionWithTitle:handler:](v3, "actionWithTitle:handler:", v5, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1, v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  return v7;
}

void __62__MFMailComposeController_dismissActionsForPreviewController___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v7, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editedFileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController _insertDrawingFromExternalURL:]((uint64_t)WeakRetained, v6);

}

- (void)_insertDrawingFromExternalURL:(uint64_t)a1
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
  id v13;
  NSObject *v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24[7];

  v24[6] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "startAccessingSecurityScopedResource");
    objc_msgSend(v4, "lastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURLWithPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v10, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = 0;
    objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, v24);
    v13 = v24[0];

    if (v13)
    {
      MFLogGeneral();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v13, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[MFMailComposeController _insertDrawingFromExternalURL:].cold.2();
      }

    }
    objc_msgSend(v5, "pathExtension");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length") == 0;

    if (v16)
    {
      objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("png"));
      v17 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v17;
    }
    objc_msgSend(v11, "URLByAppendingPathComponent:", v5);
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v18;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v13;
    objc_msgSend(v20, "copyItemAtURL:toURL:error:", v4, v19, &v23);
    v21 = v23;

    if (v21)
    {
      MFLogGeneral();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v21, "ef_publicDescription");
        objc_claimAutoreleasedReturnValue();
        -[MFMailComposeController _insertDrawingFromExternalURL:].cold.1();
      }

    }
    objc_msgSend(v4, "stopAccessingSecurityScopedResource");
    objc_msgSend(*(id *)(a1 + 1200), "insertDocumentWithURL:isDrawingFile:", v19, 1);

  }
}

- (void)previewController:(id)a3 didSaveEditedCopyOfPreviewItem:(id)a4 atURL:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[8];

  v6 = a5;
  MFLogGeneral();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB96A000, v7, OS_LOG_TYPE_DEFAULT, "#CompositionServices Drawing controller did save", buf, 2u);
  }

  -[MFMailComposeController previewingAttachment](self, "previewingAttachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    -[MFMailComposeController previewingAttachment](self, "previewingAttachment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __82__MFMailComposeController_previewController_didSaveEditedCopyOfPreviewItem_atURL___block_invoke;
    v10[3] = &unk_1E5A67C00;
    objc_copyWeak(&v11, (id *)buf);
    -[MFMailComposeController _replaceAttachment:withDocumentAtURL:completion:](self, v9, v6, v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }

}

void __82__MFMailComposeController_previewController_didSaveEditedCopyOfPreviewItem_atURL___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setPreviewingAttachment:", v3);

}

- (void)_replaceAttachment:(void *)a3 withDocumentAtURL:(void *)a4 completion:
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    objc_msgSend(v7, "startAccessingSecurityScopedResource");
    objc_msgSend(a1, "composeWebView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "replaceAttachment:withDocumentAtURL:completion:", v10, v7, v8);

    objc_msgSend(v7, "stopAccessingSecurityScopedResource");
  }

}

- (void)addSignature:(BOOL)a3
{
  MFMailSignatureController *signatureController;
  NSString *sendingEmailAddress;
  id v5;

  signatureController = self->_signatureController;
  sendingEmailAddress = self->_sendingEmailAddress;
  -[MFMailComposeController composeWebView](self, "composeWebView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MFMailSignatureController addSignatureForSender:bodyField:prepend:](signatureController, "addSignatureForSender:bodyField:prepend:", sendingEmailAddress);

}

- (void)updateSignature
{
  MFMailSignatureController *signatureController;
  NSString *sendingEmailAddress;
  id v4;

  signatureController = self->_signatureController;
  sendingEmailAddress = self->_sendingEmailAddress;
  -[MFMailComposeController composeWebView](self, "composeWebView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MFMailSignatureController updateSignatureForSender:bodyField:](signatureController, "updateSignatureForSender:bodyField:", sendingEmailAddress);

}

- (void)removeSignature
{
  MFMailSignatureController *signatureController;
  NSString *sendingEmailAddress;
  id v4;

  signatureController = self->_signatureController;
  sendingEmailAddress = self->_sendingEmailAddress;
  -[MFMailComposeController composeWebView](self, "composeWebView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MFMailSignatureController removeSignatureForSender:bodyField:](signatureController, "removeSignatureForSender:bodyField:", sendingEmailAddress);

}

- (void)finalizeSignature:(id)a3
{
  MFMailSignatureController *signatureController;
  void *v5;
  id v6;

  v6 = a3;
  signatureController = self->_signatureController;
  -[MFMailComposeController composeWebView](self, "composeWebView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailSignatureController finalizeSignatureForBodyField:completionHandler:](signatureController, "finalizeSignatureForBodyField:completionHandler:", v5, v6);

}

- (BOOL)sendingEmailDirtied
{
  NSString *sendingEmailAddress;

  sendingEmailAddress = self->_sendingEmailAddress;
  if ((unint64_t)sendingEmailAddress | (unint64_t)self->_originalSendingEmailAddress)
    return !-[NSString isEqualToString:](sendingEmailAddress, "isEqualToString:");
  else
    return 0;
}

- (BOOL)bccAddressesDirtied
{
  void *v3;
  void *v4;
  void *v5;
  NSUInteger v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  char v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bccField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addresses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[NSArray count](self->_originalBccAddresses, "count");
  if (v6 == objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSArray count](self->_originalBccAddresses, "count"));
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = self->_originalBccAddresses;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v8);
          v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6B8]), "initWithString:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
          objc_msgSend(v12, "simpleAddress");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v9);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v14 = v5;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v25;
      while (2)
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v14);
          v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
          v19 = objc_alloc(MEMORY[0x1E0D1E6B8]);
          v20 = (void *)objc_msgSend(v19, "initWithString:", v18, (_QWORD)v24);
          objc_msgSend(v20, "simpleAddress");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v7, "containsObject:", v21);

          if ((v22 & 1) == 0)
          {
            LOBYTE(v15) = 1;
            goto LABEL_20;
          }
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v15)
          continue;
        break;
      }
    }
LABEL_20:

  }
  else
  {
    LOBYTE(v15) = 1;
  }

  return v15;
}

- (BOOL)canShowFromField
{
  void *v2;
  BOOL v3;

  -[MFMailComposeController emailAddresses](self, "emailAddresses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)canShowImageSizeField
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[MFMailComposeController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass");

  if (v4 == 2)
  {
    -[MFMailComposeController attachments](self, "attachments");
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v5);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "imageScalingFlags", (_QWORD)v10))
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (BOOL)canShowAttachmentPicker
{
  return 1;
}

- (void)_focusGained:(id)a3
{
  void *v4;
  MFComposeWebView *v5;
  id v6;

  v6 = a3;
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeyboardVisible:animate:", 1, 1);
  objc_msgSend(v6, "object");
  v5 = (MFComposeWebView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self->_composeWebView)
    objc_msgSend(v4, "viewDidBecomeFirstResponder:", v5);

}

- (void)setSubject:(id)a3
{
  NSString *v5;

  v5 = (NSString *)a3;
  if (self->_subject != v5)
  {
    objc_storeStrong((id *)&self->_subject, a3);
    -[MFComposeSubjectView setText:](self->_subjectField, "setText:", v5);
    -[MFMailComposeController _updateNavigationBarTitleAnimated:](self, "_updateNavigationBarTitleAnimated:", 0);
  }

}

- (NSString)subject
{
  NSString *v2;

  if ((*((_BYTE *)self + 1353) & 4) != 0)
  {
    v2 = self->_subject;
  }
  else
  {
    -[MFComposeSubjectView text](self->_subjectField, "text");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (int64_t)_fieldForAddressField:(id)a3
{
  MFMailComposeToField *v4;
  MFMailComposeToField *v5;
  void *v6;
  MFMailComposeToField *v7;
  int64_t v8;

  v4 = (MFMailComposeToField *)a3;
  v5 = v4;
  if (self->_toField == v4)
  {
    v8 = 1;
  }
  else if ((MFMailComposeToField *)self->_ccField == v4)
  {
    v8 = 2;
  }
  else
  {
    -[MFMailComposeController mailComposeView](self, "mailComposeView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bccField");
    v7 = (MFMailComposeToField *)objc_claimAutoreleasedReturnValue();

    if (v7 == v5)
      v8 = 3;
    else
      v8 = 0;
  }

  return v8;
}

- (id)_addressFieldForField:(int64_t)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  if (a3 == 3)
  {
    -[MFMailComposeController mailComposeView](self, "mailComposeView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bccField");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (a3 == 2)
    {
      v3 = 1160;
    }
    else
    {
      if (a3 != 1)
      {
        v4 = 0;
        return v4;
      }
      v3 = 1152;
    }
    v4 = *(id *)((char *)&self->super.super.super.isa + v3);
  }
  return v4;
}

- (id)addressesForField:(int64_t)a3
{
  void *v3;
  void *v4;

  -[MFMailComposeController _addressFieldForField:](self, "_addressFieldForField:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addresses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)csPeopleForField:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[MFMailComposeController _addressFieldForField:](self, "_addressFieldForField:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "people");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (id)_csPeopleFromAddresses:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "ef_compactMap:", &__block_literal_global_302);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

id __50__MFMailComposeController__csPeopleFromAddresses___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "emailAddressValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "em_person");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setRecipients:(id)a3 forField:(int64_t)a4
{
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[MFMailComposeController addressesForField:](self, "addressesForField:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToArray:", v9);

  if ((v7 & 1) == 0)
  {
    self->_initializedRecipients = 0;
    -[MFMailComposeController setAddresses:field:](self, "setAddresses:field:", v9, a4);
    *((_BYTE *)self + 1352) |= 1u;
    -[MFMailComposeController mailComposeView](self, "mailComposeView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateOptionalHeaderVisibility");
    objc_msgSend(v8, "setNeedsLayout");
    self->_initializedRecipients = 1;

  }
}

- (void)setToRecipients:(id)a3
{
  -[MFMailComposeController _setRecipients:forField:](self, "_setRecipients:forField:", a3, 1);
}

- (id)toRecipients
{
  NSArray *v2;

  if ((*((_BYTE *)self + 1353) & 4) != 0)
  {
    v2 = self->_toAddresses;
  }
  else
  {
    -[MFMailComposeController addressesForField:](self, "addressesForField:", 1);
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setCcRecipients:(id)a3
{
  -[MFMailComposeController _setRecipients:forField:](self, "_setRecipients:forField:", a3, 2);
}

- (id)ccRecipients
{
  NSArray *v2;

  if ((*((_BYTE *)self + 1353) & 4) != 0)
  {
    v2 = self->_ccAddresses;
  }
  else
  {
    -[MFMailComposeController addressesForField:](self, "addressesForField:", 2);
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setBccRecipients:(id)a3
{
  -[MFMailComposeController _setRecipients:forField:](self, "_setRecipients:forField:", a3, 3);
}

- (id)bccRecipients
{
  NSArray *v2;

  if ((*((_BYTE *)self + 1353) & 4) != 0)
  {
    v2 = self->_bccAddresses;
  }
  else
  {
    -[MFMailComposeController addressesForField:](self, "addressesForField:", 3);
    v2 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setSavedHeaders:(id)a3
{
  MFMutableMessageHeaders *v5;
  MFMutableMessageHeaders *v6;

  v5 = (MFMutableMessageHeaders *)a3;
  if (self->_savedHeaders != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_savedHeaders, a3);
    v5 = v6;
  }

}

- (id)savedHeaders
{
  return self->_savedHeaders;
}

- (id)composeWebView
{
  if ((*((_BYTE *)self + 1352) & 0x20) != 0)
    return 0;
  else
    return self->_composeWebView;
}

- (unint64_t)contentVariationIndex
{
  return self->_selectedContentVariationIndex;
}

- (void)_updateOriginalBccStatusForRestoreAddingAddress:(BOOL)a3
{
  _BOOL4 v3;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  char v11;
  NSArray *v12;
  NSArray *originalBccAddresses;
  id v14;
  id v15;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v14, "BOOLForKey:", *MEMORY[0x1E0D1DFF8]);

  -[MFMailComposeController hideMyEmailAddressIfExists](self, "hideMyEmailAddressIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFMailComposeController sendingEmailAddress](self, "sendingEmailAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    v9 = 0;
  else
    v9 = v5;
  if (v9 == 1)
  {
    v15 = v7;
    v10 = objc_msgSend(v7, "length");
    v8 = v15;
    if (v10)
    {
      if (v3)
        v11 = *((_BYTE *)self + 1352) & 1;
      else
        v11 = 0;
      v12 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v15, 0);
      originalBccAddresses = self->_originalBccAddresses;
      self->_originalBccAddresses = v12;

      v8 = v15;
      if (v3)
      {
        -[MFMailComposeController addAddress:field:](self, "addAddress:field:", v15, 3);
        *((_BYTE *)self + 1352) = *((_BYTE *)self + 1352) & 0xFE | v11;
        v8 = v15;
      }
    }
  }

}

- (void)_updateOriginalBccStatusForRestore
{
  -[MFMailComposeController _updateOriginalBccStatusForRestoreAddingAddress:](self, "_updateOriginalBccStatusForRestoreAddingAddress:", 0);
}

- (void)_removeAutoBccSendingAddress:(id)a3
{
  NSArray *originalBccAddresses;
  id v5;

  v5 = a3;
  -[MFMailComposeController removeAddress:field:](self, "removeAddress:field:");
  -[MFMailComposeController _draftContentDidChange](self, "_draftContentDidChange");
  originalBccAddresses = self->_originalBccAddresses;
  self->_originalBccAddresses = 0;

}

- (void)_updateAutoBccSendingAddress:(id)a3 withNewSendingAddress:(id)a4 alwaysAdd:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  NSArray *v16;
  NSArray *originalBccAddresses;
  id v18;

  v5 = a5;
  v18 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLForKey:", *MEMORY[0x1E0D1DFF8]);

  if (v10 && objc_msgSend(v18, "length"))
  {
    -[MFMailComposeController _addressFieldForField:](self, "_addressFieldForField:", 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recipients");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if ((objc_msgSend(v11, "containsAddress:", v18) | v5) == 1)
    {
      -[MFMailComposeController addAddress:field:](self, "addAddress:field:", v8, 3);
      -[MFMailComposeController addressesForField:](self, "addressesForField:", 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

      if (v15 > v13)
        -[MFMailComposeController removeAddress:field:](self, "removeAddress:field:", v18, 3);
      -[MFMailComposeController _draftContentDidChange](self, "_draftContentDidChange");
      v16 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v8, 0);
      originalBccAddresses = self->_originalBccAddresses;
      self->_originalBccAddresses = v16;
    }
    else
    {
      originalBccAddresses = self->_originalBccAddresses;
      self->_originalBccAddresses = 0;
    }

  }
}

- (void)_updateAutoBccSendingAddress:(id)a3 withNewSendingAddress:(id)a4
{
  -[MFMailComposeController _updateAutoBccSendingAddress:withNewSendingAddress:alwaysAdd:](self, "_updateAutoBccSendingAddress:withNewSendingAddress:alwaysAdd:", a3, a4, 0);
}

- (void)addAddress:(id)a3 field:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  -[MFMailComposeController _addressFieldForField:](self, "_addressFieldForField:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAddress:", v9);
  objc_msgSend(v6, "addresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
    -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");

}

- (void)setAddresses:(id)a3 field:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  -[MFMailComposeController _addressFieldForField:](self, "_addressFieldForField:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAddresses:", v9);
  objc_msgSend(v6, "addresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
    -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");

}

- (void)removeAddress:(id)a3 field:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v12 = a3;
  -[MFMailComposeController _addressFieldForField:](self, "_addressFieldForField:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsAddress:", v12))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __47__MFMailComposeController_removeAddress_field___block_invoke;
    v13[3] = &unk_1E5A67C68;
    v14 = v12;
    objc_msgSend(v7, "ef_filter:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeRecipient:", v9);

    objc_msgSend(v6, "addresses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
      -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");

  }
}

uint64_t __47__MFMailComposeController_removeAddress_field___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (id)_allRecipientViews
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", self->_toField, self->_ccField, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bccField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "addObject:", v5);

  return v3;
}

- (id)_allRecipients
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[MFMailComposeController _allRecipientViews](self, "_allRecipientViews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "addresses");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v3;
}

- (BOOL)_hasRecipients
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[MFMailComposeController _allRecipientViews](self, "_allRecipientViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "recipients");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "count") == 0;

        if (!v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)_anyRecipientViewContainsAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6B8]), "initWithString:", v4);
  objc_msgSend(v5, "simpleAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[MFMailComposeController _allRecipientViews](self, "_allRecipientViews", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "containsAddress:", v6) & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)finishEnteringRecipients
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  _BOOL4 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[MFMailComposeController _allRecipientViews](self, "_allRecipientViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "textView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 == v4;

        if (v11)
        {
          objc_msgSend(v9, "finishEnteringRecipient");
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

}

- (int64_t)compositionType
{
  void *v2;
  int64_t v3;

  -[MFMailComposeController compositionContext](self, "compositionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "composeType");

  return v3;
}

- (BOOL)isManagedAccount
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D4D620], "accountContainingEmailAddress:", self->_sendingEmailAddress);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sourceIsManaged");

  return v3;
}

- (void)_willPresentDocumentPicker
{
  void *v3;
  void *v4;
  id releaseActiveFocusedState;
  id v7;
  id v8;

  if (self->_releaseActiveFocusedState)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailComposeController.m"), 2958, CFSTR("Expected _releaseActiveFocusedState to be nil"));

  }
  -[MFMailComposeController composeWebView](self, "composeWebView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_retainActiveFocusedState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");
  releaseActiveFocusedState = self->_releaseActiveFocusedState;
  self->_releaseActiveFocusedState = v4;

}

- (void)_didDismissDocumentPicker
{
  void (**releaseActiveFocusedState)(id, SEL);
  id v4;

  releaseActiveFocusedState = (void (**)(id, SEL))self->_releaseActiveFocusedState;
  if (releaseActiveFocusedState)
  {
    releaseActiveFocusedState[2](releaseActiveFocusedState, a2);
    v4 = self->_releaseActiveFocusedState;
    self->_releaseActiveFocusedState = 0;

  }
}

- (void)importDocument
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  MFLogGeneral();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1AB96A000, v3, OS_LOG_TYPE_DEFAULT, "#CompositionServices Document import started", v7, 2u);
  }

  -[MFMailComposeController _dismissPresentedHalfSheet](self, "_dismissPresentedHalfSheet");
  objc_msgSend(MEMORY[0x1E0D4D520], "supportedDocumentUTIs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3730]), "initWithDocumentTypes:inMode:", v4, 0);
  objc_msgSend(v5, "_setIsContentManaged:", -[MFMailComposeController isManagedAccount](self, "isManagedAccount"));
  objc_msgSend(v5, "setDelegate:", self);
  -[MFMailComposeController saveFirstResponder](self, "saveFirstResponder");
  -[MFMailComposeController _willPresentDocumentPicker](self, "_willPresentDocumentPicker");
  objc_msgSend(v5, "presentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  -[MFMailComposeController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v16 = a4;
  objc_msgSend(v16, "ef_map:", &__block_literal_global_309);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  MFLogGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = v17;
    _os_log_impl(&dword_1AB96A000, v5, OS_LOG_TYPE_DEFAULT, "#CompositionServices Document picker did import URLs: %{public}@", buf, 0xCu);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v16;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0D4D538], "securityScopedURL:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "startReadAccess");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          -[MFComposeWebView insertDocumentWithURL:isDrawingFile:](self->_composeWebView, "insertDocumentWithURL:isDrawingFile:", v11, 0);
          objc_msgSend(v10, "stopAccess");
        }
        else
        {
          MFLogGeneral();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v13 = (void *)MEMORY[0x1E0D1EF48];
            objc_msgSend(v9, "absoluteString");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "fullyRedactedStringForString:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v25 = v15;
            _os_log_error_impl(&dword_1AB96A000, v12, OS_LOG_TYPE_ERROR, "#CompositionServices Error occurred when attempting to acquire a security scoped URL for document at URL: %{public}@", buf, 0xCu);

          }
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");
  -[MFMailComposeController _didDismissDocumentPicker](self, "_didDismissDocumentPicker");

}

id __65__MFMailComposeController_documentPicker_didPickDocumentsAtURLs___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D1EF48];
  objc_msgSend(a2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fullyRedactedStringForString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)documentPickerWasCancelled:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  MFLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "#CompositionServices Document picker cancelled", v5, 2u);
  }

  -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");
  -[MFMailComposeController _didDismissDocumentPicker](self, "_didDismissDocumentPicker");
}

- (CGRect)_optimalRectForPresentingPopoverInComposeWebView
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat MidX;
  CGFloat MidY;
  void *v15;
  CGFloat width;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat height;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect result;

  -[MFMailComposeController composeWebView](self, "composeWebView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleBounds");
  objc_msgSend(v3, "convertRect:toView:", v2);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v47.origin.x = v6;
  v47.origin.y = v8;
  v47.size.width = v10;
  v47.size.height = v12;
  MidX = CGRectGetMidX(v47);
  v48.origin.x = v6;
  v48.origin.y = v8;
  v48.size.width = v10;
  v48.size.height = v12;
  MidY = CGRectGetMidY(v48);
  objc_msgSend(v2, "firstResponder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  width = 1.0;
  if ((objc_msgSend(v15, "conformsToProtocol:", &unk_1EEC521A0) & 1) != 0)
  {
    objc_msgSend(v15, "selectedTextRange");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEmpty"))
    {
      objc_msgSend(v17, "start");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "caretRectForPosition:", v18);
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
    }
    else
    {
      objc_msgSend(v15, "selectionRectsForRange:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (!v28)
      {

        height = 1.0;
        goto LABEL_8;
      }
      objc_msgSend(v28, "rect");
      v20 = v30;
      v22 = v31;
      v24 = v32;
      v26 = v33;

    }
    objc_msgSend(v15, "textInputView");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "convertRect:toView:", v2, v20, v22, v24, v26);
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;

    v49.origin.x = v36;
    v49.origin.y = v38;
    v49.size.width = v40;
    v49.size.height = v42;
    v50 = CGRectInset(v49, -2.0, 0.0);
    MidX = v50.origin.x;
    MidY = v50.origin.y;
    width = v50.size.width;
    height = v50.size.height;
LABEL_8:

    goto LABEL_9;
  }
  height = 1.0;
LABEL_9:

  v43 = MidX;
  v44 = MidY;
  v45 = width;
  v46 = height;
  result.size.height = v46;
  result.size.width = v45;
  result.origin.y = v44;
  result.origin.x = v43;
  return result;
}

- (void)insertPhotoOrVideo
{
  -[MFMailComposeController showPhotoPickerWithSourceType:fromSource:](self, "showPhotoPickerWithSourceType:fromSource:", 0, self->_composeWebView);
}

- (void)showPhotoPickerWithSourceType:(int64_t)a3 fromSource:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  MFLogGeneral();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = a3;
    _os_log_impl(&dword_1AB96A000, v7, OS_LOG_TYPE_DEFAULT, "#CompositionServices Showing photo picker with source: %ld", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0DC3880], "availableMediaTypesForSourceType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    if (a3 == 1)
    {
      -[MFMailComposeController _showCamera:](self, "_showCamera:", v6);
    }
    else if (_os_feature_enabled_impl())
    {
      -[MFMailComposeController _showSystemPhotoPicker:](self, "_showSystemPhotoPicker:", v6);
    }
    else
    {
      -[MFMailComposeController _showPhotoPicker:](self, "_showPhotoPicker:", v6);
    }
  }

}

- (void)_showCamera:(id)a3
{
  NSObject *v4;
  UIImagePickerController *v5;
  UIImagePickerController *cameraPickerController;
  void *v7;
  uint8_t v8[16];

  -[MFMailComposeController _dismissPresentedHalfSheet](self, "_dismissPresentedHalfSheet", a3);
  MFLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "#CompositionServices Presenting Camera", v8, 2u);
  }

  objc_msgSend(MEMORY[0x1E0DC3880], "mf_systemImagePickerWithSourceType:", 1);
  v5 = (UIImagePickerController *)objc_claimAutoreleasedReturnValue();
  cameraPickerController = self->_cameraPickerController;
  self->_cameraPickerController = v5;

  -[UIImagePickerController setDelegate:](self->_cameraPickerController, "setDelegate:", self);
  -[MFMailComposeController saveFirstResponder](self, "saveFirstResponder");
  -[MFMailComposeController parentViewController](self, "parentViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentViewController:animated:completion:", self->_cameraPickerController, 1, 0);

}

- (void)_showPhotoPicker:(id)a3
{
  id v4;
  void *v5;
  MFPhotoPickerController *photosPickerController;
  NSObject *v7;
  MFPhotoPickerProgressManager *v8;
  MFPhotoPickerController *v9;
  MFPhotoPickerController *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t v23[8];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MFMailComposeController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    photosPickerController = self->_photosPickerController;

    if (photosPickerController)
      goto LABEL_15;
  }
  MFLogGeneral();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_1AB96A000, v7, OS_LOG_TYPE_DEFAULT, "#CompositionServices Presenting Photo Picker", v23, 2u);
  }

  -[MFMailComposeController _dismissPresentedHalfSheet](self, "_dismissPresentedHalfSheet");
  v8 = objc_alloc_init(MFPhotoPickerProgressManager);
  -[MFMailComposeController setPhotoPickerProgressManager:](self, "setPhotoPickerProgressManager:", v8);
  v9 = -[MFPhotoPickerController initWithPhotoPickerProgressManager:]([MFPhotoPickerController alloc], "initWithPhotoPickerProgressManager:", v8);
  v10 = self->_photosPickerController;
  self->_photosPickerController = v9;

  -[MFPhotoPickerController setPickerDelegate:](self->_photosPickerController, "setPickerDelegate:", self);
  -[MFMailComposeController _preparePhotoPicker](self, "_preparePhotoPicker");
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", self->_photosPickerController);
  -[MFMailComposeController traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "mf_supportsPopoverPresentation");

  if (v13)
    objc_msgSend(v11, "setModalPresentationStyle:", 7);
  objc_msgSend(v11, "popoverPresentationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", self);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v14, "setSourceView:", v4);
    -[MFMailComposeController _optimalRectForPresentingPopoverInComposeWebView](self, "_optimalRectForPresentingPopoverInComposeWebView");
    objc_msgSend(v14, "setSourceRect:");
    v15 = 12;
LABEL_11:
    objc_msgSend(v14, "setPermittedArrowDirections:", v15);
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v14, "setBarButtonItem:", v4);
    v15 = 14;
    goto LABEL_11;
  }
LABEL_12:
  objc_msgSend(v11, "presentationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDelegate:", self);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = v16;
    -[MFMailComposeController _sheetDetentForIdentifier:viewController:](self, "_sheetDetentForIdentifier:viewController:", CFSTR("PhotoPickerHalfDetent"), self->_photosPickerController);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v18;
    objc_msgSend(MEMORY[0x1E0DC3C78], "largeDetent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setDetents:", v20);

    objc_msgSend(v17, "setLargestUndimmedDetentIdentifier:", CFSTR("PhotoPickerHalfDetent"));
    objc_msgSend(v17, "setPrefersEdgeAttachedInCompactHeight:", 1);
    -[MFMailComposeController composeWebView](self, "composeWebView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "retainFocusAfterPresenting");

  }
  -[MFMailComposeController parentViewController](self, "parentViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "presentViewController:animated:completion:", v11, 1, 0);

LABEL_15:
}

- (void)_showSystemPhotoPicker:(id)a3
{
  void *v4;
  MFComposePhotoPickerController *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  MFComposePhotoPickerController *v11;
  MFComposePhotoPickerController *systemPhotosPickerController;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  uint8_t buf[8];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  -[MFMailComposeController presentedViewController](self, "presentedViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || (v5 = self->_systemPhotosPickerController, v4, !v5))
  {
    MFLogGeneral();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AB96A000, v6, OS_LOG_TYPE_DEFAULT, "#CompositionServices Presenting Photo Picker", buf, 2u);
    }

    -[MFMailComposeController _dismissPresentedHalfSheet](self, "_dismissPresentedHalfSheet");
    v7 = (void *)MEMORY[0x1E0C99E60];
    -[MFMailComposeController composeWebView](self, "composeWebView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentIDsForMediaAttachments");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[MFComposePhotoPickerController initWithPreselectedAssetIdentifiers:]([MFComposePhotoPickerController alloc], "initWithPreselectedAssetIdentifiers:", v10);
    systemPhotosPickerController = self->_systemPhotosPickerController;
    self->_systemPhotosPickerController = v11;

    -[MFComposePhotoPickerController setDelegate:](self->_systemPhotosPickerController, "setDelegate:", self);
    -[MFMailComposeController traitCollection](self, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = objc_msgSend(v13, "mf_supportsPopoverPresentation");

    if ((v9 & 1) == 0)
    {
      -[MFComposePhotoPickerController pickerViewController](self->_systemPhotosPickerController, "pickerViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "presentationController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setDelegate:", self);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = v15;
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __50__MFMailComposeController__showSystemPhotoPicker___block_invoke;
        v23[3] = &unk_1E5A67CD0;
        v23[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3C78], "customDetentWithIdentifier:resolver:", CFSTR("PhotoPickerHalfDetent"), v23);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v17;
        objc_msgSend(MEMORY[0x1E0DC3C78], "largeDetent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v25[1] = v18;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setDetents:", v19);

        objc_msgSend(v16, "setLargestUndimmedDetentIdentifier:", CFSTR("PhotoPickerHalfDetent"));
        objc_msgSend(v16, "setPrefersEdgeAttachedInCompactHeight:", 1);
        objc_msgSend(v16, "setPrefersGrabberVisible:", 1);
        -[MFMailComposeController composeWebView](self, "composeWebView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "retainFocusAfterPresenting");

      }
    }
    -[MFMailComposeController parentViewController](self, "parentViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposePhotoPickerController pickerViewController](self->_systemPhotosPickerController, "pickerViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "presentViewController:animated:completion:", v22, 1, 0);

  }
}

double __50__MFMailComposeController__showSystemPhotoPicker___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1128);
  objc_msgSend(a2, "containerTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredHeightForTraitCollection:", v3);
  v5 = v4;

  return v5;
}

- (void)_preparePhotoPicker
{
  void *v3;
  id v4;

  -[MFMailComposeController composeWebView](self, "composeWebView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentIDsForMediaAttachments");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[MFPhotoPickerController addSelectedAssetIdentifiers:](self->_photosPickerController, "addSelectedAssetIdentifiers:", v4);

}

- (void)photoPickerDidCancel:(id)a3
{
  NSObject *v4;
  void *v5;
  MFPhotoPickerController *photosPickerController;
  uint8_t v7[16];

  MFLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "#CompositionServices Photo Picker dismissed", v7, 2u);
  }

  -[MFMailComposeController composeWebView](self, "composeWebView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "releaseFocusAfterDismissing:", 1);

  -[MFPhotoPickerController dismissViewControllerAnimated:completion:](self->_photosPickerController, "dismissViewControllerAnimated:completion:", 1, 0);
  photosPickerController = self->_photosPickerController;
  self->_photosPickerController = 0;

  -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");
}

- (void)photoPickerDidCancelSystemImagePicker:(id)a3
{
  id v4;

  v4 = a3;
  -[MFMailComposeController _retainFocusOfComposeWebViewIfRequired:](self, "_retainFocusOfComposeWebViewIfRequired:");
  -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");

}

- (void)photoPicker:(id)a3 didSelectAssetWithIdentifier:(id)a4 mediaInfo:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  MFLogGeneral();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1AB96A000, v9, OS_LOG_TYPE_DEFAULT, "#CompositionServices Photo Picker did select asset %{public}@", (uint8_t *)&v10, 0xCu);
  }

  -[MFMailComposeController insertPhotoOrVideoWithAssetIdentifier:info:](self, "insertPhotoOrVideoWithAssetIdentifier:info:", v7, v8);
}

- (void)photoPicker:(id)a3 didDeselectAssetWithIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[MFComposePhotoPickerItem contentIdentifierPrefix](MFComposePhotoPickerItem, "contentIdentifierPrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  MFLogGeneral();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1AB96A000, v8, OS_LOG_TYPE_DEFAULT, "#CompositionServices Photo Picker did deselect asset with content identifier: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  -[MFComposeWebView removeMediaWithContentIdentifier:](self->_composeWebView, "removeMediaWithContentIdentifier:", v7);
}

- (id)presentingViewControllerForPhotoPicker:(id)a3
{
  void *v4;
  int v5;
  void *v6;

  -[MFMailComposeController traitCollection](self, "traitCollection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mf_supportsPopoverPresentation");

  if (v5)
  {
    -[MFMailComposeController parentViewController](self, "parentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)imagePickerControllerDidCancel:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  MFLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "#CompositionServices Photo Picker did cancel", v5, 2u);
  }

  -[MFMailComposeController _dismissAndCleanupCameraPickerController](self, "_dismissAndCleanupCameraPickerController");
}

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint8_t v10[16];

  v5 = a4;
  MFLogGeneral();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1AB96A000, v6, OS_LOG_TYPE_DEFAULT, "#CompositionServices Photo Picker did finish", v10, 2u);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0DC58F0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("-"));
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  -[MFMailComposeController insertPhotoOrVideoWithAssetIdentifier:info:](self, "insertPhotoOrVideoWithAssetIdentifier:info:", v8, v5);
  -[MFMailComposeController _dismissAndCleanupCameraPickerController](self, "_dismissAndCleanupCameraPickerController");

}

- (void)_dismissAndCleanupCameraPickerController
{
  UIImagePickerController *cameraPickerController;

  -[UIImagePickerController dismissViewControllerAnimated:completion:](self->_cameraPickerController, "dismissViewControllerAnimated:completion:", 1, 0);
  cameraPickerController = self->_cameraPickerController;
  self->_cameraPickerController = 0;

  -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");
}

- (void)photoPickerController:(id)a3 didAddItem:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  MFComposeWebView *composeWebView;
  id v9;
  _QWORD v10[4];
  id v11;
  MFMailComposeController *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  MFLogGeneral();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "assetIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v7;
    _os_log_impl(&dword_1AB96A000, v6, OS_LOG_TYPE_DEFAULT, "#CompositionServices Photo Picker did add asset %{public}@", buf, 0xCu);

  }
  composeWebView = self->_composeWebView;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__MFMailComposeController_photoPickerController_didAddItem___block_invoke;
  v10[3] = &unk_1E5A65430;
  v9 = v5;
  v11 = v9;
  v12 = self;
  -[MFComposeWebView insertMediaWithPhotoPickerItem:completion:](composeWebView, "insertMediaWithPhotoPickerItem:completion:", v9, v10);

}

void __60__MFMailComposeController_photoPickerController_didAddItem___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  MFLogGeneral();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "assetIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1AB96A000, v2, OS_LOG_TYPE_DEFAULT, "#CompositionServices webview did add asset %{public}@", (uint8_t *)&v6, 0xCu);

  }
  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "assetURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_deleteFileAtURLIfInTmp:", v5);

}

- (void)photoPickerController:(id)a3 didRemoveAsset:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  +[MFComposePhotoPickerItem contentIdentifierPrefix](MFComposePhotoPickerItem, "contentIdentifierPrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  MFLogGeneral();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_1AB96A000, v8, OS_LOG_TYPE_DEFAULT, "#CompositionServices Photo Picker did remove asset with content identifier: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  -[MFComposeWebView removeMediaWithContentIdentifier:](self->_composeWebView, "removeMediaWithContentIdentifier:", v7);
}

- (void)photoPickerControllerDidCancel:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  MFComposePhotoPickerController *systemPhotosPickerController;
  uint8_t v8[16];

  MFLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "#CompositionServices Photo Picker dismissed", v8, 2u);
  }

  -[MFMailComposeController composeWebView](self, "composeWebView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "releaseFocusAfterDismissing:", 1);

  -[MFComposePhotoPickerController pickerViewController](self->_systemPhotosPickerController, "pickerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

  systemPhotosPickerController = self->_systemPhotosPickerController;
  self->_systemPhotosPickerController = 0;

  -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");
}

- (void)insertPhotoOrVideoWithAssetIdentifier:(id)a3 info:(id)a4
{
  id v6;
  MFComposeWebView *composeWebView;
  id v8;
  _QWORD v9[4];
  id v10;
  MFMailComposeController *v11;

  v6 = a4;
  composeWebView = self->_composeWebView;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__MFMailComposeController_insertPhotoOrVideoWithAssetIdentifier_info___block_invoke;
  v9[3] = &unk_1E5A65430;
  v10 = v6;
  v11 = self;
  v8 = v6;
  -[MFComposeWebView insertPhotoOrVideoWithAssetIdentifier:infoDictionary:completion:](composeWebView, "insertPhotoOrVideoWithAssetIdentifier:infoDictionary:completion:", a3, v8, v9);

}

void __70__MFMailComposeController_insertPhotoOrVideoWithAssetIdentifier_info___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0DC4C98]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_deleteFileAtURLIfInTmp:");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *MEMORY[0x1E0DC5878]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_deleteFileAtURLIfInTmp:", v2);

}

- (void)_deleteFileAtURLIfInTmp:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _BYTE v16[24];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "relativePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSTemporaryDirectory();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "hasPrefix:", v6);

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v9 = objc_msgSend(v8, "removeItemAtURL:error:", v4, &v15);
      v10 = v15;

      if ((v9 & 1) == 0)
      {
        MFLogGeneral();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = (void *)MEMORY[0x1E0D1EF48];
          objc_msgSend(v4, "absoluteString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "fullyRedactedStringForString:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFMailComposeController _deleteFileAtURLIfInTmp:].cold.1(v14, (uint64_t)v16, (uint64_t)v11, v13);
        }

      }
    }
  }

}

- (void)_updateSendAndCloseEnabled
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = -[MFMailComposeController _shouldEnableSendButton](self, "_shouldEnableSendButton");
  -[MFMailComposeController quickReplyActionButtonProvider](self, "quickReplyActionButtonProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "quickReplySendButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "quickReplyExpandButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItem setEnabled:](self->_sendButtonItem, "setEnabled:", v3);
  -[UIBarButtonItem setEnabled:](self->_sendLaterButtonItem, "setEnabled:", v3);
  objc_msgSend(v4, "setEnabled:", v3);
  -[UIButton setEnabled:](self->_sendAccessoryButton, "setEnabled:", v3);
  objc_msgSend(v5, "setUserInteractionEnabled:", v3);
  objc_msgSend(v5, "setHidden:", v3 ^ 1);
  objc_msgSend(v4, "setUserInteractionEnabled:", v3);
  -[UIButton setUserInteractionEnabled:](self->_sendAccessoryButton, "setUserInteractionEnabled:", v3);
  -[UIBarButtonItem setEnabled:](self->_closeButtonItem, "setEnabled:", -[MFMailComposeController _shouldEnableCloseButton](self, "_shouldEnableCloseButton"));

}

- (void)_updateSendAndCloseButtonTintColor
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  -[MFMailComposeController view](self, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tintColor");
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "mailInteractiveColor");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (id)v5;
  -[UIBarButtonItem setTintColor:](self->_sendButtonItem, "setTintColor:");
  -[UIBarButtonItem setTintColor:](self->_closeButtonItem, "setTintColor:", v9);
  -[UIButton setTintColor:](self->_sendAccessoryButton, "setTintColor:", v9);
  -[MFMailComposeController quickReplyActionButtonProvider](self, "quickReplyActionButtonProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "quickReplyExpandButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v9);

}

- (BOOL)_isPopoverOrActionSheetOrAlertVisible
{
  void *v2;
  void *v4;
  BOOL v5;
  MFPhotoPickerController *photosPickerController;
  void *v7;

  if ((*((_BYTE *)self + 1353) & 2) == 0)
  {
    -[MFMailComposeController popoverAlert](self, "popoverAlert");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = 1;
LABEL_10:

      return v5;
    }
    photosPickerController = self->_photosPickerController;
    if (photosPickerController
      && (-[MFPhotoPickerController parentViewController](self->_photosPickerController, "parentViewController"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v2, "modalPresentationStyle") == 7))
    {
      v5 = 1;
    }
    else
    {
      -[MFMailComposeController documentCameraViewController](self, "documentCameraViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v7 != 0;

      if (!photosPickerController)
        goto LABEL_10;
    }

    goto LABEL_10;
  }
  return 1;
}

- (BOOL)_shouldEnableSendButton
{
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  const char *v6;
  char v7;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  NSObject *v14;
  _BOOL4 encryptionStatusIsKnown;
  void *v16;
  void *v17;
  void *v18;
  _DWORD v19[2];
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (-[MFMailComposeController hasActiveWritingToolsSession](self, "hasActiveWritingToolsSession"))
  {
    MFLogGeneral();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19[0]) = 0;
      v4 = "#CompositionServices Has active writing tools session.";
LABEL_10:
      _os_log_impl(&dword_1AB96A000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)v19, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (-[MFMailComposeController _isSetupForDelivery](self, "_isSetupForDelivery"))
  {
    -[MFMailComposeController mailComposeView](self, "mailComposeView");
    v3 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isLoading](v3, "isLoading"))
    {
      MFLogGeneral();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19[0]) = 0;
        v6 = "#CompositionServices Composition loading.";
LABEL_15:
        _os_log_impl(&dword_1AB96A000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)v19, 2u);
      }
    }
    else if (-[MFMailComposeController _isPopoverOrActionSheetOrAlertVisible](self, "_isPopoverOrActionSheetOrAlertVisible"))
    {
      MFLogGeneral();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v19[0]) = 0;
        v6 = "#CompositionServices Popover/alert visible.";
        goto LABEL_15;
      }
    }
    else
    {
      -[MFMailComposeController mailComposeView](self, "mailComposeView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isQuickReply");

      if (v10 && !-[MFMailComposeController hasMessageBodyContent](self, "hasMessageBodyContent"))
        goto LABEL_11;
      -[MFMailComposeController _allRecipientViews](self, "_allRecipientViews");
      v5 = objc_claimAutoreleasedReturnValue();
      v11 = -[NSObject ef_any:](v5, "ef_any:", &__block_literal_global_545);
      v12 = -[NSObject ef_any:](v5, "ef_any:", &__block_literal_global_546);
      if (((v11 | v12) & 1) != 0)
      {
        if (-[MFMailComposeController _wantsEncryption](self, "_wantsEncryption")
          && (!self->_encryptionStatusIsKnown ? (v13 = 1) : (v13 = v12), v13 == 1))
        {
          MFLogGeneral();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            encryptionStatusIsKnown = self->_encryptionStatusIsKnown;
            v19[0] = 67109376;
            v19[1] = encryptionStatusIsKnown;
            v20 = 1024;
            v21 = v12;
            _os_log_impl(&dword_1AB96A000, v14, OS_LOG_TYPE_DEFAULT, "#CompositionServices eKnown: %d, hasUnfinished: %d", (uint8_t *)v19, 0xEu);
          }

        }
        else if ((-[NSObject isLoadingFromAddress](v3, "isLoadingFromAddress") & 1) == 0)
        {
          if ((*((_BYTE *)self + 1352) & 2) != 0 || -[MFMailComposeController hasAttachments](self, "hasAttachments"))
          {
            v7 = 1;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[MFComposeSubjectView text](self->_subjectField, "text");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v16);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v18, "length"))
              v7 = v10 ^ 1;
            else
              v7 = 0;

          }
          goto LABEL_17;
        }
      }
    }
    v7 = 0;
LABEL_17:

    goto LABEL_18;
  }
  MFLogGeneral();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19[0]) = 0;
    v4 = "#CompositionServices Not set up for delivery.";
    goto LABEL_10;
  }
LABEL_11:
  v7 = 0;
LABEL_18:

  return v7;
}

BOOL __50__MFMailComposeController__shouldEnableSendButton__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "recipients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

BOOL __50__MFMailComposeController__shouldEnableSendButton__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;

  v2 = a2;
  if (objc_msgSend(v2, "editable"))
  {
    objc_msgSend(v2, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length") != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_shouldEnableCloseButton
{
  return !-[MFMailComposeController _isPopoverOrActionSheetOrAlertVisible](self, "_isPopoverOrActionSheetOrAlertVisible");
}

- (BOOL)sendingAccountIsExchange
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D4D620], "accountContainingEmailAddress:", self->_sendingEmailAddress);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = 1;
  }

  return v3;
}

- (id)shouldCreateRichTextRepresentation
{
  void *v3;

  if (-[MFMailComposeController useMailDrop](self, "useMailDrop")
    || -[MFMailComposeController sendingAccountIsExchange](self, "sendingAccountIsExchange")
    && -[MFMailComposeController hasAttachments](self, "hasAttachments"))
  {
    objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MFComposeWebView containsRichText](self->_composeWebView, "containsRichText");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)attachments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[MFMailComposeController compositionContext](self, "compositionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    -[MFMailComposeController compositionContext](self, "compositionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachmentManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attachmentsForContext:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)hasAttachments
{
  void *v2;
  BOOL v3;

  -[MFMailComposeController attachments](self, "attachments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (CGRect)frameForAttachmentWithIdentifier:(id)a3
{
  id v4;
  double x;
  double y;
  double width;
  double height;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect result;

  v4 = a3;
  -[MFComposeWebView rectOfElementWithID:](self->_composeWebView, "rectOfElementWithID:", v4);
  x = v18.origin.x;
  y = v18.origin.y;
  width = v18.size.width;
  height = v18.size.height;
  if (!CGRectEqualToRect(v18, *MEMORY[0x1E0C9D648]))
  {
    -[MFMailComposeController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertRect:fromView:", self->_composeWebView, x, y, width, height);
    x = v10;
    y = v11;
    width = v12;
    height = v13;

  }
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)rectOfAttachment:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  objc_msgSend(a3, "fileWrapperForcingDownload:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController frameForAttachmentWithIdentifier:](self, "frameForAttachmentWithIdentifier:", v5);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)setContentVisible:(BOOL)a3
{
  MFComposeWebView *composeWebView;
  double v4;

  if (self->_contentVisible != a3)
  {
    self->_contentVisible = a3;
    composeWebView = self->_composeWebView;
    v4 = 0.0;
    if (a3)
      v4 = 1.0;
    -[MFComposeWebView setAlpha:](composeWebView, "setAlpha:", v4);
  }
}

- (void)didCreateAttachment:(id)a3
{
  id v4;
  NSObject *imageScalingGroup;
  OS_dispatch_group *v6;
  OS_dispatch_group *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  id location;
  _QWORD v22[5];

  v4 = a3;
  if (-[MFMailComposeController canShowImageSizeField](self, "canShowImageSizeField"))
  {
    imageScalingGroup = self->_imageScalingGroup;
    if (!imageScalingGroup)
    {
      v6 = (OS_dispatch_group *)dispatch_group_create();
      v7 = self->_imageScalingGroup;
      self->_imageScalingGroup = v6;

      imageScalingGroup = self->_imageScalingGroup;
    }
    dispatch_group_enter(imageScalingGroup);
    v8 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __47__MFMailComposeController_didCreateAttachment___block_invoke;
    v22[3] = &unk_1E5A67D58;
    v22[4] = self;
    objc_msgSend(v4, "enqueueScaleAttachmentWithCompletionBlock:", v22);
    objc_msgSend(MEMORY[0x1E0D46158], "weakReferenceWithObject:", self->_imageScalingGroup);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v10 = self->_imageScalingGroup;
    v15 = v8;
    v16 = 3221225472;
    v17 = __47__MFMailComposeController_didCreateAttachment___block_invoke_2;
    v18 = &unk_1E5A67D80;
    v19 = v9;
    v11 = v9;
    objc_copyWeak(&v20, &location);
    dispatch_group_notify(v10, MEMORY[0x1E0C80D38], &v15);
    objc_destroyWeak(&v20);

    objc_destroyWeak(&location);
  }
  -[MFMailComposeController mailComposeView](self, "mailComposeView", v15, v16, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isQuickReply");

  if (v13)
  {
    -[MFMailComposeController quickReplyDelegate](self, "quickReplyDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mailComposeController:willMigrateToFullComposeWithReason:", self, 0);

  }
}

void __47__MFMailComposeController_didCreateAttachment___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 1424));
}

void __47__MFMailComposeController_didCreateAttachment___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  intptr_t v4;
  id WeakRetained;
  NSObject *v6;

  objc_msgSend(*(id *)(a1 + 32), "reference");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v6 = v2;
    v4 = dispatch_group_wait(v2, 0);
    v3 = v6;
    if (!v4)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      objc_msgSend(WeakRetained, "_updateImageSizeTitles");

      v3 = v6;
    }
  }

}

- (void)didInsertAttachment:(id)a3
{
  void *v4;
  int v5;
  void *v6;

  -[MFMailComposeController mailComposeView](self, "mailComposeView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isQuickReply");

  if (v5)
  {
    *((_BYTE *)self + 1352) |= 1u;
    -[MFMailComposeController composeWebView](self, "composeWebView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDirty:", 1);

    -[MFMailComposeController expandQuickReplyToFullCompose](self, "expandQuickReplyToFullCompose");
  }
}

- (id)_attachmentToMarkup
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[MFMailComposeController compositionContext](self, "compositionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentToMarkupContentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[MFMailComposeController attachments](self, "attachments", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v9, "contentID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFMailComposeController compositionContext](self, "compositionContext");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "attachmentToMarkupContentID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v10, "isEqualToString:", v12);

          if (v13)
          {
            v14 = v9;
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v6)
          continue;
        break;
      }
    }
    v14 = 0;
LABEL_12:

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (id)currentScaleImageSize
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[MFMailComposeController _sizeForScale:imagesOnly:](self, "_sizeForScale:imagesOnly:", +[MFComposeTypeFactory imageScaleFromUserDefaults](MFComposeTypeFactory, "imageScaleFromUserDefaults"), 1);
  if (v3)
  {
    v4 = (unint64_t)v3;
    v5 = -[MFMailComposeController _sizeForScale:imagesOnly:](self, "_sizeForScale:imagesOnly:", 0, 1);
    if (v4 >= v5)
      v6 = v5;
    else
      v6 = v4;
    objc_msgSend(MEMORY[0x1E0CB3940], "mf_stringRepresentationForBytes:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_updateImageSizeTitles
{
  void *v3;
  void *v4;
  MFComposeImageSizeView *v5;
  MFComposeImageSizeView *imageSizeField;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  MFComposeImageSizeView *v13;
  void *v14;
  MFComposeImageSizeView *v15;
  void *v16;
  MFComposeImageSizeView *v17;
  void *v18;
  MFComposeImageSizeView *v19;
  void *v20;

  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toggleImageSizeFieldIfNecessary");

  if (-[MFMailComposeController canShowImageSizeField](self, "canShowImageSizeField"))
  {
    if (!self->_imageSizeField)
    {
      -[MFMailComposeController mailComposeView](self, "mailComposeView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "imageSizeField");
      v5 = (MFComposeImageSizeView *)objc_claimAutoreleasedReturnValue();
      imageSizeField = self->_imageSizeField;
      self->_imageSizeField = v5;

      -[MFComposeImageSizeView setDelegate:](self->_imageSizeField, "setDelegate:", self);
    }
    v7 = +[MFComposeTypeFactory imageScaleFromUserDefaults](MFComposeTypeFactory, "imageScaleFromUserDefaults");
    v8 = -[MFMailComposeController _sizeForScale:imagesOnly:](self, "_sizeForScale:imagesOnly:", 0, 1);
    if (v8)
    {
      v9 = v8;
      v10 = -[MFMailComposeController _sizeForScale:imagesOnly:](self, "_sizeForScale:imagesOnly:", 4, 1);
      v11 = -[MFMailComposeController _sizeForScale:imagesOnly:](self, "_sizeForScale:imagesOnly:", 2, 1);
      v12 = -[MFMailComposeController _sizeForScale:imagesOnly:](self, "_sizeForScale:imagesOnly:", 1, 1);
      v13 = self->_imageSizeField;
      objc_msgSend(MEMORY[0x1E0CB3940], "mf_stringRepresentationForBytes:", v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFComposeImageSizeView setSizeDescription:forScale:](v13, "setSizeDescription:forScale:", v14, 0);

      v15 = self->_imageSizeField;
      if (v10 >= v9)
      {
        -[MFComposeImageSizeView removeSizeDescriptionForScale:](self->_imageSizeField, "removeSizeDescriptionForScale:", 4);
        if (v7 == 4)
          v7 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "mf_stringRepresentationForBytes:", v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFComposeImageSizeView setSizeDescription:forScale:](v15, "setSizeDescription:forScale:", v16, 4);

      }
      v17 = self->_imageSizeField;
      if (v11 >= v9)
      {
        -[MFComposeImageSizeView removeSizeDescriptionForScale:](self->_imageSizeField, "removeSizeDescriptionForScale:", 2);
        if (v7 == 2)
          v7 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "mf_stringRepresentationForBytes:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFComposeImageSizeView setSizeDescription:forScale:](v17, "setSizeDescription:forScale:", v18, 2);

      }
      v19 = self->_imageSizeField;
      if (v12 >= v9)
      {
        -[MFComposeImageSizeView removeSizeDescriptionForScale:](self->_imageSizeField, "removeSizeDescriptionForScale:", 1);
        if (v7 == 1)
          v7 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "mf_stringRepresentationForBytes:", v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFComposeImageSizeView setSizeDescription:forScale:](v19, "setSizeDescription:forScale:", v20, 1);

      }
    }
    else
    {
      -[MFMailComposeController _setInitialStateForImageField](self, "_setInitialStateForImageField");
    }
    -[MFComposeImageSizeView setScale:](self->_imageSizeField, "setScale:", v7);
  }
}

- (void)_setInitialStateForImageField
{
  MFComposeImageSizeView *imageSizeField;
  void *v4;
  MFComposeImageSizeView *v5;
  void *v6;
  MFComposeImageSizeView *v7;
  void *v8;
  MFComposeImageSizeView *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;

  if (-[MFMailComposeController canShowImageSizeField](self, "canShowImageSizeField"))
  {
    imageSizeField = self->_imageSizeField;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("IMAGE_SIZE_PLACEHOLDER_DURING_COMPUTATION"), &stru_1E5A6A588, CFSTR("Main"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeImageSizeView setSizeDescription:forScale:](imageSizeField, "setSizeDescription:forScale:", v4, 0);

    v5 = self->_imageSizeField;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("IMAGE_SIZE_PLACEHOLDER_DURING_COMPUTATION"), &stru_1E5A6A588, CFSTR("Main"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeImageSizeView setSizeDescription:forScale:](v5, "setSizeDescription:forScale:", v6, 4);

    v7 = self->_imageSizeField;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("IMAGE_SIZE_PLACEHOLDER_DURING_COMPUTATION"), &stru_1E5A6A588, CFSTR("Main"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeImageSizeView setSizeDescription:forScale:](v7, "setSizeDescription:forScale:", v8, 2);

    v9 = self->_imageSizeField;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("IMAGE_SIZE_PLACEHOLDER_DURING_COMPUTATION"), &stru_1E5A6A588, CFSTR("Main"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFComposeImageSizeView setSizeDescription:forScale:](v9, "setSizeDescription:forScale:", v10, 1);

  }
}

- (void)_scaleImages
{
  unint64_t v3;

  v3 = +[MFComposeTypeFactory imageScaleFromUserDefaults](MFComposeTypeFactory, "imageScaleFromUserDefaults");
  -[MFMailComposeController _beginBlockingBodyScroll](self, "_beginBlockingBodyScroll");
  -[MFComposeWebView scaleImagesToScale:](self->_composeWebView, "scaleImagesToScale:", v3);
  -[MFMailComposeController _endBlockingBodyScroll](self, "_endBlockingBodyScroll");
}

- (void)_unscaleImages
{
  -[MFComposeWebView unscaleImages](self->_composeWebView, "unscaleImages");
}

- (void)imageSizeView:(id)a3 changedSelectedScaleTo:(unint64_t)a4
{
  void *v5;
  void *v6;

  v5 = (void *)MEMORY[0x1E0C99EA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mf_setCompositionServicesPreferenceValue:forKey:", v6, *MEMORY[0x1E0D4D7F0]);

  -[MFMailComposeController _scaleImages](self, "_scaleImages");
}

- (void)_setIsLoading:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLoading:", v3);

  -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");
}

- (unint64_t)_sizeForScale:(unint64_t)a3 imagesOnly:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v4 = a4;
  -[MFMailComposeController compositionContext](self, "compositionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attachmentManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController compositionContext](self, "compositionContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contextID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "sizeForScale:imagesOnly:forContext:", a3, v4, v10);

  return v11;
}

- (void)contentDidChange
{
  -[MFMailComposeController _setAutosaveIsValid:](self, "_setAutosaveIsValid:", 0);
}

- (BOOL)_shouldAutoSaveQuickReply
{
  void *v3;
  int v4;
  _BOOL4 v5;

  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isQuickReply");

  if (v4)
  {
    v5 = -[MFComposeWebView isDirty](self->_composeWebView, "isDirty");
    if (v5)
      LOBYTE(v5) = *((_BYTE *)self + 1352) & 1;
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)_startAutosaveTimerIfNeeded
{
  void *v3;
  NSTimer *v4;
  NSTimer *autosaveTimer;
  _QWORD v6[4];
  id v7;
  id location;

  if (*((char *)self + 1352) < 0 && !self->_autosaveTimer)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x1E0C99E88];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __54__MFMailComposeController__startAutosaveTimerIfNeeded__block_invoke;
    v6[3] = &unk_1E5A67DA8;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 1, v6, 0.5);
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    autosaveTimer = self->_autosaveTimer;
    self->_autosaveTimer = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __54__MFMailComposeController__startAutosaveTimerIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_autosaveTimerFired:", v3);

}

- (void)_setAutosaveIsValid:(BOOL)a3
{
  _BOOL4 v3;
  NSDate *v5;
  NSDate *lastActiveDate;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  if (self->_autosaveIsValid != a3)
  {
    v3 = a3;
    self->_autosaveIsValid = a3;
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lastActiveDate = self->_lastActiveDate;
      self->_lastActiveDate = v5;

      -[MFMailComposeController _startAutosaveTimerIfNeeded](self, "_startAutosaveTimerIfNeeded");
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("AutosaveIndicator"));

    if (v8)
    {
      if (v3)
      {
        if (_setAutosaveIsValid__onceToken != -1)
          dispatch_once(&_setAutosaveIsValid__onceToken, &__block_literal_global_557);
        v9 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend((id)_setAutosaveIsValid__dateFormatter, "stringFromDate:", self->_autosavedDate);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("Autosaved @ %@"), v10);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        -[MFMailComposeController _setTitleBarSubtitleText:style:](self, "_setTitleBarSubtitleText:style:", v11, 1);
      }
      else
      {
        -[MFMailComposeController _setTitleBarSubtitleText:style:](self, "_setTitleBarSubtitleText:style:", CFSTR("Not Saved"), 2);
      }
    }
  }
}

void __47__MFMailComposeController__setAutosaveIsValid___block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  v0 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dateFormatFromTemplate:options:locale:", CFSTR("HH:mm:ss"), 0, v1);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v3 = (void *)_setAutosaveIsValid__dateFormatter;
  _setAutosaveIsValid__dateFormatter = (uint64_t)v2;

  objc_msgSend((id)_setAutosaveIsValid__dateFormatter, "setDateFormat:", v4);
}

- (BOOL)_shouldAutosaveAfterTimerFiredWithInterval:(double)a3
{
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  NSDate *autosavedDate;
  unsigned int lastTypedCharacter;
  double v17;
  BOOL v20;
  __CFString *v21;
  uint64_t v23;

  if (-[MFMailComposeController _isDummyViewController](self, "_isDummyViewController"))
  {
LABEL_28:
    LOBYTE(v5) = 0;
    return v5;
  }
  v5 = -[MFMailComposeController _shouldAutoSaveQuickReply](self, "_shouldAutoSaveQuickReply");
  if (v5)
  {
    -[NSDate timeIntervalSinceNow](self->_autosavedDate, "timeIntervalSinceNow");
    if (self->_autosaveIsValid)
      goto LABEL_28;
    autosavedDate = self->_autosavedDate;
    if (autosavedDate && v13 >= -2.0)
      goto LABEL_28;
    lastTypedCharacter = self->_lastTypedCharacter;
    v17 = 0.5;
    if (lastTypedCharacter <= 0x6D3)
    {
      if (lastTypedCharacter == 10 || lastTypedCharacter == 46)
        goto LABEL_21;
    }
    else if (lastTypedCharacter == 1748 || lastTypedCharacter == 12290 || lastTypedCharacter == 65377)
    {
LABEL_21:
      if (autosavedDate)
        v20 = v17 < -a3;
      else
        v20 = 1;
      if (!v20)
        goto LABEL_28;
      if (fabs(v17 + -2.0) >= 0.00000011920929)
      {
        if (fabs(v17 + -0.5) >= 0.00000011920929)
        {
LABEL_33:
          LOBYTE(v5) = 1;
          return v5;
        }
        v21 = CFSTR("Autosaving now based on terminal edge");
      }
      else
      {
        v21 = CFSTR("Autosaving based on idle delay");
      }
      _MFAutosaveLog(v21, v6, v7, v8, v9, v10, v11, v12, v23);
      goto LABEL_33;
    }
    v17 = 2.0;
    goto LABEL_21;
  }
  return v5;
}

- (void)_autosaveTimerFired:(id)a3
{
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];

  -[NSDate timeIntervalSinceNow](self->_lastActiveDate, "timeIntervalSinceNow", a3);
  if (-[MFMailComposeController _shouldAutosaveAfterTimerFiredWithInterval:](self, "_shouldAutosaveAfterTimerFiredWithInterval:")&& (*((_BYTE *)self + 1352) & 0x20) == 0)
  {
    v4 = MEMORY[0x1E0C809B0];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__MFMailComposeController__autosaveTimerFired___block_invoke;
    v7[3] = &unk_1E5A66C68;
    v7[4] = self;
    -[MFMailComposeController autosaveWithHandler:](self, "autosaveWithHandler:", v7);
    -[MFMailComposeController composeCoordinator](self, "composeCoordinator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6[0] = v4;
      v6[1] = 3221225472;
      v6[2] = __47__MFMailComposeController__autosaveTimerFired___block_invoke_3;
      v6[3] = &unk_1E5A67E18;
      v6[4] = self;
      -[MFMailComposeController _performBlockWithStrongComposeCoordinator:](self, "_performBlockWithStrongComposeCoordinator:", v6);
    }
  }
}

void __47__MFMailComposeController__autosaveTimerFired___block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__MFMailComposeController__autosaveTimerFired___block_invoke_2;
  block[3] = &unk_1E5A65480;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __47__MFMailComposeController__autosaveTimerFired___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MFMailComposeControllerDidSmartAutosaveNotification"), *(_QWORD *)(a1 + 32));

}

void __47__MFMailComposeController__autosaveTimerFired___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  uint64_t v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__MFMailComposeController__autosaveTimerFired___block_invoke_4;
  v6[3] = &unk_1E5A65430;
  v7 = *(_QWORD *)(a1 + 32);
  v4 = v3;
  v8 = v4;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", v6[0], 3221225472, __47__MFMailComposeController__autosaveTimerFired___block_invoke_4, &unk_1E5A65430, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performSyncBlock:", v6);

}

void __47__MFMailComposeController__autosaveTimerFired___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "mailComposeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "composeWebView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__MFMailComposeController__autosaveTimerFired___block_invoke_5;
  v5[3] = &unk_1E5A67DF0;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "getHTMLDataObject:", v5);

}

void __47__MFMailComposeController__autosaveTimerFired___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "mailComposeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "composeWebView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__MFMailComposeController__autosaveTimerFired___block_invoke_6;
  v7[3] = &unk_1E5A67DF0;
  v6 = v3;
  v8 = v6;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v5, "getHTMLDataObjectRemovingSignature:completion:", 1, v7);

}

void __47__MFMailComposeController__autosaveTimerFired___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "plainTextAlternative");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "plainTextAlternative");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", v7, &stru_1E5A6A588);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqual:", CFSTR("\n")) & 1) != 0)
  {
    if (objc_msgSend(v8, "length"))
      objc_msgSend(*(id *)(a1 + 40), "setSignature:", v8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setBody:", v6);
  }

}

- (NSString)autosaveIdentifier
{
  NSString *autosaveIdentifier;
  NSString *v4;
  NSString *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *v12;
  NSString *v13;

  -[MFLock lock](self->_autosaveLock, "lock");
  autosaveIdentifier = self->_autosaveIdentifier;
  if (!autosaveIdentifier)
  {
    -[_MFMailCompositionContext autosaveIdentifier](self->_compositionContext, "autosaveIdentifier");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = self->_autosaveIdentifier;
    self->_autosaveIdentifier = v4;

    autosaveIdentifier = self->_autosaveIdentifier;
    if (!autosaveIdentifier)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0CB3998]);
      objc_msgSend(v6, "setScheme:", CFSTR("x-apple-mail"));
      objc_msgSend(v6, "setHost:", CFSTR("document"));
      v7 = (void *)MEMORY[0x1E0CB3940];
      -[MFMailComposeController documentID](self, "documentID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("/%@"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setPath:", v9);

      objc_msgSend(v6, "URL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "absoluteString");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      v12 = self->_autosaveIdentifier;
      self->_autosaveIdentifier = v11;

      autosaveIdentifier = self->_autosaveIdentifier;
    }
  }
  v13 = autosaveIdentifier;
  -[MFLock unlock](self->_autosaveLock, "unlock");
  return v13;
}

- (void)setAutosaveIdentifier:(id)a3
{
  _BOOL4 v5;
  NSString *v6;

  v6 = (NSString *)a3;
  -[MFLock lock](self->_autosaveLock, "lock");
  if (self->_autosaveIdentifier == v6)
  {
    v5 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_autosaveIdentifier, a3);
    v5 = v6 != 0;
  }
  -[MFLock unlock](self->_autosaveLock, "unlock");
  if (v5)
    -[MFMailComposeController _updateAutosaveSession](self, "_updateAutosaveSession");

}

- (void)autosaveWithHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *p_autosaveCount;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  unsigned int v28;
  _QWORD v29[7];
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;

  v4 = a3;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__5;
  v32[4] = __Block_byref_object_dispose__5;
  v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__5;
  v30[4] = __Block_byref_object_dispose__5;
  v31 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __47__MFMailComposeController_autosaveWithHandler___block_invoke;
  v29[3] = &unk_1E5A66388;
  v29[4] = self;
  v29[5] = v30;
  v29[6] = v32;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performSyncBlock:", v29);

  p_autosaveCount = &self->_autosaveCount;
  do
  {
    v15 = __ldaxr(p_autosaveCount);
    v16 = v15 + 1;
  }
  while (__stlxr(v15 + 1, p_autosaveCount));
  v17 = atomic_load(p_autosaveCount);
  _MFAutosaveLog(CFSTR("Autosave request in queue %i, request ID %i"), v7, v8, v9, v10, v11, v12, v13, v17);
  -[MFMailComposeController _messageForAutosave](self, "_messageForAutosave");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController autosaveQueue](self, "autosaveQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v5;
  v24[1] = 3221225472;
  v24[2] = __47__MFMailComposeController_autosaveWithHandler___block_invoke_2;
  v24[3] = &unk_1E5A67E68;
  v28 = v16;
  v24[4] = self;
  v26 = v30;
  v27 = v32;
  v20 = v4;
  v25 = v20;
  objc_msgSend(v18, "onScheduler:addSuccessBlock:", v19, v24);

  if (v20)
  {
    -[MFMailComposeController autosaveQueue](self, "autosaveQueue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v5;
    v22[1] = 3221225472;
    v22[2] = __47__MFMailComposeController_autosaveWithHandler___block_invoke_591;
    v22[3] = &unk_1E5A67E90;
    v23 = v20;
    objc_msgSend(v18, "onScheduler:addFailureBlock:", v21, v22);

  }
  _Block_object_dispose(v30, 8);

  _Block_object_dispose(v32, 8);
}

void __47__MFMailComposeController_autosaveWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  objc_msgSend(*(id *)(a1 + 32), "_saveMessageValues");
  objc_msgSend(*(id *)(a1 + 32), "setHeadersForDraft");
  objc_msgSend(*(id *)(a1 + 32), "savedHeaders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "headersForKey:", *MEMORY[0x1E0D1E570]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0D1E7B8], "tagValueListFromString:error:", v15, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D1DC40]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setHideMyEmailSenderAddress:", v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "autosaveIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 1448);
  *(_QWORD *)(v10 + 1448) = v9;

  objc_msgSend(*(id *)(a1 + 32), "subject");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  objc_msgSend(*(id *)(a1 + 32), "_setAutosaveIsValid:", 1);
}

void __47__MFMailComposeController_autosaveWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  int v24;

  v3 = a2;
  v11 = v3;
  v12 = atomic_load((unsigned int *)(*(_QWORD *)(a1 + 32) + 1472));
  if ((_DWORD)v12 == *(_DWORD *)(a1 + 64))
  {
    objc_msgSend(v3, "messageData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D46AB0], "autosave");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __47__MFMailComposeController_autosaveWithHandler___block_invoke_3;
    v19[3] = &unk_1E5A67E40;
    v16 = v11;
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(a1 + 40);
    v20 = v16;
    v21 = v17;
    v23 = *(_QWORD *)(a1 + 56);
    v24 = *(_DWORD *)(a1 + 64);
    v22 = v18;
    objc_msgSend(v14, "autosaveMessageData:replacingIdentifier:completion:", v13, v15, v19);

    objc_msgSend(v16, "setMessageBody:", 0);
  }
  else
  {
    _MFAutosaveLog(CFSTR("Autosave request in queue %i, skipping request ID %i"), v4, v5, v6, v7, v8, v9, v10, v12);
  }

}

void __47__MFMailComposeController_autosaveWithHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    MFLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "ef_publicDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v8;
      _os_log_impl(&dword_1AB96A000, v7, OS_LOG_TYPE_DEFAULT, "#Warning failed to autosave message %{public}@", buf, 0xCu);

    }
  }
  objc_msgSend(*(id *)(a1 + 40), "setAutosaveIdentifier:", v5);
  _MFAutosaveLog(CFSTR("Autosaved \"%@\" at %@. New ID: %@. Request ID %i"), v9, v10, v11, v12, v13, v14, v15, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v16 = *(_QWORD *)(a1 + 48);
  if (v16)
    (*(void (**)(uint64_t, id))(v16 + 16))(v16, v5);

}

uint64_t __47__MFMailComposeController_autosaveWithHandler___block_invoke_591(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)autosaveIfNecessaryWithHandler:(id)a3
{
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  if (-[MFMailComposeController autosaveIsValid](self, "autosaveIsValid") || (*((_BYTE *)self + 1352) & 0x20) != 0)
  {
    if (v4)
      v4[2](v4, 0);
  }
  else
  {
    -[MFMailComposeController autosaveWithHandler:](self, "autosaveWithHandler:", v4);
  }

}

- (void)_updateAutosaveSession
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  if (!-[MFMailComposeController _isDummyViewController](self, "_isDummyViewController"))
  {
    -[MFMailComposeController autosaveIdentifier](self, "autosaveIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeController autosaveSession](self, "autosaveSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_4;
    -[MFMailComposeController autosaveSession](self, "autosaveSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "autosaveIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "isEqualToString:", v6);

    if ((v7 & 1) == 0)
    {
LABEL_4:
      location = (id)0xAAAAAAAAAAAAAAAALL;
      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0D46AB0], "autosave");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __49__MFMailComposeController__updateAutosaveSession__block_invoke;
      v9[3] = &unk_1E5A67EB8;
      objc_copyWeak(&v10, &location);
      objc_msgSend(v8, "autosaveSessionForIdentifier:completion:", v3, v9);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }

  }
}

void __49__MFMailComposeController__updateAutosaveSession__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4)
    objc_msgSend(WeakRetained, "setAutosaveSession:", v4);

}

- (void)setHeadersForDraft
{
  MFMutableMessageHeaders *savedHeaders;
  MFMutableMessageHeaders *v4;
  MFMutableMessageHeaders *v5;
  void *v6;
  MFMutableMessageHeaders *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  MFMutableMessageHeaders *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  MFMutableMessageHeaders *v26;
  void *v27;
  NSObject *v28;
  uint8_t v29[8];
  _QWORD v30[3];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  savedHeaders = self->_savedHeaders;
  if (!savedHeaders)
  {
    v4 = (MFMutableMessageHeaders *)objc_alloc_init(MEMORY[0x1E0D46110]);
    v5 = self->_savedHeaders;
    self->_savedHeaders = v4;

    savedHeaders = self->_savedHeaders;
  }
  -[MFMailComposeController _wantsEncryption](self, "_wantsEncryption");
  NSStringFromBOOL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMutableMessageHeaders setHeader:forKey:](savedHeaders, "setHeader:forKey:", v6, *MEMORY[0x1E0D1E630]);

  v7 = self->_savedHeaders;
  -[MFComposeSubjectView isNotifyOptionSelected](self->_subjectField, "isNotifyOptionSelected");
  NSStringFromBOOL();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMutableMessageHeaders setHeader:forKey:](v7, "setHeader:forKey:", v8, *MEMORY[0x1E0D1E620]);

  v9 = *MEMORY[0x1E0D1E638];
  -[MFMutableMessageHeaders firstHeaderForKey:](self->_savedHeaders, "firstHeaderForKey:", *MEMORY[0x1E0D1E638]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = self->_savedHeaders;
    -[MFMailComposeController documentID](self, "documentID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMutableMessageHeaders setHeader:forKey:](v11, "setHeader:forKey:", v12, v9);

  }
  -[MFMailComposeController hideMyEmailAddressIfExists](self, "hideMyEmailAddressIfExists");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D1E190], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "forwardingEmailForPrimaryAccount");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15
      && (-[MFMailComposeController sendingEmailAddress](self, "sendingEmailAddress"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = -[MFMailComposeController isAddressHideMyEmail:](self, "isAddressHideMyEmail:", v16),
          v16,
          v17))
    {
      MFLogGeneral();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_1AB96A000, v18, OS_LOG_TYPE_DEFAULT, "Saving ECMessageHeaderKeyHMEDraft header for draft.", v29, 2u);
      }

      -[MFMailComposeController mailComposeView](self, "mailComposeView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "isReplyToHME");
      NSStringFromBOOL();
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v30[0] = *MEMORY[0x1E0D1DC30];
      -[MFMailComposeController hideMyEmailAddressIfExists](self, "hideMyEmailAddressIfExists");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *MEMORY[0x1E0D1DC38];
      v31[0] = v21;
      v31[1] = v15;
      v23 = *MEMORY[0x1E0D1DC48];
      v30[1] = v22;
      v30[2] = v23;
      v31[2] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D1E7B8], "tagValueListFromDictionary:error:", v24, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = self->_savedHeaders;
      objc_msgSend(v25, "stringRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMutableMessageHeaders setHeader:forKey:](v26, "setHeader:forKey:", v27, *MEMORY[0x1E0D1E578]);

    }
    else
    {
      MFLogGeneral();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_1AB96A000, v28, OS_LOG_TYPE_DEFAULT, "Removing ECMessageHeaderKeyHMEDraft header for draft.", v29, 2u);
      }

      -[MFMutableMessageHeaders removeHeaderForKey:](self->_savedHeaders, "removeHeaderForKey:", *MEMORY[0x1E0D1E578]);
    }

  }
}

- (void)_setUpDraftForHME
{
  void *v3;
  void *v4;
  NSString *v5;
  NSString *sendingEmailAddress;
  void *v7;

  -[MFMutableMessageHeaders firstHeaderForKey:](self->_savedHeaders, "firstHeaderForKey:", *MEMORY[0x1E0D1E578]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = v3;
    objc_msgSend(MEMORY[0x1E0D1E7B8], "tagValueListFromString:error:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D1DC38]);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    sendingEmailAddress = self->_sendingEmailAddress;
    self->_sendingEmailAddress = v5;

    v3 = v7;
  }

}

- (void)backUpDraft
{
  id WeakRetained;

  if ((*((_BYTE *)self + 1352) & 0x20) == 0
    && (-[MFComposeWebView isDirty](self->_composeWebView, "isDirty") || (*((_BYTE *)self + 1352) & 1) != 0))
  {
    -[MFMailComposeController setUpForSaveAsDraft](self, "setUpForSaveAsDraft");
    -[MFMailComposeController setHeadersForDraft](self, "setHeadersForDraft");
    -[MFMailComposeController _setUpDraftForHME](self, "_setUpDraftForHME");
    -[MFComposeWebView setDirty:](self->_composeWebView, "setDirty:", 0);
    *((_BYTE *)self + 1352) &= ~1u;
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "mailComposeControllerWantsToBackUpDraft:", self);

  }
}

- (void)finishedBackingUpDraftWithSuccess:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  id v6;
  BOOL v7;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__MFMailComposeController_finishedBackingUpDraftWithSuccess___block_invoke;
  v5[3] = &unk_1E5A67EE0;
  objc_copyWeak(&v6, &location);
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performBlock:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __61__MFMailComposeController_finishedBackingUpDraftWithSuccess___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  NSObject *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[167] = 0;
    MFComposeLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *((_QWORD *)v3 + 167));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v5;
      _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "_resolution changed to %@ as the draft was backed up with success.", (uint8_t *)&v10, 0xCu);

    }
    if (!*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(*((id *)v3 + 150), "setDirty:", 1);
      *((_BYTE *)v3 + 1352) |= 1u;
    }
    objc_msgSend(v3, "didSaveQuickReplyDraftHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mailComposeView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isQuickReply");
    if (v6)
      v9 = v8;
    else
      v9 = 0;

    if (v9)
    {
      v6[2](v6, *(unsigned __int8 *)(a1 + 40));
      objc_msgSend(v3, "setDidSaveQuickReplyDraftHandler:", 0);
    }

  }
}

- (void)close
{
  void *v3;
  void *v4;
  void *v5;
  MFMailComposeController *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentWillClose");

  if (-[MFMailComposeController resolution](self, "resolution") == 3)
  {
    -[MFMailComposeController _messageForAutosave](self, "_messageForAutosave");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "onScheduler:addSuccessBlock:", v5, &__block_literal_global_596);

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __32__MFMailComposeController_close__block_invoke_3;
    v9[3] = &unk_1E5A65480;
    v9[4] = self;
    objc_msgSend(v4, "always:", v9);

  }
  v6 = self;
  -[MFMailComposeController mailComposeView](v6, "mailComposeView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parentDidClose");

  -[MFMailComposeController _finishedComposing](v6, "_finishedComposing");
  -[MFMailComposeController userActivity](v6, "userActivity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");

  objc_storeWeak((id *)&v6->_savedFirstResponder, 0);
}

void __32__MFMailComposeController_close__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  if (objc_msgSend(MEMORY[0x1E0D4D528], "hasPlaceholderRepresentation:", v2))
  {
    objc_msgSend(MEMORY[0x1E0D4D528], "placeholderRepresentations:", v2);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v11;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v3);
          v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
          if (MFIsMobileMail())
          {
            objc_msgSend(MEMORY[0x1E0D4D528], "removePlaceholder:", v7);
          }
          else
          {
            v8 = (void *)MEMORY[0x1E0D46AD0];
            objc_msgSend(v7, "fileURL", (_QWORD)v10);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "deletePlaceholderAttachmentForURL:completionBlock:", v9, &__block_literal_global_600);

          }
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v4);
    }

  }
  objc_msgSend(v2, "setMessageBody:", 0, (_QWORD)v10);

}

void __32__MFMailComposeController_close__block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0D46AB0], "autosave");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "autosaveIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAutosavedMessageWithIdentifier:", v2);

}

- (void)_escapeShortcutInvoked:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MFMailComposeController popoverAlert](self, "popoverAlert");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[MFMailComposeController presentedViewController](self, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      -[MFMailComposeController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    else
      -[MFMailComposeController close:](self, "close:", v6);
  }

}

- (void)close:(id)a3
{
  _BOOL4 v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[6];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = -[MFMailComposeController _isSetupForDelivery](self, "_isSetupForDelivery", a3);
  v5 = -[MFMailComposeController composeType](self, "composeType");
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "saveFirstResponder");
  objc_msgSend(v6, "firstResponder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resignFirstResponder");

  if ((*((_BYTE *)self + 1352) & 1) != 0 || -[MFComposeWebView isDirty](self->_composeWebView, "isDirty"))
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", 0, 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DELETE_CHANGES"), &stru_1E5A6A588, CFSTR("Main"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == 3)
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1E5A6A588, CFSTR("Main"));
      else
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DELETE_DRAFT"), &stru_1E5A6A588, CFSTR("Main"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __33__MFMailComposeController_close___block_invoke;
    v30[3] = &unk_1E5A67F88;
    v30[4] = self;
    v30[5] = v5;
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v26, 2, v30);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46BC0]);
    objc_msgSend(v8, "addAction:", v11);
    if (v4)
    {
      if ((objc_msgSend(v6, "isLoading") & 1) == 0)
      {
        v12 = (void *)MEMORY[0x1E0DC3448];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SAVE_AS_DRAFT"), &stru_1E5A6A588, CFSTR("Main"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __33__MFMailComposeController_close___block_invoke_609;
        v29[3] = &unk_1E5A67A58;
        v29[4] = self;
        objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 0, v29);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46BC8]);
        objc_msgSend(v8, "addAction:", v15);

      }
      if (v5 == 3)
      {
        v16 = (void *)MEMORY[0x1E0DC3448];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("LEAVE_IN_OUTBOX"), &stru_1E5A6A588, CFSTR("Main"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __33__MFMailComposeController_close___block_invoke_2;
        v28[3] = &unk_1E5A67A58;
        v28[4] = self;
        objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 0, v28);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addAction:", v19);

      }
    }
    v20 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E5A6A588, CFSTR("Main"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __33__MFMailComposeController_close___block_invoke_3;
    v27[3] = &unk_1E5A67A58;
    v27[4] = self;
    objc_msgSend(v20, "actionWithTitle:style:handler:", v22, 1, v27);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46BB8]);
    objc_msgSend(v8, "addAction:", v23);
    -[MFMailComposeController _displayPopoverAlert:](self, "_displayPopoverAlert:", v8);

  }
  else
  {
    if (v5 == 3 && v4)
    {
      -[MFMailComposeController _leaveMessageInOutbox](self, "_leaveMessageInOutbox");
    }
    else
    {
      self->_resolution = 3;
      MFComposeLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_resolution);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v32 = v25;
        _os_log_impl(&dword_1AB96A000, v24, OS_LOG_TYPE_DEFAULT, "_resolution changed to %@ as an empty compose sheet was closed.", buf, 0xCu);

      }
    }
    -[MFMailComposeController close](self, "close");
  }

}

uint64_t __33__MFMailComposeController_close___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1352) &= ~1u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1200), "setDirty:", 0);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1336) = 3;
  MFComposeLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1336));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1AB96A000, v2, OS_LOG_TYPE_DEFAULT, "_resolution changed to %@ as the contents of the compose sheet were deleted.", (uint8_t *)&v6, 0xCu);

  }
  v4 = *(void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 40) == 2)
    return objc_msgSend(v4, "close");
  else
    return objc_msgSend(v4, "finishPopoverAlertClosingComposition:", 1);
}

uint64_t __33__MFMailComposeController_close___block_invoke_609(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setUpForSaveAsDraft");
  return objc_msgSend(*(id *)(a1 + 32), "finishPopoverAlertClosingComposition:", 1);
}

uint64_t __33__MFMailComposeController_close___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_leaveMessageInOutbox");
  return objc_msgSend(*(id *)(a1 + 32), "finishPopoverAlertClosingComposition:", 1);
}

uint64_t __33__MFMailComposeController_close___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1336) = 0;
  MFComposeLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1336));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1AB96A000, v2, OS_LOG_TYPE_DEFAULT, "_resolution changed to %@ as compose sheet was closed.", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "finishPopoverAlertClosingComposition:", 0);
}

- (void)presentSaveDeleteDialogOrClose
{
  -[MFMailComposeController close:](self, "close:", self->_closeButtonItem);
}

- (void)_leaveMessageInOutbox
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[MFMailComposeController compositionContext](self, "compositionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "originalMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[EFFuture result:](self->_undoMoveAction, "result:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "repository");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performMessageChangeAction:", v5);
  self->_resolution = 3;
  MFComposeLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_resolution);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1AB96A000, v7, OS_LOG_TYPE_DEFAULT, "_resolution changed to %@ as a message was left in the outbox.", (uint8_t *)&v9, 0xCu);

  }
}

- (id)_outgoingMessageWithSubstituteDocument:(id)a3 compositionSpecification:(id)a4 useSuspendInfo:(BOOL)a5 endingEditing:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  EFFuture *content;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  MFMailComposeController *v24;
  id v25;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  if (v6)
  {
    -[MFMailComposeController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "endEditing:", 1);

  }
  if (a5)
  {
    if (self->_content)
    {
      *((_BYTE *)self + 1353) |= 4u;
      +[MFComposeTypeFactory headersFromDelegate:originatingBundleID:sourceAccountManagement:](MFComposeTypeFactory, "headersFromDelegate:originatingBundleID:sourceAccountManagement:", self, self->_originatingBundleID, self->_sourceAccountManagement);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)self + 1353) &= ~4u;
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D5A8]), "initWithCompositionSpecification:", v11);
      objc_msgSend(v14, "setShouldWriteAttachmentPlaceholders:", 1);
      content = self->_content;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __120__MFMailComposeController__outgoingMessageWithSubstituteDocument_compositionSpecification_useSuspendInfo_endingEditing___block_invoke;
      v22[3] = &unk_1E5A67FD8;
      v16 = v14;
      v23 = v16;
      v24 = self;
      v17 = v13;
      v25 = v17;
      -[EFFuture then:](content, "then:", v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = (void *)MEMORY[0x1E0D1EEC0];
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D4D4B8], 1030, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "futureWithError:", v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    +[MFComposeTypeFactory messageFromDelegate:withSubstituteDOMDocument:compositionSpecification:originatingBundleID:sourceAccountManagement:writeAttachmentPlaceholders:](MFComposeTypeFactory, "messageFromDelegate:withSubstituteDOMDocument:compositionSpecification:originatingBundleID:sourceAccountManagement:writeAttachmentPlaceholders:", self, v10, v11, self->_originatingBundleID, self->_sourceAccountManagement, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

id __120__MFMailComposeController__outgoingMessageWithSubstituteDocument_compositionSpecification_useSuspendInfo_endingEditing___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  v4 = (void *)MEMORY[0x1E0D1EEC0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __120__MFMailComposeController__outgoingMessageWithSubstituteDocument_compositionSpecification_useSuspendInfo_endingEditing___block_invoke_2;
  v9[3] = &unk_1E5A67FB0;
  v10 = *(id *)(a1 + 32);
  v11 = v3;
  v5 = *(void **)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = v5;
  v6 = v3;
  objc_msgSend(v4, "futureWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __120__MFMailComposeController__outgoingMessageWithSubstituteDocument_compositionSpecification_useSuspendInfo_endingEditing___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D1E700], "mf_utf8HTMLStringWithString:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "attachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "createMessageWithHTMLStringAndMIMECharset:plainTextAlternative:otherHtmlStringsAndAttachments:headers:", v5, 0, v6, *(_QWORD *)(a1 + 56));

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v7, "setDateSentTimeIntervalSince1970:");

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D4D4B8], 1030, 0);
    *a2 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)_messageWithCompositionSpecification:(id)a3 useSuspendInfo:(BOOL)a4 endingEditing:(BOOL)a5
{
  -[MFMailComposeController _outgoingMessageWithSubstituteDocument:compositionSpecification:useSuspendInfo:endingEditing:](self, "_outgoingMessageWithSubstituteDocument:compositionSpecification:useSuspendInfo:endingEditing:", 0, a3, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_messageForDraft
{
  void *v3;
  void *v4;
  void *v5;

  -[MFSecureMIMECompositionManager compositionSpecification](self->_secureCompositionManager, "compositionSpecification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0D4D4C0]);
  -[MFMailComposeController _messageWithCompositionSpecification:useSuspendInfo:endingEditing:](self, "_messageWithCompositionSpecification:useSuspendInfo:endingEditing:", v4, 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_messageForRemoteDelivery
{
  return -[MFMailComposeController _messageWithCompositionSpecification:useSuspendInfo:endingEditing:](self, "_messageWithCompositionSpecification:useSuspendInfo:endingEditing:", 0, 0, 0);
}

- (id)_messageForAutosave
{
  return -[MFMailComposeController _messageWithCompositionSpecification:useSuspendInfo:endingEditing:](self, "_messageWithCompositionSpecification:useSuspendInfo:endingEditing:", 0, 1, 0);
}

- (Class)_deliveryClass
{
  -[MFMailComposeController useMailDrop](self, "useMailDrop");
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_setUpDeliveryObject:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  unint64_t v21;
  char v22;
  uint8_t buf[16];

  v6 = a4;
  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v8, OS_SIGNPOST_EVENT, a3, "MAIL SEND", "Setting up delivery object", buf, 2u);
  }

  +[MFComposeTypeFactory headersFromDelegate:originatingBundleID:sourceAccountManagement:](MFComposeTypeFactory, "headersFromDelegate:originatingBundleID:sourceAccountManagement:", self, self->_originatingBundleID, self->_sourceAccountManagement);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstSenderAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4D620], "accountContainingEmailAddress:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  -[MFMailComposeController shouldCreateRichTextRepresentation](self, "shouldCreateRichTextRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__MFMailComposeController__setUpDeliveryObject_completionHandler___block_invoke;
  v17[3] = &unk_1E5A68078;
  v21 = a3;
  v17[4] = self;
  v22 = isKindOfClass & 1;
  v14 = v9;
  v18 = v14;
  v15 = v11;
  v19 = v15;
  v16 = v6;
  v20 = v16;
  objc_msgSend(v13, "addSuccessBlock:", v17);

}

void __66__MFMailComposeController__setUpDeliveryObject_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint64_t v28;
  _QWORD v29[4];
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  char v34;
  _QWORD v35[5];
  id v36;
  id v37;
  uint64_t v38;
  char v39;
  uint8_t buf[16];

  v3 = a2;
  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 64);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v5, OS_SIGNPOST_EVENT, v6, "MAIL SEND", "Should create rich text representation", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v3, "BOOLValue");
  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = *(_QWORD *)(a1 + 64);
    if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AB96A000, v11, OS_SIGNPOST_EVENT, v12, "MAIL SEND", "Getting HTML representation for the email", buf, 2u);
    }

    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 1200);
    v35[0] = v9;
    v35[1] = 3221225472;
    v35[2] = __66__MFMailComposeController__setUpDeliveryObject_completionHandler___block_invoke_620;
    v35[3] = &unk_1E5A68000;
    v38 = *(_QWORD *)(a1 + 64);
    v35[4] = v13;
    v39 = *(_BYTE *)(a1 + 72);
    v36 = v7;
    v37 = *(id *)(a1 + 40);
    objc_msgSend(v14, "getHTMLDataObject:", v35);

    v15 = v36;
  }
  else
  {
    +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    v18 = *(_QWORD *)(a1 + 64);
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AB96A000, v17, OS_SIGNPOST_EVENT, v18, "MAIL SEND", "Getting text representation for the email", buf, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1200), "plainTextContent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v9;
    v29[1] = 3221225472;
    v29[2] = __66__MFMailComposeController__setUpDeliveryObject_completionHandler___block_invoke_622;
    v29[3] = &unk_1E5A68028;
    v33 = *(_QWORD *)(a1 + 64);
    v34 = *(_BYTE *)(a1 + 72);
    v20 = v7;
    v21 = *(_QWORD *)(a1 + 32);
    v22 = *(void **)(a1 + 40);
    v30 = v20;
    v31 = v21;
    v32 = v22;
    objc_msgSend(v19, "addSuccessBlock:", v29);

    v15 = v30;
  }

  objc_msgSend(v7, "future");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v9;
  v25[1] = 3221225472;
  v25[2] = __66__MFMailComposeController__setUpDeliveryObject_completionHandler___block_invoke_624;
  v25[3] = &unk_1E5A68050;
  v24 = *(_QWORD *)(a1 + 32);
  v28 = *(_QWORD *)(a1 + 64);
  v25[4] = v24;
  v26 = *(id *)(a1 + 48);
  v27 = *(id *)(a1 + 56);
  objc_msgSend(v23, "addSuccessBlock:", v25);

}

void __66__MFMailComposeController__setUpDeliveryObject_completionHandler___block_invoke_620(uint64_t a1, void *a2)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v31;
  id v32;
  char v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[16];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v28 = a2;
  objc_msgSend(v28, "htmlString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "otherHTMLStringsAndAttachments");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "plainTextAlternative");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 56);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Received HTML representation", buf, 2u);
  }

  if (!v32)
  {
    v5 = v31;
    objc_msgSend(*(id *)(a1 + 32), "attachments");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_40;
  }
  v5 = v31;
  if (*(_BYTE *)(a1 + 64))
  {
    v34 = (void *)objc_opt_new();
    v6 = (void *)objc_opt_new();
    if (v31)
    {
      objc_msgSend(v31, "string");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addObject:", v7);

      objc_msgSend(v31, "charset");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v9 = v32;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (!v10)
    {

      goto LABEL_35;
    }
    v11 = *(_QWORD *)v36;
    v33 = 1;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "addObject:", v13);
          continue;
        }
        v14 = v13;
        v15 = v14;
        if (!v8)
        {
          objc_msgSend(v14, "charset");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v15, "string");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "addObject:", v16);

        objc_msgSend(v15, "charset");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "encoding");
        LOBYTE(v18) = v18 == objc_msgSend(v8, "encoding");

        if ((v18 & 1) == 0)
        {
          objc_msgSend(v15, "charset");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "encoding") == 4)
          {
            v20 = objc_msgSend(v8, "encoding") == 1;

            if (v20)
            {
              objc_msgSend(v15, "charset");
              v21 = objc_claimAutoreleasedReturnValue();

              v8 = (void *)v21;
              goto LABEL_29;
            }
          }
          else
          {

          }
          objc_msgSend(v15, "charset");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "encoding") == 1)
          {
            v23 = objc_msgSend(v8, "encoding") == 4;

            if (v23)
              goto LABEL_29;
          }
          else
          {

          }
          v33 = 0;
        }
LABEL_29:

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (!v10)
      {

        if ((v33 & 1) == 0)
        {
          v5 = v31;
          v32 = v9;
          goto LABEL_39;
        }
LABEL_35:
        objc_msgSend(v34, "componentsJoinedByString:", CFSTR("\n"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E700]), "initWithString:charset:", v24, v8);
          v25 = v31;
        }
        else
        {
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E700]), "initWithString:charset:", v24, v8);
          v5 = 0;
          objc_msgSend(v6, "insertObject:atIndex:", v25, 0);
        }

        v32 = v6;
LABEL_39:

        break;
      }
    }
  }
LABEL_40:
  v26 = *(void **)(a1 + 40);
  v27 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_deliveryClass"), "newWithHeaders:HTML:plainTextAlternative:other:", *(_QWORD *)(a1 + 48), v5, v29, v32);
  objc_msgSend(v26, "finishWithResult:", v27);

}

void __66__MFMailComposeController__setUpDeliveryObject_completionHandler___block_invoke_622(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[16];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 56);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v5, OS_SIGNPOST_EVENT, v6, "MAIL SEND", "Received text representation", buf, 2u);
  }

  if (*(_BYTE *)(a1 + 64) && (unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    v7 = (void *)objc_opt_new();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v3;
    v9 = 0;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v9)
            {
              objc_msgSend(v13, "string");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "appendString:withQuoteLevel:", v14, 0);

            }
            else
            {
              v9 = v13;
            }
          }
          else
          {
            objc_msgSend(v7, "addObject:", v13, (_QWORD)v17);
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v10);
    }

  }
  v15 = *(void **)(a1 + 32);
  v16 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "_deliveryClass", (_QWORD)v17), "newWithHeaders:mixedContent:textPartsAreHTML:", *(_QWORD *)(a1 + 48), v3, 0);
  objc_msgSend(v15, "finishWithResult:", v16);

}

void __66__MFMailComposeController__setUpDeliveryObject_completionHandler___block_invoke_624(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v4 = a2;
  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a1[7];
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v6, OS_SIGNPOST_EVENT, v7, "MAIL SEND", "Finalizing delivery", buf, 2u);
  }

  objc_storeStrong((id *)(a1[4] + 1224), a2);
  objc_msgSend(*(id *)(a1[4] + 1224), "setArchiveAccount:", a1[5]);
  objc_msgSend(*(id *)(a1[4] + 1280), "compositionSpecification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 1224), "setCompositionSpecification:", v8);

  objc_msgSend(*(id *)(a1[4] + 1224), "setConversationFlags:", objc_msgSend(*(id *)(a1[4] + 1184), "isNotifyOptionSelected"));
  objc_msgSend(*(id *)(a1[4] + 976), "attachmentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[4] + 1224), "setAttachmentContext:", v9);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1[4] + 1224), "setMailDropState:", 1);
  objc_msgSend(*(id *)(a1[4] + 976), "legacyMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    objc_msgSend(*(id *)(a1[4] + 1224), "setOriginalConversationId:", objc_msgSend(v10, "conversationID"));
  (*(void (**)(void))(a1[6] + 16))();
  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  v14 = a1[7];
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v13, OS_SIGNPOST_INTERVAL_END, v14, "MAIL SEND", "Finished setting up delivery for sending", v15, 2u);
  }

}

- (unint64_t)_composeWebViewTextContentLength
{
  return 0;
}

- (id)_estimateMessageSize
{
  void *v3;
  void *v4;
  _QWORD v6[6];
  _QWORD v7[3];
  unint64_t v8;
  _QWORD v9[3];
  unint64_t v10;

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0xAAAAAAAAAAAAAAAALL;
  v10 = -[MFMailComposeController _sizeForScale:imagesOnly:](self, "_sizeForScale:imagesOnly:", 0, 0);
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v8 = 0xAAAAAAAAAAAAAAAALL;
  v8 = 2 * -[MFMailComposeController _composeWebViewTextContentLength](self, "_composeWebViewTextContentLength");
  -[MFComposeWebView containsRichText](self->_composeWebView, "containsRichText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__MFMailComposeController__estimateMessageSize__block_invoke;
  v6[3] = &unk_1E5A680A0;
  v6[4] = v7;
  v6[5] = v9;
  objc_msgSend(v3, "then:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v7, 8);
  _Block_object_dispose(v9, 8);
  return v4;
}

id __47__MFMailComposeController__estimateMessageSize__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "BOOLValue"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) *= 2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                           + 24);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += 6120;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) &= 0xFFFFFFFFFFFFFC00;
  v4 = (void *)MEMORY[0x1E0D1EEC0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)performSend
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD v23[6];
  _QWORD v24[5];
  uint8_t v25[16];
  _BYTE buf[22];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  MFComposeLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_1AB96A000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> User tapped send button", buf, 0x16u);

  }
  v6 = _os_activity_create(&dword_1AB96A000, "Send button pressed", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  memset(buf, 170, 16);
  os_activity_scope_enter(v6, (os_activity_scope_state_t)buf);
  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v25 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "MAIL SEND", "Finished setting up delivery for sending", v25, 2u);
  }

  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)v25 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v13, OS_SIGNPOST_EVENT, v8, "MAIL SEND", "Send Button Pressed", v25, 2u);
  }

  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "saveFirstResponder");
  objc_msgSend(v14, "firstResponder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resignFirstResponder");

  v16 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __38__MFMailComposeController_performSend__block_invoke;
  v24[3] = &unk_1E5A67E18;
  v24[4] = self;
  -[MFMailComposeController _performBlockWithStrongComposeCoordinator:](self, "_performBlockWithStrongComposeCoordinator:", v24);
  -[UIBarButtonItem setEnabled:](self->_sendButtonItem, "setEnabled:", 0);
  -[UIButton setUserInteractionEnabled:](self->_sendAccessoryButton, "setUserInteractionEnabled:", 0);
  -[MFMailComposeController quickReplyActionButtonProvider](self, "quickReplyActionButtonProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "quickReplySendButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setUserInteractionEnabled:", 0);

  objc_msgSend(v17, "quickReplyExpandButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setUserInteractionEnabled:", 0);

  objc_msgSend(v14, "setSending:", 1);
  -[MFMailComposeController quickReplyDelegate](self, "quickReplyDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "mailComposeController:isSending:", self, 1);

  +[MessageUITipsManager donateHasSentEmailEvent](_TtC9MessageUI20MessageUITipsManager, "donateHasSentEmailEvent");
  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)v25 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v22, OS_SIGNPOST_EVENT, v8, "MAIL SEND", "Send button disabled, starting checks now", v25, 2u);
  }

  v23[0] = v16;
  v23[1] = 3221225472;
  v23[2] = __38__MFMailComposeController_performSend__block_invoke_630;
  v23[3] = &unk_1E5A65590;
  v23[4] = self;
  v23[5] = v8;
  -[MFMailComposeController _prepareHMEAddressesWithContinuation:](self, "_prepareHMEAddressesWithContinuation:", v23);

  os_activity_scope_leave((os_activity_scope_state_t)buf);
}

uint64_t __38__MFMailComposeController_performSend__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "saveAndResignFirstResponder");
}

uint64_t __38__MFMailComposeController_performSend__block_invoke_630(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint8_t buf[16];

  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished preparing HME addresses.", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__MFMailComposeController_performSend__block_invoke_631;
  v7[3] = &unk_1E5A65590;
  v5 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  return objc_msgSend(v8, "_checkForInvalidAddressesWithContinuation:", v7);
}

uint64_t __38__MFMailComposeController_performSend__block_invoke_631(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint8_t buf[16];

  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished checking for invalid addresses.", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__MFMailComposeController_performSend__block_invoke_632;
  v7[3] = &unk_1E5A65590;
  v5 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  return objc_msgSend(v8, "_checkForEmptySubjectWithContinuation:", v7);
}

uint64_t __38__MFMailComposeController_performSend__block_invoke_632(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint8_t buf[16];

  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished checking for empty subject.", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__MFMailComposeController_performSend__block_invoke_633;
  v7[3] = &unk_1E5A65590;
  v5 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  return objc_msgSend(v8, "_checkForUnencryptedWithContinuation:", v7);
}

uint64_t __38__MFMailComposeController_performSend__block_invoke_633(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint8_t buf[16];

  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished checking for unencrypted email.", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__MFMailComposeController_performSend__block_invoke_634;
  v7[3] = &unk_1E5A65590;
  v5 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  return objc_msgSend(v8, "_checkForInFlightAssetDownloadsWithContinuation:", v7);
}

uint64_t __38__MFMailComposeController_performSend__block_invoke_634(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint8_t buf[16];

  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished checking for in-flight asset downloads.", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__MFMailComposeController_performSend__block_invoke_635;
  v7[3] = &unk_1E5A65590;
  v5 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  return objc_msgSend(v8, "_prepareImagesForSendWithContinuation:", v7);
}

uint64_t __38__MFMailComposeController_performSend__block_invoke_635(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint8_t buf[16];

  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished preparing images for sending.", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__MFMailComposeController_performSend__block_invoke_636;
  v7[3] = &unk_1E5A65590;
  v5 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  return objc_msgSend(v8, "_promptForMailDropIfNecessaryWithContinuation:", v7);
}

uint64_t __38__MFMailComposeController_performSend__block_invoke_636(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint8_t buf[16];

  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished prompting for MailDrop if necessary.", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__MFMailComposeController_performSend__block_invoke_637;
  v7[3] = &unk_1E5A65590;
  v5 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  return objc_msgSend(v8, "_checkForCanSendMailWithContinuation:", v7);
}

uint64_t __38__MFMailComposeController_performSend__block_invoke_637(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint8_t buf[16];

  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished checking for canSendMail.", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__MFMailComposeController_performSend__block_invoke_638;
  v7[3] = &unk_1E5A65590;
  v5 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  return objc_msgSend(v8, "_checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation:", v7);
}

uint64_t __38__MFMailComposeController_performSend__block_invoke_638(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint8_t buf[16];

  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished checking for omitted recipients or attachments.", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__MFMailComposeController_performSend__block_invoke_639;
  v7[3] = &unk_1E5A65590;
  v5 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  return objc_msgSend(v8, "_checkForShareParticipantsWithContinuation:", v7);
}

uint64_t __38__MFMailComposeController_performSend__block_invoke_639(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint8_t buf[16];

  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished checking for share participants.", buf, 2u);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__MFMailComposeController_performSend__block_invoke_640;
  v7[3] = &unk_1E5A65590;
  v5 = *(_QWORD *)(a1 + 40);
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  return objc_msgSend(v8, "_checkForSendLaterDisclaimerWithContinuation:", v7);
}

uint64_t __38__MFMailComposeController_performSend__block_invoke_640(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint8_t v6[16];

  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished checking for send later disclaimer.", v6, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "sendMessage:", *(_QWORD *)(a1 + 40));
}

- (void)_prepareHMEAddressesWithContinuation:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  void (**v23)(_QWORD);
  id v24;
  _BYTE buf[12];
  __int16 v26;
  MFMailComposeController *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  -[MFMailComposeController hideMyEmailAddressIfExists](self, "hideMyEmailAddressIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MFMailComposeController _saveMessageValues](self, "_saveMessageValues");
    MFComposeLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v8;
      v26 = 2048;
      v27 = self;
      _os_log_impl(&dword_1AB96A000, v6, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Verify HME address", buf, 0x16u);

    }
    -[MFMailComposeController _allRecipients](self, "_allRecipients");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[MFMailComposeController hideMyEmailAddressIfExists](self, "hideMyEmailAddressIfExists");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "aa_primaryAppleAccount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    objc_msgSend(MEMORY[0x1E0D1E190], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeController hideMyEmailSenderAddress](self, "hideMyEmailSenderAddress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __64__MFMailComposeController__prepareHMEAddressesWithContinuation___block_invoke;
    v19[3] = &unk_1E5A68118;
    objc_copyWeak(&v24, (id *)buf);
    v23 = v4;
    v16 = v10;
    v20 = v16;
    v17 = v11;
    v21 = v17;
    v18 = v13;
    v22 = v18;
    objc_msgSend(v14, "isHideMyEmailAddressValid:senderAddress:completion:", v17, v15, v19);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v4[2](v4);
  }

}

void __64__MFMailComposeController__prepareHMEAddressesWithContinuation___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  _QWORD *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  objc_class *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  _BYTE buf[12];
  __int16 v40;
  _QWORD *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      objc_msgSend(WeakRetained, "mailComposeView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isReplyToHME");

      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0D1E190], "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "forwardingEmailForPrimaryAccount");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v7[131];
        v7[131] = v11;

        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }
      else
      {
        MFComposeLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v26;
          v40 = 2048;
          v41 = v7;
          _os_log_impl(&dword_1AB96A000, v24, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> Generate HME for reply", buf, 0x16u);

        }
        *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
        objc_initWeak((id *)buf, v7);
        objc_msgSend(MEMORY[0x1E0D1E190], "sharedInstance");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *(_QWORD *)(a1 + 32);
        v29 = *(_QWORD *)(a1 + 40);
        v30 = *(_QWORD *)(a1 + 48);
        v35[0] = MEMORY[0x1E0C809B0];
        v35[1] = 3221225472;
        v35[2] = __64__MFMailComposeController__prepareHMEAddressesWithContinuation___block_invoke_642;
        v35[3] = &unk_1E5A680F0;
        objc_copyWeak(&v38, (id *)buf);
        v36 = *(id *)(a1 + 32);
        v37 = *(id *)(a1 + 56);
        objc_msgSend(v27, "generateReplyToEmailForRecipient:hmeAddress:account:completion:", v28, v29, v30, v35);

        objc_destroyWeak(&v38);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      MFComposeLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "ef_publicDescription");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v32;
        v40 = 2048;
        v41 = v7;
        v42 = 2114;
        v43 = v33;
        _os_log_error_impl(&dword_1AB96A000, v13, OS_LOG_TYPE_ERROR, "<%{public}@: %p> Verifying HME failed with error: %{public}@", buf, 0x20u);

      }
      v14 = (void *)MEMORY[0x1E0DC3450];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("HME_UNAVAILABLE_ERROR_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("HME_UNAVAILABLE_DESCRIPTION"), &stru_1E5A6A588, CFSTR("Main"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "alertControllerWithTitle:message:preferredStyle:", v16, v18, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E5A6A588, CFSTR("Main"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __64__MFMailComposeController__prepareHMEAddressesWithContinuation___block_invoke_650;
      v34[3] = &unk_1E5A67A58;
      v34[4] = v7;
      objc_msgSend(v20, "actionWithTitle:style:handler:", v22, 1, v34);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addAction:", v23);

      objc_msgSend(v7, "_presentModalAlert:", v19);
    }
  }

}

void __64__MFMailComposeController__prepareHMEAddressesWithContinuation___block_invoke_642(id *a1, void *a2, void *a3)
{
  id *WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  objc_class *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  _QWORD v42[5];
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id *v46;
  __int16 v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v39 = a2;
  v38 = a3;
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (!v39 || v38)
    {
      MFComposeLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "ef_publicDescription");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v44 = v36;
        v45 = 2048;
        v46 = WeakRetained;
        v47 = 2114;
        v48 = v37;
        _os_log_error_impl(&dword_1AB96A000, v10, OS_LOG_TYPE_ERROR, "<%{public}@: %p> Generating HME failed with error: %{public}@", buf, 0x20u);

      }
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("HME_CONFIRM_SEND_MESSAGE"), &stru_1E5A6A588, CFSTR("Main"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = a1[4];
      objc_msgSend(v14, "emailAddressValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "simpleAddress");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v18 = v16;
      }
      else
      {
        objc_msgSend(v14, "stringValue");
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      v19 = v18;

      objc_msgSend(v11, "stringWithFormat:", v13, v19);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)MEMORY[0x1E0DC3450];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("HIDE_MY_EMAIL_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "alertControllerWithTitle:message:preferredStyle:", v22, v6, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E5A6A588, CFSTR("Main"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = MEMORY[0x1E0C809B0];
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __64__MFMailComposeController__prepareHMEAddressesWithContinuation___block_invoke_645;
      v42[3] = &unk_1E5A67A58;
      v42[4] = WeakRetained;
      objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 1, v42);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAction:", v27);

      v28 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("SEND"), &stru_1E5A6A588, CFSTR("Main"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v26;
      v40[1] = 3221225472;
      v40[2] = __64__MFMailComposeController__prepareHMEAddressesWithContinuation___block_invoke_2;
      v40[3] = &unk_1E5A680C8;
      v41 = a1[5];
      objc_msgSend(v28, "actionWithTitle:style:handler:", v30, 0, v40);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAction:", v31);

      objc_msgSend(WeakRetained, "_presentModalAlert:", v8);
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0D1E6C0], "componentsWithString:", v39);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "ea_addressComment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDisplayName:", v7);

    objc_msgSend(v6, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(WeakRetained[124], "containsObject:", a1[4]))
    {
      v51[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setToRecipients:", v9);
    }
    else if (objc_msgSend(WeakRetained[125], "containsObject:", a1[4]))
    {
      v50 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setCcRecipients:", v9);
    }
    else
    {
      if (!objc_msgSend(WeakRetained[126], "containsObject:", a1[4]))
      {
LABEL_17:
        objc_msgSend(MEMORY[0x1E0D1E190], "sharedInstance");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "forwardingEmailForPrimaryAccount");
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = WeakRetained[131];
        WeakRetained[131] = (id)v33;

        (*((void (**)(void))a1[5] + 2))();
LABEL_18:

        goto LABEL_19;
      }
      v49 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setBccRecipients:", v9);
    }

    goto LABEL_17;
  }
LABEL_19:

}

uint64_t __64__MFMailComposeController__prepareHMEAddressesWithContinuation___block_invoke_645(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishModalAlertClosingComposition:", 0);
}

uint64_t __64__MFMailComposeController__prepareHMEAddressesWithContinuation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__MFMailComposeController__prepareHMEAddressesWithContinuation___block_invoke_650(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishModalAlertClosingComposition:", 0);
}

- (void)_checkForInvalidAddressesWithContinuation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void (**v42)(void);
  _QWORD v43[4];
  void (**v44)(void);
  _QWORD v45[5];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[32];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v42 = (void (**)(void))a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MFMailComposeController addressesForField:](self, "addressesForField:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  -[MFMailComposeController addressesForField:](self, "addressesForField:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  -[MFMailComposeController addressesForField:](self, "addressesForField:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v7);

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v47;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v47 != v10)
        objc_enumerationMutation(v8);
      v12 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v11);
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6B8]), "initWithString:", v12);
      v14 = v13 == 0;

      if (v14)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v15 = v12;

    if (!v15)
      goto LABEL_15;
    MFComposeLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMailComposeController _checkForInvalidAddressesWithContinuation:].cold.1(v18, (uint64_t)self, (uint64_t)v50);
    }

    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("CONFIRM_SEND_MESSAGE %@"), &stru_1E5A6A588, CFSTR("Main"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v15;
    objc_msgSend(v41, "emailAddressValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "simpleAddress");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      v25 = v23;
    }
    else
    {
      objc_msgSend(v41, "stringValue");
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    v26 = v25;

    objc_msgSend(v19, "stringWithFormat:", v21, v26);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("INVALID_ADDRESS_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "alertControllerWithTitle:message:preferredStyle:", v29, v40, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E5A6A588, CFSTR("Main"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = MEMORY[0x1E0C809B0];
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __69__MFMailComposeController__checkForInvalidAddressesWithContinuation___block_invoke;
    v45[3] = &unk_1E5A67A58;
    v45[4] = self;
    objc_msgSend(v31, "actionWithTitle:style:handler:", v33, 1, v45);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addAction:", v35);

    v36 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("SEND"), &stru_1E5A6A588, CFSTR("Main"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v34;
    v43[1] = 3221225472;
    v43[2] = __69__MFMailComposeController__checkForInvalidAddressesWithContinuation___block_invoke_2;
    v43[3] = &unk_1E5A680C8;
    v44 = v42;
    objc_msgSend(v36, "actionWithTitle:style:handler:", v38, 0, v43);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addAction:", v39);

    -[MFMailComposeController _presentModalAlert:](self, "_presentModalAlert:", v30);
  }
  else
  {
LABEL_9:

LABEL_15:
    v42[2]();
  }

}

uint64_t __69__MFMailComposeController__checkForInvalidAddressesWithContinuation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishModalAlertClosingComposition:", 0);
}

uint64_t __69__MFMailComposeController__checkForInvalidAddressesWithContinuation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_checkForEmptySubjectWithContinuation:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  void (**v29)(_QWORD);
  _QWORD v30[5];
  _BYTE v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  -[MFComposeSubjectView text](self->_subjectField, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v27 = v5;
  }
  else
  {
    -[_MFMailCompositionContext draftSubject](self->_compositionContext, "draftSubject");
    v27 = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    v4[2](v4);
  }
  else
  {
    MFComposeLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMailComposeController _checkForEmptySubjectWithContinuation:].cold.1(v11, (uint64_t)self, (uint64_t)v31);
    }

    v12 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("EMPTY_SUBJECT_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CONFIRM_EMPTY_SUBJECT_MESSAGE"), &stru_1E5A6A588, CFSTR("Main"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "alertControllerWithTitle:message:preferredStyle:", v14, v16, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E5A6A588, CFSTR("Main"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __65__MFMailComposeController__checkForEmptySubjectWithContinuation___block_invoke;
    v30[3] = &unk_1E5A67A58;
    v30[4] = self;
    objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 1, v30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAction:", v22);

    v23 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("SEND"), &stru_1E5A6A588, CFSTR("Main"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v21;
    v28[1] = 3221225472;
    v28[2] = __65__MFMailComposeController__checkForEmptySubjectWithContinuation___block_invoke_2;
    v28[3] = &unk_1E5A680C8;
    v29 = v4;
    objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 0, v28);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addAction:", v26);

    -[MFMailComposeController _presentModalAlert:](self, "_presentModalAlert:", v17);
  }

}

uint64_t __65__MFMailComposeController__checkForEmptySubjectWithContinuation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishModalAlertClosingComposition:", 0);
}

uint64_t __65__MFMailComposeController__checkForEmptySubjectWithContinuation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_checkForSendLaterDisclaimerWithContinuation:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  void (**v14)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if (objc_msgSend(MEMORY[0x1E0D46DD8], "shouldShowSendLaterDisclaimerAlertForContext:", -[_MFMailCompositionContext sendLaterContext](self->_compositionContext, "sendLaterContext")))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBool:forKey:", 1, *MEMORY[0x1E0D1E088]);

    v6 = (void *)MEMORY[0x1E0DC3450];
    _EFLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _EFLocalizedString();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x1E0DC3448];
    _EFLocalizedString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72__MFMailComposeController__checkForSendLaterDisclaimerWithContinuation___block_invoke;
    v13[3] = &unk_1E5A680C8;
    v14 = v4;
    objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 1, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v12);

    -[MFMailComposeController _presentModalAlert:](self, "_presentModalAlert:", v9);
  }
  else
  {
    v4[2](v4);
  }

}

uint64_t __72__MFMailComposeController__checkForSendLaterDisclaimerWithContinuation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_checkForInFlightAssetDownloadsWithContinuation:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  void (**v26)(_QWORD);
  _QWORD v27[5];

  v4 = (void (**)(_QWORD))a3;
  -[MFMailComposeController photoPickerProgressManager](self, "photoPickerProgressManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "anyRequestExists");

  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("IN_FLIGHT_ASSET_DOWNLOAD_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("IN_FLIGHT_ASSET_DOWNLOAD_MESSAGE"), &stru_1E5A6A588, CFSTR("Main"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v9, v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E5A6A588, CFSTR("Main"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __75__MFMailComposeController__checkForInFlightAssetDownloadsWithContinuation___block_invoke;
    v27[3] = &unk_1E5A67A58;
    v27[4] = self;
    objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 1, v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v17);

    v18 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("SEND"), &stru_1E5A6A588, CFSTR("Main"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v16;
    v23 = 3221225472;
    v24 = __75__MFMailComposeController__checkForInFlightAssetDownloadsWithContinuation___block_invoke_2;
    v25 = &unk_1E5A680C8;
    v26 = v4;
    objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 0, &v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAction:", v21, v22, v23, v24, v25);

    -[MFMailComposeController _presentModalAlert:](self, "_presentModalAlert:", v12);
  }
  else
  {
    v4[2](v4);
  }

}

uint64_t __75__MFMailComposeController__checkForInFlightAssetDownloadsWithContinuation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishModalAlertClosingComposition:", 0);
}

uint64_t __75__MFMailComposeController__checkForInFlightAssetDownloadsWithContinuation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_checkForCanSendMailWithContinuation:(id)a3
{
  void (**v4)(_QWORD);
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  EFFuture *content;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  MFMailComposeController *v16;
  id v17;
  void (**v18)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MFMailComposeController toRecipients](self, "toRecipients");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeController ccRecipients](self, "ccRecipients");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeController bccRecipients](self, "bccRecipients");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    content = self->_content;
    v12 = content;
    if (!content)
    {
      -[MFComposeWebView htmlString](self->_composeWebView, "htmlString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __64__MFMailComposeController__checkForCanSendMailWithContinuation___block_invoke;
    v14[3] = &unk_1E5A68168;
    v15 = WeakRetained;
    v16 = self;
    v13 = v10;
    v17 = v13;
    v18 = v4;
    objc_msgSend(v12, "addSuccessBlock:", v14);
    if (!content)

  }
  else
  {
    v4[2](v4);
  }

}

void __64__MFMailComposeController__checkForCanSendMailWithContinuation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__MFMailComposeController__checkForCanSendMailWithContinuation___block_invoke_2;
  v7[3] = &unk_1E5A68140;
  v6 = *(_QWORD *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v4, "mailComposeController:shouldSendMail:toRecipients:completion:", v5, v3, v6, v7);

}

uint64_t __64__MFMailComposeController__checkForCanSendMailWithContinuation___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

- (void)_checkForUnencryptedWithContinuation:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  _QWORD v26[4];
  void (**v27)(_QWORD);
  _QWORD v28[5];

  v4 = (void (**)(_QWORD))a3;
  -[MFMailComposeController errorsByRecipient](self, "errorsByRecipient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    -[MFMailComposeController certificatesByRecipient](self, "certificatesByRecipient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8)
    {
      -[MFMailComposeController errorsByRecipient](self, "errorsByRecipient");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v9, "count") >= 2)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CONFIRM_UNENCRYPTED_MESSAGE_MULT"), &stru_1E5A6A588, CFSTR("Main"));
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CONFIRM_UNENCRYPTED_MESSAGE_ONE"), &stru_1E5A6A588, CFSTR("Main"));
      }
      v11 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CONFIRM_UNENCRYPTED_MESSAGE_ANY"), &stru_1E5A6A588, CFSTR("Main"));
      v11 = objc_claimAutoreleasedReturnValue();
    }

    v12 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)v11;
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("UNENCRYPTED_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "alertControllerWithTitle:message:preferredStyle:", v14, v11, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E5A6A588, CFSTR("Main"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __64__MFMailComposeController__checkForUnencryptedWithContinuation___block_invoke;
    v28[3] = &unk_1E5A67A58;
    v28[4] = self;
    objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 1, v28);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAction:", v20);

    v21 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("SEND_ANYWAY"), &stru_1E5A6A588, CFSTR("Main"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v19;
    v26[1] = 3221225472;
    v26[2] = __64__MFMailComposeController__checkForUnencryptedWithContinuation___block_invoke_2;
    v26[3] = &unk_1E5A680C8;
    v27 = v4;
    objc_msgSend(v21, "actionWithTitle:style:handler:", v23, 0, v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAction:", v24);

    -[MFMailComposeController _presentModalAlert:](self, "_presentModalAlert:", v15);
  }
  else
  {
    v4[2](v4);
  }

}

uint64_t __64__MFMailComposeController__checkForUnencryptedWithContinuation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishModalAlertClosingComposition:", 0);
}

uint64_t __64__MFMailComposeController__checkForUnencryptedWithContinuation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  MFComposeLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB96A000, v5, OS_LOG_TYPE_DEFAULT, "Checking for omitted recipients or attachments.", buf, 2u);
  }

  v6 = -[MFMailComposeController _copyMessagePlainTextForDonationRemoveQuotes:](self, "_copyMessagePlainTextForDonationRemoveQuotes:", 1);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke;
  v8[3] = &unk_1E5A682A8;
  v8[4] = self;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "addSuccessBlock:", v8);

}

void __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
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
  void *v37;
  uint64_t v38;
  void *v39;
  __CFString *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  id v57;
  NSObject *v58;
  void *v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  __CFString *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  uint64_t v73;
  _QWORD v74[5];
  id v75;
  _QWORD v76[5];
  id v77;
  _BYTE *v78;
  id v79;
  _QWORD v80[4];
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t v86[4];
  void *v87;
  _BYTE buf[24];
  uint64_t (*v89)(uint64_t, uint64_t);
  _BYTE v90[20];
  __int16 v91;
  void *v92;
  void *v93;
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v71 = a2;
  if (!objc_msgSend(v71, "count"))
    goto LABEL_45;
  v3 = (void *)objc_opt_new();
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v4 = v71;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
  v73 = a1;
  v6 = &stru_1E5A6A588;
  if (!v5)
    goto LABEL_15;
  v7 = *(_QWORD *)v83;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v83 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (objc_msgSend(v9, "string"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = v10 == 0,
            v10,
            v11))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          continue;
        objc_msgSend(v9, "contentIDs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v12);
      }
      else
      {
        objc_msgSend(v9, "string");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v12);
        v13 = objc_claimAutoreleasedReturnValue();

        v6 = (__CFString *)v13;
      }

    }
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
  }
  while (v5);
LABEL_15:

  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[__CFString stringByTrimmingCharactersInSet:](v6, "stringByTrimmingCharactersInSet:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v15, "length") <= 0x20000)
  {
    v21 = v15;
  }
  else
  {
    MFComposeLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v15, "length");
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = 0x20000;
      _os_log_impl(&dword_1AB96A000, v16, OS_LOG_TYPE_DEFAULT, "Truncating body content. body.length = %ld kMaxLengthBodyContent = %ld", buf, 0x16u);
    }

    v18 = objc_msgSend(v15, "rangeOfComposedCharacterSequenceAtIndex:", 0x1FFFFLL);
    objc_msgSend(v15, "substringToIndex:", v18 + v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v20;
  }
  v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v21);
  objc_msgSend(*(id *)(v73 + 32), "csPeopleForField:", 1);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v73 + 32), "csPeopleForField:", 2);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v73 + 32), "csPeopleForField:", 3);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v73 + 32), "compositionContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "originalMessage");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    v23 = *(void **)(v73 + 32);
    objc_msgSend(v72, "toList");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "_csPeopleFromAddresses:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = *(void **)(v73 + 32);
    objc_msgSend(v72, "ccList");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_csPeopleFromAddresses:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v72, "senderList");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "emailAddressValue");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "em_person");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v73 + 32), "sendingEmailAddress");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "emailAddressValue");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "em_person");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = (void *)objc_opt_new();
    objc_msgSend(v36, "addObjectsFromArray:", v28);
    objc_msgSend(v36, "addObjectsFromArray:", v25);
    objc_msgSend(v36, "removeObject:", v35);
    if (v32)
    {
      v93 = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v93, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v37 = 0;
    }

  }
  else
  {
    v37 = 0;
    v36 = 0;
  }
  objc_msgSend(*(id *)(v73 + 32), "subject");
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)v38;
  v40 = &stru_1E5A6A588;
  if (v38)
    v40 = (__CFString *)v38;
  v66 = v40;

  objc_msgSend(*(id *)(v73 + 32), "attachments");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = MEMORY[0x1E0C809B0];
  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  v80[2] = __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke_684;
  v80[3] = &unk_1E5A68190;
  v43 = v3;
  v81 = v43;
  objc_msgSend(v41, "ef_compactMap:", v80);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1EF48], "ec_partiallyRedactedStringForSubjectOrSummary:", v66);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)MEMORY[0x1E0D1EF48];
  objc_msgSend(v70, "string");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "ec_partiallyRedactedStringForSubjectOrSummary:", v45);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D1E6B8], "em_partiallyRedactedPeople:", v69);
  v60 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1E6B8], "em_partiallyRedactedPeople:", v68);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1E6B8], "em_partiallyRedactedPeople:", v67);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "ef_map:", &__block_literal_global_688);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "componentsJoinedByString:", CFSTR(", "));
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  MFComposeLog();
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544642;
    *(_QWORD *)&buf[4] = v64;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v63;
    *(_WORD *)&buf[22] = 2114;
    v89 = v60;
    *(_WORD *)v90 = 2114;
    *(_QWORD *)&v90[2] = v61;
    *(_WORD *)&v90[10] = 2114;
    *(_QWORD *)&v90[12] = v62;
    v91 = 2114;
    v92 = v59;
    _os_log_impl(&dword_1AB96A000, v47, OS_LOG_TYPE_DEFAULT, "Data to identify warnings. Subject: %{public}@ Body: %{public}@ To: %{public}@ Cc: %{public}@ Bcc: %{public}@ Attachments: %{public}@", buf, 0x3Eu);
  }

  objc_msgSend(MEMORY[0x1E0D19970], "serviceForMail");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setSyncTimeout:", 1.0);
  objc_msgSend(v70, "string");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = 0;
  objc_msgSend(v48, "identifyComposeWarningsFromSubject:content:attributes:toRecipients:ccRecipients:bccRecipients:originalToRecipients:originalCcRecipients:attachments:error:", v66, v49, MEMORY[0x1E0C9AA70], v69, v68, v67, v37, v36, v65, &v79);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v79;

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v89 = __Block_byref_object_copy__5;
  *(_QWORD *)v90 = __Block_byref_object_dispose__5;
  *(_QWORD *)&v90[8] = 0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(*(id *)(v73 + 32), "initialMissingAttachmentWarnings");
  *(_QWORD *)&v90[8] = objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count")
    && (objc_msgSend(v50, "ef_any:", &__block_literal_global_694) & 1) == 0)
  {
    v76[0] = v42;
    v76[1] = 3221225472;
    v76[2] = __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke_2_696;
    v76[3] = &unk_1E5A68238;
    v52 = *(_QWORD *)(v73 + 32);
    v78 = buf;
    v76[4] = v52;
    v77 = v48;
    objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "performBlock:", v76);

  }
  if (objc_msgSend(v50, "count"))
  {
    MFComposeLog();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v86 = 138412290;
      v87 = v50;
      _os_log_impl(&dword_1AB96A000, v54, OS_LOG_TYPE_DEFAULT, "Identified warnings: %@", v86, 0xCu);
    }

    if (!objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count"))
    {
      objc_msgSend(v50, "ef_filter:", &__block_literal_global_698);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v73 + 32), "setInitialMissingAttachmentWarnings:", v55);

    }
    v74[0] = v42;
    v74[1] = 3221225472;
    v74[2] = __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke_2_699;
    v74[3] = &unk_1E5A68280;
    v56 = *(void **)(v73 + 32);
    v57 = *(id *)(v73 + 40);
    v74[4] = *(_QWORD *)(v73 + 32);
    v75 = v57;
    objc_msgSend(v56, "_presentWarnings:index:suggestionsService:completionHandler:", v50, 0, v48, v74);

  }
  else
  {
    if (v51)
    {
      MFComposeLog();
      v58 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke_cold_1();

    }
    (*(void (**)(void))(*(_QWORD *)(v73 + 40) + 16))();
  }
  _Block_object_dispose(buf, 8);

LABEL_45:
}

id __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke_684(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "contentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) != 0
    || (objc_msgSend(v3, "fileName"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, !v6))
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v3, "mimeType");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = &stru_1E5A6A588;
    if (v7)
      v9 = (__CFString *)v7;
    v10 = v9;

    v11 = objc_alloc(MEMORY[0x1E0D19860]);
    objc_msgSend(v3, "fileName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "decodedFileSize"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithFileName:fileSizeInBytes:fileDescription:keywords:authors:", v12, v13, v10, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);

  }
  return v14;
}

id __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "fileName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke_692(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke_2_696(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "_reportUserEnagagement:suggestionService:warning:", 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5++), (_QWORD)v7);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setInitialMissingAttachmentWarnings:", 0);
}

uint64_t __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke_697(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke_2_699(uint64_t a1, int a2)
{
  if (a2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    objc_msgSend(*(id *)(a1 + 32), "_finishModalAlertClosingComposition:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setDidUseOmittedAttachmentsOrRecipients:", a2 ^ 1u);
}

- (void)_checkForShareParticipantsWithContinuation:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  Class v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
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
  id v30;
  void *v31;
  _QWORD v32[5];
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v4 = (void (**)(_QWORD))a3;
  -[MFMailComposeController compositionContext](self, "compositionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sharingSandboxingURLWrapper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "url");
  v7 = objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController compositionContext](self, "compositionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ckShare");
  v9 = objc_claimAutoreleasedReturnValue();

  -[MFMailComposeController compositionContext](self, "compositionContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ckContainerSetupInfo");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFMailComposeController compositionContext](self, "compositionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "ckSharePermissionType");

  -[MFMailComposeController compositionContext](self, "compositionContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "ckShareAllowOthersToInvite");

  if (v7 | v9)
  {
    v30 = objc_alloc_init(MEMORY[0x1E0D1EF60]);
    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__5;
    v46 = __Block_byref_object_dispose__5;
    v47 = 0;
    v15 = (Class)getCloudSharingClass[0]();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __70__MFMailComposeController__checkForShareParticipantsWithContinuation___block_invoke;
    v33[3] = &unk_1E5A682F8;
    v33[4] = self;
    v34 = (id)v7;
    v35 = v6;
    v39 = &v42;
    v40 = v12;
    v41 = v14;
    v36 = (id)v9;
    v16 = v30;
    v37 = v16;
    v38 = v31;
    -[objc_class sharingStatusForShare:completionHandler:](v15, "sharingStatusForShare:completionHandler:", v36, v33);
    objc_msgSend(v16, "future");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v17, "result");

    if (v43[5])
    {
      v29 = v6;
      v19 = (void *)MEMORY[0x1E0DC3450];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("UNABLE_TO_SHARE_ICLOUD_DOCUMENT"), &stru_1E5A6A588, CFSTR("Main"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("UNABLE_TO_SHARE_ICLOUD_DOCUMENT_MESSAGE"), &stru_1E5A6A588, CFSTR("Main"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "alertControllerWithTitle:message:preferredStyle:", v21, v23, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E5A6A588, CFSTR("Main"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __70__MFMailComposeController__checkForShareParticipantsWithContinuation___block_invoke_710;
      v32[3] = &unk_1E5A67A58;
      v32[4] = self;
      objc_msgSend(v25, "actionWithTitle:style:handler:", v27, 1, v32);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addAction:", v28);

      -[MFMailComposeController _presentModalAlert:](self, "_presentModalAlert:", v24);
      v6 = v29;
    }
    else
    {
      v4[2](v4);
    }

    _Block_object_dispose(&v42, 8);
  }
  else
  {
    v4[2](v4);
  }

}

void __70__MFMailComposeController__checkForShareParticipantsWithContinuation___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  Class v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  NSObject *v16;
  Class v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[6];
  _QWORD v23[6];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 32), "toRecipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

  objc_msgSend(*(id *)(a1 + 32), "ccRecipients");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  objc_msgSend(*(id *)(a1 + 32), "bccRecipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v7);

  if ((unint64_t)(a2 - 1) > 1)
  {
    MFComposeLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AB96A000, v16, OS_LOG_TYPE_DEFAULT, "No need to add share participants", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 64), "finishWithResult:", MEMORY[0x1E0C9AAB0]);
  }
  else
  {
    MFComposeLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v9;
      _os_log_impl(&dword_1AB96A000, v8, OS_LOG_TYPE_DEFAULT, "Adding participants to share as %@", buf, 0xCu);

    }
    if (*(_QWORD *)(a1 + 40) && (getCloudSharingClass[0](), (objc_opt_respondsToSelector() & 1) != 0))
    {
      v10 = (Class)getCloudSharingClass[0]();
      v11 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 56);
      v13 = *(unsigned __int8 *)(a1 + 96);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __70__MFMailComposeController__checkForShareParticipantsWithContinuation___block_invoke_702;
      v23[3] = &unk_1E5A682D0;
      v14 = *(_QWORD *)(a1 + 88);
      v23[5] = *(_QWORD *)(a1 + 80);
      v15 = v23;
      v23[4] = *(id *)(a1 + 64);
      -[objc_class addParticipantsToShareWithURLWrapper:share:emailAddresses:phoneNumbers:permissionType:allowOthersToInvite:completionHandler:](v10, "addParticipantsToShareWithURLWrapper:share:emailAddresses:phoneNumbers:permissionType:allowOthersToInvite:completionHandler:", v11, v12, v4, MEMORY[0x1E0C9AA60], v14, v13, v23);
    }
    else
    {
      v17 = (Class)getCloudSharingClass[0]();
      v18 = *(unsigned __int8 *)(a1 + 96);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __70__MFMailComposeController__checkForShareParticipantsWithContinuation___block_invoke_704;
      v22[3] = &unk_1E5A682D0;
      v19 = *(_QWORD *)(a1 + 88);
      v22[5] = *(_QWORD *)(a1 + 80);
      v15 = v22;
      v20 = *(_QWORD *)(a1 + 56);
      v21 = *(_QWORD *)(a1 + 72);
      v22[4] = *(id *)(a1 + 64);
      -[objc_class addParticipantsToShare:containerSetupInfo:emailAddresses:phoneNumbers:permissionType:allowOthersToInvite:completionHandler:](v17, "addParticipantsToShare:containerSetupInfo:emailAddresses:phoneNumbers:permissionType:allowOthersToInvite:completionHandler:", v20, v21, v4, MEMORY[0x1E0C9AA60], v19, v18, v22);
    }

  }
}

void __70__MFMailComposeController__checkForShareParticipantsWithContinuation___block_invoke_702(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a4;
  MFComposeLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1AB96A000, v7, OS_LOG_TYPE_DEFAULT, "Adding participants to share finished", v9, 2u);
  }

  if (v6)
  {
    MFComposeLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __70__MFMailComposeController__checkForShareParticipantsWithContinuation___block_invoke_702_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", MEMORY[0x1E0C9AAB0]);

}

void __70__MFMailComposeController__checkForShareParticipantsWithContinuation___block_invoke_704(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a4;
  MFComposeLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1AB96A000, v7, OS_LOG_TYPE_DEFAULT, "Adding participants to share finished", v9, 2u);
  }

  if (v6)
  {
    MFComposeLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __70__MFMailComposeController__checkForShareParticipantsWithContinuation___block_invoke_702_cold_1();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a4);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", MEMORY[0x1E0C9AAB0]);

}

uint64_t __70__MFMailComposeController__checkForShareParticipantsWithContinuation___block_invoke_710(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishModalAlertClosingComposition:", 0);
}

- (void)_presentSenderCollaborationAlertIfNecessaryForSendingAddress:(id)a3
{
  id v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[MFMailComposeController hasPresentedSenderCollaborationAlert](self, "hasPresentedSenderCollaborationAlert")
    && objc_msgSend(v4, "length"))
  {
    -[MFMailComposeController compositionContext](self, "compositionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ckShare");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentUserParticipant");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "lookupInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "emailAddress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(MEMORY[0x1E0D1E6B8], "emailAddressWithString:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "simpleAddress");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D1E6B8], "emailAddressWithString:", v4);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "simpleAddress");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if ((EFObjectsAreEqual() & 1) == 0)
      {
        v13 = (void *)MEMORY[0x1E0CB3858];
        objc_msgSend(v8, "nameComponents");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringFromPersonNameComponents:style:options:", v14, 2, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("ICLOUD_COLLABORATION_WARNING_FORMAT"), &stru_1E5A6A588, CFSTR("Main"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringWithFormat:", v17, v30, v10);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = (void *)MEMORY[0x1E0DC3450];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("ICLOUD_COLLABORATION_WARNING_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "alertControllerWithTitle:message:preferredStyle:", v20, v29, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = (void *)MEMORY[0x1E0DC3448];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E5A6A588, CFSTR("Main"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __88__MFMailComposeController__presentSenderCollaborationAlertIfNecessaryForSendingAddress___block_invoke;
        v33[3] = &unk_1E5A67A58;
        v33[4] = self;
        objc_msgSend(v22, "actionWithTitle:style:handler:", v24, 1, v33);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addAction:", v25);

        -[MFMailComposeController _presentModalAlert:](self, "_presentModalAlert:", v21);
        MFComposeLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v11, "ef_publicDescription");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "ef_publicDescription");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v35 = v27;
          v36 = 2114;
          v37 = v28;
          _os_log_impl(&dword_1AB96A000, v26, OS_LOG_TYPE_DEFAULT, "Presented sender collaboration alert. Sharing address: %{public}@ Sending address: %{public}@", buf, 0x16u);

        }
        -[MFMailComposeController setHasPresentedSenderCollaborationAlert:](self, "setHasPresentedSenderCollaborationAlert:", 1);

      }
    }

  }
}

uint64_t __88__MFMailComposeController__presentSenderCollaborationAlertIfNecessaryForSendingAddress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishModalAlertClosingComposition:", 0);
}

- (void)_presentWarnings:(id)a3 index:(unint64_t)a4 suggestionsService:(id)a5 completionHandler:(id)a6
{
  id v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  id v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[5];
  id v41;
  id v42;
  id v43;
  id v44;
  unint64_t v45;
  _QWORD v46[5];
  id v47;
  id v48;

  v9 = a3;
  v35 = a5;
  v37 = a6;
  if (objc_msgSend(v9, "count") > a4)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", a4);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "snippet");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = &stru_1E5A6A588;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("OMITTED_ATTACHMENTS_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CONFIRM_OMITTED_ATTACHMENTS_MESSAGE %@"), &stru_1E5A6A588, CFSTR("Main"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v14, v32);
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        -[MFMailComposeController _presentWarnings:index:suggestionsService:completionHandler:](self, "_presentWarnings:index:suggestionsService:completionHandler:", v9, a4 + 1, v35, v37);
        v33 = &stru_1E5A6A588;
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(v36, "matchFoundInBCC");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("UPGRADE_BCC_RECIPIENTS_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CONFIRM_UPGRADE_BCC_RECIPIENTS_MESSAGE %@"), &stru_1E5A6A588, CFSTR("Main"));
      }
      else
      {
        objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("OMITTED_RECIPIENTS_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CONFIRM_OMITTED_RECIPIENTS_MESSAGE %@"), &stru_1E5A6A588, CFSTR("Main"));
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", v14, v32);
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v10, v33, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("ADD_RECIPIENT"), &stru_1E5A6A588, CFSTR("Main"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v46[0] = MEMORY[0x1E0C809B0];
      v46[1] = 3221225472;
      v46[2] = __87__MFMailComposeController__presentWarnings_index_suggestionsService_completionHandler___block_invoke;
      v46[3] = &unk_1E5A68320;
      v46[4] = self;
      v47 = v35;
      v48 = v36;
      objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 0, v46);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addAction:", v22);

    }
    v23 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("SEND_ANYWAY"), &stru_1E5A6A588, CFSTR("Main"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __87__MFMailComposeController__presentWarnings_index_suggestionsService_completionHandler___block_invoke_2;
    v40[3] = &unk_1E5A68348;
    v40[4] = self;
    v41 = v35;
    v42 = v36;
    v43 = v9;
    v45 = a4;
    v26 = v37;
    v44 = v26;
    objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 0, v40);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAction:", v27);

    v28 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E5A6A588, CFSTR("Main"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __87__MFMailComposeController__presentWarnings_index_suggestionsService_completionHandler___block_invoke_3;
    v38[3] = &unk_1E5A680C8;
    v39 = v26;
    objc_msgSend(v28, "actionWithTitle:style:handler:", v30, 1, v38);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addAction:", v31);

    -[MFMailComposeController _presentModalAlert:](self, "_presentModalAlert:", v18);
    goto LABEL_14;
  }
  (*((void (**)(id, uint64_t))v37 + 2))(v37, 1);
LABEL_15:

}

void __87__MFMailComposeController__presentWarnings_index_suggestionsService_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_reportUserEnagagement:suggestionService:warning:", 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "mailComposeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isQuickReply");

  objc_msgSend(*(id *)(a1 + 48), "core");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  if (v3)
  {
    v8 = *MEMORY[0x1E0D46C88];
    v9 = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "expandQuickReplyToFullComposeAndPerformAction:additionalUserInfo:", 2, v7);

  }
  else
  {
    objc_msgSend(v6, "_updateAndStartCompletingCcFieldWithMissingRecipients:", v5);
  }

}

uint64_t __87__MFMailComposeController__presentWarnings_index_suggestionsService_completionHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_reportUserEnagagement:suggestionService:warning:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "_presentWarnings:index:suggestionsService:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72) + 1, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
}

uint64_t __87__MFMailComposeController__presentWarnings_index_suggestionsService_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_reportUserEnagagement:(BOOL)a3 suggestionService:(id)a4 warning:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  BOOL v15;

  v7 = a4;
  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__MFMailComposeController__reportUserEnagagement_suggestionService_warning___block_invoke;
  v12[3] = &unk_1E5A68370;
  v9 = v7;
  v13 = v9;
  v15 = a3;
  v10 = v8;
  v14 = v10;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "performBlock:", v12);

}

void __76__MFMailComposeController__reportUserEnagagement_suggestionService_warning___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  void *v9;
  const char *v10;
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v12 = 0;
  v5 = (id)objc_msgSend(v3, "reportUserEngagement:forWarning:error:", v2, v4, &v12);
  v6 = v12;
  if (v6)
  {
    MFComposeLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(unsigned __int8 *)(a1 + 48);
      v9 = (void *)objc_opt_class();
      v10 = "positive";
      *(_DWORD *)buf = 136446722;
      if (!v8)
        v10 = "negative";
      v14 = v10;
      v15 = 2114;
      v16 = v9;
      v17 = 2114;
      v18 = v6;
      v11 = v9;
      _os_log_error_impl(&dword_1AB96A000, v7, OS_LOG_TYPE_ERROR, "Error occurred while reporting '%{public}s' engagement for warning %{public}@ to Suggestions : %{public}@", buf, 0x20u);

    }
  }

}

- (void)_updateAndStartCompletingCcFieldWithMissingRecipients:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CNComposeRecipientTextView becomeFirstResponder](self->_ccField, "becomeFirstResponder");
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeRecipientTextView appendText:](self->_ccField, "appendText:", v4);

  }
}

- (void)_promptForMailDropIfNecessaryWithContinuation:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  __CFString *v18;
  void *v19;
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
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void (**v56)(void);
  MFMailComposeController *v57;
  _QWORD v58[5];
  _QWORD v59[4];
  void (**v60)(void);
  _QWORD v61[5];
  void (**v62)(void);
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v56 = (void (**)(void))a3;
  v57 = self;
  -[MFMailComposeController attachments](self, "attachments");
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v64 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "scaledFileSize");
        if (!v10)
          v10 = objc_msgSend(v9, "decodedFileSize");
        v5 += v10;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    }
    while (v6);
  }

  if (v5 > objc_msgSend(MEMORY[0x1E0D4D508], "currentUploadLimit"))
  {
    v11 = (void *)MEMORY[0x1E0DC3450];
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("TOO_BIG_FOR_CELL %d"), &stru_1E5A6A588, CFSTR("Main"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringWithFormat:", v14, 100);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend((id)CPGetDeviceRegionCode(), "isEqualToString:", CFSTR("CH"));
    v18 = CFSTR("TOO_BIG_FOR_CELL_MESSAGE");
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_CH"), CFSTR("TOO_BIG_FOR_CELL_MESSAGE"));
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v16, "localizedStringForKey:value:table:", v18, &stru_1E5A6A588, CFSTR("Main"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "alertControllerWithTitle:message:preferredStyle:", v15, v19, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    v21 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E5A6A588, CFSTR("Main"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "actionWithTitle:style:handler:", v23, 1, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addAction:", v24);

    -[MFMailComposeController presentViewController:animated:completion:](v57, "presentViewController:animated:completion:", v20, 1, 0);
LABEL_28:

    goto LABEL_29;
  }
  if (-[MFMailComposeController _shouldUseMailDrop](v57, "_shouldUseMailDrop"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP"), &stru_1E5A6A588, CFSTR("Main"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v4, "count") < 2)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_TITLE_FORMAT"), &stru_1E5A6A588, CFSTR("Main"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_NOT_USE_MESSAGE"), &stru_1E5A6A588, CFSTR("Main"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[_MFMailCompositionContext sendLaterDate](v57->_compositionContext, "sendLaterDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
LABEL_22:
        _EFLocalizedString();
        v33 = objc_claimAutoreleasedReturnValue();

        _EFLocalizedString();
        v34 = objc_claimAutoreleasedReturnValue();

        v20 = (void *)v33;
        v28 = (void *)v34;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_TITLE_MANY_FORMAT"), &stru_1E5A6A588, CFSTR("Main"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_NOT_USE_MESSAGE_PLURAL"), &stru_1E5A6A588, CFSTR("Main"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[_MFMailCompositionContext sendLaterDate](v57->_compositionContext, "sendLaterDate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
        goto LABEL_22;
    }
    -[_MFMailCompositionContext sendLaterDate](v57->_compositionContext, "sendLaterDate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      _EFLocalizedString();
      v36 = objc_claimAutoreleasedReturnValue();

      v55 = (void *)v36;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "mf_stringRepresentationForBytes:", v5);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v20, v52);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeController setUseMailDrop:](v57, "setUseMailDrop:", 0);
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v55, v54, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setModalPresentationStyle:", 7);
    objc_msgSend(v37, "popoverPresentationController");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setBarButtonItem:", v57->_sendButtonItem);
    objc_msgSend(v53, "setPermittedArrowDirections:", 1);
    -[_MFMailCompositionContext sendLaterDate](v57->_compositionContext, "sendLaterDate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38 == 0;

    v40 = MEMORY[0x1E0C809B0];
    if (v39)
    {
      v41 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_USE_MESSAGE"), &stru_1E5A6A588, CFSTR("Main"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __73__MFMailComposeController__promptForMailDropIfNecessaryWithContinuation___block_invoke;
      v61[3] = &unk_1E5A68398;
      v61[4] = v57;
      v62 = v56;
      objc_msgSend(v41, "actionWithTitle:style:handler:", v43, 0, v61);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "addAction:", v44);

      v40 = MEMORY[0x1E0C809B0];
    }
    v45 = (void *)MEMORY[0x1E0DC3448];
    v59[0] = v40;
    v59[1] = 3221225472;
    v59[2] = __73__MFMailComposeController__promptForMailDropIfNecessaryWithContinuation___block_invoke_2;
    v59[3] = &unk_1E5A680C8;
    v60 = v56;
    objc_msgSend(v45, "actionWithTitle:style:handler:", v28, 0, v59);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addAction:", v46);

    v47 = v40;
    v48 = (void *)MEMORY[0x1E0DC3448];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E5A6A588, CFSTR("Main"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = v47;
    v58[1] = 3221225472;
    v58[2] = __73__MFMailComposeController__promptForMailDropIfNecessaryWithContinuation___block_invoke_3;
    v58[3] = &unk_1E5A67A58;
    v58[4] = v57;
    objc_msgSend(v48, "actionWithTitle:style:handler:", v50, 1, v58);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addAction:", v51);

    -[MFMailComposeController presentViewController:animated:completion:](v57, "presentViewController:animated:completion:", v37, 1, 0);
    goto LABEL_28;
  }
  v56[2]();
LABEL_29:

}

uint64_t __73__MFMailComposeController__promptForMailDropIfNecessaryWithContinuation___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setUseMailDrop:", 1);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "attachments", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v5), "placeholder");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setUseMailDrop:", 1);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __73__MFMailComposeController__promptForMailDropIfNecessaryWithContinuation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __73__MFMailComposeController__promptForMailDropIfNecessaryWithContinuation___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setUseMailDrop:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_finishModalAlertClosingComposition:", 0);
}

- (BOOL)_shouldUseMailDrop
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[MFMailComposeController sendingAccountProxy](self, "sendingAccountProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if ((!v3 || objc_msgSend(v3, "supportsMailDrop"))
    && objc_msgSend(MEMORY[0x1E0D4D508], "mailDropConfigured"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[MFMailComposeController attachments](self, "attachments", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          v11 = objc_msgSend(v10, "scaledFileSize");
          if (!v11)
            v11 = objc_msgSend(v10, "decodedFileSize");
          v6 += v11;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    v12 = v6 > objc_msgSend(MEMORY[0x1E0D4D508], "mailDropThreshold");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)setHasAddedEditableHyperlink:(BOOL)a3
{
  self->_hasAddedEditableHyperlink = a3;
}

- (void)_physicallyScaleImagesToScale:(unint64_t)a3 attachments:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v10, "imageScalingFlags", (_QWORD)v14) & a3) != 0)
        {
          -[MFMailComposeController compositionContext](self, "compositionContext");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "contextID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (id)objc_msgSend(v10, "scaledImageToFit:saveScaledImage:attachmentContextID:", a3, 1, v12);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

}

- (void)_prepareImagesForSendWithContinuation:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void (**v13)(void *, _QWORD);
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  void (**v20)(void *, _QWORD);
  id v21[2];
  id location;
  _QWORD aBlock[5];
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MFMailComposeController attachments](self, "attachments");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v5);
        v6 |= objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v9++), "imageScalingFlags");
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);
  }

  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke;
  aBlock[3] = &unk_1E5A683E8;
  aBlock[4] = self;
  v11 = v5;
  v24 = v11;
  v12 = v4;
  v25 = v12;
  v13 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  if (-[MFMailComposeController canShowImageSizeField](self, "canShowImageSizeField"))
  {
    v14 = +[MFComposeTypeFactory imageScaleFromUserDefaults](MFComposeTypeFactory, "imageScaleFromUserDefaults");
    if ((v14 & v6) != 0)
      v15 = v14;
    else
      v15 = 0;
    v13[2](v13, v15);
  }
  else if (v6)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    -[MFMailComposeController _estimateMessageSize](self, "_estimateMessageSize");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeController prepareImagesForSendScheduler](self, "prepareImagesForSendScheduler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_4;
    v18[3] = &unk_1E5A68460;
    objc_copyWeak(v21, &location);
    v19 = v11;
    v21[1] = (id)v6;
    v20 = v13;
    objc_msgSend(v16, "onScheduler:addSuccessBlock:", v17, v18);

    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }
  else
  {
    v13[2](v13, 0);
  }

}

void __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke(id *a1, void *a2)
{
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8[2];
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, a1[4]);
  objc_msgSend(a1[4], "prepareImagesForSendScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_2;
  v5[3] = &unk_1E5A683C0;
  objc_copyWeak(v8, &location);
  v8[1] = a2;
  v6 = a1[5];
  v7 = a1[6];
  objc_msgSend(v4, "performBlock:", v5);

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
}

void __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_physicallyScaleImagesToScale:attachments:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_3;
  v4[3] = &unk_1E5A66780;
  v5 = *(id *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performBlock:", v4);

}

uint64_t __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  id v56;
  void *v57;
  void *v58;
  unint64_t v59;
  unint64_t v60;
  void *v61;
  uint64_t v62;
  id WeakRetained;
  _QWORD v65[5];
  id v66;
  _QWORD v67[5];
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  id location[3];
  _QWORD v78[3];
  _QWORD v79[3];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v56 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = objc_msgSend(v56, "unsignedLongValue");
  v60 = objc_msgSend(WeakRetained, "_sizeForScale:imagesOnly:", 0, 0);
  objc_msgSend(MEMORY[0x1E0CB3940], "mf_stringRepresentationForBytes:", v2);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v74;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v74 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v73 + 1) + 8 * i), "isDisplayableImage"))
        {
          if (v5)
          {

            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("LARGE_IMAGES_MESSAGE"), &stru_1E5A6A588, CFSTR("Main"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          }
          v5 = 1;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
      if (v4)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("LARGE_SINGLE_IMAGE_MESSAGE"), &stru_1E5A6A588, CFSTR("Main"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  v9 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v57, v58);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", v10, 0, 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  memset(v79, 170, sizeof(v79));
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SMALL_SIZE_UNKNOWN_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
  v79[0] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("MEDIUM_SIZE_UNKNOWN_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
  v79[1] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("LARGE_SIZE_UNKNOWN_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
  v79[2] = objc_claimAutoreleasedReturnValue();

  memset(v78, 170, sizeof(v78));
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SMALL_SIZE_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
  v78[0] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("MEDIUM_SIZE_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
  v78[1] = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("LARGE_SIZE_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
  v78[2] = objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v62 = 0;
  v18 = 0;
  memset(location, 0, sizeof(location));
  v59 = v2 - v60;
  v19 = 1;
  do
  {
    v20 = qword_1ABAA0DE8[v18];
    if ((v20 & *(_QWORD *)(a1 + 56)) == 0)
      goto LABEL_25;
    if ((v17 & 1) != 0)
    {
      objc_storeStrong(&location[v18], (id)v79[v18]);
LABEL_24:
      v17 = 1;
      goto LABEL_25;
    }
    objc_msgSend(WeakRetained, "compositionContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "attachmentManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "compositionContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "contextID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v22, "sizeForScale:imagesOnly:forContext:", v20, 0, v24);

    if (!v25)
    {
      v32 = 0;
      v33 = location;
      do
        objc_storeStrong(v33++, (id)v79[v32++]);
      while (v19 != v32);
      goto LABEL_24;
    }
    v26 = (void *)MEMORY[0x1E0CB3940];
    v27 = v78[v18];
    objc_msgSend(MEMORY[0x1E0CB3940], "mf_stringRepresentationForBytes:", v59 + v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = location[v18];
    location[v18] = v29;

    v17 = 0;
    if (v25 >= v60)
      v31 = v20;
    else
      v31 = 0;
    v62 |= v31;
LABEL_25:
    ++v18;
    ++v19;
  }
  while (v18 != 3);
  v34 = 0;
  v35 = MEMORY[0x1E0C809B0];
  v36 = v62;
  do
  {
    v37 = location[v34];
    if (v37)
    {
      v38 = qword_1ABAA0DE8[v34];
      if ((v38 & v36) == 0)
      {
        v39 = (void *)MEMORY[0x1E0DC3448];
        v70[0] = v35;
        v70[1] = 3221225472;
        v70[2] = __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_5;
        v70[3] = &unk_1E5A68438;
        v71 = *(id *)(a1 + 40);
        v72 = v38;
        objc_msgSend(v39, "actionWithTitle:style:handler:", v37, 0, v70);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "addAction:", v40);

        v36 = v62;
      }
    }
    ++v34;
  }
  while (v34 != 3);
  v41 = (void *)MEMORY[0x1E0DC3448];
  v42 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("ACTUAL_SIZE_TITLE %@"), &stru_1E5A6A588, CFSTR("Main"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "stringWithFormat:", v44, v58);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = v35;
  v68[1] = 3221225472;
  v68[2] = __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_7;
  v68[3] = &unk_1E5A680C8;
  v69 = *(id *)(a1 + 40);
  objc_msgSend(v41, "actionWithTitle:style:handler:", v45, 0, v68);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "addAction:", v46);

  v47 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E5A6A588, CFSTR("Main"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v35;
  v67[1] = 3221225472;
  v67[2] = __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_9;
  v67[3] = &unk_1E5A67A58;
  v67[4] = WeakRetained;
  objc_msgSend(v47, "actionWithTitle:style:handler:", v49, 1, v67);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "addAction:", v50);

  v65[0] = v35;
  v65[1] = 3221225472;
  v65[2] = __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_11;
  v65[3] = &unk_1E5A65430;
  v65[4] = WeakRetained;
  v51 = v61;
  v66 = v51;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "performBlock:", v65);

  for (j = 2; j != -1; --j)
  for (k = 2; k != -1; --k)

  for (m = 2; m != -1; --m)
}

void __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_5(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_6;
  v5[3] = &unk_1E5A68410;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = v2;
  v7 = v3;
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler", v5[0], 3221225472, __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_6, &unk_1E5A68410);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performBlock:", v5);

}

uint64_t __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_7(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_8;
  v2[3] = &unk_1E5A66780;
  v3 = *(id *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "performBlock:", v2);

}

uint64_t __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_9(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_10;
  v2[3] = &unk_1E5A65480;
  v2[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "performBlock:", v2);

}

uint64_t __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finishModalAlertClosingComposition:", 0);
}

uint64_t __65__MFMailComposeController__prepareImagesForSendWithContinuation___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentModalAlert:", *(_QWORD *)(a1 + 40));
}

- (void)serializedPlaceholderForFileName:(id)a3 fileSize:(int64_t)a4 mimeType:(id)a5 contentID:(id)a6 withHandler:(id)a7
{
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v11 = a7;
  v12 = (void *)MEMORY[0x1E0D46AD0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __100__MFMailComposeController_serializedPlaceholderForFileName_fileSize_mimeType_contentID_withHandler___block_invoke;
  v14[3] = &unk_1E5A68488;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "placeholderAttachmentForFileName:fileSize:mimeType:contentID:completionBlock:", a3, a4, a5, a6, v14);

}

uint64_t __100__MFMailComposeController_serializedPlaceholderForFileName_fileSize_mimeType_contentID_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)securityScopeForURL:(id)a3 withHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  MFMailComposeController *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0D46AD0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__MFMailComposeController_securityScopeForURL_withHandler___block_invoke;
  v11[3] = &unk_1E5A684B0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "securityScopeForPlaceholderURL:completionBlock:", v10, v11);

}

void __59__MFMailComposeController_securityScopeForURL_withHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(MEMORY[0x1E0D4D538], "securityScopedURL:withToken:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 1464);
  objc_msgSend(*(id *)(a1 + 32), "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v3, v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)sendMessage:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v21[4];
  id v22[2];
  uint8_t v23[16];
  _BYTE buf[12];
  __int16 v25;
  MFMailComposeController *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = a3 - 1;
  if (a3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v6, OS_SIGNPOST_EVENT, a3, "MAIL SEND", "Starting sendMessage", buf, 2u);
  }

  self->_resolution = 1;
  MFComposeLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_resolution);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v9;
    _os_log_impl(&dword_1AB96A000, v8, OS_LOG_TYPE_DEFAULT, "_resolution changed to %@ as the send button was pressed.", buf, 0xCu);

  }
  MFComposeLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v12;
    v25 = 2048;
    v26 = self;
    _os_log_impl(&dword_1AB96A000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@: %p> User tapped send button", buf, 0x16u);

  }
  -[MFMutableMessageHeaders removeHeaderForKey:](self->_savedHeaders, "removeHeaderForKey:", *MEMORY[0x1E0D1E630]);
  -[MFMutableMessageHeaders removeHeaderForKey:](self->_savedHeaders, "removeHeaderForKey:", *MEMORY[0x1E0D1E620]);
  -[MFMutableMessageHeaders removeHeaderForKey:](self->_savedHeaders, "removeHeaderForKey:", *MEMORY[0x1E0D1E638]);
  -[MFMutableMessageHeaders removeHeaderForKey:](self->_savedHeaders, "removeHeaderForKey:", *MEMORY[0x1E0D1E570]);
  -[MFMutableMessageHeaders removeHeaderForKey:](self->_savedHeaders, "removeHeaderForKey:", *MEMORY[0x1E0D1E578]);
  if (self->_composeWebViewFlags.respondsToCompositionWillFinish)
  {
    -[MFMailComposeController composeWebView](self, "composeWebView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "compositionWillFinish");

  }
  -[MFMailComposeController photoPickerProgressManager](self, "photoPickerProgressManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "cancelEverything");

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)v23 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v16, OS_SIGNPOST_EVENT, a3, "MAIL SEND", "Starting to finalize Body Input", v23, 2u);
  }

  -[MFMailComposeController stripCustomBodyIdentifiers](self, "stripCustomBodyIdentifiers");
  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)v23 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v18, OS_SIGNPOST_EVENT, a3, "MAIL SEND", "Finished finalizing Body Input", v23, 2u);
  }

  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)v23 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v20, OS_SIGNPOST_EVENT, a3, "MAIL SEND", "Starting to finalize signature", v23, 2u);
  }

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __39__MFMailComposeController_sendMessage___block_invoke;
  v21[3] = &unk_1E5A679B8;
  v22[1] = (id)a3;
  objc_copyWeak(v22, (id *)buf);
  -[MFMailComposeController finalizeSignature:](self, "finalizeSignature:", v21);
  objc_destroyWeak(v22);
  objc_destroyWeak((id *)buf);
}

void __39__MFMailComposeController_sendMessage___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  _BYTE *WeakRetained;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  _QWORD v11[4];
  id v12[2];
  uint8_t buf[8];

  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished finalizing signature", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (!WeakRetained || (WeakRetained[1352] & 0x40) != 0)
  {
    +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = *(_QWORD *)(a1 + 40);
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AB96A000, v9, OS_SIGNPOST_EVENT, v10, "MAIL SEND", "Delivery is not hosted", buf, 2u);
    }

    objc_msgSend(v6, "_finishedComposing");
  }
  else
  {
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, WeakRetained);
    v7 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __39__MFMailComposeController_sendMessage___block_invoke_781;
    v11[3] = &unk_1E5A679B8;
    v12[1] = v7;
    objc_copyWeak(v12, (id *)buf);
    objc_msgSend(v6, "_setUpDeliveryObject:completionHandler:", v7, v11);
    objc_destroyWeak(v12);
    objc_destroyWeak((id *)buf);
  }

}

void __39__MFMailComposeController_sendMessage___block_invoke_781(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  id WeakRetained;
  uint8_t v6[16];

  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v3, OS_SIGNPOST_EVENT, v4, "MAIL SEND", "Finished setting up delivery object", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_finishedComposing");

}

- (int64_t)resolution
{
  return self->_resolution;
}

- (void)setResolution:(int64_t)a3
{
  self->_resolution = a3;
}

- (BOOL)needsDelivery
{
  return (unint64_t)(self->_resolution - 1) < 2;
}

- (void)setUpForSaveAsDraft
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  self->_resolution = 2;
  MFComposeLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_resolution);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1AB96A000, v3, OS_LOG_TYPE_DEFAULT, "_resolution changed to %@ when setting up to save as a draft.", (uint8_t *)&v5, 0xCu);

  }
}

- (BOOL)isSavingAsDraft
{
  return self->_resolution == 2;
}

- (void)_explainAirplaneMode
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__MFMailComposeController__explainAirplaneMode__block_invoke;
  block[3] = &unk_1E5A65480;
  block[4] = self;
  if (_explainAirplaneMode_onceToken != -1)
    dispatch_once(&_explainAirplaneMode_onceToken, block);
}

void __47__MFMailComposeController__explainAirplaneMode__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __47__MFMailComposeController__explainAirplaneMode__block_invoke_2;
  v2[3] = &unk_1E5A65480;
  v2[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "performBlock:", v2);

}

void __47__MFMailComposeController__explainAirplaneMode__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v2 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("AIRPLANE_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("AIRPLANE_EXPLAIN"), &stru_1E5A6A588, CFSTR("Main"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alertControllerWithTitle:message:preferredStyle:", v4, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E5A6A588, CFSTR("Main"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__MFMailComposeController__explainAirplaneMode__block_invoke_3;
  v12[3] = &unk_1E5A67A58;
  v12[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 0, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v11);

  objc_msgSend(*(id *)(a1 + 32), "_presentModalAlert:", v7);
}

uint64_t __47__MFMailComposeController__explainAirplaneMode__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "close");
}

- (void)deliverMessageRemotely:(id)a3
{
  id v4;
  int64_t resolution;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;
  _QWORD *v18;
  BOOL v19;
  _QWORD v20[4];

  v4 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 3;
  resolution = self->_resolution;
  v6 = resolution == 1;
  if (resolution == 1)
    -[MFMailComposeController _messageForRemoteDelivery](self, "_messageForRemoteDelivery");
  else
    -[MFMailComposeController _messageForDraft](self, "_messageForDraft");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__MFMailComposeController_deliverMessageRemotely___block_invoke;
  v16[3] = &unk_1E5A68550;
  v19 = v6;
  v16[4] = self;
  v18 = v20;
  v10 = v4;
  v17 = v10;
  objc_msgSend(v7, "onScheduler:addSuccessBlock:", v8, v16);

  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __50__MFMailComposeController_deliverMessageRemotely___block_invoke_2_789;
  v13[3] = &unk_1E5A68578;
  v12 = v10;
  v14 = v12;
  v15 = v20;
  objc_msgSend(v7, "onScheduler:addFailureBlock:", v11, v13);

  _Block_object_dispose(v20, 8);
}

void __50__MFMailComposeController_deliverMessageRemotely___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  dispatch_semaphore_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  NSObject *v24;
  uint64_t v25;
  _QWORD v26[5];
  NSObject *v27;
  uint64_t v28;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "useMailDrop"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "mutableHeaders");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHeader:forKey:", v5, *MEMORY[0x1E0D45F10]);

  }
  objc_msgSend(v3, "messageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = dispatch_semaphore_create(0);
    v9 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 56))
    {
      v10 = objc_msgSend(v9, "isHideMyEmailMessage");
      objc_msgSend(*(id *)(a1 + 32), "compositionContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sendLaterDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0D46AD8];
      objc_msgSend(*(id *)(a1 + 32), "autosaveIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __50__MFMailComposeController_deliverMessageRemotely___block_invoke_2;
      v26[3] = &unk_1E5A68500;
      v15 = *(_QWORD *)(a1 + 32);
      v28 = *(_QWORD *)(a1 + 48);
      v26[4] = v15;
      v27 = v8;
      v16 = (id)objc_msgSend(v13, "sendMessageData:autosaveIdentifier:isHMEMessage:sendLaterDate:completionBlock:", v7, v14, v10, v12, v26);

      v17 = v27;
    }
    else
    {
      objc_msgSend(v9, "accountProxyGenerator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sendingEmailAddress");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "accountProxyContainingEmailAddress:includingInactive:originatingBundleID:sourceAccountManagement:", v19, 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1608), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1552));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "uniqueID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (void *)MEMORY[0x1E0D46AD0];
      objc_msgSend(*(id *)(a1 + 32), "autosaveIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __50__MFMailComposeController_deliverMessageRemotely___block_invoke_788;
      v23[3] = &unk_1E5A68528;
      v25 = *(_QWORD *)(a1 + 48);
      v24 = v8;
      objc_msgSend(v21, "saveMessageData:forAccountWithID:autosaveIdentifier:completionBlock:", v7, v12, v22, v23);

      v17 = v24;
    }

    dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend(v3, "setMessageBody:", 0);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __50__MFMailComposeController_deliverMessageRemotely___block_invoke_2(uint64_t a1, int a2, int a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  char v12;

  v7 = a4;
  if (a2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 2;
    if (a3)
      objc_msgSend(*(id *)(a1 + 32), "_explainAirplaneMode");
  }
  v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__MFMailComposeController_deliverMessageRemotely___block_invoke_3;
  v10[3] = &unk_1E5A684D8;
  v12 = a2;
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "_performBlockWithStrongComposeCoordinator:", v10);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __50__MFMailComposeController_deliverMessageRemotely___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(a1 + 40))
  {
    MFComposeLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "#SiriMailComposeCoordinator setting sent state", (uint8_t *)&v7, 2u);
    }
    v5 = CFSTR("sent");
  }
  else
  {
    MFComposeLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "#SiriMailComposeCoordinator setting failed state due to error: %@", (uint8_t *)&v7, 0xCu);

    }
    v5 = CFSTR("failed");
  }

  objc_msgSend(v3, "setState:", v5);
}

intptr_t __50__MFMailComposeController_deliverMessageRemotely___block_invoke_788(uint64_t a1, int a2)
{
  if (a2)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __50__MFMailComposeController_deliverMessageRemotely___block_invoke_2_789(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

- (void)_finishedComposing
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  BOOL v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _BOOL4 v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[5];
  void (**v34)(_QWORD);
  id v35;
  BOOL v36;
  _QWORD v37[5];
  id v38;
  _QWORD v39[4];
  id v40;
  _QWORD aBlock[4];
  id v42;
  _BYTE location[14];
  const __CFString *v44;
  _QWORD v45[4];

  v45[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  objc_msgSend(MEMORY[0x1E0D46AB0], "autosave");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController autosaveIdentifier](self, "autosaveIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAutosavedMessageWithIdentifier:", v5);

  -[MFMailComposeController setAutosaveSession:](self, "setAutosaveSession:", 0);
  -[MFMailComposeController attachments](self, "attachments");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__MFMailComposeController__finishedComposing__block_invoke;
  aBlock[3] = &unk_1E5A65480;
  v32 = v6;
  v42 = v32;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *(_QWORD *)location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    v39[0] = v7;
    v39[1] = 3221225472;
    v39[2] = __45__MFMailComposeController__finishedComposing__block_invoke_792;
    v39[3] = &unk_1E5A685A0;
    objc_copyWeak(&v40, (id *)location);
    objc_msgSend(WeakRetained, "mailComposeControllerCompositionFinished:prepareForDismissalHandler:", self, v39);
    v8[2](v8);
    objc_destroyWeak(&v40);
    objc_destroyWeak((id *)location);
    goto LABEL_9;
  }
  v37[0] = v7;
  v37[1] = 3221225472;
  v37[2] = __45__MFMailComposeController__finishedComposing__block_invoke_2;
  v37[3] = &unk_1E5A685C8;
  v37[4] = self;
  v38 = WeakRetained;
  v9 = _Block_copy(v37);
  v10 = -[MFMailComposeController needsDelivery](self, "needsDelivery");
  if (v10)
  {
    v33[0] = v7;
    v33[1] = 3221225472;
    v33[2] = __45__MFMailComposeController__finishedComposing__block_invoke_798;
    v33[3] = &unk_1E5A68630;
    v36 = -[MFMailComposeController resolution](self, "resolution") == 1;
    v33[4] = self;
    v34 = v8;
    v35 = v9;
    -[MFMailComposeController deliverMessageRemotely:](self, "deliverMessageRemotely:", v33);

  }
  else
  {
    -[MFMailComposeController _performBlockWithStrongComposeCoordinator:](self, "_performBlockWithStrongComposeCoordinator:", &__block_literal_global_797);
    MFComposeLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543362;
      *(_QWORD *)&location[4] = v13;
      _os_log_impl(&dword_1AB96A000, v11, OS_LOG_TYPE_DEFAULT, "<%{public}@> Composing an email was cancelled.", location, 0xCu);

    }
    (*((void (**)(void *, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }

  if (v10)
  {
LABEL_9:
    MFLogGeneral();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)location = 0;
      _os_log_impl(&dword_1AB96A000, v14, OS_LOG_TYPE_DEFAULT, "Adding analytics for editable hyperlinks", location, 2u);
    }

    v44 = CFSTR("sentWithEditableLink");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MFMailComposeController hasAddedEditableHyperlink](self, "hasAddedEditableHyperlink"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E140]), "initWithEventName:collectionData:", CFSTR("com.apple.email.sent"), v16);
    -[MFMailComposeController analyticsCollector](self, "analyticsCollector");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "logOneTimeEvent:", v17);

    -[MFMailComposeController hideMyEmailAddressIfExists](self, "hideMyEmailAddressIfExists");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {

    }
    else if (!-[MFMailComposeController hideMyEmailMultipleRecipient](self, "hideMyEmailMultipleRecipient"))
    {
LABEL_17:

      goto LABEL_18;
    }
    MFLogGeneral();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      -[MFMailComposeController hideMyEmailAddressIfExists](self, "hideMyEmailAddressIfExists");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[MFMailComposeController hideMyEmailMultipleRecipient](self, "hideMyEmailMultipleRecipient");
      *(_DWORD *)location = 67109376;
      *(_DWORD *)&location[4] = v21 != 0;
      *(_WORD *)&location[8] = 1024;
      *(_DWORD *)&location[10] = v22;
      _os_log_impl(&dword_1AB96A000, v20, OS_LOG_TYPE_DEFAULT, "Adding Telemetry for the Compose Session for Hide My Email Send %d and Hide My Email Multiple recipients %d.", location, 0xEu);

    }
    v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v23, "setObject:forKeyedSubscript:", &unk_1E5A9F388, CFSTR("hideMyEmailSession"));
    v24 = (void *)MEMORY[0x1E0CB37E8];
    -[MFMailComposeController hideMyEmailAddressIfExists](self, "hideMyEmailAddressIfExists");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "numberWithInt:", v25 != 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v26, CFSTR("hideMyEmailSend"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[MFMailComposeController hideMyEmailMultipleRecipient](self, "hideMyEmailMultipleRecipient"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v27, CFSTR("hideMyEmailMultipleRecipient"));

    v28 = objc_alloc(MEMORY[0x1E0D1E140]);
    v29 = (void *)objc_msgSend(v23, "copy");
    v30 = (void *)objc_msgSend(v28, "initWithEventName:collectionData:", CFSTR("com.apple.mail.hideMyEmailMultipleRecipients"), v29);

    -[MFMailComposeController analyticsCollector](self, "analyticsCollector");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "logOneTimeEvent:", v30);

    goto LABEL_17;
  }
LABEL_18:

}

void __45__MFMailComposeController__finishedComposing__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v12 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        MFGreenTeaLogger();
        getCTGreenTeaOsLogHandle();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        if (v6)
        {
          v8 = v6;
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v9 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "contentTypeIdentifier");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v16 = v9;
            v17 = 2114;
            v18 = v10;
            _os_log_impl(&dword_1AB96A000, v8, OS_LOG_TYPE_INFO, "%@ <Mail>[com.apple.mobilemail]:[com.apple.greentea:mobilemail] Transmitted attachment(s): filetype %{public}@", buf, 0x16u);

          }
        }

      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v19, 16);
    }
    while (v2);
  }

}

void __45__MFMailComposeController__finishedComposing__block_invoke_792(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_sendAnalyticsSignalForResult:", a2);

}

void __45__MFMailComposeController__finishedComposing__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_sendAnalyticsSignalForResult:", a2);
  v6 = objc_msgSend(MEMORY[0x1E0DC3708], "mf_isPad") ^ 1;
  if (a2 != 2)
    LOBYTE(v6) = 1;
  if ((v6 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "parentViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setModalTransitionStyle:", 13);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mailComposeController:didFinishWithResult:error:", v9, a2, v5);

    if (v5)
    {
      MFComposeLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543618;
        v15 = v12;
        v16 = 2114;
        v17 = v13;
        _os_log_impl(&dword_1AB96A000, v10, OS_LOG_TYPE_DEFAULT, "<%{public}@> Compose error: %{public}@", (uint8_t *)&v14, 0x16u);

      }
    }
  }

}

void __45__MFMailComposeController__finishedComposing__block_invoke_796(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = a2;
  MFComposeLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AB96A000, v3, OS_LOG_TYPE_DEFAULT, "#SiriMailComposeCoordinator setting cancelled state", v4, 2u);
  }

  objc_msgSend(v2, "setState:", CFSTR("cancelled"));
}

void __45__MFMailComposeController__finishedComposing__block_invoke_798(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a2 == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MFMailComposeErrorDomain"), *(unsigned __int8 *)(a1 + 56), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    MFComposeLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v6;
      v11 = 2114;
      v12 = v7;
      _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "<%{public}@> Compose error: %{public}@", (uint8_t *)&v9, 0x16u);

    }
    v8 = v3;
  }
  else
  {
    v8 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)setDraftMessage:(id)a3
{
  id v5;

  v5 = a3;
  -[MFMailComposeController mf_lock](self, "mf_lock");
  objc_storeStrong((id *)&self->_lastDraftMessage, a3);
  -[MFMailComposeController mf_unlock](self, "mf_unlock");

}

- (void)setRecipientsKeyboardType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  -[CNComposeRecipientTextView textView](self->_toField, "textView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textInputTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeyboardType:", a3);

  -[CNComposeRecipientTextView textView](self->_ccField, "textView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "textInputTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setKeyboardType:", a3);

  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bccField");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v13;
  if (v13)
  {
    objc_msgSend(v13, "textView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textInputTraits");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setKeyboardType:", a3);

    v8 = v13;
  }

}

- (id)contentVariationName
{
  void *v2;
  void *v4;
  void *v5;

  if (self->_selectedContentVariationIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = 0;
  }
  else
  {
    -[_MFMailCompositionContext contentVariations](self->_compositionContext, "contentVariations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", self->_selectedContentVariationIndex);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (BOOL)canShowContentVariationPicker
{
  void *v2;
  BOOL v3;

  -[_MFMailCompositionContext contentVariations](self->_compositionContext, "contentVariations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (void)loadView
{
  MFMailComposeView *v3;
  MFMailComposeToField *v4;
  MFMailComposeToField *toField;
  MFMailComposeRecipientTextView *v6;
  MFMailComposeRecipientTextView *ccField;
  MFComposeSubjectView *v8;
  MFComposeSubjectView *subjectField;
  void *v10;
  MFComposeWebView *v11;
  MFComposeWebView *composeWebView;
  MFMailComposeView *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  MFComposeSubjectView *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  MFMailComposeView *v26;
  MFMailComposeController *v27;

  objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
  v3 = -[MFMailComposeView initWithFrame:options:isQuickReply:]([MFMailComposeView alloc], "initWithFrame:options:isQuickReply:", 0, -[_MFMailCompositionContext isQuickReply](self->_compositionContext, "isQuickReply") & _os_feature_enabled_impl(), *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 320.0, 320.0);
  -[MFMailComposeView setComposeViewDelegate:](v3, "setComposeViewDelegate:", self);
  -[MFMailComposeView setComposeRecipientDelegate:](v3, "setComposeRecipientDelegate:", self);
  -[MFMailComposeView toField](v3, "toField");
  v4 = (MFMailComposeToField *)objc_claimAutoreleasedReturnValue();
  toField = self->_toField;
  self->_toField = v4;

  -[MFMailComposeView ccField](v3, "ccField");
  v6 = (MFMailComposeRecipientTextView *)objc_claimAutoreleasedReturnValue();
  ccField = self->_ccField;
  self->_ccField = v6;

  -[MFMailComposeView subjectField](v3, "subjectField");
  v8 = (MFComposeSubjectView *)objc_claimAutoreleasedReturnValue();
  subjectField = self->_subjectField;
  self->_subjectField = v8;

  -[MFComposeSubjectView setDelegate:](self->_subjectField, "setDelegate:", self);
  -[_MFMailCompositionContext draftSubject](self->_compositionContext, "draftSubject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFComposeSubjectView setText:](self->_subjectField, "setText:", v10);

  -[MFMailComposeView composeWebView](v3, "composeWebView");
  v11 = (MFComposeWebView *)objc_claimAutoreleasedReturnValue();
  composeWebView = self->_composeWebView;
  self->_composeWebView = v11;

  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __35__MFMailComposeController_loadView__block_invoke;
  v25 = &unk_1E5A67A30;
  v13 = v3;
  v26 = v13;
  v27 = self;
  -[MFMailComposeController _performBlockWithStrongComposeCoordinator:](self, "_performBlockWithStrongComposeCoordinator:", &v22);
  v14 = 1.0;
  if (!self->_contentVisible)
    v14 = 0.0;
  -[MFComposeWebView setAlpha:](self->_composeWebView, "setAlpha:", v14, v22, v23, v24, v25);
  if (-[_MFMailCompositionContext prefersFirstLineSelection](self->_compositionContext, "prefersFirstLineSelection"))
    -[MFComposeWebView setPrefersFirstLineSelection](self->_composeWebView, "setPrefersFirstLineSelection");
  -[MFMailComposeController composeWebView](self, "composeWebView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  self->_composeWebViewFlags.respondsToCompositionWillFinish = objc_opt_respondsToSelector() & 1;

  -[MFMailComposeController composeWebView](self, "composeWebView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  self->_composeWebViewFlags.respondsToCompositionDidFailToFinish = objc_opt_respondsToSelector() & 1;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = self->_subjectField;
  if (v18)
  {
    -[MFComposeSubjectView textView](v18, "textView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", self, sel__subjectTextChanged_, *MEMORY[0x1E0DC55A0], v19);

  }
  v20 = *MEMORY[0x1E0D13610];
  objc_msgSend(v17, "addObserver:selector:name:object:", self, sel__recipientTextChanged_, *MEMORY[0x1E0D13610], self->_toField);
  objc_msgSend(v17, "addObserver:selector:name:object:", self, sel__recipientTextChanged_, v20, self->_ccField);
  -[MFMailComposeView bccField](v13, "bccField");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addObserver:selector:name:object:", self, sel__recipientTextChanged_, v20, v21);

  objc_msgSend(v17, "addObserver:selector:name:object:", self, sel__composeViewDidDraw_, CFSTR("MailComposeViewDidDraw"), v13);
  objc_msgSend(v17, "addObserver:selector:name:object:", self, sel__focusGained_, *MEMORY[0x1E0DC54C8], 0);
  if ((_os_feature_enabled_impl() & 1) == 0)
    -[MFMailComposeView setToFieldDelegate:](v13, "setToFieldDelegate:", self);
  -[MFMailComposeView setNavigationBarDelegate:](v13, "setNavigationBarDelegate:", self);
  -[MFMailComposeView setPreservesSuperviewLayoutMargins:](v13, "setPreservesSuperviewLayoutMargins:", 1);
  -[MFMailComposeView setInsetsLayoutMarginsFromSafeArea:](v13, "setInsetsLayoutMarginsFromSafeArea:", 0);
  -[MFMailComposeController setView:](self, "setView:", v13);
  -[MFMailComposeController _setInitialStateForImageField](self, "_setInitialStateForImageField");

}

void __35__MFMailComposeController_loadView__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setComposeCoordinator:");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1200), "setComposeCoordinator:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _TtC9MessageUI20MessageUITipsManager *v11;
  _TtC9MessageUI20MessageUITipsManager *tipsManager;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MFMailComposeController;
  -[MFMailComposeController viewDidLoad](&v13, sel_viewDidLoad);
  if ((*((_BYTE *)self + 1352) & 0x10) != 0)
  {
    -[MFMailComposeController _restoreMessageValues](self, "_restoreMessageValues");
    -[MFMailComposeController _addressFieldForField:](self, "_addressFieldForField:", self->_recipientFieldWhileViewUnloaded);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setExpanded:", 1);
    -[MFMailComposeController mailComposeView](self, "mailComposeView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRecipientFieldsEditable:animated:", 1, 0);

    if (v3)
    {
      objc_msgSend(v3, "textView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "becomeFirstResponder");

    }
    self->_recipientFieldWhileViewUnloaded = 0;
    *((_BYTE *)self + 1352) &= ~0x10u;
  }
  else
  {
    -[MFMailComposeController _loadCompositionContext](self, "_loadCompositionContext");
    -[MFMailComposeController mailComposeView](self, "mailComposeView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setRecipientFieldsEditable:animated:", 0, 0);
  }

  -[MFMailComposeController emailAddresses](self, "emailAddresses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fromField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAvailableAddresses:", v6);

  -[MFMailComposeController _setupLargeTitleAccessory](self, "_setupLargeTitleAccessory");
  -[MFMailComposeController _setupNavigationBarItems](self, "_setupNavigationBarItems");
  -[MFMailComposeController _setupOrnamentViewController](self, "_setupOrnamentViewController");
  -[MFMailComposeController _setupSendLaterOnboardingPaletteIfNecessary](self, "_setupSendLaterOnboardingPaletteIfNecessary");
  -[MFMailComposeController _setupForQuickReply](self, "_setupForQuickReply");
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPopoverOwner:", self);

  -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");
  -[MFMailComposeController compositionContext](self, "compositionContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertDeferredAttachmentsIntoComposeWebView:", self->_composeWebView);

  v11 = -[MessageUITipsManager initWith:]([_TtC9MessageUI20MessageUITipsManager alloc], "initWith:", self);
  tipsManager = self->_tipsManager;
  self->_tipsManager = v11;

}

- (void)viewWillUnload
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFMailComposeController;
  -[MFMailComposeController viewWillUnload](&v4, sel_viewWillUnload);
  -[MFMailComposeController _saveMessageValues](self, "_saveMessageValues");
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setComposeViewDelegate:", 0);
  objc_msgSend(v3, "setComposeRecipientDelegate:", 0);
  self->_recipientFieldWhileViewUnloaded = -[MFMailComposeController _fieldForAddressField:](self, "_fieldForAddressField:", self->_lastFocusedRecipientView);
  *((_BYTE *)self + 1352) |= 0x10u;

}

- (void)viewDidUnload
{
  void *v3;
  MFComposeSubjectView *subjectField;
  void *v5;
  MFMailComposeToField *toField;
  MFMailComposeRecipientTextView *ccField;
  MFComposeImageSizeView *imageSizeField;
  MFComposeSubjectView *v9;
  MFComposeWebView *composeWebView;
  objc_super v11;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DD9898], 0);
  subjectField = self->_subjectField;
  if (subjectField)
  {
    -[MFComposeSubjectView textView](subjectField, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC55A0], v5);

  }
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D13610], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MFMailComposeContactsSearchControllerWillBeginSearch"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MFMailComposeContactsSearchControllerDidEndSearch"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("MailComposeViewDidDraw"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC54C8], 0);
  toField = self->_toField;
  self->_toField = 0;

  ccField = self->_ccField;
  self->_ccField = 0;

  imageSizeField = self->_imageSizeField;
  self->_imageSizeField = 0;

  -[MFComposeSubjectView setDelegate:](self->_subjectField, "setDelegate:", 0);
  v9 = self->_subjectField;
  self->_subjectField = 0;

  composeWebView = self->_composeWebView;
  self->_composeWebView = 0;

  objc_storeWeak((id *)&self->_savedFirstResponder, 0);
  v11.receiver = self;
  v11.super_class = (Class)MFMailComposeController;
  -[MFMailComposeController viewDidUnload](&v11, sel_viewDidUnload);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MFMailComposeController;
  -[MFMailComposeController viewDidLayoutSubviews](&v14, sel_viewDidLayoutSubviews);
  -[MFMailComposeController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_bottomPalette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bounds");
  v7 = v6;
  -[MFMailComposeController previousPaletteWidth](self, "previousPaletteWidth");
  v9 = v7 - v8;
  if (v9 < 0.0)
    v9 = -v9;
  if (v9 >= 2.22044605e-16)
  {
    -[MFMailComposeController setPreviousPaletteWidth:](self, "setPreviousPaletteWidth:", v7);
    objc_msgSend(v5, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
    v11 = v10;
    -[MFMailComposeController navigationItem](self, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_bottomPalette");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPreferredHeight:", v11);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  _QWORD block[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MFMailComposeController;
  -[MFMailComposeController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  -[MFMailComposeController pickInitialFirstResponder](self, "pickInitialFirstResponder");
  -[MFMailComposeController setIsModal:](self, "setIsModal:", 1);
  -[MFMailComposeController traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mf_supportsPopoverPresentation");

  if ((v5 & 1) == 0)
  {
    -[MFMailComposeController contactViewController](self, "contactViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[MFMailComposeController setContactViewController:](self, "setContactViewController:", 0);
      -[MFMailComposeController setAtomPresentingCard:](self, "setAtomPresentingCard:", 0);
      -[MFMailComposeController setRecipientPresentingCard:](self, "setRecipientPresentingCard:", 0);
      -[MFMailComposeController mailComposeView](self, "mailComposeView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "restoreFirstResponderWithKeyboardPinning:", 1);

    }
  }
  -[MFMailComposeController setDelayToShowMarkupHasPassed:](self, "setDelayToShowMarkupHasPassed:", 0);
  v8 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__MFMailComposeController_viewWillAppear___block_invoke;
  block[3] = &unk_1E5A65480;
  block[4] = self;
  dispatch_after(v8, MEMORY[0x1E0C80D38], block);
}

void __42__MFMailComposeController_viewWillAppear___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_attachmentToMarkup");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 32), "attachmentToMarkupIsLoaded");
  if (v6)
    v3 = v2;
  else
    v3 = 0;
  v4 = *(void **)(a1 + 32);
  if (v3 == 1)
  {
    objc_msgSend(v4, "markupAttachment:");
    objc_msgSend(*(id *)(a1 + 32), "compositionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttachmentToMarkupContentID:", 0);

  }
  else
  {
    objc_msgSend(v4, "setDelayToShowMarkupHasPassed:", 1);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint8_t v10[16];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MFMailComposeController;
  -[MFMailComposeController viewDidAppear:](&v11, sel_viewDidAppear_, a3);
  -[MFMailComposeController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeWeak((id *)&self->_containingWindow, v5);
  -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");
  if ((*((char *)self + 1352) & 0x80000000) == 0)
  {
    -[MFMailComposeController _sendViewVisibilityNotification:window:](self, "_sendViewVisibilityNotification:window:", CFSTR("MFMailComposeViewDidShow"), v5);
    *((_BYTE *)self + 1352) |= 0x80u;
    -[MFMailComposeController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_clearInitialTitle, 0, 1.0);
    if (-[MFMailComposeController canShowImageSizeField](self, "canShowImageSizeField"))
      -[MFMailComposeController _scaleImages](self, "_scaleImages");
  }
  if (-[_MFMailCompositionContext caretPosition](self->_compositionContext, "caretPosition") != 0x7FFFFFFFFFFFFFFFLL)
    -[MFMailComposeController setCaretPosition:](self, "setCaretPosition:", -[_MFMailCompositionContext caretPosition](self->_compositionContext, "caretPosition"));
  v6 = -[MFMailComposeController popoverManagerCreateIfNeeded:](self, "popoverManagerCreateIfNeeded:", 1);
  -[MFMailComposeController _startAutosaveTimerIfNeeded](self, "_startAutosaveTimerIfNeeded");
  -[MFMailComposeController _updateAutosaveSession](self, "_updateAutosaveSession");
  -[MFMailComposeController _makeComposeUserActivityCurrent](self, "_makeComposeUserActivityCurrent");
  -[MFMailComposeController _updateSendAndCloseButtonTintColor](self, "_updateSendAndCloseButtonTintColor");
  -[MFMailComposeController tipsManager](self, "tipsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "controllerDidAppear");

  -[MFMailComposeController _performDeferredActionIfNecessary](self, "_performDeferredActionIfNecessary");
  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = -[MFMailComposeController signpostID](self, "signpostID");
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v9, "MAIL COMPOSE", "MFMailComposeController viewDidAppear", v10, 2u);
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  NSTimer *autosaveTimer;
  MSAutosaveSession *autosaveSession;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFMailComposeController;
  -[MFMailComposeController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  -[NSTimer invalidate](self->_autosaveTimer, "invalidate");
  autosaveTimer = self->_autosaveTimer;
  self->_autosaveTimer = 0;

  autosaveSession = self->_autosaveSession;
  self->_autosaveSession = 0;

  -[MFMailComposeController dismissSheet](self, "dismissSheet");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id WeakRetained;
  void *v12;
  MFMailPopoverManager *popoverManager;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  uint8_t v19[16];
  objc_super v20;

  v3 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MFMailComposeController;
  -[MFMailComposeController viewDidDisappear:](&v20, sel_viewDidDisappear_);
  -[MFMailComposeController presentedViewController](self, "presentedViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[MFMailComposeController presentedViewController](self, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "adaptivePresentationStyle");

    if (v9 == 7)
      -[MFMailComposeController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", v3, 0);
  }
  -[MFMailComposeController presentedViewController](self, "presentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    *((_BYTE *)self + 1352) &= ~0x80u;
    -[MFMailComposeController setDelayToShowMarkupHasPassed:](self, "setDelayToShowMarkupHasPassed:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_containingWindow);
    -[MFMailComposeController _sendViewVisibilityNotification:window:](self, "_sendViewVisibilityNotification:window:", CFSTR("MFMailComposeViewDidDismiss"), WeakRetained);

  }
  if (self->_popoverManager)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObserver:name:object:", self, CFSTR("MFMailWillPresentPopoverNotification"), 0);

    popoverManager = self->_popoverManager;
    self->_popoverManager = 0;

  }
  if (self->_resolution == 1)
  {
    -[_MFMailCompositionContext sendLaterDate](self->_compositionContext, "sendLaterDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      +[MFSoundController playSentMailSound](MFSoundController, "playSentMailSound");
  }
  -[MFMailComposeController userActivity](self, "userActivity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "resignCurrent");

  -[MFMailComposeController tipsManager](self, "tipsManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "controllerDidDisappear");

  +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = -[MFMailComposeController signpostID](self, "signpostID");
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)v19 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AB96A000, v17, OS_SIGNPOST_INTERVAL_END, v18, "MAIL COMPOSE", "MFMailComposeController viewDidDisappear", v19, 2u);
  }

}

- (void)_sendViewVisibilityNotification:(id)a3 window:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    v11 = CFSTR("MFMailComposeViewWindowKey");
    v12[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", v6, self, v10);

  }
  else
  {
    objc_msgSend(v8, "postNotificationName:object:", v6, self);
  }

}

- (void)applicationWillSuspend
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMailComposeController;
  -[MFMailComposeController applicationWillSuspend](&v3, sel_applicationWillSuspend);
  -[MFMailComposeController _prepareForSuspend](self, "_prepareForSuspend");
}

- (void)_clearMessageValues
{
  NSArray *toAddresses;
  NSArray *ccAddresses;
  NSArray *bccAddresses;
  NSString *subject;
  EFFuture *content;

  toAddresses = self->_toAddresses;
  if (toAddresses)
  {
    self->_toAddresses = 0;

  }
  ccAddresses = self->_ccAddresses;
  if (ccAddresses)
  {
    self->_ccAddresses = 0;

  }
  bccAddresses = self->_bccAddresses;
  if (bccAddresses)
  {
    self->_bccAddresses = 0;

  }
  subject = self->_subject;
  if (subject)
  {
    self->_subject = 0;

  }
  content = self->_content;
  if (content)
  {
    self->_content = 0;

  }
}

- (void)_saveMessageValues
{
  NSArray *v3;
  NSArray *toAddresses;
  NSArray *v5;
  NSArray *ccAddresses;
  void *v7;
  NSArray *v8;
  NSArray *bccAddresses;
  NSString *v10;
  NSString *subject;
  EFFuture *v12;
  EFFuture *content;
  id v14;

  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController _clearMessageValues](self, "_clearMessageValues");
  -[CNComposeRecipientTextView addresses](self->_toField, "addresses");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  toAddresses = self->_toAddresses;
  self->_toAddresses = v3;

  -[CNComposeRecipientTextView addresses](self->_ccField, "addresses");
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  ccAddresses = self->_ccAddresses;
  self->_ccAddresses = v5;

  objc_msgSend(v14, "bccField");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addresses");
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
  bccAddresses = self->_bccAddresses;
  self->_bccAddresses = v8;

  -[MFComposeSubjectView text](self->_subjectField, "text");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  subject = self->_subject;
  self->_subject = v10;

  -[MFComposeWebView htmlString](self->_composeWebView, "htmlString");
  v12 = (EFFuture *)objc_claimAutoreleasedReturnValue();
  content = self->_content;
  self->_content = v12;

  *((_BYTE *)self + 1352) |= -[MFComposeWebView isDirty](self->_composeWebView, "isDirty");
}

- (void)_restoreMessageValues
{
  void *v3;
  id v4;

  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_toAddresses)
    -[CNComposeRecipientTextView setAddresses:](self->_toField, "setAddresses:");
  if (self->_ccAddresses)
    -[CNComposeRecipientTextView setAddresses:](self->_ccField, "setAddresses:");
  if (self->_bccAddresses)
  {
    objc_msgSend(v4, "bccField");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAddresses:", self->_bccAddresses);

  }
  if (self->_subject)
    -[MFMailComposeController setSubject:](self, "setSubject:");
  -[MFMailComposeController _clearMessageValues](self, "_clearMessageValues");

}

- (void)_prepareForSuspend
{
  if ((*((_BYTE *)self + 1352) & 8) == 0)
  {
    -[MFMailComposeController _dismissPeoplePicker:](self, "_dismissPeoplePicker:", 0);
    -[MFMailComposeController finishEnteringRecipients](self, "finishEnteringRecipients");
    -[MFMailComposeController _saveMessageValues](self, "_saveMessageValues");
    *((_BYTE *)self + 1352) |= 8u;
  }
}

- (BOOL)_isActiveComposeController
{
  char v3;
  id WeakRetained;

  if (-[MFMailComposeController hosted](self, "hosted"))
    return 1;
  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(WeakRetained, "mailComposeControllerIsActiveComposeController:", self);
  else
    v3 = 0;

  return v3;
}

- (void)didBecomeActiveComposeController
{
  id v3;

  if (-[MFMailComposeController _isActiveComposeController](self, "_isActiveComposeController"))
  {
    -[MFMailComposeController view](self, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAnimationDisabled:", 1);
    *((_BYTE *)self + 1352) &= ~4u;
    -[MFMailComposeController _restoreMessageValues](self, "_restoreMessageValues");
    objc_msgSend(v3, "setAnimationDisabled:", 0);
    -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");
    -[MFMailComposeController _updateRecipientAtomStyles](self, "_updateRecipientAtomStyles");
    *((_BYTE *)self + 1352) &= ~8u;
    -[MFMailComposeController _accountsChanged:](self, "_accountsChanged:", 0);
    -[MFMailComposeController _makeComposeUserActivityCurrent](self, "_makeComposeUserActivityCurrent");

  }
}

- (void)applicationDidResume
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMailComposeController;
  -[MFMailComposeController applicationDidResume](&v3, sel_applicationDidResume);
  -[MFMailComposeController didBecomeActiveComposeController](self, "didBecomeActiveComposeController");
}

- (id)popoverManagerCreateIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  MFMailPopoverManager *popoverManager;
  BOOL v8;
  MFMailPopoverManager *v10;
  MFMailPopoverManager *v11;
  void *v12;
  MFMailPopoverManager *v13;

  v3 = a3;
  -[MFMailComposeController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  popoverManager = self->_popoverManager;
  if (popoverManager)
    v8 = 1;
  else
    v8 = !v3;
  if (!v8 && v6 != 0)
  {
    +[MFMailPopoverManager managerForWindow:createIfNeeded:](MFMailPopoverManager, "managerForWindow:createIfNeeded:", v6, 1);
    v10 = (MFMailPopoverManager *)objc_claimAutoreleasedReturnValue();
    v11 = self->_popoverManager;
    self->_popoverManager = v10;

    if (self->_popoverManager)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:selector:name:object:", self, sel__popoverWillBePresented_, CFSTR("MFMailWillPresentPopoverNotification"), self->_popoverManager);

      popoverManager = self->_popoverManager;
    }
    else
    {
      popoverManager = 0;
    }
  }
  v13 = popoverManager;

  return v13;
}

- (id)popoverManager
{
  return -[MFMailComposeController popoverManagerCreateIfNeeded:](self, "popoverManagerCreateIfNeeded:", 0);
}

- (void)_popoverWillBePresented:(id)a3
{
  void *v4;
  int v5;

  if (-[MFMailComposeController _isActiveComposeController](self, "_isActiveComposeController", a3))
  {
    -[MFMailComposeController traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "mf_supportsPopoverPresentation");

    if (v5)
    {
      *((_BYTE *)self + 1353) |= 2u;
      -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");
    }
  }
}

- (BOOL)canBecomeFirstResponder
{
  return !-[MFMailComposeController _isDummyViewController](self, "_isDummyViewController");
}

- (void)viewLayoutMarginsDidChange
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MFMailComposeController;
  -[MFMailComposeController viewLayoutMarginsDidChange](&v19, sel_viewLayoutMarginsDidChange);
  -[MFMailComposeController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "directionalLayoutMargins");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[MFMailComposeController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safeAreaInsets");
  +[MFComposeDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:](MFComposeDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:", v3, v6, v8, v10, v12, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController setDisplayMetrics:](self, "setDisplayMetrics:", v18);

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;

  -[MFMailComposeController traitCollection](self, "traitCollection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "directionalLayoutMargins");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[MFMailComposeController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safeAreaInsets");
  +[MFComposeDisplayMetrics displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:](MFComposeDisplayMetrics, "displayMetricsWithTraitCollection:layoutMargins:safeAreaInsets:", v4, v7, v9, v11, v13, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController setDisplayMetrics:](self, "setDisplayMetrics:", v19);

  -[MFMailComposeController _updateSendAndCloseButtonTintColor](self, "_updateSendAndCloseButtonTintColor");
}

- (void)_displayMetricsDidChange
{
  id v3;

  -[MFMailComposeController displayMetrics](self, "displayMetrics");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendBarButtonItemImageInsets");
  -[UIBarButtonItem setImageInsets:](self->_sendButtonItem, "setImageInsets:");

}

- (void)_dismissPresentedViewController
{
  void *v3;
  id v4;

  -[MFMailComposeController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MFMailComposeController presentedViewController](self, "presentedViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)_dismissPresentedHalfSheet
{
  void *v3;
  void *v4;
  MFPhotoPickerController *photosPickerController;
  MFComposePhotoPickerController *systemPhotosPickerController;
  MFComposePhotoPickerController *v7;
  id v8;
  id v9;
  id v10;

  -[MFMailComposeController traitCollection](self, "traitCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "mf_supportsPopoverPresentation")
    || (-[MFMailComposeController presentedViewController](self, "presentedViewController"),
        (v3 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {

  }
  else
  {
    if (self->_photosPickerController)
    {
LABEL_6:

LABEL_7:
      -[MFMailComposeController composeWebView](self, "composeWebView");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "releaseFocusAfterDismissing:", 0);

      -[MFMailComposeController presentedViewController](self, "presentedViewController");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, 0);

      photosPickerController = self->_photosPickerController;
      self->_photosPickerController = 0;

      systemPhotosPickerController = self->_systemPhotosPickerController;
      self->_systemPhotosPickerController = 0;

      -[MFMailComposeController setStyleSelector:](self, "setStyleSelector:", 0);
      return;
    }
    -[MFMailComposeController styleSelector](self, "styleSelector");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {

      goto LABEL_6;
    }
    v7 = self->_systemPhotosPickerController;

    if (v7)
      goto LABEL_7;
  }
}

- (id)_messageToDonate
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
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  MFMailComposeController *v18;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[MFMailComposeController sendingEmailAddress](self, "sendingEmailAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D46CB8]);

  -[MFMailComposeController toRecipients](self, "toRecipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __43__MFMailComposeController__messageToDonate__block_invoke((uint64_t)v5, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D46CC8]);

  -[MFMailComposeController ccRecipients](self, "ccRecipients");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __43__MFMailComposeController__messageToDonate__block_invoke((uint64_t)v7, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D46CA8]);

  -[MFMailComposeController bccRecipients](self, "bccRecipients");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __43__MFMailComposeController__messageToDonate__block_invoke((uint64_t)v9, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D46CA0]);

  -[MFMailComposeController subject](self, "subject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D46CC0]);

  v12 = -[MFMailComposeController _copyMessagePlainTextForDonation](self, "_copyMessagePlainTextForDonation");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __43__MFMailComposeController__messageToDonate__block_invoke_3;
  v16[3] = &unk_1E5A686A8;
  v13 = v3;
  v17 = v13;
  v18 = self;
  objc_msgSend(v12, "then:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __43__MFMailComposeController__messageToDonate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MFPersonTransformer *v3;
  MFPersonTransformer *v4;
  void *v5;
  _QWORD v7[4];
  MFPersonTransformer *v8;

  v2 = a2;
  v3 = objc_alloc_init(MFPersonTransformer);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__MFMailComposeController__messageToDonate__block_invoke_2;
  v7[3] = &unk_1E5A68658;
  v8 = v3;
  v4 = v3;
  objc_msgSend(v2, "ef_compactMap:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __43__MFMailComposeController__messageToDonate__block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "transformedValue:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __43__MFMailComposeController__messageToDonate__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v17 = a2;
  if (objc_msgSend(v17, "count"))
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v3 = v17;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v21;
      v6 = &stru_1E5A6A588;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v21 != v5)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v9 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v8, "string");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "stringWithFormat:", CFSTR("%@%@"), v6, v10);
            v11 = objc_claimAutoreleasedReturnValue();

            v6 = (__CFString *)v11;
          }
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v4);
    }
    else
    {
      v6 = &stru_1E5A6A588;
    }

    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByTrimmingCharactersInSet:](v6, "stringByTrimmingCharactersInSet:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D46CB0]);
  }
  v14 = (void *)objc_msgSend(*(id *)(a1 + 40), "_copyMessagePlainTextForDonationRemoveQuotes:", 1);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __43__MFMailComposeController__messageToDonate__block_invoke_4;
  v18[3] = &unk_1E5A68680;
  v19 = *(id *)(a1 + 32);
  objc_msgSend(v14, "then:", v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __43__MFMailComposeController__messageToDonate__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = a2;
  if (objc_msgSend(v17, "count"))
  {
    v16 = a1;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v3 = v17;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v19;
      v6 = &stru_1E5A6A588;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v19 != v5)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v9 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v8, "string");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "stringWithFormat:", CFSTR("%@%@"), v6, v10);
            v11 = objc_claimAutoreleasedReturnValue();

            v6 = (__CFString *)v11;
          }
        }
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v4);
    }
    else
    {
      v6 = &stru_1E5A6A588;
    }

    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByTrimmingCharactersInSet:](v6, "stringByTrimmingCharactersInSet:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v16 + 32), "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0D46CD0]);
    a1 = v16;
  }
  objc_msgSend(MEMORY[0x1E0D1EEC0], "futureWithResult:", *(_QWORD *)(a1 + 32));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)_isTabKeyCommandInvocationPossible
{
  BOOL v3;
  void *v4;
  MFMailComposeController *v5;
  BOOL v6;

  if (-[MFMailComposeController _isDummyViewController](self, "_isDummyViewController"))
    return 0;
  -[MFMailComposeController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstResponder");
  v5 = (MFMailComposeController *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v5 == self;
  else
    v6 = 1;
  v3 = v6;

  return v3;
}

- (void)_tabKeyCommandInvoked:(id)a3
{
  -[CNComposeRecipientTextView becomeFirstResponder](self->_toField, "becomeFirstResponder", a3);
}

- (void)_focusBccHeaderCommandInvoked:(id)a3
{
  void *v3;
  id v4;

  -[MFMailComposeController mailComposeView](self, "mailComposeView", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bccField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "becomeFirstResponder");

}

- (void)_replyAllCommandInvoked:(id)a3
{
  -[_MFMailCompositionContext switchToReplyAllWithDelegate:](self->_compositionContext, "switchToReplyAllWithDelegate:", self);
}

- (void)_replyCommandInvoked:(id)a3
{
  -[_MFMailCompositionContext switchToReplyWithDelegate:](self->_compositionContext, "switchToReplyWithDelegate:", self);
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[6];

  v17[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)keyCommands_keyCommands_0;
  if (!keyCommands_keyCommands_0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SEND"), &stru_1E5A6A588, CFSTR("Main"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __38__MFMailComposeController_keyCommands__block_invoke((uint64_t)v15, (uint64_t)CFSTR("d"), 1179648, (uint64_t)sel_send_, v15, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v3;
    __38__MFMailComposeController_keyCommands__block_invoke((uint64_t)v3, *MEMORY[0x1E0DC4DA0], 0, (uint64_t)sel__escapeShortcutInvoked_, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v4;
    __38__MFMailComposeController_keyCommands__block_invoke((uint64_t)v4, (uint64_t)CFSTR("\t"), 0, (uint64_t)sel__tabKeyCommandInvoked_, 0, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v5;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("REPLY_ALL"), &stru_1E5A6A588, CFSTR("Main"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __38__MFMailComposeController_keyCommands__block_invoke((uint64_t)v7, (uint64_t)CFSTR("r"), 1179648, (uint64_t)sel__replyAllCommandInvoked_, v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[3] = v8;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("REPLY"), &stru_1E5A6A588, CFSTR("Main"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __38__MFMailComposeController_keyCommands__block_invoke((uint64_t)v10, (uint64_t)CFSTR("r"), 0x100000, (uint64_t)sel__replyCommandInvoked_, v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[4] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 5);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)keyCommands_keyCommands_0;
    keyCommands_keyCommands_0 = v12;

    v2 = (void *)keyCommands_keyCommands_0;
  }
  return v2;
}

id __38__MFMailComposeController_keyCommands__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, int a6)
{
  id v10;
  void *v11;
  uint64_t v12;

  v10 = a5;
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", a2, a3, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDiscoverabilityTitle:", v10);
  if (a6)
  {
    objc_msgSend(v11, "_nonRepeatableKeyCommand");
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }

  return v11;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  BOOL v7;
  unsigned __int8 v8;
  BOOL v10;
  objc_super v11;

  v6 = a4;
  if (-[MFMailComposeController _isDummyViewController](self, "_isDummyViewController"))
  {
    v7 = 0;
    goto LABEL_14;
  }
  if (sel_importDocument == a3)
  {
    v8 = -[MFMailComposeController canShowAttachmentPicker](self, "canShowAttachmentPicker");
LABEL_13:
    v7 = v8;
    goto LABEL_14;
  }
  if (sel_send_ == a3)
  {
    v8 = -[MFMailComposeController _shouldEnableSendButton](self, "_shouldEnableSendButton");
    goto LABEL_13;
  }
  if (sel__tabKeyCommandInvoked_ == a3)
  {
    v8 = -[MFMailComposeController _isTabKeyCommandInvocationPossible](self, "_isTabKeyCommandInvocationPossible");
    goto LABEL_13;
  }
  if (sel__replyAllCommandInvoked_ == a3)
  {
    v10 = -[MFMailComposeController composeType](self, "composeType") == 4;
  }
  else
  {
    if (sel__replyCommandInvoked_ != a3)
    {
      if (sel_close_ == a3)
      {
        v8 = -[UIBarButtonItem isEnabled](self->_closeButtonItem, "isEnabled");
      }
      else
      {
        v11.receiver = self;
        v11.super_class = (Class)MFMailComposeController;
        v8 = -[MFMailComposeController canPerformAction:withSender:](&v11, sel_canPerformAction_withSender_, a3, v6);
      }
      goto LABEL_13;
    }
    v10 = -[MFMailComposeController composeType](self, "composeType") == 5;
  }
  v7 = v10;
LABEL_14:

  return v7;
}

- (BOOL)isVerticallyCompact
{
  void *v2;
  BOOL v3;

  -[MFMailComposeController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "verticalSizeClass") == 1;

  return v3;
}

- (BOOL)_isDummyViewController
{
  return (LOBYTE(self->_options) >> 2) & 1;
}

- (int64_t)popoverPresentationStyleForViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;

  v4 = a3;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "viewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v8)
  {

    goto LABEL_7;
  }
  -[MFMailComposeController peoplePicker](self, "peoplePicker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v9)
  {
LABEL_7:
    v10 = -1;
    goto LABEL_8;
  }
  v10 = 3;
LABEL_8:

  return v10;
}

- (void)_dismissPeoplePicker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[MFMailComposeController peoplePicker](self, "peoplePicker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MFMailComposeController peoplePicker](self, "peoplePicker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeController presentedViewController](self, "presentedViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
    {
      objc_msgSend(v4, "popoverPresentationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __48__MFMailComposeController__dismissPeoplePicker___block_invoke;
      v14[3] = &unk_1E5A65480;
      v9 = v8;
      v15 = v9;
      -[MFMailComposeController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v14);
      -[MFMailComposeController traitCollection](self, "traitCollection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "mf_supportsPopoverPresentation");

      if ((v11 & 1) == 0)
      {
        -[MFMailComposeController mailComposeView](self, "mailComposeView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "restoreFirstResponderWithKeyboardPinning:", 1);

      }
    }
  }
  -[MFMailComposeController setPeoplePicker:](self, "setPeoplePicker:", 0);
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setShowingPeoplePicker:", 0);

}

void __48__MFMailComposeController__dismissPeoplePicker___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentationControllerDidDismiss:", *(_QWORD *)(a1 + 32));

  }
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t recipientFieldWhileViewUnloaded;
  uint64_t v13;
  NSArray *bccAddresses;
  void *v15;
  objc_class *v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  objc_msgSend(v6, "emailAddresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13690]), "initWithContact:address:kind:", v6, v9, 0);
  v11 = v10;
  if ((*((_BYTE *)self + 1352) & 0x10) == 0)
  {
    -[MFMailComposeRecipientTextView addRecipient:](self->_lastFocusedRecipientView, "addRecipient:", v10);
    goto LABEL_12;
  }
  recipientFieldWhileViewUnloaded = self->_recipientFieldWhileViewUnloaded;
  switch(recipientFieldWhileViewUnloaded)
  {
    case 3:
      v13 = 1008;
      bccAddresses = self->_bccAddresses;
      if (!bccAddresses)
        break;
LABEL_11:
      objc_msgSend(v10, "commentedAddress");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray arrayByAddingObject:](bccAddresses, "arrayByAddingObject:", v15);
      v16 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v17 = *(Class *)((char *)&self->super.super.super.isa + v13);
      *(Class *)((char *)&self->super.super.super.isa + v13) = v16;

      break;
    case 2:
      v13 = 1000;
      bccAddresses = self->_ccAddresses;
      if (!bccAddresses)
        break;
      goto LABEL_11;
    case 1:
      v13 = 992;
      bccAddresses = self->_toAddresses;
      if (bccAddresses)
        goto LABEL_11;
      break;
  }
LABEL_12:
  -[MFMailComposeController composeRecipientViewDidFinishPickingRecipient:](self, "composeRecipientViewDidFinishPickingRecipient:", self->_lastFocusedRecipientView);
  -[MFMailComposeController _dismissPeoplePicker:](self, "_dismissPeoplePicker:", v18);

}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0D13690]);
  objc_msgSend(v6, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithContact:address:kind:", v9, v7, 0);

  -[MFMailComposeRecipientTextView addRecipient:](self->_lastFocusedRecipientView, "addRecipient:", v10);
  -[MFMailComposeController _dismissPeoplePicker:](self, "_dismissPeoplePicker:", v11);

}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MFSecureMIMECompositionManager *secureCompositionManager;
  void *v18;
  MFSecureMIMECompositionManager *v19;
  void *v20;
  void *v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C966A8]))
  {
    v9 = v8;
LABEL_13:

    goto LABEL_14;
  }
  -[CNComposeRecipientAtom recipient](self->_atomPresentingCard, "recipient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "contact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10
      || (objc_msgSend(v7, "contact"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v10, "isEqual:", v11),
          v11,
          (v12 & 1) == 0))
    {
      objc_msgSend(v9, "address");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(v7, "value");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setAddress:", v13);
      }
      else
      {
        objc_msgSend(v7, "contact");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setContact:", v13);
      }

      *((_BYTE *)self + 1352) |= 1u;
      objc_msgSend(v7, "key");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "highlightPropertyWithKey:identifier:", v14, v15);

      objc_msgSend(v9, "address");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v22, "isEqualToString:", v16) & 1) == 0)
      {
        secureCompositionManager = self->_secureCompositionManager;
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v22);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFSecureMIMECompositionManager removeRecipients:](secureCompositionManager, "removeRecipients:", v18);

        v19 = self->_secureCompositionManager;
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFSecureMIMECompositionManager addRecipients:](v19, "addRecipients:", v20);

      }
    }

    goto LABEL_13;
  }
LABEL_14:

  return 0;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  if (a4)
    -[MFMailComposeController _dismissPersonCard](self, "_dismissPersonCard", a3);
}

- (void)_dismissPersonCard
{
  int v3;
  id v4;
  id v5;
  id v6;
  id v7;

  -[MFMailComposeController setAtomPresentingCard:](self, "setAtomPresentingCard:", 0);
  -[MFMailComposeController setRecipientPresentingCard:](self, "setRecipientPresentingCard:", 0);
  -[MFMailComposeController traitCollection](self, "traitCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "mf_supportsPopoverPresentation");

  if (v3)
  {
    -[MFMailComposeController mailComposeView](self, "mailComposeView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelDelayedPopover");

    -[MFMailComposeController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    -[MFMailComposeController navigationController](self, "navigationController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);

  }
}

- (id)rotatingHeaderView
{
  return 0;
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v6;

  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "willRotateToInterfaceOrientation:duration:", a3, a4);

}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  id v4;

  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didRotateFromInterfaceOrientation:", a3);

}

- (void)_getRotationContentSettings:(id *)a3
{
  if ((objc_msgSend(MEMORY[0x1E0DC3708], "mf_isPad") & 1) == 0)
  {
    *(_WORD *)&a3->var0 = 257;
    a3->var2 = 1;
    a3->var5 = 1.0;
  }
}

- (id)_sheetDetentForIdentifier:(id)a3 viewController:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0DC3C78];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__MFMailComposeController__sheetDetentForIdentifier_viewController___block_invoke;
  v10[3] = &unk_1E5A67CD0;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "customDetentWithIdentifier:resolver:", a3, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

double __68__MFMailComposeController__sheetDetentForIdentifier_viewController___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "containerTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredHeightForTraitCollection:", v3);
  v5 = v4;

  return v5;
}

- (void)composeSubjectViewTextFieldDidResignFirstResponder:(id)a3
{
  if (self->_subjectField == a3)
    -[MFMailComposeController _updateNavigationBarTitleAnimated:](self, "_updateNavigationBarTitleAnimated:", 0);
}

- (void)composeSubjectViewTextFieldDidBecomeFirstResponder:(id)a3
{
  MFComposeSubjectView *v4;
  void *v5;
  MFComposeSubjectView *v6;

  v4 = (MFComposeSubjectView *)a3;
  if (self->_subjectField == v4)
  {
    v6 = v4;
    -[MFMailComposeController _dismissPresentedHalfSheet](self, "_dismissPresentedHalfSheet");
    -[MFMailComposeController mailComposeView](self, "mailComposeView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewDidBecomeFirstResponder:", v6);

    v4 = v6;
  }

}

- (void)composeHeaderViewDidChangeValue:(id)a3
{
  void *v4;
  id v5;

  if (self->_subjectField == a3)
  {
    -[MFMailComposeController _updateNavigationBarTitleAnimated:](self, "_updateNavigationBarTitleAnimated:", 0);
    -[MFMailComposeController composeCoordinator](self, "composeCoordinator");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[MFComposeSubjectView text](self->_subjectField, "text");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSubject:", v4);

  }
}

- (void)composeHeaderViewDidConfirmValue:(id)a3
{
  id v4;

  if (self->_subjectField == a3)
  {
    -[MFMailComposeController _updateNavigationBarTitleAnimated:](self, "_updateNavigationBarTitleAnimated:", 0);
    -[MFMailComposeController composeWebView](self, "composeWebView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "becomeFirstResponder");

  }
}

- (void)composeSubjectViewWillRemoveContent:(id)a3
{
  if (self->_subjectField == a3)
    +[MFComposeTypeFactory hijackThreadFromDelegate:](MFComposeTypeFactory, "hijackThreadFromDelegate:", self);
}

- (void)_showOriginalAttachmentsIfNecessary:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[_MFMailCompositionContext includeAttachmentsWhenAdding](self->_compositionContext, "includeAttachmentsWhenAdding")&& -[MFMailComposeController _shouldRestoreAttachments:](self, "_shouldRestoreAttachments:", v5))
  {
    -[MFMailComposeController composeWebView](self, "composeWebView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showOriginalAttachments");

  }
}

- (BOOL)_shouldRestoreAttachments:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;

  v4 = a3;
  if (-[MFMailComposeController composeType](self, "composeType") == 4
    || -[MFMailComposeController composeType](self, "composeType") == 5)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", self->_toAddresses, self->_bccAddresses, self->_ccAddresses, 0);
    objc_msgSend(v5, "ef_flatten");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ef_map:", &__block_literal_global_898);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "address");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "emailAddressValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
      objc_msgSend(v9, "stringValue");
    else
      objc_msgSend(v8, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v7, "containsObject:", v11) ^ 1;
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

id __53__MFMailComposeController__shouldRestoreAttachments___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "emailAddressValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    objc_msgSend(v3, "stringValue");
  else
    objc_msgSend(v2, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)composeRecipientView:(id)a3 didAddRecipient:(id)a4
{
  MFMailComposeToField *v6;
  id v7;
  MFSecureMIMECompositionManager *secureCompositionManager;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = (MFMailComposeToField *)a3;
  v7 = a4;
  secureCompositionManager = self->_secureCompositionManager;
  v9 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v7, "address");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFSecureMIMECompositionManager addRecipients:](secureCompositionManager, "addRecipients:", v11);

  if (self->_initializedRecipients)
    -[MFMailComposeController _showOriginalAttachmentsIfNecessary:](self, "_showOriginalAttachmentsIfNecessary:", v7);
  if (-[MFMailComposeController sourceAccountManagement](self, "sourceAccountManagement") != 2
    && -[_MFMailCompositionContext isUsingDefaultAccount](self->_compositionContext, "isUsingDefaultAccount")
    && self->_toField == v6)
  {
    -[CNComposeRecipientTextView recipients](v6, "recipients");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    v14 = objc_alloc(MEMORY[0x1E0D1E6B8]);
    objc_msgSend(v7, "preferredSendingAddress");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithString:", v15);
    objc_msgSend(v16, "simpleAddress");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 == 1 && v17)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6B8]), "initWithString:", self->_sendingEmailAddress);
      objc_msgSend(v18, "simpleAddress");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6B8]), "initWithString:", self->_originalSendingEmailAddress);
      objc_msgSend(v20, "simpleAddress");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v19, "compare:", v21);

      if (!v22 && objc_msgSend(v19, "compare:", v17))
      {
        -[MFMailComposeController sendingEmailAddress](self, "sendingEmailAddress");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[MFMailComposeController _setSendingEmailAddress:](self, "_setSendingEmailAddress:", v17))
        {
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6C8]), "initWithStyle:", 2);
          MFLogGeneral();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            v31 = v24;
            objc_msgSend(v24, "stringFromEmailAddressConvertible:", v23);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "stringFromEmailAddressConvertible:", v17);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v33 = v26;
            v34 = 2114;
            v35 = v27;
            _os_log_impl(&dword_1AB96A000, v25, OS_LOG_TYPE_INFO, "Setting to preferred sending account base on recipient from %{public}@ to %{public}@", buf, 0x16u);

            v24 = v31;
          }

          -[MFMailComposeController _updateAutoBccSendingAddress:withNewSendingAddress:alwaysAdd:](self, "_updateAutoBccSendingAddress:withNewSendingAddress:alwaysAdd:", v23, v17, 0);
          -[MFMailComposeController mailComposeView](self, "mailComposeView");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "multiField");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setAccountAutoselected:", 1);

        }
      }

    }
  }
  if (self->_toField == v6)
  {
    -[MFMailComposeController mailComposeView](self, "mailComposeView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "findCorecipientsWithRecipientView:", self->_toField);

  }
  -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");
  if (_os_feature_enabled_impl())
    -[MFMailComposeController _updateSMIMEStatusControl](self, "_updateSMIMEStatusControl");
  else
    -[MFMailComposeController _updateSMIMEButtonEnabledForRecipientCount](self, "_updateSMIMEButtonEnabledForRecipientCount");

}

- (void)composeRecipientView:(id)a3 didRemoveRecipient:(id)a4
{
  void *v6;
  MFSecureMIMECompositionManager *secureCompositionManager;
  void *v8;
  void *v9;
  MFMailComposeToField *v10;

  v10 = (MFMailComposeToField *)a3;
  objc_msgSend(a4, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[MFMailComposeController _anyRecipientViewContainsAddress:](self, "_anyRecipientViewContainsAddress:", v6))
  {
    secureCompositionManager = self->_secureCompositionManager;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFSecureMIMECompositionManager removeRecipients:](secureCompositionManager, "removeRecipients:", v8);

  }
  if (self->_toField == v10)
  {
    -[MFMailComposeController mailComposeView](self, "mailComposeView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "findCorecipientsWithRecipientView:", self->_toField);

  }
  if (_os_feature_enabled_impl())
    -[MFMailComposeController _updateSMIMEStatusControl](self, "_updateSMIMEStatusControl");
  else
    -[MFMailComposeController _updateSMIMEButtonEnabledForRecipientCount](self, "_updateSMIMEButtonEnabledForRecipientCount");
  -[MFMailComposeController _recipientTextChangedForHME](self, "_recipientTextChangedForHME");

}

- (void)composeRecipientView:(id)a3 didReplaceRecipients:(id)a4 withRecipients:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v21 = v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v27;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v14), "address");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v12);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v16 = v21;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v23;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v19), "address");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "containsObject:", v20) & 1) == 0
          && !-[MFMailComposeController _anyRecipientViewContainsAddress:](self, "_anyRecipientViewContainsAddress:", v20))
        {
          objc_msgSend(v10, "addObject:", v20);
        }

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v17);
  }

  -[MFSecureMIMECompositionManager removeRecipients:](self->_secureCompositionManager, "removeRecipients:", v10);
  -[MFSecureMIMECompositionManager addRecipients:](self->_secureCompositionManager, "addRecipients:", v9);
  if (_os_feature_enabled_impl())
    -[MFMailComposeController _updateSMIMEStatusControl](self, "_updateSMIMEStatusControl");
  else
    -[MFMailComposeController _updateSMIMEButtonEnabledForRecipientCount](self, "_updateSMIMEButtonEnabledForRecipientCount");
  -[MFMailComposeController _recipientTextChangedForHME](self, "_recipientTextChangedForHME");

}

- (void)composeRecipientView:(id)a3 didFinishEnteringAddress:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clearSearchForRecipientView:reflow:clear:", v8, 0, 1);
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v7, "didIgnoreSearchResults");
    objc_msgSend(v7, "setChangingRecipients:", 1);
    objc_msgSend(v8, "addAddress:", v6);
    objc_msgSend(v7, "setChangingRecipients:", 0);
  }

}

- (void)composeRecipientView:(id)a3 disambiguateRecipientForAtom:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recipient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "disambiguateRecipient:recipientView:", v8, v9);

}

- (void)composeRecipientView:(id)a3 didSelectRecipients:(id)a4
{
  id v4;

  -[MFMailComposeController mailComposeView](self, "mailComposeView", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissSearchResultsIfDisambiguating");

}

- (void)composeHeaderView:(id)a3 didChangeSize:(CGSize)a4
{
  double height;
  double width;
  void *v7;
  id v8;

  height = a4.height;
  width = a4.width;
  v8 = a3;
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutForChangedComposeHeaderView:size:", v8, width, height);

}

- (void)composeRecipientView:(id)a3 textDidChange:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isFirstResponder");
  if (objc_msgSend(v6, "length"))
    v10 = v9;
  else
    v10 = 0;
  if (v10 == 1 && (objc_msgSend(v7, "isShowingPeoplePicker") & 1) == 0)
    objc_msgSend(v7, "beginSearchForText:recipientView:", v6, v11);
  else
    objc_msgSend(v7, "clearSearchForActiveRecipientView");
  -[MFMailComposeController _draftContentDidChange](self, "_draftContentDidChange");
  -[MFMailComposeController _invalidateInputContextHistory](self, "_invalidateInputContextHistory");

}

- (void)composeRecipientViewRequestAddRecipient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C974B0]), "initWithNibName:bundle:", 0, 0);
  v34[0] = *MEMORY[0x1E0C966A8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDisplayedPropertyKeys:", v8);

  objc_msgSend(v7, "setDelegate:", self);
  objc_msgSend(v7, "setHidesPromptInLandscape:", 1);
  objc_msgSend(v7, "setAllowsEditing:", 0);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("emailAddresses.@count > 0"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicateForEnablingContact:", v9);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("emailAddresses.@count == 1"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicateForSelectionOfContact:", v10);

  if ((objc_msgSend(MEMORY[0x1E0DC3708], "mf_isPad") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SELECT_CONTACT"), &stru_1E5A6A588, CFSTR("Main"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPrompt:", v12);

  }
  if (!-[MFMailComposeController _allowsAutorotation](self, "_allowsAutorotation")
    || (-[MFMailComposeController navigationController](self, "navigationController"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "_allowsAutorotation"),
        v13,
        (v14 & 1) == 0))
  {
    objc_msgSend(v7, "_setAllowsAutorotation:", 0);
  }
  -[MFMailComposeController setPeoplePicker:](self, "setPeoplePicker:", v7);
  objc_msgSend(v5, "setShowingPeoplePicker:", 1);
  objc_msgSend(v4, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController composeRecipientView:didFinishEnteringAddress:](self, "composeRecipientView:didFinishEnteringAddress:", v4, v15);

  -[MFMailComposeController traitCollection](self, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "mf_supportsPopoverPresentation");

  if ((v17 & 1) != 0)
  {
    -[MFMailComposeController mailComposeView](self, "mailComposeView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "saveFirstResponderWithKeyboardPinning:", 1);

    if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
      v19 = 4;
    else
      v19 = 8;
    -[MFMailComposeController peoplePicker](self, "peoplePicker");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setModalPresentationStyle:", 7);

    -[MFMailComposeController peoplePicker](self, "peoplePicker");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "popoverPresentationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "setSourceView:", v6);
    objc_msgSend(v6, "bounds");
    objc_msgSend(v22, "setSourceRect:");
    objc_msgSend(v22, "setPermittedArrowDirections:", v19);
    objc_msgSend(v22, "setDelegate:", self);
  }
  else
  {
    objc_msgSend(v7, "presentationController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v7, "presentationController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setPrefersGrabberVisible:", 1);

    }
    -[MFMailComposeController mailComposeView](self, "mailComposeView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "saveFirstResponderWithKeyboardPinning:", 0);
  }

  if (MFIsMobileMail())
  {
    -[MFMailComposeController peoplePicker](self, "peoplePicker");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "_setContinuousCornerRadius:", 10.0);

    -[MFMailComposeController peoplePicker](self, "peoplePicker");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setClipsToBounds:", 1);

    -[MFMailComposeController peoplePicker](self, "peoplePicker");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setMaskedCorners:", 3);

  }
  -[MFMailComposeController peoplePicker](self, "peoplePicker");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v33, 1, 0);

}

- (void)composeRecipientViewDidFinishPickingRecipient:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  -[MFMailComposeController mailComposeView](self, "mailComposeView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowingPeoplePicker:", 0);

  -[MFMailComposeController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mf_supportsPopoverPresentation");

  if ((v6 & 1) == 0)
  {
    -[MFMailComposeController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
    -[MFMailComposeController setPeoplePicker:](self, "setPeoplePicker:", 0);
    UIKeyboardOrderInAutomatic();
  }
}

- (unint64_t)presentationOptionsForRecipient:(id)a3
{
  id v4;
  BOOL v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char HasSafeDomain;
  void *v14;
  void *v15;
  int v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;

  v4 = a3;
  v5 = -[MFMailComposeController _hasEncryptionIdentityError](self, "_hasEncryptionIdentityError");
  v6 = -[MFMailComposeController _defaultAtomPresentationOptions](self, "_defaultAtomPresentationOptions");
  objc_msgSend(v4, "address");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emailAddressValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "simpleAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v6;
  if (!v5)
  {
    -[MFMailComposeController certificatesByRecipient](self, "certificatesByRecipient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

LABEL_4:
      v6 = 128;
LABEL_5:
      v24 = v6;
      goto LABEL_6;
    }
    if (v9)
    {
      -[MFMailComposeController certificatesByRecipient](self, "certificatesByRecipient");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKey:", v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        goto LABEL_4;
    }
    else
    {

    }
    -[MFMailComposeController errorsByRecipient](self, "errorsByRecipient");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKey:", v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {

LABEL_19:
      v6 = 65;
      goto LABEL_5;
    }
    if (v9)
    {
      -[MFMailComposeController errorsByRecipient](self, "errorsByRecipient");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKey:", v9);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        goto LABEL_19;
    }
    else
    {

    }
  }
LABEL_6:
  objc_msgSend(v4, "address");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HasSafeDomain = MFAddressHasSafeDomain(v12);

  if ((HasSafeDomain & 1) == 0)
  {
    v6 |= 1uLL;
    v24 = v6;
  }
  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isInternal") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLForKey:", CFSTR("PresentationOptionsEncodedIntoAddress"));

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0D13618], "presentationOptions:encodedIntoAddress:", &v24, v9);
      v6 = v24;
    }
  }
  else
  {

  }
  return v6;
}

- (void)_setLastFocusedRecipientView:(id)a3
{
  MFMailComposeRecipientTextView *v5;
  MFMailComposeRecipientTextView **p_lastFocusedRecipientView;
  MFMailComposeRecipientTextView *lastFocusedRecipientView;
  void *v8;
  MFMailComposeRecipientTextView *v9;

  v5 = (MFMailComposeRecipientTextView *)a3;
  p_lastFocusedRecipientView = &self->_lastFocusedRecipientView;
  lastFocusedRecipientView = self->_lastFocusedRecipientView;
  v9 = v5;
  if (lastFocusedRecipientView != v5)
  {
    -[CNComposeRecipientTextView setExpanded:](lastFocusedRecipientView, "setExpanded:", 0);
    -[CNComposeRecipientTextView setShowsAddButtonWhenExpanded:](*p_lastFocusedRecipientView, "setShowsAddButtonWhenExpanded:", 0);
    -[CNComposeRecipientTextView setExpanded:](v9, "setExpanded:", 1);
    -[MFMailComposeController composeCoordinator](self, "composeCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeRecipientTextView setShowsAddButtonWhenExpanded:](v9, "setShowsAddButtonWhenExpanded:", v8 == 0);

    objc_storeStrong((id *)p_lastFocusedRecipientView, a3);
  }

}

- (void)recipientViewDidBecomeFirstResponder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFMailComposeController _setLastFocusedRecipientView:](self, "_setLastFocusedRecipientView:");
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRecipientFieldsEditable:animated:", 1, 1);

}

- (void)recipientViewDidResignFirstResponder:(id)a3
{
  void *v4;
  id v5;

  -[MFMailComposeController mailComposeView](self, "mailComposeView", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isShowingPeoplePicker") & 1) == 0)
  {
    -[MFMailComposeController mailComposeView](self, "mailComposeView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRecipientFieldsEditable:animated:", 0, 1);

  }
}

- (id)nextResponderForRecipientView:(id)a3
{
  -[MFMailComposeController view](self, "view", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)composeRecipientViewReturnPressed:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "focusFirstResponderAfterRecipientView:", v5);

}

- (void)composeRecipientViewDidBecomeFirstResponder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFMailComposeController _dismissPresentedHalfSheet](self, "_dismissPresentedHalfSheet");
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewDidBecomeFirstResponder:", v5);

}

- (void)composeRecipientView:(id)a3 showPersonCardForAtom:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "recipient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeController _contactViewControllerForRecipient:](self, "_contactViewControllerForRecipient:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "contentViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContactDelegate:", self);

    objc_msgSend(v8, "labeledValueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "highlightPropertyWithKey:identifier:", *MEMORY[0x1E0C966A8], v11);

    -[MFMailComposeController setContactViewController:](self, "setContactViewController:", v9);
    if (v9)
    {
      objc_msgSend(v20, "navTitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTitle:", v12);

      objc_msgSend(v9, "setHidesBottomBarWhenPushed:", 1);
      -[MFMailComposeController setAtomPresentingCard:](self, "setAtomPresentingCard:", v7);
      -[MFMailComposeController _updatePersonCard](self, "_updatePersonCard");
      -[MFMailComposeController traitCollection](self, "traitCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "mf_supportsPopoverPresentation");

      if (v14)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v9);
        objc_msgSend(v15, "setModalPresentationStyle:", 7);
        if (!-[MFMailComposeController _allowsAutorotation](self, "_allowsAutorotation")
          || (-[MFMailComposeController navigationController](self, "navigationController"),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v17 = objc_msgSend(v16, "_allowsAutorotation"),
              v16,
              (v17 & 1) == 0))
        {
          objc_msgSend(v15, "_setAllowsAutorotation:", 0);
        }
        objc_msgSend(v15, "popoverPresentationController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setSourceView:", v7);
        -[MFMailComposeController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);

      }
      else
      {
        -[MFMailComposeController mailComposeView](self, "mailComposeView");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "saveFirstResponderWithKeyboardPinning:", 0);

        -[MFMailComposeController navigationController](self, "navigationController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "pushViewController:animated:", v9, 1);
      }

    }
  }

}

- (void)_removeRecent
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[MFMailComposeController recipientPresentingCard](self, "recipientPresentingCard");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[MFMailComposeController mailComposeView](self, "mailComposeView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "searchController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeRecipient:", v6);

    -[MFMailComposeController mailComposeView](self, "mailComposeView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidateSearchResultRecipient:", v6);

    -[MFMailComposeController _dismissPersonCard](self, "_dismissPersonCard");
  }

}

- (id)_contactViewControllerForRecipient:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "displayString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ec_personNameComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0C97200];
    objc_msgSend(v4, "uncommentedAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "em_contactWithPersonNameComponents:emailAddress:emailAddressLabel:allowInvalidEmailAddress:", v7, v9, 0, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v5, "isUnknown"))
    objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForUnknownContact:", v5);
  else
    objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForContact:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97298], "storeWithOptions:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContactStore:", v11);

  objc_msgSend(v10, "setDelegate:", self);
  return v10;
}

- (void)_showPersonCardForRecipient:(id)a3 showDeleteButton:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a4;
  v15 = a3;
  -[MFMailComposeController _contactViewControllerForRecipient:](self, "_contactViewControllerForRecipient:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSuggested");

  if (((!v4 | v8) & 1) == 0)
  {
    objc_msgSend(v6, "contentViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("REMOVE_RECENT"), &stru_1E5A6A588, CFSTR("Main"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cardFooterGroup");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addActionWithTitle:target:selector:inGroup:destructive:", v11, self, sel__removeRecent, v12, 1);

  }
  -[MFMailComposeController setContactViewController:](self, "setContactViewController:", v6);
  -[MFMailComposeController setRecipientPresentingCard:](self, "setRecipientPresentingCard:", v15);
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "saveFirstResponderWithKeyboardPinning:", 0);

  -[MFMailComposeController navigationControllerForRecentPersonCard](self, "navigationControllerForRecentPersonCard");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pushViewController:animated:", v6, 1);

}

- (void)composeRecipientView:(id)a3 showPersonCardForRecipient:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a4;
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "saveFirstResponderWithKeyboardPinning:", 0);

  if (objc_msgSend(v8, "isGroup"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D13630]);
    objc_msgSend(v6, "setGroup:", v8);
    objc_msgSend(v6, "setDelegate:", self);
    -[MFMailComposeController navigationControllerForRecentPersonCard](self, "navigationControllerForRecentPersonCard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", v6, 1);

    -[MFMailComposeController setRecipientPresentingCard:](self, "setRecipientPresentingCard:", v8);
  }
  else
  {
    -[MFMailComposeController _showPersonCardForRecipient:showDeleteButton:](self, "_showPersonCardForRecipient:showDeleteButton:", v8, objc_msgSend(v8, "isRemovableFromSearchResults"));
  }

}

- (BOOL)isShowingRecentPersonCard
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[MFMailComposeController navigationControllerForRecentPersonCard](self, "navigationControllerForRecentPersonCard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  objc_msgSend(v2, "viewControllers", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
        }
        v7 = 1;
        goto LABEL_13;
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      v7 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
  }
LABEL_13:

  return v7;
}

- (id)navigationControllerForRecentPersonCard
{
  void *v3;
  int v4;
  void *v5;
  char isKindOfClass;
  void *v7;

  -[MFMailComposeController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mf_supportsPopoverPresentation");

  if (v4)
  {
    -[MFMailComposeController presentedViewController](self, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[MFMailComposeController presentedViewController](self, "presentedViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    -[MFMailComposeController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)composeRecipientView:(id)a3 composeRecipientForAddress:(id)a4
{
  id v4;
  void *v5;

  v4 = a4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13690]), "initWithContact:address:kind:", 0, v4, 0);

  return v5;
}

- (id)composeRecipientView:(id)a3 composeRecipientForContact:(id)a4
{
  id v4;
  void *v5;

  v4 = a4;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D13690]), "initWithContact:address:kind:", v4, 0, 0);

  return v5;
}

- (BOOL)composeRecipientViewShowingSearchResults:(id)a3
{
  void *v3;
  char v4;

  -[MFMailComposeController mailComposeView](self, "mailComposeView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSearching");

  return v4;
}

- (BOOL)presentSearchResultsForComposeRecipientView:(id)a3
{
  void *v3;
  char v4;

  -[MFMailComposeController mailComposeView](self, "mailComposeView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "presentSearchResults");

  return v4;
}

- (void)dismissSearchResultsForComposeRecipientView:(id)a3
{
  id v3;

  -[MFMailComposeController mailComposeView](self, "mailComposeView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissSearchResults");

}

- (void)selectNextSearchResultForComposeRecipientView:(id)a3
{
  id v3;

  -[MFMailComposeController mailComposeView](self, "mailComposeView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectNextSearchResult");

}

- (void)selectPreviousSearchResultForComposeRecipientView:(id)a3
{
  id v3;

  -[MFMailComposeController mailComposeView](self, "mailComposeView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectPreviousSearchResult");

}

- (BOOL)chooseSelectedSearchResultForComposeRecipientView:(id)a3
{
  void *v3;
  char v4;

  -[MFMailComposeController mailComposeView](self, "mailComposeView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "chooseSelectedSearchResult");

  return v4;
}

- (void)contactViewController:(id)a3 didDeleteContact:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[MFMailComposeController mailComposeView](self, "mailComposeView", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "searchViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v8);
      v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
      objc_msgSend(v12, "contact");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqual:", v5);

      if ((v14 & 1) != 0)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v15 = v12;

    if (!v15)
      goto LABEL_13;
    -[MFMailComposeController mailComposeView](self, "mailComposeView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "invalidateSearchResultRecipient:", v15);

  }
  else
  {
LABEL_9:
    v15 = v8;
  }

LABEL_13:
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContact:(id)a4 propertyKey:(id)a5 propertyIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  MFSecureMIMECompositionManager *secureCompositionManager;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  MFSecureMIMECompositionManager *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  _QWORD v29[4];
  id v30;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[MFMailComposeController atomPresentingCard](self, "atomPresentingCard");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "recipient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0C966A8]))
  {
    objc_msgSend(v13, "labeledValueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v11, "isEqualToString:", v14);

    if ((v15 & 1) == 0)
    {
      objc_msgSend(v9, "emailAddresses");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __117__MFMailComposeController_contactViewController_shouldPerformDefaultActionForContact_propertyKey_propertyIdentifier___block_invoke;
      v29[3] = &unk_1E5A68710;
      v30 = v11;
      objc_msgSend(v16, "ef_firstObjectPassingTest:", v29);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      secureCompositionManager = self->_secureCompositionManager;
      v18 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v13, "address");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setWithObject:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setWithObject:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFSecureMIMECompositionManager removeRecipients:](secureCompositionManager, "removeRecipients:", v21);

      objc_msgSend(v28, "value");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAddress:", v22);

      v23 = self->_secureCompositionManager;
      v24 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v13, "address");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setWithObject:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFSecureMIMECompositionManager addRecipients:](v23, "addRecipients:", v26);

      -[MFMailComposeController _resetSecureCompositionManager](self, "_resetSecureCompositionManager");
      if (v9)
        -[MFMailComposeController _dismissPersonCard](self, "_dismissPersonCard");

    }
  }

  return 1;
}

uint64_t __117__MFMailComposeController_contactViewController_shouldPerformDefaultActionForContact_propertyKey_propertyIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)autocompleteGroupDetailViewController:(id)a3 didAskToRemoveGroup:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeRecipient:", v8);

  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidateSearchResultRecipient:", v8);

}

- (void)autocompleteGroupDetailViewController:(id)a3 didTapComposeRecipient:(id)a4
{
  -[MFMailComposeController _showPersonCardForRecipient:showDeleteButton:](self, "_showPersonCardForRecipient:showDeleteButton:", a4, 0);
}

- (void)autocompleteGroupDetailViewControllerDidCancel:(id)a3
{
  char v4;
  id v5;
  id v6;

  -[MFMailComposeController traitCollection](self, "traitCollection", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "mf_supportsPopoverPresentation");

  if ((v4 & 1) == 0)
  {
    -[MFMailComposeController mailComposeView](self, "mailComposeView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "restoreFirstResponderWithKeyboardPinning:", 1);

  }
}

- (void)_presentModalAlert:(id)a3
{
  id v4;

  v4 = a3;
  -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");
  -[MFMailComposeController _dismissPresentedViewController](self, "_dismissPresentedViewController");
  -[MFMailComposeController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)_finishModalAlertClosingComposition:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *sendingEmailAddress;
  void *v9;
  id v10;

  v3 = a3;
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSending:", 0);
  -[MFMailComposeController quickReplyDelegate](self, "quickReplyDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mailComposeController:isSending:", self, 0);

  -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");
  -[MFMailComposeController hideMyEmailAddressIfExists](self, "hideMyEmailAddressIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MFMailComposeController hideMyEmailAddressIfExists](self, "hideMyEmailAddressIfExists");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    sendingEmailAddress = self->_sendingEmailAddress;
    self->_sendingEmailAddress = v7;

  }
  if (v3)
  {
    if (self->_composeWebViewFlags.respondsToCompositionWillFinish)
    {
      -[MFMailComposeController composeWebView](self, "composeWebView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "compositionWillFinish");

    }
    if (self->_resolution == 2)
    {
      -[MFMailComposeController setHeadersForDraft](self, "setHeadersForDraft");
      -[MFMailComposeController _setUpDraftForHME](self, "_setUpDraftForHME");
    }
    -[MFMailComposeController close](self, "close");
  }
  else
  {
    objc_msgSend(v10, "restoreFirstResponder");
  }

}

- (void)_displayPopoverAlert:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[MFMailComposeController setPopoverAlert:](self, "setPopoverAlert:");
  objc_msgSend(v6, "setModalPresentationStyle:", 7);
  objc_msgSend(v6, "popoverPresentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setBarButtonItem:", self->_closeButtonItem);
  objc_msgSend(v4, "setPermittedArrowDirections:", 3);
  -[MFMailComposeController _dismissPresentedViewController](self, "_dismissPresentedViewController");
  -[MFMailComposeController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeyboardVisible:animate:", 0, 1);
  -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");

}

- (void)finishPopoverAlertClosingComposition:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[MFMailComposeController setPopoverAlert:](self, "setPopoverAlert:", 0);
  -[MFMailComposeController _finishModalAlertClosingComposition:](self, "_finishModalAlertClosingComposition:", v3);
}

- (void)popoverPresentationController:(id)a3 willRepositionPopoverToRect:(CGRect *)a4 inView:(id *)a5
{
  MFPhotoPickerController *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  MFPhotoPickerController *v13;

  objc_msgSend(a3, "presentedViewController");
  v8 = (MFPhotoPickerController *)objc_claimAutoreleasedReturnValue();
  if (v8 == self->_photosPickerController)
  {
    v13 = v8;
    *a5 = objc_retainAutorelease(self->_composeWebView);
    -[MFMailComposeController _optimalRectForPresentingPopoverInComposeWebView](self, "_optimalRectForPresentingPopoverInComposeWebView");
    a4->origin.x = v9;
    a4->origin.y = v10;
    a4->size.width = v11;
    a4->size.height = v12;
    v8 = v13;
  }

}

- (void)_resetSecureCompositionManager
{
  -[MFMailComposeController _resetSecureCompositionManagerUsingNewAccount:](self, "_resetSecureCompositionManagerUsingNewAccount:", 0);
}

- (void)_resetSecureCompositionManagerUsingNewAccount:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t encryptionOverrideSetting;
  MFSecureMIMECompositionManager *secureCompositionManager;
  void *v12;
  void *v13;
  char v14;
  MFSecureMIMECompositionManager *v15;
  MFSecureMIMECompositionManager *v16;
  void *v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  MFMailComposeController *v30;
  id obj;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v3 = a3;
  v43 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6B8]), "initWithString:", self->_sendingEmailAddress);
  objc_msgSend(v5, "simpleAddress");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFMailComposeController accountProxyGenerator](self, "accountProxyGenerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = self;
  objc_msgSend(v6, "accountProxyContainingEmailAddress:includingInactive:originatingBundleID:sourceAccountManagement:", v29, 0, self->_originatingBundleID, self->_sourceAccountManagement);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mailAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v8;
  if (v8)
  {
    v9 = objc_msgSend(v8, "secureCompositionSigningPolicyForAddress:", v29);
    if (v3 && self->_originalMessageWasEncrypted && self->_encryptionOverrideSetting)
    {
      encryptionOverrideSetting = 1;
    }
    else if (objc_msgSend(v8, "perMessageEncryptionEnabledForAddress:", v29, v8))
    {
      if (v3)
      {
        encryptionOverrideSetting = objc_msgSend(v28, "secureCompositionEncryptionPolicyForAddress:", v29);
        self->_encryptionOverrideSetting = encryptionOverrideSetting != 0;
      }
      else
      {
        encryptionOverrideSetting = self->_encryptionOverrideSetting;
      }
    }
    else
    {
      encryptionOverrideSetting = objc_msgSend(v28, "secureCompositionEncryptionPolicyForAddress:", v29);
    }
  }
  else
  {
    v9 = 0;
    encryptionOverrideSetting = 0;
  }
  secureCompositionManager = self->_secureCompositionManager;
  if (secureCompositionManager)
  {
    -[MFSecureMIMECompositionManager sendingAccount](secureCompositionManager, "sendingAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 == v28
      && -[MFSecureMIMECompositionManager signingPolicy](self->_secureCompositionManager, "signingPolicy") == v9
      && -[MFSecureMIMECompositionManager encryptionPolicy](self->_secureCompositionManager, "encryptionPolicy") == encryptionOverrideSetting)
    {
      -[MFSecureMIMECompositionManager sendingAddress](self->_secureCompositionManager, "sendingAddress");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", v29);

      if ((v14 & 1) != 0)
        goto LABEL_37;
    }
    else
    {

    }
  }
  -[MFSecureMIMECompositionManager invalidate](self->_secureCompositionManager, "invalidate", v28);
  v15 = (MFSecureMIMECompositionManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4D5F8]), "initWithSendingAccount:signingPolicy:encryptionPolicy:", v28, v9, encryptionOverrideSetting);
  v16 = self->_secureCompositionManager;
  self->_secureCompositionManager = v15;

  -[MFSecureMIMECompositionManager setDelegate:](self->_secureCompositionManager, "setDelegate:", self);
  -[MFMailComposeController setCertificatesByRecipient:](self, "setCertificatesByRecipient:", 0);
  -[MFMailComposeController setErrorsByRecipient:](self, "setErrorsByRecipient:", 0);
  -[MFMailComposeController setAddressForMissingIdentity:](self, "setAddressForMissingIdentity:", 0);
  self->_signingIdentityStatus = v9 != 0;
  self->_encryptionIdentityStatus = encryptionOverrideSetting != 0;
  self->_encryptionStatusIsKnown = encryptionOverrideSetting == 0;
  -[MFSecureMIMECompositionManager setSendingAddress:](self->_secureCompositionManager, "setSendingAddress:", v29);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[MFMailComposeController _allRecipientViews](self, "_allRecipientViews");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v18)
  {
    v32 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v38 != v32)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        objc_msgSend(v20, "recipients");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v22)
        {
          v23 = *(_QWORD *)v34;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v34 != v23)
                objc_enumerationMutation(v21);
              objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "address");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "emailAddressValue");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "simpleAddress");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "ef_addOptionalObject:", v27);

            }
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          }
          while (v22);
        }

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v18);
  }

  -[MFSecureMIMECompositionManager addRecipients:](v30->_secureCompositionManager, "addRecipients:", v17);
  if (_os_feature_enabled_impl())
  {
    -[MFMailComposeController _updateSMIMEStatusControl](v30, "_updateSMIMEStatusControl");
  }
  else
  {
    -[MFMailComposeController _updateSMIMEButtonEnabledForRecipientCount](v30, "_updateSMIMEButtonEnabledForRecipientCount");
    -[MFMailComposeController _updateSMIMEButtonForEncryptionStatus:](v30, "_updateSMIMEButtonForEncryptionStatus:", -[MFSecureMIMECompositionManager encryptionStatus](v30->_secureCompositionManager, "encryptionStatus"));
  }
  -[MFMailComposeController _updateTitleBarForEncryptionStatus:](v30, "_updateTitleBarForEncryptionStatus:", -[MFSecureMIMECompositionManager encryptionStatus](v30->_secureCompositionManager, "encryptionStatus"));
  -[MFMailComposeController _updateSendAndCloseEnabled](v30, "_updateSendAndCloseEnabled");
  -[MFMailComposeController _updateRecipientAtomStyles](v30, "_updateRecipientAtomStyles");
  -[MFMailComposeController _updatePersonCard](v30, "_updatePersonCard");

LABEL_37:
}

- (BOOL)_secureCompositionManagerHasRecipients
{
  void *v2;
  BOOL v3;

  -[MFSecureMIMECompositionManager recipients](self->_secureCompositionManager, "recipients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)_updateRecipientAtomStyles
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[MFMailComposeController _allRecipientViews](self, "_allRecipientViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "invalidateAtomPresentationOptions");
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)_updateSMIMEButtonForEncryptionStatus:(int64_t)a3
{
  _BOOL8 v5;
  MFMailComposeToField *v6;

  v6 = self->_toField;
  if (-[MFMailComposeController _wantsEncryption](self, "_wantsEncryption"))
    v5 = -[MFMailComposeController _secureCompositionManagerHasRecipients](self, "_secureCompositionManagerHasRecipients");
  else
    v5 = 0;
  -[MFMailComposeToField setWantsEncryption:canEncrypt:animated:](v6, "setWantsEncryption:canEncrypt:animated:", v5, a3 != 2, 1);

}

- (void)_updateTitleBarForEncryptionStatus:(int64_t)a3
{
  _BOOL4 v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  if (-[MFMailComposeController _wantsEncryption](self, "_wantsEncryption"))
    v5 = -[MFMailComposeController _secureCompositionManagerHasRecipients](self, "_secureCompositionManagerHasRecipients");
  else
    v5 = 0;
  v6 = -[MFMailComposeController _wantsSigning](self, "_wantsSigning");
  v7 = -[MFSecureMIMECompositionManager signingStatus](self->_secureCompositionManager, "signingStatus");
  if (!v5)
  {
    if (v6 && (v7 == 2 || !v7))
      goto LABEL_22;
    goto LABEL_17;
  }
  if (!a3)
  {
    _EFLocalizedString();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 && !-[MFMailComposeController _hasSigningIdentityError](self, "_hasSigningIdentityError"))
    {
      v8 = (uint64_t)v10;
    }
    else
    {
      _EFLocalizedString();
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = v9;
    }
    goto LABEL_23;
  }
  if (a3 != 1)
  {
    if (a3 == 2)
      goto LABEL_22;
LABEL_17:
    v8 = 0;
    goto LABEL_23;
  }
  if (-[MFMailComposeController _hasEncryptionIdentityError](self, "_hasEncryptionIdentityError"))
    goto LABEL_17;
  -[MFMailComposeController _hasRecipients](self, "_hasRecipients");
LABEL_22:
  _EFLocalizedString();
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_23:
  v11 = (id)v8;
  -[MFMailComposeController _setTitleBarSubtitleText:style:](self, "_setTitleBarSubtitleText:style:");
  if (_os_feature_enabled_impl())
    -[MFMailComposeController _updateSMIMEStatusControl](self, "_updateSMIMEStatusControl");

}

- (void)setOriginalMessageWasEncrypted:(BOOL)a3
{
  self->_originalMessageWasEncrypted = a3;
  if (!self->_encryptionOverrideSetting && a3)
    self->_encryptionOverrideSetting = a3;
  -[MFMailComposeController _resetSecureCompositionManager](self, "_resetSecureCompositionManager");
}

- (unint64_t)_defaultAtomPresentationOptions
{
  if (-[MFMailComposeController _wantsEncryption](self, "_wantsEncryption")
    && !-[MFMailComposeController _hasEncryptionIdentityError](self, "_hasEncryptionIdentityError"))
  {
    return 4;
  }
  else
  {
    return 0;
  }
}

- (void)_updatePersonCard
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  MFSecureMIMEPersonHeaderView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  MFSecureMIMEPersonHeaderView *v22;
  void *v23;
  id v24;

  -[MFMailComposeController contactViewController](self, "contactViewController");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[MFSecureMIMECompositionManager encryptionPolicy](self->_secureCompositionManager, "encryptionPolicy");
  -[CNComposeRecipientAtom recipient](self->_atomPresentingCard, "recipient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !-[MFMailComposeController _hasEncryptionIdentityError](self, "_hasEncryptionIdentityError") && v24 && v4)
  {
    objc_msgSend(v4, "address");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6B8]), "initWithString:", v5);
    objc_msgSend(v6, "simpleAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    -[MFMailComposeController certificatesByRecipient](self, "certificatesByRecipient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v8);
    v10 = objc_claimAutoreleasedReturnValue();

    -[MFMailComposeController errorsByRecipient](self, "errorsByRecipient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v8);
    v12 = objc_claimAutoreleasedReturnValue();

    if (v10 | v12)
    {
      if (v12)
      {
        MFLookupLocalizedString();
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v12, "localizedDescription");
        v14 = 0;
        v15 = (void *)v13;
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else if (v10)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("ENCRYPTED"), &stru_1E5A6A588, CFSTR("Main"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("ENCRYPTION_EXPLANATION_FORMAT"), &stru_1E5A6A588, CFSTR("Main"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v20, v5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = 0;
      }
      else
      {
        v14 = 0;
        v15 = 0;
        v16 = 0;
      }
      objc_msgSend(v24, "contentViewController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "personHeaderView");
      v17 = (MFSecureMIMEPersonHeaderView *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        v22 = [MFSecureMIMEPersonHeaderView alloc];
        v17 = -[MFSecureMIMEPersonHeaderView initWithFrame:](v22, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      }
      -[MFSecureMIMEPersonHeaderView setSecureLabelText:](v17, "setSecureLabelText:", v14);
      -[MFSecureMIMEPersonHeaderView setWarningLabelText:](v17, "setWarningLabelText:", v15);
      -[MFSecureMIMEPersonHeaderView setExplanationText:](v17, "setExplanationText:", v16);

    }
    else
    {
      v17 = 0;
    }

    goto LABEL_18;
  }
  if (v24)
  {
    v17 = 0;
LABEL_18:
    objc_msgSend(v24, "contentViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setPersonHeaderView:", v17);

  }
}

- (void)_updateIdentityStatus:(int64_t *)a3 withPolicy:(int64_t)a4 identity:(__SecIdentity *)a5 error:(id)a6
{
  int64_t v11;
  int64_t v12;
  void *v13;
  id v14;

  v14 = a6;
  if (&self->_signingIdentityStatus == a3 || &self->_encryptionIdentityStatus == a3)
  {
    if (!a4)
      goto LABEL_10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailComposeController.m"), 7180, CFSTR("status pointer must be valid"));

    if (!a4)
      goto LABEL_10;
  }
  v11 = *a3;
  if (a5)
  {
    v12 = 0;
  }
  else
  {
    if (!v14)
      goto LABEL_10;
    v12 = 2;
  }
  *a3 = v12;
  if (v11 != v12)
  {
    -[MFMailComposeController _showMissingIdentityAlert](self, "_showMissingIdentityAlert");
    -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");
  }
LABEL_10:

}

- (id)_missingIdentityErrorWithFormat:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6B8]), "initWithString:", self->_sendingEmailAddress);
  objc_msgSend(v8, "simpleAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4D550], "errorWithDomain:code:localizedDescription:title:userInfo:", *MEMORY[0x1E0D4D4B8], 1052, v10, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setShortDescription:", v7);

  return v11;
}

- (void)_showMissingIdentityAlert
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, v3, (uint64_t)v3, "#SMIMEErrors _showMissingIdentityAlert: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

void __52__MFMailComposeController__showMissingIdentityAlert__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_updateSendAndCloseEnabled");
  objc_msgSend(MEMORY[0x1E0D4D620], "accountContainingEmailAddress:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[MFPreferencesURL advancedAccountInfoURLForAccount:](MFPreferencesURL, "advancedAccountInfoURLForAccount:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openSensitiveURL:withOptions:", v2, 0);

}

uint64_t __52__MFMailComposeController__showMissingIdentityAlert__block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "mailComposeView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "restoreFirstResponder");

  return objc_msgSend(*(id *)(a1 + 32), "_updateSendAndCloseEnabled");
}

- (void)secureMIMECompositionManager:(id)a3 signingStatusDidChange:(int64_t)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  MFMailComposeController *v13;
  id v14;

  v7 = a3;
  v8 = a5;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__MFMailComposeController_secureMIMECompositionManager_signingStatusDidChange_context___block_invoke;
  block[3] = &unk_1E5A65BD8;
  v12 = v7;
  v13 = self;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __87__MFMailComposeController_secureMIMECompositionManager_signingStatusDidChange_context___block_invoke(id *a1)
{
  id v2;

  if (a1[4] == *((id *)a1[5] + 160))
  {
    objc_msgSend(a1[6], "objectForKey:", *MEMORY[0x1E0D4D4D8]);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "_updateIdentityStatus:withPolicy:identity:error:", (char *)a1[5] + 1312, objc_msgSend(a1[4], "signingPolicy"), objc_msgSend(a1[6], "objectForKey:", *MEMORY[0x1E0D4D4E0]), v2);
    objc_msgSend(a1[5], "_updateTitleBarForEncryptionStatus:", objc_msgSend(a1[4], "encryptionStatus"));

  }
}

- (void)secureMIMECompositionManager:(id)a3 encryptionStatusDidChange:(int64_t)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  MFMailComposeController *v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __90__MFMailComposeController_secureMIMECompositionManager_encryptionStatusDidChange_context___block_invoke;
  v12[3] = &unk_1E5A68738;
  v13 = v8;
  v14 = self;
  v15 = v9;
  v16 = a4;
  v10 = v9;
  v11 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __90__MFMailComposeController_secureMIMECompositionManager_encryptionStatusDidChange_context___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _BYTE *v6;
  int v7;
  void *v8;
  id v9;

  if (*(_QWORD *)(a1 + 32) != *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1280))
    return;
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0D4D4C8]);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0D4D4D0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0D4D4E0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *MEMORY[0x1E0D4D4D8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_updateIdentityStatus:withPolicy:identity:error:", *(_QWORD *)(a1 + 40) + 1320, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1280), "encryptionPolicy"), v3, v4);
  v5 = *(_QWORD *)(a1 + 56);
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1328) = v5 != 1;
  v6 = *(_BYTE **)(a1 + 40);
  if (v6[1328])
  {
    objc_msgSend(v6, "setCertificatesByRecipient:", v9);
    objc_msgSend(*(id *)(a1 + 40), "setErrorsByRecipient:", v2);
    v6 = *(_BYTE **)(a1 + 40);
LABEL_6:
    objc_msgSend(v6, "_updateRecipientAtomStyles");
    goto LABEL_7;
  }
  if (v5 == 2 && v4)
    goto LABEL_6;
LABEL_7:
  v7 = _os_feature_enabled_impl();
  v8 = *(void **)(a1 + 40);
  if (v7)
    objc_msgSend(v8, "_updateSMIMEStatusControl");
  else
    objc_msgSend(v8, "_updateSMIMEButtonForEncryptionStatus:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "_updateTitleBarForEncryptionStatus:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "_updateSendAndCloseEnabled");
  objc_msgSend(*(id *)(a1 + 40), "_updatePersonCard");

}

- (BOOL)_wantsEncryption
{
  return -[MFSecureMIMECompositionManager encryptionPolicy](self->_secureCompositionManager, "encryptionPolicy") != 0;
}

- (BOOL)_hasEncryptionIdentityError
{
  return self->_encryptionIdentityStatus == 2;
}

- (BOOL)_wantsSigning
{
  return -[MFSecureMIMECompositionManager signingPolicy](self->_secureCompositionManager, "signingPolicy") != 0;
}

- (BOOL)_hasSigningIdentityError
{
  return -[MFSecureMIMECompositionManager signingStatus](self->_secureCompositionManager, "signingStatus") == 2;
}

- (MFSMIMEControl)smimeStatusControl
{
  void *v3;
  char v4;
  MFSMIMEControl *smimeStatusControl;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  MFSMIMEControl *v11;
  MFSMIMEControl *v12;
  MFSMIMEControl *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  if (!_os_feature_enabled_impl())
    return (MFSMIMEControl *)0;
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isQuickReply");

  if ((v4 & 1) != 0)
    return (MFSMIMEControl *)0;
  smimeStatusControl = self->_smimeStatusControl;
  if (!smimeStatusControl)
  {
    -[MFMailComposeController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "titleView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[MFMailComposeController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = v10;
    if ((objc_msgSend(v8, "isDescendantOfView:", v10) & 1) == 0)
    {

      return (MFSMIMEControl *)0;
    }
    v11 = [MFSMIMEControl alloc];
    v12 = -[MFSMIMEControl initWithFrame:](v11, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v13 = self->_smimeStatusControl;
    self->_smimeStatusControl = v12;

    -[MFSMIMEControl setOpaque:](self->_smimeStatusControl, "setOpaque:", 1);
    -[MFSMIMEControl setDelegate:](self->_smimeStatusControl, "setDelegate:", self);
    -[MFSMIMEControl setTranslatesAutoresizingMaskIntoConstraints:](self->_smimeStatusControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MFSMIMEControl setContextMenuInteractionEnabled:](self->_smimeStatusControl, "setContextMenuInteractionEnabled:", 0);
    -[MFSMIMEControl setShowsMenuAsPrimaryAction:](self->_smimeStatusControl, "setShowsMenuAsPrimaryAction:", 1);
    objc_msgSend(v10, "addSubview:", self->_smimeStatusControl);
    v14 = (void *)MEMORY[0x1E0CB3718];
    -[MFSMIMEControl topAnchor](self->_smimeStatusControl, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v23;
    -[MFSMIMEControl leadingAnchor](self->_smimeStatusControl, "leadingAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leadingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", 80.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v21;
    -[MFSMIMEControl bottomAnchor](self->_smimeStatusControl, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v16;
    -[MFSMIMEControl trailingAnchor](self->_smimeStatusControl, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v18, -80.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activateConstraints:", v20);

    smimeStatusControl = self->_smimeStatusControl;
  }
  return smimeStatusControl;
}

- (void)_updateSMIMEStatusControl
{
  _BOOL8 v3;
  id v4;

  v3 = -[MFMailComposeController _shouldEnableSMIMEMenu](self, "_shouldEnableSMIMEMenu");
  -[MFMailComposeController smimeStatusControl](self, "smimeStatusControl");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContextMenuInteractionEnabled:", v3);

}

- (BOOL)_shouldEnableSMIMEMenu
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6B8]), "initWithString:", self->_sendingEmailAddress);
  objc_msgSend(v3, "simpleAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFMailComposeController accountProxyGenerator](self, "accountProxyGenerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountProxyContainingEmailAddress:includingInactive:originatingBundleID:sourceAccountManagement:", v4, 0, self->_originatingBundleID, self->_sourceAccountManagement);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mailAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v7, "perMessageEncryptionEnabledForAddress:", v4);
  return (char)v5;
}

- (void)toggleEncryptionForControl:(id)a3
{
  self->_encryptionOverrideSetting ^= 1u;
  -[MFMailComposeController _resetSecureCompositionManager](self, "_resetSecureCompositionManager", a3);
}

- (void)goToSettingsForControl:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D4D620], "accountContainingEmailAddress:", self->_sendingEmailAddress);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[MFPreferencesURL advancedAccountInfoURLForAccount:](MFPreferencesURL, "advancedAccountInfoURLForAccount:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

}

- (id)sendingAddressForControl:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E6B8]), "initWithString:", self->_sendingEmailAddress);
  objc_msgSend(v3, "simpleAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)smimeStatusOptionsForControl:(id)a3
{
  uint64_t v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  _BOOL4 v10;
  unint64_t v11;

  if (!-[MFMailComposeController _shouldEnableSMIMEMenu](self, "_shouldEnableSMIMEMenu", a3))
    return 1;
  if (-[MFMailComposeController _wantsEncryption](self, "_wantsEncryption"))
  {
    if (-[MFMailComposeController _secureCompositionManagerHasRecipients](self, "_secureCompositionManagerHasRecipients"))
    {
      v4 = 3;
    }
    else
    {
      v4 = 1;
    }
  }
  else
  {
    v4 = 1;
  }
  if (-[MFSecureMIMECompositionManager encryptionStatus](self->_secureCompositionManager, "encryptionStatus") == 2)
  {
    -[MFMailComposeController errorsByRecipient](self, "errorsByRecipient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    v8 = 12;
    if (!v7)
      v8 = 4;
    v4 |= v8;
  }
  v9 = -[MFMailComposeController _wantsSigning](self, "_wantsSigning");
  v10 = -[MFMailComposeController _hasSigningIdentityError](self, "_hasSigningIdentityError");
  v11 = v4 | 0x10;
  if (!v9)
    v11 = v4;
  if (v10)
    return v11 | 0x20;
  else
    return v11;
}

- (void)_createAndAddHandoffProgressViewIfNecessary
{
  UIProgressView *v3;
  UIProgressView *handoffProgressView;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;

  if (!self->_handoffProgressView)
  {
    v3 = (UIProgressView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B98]), "initWithProgressViewStyle:", 1);
    handoffProgressView = self->_handoffProgressView;
    self->_handoffProgressView = v3;

    -[MFMailComposeController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v8 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);

    -[UIProgressView setBounds:](self->_handoffProgressView, "setBounds:", v8, v9, v7, 2.5);
    -[MFMailComposeController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "navigationBar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12 + -1.25;

    -[UIProgressView setCenter:](self->_handoffProgressView, "setCenter:", v7 * 0.5, v13);
    -[MFMailComposeController navigationItem](self, "navigationItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "titleView");
    v17 = (id)objc_claimAutoreleasedReturnValue();

    v15 = v17;
    if (!v17)
    {
      -[MFMailComposeController navigationController](self, "navigationController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "navigationBar");
      v18 = (id)objc_claimAutoreleasedReturnValue();

      v15 = v18;
    }
    v19 = v15;
    objc_msgSend(v15, "addSubview:", self->_handoffProgressView);

  }
}

- (void)_hideHandoffProgressViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  _QWORD aBlock[5];

  v3 = a3;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__MFMailComposeController__hideHandoffProgressViewAnimated___block_invoke;
  aBlock[3] = &unk_1E5A65480;
  aBlock[4] = self;
  v6 = _Block_copy(aBlock);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __60__MFMailComposeController__hideHandoffProgressViewAnimated___block_invoke_2;
  v9[3] = &unk_1E5A66750;
  v9[4] = self;
  v7 = _Block_copy(v9);
  v8 = v7;
  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v6, v7, 0.35);
  else
    (*((void (**)(void *, uint64_t))v7 + 2))(v7, 1);

}

uint64_t __60__MFMailComposeController__hideHandoffProgressViewAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1400), "setAlpha:", 0.0);
}

void __60__MFMailComposeController__hideHandoffProgressViewAnimated___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;

  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1400), "removeFromSuperview");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 1400);
    *(_QWORD *)(v3 + 1400) = 0;

  }
}

- (void)updateUserActivityState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  MFLANHandoffAgent *LANHandoffAgent;
  MFLANHandoffAgent *v12;
  MFLANHandoffAgent *v13;
  MFLANHandoffAgent *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[2];
  _QWORD v24[2];
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D4D620], "accountContainingEmailAddress:", self->_sendingEmailAddress);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = *MEMORY[0x1E0D46CE0];
  if (v5 && (objc_msgSend(v5, "supportsHandoffType:", *MEMORY[0x1E0D46CE0]) & 1) == 0)
  {
    objc_msgSend(v4, "invalidate");
  }
  else
  {
    v25 = *MEMORY[0x1E0D46CF0];
    v26[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addUserInfoEntriesFromDictionary:", v8);

    objc_msgSend(MEMORY[0x1E0C99EA0], "em_userDefaults");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLForKey:", CFSTR("ComposeActivityOverLAN"));

    if (v10)
    {
      LANHandoffAgent = self->_LANHandoffAgent;
      if (!LANHandoffAgent)
      {
        v12 = objc_alloc_init(MFLANHandoffAgent);
        v13 = self->_LANHandoffAgent;
        self->_LANHandoffAgent = v12;

        v14 = self->_LANHandoffAgent;
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __51__MFMailComposeController_updateUserActivityState___block_invoke;
        v21[3] = &unk_1E5A68760;
        v21[4] = self;
        v22 = v4;
        v15 = -[MFLANHandoffAgent startServerWithCompletion:](v14, "startServerWithCompletion:", v21);

        LANHandoffAgent = self->_LANHandoffAgent;
      }
      -[MFLANHandoffAgent handoffContext](LANHandoffAgent, "handoffContext");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        v23[0] = CFSTR("LANHostname");
        objc_msgSend(v16, "host");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v18;
        v23[1] = CFSTR("LANPortNumber");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v17, "port"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v24[1] = v19;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addUserInfoEntriesFromDictionary:", v20);

      }
    }
  }

}

uint64_t __51__MFMailComposeController_updateUserActivityState___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "userActivity:didReceiveInputStream:outputStream:", *(_QWORD *)(a1 + 40), a2, a3);
}

- (void)_makeComposeUserActivityCurrent
{
  void *v3;
  int v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;

  if (!-[MFMailComposeController _isDummyViewController](self, "_isDummyViewController"))
  {
    -[MFMailComposeController userActivity](self, "userActivity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v20, "BOOLForKey:", CFSTR("ComposeActivityFatPayloads"));

      v5 = (id *)MEMORY[0x1E0D46CD8];
      if (!v4)
        v5 = (id *)MEMORY[0x1E0D46CE0];
      v21 = *v5;
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", v21);
      -[MFMailComposeController setUserActivity:](self, "setUserActivity:", v6);

      -[MFMailComposeController userActivity](self, "userActivity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDelegate:", self);

      -[MFMailComposeController userActivity](self, "userActivity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSupportsContinuationStreams:", 1);

    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("DRAFT"), &stru_1E5A6A588, CFSTR("Main"));
    v22 = (id)objc_claimAutoreleasedReturnValue();

    -[MFComposeSubjectView text](self->_subjectField, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DRAFT_ACTIVITY_FORMAT %@"), &stru_1E5A6A588, CFSTR("Main"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFComposeSubjectView text](self->_subjectField, "text");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", v14, v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v22 = (id)v16;
    }
    -[MFMailComposeController userActivity](self, "userActivity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTitle:", v22);

    -[MFMailComposeController userActivity](self, "userActivity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeController updateUserActivityState:](self, "updateUserActivityState:", v18);

    -[MFMailComposeController userActivity](self, "userActivity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "becomeCurrent");

  }
}

- (void)setProgressUIVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  MFMessageContentProgressLayer *progressIndicatorView;
  MFMessageContentProgressLayer *v7;
  MFMessageContentProgressLayer *v8;
  MFMessageContentProgressLayer *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _QWORD aBlock[5];

  v4 = a4;
  if (a3)
  {
    progressIndicatorView = self->_progressIndicatorView;
    if (!progressIndicatorView)
    {
      v7 = [MFMessageContentProgressLayer alloc];
      v8 = -[MFMessageContentProgressLayer initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v9 = self->_progressIndicatorView;
      self->_progressIndicatorView = v8;

      -[MFMailComposeController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", self->_progressIndicatorView);

      progressIndicatorView = self->_progressIndicatorView;
    }
    -[MFMessageContentProgressLayer setAutoresizingMask:](progressIndicatorView, "setAutoresizingMask:", 18);
    -[MFMailComposeController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    -[MFMessageContentProgressLayer setFrame:](self->_progressIndicatorView, "setFrame:");

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__MFMailComposeController_setProgressUIVisible_animated___block_invoke;
    aBlock[3] = &unk_1E5A65480;
    aBlock[4] = self;
    v12 = _Block_copy(aBlock);
    v13 = v12;
    if (v4)
    {
      -[MFMessageContentProgressLayer setAlpha:](self->_progressIndicatorView, "setAlpha:", 0.0);
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v13, 0.6);
    }
    else
    {
      (*((void (**)(void *))v12 + 2))(v12);
    }
  }
  else
  {
    -[MFMailComposeController _hideHandoffProgressViewAnimated:](self, "_hideHandoffProgressViewAnimated:", a4);
    v14 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__MFMailComposeController_setProgressUIVisible_animated___block_invoke_2;
    v18[3] = &unk_1E5A65480;
    v18[4] = self;
    v13 = _Block_copy(v18);
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __57__MFMailComposeController_setProgressUIVisible_animated___block_invoke_3;
    v17[3] = &unk_1E5A66750;
    v17[4] = self;
    v15 = _Block_copy(v17);
    v16 = v15;
    if (v4)
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v13, v15, 0.6);
    else
      (*((void (**)(void *, uint64_t))v15 + 2))(v15, 1);

  }
}

uint64_t __57__MFMailComposeController_setProgressUIVisible_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "setAlpha:", 1.0);
}

uint64_t __57__MFMailComposeController_setProgressUIVisible_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "setAlpha:", 0.0);
}

void __57__MFMailComposeController_setProgressUIVisible_animated___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  kdebug_trace();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1408), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1408);
  *(_QWORD *)(v2 + 1408) = 0;

}

- (void)handleLargeMessageComposeHandoffWithInputStream:(id)a3 outputStream:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id WeakRetained;
  MFComposeActivityHandoffOperation *v13;
  MFComposeActivityHandoffOperation *handoffOperation;
  _QWORD block[4];
  id v16;
  MFMailComposeController *v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    MFLogGeneral();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v10, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MFMailComposeController handleLargeMessageComposeHandoffWithInputStream:outputStream:error:].cold.1();
    }

    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __94__MFMailComposeController_handleLargeMessageComposeHandoffWithInputStream_outputStream_error___block_invoke;
      block[3] = &unk_1E5A65BD8;
      v16 = WeakRetained;
      v17 = self;
      v18 = v10;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }
  else
  {
    +[MFComposeActivityHandoffOperation receivingOperationWithInputStream:outputStream:](MFComposeActivityHandoffOperation, "receivingOperationWithInputStream:outputStream:", v8, v9);
    v13 = (MFComposeActivityHandoffOperation *)objc_claimAutoreleasedReturnValue();
    handoffOperation = self->_handoffOperation;
    self->_handoffOperation = v13;

    -[MFComposeActivityHandoffOperation setDelegate:](self->_handoffOperation, "setDelegate:", self);
    kdebug_trace();
    -[MFComposeActivityHandoffOperation start](self->_handoffOperation, "start");
  }

}

uint64_t __94__MFMailComposeController_handleLargeMessageComposeHandoffWithInputStream_outputStream_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "mailComposeController:failedToHandoffCompositionWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)_copyMessageDataForActivityHandoff
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD block[5];
  id v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController originatingBundleID](self, "originatingBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFComposeTypeFactory headersFromDelegate:originatingBundleID:sourceAccountManagement:](MFComposeTypeFactory, "headersFromDelegate:originatingBundleID:sourceAccountManagement:", self, v4, -[MFMailComposeController sourceAccountManagement](self, "sourceAccountManagement"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__MFMailComposeController__copyMessageDataForActivityHandoff__block_invoke;
  block[3] = &unk_1E5A65BD8;
  block[4] = self;
  v6 = v5;
  v12 = v6;
  v7 = v3;
  v13 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_msgSend(v7, "future");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "result:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __61__MFMailComposeController__copyMessageDataForActivityHandoff__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1496), "isDefaultSignatureForSender:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(v3 + 1200);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[2] = __61__MFMailComposeController__copyMessageDataForActivityHandoff__block_invoke_2;
  v6[3] = &unk_1E5A68788;
  v6[1] = 3221225472;
  v6[4] = v3;
  v7 = v4;
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v5, "getHTMLDataObjectRemovingSignature:completion:", v2, v6);

}

void __61__MFMailComposeController__copyMessageDataForActivityHandoff__block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v3 = a2;
  objc_msgSend(v3, "otherHTMLStringsAndAttachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(a1[4], "compositionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachmentManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)a1[4] + 150), "compositionContextID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attachmentsForContext:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__MFMailComposeController__copyMessageDataForActivityHandoff__block_invoke_3;
  v11[3] = &unk_1E5A66A80;
  v12 = v3;
  v13 = v4;
  v14 = a1[5];
  v15 = a1[6];
  v9 = v4;
  v10 = v3;
  dispatch_async(v8, v11);

}

void __61__MFMailComposeController__copyMessageDataForActivityHandoff__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = objc_alloc_init(MEMORY[0x1E0D4D5A8]);
  objc_msgSend(*(id *)(a1 + 32), "htmlString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "plainTextAlternative");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v7, "createMessageWithHTMLStringAndMIMECharset:plainTextAlternative:otherHtmlStringsAndAttachments:headers:", v2, v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  v5 = *(void **)(a1 + 56);
  objc_msgSend(v4, "messageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishWithResult:", v6);

}

- (id)_copyMessagePlainTextForDonation
{
  return -[MFMailComposeController _copyMessagePlainTextForDonationRemoveQuotes:](self, "_copyMessagePlainTextForDonationRemoveQuotes:", 0);
}

- (id)_copyMessagePlainTextForDonationRemoveQuotes:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  MFComposeWebView *composeWebView;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__5;
  v14 = __Block_byref_object_dispose__5;
  v15 = (id)0xAAAAAAAAAAAAAAAALL;
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  composeWebView = self->_composeWebView;
  v15 = v5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__MFMailComposeController__copyMessagePlainTextForDonationRemoveQuotes___block_invoke;
  v9[3] = &unk_1E5A687B0;
  v9[4] = &v10;
  -[MFComposeWebView getHTMLDataObjectRemovingSignature:removeQuotes:completion:](composeWebView, "getHTMLDataObjectRemovingSignature:removeQuotes:completion:", 1, v3, v9);
  objc_msgSend((id)v11[5], "future");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __72__MFMailComposeController__copyMessagePlainTextForDonationRemoveQuotes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "plainTextAlternative");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quotedAttachmentsInfo");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && v5)
  {
    v12[0] = v4;
    v12[1] = v5;
    v7 = v12;
    v8 = 2;
  }
  else
  {
    if (v4)
    {
      v11 = v4;
      v7 = (uint64_t *)&v11;
    }
    else
    {
      if (!v5)
      {
        v9 = (void *)MEMORY[0x1E0C9AA60];
        goto LABEL_10;
      }
      v10 = v5;
      v7 = &v10;
    }
    v8 = 1;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "finishWithResult:", v9);

}

- (void)userActivity:(id)a3 didReceiveInputStream:(id)a4 outputStream:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  MFComposeActivityHandoffOperation *v12;
  MFComposeActivityHandoffOperation *handoffOperation;
  NSObject *v14;
  void *v15;
  id WeakRetained;
  void *v17;
  void *v18;

  v8 = a4;
  v9 = a5;
  if (pthread_main_np())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailComposeController.m"), 7624, CFSTR("Current thread is main"));

  }
  if (self->_composeWebViewFlags.respondsToCompositionWillFinish)
  {
    -[MFMailComposeController composeWebView](self, "composeWebView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "compositionWillFinish");

  }
  v11 = -[MFMailComposeController _copyMessageDataForActivityHandoff](self, "_copyMessageDataForActivityHandoff");
  if (v11)
  {
    +[MFComposeActivityHandoffOperation sendingOperationWithDraftData:inputStream:outputStream:](MFComposeActivityHandoffOperation, "sendingOperationWithDraftData:inputStream:outputStream:", v11, v8, v9);
    v12 = (MFComposeActivityHandoffOperation *)objc_claimAutoreleasedReturnValue();
    handoffOperation = self->_handoffOperation;
    self->_handoffOperation = v12;

    -[MFComposeActivityHandoffOperation setDelegate:](self->_handoffOperation, "setDelegate:", self);
    kdebug_trace();
    -[MFComposeActivityHandoffOperation start](self->_handoffOperation, "start");
  }
  else
  {
    MFLogGeneral();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[MFMailComposeController userActivity:didReceiveInputStream:outputStream:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MFActivityHandoffOperationError"), -1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "mailComposeController:failedToHandoffCompositionWithError:", self, v15);
    if (self->_composeWebViewFlags.respondsToCompositionDidFailToFinish)
    {
      -[MFMailComposeController composeWebView](self, "composeWebView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "compositionDidFailToFinish");

    }
  }

}

- (void)activityHandoffOperation:(id)a3 didFinishReceivingData:(id)a4
{
  id v5;
  _MFMailCompositionContext *v6;
  NSObject *v7;
  id WeakRetained;

  v5 = a4;
  kdebug_trace();
  if (objc_msgSend(v5, "length"))
  {
    v6 = -[_MFMailCompositionContext initWithComposeType:RFC822Data:]([_MFMailCompositionContext alloc], "initWithComposeType:RFC822Data:", 9, v5);
    -[MFMailComposeController setCompositionContext:](self, "setCompositionContext:", v6);
    -[MFMailComposeController setProgressUIVisible:animated:](self, "setProgressUIVisible:animated:", 0, 1);
  }
  else
  {
    MFLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MFMailComposeController activityHandoffOperation:didFinishReceivingData:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MFActivityHandoffOperationError"), -1, 0);
    v6 = (_MFMailCompositionContext *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained(&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "mailComposeController:failedToHandoffCompositionWithError:", self, v6);

  }
}

- (void)activityHandoffOperation:(id)a3 didFinishSendingDataWithResult:(int64_t)a4
{
  NSObject *v6;
  MFComposeActivityHandoffOperation *handoffOperation;
  id WeakRetained;
  int v9;
  int64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  kdebug_trace();
  MFLogGeneral();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v9 = 134217984;
    v10 = a4;
    _os_log_impl(&dword_1AB96A000, v6, OS_LOG_TYPE_INFO, "#Hand-Off Delegate; finished sending! result: %lu",
      (uint8_t *)&v9,
      0xCu);
  }

  handoffOperation = self->_handoffOperation;
  self->_handoffOperation = 0;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (a4 == 1 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "mailComposeControllerCompositionHandoffFinished:", self);

}

- (void)activityHandoffOperation:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  MFComposeActivityHandoffOperation *handoffOperation;
  id WeakRetained;
  void *v9;

  v5 = a4;
  MFLogGeneral();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    -[MFMailComposeController activityHandoffOperation:didFailWithError:].cold.1();
  }

  handoffOperation = self->_handoffOperation;
  self->_handoffOperation = 0;

  WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "mailComposeController:failedToHandoffCompositionWithError:", self, v5);
  if (self->_composeWebViewFlags.respondsToCompositionDidFailToFinish)
  {
    -[MFMailComposeController composeWebView](self, "composeWebView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "compositionDidFailToFinish");

  }
}

- (void)activityHandoffOperationReceivedBytes:(id)a3
{
  unint64_t v4;
  double v5;
  id v6;

  v6 = a3;
  -[MFMailComposeController _createAndAddHandoffProgressViewIfNecessary](self, "_createAndAddHandoffProgressViewIfNecessary");
  v4 = objc_msgSend(v6, "bytesReceived");
  v5 = (double)v4 / (double)(unint64_t)objc_msgSend(v6, "bytesExpected");
  *(float *)&v5 = v5;
  -[UIProgressView setProgress:](self->_handoffProgressView, "setProgress:", v5);

}

- (void)_bodyTextChanged
{
  char v3;
  BOOL v4;

  v3 = *((_BYTE *)self + 1352);
  if ((v3 & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = -[MFComposeWebView isDirty](self->_composeWebView, "isDirty");
    v3 = *((_BYTE *)self + 1352);
  }
  *((_BYTE *)self + 1352) = v3 & 0xFE | v4;
  *((_BYTE *)self + 1352) |= 2u;
  -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");
  -[MFMailComposeController _draftContentDidChange](self, "_draftContentDidChange");
}

- (void)_retainFocusOfComposeWebViewIfRequired:(id)a3
{
  char v4;
  id v5;
  id v6;

  -[MFMailComposeController traitCollection](self, "traitCollection", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "mf_supportsPopoverPresentation");

  if ((v4 & 1) == 0)
  {
    -[MFMailComposeController composeWebView](self, "composeWebView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "retainFocusAfterPresenting");

  }
}

- (void)mailCompositionContext:(id)a3 messageDidChange:(id)a4
{
  -[MFMailComposeController setDraftMessage:](self, "setDraftMessage:", a4);
}

- (UIEdgeInsets)additionalContentInsetForComposeWebView:(id)a3
{
  id v4;
  void *v5;
  double *v6;
  double v7;
  MFPhotoPickerController *photosPickerController;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  MFComposePhotoPickerController *systemPhotosPickerController;
  void *v14;
  int v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  UIEdgeInsets result;

  v4 = a3;
  v5 = v4;
  v6 = (double *)MEMORY[0x1E0DC49E8];
  v7 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  photosPickerController = self->_photosPickerController;
  if (photosPickerController)
  {
    v9 = __67__MFMailComposeController_additionalContentInsetForComposeWebView___block_invoke((uint64_t)v4, photosPickerController, self->_photosPickerController);
    goto LABEL_8;
  }
  -[MFMailComposeController styleSelector](self, "styleSelector");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[MFMailComposeController styleSelector](self, "styleSelector");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeController styleSelector](self, "styleSelector");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = __67__MFMailComposeController_additionalContentInsetForComposeWebView___block_invoke((uint64_t)v12, v11, v12);

  }
  else
  {
    systemPhotosPickerController = self->_systemPhotosPickerController;
    v9 = v7;
    if (!systemPhotosPickerController)
      goto LABEL_8;
    -[MFComposePhotoPickerController pickerViewController](systemPhotosPickerController, "pickerViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = __67__MFMailComposeController_additionalContentInsetForComposeWebView___block_invoke((uint64_t)v11, v11, self->_systemPhotosPickerController);
  }

LABEL_8:
  -[MFMailComposeController mailComposeView](self, "mailComposeView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isQuickReply");
  v16 = *v6;
  v17 = v6[1];
  v18 = v6[3];

  if (v15)
    v9 = v7;

  v19 = v16;
  v20 = v17;
  v21 = v9;
  v22 = v18;
  result.right = v22;
  result.bottom = v21;
  result.left = v20;
  result.top = v19;
  return result;
}

double __67__MFMailComposeController_additionalContentInsetForComposeWebView___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 || (objc_msgSend(v4, "presentationController"), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_opt_class();
    v8 = 0.0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (v5)
      {
        objc_msgSend(v7, "containerView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "traitCollection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "preferredHeightForTraitCollection:", v10);
        v8 = v11;
      }
      else
      {
        objc_msgSend(v4, "navigationController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bounds");
        v14 = v13;
        objc_msgSend(v4, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "safeAreaInsets");
        v8 = v14 - v16;

      }
    }
  }
  else
  {
    v8 = 0.0;
  }

  return v8;
}

- (void)showMissingAttachmentDataAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];

  v3 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ATTACHMENTS_FAILED_TO_LOAD_TITLE"), &stru_1E5A6A588, CFSTR("Main"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ATTACHMENTS_FAILED_TO_LOAD_MESSAGE"), &stru_1E5A6A588, CFSTR("Main"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("COMPOSE_ANYWAY"), &stru_1E5A6A588, CFSTR("Main"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __57__MFMailComposeController_showMissingAttachmentDataAlert__block_invoke;
  v19[3] = &unk_1E5A67A58;
  v19[4] = self;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 0, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v13);

  v14 = (void *)MEMORY[0x1E0DC3448];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_1E5A6A588, CFSTR("Main"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __57__MFMailComposeController_showMissingAttachmentDataAlert__block_invoke_2;
  v18[3] = &unk_1E5A67A58;
  v18[4] = self;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 1, v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v17);

  -[MFMailComposeController _presentModalAlert:](self, "_presentModalAlert:", v8);
}

void __57__MFMailComposeController_showMissingAttachmentDataAlert__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "mailComposeView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "restoreFirstResponder");

}

uint64_t __57__MFMailComposeController_showMissingAttachmentDataAlert__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "close");
}

- (void)composeWebViewDidChangeFontAttributes:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFMailComposeController setFontAttributes:](self, "setFontAttributes:");
  -[MFMailComposeController styleSelector](self, "styleSelector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateStateUsingFontAttributes:", v5);

}

- (void)showStyleSelector:(id)a3
{
  id v4;
  NSObject *v5;
  MFComposeStyleSelectorViewController *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[8];
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MFLogGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB96A000, v5, OS_LOG_TYPE_DEFAULT, "#CompositionServices Showing style selector", buf, 2u);
  }

  v6 = objc_alloc_init(MFComposeStyleSelectorViewController);
  -[MFMailComposeController setStyleSelector:](self, "setStyleSelector:", v6);

  -[MFMailComposeController styleSelector](self, "styleSelector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setStyleDelegate:", self);

  v8 = objc_alloc(MEMORY[0x1E0DC3A40]);
  -[MFMailComposeController styleSelector](self, "styleSelector");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithRootViewController:", v9);

  -[MFMailComposeController parentViewController](self, "parentViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "mf_supportsPopoverPresentation");

  if (v13)
  {
    objc_msgSend(v10, "setModalPresentationStyle:", 7);
    objc_msgSend(v10, "popoverPresentationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDelegate:", self);
    -[MFMailComposeController _configureSender:asSourceForPopoverPresentationController:](self, "_configureSender:asSourceForPopoverPresentationController:", v4, v14);
    objc_msgSend(v14, "setPermittedArrowDirections:", 14);
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __45__MFMailComposeController_showStyleSelector___block_invoke;
    v22[3] = &unk_1E5A66CB8;
    objc_copyWeak(&v23, (id *)buf);
    objc_msgSend(v11, "presentViewController:animated:completion:", v10, 1, v22);
    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    objc_msgSend(v10, "presentationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setDelegate:", self);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v14;
      -[MFMailComposeController styleSelector](self, "styleSelector");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMailComposeController _sheetDetentForIdentifier:viewController:](self, "_sheetDetentForIdentifier:viewController:", CFSTR("StyleSelectorHalfDetent"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v25[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDetents:", v18);

      objc_msgSend(v15, "setSmallestUndimmedDetentIdentifier:", CFSTR("StyleSelectorHalfDetent"));
      objc_msgSend(v15, "setPrefersEdgeAttachedInCompactHeight:", 1);

    }
    -[MFMailComposeController composeWebView](self, "composeWebView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "retainFocusAfterPresenting");

    objc_msgSend(v11, "presentViewController:animated:completion:", v10, 1, 0);
    -[MFMailComposeController styleSelector](self, "styleSelector");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeController fontAttributes](self, "fontAttributes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "updateStateUsingFontAttributes:", v21);

  }
}

void __45__MFMailComposeController_showStyleSelector___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "styleSelector");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "fontAttributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateStateUsingFontAttributes:", v2);

}

- (void)_configureSender:(id)a3 asSourceForPopoverPresentationController:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect v12;
  CGRect v13;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "setBarButtonItem:", v5);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v5;
      objc_msgSend(v6, "setSourceView:", v7);
      -[NSObject bounds](v7, "bounds");
      x = v12.origin.x;
      y = v12.origin.y;
      width = v12.size.width;
      height = v12.size.height;
      CGRectGetMidX(v12);
      v13.origin.x = x;
      v13.origin.y = y;
      v13.size.width = width;
      v13.size.height = height;
      CGRectGetMidY(v13);
      UIRectCenteredAboutPoint();
      objc_msgSend(v6, "setSourceRect:");
    }
    else
    {
      MFLogGeneral();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[MFMailComposeController _configureSender:asSourceForPopoverPresentationController:].cold.1();
    }

  }
}

- (void)takeFocusFromComposeWebView:(id)a3 inDirection:(unint64_t)a4
{
  int *v6;
  id v7;

  v7 = a3;
  if (a4 == 16)
  {
    v6 = &OBJC_IVAR___MFMailComposeController__toField;
    goto LABEL_5;
  }
  if (a4 == 32)
  {
    v6 = &OBJC_IVAR___MFMailComposeController__subjectField;
LABEL_5:
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + *v6), "becomeFirstResponder");
  }

}

- (id)sendLaterMenu
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
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
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE location[24];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0D46DD8], "contextForCurrentDate");
  v29 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v3 = objc_msgSend(&unk_1E5A9FFB0, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v38 != v4)
          objc_enumerationMutation(&unk_1E5A9FFB0);
        v6 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if ((objc_msgSend(v6, "integerValue") & v2) != 0)
        {
          objc_msgSend(MEMORY[0x1E0D46DD8], "titleAndDateForSendLaterContext:", objc_msgSend(v6, "integerValue"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)location = 0xAAAAAAAAAAAAAAAALL;
          objc_initWeak((id *)location, self);
          v8 = (void *)MEMORY[0x1E0DC3428];
          objc_msgSend(v7, "first");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v33[0] = MEMORY[0x1E0C809B0];
          v33[1] = 3221225472;
          v33[2] = __40__MFMailComposeController_sendLaterMenu__block_invoke;
          v33[3] = &unk_1E5A687D8;
          objc_copyWeak(&v36, (id *)location);
          v10 = v7;
          v34 = v10;
          v35 = v6;
          objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", v9, 0, 0, v33);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v10, "first");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringWithFormat:", CFSTR("mail.sendLaterContextMenu.%@"), v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setAccessibilityIdentifier:", v14);

          objc_msgSend(v29, "addObject:", v11);
          objc_destroyWeak(&v36);
          objc_destroyWeak((id *)location);

        }
      }
      v3 = objc_msgSend(&unk_1E5A9FFB0, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v3);
  }
  if ((v2 & 0x20) != 0)
  {
    *(_QWORD *)location = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)location, self);
    objc_msgSend(MEMORY[0x1E0D46DD8], "titleAndDateForSendLaterContext:", 32);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0DC3428];
    objc_msgSend(v15, "first");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __40__MFMailComposeController_sendLaterMenu__block_invoke_2;
    v30[3] = &unk_1E5A68800;
    objc_copyWeak(&v32, (id *)location);
    v18 = v15;
    v31 = v18;
    objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", v17, 0, 0, v30);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v18, "first");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("mail.sendLaterContextMenu.%@"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setAccessibilityIdentifier:", v22);

    objc_msgSend(v29, "addObject:", v19);
    objc_destroyWeak(&v32);

    objc_destroyWeak((id *)location);
  }
  MFLogGeneral();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)location = 138412290;
    *(_QWORD *)&location[4] = v29;
    _os_log_impl(&dword_1AB96A000, v23, OS_LOG_TYPE_INFO, "Returning actions for send later menu %@", location, 0xCu);
  }

  v24 = (void *)MEMORY[0x1E0DC39D0];
  v25 = (void *)objc_msgSend(v29, "copy");
  objc_msgSend(v24, "menuWithTitle:children:", &stru_1E5A6A588, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

void __40__MFMailComposeController_sendLaterMenu__block_invoke(id *a1)
{
  void *v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_msgSend(a1[4], "second");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[122], "setSendLaterDate:", v2);

    objc_msgSend(WeakRetained[122], "setSendLaterContext:", objc_msgSend(a1[5], "integerValue"));
    objc_msgSend(WeakRetained, "send:", 0);
  }

}

void __40__MFMailComposeController_sendLaterMenu__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  MFDatePickerViewController *v4;
  void *v5;
  MFDatePickerViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = [MFDatePickerViewController alloc];
  objc_msgSend(*(id *)(a1 + 32), "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MFDatePickerViewController initWithType:shouldShowDeleteButton:initialDate:](v4, "initWithType:shouldShowDeleteButton:initialDate:", 0, 0, v5);

  -[MFDatePickerViewController setDelegate:](v6, "setDelegate:", WeakRetained);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v6);
  objc_msgSend(v7, "setModalPresentationStyle:", 7);
  objc_msgSend(v7, "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentationSourceItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSourceItem:", v9);

  objc_msgSend(WeakRetained, "parentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)addLink:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  _EFLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController _presentLinkEditorWithName:text:mode:completion:](self, "_presentLinkEditorWithName:text:mode:completion:", v4, 0, 0, v5);

}

- (void)editLink:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  _EFLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController _presentLinkEditorWithName:text:mode:completion:](self, "_presentLinkEditorWithName:text:mode:completion:", v7, v8, 0, v6);

}

- (void)editTextDescription:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  _EFLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailComposeController _presentLinkEditorWithName:text:mode:completion:](self, "_presentLinkEditorWithName:text:mode:completion:", v7, v8, 1, v6);

}

- (void)_presentLinkEditorWithName:(id)a3 text:(id)a4 mode:(unint64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  MFHyperlinkEditorViewController *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  MFHyperlinkEditorViewController *v27;
  MFHyperlinkEditorViewController *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  MFHyperlinkEditorViewController *v37;
  id v38;
  id location;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[MFMailComposeController traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "mf_supportsPopoverPresentation");

  if (v14)
  {
    v15 = -[MFHyperlinkEditorViewController initWithTitle:text:mode:shouldShowCloseButton:completion:]([MFHyperlinkEditorViewController alloc], "initWithTitle:text:mode:shouldShowCloseButton:completion:", v10, v11, a5, 0, v12);
    -[MFHyperlinkEditorViewController setModalPresentationStyle:](v15, "setModalPresentationStyle:", 7);
    -[MFMailComposeController composeWebView](self, "composeWebView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFHyperlinkEditorViewController popoverPresentationController](v15, "popoverPresentationController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSourceView:", v16);

    -[MFMailComposeController _optimalRectForPresentingPopoverInComposeWebView](self, "_optimalRectForPresentingPopoverInComposeWebView");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    -[MFHyperlinkEditorViewController popoverPresentationController](v15, "popoverPresentationController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setSourceRect:", v19, v21, v23, v25);

    v27 = v15;
  }
  else
  {
    v28 = -[MFHyperlinkEditorViewController initWithTitle:text:mode:shouldShowCloseButton:completion:]([MFHyperlinkEditorViewController alloc], "initWithTitle:text:mode:shouldShowCloseButton:completion:", v10, v11, a5, 1, v12);
    -[MFHyperlinkEditorViewController setModalPresentationStyle:](v28, "setModalPresentationStyle:", 1);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v29 = (void *)MEMORY[0x1E0DC3C78];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __75__MFMailComposeController__presentLinkEditorWithName_text_mode_completion___block_invoke;
    v36[3] = &unk_1E5A68828;
    objc_copyWeak(&v38, &location);
    v27 = v28;
    v37 = v27;
    objc_msgSend(v29, "customDetentWithIdentifier:resolver:", CFSTR("LinkEditorFirstCustomDetent"), v36);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "identifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFHyperlinkEditorViewController sheetPresentationController](v27, "sheetPresentationController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setLargestUndimmedDetentIdentifier:", v31);

    v40[0] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFHyperlinkEditorViewController sheetPresentationController](v27, "sheetPresentationController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setDetents:", v33);

    -[MFHyperlinkEditorViewController sheetPresentationController](v27, "sheetPresentationController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setPrefersEdgeAttachedInCompactHeight:", 1);

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  -[MFMailComposeController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v27, 1, 0);

}

double __75__MFMailComposeController__presentLinkEditorWithName_text_mode_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  double v5;
  double v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(WeakRetained, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredHeightForTraitCollection:", v4);
  v6 = v5;

  return v6;
}

- (void)composeWebView:(id)a3 didChangeHeight:(double)a4
{
  int v6;
  id v7;
  id v8;

  if (_os_feature_enabled_impl())
  {
    -[MFMailComposeController mailComposeView](self, "mailComposeView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isQuickReply");

    if (v6)
    {
      -[MFMailComposeController quickReplyDelegate](self, "quickReplyDelegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "mailComposeController:didChangeQuickReplyWebViewHeight:", self, a4);

    }
  }
}

- (void)composeWebView:(id)a3 composeBodyIsEmpty:(BOOL)a4
{
  _BOOL8 v4;
  int v6;
  id v7;
  id v8;

  v4 = a4;
  if (_os_feature_enabled_impl())
  {
    -[MFMailComposeController mailComposeView](self, "mailComposeView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isQuickReply");

    if (v6)
    {
      -[MFMailComposeController setHasMessageBodyContent:](self, "setHasMessageBodyContent:", v4 ^ 1);
      -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");
      -[MFMailComposeController quickReplyDelegate](self, "quickReplyDelegate");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "mailComposeController:composeBodyIsEmpty:", self, v4);

    }
  }
}

- (void)composeWebView:(id)a3 hasActiveWritingToolsSession:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  int v7;
  MFMailComposeController *v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v4 = a4;
  v11 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl()
    && EMIsGreymatterAvailableWithOverride()
    && -[MFMailComposeController hasActiveWritingToolsSession](self, "hasActiveWritingToolsSession") != v4)
  {
    EMLogCompose();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134218240;
      v8 = self;
      v9 = 1024;
      v10 = v4;
      _os_log_impl(&dword_1AB96A000, v6, OS_LOG_TYPE_DEFAULT, "%p: [Writing Tools] updating appearance for writing-tools session: %{BOOL}d", (uint8_t *)&v7, 0x12u);
    }

    -[MFMailComposeController setHasActiveWritingToolsSession:](self, "setHasActiveWritingToolsSession:", v4);
    -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");
  }
}

- (BOOL)isCloudKitShare
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MFMailComposeController compositionContext](self, "compositionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ckShare");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)composeStyleSelector:(id)a3 didSelectStyle:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MFLogGeneral();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543362;
    v14 = v7;
    _os_log_impl(&dword_1AB96A000, v8, OS_LOG_TYPE_DEFAULT, "#CompositionServices Compose style selector did select style: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  -[MFMailComposeController composeWebView](self, "composeWebView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "styleType");
  if (v10 == 11)
  {
    v11 = 1;
  }
  else
  {
    if (v10 != 12)
    {
      objc_msgSend(MEMORY[0x1E0C99DB8], "mf_invocationWithSelector:target:object:", objc_msgSend(v7, "editSelector"), v9, v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "invoke");

      goto LABEL_9;
    }
    v11 = -1;
  }
  objc_msgSend(v9, "changeQuoteLevel:", v11);
LABEL_9:

}

- (void)composeStyleSelector:(id)a3 didChangeTextColor:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MFLogGeneral();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1AB96A000, v8, OS_LOG_TYPE_DEFAULT, "#CompositionServices Compose style selector did change text color: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  -[MFMailComposeController composeWebView](self, "composeWebView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setTextColor:sender:", v7, v6);

}

- (void)composeStyleSelector:(id)a3 didChangeFont:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  MFLogGeneral();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1AB96A000, v8, OS_LOG_TYPE_DEFAULT, "#CompositionServices Compose style selector did change font: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  -[MFMailComposeController _retainFocusOfComposeWebViewIfRequired:](self, "_retainFocusOfComposeWebViewIfRequired:", v6);
  -[MFMailComposeController composeWebView](self, "composeWebView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setFont:sender:", v7, v6);

}

- (void)composeStyleSelector:(id)a3 didChangeFontSize:(double)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  MFLogGeneral();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = a4;
    _os_log_impl(&dword_1AB96A000, v7, OS_LOG_TYPE_DEFAULT, "#CompositionServices Compose style selector did change font size: %f", (uint8_t *)&v9, 0xCu);
  }

  -[MFMailComposeController composeWebView](self, "composeWebView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setFontSize:sender:", v6, a4);

}

- (void)composeStyleSelectorDidCancel:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  MFLogGeneral();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "#CompositionServices Compose style selector dismissed", v7, 2u);
  }

  -[MFMailComposeController composeWebView](self, "composeWebView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "releaseFocusAfterDismissing:", 1);

  -[MFMailComposeController styleSelector](self, "styleSelector");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

  -[MFMailComposeController setStyleSelector:](self, "setStyleSelector:", 0);
}

- (void)composeStyleSelectorDidPresentColorPicker:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  MFLogGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AB96A000, v5, OS_LOG_TYPE_DEFAULT, "#CompositionServices Compose style selector presented color picker", v6, 2u);
  }

  -[MFMailComposeController _retainFocusOfComposeWebViewIfRequired:](self, "_retainFocusOfComposeWebViewIfRequired:", v4);
}

- (void)composeStyleSelectorDidDismissFontPicker:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  MFLogGeneral();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AB96A000, v5, OS_LOG_TYPE_DEFAULT, "#CompositionServices Font picker dismissed", v6, 2u);
  }

  -[MFMailComposeController _retainFocusOfComposeWebViewIfRequired:](self, "_retainFocusOfComposeWebViewIfRequired:", v4);
}

- (id)presentingViewControllerForComposeStyleSelector:(id)a3
{
  void *v4;
  int v5;
  void *v6;

  -[MFMailComposeController traitCollection](self, "traitCollection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "mf_supportsPopoverPresentation");

  if (v5)
  {
    -[MFMailComposeController parentViewController](self, "parentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  if (objc_msgSend(a4, "mf_supportsPopoverPresentation", a3))
    return 7;
  else
    return 1;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(void *, MFPhotoPickerController *);
  MFPhotoPickerController *v9;
  MFPhotoPickerController *v10;
  void *v11;
  MFPhotoPickerController *photosPickerController;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  MFMailComposeController *v19;

  v4 = a3;
  objc_msgSend(v4, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MFMailComposeController mailComposeView](self, "mailComposeView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeController peoplePicker](self, "peoplePicker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v5)
    {
      -[MFMailComposeController setPeoplePicker:](self, "setPeoplePicker:", 0);
      objc_msgSend(v6, "setShowingPeoplePicker:", 0);
    }
    else
    {
      -[MFMailComposeController setContactViewController:](self, "setContactViewController:", 0);
      -[MFMailComposeController setAtomPresentingCard:](self, "setAtomPresentingCard:", 0);
      -[MFMailComposeController setRecipientPresentingCard:](self, "setRecipientPresentingCard:", 0);
    }
    *((_BYTE *)self + 1353) &= ~2u;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "restoreFirstResponderWithKeyboardPinning:", 1);
    }
    else if (objc_msgSend(v6, "isSearchResultsPopoverVisible"))
    {
      objc_msgSend(v6, "searchResultsPopoverWasDismissed");
    }
    -[MFPhotoPickerController navigationController](self->_photosPickerController, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v11)
    {
      photosPickerController = self->_photosPickerController;
      self->_photosPickerController = 0;

    }
    -[MFMailComposeController popoverAlert](self, "popoverAlert");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v13)
      -[MFMailComposeController setPopoverAlert:](self, "setPopoverAlert:", 0);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MFMailComposeController _didDismissDocumentPicker](self, "_didDismissDocumentPicker");
    }
    else
    {
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __60__MFMailComposeController_presentationControllerDidDismiss___block_invoke;
      v17 = &unk_1E5A68850;
      v18 = v4;
      v19 = self;
      v8 = (void (**)(void *, MFPhotoPickerController *))_Block_copy(&v14);
      v8[2](v8, self->_photosPickerController);
      -[MFComposePhotoPickerController pickerViewController](self->_systemPhotosPickerController, "pickerViewController", v14, v15, v16, v17);
      v9 = (MFPhotoPickerController *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v9);

      -[MFMailComposeController styleSelector](self, "styleSelector");
      v10 = (MFPhotoPickerController *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v10);

    }
  }
  -[MFMailComposeController _updateSendAndCloseEnabled](self, "_updateSendAndCloseEnabled");

}

void __60__MFMailComposeController_presentationControllerDidDismiss___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4 == v8)
    {

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_8:

        goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "topViewController");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 != v8)
      {
LABEL_9:
        v3 = v8;
        goto LABEL_10;
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "composeWebView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "releaseFocusAfterDismissing:", 1);
    v4 = v8;
    v8 = 0;
    goto LABEL_8;
  }
LABEL_10:

}

- (BOOL)getPrefersLargeTitles
{
  void *v2;
  void *v3;
  char v4;

  -[MFMailComposeController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "prefersLargeTitles");

  return v4;
}

- (void)setPrefersLargeTitles:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[MFMailComposeController navigationController](self, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrefersLargeTitles:", v3);

}

- (void)datePickerViewController:(id)a3 didSelectDate:(id)a4
{
  id v5;

  v5 = a4;
  -[_MFMailCompositionContext setSendLaterDate:](self->_compositionContext, "setSendLaterDate:");
  -[_MFMailCompositionContext setSendLaterContext:](self->_compositionContext, "setSendLaterContext:", 32);
  -[MFMailComposeController send:](self, "send:", 0);

}

- (void)_sendAnalyticsSignalForResult:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  if (_os_feature_enabled_impl()
    && EMIsGreymatterAvailableWithOverride()
    && (unint64_t)a3 <= 2)
  {
    -[MFMailComposeController smartReplyThreadIdentifier](self, "smartReplyThreadIdentifier");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[MFMailComposeController compositionContext](self, "compositionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "originalMessage");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "flags");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "draft");

    objc_msgSend(MEMORY[0x1E0D46DA0], "sendAnalyticsSignal:threadIdentifier:isDraft:", 3 - a3, v9, v8);
  }
}

- (void)_invalidateInputContextHistory
{
  -[MFMailComposeController _invalidateInputContextHistoryDebounced:](self, "_invalidateInputContextHistoryDebounced:", 1);
}

- (void)_invalidateInputContextHistoryDebounced:(BOOL)a3
{
  id v3;

  if (a3)
  {
    -[MFMailComposeController inputContextHistoryInvalidationDebouncer](self, "inputContextHistoryInvalidationDebouncer");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "debounceResult:", 0);
  }
  else
  {
    -[MFMailComposeController composeWebView](self, "composeWebView");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateInputContextHistory");
  }

}

- (id)smartReplyThreadIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  -[MFMailComposeController compositionContext](self, "compositionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "originalMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithLongLong:", objc_msgSend(v4, "conversationID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_originalContentOfMessagesInReplyToMessage:(id)a3
{
  id v4;
  void *v5;
  NSObject *v7;
  os_signpost_id_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[8];

  v4 = a3;
  if (_os_feature_enabled_impl()
    && EMIsGreymatterAvailableWithOverride()
    && ((*(uint64_t (**)(void))(*MEMORY[0x1E0D1ED90] + 16))() & 1) == 0)
  {
    +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = -[MFMailComposeController signpostID](self, "signpostID");
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AB96A000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v8, "LOAD MESSAGE ORIGINAL CONTENT", "Begin loading message original content enableTelemetry=YES ", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, self);
    -[MFMailComposeController originalContentMessagesScheduler](self, "originalContentMessagesScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __70__MFMailComposeController__originalContentOfMessagesInReplyToMessage___block_invoke;
    v12[3] = &unk_1E5A68930;
    v13 = v4;
    objc_copyWeak(&v15, (id *)buf);
    v11 = v9;
    v14 = v11;
    objc_msgSend(v10, "performBlock:", v12);

    objc_msgSend(v11, "future");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __70__MFMailComposeController__originalContentOfMessagesInReplyToMessage___block_invoke(id *a1)
{
  void *v2;
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1E130]), "initWithBuilder:", &__block_literal_global_1028);
  v3 = a1[4];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__MFMailComposeController__originalContentOfMessagesInReplyToMessage___block_invoke_3;
  v5[3] = &unk_1E5A68908;
  objc_copyWeak(&v8, a1 + 6);
  v6 = a1[5];
  v7 = a1[4];
  v4 = (id)objc_msgSend(v3, "requestRepresentationWithOptions:completionHandler:", v2, v5);

  objc_destroyWeak(&v8);
}

void __70__MFMailComposeController__originalContentOfMessagesInReplyToMessage___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setRequestedRepresentation:", *MEMORY[0x1E0D1DBE0]);
  objc_msgSend(v2, "setNetworkUsage:", 0);
  objc_msgSend(v2, "setMaximumNumberOfOriginalContentMessagesToRequest:", 4);

}

void __70__MFMailComposeController__originalContentOfMessagesInReplyToMessage___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  os_signpost_id_t v9;
  void (**v10)(_QWORD, _QWORD);
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _BYTE buf[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(WeakRetained, "signpostID");
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1AB96A000, v8, OS_SIGNPOST_EVENT, v9, "LOAD MESSAGE ORIGINAL CONTENT", "Did complete message content representation request enableTelemetry=YES ", buf, 2u);
    }

    if (!v5 || v6)
    {
      if (v6)
      {
        v11 = v6;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D4D4B8], 1030, 0);
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v11;
      EMLogCompose();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v12, "ef_publicDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v14;
        _os_log_impl(&dword_1AB96A000, v13, OS_LOG_TYPE_DEFAULT, "[SmartReply] Message content representation request failed with error: %{public}@", buf, 0xCu);

      }
      objc_msgSend(a1[4], "finishWithError:", v12);

    }
    else
    {
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, WeakRetained);
      objc_msgSend(v5, "requestOriginalContentMessagesInReplyToContentItemBlock");
      v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __70__MFMailComposeController__originalContentOfMessagesInReplyToMessage___block_invoke_1029;
      v15[3] = &unk_1E5A688E0;
      objc_copyWeak(&v18, (id *)buf);
      v16 = a1[5];
      v17 = a1[4];
      ((void (**)(_QWORD, _QWORD *))v10)[2](v10, v15);

      objc_destroyWeak(&v18);
      objc_destroyWeak((id *)buf);
    }
  }

}

void __70__MFMailComposeController__originalContentOfMessagesInReplyToMessage___block_invoke_1029(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__MFMailComposeController__originalContentOfMessagesInReplyToMessage___block_invoke_2_1030;
  v10[3] = &unk_1E5A688B8;
  objc_copyWeak(&v15, a1 + 6);
  v7 = v5;
  v11 = v7;
  v8 = v6;
  v12 = v8;
  v13 = a1[4];
  v14 = a1[5];
  objc_msgSend(MEMORY[0x1E0D1F070], "mainThreadScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performBlock:", v10);

  objc_destroyWeak(&v15);
}

void __70__MFMailComposeController__originalContentOfMessagesInReplyToMessage___block_invoke_2_1030(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32) && !*(_QWORD *)(a1 + 40))
    {
      MFComposeLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v5 = objc_msgSend(*(id *)(a1 + 32), "count");
        objc_msgSend(*(id *)(a1 + 48), "ef_publicDescription");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 134349314;
        v10 = v5;
        v11 = 2114;
        v12 = v6;
        _os_log_impl(&dword_1AB96A000, v3, OS_LOG_TYPE_DEFAULT, "[SmartReply] Retrieved %{public}lu original contents for message: %{public}@", (uint8_t *)&v9, 0x16u);

      }
    }
    else
    {
      MFComposeLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 48), "ef_publicDescription");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138543362;
        v10 = (uint64_t)v4;
        _os_log_impl(&dword_1AB96A000, v3, OS_LOG_TYPE_DEFAULT, "[SmartReply] Failed to retrieve plain text for message: %{public}@", (uint8_t *)&v9, 0xCu);

      }
    }

    objc_msgSend(*(id *)(a1 + 56), "finishWithResult:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    +[MFMailComposeController signpostLog](MFMailComposeController, "signpostLog");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(WeakRetained, "signpostID");
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      LOWORD(v9) = 0;
      _os_signpost_emit_with_name_impl(&dword_1AB96A000, v7, OS_SIGNPOST_INTERVAL_END, v8, "LOAD MESSAGE ORIGINAL CONTENT", "End loading message original content enableTelemetry=YES ", (uint8_t *)&v9, 2u);
    }

  }
}

- (void)expandQuickReplyToFullCompose
{
  -[MFMailComposeController expandQuickReplyToFullComposeAndPerformAction:additionalUserInfo:](self, "expandQuickReplyToFullComposeAndPerformAction:additionalUserInfo:", 0, 0);
}

- (void)expandQuickReplyToFullComposeAndPerformAction:(int64_t)a3 additionalUserInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, int);
  void *v11;
  id v12;
  id v13[2];
  id location;

  v6 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __92__MFMailComposeController_expandQuickReplyToFullComposeAndPerformAction_additionalUserInfo___block_invoke;
  v11 = &unk_1E5A68958;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a3;
  v7 = v6;
  v12 = v7;
  -[MFMailComposeController setDidSaveQuickReplyDraftHandler:](self, "setDidSaveQuickReplyDraftHandler:", &v8);
  -[MFMailComposeController _draftContentDidChange](self, "_draftContentDidChange", v8, v9, v10, v11);
  -[MFMailComposeController backUpDraft](self, "backUpDraft");

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);

}

void __92__MFMailComposeController_expandQuickReplyToFullComposeAndPerformAction_additionalUserInfo___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
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
  void *v15;
  id v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && a2)
  {
    v16 = WeakRetained;
    objc_msgSend(WeakRetained, "userActivity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v16, "autosaveIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D46C58]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D46C60]);

    objc_msgSend(v7, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0D46C68]);
    objc_msgSend(v5, "setUserInfo:", v7);
    v10 = v8;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    MSMailComposeWindowTargetContentIdentifierWithIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTargetContentIdentifier:", v11);

    if (!v8)
    {

    }
    objc_msgSend(v16, "mailComposeView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstResponder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resignFirstResponder");

    objc_msgSend(v16, "quickReplyDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "userActivity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mailComposeController:migrateToFullCompose:", v16, v15);

    WeakRetained = v16;
  }

}

- (void)_performDeferredActionIfNecessary
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MFMailComposeController compositionContext](self, "compositionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deferredAction");

  -[MFMailComposeController compositionContext](self, "compositionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeferredAction:", 0);

  -[MFMailComposeController compositionContext](self, "compositionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deferredActionUserInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFMailComposeController compositionContext](self, "compositionContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDeferredActionUserInfo:", 0);

  if (v4)
  {
    EMLogCompose();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134349056;
      v15 = v4;
      _os_log_impl(&dword_1AB96A000, v9, OS_LOG_TYPE_DEFAULT, "Will perform delayed action: %{public}ld", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D46C70]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D46C88]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4 == 1)
    {
      -[MFMailComposeController mailComposeView](self, "mailComposeView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "composeWebView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "becomeFirstResponder");

      -[MFMailComposeController setCaretPosition:](self, "setCaretPosition:", objc_msgSend(v10, "unsignedIntValue"));
    }
    else if (v4 != 2)
    {
      goto LABEL_9;
    }
    -[MFMailComposeController _updateAndStartCompletingCcFieldWithMissingRecipients:](self, "_updateAndStartCompletingCcFieldWithMissingRecipients:", v11);
LABEL_9:

  }
}

- (void)takeSnapshotWithCompletionHandler:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFMailComposeController composeWebView](self, "composeWebView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "takeSnapshotWithConfiguration:completionHandler:", 0, v5);

}

- (void)_performBlockWithStrongComposeCoordinator:(id)a3
{
  id WeakRetained;
  void (**v5)(id, id);

  v5 = (void (**)(id, id))a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_composeCoordinator);
  if (WeakRetained)
    v5[2](v5, WeakRetained);

}

- (BOOL)_canUseOrnamentViewController
{
  void *v2;

  -[MFMailComposeController composeCoordinator](self, "composeCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2 == 0;
}

- (id)delegate
{
  return objc_loadWeakRetained(&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate, a3);
}

- (id)remoteViewControllerProxy
{
  return self->_remoteViewControllerProxy;
}

- (void)setRemoteViewControllerProxy:(id)a3
{
  objc_storeStrong(&self->_remoteViewControllerProxy, a3);
}

- (CNContactPickerViewController)peoplePicker
{
  return self->_peoplePicker;
}

- (CNComposeRecipientAtom)atomPresentingCard
{
  return self->_atomPresentingCard;
}

- (void)setAtomPresentingCard:(id)a3
{
  objc_storeStrong((id *)&self->_atomPresentingCard, a3);
}

- (CNComposeRecipient)recipientPresentingCard
{
  return self->_recipientPresentingCard;
}

- (void)setRecipientPresentingCard:(id)a3
{
  objc_storeStrong((id *)&self->_recipientPresentingCard, a3);
}

- (NSDictionary)certificatesByRecipient
{
  return self->_certificatesByRecipient;
}

- (void)setCertificatesByRecipient:(id)a3
{
  objc_storeStrong((id *)&self->_certificatesByRecipient, a3);
}

- (NSDictionary)errorsByRecipient
{
  return self->_errorsByRecipient;
}

- (void)setErrorsByRecipient:(id)a3
{
  objc_storeStrong((id *)&self->_errorsByRecipient, a3);
}

- (NSString)addressForMissingIdentity
{
  return self->_addressForMissingIdentity;
}

- (void)setAddressForMissingIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1304);
}

- (EMMessage)lastDraftMessage
{
  return self->_lastDraftMessage;
}

- (MFOutgoingMessageDelivery)delivery
{
  return self->_delivery;
}

- (BOOL)isModal
{
  return self->_isModal;
}

- (NSDate)autosavedDate
{
  return self->_autosavedDate;
}

- (MFMailComposeControllerQuickReplyDelegate)quickReplyDelegate
{
  return (MFMailComposeControllerQuickReplyDelegate *)objc_loadWeakRetained((id *)&self->_quickReplyDelegate);
}

- (void)setQuickReplyDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_quickReplyDelegate, a3);
}

- (MFMailComposeControllerQuickReplyActionButtonProvider)quickReplyActionButtonProvider
{
  return (MFMailComposeControllerQuickReplyActionButtonProvider *)objc_loadWeakRetained((id *)&self->_quickReplyActionButtonProvider);
}

- (void)setQuickReplyActionButtonProvider:(id)a3
{
  objc_storeWeak((id *)&self->_quickReplyActionButtonProvider, a3);
}

- (MFMailAccountProxyGenerator)accountProxyGenerator
{
  return self->_accountProxyGenerator;
}

- (void)setAccountProxyGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_accountProxyGenerator, a3);
}

- (EMMailboxObjectID)draftMailboxObjectID
{
  return self->_draftMailboxObjectID;
}

- (NSString)originatingBundleID
{
  return self->_originatingBundleID;
}

- (void)setOriginatingBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1608);
}

- (int)sourceAccountManagement
{
  return self->_sourceAccountManagement;
}

- (void)setSourceAccountManagement:(int)a3
{
  self->_sourceAccountManagement = a3;
}

- (BOOL)useMailDrop
{
  return self->_useMailDrop;
}

- (void)setUseMailDrop:(BOOL)a3
{
  self->_useMailDrop = a3;
}

- (BOOL)autosaveIsValid
{
  return self->_autosaveIsValid;
}

- (void)setAutosaveIsValid:(BOOL)a3
{
  self->_autosaveIsValid = a3;
}

- (BOOL)didUseOmittedAttachmentsOrRecipients
{
  return self->_didUseOmittedAttachmentsOrRecipients;
}

- (void)setDidUseOmittedAttachmentsOrRecipients:(BOOL)a3
{
  self->_didUseOmittedAttachmentsOrRecipients = a3;
}

- (MFMailComposeCoordinator)composeCoordinator
{
  return (MFMailComposeCoordinator *)objc_loadWeakRetained((id *)&self->_composeCoordinator);
}

- (void)setComposeCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_composeCoordinator, a3);
}

- (EMCoreAnalyticsCollector)analyticsCollector
{
  return self->_analyticsCollector;
}

- (UIAlertController)popoverAlert
{
  return self->_popoverAlert;
}

- (void)setPopoverAlert:(id)a3
{
  objc_storeStrong((id *)&self->_popoverAlert, a3);
}

- (CNContactViewController)contactViewController
{
  return self->_contactViewController;
}

- (void)setContactViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contactViewController, a3);
}

- (void)setSmimeStatusControl:(id)a3
{
  objc_storeStrong((id *)&self->_smimeStatusControl, a3);
}

- (BOOL)attachmentToMarkupIsLoaded
{
  return self->_attachmentToMarkupIsLoaded;
}

- (void)setAttachmentToMarkupIsLoaded:(BOOL)a3
{
  self->_attachmentToMarkupIsLoaded = a3;
}

- (BOOL)delayToShowMarkupHasPassed
{
  return self->_delayToShowMarkupHasPassed;
}

- (void)setDelayToShowMarkupHasPassed:(BOOL)a3
{
  self->_delayToShowMarkupHasPassed = a3;
}

- (unint64_t)markupReplyAttachmentLoadingProgress
{
  return self->_markupReplyAttachmentLoadingProgress;
}

- (void)setMarkupReplyAttachmentLoadingProgress:(unint64_t)a3
{
  self->_markupReplyAttachmentLoadingProgress = a3;
}

- (NSArray)initialMissingAttachmentWarnings
{
  return self->_initialMissingAttachmentWarnings;
}

- (void)setInitialMissingAttachmentWarnings:(id)a3
{
  objc_storeStrong((id *)&self->_initialMissingAttachmentWarnings, a3);
}

- (NSMutableSet)drawingFileAttachments
{
  return self->_drawingFileAttachments;
}

- (void)setDrawingFileAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_drawingFileAttachments, a3);
}

- (NSString)hideMyEmailAddressIfExists
{
  return self->_hideMyEmailAddressIfExists;
}

- (void)setHideMyEmailAddressIfExists:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1680);
}

- (NSString)hideMyEmailSenderAddress
{
  return self->_hideMyEmailSenderAddress;
}

- (void)setHideMyEmailSenderAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1688);
}

- (BOOL)hideMyEmailMultipleRecipient
{
  return self->_hideMyEmailMultipleRecipient;
}

- (void)setHideMyEmailMultipleRecipient:(BOOL)a3
{
  self->_hideMyEmailMultipleRecipient = a3;
}

- (BOOL)hasPresentedSenderCollaborationAlert
{
  return self->_hasPresentedSenderCollaborationAlert;
}

- (void)setHasPresentedSenderCollaborationAlert:(BOOL)a3
{
  self->_hasPresentedSenderCollaborationAlert = a3;
}

- (BOOL)hasAddedEditableHyperlink
{
  return self->_hasAddedEditableHyperlink;
}

- (EFScheduler)autosaveQueue
{
  return self->_autosaveQueue;
}

- (void)setAutosaveQueue:(id)a3
{
  objc_storeStrong((id *)&self->_autosaveQueue, a3);
}

- (MSAutosaveSession)autosaveSession
{
  return self->_autosaveSession;
}

- (void)setAutosaveSession:(id)a3
{
  objc_storeStrong((id *)&self->_autosaveSession, a3);
}

- (VNDocumentCameraViewController)documentCameraViewController
{
  return (VNDocumentCameraViewController *)objc_loadWeakRetained((id *)&self->_documentCameraViewController);
}

- (void)setDocumentCameraViewController:(id)a3
{
  objc_storeWeak((id *)&self->_documentCameraViewController, a3);
}

- (MFComposeDisplayMetrics)displayMetrics
{
  return self->_displayMetrics;
}

- (MFPhotoPickerProgressManager)photoPickerProgressManager
{
  return self->_photoPickerProgressManager;
}

- (void)setPhotoPickerProgressManager:(id)a3
{
  objc_storeStrong((id *)&self->_photoPickerProgressManager, a3);
}

- (double)previousPaletteWidth
{
  return self->_previousPaletteWidth;
}

- (void)setPreviousPaletteWidth:(double)a3
{
  self->_previousPaletteWidth = a3;
}

- (EFScheduler)prepareImagesForSendScheduler
{
  return self->_prepareImagesForSendScheduler;
}

- (id)didSaveQuickReplyDraftHandler
{
  return self->_didSaveQuickReplyDraftHandler;
}

- (void)setDidSaveQuickReplyDraftHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1752);
}

- (EFCancelable)messageLoadingTailspinCancellable
{
  return self->_messageLoadingTailspinCancellable;
}

- (void)setMessageLoadingTailspinCancellable:(id)a3
{
  objc_storeStrong((id *)&self->_messageLoadingTailspinCancellable, a3);
}

- (int64_t)currentlyLoadingCounter
{
  return self->_currentlyLoadingCounter;
}

- (void)setCurrentlyLoadingCounter:(int64_t)a3
{
  self->_currentlyLoadingCounter = a3;
}

- (BOOL)hasMessageBodyContent
{
  return self->_hasMessageBodyContent;
}

- (void)setHasMessageBodyContent:(BOOL)a3
{
  self->_hasMessageBodyContent = a3;
}

- (NSNumber)hasCustomSignature
{
  return self->_hasCustomSignature;
}

- (void)setHasCustomSignature:(id)a3
{
  objc_storeStrong((id *)&self->_hasCustomSignature, a3);
}

- (EFFuture)originalContentMessagesFuture
{
  return self->_originalContentMessagesFuture;
}

- (void)setOriginalContentMessagesFuture:(id)a3
{
  objc_storeStrong((id *)&self->_originalContentMessagesFuture, a3);
}

- (EFScheduler)originalContentMessagesScheduler
{
  return self->_originalContentMessagesScheduler;
}

- (void)setOriginalContentMessagesScheduler:(id)a3
{
  objc_storeStrong((id *)&self->_originalContentMessagesScheduler, a3);
}

- (EFDebouncer)inputContextHistoryInvalidationDebouncer
{
  return self->_inputContextHistoryInvalidationDebouncer;
}

- (void)setInputContextHistoryInvalidationDebouncer:(id)a3
{
  objc_storeStrong((id *)&self->_inputContextHistoryInvalidationDebouncer, a3);
}

- (BOOL)hasActiveWritingToolsSession
{
  return self->_hasActiveWritingToolsSession;
}

- (void)setHasActiveWritingToolsSession:(BOOL)a3
{
  self->_hasActiveWritingToolsSession = a3;
}

- (_TtC9MessageUI20MessageUITipsManager)tipsManager
{
  return self->_tipsManager;
}

- (void)setTipsManager:(id)a3
{
  objc_storeStrong((id *)&self->_tipsManager, a3);
}

- (MFComposeStyleSelectorViewController)styleSelector
{
  return self->_styleSelector;
}

- (void)setStyleSelector:(id)a3
{
  objc_storeStrong((id *)&self->_styleSelector, a3);
}

- (NSDictionary)fontAttributes
{
  return self->_fontAttributes;
}

- (void)setFontAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_fontAttributes, a3);
}

- (QLPreviewController)previewController
{
  return (QLPreviewController *)objc_loadWeakRetained((id *)&self->_previewController);
}

- (void)setPreviewController:(id)a3
{
  objc_storeWeak((id *)&self->_previewController, a3);
}

- (MFAttachment)previewingAttachment
{
  return self->_previewingAttachment;
}

- (void)setPreviewingAttachment:(id)a3
{
  objc_storeStrong((id *)&self->_previewingAttachment, a3);
}

- (BOOL)insertingDrawing
{
  return self->_insertingDrawing;
}

- (void)setInsertingDrawing:(BOOL)a3
{
  self->_insertingDrawing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewingAttachment, 0);
  objc_destroyWeak((id *)&self->_previewController);
  objc_storeStrong((id *)&self->_fontAttributes, 0);
  objc_storeStrong((id *)&self->_styleSelector, 0);
  objc_storeStrong((id *)&self->_tipsManager, 0);
  objc_storeStrong((id *)&self->_inputContextHistoryInvalidationDebouncer, 0);
  objc_storeStrong((id *)&self->_originalContentMessagesScheduler, 0);
  objc_storeStrong((id *)&self->_originalContentMessagesFuture, 0);
  objc_storeStrong((id *)&self->_hasCustomSignature, 0);
  objc_storeStrong((id *)&self->_messageLoadingTailspinCancellable, 0);
  objc_storeStrong(&self->_didSaveQuickReplyDraftHandler, 0);
  objc_storeStrong((id *)&self->_prepareImagesForSendScheduler, 0);
  objc_storeStrong((id *)&self->_photoPickerProgressManager, 0);
  objc_storeStrong((id *)&self->_displayMetrics, 0);
  objc_destroyWeak((id *)&self->_documentCameraViewController);
  objc_storeStrong((id *)&self->_autosaveSession, 0);
  objc_storeStrong((id *)&self->_autosaveQueue, 0);
  objc_storeStrong((id *)&self->_hideMyEmailSenderAddress, 0);
  objc_storeStrong((id *)&self->_hideMyEmailAddressIfExists, 0);
  objc_storeStrong((id *)&self->_drawingFileAttachments, 0);
  objc_storeStrong((id *)&self->_initialMissingAttachmentWarnings, 0);
  objc_storeStrong((id *)&self->_smimeStatusControl, 0);
  objc_storeStrong((id *)&self->_contactViewController, 0);
  objc_storeStrong((id *)&self->_popoverAlert, 0);
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
  objc_destroyWeak((id *)&self->_composeCoordinator);
  objc_storeStrong((id *)&self->_originatingBundleID, 0);
  objc_storeStrong((id *)&self->_draftMailboxObjectID, 0);
  objc_storeStrong((id *)&self->_accountProxyGenerator, 0);
  objc_destroyWeak((id *)&self->_quickReplyActionButtonProvider);
  objc_destroyWeak((id *)&self->_quickReplyDelegate);
  objc_storeStrong((id *)&self->_recipientPresentingCard, 0);
  objc_destroyWeak(&self->_delegate);
  objc_destroyWeak((id *)&self->_containingWindow);
  objc_storeStrong((id *)&self->_content, 0);
  objc_destroyWeak((id *)&self->_savedFirstResponder);
  objc_storeStrong((id *)&self->_signatureController, 0);
  objc_storeStrong(&self->_releaseActiveFocusedState, 0);
  objc_storeStrong((id *)&self->_undoMoveAction, 0);
  objc_storeStrong((id *)&self->_securityScopes, 0);
  objc_storeStrong((id *)&self->_lastActiveDate, 0);
  objc_storeStrong((id *)&self->_autosavedDate, 0);
  objc_storeStrong((id *)&self->_autosaveTimer, 0);
  objc_storeStrong((id *)&self->_imageScalingGroup, 0);
  objc_storeStrong((id *)&self->_LANHandoffAgent, 0);
  objc_storeStrong((id *)&self->_progressIndicatorView, 0);
  objc_storeStrong((id *)&self->_handoffProgressView, 0);
  objc_storeStrong((id *)&self->_handoffOperation, 0);
  objc_storeStrong((id *)&self->_notifyConfirmation, 0);
  objc_storeStrong((id *)&self->_addressPickerReformatter, 0);
  objc_storeStrong((id *)&self->_addressForMissingIdentity, 0);
  objc_storeStrong((id *)&self->_errorsByRecipient, 0);
  objc_storeStrong((id *)&self->_certificatesByRecipient, 0);
  objc_storeStrong((id *)&self->_secureCompositionManager, 0);
  objc_storeStrong((id *)&self->_documentID, 0);
  objc_storeStrong((id *)&self->_autosaveIdentifier, 0);
  objc_storeStrong((id *)&self->_autosaveLock, 0);
  objc_storeStrong((id *)&self->_initialTitle, 0);
  objc_storeStrong((id *)&self->_lastDraftMessage, 0);
  objc_storeStrong((id *)&self->_savedHeaders, 0);
  objc_storeStrong((id *)&self->_delivery, 0);
  objc_storeStrong((id *)&self->_popoverManager, 0);
  objc_storeStrong((id *)&self->_recentRecipientPresentingCard, 0);
  objc_storeStrong((id *)&self->_composeWebView, 0);
  objc_storeStrong((id *)&self->_imageSizeField, 0);
  objc_storeStrong((id *)&self->_subjectField, 0);
  objc_storeStrong((id *)&self->_atomPresentingCard, 0);
  objc_storeStrong((id *)&self->_lastFocusedRecipientView, 0);
  objc_storeStrong((id *)&self->_ccField, 0);
  objc_storeStrong((id *)&self->_toField, 0);
  objc_storeStrong((id *)&self->_systemImagePickerController, 0);
  objc_storeStrong((id *)&self->_cameraPickerController, 0);
  objc_storeStrong((id *)&self->_systemPhotosPickerController, 0);
  objc_storeStrong((id *)&self->_photosPickerController, 0);
  objc_storeStrong((id *)&self->_peoplePicker, 0);
  objc_storeStrong((id *)&self->_sendAccessoryButton, 0);
  objc_storeStrong((id *)&self->_sendLaterButtonItem, 0);
  objc_storeStrong((id *)&self->_closeButtonItem, 0);
  objc_storeStrong((id *)&self->_sendButtonItem, 0);
  objc_storeStrong((id *)&self->_alternateTitleView, 0);
  objc_storeStrong((id *)&self->_sendingEmailAddress, 0);
  objc_storeStrong((id *)&self->_primaryAddressForForcedSendingAccount, 0);
  objc_storeStrong((id *)&self->_originalSendingEmailAddress, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_originalBccAddresses, 0);
  objc_storeStrong((id *)&self->_bccAddresses, 0);
  objc_storeStrong((id *)&self->_ccAddresses, 0);
  objc_storeStrong((id *)&self->_toAddresses, 0);
  objc_storeStrong((id *)&self->_compositionContext, 0);
  objc_storeStrong(&self->_remoteViewControllerProxy, 0);
}

- (void)markupAttachment:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_1AB96A000, v0, v1, "Attachment markup failed since itemDataProvider.item is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __74__MFMailComposeController_documentCameraViewController_didFinishWithScan___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, v3, (uint64_t)v3, "#CompositionServices Unable to convert scanned document to PDF document: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

- (void)_insertDrawingFromExternalURL:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, v3, (uint64_t)v3, "#Attachments Error unable to copy file: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

- (void)_insertDrawingFromExternalURL:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, v3, (uint64_t)v3, "#Attachments Error unable to create temp directory: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

- (void)_deleteFileAtURLIfInTmp:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSObject *v6;
  uint8_t *v7;

  OUTLINED_FUNCTION_3_2((uint64_t)a1, a2, 5.7779e-34);
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, v6, (uint64_t)v6, "#CompositionServices Error while deleting temporary file at path: %@", v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)_checkForInvalidAddressesWithContinuation:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_8((uint64_t)a1, a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_1_0(&dword_1AB96A000, "<%{public}@: %p> Abort send -- found invalid recipient address", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

- (void)_checkForEmptySubjectWithContinuation:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_8((uint64_t)a1, a2, a3, 5.8382e-34);
  OUTLINED_FUNCTION_1_0(&dword_1AB96A000, "<%{public}@: %p> Abort send -- Subject is empty", v4, v5);

  OUTLINED_FUNCTION_2_0();
}

void __91__MFMailComposeController__checkForOmittedRecipientsOrAttachmentsIfNeededWithContinuation___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, v0, v1, "Unable to identify warnings error: %@.", v2);
  OUTLINED_FUNCTION_4();
}

void __70__MFMailComposeController__checkForShareParticipantsWithContinuation___block_invoke_702_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, v0, v1, "Error occurred while adding participants to share: %{public}@", v2);
  OUTLINED_FUNCTION_4();
}

- (void)handleLargeMessageComposeHandoffWithInputStream:outputStream:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, v3, (uint64_t)v3, "#Hand-Off Error getting compose handoff streams: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

- (void)userActivity:didReceiveInputStream:outputStream:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_1AB96A000, v0, v1, "#Hand-Off Failed to get message data for stream handoff", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)activityHandoffOperation:didFinishReceivingData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_4(&dword_1AB96A000, v0, v1, "#Hand-Off No draft data received from activity handoff operation.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)activityHandoffOperation:didFailWithError:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_2(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, v3, (uint64_t)v3, "#Hand-Off Delegate; error continuing: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

- (void)_configureSender:asSourceForPopoverPresentationController:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_1AB96A000, v0, v1, "#CompositionServices Attempted to configure a source popover against unsupported sender %@", v2);
  OUTLINED_FUNCTION_4();
}

@end
