@implementation MFMessageComposeViewController

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__MFMessageComposeViewController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_7 != -1)
    dispatch_once(&log_onceToken_7, block);
  return (id)log_log_7;
}

void __37__MFMessageComposeViewController_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_7;
  log_log_7 = (uint64_t)v1;

}

+ (void)_setupAccountMonitor
{
  if (_setupAccountMonitor_accountMonitorToken != -1)
    dispatch_once(&_setupAccountMonitor_accountMonitorToken, &__block_literal_global_27);
}

void __54__MFMessageComposeViewController__setupAccountMonitor__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("MFMessageComposeViewController:%@#%@"), v6, v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)sMFListenerName;
  sMFListenerName = v3;

  objc_msgSend(MEMORY[0x1E0D20BE8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addListenerID:forService:", sMFListenerName, 1);

}

+ (BOOL)_canSendText
{
  return (MGGetBoolAnswer() & 1) != 0
      || +[MFMessageComposeViewController isiMessageEnabled](MFMessageComposeViewController, "isiMessageEnabled");
}

+ (BOOL)canSendSubject
{
  return +[MFMessageComposeViewController isMMSEnabled](MFMessageComposeViewController, "isMMSEnabled")
      || +[MFMessageComposeViewController isiMessageEnabled](MFMessageComposeViewController, "isiMessageEnabled");
}

+ (BOOL)canSendAttachments
{
  return +[MFMessageComposeViewController isMMSEnabled](MFMessageComposeViewController, "isMMSEnabled")
      || +[MFMessageComposeViewController isiMessageEnabled](MFMessageComposeViewController, "isiMessageEnabled");
}

+ (BOOL)isSupportedAttachmentUTI:(NSString *)uti
{
  void *v3;
  char v4;
  _QWORD *v5;

  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", uti);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[MFMessageComposeViewController isiMessageEnabled](MFMessageComposeViewController, "isiMessageEnabled"))
  {
    goto LABEL_2;
  }
  if (!+[MFMessageComposeViewController isMMSEnabled](MFMessageComposeViewController, "isMMSEnabled"))
  {
    v5 = (_QWORD *)MEMORY[0x1E0CEC610];
    goto LABEL_9;
  }
  if ((objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC450]) & 1) == 0
    && (objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC458]) & 1) == 0
    && (objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC638]) & 1) == 0)
  {
    v5 = (_QWORD *)MEMORY[0x1E0CEC520];
LABEL_9:
    v4 = objc_msgSend(v3, "conformsToType:", *v5);
    goto LABEL_10;
  }
LABEL_2:
  v4 = 1;
LABEL_10:

  return v4;
}

+ (void)_updateServiceAvailability
{
  uint64_t v2;
  unsigned int v3;
  void *v4;
  void *v5;
  id v6;

  v2 = sServiceAvailability;
  v3 = objc_msgSend(a1, "_canSendText");
  if (sServiceAvailability != v3)
  {
    sServiceAvailability = v3;
    if (v2 != -1)
    {
      v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", v3);
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v6, CFSTR("__kMFMessageComposeViewControllerTextMessageAvailabilityKey"), 0);
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("__kMFMessageComposeViewControllerTextMessageAvailabilityDidChangeNotification"), 0, v4);

    }
  }
}

+ (void)_startListeningForAvailabilityNotifications
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__MFMessageComposeViewController__startListeningForAvailabilityNotifications__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_startListeningForAvailabilityNotifications_listenerToken != -1)
    dispatch_once(&_startListeningForAvailabilityNotifications_listenerToken, block);
}

void __77__MFMessageComposeViewController__startListeningForAvailabilityNotifications__block_invoke(uint64_t a1)
{
  id v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  __CFString *name;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  name = (__CFString *)objc_msgSend(v2, "initWithFormat:", CFSTR("%@%@"), *MEMORY[0x1E0D27C90], *MEMORY[0x1E0D27CA8]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_SMSCapabilityChanged, name, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel__serviceAvailabilityChanged_, *MEMORY[0x1E0D20BE0], 0);

}

+ (BOOL)canSendText
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  BOOL v7;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectiveWhitelistedAppBundleIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "containsObject:", CFSTR("com.apple.MobileSMS")))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(a1, "_updateServiceAvailability");
    v6 = 1;
  }
  if (sServiceAvailability > 0)
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

+ (void)_preloadDependencies
{
  id v2;

  v2 = (id)objc_msgSend(a1, "_chatKitBundle");
}

+ (id)_chatKitBundle
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/ChatKit.framework"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "load");
  return v2;
}

+ (double)maxTrimDurationForAudio
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "_chatKitBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_msgSend(v2, "classNamed:", CFSTR("CKSMSComposeController")), "maxTrimDurationForAudio");
  v4 = v3;

  return v4;
}

+ (double)maxTrimDurationForVideo
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "_chatKitBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_msgSend(v2, "classNamed:", CFSTR("CKSMSComposeController")), "maxTrimDurationForVideo");
  v4 = v3;

  return v4;
}

+ (BOOL)canSendPhotos:(int)a3 videos:(int)a4 audioClips:(int)a5
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))softLinkIMSPIShareSheetCanSendMedia[0])(*(uint64_t *)&a3, *(uint64_t *)&a4, *(uint64_t *)&a5);
}

+ (void)initialize
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MFMessageComposeViewController_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __44__MFMessageComposeViewController_initialize__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupAccountMonitor");
}

- (MFMessageComposeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  MFMessageComposeViewController *v8;
  MFMessageComposeViewController *v9;
  void *v10;
  void *v11;
  MFMessageComposeViewController *v12;
  NSObject *v13;
  uint64_t v14;
  objc_super v16;
  uint8_t buf[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend((id)objc_opt_class(), "canSendText") & 1) != 0)
  {
    v16.receiver = self;
    v16.super_class = (Class)MFMessageComposeViewController;
    v8 = -[MFMessageComposeViewController initWithNibName:bundle:](&v16, sel_initWithNibName_bundle_, v6, v7);
    v9 = v8;
    if (v8)
    {
      -[MFMessageComposeViewController setPreferredPresentationStyle:](v8, "setPreferredPresentationStyle:", 1);
      objc_msgSend((id)objc_opt_class(), "_chatKitBundle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v10, "classNamed:", CFSTR("CKSMSComposeController"))), "initWithNavigationController:", v9);
      objc_msgSend(v11, "setDelegate:", v9);
      if ((dyld_program_sdk_at_least() & 1) == 0)
        -[MFMessageComposeViewController disableUserAttachments](v9, "disableUserAttachments");
      -[MFMessageComposeViewController pushViewController:animated:](v9, "pushViewController:animated:", v11, 0);
      -[MFMessageComposeViewController setCurrentAttachedVideoCount:](v9, "setCurrentAttachedVideoCount:", 0);
      -[MFMessageComposeViewController setCurrentAttachedAudioCount:](v9, "setCurrentAttachedAudioCount:", 0);
      -[MFMessageComposeViewController setCurrentAttachedImageCount:](v9, "setCurrentAttachedImageCount:", 0);

    }
    self = v9;
    v12 = self;
  }
  else
  {
    +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = objc_opt_class();
      -[MFMessageComposeViewController initWithNibName:bundle:].cold.1(v14, buf, v13);
    }

    v12 = 0;
  }

  return v12;
}

- (BOOL)canAddAttachmentURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  char v12;
  char v13;

  v4 = a3;
  if (objc_msgSend(v4, "isFileURL"))
  {
    -[MFMessageComposeViewController _MIMETypeForURL:](self, "_MIMETypeForURL:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_chatKitBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "classNamed:", CFSTR("CKSMSComposeController"));
    v8 = objc_msgSend(v7, "acceptsMIMEType:", v5);
    v9 = -[MFMessageComposeViewController _isVideoMIMEType:](self, "_isVideoMIMEType:", v5);
    v10 = -[MFMessageComposeViewController _isAudioMIMEType:](self, "_isAudioMIMEType:", v5);
    v11 = -[MFMessageComposeViewController _isImageMIMEType:](self, "_isImageMIMEType:", v5);
    if (v9 || v10 || v11)
      v12 = objc_msgSend(v7, "canSendPhotos:videos:audioClips:", (LODWORD(self->_currentAttachedImageCount) + v11), (LODWORD(self->_currentAttachedVideoCount) + v9), (LODWORD(self->_currentAttachedAudioCount) + v10));
    else
      v12 = 0;

    v13 = v8 & v12;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)attachmentURLs
{
  return 0;
}

- (id)mutableAttachmentURLs
{
  return 0;
}

- (id)_MIMETypeForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB39C0], "sharedMappings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "MIMETypeForExtension:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_contentTypeForMIMEType:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("/"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (BOOL)_isVideoMIMEType:(id)a3
{
  void *v3;
  char v4;

  -[MFMessageComposeViewController _contentTypeForMIMEType:](self, "_contentTypeForMIMEType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToIgnoringCase:", CFSTR("video"));

  return v4;
}

- (BOOL)_isAudioMIMEType:(id)a3
{
  void *v3;
  char v4;

  -[MFMessageComposeViewController _contentTypeForMIMEType:](self, "_contentTypeForMIMEType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToIgnoringCase:", CFSTR("audio"));

  return v4;
}

- (BOOL)_isImageMIMEType:(id)a3
{
  void *v3;
  char v4;

  -[MFMessageComposeViewController _contentTypeForMIMEType:](self, "_contentTypeForMIMEType:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToIgnoringCase:", CFSTR("image"));

  return v4;
}

- (BOOL)addAttachmentURL:(NSURL *)attachmentURL withAlternateFilename:(NSString *)alternateFilename
{
  NSURL *v6;
  NSString *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  BOOL v12;

  v6 = attachmentURL;
  v7 = alternateFilename;
  if (-[NSURL isFileURL](v6, "isFileURL")
    || (-[NSURL scheme](v6, "scheme"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("assets-library")),
        v8,
        (v9 & 1) != 0))
  {
    -[MFMessageComposeViewController topViewController](self, "topViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && objc_msgSend(v10, "insertAttachmentWithURL:andDescription:", v6, v7))
    {
      -[MFMessageComposeViewController _updateAttachmentCountForAttachmentURL:](self, "_updateAttachmentCountForAttachmentURL:", v6);
      v12 = 1;
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)addAttachmentData:(NSData *)attachmentData typeIdentifier:(NSString *)uti filename:(NSString *)filename
{
  NSData *v8;
  NSString *v9;
  NSString *v10;
  uint64_t v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = attachmentData;
  v9 = uti;
  v10 = filename;
  if (!v9)
    goto LABEL_7;
  v11 = -[NSString length](v9, "length");
  v12 = 0;
  if (!v8 || !v11)
    goto LABEL_10;
  if (!-[NSData length](v8, "length"))
  {
LABEL_7:
    v12 = 0;
    goto LABEL_10;
  }
  -[MFMessageComposeViewController topViewController](self, "topViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferredMIMEType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v13, "insertData:MIMEType:exportedFilename:", v8, v15, v10);

  }
  else
  {
    v12 = 0;
  }

LABEL_10:
  return v12;
}

- (BOOL)addAttachmentData:(id)a3 withAlternateFilename:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "length"))
  {
    -[MFMessageComposeViewController topViewController](self, "topViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB39C0], "sharedMappings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pathExtension");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "MIMETypeForExtension:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v8, "insertData:MIMEType:exportedFilename:", v6, v11, v7);
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)insertSharedItemAndReturnEntryViewFrame:(id)a3 withAlternateFilename:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MFMessageComposeViewController topViewController](self, "topViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __107__MFMessageComposeViewController_insertSharedItemAndReturnEntryViewFrame_withAlternateFilename_completion___block_invoke;
    v12[3] = &unk_1E5A692A8;
    v13 = v10;
    objc_msgSend(v11, "insertItemForSendingAndCalculateEntryViewFrame:withAlternateFilename:completion:", v8, v9, v12);

  }
}

void __107__MFMessageComposeViewController_insertSharedItemAndReturnEntryViewFrame_withAlternateFilename_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v3, "CGRectValue");
  (*(void (**)(uint64_t))(v4 + 16))(v4);

}

- (void)_insertCKSMSComposeFileDataForItemProvider:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7 outReturnResult:(BOOL *)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  BOOL v31;
  _QWORD v32[4];
  id v33;
  MFMessageComposeViewController *v34;
  id v35;
  id v36;
  id v37;
  BOOL *v38;
  BOOL v39;
  uint8_t buf[16];

  v9 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  -[MFMessageComposeViewController topViewController](self, "topViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_respondsToSelector();

  if ((v19 & 1) != 0)
  {
    +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AB96A000, v20, OS_LOG_TYPE_DEFAULT, "Calling new compose SPI with nil URL for spinner.", buf, 2u);
    }

    -[MFMessageComposeViewController topViewController](self, "topViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __171__MFMessageComposeViewController__insertCKSMSComposeFileDataForItemProvider_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_outReturnResult___block_invoke;
    v32[3] = &unk_1E5A69340;
    v33 = v14;
    v34 = self;
    v35 = v15;
    v36 = v16;
    v39 = v9;
    v37 = v17;
    v38 = a8;
    objc_msgSend(v21, "insertFileURLForCollaboration:collaborationShareOptions:metadata:sendAsCopyURL:isCollaboration:completionHandler:", 0, v35, v36, v37, v9, v32);

    v22 = v33;
LABEL_9:

    goto LABEL_10;
  }
  -[MFMessageComposeViewController topViewController](self, "topViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_opt_respondsToSelector();

  if ((v24 & 1) != 0)
  {
    +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AB96A000, v25, OS_LOG_TYPE_DEFAULT, "Using legacy CKSMSComposeController SPI for FileProvider", buf, 2u);
    }

    v26 = objc_opt_class();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __171__MFMessageComposeViewController__insertCKSMSComposeFileDataForItemProvider_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_outReturnResult___block_invoke_115;
    v28[3] = &unk_1E5A69368;
    v28[4] = self;
    v29 = v15;
    v30 = v16;
    v31 = v9;
    v27 = (id)objc_msgSend(v14, "loadObjectOfClass:completionHandler:", v26, v28);

    v22 = v29;
    goto LABEL_9;
  }
LABEL_10:

}

void __171__MFMessageComposeViewController__insertCKSMSComposeFileDataForItemProvider_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_outReturnResult___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  char v13;

  v2 = *(void **)(a1 + 32);
  v3 = objc_opt_class();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __171__MFMessageComposeViewController__insertCKSMSComposeFileDataForItemProvider_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_outReturnResult___block_invoke_2;
  v8[3] = &unk_1E5A69318;
  v4 = *(void **)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v10 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 64);
  v13 = *(_BYTE *)(a1 + 80);
  v6 = *(_QWORD *)(a1 + 72);
  v11 = v5;
  v12 = v6;
  v7 = (id)objc_msgSend(v2, "loadObjectOfClass:completionHandler:", v3, v8);

}

void __171__MFMessageComposeViewController__insertCKSMSComposeFileDataForItemProvider_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_outReturnResult___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v3;
    _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "Loading item provider for type file URL. URL: %@{public} and metadata", buf, 0xCu);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __171__MFMessageComposeViewController__insertCKSMSComposeFileDataForItemProvider_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_outReturnResult___block_invoke_108;
  block[3] = &unk_1E5A692F0;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v3;
  v11 = v5;
  v12 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v15 = *(_BYTE *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 64);
  v13 = v6;
  v14 = v7;
  v8 = v3;
  dispatch_sync(MEMORY[0x1E0C80D38], block);

}

void __171__MFMessageComposeViewController__insertCKSMSComposeFileDataForItemProvider_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_outReturnResult___block_invoke_108(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "topViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(unsigned __int8 *)(a1 + 80);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __171__MFMessageComposeViewController__insertCKSMSComposeFileDataForItemProvider_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_outReturnResult___block_invoke_2_109;
  v8[3] = &__block_descriptor_40_e8_v12__0B8l;
  v8[4] = *(_QWORD *)(a1 + 72);
  objc_msgSend(v2, "insertFileURLForCollaboration:collaborationShareOptions:metadata:sendAsCopyURL:isCollaboration:completionHandler:", v3, v4, v5, v6, v7, v8);

}

uint64_t __171__MFMessageComposeViewController__insertCKSMSComposeFileDataForItemProvider_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_outReturnResult___block_invoke_2_109(uint64_t result, char a2)
{
  _BYTE *v2;

  v2 = *(_BYTE **)(result + 32);
  if (v2)
    *v2 = a2;
  return result;
}

void __171__MFMessageComposeViewController__insertCKSMSComposeFileDataForItemProvider_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_outReturnResult___block_invoke_115(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "Loading item provider for type file URL. URL: %@{public} and metadata", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "insertFileURLForCollaboration:collaborationShareOptions:metadata:isCollaboration:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));

}

- (void)_loadSWCopyRepresentationForItemProvider:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  getSWCopyRepresentationTypeIdentifier[0]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMessageComposeViewController _loadSWCopyRepresentationForItemProvider:forTypeIdentifier:completionHandler:](self, "_loadSWCopyRepresentationForItemProvider:forTypeIdentifier:completionHandler:", v8, v7, v6);

}

- (void)_loadSWCopyRepresentationForItemProvider:(id)a3 forTypeIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v7 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __111__MFMessageComposeViewController__loadSWCopyRepresentationForItemProvider_forTypeIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_1E5A693B8;
  v11 = v7;
  v8 = v7;
  v9 = (id)objc_msgSend(a3, "loadInPlaceFileRepresentationForTypeIdentifier:completionHandler:", a4, v10);

}

void __111__MFMessageComposeViewController__loadSWCopyRepresentationForItemProvider_forTypeIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  char v24;
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v7 = a2;
  v8 = a4;
  v9 = v8;
  if (!v7 || v8)
  {
    +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __111__MFMessageComposeViewController__loadSWCopyRepresentationForItemProvider_forTypeIdentifier_completionHandler___block_invoke_cold_1((uint64_t)v9, v13, v14, v15, v16, v17, v18, v19);

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__7;
    v30 = __Block_byref_object_dispose__7;
    v31 = (id)0xAAAAAAAAAAAAAAAALL;
    v31 = v7;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", 0);
    v11 = v27[5];
    v25 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __111__MFMessageComposeViewController__loadSWCopyRepresentationForItemProvider_forTypeIdentifier_completionHandler___block_invoke_117;
    v20[3] = &unk_1E5A69390;
    v23 = &v26;
    v21 = 0;
    v24 = a3;
    v22 = *(id *)(a1 + 32);
    objc_msgSend(v10, "coordinateReadingItemAtURL:options:error:byAccessor:", v11, 1, &v25, v20);
    v12 = v25;

    _Block_object_dispose(&v26, 8);
  }

}

void __111__MFMessageComposeViewController__loadSWCopyRepresentationForItemProvider_forTypeIdentifier_completionHandler___block_invoke_117(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    v5 = a1 + 48;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    if (*(_BYTE *)(a1 + 56))
    {
      +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AB96A000, v6, OS_LOG_TYPE_DEFAULT, "Send copy representation was loaded in place", buf, 2u);
      }
    }
    else
    {
      +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AB96A000, v7, OS_LOG_TYPE_DEFAULT, "Send copy representation was not loaded in place, will re-save file to temp directory", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 40), "lastPathComponent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject temporaryDirectory](v6, "temporaryDirectory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      -[NSObject URLForDirectory:inDomain:appropriateForURL:create:error:](v6, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v8, 1, &v28);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v28;

      if (!v9)
      {
        +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          __111__MFMessageComposeViewController__loadSWCopyRepresentationForItemProvider_forTypeIdentifier_completionHandler___block_invoke_117_cold_3((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);

        -[NSObject temporaryDirectory](v6, "temporaryDirectory");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "URLByAppendingPathComponent:", v26);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 40);
      v27 = v10;
      v20 = -[NSObject copyItemAtURL:toURL:error:](v6, "copyItemAtURL:toURL:error:", v19, v18, &v27);
      v21 = v27;

      if (v20)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 40), v18);
        +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 40);
          *(_DWORD *)buf = 138412290;
          v30 = v23;
          _os_log_impl(&dword_1AB96A000, v22, OS_LOG_TYPE_DEFAULT, "Successfully obtained sendCopyURL: %@", buf, 0xCu);
        }
      }
      else
      {
        +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          __111__MFMessageComposeViewController__loadSWCopyRepresentationForItemProvider_forTypeIdentifier_completionHandler___block_invoke_117_cold_2();
      }

    }
  }
  else
  {
    +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __111__MFMessageComposeViewController__loadSWCopyRepresentationForItemProvider_forTypeIdentifier_completionHandler___block_invoke_117_cold_1();
  }

  +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 138412290;
    v30 = v25;
    _os_log_impl(&dword_1AB96A000, v24, OS_LOG_TYPE_DEFAULT, "Item provider is conforming to UTCopyRepresentationTypeIdentifier. sendCopyURL: %@", buf, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)insertCollaborationItemProvider:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5 isCollaboration:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  NSObject *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  int v42;
  NSObject *v43;
  uint64_t v44;
  id v45;
  _QWORD v47[4];
  id v48;
  MFMessageComposeViewController *v49;
  id v50;
  uint64_t v51;
  BOOL v52;
  uint8_t v53[16];
  _QWORD v54[4];
  id v55;
  id v56;
  MFMessageComposeViewController *v57;
  id v58;
  __int128 *v59;
  uint64_t v60;
  BOOL v61;
  _QWORD v62[4];
  id v63;
  MFMessageComposeViewController *v64;
  id v65;
  id v66;
  __int128 *v67;
  uint64_t v68;
  _QWORD v69[4];
  id v70;
  MFMessageComposeViewController *v71;
  id v72;
  id v73;
  __int128 *v74;
  uint64_t v75;
  BOOL v76;
  _QWORD v77[5];
  id v78;
  id v79;
  id v80;
  __int128 *p_buf;
  BOOL v82;
  __int128 v83;
  uint64_t v84;
  char v85;
  __int128 buf;
  uint64_t v87;
  char v88;
  uint64_t v89;

  v6 = a6;
  v89 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_1AB96A000, v13, OS_LOG_TYPE_DEFAULT, "Invoking insertCollaborationItemProvider with metadata: %@{public}", (uint8_t *)&buf, 0xCu);
  }

  if (v10)
  {
    v14 = get_SWPendingCollaborationClass[0]();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v87 = 0x2020000000;
    v88 = 0;
    if (objc_msgSend(v10, "canLoadObjectOfClass:", objc_opt_class()))
    {
      getSWCopyRepresentationTypeIdentifier[0]();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v10, "hasItemConformingToTypeIdentifier:", v15);

      if (v16)
      {
        v77[0] = MEMORY[0x1E0C809B0];
        v77[1] = 3221225472;
        v77[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke;
        v77[3] = &unk_1E5A693E0;
        v77[4] = self;
        v78 = v10;
        v79 = v11;
        v82 = v6;
        v80 = v12;
        p_buf = &buf;
        -[MFMessageComposeViewController _loadSWCopyRepresentationForItemProvider:completionHandler:](self, "_loadSWCopyRepresentationForItemProvider:completionHandler:", v78, v77);

      }
      else
      {
        +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v10, "registeredTypeIdentifiers");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v83) = 138412290;
          *(_QWORD *)((char *)&v83 + 4) = v32;
          _os_log_impl(&dword_1AB96A000, v31, OS_LOG_TYPE_DEFAULT, "Item provider does not have item conforming to UTCopyRepresentationTypeIdentifier. Registered type identifiers are: %@", (uint8_t *)&v83, 0xCu);

        }
        -[MFMessageComposeViewController _insertCKSMSComposeFileDataForItemProvider:collaborationShareOptions:collaborationMetadata:sendAsCopyURL:isCollaboration:outReturnResult:](self, "_insertCKSMSComposeFileDataForItemProvider:collaborationShareOptions:collaborationMetadata:sendAsCopyURL:isCollaboration:outReturnResult:", v10, v11, v12, 0, v6, *((_QWORD *)&buf + 1) + 24);
      }
      v25 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;
      goto LABEL_37;
    }
    if (objc_msgSend(v10, "canLoadObjectOfClass:", objc_opt_class()))
    {
      +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v83) = 0;
        _os_log_impl(&dword_1AB96A000, v26, OS_LOG_TYPE_DEFAULT, "Loading item provider for SWShareableContent", (uint8_t *)&v83, 2u);
      }

      -[MFMessageComposeViewController topViewController](self, "topViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_opt_respondsToSelector();

      if ((v28 & 1) != 0)
      {
        *(_QWORD *)&v83 = 0;
        *((_QWORD *)&v83 + 1) = &v83;
        v84 = 0x2020000000;
        v85 = 0;
        -[MFMessageComposeViewController topViewController](self, "topViewController");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v69[0] = MEMORY[0x1E0C809B0];
        v69[1] = 3221225472;
        v69[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_123;
        v69[3] = &unk_1E5A69480;
        v75 = v14;
        v70 = v10;
        v71 = self;
        v72 = v11;
        v76 = v6;
        v73 = v12;
        v74 = &v83;
        objc_msgSend(v29, "insertSWYPendingCollaboration:collaborationShareOptions:collaborationMetadata:sendAsCopyURL:isCollaboration:completionHandler:", 0, 0, 0, 0, v6, v69);

        v25 = *(_BYTE *)(*((_QWORD *)&v83 + 1) + 24) != 0;
LABEL_27:
        _Block_object_dispose(&v83, 8);
LABEL_37:
        _Block_object_dispose(&buf, 8);
        goto LABEL_38;
      }
      -[MFMessageComposeViewController topViewController](self, "topViewController");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_opt_respondsToSelector();

      if ((v40 & 1) != 0)
      {
        *(_QWORD *)&v83 = 0;
        *((_QWORD *)&v83 + 1) = &v83;
        v84 = 0x2020000000;
        v85 = 0;
        -[MFMessageComposeViewController topViewController](self, "topViewController");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_4;
        v62[3] = &unk_1E5A694F8;
        v68 = v14;
        v63 = v10;
        v64 = self;
        v65 = v11;
        v66 = v12;
        v67 = &v83;
        objc_msgSend(v41, "insertSWYPendingCollaboration:collaborationShareOptions:collaborationMetadata:completionHandler:", 0, 0, 0, v62);

        v25 = *(_BYTE *)(*((_QWORD *)&v83 + 1) + 24) != 0;
        goto LABEL_27;
      }
LABEL_28:
      v25 = 0;
      goto LABEL_37;
    }
    v30 = (void *)*MEMORY[0x1E0C95270];
    if (!objc_msgSend(v10, "hasItemConformingToTypeIdentifier:", *MEMORY[0x1E0C95270]))
    {
      v30 = (void *)*MEMORY[0x1E0C95268];
      if (!objc_msgSend(v10, "hasItemConformingToTypeIdentifier:", *MEMORY[0x1E0C95268]))
        goto LABEL_28;
    }
    v33 = v30;
    v34 = objc_opt_class();
    if (!v33)
      goto LABEL_28;
    *(_QWORD *)&v83 = 0;
    *((_QWORD *)&v83 + 1) = &v83;
    v84 = 0x2020000000;
    v85 = 0;
    -[MFMessageComposeViewController topViewController](self, "topViewController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_opt_respondsToSelector();

    if ((v36 & 1) != 0)
    {
      -[MFMessageComposeViewController topViewController](self, "topViewController");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_2_138;
      v54[3] = &unk_1E5A69480;
      v55 = v10;
      v60 = v34;
      v56 = v33;
      v57 = self;
      v61 = v6;
      v58 = v11;
      v59 = &v83;
      objc_msgSend(v37, "insertCKShareForCollaboration:containerSetupInfo:collaborationShareOptions:isCollaboration:completionHandler:", 0, 0, v58, v6, v54);

      v25 = *(_BYTE *)(*((_QWORD *)&v83 + 1) + 24) != 0;
      v38 = v55;
    }
    else
    {
      -[MFMessageComposeViewController topViewController](self, "topViewController");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v42 = objc_msgSend(v10, "canLoadObjectOfClass:", objc_opt_class());

        if (!v42)
        {
          v25 = 0;
          goto LABEL_36;
        }
        +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v53 = 0;
          _os_log_impl(&dword_1AB96A000, v43, OS_LOG_TYPE_DEFAULT, "Using legacy CKSMSComposeController SPI for CKShare.", v53, 2u);
        }

        v44 = objc_opt_class();
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_144;
        v47[3] = &unk_1E5A69570;
        v48 = v33;
        v49 = self;
        v52 = v6;
        v50 = v11;
        v51 = v34;
        v45 = (id)objc_msgSend(v10, "loadObjectOfClass:completionHandler:", v44, v47);

        v25 = 1;
        v38 = v48;
      }
      else
      {
        v25 = 0;
      }
    }

LABEL_36:
    _Block_object_dispose(&v83, 8);

    goto LABEL_37;
  }
  +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[MFMessageComposeViewController insertCollaborationItemProvider:collaborationShareOptions:collaborationMetadata:isCollaboration:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

  v25 = 0;
LABEL_38:

  return v25;
}

uint64_t __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_insertCKSMSComposeFileDataForItemProvider:collaborationShareOptions:collaborationMetadata:sendAsCopyURL:isCollaboration:outReturnResult:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), a2, *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
}

void __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_123(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  char v17;
  uint8_t buf[16];

  +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB96A000, v2, OS_LOG_TYPE_DEFAULT, "Loading item provider for _SWPendingCollaboration with nil items", buf, 2u);
  }

  v3 = *(void **)(a1 + 32);
  v4 = objc_opt_class();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_124;
  v11[3] = &unk_1E5A69458;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  v12 = v5;
  v13 = v6;
  v14 = v7;
  v8 = *(id *)(a1 + 56);
  v17 = *(_BYTE *)(a1 + 80);
  v9 = *(_QWORD *)(a1 + 64);
  v15 = v8;
  v16 = v9;
  v10 = (id)objc_msgSend(v3, "loadObjectOfClass:completionHandler:", v4, v11);

}

void __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_124(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  char v17;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_2;
  block[3] = &unk_1E5A69430;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v11 = v4;
  v12 = v5;
  v13 = v3;
  v14 = v6;
  v7 = *(id *)(a1 + 56);
  v17 = *(_BYTE *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 64);
  v15 = v7;
  v16 = v8;
  v9 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[5];
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  char v24;
  uint8_t buf[16];

  +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB96A000, v2, OS_LOG_TYPE_DEFAULT, "Loading item provider for _SWPendingCollaboration with non nil items", buf, 2u);
  }

  v3 = *(void **)(a1 + 32);
  v4 = (void *)*MEMORY[0x1E0CEC610];
  objc_msgSend((id)*MEMORY[0x1E0CEC610], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "hasItemConformingToTypeIdentifier:", v5);

  v7 = *(void **)(a1 + 40);
  if (v6)
  {
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_125;
    v19[3] = &unk_1E5A693E0;
    v10 = *(void **)(a1 + 48);
    v19[4] = *(_QWORD *)(a1 + 40);
    v20 = v10;
    v21 = *(id *)(a1 + 56);
    v11 = *(id *)(a1 + 64);
    v24 = *(_BYTE *)(a1 + 80);
    v12 = *(_QWORD *)(a1 + 72);
    v22 = v11;
    v23 = v12;
    objc_msgSend(v7, "_loadSWCopyRepresentationForItemProvider:forTypeIdentifier:completionHandler:", v8, v9, v19);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "topViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 56);
    v16 = *(unsigned __int8 *)(a1 + 80);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_3;
    v18[3] = &unk_1E5A69408;
    v17 = *(_QWORD *)(a1 + 64);
    v18[4] = *(_QWORD *)(a1 + 72);
    objc_msgSend(v13, "insertSWYPendingCollaboration:collaborationShareOptions:collaborationMetadata:sendAsCopyURL:isCollaboration:completionHandler:", v14, v15, v17, 0, v16, v18);

  }
}

void __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_125(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(unsigned __int8 *)(a1 + 72);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_2_126;
  v9[3] = &unk_1E5A69408;
  v8 = *(_QWORD *)(a1 + 56);
  v9[4] = *(_QWORD *)(a1 + 64);
  objc_msgSend(v4, "insertSWYPendingCollaboration:collaborationShareOptions:collaborationMetadata:sendAsCopyURL:isCollaboration:completionHandler:", v5, v6, v8, v3, v7, v9);

}

uint64_t __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_2_126(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

uint64_t __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_3(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t v12;
  uint8_t buf[16];

  +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB96A000, v2, OS_LOG_TYPE_DEFAULT, "Loading item provider for _SWPendingCollaboration with nil items", buf, 2u);
  }

  v3 = *(void **)(a1 + 32);
  v4 = objc_opt_class();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_130;
  v9[3] = &unk_1E5A694D0;
  v5 = *(void **)(a1 + 48);
  v9[4] = *(_QWORD *)(a1 + 40);
  v10 = v5;
  v6 = *(id *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v11 = v6;
  v12 = v7;
  v8 = (id)objc_msgSend(v3, "loadObjectOfClass:completionHandler:", v4, v9);

}

void __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_130(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_2_131;
  block[3] = &unk_1E5A694A8;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v4;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 56);
  v11 = v5;
  v12 = v6;
  v7 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_2_131(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  uint8_t buf[16];

  +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB96A000, v2, OS_LOG_TYPE_DEFAULT, "Loading item provider for _SWPendingCollaboration with non nil items", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_132;
  v7[3] = &unk_1E5A69408;
  v6 = *(_QWORD *)(a1 + 56);
  v7[4] = *(_QWORD *)(a1 + 64);
  objc_msgSend(v3, "insertSWYPendingCollaboration:collaborationShareOptions:collaborationMetadata:completionHandler:", v4, v5, v6, v7);

}

uint64_t __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_132(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_2_138(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  char v16;
  uint8_t buf[16];

  +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB96A000, v2, OS_LOG_TYPE_DEFAULT, "Calling MVS SPI with nil URL.", buf, 2u);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "canLoadObjectOfClass:", objc_opt_class()))
  {
    v3 = *(void **)(a1 + 32);
    v4 = objc_opt_class();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_139;
    v11[3] = &unk_1E5A69548;
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(void **)(a1 + 56);
    v12 = v5;
    v13 = v6;
    v8 = v7;
    v16 = *(_BYTE *)(a1 + 80);
    v9 = *(_QWORD *)(a1 + 64);
    v14 = v8;
    v15 = v9;
    v10 = (id)objc_msgSend(v3, "loadObjectOfClass:completionHandler:", v4, v11);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
  }
}

void __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_139(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  char v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v22 = v5;
    _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "Loading item provider for Type Identifier %@", buf, 0xCu);
  }

  if (v3)
  {
    v6 = v3;
    objc_msgSend(v6, "share");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_140;
    v14[3] = &unk_1E5A69520;
    v8 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(a1 + 48);
    v15 = v7;
    v16 = v8;
    v17 = v6;
    v10 = v9;
    v20 = *(_BYTE *)(a1 + 64);
    v11 = *(_QWORD *)(a1 + 56);
    v18 = v10;
    v19 = v11;
    v12 = v6;
    v13 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v14);

  }
}

void __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_140(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1AB96A000, v2, OS_LOG_TYPE_DEFAULT, "Calling MVS SPI with unloaded item provider. URL: %@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "containerSetupInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(unsigned __int8 *)(a1 + 72);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_141;
  v9[3] = &unk_1E5A69408;
  v8 = *(_QWORD *)(a1 + 56);
  v9[4] = *(_QWORD *)(a1 + 64);
  objc_msgSend(v4, "insertCKShareForCollaboration:containerSetupInfo:collaborationShareOptions:isCollaboration:completionHandler:", v5, v6, v8, v7, v9);

}

uint64_t __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_141(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_144(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v11 = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1AB96A000, v4, OS_LOG_TYPE_DEFAULT, "Loading item provider for Type Identifier %@", (uint8_t *)&v11, 0xCu);
  }

  if (v3)
  {
    v6 = v3;
    -[NSObject share](v6, "share");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "topViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject containerSetupInfo](v6, "containerSetupInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertCKShareForCollaboration:containerSetupInfo:collaborationShareOptions:isCollaboration:", v7, v9, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));

  }
  else
  {
    +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_144_cold_1(v10, (uint64_t)&v11, v6);
    }
  }

}

- (BOOL)insertCollaborationItemProvider:(id)a3 collaborationOptions:(id)a4 collaborationMetadata:(id)a5 isCollaboration:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_msgSend(objc_alloc((Class)get_SWCollaborationShareOptionsClass[0]()), "initWithOptionsGroups:", v11);
  LOBYTE(v6) = -[MFMessageComposeViewController insertCollaborationItemProvider:collaborationShareOptions:collaborationMetadata:isCollaboration:](self, "insertCollaborationItemProvider:collaborationShareOptions:collaborationMetadata:isCollaboration:", v10, v13, v12, v6);

  return v6;
}

- (BOOL)insertGroupActivity:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  void *v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4 != 0;
  if (v4)
  {
    +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v4;
      _os_log_impl(&dword_1AB96A000, v6, OS_LOG_TYPE_DEFAULT, "Inserting groupActivity %@{public}", (uint8_t *)&v18, 0xCu);
    }

    -[MFMessageComposeViewController topViewController](self, "topViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) == 0)
    {
      v5 = 0;
      goto LABEL_10;
    }
    -[MFMessageComposeViewController topViewController](self, "topViewController");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject insertGroupActivity:](v9, "insertGroupActivity:", v4);
  }
  else
  {
    +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MFMessageComposeViewController insertGroupActivity:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
  }

LABEL_10:
  return v5;
}

- (void)showSharedItemInEntryView
{
  id v2;

  -[MFMessageComposeViewController topViewController](self, "topViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(v2, "showInsertedItemInEntryView");

}

- (BOOL)addRichLinkData:(id)a3 withWebpageURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[MFMessageComposeViewController topViewController](self, "topViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = objc_msgSend(v8, "insertRichLinkWithURL:andData:", v7, v6);
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setMessage:(id)a3 withExtensionBundleIdentifier:(id)a4
{
  MSMessage *v7;
  id v8;
  MSMessage **p_message;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = (MSMessage *)a3;
  v8 = a4;
  p_message = &self->_message;
  if (self->_message != v7)
  {
    objc_storeStrong((id *)&self->_message, a3);
    if (*p_message)
    {
      -[MFMessageComposeViewController topViewController](self, "topViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        if (v8)
        {
          +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = 138412290;
            v14 = v8;
            _os_log_impl(&dword_1AB96A000, v12, OS_LOG_TYPE_DEFAULT, "Passing override extensionBundleIdentifier: '%@' to CKSMSComposeController.", (uint8_t *)&v13, 0xCu);
          }

          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "insertMessage:extensionBundleIdentifier:", *p_message, v8);
        }
        else
        {
          objc_msgSend(v10, "insertMessage:", *p_message);
        }
      }

    }
  }

}

- (void)setMessage:(MSMessage *)message
{
  -[MFMessageComposeViewController setMessage:withExtensionBundleIdentifier:](self, "setMessage:withExtensionBundleIdentifier:", message, 0);
}

- (MSMessage)message
{
  return self->_message;
}

- (void)_updateAttachmentCountForAttachmentURL:(id)a3
{
  id v4;

  -[MFMessageComposeViewController _MIMETypeForURL:](self, "_MIMETypeForURL:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (-[MFMessageComposeViewController _isAudioMIMEType:](self, "_isAudioMIMEType:"))
    ++self->_currentAttachedAudioCount;
  if (-[MFMessageComposeViewController _isVideoMIMEType:](self, "_isVideoMIMEType:", v4))
    ++self->_currentAttachedVideoCount;
  if (-[MFMessageComposeViewController _isImageMIMEType:](self, "_isImageMIMEType:", v4))
    ++self->_currentAttachedImageCount;

}

- (void)disableUserAttachments
{
  id v2;

  -[MFMessageComposeViewController topViewController](self, "topViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableCameraAttachments");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[MFMessageComposeViewController topViewController](self, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromParentViewController");
  objc_msgSend(v3, "setDelegate:", 0);
  -[MFMessageComposeViewController setMessageComposeDelegate:](self, "setMessageComposeDelegate:", 0);
  -[MFMessageComposeViewController setBody:](self, "setBody:", 0);
  -[MFMessageComposeViewController setRecipients:](self, "setRecipients:", 0);

  v4.receiver = self;
  v4.super_class = (Class)MFMessageComposeViewController;
  -[MFMessageComposeViewController dealloc](&v4, sel_dealloc);
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFMessageComposeViewController;
  -[MFMessageComposeViewController setModalPresentationStyle:](&v3, sel_setModalPresentationStyle_, -[MFMessageComposeViewController preferredPresentationStyle](self, "preferredPresentationStyle", a3));
}

- (void)setPreferredPresentationStyle:(int64_t)a3
{
  self->_preferredPresentationStyle = a3;
  -[MFMessageComposeViewController setModalPresentationStyle:](self, "setModalPresentationStyle:");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFMessageComposeViewController;
  -[MFMessageComposeViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[MFMessageComposeViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  char v7;
  NSString *body;
  NSString *subject;
  NSArray *recipients;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;

  v3 = a3;
  -[MFMessageComposeViewController topViewController](self, "topViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setServiceId:", self->_serviceId);
  objc_msgSend(v5, "setSuggestions:", self->_suggestions);
  -[UIViewController mf_dataForUICustomization](self, "mf_dataForUICustomization");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUICustomizationData:", v6);

  objc_msgSend(v5, "setShareSheetSessionID:", self->_shareSheetSessionID);
  if (self->_shareSheetSessionID || !self->_chatGUID)
  {
    v7 = objc_opt_respondsToSelector();
    body = self->_body;
    subject = self->_subject;
    recipients = self->_recipients;
    if ((v7 & 1) != 0)
      objc_msgSend(v5, "setText:subject:addresses:shouldHideClearPluginButton:", body, subject, recipients, self->_shouldHideClearPluginButton);
    else
      objc_msgSend(v5, "setText:subject:addresses:", body, subject, recipients);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "setText:subject:addresses:shouldHideClearPluginButton:chatGUID:", self->_body, self->_subject, self->_recipients, self->_shouldHideClearPluginButton, self->_chatGUID);
  }
  else
  {
    +[MFMessageComposeViewController log](MFMessageComposeViewController, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[MFMessageComposeViewController viewWillAppear:].cold.1((uint64_t)&self->_chatGUID, v11, v12, v13, v14, v15, v16, v17);

  }
  objc_msgSend(v5, "setUTIs:", self->_UTITypes);
  objc_msgSend(v5, "setPhotoIDs:", self->_photoIDs);
  objc_msgSend(v5, "setCloudPhotoIDs:", self->_cloudPhotoIDs);
  objc_msgSend(v5, "setContentURLs:", self->_contentURLs);
  objc_msgSend(v5, "setContentText:", self->_contentText);
  v18.receiver = self;
  v18.super_class = (Class)MFMessageComposeViewController;
  -[MFMessageComposeViewController viewWillAppear:](&v18, sel_viewWillAppear_, v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v3;
  int v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFMessageComposeViewController;
  -[MFMessageComposeViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPPTAvailable");

  if (v4)
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_166);
}

void __48__MFMessageComposeViewController_viewDidAppear___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("MFMessageShareComposeViewDidShow"), 0, 0, 1);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFMessageComposeViewController;
  -[MFMessageComposeViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  if (-[MFMessageComposeViewController isBeingDismissed](self, "isBeingDismissed"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__MFMessageComposeViewController_viewWillDisappear___block_invoke;
    block[3] = &unk_1E5A65480;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

void __52__MFMessageComposeViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("MFMessageComposeViewControllerIsBeingDismissed"), *(_QWORD *)(a1 + 32));

}

- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers
{
  return 1;
}

- (void)smsComposeControllerCancelled:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_messageComposeDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "messageComposeViewController:didFinishWithResult:", self, 0);

}

- (void)smsComposeControllerSendStarted:(id)a3 withText:(id)a4 messageGUID:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a5;
  -[MFMessageComposeViewController _deviceValidationSendCompletion](self, "_deviceValidationSendCompletion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v7)
    {
      -[MFMessageComposeViewController _deviceValidationSendCompletion](self, "_deviceValidationSendCompletion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[_MFMessageObserver observeMessageGUID:completion:](_MFMessageObserver, "observeMessageGUID:completion:", v7, v9);

    }
    else
    {
      NSLog(CFSTR("Likely attempted to use UPI-related API without the proper entitlement. No send callback will be provided."));
    }
    -[MFMessageComposeViewController set_deviceValidationSendCompletion:](self, "set_deviceValidationSendCompletion:", 0);
  }
  -[MFMessageComposeViewController smsComposeControllerSendStarted:](self, "smsComposeControllerSendStarted:", v10);

}

- (void)smsComposeControllerSendStarted:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_messageComposeDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "messageComposeViewController:didFinishWithResult:", self, 1);

}

- (void)smsComposeControllerEntryViewContentInserted:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_messageComposeDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "messageComposeViewControllerDidShowEntryViewContent:", self);

}

- (void)smsComposeControllerShouldSendMessageWithText:(id)a3 toRecipients:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, uint64_t);
  id WeakRetained;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, uint64_t))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_messageComposeDelegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "messageComposeViewController:shouldSendMessage:toRecipients:completion:", self, v11, v8, v9);
  else
    v9[2](v9, 1);

}

+ (BOOL)isiMessageEnabled
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_setupAccountMonitor");
  objc_msgSend(MEMORY[0x1E0D20BE8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "availabilityForListenerID:forService:", sMFListenerName, 1);

  return v3 == 1;
}

- (void)_setCanEditRecipients:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MFMessageComposeViewController topViewController](self, "topViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCanEditRecipients:", v3);

}

- (void)_setShouldDisableEntryField:(BOOL)a3
{
  _BOOL8 v3;
  char v5;
  id v6;
  id v7;

  v3 = a3;
  -[MFMessageComposeViewController topViewController](self, "topViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MFMessageComposeViewController topViewController](self, "topViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShouldDisableEntryField:", v3);

  }
}

- (void)_setNavBarTitle:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MFMessageComposeViewController topViewController](self, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MFMessageComposeViewController topViewController](self, "topViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNavBarTitle:", v7);

  }
}

- (void)_setShouldIgnoreEmailsWhenSending:(BOOL)a3
{
  _BOOL8 v3;
  char v5;
  id v6;
  id v7;

  v3 = a3;
  -[MFMessageComposeViewController topViewController](self, "topViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[MFMessageComposeViewController topViewController](self, "topViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShouldIgnoreEmailsWhenSending:", v3);

  }
}

- (BOOL)insertCollaborationItemProvider:(NSItemProvider *)itemProvider
{
  NSItemProvider *v4;
  NSItemProvider *v5;
  id v6;
  char v7;
  _QWORD v9[5];
  NSItemProvider *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = itemProvider;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__MFMessageComposeViewController_insertCollaborationItemProvider___block_invoke;
  v9[3] = &unk_1E5A695B8;
  v10 = v4;
  v11 = &v12;
  v9[4] = self;
  v5 = v4;
  v6 = -[NSItemProvider loadDataRepresentationForTypeIdentifier:completionHandler:](v5, "loadDataRepresentationForTypeIdentifier:completionHandler:", CFSTR("com.apple.SharedWithYou.SWCollaborationMetadata"), v9);
  v7 = *((_BYTE *)v13 + 24);

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __66__MFMessageComposeViewController_insertCollaborationItemProvider___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend((Class)get_SWCollaborationMetadataClass[0](), "objectWithItemProviderData:typeIdentifier:error:", v7, CFSTR("com.apple.SharedWithYou.SWCollaborationMetadata"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)a1[4];
  v5 = a1[5];
  objc_msgSend(v3, "defaultShareOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v4, "insertCollaborationItemProvider:collaborationShareOptions:collaborationMetadata:isCollaboration:", v5, v6, v3, 1);

}

- (void)setUPIVerificationCodeSendCompletion:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (MGGetBoolAnswer())
  {
    -[MFMessageComposeViewController topViewController](self, "topViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "configureForDeviceValidation");
      -[MFMessageComposeViewController set_deviceValidationSendCompletion:](self, "set_deviceValidationSendCompletion:", v5);
    }

  }
  else
  {
    NSLog(CFSTR("%s cannot be used on this device as it does not have SMS capability"), "-[MFMessageComposeViewController setUPIVerificationCodeSendCompletion:]");
  }

}

- (id)messageComposeDelegate
{
  return objc_loadWeakRetained((id *)&self->_messageComposeDelegate);
}

- (void)setMessageComposeDelegate:(id)messageComposeDelegate
{
  objc_storeWeak((id *)&self->_messageComposeDelegate, messageComposeDelegate);
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(NSArray *)recipients
{
  objc_setProperty_nonatomic_copy(self, a2, recipients, 1432);
}

- (NSString)body
{
  return self->_body;
}

- (void)setBody:(NSString *)body
{
  objc_setProperty_nonatomic_copy(self, a2, body, 1440);
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(NSString *)subject
{
  objc_setProperty_nonatomic_copy(self, a2, subject, 1448);
}

- (unint64_t)currentAttachedVideoCount
{
  return self->_currentAttachedVideoCount;
}

- (void)setCurrentAttachedVideoCount:(unint64_t)a3
{
  self->_currentAttachedVideoCount = a3;
}

- (unint64_t)currentAttachedAudioCount
{
  return self->_currentAttachedAudioCount;
}

- (void)setCurrentAttachedAudioCount:(unint64_t)a3
{
  self->_currentAttachedAudioCount = a3;
}

- (unint64_t)currentAttachedImageCount
{
  return self->_currentAttachedImageCount;
}

- (void)setCurrentAttachedImageCount:(unint64_t)a3
{
  self->_currentAttachedImageCount = a3;
}

- (id)UTITypes
{
  return self->_UTITypes;
}

- (void)setUTITypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1488);
}

- (id)photoIDs
{
  return self->_photoIDs;
}

- (void)setPhotoIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1496);
}

- (id)cloudPhotoIDs
{
  return self->_cloudPhotoIDs;
}

- (void)setCloudPhotoIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1504);
}

- (id)contentText
{
  return self->_contentText;
}

- (void)setContentText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1512);
}

- (id)contentURLs
{
  return self->_contentURLs;
}

- (void)setContentURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1520);
}

- (NSString)chatGUID
{
  return self->_chatGUID;
}

- (void)setChatGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1528);
}

- (NSString)groupName
{
  return self->_groupName;
}

- (void)setGroupName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1536);
}

- (id)shareSheetSessionID
{
  return self->_shareSheetSessionID;
}

- (void)setShareSheetSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1544);
}

- (NSString)serviceId
{
  return self->_serviceId;
}

- (void)setServiceId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1552);
}

- (NSString)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1560);
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (id)_deviceValidationSendCompletion
{
  return self->__deviceValidationSendCompletion;
}

- (void)set_deviceValidationSendCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1576);
}

- (BOOL)shouldHideClearPluginButton
{
  return self->_shouldHideClearPluginButton;
}

- (void)setShouldHideClearPluginButton:(BOOL)a3
{
  self->_shouldHideClearPluginButton = a3;
}

- (int64_t)preferredPresentationStyle
{
  return self->_preferredPresentationStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__deviceValidationSendCompletion, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_serviceId, 0);
  objc_storeStrong((id *)&self->_shareSheetSessionID, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_chatGUID, 0);
  objc_storeStrong((id *)&self->_contentURLs, 0);
  objc_storeStrong((id *)&self->_contentText, 0);
  objc_storeStrong((id *)&self->_cloudPhotoIDs, 0);
  objc_storeStrong((id *)&self->_photoIDs, 0);
  objc_storeStrong((id *)&self->_UTITypes, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_destroyWeak((id *)&self->_messageComposeDelegate);
  objc_storeStrong(&self->_internal, 0);
}

- (void)initWithNibName:(os_log_t)log bundle:.cold.1(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1AB96A000, log, OS_LOG_TYPE_ERROR, "Unable to initialize due to + [%{public}@ canSendText] returns NO.", buf, 0xCu);
}

void __111__MFMessageComposeViewController__loadSWCopyRepresentationForItemProvider_forTypeIdentifier_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_1AB96A000, a2, a3, "Failed to load file representation URL. error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __111__MFMessageComposeViewController__loadSWCopyRepresentationForItemProvider_forTypeIdentifier_completionHandler___block_invoke_117_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[14];
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_4();
  v4 = v0;
  OUTLINED_FUNCTION_4_2(&dword_1AB96A000, v1, v2, "Failed to coordinate read for copy representation URL for file at URL %@ with error: %@", v3);
  OUTLINED_FUNCTION_4();
}

void __111__MFMessageComposeViewController__loadSWCopyRepresentationForItemProvider_forTypeIdentifier_completionHandler___block_invoke_117_cold_2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_4();
  v3 = v0;
  OUTLINED_FUNCTION_4_2(&dword_1AB96A000, v1, (uint64_t)v1, "Failed to copy file %@ to temporary directory with error %@", v2);
  OUTLINED_FUNCTION_4();
}

void __111__MFMessageComposeViewController__loadSWCopyRepresentationForItemProvider_forTypeIdentifier_completionHandler___block_invoke_117_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_1AB96A000, a2, a3, "Failed to create a temporary directory with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)insertCollaborationItemProvider:(uint64_t)a3 collaborationShareOptions:(uint64_t)a4 collaborationMetadata:(uint64_t)a5 isCollaboration:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1AB96A000, a1, a3, "Received nil itemProvider", a5, a6, a7, a8, 0);
}

void __130__MFMessageComposeViewController_insertCollaborationItemProvider_collaborationShareOptions_collaborationMetadata_isCollaboration___block_invoke_144_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  id v5;

  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  v5 = a1;
  _os_log_error_impl(&dword_1AB96A000, a3, OS_LOG_TYPE_ERROR, "Failed to load object of class '%@' for CKShare using legacy CKSMSComposeController SPI.", (uint8_t *)a2, 0xCu);

}

- (void)insertGroupActivity:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1AB96A000, a1, a3, "Received nil groupActivity to insertGroupActivity", a5, a6, a7, a8, 0);
}

- (void)viewWillAppear:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_1(&dword_1AB96A000, a2, a3, "No shareshetID, chatGUID: %@ but composeController doesn't respond to new selector.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

@end
