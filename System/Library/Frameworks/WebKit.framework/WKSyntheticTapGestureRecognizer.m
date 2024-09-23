@implementation WKSyntheticTapGestureRecognizer

- (id).cxx_construct
{
  *((_QWORD *)self + 45) = 0;
  return self;
}

- (void)setGestureFailedTarget:(id)a3 action:(SEL)a4
{
  objc_storeWeak(&self->_gestureFailedTarget, a3);
  self->_gestureFailedAction = a4;
}

- (void)setSupportingTouchEventsGestureRecognizer:(id)a3
{
  objc_storeWeak((id *)&self->_supportingTouchEventsGestureRecognizer, a3);
}

- (void)setResetTarget:(id)a3 action:(SEL)a4
{
  objc_storeWeak(&self->_resetTarget, a3);
  self->_resetAction = a4;
}

- (void)setGestureIdentifiedTarget:(id)a3 action:(SEL)a4
{
  objc_storeWeak(&self->_gestureIdentifiedTarget, a3);
  self->_gestureIdentifiedAction = a4;
}

- (void).cxx_destruct
{
  void *m_ptr;

  objc_destroyWeak((id *)&self->_supportingTouchEventsGestureRecognizer);
  objc_destroyWeak((id *)&self->_lastTouchedScrollView);
  m_ptr = self->_lastActiveTouchIdentifier.m_ptr;
  self->_lastActiveTouchIdentifier.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  objc_destroyWeak(&self->_resetTarget);
  objc_destroyWeak(&self->_gestureFailedTarget);
  objc_destroyWeak(&self->_gestureIdentifiedTarget);
}

- (void)setState:(int64_t)a3
{
  int *v5;
  objc_super v6;

  if (a3 == 3)
  {
    v5 = &OBJC_IVAR___WKSyntheticTapGestureRecognizer__gestureIdentifiedTarget;
    goto LABEL_5;
  }
  if (a3 == 5)
  {
    v5 = &OBJC_IVAR___WKSyntheticTapGestureRecognizer__gestureFailedTarget;
LABEL_5:
    objc_msgSend(objc_loadWeak((id *)((char *)&self->super.super.super.isa + *v5)), "performSelector:withObject:", *(Class *)((char *)&self->super.super.super.isa + v5[1]), self);
  }
  v6.receiver = self;
  v6.super_class = (Class)WKSyntheticTapGestureRecognizer;
  -[WKSyntheticTapGestureRecognizer setState:](&v6, sel_setState_, a3);
}

- (void)reset
{
  void *m_ptr;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WKSyntheticTapGestureRecognizer;
  -[WKSyntheticTapGestureRecognizer reset](&v4, sel_reset);
  objc_msgSend(objc_loadWeak(&self->_resetTarget), "performSelector:withObject:", self->_resetAction, self);
  m_ptr = self->_lastActiveTouchIdentifier.m_ptr;
  self->_lastActiveTouchIdentifier.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  objc_storeWeak((id *)&self->_lastTouchedScrollView, 0);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKSyntheticTapGestureRecognizer;
  -[WKSyntheticTapGestureRecognizer touchesBegan:withEvent:](&v7, sel_touchesBegan_withEvent_, a3, a4);
  v6 = (void *)WebKit::scrollViewForTouches(a3);
  if (v6)
    objc_storeWeak((id *)&self->_lastTouchedScrollView, v6);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *m_ptr;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)WKSyntheticTapGestureRecognizer;
  -[WKSyntheticTapGestureRecognizer touchesEnded:withEvent:](&v15, sel_touchesEnded_withEvent_, a3, a4);
  if (objc_loadWeak((id *)&self->_supportingTouchEventsGestureRecognizer))
  {
    v5 = (void *)objc_msgSend(objc_loadWeak((id *)&self->_supportingTouchEventsGestureRecognizer), "activeTouchesByIdentifier");
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "objectForKey:", v9), "gestureRecognizers"), "containsObject:", self))
          {
            if (v9)
              CFRetain(v9);
            m_ptr = self->_lastActiveTouchIdentifier.m_ptr;
            self->_lastActiveTouchIdentifier.m_ptr = v9;
            if (m_ptr)
              CFRelease(m_ptr);
            return;
          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
        if (v6)
          continue;
        break;
      }
    }
  }
}

- (UIScrollView)lastTouchedScrollView
{
  return (UIScrollView *)objc_loadWeak((id *)&self->_lastTouchedScrollView);
}

- (NSNumber)lastActiveTouchIdentifier
{
  return (NSNumber *)self->_lastActiveTouchIdentifier.m_ptr;
}

- (WKTouchEventsGestureRecognizer)supportingTouchEventsGestureRecognizer
{
  return (WKTouchEventsGestureRecognizer *)objc_loadWeak((id *)&self->_supportingTouchEventsGestureRecognizer);
}

@end
