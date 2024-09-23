@implementation WKFormInputSession

- (WKFormInputSession)initWithContentView:(id)a3 focusedElementInfo:(id)a4 requiresStrongPasswordAssistance:(BOOL)a5
{
  WKFormInputSession *v8;
  WKFormInputSession *v9;
  void *m_ptr;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WKFormInputSession;
  v8 = -[WKFormInputSession init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_contentView.m_weakReference, a3);
    if (a4)
      CFRetain(a4);
    m_ptr = v9->_focusedElementInfo.m_ptr;
    v9->_focusedElementInfo.m_ptr = a4;
    if (m_ptr)
      CFRelease(m_ptr);
    v9->_requiresStrongPasswordAssistance = a5;
  }
  return v9;
}

- (_WKFocusedElementInfo)focusedElementInfo
{
  return (_WKFocusedElementInfo *)self->_focusedElementInfo.m_ptr;
}

- (NSSecureCoding)userObject
{
  return (NSSecureCoding *)objc_msgSend(self->_focusedElementInfo.m_ptr, "userObject");
}

- (BOOL)isValid
{
  return objc_loadWeak(&self->_contentView.m_weakReference) != 0;
}

- (NSString)accessoryViewCustomButtonTitle
{
  return (NSString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(objc_loadWeak(&self->_contentView.m_weakReference), "formAccessoryView"), "autoFillButtonItem"), "title");
}

- (void)setAccessoryViewCustomButtonTitle:(id)a3
{
  uint64_t v5;
  WeakObjCPtr<WKContentView> *p_contentView;
  void *v7;
  PAL *v8;

  v5 = objc_msgSend(a3, "length");
  p_contentView = &self->_contentView;
  v7 = (void *)objc_msgSend(objc_loadWeak(&p_contentView->m_weakReference), "formAccessoryView");
  if (v5)
    v8 = (PAL *)objc_msgSend(v7, "showAutoFillButtonWithTitle:", a3);
  else
    v8 = (PAL *)objc_msgSend(v7, "hideAutoFillButton");
  if ((PAL::currentUserInterfaceIdiomIsSmallScreen(v8) & 1) == 0)
    objc_msgSend(objc_loadWeak(&p_contentView->m_weakReference), "reloadInputViews");
}

- (BOOL)accessoryViewShouldNotShow
{
  return self->_accessoryViewShouldNotShow;
}

- (void)setAccessoryViewShouldNotShow:(BOOL)a3
{
  if (self->_accessoryViewShouldNotShow != a3)
  {
    self->_accessoryViewShouldNotShow = a3;
    objc_msgSend(objc_loadWeak(&self->_contentView.m_weakReference), "reloadInputViews");
  }
}

- (BOOL)forceSecureTextEntry
{
  return self->_forceSecureTextEntry;
}

- (void)setForceSecureTextEntry:(BOOL)a3
{
  if (self->_forceSecureTextEntry != a3)
  {
    self->_forceSecureTextEntry = a3;
    objc_msgSend(objc_loadWeak(&self->_contentView.m_weakReference), "reloadInputViews");
  }
}

- (UIView)customInputView
{
  return (UIView *)self->_customInputView.m_ptr;
}

- (void)setCustomInputView:(id)a3
{
  id m_ptr;

  m_ptr = self->_customInputView.m_ptr;
  if (m_ptr != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      m_ptr = self->_customInputView.m_ptr;
    }
    self->_customInputView.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
    objc_msgSend(objc_loadWeak(&self->_contentView.m_weakReference), "reloadInputViews");
  }
}

- (UIView)customInputAccessoryView
{
  return (UIView *)self->_customInputAccessoryView.m_ptr;
}

- (void)setCustomInputAccessoryView:(id)a3
{
  id m_ptr;

  m_ptr = self->_customInputAccessoryView.m_ptr;
  if (m_ptr != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      m_ptr = self->_customInputAccessoryView.m_ptr;
    }
    self->_customInputAccessoryView.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
    objc_msgSend(objc_loadWeak(&self->_contentView.m_weakReference), "reloadInputViews");
  }
}

- (void)endEditing
{
  if (objc_msgSend(self->_customInputView.m_ptr, "conformsToProtocol:", &unk_1EE38EE88))
    objc_msgSend(self->_customInputView.m_ptr, "controlEndEditing");
}

- (NSArray)suggestions
{
  return (NSArray *)self->_suggestions.m_ptr;
}

- (void)setSuggestions:(id)a3
{
  void *v5;
  void *m_ptr;

  if (self->_suggestions.m_ptr != a3 && (objc_msgSend(a3, "isEqualToArray:") & 1) == 0)
  {
    v5 = (void *)objc_msgSend(a3, "copy");
    m_ptr = self->_suggestions.m_ptr;
    self->_suggestions.m_ptr = v5;
    if (m_ptr)
      CFRelease(m_ptr);
    objc_msgSend(objc_loadWeak(&self->_contentView.m_weakReference), "updateTextSuggestionsForInputDelegate");
  }
}

- (BOOL)requiresStrongPasswordAssistance
{
  return self->_requiresStrongPasswordAssistance;
}

- (void)invalidate
{
  WeakObjCPtr<WKContentView> *p_contentView;
  id to;

  p_contentView = &self->_contentView;
  to = 0;
  objc_moveWeak(&to, &self->_contentView.m_weakReference);
  objc_storeWeak(&p_contentView->m_weakReference, 0);
  objc_msgSend(objc_loadWeak(&to), "_provideSuggestionsToInputDelegate:", 0);
  objc_destroyWeak(&to);
}

- (void)reloadFocusedElementContextView
{
  objc_msgSend(objc_loadWeak(&self->_contentView.m_weakReference), "reloadContextViewForPresentedListViewController");
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;
  void *v6;

  m_ptr = self->_suggestions.m_ptr;
  self->_suggestions.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_customInputAccessoryView.m_ptr;
  self->_customInputAccessoryView.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_customInputView.m_ptr;
  self->_customInputView.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  v6 = self->_focusedElementInfo.m_ptr;
  self->_focusedElementInfo.m_ptr = 0;
  if (v6)
    CFRelease(v6);
  objc_destroyWeak(&self->_contentView.m_weakReference);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
