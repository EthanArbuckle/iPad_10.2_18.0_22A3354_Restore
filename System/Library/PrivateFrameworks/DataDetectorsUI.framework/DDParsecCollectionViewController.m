@implementation DDParsecCollectionViewController

- (DDParsecCollectionViewController)initWithString:(id)a3 range:(_NSRange)a4
{
  return -[DDParsecCollectionViewController initWithString:range:dictionaryOnly:](self, "initWithString:range:dictionaryOnly:", a3, a4.location, a4.length, 0);
}

- (DDParsecCollectionViewController)initWithString:(id)a3 range:(_NSRange)a4 dictionaryOnly:(BOOL)a5
{
  _BOOL4 v5;
  NSUInteger length;
  NSUInteger location;
  id v10;
  DDParsecCollectionViewController *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSRange v20;
  NSRange v21;

  v5 = a5;
  length = a4.length;
  location = a4.location;
  v10 = a3;
  v11 = -[DDParsecCollectionViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  if (v11)
  {
    if (v10)
    {
      v21.length = objc_msgSend(v10, "length");
      v20.location = location;
      v20.length = length;
      v21.location = 0;
      if (NSIntersectionRange(v20, v21).length)
      {
        objc_msgSend(v10, "substringWithRange:", location, length);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3780], "controlCharacterSet");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "formUnionWithCharacterSet:", v14);

        objc_msgSend(v13, "addCharactersInRange:", 65529, 7);
        objc_msgSend(v13, "invertedSet");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v12, "rangeOfCharacterFromSet:", v15);

        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_storeStrong((id *)&v11->_queryString, a3);
          objc_msgSend(v12, "stringByTrimmingCharactersInSet:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = objc_msgSend(v17, "length");
          v11->_queryRange.location = v16 + location;
          v11->_queryRange.length = v18;
          -[DDParsecCollectionViewController setTitle:](v11, "setTitle:", v17);
          v12 = v17;
        }

      }
    }
    v11->_dictionaryMode = v5;
    if (v5)
      v11->_popoverMode = 0;
    -[DDParsecCollectionViewController fetchRemoteViewControllerWithValidInput:](v11, "fetchRemoteViewControllerWithValidInput:", v11->_queryString != 0);
  }

  return v11;
}

- (DDParsecCollectionViewController)initWithQuery:(id)a3
{
  id v5;
  DDParsecCollectionViewController *v6;
  DDParsecCollectionViewController *v7;
  void *v8;

  v5 = a3;
  v6 = -[DDParsecCollectionViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    if (v5)
    {
      objc_storeStrong((id *)&v6->_query, a3);
      objc_msgSend(v5, "title");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[DDParsecCollectionViewController setTitle:](v7, "setTitle:", v8);

    }
    -[DDParsecCollectionViewController fetchRemoteViewControllerWithValidInput:](v7, "fetchRemoteViewControllerWithValidInput:", v7->_query != 0);
  }

  return v7;
}

- (DDParsecCollectionViewController)initWithRVItem:(id)a3
{
  id v5;
  void *v6;
  __CFString *v7;
  DDParsecCollectionViewController *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  DDParsecCollectionViewController *v17;

  v5 = a3;
  objc_msgSend(v5, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&self->_item, a3);
  if (v6)
  {
    objc_msgSend(v5, "query");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = -[DDParsecCollectionViewController initWithQuery:](self, "initWithQuery:", v7);
  }
  else
  {
    objc_msgSend(v5, "text");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    v11 = &stru_1E4259460;
    if (v9)
      v11 = (__CFString *)v9;
    v7 = v11;

    v12 = objc_msgSend(v5, "highlightRange");
    v14 = v13;
    if (objc_msgSend(v5, "type") == 3)
    {
      objc_msgSend(v5, "ddResult");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "matchedString");
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v14 = -[__CFString length](v16, "length");
      v12 = 0;
      v7 = v16;
    }
    v8 = -[DDParsecCollectionViewController initWithString:range:](self, "initWithString:range:", v7, v12, v14);
  }
  v17 = v8;

  return v17;
}

- (void)setTitle:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v4 = (void *)MEMORY[0x1E0CB3500];
  v5 = a3;
  objc_msgSend(v4, "newlineCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9.receiver = self;
  v9.super_class = (Class)DDParsecCollectionViewController;
  -[DDParsecCollectionViewController setTitle:](&v9, sel_setTitle_, v8);

}

- (DDParsecCollectionViewController)initWithResult:(__DDResult *)a3 context:(id)a4
{
  id v6;
  DDParsecCollectionViewController *v7;
  void *v8;
  uint64_t v9;
  DDScannerResult *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSDictionary *context;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = -[DDParsecCollectionViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  if (v7)
  {
    if (a3)
    {
      DDResultGetMatchedString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        -[DDParsecCollectionViewController setTitle:](v7, "setTitle:", v8);
        objc_msgSend(MEMORY[0x1E0D1CE68], "resultFromCoreResult:", a3);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = v7->_result;
        v7->_result = (DDScannerResult *)v9;

        if (v6)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LeadingText"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("LeadingText"));

          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TrailingText"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("TrailingText"));

          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SelectedText"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("SelectedText"));

          objc_msgSend(v11, "allKeys");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "count");

          if (v16)
          {
            v17 = objc_msgSend(v11, "copy");
            context = v7->_context;
            v7->_context = (NSDictionary *)v17;

          }
        }
        +[DDAction actionWithURL:result:context:](DDSearchWebAction, "actionWithURL:result:context:", 0, a3, v6);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = v19;
        +[DDAction actionWithURL:result:context:](DDCopyAction, "actionWithURL:result:context:", 0, a3, v6);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v23[1] = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[DDParsecCollectionViewController setActions:](v7, "setActions:", v21);

      }
    }
    -[DDParsecCollectionViewController fetchRemoteViewControllerWithValidInput:](v7, "fetchRemoteViewControllerWithValidInput:", v7->_result != 0);
  }

  return v7;
}

- (DDParsecCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  DDParsecCollectionViewController *v4;
  DDParsecCollectionViewController *v5;
  uint64_t v6;
  UITapGestureRecognizer *tapGesture;
  void *v8;
  void *v9;
  DDParsecCollectionViewController *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)DDParsecCollectionViewController;
  v4 = -[DDParsecCollectionViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_needsBackground = 1;
    -[DDParsecCollectionViewController setNavigationBarHidden:animated:](v4, "setNavigationBarHidden:animated:", 1, 0);
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v5, sel__interactionEnded);
    tapGesture = v5->_tapGesture;
    v5->_tapGesture = (UITapGestureRecognizer *)v6;

    -[DDParsecCollectionViewController view](v5, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addGestureRecognizer:", v5->_tapGesture);

    -[DDParsecCollectionViewController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 7);
    -[DDParsecCollectionViewController setModalInPresentation:](v5, "setModalInPresentation:", 0);
    -[DDParsecCollectionViewController presentationController](v5, "presentationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", v5);

    v5->_popoverMode = 1;
    -[DDParsecCollectionViewController updateVisualMode](v5, "updateVisualMode");
    v10 = v5;
  }

  return v5;
}

- (void)updateDelegateOfPresentationController:(id)a3
{
  DDParsecCollectionViewController *v4;
  objc_class *v5;
  void *v6;
  char v7;
  DDDelegateMultiplexer *v8;
  DDDelegateMultiplexer *presentationDelegateProxy;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "delegate");
  v4 = (DDParsecCollectionViewController *)objc_claimAutoreleasedReturnValue();
  if (v4 != self)
  {
    if (v4)
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("DDDelegateMultiplexer"));

      if ((v7 & 1) == 0)
      {
        v8 = -[DDDelegateMultiplexer initWithDelegate:andDelegate:]([DDDelegateMultiplexer alloc], "initWithDelegate:andDelegate:", self, v4);
        objc_msgSend(v10, "setDelegate:", v8);
        presentationDelegateProxy = self->_presentationDelegateProxy;
        self->_presentationDelegateProxy = v8;

      }
    }
    else
    {
      objc_msgSend(v10, "setDelegate:", self);
    }
  }

}

- (id)popoverPresentationController
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  self->_requestingPopoverPresentationController = 1;
  v7.receiver = self;
  v7.super_class = (Class)DDParsecCollectionViewController;
  -[DDParsecCollectionViewController popoverPresentationController](&v7, sel_popoverPresentationController);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setCentersPopoverIfSourceViewNotSet:", 1);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[DDParsecCollectionViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setOverrideVibrancyTrait:", 0);

  -[DDParsecCollectionViewController updateDelegateOfPresentationController:](self, "updateDelegateOfPresentationController:", v3);
  self->_requestingPopoverPresentationController = 0;
  return v3;
}

- (id)presentationController
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DDParsecCollectionViewController;
  -[DDParsecCollectionViewController presentationController](&v5, sel_presentationController);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDParsecCollectionViewController updateDelegateOfPresentationController:](self, "updateDelegateOfPresentationController:", v3);
  return v3;
}

- (int64_t)modalPresentationStyle
{
  void *v3;
  objc_super v5;
  objc_super v6;

  if (!self->_requestingPopoverPresentationController)
  {
    self->_requestingPopoverPresentationController = 1;
    v6.receiver = self;
    v6.super_class = (Class)DDParsecCollectionViewController;
    -[DDParsecCollectionViewController popoverPresentationController](&v6, sel_popoverPresentationController);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDParsecCollectionViewController updateDelegateOfPresentationController:](self, "updateDelegateOfPresentationController:", v3);
    self->_requestingPopoverPresentationController = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)DDParsecCollectionViewController;
  return -[DDParsecCollectionViewController modalPresentationStyle](&v5, sel_modalPresentationStyle);
}

- (int64_t)_preferredModalPresentationStyle
{
  return 7;
}

- (void)setPreviewMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_previewMode != a3)
  {
    v3 = a3;
    self->_previewMode = a3;
    -[_UIRemoteViewController serviceViewControllerProxy](self->_remoteViewController, "serviceViewControllerProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPreviewMode:", v3);

    -[DDParsecCollectionViewController updateVisualMode](self, "updateVisualMode");
  }
}

- (void)adaptForPresentationInPopover:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = !self->_dictionaryMode && a3;
  if (self->_popoverMode != v3)
  {
    self->_popoverMode = v3;
    -[_UIRemoteViewController serviceViewControllerProxy](self->_remoteViewController, "serviceViewControllerProxy", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPopoverMode:", v3);

  }
}

- (void)setSheetMode:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_sheetMode != a3)
  {
    v3 = a3;
    self->_sheetMode = a3;
    -[_UIRemoteViewController serviceViewControllerProxy](self->_remoteViewController, "serviceViewControllerProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSheetMode:", v3);

    -[DDParsecCollectionViewController updateVisualMode](self, "updateVisualMode");
  }
}

- (CGSize)preferredContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 360.0;
  v3 = 480.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)overrideTraitCollectionForChildViewController:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CEAB40], "_traitCollectionWithValue:forTraitNamed:", &unk_1E4269C40, *MEMORY[0x1E0CEC2C8]);
}

- (void)updateVisualMode
{
  void *v3;
  _BOOL4 needsBackground;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  id v9;

  -[DDParsecCollectionViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setOverrideVibrancyTrait:", 0);

  needsBackground = self->_needsBackground;
  if (self->_needsBackground)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[DDParsecCollectionViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v5);

  if (needsBackground)
  -[DDParsecCollectionViewController topViewController](self, "topViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[DDParsecCollectionViewController topViewController](self, "topViewController");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateStyle");

  }
}

- (void)doneButtonPressed:(id)a3
{
  -[DDParsecCollectionViewController doneButtonPressed:punchout:](self, "doneButtonPressed:punchout:", a3, 0);
}

- (void)doneButtonPressed:(id)a3 punchout:(BOOL)a4
{
  -[DDParsecCollectionViewController interactionEndedWithPunchout:](self, "interactionEndedWithPunchout:", a4);
}

- (void)fetchRemoteViewControllerWithValidInput:(BOOL)a3
{
  id v4;
  __CFString *v5;
  id v6;
  _QWORD v7[5];

  if (a3)
  {
    -[DDParsecCollectionViewController showSpinner](self, "showSpinner");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__DDParsecCollectionViewController_fetchRemoteViewControllerWithValidInput___block_invoke;
    v7[3] = &unk_1E42585F8;
    v7[4] = self;
    v4 = +[_UIRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:](DDParsecRemoteCollectionViewController, "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:", CFSTR("DDParsecServiceCollectionViewController"), 0x1E4259600, v7);
  }
  else
  {
    -[DDParsecCollectionViewController setTitle:](self, "setTitle:", &stru_1E4259460);
    if (self->_query)
      v5 = CFSTR("No Content Found");
    else
      v5 = CFSTR("Nothing to Look Up");
    DDLocalizedString(v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[DDParsecCollectionViewController showError:](self, "showError:", v6);

  }
}

void __76__DDParsecCollectionViewController_fetchRemoteViewControllerWithValidInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = objc_opt_class();
      DDUILogAssertionFailure((uint64_t)"[readyController isKindOfClass:DDParsecRemoteCollectionViewController.class]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/MobileDataDetectorsUI/DDPreviewActions/DDParsecCollectionViewController.m", (uint64_t)"-[DDParsecCollectionViewController fetchRemoteViewControllerWithValidInput:]_block_invoke", 556, CFSTR("unexpected remote controller class: %@"), v10, v11, v12, v9);
    }
    objc_msgSend(*(id *)(a1 + 32), "presentRemoteCollection:", v5);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __76__DDParsecCollectionViewController_fetchRemoteViewControllerWithValidInput___block_invoke_cold_1((uint64_t)v6);
    v7 = *(void **)(a1 + 32);
    DDLocalizedString(CFSTR("An Error Occurred"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "showError:", v8);

  }
}

- (void)appDidEnterBackground
{
  DDParsecRemoteCollectionViewController *remoteViewController;
  id v3;

  remoteViewController = self->_remoteViewController;
  if (remoteViewController)
  {
    -[_UIRemoteViewController serviceViewControllerProxy](remoteViewController, "serviceViewControllerProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appDidEnterBackground");

  }
}

- (void)appWillEnterForeground
{
  DDParsecRemoteCollectionViewController *remoteViewController;
  id v3;

  remoteViewController = self->_remoteViewController;
  if (remoteViewController)
  {
    -[_UIRemoteViewController serviceViewControllerProxy](remoteViewController, "serviceViewControllerProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appWillEnterForeground");

  }
}

- (void)presentRemoteCollection:(id)a3
{
  void *v5;
  RVQuery *query;
  _BOOL8 previewMode;
  _BOOL8 sheetMode;
  _BOOL8 popoverMode;
  int64_t style;
  void *v11;
  double v12;
  double v13;
  _BOOL8 dictionaryMode;
  void *v15;
  void *v16;
  void *v17;
  NSString *queryString;
  DDScannerResult *result;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;

  v23 = a3;
  objc_storeStrong((id *)&self->_remoteViewController, a3);
  objc_msgSend(v23, "setHostSideDelegate:", self);
  objc_msgSend(v23, "serviceViewControllerProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  query = self->_query;
  previewMode = self->_previewMode;
  sheetMode = self->_sheetMode;
  popoverMode = self->_popoverMode;
  style = self->_style;
  -[DDParsecCollectionViewController traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v13 = v12;
  dictionaryMode = self->_dictionaryMode;
  -[RVItem textQueryProvider](self->_item, "textQueryProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v22) = v15 != 0;
  objc_msgSend(v5, "prepareWithQueryObject:previewMode:sheetMode:popoverMode:viewStyle:scale:dictionaryMode:remoteTextQuery:", query, previewMode, sheetMode, popoverMode, style, dictionaryMode, v13, v22);

  -[DDParsecCollectionViewController title](self, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[DDParsecCollectionViewController title](self, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOriginalTitle:", v17);

  }
  queryString = self->_queryString;
  if (queryString)
  {
    objc_msgSend(v5, "startQueryWithString:range:", queryString, self->_queryRange.location, self->_queryRange.length);
  }
  else
  {
    result = self->_result;
    if (result)
      objc_msgSend(v5, "startQueryWithResult:context:", result, self->_context);
  }
  if (self->_query)
    objc_msgSend(v5, "startQueryWithQuery:");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObserver:selector:name:object:", self, sel_appWillEnterForeground, *MEMORY[0x1E0CEB350], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObserver:selector:name:object:", self, sel_appDidEnterBackground, *MEMORY[0x1E0CEB288], 0);

}

- (void)remoteVCIsReady
{
  -[DDParsecCollectionViewController replaceControllerWithController:](self, "replaceControllerWithController:", self->_remoteViewController);
  self->_needsBackground = 0;
  -[DDParsecCollectionViewController updateVisualMode](self, "updateVisualMode");
}

- (void)performClientQueryWithServerAccessPermitted:(BOOL)a3 localSearchPermitted:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  _QWORD *v9;
  void (*v10)(_QWORD *, _BOOL8, _BOOL8, _QWORD *);
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a4;
  v5 = a3;
  -[RVQuery queryProvider](self->_query, "queryProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_UIRemoteViewController serviceViewControllerProxy](self->_remoteViewController, "serviceViewControllerProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RVQuery queryProvider](self->_query, "queryProvider");
    v9 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __101__DDParsecCollectionViewController_performClientQueryWithServerAccessPermitted_localSearchPermitted___block_invoke;
    v12[3] = &unk_1E4258620;
    v13 = v8;
    v10 = (void (*)(_QWORD *, _BOOL8, _BOOL8, _QWORD *))v9[2];
    v11 = v8;
    v10(v9, v5, v4, v12);

  }
}

uint64_t __101__DDParsecCollectionViewController_performClientQueryWithServerAccessPermitted_localSearchPermitted___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "showClientQueryResults:error:", a2, a3);
}

- (void)performClientTextQueryWithTerm:(id)a3 queryId:(unint64_t)a4 sessionId:(id)a5 userAgent:(id)a6 reply:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  DDHostTextQueryContext *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  _QWORD v19[4];
  id v20;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  -[RVItem textQueryProvider](self->_item, "textQueryProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_alloc_init(DDHostTextQueryContext);
    -[DDHostTextQueryContext setTitle:](v17, "setTitle:", v12);
    -[DDHostTextQueryContext setQueryString:](v17, "setQueryString:", v12);
    -[DDHostTextQueryContext setQueryID:](v17, "setQueryID:", a4);
    -[DDHostTextQueryContext setIdentifier:](v17, "setIdentifier:", v13);
    -[DDHostTextQueryContext setUserAgent:](v17, "setUserAgent:", v14);
    -[RVItem textQueryProvider](self->_item, "textQueryProvider");
    v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __101__DDParsecCollectionViewController_performClientTextQueryWithTerm_queryId_sessionId_userAgent_reply___block_invoke;
    v19[3] = &unk_1E4258648;
    v20 = v15;
    ((void (**)(_QWORD, DDHostTextQueryContext *, _QWORD *))v18)[2](v18, v17, v19);

  }
}

uint64_t __101__DDParsecCollectionViewController_performClientTextQueryWithTerm_queryId_sessionId_userAgent_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showError:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v12 = (id)objc_opt_new();
  -[DDParsecCollectionViewController title](self, "title");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_1E4259460;
  if (v5)
    v7 = (__CFString *)v5;
  v8 = v7;

  objc_msgSend(v12, "setTitle:", v8);
  objc_msgSend(v12, "setSearchWebQuery:", v8);

  objc_msgSend(v12, "setReason:", v4);
  if (self->_query)
  {
    objc_msgSend(v12, "setLookup:", 0);
  }
  else
  {
    -[DDParsecCollectionViewController title](self, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLookup:", objc_msgSend(v9, "length") != 0);

  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 24, self, sel_doneButtonPressed_);
  objc_msgSend(v12, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRightBarButtonItem:", v10);

  objc_msgSend(v12, "updateStyle");
  -[DDParsecCollectionViewController showingErrorView:](self, "showingErrorView:", 1);
  -[DDParsecCollectionViewController replaceControllerWithController:](self, "replaceControllerWithController:", v12);
  -[DDParsecCollectionViewController setNavigationBarHidden:animated:](self, "setNavigationBarHidden:animated:", 0, 0);

}

- (void)showSpinner
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  id v7;

  v7 = (id)objc_opt_new();
  -[DDParsecCollectionViewController title](self, "title");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = &stru_1E4259460;
  if (v3)
    v5 = (__CFString *)v3;
  v6 = v5;

  objc_msgSend(v7, "setTitle:", v6);
  -[DDParsecCollectionViewController replaceControllerWithController:](self, "replaceControllerWithController:", v7);

}

- (void)replaceControllerWithController:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[DDParsecCollectionViewController setViewControllers:](self, "setViewControllers:", v6, v7, v8);
}

- (void)interactionEndedWithPunchout:(BOOL)a3
{
  _BOOL4 v3;
  dispatch_time_t v5;
  _QWORD block[5];

  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[DDParsecCollectionViewController interactionEndedWithPunchout:].cold.1();
    if (v3)
      goto LABEL_3;
  }
  else if (v3)
  {
LABEL_3:
    v5 = dispatch_time(0, 300000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__DDParsecCollectionViewController_interactionEndedWithPunchout___block_invoke;
    block[3] = &unk_1E42580C8;
    block[4] = self;
    dispatch_after(v5, MEMORY[0x1E0C80D38], block);
    return;
  }
  -[DDParsecCollectionViewController _interactionEnded](self, "_interactionEnded");
}

uint64_t __65__DDParsecCollectionViewController_interactionEndedWithPunchout___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setModalTransitionStyle:", 2);
  return objc_msgSend(*(id *)(a1 + 32), "_interactionEnded");
}

- (void)_interactionEnded
{
  void *v3;
  void *v4;
  void *v5;

  -[DDParsecCollectionViewController parsecDelegate](self, "parsecDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DDParsecCollectionViewController parsecDelegate](self, "parsecDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interactionDidFinishAndRequiresDismissal:", !self->_dismissed);

    -[DDParsecCollectionViewController setParsecDelegate:](self, "setParsecDelegate:", 0);
  }
  else
  {
    -[DDParsecCollectionViewController dismissCompletionHandler](self, "dismissCompletionHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[DDParsecCollectionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5);

    -[DDParsecCollectionViewController setDismissCompletionHandler:](self, "setDismissCompletionHandler:", 0);
  }
  self->_dismissed = 1;
}

- (void)showingErrorView:(BOOL)a3
{
  self->_showingError = a3;
}

- (void)showingFTE:(BOOL)a3
{
  self->_showingFTE = a3;
  -[UITapGestureRecognizer setEnabled:](self->_tapGesture, "setEnabled:");
}

- (void)openParsecURL:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  DDParsecCollectionViewController *v8;

  v4 = a3;
  if (v4)
  {
    dispatch_get_global_queue(33, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __50__DDParsecCollectionViewController_openParsecURL___block_invoke;
    v6[3] = &unk_1E4258140;
    v7 = v4;
    v8 = self;
    dispatch_async(v5, v6);

  }
  else
  {
    -[DDParsecCollectionViewController interactionEndedWithPunchout:](self, "interactionEndedWithPunchout:", 0);
  }

}

void __50__DDParsecCollectionViewController_openParsecURL___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__DDParsecCollectionViewController_openParsecURL___block_invoke_2;
  v4[3] = &unk_1E4258670;
  v3 = *(_QWORD *)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v2, "openURL:configuration:completionHandler:", v3, 0, v4);

}

void __50__DDParsecCollectionViewController_openParsecURL___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "openParsecURL: failed with error: %@", buf, 0xCu);
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__DDParsecCollectionViewController_openParsecURL___block_invoke_223;
  v8[3] = &unk_1E4258140;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __50__DDParsecCollectionViewController_openParsecURL___block_invoke_223(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "interactionEndedWithPunchout:", *(_QWORD *)(a1 + 40) == 0);
}

- (void)getStatusBarHidden:(id)a3
{
  void *v4;
  void (**v5)(id, uint64_t);

  v5 = (void (**)(id, uint64_t))a3;
  if (-[DDParsecCollectionViewController prefersStatusBarHidden](self, "prefersStatusBarHidden"))
  {
    v5[2](v5, 1);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, objc_msgSend(v4, "isStatusBarHidden"));

  }
}

- (void)openTrailerPunchout:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  DDParsecCollectionViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__DDParsecCollectionViewController_openTrailerPunchout___block_invoke;
  v6[3] = &unk_1E4258140;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __56__DDParsecCollectionViewController_openTrailerPunchout___block_invoke(uint64_t a1, double a2)
{
  uint64_t v3;
  id v4;

  gotLoadHelper_x8__OBJC_CLASS___SearchUIMediaPlayerViewController(a2);
  v4 = (id)objc_msgSend(objc_alloc(*(Class *)(v3 + 2256)), "initWithDestination:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "setModalPresentationStyle:", 5);
  objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v4, 1, 0);

}

- (void)reportAnIssueWithReportIdentifier:(id)a3 sfReportData:(id)a4
{
  void (**reportAnIssueBlock)(id, id, id);

  if (a4 && a3)
  {
    reportAnIssueBlock = (void (**)(id, id, id))self->_reportAnIssueBlock;
    if (reportAnIssueBlock)
      reportAnIssueBlock[2](reportAnIssueBlock, a3, a4);
  }
}

- (void)loadReportAnIssueImage:(id)a3
{
  void (**reportAnIssueMetadataFetchingBlock)(id, void *);
  void *v4;
  uint64_t v5;
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void (*v9)(void);
  id v10;

  reportAnIssueMetadataFetchingBlock = (void (**)(id, void *))self->_reportAnIssueMetadataFetchingBlock;
  if (reportAnIssueMetadataFetchingBlock)
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v5 = *MEMORY[0x1E0D87C70];
    v6 = (void (**)(id, void *))a3;
    objc_msgSend(v4, "setWithObject:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    reportAnIssueMetadataFetchingBlock[2](reportAnIssueMetadataFetchingBlock, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8);

  }
  else
  {
    v9 = (void (*)(void))*((_QWORD *)a3 + 2);
    v10 = a3;
    v9();
  }

}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return (_UIRemoteViewController *)self->_remoteViewController;
}

- (BOOL)_allowsStylingSheetsAsCards
{
  return 1;
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  -[DDParsecCollectionViewController adaptForPresentationInPopover:](self, "adaptForPresentationInPopover:", a4 == -1);
}

- (void)_presentationController:(id)a3 prepareAdaptivePresentationController:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0CEA9A8];
    v7 = v5;
    objc_msgSend(v6, "mediumDetent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0CEA9A8], "largeDetent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDetents:", v10);

    objc_msgSend(v7, "setPrefersGrabberVisible:", 1);
  }
  objc_opt_class();
  -[DDParsecCollectionViewController adaptForPresentationInPopover:](self, "adaptForPresentationInPopover:", objc_opt_isKindOfClass() & 1);

}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  return 1;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  void *v4;
  void (**v5)(void);

  -[DDParsecCollectionViewController dismissCompletionHandler](self, "dismissCompletionHandler", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DDParsecCollectionViewController dismissCompletionHandler](self, "dismissCompletionHandler");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

    -[DDParsecCollectionViewController setDismissCompletionHandler:](self, "setDismissCompletionHandler:", 0);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DDParsecCollectionViewController;
  -[DDParsecCollectionViewController viewWillAppear:](&v7, sel_viewWillAppear_);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_previousStatusBarStyle = objc_msgSend(v5, "statusBarStyle");

  if (self->_previousStatusBarStyle)
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStatusBarStyle:animation:", 0, v3);

  }
  self->_dismissed = 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[DDParsecCollectionViewController _interactionEnded](self, "_interactionEnded");
  v5.receiver = self;
  v5.super_class = (Class)DDParsecCollectionViewController;
  -[DDParsecCollectionViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  self->_dismissed = 1;
  if (self->_remoteViewController)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB350], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB288], 0);

  }
  v8.receiver = self;
  v8.super_class = (Class)DDParsecCollectionViewController;
  -[DDParsecCollectionViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);
  if (self->_previousStatusBarStyle)
  {
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStatusBarStyle:animation:", self->_previousStatusBarStyle, v3);

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)dismissCompletionHandler
{
  return objc_getProperty(self, a2, 1536, 1);
}

- (void)setDismissCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1536);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (id)reportAnIssueBlock
{
  return self->_reportAnIssueBlock;
}

- (void)setReportAnIssueBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1552);
}

- (id)reportAnIssueMetadataFetchingBlock
{
  return self->_reportAnIssueMetadataFetchingBlock;
}

- (void)setReportAnIssueMetadataFetchingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1560);
}

- (NSArray)actions
{
  return (NSArray *)objc_getProperty(self, a2, 1568, 1);
}

- (void)setActions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1568);
}

- (DDParsecCollectionDelegate)parsecDelegate
{
  return (DDParsecCollectionDelegate *)objc_loadWeakRetained((id *)&self->_parsecDelegate);
}

- (void)setParsecDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_parsecDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parsecDelegate);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong(&self->_reportAnIssueMetadataFetchingBlock, 0);
  objc_storeStrong(&self->_reportAnIssueBlock, 0);
  objc_storeStrong(&self->_dismissCompletionHandler, 0);
  objc_storeStrong((id *)&self->_presentationDelegateMultiplexer, 0);
  objc_storeStrong((id *)&self->_presentationDelegateProxy, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_queryString, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
}

void __76__DDParsecCollectionViewController_fetchRemoteViewControllerWithValidInput___block_invoke_cold_1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not get an out-of-process view controller. Error %@", (uint8_t *)&v1, 0xCu);
}

- (void)interactionEndedWithPunchout:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_19EFBB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Notifying host client that the action did finish.", v0, 2u);
}

@end
