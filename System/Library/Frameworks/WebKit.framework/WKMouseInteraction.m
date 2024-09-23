@implementation WKMouseInteraction

- (UIView)view
{
  return (UIView *)objc_loadWeak((id *)&self->_view);
}

- (void)setEnabled:(BOOL)a3
{
  uint64_t v5;
  _QWORD v6[4];
  BOOL v7;

  if (self->_enabled != a3)
  {
    v5 = MEMORY[0x1E0C809B0];
    self->_enabled = a3;
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __33__WKMouseInteraction_setEnabled___block_invoke;
    v6[3] = &__block_descriptor_33_e29_v16__0__UIGestureRecognizer_8l;
    v7 = a3;
    -[WKMouseInteraction _forEachGesture:](self, "_forEachGesture:", v6);
    if (!a3)
      -[WKMouseInteraction _resetCachedState](self, "_resetCachedState");
  }
}

- (WKMouseInteraction)initWithDelegate:(id)a3
{
  WKMouseInteraction *v4;
  WKMouseTouchGestureRecognizer *v5;
  void *m_ptr;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WKMouseInteraction;
  v4 = -[WKMouseInteraction init](&v13, sel_init);
  if (v4)
  {
    v5 = -[WKMouseTouchGestureRecognizer initWithInteraction:]([WKMouseTouchGestureRecognizer alloc], "initWithInteraction:", v4);
    m_ptr = v4->_mouseTouchGestureRecognizer.m_ptr;
    v4->_mouseTouchGestureRecognizer.m_ptr = v5;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      v5 = (WKMouseTouchGestureRecognizer *)v4->_mouseTouchGestureRecognizer.m_ptr;
    }
    -[WKMouseTouchGestureRecognizer setName:](v5, "setName:", CFSTR("WKMouseTouch"));
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA628]), "initWithTarget:action:", v4, sel__hoverGestureRecognized_);
    v8 = v4->_pencilHoverGestureRecognizer.m_ptr;
    v4->_pencilHoverGestureRecognizer.m_ptr = v7;
    if (v8)
    {
      CFRelease(v8);
      v7 = v4->_pencilHoverGestureRecognizer.m_ptr;
    }
    objc_msgSend(v7, "setName:", CFSTR("WKPencilHover"));
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA628]), "initWithTarget:action:", v4, sel__hoverGestureRecognized_);
    v10 = v4->_mouseHoverGestureRecognizer.m_ptr;
    v4->_mouseHoverGestureRecognizer.m_ptr = v9;
    if (v10)
    {
      CFRelease(v10);
      v9 = v4->_mouseHoverGestureRecognizer.m_ptr;
    }
    objc_msgSend(v9, "setName:", CFSTR("WKMouseHover"));
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __39__WKMouseInteraction_initWithDelegate___block_invoke;
    v12[3] = &unk_1E34CE010;
    v12[4] = v4;
    -[WKMouseInteraction _forEachGesture:](v4, "_forEachGesture:", v12);
    objc_msgSend(v4->_pencilHoverGestureRecognizer.m_ptr, "setAllowedTouchTypes:", &unk_1E356F6A8);
    objc_msgSend(v4->_mouseTouchGestureRecognizer.m_ptr, "setAllowedTouchTypes:", &unk_1E356F6C0);
    objc_msgSend(v4->_mouseHoverGestureRecognizer.m_ptr, "setAllowedTouchTypes:", &unk_1E356F6D8);
    objc_storeWeak((id *)&v4->_delegate, a3);
    v4->_enabled = 1;
    v4->_cancelledOrExited = 1;
  }
  return v4;
}

- (void)didMoveToView:(id)a3
{
  UIView **p_view;
  _QWORD v6[5];

  p_view = &self->_view;
  if (objc_loadWeak((id *)&self->_view) != a3)
  {
    objc_storeWeak((id *)p_view, a3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __36__WKMouseInteraction_didMoveToView___block_invoke;
    v6[3] = &unk_1E34CE010;
    v6[4] = a3;
    -[WKMouseInteraction _forEachGesture:](self, "_forEachGesture:", v6);
  }
}

- (void)willMoveToView:(id)a3
{
  _QWORD v4[5];

  if (objc_loadWeak((id *)&self->_view) != a3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __37__WKMouseInteraction_willMoveToView___block_invoke;
    v4[3] = &unk_1E34CE010;
    v4[4] = self;
    -[WKMouseInteraction _forEachGesture:](self, "_forEachGesture:", v4);
    -[WKMouseInteraction _resetCachedState](self, "_resetCachedState");
  }
}

- (void)_forEachGesture:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, self->_mouseTouchGestureRecognizer.m_ptr);
  (*((void (**)(id, void *))a3 + 2))(a3, self->_mouseHoverGestureRecognizer.m_ptr);
  (*((void (**)(id, void *))a3 + 2))(a3, self->_pencilHoverGestureRecognizer.m_ptr);
}

uint64_t __39__WKMouseInteraction_initWithDelegate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegate:", *(_QWORD *)(a1 + 32));
}

uint64_t __37__WKMouseInteraction_willMoveToView___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 48)), "removeGestureRecognizer:", a2);
}

uint64_t __36__WKMouseInteraction_didMoveToView___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addGestureRecognizer:", a2);
}

- (void)_resetCachedState
{
  void *m_ptr;
  void *v4;

  *(_WORD *)&self->_touching = 256;
  self->_lastLocation.var0.__null_state_ = 0;
  self->_lastLocation.__engaged_ = 0;
  self->_pressedButtonMask.var0.__null_state_ = 0;
  self->_pressedButtonMask.__engaged_ = 0;
  m_ptr = self->_currentHoverTouch.m_ptr;
  self->_currentHoverTouch.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_currentMouseTouch.m_ptr;
  self->_currentMouseTouch.m_ptr = 0;
  if (v4)
    CFRelease(v4);
}

- (id).cxx_construct
{
  *((_BYTE *)self + 56) = 0;
  *((_BYTE *)self + 72) = 0;
  *((_BYTE *)self + 80) = 0;
  *((_BYTE *)self + 88) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((_QWORD *)self + 5) = 0;
  return self;
}

- (BOOL)hasGesture:(id)a3
{
  return self->_mouseTouchGestureRecognizer.m_ptr == a3
      || self->_mouseHoverGestureRecognizer.m_ptr == a3
      || self->_pencilHoverGestureRecognizer.m_ptr == a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

uint64_t __33__WKMouseInteraction_setEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setEnabled:", *(unsigned __int8 *)(a1 + 32));
}

- (UITouch)mouseTouch
{
  uint64_t v2;

  v2 = 40;
  if (!self->_touching)
    v2 = 32;
  return *(UITouch **)((char *)&self->super.isa + v2);
}

- (UIGestureRecognizer)mouseTouchGestureRecognizer
{
  return (UIGestureRecognizer *)self->_mouseTouchGestureRecognizer.m_ptr;
}

- (id)_activeGesture
{
  uint64_t v3;
  uint64_t v4;

  if (self->_touching)
  {
    v3 = 8;
  }
  else
  {
    v4 = objc_msgSend(self->_currentHoverTouch.m_ptr, "type");
    v3 = 16;
    if (v4 == 2)
      v3 = 24;
  }
  return *(Class *)((char *)&self->super.isa + v3);
}

- (optional<WebKit::NativeWebMouseEvent>)createMouseEventWithType:(optional<WebKit:(optional<WebKit::NativeWebMouseEvent> *)self :NativeWebMouseEvent> *__return_ptr)retstr wasCancelled:
{
  __int16 v2;
  char v3;
  char v5;
  optional<WebKit::NativeWebMouseEvent> *v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  _BOOL4 v10;
  _BOOL4 v11;
  char v12;
  __int16 v13;
  char v14;
  __int16 v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  int32x2_t v21;
  int v22;
  int32x2_t v23;
  double v24;
  double v25;
  WebCore *v26;
  StringImpl **v27;
  StringImpl *v28;
  RetainPtr<WebEvent> v29;
  WTF::StringImpl *v30;
  CGFloat y;
  CGFloat x;
  int32x2_t v33;
  int32x2_t v34;
  int32x2_t v35;
  CGPoint v36;

  if ((v2 & 0xFF00) == 0)
  {
    retstr->var0.var0 = 0;
    retstr[4].var0.var0 = 0;
    return self;
  }
  v5 = v3;
  v6 = self;
  v7 = v2;
  v8 = objc_msgSend((id)unk_1EE3D7E28(self, "_activeGesture"), "modifierFlags");
  if (((v8 >> 17) & 2) != 0)
  {
    v10 = v6[3].var0.var1.var1.var0 == 0;
    v11 = v7 == 1;
    v12 = 2;
LABEL_11:
    v13 = 2;
    goto LABEL_12;
  }
  if (!v6[2].var0.var1.var3[8])
  {
    v12 = 0;
    v10 = v6[3].var0.var1.var1.var0 == 0;
    v11 = v7 == 1;
    goto LABEL_9;
  }
  v9 = *((_QWORD *)&v6[2].var0.var15 + 2);
  v10 = v6[3].var0.var1.var1.var0 == 0;
  v11 = v7 == 1;
  if ((v9 & 2) != 0)
  {
    v12 = v9 & 2;
    goto LABEL_11;
  }
  v12 = 0;
LABEL_9:
  v13 = 1;
LABEL_12:
  if (v10)
    v14 = -2;
  else
    v14 = v12;
  if (v11 || v10)
    v15 = 0;
  else
    v15 = v13;
  v16 = (void *)unk_1EE3D7E30(v6, "mouseTouch");
  unk_1EE3D7E38(v6, "locationInView:", unk_1EE3D7E40(v6, "view"));
  v36.x = v17;
  v36.y = v18;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v35, &v36);
  objc_msgSend(v16, "previousLocationInView:", unk_1EE3D7E48(v6, "view"));
  v36.x = v19;
  v36.y = v20;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v34, &v36);
  v21 = vsub_s32(v35, v34);
  v22 = objc_msgSend(v16, "tapCount");
  objc_msgSend(v16, "timestamp");
  v34 = v23;
  WTF::MonotonicTime::approximateWallTime((WTF::MonotonicTime *)&v34);
  v25 = v24;
  v26 = (WebCore *)objc_msgSend(v16, "type");
  if (v26 == (WebCore *)2)
    v27 = (StringImpl **)WebCore::penPointerEventType((WebCore *)2);
  else
    v27 = (StringImpl **)WebCore::mousePointerEventType(v26);
  v28 = *v27;
  if (*v27)
    *(_DWORD *)v28 += 2;
  v29.var0 = (void *)vcvt_f32_s32(v21);
  self = (optional<WebKit::NativeWebMouseEvent> *)WTF::UUID::UUID((WTF::UUID *)&v36);
  x = v36.x;
  y = v36.y;
  v33 = v35;
  if (v28)
    *(_DWORD *)v28 += 2;
  retstr->var0.var0 = v7;
  retstr->var0.var1.var1.var0 = (v8 >> 12) & 0x10 | (v8 >> 17) & 0xF;
  *(_DWORD *)(&retstr->var0.var1.var1 + 1) = LODWORD(v36.x);
  HIWORD(retstr->var0.var5.m_y) = WORD2(v36.x);
  retstr->var0.var1.var2.var0 = v25;
  *((CGFloat *)&retstr->var0.var15 + 2) = x;
  *((CGFloat *)&retstr->var0.var16 + 3) = y;
  retstr[1].var0.var0 = v14;
  *(_WORD *)(&retstr[1].var0.var1.var1 + 1) = v15;
  *(int32x2_t *)(&retstr[1].var0.var3 + 2) = v33;
  *(int32x2_t *)((char *)&retstr[1].var0.var11 + 12) = v33;
  *(RetainPtr<WebEvent> *)((char *)&retstr[1].var0.var16 + 20) = v29;
  *((_DWORD *)&retstr[1].var0.var16 + 7) = 0;
  retstr[2].var0.var14.m_impl.m_ptr = 0;
  *((_DWORD *)&retstr[2].var0.var7 + 2) = v22;
  *((_QWORD *)&retstr[2].var0.var15 + 2) = 0;
  retstr[2].var0.var1.var3[8] = 0;
  *((_DWORD *)&retstr[2].var0.var16 + 7) = 1;
  retstr[3].var0.var14.m_impl.m_ptr = v28;
  *((_BYTE *)&retstr[3].var0.var7 + 8) = v5;
  *((_QWORD *)&retstr[3].var0.var15 + 2) = 0;
  retstr[4].var0.var0 = 1;
  if (v28)
  {
    if (*(_DWORD *)v28 == 2)
      return (optional<WebKit::NativeWebMouseEvent> *)WTF::StringImpl::destroy((WTF::StringImpl *)v28, v30);
    else
      *(_DWORD *)v28 -= 2;
  }
  return self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  int v7;
  void *m_ptr;

  if (self->_pencilHoverGestureRecognizer.m_ptr == a3 || (v7 = objc_msgSend(a4, "_isPointerTouch")) != 0)
  {
    if (self->_mouseHoverGestureRecognizer.m_ptr == a3 || self->_pencilHoverGestureRecognizer.m_ptr == a3)
    {
      if (a4)
        CFRetain(a4);
      m_ptr = self->_currentHoverTouch.m_ptr;
      self->_currentHoverTouch.m_ptr = a4;
      if (m_ptr)
        CFRelease(m_ptr);
    }
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (void)_hoverGestureRecognized:(id)a3
{
  uint64_t v5;
  double v6;
  double v7;
  _BOOL4 engaged;
  WTF::StringImpl *v9;
  _BYTE v10[152];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_currentHoverTouch.m_ptr)
  {
    v5 = objc_msgSend(a3, "state");
    if ((unint64_t)(v5 - 1) <= 4)
      self->_cancelledOrExited = 0x101010000uLL >> (8 * (v5 - 1));
    if (!objc_msgSend(a3, "buttonMask"))
    {
      objc_msgSend(a3, "locationInView:", -[WKMouseInteraction view](self, "view"));
      engaged = self->_lastLocation.__engaged_;
      if (v5 == 4)
      {
        self->_lastLocation.var0.__val_.x = v6;
        self->_lastLocation.var0.__val_.y = v7;
        if (engaged)
        {
LABEL_14:
          -[WKMouseInteraction createMouseEventWithType:wasCancelled:](self, "createMouseEventWithType:wasCancelled:", 258, v5 == 4);
          if (v10[128])
            objc_msgSend(objc_loadWeak((id *)&self->_delegate), "mouseInteraction:changedWithEvent:", self, v10);
          std::__optional_destruct_base<WebKit::NativeWebMouseEvent,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v10, v9);
          return;
        }
      }
      else
      {
        if (self->_lastLocation.__engaged_)
        {
          if (self->_lastLocation.var0.__val_.x == v6 && self->_lastLocation.var0.__val_.y == v7)
            return;
          self->_lastLocation.var0.__val_.x = v6;
          self->_lastLocation.var0.__val_.y = v7;
          goto LABEL_14;
        }
        self->_lastLocation.var0.__val_.x = v6;
        self->_lastLocation.var0.__val_.y = v7;
      }
      self->_lastLocation.__engaged_ = 1;
      goto LABEL_14;
    }
  }
}

- (void)_updateMouseTouches:(id)a3
{
  void *v4;
  void *v5;
  void *m_ptr;
  _BOOL4 engaged;
  CGFloat v8;
  CGFloat v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  int64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  WTF::StringImpl *v17;
  char v18;
  id Weak;
  _BYTE v20[128];
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "anyObject");
  v5 = v4;
  if (v4)
    CFRetain(v4);
  m_ptr = self->_currentMouseTouch.m_ptr;
  self->_currentMouseTouch.m_ptr = v5;
  if (m_ptr)
    CFRelease(m_ptr);
  objc_msgSend(self->_mouseTouchGestureRecognizer.m_ptr, "locationInView:", objc_loadWeak((id *)&self->_view));
  engaged = self->_lastLocation.__engaged_;
  self->_lastLocation.var0.__val_.x = v8;
  self->_lastLocation.var0.__val_.y = v9;
  if (!engaged)
    self->_lastLocation.__engaged_ = 1;
  v10 = objc_msgSend(self->_currentMouseTouch.m_ptr, "phase");
  v11 = v10;
  if ((unint64_t)(v10 - 3) < 2)
  {
    v14 = 1;
    v16 = 256;
    v15 = 1;
    v12 = 1;
  }
  else if (v10 == 1)
  {
    v12 = 1;
    self->_touching = 1;
    v14 = 0;
    self->_pressedButtonMask.var0.__val_ = objc_msgSend(self->_mouseTouchGestureRecognizer.m_ptr, "buttonMask");
    self->_pressedButtonMask.__engaged_ = 1;
    v16 = 256;
    v15 = 2;
  }
  else if (v10)
  {
    v14 = 0;
    v15 = 0;
    v12 = 0;
    v16 = 0;
  }
  else
  {
    v12 = 1;
    self->_touching = 1;
    v13 = objc_msgSend(self->_mouseTouchGestureRecognizer.m_ptr, "buttonMask");
    v14 = 0;
    v15 = 0;
    self->_pressedButtonMask.var0.__val_ = v13;
    self->_pressedButtonMask.__engaged_ = 1;
    v16 = 256;
  }
  -[WKMouseInteraction createMouseEventWithType:wasCancelled:](self, "createMouseEventWithType:wasCancelled:", v16 | v15, v11 == 4);
  v18 = v12 ^ 1;
  if (!v21)
    v18 = 1;
  if ((v18 & 1) == 0)
  {
    Weak = objc_loadWeak((id *)&self->_delegate);
    if (!v21)
      __break(1u);
    objc_msgSend(Weak, "mouseInteraction:changedWithEvent:", self, v20);
    if (v14)
    {
      self->_touching = 0;
      if (self->_pressedButtonMask.__engaged_)
        self->_pressedButtonMask.__engaged_ = 0;
    }
  }
  std::__optional_destruct_base<WebKit::NativeWebMouseEvent,false>::~__optional_destruct_base[abi:sn180100]((uint64_t)v20, v17);
}

- (CGPoint)locationInView:(id)a3
{
  UITouch *v5;
  double v6;
  double v7;
  CGPoint result;

  v5 = -[WKMouseInteraction mouseTouch](self, "mouseTouch");
  if (v5 && !self->_cancelledOrExited)
  {
    -[UITouch locationInView:](v5, "locationInView:", a3);
  }
  else
  {
    v6 = -1.0;
    v7 = -1.0;
  }
  result.y = v7;
  result.x = v6;
  return result;
}

- (WKMouseInteractionDelegate)delegate
{
  return (WKMouseInteractionDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (optional<CGPoint>)lastLocation
{
  *retstr = *(optional<CGPoint> *)((char *)self + 56);
  return self;
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);
  m_ptr = self->_currentMouseTouch.m_ptr;
  self->_currentMouseTouch.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_currentHoverTouch.m_ptr;
  self->_currentHoverTouch.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_pencilHoverGestureRecognizer.m_ptr;
  self->_pencilHoverGestureRecognizer.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  v6 = self->_mouseHoverGestureRecognizer.m_ptr;
  self->_mouseHoverGestureRecognizer.m_ptr = 0;
  if (v6)
    CFRelease(v6);
  v7 = self->_mouseTouchGestureRecognizer.m_ptr;
  self->_mouseTouchGestureRecognizer.m_ptr = 0;
  if (v7)
    CFRelease(v7);
}

@end
