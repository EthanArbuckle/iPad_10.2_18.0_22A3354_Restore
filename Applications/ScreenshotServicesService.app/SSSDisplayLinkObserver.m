@implementation SSSDisplayLinkObserver

- (void)dealloc
{
  objc_super v3;

  -[SSSDisplayLinkObserver stopObserver](self, "stopObserver");
  v3.receiver = self;
  v3.super_class = (Class)SSSDisplayLinkObserver;
  -[SSSDisplayLinkObserver dealloc](&v3, "dealloc");
}

- (void)startObserver
{
  CADisplayLink *v3;
  CADisplayLink *displayLink;
  CADisplayLink *v5;
  id v6;

  if (!self->_displayLink)
  {
    v3 = (CADisplayLink *)objc_claimAutoreleasedReturnValue(+[CADisplayLink displayLinkWithTarget:selector:](CADisplayLink, "displayLinkWithTarget:selector:", self, "_displayLinkHandler:"));
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", 3);
    v5 = self->_displayLink;
    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    -[CADisplayLink addToRunLoop:forMode:](v5, "addToRunLoop:forMode:", v6, NSRunLoopCommonModes);

  }
}

- (void)_displayLinkHandler:(id)a3
{
  void *v4;
  uint64_t (**v5)(void);
  char v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSDisplayLinkObserver displayLinkObserverHandler](self, "displayLinkObserverHandler", a3));

  if (v4)
  {
    v5 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[SSSDisplayLinkObserver displayLinkObserverHandler](self, "displayLinkObserverHandler"));
    v6 = v5[2]();

    if ((v6 & 1) == 0)
      -[SSSDisplayLinkObserver stopObserver](self, "stopObserver");
  }
}

- (void)stopObserver
{
  CADisplayLink *displayLink;
  CADisplayLink *v4;

  displayLink = self->_displayLink;
  if (displayLink)
  {
    -[CADisplayLink invalidate](displayLink, "invalidate");
    v4 = self->_displayLink;
    self->_displayLink = 0;

  }
}

- (id)displayLinkObserverHandler
{
  return self->_displayLinkObserverHandler;
}

- (void)setDisplayLinkObserverHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_displayLinkObserverHandler, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
