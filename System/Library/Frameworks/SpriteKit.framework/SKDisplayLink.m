@implementation SKDisplayLink

- (BOOL)_callbackAlreadyInProgress
{
  return self->_callbackAlreadyInProgress;
}

- (void)_setCallbackAlreadyInProgress:(BOOL)a3
{
  self->_callbackAlreadyInProgress = a3;
}

- (SKDisplayLink)initWithDisplay:(id)a3 handler:(id)a4 client:(id)a5
{
  id v9;
  id v10;
  SKDisplayLink *v11;
  SKDisplayLink *v12;
  NSTimer *timer;
  uint64_t v14;
  id block;
  CADisplayLink *caDisplayLink;
  objc_super v18;

  v9 = a3;
  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SKDisplayLink;
  v11 = -[SKDisplayLink init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_display, a3);
    v12->_preferredFramesPerSecond = 60.0;
    timer = v12->_timer;
    v12->_timer = 0;

    v12->_paused = 1;
    v14 = MEMORY[0x1DF0CFCB0](v10);
    block = v12->_block;
    v12->_block = (id)v14;

    caDisplayLink = v12->_caDisplayLink;
    v12->_client = a5;
    v12->_caDisplayLink = 0;

    -[SKDisplayLink _setup](v12, "_setup");
  }

  return v12;
}

- (SKDisplayLink)init
{

  return 0;
}

+ (SKDisplayLink)displayLinkWithDisplay:(id)a3 handler:(id)a4 client:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDisplay:handler:client:", v7, v8, a5);

  return (SKDisplayLink *)v9;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  CADisplayLink *caDisplayLink;

  v3 = a3;
  kdebug_trace();
  if (self->_paused != v3)
  {
    self->_paused = v3;
    caDisplayLink = self->_caDisplayLink;
    if (caDisplayLink)
      -[CADisplayLink setPaused:](caDisplayLink, "setPaused:", v3);
  }
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  CADisplayLink *caDisplayLink;

  self->_preferredFramesPerSecond = (float)a3;
  kdebug_trace();
  caDisplayLink = self->_caDisplayLink;
  if (caDisplayLink)
    -[CADisplayLink setPreferredFramesPerSecond:](caDisplayLink, "setPreferredFramesPerSecond:", (uint64_t)self->_preferredFramesPerSecond);
}

- (int64_t)preferredFramesPerSecond
{
  return (uint64_t)self->_preferredFramesPerSecond;
}

- (void)setDisplay:(id)a3
{
  CADisplayLink *caDisplayLink;
  CADisplay *v6;
  CADisplay *v7;

  v7 = (CADisplay *)a3;
  if (self->_display != v7)
  {
    objc_storeStrong((id *)&self->_display, a3);
    caDisplayLink = self->_caDisplayLink;
    if (caDisplayLink)
    {
      -[CADisplayLink display](caDisplayLink, "display");
      v6 = (CADisplay *)objc_claimAutoreleasedReturnValue();

      if (v6 != v7)
      {
        -[SKDisplayLink _teardown](self, "_teardown");
        -[SKDisplayLink _setup](self, "_setup");
      }
    }
  }

}

- (CADisplay)display
{
  return self->_display;
}

- (void)_setup
{
  CADisplayLink *caDisplayLink;
  CADisplayLink *v4;
  CADisplay *display;
  CADisplayLink *v6;
  CADisplayLink *v7;
  CADisplayLink *v8;
  id v9;

  self->_averageFrameTime = 0.0;
  self->_frameCount = 0;
  self->_frameCountBeginTime = 0.0;
  kdebug_trace();
  caDisplayLink = self->_caDisplayLink;
  if (caDisplayLink)
  {
    -[CADisplayLink invalidate](caDisplayLink, "invalidate");
    v4 = self->_caDisplayLink;
    self->_caDisplayLink = 0;

  }
  display = self->_display;
  if (display)
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithDisplay:target:selector:", display, self, sel__caDisplayLinkCallback);
  else
    objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", self, sel__caDisplayLinkCallback);
  v6 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
  v7 = self->_caDisplayLink;
  self->_caDisplayLink = v6;

  -[CADisplayLink setPreferredFramesPerSecond:](self->_caDisplayLink, "setPreferredFramesPerSecond:", (uint64_t)self->_preferredFramesPerSecond);
  -[CADisplayLink setPaused:](self->_caDisplayLink, "setPaused:", self->_paused);
  v8 = self->_caDisplayLink;
  objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[CADisplayLink addToRunLoop:forMode:](v8, "addToRunLoop:forMode:");

}

- (void)_teardown
{
  CADisplayLink *caDisplayLink;
  CADisplayLink *v4;

  kdebug_trace();
  caDisplayLink = self->_caDisplayLink;
  if (caDisplayLink)
  {
    -[CADisplayLink invalidate](caDisplayLink, "invalidate");
    v4 = self->_caDisplayLink;
    self->_caDisplayLink = 0;

  }
}

- (void)_callbackForNextFrame:(double)a3
{
  int64_t frameCount;
  float preferredFramesPerSecond;
  float v7;
  float v8;

  if (sk_debug_get_optional() && sk_debug_get_optional())
    kdebug_trace();
  if (!self->_paused)
  {
    (*((void (**)(double))self->_block + 2))(a3);
    self->_previousFrameTime = a3;
    frameCount = self->_frameCount;
    self->_frameCount = frameCount + 1;
    if (frameCount >= 4)
    {
      preferredFramesPerSecond = self->_preferredFramesPerSecond;
      v7 = a3 - a3;
      v8 = (a3 - self->_frameCountBeginTime) / (double)(frameCount + 1);
      self->_averageFrameTime = v8;
      self->_frameCountBeginTime = a3;
      self->_frameCount = 0;
      if ((float)(preferredFramesPerSecond * 0.75) > v7 && vabds_f32(v7, v8) < 0.002)
      {
        kdebug_trace();
        -[SKDisplayLink _teardown](self, "_teardown");
        -[SKDisplayLink _setup](self, "_setup");
      }
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  -[SKDisplayLink invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SKDisplayLink;
  -[SKDisplayLink dealloc](&v3, sel_dealloc);
}

- (void)_caDisplayLinkCallback
{
  char v3;
  CADisplayLink *caDisplayLink;
  double v5;
  double v6;

  v3 = objc_opt_respondsToSelector();
  caDisplayLink = self->_caDisplayLink;
  if ((v3 & 1) != 0)
  {
    -[CADisplayLink targetTimestamp](caDisplayLink, "targetTimestamp");
  }
  else
  {
    -[CADisplayLink timestamp](caDisplayLink, "timestamp");
    v5 = v6 + (float)(1.0 / self->_preferredFramesPerSecond);
  }
  -[SKDisplayLink _callbackForNextFrame:](self, "_callbackForNextFrame:", v5);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_display, 0);
  objc_storeStrong((id *)&self->_caDisplayLink, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
