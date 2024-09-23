@implementation IMDisplayLink_iOS

- (IMDisplayLink_iOS)initWithTarget:(id)a3 selector:(SEL)a4
{
  IMDisplayLink_iOS *v4;
  const char *v5;
  IMDisplayLink_iOS *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)IMDisplayLink_iOS;
  v4 = -[IMDisplayLink initWithTarget:selector:](&v17, sel_initWithTarget_selector_, a3, a4);
  v6 = v4;
  if (v4)
  {
    objc_msgSend_setPreferredFramesPerSecond_(v4, v5, 60);
    objc_msgSend_mainScreen(MEMORY[0x24BDF6D38], v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setScreen_(v6, v10, (uint64_t)v9);

    objc_msgSend_setRunLoopMode_(v6, v11, *MEMORY[0x24BDBCB80]);
    objc_msgSend_currentRunLoop(MEMORY[0x24BDBCF18], v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setRunLoop_(v6, v15, (uint64_t)v14);

  }
  return v6;
}

- (void)schedule
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  CADisplayLink *v8;
  CADisplayLink *displayLink;
  CADisplayLink *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  CADisplayLink *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id v22;

  objc_msgSend_invalidate(self, a2, v2);
  objc_msgSend_screen(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_displayLinkWithTarget_selector_(v6, v7, (uint64_t)self, sel__displayLinkCallback);
  v8 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
  displayLink = self->_displayLink;
  self->_displayLink = v8;

  v10 = self->_displayLink;
  v13 = objc_msgSend_preferredFramesPerSecond(self, v11, v12);
  objc_msgSend_setPreferredFramesPerSecond_(v10, v14, v13);
  v15 = self->_displayLink;
  objc_msgSend_runLoop(self, v16, v17);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_runLoopMode(self, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addToRunLoop_forMode_(v15, v21, (uint64_t)v22, v20);

}

- (void)invalidate
{
  uint64_t v2;
  CADisplayLink *displayLink;
  CADisplayLink *v5;

  displayLink = self->_displayLink;
  if (displayLink)
  {
    objc_msgSend_invalidate(displayLink, a2, v2);
    v5 = self->_displayLink;
    self->_displayLink = 0;

  }
}

- (BOOL)isValid
{
  return self->_displayLink != 0;
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_storeStrong((id *)&self->_displayLink, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
