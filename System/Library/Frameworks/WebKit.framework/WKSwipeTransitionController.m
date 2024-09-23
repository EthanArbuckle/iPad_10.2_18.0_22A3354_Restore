@implementation WKSwipeTransitionController

- (id)gestureRecognizerForInteractiveTransition:(id)a3 WithTarget:(id)a4 action:(SEL)a5
{
  void *v7;
  void *v8;
  id WeakRetained;
  uint64_t v10;
  int v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAE38]), "initWithTarget:action:", a4, a5);
  v8 = (void *)MEMORY[0x1E0CEABB0];
  WeakRetained = objc_loadWeakRetained(&self->_gestureRecognizerView.m_weakReference);
  v10 = objc_msgSend(v8, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(WeakRetained, "semanticContentAttribute"));
  if (WeakRetained)
    CFRelease(WeakRetained);
  v11 = -[WKSwipeTransitionController directionForTransition:](self, "directionForTransition:", a3);
  if (v11)
  {
    if (v11 != 1)
      return (id)(id)CFMakeCollectable(v7);
    v12 = v10 == 0;
    v13 = 2;
    v14 = 8;
  }
  else
  {
    v12 = v10 == 0;
    v13 = 8;
    v14 = 2;
  }
  if (v12)
    v15 = v14;
  else
    v15 = v13;
  objc_msgSend(v7, "setEdges:", v15);
  return (id)(id)CFMakeCollectable(v7);
}

- (int)directionForTransition:(id)a3
{
  return self->_backTransitionController.m_ptr != a3;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

- (WKSwipeTransitionController)initWithViewGestureController:(void *)a3 gestureRecognizerView:(id)a4
{
  WKSwipeTransitionController *v6;
  WKSwipeTransitionController *v7;
  id v8;
  void *m_ptr;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)WKSwipeTransitionController;
  v6 = -[WKSwipeTransitionController init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_gestureController = a3;
    objc_storeWeak(&v6->_gestureRecognizerView.m_weakReference, a4);
    v8 = objc_alloc(MEMORY[0x1E0CEAE18]);
    m_ptr = v7->_backTransitionController.m_ptr;
    v7->_backTransitionController.m_ptr = v8;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      v8 = v7->_backTransitionController.m_ptr;
    }
    v10 = (void *)objc_msgSend(v8, "initWithGestureRecognizerView:animator:delegate:", a4, 0, v7);
    v11 = v10;
    if (v10)
      CFRetain(v10);
    v12 = v7->_backTransitionController.m_ptr;
    v7->_backTransitionController.m_ptr = v11;
    if (v12)
      CFRelease(v12);
    v13 = objc_alloc(MEMORY[0x1E0CEAE18]);
    v14 = v7->_forwardTransitionController.m_ptr;
    v7->_forwardTransitionController.m_ptr = v13;
    if (v14)
    {
      CFRelease(v14);
      v13 = v7->_forwardTransitionController.m_ptr;
    }
    v15 = (void *)objc_msgSend(v13, "initWithGestureRecognizerView:animator:delegate:", a4, 0, v7);
    v16 = v15;
    if (v15)
      CFRetain(v15);
    v17 = v7->_forwardTransitionController.m_ptr;
    v7->_forwardTransitionController.m_ptr = v16;
    if (v17)
    {
      CFRelease(v17);
      v16 = v7->_forwardTransitionController.m_ptr;
    }
    objc_msgSend(v16, "setShouldReverseTranslation:", 1);
  }
  return v7;
}

- (void)invalidate
{
  self->_gestureController = 0;
}

- (id)transitionForDirection:(int)a3
{
  uint64_t v3;

  v3 = 24;
  if (!a3)
    v3 = 16;
  return *(Class *)((char *)&self->super.isa + v3);
}

- (void)startInteractiveTransition:(id)a3
{
  WebKit::ViewGestureController::beginSwipeGesture((uint64_t)self->_gestureController, a3, -[WKSwipeTransitionController directionForTransition:](self, "directionForTransition:"));
}

- (BOOL)shouldBeginInteractiveTransition:(id)a3
{
  return WebKit::ViewGestureController::canSwipeInDirection((uint64_t)self->_gestureController, -[WKSwipeTransitionController directionForTransition:](self, "directionForTransition:", a3));
}

- (BOOL)interactiveTransition:(id)a3 gestureRecognizer:(id)a4 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a5
{
  objc_opt_class();
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)interactiveTransition:(id)a3 gestureRecognizer:(id)a4 shouldReceiveTouch:(id)a5
{
  return 1;
}

- (BOOL)isNavigationSwipeGestureRecognizer:(id)a3
{
  return (id)objc_msgSend(self->_backTransitionController.m_ptr, "gestureRecognizer") == a3
      || objc_msgSend(self->_forwardTransitionController.m_ptr, "gestureRecognizer") == (_QWORD)a3;
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;

  objc_destroyWeak(&self->_gestureRecognizerView.m_weakReference);
  m_ptr = self->_forwardTransitionController.m_ptr;
  self->_forwardTransitionController.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_backTransitionController.m_ptr;
  self->_backTransitionController.m_ptr = 0;
  if (v4)
    CFRelease(v4);
}

@end
