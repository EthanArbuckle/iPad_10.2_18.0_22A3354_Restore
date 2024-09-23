@implementation WKWebEvent

- (WKWebEvent)initWithEvent:(id)a3
{
  __int16 v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  WKWebEvent *v13;
  WKWebEvent *v14;
  void *m_ptr;
  int v17;
  objc_super v18;

  if (_MergedGlobals_248 != 1)
  {
    qword_1EE341948 = (uint64_t)NSClassFromString(CFSTR("UIPhysicalKeyboardEvent"));
    _MergedGlobals_248 = 1;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a3, "_hidEvent"))
  {
    v5 = objc_msgSend(a3, "_keyCode");
    v6 = objc_msgSend(a3, "_inputFlags");
    v7 = objc_msgSend(a3, "_gsModifierFlags");
    a3 = (id)objc_msgSend(a3, "_cloneEvent");
  }
  else
  {
    if (a3)
      CFRetain(a3);
    v5 = 0;
    v6 = 0;
    v7 = 0;
  }
  if (objc_msgSend(a3, "_isKeyDown"))
    v8 = 4;
  else
    v8 = 5;
  objc_msgSend(a3, "timestamp");
  v10 = v9;
  v11 = objc_msgSend(a3, "_modifiedInput");
  v12 = objc_msgSend(a3, "_unmodifiedInput");
  v18.receiver = self;
  v18.super_class = (Class)WKWebEvent;
  BYTE2(v17) = objc_msgSend((id)objc_msgSend(a3, "_modifiedInput"), "isEqualToString:", CFSTR("\t"));
  LOWORD(v17) = v5;
  v13 = -[WebEvent initWithKeyEventType:timeStamp:characters:charactersIgnoringModifiers:modifiers:isRepeating:withFlags:withInputManagerHint:keyCode:isTabKey:](&v18, sel_initWithKeyEventType_timeStamp_characters_charactersIgnoringModifiers_modifiers_isRepeating_withFlags_withInputManagerHint_keyCode_isTabKey_, v8, v11, v12, v7, v6 & 1, v6, v10, 0, v17);
  v14 = v13;
  if (!v13)
  {
    if (!a3)
      return v14;
    goto LABEL_14;
  }
  m_ptr = v13->_uiEvent.m_ptr;
  v13->_uiEvent.m_ptr = a3;
  a3 = m_ptr;
  if (m_ptr)
LABEL_14:
    CFRelease(a3);
  return v14;
}

- (UIEvent)uiEvent
{
  return (UIEvent *)self->_uiEvent.m_ptr;
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_uiEvent.m_ptr;
  self->_uiEvent.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 18) = 0;
  return self;
}

@end
