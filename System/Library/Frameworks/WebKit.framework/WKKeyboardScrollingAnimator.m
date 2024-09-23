@implementation WKKeyboardScrollingAnimator

- (WKKeyboardScrollingAnimator)initWithScrollable:(id)a3
{
  WKKeyboardScrollingAnimator *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WKKeyboardScrollingAnimator;
  result = -[WKKeyboardScrollingAnimator init](&v5, sel_init);
  if (result)
    result->_scrollable = (WKKeyboardScrollableInternal *)a3;
  return result;
}

- (id).cxx_construct
{
  *((_BYTE *)self + 60) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_BYTE *)self + 32) = 0;
  *(_OWORD *)((char *)self + 68) = 0u;
  *(_OWORD *)((char *)self + 84) = 0u;
  return self;
}

- (void)stopScrollingImmediately
{
  -[WKKeyboardScrollingAnimator resetViewForScrollToExtentAnimation](self, "resetViewForScrollToExtentAnimation");
  -[WKKeyboardScrollableInternal didFinishScrolling](self->_scrollable, "didFinishScrolling");
  -[WKKeyboardScrollingAnimator stopDisplayLink](self, "stopDisplayLink");
  self->_velocity.m_width = 0.0;
  self->_velocity.m_height = 0.0;
}

- (void)stopDisplayLink
{
  void *m_ptr;

  objc_msgSend(self->_displayLink.m_ptr, "invalidate");
  m_ptr = self->_displayLink.m_ptr;
  self->_displayLink.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (void)resetViewForScrollToExtentAnimation
{
  void *m_ptr;

  objc_msgSend((id)objc_msgSend(self->_viewForTrackingScrollToExtentAnimation.m_ptr, "layer"), "removeAllAnimations");
  objc_msgSend(self->_viewForTrackingScrollToExtentAnimation.m_ptr, "removeFromSuperview");
  m_ptr = self->_viewForTrackingScrollToExtentAnimation.m_ptr;
  self->_viewForTrackingScrollToExtentAnimation.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (WKKeyboardScrollingAnimator)init
{
  return 0;
}

- (void)invalidate
{
  -[WKKeyboardScrollingAnimator resetViewForScrollToExtentAnimation](self, "resetViewForScrollToExtentAnimation");
  -[WKKeyboardScrollingAnimator stopAnimatedScroll](self, "stopAnimatedScroll");
  -[WKKeyboardScrollingAnimator stopDisplayLink](self, "stopDisplayLink");
  self->_scrollable = 0;
}

- (optional<WebCore::KeyboardScroll>)keyboardScrollForEvent:(SEL)a3
{
  optional<WebCore::KeyboardScroll> *result;
  void *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  BOOL v16;
  unsigned int v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  float v23;
  float v24;
  float v25;
  float v26;
  float v27;
  _QWORD v28[5];

  result = (optional<WebCore::KeyboardScroll> *)-[WKKeyboardScrollableInternal isKeyboardScrollable](self->_scrollable, "isKeyboardScrollable");
  if ((result & 1) == 0)
    goto LABEL_15;
  result = (optional<WebCore::KeyboardScroll> *)objc_msgSend(a4, "keyboardFlags");
  if ((result & 0x20) != 0)
    goto LABEL_15;
  v8 = (void *)objc_msgSend(a4, "charactersIgnoringModifiers");
  result = (optional<WebCore::KeyboardScroll> *)objc_msgSend(v8, "length");
  if (!result)
    goto LABEL_15;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __54__WKKeyboardScrollingAnimator_keyboardScrollForEvent___block_invoke;
  v28[3] = &unk_1E34CDDB8;
  v28[4] = v8;
  result = (optional<WebCore::KeyboardScroll> *)__54__WKKeyboardScrollingAnimator_keyboardScrollForEvent___block_invoke((uint64_t)v28);
  if (!(_DWORD)result)
    goto LABEL_15;
  v9 = (int)result;
  v10 = objc_msgSend(a4, "modifierFlags");
  v11 = objc_msgSend(a4, "modifierFlags") & 0x480000;
  result = (optional<WebCore::KeyboardScroll> *)objc_msgSend(a4, "modifierFlags");
  v12 = v10 & 0x220000;
  if (v12)
    v13 = (v11 != 0) + 1;
  else
    v13 = v11 != 0;
  v14 = result & 0x1010000;
  if ((result & 0x1010000) != 0)
    ++v13;
  if (v13 < 2
    && ((v9 - 3) > 4u ? (v15 = 19070976) : (v15 = dword_1978D035C[(char)v9 - 3]),
        result = (optional<WebCore::KeyboardScroll> *)objc_msgSend(a4, "modifierFlags"),
        (result & v15) == 0))
  {
    v17 = 2 * (v14 != 0);
    if (v11)
      v17 = 1;
    v18 = (v9 - 1) > 1 || v11 != 0;
    if ((v9 - 3) >= 2)
      v19 = v18;
    else
      v19 = v17;
    switch(v9)
    {
      case 2:
        v20 = 3;
        break;
      case 3:
      case 5:
        v20 = 0;
        break;
      case 4:
      case 6:
        v20 = 1;
        break;
      case 7:
        v20 = v12 == 0;
        break;
      default:
        v20 = 2;
        break;
    }
    -[WKKeyboardScrollableInternal distanceForIncrement:inDirection:](self->_scrollable, "distanceForIncrement:inDirection:", v19, v20);
    v22 = v21;
    result = (optional<WebCore::KeyboardScroll> *)WebCore::unitVectorForScrollDirection();
    v23 = v22;
    v25 = v24 * v23;
    v27 = v26 * v23;
    retstr->var0.__val_.offset.m_width = v25;
    retstr->var0.__val_.offset.m_height = v27;
    retstr->var0.__val_.maximumVelocity.m_width = v25 * 25.0;
    retstr->var0.__val_.maximumVelocity.m_height = v27 * 25.0;
    retstr->var0.__val_.force.m_width = v25 * 25.0;
    retstr->var0.__val_.force.m_height = v27 * 25.0;
    retstr->var0.__val_.granularity = v19;
    retstr->var0.__val_.direction = v20;
    v16 = 1;
  }
  else
  {
LABEL_15:
    v16 = 0;
    retstr->var0.__null_state_ = 0;
  }
  retstr->__engaged_ = v16;
  return result;
}

uint64_t __54__WKKeyboardScrollingAnimator_keyboardScrollForEvent___block_invoke(uint64_t a1)
{
  int v1;
  int v2;
  uint64_t result;

  v1 = objc_msgSend(*(id *)(a1 + 32), "characterAtIndex:", 0);
  if (v1 > 63275)
  {
    if (v1 == 63276)
    {
      return 5;
    }
    else if (v1 == 63277)
    {
      return 6;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v2 = v1 - 63232;
    result = 1;
    switch(v2)
    {
      case 0:
        result = 3;
        break;
      case 1:
        result = 4;
        break;
      case 2:
        return result;
      case 3:
        result = 2;
        break;
      default:
        return 0;
    }
  }
  return result;
}

- (BOOL)beginWithEvent:(id)a3
{
  BOOL v5;
  BOOL result;
  unsigned int v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  WKKeyboardScrollableInternal *scrollable;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *m_ptr;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  CGFloat v26;
  CGFloat v27;
  float v28;
  float v29;
  CGFloat v30;
  CGFloat v31;
  float32x2_t v32;
  FloatPoint v33;
  CGPoint v34;
  float32x2_t v35;
  _BYTE v36[29];

  if (objc_msgSend(a3, "type") != 4)
    return 0;
  if (!self)
    return 0;
  -[WKKeyboardScrollingAnimator keyboardScrollForEvent:](self, "keyboardScrollForEvent:", a3);
  if (!v36[28])
    return 0;
  if (self->_scrollTriggeringKeyIsPressed)
    return 0;
  LODWORD(v34.x) = -[WKKeyboardScrollableInternal rubberbandableDirections](self->_scrollable, "rubberbandableDirections");
  v7 = v36[25] - 1;
  v8 = v7 > 2 ? 0 : qword_1978D0370[(char)v7];
  if (!*((_BYTE *)&v34.x + v8))
    return 0;
  self->_scrollTriggeringKeyIsPressed = 1;
  *(_OWORD *)&self->_currentScroll.var0.__null_state_ = *(_OWORD *)v36;
  *(_OWORD *)((char *)&self->_currentScroll.var0.__val_.maximumVelocity.m_height + 1) = *(_OWORD *)&v36[13];
  result = -[WKKeyboardScrollingAnimator resetViewForScrollToExtentAnimation](self, "resetViewForScrollToExtentAnimation");
  if (!v36[28])
    goto LABEL_28;
  if (v36[24] != 2)
  {
    -[WKKeyboardScrollingAnimator startDisplayLinkIfNeeded](self, "startDisplayLinkIfNeeded");
    -[WKKeyboardScrollableInternal interactiveScrollVelocity](self->_scrollable, "interactiveScrollVelocity");
    v34.x = v26;
    v34.y = v27;
    result = WebCore::FloatSize::FloatSize((WebCore::FloatSize *)&v35, (const CGSize *)&v34);
    if (!v36[28])
      goto LABEL_28;
    switch(v36[25])
    {
      case 0:
        v28 = fminf(v35.f32[1], 0.0);
        goto LABEL_22;
      case 1:
        v28 = fmaxf(v35.f32[1], 0.0);
LABEL_22:
        v35.f32[1] = v28;
        break;
      case 2:
        v29 = fminf(v35.f32[0], 0.0);
        goto LABEL_25;
      case 3:
        v29 = fmaxf(v35.f32[0], 0.0);
LABEL_25:
        v35.f32[0] = v29;
        break;
      default:
        break;
    }
    -[WKKeyboardScrollableInternal contentOffset](self->_scrollable, "contentOffset");
    v34.x = v30;
    v34.y = v31;
    result = WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v33, &v34);
    v32 = (float32x2_t)v33;
    self->_currentPosition = v33;
    self->_velocity = (FloatSize)vadd_f32((float32x2_t)self->_velocity, v35);
    if (!self->_currentScroll.__engaged_)
      goto LABEL_28;
    self->_idealPositionForMinimumTravel = (FloatPoint)vadd_f32(*(float32x2_t *)&self->_currentScroll.var0.__null_state_, v32);
    return 1;
  }
  self->_velocity.m_width = 0.0;
  self->_velocity.m_height = 0.0;
  -[WKKeyboardScrollingAnimator stopAnimatedScroll](self, "stopAnimatedScroll");
  result = -[WKKeyboardScrollableInternal contentOffset](self->_scrollable, "contentOffset");
  if (v36[28])
  {
    v11 = v9;
    v12 = v10;
    scrollable = self->_scrollable;
    *(float32x2_t *)&v34.x = vadd_f32((float32x2_t)self->_currentPosition, *(float32x2_t *)v36);
    WebCore::FloatPoint::operator CGPoint();
    -[WKKeyboardScrollableInternal boundedContentOffset:](scrollable, "boundedContentOffset:");
    v15 = v14;
    v17 = v16;
    v18 = (void *)objc_opt_new();
    m_ptr = self->_viewForTrackingScrollToExtentAnimation.m_ptr;
    self->_viewForTrackingScrollToExtentAnimation.m_ptr = v18;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      v18 = self->_viewForTrackingScrollToExtentAnimation.m_ptr;
    }
    v5 = 1;
    objc_msgSend(v18, "setHidden:", 1);
    objc_msgSend(self->_viewForTrackingScrollToExtentAnimation.m_ptr, "setUserInteractionEnabled:", 0);
    -[WKKeyboardScrollableInternal willBeginScrollingToExtentWithAnimationInTrackingView:](self->_scrollable, "willBeginScrollingToExtentWithAnimationInTrackingView:", self->_viewForTrackingScrollToExtentAnimation.m_ptr);
    v20 = (void *)objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
    objc_msgSend(v20, "setMass:", 1.0);
    objc_msgSend(v20, "setStiffness:", 109.662271);
    objc_msgSend(v20, "setDamping:", 20.943951);
    objc_msgSend(v20, "setDuration:", 1.6);
    LODWORD(v21) = 1045220557;
    LODWORD(v22) = 0;
    LODWORD(v23) = 1.0;
    LODWORD(v24) = 1.0;
    objc_msgSend(v20, "setTimingFunction:", objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v22, v21, v23, v24));
    objc_msgSend(v20, "setFromValue:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v11, v12));
    objc_msgSend(v20, "setToValue:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v15, v17));
    v25 = (void *)objc_msgSend(self->_viewForTrackingScrollToExtentAnimation.m_ptr, "layer");
    objc_msgSend(v25, "setPosition:", v11, v12);
    objc_msgSend(v25, "removeAllAnimations");
    objc_msgSend(v25, "addAnimation:forKey:", v20, CFSTR("ScrollToExtentAnimation"));
    objc_msgSend(v25, "setPosition:", v15, v17);
    -[WKKeyboardScrollingAnimator startDisplayLinkIfNeeded](self, "startDisplayLinkIfNeeded");
    return v5;
  }
LABEL_28:
  __break(1u);
  return result;
}

- (void)handleKeyEvent:(id)a3
{
  char v5;

  if (self->_scrollTriggeringKeyIsPressed)
  {
    -[WKKeyboardScrollingAnimator keyboardScrollForEvent:](self, "keyboardScrollForEvent:");
    if (!v5 || objc_msgSend(a3, "type") == 5 || (objc_msgSend(a3, "modifierFlags") & 0x1010000) != 0)
    {
      -[WKKeyboardScrollingAnimator stopAnimatedScroll](self, "stopAnimatedScroll");
      self->_scrollTriggeringKeyIsPressed = 0;
    }
  }
}

- (void)stopAnimatedScroll
{
  int8x16_t v2;
  int8x16_t v3;
  int8x16_t v4;
  WKKeyboardScrollableInternal *scrollable;
  int8x16_t v7;
  float v8;
  float m_x;
  float m_y;
  BOOL v11;
  BOOL v12;
  CGFloat v13;
  CGFloat v14;
  unint64_t v15;
  CGPoint v16;
  FloatPoint v17;

  if (self->_currentScroll.__engaged_)
  {
    scrollable = self->_scrollable;
    v2.i32[0] = LODWORD(self->_velocity.m_width);
    v3.i32[0] = LODWORD(self->_velocity.m_height);
    *(float *)v4.i32 = sqrtf((float)(*(float *)v2.i32 * *(float *)v2.i32) * 0.0091743);
    v7.i64[0] = 0x8000000080000000;
    v7.i64[1] = 0x8000000080000000;
    v8 = *(float *)vbslq_s8(v7, v4, v2).i32;
    *(float *)v4.i32 = sqrtf((float)(*(float *)v3.i32 * *(float *)v3.i32) * 0.0091743);
    *(float *)v2.i32 = v8 + self->_currentPosition.m_x;
    *(float *)v3.i32 = *(float *)vbslq_s8(v7, v4, v3).i32 + self->_currentPosition.m_y;
    m_x = self->_idealPositionForMinimumTravel.m_x;
    m_y = self->_idealPositionForMinimumTravel.m_y;
    switch(self->_currentScroll.var0.__val_.direction)
    {
      case 0u:
        v11 = m_y < *(float *)v3.i32;
        goto LABEL_6;
      case 1u:
        v11 = *(float *)v3.i32 < m_y;
LABEL_6:
        if (v11)
          v3.i32[0] = LODWORD(self->_idealPositionForMinimumTravel.m_y);
        break;
      case 2u:
        v12 = m_x < *(float *)v2.i32;
        goto LABEL_11;
      case 3u:
        v12 = *(float *)v2.i32 < m_x;
LABEL_11:
        if (v12)
          v2.i32[0] = LODWORD(self->_idealPositionForMinimumTravel.m_x);
        break;
      default:
        v2.i32[0] = 0;
        v3.i32[0] = 0;
        break;
    }
    v15 = __PAIR64__(v3.u32[0], v2.u32[0]);
    WebCore::FloatPoint::operator CGPoint();
    -[WKKeyboardScrollableInternal boundedContentOffset:](scrollable, "boundedContentOffset:", v15);
    v16.x = v13;
    v16.y = v14;
    WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v17, &v16);
    self->_idealPosition = v17;
    if (self->_currentScroll.__engaged_)
      self->_currentScroll.__engaged_ = 0;
  }
}

- (BOOL)scrollTriggeringKeyIsPressed
{
  return self->_scrollTriggeringKeyIsPressed;
}

- (void)willStartInteractiveScroll
{
  self->_velocity.m_width = 0.0;
  self->_velocity.m_height = 0.0;
  -[WKKeyboardScrollingAnimator resetViewForScrollToExtentAnimation](self, "resetViewForScrollToExtentAnimation");
  -[WKKeyboardScrollingAnimator stopAnimatedScroll](self, "stopAnimatedScroll");
  -[WKKeyboardScrollingAnimator stopDisplayLink](self, "stopDisplayLink");
}

- (void)startDisplayLinkIfNeeded
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *m_ptr;
  void *v9;
  uint64_t v10;

  if (!self->_displayLink.m_ptr)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel_displayLinkFired_);
    v7 = v3;
    if (v3)
      CFRetain(v3);
    m_ptr = self->_displayLink.m_ptr;
    self->_displayLink.m_ptr = v7;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      v7 = self->_displayLink.m_ptr;
    }
    if (_MergedGlobals_31 == 1)
    {
      LODWORD(v4) = dword_1EE341904;
      LODWORD(v5) = unk_1EE341908;
      LODWORD(v6) = dword_1EE34190C;
    }
    else
    {
      *(CAFrameRateRange *)&v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
      dword_1EE341904 = LODWORD(v4);
      unk_1EE341908 = LODWORD(v5);
      dword_1EE34190C = LODWORD(v6);
      _MergedGlobals_31 = 1;
    }
    objc_msgSend(v7, "setPreferredFrameRateRange:", v4, v5, v6);
    objc_msgSend(self->_displayLink.m_ptr, "setHighFrameRateReason:", 2883586);
    v9 = self->_displayLink.m_ptr;
    v10 = objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    objc_msgSend(v9, "addToRunLoop:forMode:", v10, *MEMORY[0x1E0C99860]);
  }
}

- (void)displayLinkFired:(id)a3
{
  void *m_ptr;
  void *v5;
  WKKeyboardScrollableInternal *scrollable;
  CGFloat v7;
  CGFloat v8;
  double v9;
  double v10;
  WKKeyboardScrollableInternal *v12;
  int direction;
  uint64_t v14;
  float32x2_t v20;
  FloatSize force;
  float32x2_t v22;
  __int32 v23;
  WKKeyboardScrollableInternal *v24;
  CGFloat v25;
  CGFloat v26;
  float32x2_t v28;
  double v29;
  double v30;
  double v31;
  FloatSize v32;
  float32x2_t v33;
  FloatPoint currentPosition;
  FloatPoint v35;
  float32x2_t v36;
  CGPoint v37;
  _DWORD v38[2];

  m_ptr = self->_viewForTrackingScrollToExtentAnimation.m_ptr;
  if (m_ptr)
  {
    if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend(m_ptr, "layer", a3), "animationKeys"), "containsObject:", CFSTR("ScrollToExtentAnimation")) & 1) != 0)
    {
      v5 = (void *)objc_msgSend((id)objc_msgSend(self->_viewForTrackingScrollToExtentAnimation.m_ptr, "layer"), "presentationLayer");
      if (v5)
      {
        scrollable = self->_scrollable;
        objc_msgSend(v5, "position");
        v37.x = v7;
        v37.y = v8;
        WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v38, &v37);
        LODWORD(v9) = v38[0];
        LODWORD(v10) = v38[1];
        -[WKKeyboardScrollableInternal scrollToContentOffset:animated:](scrollable, "scrollToContentOffset:animated:", 0, v9, v10);
      }
    }
    else
    {
      -[WKKeyboardScrollableInternal didFinishScrolling](self->_scrollable, "didFinishScrolling");
      -[WKKeyboardScrollingAnimator resetViewForScrollToExtentAnimation](self, "resetViewForScrollToExtentAnimation");
      -[WKKeyboardScrollingAnimator stopDisplayLink](self, "stopDisplayLink");
    }
    return;
  }
  if (self->_currentScroll.__engaged_)
  {
    v12 = self->_scrollable;
    WebCore::FloatPoint::operator CGPoint();
    LODWORD(v37.x) = -[WKKeyboardScrollableInternal scrollableDirectionsFromOffset:](v12, "scrollableDirectionsFromOffset:");
    if (self->_currentScroll.__engaged_)
    {
      direction = self->_currentScroll.var0.__val_.direction;
      if ((direction - 1) > 2)
        v14 = 0;
      else
        v14 = qword_1978D0370[(char)(direction - 1)];
      if (*((_BYTE *)&v37.x + v14))
      {
        _D8 = (float32x2_t)vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32((direction & 0xFE) == 2), 0x1FuLL)), (int8x8_t)0x3F80000000000000, (int8x8_t)1065353216);
        force = self->_currentScroll.var0.__val_.force;
LABEL_16:
        v20 = (float32x2_t)vbic_s8((int8x8_t)force, (int8x8_t)vcage_f32((float32x2_t)self->_velocity, (float32x2_t)self->_currentScroll.var0.__val_.maximumVelocity));
        goto LABEL_17;
      }
      WebCore::unitVectorForScrollDirection();
      if (self->_currentScroll.__engaged_)
      {
        v22.i32[1] = v23;
        force = (FloatSize)vmul_f32(v22, (float32x2_t)vdup_n_s32(0x459C4000u));
        __asm { FMOV            V8.2S, #1.0 }
        goto LABEL_16;
      }
    }
    __break(1u);
    return;
  }
  __asm { FMOV            V8.2S, #1.0 }
  v20 = 0;
LABEL_17:
  v24 = self->_scrollable;
  WebCore::FloatPoint::operator CGPoint();
  -[WKKeyboardScrollableInternal boundedContentOffset:](v24, "boundedContentOffset:");
  v37.x = v25;
  v37.y = v26;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v36, &v37);
  __asm { FMOV            V2.2S, #-20.0 }
  v28 = vadd_f32(v20, vmul_f32(_D8, vadd_f32(vmul_f32(vsub_f32((float32x2_t)self->_currentPosition, v36), (float32x2_t)vdup_n_s32(0xC2DA0000)), vmul_f32((float32x2_t)self->_velocity, _D2))));
  objc_msgSend(a3, "targetTimestamp");
  v30 = v29;
  objc_msgSend(a3, "timestamp");
  *(float *)&v31 = v30 - v31;
  v32 = (FloatSize)vadd_f32((float32x2_t)self->_velocity, vmul_n_f32(v28, *(float *)&v31));
  self->_velocity = v32;
  v33 = vmul_n_f32((float32x2_t)v32, *(float *)&v31);
  currentPosition = self->_currentPosition;
  v35 = (FloatPoint)vadd_f32(v33, (float32x2_t)currentPosition);
  self->_currentPosition = v35;
  currentPosition.m_x = v35.m_y;
  -[WKKeyboardScrollableInternal scrollToContentOffset:animated:](self->_scrollable, "scrollToContentOffset:animated:", 0, *(double *)&v35, *(double *)&currentPosition);
  if (!self->_scrollTriggeringKeyIsPressed
    && (float)((float)(self->_velocity.m_height * self->_velocity.m_height)
             + (float)(self->_velocity.m_width * self->_velocity.m_width)) < 1.0)
  {
    -[WKKeyboardScrollableInternal didFinishScrolling](self->_scrollable, "didFinishScrolling");
    -[WKKeyboardScrollingAnimator stopDisplayLink](self, "stopDisplayLink");
    self->_velocity.m_width = 0.0;
    self->_velocity.m_height = 0.0;
  }
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;

  m_ptr = self->_viewForTrackingScrollToExtentAnimation.m_ptr;
  self->_viewForTrackingScrollToExtentAnimation.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_displayLink.m_ptr;
  self->_displayLink.m_ptr = 0;
  if (v4)
    CFRelease(v4);
}

@end
