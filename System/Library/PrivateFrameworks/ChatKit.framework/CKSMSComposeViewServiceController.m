@implementation CKSMSComposeViewServiceController

- (CKSMSComposeViewServiceController)init
{
  CKSMSComposeViewServiceController *v2;
  dispatch_time_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKSMSComposeViewServiceController;
  v2 = -[CKSMSComposeViewServiceController init](&v7, sel_init);
  if (v2)
  {
    CKResetCachedUserSettings();
    IMResetCachedUserSettings();
    IMResetCachedCarrierSettings();
    -[CKSMSComposeViewServiceController setCanEditRecipients:](v2, "setCanEditRecipients:", 1);
    if (sDidFirstTimeBringup == 1)
    {
      if (!CKIsRunningUnitTests())
      {
        v3 = dispatch_time(0, 0);
        dispatch_after(v3, MEMORY[0x1E0C80D38], &__block_literal_global_45);
      }
    }
    else
    {
      sDidFirstTimeBringup = 1;
    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v4, "modalTranscriptControllerClass")), "initWithNavigationController:", v2);

    -[CKSMSComposeViewServiceController setModalTranscriptController:](v2, "setModalTranscriptController:", v5);
    objc_msgSend(v5, "setDelegate:", v2);

  }
  return v2;
}

void __41__CKSMSComposeViewServiceController_init__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_forceSuspended");

  objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_forceResumed");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSMSComposeViewServiceController removeChildViewController:](self, "removeChildViewController:", v4);

  -[CKSMSComposeViewServiceController setModalTranscriptController:](self, "setModalTranscriptController:", 0);
  v5.receiver = self;
  v5.super_class = (Class)CKSMSComposeViewServiceController;
  -[CKSMSComposeViewServiceController dealloc](&v5, sel_dealloc);
}

- (void)insertFilename:(id)a3 MIMEType:(id)a4 exportedFilename:(id)a5 options:(id)a6
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v9 = (void *)MEMORY[0x1E0C99E98];
  v10 = a6;
  v11 = a5;
  objc_msgSend(v9, "fileURLWithPath:isDirectory:", a3, 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  CKTranscoderUserInfoForComposeOptions(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKSMSComposeViewServiceController insertFileURL:filename:transcoderUserInfo:](self, "insertFileURL:filename:transcoderUserInfo:", v13, v11, v12);
}

- (void)insertData:(id)a3 MIMEType:(id)a4 exportedFilename:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "insertData:MIMEType:exportedFilename:", v10, v9, v8);

  -[CKSMSComposeViewServiceController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "smsComposeControllerDataInserted");

}

- (void)_insertFileURL:(id)a3 filename:(id)a4 transcoderUserInfo:(id)a5 preview:(id)a6 isFullyRealized:(BOOL)a7 appendedVideoURL:(id)a8 completion:(id)a9
{
  _BOOL4 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v10 = a7;
  v32 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  if (v15)
  {
    -[CKSMSComposeViewServiceController _canonicalPathForFileURL:](self, "_canonicalPathForFileURL:", v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      if (-[CKSMSComposeViewServiceController _hostSandboxAllowsFileReadAtFileURL:isResolved:](self, "_hostSandboxAllowsFileReadAtFileURL:isResolved:", v21, 1))
      {
        -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v10)
          v24 = v18;
        else
          v24 = 0;
        if (v10)
          v25 = 0;
        else
          v25 = v18;
        objc_msgSend(v22, "insertFileURL:filename:fileIsResolved:transcoderUserInfo:fullyRealizedPreview:rawPreview:appendedVideoURL:completion:", v21, v16, 1, v17, v24, v25, v19, v20);

        -[CKSMSComposeViewServiceController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "smsComposeControllerDataInserted");

        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "Insert file and ask for MMCS prewarm", buf, 2u);
          }

        }
        objc_msgSend(MEMORY[0x1E0D35820], "sharedInstance");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "preWarmConnection");

        goto LABEL_23;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v29, OS_LOG_TYPE_INFO, "CKSMSComposeViewServiceController - Not attaching file, host app does not have file-read-data permissions!", buf, 2u);
        }
LABEL_22:

      }
    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v15;
        _os_log_impl(&dword_18DFCD000, v29, OS_LOG_TYPE_INFO, "CKSMSComposeViewServiceController - Failed to get canonical path for fileURL %@", buf, 0xCu);
      }
      goto LABEL_22;
    }
LABEL_23:

  }
}

- (void)showInsertedItemInEntryView
{
  void *v3;
  id v4;

  -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hideEntryViewContent:", 0);

  -[CKSMSComposeViewServiceController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "smsComposeControllerEntryViewContentInserted");

}

- (id)_canonicalPathForFileURL:(id)a3
{
  int v3;
  void *v4;
  uint64_t v6;

  v6 = 0;
  v3 = objc_msgSend(a3, "getResourceValue:forKey:error:", &v6, *MEMORY[0x1E0C998C8], 0);
  v4 = 0;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)_hostSandboxAllowsFileReadAtFileURL:(id)a3 isResolved:(BOOL)a4
{
  _BOOL4 v4;
  const __CFURL *v6;
  _BOOL4 v7;
  NSObject *v8;
  char *v10;
  CFBooleanRef propertyValueTypeRefPtr;
  __int128 v12;
  __int128 v13;
  uint8_t buf[16];
  __int128 v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = (const __CFURL *)a3;
  v12 = 0u;
  v13 = 0u;
  -[CKSMSComposeViewServiceController _hostAuditToken](self, "_hostAuditToken");
  propertyValueTypeRefPtr = 0;
  if (!CFURLCopyResourcePropertyForKey(v6, (CFStringRef)*MEMORY[0x1E0C9B518], &propertyValueTypeRefPtr, 0))
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_14;
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v6;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "CKSMSComposeViewServiceController - Error getting readable property for file url %@", buf, 0xCu);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!propertyValueTypeRefPtr)
  {
    if (!IMOSLoggingEnabled())
      goto LABEL_14;
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v6;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "CKSMSComposeViewServiceController - Unable to read file at URL %@", buf, 0xCu);
    }
    goto LABEL_13;
  }
  if (!CFBooleanGetValue(propertyValueTypeRefPtr))
  {
LABEL_14:
    LOBYTE(v7) = 0;
    goto LABEL_15;
  }
  if (v4)
  {
    -[__CFURL fileSystemRepresentation](objc_retainAutorelease(v6), "fileSystemRepresentation");
    *(_OWORD *)buf = v12;
    v15 = v13;
    LOBYTE(v7) = sandbox_check_by_audit_token() == 0;
  }
  else
  {
    v10 = realpath_DARWIN_EXTSN((const char *)-[__CFURL fileSystemRepresentation](objc_retainAutorelease(v6), "fileSystemRepresentation"), 0);
    *(_OWORD *)buf = v12;
    v15 = v13;
    v7 = sandbox_check_by_audit_token() == 0;
    free(v10);
  }
LABEL_15:

  return v7;
}

- (void)insertFileURL:(id)a3 filename:(id)a4 transcoderUserInfo:(id)a5
{
  -[CKSMSComposeViewServiceController _insertFileURL:filename:transcoderUserInfo:preview:isFullyRealized:appendedVideoURL:completion:](self, "_insertFileURL:filename:transcoderUserInfo:preview:isFullyRealized:appendedVideoURL:completion:", a3, a4, a5, 0, 0, 0, 0);
}

- (void)_insertAttachmentWithURL:(id)a3 andDescription:(id)a4 preview:(id)a5 isFullyRealized:(BOOL)a6 appendedVideoURL:(id)a7 appendedBundleURL:(id)a8 completion:(id)a9
{
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *isFullyRealized_appendedVideoURL_appendedBundleURL_completion___PUTCreatePathForPersistentURL;
  uint64_t v25;
  _BOOL4 v26;
  uint64_t v27;
  _QWORD v28[2];

  v10 = a6;
  v28[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a9;
  if (v14)
  {
    v26 = v10;
    v19 = v14;
    objc_msgSend(v19, "scheme");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("assets-library"));

    if (v21)
    {
      v27 = *MEMORY[0x1E0D37EC0];
      objc_msgSend(v19, "absoluteString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (_insertAttachmentWithURL_andDescription_preview_isFullyRealized_appendedVideoURL_appendedBundleURL_completion___pred_PUTCreatePathForPersistentURLPhotoLibraryServicesCore != -1)
        dispatch_once(&_insertAttachmentWithURL_andDescription_preview_isFullyRealized_appendedVideoURL_appendedBundleURL_completion___pred_PUTCreatePathForPersistentURLPhotoLibraryServicesCore, &__block_literal_global_206_0);
      isFullyRealized_appendedVideoURL_appendedBundleURL_completion___PUTCreatePathForPersistentURL = (void *)_insertAttachmentWithURL_andDescription_preview_isFullyRealized_appendedVideoURL_appendedBundleURL_completion___PUTCreatePathForPersistentURL(v19, 0);
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", isFullyRealized_appendedVideoURL_appendedBundleURL_completion___PUTCreatePathForPersistentURL, 0);
      v25 = objc_claimAutoreleasedReturnValue();

      v19 = (id)v25;
    }
    else
    {
      v23 = 0;
    }
    -[CKSMSComposeViewServiceController _insertFileURL:filename:transcoderUserInfo:preview:isFullyRealized:appendedVideoURL:completion:](self, "_insertFileURL:filename:transcoderUserInfo:preview:isFullyRealized:appendedVideoURL:completion:", v19, v15, v23, v16, v26, v17, v18);

  }
}

void *__147__CKSMSComposeViewServiceController__insertAttachmentWithURL_andDescription_preview_isFullyRealized_appendedVideoURL_appendedBundleURL_completion___block_invoke()
{
  void *result;

  result = (void *)MEMORY[0x193FF3C24]("PUTCreatePathForPersistentURL", CFSTR("PhotoLibraryServicesCore"));
  _insertAttachmentWithURL_andDescription_preview_isFullyRealized_appendedVideoURL_appendedBundleURL_completion___PUTCreatePathForPersistentURL = result;
  return result;
}

- (void)insertAttachmentWithURL:(id)a3 andDescription:(id)a4
{
  -[CKSMSComposeViewServiceController _insertAttachmentWithURL:andDescription:preview:isFullyRealized:appendedVideoURL:appendedBundleURL:completion:](self, "_insertAttachmentWithURL:andDescription:preview:isFullyRealized:appendedVideoURL:appendedBundleURL:completion:", a3, a4, 0, 0, 0, 0, 0);
}

- (void)insertAttachmentWithURL:(id)a3 andDescription:(id)a4 appendedVideoURL:(id)a5
{
  -[CKSMSComposeViewServiceController _insertAttachmentWithURL:andDescription:preview:isFullyRealized:appendedVideoURL:appendedBundleURL:completion:](self, "_insertAttachmentWithURL:andDescription:preview:isFullyRealized:appendedVideoURL:appendedBundleURL:completion:", a3, a4, 0, 0, a5, 0, 0);
}

- (void)insertRemoteItemForSendingAndCalculateEntryViewFrame:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  -[CKSMSComposeViewServiceController setEntryViewCompletion:](self, "setEntryViewCompletion:", v6);
  objc_msgSend(v7, "attachmentURL");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attachmentDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previewUIImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "previewIsFullyRealizedByChatKit");
  objc_msgSend(v7, "appendedVideoURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendedBundleURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKSMSComposeViewServiceController _insertAttachmentWithURL:andDescription:preview:isFullyRealized:appendedVideoURL:appendedBundleURL:completion:](self, "_insertAttachmentWithURL:andDescription:preview:isFullyRealized:appendedVideoURL:appendedBundleURL:completion:", v13, v8, v9, v10, v11, v12, v6);
}

- (void)composeChatController:(id)a3 didLoadEntryViewContentWithCompletion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
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
  void (**v31)(id, void *);

  -[CKSMSComposeViewServiceController entryViewCompletion](self, "entryViewCompletion", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKSMSComposeViewServiceController hideEntryViewContent:](self, "hideEntryViewContent:", 1);
    -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entryView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

    -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "entryView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "contentView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "convertRect:toView:", v21, v10, v12, v14, v16);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    -[CKSMSComposeViewServiceController entryViewCompletion](self, "entryViewCompletion");
    v31 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v23, v25, v27, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2](v31, v30);

  }
}

- (void)hideEntryViewContent:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hideEntryViewContent:", v3);

}

- (void)insertRemoteItemForSending:(id)a3
{
  -[CKSMSComposeViewServiceController insertRemoteItemForSending:extensionBundleIdentifier:](self, "insertRemoteItemForSending:extensionBundleIdentifier:", a3, 0);
}

- (void)insertRemoteItemForSending:(id)a3 extensionBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
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
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "previewImage"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v6;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "itemForSending %@", buf, 0xCu);
      }

    }
    objc_msgSend(v6, "attachmentURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v6, "attachmentURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "attachmentDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "previewUIImage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v6, "previewIsFullyRealizedByChatKit");
      objc_msgSend(v6, "appendedVideoURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendedBundleURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKSMSComposeViewServiceController _insertAttachmentWithURL:andDescription:preview:isFullyRealized:appendedVideoURL:appendedBundleURL:completion:](self, "_insertAttachmentWithURL:andDescription:preview:isFullyRealized:appendedVideoURL:appendedBundleURL:completion:", v10, v11, v12, v13, v14, v15, 0);

    }
  }
  else
  {
    objc_msgSend(v6, "appendedRichLinkURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendedRichLinkURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendedRichLinkData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "insertRichLinkWithURL:data:", v18, v19);

      -[CKSMSComposeViewServiceController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "smsComposeControllerDataInserted");

    }
    else
    {
      objc_msgSend(v6, "appendedMessage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        v22 = (void *)MEMORY[0x1E0CA5890];
        -[CKSMSComposeViewServiceController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "bundleProxyForIdentifier:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendedMessage");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "insertMessage:bundleProxy:extensionBundleIdentifier:", v26, v24, v7);

        -[CKSMSComposeViewServiceController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "smsComposeControllerDataInserted");

      }
      else
      {
        objc_msgSend(v6, "attachmentURL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "attachmentDescription");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "appendedVideoURL");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKSMSComposeViewServiceController insertAttachmentWithURL:andDescription:appendedVideoURL:](self, "insertAttachmentWithURL:andDescription:appendedVideoURL:", v24, v28, v29);

      }
    }
  }

}

- (void)forceCancelComposition
{
  id v3;

  -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CKSMSComposeViewServiceController composeChatControllerDidCancelComposition:](self, "composeChatControllerDidCancelComposition:", v3);

}

- (void)setUICustomizationData:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mf_setDataForUICustomization:", v4);

}

- (void)setUTIs:(id)a3
{
  objc_storeStrong((id *)&self->_utiTypes, a3);
}

- (void)setContentURLs:(id)a3
{
  objc_storeStrong((id *)&self->_contentURLs, a3);
}

- (void)setPhotoIDs:(id)a3
{
  objc_storeStrong((id *)&self->_photoIDs, a3);
}

- (void)setCloudPhotoIDs:(id)a3
{
  objc_storeStrong((id *)&self->_cloudPhotoIDs, a3);
}

- (void)setContentText:(id)a3
{
  objc_storeStrong((id *)&self->_contentText, a3);
}

- (void)setServiceId:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_serviceId, a3);
  v5 = a3;
  -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setServiceId:", v5);

}

- (void)setSuggestions:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_suggestions, a3);
  v5 = a3;
  -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSuggestedRepliesData:", v5);

}

- (void)_forceMMSIfNecessary
{
  id v2;

  if (self->_forceMMS)
  {
    -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setForceMMS:", 1);

  }
}

- (void)forceMMS
{
  self->_forceMMS = 1;
  -[CKSMSComposeViewServiceController _forceMMSIfNecessary](self, "_forceMMSIfNecessary");
}

- (void)setGameCenterModeWithPickerBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CKSMSComposeViewServiceController setGameCenterPickerBlock:](self, "setGameCenterPickerBlock:", v4);
  -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "composeRecipientSelectionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGameCenterPickerBlock:", v4);

}

- (void)setGameCenterPickedHandles:(id)a3 playerNames:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "composeRecipientSelectionController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setGameCenterPickedHandles:playerNames:", v7, v6);

  -[CKSMSComposeViewServiceController becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)setText:(id)a3 subject:(id)a4 addresses:(id)a5 shouldHideClearPluginButton:(BOOL)a6 chatGUID:(id)a7
{
  -[CKSMSComposeViewServiceController setText:subject:addresses:chatGUID:groupName:](self, "setText:subject:addresses:chatGUID:groupName:", a3, a4, a5, a7, 0);
}

- (void)setText:(id)a3 subject:(id)a4 addresses:(id)a5 shouldHideClearPluginButton:(BOOL)a6
{
  self->_shouldHideClearPluginButton = a6;
  -[CKSMSComposeViewServiceController setText:subject:addresses:](self, "setText:subject:addresses:", a3, a4, a5);
}

- (void)setText:(id)a3 subject:(id)a4 addresses:(id)a5
{
  -[CKSMSComposeViewServiceController setText:subject:addresses:chatGUID:groupName:](self, "setText:subject:addresses:chatGUID:groupName:", a3, a4, a5, 0, 0);
}

- (void)setText:(id)a3 subject:(id)a4 addresses:(id)a5 chatGUID:(id)a6 groupName:(id)a7
{
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  CKComposition *v20;
  void *v21;
  void *v22;
  CKComposition *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  NSString *shareSheetSessionID;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  _BOOL4 v44;
  NSObject *v45;
  NSObject *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  CKComposition *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  CKSMSComposeViewServiceController *v57;
  BOOL v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[6];
  uint8_t v64[128];
  uint8_t v65[4];
  uint64_t v66;
  _BYTE buf[24];
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v54 = a3;
  v53 = a4;
  v55 = a5;
  v56 = a6;
  v51 = a7;
  v57 = self;
  -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "composition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v55, "componentsJoinedByString:", CFSTR(", "));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v56;
      _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "setText and subject with addresses: %@ for chatGUID: %@", buf, 0x16u);

    }
  }
  v16 = objc_msgSend(v54, "length");
  v17 = (void *)v16;
  if (v13)
  {
    if (v16)
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v54);
    else
      v18 = 0;
    objc_msgSend(v13, "compositionByAppendingText:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    v23 = [CKComposition alloc];
    objc_msgSend(v22, "text");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v53, "length");
    if (v25)
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v53);
    else
      v26 = 0;
    v58 = v25 == 0;
    objc_msgSend(v22, "shelfPluginPayload");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bizIntent");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "shelfMediaObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "collaborationShareOptions");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "proofreadingInfo");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = -[CKComposition initWithText:subject:shelfPluginPayload:bizIntent:shelfMediaObject:collaborationShareOptions:proofreadingInfo:](v23, "initWithText:subject:shelfPluginPayload:bizIntent:shelfMediaObject:collaborationShareOptions:proofreadingInfo:", v24, v26, v27, v28, v29, v30, v31);

    if (!v58)
    -[CKComposition setShouldHideClearPluginButton:](v52, "setShouldHideClearPluginButton:", v57->_shouldHideClearPluginButton);
    -[CKSMSComposeViewServiceController modalTranscriptController](v57, "modalTranscriptController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setInitialComposition:", 0);
  }
  else
  {
    if (v16)
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v54);
    objc_msgSend(v17, "ck_attributedStringByPostProcessingURLTextForRichLinks");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = [CKComposition alloc];
    if (objc_msgSend(v53, "length"))
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v53);
      v52 = -[CKComposition initWithText:subject:](v20, "initWithText:subject:", v19, v21);

    }
    else
    {
      v52 = -[CKComposition initWithText:subject:](v20, "initWithText:subject:", v19, 0);
    }

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v68 = __Block_byref_object_copy__19;
  v69 = __Block_byref_object_dispose__19;
  v70 = 0;
  -[CKSMSComposeViewServiceController recipientsFromChatGUID:groupName:handles:](v57, "recipientsFromChatGUID:groupName:handles:", v56, v51, v55);
  v70 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count") && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v65 = 0;
      _os_log_impl(&dword_18DFCD000, v32, OS_LOG_TYPE_INFO, "recipientsFromChatGUID returned zero recipients", v65, 2u);
    }

  }
  v33 = objc_msgSend(v55, "count");
  if (v56 || v33)
  {
    if (v56)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v65 = 138412290;
          v66 = (uint64_t)v56;
          _os_log_impl(&dword_18DFCD000, v35, OS_LOG_TYPE_INFO, "Getting recipients for chatGUID: %@", v65, 0xCu);
        }

      }
      -[CKSMSComposeViewServiceController recipientsFromChatGUID:groupName:handles:](v57, "recipientsFromChatGUID:groupName:handles:", v56, v51, 0);
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v36;

    }
  }
  else
  {
    shareSheetSessionID = v57->_shareSheetSessionID;
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __82__CKSMSComposeViewServiceController_setText_subject_addresses_chatGUID_groupName___block_invoke;
    v63[3] = &unk_1E274E1E0;
    v63[4] = v57;
    v63[5] = buf;
    objc_msgSend(MEMORY[0x1E0D96D78], "requestMessagesRecipientInfoForSessionID:completionHandler:", shareSheetSessionID, v63);
  }
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v38 = *(id *)(*(_QWORD *)&buf[8] + 40);
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (v39)
  {
    v40 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v39; ++i)
      {
        if (*(_QWORD *)v60 != v40)
          objc_enumerationMutation(v38);
        v42 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        objc_msgSend(v42, "address");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v43 == 0;

        if (v44 && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v65 = 138412290;
            v66 = (uint64_t)v42;
            _os_log_impl(&dword_18DFCD000, v45, OS_LOG_TYPE_INFO, "found nil address in new recipient %@, this will set atom state to pending...", v65, 0xCu);
          }

        }
      }
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    }
    while (v39);
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      v47 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count");
      *(_DWORD *)v65 = 134217984;
      v66 = v47;
      _os_log_impl(&dword_18DFCD000, v46, OS_LOG_TYPE_INFO, "prepopulating %ld new recipients and new composition", v65, 0xCu);
    }

  }
  -[CKSMSComposeViewServiceController modalTranscriptController](v57, "modalTranscriptController");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setPrepopulatedRecipients:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));

  -[CKSMSComposeViewServiceController modalTranscriptController](v57, "modalTranscriptController");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setPrepopulatedComposition:", v52);

  -[CKSMSComposeViewServiceController _remoteViewControllerProxy](v57, "_remoteViewControllerProxy");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "smsComposeControllerDataInserted");

  _Block_object_dispose(buf, 8);
}

void __82__CKSMSComposeViewServiceController_setText_subject_addresses_chatGUID_groupName___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "recipientsFromChatGUID:groupName:handles:", v7, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
      objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 134218498;
      v17 = v14;
      v18 = 2112;
      v19 = v7;
      v20 = 2112;
      v21 = v15;
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "callback from -[_UIActivityRecipientManager requestMessagesRecipientInfoForSessionID] created %ld newRecipients from chatGUID: %@, handles: %@", (uint8_t *)&v16, 0x20u);

    }
  }

}

- (id)recipientsFromChatGUID:(id)a3 groupName:(id)a4 handles:(id)a5
{
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  _BOOL4 v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint8_t v58[128];
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  v46 = a4;
  v47 = a5;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v47, "componentsJoinedByString:", CFSTR(", "));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v60 = (uint64_t)v48;
      v61 = 2112;
      v62 = (uint64_t)v8;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Getting CNComposeRecipient recipients from chatGUID: %@ handles: %@", buf, 0x16u);

    }
  }
  if (v48)
  {
    objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "existingChatWithGUID:", v48);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  if (v46 && !v10)
  {
    objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "existingChatWithDisplayName:", v46);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v10)
    goto LABEL_36;
  v12 = v10;
  if (objc_msgSend(v10, "joinState") != 3 && objc_msgSend(v10, "joinState") != 2)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v60 = (uint64_t)v10;
        _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_INFO, "Tried to send to a chat we're no longer a part of %@", buf, 0xCu);
      }

    }
    goto LABEL_36;
  }
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "conversationForExistingChat:", v10);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C99DE8];
  +[CKIMGroupComposeRecipient composeRecipientWithConversation:searchTerm:matchingRecipient:](CKIMGroupComposeRecipient, "composeRecipientWithConversation:searchTerm:matchingRecipient:", v44, 0, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayWithObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = objc_msgSend(v16, "count");
      v19 = objc_msgSend(v47, "count");
      *(_DWORD *)buf = 134218240;
      v60 = v18;
      v61 = 2048;
      v62 = v19;
      _os_log_impl(&dword_18DFCD000, v17, OS_LOG_TYPE_INFO, "%ld Recipients of %ld handles populated via -[CKIMGroupComposeRecipient composeRecipientWithConversation]", buf, 0x16u);
    }

  }
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v20 = v16;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v54 != v22)
          objc_enumerationMutation(v20);
        v24 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v24, "address");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25 == 0;

        if (v26 && IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v60 = (uint64_t)v24;
            _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "Recipient (from -[CKIMGroupComposeRecipient composeRecipientWithConversation]) %@ has nil address, this will set atom state to pending...", buf, 0xCu);
          }

        }
      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v21);
  }

  v10 = v12;
  if (!v20)
  {
LABEL_36:
    v45 = v10;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v29, OS_LOG_TYPE_INFO, "Attempting to populate via recipients via -[sRecipientGenerator recipientWithAddress]", buf, 2u);
      }

    }
    v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v47, "count"));
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v30 = v47;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v31; ++j)
        {
          if (*(_QWORD *)v50 != v32)
            objc_enumerationMutation(v30);
          v34 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
          if (CKIsValidAddress(v34))
          {
            +[CKRecipientGenerator sharedRecipientGenerator](CKRecipientGenerator, "sharedRecipientGenerator");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "recipientWithAddress:", v34);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            if (v36)
            {
              objc_msgSend(v36, "address");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = v37 == 0;

              if (v38 && IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v39 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v60 = (uint64_t)v36;
                  _os_log_impl(&dword_18DFCD000, v39, OS_LOG_TYPE_INFO, "Recipient (from -[sRecipientGenerator recipientWithAddress]) %@ has nil address, this will set atom state to pending...", buf, 0xCu);
                }

              }
              objc_msgSend(v20, "addObject:", v36);
            }

          }
        }
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v31);
    }

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        v41 = objc_msgSend(v20, "count");
        v42 = objc_msgSend(v30, "count");
        *(_DWORD *)buf = 134218240;
        v60 = v41;
        v61 = 2048;
        v62 = v42;
        _os_log_impl(&dword_18DFCD000, v40, OS_LOG_TYPE_INFO, "%ld Recipients of %ld handles populated via -[sRecipientGenerator recipientWithAddress]", buf, 0x16u);
      }

    }
    v10 = v45;
  }

  return v20;
}

- (void)setShareSheetSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_shareSheetSessionID, a3);
}

- (void)setPendingAddresses:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPendingAddresses:", v4);

}

- (void)configureForDeviceValidation
{
  -[CKSMSComposeViewServiceController _hostAuditToken](self, "_hostAuditToken");
  if (UIAuditTokenTaskHasEntitlement())
  {
    self->_isDoingUPIDeviceValidation = 1;
    -[CKSMSComposeViewServiceController setCanEditRecipients:](self, "setCanEditRecipients:", 0);
    -[CKSMSComposeViewServiceController setShouldDisableEntryField:](self, "setShouldDisableEntryField:", 1);
  }
  else
  {
    NSLog(CFSTR("Protected API invoked by an unentitled process (pid %i)"), -[CKSMSComposeViewServiceController _hostProcessIdentifier](self, "_hostProcessIdentifier"));
  }
}

- (void)setCanEditRecipients:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (CKIsScreenLocked())
  {
    self->_canEditRecipients = 0;
  }
  else if (self->_canEditRecipients != v3)
  {
    self->_canEditRecipients = v3;
    -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCanEditRecipients:", v3);

  }
}

- (void)setShouldIgnoreEmailsWhenSending:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIgnoreEmailsWhenSending:", v3);

}

- (void)insertFileURLForCollaboration:(id)a3 collaborationShareOptions:(id)a4 metadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7
{
  -[CKSMSComposeViewServiceController insertFileURLForCollaboration:collaborationShareOptions:metadata:sendAsCopyURL:isCollaboration:completionHandler:](self, "insertFileURLForCollaboration:collaborationShareOptions:metadata:sendAsCopyURL:isCollaboration:completionHandler:", a3, a4, a5, a6, a7, 0);
}

- (void)insertCKShareForCollaboration:(id)a3 containerSetupInfo:(id)a4 collaborationShareOptions:(id)a5 isCollaboration:(BOOL)a6
{
  -[CKSMSComposeViewServiceController insertCKShareForCollaboration:containerSetupInfo:collaborationShareOptions:isCollaboration:completionHandler:](self, "insertCKShareForCollaboration:containerSetupInfo:collaborationShareOptions:isCollaboration:completionHandler:", a3, a4, a5, a6, 0);
}

- (void)insertSWYPendingCollaboration:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5
{
  -[CKSMSComposeViewServiceController insertSWYPendingCollaboration:collaborationShareOptions:collaborationMetadata:completionHandler:](self, "insertSWYPendingCollaboration:collaborationShareOptions:collaborationMetadata:completionHandler:", a3, a4, a5, 0);
}

- (void)insertFileURLForCollaboration:(id)a3 collaborationShareOptions:(id)a4 metadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v8 = a7;
  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "insertFileURLForCollaboration:collaborationShareOptions:metadata:sendAsCopyURL:isCollaboration:completionHandler:", v18, v17, v16, v15, v8, v14);

}

- (void)insertSWYPendingCollaboration:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5 completionHandler:(id)a6
{
  -[CKSMSComposeViewServiceController insertSWYPendingCollaboration:collaborationShareOptions:collaborationMetadata:sendAsCopyURL:isCollaboration:completionHandler:](self, "insertSWYPendingCollaboration:collaborationShareOptions:collaborationMetadata:sendAsCopyURL:isCollaboration:completionHandler:", a3, a4, a5, 0, 1, a6);
}

- (void)insertSWYPendingCollaboration:(id)a3 collaborationShareOptions:(id)a4 collaborationMetadata:(id)a5 sendAsCopyURL:(id)a6 isCollaboration:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v8 = a7;
  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "insertSWYPendingCollaboration:collaborationShareOptions:collaborationMetadata:sendAsCopyURL:isCollaboration:completionHandler:", v18, v17, v16, v15, v8, v14);

}

- (void)insertCKShareForCollaboration:(id)a3 containerSetupInfo:(id)a4 collaborationShareOptions:(id)a5 isCollaboration:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  _BYTE v19[22];
  __int16 v20;
  id v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v8 = a6;
  v24 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = CFSTR("NO");
      *(_DWORD *)v19 = 138413058;
      *(_QWORD *)&v19[4] = v12;
      if (v8)
        v17 = CFSTR("YES");
      *(_WORD *)&v19[12] = 2112;
      *(_QWORD *)&v19[14] = v13;
      v20 = 2112;
      v21 = v14;
      v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_18DFCD000, v16, OS_LOG_TYPE_INFO, "Invoking insertCKShareForCollaboration with ckShare:%@, containerSetupInfo:%@, shareOptions:%@, isCollaboration: %@", v19, 0x2Au);
    }

  }
  -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController", *(_OWORD *)v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "insertCKShareForCollaboration:containerSetupInfo:collaborationShareOptions:isCollaboration:completionHandler:", v12, v13, v14, v8, v15);

}

- (void)insertGroupActivity:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "insertGroupActivity called %@", (uint8_t *)&v7, 0xCu);
    }

  }
  -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertGroupActivity:", v4);

}

- (void)setShouldDisableEntryField:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_shouldDisableEntryField != a3)
  {
    v3 = a3;
    self->_shouldDisableEntryField = a3;
    -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShouldDisableEntryField:", v3);

  }
}

- (void)setNavBarTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOverrideTitle:", v4);

}

- (void)disableCameraAttachments
{
  id v2;

  -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableCameraAttachments");

}

- (void)setTextEntryContentsVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextEntryContentsVisible:", v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKSMSComposeViewServiceController;
  -[CKSMSComposeViewServiceController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  +[CKApplicationState setActive:](CKApplicationState, "setActive:", 1);
  -[CKSMSComposeViewServiceController viewControllers](self, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if ((v6 & 1) != 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "CKSMSComposeViewServiceController - viewWillAppear called after modalTranscriptController is pushed!", v9, 2u);
      }

    }
  }
  else
  {
    -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSMSComposeViewServiceController pushViewController:animated:](self, "pushViewController:animated:", v8, 0);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id gameCenterPickerBlock;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v3 = a3;
  if (self->_forceMMS)
  {
    -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "composeRecipientSelectionController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setForceMMS:", 1);

  }
  gameCenterPickerBlock = self->_gameCenterPickerBlock;
  if (gameCenterPickerBlock)
  {
    -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "composeRecipientSelectionController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setGameCenterPickerBlock:", gameCenterPickerBlock);

  }
  objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_forceResumed");

  -[CKSMSComposeViewServiceController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "smsComposeControllerAppeared");

  v13.receiver = self;
  v13.super_class = (Class)CKSMSComposeViewServiceController;
  -[CKSMSComposeViewServiceController viewDidAppear:](&v13, sel_viewDidAppear_, v3);
  +[CKImageAnimationTimer sharedTimer](CKImageAnimationTimer, "sharedTimer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setShouldStopWhenBackgrounded:", 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKSMSComposeViewServiceController;
  -[CKSMSComposeViewServiceController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  +[CKApplicationState setActive:](CKApplicationState, "setActive:", 0);
  +[CKImageAnimationTimer sharedTimer](CKImageAnimationTimer, "sharedTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShouldStopWhenBackgrounded:", 1);

}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)composeChatController:(id)a3 shouldSendComposition:(id)a4 inConversation:(id)a5 completion:(id)a6
{
  id v9;
  void (**v10)(id, uint64_t);
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a6;
  objc_msgSend(a5, "recipientStrings");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (self->_gameCenterPickerBlock)
  {
    v28 = v9;
    -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "composeRecipientSelectionController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "recipients");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v30 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if (objc_msgSend(v14, "isGameCenterRecipient:", v22))
          {
            objc_msgSend(v22, "normalizedAddress");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObject:", v23);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v19);
    }

    if (!objc_msgSend(v16, "count") || (v24 = objc_msgSend(v17, "count"), v24 > objc_msgSend(v12, "count")))
      objc_msgSend(v16, "addObjectsFromArray:", v12);

    v9 = v28;
  }
  else
  {
    v16 = (void *)v11;
  }
  objc_msgSend(v9, "text");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "string");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (CKIsRunningUnitTests()
    || (-[CKSMSComposeViewServiceController _hostAuditToken](self, "_hostAuditToken"),
        !UIAuditTokenTaskHasEntitlement()))
  {
    v10[2](v10, 1);
  }
  else
  {
    -[CKSMSComposeViewServiceController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "smsComposeControllerShouldSendMessageWithText:toRecipients:completion:", v26, v16, v10);

  }
}

- (void)chatController:(id)a3 willSendComposition:(id)a4 inConversation:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v7 = a5;
  if (-[CKSMSComposeViewServiceController supportsMessageInspection](self, "supportsMessageInspection"))
  {
    objc_msgSend(v14, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSMSComposeViewServiceController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setShareSheetHostBundleIdentifier:", v11);

  -[CKSMSComposeViewServiceController donateInteractionWithConversation:](self, "donateInteractionWithConversation:", v7);
  if (self->_isDoingUPIDeviceValidation)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringGUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFirstMessageGUIDOverride:", v12);
  }
  else
  {
    v12 = 0;
  }
  -[CKSMSComposeViewServiceController _takeBackgroundTaskAssertionForMessageSend](self, "_takeBackgroundTaskAssertionForMessageSend");
  -[CKSMSComposeViewServiceController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "smsComposeControllerSendStartedWithText:messageGUID:", v9, v12);

}

- (void)_takeBackgroundTaskAssertionForMessageSend
{
  OUTLINED_FUNCTION_0(&dword_18DFCD000, a1, a3, "Failed to begin messages-view-service-message-send background task", a5, a6, a7, a8, 0);
}

void __79__CKSMSComposeViewServiceController__takeBackgroundTaskAssertionForMessageSend__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v1 = *MEMORY[0x1E0CEB390];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E0CEB390])
  {
    IMLogHandleForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __79__CKSMSComposeViewServiceController__takeBackgroundTaskAssertionForMessageSend__block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v1;
  }
}

void __79__CKSMSComposeViewServiceController__takeBackgroundTaskAssertionForMessageSend__block_invoke_247(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  v1 = *MEMORY[0x1E0CEB390];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E0CEB390])
  {
    IMLogHandleForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_DEFAULT, "Ending messages-view-service-message-send background task due to timer completion.", v5, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v1;
  }
}

- (UIEdgeInsets)initialSystemMinimumLayoutMarginsForChatController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *MEMORY[0x1E0CEB4B0];
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)initialSafeAreaInsetsForChatController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *MEMORY[0x1E0CEB4B0];
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)chatController:(id)a3 requestPresentSendMenu:(id)a4 withPresentationContext:(id)a5 completion:(id)a6
{
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4, a5, a6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKSMSComposeViewServiceController.m"), 796, CFSTR("not implemented"));

}

- (void)chatController:(id)a3 didFinishDismissAnimationForSendMenuViewController:(id)a4
{
  id v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKSMSComposeViewServiceController.m"), 801, CFSTR("not implemented"));

}

- (BOOL)composeChatControllerCanEditRecipients
{
  return self->_canEditRecipients;
}

- (void)composeChatControllerDidCancelComposition:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "composition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shelfPluginPayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKSMSComposeViewServiceController _removeCloudKitShareIfNeeded:](self, "_removeCloudKitShareIfNeeded:", v5);

  -[CKSMSComposeViewServiceController modalTranscriptController](self, "modalTranscriptController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setComposition:", 0);

  -[CKSMSComposeViewServiceController _remoteViewControllerProxy](self, "_remoteViewControllerProxy");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "smsComposeControllerCancelled");

}

- (void)_removeCloudKitShareIfNeeded:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "payloadCollaborationType") == 2)
    {
      objc_msgSend(v4, "cloudKitShare");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isCloudKitShareRemovable");

      if (v6)
      {
        v7 = (void *)MEMORY[0x193FF3C18](CFSTR("CSCloudSharing"), CFSTR("CloudSharing"));
        objc_msgSend(v4, "cloudKitShare");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "containerSetupInfo");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __66__CKSMSComposeViewServiceController__removeCloudKitShareIfNeeded___block_invoke;
        v10[3] = &unk_1E274B1A0;
        v11 = v4;
        objc_msgSend(v7, "removeFromShare:containerSetupInfo:completionHandler:", v8, v9, v10);

      }
    }
  }

}

void __66__CKSMSComposeViewServiceController__removeCloudKitShareIfNeeded___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "cloudKitShare");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412546;
        v11 = v7;
        v12 = 2112;
        v13 = v4;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Error while removing the CloudKt share: %@, Error: %@", (uint8_t *)&v10, 0x16u);

      }
LABEL_9:

    }
  }
  else if (v5)
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "url");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "containerSetupInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Successfully removed CloudKit share with URL: %@, containerSetupInfo: %@ ", (uint8_t *)&v10, 0x16u);

    }
    goto LABEL_9;
  }

}

- (void)composeChatController:(id)a3 didSelectNewConversation:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  unint64_t v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  id v15;

  v15 = a4;
  +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPendingConversation:", v15);

  if (!CKIsRunningInMessagesViewService() || !CKIsScreenLocked())
  {
    objc_msgSend(v15, "chat");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (CKIsRunningInMessagesViewService()
        && (objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"),
            v6 = (void *)objc_claimAutoreleasedReturnValue(),
            v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("ShouldDisableShareSheetHistoryLoad")),
            v6,
            (v7 & 1) != 0))
      {
        v8 = 0;
        v9 = v15;
      }
      else
      {
        v10 = objc_msgSend(v15, "limitToLoad");
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "defaultConversationViewingMessageCount");

        if (v12 >= v10)
          v12 = v10;
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "initialConversationViewingMessageCount");

        v9 = v15;
        if (v12 <= v14)
          v8 = v14;
        else
          v8 = v12;
      }
      objc_msgSend(v9, "setLoadedMessageCount:", v8);
    }
  }

}

- (BOOL)composeChatControllerShouldShowBackButtonViewDuringSendAnimation:(id)a3
{
  return 0;
}

- (BOOL)supportsAttachments
{
  return 1;
}

- (BOOL)supportsMessageInspection
{
  return self->_supportsMessageInspection;
}

+ (id)_exportedInterface
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE1C1838);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x193FF3C18](CFSTR("MSMessage"), CFSTR("Messages"));
  v4 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = v3;
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v5, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_insertRemoteItemForSending_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_insertRemoteItemForSendingAndCalculateEntryViewFrame_completion_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_insertFileURLForCollaboration_collaborationShareOptions_metadata_sendAsCopyURL_isCollaboration_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_insertFileURLForCollaboration_collaborationShareOptions_metadata_sendAsCopyURL_isCollaboration_, 2, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_insertCKShareForCollaboration_containerSetupInfo_collaborationShareOptions_isCollaboration_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_insertCKShareForCollaboration_containerSetupInfo_collaborationShareOptions_isCollaboration_, 2, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_insertSWYPendingCollaboration_collaborationShareOptions_collaborationMetadata_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_insertSWYPendingCollaboration_collaborationShareOptions_collaborationMetadata_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_insertSWYPendingCollaboration_collaborationShareOptions_collaborationMetadata_, 2, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_insertFileURLForCollaboration_collaborationShareOptions_metadata_sendAsCopyURL_isCollaboration_completionHandler_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_insertFileURLForCollaboration_collaborationShareOptions_metadata_sendAsCopyURL_isCollaboration_completionHandler_, 2, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_insertCKShareForCollaboration_containerSetupInfo_collaborationShareOptions_isCollaboration_completionHandler_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_insertCKShareForCollaboration_containerSetupInfo_collaborationShareOptions_isCollaboration_completionHandler_, 2, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_insertSWYPendingCollaboration_collaborationShareOptions_collaborationMetadata_completionHandler_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_insertSWYPendingCollaboration_collaborationShareOptions_collaborationMetadata_completionHandler_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_insertSWYPendingCollaboration_collaborationShareOptions_collaborationMetadata_completionHandler_, 2, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_insertSWYPendingCollaboration_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_completionHandler_, 0, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_insertSWYPendingCollaboration_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_completionHandler_, 1, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_insertSWYPendingCollaboration_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_completionHandler_, 2, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_insertSWYPendingCollaboration_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_completionHandler_, 3, 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_insertSWYPendingCollaboration_collaborationShareOptions_collaborationMetadata_sendAsCopyURL_isCollaboration_completionHandler_, 4, 0);

  return v2;
}

+ (id)_remoteViewControllerInterface
{
  return +[CKSMSComposeRemoteViewController exportedInterface](CKSMSComposeRemoteViewController, "exportedInterface");
}

- (void)donateInteractionWithConversation:(id)a3
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSArray *photoIDs;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  id v32;
  void *v33;
  NSArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  NSArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  uint64_t v49;
  id v50;
  NSArray *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t n;
  uint64_t v56;
  id v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t ii;
  uint64_t v63;
  id v64;
  id v65;
  CKSMSComposeViewServiceController *v66;
  id v67;
  id obj;
  void *v69;
  _QWORD v70[5];
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint64_t v95;
  uint64_t v96;
  Class (*v97)(uint64_t);
  void *v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v65 = a3;
  if (self->_utiTypes || self->_photoIDs || self->_cloudPhotoIDs || self->_contentURLs || self->_contentText)
  {
    v100 = 0;
    v101 = &v100;
    v102 = 0x2050000000;
    v4 = (void *)get_CDInteractionClass_softClass;
    v103 = get_CDInteractionClass_softClass;
    if (!get_CDInteractionClass_softClass)
    {
      v95 = MEMORY[0x1E0C809B0];
      v96 = 3221225472;
      v97 = __get_CDInteractionClass_block_invoke;
      v98 = &unk_1E274A178;
      v99 = &v100;
      __get_CDInteractionClass_block_invoke((uint64_t)&v95);
      v4 = (void *)v101[3];
    }
    v66 = self;
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v100, 8);
    v67 = objc_alloc_init(v5);
    -[CKSMSComposeViewServiceController _hostApplicationBundleIdentifier](v66, "_hostApplicationBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setBundleId:", v6);

    objc_msgSend(v67, "setTargetBundleId:", *MEMORY[0x1E0D96DC0]);
    objc_msgSend(v67, "setDirection:", 1);
    objc_msgSend(v67, "setMechanism:", 13);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setEndDate:", v7);

    objc_msgSend(v65, "chat");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "guid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setDomainIdentifier:", v9);

    v69 = (void *)objc_opt_new();
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    objc_msgSend(v65, "recipients");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v110, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v92 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
          objc_msgSend(v13, "cnContactWithKeys:", MEMORY[0x1E0C9AA60]);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = 0;
          v101 = &v100;
          v102 = 0x2050000000;
          v15 = (void *)get_CDContactClass_softClass;
          v103 = get_CDContactClass_softClass;
          if (!get_CDContactClass_softClass)
          {
            v95 = MEMORY[0x1E0C809B0];
            v96 = 3221225472;
            v97 = __get_CDContactClass_block_invoke;
            v98 = &unk_1E274A178;
            v99 = &v100;
            __get_CDContactClass_block_invoke((uint64_t)&v95);
            v15 = (void *)v101[3];
          }
          v16 = objc_retainAutorelease(v15);
          _Block_object_dispose(&v100, 8);
          v17 = [v16 alloc];
          objc_msgSend(v13, "rawAddress");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "rawAddress");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v19, "_appearsToBeEmail"))
            v20 = 2;
          else
            v20 = 1;
          objc_msgSend(v13, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            v23 = 3;
          else
            v23 = 0;
          v24 = (void *)objc_msgSend(v17, "initWithIdentifier:type:displayName:personId:personIdType:", v18, v20, v21, v22, v23);

          objc_msgSend(v69, "addObject:", v24);
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v110, 16);
      }
      while (v10);
    }

    objc_msgSend(v67, "setRecipients:", v69);
    v25 = (void *)objc_opt_new();
    photoIDs = v66->_photoIDs;
    if (photoIDs || v66->_cloudPhotoIDs)
    {
      v89 = 0u;
      v90 = 0u;
      v87 = 0u;
      v88 = 0u;
      v27 = photoIDs;
      v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v87, v109, 16);
      if (v28)
      {
        v29 = *(_QWORD *)v88;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v88 != v29)
              objc_enumerationMutation(v27);
            v31 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * j);
            v32 = objc_alloc_init((Class)get_CDAttachmentClass());
            v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v31);
            objc_msgSend(v32, "setIdentifier:", v33);

            objc_msgSend(v25, "addObject:", v32);
          }
          v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v87, v109, 16);
        }
        while (v28);
      }

      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      v34 = v66->_cloudPhotoIDs;
      v35 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v83, v108, 16);
      if (v35)
      {
        v36 = *(_QWORD *)v84;
        do
        {
          for (k = 0; k != v35; ++k)
          {
            if (*(_QWORD *)v84 != v36)
              objc_enumerationMutation(v34);
            v38 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * k);
            v39 = objc_alloc_init((Class)get_CDAttachmentClass());
            v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v38);
            objc_msgSend(v39, "setCloudIdentifier:", v40);

            objc_msgSend(v25, "addObject:", v39);
          }
          v35 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v83, v108, 16);
        }
        while (v35);
      }
    }
    else
    {
      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      v45 = v66->_utiTypes;
      v46 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v79, v107, 16);
      if (v46)
      {
        v47 = *(_QWORD *)v80;
        do
        {
          for (m = 0; m != v46; ++m)
          {
            if (*(_QWORD *)v80 != v47)
              objc_enumerationMutation(v45);
            v49 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * m);
            v50 = objc_alloc_init((Class)get_CDAttachmentClass());
            objc_msgSend(v50, "setUti:", v49);
            objc_msgSend(v25, "addObject:", v50);

          }
          v46 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v79, v107, 16);
        }
        while (v46);
      }

      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v51 = v66->_contentURLs;
      v52 = -[NSArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v75, v106, 16);
      if (v52)
      {
        v53 = *(_QWORD *)v76;
        v54 = *MEMORY[0x1E0CA5C90];
        do
        {
          for (n = 0; n != v52; ++n)
          {
            if (*(_QWORD *)v76 != v53)
              objc_enumerationMutation(v51);
            v56 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * n);
            v57 = objc_alloc_init((Class)get_CDAttachmentClass());
            objc_msgSend(v57, "setUti:", v54);
            objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v56);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "setContentURL:", v58);

            objc_msgSend(v25, "addObject:", v57);
          }
          v52 = -[NSArray countByEnumeratingWithState:objects:count:](v51, "countByEnumeratingWithState:objects:count:", &v75, v106, 16);
        }
        while (v52);
      }

      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      v34 = v66->_contentText;
      v59 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v71, v105, 16);
      if (v59)
      {
        v60 = *(_QWORD *)v72;
        v61 = *MEMORY[0x1E0CA5C20];
        do
        {
          for (ii = 0; ii != v59; ++ii)
          {
            if (*(_QWORD *)v72 != v60)
              objc_enumerationMutation(v34);
            v63 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * ii);
            v64 = objc_alloc_init((Class)get_CDAttachmentClass());
            objc_msgSend(v64, "setUti:", v61);
            objc_msgSend(v64, "setContentText:", v63);
            objc_msgSend(v25, "addObject:", v64);

          }
          v59 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v71, v105, 16);
        }
        while (v59);
      }
    }

    objc_msgSend(v67, "setAttachments:", v25);
    v100 = 0;
    v101 = &v100;
    v102 = 0x2050000000;
    v41 = (void *)get_CDInteractionRecorderClass_softClass;
    v103 = get_CDInteractionRecorderClass_softClass;
    if (!get_CDInteractionRecorderClass_softClass)
    {
      v95 = MEMORY[0x1E0C809B0];
      v96 = 3221225472;
      v97 = __get_CDInteractionRecorderClass_block_invoke;
      v98 = &unk_1E274A178;
      v99 = &v100;
      __get_CDInteractionRecorderClass_block_invoke((uint64_t)&v95);
      v41 = (void *)v101[3];
    }
    v42 = objc_retainAutorelease(v41);
    _Block_object_dispose(&v100, 8);
    objc_msgSend(v42, "interactionRecorder");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v67;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v104, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __71__CKSMSComposeViewServiceController_donateInteractionWithConversation___block_invoke;
    v70[3] = &unk_1E274B1A0;
    v70[4] = v66;
    objc_msgSend(v43, "recordInteractions:completionHandler:", v44, v70);

  }
}

void __71__CKSMSComposeViewServiceController_donateInteractionWithConversation___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (CKIsRunningUnitTests())
  {
    objc_msgSend(*(id *)(a1 + 32), "composeDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "composeDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "composeViewServiceController:willDonateToDuetWithUTIs:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1432));

    }
  }
  if (v4 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "recordInteraction failed with error %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (CKModalTranscriptController)modalTranscriptController
{
  return self->_modalTranscriptController;
}

- (void)setModalTranscriptController:(id)a3
{
  objc_storeStrong((id *)&self->_modalTranscriptController, a3);
}

- (BOOL)canEditRecipients
{
  return self->_canEditRecipients;
}

- (BOOL)shouldDisableEntryField
{
  return self->_shouldDisableEntryField;
}

- (BOOL)shouldHideClearPluginButton
{
  return self->_shouldHideClearPluginButton;
}

- (void)setShouldHideClearPluginButton:(BOOL)a3
{
  self->_shouldHideClearPluginButton = a3;
}

- (CKSMSComposeViewServiceControllerDelegate)composeDelegate
{
  return (CKSMSComposeViewServiceControllerDelegate *)objc_loadWeakRetained((id *)&self->_composeDelegate);
}

- (void)setComposeDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_composeDelegate, a3);
}

- (void)setSupportsMessageInspection:(BOOL)a3
{
  self->_supportsMessageInspection = a3;
}

- (NSArray)utiTypes
{
  return self->_utiTypes;
}

- (void)setUtiTypes:(id)a3
{
  objc_storeStrong((id *)&self->_utiTypes, a3);
}

- (NSArray)contentURLs
{
  return self->_contentURLs;
}

- (NSArray)photoIDs
{
  return self->_photoIDs;
}

- (NSArray)cloudPhotoIDs
{
  return self->_cloudPhotoIDs;
}

- (NSArray)contentText
{
  return self->_contentText;
}

- (NSString)shareSheetSessionID
{
  return self->_shareSheetSessionID;
}

- (NSString)serviceId
{
  return self->_serviceId;
}

- (NSString)suggestions
{
  return self->_suggestions;
}

- (id)gameCenterPickerBlock
{
  return self->_gameCenterPickerBlock;
}

- (void)setGameCenterPickerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1496);
}

- (id)entryViewCompletion
{
  return self->_entryViewCompletion;
}

- (void)setEntryViewCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1504);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_entryViewCompletion, 0);
  objc_storeStrong(&self->_gameCenterPickerBlock, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_serviceId, 0);
  objc_storeStrong((id *)&self->_shareSheetSessionID, 0);
  objc_storeStrong((id *)&self->_contentText, 0);
  objc_storeStrong((id *)&self->_cloudPhotoIDs, 0);
  objc_storeStrong((id *)&self->_photoIDs, 0);
  objc_storeStrong((id *)&self->_contentURLs, 0);
  objc_storeStrong((id *)&self->_utiTypes, 0);
  objc_destroyWeak((id *)&self->_composeDelegate);
  objc_storeStrong((id *)&self->_modalTranscriptController, 0);
}

void __79__CKSMSComposeViewServiceController__takeBackgroundTaskAssertionForMessageSend__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18DFCD000, a1, a3, "Background runtime expired prior to messages-view-service-message-send timer completion", a5, a6, a7, a8, 0);
}

@end
