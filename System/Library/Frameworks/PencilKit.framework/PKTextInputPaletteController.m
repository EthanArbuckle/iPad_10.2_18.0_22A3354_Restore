@implementation PKTextInputPaletteController

- (PKTextInputPaletteController)init
{
  void *v3;
  PKTextInputPaletteController *v4;

  +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKTextInputPaletteController initWithTextInputSettings:](self, "initWithTextInputSettings:", v3);

  return v4;
}

- (PKTextInputPaletteController)initWithTextInputSettings:(id)a3
{
  id v5;
  PKTextInputPaletteController *v6;
  PKTextInputPaletteController *v7;
  PKTextInputWindowFirstResponderController *v8;
  PKTextInputWindowFirstResponderController *windowFirstResponderController;
  PKPaletteFloatingKeyboardController *v10;
  PKPaletteFloatingKeyboardController *floatingKeyboardController;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKTextInputPaletteController;
  v6 = -[PKTextInputPaletteController init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__textInputSettings, a3);
    v8 = objc_alloc_init(PKTextInputWindowFirstResponderController);
    windowFirstResponderController = v7->__windowFirstResponderController;
    v7->__windowFirstResponderController = v8;

    -[PKTextInputWindowFirstResponderController setDelegate:](v7->__windowFirstResponderController, "setDelegate:", v7);
    v10 = objc_alloc_init(PKPaletteFloatingKeyboardController);
    floatingKeyboardController = v7->__floatingKeyboardController;
    v7->__floatingKeyboardController = v10;

    -[PKPaletteFloatingKeyboardController setDelegate:]((uint64_t)v7->__floatingKeyboardController, v7);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v7->_editingOverlayContainerSceneBounds.origin.x = v13;
    v7->_editingOverlayContainerSceneBounds.origin.y = v14;
    v7->_editingOverlayContainerSceneBounds.size.width = v15;
    v7->_editingOverlayContainerSceneBounds.size.height = v16;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v7, sel__recognitionLocaleIdentifierDidChange_, CFSTR("PKTextInputSettingsRecognitionLocaleIdentifierDidChangeNotification"), 0);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("PKTextInputSettingsRecognitionLocaleIdentifierDidChangeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)PKTextInputPaletteController;
  -[PKTextInputPaletteController dealloc](&v4, sel_dealloc);
}

- (void)setEditingOverlayContainerSceneBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectEqualToRect(self->_editingOverlayContainerSceneBounds, a3))
  {
    self->_editingOverlayContainerSceneBounds.origin.x = x;
    self->_editingOverlayContainerSceneBounds.origin.y = y;
    self->_editingOverlayContainerSceneBounds.size.width = width;
    self->_editingOverlayContainerSceneBounds.size.height = height;
    -[PKTextInputPaletteController _updatePaletteVisibility](self, "_updatePaletteVisibility");
  }
}

- (void)_setWritingStateActive:(BOOL)a3
{
  _BOOL4 writingStateActive;

  writingStateActive = self->__writingStateActive;
  if (writingStateActive != a3)
  {
    self->__writingStateActive = a3;
    if (writingStateActive || !a3)
      -[PKTextInputPaletteController _updatePaletteVisibility](self, "_updatePaletteVisibility");
    else
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__updatePaletteVisibility, 0);
  }
}

- (UIWindowScene)windowScene
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKTextInputPaletteController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paletteControllerContainerView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIWindowScene *)v6;
}

- (id)_paletteControllerContainerView
{
  void *v3;
  void *v4;

  -[PKTextInputPaletteController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "paletteControllerContainerView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_canShowPaletteUI
{
  uint64_t v4;
  char v5;
  void *v6;

  if ((_os_feature_enabled_impl() & 1) != 0)
    return 0;
  -[PKTextInputPaletteController _textInputSettings](self, "_textInputSettings");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend((id)v4, "isScribbleActive");

  -[PKTextInputPaletteController _textInputSettings](self, "_textInputSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "UCBPaletteEnabled");

  return v5 & v4;
}

- (void)updateFirstResponderVisibility
{
  void *v3;
  id v4;

  -[PKTextInputPaletteController _windowFirstResponderController](self, "_windowFirstResponderController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PKTextInputPaletteController windowScene](self, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateFirstResponderFromWindowScene:sendDelegateCallback:", v3, 1);

}

- (BOOL)isPaletteVisible
{
  void *v2;
  char v3;

  -[PKTextInputPaletteController _paletteController](self, "_paletteController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPaletteVisible");

  return v3;
}

- (BOOL)_isFirstResponderEditableTextInputWithPencilTextInputSource
{
  void *v2;
  void *v3;
  char v4;

  -[PKTextInputPaletteController _windowFirstResponderController](self, "_windowFirstResponderController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEditableTextInputWithPencilTextInputSource");

  return v4;
}

- (BOOL)_isFirstResponderVisible
{
  void *v2;
  void *v3;
  char v4;

  -[PKTextInputPaletteController _windowFirstResponderController](self, "_windowFirstResponderController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isVisible");

  return v4;
}

- (BOOL)_isFirstResponderInputAssistantEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[PKTextInputPaletteController _windowFirstResponderController](self, "_windowFirstResponderController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "disableInputAssistant") ^ 1;

  return v4;
}

- (BOOL)_shouldPaletteBeVisible
{
  void *v3;
  char v4;

  if (!-[PKTextInputPaletteController _canShowPaletteUI](self, "_canShowPaletteUI")
    || !-[PKTextInputPaletteController _isFirstResponderVisible](self, "_isFirstResponderVisible")
    || !-[PKTextInputPaletteController _isFirstResponderEditableTextInputWithPencilTextInputSource](self, "_isFirstResponderEditableTextInputWithPencilTextInputSource")|| !-[PKTextInputPaletteController isPaletteVisible](self, "isPaletteVisible")&& -[PKTextInputPaletteController _isWritingStateActive](self, "_isWritingStateActive")|| !-[PKTextInputPaletteController _isFirstResponderInputAssistantEnabled](self, "_isFirstResponderInputAssistantEnabled"))
  {
    return 0;
  }
  -[PKTextInputPaletteController windowScene](self, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_isKeyWindowScene");

  return v4;
}

- (void)_updatePaletteVisibility
{
  -[PKTextInputPaletteController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__peformPaletteVisibilityUpdate, 0, 0.0);
}

- (void)_peformPaletteVisibilityUpdate
{
  _BOOL8 v3;
  void *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  uint8_t v24[16];
  uint8_t v25[16];
  uint8_t v26[16];
  uint8_t buf[16];

  v3 = -[PKTextInputPaletteController _shouldPaletteBeVisible](self, "_shouldPaletteBeVisible");
  -[PKTextInputPaletteController _paletteController](self, "_paletteController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 ^ objc_msgSend(v4, "isPaletteVisible");

  if (v5 == 1)
  {
    _PKSignpostLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE213000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TextInputPaletteVisibilityChanged", (const char *)&unk_1BE532412, buf, 2u);
    }

    v7 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_1BE213000, v7, OS_LOG_TYPE_INFO, "BEGIN \"TextInputPaletteVisibilityChanged\", v26, 2u);
    }

  }
  -[PKTextInputPaletteController _paletteControllerContainerView](self, "_paletteControllerContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputPaletteController _setupPaletteControllerIfNeededWithView:wantsPaletteVisible:](self, "_setupPaletteControllerIfNeededWithView:wantsPaletteVisible:", v8, v3);
  -[PKTextInputPaletteController _windowFirstResponderController](self, "_windowFirstResponderController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstResponder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTextInputPaletteController _paletteController](self, "_paletteController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFirstResponder:", v10);

  -[PKTextInputPaletteController editingOverlayContainerSceneBounds](self, "editingOverlayContainerSceneBounds");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[PKTextInputPaletteController _paletteController](self, "_paletteController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAdjustedWindowSceneBounds:", v13, v15, v17, v19);

  -[PKTextInputPaletteController _paletteController](self, "_paletteController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPaletteVisible:animated:completion:", v3, 1, 0);

  if (v5)
  {
    _PKSignpostLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)v25 = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE213000, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TextInputPaletteVisibilityChanged", (const char *)&unk_1BE532412, v25, 2u);
    }

    v23 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1BE213000, v23, OS_LOG_TYPE_INFO, "END \"TextInputPaletteVisibilityChanged\", v24, 2u);
    }

  }
}

- (void)_setupPaletteControllerIfNeededWithView:(id)a3 wantsPaletteVisible:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  PKPaletteTapToRadarCommand *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  PKPaletteController *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  int v24;
  id v25;
  uint64_t v26;

  v4 = a4;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6 && v4)
  {
    v7 = (PKPaletteTapToRadarCommand *)os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v24) = 0;
      _os_log_error_impl(&dword_1BE213000, &v7->super, OS_LOG_TYPE_ERROR, "Wants palette visible but the provided view is nil", (uint8_t *)&v24, 2u);
    }
LABEL_32:

    goto LABEL_33;
  }
  -[PKTextInputPaletteController _paletteController](self, "_paletteController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || v8)
  {

  }
  else if (v4)
  {
    v9 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v24 = 138412290;
      v25 = v6;
      _os_log_debug_impl(&dword_1BE213000, v9, OS_LOG_TYPE_DEBUG, "Creating new palette controller to install in view: %@", (uint8_t *)&v24, 0xCu);
    }

    _PKSignpostLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      LOWORD(v24) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE213000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TextInputPaletteInstall", (const char *)&unk_1BE532412, (uint8_t *)&v24, 2u);
    }

    v11 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1BE213000, v11, OS_LOG_TYPE_INFO, "BEGIN \"TextInputPaletteInstall\", (uint8_t *)&v24, 2u);
    }

    v12 = objc_alloc_init(PKPaletteController);
    -[PKTextInputPaletteController set_paletteController:](self, "set_paletteController:", v12);

    -[PKTextInputPaletteController _paletteController](self, "_paletteController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDelegate:", self);

    -[PKTextInputPaletteController _paletteController](self, "_paletteController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "installInView:", v6);

    _PKSignpostLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v15))
    {
      LOWORD(v24) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE213000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TextInputPaletteInstall", (const char *)&unk_1BE532412, (uint8_t *)&v24, 2u);
    }

    v16 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1BE213000, v16, OS_LOG_TYPE_INFO, "END \"TextInputPaletteInstall\", (uint8_t *)&v24, 2u);
    }

    v7 = -[PKPaletteTapToRadarCommand initWithDelegate:]([PKPaletteTapToRadarCommand alloc], "initWithDelegate:", self);
    -[PKTextInputPaletteController _paletteController](self, "_paletteController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTapToRadarCommand:", v7);

    goto LABEL_32;
  }
  -[PKTextInputPaletteController _paletteController](self, "_paletteController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 && v18)
  {
    v19 = os_log_create("com.apple.pencilkit", "PencilTextInput");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v24) = 0;
      _os_log_debug_impl(&dword_1BE213000, v19, OS_LOG_TYPE_DEBUG, "Tearing down palette controller", (uint8_t *)&v24, 2u);
    }

    _PKSignpostLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v20))
    {
      LOWORD(v24) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE213000, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "TextInputPaletteTearDown", (const char *)&unk_1BE532412, (uint8_t *)&v24, 2u);
    }

    v21 = os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1BE213000, v21, OS_LOG_TYPE_INFO, "BEGIN \"TextInputPaletteTearDown\", (uint8_t *)&v24, 2u);
    }

    -[PKTextInputPaletteController _paletteController](self, "_paletteController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "tearDown");

    -[PKTextInputPaletteController set_paletteController:](self, "set_paletteController:", 0);
    _PKSignpostLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v23))
    {
      LOWORD(v24) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BE213000, v23, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "TextInputPaletteTearDown", (const char *)&unk_1BE532412, (uint8_t *)&v24, 2u);
    }

    v7 = (PKPaletteTapToRadarCommand *)os_log_create("com.apple.pencilkit", ");
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1BE213000, &v7->super, OS_LOG_TYPE_INFO, "END \"TextInputPaletteTearDown\", (uint8_t *)&v24, 2u);
    }
    goto LABEL_32;
  }
LABEL_33:

}

- (void)editingOverlayContainerDidChangeToSceneBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  id v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PKTextInputPaletteController _paletteController](self, "_paletteController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tapToRadarCommand");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "editingOverlayContainerDidChangeToSceneBounds:", x, y, width, height);

}

- (id)paletteTapToRadarCommandConfiguration:(id)a3
{
  PKPaletteTapToRadarConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = objc_alloc_init(PKPaletteTapToRadarConfiguration);
  -[PKTextInputPaletteController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paletteControllerDebugSharpenerLog:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasContent"))
    v7 = v6;
  else
    v7 = 0;
  -[PKPaletteTapToRadarConfiguration setDebugSharpenerLog:](v4, "setDebugSharpenerLog:", v7);
  -[PKTextInputPaletteController _paletteControllerContainerView](self, "_paletteControllerContainerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rootViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "childViewControllers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteTapToRadarConfiguration setPresentationViewController:](v4, "setPresentationViewController:", v12);

  return v4;
}

- (void)paletteControllerFloatingKeyboardWillHide:(id)a3
{
  void *v4;
  id v5;

  -[PKTextInputPaletteController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textInputPaletteControllerFloatingKeyboardWillHide:", self);

  -[PKTextInputPaletteController _windowFirstResponderController](self, "_windowFirstResponderController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPaletteFloatingMode:", 0);

}

- (void)paletteControllerFloatingKeyboardWillShow:(id)a3
{
  void *v4;
  id v5;

  -[PKTextInputPaletteController _windowFirstResponderController](self, "_windowFirstResponderController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPaletteFloatingMode:", 1);

  -[PKTextInputPaletteController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textInputPaletteControllerFloatingKeyboardWillShow:", self);

}

- (id)responderForFloatingKeyboardController:(id)a3
{
  return +[PKPaletteKeyboardUtilities textInputResponderForEditing](PKPaletteKeyboardUtilities, "textInputResponderForEditing", a3);
}

- (void)floatingKeyboardControllerWillShow:(id)a3
{
  void *v4;
  id v5;

  -[PKTextInputPaletteController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textInputPaletteControllerFloatingKeyboardWillHide:", self);

  -[PKTextInputPaletteController _windowFirstResponderController](self, "_windowFirstResponderController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPaletteFloatingMode:", 0);

}

- (void)floatingKeyboardControllerWillHide:(id)a3
{
  void *v4;
  id v5;

  -[PKTextInputPaletteController _windowFirstResponderController](self, "_windowFirstResponderController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPaletteFloatingMode:", 1);

  -[PKTextInputPaletteController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textInputPaletteControllerFloatingKeyboardWillShow:", self);

}

- (PKPaletteFloatingKeyboardController)_floatingKeyboardController
{
  return self->__floatingKeyboardController;
}

- (void)set_floatingKeyboardController:(id)a3
{
  objc_storeStrong((id *)&self->__floatingKeyboardController, a3);
}

- (PKTextInputPaletteControllerDelegate)delegate
{
  return (PKTextInputPaletteControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)_isWritingStateActive
{
  return self->__writingStateActive;
}

- (CGRect)editingOverlayContainerSceneBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_editingOverlayContainerSceneBounds.origin.x;
  y = self->_editingOverlayContainerSceneBounds.origin.y;
  width = self->_editingOverlayContainerSceneBounds.size.width;
  height = self->_editingOverlayContainerSceneBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (PKTextInputSettings)_textInputSettings
{
  return self->__textInputSettings;
}

- (void)set_textInputSettings:(id)a3
{
  objc_storeStrong((id *)&self->__textInputSettings, a3);
}

- (PKTextInputWindowFirstResponderController)_windowFirstResponderController
{
  return self->__windowFirstResponderController;
}

- (void)set_windowFirstResponderController:(id)a3
{
  objc_storeStrong((id *)&self->__windowFirstResponderController, a3);
}

- (PKPaletteController)_paletteController
{
  return self->__paletteController;
}

- (void)set_paletteController:(id)a3
{
  objc_storeStrong((id *)&self->__paletteController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__paletteController, 0);
  objc_storeStrong((id *)&self->__windowFirstResponderController, 0);
  objc_storeStrong((id *)&self->__textInputSettings, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->__floatingKeyboardController, 0);
}

@end
