@implementation WKInspectorNodeSearchGestureRecognizer

- (CGPoint)locationInView:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  objc_msgSend(self->_touch.m_ptr, "locationInView:", a3);
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)_processTouches:(id)a3 state:(int64_t)a4
{
  if (objc_msgSend(a3, "containsObject:", self->_touch.m_ptr))
    -[WKInspectorNodeSearchGestureRecognizer setState:](self, "setState:", a4);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v6;
  void *v7;
  void *m_ptr;

  if (!-[WKInspectorNodeSearchGestureRecognizer state](self, "state", a3, a4))
  {
    v6 = (void *)objc_msgSend(a3, "anyObject");
    v7 = v6;
    if (v6)
      CFRetain(v6);
    m_ptr = self->_touch.m_ptr;
    self->_touch.m_ptr = v7;
    if (m_ptr)
      CFRelease(m_ptr);
    -[WKInspectorNodeSearchGestureRecognizer _processTouches:state:](self, "_processTouches:state:", a3, 1);
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  -[WKInspectorNodeSearchGestureRecognizer _processTouches:state:](self, "_processTouches:state:", a3, 2);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[WKInspectorNodeSearchGestureRecognizer _processTouches:state:](self, "_processTouches:state:", a3, 3);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[WKInspectorNodeSearchGestureRecognizer _processTouches:state:](self, "_processTouches:state:", a3, 4);
}

- (void)reset
{
  void *m_ptr;

  m_ptr = self->_touch.m_ptr;
  self->_touch.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_touch.m_ptr;
  self->_touch.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 34) = 0;
  return self;
}

@end
