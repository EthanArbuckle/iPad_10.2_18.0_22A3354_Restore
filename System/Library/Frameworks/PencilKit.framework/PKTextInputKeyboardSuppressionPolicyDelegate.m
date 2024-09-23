@implementation PKTextInputKeyboardSuppressionPolicyDelegate

- (void)updateKeyboardSuppressionPolicy
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", *MEMORY[0x1E0DC5588], 0);

}

- (id)_recognitionLocaleIdentifier
{
  id v2;
  void *v4;
  void *v5;
  void *v6;

  if (self->_isQueryingLocaleIdentifier)
  {
    v2 = 0;
  }
  else
  {
    self->_isQueryingLocaleIdentifier = 1;
    +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recognitionLocaleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isQueryingLocaleIdentifier = 0;
    if (-[PKTextInputKeyboardSuppressionPolicyDelegate _suppressLocaleIdentifier](self, "_suppressLocaleIdentifier"))
      v6 = 0;
    else
      v6 = v5;
    v2 = v6;

  }
  return v2;
}

- (BOOL)_shouldSuppressForDelegate:(id)a3
{
  return -[PKTextInputKeyboardSuppressionPolicyDelegate _shouldSuppressKeyboardUIForDelegate:checkSource:](self, "_shouldSuppressKeyboardUIForDelegate:checkSource:", a3, 1);
}

- (BOOL)_shouldSuppressAssistantBarForDelegate:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  char v17;

  v4 = a3;
  if (!_os_feature_enabled_impl())
  {
    +[PKTextInputSettings sharedSettings](PKTextInputSettings, "sharedSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "UCBPaletteEnabled");

    if (v9
      && !-[PKTextInputKeyboardSuppressionPolicyDelegate isFloatingKeyboardVisible](self, "isFloatingKeyboardVisible"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend(v4, "_responderWindow"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = +[PKToolPicker isActiveToolPickerVisibleForWindow:](PKToolPicker, "isActiveToolPickerVisibleForWindow:", v10), v10, v11))
      {
        v12 = v4;
        if (objc_msgSend(v12, "isStylusDrawingEnabled"))
          v13 = objc_msgSend(v12, "_isHandwritingToolSelected") ^ 1;
        else
          v13 = 1;

      }
      else
      {
        v13 = 1;
      }
      v17 = -[PKTextInputKeyboardSuppressionPolicyDelegate _shouldSuppressKeyboardUIForDelegate:checkSource:](self, "_shouldSuppressKeyboardUIForDelegate:checkSource:", v4, v13);
      goto LABEL_22;
    }
    goto LABEL_17;
  }
  objc_msgSend(v4, "_responderWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[PKToolPicker isActiveToolPickerVisibleForWindow:](PKToolPicker, "isActiveToolPickerVisibleForWindow:", v5);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    LOBYTE(v7) = 0;
    if (!v6)
      goto LABEL_15;
  }
  else if ((objc_opt_respondsToSelector() & 1) == 0
         || (v7 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EF5D8B10) ^ 1, !v6))
  {
LABEL_15:
    if (v4)
    {
      v17 = +[PKTextInputElementsFinder shouldDisableInputAssistantForTextInput:]((uint64_t)PKTextInputElementsFinder, v4);
LABEL_22:
      v16 = v17;
      goto LABEL_23;
    }
LABEL_17:
    v16 = 0;
    goto LABEL_23;
  }
  if ((v7 & 1) != 0)
    goto LABEL_15;
  objc_msgSend(v4, "_responderWindow");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKToolPicker activeToolPickerForWindow:](PKToolPicker, "activeToolPickerForWindow:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[PKTextInputKeyboardSuppressionPolicyDelegate _shouldSuppressKeyboardUIForDelegate:checkSource:](self, "_shouldSuppressKeyboardUIForDelegate:checkSource:", v4, objc_msgSend(v15, "_isHandwritingToolSelected") ^ 1);
LABEL_23:

  return v16;
}

- (BOOL)isSupportedForTextInputTraits:(id)a3
{
  return !+[PKTextInputUtilities textInputTraitsAreSecure:](PKTextInputUtilities, "textInputTraitsAreSecure:", a3);
}

- (BOOL)_shouldSuppressKeyboardUIForDelegate:(id)a3 checkSource:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  _BOOL4 v8;
  BOOL v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  id v16;

  v4 = a4;
  v6 = a3;
  -[PKTextInputKeyboardSuppressionPolicyDelegate _recognitionLocaleIdentifier](self, "_recognitionLocaleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "_textInputSource") == 3;
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    v8 = 0;
    if (!v4)
      goto LABEL_8;
  }
  if (!v8)
  {
LABEL_7:
    v9 = 0;
    goto LABEL_12;
  }
LABEL_8:
  v16 = 0;
  v10 = +[PKTextInputUtilities isResponderSupportedTextInput:outTextInputTraits:](PKTextInputUtilities, "isResponderSupportedTextInput:outTextInputTraits:", v6, &v16);
  v11 = v16;
  objc_msgSend(v11, "textContentType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v11, "textContentType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DC5420]) ^ 1;

  }
  else
  {
    LOBYTE(v14) = 1;
  }

  v9 = v10 & v14;
LABEL_12:

  return v9;
}

- (BOOL)_suppressLocaleIdentifier
{
  return self->_suppressLocaleIdentifier;
}

- (void)set_suppressLocaleIdentifier:(BOOL)a3
{
  self->_suppressLocaleIdentifier = a3;
}

- (BOOL)isFloatingKeyboardVisible
{
  return self->isFloatingKeyboardVisible;
}

- (void)setIsFloatingKeyboardVisible:(BOOL)a3
{
  self->isFloatingKeyboardVisible = a3;
}

@end
