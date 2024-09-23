@implementation PKTextInputWindowFirstResponderController

- (PKTextInputWindowFirstResponderController)init
{
  void *v3;
  PKTextInputWindowFirstResponderController *v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKTextInputWindowFirstResponderController initWithNotificationCenter:](self, "initWithNotificationCenter:", v3);

  return v4;
}

- (PKTextInputWindowFirstResponderController)initWithNotificationCenter:(id)a3
{
  id v5;
  PKTextInputWindowFirstResponderController *v6;
  PKTextInputWindowFirstResponderController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTextInputWindowFirstResponderController;
  v6 = -[PKTextInputWindowFirstResponderController init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__notificationCenter, a3);
    -[NSNotificationCenter addObserver:selector:name:object:](v7->__notificationCenter, "addObserver:selector:name:object:", v7, sel__textInputResponderDidChangeNotificationHandler_, *MEMORY[0x1E0DC5550], 0);
    -[NSNotificationCenter addObserver:selector:name:object:](v7->__notificationCenter, "addObserver:selector:name:object:", v7, sel_textInputSourceDidChange_, *MEMORY[0x1E0DC5580], 0);
    -[NSNotificationCenter addObserver:selector:name:object:](v7->__notificationCenter, "addObserver:selector:name:object:", v7, sel__forceControllerToReload_, CFSTR("PKTextInputWindowFirstResponderControllerReloadNotification"), 0);
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NSNotificationCenter removeObserver:](self->__notificationCenter, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PKTextInputWindowFirstResponderController;
  -[PKTextInputWindowFirstResponderController dealloc](&v3, sel_dealloc);
}

- (void)_updateFirstResponder:(id)a3 isVisible:(BOOL)a4 sendDelegateCallback:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  void *v10;
  _BOOL8 v11;
  _BOOL8 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int64_t v22;
  PKTextInputWindowFirstResponder *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _DWORD v33[2];
  __int16 v34;
  void *v35;
  uint64_t v36;

  v5 = a5;
  v6 = a4;
  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = 67109378;
    v33[1] = v6;
    v34 = 2112;
    v35 = v10;
    _os_log_impl(&dword_1BE213000, v9, OS_LOG_TYPE_INFO, "Notify first responder did change, isVisible: %d, thread: %@", (uint8_t *)v33, 0x12u);

  }
  if (v8)
    v11 = v6;
  else
    v11 = 0;
  v12 = -[PKTextInputWindowFirstResponderController _isResponderEditableTextInput:](self, "_isResponderEditableTextInput:", v8);
  v13 = objc_opt_class();
  PKDynamicCast(v13, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "inputAssistantItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_responderWindow");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "windowScene");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_11;
  }
  else
  {
    v16 = 0;
    v18 = 0;
    if (!v8)
    {
LABEL_11:
      -[PKTextInputWindowFirstResponderController setFirstResponder:](self, "setFirstResponder:", 0);
      goto LABEL_12;
    }
  }
  -[PKTextInputWindowFirstResponderController delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "windowScene");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18 != v20)
    goto LABEL_11;
  if (-[PKTextInputWindowFirstResponderController paletteFloatingMode](self, "paletteFloatingMode"))
    v22 = 3;
  else
    v22 = +[PKTextInputUtilities responderTextInputSource:](PKTextInputUtilities, "responderTextInputSource:", v8);
  v23 = -[PKTextInputWindowFirstResponder initWithIsVisible:isEditableTextInput:textInputSource:inputAssistantItem:]([PKTextInputWindowFirstResponder alloc], "initWithIsVisible:isEditableTextInput:textInputSource:inputAssistantItem:", v11, v12, v22, v16);
  -[PKTextInputWindowFirstResponderController setFirstResponder:](self, "setFirstResponder:", v23);

  v24 = +[PKTextInputElementsFinder shouldDisableInputAssistantForTextInput:]((uint64_t)PKTextInputElementsFinder, v8);
  -[PKTextInputWindowFirstResponderController firstResponder](self, "firstResponder");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDisableInputAssistant:", v24);

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "bundleIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isEqual:", CFSTR("com.apple.mobilenotes"));

  if (v28)
  {
    NSClassFromString(CFSTR("ICTextView"));
    v29 = v8;
    do
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {

        goto LABEL_25;
      }
      objc_msgSend(v29, "nextResponder");
      v30 = objc_claimAutoreleasedReturnValue();

      v29 = (id)v30;
    }
    while (v30);
    NSClassFromString(CFSTR("ICInkToolPickerResponder"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_12;
LABEL_25:
    -[PKTextInputWindowFirstResponderController firstResponder](self, "firstResponder");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setDisableInputAssistant:", 1);

    -[PKTextInputWindowFirstResponderController firstResponder](self, "firstResponder");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setNotesHandwritingResponder:", 1);

  }
LABEL_12:
  if (v5)
  {
    -[PKTextInputWindowFirstResponderController delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "windowFirstResponderController:didChangeFirstResponder:", self, v8);

  }
}

- (void)updateFirstResponderFromWindowScene:(id)a3 sendDelegateCallback:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v4 = a4;
  v6 = (void *)MEMORY[0x1E0DC3F98];
  v7 = a3;
  objc_msgSend(v6, "keyWindow");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "windowScene");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v7)
  {
    objc_msgSend(v10, "firstResponder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKTextInputWindowFirstResponderController _updateFirstResponder:isVisible:sendDelegateCallback:](self, "_updateFirstResponder:isVisible:sendDelegateCallback:", v9, 1, v4);

  }
}

- (void)_textInputResponderDidChangeNotificationHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD block[5];

  v4 = a3;
  if (-[PKTextInputWindowFirstResponderController paletteFloatingMode](self, "paletteFloatingMode"))
  {
    -[PKTextInputWindowFirstResponderController _delayedNotification](self, "_delayedNotification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKTextInputWindowFirstResponderController set_delayedNotification:](self, "set_delayedNotification:", v4);
    if (!v5)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __93__PKTextInputWindowFirstResponderController__textInputResponderDidChangeNotificationHandler___block_invoke;
      block[3] = &unk_1E7778020;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
  else
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5540]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[PKTextInputWindowFirstResponderController _updateFirstResponder:isVisible:sendDelegateCallback:](self, "_updateFirstResponder:isVisible:sendDelegateCallback:", v7, v7 != 0, 1);
  }

}

void __93__PKTextInputWindowFirstResponderController__textInputResponderDidChangeNotificationHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_delayedNotification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5540]);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_updateFirstResponder:isVisible:sendDelegateCallback:");
  objc_msgSend(*(id *)(a1 + 32), "set_delayedNotification:", 0);

}

- (void)textInputSourceDidChange:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1E0DE7910];
  v5 = a3;
  objc_msgSend(v4, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__handleTextInputSourceDidChange_, v5);
  -[PKTextInputWindowFirstResponderController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__handleTextInputSourceDidChange_, v5, 0.1);

}

- (void)_handleTextInputSourceDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void (**v13)(_QWORD);
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  PKTextInputWindowFirstResponderController *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.pencilkit", "PencilTextInput");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v6;
    _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_INFO, "Received textInputSourceDidChange, thread: %@", buf, 0xCu);

  }
  -[PKTextInputWindowFirstResponderController firstResponder](self, "firstResponder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5540]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0DC5578]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "integerValue") == 2)
    {
      v12 = os_log_create("com.apple.pencilkit", "PencilTextInput");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE213000, v12, OS_LOG_TYPE_INFO, "Skip textInputSourceDidChange notification.", buf, 2u);
      }

    }
    else
    {
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __77__PKTextInputWindowFirstResponderController__handleTextInputSourceDidChange___block_invoke;
      v17 = &unk_1E7777C20;
      v18 = self;
      v19 = v9;
      v13 = (void (**)(_QWORD))_Block_copy(&v14);
      if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", v14, v15, v16, v17, v18))
        v13[2](v13);
      else
        dispatch_async(MEMORY[0x1E0C80D38], v13);

    }
  }

}

uint64_t __77__PKTextInputWindowFirstResponderController__handleTextInputSourceDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateFirstResponder:isVisible:sendDelegateCallback:");
}

- (void)_forceControllerToReload:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PKTextInputWindowFirstResponderControllerReloadResponderKey"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PKTextInputWindowFirstResponderController _updateFirstResponder:isVisible:sendDelegateCallback:](self, "_updateFirstResponder:isVisible:sendDelegateCallback:");
}

- (void)keyboardSceneDelegate:(id)a3 inputViewSetVisibilityDidChange:(BOOL)a4 includedReset:(BOOL)a5
{
  _BOOL8 v5;
  id v7;

  v5 = a4;
  objc_msgSend(a3, "responder");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PKTextInputWindowFirstResponderController _updateFirstResponder:isVisible:sendDelegateCallback:](self, "_updateFirstResponder:isVisible:sendDelegateCallback:", v7, v5, 1);

}

- (BOOL)_isResponderEditableTextInput:(id)a3
{
  if (a3)
    return +[PKTextInputElementsFinder isResponderEditableTextInput:]((uint64_t)PKTextInputElementsFinder, a3);
  else
    return 0;
}

- (PKTextInputWindowFirstResponderControllerDelegate)delegate
{
  return (PKTextInputWindowFirstResponderControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PKTextInputWindowFirstResponder)firstResponder
{
  return self->_firstResponder;
}

- (void)setFirstResponder:(id)a3
{
  objc_storeStrong((id *)&self->_firstResponder, a3);
}

- (BOOL)paletteFloatingMode
{
  return self->_paletteFloatingMode;
}

- (void)setPaletteFloatingMode:(BOOL)a3
{
  self->_paletteFloatingMode = a3;
}

- (NSNotificationCenter)_notificationCenter
{
  return self->__notificationCenter;
}

- (void)set_notificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->__notificationCenter, a3);
}

- (NSNotification)_delayedNotification
{
  return self->__delayedNotification;
}

- (void)set_delayedNotification:(id)a3
{
  objc_storeStrong((id *)&self->__delayedNotification, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__delayedNotification, 0);
  objc_storeStrong((id *)&self->__notificationCenter, 0);
  objc_storeStrong((id *)&self->_firstResponder, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
