@implementation IMDisplayLink

- (IMDisplayLink)initWithTarget:(id)a3 selector:(SEL)a4
{
  id v6;
  IMDisplayLink *v7;
  IMDisplayLink *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IMDisplayLink;
  v7 = -[IMDisplayLink init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_target, v6);
    v8->_selector = a4;
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_invalidate(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)IMDisplayLink;
  -[IMDisplayLink dealloc](&v4, sel_dealloc);
}

- (BOOL)isValid
{
  return 0;
}

- (void)_displayLinkCallback
{
  id *p_target;
  id WeakRetained;
  const char *v5;
  uint64_t v6;
  SEL selector;
  const char *v8;
  id v9;

  p_target = &self->_target;
  WeakRetained = objc_loadWeakRetained(&self->_target);
  if (WeakRetained && (selector = self->_selector, WeakRetained, selector))
  {
    v9 = objc_loadWeakRetained(p_target);
    objc_msgSend_performSelector_withObject_(v9, v8, (uint64_t)self->_selector, self);

  }
  else
  {
    objc_msgSend_invalidate(self, v5, v6);
  }
}

+ (Class)_displayLinkClass
{
  return (Class)objc_opt_class();
}

+ (id)displayLinkWithTarget:(id)a3 selector:(SEL)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  void *v11;

  v6 = a3;
  v9 = objc_alloc((Class)objc_msgSend__displayLinkClass(a1, v7, v8));
  v11 = (void *)objc_msgSend_initWithTarget_selector_(v9, v10, (uint64_t)v6, a4);

  return v11;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (SEL)selector
{
  return self->_selector;
}

- (int64_t)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond;
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  self->_preferredFramesPerSecond = a3;
}

- (NSRunLoop)runLoop
{
  return (NSRunLoop *)objc_loadWeakRetained((id *)&self->_runLoop);
}

- (void)setRunLoop:(id)a3
{
  objc_storeWeak((id *)&self->_runLoop, a3);
}

- (NSString)runLoopMode
{
  return self->_runLoopMode;
}

- (void)setRunLoopMode:(id)a3
{
  objc_storeStrong((id *)&self->_runLoopMode, a3);
}

- (UIScreen)screen
{
  return (UIScreen *)objc_loadWeakRetained((id *)&self->_screen);
}

- (void)setScreen:(id)a3
{
  objc_storeWeak((id *)&self->_screen, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_screen);
  objc_storeStrong((id *)&self->_runLoopMode, 0);
  objc_destroyWeak((id *)&self->_runLoop);
  objc_destroyWeak(&self->_target);
}

@end
