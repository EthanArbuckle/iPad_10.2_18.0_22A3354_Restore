@implementation GLKViewController

- (void)_initCommon
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateScreenIfChanged, *MEMORY[0x24BDF7FE8], 0);
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__updateScreenIfChanged, *MEMORY[0x24BDF7D68], 0);
  self->_pauseOnWillResignActive = 1;
  self->_resumeOnDidBecomeActive = 1;
  self->_screenFramesPerSecond = -[GLKViewController _calculateScreenFramesPerSecond:](self, "_calculateScreenFramesPerSecond:", objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen"));
  -[GLKViewController setPreferredFramesPerSecond:](self, "setPreferredFramesPerSecond:", 30);
  self->_displayLinkPaused = 1;
  -[GLKViewController setDisplayLinkMessenger:](self, "setDisplayLinkMessenger:", objc_alloc_init(GLKDisplayLinkMessenger));
  -[GLKDisplayLinkMessenger setTarget:](self->_displayLinkMessenger, "setTarget:", self);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    self->_updateIMP = (void *)-[GLKViewController methodForSelector:](self, "methodForSelector:", sel_update);
}

- (GLKViewController)init
{
  GLKViewController *v2;
  GLKViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GLKViewController;
  v2 = -[GLKViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[GLKViewController _initCommon](v2, "_initCommon");
    -[GLKViewController _configureNotifications](v3, "_configureNotifications");
  }
  return v3;
}

- (GLKViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  GLKViewController *v4;
  GLKViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GLKViewController;
  v4 = -[GLKViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[GLKViewController _initCommon](v4, "_initCommon");
    -[GLKViewController _configureNotifications](v5, "_configureNotifications");
  }
  return v5;
}

- (GLKViewController)initWithCoder:(id)a3
{
  GLKViewController *v4;
  GLKViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GLKViewController;
  v4 = -[GLKViewController initWithCoder:](&v7, sel_initWithCoder_);
  v5 = v4;
  if (v4)
  {
    -[GLKViewController _initCommon](v4, "_initCommon");
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("GLKViewControllerPreferredFramesPerSecondCoderKey")))-[GLKViewController setPreferredFramesPerSecond:](v5, "setPreferredFramesPerSecond:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("GLKViewControllerPreferredFramesPerSecondCoderKey")));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("GLKViewControllerPauseOnWillResignActiveCoderKey")))v5->_pauseOnWillResignActive = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("GLKViewControllerPauseOnWillResignActiveCoderKey"));
    if (objc_msgSend(a3, "containsValueForKey:", CFSTR("GLKViewControllerResumeOnDidBecomeActiveCoderKey")))v5->_resumeOnDidBecomeActive = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("GLKViewControllerResumeOnDidBecomeActiveCoderKey"));
    -[GLKViewController _configureNotifications](v5, "_configureNotifications");
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GLKViewController;
  -[GLKViewController encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_preferredFramesPerSecond, CFSTR("GLKViewControllerPreferredFramesPerSecondCoderKey"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_pauseOnWillResignActive, CFSTR("GLKViewControllerPauseOnWillResignActiveCoderKey"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_resumeOnDidBecomeActive, CFSTR("GLKViewControllerResumeOnDidBecomeActiveCoderKey"));
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "removeObserver:", self);
  self->_pauseOnWillResignActive = 0;
  self->_resumeOnDidBecomeActive = 0;
  -[GLKViewController _configureNotifications](self, "_configureNotifications");
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");

  self->_displayLink = 0;
  -[GLKViewController setDisplayLinkMessenger:](self, "setDisplayLinkMessenger:", 0);
  -[GLKViewController setScreen:](self, "setScreen:", 0);
  v3.receiver = self;
  v3.super_class = (Class)GLKViewController;
  -[GLKViewController dealloc](&v3, sel_dealloc);
}

- (void)_configureNotifications
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = v3;
  if (self->_pauseOnWillResignActive)
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__pauseByNotification, *MEMORY[0x24BDF75D8], 0);
  else
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF75D8], 0);
  if (self->_resumeOnDidBecomeActive)
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__resumeByNotification, *MEMORY[0x24BDF7510], 0);
  else
    objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BDF7510], 0);
}

- (int64_t)_calculateScreenFramesPerSecond:(id)a3
{
  double v3;

  objc_msgSend(a3, "_refreshRate");
  if (v3 == 0.0)
    return 60;
  else
    return llround(1.0 / v3);
}

- (void)_createDisplayLinkForScreen:(id)a3
{
  CADisplayLink *v5;
  CADisplayLink *displayLink;
  uint64_t v7;
  _QWORD *v8;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");

  v5 = (CADisplayLink *)(id)objc_msgSend(a3, "displayLinkWithTarget:selector:", self->_displayLinkMessenger, sel_message);
  self->_displayLink = v5;
  -[CADisplayLink setPaused:](v5, "setPaused:", self->_displayLinkPaused);
  -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:", self->_preferredFramesPerSecond);
  LODWORD(a3) = glkLinkedOSVersion();
  displayLink = self->_displayLink;
  v7 = objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  v8 = (_QWORD *)MEMORY[0x24BDBCB80];
  if (a3 <= 0x90000)
    v8 = (_QWORD *)MEMORY[0x24BDBCA90];
  -[CADisplayLink addToRunLoop:forMode:](displayLink, "addToRunLoop:forMode:", v7, *v8);
}

- (void)_updateAndDraw
{
  double v3;
  double v4;
  double v5;

  -[GLKViewController view](self, "view");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend((id)-[GLKViewController view](self, "view"), "setEnableSetNeedsDisplay:", 0);
  if (self->_updateIMP)
  {
    if (self->_lastUpdateOccurred)
    {
      v3 = CACurrentMediaTime();
      self->_timeSinceLastUpdate = v3 - self->_timeSinceLastUpdatePreviousTime;
      self->_timeSinceLastUpdatePreviousTime = v3;
    }
    else
    {
      self->_timeSinceLastUpdate = 0.0;
      self->_timeSinceLastUpdatePreviousTime = CACurrentMediaTime();
      self->_lastUpdateOccurred = 1;
    }
    ((void (*)(GLKViewController *, char *))self->_updateIMP)(self, sel_update);
  }
  else if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (self->_lastUpdateOccurred)
    {
      v4 = CACurrentMediaTime();
      self->_timeSinceLastUpdate = v4 - self->_timeSinceLastUpdatePreviousTime;
      self->_timeSinceLastUpdatePreviousTime = v4;
    }
    else
    {
      self->_timeSinceLastUpdate = 0.0;
      self->_timeSinceLastUpdatePreviousTime = CACurrentMediaTime();
      self->_lastUpdateOccurred = 1;
    }
    -[GLKViewControllerDelegate glkViewControllerUpdate:](self->_delegate, "glkViewControllerUpdate:", self);
  }
  -[GLKViewController view](self, "view");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self->_lastDrawOccurred)
    {
      v5 = CACurrentMediaTime();
      self->_timeSinceLastDraw = v5 - self->_timeSinceLastDrawPreviousTime;
      self->_timeSinceLastDrawPreviousTime = v5;
    }
    else
    {
      self->_timeSinceLastDraw = 0.0;
      self->_timeSinceLastDrawPreviousTime = CACurrentMediaTime();
      self->_lastDrawOccurred = 1;
    }
    objc_msgSend((id)-[GLKViewController view](self, "view"), "display");
    ++self->_framesDisplayed;
  }
}

- (void)_pauseByNotification
{
  void *v3;

  -[GLKViewController setPaused:](self, "setPaused:", 1);
  v3 = (void *)-[GLKViewController _existingView](self, "_existingView");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "deleteDrawable");
}

- (void)_resumeByNotification
{
  if (self->_viewIsVisible)
    -[GLKViewController setPaused:](self, "setPaused:", 0);
}

- (void)_updateScreenIfChanged
{
  UIScreen *v3;

  if (objc_msgSend((id)objc_msgSend((id)-[GLKViewController _existingView](self, "_existingView"), "window"), "screen"))
  {
    v3 = (UIScreen *)objc_msgSend((id)objc_msgSend((id)-[GLKViewController _existingView](self, "_existingView"), "window"), "screen");
    if (v3 == self->_screen)
    {
      self->_screenFramesPerSecond = -[GLKViewController _calculateScreenFramesPerSecond:](self, "_calculateScreenFramesPerSecond:", v3);
      -[GLKViewController setPreferredFramesPerSecond:](self, "setPreferredFramesPerSecond:", self->_preferredFramesPerSecond);
    }
    else
    {
      -[GLKViewController setScreen:](self, "setScreen:", objc_msgSend((id)objc_msgSend((id)-[GLKViewController _existingView](self, "_existingView"), "window"), "screen"));
      self->_screenFramesPerSecond = -[GLKViewController _calculateScreenFramesPerSecond:](self, "_calculateScreenFramesPerSecond:", self->_screen);
      -[GLKViewController setPreferredFramesPerSecond:](self, "setPreferredFramesPerSecond:", self->_preferredFramesPerSecond);
      -[GLKViewController _createDisplayLinkForScreen:](self, "_createDisplayLinkForScreen:", self->_screen);
    }
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GLKViewController;
  -[GLKViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v5, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  -[GLKViewController _updateScreenIfChanged](self, "_updateScreenIfChanged");
}

- (void)setView:(id)a3
{
  objc_super v5;

  if ((id)-[GLKViewController _existingView](self, "_existingView") != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)GLKViewController;
    -[GLKViewController setView:](&v5, sel_setView_, a3);
    -[GLKViewController _existingView](self, "_existingView");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && !objc_msgSend((id)-[GLKViewController _existingView](self, "_existingView"), "delegate"))
    {
      objc_msgSend((id)-[GLKViewController _existingView](self, "_existingView"), "setDelegate:", self);
    }
    -[GLKViewController _updateScreenIfChanged](self, "_updateScreenIfChanged");
  }
}

- (void)loadView
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  GLKView *v7;
  GLKView *v8;
  objc_super v9;
  objc_super v10;

  if (-[GLKViewController nibName](self, "nibName") && -[GLKViewController nibBundle](self, "nibBundle"))
  {
    v10.receiver = self;
    v10.super_class = (Class)GLKViewController;
    -[GLKViewController loadView](&v10, sel_loadView);
    -[GLKViewController _existingView](self, "_existingView");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = (void *)MEMORY[0x24BDD17C8];
      v5 = (objc_class *)objc_opt_self();
      v6 = NSStringFromClass(v5);
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("%@ loaded the \"%@\" nib but didn't get a GLKView."), objc_msgSend(v4, "stringWithFormat:", CFSTR("-[%@ %@]"), v6, NSStringFromSelector(a2)), -[GLKViewController nibName](self, "nibName"));
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GLKViewController;
    -[GLKViewController loadView](&v9, sel_loadView);
    v7 = [GLKView alloc];
    objc_msgSend((id)-[GLKViewController _existingView](self, "_existingView"), "frame");
    v8 = -[GLKView initWithFrame:](v7, "initWithFrame:");
    -[GLKView setAutoresizingMask:](v8, "setAutoresizingMask:", 18);
    -[GLKViewController setView:](self, "setView:", v8);

  }
}

- (void)viewDidUnload
{
  -[CADisplayLink invalidate](self->_displayLink, "invalidate");

  self->_displayLink = 0;
  -[GLKViewController setScreen:](self, "setScreen:", 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[GLKViewController setPaused:](self, "setPaused:", 0);
  self->_viewIsVisible = 1;
  v5.receiver = self;
  v5.super_class = (Class)GLKViewController;
  -[GLKViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GLKViewController;
  -[GLKViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  self->_viewIsVisible = 0;
  -[GLKViewController setPaused:](self, "setPaused:", 1);
}

- (NSInteger)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond;
}

- (void)setPreferredFramesPerSecond:(NSInteger)preferredFramesPerSecond
{
  if (preferredFramesPerSecond <= 1)
    preferredFramesPerSecond = 1;
  self->_preferredFramesPerSecond = preferredFramesPerSecond;
  -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:");
  self->_framesPerSecond = self->_preferredFramesPerSecond;
}

- (void)setPaused:(BOOL)paused
{
  _BOOL8 v3;

  self->_displayLinkPaused = paused;
  if (self->_displayLink)
  {
    v3 = paused;
    if (!self->_firstResumeOccurred && !paused)
    {
      self->_timeSinceFirstResumeStartTime = CACurrentMediaTime();
      self->_firstResumeOccurred = 1;
    }
    if (!self->_lastResumeOccurred && !v3)
    {
      self->_timeSinceLastResumeStartTime = CACurrentMediaTime();
      self->_lastResumeOccurred = 1;
    }
    if (v3)
    {
      self->_lastResumeOccurred = 0;
      self->_lastUpdateOccurred = 0;
      self->_lastDrawOccurred = 0;
    }
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
      -[GLKViewControllerDelegate glkViewController:willPause:](self->_delegate, "glkViewController:willPause:", self, v3);
    if (v3)
      objc_msgSend((id)-[GLKViewController _existingView](self, "_existingView"), "setEnableSetNeedsDisplay:", 1);
    -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", v3);
  }
}

- (BOOL)isPaused
{
  return -[CADisplayLink isPaused](self->_displayLink, "isPaused");
}

- (NSTimeInterval)timeSinceFirstResume
{
  if (self->_firstResumeOccurred)
    return CACurrentMediaTime() - self->_timeSinceFirstResumeStartTime;
  else
    return 0.0;
}

- (NSTimeInterval)timeSinceLastResume
{
  if (self->_lastResumeOccurred)
    return CACurrentMediaTime() - self->_timeSinceLastResumeStartTime;
  else
    return 0.0;
}

- (void)setPauseOnWillResignActive:(BOOL)pauseOnWillResignActive
{
  self->_pauseOnWillResignActive = pauseOnWillResignActive;
  -[GLKViewController _configureNotifications](self, "_configureNotifications");
}

- (BOOL)pauseOnWillResignActive
{
  return self->_pauseOnWillResignActive;
}

- (void)setResumeOnDidBecomeActive:(BOOL)resumeOnDidBecomeActive
{
  self->_resumeOnDidBecomeActive = resumeOnDidBecomeActive;
  -[GLKViewController _configureNotifications](self, "_configureNotifications");
}

- (BOOL)resumeOnDidBecomeActive
{
  return self->_resumeOnDidBecomeActive;
}

- (UIScreen)screen
{
  return self->_screen;
}

- (void)setScreen:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 976);
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 984);
}

- (BOOL)displayLinkPaused
{
  return self->_displayLinkPaused;
}

- (void)setDisplayLinkPaused:(BOOL)a3
{
  self->_displayLinkPaused = a3;
}

- (GLKDisplayLinkMessenger)displayLinkMessenger
{
  return self->_displayLinkMessenger;
}

- (void)setDisplayLinkMessenger:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 992);
}

- (BOOL)viewIsVisible
{
  return self->_viewIsVisible;
}

- (void)setViewIsVisible:(BOOL)a3
{
  self->_viewIsVisible = a3;
}

- (BOOL)firstResumeOccurred
{
  return self->_firstResumeOccurred;
}

- (void)setFirstResumeOccurred:(BOOL)a3
{
  self->_firstResumeOccurred = a3;
}

- (double)timeSinceFirstResumeStartTime
{
  return self->_timeSinceFirstResumeStartTime;
}

- (void)setTimeSinceFirstResumeStartTime:(double)a3
{
  self->_timeSinceFirstResumeStartTime = a3;
}

- (BOOL)lastResumeOccurred
{
  return self->_lastResumeOccurred;
}

- (void)setLastResumeOccurred:(BOOL)a3
{
  self->_lastResumeOccurred = a3;
}

- (double)timeSinceLastResumeStartTime
{
  return self->_timeSinceLastResumeStartTime;
}

- (void)setTimeSinceLastResumeStartTime:(double)a3
{
  self->_timeSinceLastResumeStartTime = a3;
}

- (BOOL)lastUpdateOccurred
{
  return self->_lastUpdateOccurred;
}

- (void)setLastUpdateOccurred:(BOOL)a3
{
  self->_lastUpdateOccurred = a3;
}

- (double)timeSinceLastUpdatePreviousTime
{
  return self->_timeSinceLastUpdatePreviousTime;
}

- (void)setTimeSinceLastUpdatePreviousTime:(double)a3
{
  self->_timeSinceLastUpdatePreviousTime = a3;
}

- (BOOL)lastDrawOccurred
{
  return self->_lastDrawOccurred;
}

- (void)setLastDrawOccurred:(BOOL)a3
{
  self->_lastDrawOccurred = a3;
}

- (double)timeSinceLastDrawPreviousTime
{
  return self->_timeSinceLastDrawPreviousTime;
}

- (void)setTimeSinceLastDrawPreviousTime:(double)a3
{
  self->_timeSinceLastDrawPreviousTime = a3;
}

- (void)updateIMP
{
  return self->_updateIMP;
}

- (void)setUpdateIMP:(void *)a3
{
  self->_updateIMP = a3;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = (GLKViewControllerDelegate *)delegate;
}

- (int64_t)screenFramesPerSecond
{
  return self->_screenFramesPerSecond;
}

- (void)setScreenFramesPerSecond:(int64_t)a3
{
  self->_screenFramesPerSecond = a3;
}

- (NSInteger)framesPerSecond
{
  return self->_framesPerSecond;
}

- (NSInteger)framesDisplayed
{
  return self->_framesDisplayed;
}

- (NSTimeInterval)timeSinceLastUpdate
{
  return self->_timeSinceLastUpdate;
}

- (NSTimeInterval)timeSinceLastDraw
{
  return self->_timeSinceLastDraw;
}

@end
