@implementation WKKeyboardScrollViewAnimator

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void)setDelegate:(id)a3
{
  WKKeyboardScrollViewAnimatorDelegate **p_delegate;

  p_delegate = &self->_delegate;
  objc_storeWeak((id *)&self->_delegate, a3);
  objc_loadWeak((id *)p_delegate);
  self->_delegateRespondsToIsKeyboardScrollable = objc_opt_respondsToSelector() & 1;
  objc_loadWeak((id *)p_delegate);
  self->_delegateRespondsToDistanceForIncrement = objc_opt_respondsToSelector() & 1;
  objc_loadWeak((id *)p_delegate);
  self->_delegateRespondsToWillScroll = objc_opt_respondsToSelector() & 1;
  objc_loadWeak((id *)p_delegate);
  self->_delegateRespondsToDidFinishScrolling = objc_opt_respondsToSelector() & 1;
}

- (WKKeyboardScrollViewAnimator)initWithScrollView:(id)a3
{
  WKKeyboardScrollViewAnimator *v4;
  WKKeyboardScrollViewAnimator *v5;
  WKKeyboardScrollingAnimator *v6;
  void *m_ptr;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WKKeyboardScrollViewAnimator;
  v4 = -[WKKeyboardScrollViewAnimator init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_scrollView, a3);
    v6 = -[WKKeyboardScrollingAnimator initWithScrollable:]([WKKeyboardScrollingAnimator alloc], "initWithScrollable:", v5);
    m_ptr = v5->_animator.m_ptr;
    v5->_animator.m_ptr = v6;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v5;
}

- (void)stopScrollingImmediately
{
  objc_msgSend(self->_animator.m_ptr, "stopScrollingImmediately");
}

- (void)didFinishScrolling
{
  if (self->_delegateRespondsToDidFinishScrolling)
    objc_msgSend(objc_loadWeak((id *)&self->_delegate), "keyboardScrollViewAnimatorDidFinishScrolling:", self);
}

- (WKKeyboardScrollViewAnimator)init
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(self->_animator.m_ptr, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)WKKeyboardScrollViewAnimator;
  -[WKKeyboardScrollViewAnimator dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  void *m_ptr;

  objc_storeWeak((id *)&self->_scrollView, 0);
  objc_msgSend(self->_animator.m_ptr, "invalidate");
  m_ptr = self->_animator.m_ptr;
  self->_animator.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (void)willStartInteractiveScroll
{
  objc_msgSend(self->_animator.m_ptr, "willStartInteractiveScroll");
}

- (BOOL)beginWithEvent:(id)a3
{
  return objc_msgSend(self->_animator.m_ptr, "beginWithEvent:", a3);
}

- (void)handleKeyEvent:(id)a3
{
  objc_msgSend(self->_animator.m_ptr, "handleKeyEvent:", a3);
}

- (BOOL)scrollTriggeringKeyIsPressed
{
  return objc_msgSend(self->_animator.m_ptr, "scrollTriggeringKeyIsPressed");
}

- (BOOL)isKeyboardScrollable
{
  if (self->_delegateRespondsToIsKeyboardScrollable)
    return objc_msgSend(objc_loadWeak((id *)&self->_delegate), "isScrollableForKeyboardScrollViewAnimator:", self);
  else
    return 1;
}

- (double)distanceForIncrement:(unsigned __int8)a3 inDirection:(unsigned __int8)a4
{
  uint64_t v4;
  uint64_t v5;
  WKVelocityTrackingScrollView **p_scrollView;
  id Weak;
  double result;
  int v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v4 = a4;
  v5 = a3;
  p_scrollView = &self->_scrollView;
  Weak = objc_loadWeak((id *)&self->_scrollView);
  result = 0.0;
  if (!Weak)
    return result;
  if (self->_delegateRespondsToDistanceForIncrement)
  {
    objc_msgSend(objc_loadWeak((id *)&self->_delegate), "keyboardScrollViewAnimator:distanceForIncrement:inDirection:", self, v5, v4);
    return result;
  }
  if (!(_DWORD)v5)
  {
    objc_msgSend(objc_loadWeak((id *)p_scrollView), "zoomScale");
    v13 = 40.0;
    return v12 * v13;
  }
  v10 = v4 & 0xFE;
  if ((_DWORD)v5 == 1)
  {
    objc_msgSend(objc_loadWeak((id *)p_scrollView), "frame");
    if (v10 == 2)
      v12 = v14;
    else
      v12 = v15;
    v13 = 0.8;
    return v12 * v13;
  }
  if ((_DWORD)v5 == 2)
  {
    objc_msgSend(objc_loadWeak((id *)p_scrollView), "contentSize");
    if (v10 != 2)
      return v11;
  }
  return result;
}

- (void)scrollToContentOffset:(FloatPoint)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  WKVelocityTrackingScrollView **p_scrollView;
  id Weak;

  v4 = a4;
  p_scrollView = &self->_scrollView;
  if (objc_loadWeak((id *)&self->_scrollView))
  {
    if (self->_delegateRespondsToWillScroll)
      objc_msgSend(objc_loadWeak((id *)&self->_delegate), "keyboardScrollViewAnimatorWillScroll:", self);
    Weak = objc_loadWeak((id *)p_scrollView);
    WebCore::FloatPoint::operator CGPoint();
    objc_msgSend(Weak, "_wk_setContentOffsetAndShowScrollIndicators:animated:", v4);
  }
}

- (void)willBeginScrollingToExtentWithAnimationInTrackingView:(id)a3
{
  WKVelocityTrackingScrollView **p_scrollView;

  p_scrollView = &self->_scrollView;
  objc_msgSend(objc_loadWeak((id *)&self->_scrollView), "addSubview:", a3);
  objc_msgSend(objc_loadWeak((id *)p_scrollView), "flashScrollIndicators");
}

- (CGPoint)contentOffset
{
  WKVelocityTrackingScrollView **p_scrollView;
  double v3;
  double v4;
  CGPoint result;

  p_scrollView = &self->_scrollView;
  if (objc_loadWeak((id *)&self->_scrollView))
  {
    objc_msgSend(objc_loadWeak((id *)p_scrollView), "contentOffset");
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D538];
    v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)boundedContentOffset:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  objc_msgSend(objc_loadWeak((id *)&self->_scrollView), "_wk_clampToScrollExtents:", a3.x, a3.y);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGSize)interactiveScrollVelocity
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(objc_loadWeak((id *)&self->_scrollView), "interactiveScrollVelocityInPointsPerSecond");
  result.height = v3;
  result.width = v2;
  return result;
}

- (RectEdges<BOOL>)scrollableDirectionsFromOffset:(CGPoint)a3
{
  double y;
  double x;
  WKVelocityTrackingScrollView **p_scrollView;
  id Weak;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
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

  y = a3.y;
  x = a3.x;
  p_scrollView = &self->_scrollView;
  Weak = objc_loadWeak((id *)&self->_scrollView);
  if (Weak)
  {
    objc_msgSend(objc_loadWeak((id *)p_scrollView), "adjustedContentInset");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(objc_loadWeak((id *)p_scrollView), "contentSize");
    v16 = v15;
    v18 = v17;
    objc_msgSend(objc_loadWeak((id *)p_scrollView), "bounds");
    v21 = v14 + v16 - v20;
    if (v21 <= -v10)
      v21 = -v10;
    v22 = v12 + v18 - v19;
    if (v22 <= -v8)
      v22 = -v8;
    LODWORD(Weak) = (y > -v8) | ((x > -v10) << 24) | ((y < v22) << 16) | ((x < v21) << 8);
  }
  return (RectEdges<BOOL>)Weak;
}

- (RectEdges<BOOL>)rubberbandableDirections
{
  WKVelocityTrackingScrollView **p_scrollView;
  id Weak;
  int v4;

  p_scrollView = &self->_scrollView;
  Weak = objc_loadWeak((id *)&self->_scrollView);
  if (Weak)
  {
    v4 = objc_msgSend(objc_loadWeak((id *)p_scrollView), "_wk_canScrollVerticallyWithoutBouncing");
    LODWORD(Weak) = objc_msgSend(objc_loadWeak((id *)p_scrollView), "_wk_canScrollHorizontallyWithoutBouncing");
  }
  else
  {
    v4 = 0;
  }
  return (RectEdges<BOOL>)(((_DWORD)Weak << 24) | (v4 << 16) | ((_DWORD)Weak << 8) | v4);
}

- (WKKeyboardScrollViewAnimatorDelegate)delegate
{
  return (WKKeyboardScrollViewAnimatorDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  void *m_ptr;

  objc_destroyWeak((id *)&self->_delegate);
  m_ptr = self->_animator.m_ptr;
  self->_animator.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  objc_destroyWeak((id *)&self->_scrollView);
}

@end
