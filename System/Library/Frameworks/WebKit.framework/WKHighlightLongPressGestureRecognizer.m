@implementation WKHighlightLongPressGestureRecognizer

- (id).cxx_construct
{
  *((_QWORD *)self + 62) = 0;
  return self;
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WKHighlightLongPressGestureRecognizer;
  -[WKHighlightLongPressGestureRecognizer reset](&v3, sel_reset);
  objc_storeWeak(&self->_lastTouchedScrollView.m_weakReference, 0);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKHighlightLongPressGestureRecognizer;
  -[WKHighlightLongPressGestureRecognizer touchesBegan:withEvent:](&v7, sel_touchesBegan_withEvent_, a3, a4);
  v6 = (void *)WebKit::scrollViewForTouches(a3);
  if (v6)
    objc_storeWeak(&self->_lastTouchedScrollView.m_weakReference, v6);
}

- (UIScrollView)lastTouchedScrollView
{
  UIScrollView *WeakRetained;
  UIScrollView *v3;

  WeakRetained = (UIScrollView *)objc_loadWeakRetained(&self->_lastTouchedScrollView.m_weakReference);
  v3 = WeakRetained;
  if (WeakRetained)
    CFRelease(WeakRetained);
  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_lastTouchedScrollView.m_weakReference);
}

@end
