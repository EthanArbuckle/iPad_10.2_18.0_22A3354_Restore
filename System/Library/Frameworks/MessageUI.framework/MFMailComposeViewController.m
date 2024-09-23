@implementation MFMailComposeViewController

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__MFMailComposeViewController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_4 != -1)
    dispatch_once(&log_onceToken_4, block);
  return (id)log_log_4;
}

void __34__MFMailComposeViewController_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_4;
  log_log_4 = (uint64_t)v1;

}

- (MFMailComposeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[MFMailComposeViewController initWithURL:](self, "initWithURL:", 0, a4);
}

- (MFMailComposeViewController)initWithURL:(id)a3
{
  return -[MFMailComposeViewController initWithURL:sourceAccountManagement:](self, "initWithURL:sourceAccountManagement:", a3, 1);
}

- (MFMailComposeViewController)initWithURL:(id)a3 sourceAccountManagement:(int)a4
{
  uint64_t v4;
  id v6;
  MFMailComposeViewController *v7;
  MFMailComposeInternalViewController *v8;
  MFMailComposeInternalViewController *v9;
  MFMailComposeViewController *v10;
  NSObject *v11;
  objc_super v13;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if ((objc_msgSend((id)objc_opt_class(), "canSendMailSourceAccountManagement:", v4) & 1) != 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)MFMailComposeViewController;
    v7 = -[MFMailComposeViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
    if (v7)
    {
      if (objc_msgSend(MEMORY[0x1E0DC3708], "mf_isPad"))
        -[MFMailComposeViewController setModalPresentationStyle:](v7, "setModalPresentationStyle:", 1);
      v8 = objc_alloc_init(MFMailComposeInternalViewController);
      v9 = v8;
      if (v6)
        -[MFMailComposeInternalViewController setURL:](v8, "setURL:", v6);
      -[MFMailComposeViewController pushViewController:animated:](v7, "pushViewController:animated:", v9, 0);
      objc_storeStrong(&v7->_internal, v9);
      -[MFMailComposeViewController setSourceAccountManagement:](v7, "setSourceAccountManagement:", v4);

    }
    self = v7;
    v10 = self;
  }
  else
  {
    +[MFMailComposeViewController log](MFMailComposeViewController, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MFMailComposeViewController initWithURL:sourceAccountManagement:].cold.1(v11);

    v10 = 0;
  }

  return v10;
}

- (id)_internalViewController
{
  return self->_internal;
}

- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers
{
  return 1;
}

- (void)__viewControllerWillBePresented:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFMailComposeViewController;
  -[MFMailComposeViewController __viewControllerWillBePresented:](&v4, sel___viewControllerWillBePresented_, a3);
  -[MFMailComposeViewController finalizeCompositionValues](self, "finalizeCompositionValues");
}

- (void)viewWillAppear:(BOOL)a3
{
  void (**setupAnimationBlock)(void);
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFMailComposeViewController;
  -[MFMailComposeViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[MFMailComposeViewController finalizeCompositionValues](self, "finalizeCompositionValues");
  setupAnimationBlock = (void (**)(void))self->_setupAnimationBlock;
  if (setupAnimationBlock)
  {
    setupAnimationBlock[2]();
    v5 = self->_setupAnimationBlock;
    self->_setupAnimationBlock = 0;

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFMailComposeViewController;
  -[MFMailComposeViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  if (-[MFMailComposeViewController isBeingDismissed](self, "isBeingDismissed"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__MFMailComposeViewController_viewWillDisappear___block_invoke;
    block[3] = &unk_1E5A65480;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __49__MFMailComposeViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MFMailComposeViewControllerIsBeingDismissed"), *(_QWORD *)(a1 + 32));

}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

+ (BOOL)canSendMail
{
  return objc_msgSend(a1, "canSendMailSourceAccountManagement:", 1);
}

+ (BOOL)canSendMailSourceAccountManagement:(int)a3
{
  return MSCanSendMailWithOptions();
}

- (id)mailComposeDelegate
{
  void *v2;
  void *v3;

  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mailComposeDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setMailComposeDelegate:(id)mailComposeDelegate
{
  void *v4;
  id v5;

  v5 = mailComposeDelegate;
  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMailComposeDelegate:", v5);

}

- (void)setSubject:(NSString *)subject
{
  void *v4;
  NSString *v5;

  v5 = subject;
  -[MFMailComposeViewController _impl](self, "_impl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubject:", v5);

}

- (id)_validEmailAddressesFromArray:(id)a3
{
  id v3;
  uint64_t v4;
  __int128 v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (!v4)
  {

LABEL_17:
    v11 = v3;
    v6 = 0;
    goto LABEL_18;
  }
  v6 = 0;
  v7 = *(_QWORD *)v16;
  *(_QWORD *)&v5 = 138412290;
  v14 = v5;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v16 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
      if ((objc_msgSend(v9, "ea_isLegalCommentedEmailAddress", v14, (_QWORD)v15) & 1) == 0)
      {
        +[MFMailComposeViewController log](MFMailComposeViewController, "log");
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v14;
          v20 = v9;
          _os_log_error_impl(&dword_1AB96A000, v10, OS_LOG_TYPE_ERROR, "%@ is not a valid email address.", buf, 0xCu);
        }

        if (!v6)
          v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend(v6, "addObject:", v9);
      }
    }
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  }
  while (v4);

  if (!v6)
    goto LABEL_17;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectsInArray:", v12);

LABEL_18:
  return v11;
}

- (void)setToRecipients:(NSArray *)toRecipients
{
  void *v4;
  id v5;

  -[MFMailComposeViewController _validEmailAddressesFromArray:](self, "_validEmailAddressesFromArray:", toRecipients);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    -[MFMailComposeViewController _impl](self, "_impl");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setToRecipients:", v5);

  }
}

- (void)setCcRecipients:(NSArray *)ccRecipients
{
  void *v4;
  void *v5;
  NSArray *v6;

  v6 = ccRecipients;
  -[MFMailComposeViewController _validEmailAddressesFromArray:](self, "_validEmailAddressesFromArray:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[MFMailComposeViewController _impl](self, "_impl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCcRecipients:", v6);

  }
}

- (void)setBccRecipients:(NSArray *)bccRecipients
{
  void *v4;
  void *v5;
  NSArray *v6;

  v6 = bccRecipients;
  -[MFMailComposeViewController _validEmailAddressesFromArray:](self, "_validEmailAddressesFromArray:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[MFMailComposeViewController _impl](self, "_impl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBccRecipients:", v6);

  }
}

- (void)setMessageBody:(NSString *)body isHTML:(BOOL)isHTML
{
  _BOOL8 v4;
  void *v6;
  NSString *v7;

  v4 = isHTML;
  v7 = body;
  -[MFMailComposeViewController _impl](self, "_impl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMessageBody:isHTML:", v7, v4);

}

- (void)setHideMyEmailFrom:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFMailComposeViewController _impl](self, "_impl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHideMyEmailFrom:", v5);

}

- (void)addAttachmentData:(NSData *)attachment mimeType:(NSString *)mimeType fileName:(NSString *)filename
{
  NSString *v8;
  NSString *v9;
  void *v10;
  id v11;
  NSData *v12;

  v12 = attachment;
  v8 = mimeType;
  v9 = filename;
  -[MFMailComposeViewController _impl](self, "_impl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "addAttachmentData:mimeType:fileName:", v12, v8, v9);

}

- (void)setPreferredSendingEmailAddress:(NSString *)emailAddress
{
  NSString *v4;
  NSObject *v5;

  v4 = emailAddress;
  if ((-[NSString ea_isLegalCommentedEmailAddress](v4, "ea_isLegalCommentedEmailAddress") & 1) != 0)
  {
    -[MFMailComposeViewController _impl](self, "_impl");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject setPreferredSendingEmailAddress:](v5, "setPreferredSendingEmailAddress:", v4);
  }
  else
  {
    +[MFMailComposeViewController log](MFMailComposeViewController, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[MFMailComposeViewController setPreferredSendingEmailAddress:].cold.1((uint64_t)v4, v5);
  }

}

- (void)setUTITypes:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUTITypes:", v5);

}

- (id)UTITypes
{
  void *v2;
  void *v3;

  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UTITypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setPhotoIDs:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPhotoIDs:", v5);

}

- (id)photoIDs
{
  void *v2;
  void *v3;

  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setCloudPhotoIDs:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCloudPhotoIDs:", v5);

}

- (id)cloudPhotoIDs
{
  void *v2;
  void *v3;

  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudPhotoIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setContentText:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentText:", v5);

}

- (id)contentText
{
  void *v2;
  void *v3;

  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setContentURLs:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentURLs:", v5);

}

- (id)contentURLs
{
  void *v2;
  void *v3;

  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentURLs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setShareSheetSessionID:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShareSheetSessionID:", v5);

}

- (id)shareSheetSessionID
{
  void *v2;
  void *v3;

  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shareSheetSessionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_addAttachmentWithFileURL:(id)a3 mimeType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAttachmentFileURL:mimeType:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_addAttachmentItemProvider:(id)a3 mimeType:(id)a4 fileName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAttachmentItemProvider:mimeType:fileName:", v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (unint64_t)maximumAttachmentSize
{
  return objc_msgSend(MEMORY[0x1E0D4D508], "currentMessageLimit");
}

- (void)currentAttachmentLimitWithHandler:(id)a3
{
  void (**v3)(id, uint64_t);

  v3 = (void (**)(id, uint64_t))a3;
  v3[2](v3, objc_msgSend(MEMORY[0x1E0D4D508], "currentMessageLimit"));

}

+ (BOOL)isMailDropConfigured
{
  return objc_msgSend(MEMORY[0x1E0D4D508], "mailDropConfigured");
}

- (void)requestFramesForAttachmentsWithIdentifiers:(id)a3 resultHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestFramesForAttachmentsWithIdentifiers:resultHandler:", v8, v6);

}

- (void)setKeyboardVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowKeyboardImmediately:", v3);

}

- (void)setContentVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentVisible:", v3);

}

- (void)setSourceAccountManagement:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSourceAccountManagement:", v3);

}

- (id)_addContentVariationWithName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addContentVariationWithName:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_setDefaultContentVariation:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultContentVariation:", v5);

}

- (void)_setMessageBody:(id)a3 isHTML:(BOOL)a4 forContentVariation:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;

  v6 = a4;
  v8 = a3;
  v7 = a5;
  objc_msgSend(v7, "setBody:", v8);
  objc_msgSend(v7, "setBodyIsHTML:", v6);

}

- (void)_addAttachmentDataItemProvider:(id)a3 mimeType:(id)a4 fileName:(id)a5 forContentVariation:(id)a6
{
  void *v10;
  id v11;

  v11 = a6;
  -[MFMailComposeViewController _addAttachmentItemProvider:mimeType:fileName:](self, "_addAttachmentItemProvider:mimeType:fileName:", a3, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAttachmentIdentifier:", v10);

}

- (void)finalizeCompositionValues
{
  id v2;

  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finalizeCompositionValues");

}

- (void)addSetupAnimationBlock:(id)a3
{
  id v4;
  void *v5;
  id setupAnimationBlock;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_setupAnimationBlock)
    __assert_rtn("-[MFMailComposeViewController addSetupAnimationBlock:]", "MFMailComposeViewController.m", 416, "_setupAnimationBlock == NULL");
  v5 = _Block_copy(v4);
  setupAnimationBlock = self->_setupAnimationBlock;
  self->_setupAnimationBlock = v5;

}

- (void)setCaretPosition:(unint64_t)a3
{
  id v4;

  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCaretPosition:", a3);

}

- (void)_setCKShareURLWrapper:(id)a3 share:(id)a4 permissionType:(int64_t)a5 allowOthersToInvite:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  id v12;

  v6 = a6;
  v12 = a3;
  v10 = a4;
  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setCKShareURLWrapper:share:permissionType:allowOthersToInvite:", v12, v10, a5, v6);

}

- (void)_setCKShare:(id)a3 setupContainerInfo:(id)a4 permissionType:(int64_t)a5 allowOthersToInvite:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  id v12;

  v6 = a6;
  v12 = a3;
  v10 = a4;
  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setCKShare:setupContainerInfo:permissionType:allowOthersToInvite:", v12, v10, a5, v6);

}

+ (BOOL)_canSendMailInNewScene
{
  return +[MFMailComposeInternalViewController _canSendMailInNewScene](MFMailComposeInternalViewController, "_canSendMailInNewScene");
}

- (void)_presentComposeInNewWindowWithCompletion:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_presentComposeInNewWindowFromComposeViewController:completion:", self, v5);

}

+ (BOOL)hasAutosavedMessageWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D46AB0], "autosave");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasAutosavedMessageWithIdentifier:", v3);

  return v5;
}

- (void)recoverAutosavedMessageWithIdentifier:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutosaveIdentifier:", v5);

}

- (void)autosaveWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__MFMailComposeViewController_autosaveWithHandler___block_invoke;
  v7[3] = &unk_1E5A68B30;
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "autosaveWithHandler:", v7);

}

uint64_t __51__MFMailComposeViewController_autosaveWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)removeAutosavedMessageWithIdentifier:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D46AB0], "autosave");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAutosavedMessageWithIdentifier:", v4);

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  char v7;
  objc_super v9;

  if (objc_msgSend(MEMORY[0x1E0DC3708], "mf_isPad"))
  {
    -[MFMailComposeViewController parentViewController](self, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v7 = objc_msgSend(v5, "shouldAutorotateToInterfaceOrientation:", a3);
    else
      v7 = 1;

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MFMailComposeViewController;
    return -[MFMailComposeViewController shouldAutorotateToInterfaceOrientation:](&v9, sel_shouldAutorotateToInterfaceOrientation_, a3);
  }
  return v7;
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  void *v2;
  void *v3;

  -[MFMailComposeViewController _internalViewController](self, "_internalViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_UIRemoteViewController *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_setupAnimationBlock, 0);
  objc_storeStrong(&self->_internal, 0);
}

- (void)initWithURL:(os_log_t)log sourceAccountManagement:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AB96A000, log, OS_LOG_TYPE_ERROR, "Unable to initialize due to + [MFMailComposeViewController canSendMail] returns NO.", v1, 2u);
}

- (void)setPreferredSendingEmailAddress:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1AB96A000, a2, OS_LOG_TYPE_ERROR, "%{public}@ is not a valid email address.", (uint8_t *)&v2, 0xCu);
}

@end
