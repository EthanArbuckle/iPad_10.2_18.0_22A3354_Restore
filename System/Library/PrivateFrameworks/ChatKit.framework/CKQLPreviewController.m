@implementation CKQLPreviewController

- (CKQLPreviewController)init
{
  CKQLPreviewController *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKQLPreviewController;
  v2 = -[CKQLPreviewController init](&v5, sel_init);
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    -[QLPreviewController setPresentationStyle:](v2, "setPresentationStyle:", 1);
    -[CKQLPreviewController updateBarButtonItems](v2, "updateBarButtonItems");
    -[CKQLPreviewController addObserver:forKeyPath:options:context:](v2, "addObserver:forKeyPath:options:context:", v2, CFSTR("currentPreviewItemIndex"), 3, 0);
    objc_msgSend(MEMORY[0x1E0D358C0], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerPhotoLibraryPersistenceManagerListener:", v2);

  }
  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("currentPreviewItemIndex")))
  {
    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB2CC8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB2CB8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "integerValue");

    if (v14 != v16)
      -[CKQLPreviewController currentPreviewItemDidChange](self, "currentPreviewItemDidChange");
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)CKQLPreviewController;
    -[CKQLPreviewController observeValueForKeyPath:ofObject:change:context:](&v17, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKQLPreviewController;
  -[QLPreviewController loadView](&v7, sel_loadView);
  -[CKQLPreviewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "theme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBarStyle:", objc_msgSend(v6, "navBarStyle"));

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  CGAffineTransform v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)CKQLPreviewController;
  -[QLPreviewController viewDidAppear:](&v27, sel_viewDidAppear_, a3);
  -[CKQLPreviewController presentationController](self, "presentationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[QLPreviewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invisibleInkEffectControllerForPreviewController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "borrowEffectView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKQLPreviewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v8);

    objc_msgSend(v7, "setSuspended:", 1);
    objc_msgSend(v8, "bounds");
    v11 = v10;
    v13 = v12;
    -[CKQLPreviewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    v16 = v15;
    v18 = v17;

    v19 = fmin(v16 / v11, v18 / v13);
    CGAffineTransformMakeScale(&v26, v19, v19);
    objc_msgSend(v8, "setTransform:", &v26);
    objc_msgSend(v8, "setCenter:", v16 * 0.5, v18 * 0.5);

  }
  if (-[CKQLPreviewController controllerWasDismissed](self, "controllerWasDismissed"))
  {
    -[QLPreviewController delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_opt_respondsToSelector();

    if ((v21 & 1) != 0)
    {
      -[QLPreviewController delegate](self, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "previewControllerDidCancelDismiss:", self);

    }
    -[CKQLPreviewController setControllerWasDismissed:](self, "setControllerWasDismissed:", 0);
  }
  -[QLPreviewController delegate](self, "delegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_opt_respondsToSelector();

  if ((v24 & 1) != 0)
  {
    -[QLPreviewController delegate](self, "delegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "previewController:didTransitionToState:", self, 1);

  }
  -[CKQLPreviewController updateBarButtonItems](self, "updateBarButtonItems");
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v5;
  char v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKQLPreviewController;
  -[QLPreviewController viewWillDisappear:](&v8, sel_viewWillDisappear_);
  if (!a3 && -[CKQLPreviewController isBeingDismissed](self, "isBeingDismissed"))
  {
    -[QLPreviewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[QLPreviewController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "previewController:willTransitionToState:", self, 3);

    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  char v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKQLPreviewController;
  -[QLPreviewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  if (-[CKQLPreviewController isBeingDismissed](self, "isBeingDismissed"))
  {
    -[QLPreviewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[QLPreviewController delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "previewController:didTransitionToState:", self, 3);

    }
  }
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v6 = a4;
  -[CKQLPreviewController setControllerWasDismissed:](self, "setControllerWasDismissed:", 1);
  -[CKQLPreviewController presentationController](self, "presentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[QLPreviewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invisibleInkEffectControllerForPreviewController:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "updateBorrowedEffectViewSnapshot");
  }
  v11.receiver = self;
  v11.super_class = (Class)CKQLPreviewController;
  -[CKQLPreviewController dismissViewControllerAnimated:completion:](&v11, sel_dismissViewControllerAnimated_completion_, v4, v6);

}

- (void)saveTapped:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  uint8_t buf[4];
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKQLPreviewController currentPreviewItem](self, "currentPreviewItem");
  v5 = objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v5;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Attempting to save preview item: %@", buf, 0xCu);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    if (-[NSObject canPerformQuickAction](v7, "canPerformQuickAction"))
    {
      v21 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      CKMomentShareURLForMediaObjects(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUtilities quickSaveConfirmationAlertForMediaObjects:momentShareURL:popoverSource:metricsSource:cancelHandler:preSaveHandler:postSaveHandler:](CKUtilities, "quickSaveConfirmationAlertForMediaObjects:momentShareURL:popoverSource:metricsSource:cancelHandler:preSaveHandler:postSaveHandler:", v10, v9, v4, *MEMORY[0x1E0D388B0], 0, 0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "popoverPresentationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBarButtonItem:", v4);

      if (v11)
        -[CKQLPreviewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

    }
    else if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v7;
        _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "Couldn't save preview item because it wasn't quick save-able. previewItem: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CKQLPreviewController saveTapped:].cold.1((uint64_t)v5, v7, v13, v14, v15, v16, v17, v18);
  }

}

- (void)replyTapped:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKQLPreviewController currentPreviewItem](self, "currentPreviewItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Attempting reply to item: %@", (uint8_t *)&v11, 0xCu);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    -[QLPreviewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[QLPreviewController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "replyButtonTappedForMediaObject:previewController:", v7, self);

    }
  }

}

- (void)tapbackTapped:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  CKFullScreenBalloonViewControllerQuicklook *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKQLPreviewController currentPreviewItem](self, "currentPreviewItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v5;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Showing tapback menu for: %@", (uint8_t *)&v13, 0xCu);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    -[QLPreviewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) == 0)
    {
      v11 = v7;
      goto LABEL_10;
    }
    -[QLPreviewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "chatItemForMediaObject:previewController:", v7, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = -[CKFullScreenBalloonViewControllerQuicklook initWithChatItem:gradientReferenceView:delegate:]([CKFullScreenBalloonViewControllerQuicklook alloc], "initWithChatItem:gradientReferenceView:delegate:", v11, 0, self);
      -[CKFullScreenBalloonViewControllerQuicklook setModalPresentationStyle:](v12, "setModalPresentationStyle:", 5);
      -[CKFullScreenBalloonViewController setUseForcedOrientation:](v12, "setUseForcedOrientation:", 1);
      -[CKFullScreenBalloonViewController setForcedOrientation:](v12, "setForcedOrientation:", 1);
      -[CKQLPreviewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 0, 0);

LABEL_10:
    }
  }

}

- (BOOL)canCurrentPreviewItemQuickSave
{
  void *v2;
  char v3;

  -[CKQLPreviewController currentPreviewItem](self, "currentPreviewItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "canPerformQuickAction");
  else
    v3 = 0;

  return v3;
}

- (void)updateBarButtonItems
{
  OUTLINED_FUNCTION_4(&dword_18DFCD000, a2, a3, "No symbol found for the current acknowledgments state (symbol name candidate:%@)", a5, a6, a7, a8, 2u);
}

- (id)replyButton
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;

  v3 = objc_alloc(MEMORY[0x1E0CEA380]);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "replyImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithImage:style:target:action:", v5, 0, self, sel_replyTapped_);

  -[CKQLPreviewController currentPreviewItem](self, "currentPreviewItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    -[QLPreviewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[QLPreviewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "shouldShowReplyButtonForMediaObject:previewController:", v8, self);

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
  objc_msgSend(v6, "setEnabled:", v12);

  return v6;
}

- (id)currentChatItem
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  -[CKQLPreviewController currentPreviewItem](self, "currentPreviewItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    -[QLPreviewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      -[QLPreviewController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "chatItemForMediaObject:previewController:", v4, self);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CGSize)preferredContentSize
{
  void *v3;
  double v4;
  double v5;
  objc_super v6;
  CGSize result;

  -[CKQLPreviewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *MEMORY[0x1E0C9D820];
    v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CKQLPreviewController;
    -[CKQLPreviewController preferredContentSize](&v6, sel_preferredContentSize);
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)updateCurrentPreviewItemIsSaved:(BOOL)a3 valueDidChange:(BOOL *)a4
{
  _BOOL8 v5;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  NSObject *v13;
  NSObject *v14;
  _BOOL4 v15;
  const __CFString *v16;
  int v17;
  const __CFString *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v5 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  if (a4)
    *a4 = 0;
  -[CKQLPreviewController currentPreviewItem](self, "currentPreviewItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    objc_msgSend(v8, "syndicationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0D358C0], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "cachedCountOfSyndicationIdentifiersSavedToSystemPhotoLibrary:shouldFetchAndNotifyAsNeeded:didStartFetch:", v11, v5, 0) != 0;

    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = -[CKQLPreviewController currentPreviewItemIsSaved](self, "currentPreviewItemIsSaved");
          v16 = CFSTR("NO");
          if (v15)
            v16 = CFSTR("YES");
          v17 = 138412546;
          v18 = v16;
          v19 = 2112;
          v20 = v8;
          _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Not able to derive save state on current preview item because syndicationIdentifier was nil for mediaObject. Keeping previous save state (%@). mediaObject: %@", (uint8_t *)&v17, 0x16u);
        }

      }
      v12 = -[CKQLPreviewController currentPreviewItemIsSaved](self, "currentPreviewItemIsSaved");
    }

    if (v12 != -[CKQLPreviewController currentPreviewItemIsSaved](self, "currentPreviewItemIsSaved"))
      goto LABEL_20;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "currentPreviewItem was not a CKMediaObject. defaulting currentPreviewItemIsSaved to NO", (uint8_t *)&v17, 2u);
      }

    }
    if (-[CKQLPreviewController currentPreviewItemIsSaved](self, "currentPreviewItemIsSaved"))
    {
      v12 = 0;
LABEL_20:
      if (a4)
        *a4 = 1;
      -[CKQLPreviewController setCurrentPreviewItemIsSaved:](self, "setCurrentPreviewItemIsSaved:", v12);
    }
  }

}

- (void)currentPreviewItemDidChange
{
  -[CKQLPreviewController updateCurrentPreviewItemIsSaved:valueDidChange:](self, "updateCurrentPreviewItemIsSaved:valueDidChange:", 1, 0);
  -[CKQLPreviewController updateBarButtonItems](self, "updateBarButtonItems");
}

- (id)currentPreviewItem
{
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CKQLPreviewController;
  -[QLPreviewController currentPreviewItem](&v13, sel_currentPreviewItem);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v5 = -[QLPreviewController currentPreviewItemIndex](self, "currentPreviewItemIndex");
    if (v5 < 1
      || (v6 = v5,
          -[QLPreviewController dataSource](self, "dataSource"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "numberOfPreviewItemsInPreviewController:", self),
          v7,
          v6 >= v8))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "CKQLPreviewController was asked for currentPreviewItem before there were any", v12, 2u);
        }

      }
    }
    else
    {
      -[QLPreviewController dataSource](self, "dataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (id)objc_msgSend(v9, "previewController:previewItemAtIndex:", self, v6);

    }
  }
  return v3;
}

- (id)previewActions
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[QLPreviewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[QLPreviewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "previewActionsForPreviewController:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v6;
}

- (void)photoLibraryPersistedSyndicatedAssetSetDidChange
{
  char v3;

  v3 = 0;
  -[CKQLPreviewController updateCurrentPreviewItemIsSaved:valueDidChange:](self, "updateCurrentPreviewItemIsSaved:valueDidChange:", 0, &v3);
  if (v3)
    -[CKQLPreviewController updateBarButtonItems](self, "updateBarButtonItems");
}

- (id)contextualChatItemsForFullScreenBalloonViewController:(id)a3
{
  void *v4;
  void *v5;

  -[QLPreviewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "contextualCKChatItemsForPreviewController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

- (void)fullScreenBalloonViewController:(id)a3 sendMessageAcknowledgment:(int64_t)a4 forChatItem:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  int64_t v12;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__CKQLPreviewController_fullScreenBalloonViewController_sendMessageAcknowledgment_forChatItem___block_invoke;
  v10[3] = &unk_1E274A420;
  v11 = v8;
  v12 = a4;
  v10[4] = self;
  v9 = v8;
  -[CKQLPreviewController _dismissFullScreenBubbleViewController:animated:withSendAnimation:completion:](self, "_dismissFullScreenBubbleViewController:animated:withSendAnimation:completion:", a3, 1, 1, v10);

}

void __95__CKQLPreviewController_fullScreenBalloonViewController_sendMessageAcknowledgment_forChatItem___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendMessageAcknowledgment:chatItem:previewController:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
}

- (CGRect)tapbackButtonFrameForFullScreenBalloonViewController:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[QLPreviewController frameForAdditionalButtonWithActionName:](self, "frameForAdditionalButtonWithActionName:", sel_tapbackTapped_);
  }
  else
  {
    v4 = *MEMORY[0x1E0C9D648];
    v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (BOOL)fullScreenBalloonViewControllerPickerViewUsesBottomTail:(id)a3
{
  double y;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double MaxY;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;
  CGRect v22;
  CGRect v23;

  v21 = *MEMORY[0x1E0C80C00];
  -[CKQLPreviewController tapbackButtonFrameForFullScreenBalloonViewController:](self, "tapbackButtonFrameForFullScreenBalloonViewController:", a3);
  y = v22.origin.y;
  if (CGRectIsEmpty(v22))
  {
    IMLogHandleForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CKQLPreviewController fullScreenBalloonViewControllerPickerViewUsesBottomTail:].cold.1(v5);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[CKQLPreviewController childViewControllers](self, "childViewControllers", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
LABEL_6:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v8)
            goto LABEL_6;
          goto LABEL_12;
        }
      }
      v5 = v11;

      if (v5)
      {
        -[NSObject navigationBar](v5, "navigationBar");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "frame");
        MaxY = CGRectGetMaxY(v23);

        if (y < MaxY)
        {
          v14 = 0;
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_12:

      v5 = 0;
    }
  }
  v14 = 1;
LABEL_17:

  return v14;
}

- (id)fullScreenBalloonViewController:(id)a3 balloonViewForChatItem:(id)a4
{
  return 0;
}

- (CGRect)fullScreenBalloonViewController:(id)a3 balloonFrameForChatItem:(id)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[QLPreviewController frameForAdditionalButtonWithActionName:](self, "frameForAdditionalButtonWithActionName:", sel_tapbackTapped_);
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (char)fullScreenBalloonViewControllerAnchorVertialOrientation:(id)a3 withBalloonFrame:(CGRect)a4
{
  double y;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  double MaxY;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CGRect v23;

  y = a4.origin.y;
  v22 = *MEMORY[0x1E0C80C00];
  if (CGRectIsEmpty(a4))
    return 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CKQLPreviewController childViewControllers](self, "childViewControllers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v9)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
    v13 = v12;

    if (v13)
    {
      objc_msgSend(v13, "navigationBar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "frame");
      MaxY = CGRectGetMaxY(v23);

      if (y < MaxY)
      {
        v6 = 1;
        goto LABEL_16;
      }
    }
  }
  else
  {
LABEL_11:

    v13 = 0;
  }
  v6 = 0;
LABEL_16:

  return v6;
}

- (void)fullScreenBalloonViewControllerHandleDismissTap:(id)a3
{
  -[CKQLPreviewController _dismissFullScreenBubbleViewController:animated:withSendAnimation:completion:](self, "_dismissFullScreenBubbleViewController:animated:withSendAnimation:completion:", a3, 1, 0, 0);
}

- (void)fullScreenBalloonViewController:(id)a3 verticallyScrollTranscriptByAmount:(double)a4 animated:(BOOL)a5 duration:(double)a6 completion:(id)a7
{
  if (a7)
    (*((void (**)(id, double, double))a7 + 2))(a7, a4, a6);
}

- (BOOL)fullScreenBalloonViewControllerShouldShowReplyButton:(id)a3
{
  return 0;
}

- (CGRect)fullScreenBalloonViewControllerSafeAreaLayoutFrame:(id)a3
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
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[CKQLPreviewController view](self, "view", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)fullScreenBalloonViewControllerShouldShowHightlightButton:(id)a3 forChatItem:(id)a4
{
  return 0;
}

- (void)fullScreenBalloonViewController:(id)a3 didSelectTapback:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "chatItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKQLPreviewController _sendTapback:targetChatItem:isRemoval:](self, "_sendTapback:targetChatItem:isRemoval:", v6, v7, 0);

  objc_msgSend(v8, "beginDismissal");
}

- (void)fullScreenBalloonViewController:(id)a3 didDeselectTapback:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "chatItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKQLPreviewController _sendTapback:targetChatItem:isRemoval:](self, "_sendTapback:targetChatItem:isRemoval:", v6, v7, 1);

  objc_msgSend(v8, "beginDismissal");
}

- (void)_sendTapback:(id)a3 targetChatItem:(id)a4 isRemoval:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v5 = a5;
  v12 = a3;
  v8 = a4;
  -[QLPreviewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    -[QLPreviewController delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "previewController:sendTapback:targetChatItem:isRemoval:", self, v12, v8, v5);

  }
}

- (BOOL)shouldShowTapbackAttributionForFullScreenBalloonViewController:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[QLPreviewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[QLPreviewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chatItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "previewController:shouldShowTapbackAttributionForChatItem:", self, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)shouldShowTapbackPickerForFullScreenBalloonViewController:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[QLPreviewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[QLPreviewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chatItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "previewController:shouldShowTapbackPickerForChatItem:", self, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)fullScreenBalloonViewControllerShouldEnableStickerTapbacks:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  char v7;

  -[QLPreviewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 0;
  -[QLPreviewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "previewControllerShouldEnableStickerTapbacks:", self);

  return v7;
}

- (id)textInputContextIdentifierForFullScreenBalloonViewController:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;

  -[QLPreviewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[QLPreviewController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textInputContextIdentifierForPreviewController:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_dismissFullScreenBubbleViewController:(id)a3 animated:(BOOL)a4 withSendAnimation:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void (**v14)(_QWORD);
  NSObject *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  CKQLPreviewController *v22;
  id v23;
  uint8_t buf[4];
  const __CFString *v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v7 = a5;
  v8 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "_dismissFullScreenBubbleViewControllerAnimated", buf, 2u);
    }

  }
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __102__CKQLPreviewController__dismissFullScreenBubbleViewController_animated_withSendAnimation_completion___block_invoke;
  v21 = &unk_1E274C2E0;
  v22 = self;
  v13 = v11;
  v23 = v13;
  v14 = (void (**)(_QWORD))_Block_copy(&v18);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      if (v8)
        v16 = CFSTR("YES");
      else
        v16 = CFSTR("NO");
      v17 = _Block_copy(v13);
      *(_DWORD *)buf = 138412802;
      v25 = v16;
      v26 = 1024;
      v27 = v7;
      v28 = 2112;
      v29 = v17;
      _os_log_impl(&dword_18DFCD000, v15, OS_LOG_TYPE_INFO, "_dismissFullScreenBubbleViewControllerAnimated %@:WithSendAnimation: %d, completion %@", buf, 0x1Cu);

    }
  }
  if (CKIsRunningInMessagesTranscriptExtension())
  {
    v14[2](v14);
  }
  else if (v8)
  {
    if (v7)
      objc_msgSend(v10, "performSendAndCloseAnimationWithCompletion:", v14, v18, v19, v20, v21, v22);
    else
      objc_msgSend(v10, "performCancelAnimationWithCompletion:", v14, v18, v19, v20, v21, v22);
  }
  else
  {
    objc_msgSend(v10, "dismissImmediatelyWithNoAnimations", v18, v19, v20, v21, v22);
    v14[2](v14);
  }

}

uint64_t __102__CKQLPreviewController__dismissFullScreenBubbleViewController_animated_withSendAnimation_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 0, 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKQLPreviewController;
  -[QLPreviewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[CKQLPreviewController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (CKChatItem)chatItem
{
  return (CKChatItem *)objc_loadWeakRetained((id *)&self->_chatItem);
}

- (void)setChatItem:(id)a3
{
  objc_storeWeak((id *)&self->_chatItem, a3);
}

- (CKQLPreviewControllerDelegate)chatControllerPreviewDelegate
{
  return (CKQLPreviewControllerDelegate *)objc_loadWeakRetained((id *)&self->_chatControllerPreviewDelegate);
}

- (void)setChatControllerPreviewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_chatControllerPreviewDelegate, a3);
}

- (BOOL)controllerWasDismissed
{
  return self->_controllerWasDismissed;
}

- (void)setControllerWasDismissed:(BOOL)a3
{
  self->_controllerWasDismissed = a3;
}

- (BOOL)suppressRefetchingCurrentHighQualityImage
{
  return self->_suppressRefetchingCurrentHighQualityImage;
}

- (void)setSuppressRefetchingCurrentHighQualityImage:(BOOL)a3
{
  self->_suppressRefetchingCurrentHighQualityImage = a3;
}

- (UIBarButtonItem)tapbackButton
{
  return self->_tapbackButton;
}

- (void)setTapbackButton:(id)a3
{
  objc_storeStrong((id *)&self->_tapbackButton, a3);
}

- (BOOL)currentPreviewItemIsSaved
{
  return self->_currentPreviewItemIsSaved;
}

- (void)setCurrentPreviewItemIsSaved:(BOOL)a3
{
  self->_currentPreviewItemIsSaved = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapbackButton, 0);
  objc_destroyWeak((id *)&self->_chatControllerPreviewDelegate);
  objc_destroyWeak((id *)&self->_chatItem);
}

- (void)saveTapped:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_18DFCD000, a2, a3, "Couldn't save preview item because it wasn't a CKMediaObject. previewItem: %@", a5, a6, a7, a8, 2u);
}

- (void)fullScreenBalloonViewControllerPickerViewUsesBottomTail:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "No tapback button frame found. Unexpected state for tapback picker presentation", v1, 2u);
}

@end
