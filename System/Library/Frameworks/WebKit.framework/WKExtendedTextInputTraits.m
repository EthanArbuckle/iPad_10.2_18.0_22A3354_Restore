@implementation WKExtendedTextInputTraits

- (UIColor)insertionPointColor
{
  return (UIColor *)self->_insertionPointColor.m_ptr;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (WKExtendedTextInputTraits)init
{
  WKExtendedTextInputTraits *v2;
  WKExtendedTextInputTraits *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WKExtendedTextInputTraits;
  v2 = -[WKExtendedTextInputTraits init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[WKExtendedTextInputTraits setTypingAdaptationEnabled:](v2, "setTypingAdaptationEnabled:", 1);
    -[WKExtendedTextInputTraits setAutocapitalizationType:](v3, "setAutocapitalizationType:", 2);
  }
  return v3;
}

- (void)setAutocapitalizationType:(int64_t)a3
{
  self->_autocapitalizationType = a3;
}

- (void)setTextContentType:(id)a3
{
  void *v4;
  void *m_ptr;

  v4 = (void *)objc_msgSend(a3, "copy");
  m_ptr = self->_textContentType.m_ptr;
  self->_textContentType.m_ptr = v4;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (void)setSingleLineDocument:(BOOL)a3
{
  self->_singleLineDocument = a3;
}

- (void)setSelectionHighlightColor:(id)a3
{
  void *m_ptr;

  if (a3)
    CFRetain(a3);
  m_ptr = self->_selectionHighlightColor.m_ptr;
  self->_selectionHighlightColor.m_ptr = a3;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (void)setSelectionColorsToMatchTintColor:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;

  if (!a3)
  {
    -[WKExtendedTextInputTraits setInsertionPointColor:](self, "setInsertionPointColor:");
    -[WKExtendedTextInputTraits setSelectionHandleColor:](self, "setSelectionHandleColor:", 0);
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  v5 = (id)objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  if (v5 == a3)
    v6 = 0;
  else
    v6 = a3;
  -[WKExtendedTextInputTraits setInsertionPointColor:](self, "setInsertionPointColor:", v6);
  -[WKExtendedTextInputTraits setSelectionHandleColor:](self, "setSelectionHandleColor:", v6);
  if (v5 == a3)
    goto LABEL_8;
  v7 = objc_msgSend(a3, "colorWithAlphaComponent:", 0.2);
LABEL_9:
  -[WKExtendedTextInputTraits setSelectionHighlightColor:](self, "setSelectionHighlightColor:", v7);
}

- (void)setSelectionHandleColor:(id)a3
{
  void *m_ptr;

  if (a3)
    CFRetain(a3);
  m_ptr = self->_selectionHandleColor.m_ptr;
  self->_selectionHandleColor.m_ptr = a3;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (void)setSecureTextEntry:(BOOL)a3
{
  self->_secureTextEntry = a3;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (void)setInsertionPointColor:(id)a3
{
  void *m_ptr;

  if (a3)
    CFRetain(a3);
  m_ptr = self->_insertionPointColor.m_ptr;
  self->_insertionPointColor.m_ptr = a3;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (void)setInlinePredictionType:(int64_t)a3
{
  self->_inlinePredictionType = a3;
}

- (void)setAutocorrectionType:(int64_t)a3
{
  self->_autocorrectionType = a3;
}

- (void)setPasswordRules:(id)a3
{
  void *v4;
  void *m_ptr;

  v4 = (void *)objc_msgSend(a3, "copy");
  m_ptr = self->_passwordRules.m_ptr;
  self->_passwordRules.m_ptr = v4;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (UITextInputPasswordRules)passwordRules
{
  return (UITextInputPasswordRules *)(id)CFMakeCollectable((CFTypeRef)objc_msgSend(self->_passwordRules.m_ptr, "copy"));
}

- (NSString)textContentType
{
  return (NSString *)(id)CFMakeCollectable((CFTypeRef)objc_msgSend(self->_textContentType.m_ptr, "copy"));
}

- (UIColor)selectionHandleColor
{
  return (UIColor *)self->_selectionHandleColor.m_ptr;
}

- (UIColor)selectionHighlightColor
{
  return (UIColor *)self->_selectionHighlightColor.m_ptr;
}

- (void)restoreDefaultValues
{
  -[WKExtendedTextInputTraits setTypingAdaptationEnabled:](self, "setTypingAdaptationEnabled:", 1);
  -[WKExtendedTextInputTraits setInlinePredictionType:](self, "setInlinePredictionType:", 0);
  -[WKExtendedTextInputTraits setAutocapitalizationType:](self, "setAutocapitalizationType:", 2);
  -[WKExtendedTextInputTraits setAutocorrectionType:](self, "setAutocorrectionType:", 0);
  -[WKExtendedTextInputTraits setSpellCheckingType:](self, "setSpellCheckingType:", 0);
  -[WKExtendedTextInputTraits setSmartQuotesType:](self, "setSmartQuotesType:", 0);
  -[WKExtendedTextInputTraits setSmartDashesType:](self, "setSmartDashesType:", 0);
  -[WKExtendedTextInputTraits setKeyboardType:](self, "setKeyboardType:", 0);
  -[WKExtendedTextInputTraits setKeyboardAppearance:](self, "setKeyboardAppearance:", 0);
  -[WKExtendedTextInputTraits setReturnKeyType:](self, "setReturnKeyType:", 0);
  -[WKExtendedTextInputTraits setSecureTextEntry:](self, "setSecureTextEntry:", 0);
  -[WKExtendedTextInputTraits setSingleLineDocument:](self, "setSingleLineDocument:", 0);
  -[WKExtendedTextInputTraits setTextContentType:](self, "setTextContentType:", 0);
  -[WKExtendedTextInputTraits setPasswordRules:](self, "setPasswordRules:", 0);
  -[WKExtendedTextInputTraits setSmartInsertDeleteType:](self, "setSmartInsertDeleteType:", 0);
  -[WKExtendedTextInputTraits setEnablesReturnKeyAutomatically:](self, "setEnablesReturnKeyAutomatically:", 0);
  -[WKExtendedTextInputTraits setInsertionPointColor:](self, "setInsertionPointColor:", 0);
  -[WKExtendedTextInputTraits setSelectionHandleColor:](self, "setSelectionHandleColor:", 0);
  -[WKExtendedTextInputTraits setSelectionHighlightColor:](self, "setSelectionHighlightColor:", 0);
}

- (int64_t)autocapitalizationType
{
  return self->_autocapitalizationType;
}

- (int64_t)autocorrectionType
{
  return self->_autocorrectionType;
}

- (int64_t)spellCheckingType
{
  return self->_spellCheckingType;
}

- (void)setSpellCheckingType:(int64_t)a3
{
  self->_spellCheckingType = a3;
}

- (int64_t)smartQuotesType
{
  return self->_smartQuotesType;
}

- (void)setSmartQuotesType:(int64_t)a3
{
  self->_smartQuotesType = a3;
}

- (int64_t)smartDashesType
{
  return self->_smartDashesType;
}

- (void)setSmartDashesType:(int64_t)a3
{
  self->_smartDashesType = a3;
}

- (int64_t)inlinePredictionType
{
  return self->_inlinePredictionType;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (int64_t)keyboardAppearance
{
  return self->_keyboardAppearance;
}

- (void)setKeyboardAppearance:(int64_t)a3
{
  self->_keyboardAppearance = a3;
}

- (int64_t)returnKeyType
{
  return self->_returnKeyType;
}

- (void)setReturnKeyType:(int64_t)a3
{
  self->_returnKeyType = a3;
}

- (BOOL)isSecureTextEntry
{
  return self->_secureTextEntry;
}

- (BOOL)isSingleLineDocument
{
  return self->_singleLineDocument;
}

- (BOOL)isTypingAdaptationEnabled
{
  return self->_typingAdaptationEnabled;
}

- (void)setTypingAdaptationEnabled:(BOOL)a3
{
  self->_typingAdaptationEnabled = a3;
}

- (int64_t)smartInsertDeleteType
{
  return self->_smartInsertDeleteType;
}

- (void)setSmartInsertDeleteType:(int64_t)a3
{
  self->_smartInsertDeleteType = a3;
}

- (BOOL)enablesReturnKeyAutomatically
{
  return self->_enablesReturnKeyAutomatically;
}

- (void)setEnablesReturnKeyAutomatically:(BOOL)a3
{
  self->_enablesReturnKeyAutomatically = a3;
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  m_ptr = self->_passwordRules.m_ptr;
  self->_passwordRules.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_selectionHighlightColor.m_ptr;
  self->_selectionHighlightColor.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_selectionHandleColor.m_ptr;
  self->_selectionHandleColor.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  v6 = self->_insertionPointColor.m_ptr;
  self->_insertionPointColor.m_ptr = 0;
  if (v6)
    CFRelease(v6);
  v7 = self->_textContentType.m_ptr;
  self->_textContentType.m_ptr = 0;
  if (v7)
    CFRelease(v7);
}

@end
