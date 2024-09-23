@implementation WKScrollView

- (id)delegate
{
  return objc_loadWeak(&self->_externalDelegate.m_weakReference);
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WKScrollView;
  -[WKScrollView setContentInset:](&v4, sel_setContentInset_, a3.top, a3.left, a3.bottom, a3.right);
  self->_contentInsetWasExternallyOverridden = 1;
  -[BEScrollViewDelegate _scheduleVisibleContentRectUpdate](self->_internalDelegate, "_scheduleVisibleContentRectUpdate");
}

- (void)_updateScrollability
{
  _BOOL8 v2;
  objc_super v3;

  v2 = self->_scrollEnabledByClient && self->_scrollEnabledInternal;
  v3.receiver = self;
  v3.super_class = (Class)WKScrollView;
  -[WKScrollView setScrollEnabled:](&v3, sel_setScrollEnabled_, v2);
}

- (void)_updateZoomability
{
  _BOOL8 v2;
  objc_super v3;

  v2 = self->_zoomEnabledByClient && self->_zoomEnabledInternal;
  v3.receiver = self;
  v3.super_class = (Class)WKScrollView;
  -[WKScrollView setZoomEnabled:](&v3, sel_setZoomEnabled_, v2);
}

- (void)_updateBouncability
{
  _BOOL8 v3;
  _BOOL8 v4;
  objc_super v5;
  objc_super v6;

  v3 = self->_bouncesSetByClient && self->_bouncesHorizontalInternal;
  v6.receiver = self;
  v6.super_class = (Class)WKScrollView;
  -[WKScrollView setBouncesHorizontally:](&v6, sel_setBouncesHorizontally_, v3);
  v4 = self->_bouncesSetByClient && self->_bouncesVerticalInternal;
  v5.receiver = self;
  v5.super_class = (Class)WKScrollView;
  -[WKScrollView setBouncesVertically:](&v5, sel_setBouncesVertically_, v4);
}

- (void)_setZoomEnabledInternal:(BOOL)a3
{
  self->_zoomEnabledInternal = a3;
  -[WKScrollView _updateZoomability](self, "_updateZoomability");
}

- (void)_setScrollEnabledInternal:(BOOL)a3
{
  self->_scrollEnabledInternal = a3;
  -[WKScrollView _updateScrollability](self, "_updateScrollability");
}

- (void)_setContentSizePreservingContentOffsetDuringRubberband:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double *v10;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  WebKit *v18;
  double v19;
  float v20;
  double v21;
  double v22;
  double v23;
  double v24;

  height = a3.height;
  width = a3.width;
  -[WKScrollView contentSize](self, "contentSize");
  v7 = v6;
  v9 = v8;
  if ((-[WKScrollView isDragging](self, "isDragging") & 1) == 0
    && (!-[WKScrollView isScrollEnabled](self, "isScrollEnabled")
     || !-[UIScrollView _wk_isScrolledBeyondExtents](self, "_wk_isScrolledBeyondExtents"))
    && !-[WKScrollView refreshControl](self, "refreshControl"))
  {
    goto LABEL_20;
  }
  v10 = (double *)MEMORY[0x1E0C9D820];
  if (v7 == *MEMORY[0x1E0C9D820] && v9 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    goto LABEL_20;
  v12 = v7 == width && v9 == height;
  if (!v12
    && ((-[WKScrollView zoomScale](self, "zoomScale"),
         v14 = v13,
         -[WKScrollView minimumZoomScale](self, "minimumZoomScale"),
         v14 >= v15)
     || (-[WKScrollView zoomScale](self, "zoomScale"),
         v17 = v16,
         v18 = (WebKit *)-[WKScrollView minimumZoomScale](self, "minimumZoomScale"),
         v20 = v19,
         WebKit::scalesAreEssentiallyEqual(v18, v17, v20))))
  {
    -[WKScrollView _currentTopLeftRubberbandAmount](self, "_currentTopLeftRubberbandAmount");
    v22 = v21;
    v24 = v23;
    -[WKScrollView setContentSize:](self, "setContentSize:", width, height);
    if (v22 != *v10 || v24 != v10[1])
      -[WKScrollView _restoreContentOffsetWithRubberbandAmount:](self, "_restoreContentOffsetWithRubberbandAmount:", v22, v24);
  }
  else
  {
LABEL_20:
    -[WKScrollView setContentSize:](self, "setContentSize:", width, height);
  }
}

- (BOOL)isScrollEnabled
{
  uint64_t v3;
  objc_super v5;

  v3 = objc_msgSend((id)objc_msgSend((id)-[WKScrollView panGestureRecognizer](self, "panGestureRecognizer"), "allowedTouchTypes"), "count");
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)WKScrollView;
    LOBYTE(v3) = -[WKScrollView isScrollEnabled](&v5, sel_isScrollEnabled);
  }
  return v3;
}

- (void)_setBouncesInternal:(BOOL)a3 vertical:(BOOL)a4
{
  self->_bouncesHorizontalInternal = a3;
  self->_bouncesVerticalInternal = a4;
  -[WKScrollView _updateBouncability](self, "_updateBouncability");
}

- (void)setContentInsetAdjustmentBehavior:(int64_t)a3
{
  objc_super v5;

  self->_contentInsetAdjustmentBehaviorWasExternallyOverridden = 1;
  if (-[WKScrollView contentInsetAdjustmentBehavior](self, "contentInsetAdjustmentBehavior") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)WKScrollView;
    -[WKScrollView setContentInsetAdjustmentBehavior:](&v5, sel_setContentInsetAdjustmentBehavior_, a3);
    -[BEScrollViewDelegate _scheduleVisibleContentRectUpdate](self->_internalDelegate, "_scheduleVisibleContentRectUpdate");
  }
}

- (void)_updateDelegate
{
  void *m_ptr;
  id WeakRetained;
  BEScrollViewDelegate *internalDelegate;
  WKScrollViewDelegateForwarder *v6;
  void *v7;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  m_ptr = self->_delegateForwarder.m_ptr;
  self->_delegateForwarder.m_ptr = 0;
  WeakRetained = objc_loadWeakRetained(&self->_externalDelegate.m_weakReference);
  internalDelegate = self->_internalDelegate;
  if (!WeakRetained)
  {
    v10.receiver = self;
    v10.super_class = (Class)WKScrollView;
    -[BEScrollView setDelegate:](&v10, sel_setDelegate_, internalDelegate);
    if (!m_ptr)
      return;
    goto LABEL_7;
  }
  if (internalDelegate)
  {
    v6 = -[WKScrollViewDelegateForwarder initWithInternalDelegate:externalDelegate:]([WKScrollViewDelegateForwarder alloc], "initWithInternalDelegate:externalDelegate:", self->_internalDelegate, WeakRetained);
    v7 = self->_delegateForwarder.m_ptr;
    self->_delegateForwarder.m_ptr = v6;
    if (v7)
    {
      CFRelease(v7);
      v6 = (WKScrollViewDelegateForwarder *)self->_delegateForwarder.m_ptr;
    }
    v8.receiver = self;
    v8.super_class = (Class)WKScrollView;
    -[BEScrollView setDelegate:](&v8, sel_setDelegate_, v6);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WKScrollView;
    -[BEScrollView setDelegate:](&v9, sel_setDelegate_, WeakRetained);
  }
  CFRelease(WeakRetained);
  if (m_ptr)
LABEL_7:
    CFRelease(m_ptr);
}

- (void)setInternalDelegate:(id)a3
{
  if (self->_internalDelegate != a3)
  {
    self->_internalDelegate = (BEScrollViewDelegate *)a3;
    -[WKScrollView _updateDelegate](self, "_updateDelegate");
  }
}

- (WKScrollView)initWithFrame:(CGRect)a3
{
  WKScrollView *v3;
  WKScrollView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKScrollView;
  v3 = -[WKBaseScrollView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_scrollEnabledByClient = 1;
    v3->_scrollEnabledInternal = 1;
    v3->_zoomEnabledByClient = 1;
    v3->_zoomEnabledInternal = 1;
    v3->_bouncesSetByClient = 1;
    v3->_bouncesHorizontalInternal = 1;
    v3->_bouncesVerticalInternal = 1;
    -[WKScrollView setAlwaysBounceVertical:](v3, "setAlwaysBounceVertical:", 1);
    -[WKScrollView setDirectionalLockEnabled:](v4, "setDirectionalLockEnabled:", 1);
    -[WKScrollView setAutomaticallyAdjustsScrollIndicatorInsets:](v4, "setAutomaticallyAdjustsScrollIndicatorInsets:", 1);
    -[WKScrollView setAllowsKeyboardScrolling:](v4, "setAllowsKeyboardScrolling:", 1);
    v4->_contentInsetAdjustmentBehaviorWasExternallyOverridden = -[WKScrollView contentInsetAdjustmentBehavior](v4, "contentInsetAdjustmentBehavior") != 0;
  }
  return v4;
}

- (void)_setContentInsetAdjustmentBehaviorInternal:(int64_t)a3
{
  objc_super v5;

  if (-[WKScrollView contentInsetAdjustmentBehavior](self, "contentInsetAdjustmentBehavior") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)WKScrollView;
    -[WKScrollView setContentInsetAdjustmentBehavior:](&v5, sel_setContentInsetAdjustmentBehavior_, a3);
  }
}

- (BOOL)_contentInsetAdjustmentBehaviorWasExternallyOverridden
{
  return self->_contentInsetAdjustmentBehaviorWasExternallyOverridden;
}

- (UIEdgeInsets)_systemContentInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  UIEdgeInsets result;

  v15.receiver = self;
  v15.super_class = (Class)WKScrollView;
  -[WKScrollView _systemContentInset](&v15, sel__systemContentInset);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if ((-[BEScrollViewDelegate _haveSetObscuredInsets](self->_internalDelegate, "_haveSetObscuredInsets") & 1) == 0
    && WTF::linkedOnOrAfterSDKWithBehavior()
    && -[WKScrollView contentInsetAdjustmentBehavior](self, "contentInsetAdjustmentBehavior") == 2)
  {
    v8 = v8 + self->_keyboardBottomInsetAdjustment;
  }
  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 277) = 0;
  *((_QWORD *)self + 278) = 0;
  *((_BYTE *)self + 2256) = 0;
  *((_BYTE *)self + 2288) = 0;
  *((_BYTE *)self + 2296) = 0;
  *((_BYTE *)self + 2328) = 0;
  return self;
}

- (void)_setIndicatorStyleInternal:(int64_t)a3
{
  objc_super v3;

  if (!self->_indicatorStyleSetByClient)
  {
    v3.receiver = self;
    v3.super_class = (Class)WKScrollView;
    -[WKScrollView setIndicatorStyle:](&v3, sel_setIndicatorStyle_, a3);
  }
}

- (void)_setBackgroundColorInternal:(id)a3
{
  objc_super v4;

  if (!self->_backgroundColorSetByClient)
  {
    v4.receiver = self;
    v4.super_class = (Class)WKScrollView;
    -[WKScrollView setBackgroundColor:](&v4, sel_setBackgroundColor_, a3);
    -[BEScrollViewDelegate _resetCachedScrollViewBackgroundColor](self->_internalDelegate, "_resetCachedScrollViewBackgroundColor");
  }
}

- (void)setScrollEnabled:(BOOL)a3
{
  self->_scrollEnabledByClient = a3;
  -[WKScrollView _updateScrollability](self, "_updateScrollability");
}

- (void)setDecelerationRate:(double)a3
{
  objc_super v3;

  self->_decelerationRateSetByClient = 1;
  v3.receiver = self;
  v3.super_class = (Class)WKScrollView;
  -[WKScrollView setDecelerationRate:](&v3, sel_setDecelerationRate_, a3);
}

- (void)setDelegate:(id)a3
{
  WeakObjCPtr<id<UIScrollViewDelegate>> *p_externalDelegate;
  id WeakRetained;
  id v7;

  p_externalDelegate = &self->_externalDelegate;
  WeakRetained = objc_loadWeakRetained(&self->_externalDelegate.m_weakReference);
  v7 = WeakRetained;
  if (WeakRetained)
    CFRelease(WeakRetained);
  if (v7 != a3)
  {
    objc_storeWeak(&p_externalDelegate->m_weakReference, a3);
    -[WKScrollView _updateDelegate](self, "_updateDelegate");
  }
}

- (void)setBackgroundColor:(id)a3
{
  objc_super v4;

  self->_backgroundColorSetByClient = a3 != 0;
  v4.receiver = self;
  v4.super_class = (Class)WKScrollView;
  -[WKScrollView setBackgroundColor:](&v4, sel_setBackgroundColor_);
  if (!self->_backgroundColorSetByClient)
  {
    -[BEScrollViewDelegate _resetCachedScrollViewBackgroundColor](self->_internalDelegate, "_resetCachedScrollViewBackgroundColor");
    -[BEScrollViewDelegate _updateScrollViewBackground](self->_internalDelegate, "_updateScrollViewBackground");
  }
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_delegateForwarder.m_ptr;
  self->_delegateForwarder.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  objc_destroyWeak(&self->_externalDelegate.m_weakReference);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(a4, "shouldDeferGestureRecognizer:", a3);
  else
    return 0;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(a3, "shouldDeferGestureRecognizer:", a4);
  else
    return 0;
}

- (void)setIndicatorStyle:(int64_t)a3
{
  objc_super v4;

  self->_indicatorStyleSetByClient = a3 != 0;
  v4.receiver = self;
  v4.super_class = (Class)WKScrollView;
  -[WKScrollView setIndicatorStyle:](&v4, sel_setIndicatorStyle_);
  if (!self->_indicatorStyleSetByClient)
    -[BEScrollViewDelegate _updateScrollViewIndicatorStyle](self->_internalDelegate, "_updateScrollViewIndicatorStyle");
}

- (void)_setDecelerationRateInternal:(double)a3
{
  objc_super v3;

  if (!self->_decelerationRateSetByClient)
  {
    v3.receiver = self;
    v3.super_class = (Class)WKScrollView;
    -[WKScrollView setDecelerationRate:](&v3, sel_setDecelerationRate_, a3);
  }
}

- (BOOL)_contentInsetWasExternallyOverridden
{
  return self->_contentInsetWasExternallyOverridden;
}

- (void)_resetContentInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v3 = *MEMORY[0x1E0CEB4B0];
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  v7.receiver = self;
  v7.super_class = (Class)WKScrollView;
  -[WKScrollView setContentInset:](&v7, sel_setContentInset_, v3, v4, v5, v6);
  -[BEScrollViewDelegate _scheduleVisibleContentRectUpdate](self->_internalDelegate, "_scheduleVisibleContentRectUpdate");
}

- (void)_resetContentInsetAdjustmentBehavior
{
  self->_contentInsetAdjustmentBehaviorWasExternallyOverridden = 0;
  -[WKScrollView _setContentInsetAdjustmentBehaviorInternal:](self, "_setContentInsetAdjustmentBehaviorInternal:", 0);
}

- (CGSize)_currentTopLeftRubberbandAmount
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  -[WKScrollView contentInset](self, "contentInset");
  v4 = v3;
  v6 = v5;
  v7 = *MEMORY[0x1E0C9D820];
  v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[WKScrollView contentOffset](self, "contentOffset");
  v11 = v9 - v6;
  if (v9 - v6 > 0.0)
    v11 = 0.0;
  if (v9 >= -v6)
    v12 = v7;
  else
    v12 = v11;
  v13 = v4 + v10;
  if (v4 + v10 > 0.0)
    v13 = 0.0;
  if (v10 >= -v4)
    v14 = v8;
  else
    v14 = v13;
  result.height = v14;
  result.width = v12;
  return result;
}

- (void)_restoreContentOffsetWithRubberbandAmount:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  height = a3.height;
  width = a3.width;
  -[WKScrollView contentInset](self, "contentInset");
  v7 = v6;
  v9 = v8;
  -[WKScrollView contentOffset](self, "contentOffset");
  if (width < 0.0)
    v10 = width - v9;
  if (height < 0.0)
    v11 = height - v7;
  -[WKScrollView setContentOffset:](self, "setContentOffset:", v10, v11);
}

- (void)_adjustForAutomaticKeyboardInfo:(id)a3 animated:(BOOL)a4 lastAdjustment:(double *)a5
{
  _BOOL8 v6;
  double v9;
  objc_super v10;

  v6 = a4;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA828], "sharedInstance"), "getVerticalOverlapForView:usingKeyboardInfo:", self, a3);
  self->_keyboardBottomInsetAdjustment = v9;
  v10.receiver = self;
  v10.super_class = (Class)WKScrollView;
  -[WKScrollView _adjustForAutomaticKeyboardInfo:animated:lastAdjustment:](&v10, sel__adjustForAutomaticKeyboardInfo_animated_lastAdjustment_, a3, v6, a5);
}

- (void)setBounces:(BOOL)a3
{
  self->_bouncesSetByClient = a3;
  -[WKScrollView _updateBouncability](self, "_updateBouncability");
}

- (void)setZoomEnabled:(BOOL)a3
{
  self->_zoomEnabledByClient = a3;
  -[WKScrollView _updateZoomability](self, "_updateZoomability");
}

- (void)_setContentScrollInset:(UIEdgeInsets)a3
{
  _BOOL4 engaged;

  engaged = self->_contentScrollInsetFromClient.__engaged_;
  self->_contentScrollInsetFromClient.var0.__val_ = a3;
  if (!engaged)
    self->_contentScrollInsetFromClient.__engaged_ = 1;
  -[WKScrollView _updateContentScrollInset](self, "_updateContentScrollInset");
}

- (BOOL)_setContentScrollInsetInternal:(UIEdgeInsets)a3
{
  optional<UIEdgeInsets> *p_contentScrollInsetInternal;

  if (self->_contentScrollInsetFromClient.__engaged_)
    return 0;
  p_contentScrollInsetInternal = &self->_contentScrollInsetInternal;
  if (self->_contentScrollInsetInternal.__engaged_)
  {
    if (self->_contentScrollInsetInternal.var0.__val_.left == a3.left
      && p_contentScrollInsetInternal->var0.__val_.top == a3.top
      && self->_contentScrollInsetInternal.var0.__val_.right == a3.right
      && self->_contentScrollInsetInternal.var0.__val_.bottom == a3.bottom)
    {
      return 0;
    }
    p_contentScrollInsetInternal->var0.__val_.top = a3.top;
    self->_contentScrollInsetInternal.var0.__val_.left = a3.left;
    self->_contentScrollInsetInternal.var0.__val_.bottom = a3.bottom;
    self->_contentScrollInsetInternal.var0.__val_.right = a3.right;
  }
  else
  {
    p_contentScrollInsetInternal->var0.__val_.top = a3.top;
    self->_contentScrollInsetInternal.var0.__val_.left = a3.left;
    self->_contentScrollInsetInternal.var0.__val_.bottom = a3.bottom;
    self->_contentScrollInsetInternal.var0.__val_.right = a3.right;
    self->_contentScrollInsetInternal.__engaged_ = 1;
  }
  -[WKScrollView _updateContentScrollInset](self, "_updateContentScrollInset");
  return 1;
}

- (void)_updateContentScrollInset
{
  double bottom;
  double right;
  double top;
  double left;
  objc_super *v6;
  WKScrollView *v7;
  objc_super v8;

  if (self->_contentScrollInsetFromClient.__engaged_)
  {
    bottom = self->_contentScrollInsetFromClient.var0.__val_.bottom;
    right = self->_contentScrollInsetFromClient.var0.__val_.right;
    top = self->_contentScrollInsetFromClient.var0.__val_.top;
    left = self->_contentScrollInsetFromClient.var0.__val_.left;
    v6 = &v8;
    v8.receiver = self;
  }
  else
  {
    if (!self->_contentScrollInsetInternal.__engaged_)
      return;
    bottom = self->_contentScrollInsetInternal.var0.__val_.bottom;
    right = self->_contentScrollInsetInternal.var0.__val_.right;
    top = self->_contentScrollInsetInternal.var0.__val_.top;
    left = self->_contentScrollInsetInternal.var0.__val_.left;
    v6 = (objc_super *)&v7;
    v7 = self;
  }
  v6->super_class = (Class)WKScrollView;
  -[objc_super _setContentScrollInset:](v6, sel__setContentScrollInset_, top, left, bottom, right, v7);
}

- (BEScrollViewDelegate)internalDelegate
{
  return self->_internalDelegate;
}

@end
