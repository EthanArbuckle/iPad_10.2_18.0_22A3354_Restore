@implementation WKFullScreenInteractiveTransition

- (WKFullScreenInteractiveTransition)initWithAnimator:(id)a3 anchor:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  WKFullScreenInteractiveTransition *v7;
  void *m_ptr;
  objc_super v10;

  y = a4.y;
  x = a4.x;
  v10.receiver = self;
  v10.super_class = (Class)WKFullScreenInteractiveTransition;
  v7 = -[WKFullScreenInteractiveTransition init](&v10, sel_init);
  if (v7)
  {
    if (a3)
      CFRetain(a3);
    m_ptr = v7->_animator.m_ptr;
    v7->_animator.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
    v7->_anchor.x = x;
    v7->_anchor.y = y;
  }
  return v7;
}

- (WKFullscreenAnimationController)animator
{
  return (WKFullscreenAnimationController *)self->_animator.m_ptr;
}

- (BOOL)wantsInteractiveStart
{
  return 1;
}

- (void)startInteractiveTransition:(id)a3
{
  void *m_ptr;

  if (a3)
    CFRetain(a3);
  m_ptr = self->_context.m_ptr;
  self->_context.m_ptr = a3;
  if (m_ptr)
    CFRelease(m_ptr);
  objc_msgSend(self->_animator.m_ptr, "startInteractiveTransition:", a3);
}

- (void)updateInteractiveTransition:(double)a3 withTranslation:(CGSize)a4
{
  objc_msgSend(self->_animator.m_ptr, "updateWithProgress:translation:anchor:", a3, a4.width, a4.height, self->_anchor.x, self->_anchor.y);
  objc_msgSend(self->_context.m_ptr, "updateInteractiveTransition:", a3);
}

- (void)updateInteractiveTransition:(double)a3 withScale:(double)a4 andTranslation:(CGSize)a5
{
  objc_msgSend(self->_animator.m_ptr, "updateWithProgress:scale:translation:anchor:", a3, a4, a5.width, a5.height, self->_anchor.x, self->_anchor.y);
  objc_msgSend(self->_context.m_ptr, "updateInteractiveTransition:", a3);
}

- (void)cancelInteractiveTransition
{
  objc_msgSend(self->_animator.m_ptr, "end:", 1);
}

- (void)finishInteractiveTransition
{
  objc_msgSend(self->_animator.m_ptr, "end:", 0);
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;

  m_ptr = self->_context.m_ptr;
  self->_context.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_animator.m_ptr;
  self->_animator.m_ptr = 0;
  if (v4)
    CFRelease(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
