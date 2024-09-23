@implementation WKBaseScrollView

- (id).cxx_construct
{
  *((_QWORD *)self + 260) = 0;
  return self;
}

- (void)_wk_addGestureRecognizer:(id)a3
{
  void *m_ptr;
  void *v6;
  void *v7;
  objc_super v8;

  if ((id)-[WKBaseScrollView panGestureRecognizer](self, "panGestureRecognizer") == a3)
  {
    m_ptr = self->_axisLockingPanGestureRecognizer.m_ptr;
    if (!m_ptr)
    {
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", self, sel__updatePanGestureToPreventScrolling);
      v7 = self->_axisLockingPanGestureRecognizer.m_ptr;
      self->_axisLockingPanGestureRecognizer.m_ptr = v6;
      if (v7)
      {
        CFRelease(v7);
        v6 = self->_axisLockingPanGestureRecognizer.m_ptr;
      }
      objc_msgSend(v6, "setName:", CFSTR("Scroll axis locking"));
      objc_msgSend(self->_axisLockingPanGestureRecognizer.m_ptr, "setDelegate:", self);
      m_ptr = self->_axisLockingPanGestureRecognizer.m_ptr;
    }
    -[WKBaseScrollView addGestureRecognizer:](self, "addGestureRecognizer:", m_ptr);
  }
  v8.receiver = self;
  v8.super_class = (Class)WKBaseScrollView;
  -[WKBaseScrollView addGestureRecognizer:](&v8, sel_addGestureRecognizer_, a3);
}

- (void)setBaseScrollViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_baseScrollViewDelegate, a3);
}

- (WKBaseScrollView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  WKBaseScrollView *v8;
  WKBaseScrollView *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  +[WKBaseScrollView _overrideAddGestureRecognizerIfNeeded](WKBaseScrollView, "_overrideAddGestureRecognizerIfNeeded");
  v11.receiver = self;
  v11.super_class = (Class)WKBaseScrollView;
  v8 = -[WKBaseScrollView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    v8->_axesToPreventMomentumScrolling = 0;
    objc_msgSend((id)-[WKBaseScrollView panGestureRecognizer](v8, "panGestureRecognizer"), "addTarget:action:", v8, sel__updatePanGestureToPreventScrolling);
  }
  return v9;
}

+ (void)_overrideAddGestureRecognizerIfNeeded
{
  char v2;
  objc_class *v3;
  objc_method *InstanceMethod;
  objc_class *v5;
  void (*Implementation)(void);
  const char *TypeEncoding;

  v2 = +[WKBaseScrollView _overrideAddGestureRecognizerIfNeeded]::hasOverridenAddGestureRecognizer;
  +[WKBaseScrollView _overrideAddGestureRecognizerIfNeeded]::hasOverridenAddGestureRecognizer = 1;
  if ((v2 & 1) == 0
    && (!WebCore::IOSApplication::isHimalaya((WebCore::IOSApplication *)a1)
     || WTF::linkedOnOrAfterSDKWithBehavior()))
  {
    v3 = (objc_class *)objc_opt_class();
    InstanceMethod = class_getInstanceMethod(v3, sel__wk_addGestureRecognizer_);
    v5 = (objc_class *)objc_opt_class();
    Implementation = method_getImplementation(InstanceMethod);
    TypeEncoding = method_getTypeEncoding(InstanceMethod);
    class_addMethod(v5, sel_addGestureRecognizer_, Implementation, TypeEncoding);
  }
}

- (void).cxx_destruct
{
  void *m_ptr;

  objc_destroyWeak((id *)&self->_baseScrollViewDelegate);
  m_ptr = self->_axisLockingPanGestureRecognizer.m_ptr;
  self->_axisLockingPanGestureRecognizer.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (void)removeFromSuperview
{
  BOOL isBeingRemovedFromSuperview;
  objc_super v4;

  isBeingRemovedFromSuperview = self->_isBeingRemovedFromSuperview;
  self->_isBeingRemovedFromSuperview = 1;
  v4.receiver = self;
  v4.super_class = (Class)WKBaseScrollView;
  -[WKBaseScrollView removeFromSuperview](&v4, sel_removeFromSuperview);
  self->_isBeingRemovedFromSuperview = isBeingRemovedFromSuperview;
}

- (void)removeGestureRecognizer:(id)a3
{
  void *m_ptr;
  objc_super v6;

  if ((id)-[WKBaseScrollView panGestureRecognizer](self, "panGestureRecognizer") == a3)
  {
    m_ptr = self->_axisLockingPanGestureRecognizer.m_ptr;
    self->_axisLockingPanGestureRecognizer.m_ptr = 0;
    if (m_ptr)
    {
      -[WKBaseScrollView removeGestureRecognizer:](self, "removeGestureRecognizer:", m_ptr);
      CFRelease(m_ptr);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)WKBaseScrollView;
  -[WKBaseScrollView removeGestureRecognizer:](&v6, sel_removeGestureRecognizer_, a3);
}

- (void)_updatePanGestureToPreventScrolling
{
  void *v3;
  unint64_t v4;
  unint64_t v6;
  char v7;
  double v8;
  double v9;
  unint64_t axesToPreventMomentumScrolling;

  v3 = (void *)-[WKBaseScrollView panGestureRecognizer](self, "panGestureRecognizer");
  v4 = objc_msgSend((id)-[WKBaseScrollView panGestureRecognizer](self, "panGestureRecognizer"), "state");
  if ((v4 > 5 || ((1 << v4) & 0x39) == 0)
    && (objc_msgSend(self->_axisLockingPanGestureRecognizer.m_ptr, "state") & 0xFFFFFFFFFFFFFFFELL) != 4)
  {
    v6 = -[WKBaseScrollView _axesToPreventScrollingFromDelegate](self, "_axesToPreventScrollingFromDelegate");
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v3, "translationInView:", 0);
      if ((v7 & 1) != 0 && fabs(v8) > 2.22044605e-16)
      {
        axesToPreventMomentumScrolling = self->_axesToPreventMomentumScrolling | 1;
        self->_axesToPreventMomentumScrolling = axesToPreventMomentumScrolling;
        v8 = 0.0;
        if ((v7 & 2) == 0 || fabs(v9) <= 2.22044605e-16)
          goto LABEL_17;
        goto LABEL_16;
      }
      if ((v7 & 2) != 0 && fabs(v9) > 2.22044605e-16)
      {
        axesToPreventMomentumScrolling = self->_axesToPreventMomentumScrolling;
LABEL_16:
        self->_axesToPreventMomentumScrolling = axesToPreventMomentumScrolling | 2;
        v9 = 0.0;
LABEL_17:
        objc_msgSend(v3, "setTranslation:inView:", 0, v8, v9);
      }
    }
  }
}

- (unint64_t)_axesToPreventScrollingFromDelegate
{
  WKBaseScrollViewDelegate *v4;

  if (!self->_isBeingRemovedFromSuperview
    && -[WKBaseScrollView window](self, "window")
    && (v4 = -[WKBaseScrollView baseScrollViewDelegate](self, "baseScrollViewDelegate")) != 0)
  {
    return -[WKBaseScrollViewDelegate axesToPreventScrollingForPanGestureInScrollView:](v4, "axesToPreventScrollingForPanGestureInScrollView:", self);
  }
  else
  {
    return 0;
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id m_ptr;
  int v7;
  WKBaseScrollView *v8;
  objc_super v9;

  m_ptr = self->_axisLockingPanGestureRecognizer.m_ptr;
  if (m_ptr == a3 || m_ptr == a4)
    return 1;
  if ((byte_1ECE72C3D & 1) != 0)
  {
    if (byte_1ECE72C3C)
    {
LABEL_9:
      v9.receiver = self;
      v9.super_class = (Class)WKBaseScrollView;
      return -[WKBaseScrollView gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:](&v9, sel_gestureRecognizer_shouldRecognizeSimultaneouslyWithGestureRecognizer_);
    }
  }
  else
  {
    v8 = self;
    v7 = objc_msgSend(MEMORY[0x1E0CEA970], "instancesRespondToSelector:", sel_gestureRecognizer_shouldRecognizeSimultaneouslyWithGestureRecognizer_);
    self = v8;
    byte_1ECE72C3C = v7;
    byte_1ECE72C3D = 1;
    if (v7)
      goto LABEL_9;
  }
  return 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  int v6;
  objc_super v7;

  if ((id)-[WKBaseScrollView panGestureRecognizer](self, "panGestureRecognizer") == a3)
    self->_axesToPreventMomentumScrolling = 0;
  if ((byte_1ECE72C3F & 1) != 0)
  {
    if (byte_1ECE72C3E)
    {
LABEL_5:
      v7.receiver = self;
      v7.super_class = (Class)WKBaseScrollView;
      return -[WKBaseScrollView gestureRecognizerShouldBegin:](&v7, sel_gestureRecognizerShouldBegin_, a3);
    }
  }
  else
  {
    v6 = objc_msgSend(MEMORY[0x1E0CEA970], "instancesRespondToSelector:", sel_gestureRecognizerShouldBegin_);
    byte_1ECE72C3E = v6;
    byte_1ECE72C3F = 1;
    if (v6)
      goto LABEL_5;
  }
  return 1;
}

- (WKBaseScrollViewDelegate)baseScrollViewDelegate
{
  return (WKBaseScrollViewDelegate *)objc_loadWeak((id *)&self->_baseScrollViewDelegate);
}

- (unint64_t)axesToPreventMomentumScrolling
{
  return self->_axesToPreventMomentumScrolling;
}

@end
