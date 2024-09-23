@implementation WKDeferringGestureRecognizer

- (id).cxx_construct
{
  *((_QWORD *)self + 34) = 0;
  return self;
}

- (WKDeferringGestureRecognizer)initWithDeferringGestureDelegate:(id)a3
{
  WKDeferringGestureRecognizer *v4;
  WKDeferringGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKDeferringGestureRecognizer;
  v4 = -[WKDeferringGestureRecognizer init](&v7, sel_init);
  v5 = v4;
  if (v4)
    objc_storeWeak(&v4->_deferringGestureDelegate.m_weakReference, a3);
  return v5;
}

- (void)setImmediatelyFailsAfterTouchEnd:(BOOL)a3
{
  self->_immediatelyFailsAfterTouchEnd = a3;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  char v7;
  objc_super v8;

  v7 = objc_msgSend(objc_loadWeak(&self->_deferringGestureDelegate.m_weakReference), "deferringGestureRecognizer:willBeginTouchesWithEvent:", self, a4);
  v8.receiver = self;
  v8.super_class = (Class)WKDeferringGestureRecognizer;
  -[WKDeferringGestureRecognizer touchesBegan:withEvent:](&v8, sel_touchesBegan_withEvent_, a3, a4);
  if ((v7 & 1) == 0)
    -[WKDeferringGestureRecognizer setState:](self, "setState:", 5);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKDeferringGestureRecognizer;
  -[WKDeferringGestureRecognizer touchesEnded:withEvent:](&v6, sel_touchesEnded_withEvent_, a3);
  if (-[WKDeferringGestureRecognizer immediatelyFailsAfterTouchEnd](self, "immediatelyFailsAfterTouchEnd"))
    -[WKDeferringGestureRecognizer setState:](self, "setState:", 5);
  objc_msgSend(objc_loadWeak(&self->_deferringGestureDelegate.m_weakReference), "deferringGestureRecognizer:didEndTouchesWithEvent:", self, a4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WKDeferringGestureRecognizer;
  -[WKDeferringGestureRecognizer touchesCancelled:withEvent:](&v5, sel_touchesCancelled_withEvent_, a3, a4);
  -[WKDeferringGestureRecognizer setState:](self, "setState:", 5);
}

- (void)endDeferral:(BOOL)a3
{
  uint64_t v3;

  if (a3)
    v3 = 3;
  else
    v3 = 5;
  -[WKDeferringGestureRecognizer setState:](self, "setState:", v3);
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)shouldDeferGestureRecognizer:(id)a3
{
  return objc_msgSend(objc_loadWeak(&self->_deferringGestureDelegate.m_weakReference), "deferringGestureRecognizer:shouldDeferOtherGestureRecognizer:", self, a3);
}

- (void)setState:(int64_t)a3
{
  uint64_t v5;
  objc_super v6;

  v5 = -[WKDeferringGestureRecognizer state](self, "state");
  v6.receiver = self;
  v6.super_class = (Class)WKDeferringGestureRecognizer;
  -[WKDeferringGestureRecognizer setState:](&v6, sel_setState_, a3);
  if (v5 != -[WKDeferringGestureRecognizer state](self, "state"))
    objc_msgSend(objc_loadWeak(&self->_deferringGestureDelegate.m_weakReference), "deferringGestureRecognizer:didTransitionToState:", self, a3);
}

- (BOOL)immediatelyFailsAfterTouchEnd
{
  return self->_immediatelyFailsAfterTouchEnd;
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_deferringGestureDelegate.m_weakReference);
}

@end
