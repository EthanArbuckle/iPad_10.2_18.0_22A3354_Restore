@implementation SLComposeServiceViewController

- (void)_performCommonInitialization:(id)a3
{
  id v5;
  NSMutableArray *v6;
  NSMutableArray *attachments;
  NSMutableArray *v8;
  NSMutableArray *constraints;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_storeStrong((id *)&self->_serviceIconImage, a3);
  v5 = a3;
  self->_unfulfilledItemProviderRepresentations = 0;
  v6 = (NSMutableArray *)objc_opt_new();
  attachments = self->_attachments;
  self->_attachments = v6;

  v8 = (NSMutableArray *)objc_opt_new();
  constraints = self->_constraints;
  self->_constraints = v8;

  self->_triggerPresentationAnimationOnKeyboard = 1;
  self->_maxImageAttachmentSize = 2048000;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", self, sel_keyboardDidChange_, *MEMORY[0x1E0CEB818], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_keyboardWillShow_, *MEMORY[0x1E0CEB978], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", self, sel_keyboardWillHide_, *MEMORY[0x1E0CEB970], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_networkActivityIndicatorNotification_, SLShowNetworkActivityIndicatorNotification, 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel_networkActivityIndicatorNotification_, SLHideNetworkActivityIndicatorNotification, 0);

  -[SLComposeServiceViewController setShouldForceNonAnimatedTransition:](self, "setShouldForceNonAnimatedTransition:", 1);
}

- (SLComposeServiceViewController)initWithServiceIconImage:(id)a3
{
  uint64_t v3;
  id v5;
  SLComposeServiceViewController *v6;
  SLComposeServiceViewController *v7;
  objc_super v9;

  v5 = a3;
  _SLLog(v3, 6, CFSTR("SLComposeServiceViewController initWithServiceIconImage:"));
  v9.receiver = self;
  v9.super_class = (Class)SLComposeServiceViewController;
  v6 = -[SLComposeServiceViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    -[SLComposeServiceViewController _performCommonInitialization:](v6, "_performCommonInitialization:", v5);

  return v7;
}

- (SLComposeServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v4;
  id v7;
  id v8;
  SLComposeServiceViewController *v9;
  objc_super v11;

  v7 = a4;
  v8 = a3;
  _SLLog(v4, 7, CFSTR("SLComposeServiceViewController initWithNibName:bundle:"));
  v11.receiver = self;
  v11.super_class = (Class)SLComposeServiceViewController;
  v9 = -[SLComposeServiceViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, v8, v7);

  if (v9)
    -[SLComposeServiceViewController _performCommonInitialization:](v9, "_performCommonInitialization:", 0);
  return v9;
}

- (SLComposeServiceViewController)initWithCoder:(id)a3
{
  uint64_t v3;
  id v5;
  SLComposeServiceViewController *v6;
  objc_super v8;

  v5 = a3;
  _SLLog(v3, 7, CFSTR("SLComposeServiceViewController initWithCoder:"));
  v8.receiver = self;
  v8.super_class = (Class)SLComposeServiceViewController;
  v6 = -[SLComposeServiceViewController initWithCoder:](&v8, sel_initWithCoder_, v5);

  if (v6)
    -[SLComposeServiceViewController _performCommonInitialization:](v6, "_performCommonInitialization:", 0);
  return v6;
}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  objc_super v6;

  _SLLog(v2, 7, CFSTR("SLComposeServiceViewController dealloc %@"));
  -[SLComposeServiceViewController _setViewControllerForTrackingSheetSize:](self, "_setViewControllerForTrackingSheetSize:", 0, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)SLComposeServiceViewController;
  -[SLComposeServiceViewController dealloc](&v6, sel_dealloc);
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (id)previewImageSource
{
  SLSheetPreviewImageSource *previewImageSource;
  SLSheetPreviewImageSource *v4;
  SLSheetPreviewImageSource *v5;

  previewImageSource = self->_previewImageSource;
  if (!previewImageSource)
  {
    v4 = objc_alloc_init(SLSheetPreviewImageSource);
    v5 = self->_previewImageSource;
    self->_previewImageSource = v4;

    previewImageSource = self->_previewImageSource;
  }
  return previewImageSource;
}

- (void)_positionSheetViewForViewController:(id)a3
{
  uint64_t v3;
  _BOOL4 v5;
  const __CFString *v6;
  double x;
  double y;
  double width;
  double height;
  void *v11;
  const __CFString *v12;
  id v13;
  CGRect v14;

  v13 = a3;
  v5 = -[SLComposeServiceViewController preventSheetPositionChanges](self, "preventSheetPositionChanges");
  v6 = CFSTR("NO");
  if (v5)
    v6 = CFSTR("YES");
  v12 = v6;
  _SLLog(v3, 7, CFSTR("SLComposeServiceViewController _positionSheetViewForViewController: %@ preventSheetPositionChanges %@"));
  if (!-[SLComposeServiceViewController preventSheetPositionChanges](self, "preventSheetPositionChanges", v13, v12))
  {
    -[SLComposeServiceViewController sheetFrameForViewController:](self, "sheetFrameForViewController:", v13);
    x = v14.origin.x;
    y = v14.origin.y;
    width = v14.size.width;
    height = v14.size.height;
    NSStringFromCGRect(v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _SLLog(v3, 7, CFSTR("SLComposeServiceViewController _positionSheetViewForViewController new sheet frame is %@"));

    -[SLComposeServiceViewController setSheetFrame:](self, "setSheetFrame:", x, y, width, height, v11);
    -[SLComposeServiceViewController _positionVignetteForSheetFrame:](self, "_positionVignetteForSheetFrame:", x, y, width, height);
  }

}

- (void)positionSheetView
{
  uint64_t v2;
  void *v4;
  id v5;

  _SLLog(v2, 7, CFSTR("SLComposeServiceViewController positionSheetView"));
  -[SLComposeServiceViewController navigationController](self, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLComposeServiceViewController _positionSheetViewForViewController:](self, "_positionSheetViewForViewController:", v4);

}

- (void)updateSheetForVerticalSizeClass
{
  uint64_t v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB3B18];
  -[SLComposeServiceViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intrinsicContentSize");
  objc_msgSend(v4, "valueWithCGSize:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v2, 7, CFSTR("SLComposeServiceViewController updateSheetForVerticalSizeClass self.contentView.intrinsicContentSize %@"));

  -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SLComposeServiceViewController contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intrinsicContentSize");
  objc_msgSend(v8, "updateContentViewSize:");

}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SLComposeServiceViewController;
  -[SLComposeServiceViewController traitCollectionDidChange:](&v21, sel_traitCollectionDidChange_, v5);
  -[SLComposeServiceViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "verticalSizeClass");
  v8 = objc_msgSend(v5, "verticalSizeClass");

  if (v7 != v8)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[SLComposeServiceViewController traitCollection](self, "traitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "verticalSizeClass"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "verticalSizeClass"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _SLLog(v3, 7, CFSTR("SLComposeServiceViewController traitCollectionDidChange verticalSizeClass changed to %@ from %@"));

    if (self->_waitingForAnimateAlongsideTransitionBlock)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1, v11, v20);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      _SLLog(v3, 7, CFSTR("SLComposeServiceViewController traitCollectionDidChange skipping work because _waitingForAnimateAlongsideTransitionBlock is %@"));

    }
    else
    {
      _SLLog(v3, 7, CFSTR("SLComposeServiceViewController traitCollectionDidChange calling updateSheetForVerticalSizeClass"));
      -[SLComposeServiceViewController updateSheetForVerticalSizeClass](self, "updateSheetForVerticalSizeClass", v11, v20);
    }
  }
  -[SLComposeServiceViewController traitCollection](self, "traitCollection", v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferredContentSizeCategory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredContentSizeCategory");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToString:", v14);

  if ((v15 & 1) == 0)
  {
    -[SLComposeServiceViewController contentView](self, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "accessoryView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB550]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setFont:", v18);

    }
  }

}

- (void)keyboardWillShow:(id)a3
{
  uint64_t v3;

  _SLLog(v3, 7, CFSTR("keyboardWillShow"));
  if (self->_triggerPresentationAnimationOnKeyboard)
    -[SLComposeServiceViewController _presentSheet](self, "_presentSheet");
}

- (void)showKeyboardAnimated:(BOOL)a3
{
  void *v4;
  void *v5;

  if (!-[SLComposeServiceViewController suppressKeyboard](self, "suppressKeyboard"))
  {
    -[SLComposeServiceViewController contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "becomeFirstResponder");

    if ((UIKeyboardIsAutomaticAppearanceEnabled() & 1) == 0)
      UIKeyboardForceOrderInAutomaticAnimated();
  }
}

- (void)hideKeyboardAnimated:(BOOL)a3
{
  void *v3;
  void *v4;

  -[SLComposeServiceViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resignFirstResponder");

  if ((UIKeyboardIsAutomaticAppearanceEnabled() & 1) == 0)
    UIKeyboardForceOrderOutAutomaticAnimated();
}

- (void)showKeyboardWithAnimationTime:(double)a3
{
  void *v4;

  if (!-[SLComposeServiceViewController suppressKeyboard](self, "suppressKeyboard"))
  {
    -[SLComposeServiceViewController contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "becomeFirstResponder");

    if ((UIKeyboardIsAutomaticAppearanceEnabled() & 1) != 0)
      UIKeyboardOrderInAutomaticFromDirectionWithDuration();
    else
      UIKeyboardForceOrderInAutomaticFromDirectionWithDuration();
  }
}

- (void)hideKeyboardWithAnimationTime:(double)a3
{
  void *v3;

  -[SLComposeServiceViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resignFirstResponder");

  if ((UIKeyboardIsAutomaticAppearanceEnabled() & 1) != 0)
    UIKeyboardOrderOutAutomaticToDirectionWithDuration();
  else
    UIKeyboardForceOrderOutAutomaticToDirectionWithDuration();
}

- (NSNumber)charactersRemaining
{
  return self->_charactersRemaining;
}

- (void)setCharactersRemaining:(NSNumber *)charactersRemaining
{
  void *v4;

  objc_storeStrong((id *)&self->_charactersRemaining, charactersRemaining);
  -[SLComposeServiceViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[SLComposeServiceViewController _updateContentViewWithCharactersRemaining](self, "_updateContentViewWithCharactersRemaining");
}

- (void)_updateContentViewWithCharactersRemaining
{
  NSNumber *charactersRemaining;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  charactersRemaining = self->_charactersRemaining;
  -[SLComposeServiceViewController contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v4;
  if (charactersRemaining)
  {
    objc_msgSend(v4, "accessoryView");
    v5 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v5;
    if (!v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0CEA700]);
      v15 = (id)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB550]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setFont:", v7);

      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setBackgroundColor:", v8);

      objc_msgSend(v15, "setAlpha:", 0.699999988);
    }
    v9 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    objc_msgSend(v9, "stringFromNumber:", self->_charactersRemaining);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v10);

    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextColor:", v11);

    -[SLComposeServiceViewController contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "accessoryView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      -[SLComposeServiceViewController contentView](self, "contentView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAccessoryView:", v15);

    }
  }
  else
  {
    objc_msgSend(v4, "setAccessoryView:", 0);
  }

}

- (UITextView)textView
{
  void *v2;
  void *v3;

  -[SLComposeServiceViewController contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITextView *)v3;
}

- (NSString)contentText
{
  void *v2;
  void *v3;

  -[SLComposeServiceViewController textView](self, "textView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setPlaceholder:(NSString *)placeholder
{
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)&self->_placeholder, placeholder);
  v5 = placeholder;
  -[SLComposeServiceViewController contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "placeholderLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v5);

  -[SLComposeServiceViewController contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "placeholderLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeToFit");

  -[SLComposeServiceViewController contentView](self, "contentView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNeedsLayout");

}

- (id)attachments
{
  return self->_attachments;
}

- (BOOL)isContentValid
{
  return 1;
}

- (void)_addAttachment:(id)a3
{
  uint64_t v3;
  id v5;

  v5 = a3;
  _SLLog(v3, 6, CFSTR("SLComposeServiceViewController _addAttachment: %@"));
  -[NSMutableArray addObject:](self->_attachments, "addObject:", v5, v5);
  if (self->_maxImageAttachmentSize && !objc_msgSend(v5, "type"))
  {
    objc_msgSend(v5, "setDownsampleStatus:", 1);
    -[SLComposeServiceViewController _loadImageAttachmentData:](self, "_loadImageAttachmentData:", v5);
  }
  -[SLComposeServiceViewController validateContent](self, "validateContent");

}

- (BOOL)_areAttachmentsReady
{
  BOOL v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_unfulfilledItemProviderRepresentations)
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[SLComposeServiceViewController attachments](self, "attachments", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "downsampleStatus") == 2 || objc_msgSend(v8, "downsampleStatus") == 1)
        {
          v2 = 0;
          goto LABEL_15;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v2 = 1;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v2 = 1;
  }
LABEL_15:

  return v2;
}

- (void)validateContent
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  id v10;

  -[SLComposeServiceViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length") != 0;
  -[SLComposeServiceViewController contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "placeholderLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v6);

  if (-[SLComposeServiceViewController isContentValid](self, "isContentValid"))
    v9 = -[SLComposeServiceViewController _areAttachmentsReady](self, "_areAttachmentsReady");
  else
    v9 = 0;
  -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPostButtonEnabled:", v9);

}

- (id)URLAttachments
{
  void *v2;
  void *v3;

  -[SLComposeServiceViewController attachments](self, "attachments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsPassingTest:", &__block_literal_global_6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __48__SLComposeServiceViewController_URLAttachments__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "type") == 4
    || objc_msgSend(v2, "type") == 5
    || objc_msgSend(v2, "type") == 6
    || objc_msgSend(v2, "type") == 7;

  return v3;
}

+ (id)_imageAttachmentLoadDownsamplePreviewQueue
{
  if (_imageAttachmentLoadDownsamplePreviewQueue_onceToken != -1)
    dispatch_once(&_imageAttachmentLoadDownsamplePreviewQueue_onceToken, &__block_literal_global_57);
  return (id)_imageAttachmentLoadDownsamplePreviewQueue__queue;
}

void __76__SLComposeServiceViewController__imageAttachmentLoadDownsamplePreviewQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.social.imageAttachmentLoadDownsamplePreview", v2);
  v1 = (void *)_imageAttachmentLoadDownsamplePreviewQueue__queue;
  _imageAttachmentLoadDownsamplePreviewQueue__queue = (uint64_t)v0;

}

- (void)_loadImageAttachmentData:(id)a3
{
  uint64_t v3;
  id v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  void (**v27)(_QWORD, _QWORD, _QWORD);
  _QWORD v28[4];
  id v29;
  id v30;
  id from;
  id location[2];

  v5 = a3;
  if ((objc_msgSend(v5, "startedPayloadLoad") & 1) == 0)
  {
    objc_msgSend(v5, "setStartedPayloadLoad:", 1);
    _SLLog(v3, 7, CFSTR("SLComposeServiceViewController _loadImageAttachmentData: %@"));
    objc_initWeak(location, self);
    objc_initWeak(&from, v5);
    v6 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke;
    v28[3] = &unk_1E7590FE8;
    objc_copyWeak(&v29, location);
    objc_copyWeak(&v30, &from);
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1C3B6C8B8](v28);
    objc_msgSend(v5, "identifier", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "typeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "payload");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v7[2](v7, 0, 0);
    }
    else
    {
      objc_msgSend(v5, "payloadSourceFileURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v5, "payloadSourceFileURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        _SLLog(v3, 7, CFSTR("SLComposeServiceViewController _loadImageAttachmentData: %@ loading from %@"));

        objc_msgSend(v5, "payloadSourceFileURL", v8, v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[SLComposeServiceViewController _imageAttachmentLoadDownsamplePreviewQueue](SLComposeServiceViewController, "_imageAttachmentLoadDownsamplePreviewQueue");
        v14 = objc_claimAutoreleasedReturnValue();
        block[0] = v6;
        block[1] = 3221225472;
        block[2] = __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke_3;
        block[3] = &unk_1E7590408;
        v24 = v13;
        v25 = v8;
        v26 = v10;
        v27 = v7;
        v15 = v13;
        dispatch_async(v14, block);

      }
      else
      {
        _SLLog(v3, 7, CFSTR("SLComposeServiceViewController _loadImageAttachmentData: %@ loading from itemProvider for typeIdentifier %@"));
        +[SLComposeServiceViewController _imageAttachmentLoadDownsamplePreviewQueue](SLComposeServiceViewController, "_imageAttachmentLoadDownsamplePreviewQueue", v8, v10);
        v16 = objc_claimAutoreleasedReturnValue();
        v18[0] = v6;
        v18[1] = 3221225472;
        v18[2] = __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke_4;
        v18[3] = &unk_1E7590408;
        v19 = v9;
        v20 = v10;
        v21 = v8;
        v22 = v7;
        dispatch_async(v16, v18);

        v15 = v19;
      }

    }
    objc_destroyWeak(&v30);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }

}

void __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke_2;
  v9[3] = &unk_1E7590FC0;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  objc_copyWeak(&v13, (id *)(a1 + 40));
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
}

void __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke_2(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && v2)
  {
    if (*(_QWORD *)(a1 + 32))
      objc_msgSend(v2, "setPayload:");
    objc_msgSend(WeakRetained, "_imageAttachmentDataDidLoad:", v2);
  }
  v3 = *(NSObject **)(a1 + 40);
  if (v3)
    dispatch_semaphore_signal(v3);

}

void __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "length"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v1, 7, CFSTR("SLComposeServiceViewController _loadImageAttachmentData: %@ typeIdentifier %@ got data length %@ error%@"));

  (*(void (**)(_QWORD, void *, _QWORD, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v4, 0, v6);
}

void __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke_4(id *a1)
{
  dispatch_semaphore_t v2;
  id v3;
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  dispatch_semaphore_t v9;
  id v10;
  id v11;

  v2 = dispatch_semaphore_create(0);
  v3 = a1[4];
  v4 = a1[5];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke_5;
  v6[3] = &unk_1E7591060;
  v7 = a1[6];
  v8 = a1[5];
  v11 = a1[7];
  v9 = v2;
  v10 = a1[4];
  v5 = v2;
  objc_msgSend(v3, "loadItemForTypeIdentifier:options:completionHandler:", v4, 0, v6);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

}

void __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  dispatch_semaphore_t v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  void *v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  dispatch_semaphore_t v21;
  id v22;

  v6 = a2;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a3;
  objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v6, "length"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v3, 7, CFSTR("SLComposeServiceViewController _loadImageAttachmentData: %@ typeIdentifier %@ got data length %@ error%@"));

  if (v6)
  {
    (*(void (**)(_QWORD, id, _QWORD, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v6, *(_QWORD *)(a1 + 48), v11);
  }
  else
  {
    v12 = dispatch_semaphore_create(0);
    +[SLComposeServiceViewController _imageAttachmentLoadDownsamplePreviewQueue](SLComposeServiceViewController, "_imageAttachmentLoadDownsamplePreviewQueue", v7, v8, v16, v10);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke_6;
    block[3] = &unk_1E7591038;
    v18 = *(id *)(a1 + 56);
    v19 = *(id *)(a1 + 40);
    v20 = *(id *)(a1 + 32);
    v14 = *(id *)(a1 + 64);
    v21 = v12;
    v22 = v14;
    v15 = v12;
    dispatch_async(v13, block);

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }

}

void __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke_6(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke_7;
  v4[3] = &unk_1E7591010;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 64);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "loadItemForTypeIdentifier:options:completionHandler:", v3, 0, v4);
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL);

}

void __59__SLComposeServiceViewController__loadImageAttachmentData___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  UIImage *image;

  image = a2;
  _SLLog(v2, 7, CFSTR("SLComposeServiceViewController _loadImageAttachmentData: %@ typeIdentifier %@ got image %@ error%@"));
  if (image)
  {
    UIImageJPEGRepresentation(image, 0.8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  (*(void (**)(_QWORD, void *, _QWORD, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v5, *(_QWORD *)(a1 + 48), v4);

}

- (void)_imageAttachmentDataDidLoad:(id)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v5 = a3;
  _SLLog(v3, 7, CFSTR("SLComposeServiceViewController _imageAttachmentDataDidLoad: %@"));
  if (objc_msgSend(v5, "downsampleStatus", v5) == 1)
    -[SLComposeServiceViewController _downsampleImageAttachment:](self, "_downsampleImageAttachment:", v5);
  if (objc_msgSend(v5, "needsAnotherPreviewGeneration"))
  {
    -[SLComposeServiceViewController contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "previewView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[SLComposeServiceViewController contentView](self, "contentView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "previewView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, v10);

      -[SLComposeServiceViewController previewImageSource](self, "previewImageSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[SLComposeServiceViewController _imageAttachmentLoadDownsamplePreviewQueue](SLComposeServiceViewController, "_imageAttachmentLoadDownsamplePreviewQueue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __62__SLComposeServiceViewController__imageAttachmentDataDidLoad___block_invoke;
      v13[3] = &unk_1E75910B0;
      objc_copyWeak(&v15, &location);
      v14 = v5;
      objc_msgSend(v11, "previewImageForAttachment:queueToBlockWhileDownsampling:resultBlock:", v14, v12, v13);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
  -[SLComposeServiceViewController validateContent](self, "validateContent");

}

void __62__SLComposeServiceViewController__imageAttachmentDataDidLoad___block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10[2];

  v5 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__SLComposeServiceViewController__imageAttachmentDataDidLoad___block_invoke_2;
  v7[3] = &unk_1E7591088;
  objc_copyWeak(v10, (id *)(a1 + 40));
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v10[1] = *(id *)&a3;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

  objc_destroyWeak(v10);
}

void __62__SLComposeServiceViewController__imageAttachmentDataDidLoad___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v7 = WeakRetained;
    if (v4)
    {
      objc_msgSend(WeakRetained, "setPreviewImage:forAttachment:", v4, *(_QWORD *)(a1 + 40));
    }
    else
    {
      +[SLSheetImagePreviewView fallbackPreviewImage](SLSheetImagePreviewView, "fallbackPreviewImage");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPreviewImage:forAttachment:", v5, *(_QWORD *)(a1 + 40));

    }
    v3 = v7;
    if (*(double *)(a1 + 56) > 0.0)
    {
      v6 = objc_opt_respondsToSelector();
      v3 = v7;
      if ((v6 & 1) != 0)
      {
        objc_msgSend(v7, "setVideoDuration:", *(double *)(a1 + 56));
        v3 = v7;
      }
    }
  }

}

- (void)_downsampleImageAttachment:(id)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;
  id v15[2];
  id location;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", -[SLComposeServiceViewController maxImageAttachmentSize](self, "maxImageAttachmentSize"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v3, 6, CFSTR("SLComposeServiceViewController _downsampleImageAttachment: %@ starting downsampling of attached image to max size %@"));

  objc_msgSend(v5, "setDownsampleStatus:", 2, v5, v11);
  objc_initWeak(&location, self);
  objc_msgSend(v5, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SLComposeServiceViewController maxImageAttachmentSize](self, "maxImageAttachmentSize");
  +[SLComposeServiceViewController _imageAttachmentLoadDownsamplePreviewQueue](SLComposeServiceViewController, "_imageAttachmentLoadDownsamplePreviewQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__SLComposeServiceViewController__downsampleImageAttachment___block_invoke;
  block[3] = &unk_1E7591128;
  v15[1] = v7;
  v13 = v6;
  v14 = v5;
  v9 = v5;
  v10 = v6;
  objc_copyWeak(v15, &location);
  dispatch_async(v8, block);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

void __61__SLComposeServiceViewController__downsampleImageAttachment___block_invoke(uint64_t a1)
{
  dispatch_semaphore_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  NSObject *v8;
  id v9;

  v2 = dispatch_semaphore_create(0);
  v3 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__SLComposeServiceViewController__downsampleImageAttachment___block_invoke_2;
  v6[3] = &unk_1E7591100;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_copyWeak(&v9, (id *)(a1 + 48));
  v5 = v2;
  v8 = v5;
  +[SLImageDownsampling downsampleImageData:toMaxByteSize:resultsHandler:](SLImageDownsampling, "downsampleImageData:toMaxByteSize:resultsHandler:", v4, v3, v6);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  objc_destroyWeak(&v9);
}

void __61__SLComposeServiceViewController__downsampleImageAttachment___block_invoke_2(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__SLComposeServiceViewController__downsampleImageAttachment___block_invoke_3;
  v5[3] = &unk_1E75910D8;
  v6 = a1[4];
  v7 = v3;
  v4 = v3;
  objc_copyWeak(&v9, a1 + 6);
  v8 = a1[5];
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v9);
}

void __61__SLComposeServiceViewController__downsampleImageAttachment___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "length"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v1, 6, CFSTR("SLComposeServiceViewController _downsampleImageAttachment: %@ downsampling complete, data size is %@"));

  objc_msgSend(*(id *)(a1 + 32), "setPayload:", *(_QWORD *)(a1 + 40), v3, v4);
  objc_msgSend(*(id *)(a1 + 32), "setDownsampleStatus:", 3);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
    objc_msgSend(WeakRetained, "validateContent");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (void)_loadPreviewView
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  _SLLog(v2, 6, CFSTR("SLComposeServiceViewController:_loadPreviewView"));
  -[SLComposeServiceViewController loadPreviewView](self, "loadPreviewView");
  v4 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v4;
  if (v4)
  {
    v7 = v4;
    _SLLog(v2, 6, CFSTR("SLComposeServiceViewController:_loadPreviewView preview created: %@"));
    -[SLComposeServiceViewController contentView](self, "contentView", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPreviewView:", v8);

    -[SLComposeServiceViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setNeedsUpdateConstraints");

    -[SLComposeServiceViewController _adjustContentViewIntrinsicHeightForPreviewView](self, "_adjustContentViewIntrinsicHeightForPreviewView");
  }
  else
  {
    _SLLog(v2, 6, CFSTR("Preview view creation failed or not needed"));
  }

}

- (void)_adjustContentViewIntrinsicHeightForPreviewView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  id v18;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_8:

    return;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1)
  {
    -[SLComposeServiceViewController contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "previewView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "intrinsicContentSize");
    v8 = v7;

    v9 = v8 + -90.0 + 120.0;
    if (v9 != 120.0)
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "scale");
      v12 = v11;

      v13 = round(v9 + v9) * 0.5;
      v14 = round(v9);
      if (v12 <= 1.0)
        v15 = v14;
      else
        v15 = v13;
      -[SLComposeServiceViewController contentView](self, "contentView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setIntrinsicSize:forVerticalSizeClass:", 2, *MEMORY[0x1E0CEBDE0], v15);

      -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      -[SLComposeServiceViewController contentView](self, "contentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "intrinsicContentSize");
      objc_msgSend(v18, "updateContentViewSize:");

      goto LABEL_8;
    }
  }
}

- (int64_t)_previewDisplayFormat
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  unint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SLComposeServiceViewController attachments](self, "attachments", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v2);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "type");
        if (v8 > 9)
          v9 = 1;
        else
          v9 = qword_1BCDBBDC8[v8];
        if (v5 <= v9)
          v5 = v9;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (UIView)loadPreviewView
{
  uint64_t v2;
  uint64_t v3;
  SLComposeServiceViewController *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __objc2_class *v9;
  SLSheetPhotoAlbumImageView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SLSheetPhotoAlbumImageView *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  SLSheetPhotoAlbumImageView *v33;
  SLSheetPhotoAlbumImageView *v34;
  SLComposeServiceViewController *v35;
  void (**v36)(_QWORD);
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  void *v42;
  void *v44;
  id v45;
  SLSheetPhotoAlbumImageView *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id obj;
  _QWORD v51[4];
  SLSheetPhotoAlbumImageView *v52;
  void *v53;
  void (**v54)(_QWORD);
  _QWORD v55[4];
  SLSheetPhotoAlbumImageView *v56;
  void *v57;
  SLComposeServiceViewController *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _QWORD v64[3];

  v3 = v2;
  v4 = self;
  v64[1] = *MEMORY[0x1E0C80C00];
  -[SLComposeServiceViewController attachments](self, "attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    switch(-[SLComposeServiceViewController _previewDisplayFormat](v4, "_previewDisplayFormat"))
    {
      case 1:
        -[SLComposeServiceViewController attachments](v4, "attachments");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "firstObjectPassingTest:", &__block_literal_global_98);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
          goto LABEL_30;
        v9 = SLSheetURLPreviewView;
        goto LABEL_28;
      case 2:
        -[SLComposeServiceViewController attachments](v4, "attachments");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "firstObjectPassingTest:", &__block_literal_global_96);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
          goto LABEL_30;
        v9 = SLSheetVideoPreviewView;
        goto LABEL_28;
      case 3:
        -[SLComposeServiceViewController attachments](v4, "attachments");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectsPassingTest:", &__block_literal_global_94);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v47 = v14;
        if (objc_msgSend(v14, "count"))
        {
          v15 = -[SLSheetPhotoAlbumImageView initWithPrincipalAttachments:]([SLSheetPhotoAlbumImageView alloc], "initWithPrincipalAttachments:", v14);
          v8 = 0;
          goto LABEL_32;
        }
        v8 = 0;
        goto LABEL_31;
      case 4:
        -[SLComposeServiceViewController attachments](v4, "attachments");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "firstObjectPassingTest:", &__block_literal_global_100);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
          goto LABEL_30;
        objc_msgSend(v8, "previewImage");
        v17 = objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = (void *)v17;
          v19 = 0;
LABEL_15:

          goto LABEL_16;
        }
        if (objc_msgSend(v8, "itemProviderPreviewType") != 1)
        {
          _SLLog(v2, 7, CFSTR("SLComposeServiceViewController looking for image attachment to act as preview for SLAttachmentDisplayMusicAlbum"));
          -[SLComposeServiceViewController attachments](v4, "attachments");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "firstObjectPassingTest:", &__block_literal_global_103);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = v18 == 0;
          if (v18)
          {
            _SLLog(v2, 7, CFSTR("SLComposeServiceViewController did find image attachment %@"));
            v45 = v18;

            v8 = v45;
          }
          goto LABEL_15;
        }
        v19 = 0;
LABEL_16:
        v15 = objc_alloc_init(SLSheetBevelledImageView);
        -[SLSheetPhotoAlbumImageView setNeedsURLPlaceholderImage:](v15, "setNeedsURLPlaceholderImage:", v19);
LABEL_29:
        v47 = 0;
        goto LABEL_32;
      case 5:
        -[SLComposeServiceViewController attachments](v4, "attachments");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObjectPassingTest:", &__block_literal_global_107);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
          goto LABEL_30;
        objc_msgSend(v8, "previewImage");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {

          goto LABEL_27;
        }
        if (objc_msgSend(v8, "itemProviderPreviewType") == 1
          || (-[SLComposeServiceViewController attachments](v4, "attachments"),
              v23 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v23, "firstObjectPassingTest:", &__block_literal_global_108),
              v24 = objc_claimAutoreleasedReturnValue(),
              v8,
              v23,
              (v8 = (void *)v24) != 0))
        {
LABEL_27:
          v9 = SLSheetBevelledImageView;
LABEL_28:
          v15 = (SLSheetPhotoAlbumImageView *)objc_alloc_init(v9);
          goto LABEL_29;
        }
LABEL_30:
        v47 = 0;
LABEL_31:
        v15 = 0;
LABEL_32:
        _SLLog(v2, 6, CFSTR("SLComposeServiceViewController - preview attachment is %@"));
        v46 = v15;
        _SLLog(v2, 7, CFSTR("SLComposeServiceViewController - previewView %@"));
        if (v8)
        {
          v64[0] = v8;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 1, v15);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[SLSheetImagePreviewView setPrincipalAttachments:](v15, "setPrincipalAttachments:", v25);

        }
        v48 = v8;
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        -[SLSheetImagePreviewView principalAttachments](v15, "principalAttachments", v46);
        obj = (id)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v60;
          do
          {
            v29 = 0;
            v49 = v27;
            do
            {
              if (*(_QWORD *)v60 != v28)
                objc_enumerationMutation(obj);
              v30 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v29);
              objc_msgSend(v30, "previewImage");
              v31 = (void *)objc_claimAutoreleasedReturnValue();

              if (v31)
              {
                objc_msgSend(v30, "previewImage");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                -[SLSheetPhotoAlbumImageView setPreviewImage:forAttachment:](v15, "setPreviewImage:forAttachment:", v32, v30);
              }
              else
              {
                _SLLog(v3, 6, CFSTR("SLComposeServiceViewController - attachment does not have a preview"));
                v55[0] = MEMORY[0x1E0C809B0];
                v55[1] = 3221225472;
                v55[2] = __49__SLComposeServiceViewController_loadPreviewView__block_invoke_9;
                v55[3] = &unk_1E75912A0;
                v33 = v15;
                v34 = v15;
                v56 = v34;
                v57 = v30;
                v35 = v4;
                v58 = v4;
                v36 = (void (**)(_QWORD))MEMORY[0x1C3B6C8B8](v55);
                -[SLSheetImagePreviewView ensurePlaceholderPreviewImage](v34, "ensurePlaceholderPreviewImage");
                objc_msgSend(v30, "itemProvider");
                v37 = objc_claimAutoreleasedReturnValue();
                if (!v37
                  || (v38 = (void *)v37,
                      v39 = v3,
                      v40 = objc_msgSend(v30, "itemProviderPreviewType"),
                      v38,
                      v41 = v40 == 2,
                      v3 = v39,
                      v41))
                {
                  v36[2](v36);
                }
                else
                {
                  _SLLog(v39, 7, CFSTR("SLComposeServiceViewController trying to load itemProvider previewImage"));
                  objc_msgSend(v30, "itemProvider");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  v51[0] = MEMORY[0x1E0C809B0];
                  v51[1] = 3221225472;
                  v51[2] = __49__SLComposeServiceViewController_loadPreviewView__block_invoke_13;
                  v51[3] = &unk_1E75912C8;
                  v52 = v34;
                  v53 = v30;
                  v54 = v36;
                  objc_msgSend(v42, "loadPreviewImageWithOptions:completionHandler:", 0, v51);

                  v3 = v39;
                }
                v27 = v49;

                v32 = v56;
                v4 = v35;
                v15 = v33;
              }

              ++v29;
            }
            while (v27 != v29);
            v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
          }
          while (v27);
        }

        v10 = v15;
        break;
      case 6:
        -[SLComposeServiceViewController attachments](v4, "attachments");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "firstObjectPassingTest:", &__block_literal_global_109);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
          goto LABEL_30;
        v9 = SLSheetPreComposedAppIconImageView;
        goto LABEL_28;
      default:
        -[SLComposeServiceViewController attachments](v4, "attachments");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectAtIndex:", 0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
          goto LABEL_30;
        goto LABEL_27;
    }
  }
  else
  {
    _SLLog(v2, 6, CFSTR("SLComposeServiceViewController - Cannot create preview view with no attachments"));
    v10 = 0;
  }
  return (UIView *)v10;
}

BOOL __49__SLComposeServiceViewController_loadPreviewView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = !objc_msgSend(v2, "type")
    || objc_msgSend(v2, "type") == 2
    || objc_msgSend(v2, "type") == 8
    || objc_msgSend(v2, "type") == 9;

  return v3;
}

BOOL __49__SLComposeServiceViewController_loadPreviewView__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "type") == 8 || objc_msgSend(v2, "type") == 9;

  return v3;
}

BOOL __49__SLComposeServiceViewController_loadPreviewView__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 4;
}

BOOL __49__SLComposeServiceViewController_loadPreviewView__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 5;
}

BOOL __49__SLComposeServiceViewController_loadPreviewView__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  if (objc_msgSend(v2, "type"))
    v3 = objc_msgSend(v2, "type") == 2;
  else
    v3 = 1;

  return v3;
}

BOOL __49__SLComposeServiceViewController_loadPreviewView__block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 6;
}

BOOL __49__SLComposeServiceViewController_loadPreviewView__block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  if (objc_msgSend(v2, "type"))
    v3 = objc_msgSend(v2, "type") == 2;
  else
    v3 = 1;

  return v3;
}

BOOL __49__SLComposeServiceViewController_loadPreviewView__block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 7;
}

void __49__SLComposeServiceViewController_loadPreviewView__block_invoke_9(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  _QWORD block[4];
  int8x16_t v6;
  id v7;

  if ((objc_msgSend(*(id *)(a1 + 32), "generatePreviewImageFromAttachments") & 1) == 0)
  {
    if (!objc_msgSend(*(id *)(a1 + 40), "type")
      || objc_msgSend(*(id *)(a1 + 40), "type") == 2
      || objc_msgSend(*(id *)(a1 + 40), "type") == 8
      || objc_msgSend(*(id *)(a1 + 40), "type") == 9)
    {
      _SLLog(v1, 6, CFSTR("SLComposeServiceViewController - creating preview image for image or video attachment"));
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __49__SLComposeServiceViewController_loadPreviewView__block_invoke_10;
      block[3] = &unk_1E75912A0;
      v6 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
      v7 = *(id *)(a1 + 32);
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
    else
    {
      v3 = *(void **)(a1 + 32);
      +[SLSheetImagePreviewView fallbackPreviewImage](SLSheetImagePreviewView, "fallbackPreviewImage");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setPreviewImage:forAttachment:", v4, *(_QWORD *)(a1 + 40));

    }
  }
}

void __49__SLComposeServiceViewController_loadPreviewView__block_invoke_10(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  int8x16_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "previewImageSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  +[SLComposeServiceViewController _imageAttachmentLoadDownsamplePreviewQueue](SLComposeServiceViewController, "_imageAttachmentLoadDownsamplePreviewQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__SLComposeServiceViewController_loadPreviewView__block_invoke_11;
  v5[3] = &unk_1E7591278;
  v6 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v2, "previewImageForAttachment:queueToBlockWhileDownsampling:resultBlock:", v3, v4, v5);

}

void __49__SLComposeServiceViewController_loadPreviewView__block_invoke_11(uint64_t a1, void *a2, double a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  __int128 v9;
  id v10;
  double v11;

  v5 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SLComposeServiceViewController_loadPreviewView__block_invoke_12;
  block[3] = &unk_1E7591250;
  v8 = v5;
  v9 = *(_OWORD *)(a1 + 32);
  v10 = *(id *)(a1 + 48);
  v11 = a3;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __49__SLComposeServiceViewController_loadPreviewView__block_invoke_12(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 56), "setPreviewImage:forAttachment:", v2, *(_QWORD *)(a1 + 40));
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 40), "payload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

LABEL_6:
    v4 = *(void **)(a1 + 56);
    +[SLSheetImagePreviewView fallbackPreviewImage](SLSheetImagePreviewView, "fallbackPreviewImage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPreviewImage:forAttachment:", v5, *(_QWORD *)(a1 + 40));

    goto LABEL_7;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "type"))
    goto LABEL_6;
  objc_msgSend(*(id *)(a1 + 40), "setNeedsAnotherPreviewGeneration:", 1);
  objc_msgSend(*(id *)(a1 + 48), "_loadImageAttachmentData:", *(_QWORD *)(a1 + 40));
LABEL_7:
  if (*(double *)(a1 + 64) > 0.0 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 56), "setVideoDuration:", *(double *)(a1 + 64));
}

void __49__SLComposeServiceViewController_loadPreviewView__block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;

  v8 = a2;
  _SLLog(v2, 7, CFSTR("SLComposeServiceViewController did load itemProvider previewImage %@ error %{public}@"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SLComposeServiceViewController_loadPreviewView__block_invoke_14;
  block[3] = &unk_1E7590408;
  v10 = v8;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v11 = v4;
  v12 = v5;
  v13 = v6;
  v7 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __49__SLComposeServiceViewController_loadPreviewView__block_invoke_14(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    return objc_msgSend(*(id *)(a1 + 40), "setPreviewImage:forAttachment:", v1, *(_QWORD *)(a1 + 48));
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (void)didSelectPost
{
  id v2;

  if (self->_hostProxy)
  {
    -[SLSheetViewHostProtocol userDidPost](self->_hostProxy, "userDidPost");
  }
  else
  {
    -[SLComposeServiceViewController extensionContext](self, "extensionContext");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "completeRequestReturningItems:completionHandler:", 0, 0);

  }
}

- (void)didSelectCancel
{
  void *v2;
  id v3;

  if (self->_hostProxy)
  {
    -[SLSheetViewHostProtocol userDidCancel](self->_hostProxy, "userDidCancel");
  }
  else
  {
    -[SLComposeServiceViewController extensionContext](self, "extensionContext");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelRequestWithError:", v2);

  }
}

- (void)send
{
  if (!self->_inPostButtonTapped)
    -[SLComposeServiceViewController postButtonTapped:](self, "postButtonTapped:", 0);
}

- (void)cancel
{
  -[SLComposeServiceViewController animateSheetCancelWithDuration:](self, "animateSheetCancelWithDuration:", 0.25);
}

- (NSArray)configurationItems
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)sheetActions
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (void)reloadConfigurationItems
{
  uint64_t v3;
  void *v4;
  id v5;

  if (self->_didFirstSheetActionLoad)
  {
    -[SLComposeServiceViewController configurationItems](self, "configurationItems");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "count"))
    {
      -[SLComposeServiceViewController sheetActions](self, "sheetActions");
      v3 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v3;
    }
    -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setConfigurationItems:", v5);

    -[SLComposeServiceViewController positionSheetView](self, "positionSheetView");
  }
}

- (void)pushConfigurationViewController:(UIViewController *)viewController
{
  UIViewController *v4;
  void *v5;

  v4 = viewController;
  -[UIViewController setExtendedLayoutIncludesOpaqueBars:](v4, "setExtendedLayoutIncludesOpaqueBars:", 1);
  -[UIViewController setEdgesForExtendedLayout:](v4, "setEdgesForExtendedLayout:", 0);
  -[SLComposeServiceViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v4, 1);

  -[SLComposeServiceViewController hideKeyboardAnimated:](self, "hideKeyboardAnimated:", 1);
}

- (void)_setViewControllerForTrackingSheetSize:(id)a3
{
  UIViewController *v4;
  UIViewController *viewControllerForTrackingSheetSize;

  v4 = (UIViewController *)a3;
  -[UIViewController removeObserver:forKeyPath:](self->_viewControllerForTrackingSheetSize, "removeObserver:forKeyPath:", self, CFSTR("preferredContentSize"));
  -[UIViewController addObserver:forKeyPath:options:context:](v4, "addObserver:forKeyPath:options:context:", self, CFSTR("preferredContentSize"), 1, 0);
  viewControllerForTrackingSheetSize = self->_viewControllerForTrackingSheetSize;
  self->_viewControllerForTrackingSheetSize = v4;

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  uint64_t v5;
  id v7;
  id v8;
  BOOL v9;

  v7 = a4;
  _SLLog(v5, 7, CFSTR("navigationController:willShowViewController:animated:"));
  -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = v8 != v7;

  self->_isPresentingActionViewController = v9;
  -[SLComposeServiceViewController _positionSheetViewAnimatedForViewController:](self, "_positionSheetViewAnimatedForViewController:", v7);

  -[SLComposeServiceViewController setPreventSheetPositionChanges:](self, "setPreventSheetPositionChanges:", 1);
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  uint64_t v5;
  id v7;
  id v8;

  v8 = a4;
  _SLLog(v5, 7, CFSTR("navigationController:didShowViewController:"));
  -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v8)
  {
    -[SLComposeServiceViewController _setViewControllerForTrackingSheetSize:](self, "_setViewControllerForTrackingSheetSize:", 0);
    -[SLComposeServiceViewController showKeyboardAnimated:](self, "showKeyboardAnimated:", 1);
  }
  else
  {
    -[SLComposeServiceViewController _setViewControllerForTrackingSheetSize:](self, "_setViewControllerForTrackingSheetSize:", v8);
  }
  -[SLComposeServiceViewController setPreventSheetPositionChanges:](self, "setPreventSheetPositionChanges:", 0);
  -[SLComposeServiceViewController _positionSheetViewAnimatedForViewController:](self, "_positionSheetViewAnimatedForViewController:", v8);

}

- (void)_presentedViewControllerContentSizeDidChange
{
  uint64_t v2;
  const __CFString *v4;
  void *v5;
  const __CFString *v6;
  id v7;

  if (self->_isPresentingActionViewController)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v6 = v4;
  _SLLog(v2, 7, CFSTR("_presentedViewControllerContentSizeDidChange, isPresentingActionViewController=%@"));
  if (self->_isPresentingActionViewController
    || self->_autoCompletionViewController && self->_autoCompletionViewControllerAffectsSheetSize)
  {
    -[SLComposeServiceViewController navigationController](self, "navigationController", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLComposeServiceViewController _positionSheetViewAnimatedForViewController:](self, "_positionSheetViewAnimatedForViewController:", v5);

  }
}

- (void)_positionSheetViewAnimatedForViewController:(id)a3
{
  uint64_t v3;
  id v5;
  __CFString *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;

  v5 = a3;
  _SLLog(v3, 7, CFSTR("_positionSheetViewAnimated"));
  if (self->_hasPresentedSheet)
  {
    if (!-[SLComposeServiceViewController preventSheetPositionChanges](self, "preventSheetPositionChanges"))
    {
      v7 = (void *)MEMORY[0x1E0CEABB0];
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __78__SLComposeServiceViewController__positionSheetViewAnimatedForViewController___block_invoke;
      v8[3] = &unk_1E75912F0;
      v8[4] = self;
      v9 = v5;
      v10 = 0x3FD999999999999ALL;
      objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 2, v8, 0, 0.4, 0.0);

      goto LABEL_7;
    }
    v6 = CFSTR("Not doing _positionSheetViewAnimated, preventSheetPositionChanges == YES");
  }
  else
  {
    v6 = CFSTR("Not doing _positionSheetViewAnimated, _hasPresentedSheet == NO)");
  }
  _SLLog(v3, 7, v6);
LABEL_7:

}

void __78__SLComposeServiceViewController__positionSheetViewAnimatedForViewController___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "sheetView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "_positionSheetViewForViewController:", *(_QWORD *)(a1 + 40));
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v11, "sheetView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  objc_msgSend(v11, "_animateVignetteMaskFromSheetFrame:toSheetFrame:duration:", v4, v6, v8, v10, v12, v13, v14, v15, *(_QWORD *)(a1 + 48));

}

- (void)_animateVignetteMaskFromSheetFrame:(CGRect)a3 toSheetFrame:(CGRect)a4 duration:(double)a5
{
  uint64_t v5;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  void *v15;
  SLSheetMasklayer *vignetteLayer;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  if (!CGRectEqualToRect(a3, a4))
  {
    v22.origin.x = v13;
    v22.origin.y = v12;
    v22.size.width = v11;
    v22.size.height = v10;
    NSStringFromCGRect(v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    NSStringFromCGRect(v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    _SLLog(v5, 7, CFSTR("_animateVignetteMaskFromSheetFrame from %@ to %@"));

    vignetteLayer = self->_vignetteLayer;
    v24.origin.x = v13;
    v24.origin.y = v12;
    v24.size.width = v11;
    v24.size.height = v10;
    v25 = CGRectOffset(v24, 0.0, 0.0);
    v17 = v25.origin.x;
    v18 = v25.origin.y;
    v19 = v25.size.width;
    v20 = v25.size.height;
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v26 = CGRectOffset(v25, 0.0, 0.0);
    -[SLSheetMasklayer animateSheetMaskFromOldSheetFrame:toSheetFrame:duration:](vignetteLayer, "animateSheetMaskFromOldSheetFrame:toSheetFrame:duration:", v17, v18, v19, v20, v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
  }
}

- (void)popConfigurationViewController
{
  void *v3;
  id v4;
  id v5;

  -[SLComposeServiceViewController navigationController](self, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "popToViewController:animated:", v3, 1);

}

- (void)setAutoCompletionViewController:(UIViewController *)autoCompletionViewController
{
  UIViewController *v5;
  UIViewController **p_autoCompletionViewController;
  UIViewController *v7;
  uint64_t v8;
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
  void *v22;
  _QWORD v23[5];
  _QWORD v24[5];

  v5 = autoCompletionViewController;
  p_autoCompletionViewController = &self->_autoCompletionViewController;
  v7 = self->_autoCompletionViewController;
  if (v7 != v5)
  {
    v8 = MEMORY[0x1E0C809B0];
    if (v7)
    {
      if (self->_autoCompletionViewControllerAffectsSheetSize)
      {
        -[UIViewController removeObserver:forKeyPath:](v7, "removeObserver:forKeyPath:", self, CFSTR("preferredContentSize"));
        v7 = *p_autoCompletionViewController;
      }
      *p_autoCompletionViewController = 0;

      self->_autoCompletionViewControllerAffectsSheetSize = 0;
      -[SLComposeServiceViewController navigationController](self, "navigationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "topViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLComposeServiceViewController _positionSheetViewAnimatedForViewController:](self, "_positionSheetViewAnimatedForViewController:", v10);

      -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v8;
      v24[1] = 3221225472;
      v24[2] = __66__SLComposeServiceViewController_setAutoCompletionViewController___block_invoke;
      v24[3] = &unk_1E7590248;
      v24[4] = self;
      objc_msgSend(v11, "dismissAutoCompletionViewControllerWithContentViewChangeBlock:", v24);

      -[SLComposeServiceViewController contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "textView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "becomeFirstResponder");

    }
    if (v5)
    {
      objc_storeStrong((id *)&self->_autoCompletionViewController, autoCompletionViewController);
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "userInterfaceIdiom");

        if (v16 == 1)
        {
          self->_autoCompletionViewControllerAffectsSheetSize = 1;
          -[UIViewController addObserver:forKeyPath:options:context:](v5, "addObserver:forKeyPath:options:context:", self, CFSTR("preferredContentSize"), 1, 0);
        }
      }
      else
      {

      }
      -[SLComposeServiceViewController contentView](self, "contentView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "preflightAutoCompletionModeWithApparentHeight:", 46.0);

      -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v8;
      v23[1] = 3221225472;
      v23[2] = __66__SLComposeServiceViewController_setAutoCompletionViewController___block_invoke_2;
      v23[3] = &unk_1E7590248;
      v23[4] = self;
      objc_msgSend(v18, "presentAutoCompletionViewController:apparentContentHeight:contentViewChangeBlock:", v5, v23, 46.0);

      -[SLComposeServiceViewController contentView](self, "contentView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "textView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "becomeFirstResponder");

      -[SLComposeServiceViewController navigationController](self, "navigationController");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "topViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLComposeServiceViewController _positionSheetViewAnimatedForViewController:](self, "_positionSheetViewAnimatedForViewController:", v22);

    }
  }

}

void __66__SLComposeServiceViewController_setAutoCompletionViewController___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "endAutoCompletionMode");

}

void __66__SLComposeServiceViewController_setAutoCompletionViewController___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "beginAutoCompletionMode");

}

- (void)setPostButtonTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPostButtonTitle:", v4);

}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SLComposeServiceViewController;
  v4 = a3;
  -[SLComposeServiceViewController setTitle:](&v6, sel_setTitle_, v4);
  -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

}

- (void)setServiceIconImage:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_serviceIconImage, a3);
  v5 = a3;
  -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setServiceIconImage:", v5);

}

- (void)cancelButtonTapped:(id)a3
{
  uint64_t v3;

  _SLLog(v3, 6, CFSTR("SLComposeServiceViewController:cancelButtonTapped"));
  -[SLComposeServiceViewController cancel](self, "cancel");
}

- (void)postButtonTapped:(id)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;

  self->_inPostButtonTapped = 1;
  _SLLog(v3, 6, CFSTR("postButtonTapped"));
  -[SLComposeServiceViewController contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEditable:", 0);

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLComposeServiceViewController animateCardSendOrientation:](self, "animateCardSendOrientation:", objc_msgSend(v7, "statusBarOrientation"));

  -[SLComposeServiceViewController hideKeyboardAnimated:](self, "hideKeyboardAnimated:", 1);
}

- (void)animateCardSendOrientation:(int64_t)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _QWORD v18[5];
  _QWORD v19[14];

  _SLLog(v3, 6, CFSTR("SLComposeServiceViewController-animateSendCard"));
  -[SLComposeServiceViewController setPreventSheetPositionChanges:](self, "setPreventSheetPositionChanges:", 1);
  -[SLComposeServiceViewController sheetView](self, "sheetView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SLSheetMasklayer position](self->_vignetteLayer, "position");
  v13 = v12;
  v15 = v14;
  v16 = v11 + v14 - v11;
  -[SLSheetMasklayer removeSheetCutout](self->_vignetteLayer, "removeSheetCutout");
  LODWORD(v17) = 0;
  -[SLSheetMasklayer setOpacity:](self->_vignetteLayer, "setOpacity:", v17);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __61__SLComposeServiceViewController_animateCardSendOrientation___block_invoke;
  v19[3] = &unk_1E7591318;
  v19[6] = v13;
  *(double *)&v19[7] = v15;
  v19[8] = v13;
  *(double *)&v19[9] = v16;
  v19[4] = self;
  v19[5] = 0x3FD6666666666666;
  v19[10] = v7;
  *(double *)&v19[11] = -v11;
  v19[12] = v9;
  *(double *)&v19[13] = v11;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __61__SLComposeServiceViewController_animateCardSendOrientation___block_invoke_2;
  v18[3] = &unk_1E7590968;
  v18[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v19, v18, 0.35, 0.0);
}

void __61__SLComposeServiceViewController_animateCardSendOrientation___block_invoke(uint64_t a1)
{
  double v2;
  float v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  float v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("position"));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(double *)(a1 + 40);
  UIAnimationDragCoefficient();
  objc_msgSend(v22, "setDuration:", v2 * v3);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFromValue:", v4);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setToValue:", v5);

  v6 = *MEMORY[0x1E0CD3048];
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTimingFunction:", v7);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "addAnimation:forKey:", v22, CFSTR("PresentationAnimationTranslation"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "setPosition:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(double *)(a1 + 40);
  UIAnimationDragCoefficient();
  objc_msgSend(v8, "setDuration:", v9 * v10);
  LODWORD(v11) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFromValue:", v12);

  LODWORD(v13) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setToValue:", v14);

  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTimingFunction:", v15);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "addAnimation:forKey:", v8, CFSTR("PresentationAnimationOpacity"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "setPosition:", *(double *)(a1 + 64), *(double *)(a1 + 72));
  LODWORD(v16) = 0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "setOpacity:", v16);
  v17 = *(double *)(a1 + 80);
  v18 = *(double *)(a1 + 88);
  v19 = *(double *)(a1 + 96);
  v20 = *(double *)(a1 + 104);
  objc_msgSend(*(id *)(a1 + 32), "sheetView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFrame:", v17, v18, v19, v20);

}

uint64_t __61__SLComposeServiceViewController_animateCardSendOrientation___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "restoreSheetCutout");
  return objc_msgSend(*(id *)(a1 + 32), "_animateCardSendFinished");
}

- (void)_animateCardSendFinished
{
  uint64_t v2;
  void *v4;

  _SLLog(v2, 7, CFSTR("animateCardSend animation finished"));
  -[SLComposeServiceViewController didSelectPost](self, "didSelectPost");
  -[SLComposeServiceViewController sheetView](self, "sheetView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[SLComposeServiceViewController setPreventSheetPositionChanges:](self, "setPreventSheetPositionChanges:", 0);
}

- (void)_presentSheet
{
  uint64_t v2;

  if (!self->_didCallPresentSheet)
  {
    self->_didCallPresentSheet = 1;
    self->_triggerPresentationAnimationOnKeyboard = 0;
    _SLLog(v2, 7, CFSTR("presentSheet - kicking off presentation of sheet"));
    -[SLComposeServiceViewController animateSheetPresentationWithDuration:](self, "animateSheetPresentationWithDuration:", 0.25);
  }
}

- (void)animateSheetPresentationWithDuration:(double)a3
{
  uint64_t v3;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  void *v11;
  void *v12;
  double v13;
  _QWORD v14[5];
  _QWORD v15[6];
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;

  _SLLog(v3, 7, CFSTR("animateSheetPresentationWithDuration:"));
  -[SLComposeServiceViewController positionSheetView](self, "positionSheetView");
  -[SLComposeServiceViewController sheetView](self, "sheetView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  -[SLComposeServiceViewController _positionVignetteForSheetFrame:](self, "_positionVignetteForSheetFrame:");

  -[SLComposeServiceViewController sheetView](self, "sheetView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 0);

  -[SLComposeServiceViewController setPreventSheetPositionChanges:](self, "setPreventSheetPositionChanges:", 1);
  -[SLComposeServiceViewController sheetView](self, "sheetView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAllowsGroupOpacity:", 0);

  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v17.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v17.c = v10;
  *(_OWORD *)&v17.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGAffineTransformScale(&v18, &v17, 1.26, 1.26);
  -[SLComposeServiceViewController sheetView](self, "sheetView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v18;
  objc_msgSend(v11, "setTransform:", &v16);

  -[SLComposeServiceViewController sheetView](self, "sheetView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlpha:", 0.0);

  LODWORD(v13) = 1.0;
  -[SLSheetMasklayer setOpacity:](self->_vignetteLayer, "setOpacity:", v13);
  -[SLSheetMasklayer removeSheetCutout](self->_vignetteLayer, "removeSheetCutout");
  -[SLSheetMasklayer removeAllAnimations](self->_vignetteLayer, "removeAllAnimations");
  v14[4] = self;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__SLComposeServiceViewController_animateSheetPresentationWithDuration___block_invoke;
  v15[3] = &unk_1E7591340;
  *(double *)&v15[5] = a3;
  v15[4] = self;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__SLComposeServiceViewController_animateSheetPresentationWithDuration___block_invoke_2;
  v14[3] = &unk_1E7590968;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 327680, v15, v14, a3, 0.0);
}

void __71__SLComposeServiceViewController_animateSheetPresentationWithDuration___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  float v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  void *v12;
  _OWORD v13[3];

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(double *)(a1 + 40);
  UIAnimationDragCoefficient();
  objc_msgSend(v2, "setDuration:", v3 * v4);
  LODWORD(v5) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFromValue:", v6);

  LODWORD(v7) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setToValue:", v8);

  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimingFunction:", v9);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "addAnimation:forKey:", v2, CFSTR("PresentationAnimationOpacity"));
  objc_msgSend(*(id *)(a1 + 32), "sheetView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v13[0] = *MEMORY[0x1E0C9BAA8];
  v13[1] = v11;
  v13[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v10, "setTransform:", v13);

  objc_msgSend(*(id *)(a1 + 32), "sheetView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlpha:", 1.0);

}

uint64_t __71__SLComposeServiceViewController_animateSheetPresentationWithDuration___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2;
  const __CFString *v4;
  double v5;
  void *v6;
  void *v7;
  const __CFString *v9;

  v4 = CFSTR("NO");
  if (a2)
    v4 = CFSTR("YES");
  v9 = v4;
  _SLLog(v2, 7, CFSTR("Presentation animation completion, finshed=%@"));
  LODWORD(v5) = 1.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "setOpacity:", v5, v9);
  objc_msgSend(*(id *)(a1 + 32), "sheetView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsGroupOpacity:", 1);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "restoreSheetCutout");
  return objc_msgSend(*(id *)(a1 + 32), "_animateSheetPresentationFinished");
}

- (void)_animateSheetPresentationFinished
{
  -[SLComposeServiceViewController setPreventSheetPositionChanges:](self, "setPreventSheetPositionChanges:", 0);
  self->_hasPresentedSheet = 1;
  -[SLComposeServiceViewController positionSheetView](self, "positionSheetView");
  -[SLComposeServiceViewController presentationAnimationDidFinish](self, "presentationAnimationDidFinish");
}

- (void)animateSheetCancelWithDuration:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  _QWORD v8[5];
  _QWORD v9[6];

  -[SLComposeServiceViewController setPreventSheetPositionChanges:](self, "setPreventSheetPositionChanges:", 1);
  -[SLComposeServiceViewController sheetView](self, "sheetView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsGroupOpacity:", 0);

  -[SLSheetMasklayer removeSheetCutout](self->_vignetteLayer, "removeSheetCutout");
  LODWORD(v7) = 0;
  -[SLSheetMasklayer setOpacity:](self->_vignetteLayer, "setOpacity:", v7);
  v8[4] = self;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__SLComposeServiceViewController_animateSheetCancelWithDuration___block_invoke;
  v9[3] = &unk_1E7591340;
  *(double *)&v9[5] = a3;
  v9[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__SLComposeServiceViewController_animateSheetCancelWithDuration___block_invoke_2;
  v8[3] = &unk_1E7590968;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v9, v8, a3, 0.0);
}

void __65__SLComposeServiceViewController_animateSheetCancelWithDuration___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  float v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  __int128 v10;
  void *v11;
  void *v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform v15;

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(double *)(a1 + 40);
  UIAnimationDragCoefficient();
  objc_msgSend(v2, "setDuration:", v3 * v4);
  LODWORD(v5) = 1.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFromValue:", v6);

  LODWORD(v7) = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setToValue:", v8);

  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimingFunction:", v9);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "addAnimation:forKey:", v2, CFSTR("CancelAnimationOpacity"));
  objc_msgSend(*(id *)(a1 + 32), "hideKeyboardAnimated:", 1);
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v14.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v14.c = v10;
  *(_OWORD *)&v14.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGAffineTransformScale(&v15, &v14, 0.84, 0.84);
  objc_msgSend(*(id *)(a1 + 32), "sheetView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v15;
  objc_msgSend(v11, "setTransform:", &v13);

  objc_msgSend(*(id *)(a1 + 32), "sheetView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAlpha:", 0.0);

}

uint64_t __65__SLComposeServiceViewController_animateSheetCancelWithDuration___block_invoke_2(uint64_t a1)
{
  double v2;

  objc_msgSend(*(id *)(a1 + 32), "_animateSheetCancelFinished");
  LODWORD(v2) = 0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "setOpacity:", v2);
}

- (void)_animateSheetCancelFinished
{
  void *v3;

  -[SLComposeServiceViewController setPreventSheetPositionChanges:](self, "setPreventSheetPositionChanges:", 0);
  -[SLComposeServiceViewController sheetView](self, "sheetView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[SLComposeServiceViewController didSelectCancel](self, "didSelectCancel");
}

- (void)keyboardDidChange:(id)a3
{
  uint64_t v3;

  _SLLog(v3, 6, CFSTR("SLComposeServiceViewController-keyboardDidChange"));
  if (self->_hasPresentedSheet
    && !-[SLComposeServiceViewController preventSheetPositionChanges](self, "preventSheetPositionChanges"))
  {
    -[SLComposeServiceViewController updateKeyboardSize](self, "updateKeyboardSize");
  }
  else if (self->_triggerPresentationAnimationOnKeyboard)
  {
    -[SLComposeServiceViewController _presentSheet](self, "_presentSheet");
  }
}

- (void)updateKeyboardSize
{
  uint64_t v2;

  _SLLog(v2, 6, CFSTR("SLComposeServiceViewController-updateKeyboardSize"));
  -[SLComposeServiceViewController positionSheetView](self, "positionSheetView");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  id v11;
  id v12;
  id v13;
  objc_super v14;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("preferredContentSize")))
  {
    _SLLog(v6, 7, CFSTR("Received KVO for preferredContentSize on presented action VC"));
    -[SLComposeServiceViewController _presentedViewControllerContentSizeDidChange](self, "_presentedViewControllerContentSizeDidChange");
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SLComposeServiceViewController;
    -[SLComposeServiceViewController observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v11, v12, v13, a6);
  }

}

- (void)setSheetFrame:(CGRect)a3
{
  uint64_t v3;
  double height;
  double width;
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v3, 7, CFSTR("SLComposeServiceViewControlller setSheetFrame: %@"));

  -[SLComposeServiceViewController navigationController](self, "navigationController", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFrame:", x, y, width, height);

  -[UIView setFrame:](self->_maskView, "setFrame:", x, y, width, height);
}

- (void)_positionVignetteForSheetFrame:(CGRect)a3
{
  uint64_t v3;
  double height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  SLSheetMasklayer *vignetteLayer;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  NSStringFromCGRect(a3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v3, 7, CFSTR("SLComposeServiceViewControlller _positionVignetteForSheetFrame: %@"));

  -[SLComposeServiceViewController view](self, "view", v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  -[SLComposeServiceViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  -[SLSheetMasklayer setFrame:](self->_vignetteLayer, "setFrame:", 0.0, 0.0, v11, height + v13 + 0.0);

  -[SLSheetMasklayer frame](self->_vignetteLayer, "frame");
  NSStringFromCGRect(v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLSheetMasklayer bounds](self->_vignetteLayer, "bounds");
  NSStringFromCGRect(v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v3, 7, CFSTR("SLComposeServiceViewControlller _positionVignetteForSheetFrame: _vignetteLayer.frame %@ _vignetteLayer.bounds %@"));

  vignetteLayer = self->_vignetteLayer;
  -[SLSheetMasklayer bounds](vignetteLayer, "bounds", v14, v25);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  v29 = CGRectOffset(v28, 0.0, 0.0);
  -[SLSheetMasklayer updateMaskWithBounds:maskRect:](vignetteLayer, "updateMaskWithBounds:maskRect:", v17, v19, v21, v23, v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
}

- (UIView)sheetView
{
  void *v2;
  void *v3;

  -[SLComposeServiceViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (CGSize)_intrinsicSheetSize
{
  void *v3;
  void *v4;
  NSString *v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  CGSize result;

  -[SLComposeServiceViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateIntrinsicContentSize");

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory(v5))
    v6 = 70.0;
  else
    v6 = 44.0;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");

    if (v9 == 1)
    {
      -[SLComposeServiceViewController contentView](self, "contentView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "intrinsicContentSize");
      v12 = v11;
      -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "configurationItems");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v12 + (double)(unint64_t)objc_msgSend(v14, "count") * v6;
      v16 = 44.0;
      goto LABEL_12;
    }
  }
  else
  {

  }
  -[SLComposeServiceViewController traitCollection](self, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "verticalSizeClass") == 2)
    v15 = 44.0;
  else
    v15 = 32.0;

  -[SLComposeServiceViewController contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "intrinsicContentSize");
  v19 = v18;
  -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configurationItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v19 + (double)(unint64_t)objc_msgSend(v14, "count") * v6;
LABEL_12:

  -[SLComposeServiceViewController view](self, "view");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bounds");
  v22 = v21;

  v23 = v22 + -30.0;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "userInterfaceIdiom");

    if (v26 == 1)
    {
      v27 = 390.0;
      goto LABEL_17;
    }
  }
  else
  {

  }
  v27 = 552.0;
LABEL_17:
  if (v23 > v27)
    v23 = v27;
  v28 = v15 + v16;
  v29 = v23;
  result.height = v28;
  result.width = v29;
  return result;
}

- (CGRect)sheetFrameForViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if (v7 != 1
    || (unint64_t)(-[SLComposeServiceViewController interfaceOrientation](self, "interfaceOrientation") - 1) >= 2)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "userInterfaceIdiom");

      if (v12 == 1
        && (unint64_t)(-[SLComposeServiceViewController interfaceOrientation](self, "interfaceOrientation") - 3) < 2)
      {
        v9 = 0.0;
        v8 = 50.0;
        goto LABEL_12;
      }
    }
    else
    {

    }
    v8 = 0.0;
    v9 = 0.5;
    goto LABEL_12;
  }
  v8 = 0.0;
  v9 = 0.550000012;
LABEL_12:
  -[SLComposeServiceViewController sheetFrameForViewController:topSpaceProportion:topSpaceOffset:](self, "sheetFrameForViewController:topSpaceProportion:topSpaceOffset:", v4, v9, v8);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)sheetFrameForViewController:(id)a3 topSpaceProportion:(double)a4 topSpaceOffset:(double)a5
{
  uint64_t v5;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  uint64_t v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  CGRect result;

  v9 = a3;
  objc_msgSend(MEMORY[0x1E0CEA6C8], "sizeForInterfaceOrientation:", -[SLComposeServiceViewController interfaceOrientation](self, "interfaceOrientation"));
  v11 = v10;
  -[SLComposeServiceViewController _intrinsicSheetSize](self, "_intrinsicSheetSize");
  v13 = v12;
  v15 = v14;
  -[SLComposeServiceViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;

  -[SLComposeServiceViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v21 = v20 - v11 - v15;

  v22 = v21 * a4;
  if (v21 * a4 < 20.0)
    v22 = 20.0;
  v23 = v22 + a5;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "scale");
  v26 = v25;

  v27 = round(v23 + v23) * 0.5;
  v28 = round(v23);
  if (v26 <= 1.0)
    v29 = v28;
  else
    v29 = v27;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "userInterfaceIdiom");

    if (v15 > v18 - (v11 + 15.0))
      v33 = v18 - (v11 + 15.0);
    else
      v33 = v15;
    if (v32 == 1)
    {
      v18 = v18 - (v11 + 15.0);
      v15 = v33;
    }
  }
  else
  {

  }
  -[SLComposeServiceViewController view](self, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "bounds");
  v36 = v35;

  if (!self->_isPresentingActionViewController)
  {
    if (!self->_autoCompletionViewController || !self->_autoCompletionViewControllerAffectsSheetSize)
      goto LABEL_24;
    goto LABEL_18;
  }
  -[SLComposeServiceViewController view](self, "view");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "bounds");
  v39 = v38 - v29;
  -[SLComposeServiceViewController _sheetMinBottomMarginForVerticalSizeClass](self, "_sheetMinBottomMarginForVerticalSizeClass");
  v18 = v39 - v40;

  if (!self->_isPresentingActionViewController)
  {
LABEL_18:
    -[UIViewController preferredContentSize](self->_autoCompletionViewController, "preferredContentSize");
    v42 = v43 + 46.0;
    goto LABEL_19;
  }
  objc_msgSend(v9, "preferredContentSize");
  v42 = v41;
LABEL_19:
  -[SLComposeServiceViewController navigationController](self, "navigationController");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "navigationBar");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bounds");
  v47 = v42 + v46;

  if (v47 >= v18)
    v48 = v18;
  else
    v48 = v47;
  if (v48 >= v15)
    v15 = v48;
LABEL_24:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)MEMORY[0x1E0CB37E8];
  -[SLComposeServiceViewController traitCollection](self, "traitCollection");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "numberWithInteger:", objc_msgSend(v52, "horizontalSizeClass"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)MEMORY[0x1E0CB37E8];
  -[SLComposeServiceViewController traitCollection](self, "traitCollection");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "numberWithInteger:", objc_msgSend(v55, "verticalSizeClass"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[SLComposeServiceViewController interfaceOrientation](self, "interfaceOrientation"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", (v36 - v13) * 0.5, v29, v13, v15);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v5, 7, CFSTR("SLComposeServiceViewController sheetFrameForViewController:topSpaceProportion: %@ topSpaceOffset: %@ horizontalSizeClass %@ verticalSizeClass %@ orientation %@ => %@"));

  v58 = (v36 - v13) * 0.5;
  v59 = v29;
  v60 = v13;
  v61 = v15;
  result.size.height = v61;
  result.size.width = v60;
  result.origin.y = v59;
  result.origin.x = v58;
  return result;
}

- (double)_sheetMinBottomMarginForVerticalSizeClass
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  -[SLComposeServiceViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "verticalSizeClass") != 1)
  {

    return 44.0;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (!v5)
      return 22.0;
    return 44.0;
  }

  return 22.0;
}

- (void)_willAppearInRemoteViewController
{
  uint64_t v2;
  dispatch_time_t v4;
  _QWORD block[5];

  _SLLog(v2, 7, CFSTR("willAppearInRemoteViewController start"));
  if (GSEventIsHardwareKeyboardAttached())
  {
    _SLLog(v2, 7, CFSTR("willAppearInRemoteViewController detected physical keyboard, so presenting sheet manually."));
    v4 = dispatch_time(0, 250000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__SLComposeServiceViewController__willAppearInRemoteViewController__block_invoke;
    block[3] = &unk_1E7590248;
    block[4] = self;
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);
  }
  _SLLog(v2, 7, CFSTR("willAppearInRemoteViewController finish"));
}

uint64_t __67__SLComposeServiceViewController__willAppearInRemoteViewController__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentSheet");
}

- (void)setHostProxy:(id)a3
{
  objc_storeStrong((id *)&self->_hostProxy, a3);
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  uint64_t v4;
  double height;
  double width;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL IsIdentity;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  void *v21;
  _QWORD v22[5];
  BOOL v23;
  _QWORD v24[5];
  BOOL v25;
  CGAffineTransform v26;
  objc_super v27;

  height = a3.height;
  width = a3.width;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[SLComposeServiceViewController traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithInteger:", objc_msgSend(v11, "horizontalSizeClass"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[SLComposeServiceViewController traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v14, "verticalSizeClass"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v4, 7, CFSTR("SLComposeServiceViewController viewWillTransitionToSize: %@ withTransitionCoordinator: horizontalSizeClass %@ verticalSizeClass %@"));

  v27.receiver = self;
  v27.super_class = (Class)SLComposeServiceViewController;
  -[SLComposeServiceViewController viewWillTransitionToSize:withTransitionCoordinator:](&v27, sel_viewWillTransitionToSize_withTransitionCoordinator_, v8, width, height, v9, v12, v21);
  if (v8)
    objc_msgSend(v8, "targetTransform");
  else
    memset(&v26, 0, sizeof(v26));
  IsIdentity = CGAffineTransformIsIdentity(&v26);
  -[SLComposeServiceViewController sheetView](self, "sheetView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "frame");
  self->_sheetFrameStartingRotation.origin.x = v17;
  self->_sheetFrameStartingRotation.origin.y = v18;
  self->_sheetFrameStartingRotation.size.width = v19;
  self->_sheetFrameStartingRotation.size.height = v20;

  -[SLComposeServiceViewController setPreventSheetPositionChanges:](self, "setPreventSheetPositionChanges:", 1);
  self->_waitingForAnimateAlongsideTransitionBlock = 1;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __85__SLComposeServiceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v24[3] = &unk_1E7591368;
  v25 = IsIdentity;
  v24[4] = self;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __85__SLComposeServiceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v22[3] = &unk_1E7591368;
  v23 = IsIdentity;
  v22[4] = self;
  objc_msgSend(v8, "animateAlongsideTransition:completion:", v24, v22);

}

void __85__SLComposeServiceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(v5, "transitionDuration");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "isAnimated"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "verticalSizeClass"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v2, 7, CFSTR("SLComposeServiceViewController animateAlongsideTransition: animation block start context.transitionDuration %@ context.isAnimated %@ rotating %@ verticalSizeClass %@"));

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1061) = 0;
  objc_msgSend(*(id *)(a1 + 32), "updateSheetForVerticalSizeClass", v6, v7, v8, v39);
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v11, "navigationController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sheetFrameForViewController:", v13);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bounds");
  v24 = v23;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bounds");
  v27 = v26;

  if (v24 < v27)
    v24 = v27;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bounds");
  v30 = v29;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bounds");
  v33 = v32;

  if (v30 >= v33)
    v34 = v30;
  else
    v34 = v33;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "updateMaskWithBounds:maskRect:", 0.0, 0.0, v24, v34, *(double *)(*(_QWORD *)(a1 + 32) + 1064), *(double *)(*(_QWORD *)(a1 + 32) + 1072), *(double *)(*(_QWORD *)(a1 + 32) + 1080), *(double *)(*(_QWORD *)(a1 + 32) + 1088));
  v35 = *(double **)(a1 + 32);
  objc_msgSend(v5, "transitionDuration");
  v37 = v36;

  objc_msgSend(v35, "_animateVignetteMaskFromSheetFrame:toSheetFrame:duration:", v35[133], v35[134], v35[135], v35[136], v15, v17, v19, v21, v37);
  objc_msgSend(*(id *)(a1 + 32), "sheetView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFrame:", v15, v17, v19, v21);

  _SLLog(v2, 7, CFSTR("SLComposeServiceViewController animateAlongsideTransition: animation block end"));
}

void __85__SLComposeServiceViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "verticalSizeClass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v1, 7, CFSTR("SLComposeServiceViewController animateAlongsideTransition: completion block start, is rotating %@ verticalSizeClass %@"));

  objc_msgSend(*(id *)(a1 + 32), "setPreventSheetPositionChanges:", 0, v3, v6);
  _SLLog(v1, 7, CFSTR("SLComposeServiceViewController animateAlongsideTransition: completion block end"));
}

- (void)loadView
{
  uint64_t v2;
  SLSheetMasklayer *v4;
  void *v5;
  SLSheetMasklayer *v6;
  SLSheetMasklayer *vignetteLayer;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  SLSheetRootViewController *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
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
  SLSheetContentView *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  uint64_t v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  UIImage *serviceIconImage;
  void *v55;
  SLSheetNavigationController *v56;
  void *v57;
  SLSheetNavigationController *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  objc_super v96;

  _SLLog(v2, 6, CFSTR("SLComposeServiceViewController loadView"));
  v96.receiver = self;
  v96.super_class = (Class)SLComposeServiceViewController;
  -[SLComposeServiceViewController loadView](&v96, sel_loadView);
  v4 = [SLSheetMasklayer alloc];
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.400000006);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SLSheetMasklayer initWithBackgroundColor:cornerRadius:](v4, "initWithBackgroundColor:cornerRadius:", v5, 7.0);
  vignetteLayer = self->_vignetteLayer;
  self->_vignetteLayer = v6;

  -[SLSheetMasklayer removeAllAnimations](self->_vignetteLayer, "removeAllAnimations");
  -[SLComposeServiceViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  -[SLSheetMasklayer setFrame:](self->_vignetteLayer, "setFrame:");

  LODWORD(v9) = 0;
  -[SLSheetMasklayer setOpacity:](self->_vignetteLayer, "setOpacity:", v9);
  -[SLSheetMasklayer setNeedsDisplay](self->_vignetteLayer, "setNeedsDisplay");
  -[SLSheetMasklayer setAllowsGroupOpacity:](self->_vignetteLayer, "setAllowsGroupOpacity:", 0);
  -[SLComposeServiceViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSublayer:", self->_vignetteLayer);

  v12 = objc_alloc_init(SLSheetRootViewController);
  -[SLComposeServiceViewController setSheetRootViewController:](self, "setSheetRootViewController:", v12);

  -[SLComposeServiceViewController title](self, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:", v13);

  v15 = *MEMORY[0x1E0CEBC10];
  -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setRowHeight:", v15);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lineHeight");
  v20 = v19 + v19;
  -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setEstimatedRowHeight:", v20);

  -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "tableView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "backgroundView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setOpaque:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "tableView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "backgroundView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setBackgroundColor:", v26);

  -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "tableView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setOpaque:", 0);

  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "tableView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setBackgroundColor:", v32);

  v35 = objc_alloc_init(SLSheetContentView);
  -[SLComposeServiceViewController setContentView:](self, "setContentView:", v35);

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "userInterfaceIdiom");

    if (v38 == 1)
    {
      -[SLComposeServiceViewController contentView](self, "contentView");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      v41 = *MEMORY[0x1E0CEBDE0];
      v42 = 120.0;
      v43 = 2;
      goto LABEL_9;
    }
  }
  else
  {

  }
  -[SLComposeServiceViewController contentView](self, "contentView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = *MEMORY[0x1E0CEBDE0];
  objc_msgSend(v44, "setIntrinsicSize:forVerticalSizeClass:", 2, *MEMORY[0x1E0CEBDE0], 138.0);

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "bounds");
  v48 = v47;

  -[SLComposeServiceViewController contentView](self, "contentView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v48 <= 320.0)
    v42 = 80.0;
  else
    v42 = 97.0;
  v41 = v45;
  v43 = 1;
LABEL_9:
  objc_msgSend(v39, "setIntrinsicSize:forVerticalSizeClass:", v43, v41, v42);

  -[SLComposeServiceViewController contentView](self, "contentView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setContentView:", v49);

  -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setDelegate:", self);

  -[SLComposeServiceViewController title](self, "title");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setTitle:", v52);

  serviceIconImage = self->_serviceIconImage;
  -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setServiceIconImage:", serviceIconImage);

  v56 = [SLSheetNavigationController alloc];
  -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = -[SLSheetNavigationController initWithRootViewController:](v56, "initWithRootViewController:", v57);
  -[SLComposeServiceViewController setNavigationController:](self, "setNavigationController:", v58);

  -[SLComposeServiceViewController navigationController](self, "navigationController");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setDelegate:", self);

  -[SLComposeServiceViewController navigationController](self, "navigationController");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "_setBuiltinTransitionStyle:", 1);

  -[SLComposeServiceViewController navigationController](self, "navigationController");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "willMoveToParentViewController:", self);

  -[SLComposeServiceViewController navigationController](self, "navigationController");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLComposeServiceViewController addChildViewController:](self, "addChildViewController:", v62);

  -[SLComposeServiceViewController view](self, "view");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLComposeServiceViewController navigationController](self, "navigationController");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "view");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addSubview:", v65);

  -[SLComposeServiceViewController navigationController](self, "navigationController");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "didMoveToParentViewController:", self);

  -[SLComposeServiceViewController navigationController](self, "navigationController");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "view");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setAutoresizingMask:", 5);

  -[SLComposeServiceViewController contentView](self, "contentView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "textView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setReturnKeyType:", 0);

  -[SLComposeServiceViewController contentView](self, "contentView");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "textView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setDelegate:", self);

  -[SLComposeServiceViewController placeholder](self, "placeholder");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLComposeServiceViewController contentView](self, "contentView");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "placeholderLabel");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setText:", v73);

  -[SLComposeServiceViewController contentView](self, "contentView");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "placeholderLabel");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "sizeToFit");

  -[SLComposeServiceViewController _updateContentViewWithCharactersRemaining](self, "_updateContentViewWithCharactersRemaining");
  -[SLComposeServiceViewController sheetView](self, "sheetView");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setHidden:", 1);

  -[SLComposeServiceViewController setSuppressKeyboard:](self, "setSuppressKeyboard:", 1);
  -[SLComposeServiceViewController extensionContext](self, "extensionContext");
  v79 = objc_claimAutoreleasedReturnValue();
  if (!v79)
    return;
  v80 = (void *)v79;
  -[SLComposeServiceViewController extensionContext](self, "extensionContext");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v81, "inputItems");
  v82 = objc_claimAutoreleasedReturnValue();
  if (v82)
  {
    v83 = (void *)v82;
    -[SLComposeServiceViewController extensionContext](self, "extensionContext");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "inputItems");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = objc_msgSend(v85, "count");

    if (!v86)
      return;
    -[SLComposeServiceViewController extensionContext](self, "extensionContext");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "inputItems");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "objectAtIndexedSubscript:", 0);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v80, "attributedTitle");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "attributedContentText");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    _SLLog(v2, 7, CFSTR("SLComposeServiceViewController loadView using extensionItem.attributedTitle %@ extensionItem.attributedContentText %@"));

    objc_msgSend(v80, "attributedContentText", v89, v95);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "string");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLComposeServiceViewController contentView](self, "contentView");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v92, "textView");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setText:", v91);

    objc_msgSend(v80, "attachments");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLComposeServiceViewController _convertExtensionItemProvidersToAttachments:](self, "_convertExtensionItemProvidersToAttachments:", v94);

    -[SLComposeServiceViewController validateContent](self, "validateContent");
  }
  else
  {

  }
}

- (void)_convertExtensionItemProvidersToAttachments:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id obj;
  uint64_t v23;
  _QWORD v24[7];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _QWORD v34[5];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v30;
    v21 = *MEMORY[0x1E0CA5B48];
    v20 = *MEMORY[0x1E0CA5C90];
    v19 = *MEMORY[0x1E0CA5BA8];
    v18 = *MEMORY[0x1E0CA5B90];
    v17 = *MEMORY[0x1E0CA5BF8];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v30 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v34[0] = v21;
          v34[1] = v20;
          v34[2] = v19;
          v34[3] = v18;
          v34[4] = v17;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 5);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          v9 = v8;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v26;
            while (2)
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v26 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
                if (objc_msgSend(v7, "hasItemConformingToTypeIdentifier:", v14, v15))
                {
                  v15 = v14;
                  _SLLog(v23, 7, CFSTR("SLComposeServiceViewController got itemProvider conforming to %@"));
                  ++self->_unfulfilledItemProviderRepresentations;
                  v24[0] = MEMORY[0x1E0C809B0];
                  v24[1] = 3221225472;
                  v24[2] = __78__SLComposeServiceViewController__convertExtensionItemProvidersToAttachments___block_invoke;
                  v24[3] = &unk_1E7591390;
                  v24[4] = v14;
                  v24[5] = v7;
                  v24[6] = self;
                  objc_msgSend(v7, "loadItemForTypeIdentifier:options:completionHandler:", v14, 0, v24);
                  goto LABEL_18;
                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
              if (v11)
                continue;
              break;
            }
          }
LABEL_18:

        }
        else
        {
          v15 = objc_opt_class();
          _SLLog(v23, 3, CFSTR("SLComposeServiceViewController ignoring unrecognized attachment class %@"));
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v4);
  }

}

void __78__SLComposeServiceViewController__convertExtensionItemProvidersToAttachments___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v4;
  id v5;
  _QWORD block[5];
  id v7;
  __int128 v8;

  v4 = a2;
  _SLLog(v2, 3, CFSTR("SLComposeServiceViewController got NSURL %@ for %@ error: %@"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__SLComposeServiceViewController__convertExtensionItemProvidersToAttachments___block_invoke_2;
  block[3] = &unk_1E7590BD8;
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = *(_OWORD *)(a1 + 40);
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __78__SLComposeServiceViewController__convertExtensionItemProvidersToAttachments___block_invoke_2(id *a1)
{
  uint64_t v1;
  uint64_t v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  id v8;
  void *v9;
  int v10;
  __objc2_class *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  SLImageAttachment *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  SLURLAttachment *v20;
  uint64_t v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;

  if ((objc_msgSend(a1[4], "isEqualToString:", *MEMORY[0x1E0CA5BA8]) & 1) != 0)
    goto LABEL_3;
  v3 = *MEMORY[0x1E0CA5B90];
  if ((objc_msgSend(a1[4], "isEqualToString:", *MEMORY[0x1E0CA5B90]) & 1) != 0)
    goto LABEL_3;
  v17 = *MEMORY[0x1E0CA5BF8];
  if ((objc_msgSend(a1[4], "isEqualToString:", *MEMORY[0x1E0CA5BF8]) & 1) != 0)
    goto LABEL_18;
  if (!a1[5])
  {
    v6 = 0;
    v4 = 0;
    LOBYTE(v5) = 0;
    goto LABEL_30;
  }
  if (objc_msgSend(a1[6], "hasItemConformingToTypeIdentifier:", v17))
  {
    v35 = v17;
    _SLLog(v1, 7, CFSTR("SLComposeServiceViewController itemProvider also conforms to %@"));
LABEL_18:
    v6 = 0;
    LOBYTE(v5) = 0;
    v7 = 2;
    v4 = 1;
    goto LABEL_4;
  }
  if (objc_msgSend(a1[6], "hasItemConformingToTypeIdentifier:", v3))
  {
    v35 = v3;
    _SLLog(v1, 7, CFSTR("SLComposeServiceViewController itemProvider also conforms to %@"));
LABEL_3:
    v4 = 0;
    LOBYTE(v5) = 0;
    v6 = 1;
    v7 = 1;
    goto LABEL_4;
  }
  objc_msgSend(a1[5], "scheme");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("assets-library"));

  v24 = a1[5];
  if (!v23)
  {
    objc_msgSend(v24, "scheme");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v29, "isEqualToString:", CFSTR("file"));

    if (!v6)
    {
      v4 = 0;
      v7 = 3;
      LOBYTE(v5) = 1;
      goto LABEL_4;
    }
    objc_msgSend(a1[5], "resourceSpecifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "hasCaseInsensitiveSuffix:", CFSTR(".MOV")))
    {

      goto LABEL_18;
    }
    objc_msgSend(a1[5], "resourceSpecifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "hasCaseInsensitiveSuffix:", CFSTR(".MOV?"));

    if ((v32 & 1) != 0)
      goto LABEL_18;
    objc_msgSend(a1[5], "resourceSpecifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "hasCaseInsensitiveSuffix:", CFSTR(".JPG")))
    {

      goto LABEL_3;
    }
    objc_msgSend(a1[5], "resourceSpecifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v34, "hasCaseInsensitiveSuffix:", CFSTR(".JPEG"));

    if (v5)
      goto LABEL_3;
    v6 = 0;
    v4 = 0;
LABEL_30:
    v7 = 0;
    goto LABEL_4;
  }
  objc_msgSend(v24, "resourceSpecifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "rangeOfString:", CFSTR(".MOV?"));
  v27 = v26;

  LOBYTE(v5) = 0;
  v28 = v27 == 0;
  v6 = v27 == 0;
  v4 = !v28;
  if (v28)
    v7 = 1;
  else
    v7 = 2;
LABEL_4:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v1, 3, CFSTR("SLComposeServiceViewController got attachment coarseType %@"));

  if (v6)
  {
    v8 = a1[5];
    if (v8)
    {
      objc_msgSend(v8, "scheme", v36);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("assets-library"));

      if (v10)
      {
        v11 = SLImageAttachment;
LABEL_12:
        v15 = (void *)objc_msgSend([v11 alloc], "initWithAsset:preview:", a1[5], 0);
        goto LABEL_25;
      }
    }
    v16 = -[SLImageAttachment initWithJPEGData:preview:]([SLImageAttachment alloc], "initWithJPEGData:preview:", 0, 0);
  }
  else
  {
    if (!v4)
    {
      if ((v5 & 1) == 0)
      {
        --*((_QWORD *)a1[7] + 122);
        goto LABEL_28;
      }
      objc_msgSend(a1[6], "userInfo", v36);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SLAttachmentURLType"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = [SLURLAttachment alloc];
      if (v19)
        v21 = -[SLURLAttachment initWithURL:ofType:preview:](v20, "initWithURL:ofType:preview:", a1[5], objc_msgSend(v19, "integerValue"), 0);
      else
        v21 = -[SLURLAttachment initWithURL:previewImage:](v20, "initWithURL:previewImage:", a1[5], 0);
      v37 = (id)v21;

      goto LABEL_24;
    }
    v12 = a1[5];
    if (v12)
    {
      objc_msgSend(v12, "scheme", v36);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("assets-library"));

      if (v14)
      {
        v11 = SLVideoAttachment;
        goto LABEL_12;
      }
    }
    v16 = -[SLVideoAttachment initWithVideoData:preview:]([SLVideoAttachment alloc], "initWithVideoData:preview:", 0, 0);
  }
  v37 = v16;
  -[SLAttachment setPayloadSourceFileURL:](v16, "setPayloadSourceFileURL:", a1[5], v36);
LABEL_24:
  v15 = v37;
LABEL_25:
  --*((_QWORD *)a1[7] + 122);
  if (v15)
  {
    v38 = v15;
    objc_msgSend(v15, "setItemProvider:", a1[6]);
    objc_msgSend(v38, "setTypeIdentifier:", a1[4]);
    objc_msgSend(a1[7], "_addAttachment:", v38);

    return;
  }
LABEL_28:
  _SLLog(v1, 3, CFSTR("SLComposeServiceViewController made no attachment for itemProvider conforming to %@"));
  objc_msgSend(a1[7], "validateContent");
}

- (BOOL)shouldAutorotate
{
  return 1;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (void)viewDidLoad
{
  uint64_t v2;
  void *v4;
  objc_super v5;

  _SLLog(v2, 6, CFSTR("SLComposeServiceViewController viewDidLoad"));
  v5.receiver = self;
  v5.super_class = (Class)SLComposeServiceViewController;
  -[SLComposeServiceViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[SLComposeServiceViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsUpdateConstraints");

}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v3;
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v3, 7, CFSTR("SLComposeServiceViewController viewWillAppear: %@ begin"));

  v11.receiver = self;
  v11.super_class = (Class)SLComposeServiceViewController;
  -[SLComposeServiceViewController viewWillAppear:](&v11, sel_viewWillAppear_, v4, v9);
  -[SLComposeServiceViewController updateSheetForVerticalSizeClass](self, "updateSheetForVerticalSizeClass");
  -[SLComposeServiceViewController _loadPreviewView](self, "_loadPreviewView");
  -[SLComposeServiceViewController configurationItems](self, "configurationItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
  {
    -[SLComposeServiceViewController sheetActions](self, "sheetActions");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  -[SLComposeServiceViewController sheetRootViewController](self, "sheetRootViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConfigurationItems:", v6);

  self->_didFirstSheetActionLoad = 1;
  -[SLComposeServiceViewController positionSheetView](self, "positionSheetView");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v3, 7, CFSTR("SLComposeServiceViewController viewWillAppear: %@ end"));

}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v3;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v3, 7, CFSTR("SLComposeServiceViewController viewDidAppear: %@"));

  self->_wasPresented = 1;
  -[SLComposeServiceViewController setSuppressKeyboard:](self, "setSuppressKeyboard:", 0, v5);
  -[SLComposeServiceViewController showKeyboardAnimated:](self, "showKeyboardAnimated:", 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  -[SLSheetPreviewImageSource cancelVideoPreviewGeneration](self->_previewImageSource, "cancelVideoPreviewGeneration", a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SLComposeServiceViewController;
  -[SLComposeServiceViewController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
}

- (void)didReceiveMemoryWarning
{
  uint64_t v2;
  objc_super v4;

  _SLLog(v2, 6, CFSTR("SheetViewController didReceiveMemoryWarning"));
  v4.receiver = self;
  v4.super_class = (Class)SLComposeServiceViewController;
  -[SLComposeServiceViewController didReceiveMemoryWarning](&v4, sel_didReceiveMemoryWarning);
}

- (void)shouldShowNetworkActivityIndicator:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[SLComposeServiceViewController extensionContext](self, "extensionContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shouldShowNetworkActivityIndicator:", v4);

}

- (void)networkActivityIndicatorNotification:(id)a3
{
  id v4;

  objc_msgSend(a3, "name");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SLComposeServiceViewController shouldShowNetworkActivityIndicator:](self, "shouldShowNetworkActivityIndicator:", objc_msgSend(v4, "isEqualToString:", SLShowNetworkActivityIndicatorNotification));

}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (UIViewController)autoCompletionViewController
{
  return self->_autoCompletionViewController;
}

- (SLSheetContentView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (NSMutableArray)constraints
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1128, 1);
}

- (void)setConstraints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1128);
}

- (SLSheetRootViewController)sheetRootViewController
{
  return self->_sheetRootViewController;
}

- (void)setSheetRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->_sheetRootViewController, a3);
}

- (SLSheetNavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (BOOL)preventSheetPositionChanges
{
  return self->_preventSheetPositionChanges;
}

- (void)setPreventSheetPositionChanges:(BOOL)a3
{
  self->_preventSheetPositionChanges = a3;
}

- (BOOL)wasPresented
{
  return self->_wasPresented;
}

- (BOOL)suppressKeyboard
{
  return self->_suppressKeyboard;
}

- (void)setSuppressKeyboard:(BOOL)a3
{
  self->_suppressKeyboard = a3;
}

- (unint64_t)maxImageAttachmentSize
{
  return self->_maxImageAttachmentSize;
}

- (void)setMaxImageAttachmentSize:(unint64_t)a3
{
  self->_maxImageAttachmentSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_sheetRootViewController, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_autoCompletionViewController, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_viewControllerForTrackingSheetSize, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_previewImageSource, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_vignetteLayer, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_charactersRemaining, 0);
  objc_storeStrong((id *)&self->_serviceIconImage, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_hostProxy, 0);
}

@end
