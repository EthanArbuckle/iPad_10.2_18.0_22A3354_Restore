@implementation CAInterAppAudioSwitcherView

- (void)initialize
{
  CAIAANodeContainer *v3;
  double v4;
  double v5;
  CAIAANodeContainer *v6;
  void *v7;
  void *v8;

  v3 = [CAIAANodeContainer alloc];
  -[CAInterAppAudioSwitcherView frame](self, "frame");
  v5 = v4;
  -[CAInterAppAudioSwitcherView frame](self, "frame");
  v6 = -[CAIAANodeContainer initWithFrame:](v3, "initWithFrame:", 0.0, 0.0, v5);
  self->nodeView = v6;
  -[CAIAANodeContainer setAutoresizingMask:](v6, "setAutoresizingMask:", 18);
  -[CAInterAppAudioSwitcherView setBackgroundColor:](self, "setBackgroundColor:", objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor"));
  -[CAInterAppAudioSwitcherView addSubview:](self, "addSubview:", self->nodeView);
  -[CAIAANodeContainer addObserver:forKeyPath:options:context:](self->nodeView, "addObserver:forKeyPath:options:context:", self, CFSTR("numPages"), 1, 0);
  -[CAIAANodeContainer setDelegate:](self->nodeView, "setDelegate:", self);
  v7 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_appHasGoneInBackground, *MEMORY[0x24BEBDF98], 0);
  v8 = (void *)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_appHasGoneForeground, *MEMORY[0x24BEBE008], 0);
}

- (CAInterAppAudioSwitcherView)initWithFrame:(CGRect)a3
{
  CAInterAppAudioSwitcherView *v3;
  CAInterAppAudioSwitcherView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAInterAppAudioSwitcherView;
  v3 = -[CAInterAppAudioSwitcherView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CAInterAppAudioSwitcherView initialize](v3, "initialize");
  return v4;
}

- (CAInterAppAudioSwitcherView)initWithCoder:(id)a3
{
  CAInterAppAudioSwitcherView *v3;
  CAInterAppAudioSwitcherView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAInterAppAudioSwitcherView;
  v3 = -[CAInterAppAudioSwitcherView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[CAInterAppAudioSwitcherView initialize](v3, "initialize");
  return v4;
}

- (void)removeFromSuperview
{
  objc_super v3;

  -[NSTimer invalidate](self->refreshTimer, "invalidate");
  self->refreshTimer = 0;
  -[CAIAANodeContainer removeObserver:forKeyPath:](self->nodeView, "removeObserver:forKeyPath:", self, CFSTR("numPages"));
  -[CAIAANodeContainer setDelegate:](self->nodeView, "setDelegate:", 0);
  -[CAIAANodeContainer removeFromSuperview](self->nodeView, "removeFromSuperview");
  v3.receiver = self;
  v3.super_class = (Class)CAInterAppAudioSwitcherView;
  -[CAInterAppAudioSwitcherView removeFromSuperview](&v3, sel_removeFromSuperview);
}

- (void)startTimer
{
  NSTimer *refreshTimer;

  refreshTimer = self->refreshTimer;
  if (!refreshTimer)
  {
    refreshTimer = (NSTimer *)objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_updateInfo, 0, 1, 2.0);
    self->refreshTimer = refreshTimer;
  }
  -[NSTimer setTolerance:](refreshTimer, "setTolerance:", 0.5);
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAInterAppAudioSwitcherView;
  -[CAInterAppAudioSwitcherView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[CAInterAppAudioSwitcherView startTimer](self, "startTimer");
}

- (void)setOutputAudioUnit:(AudioUnit)au
{
  OpaqueAudioComponentInstance *outputUnit;
  uint64_t v6;
  uint64_t v7;

  outputUnit = self->outputUnit;
  if (outputUnit != au)
  {
    if (outputUnit)
    {
      v6 = AudioUnitRemovePropertyListenerWithUserData(outputUnit, 0x65u, (AudioUnitPropertyListenerProc)AudioUnitIAASwitcherPropertyChangeDispatcher, self);
      if ((_DWORD)v6)
        NSLog(CFSTR("error removing property listener for IsInterAppConnected: %d"), v6);
    }
    self->outputUnit = au;
    if (au)
    {
      v7 = AudioUnitAddPropertyListener(au, 0x65u, (AudioUnitPropertyListenerProc)AudioUnitIAASwitcherPropertyChangeDispatcher, self);
      if ((_DWORD)v7)
      {
        NSLog(CFSTR("error adding property listener for IsInterAppConnected: %d"), v7);
        return;
      }
    }
    else
    {
      self->isHostConnected = 1;
    }
    -[CAInterAppAudioSwitcherView updateInfo](self, "updateInfo");
  }
}

- (BOOL)isShowingAppNames
{
  return self->showingAppNames;
}

- (void)setShowingAppNames:(BOOL)showingAppNames
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (self->showingAppNames != showingAppNames)
  {
    v3 = showingAppNames;
    self->showingAppNames = showingAppNames;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = (void *)-[CAIAANodeContainer subviews](self->nodeView, "subviews", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v10, "setHasLabel:", v3);
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
    -[CAIAANodeContainer setNeedsLayout](self->nodeView, "setNeedsLayout");
  }
}

- (void)updateNodeList
{
  double v3;
  double v4;
  double v5;
  double v6;
  unint64_t v7;
  float v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  objc_msgSend((id)-[CAIAANodeContainer subviews](self->nodeView, "subviews"), "makeObjectsPerformSelector:", sel_removeFromSuperview);
  if (-[CAIAANodeInfo numNodes](self->info, "numNodes"))
  {
    objc_msgSend(-[CAIAANodeInfo nodeAtIndex:](self->info, "nodeAtIndex:", 0), "frame");
    v4 = v3;
    -[CAIAANodeContainer frame](self->nodeView, "frame");
    v6 = v5;
    if (-[CAIAANodeInfo numNodes](self->info, "numNodes"))
    {
      v7 = 0;
      v8 = (v6 - v4) * 0.5;
      v9 = floorf(v8);
      do
      {
        v10 = -[CAIAANodeInfo nodeAtIndex:](self->info, "nodeAtIndex:", v7);
        objc_msgSend(v10, "frame");
        v12 = v11;
        objc_msgSend(v10, "frame");
        v14 = v13 + v9;
        objc_msgSend(v10, "frame");
        v16 = v15;
        objc_msgSend(v10, "frame");
        objc_msgSend(v10, "setFrame:", v12, v14, v16);
        objc_msgSend(v10, "addTarget:action:forControlEvents:", self, sel_nodePressed_, 64);
        objc_msgSend(v10, "setHasLabel:", self->showingAppNames);
        -[CAIAANodeContainer addSubview:](self->nodeView, "addSubview:", v10);
        ++v7;
      }
      while (v7 < -[CAIAANodeInfo numNodes](self->info, "numNodes"));
    }
  }
  -[CAInterAppAudioSwitcherView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutSubviews
{
  uint64_t v3;
  UIPageControl *pageControl;
  UIPageControl *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  float v11;
  double v12;
  double v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CAInterAppAudioSwitcherView;
  -[CAInterAppAudioSwitcherView layoutSubviews](&v14, sel_layoutSubviews);
  -[CAIAANodeContainer layoutSubviews](self->nodeView, "layoutSubviews");
  v3 = -[CAIAANodeContainer numPages](self->nodeView, "numPages");
  pageControl = self->pageControl;
  if (v3 < 2)
  {
    if (pageControl)
    {
      -[UIPageControl removeFromSuperview](pageControl, "removeFromSuperview");
      self->pageControl = 0;
      -[CAInterAppAudioSwitcherView frame](self, "frame");
      -[CAIAANodeContainer setFrame:](self->nodeView, "setFrame:");
    }
  }
  else if (!pageControl)
  {
    v5 = (UIPageControl *)objc_alloc_init(MEMORY[0x24BEBD7D0]);
    self->pageControl = v5;
    -[UIPageControl sizeForNumberOfPages:](v5, "sizeForNumberOfPages:", -[CAIAANodeContainer numPages](self->nodeView, "numPages"));
    v7 = v6;
    v9 = v8;
    -[CAInterAppAudioSwitcherView frame](self, "frame");
    v11 = (v10 - v7) * 0.5;
    v12 = floorf(v11);
    -[CAInterAppAudioSwitcherView frame](self, "frame");
    -[UIPageControl setFrame:](self->pageControl, "setFrame:", v12, v13 - v9, v7, v9);
    -[UIPageControl setNumberOfPages:](self->pageControl, "setNumberOfPages:", -[CAIAANodeContainer numPages](self->nodeView, "numPages"));
    -[UIPageControl setCurrentPage:](self->pageControl, "setCurrentPage:", 0);
    -[UIPageControl addTarget:action:forControlEvents:](self->pageControl, "addTarget:action:forControlEvents:", self, sel_changePage_, 4096);
  }
}

- (void)changePage:(id)a3
{
  double v4;
  double v5;

  if (self->nodeView)
  {
    v4 = (double)-[UIPageControl currentPage](self->pageControl, "currentPage", a3);
    -[CAIAANodeContainer frame](self->nodeView, "frame");
    -[CAIAANodeContainer setContentOffset:animated:](self->nodeView, "setContentOffset:animated:", 1, v5 * v4, 0.0);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("numPages"), a4, a5, a6))
  {
    if (self->nodeView == a4)
      -[UIPageControl setNumberOfPages:](self->pageControl, "setNumberOfPages:", objc_msgSend(a4, "numPages"));
  }
}

- (void)nodePressed:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication"), "openURL:", objc_msgSend(a3, "url"));
}

- (void)appHasGoneForeground
{
  -[CAInterAppAudioSwitcherView updateNodeList](self, "updateNodeList");
  -[CAInterAppAudioSwitcherView startTimer](self, "startTimer");
}

- (void)appHasGoneInBackground
{
  -[NSTimer invalidate](self->refreshTimer, "invalidate");
  self->refreshTimer = 0;
}

- (BOOL)isHostConnected
{
  OpaqueAudioComponentInstance *outputUnit;
  _BOOL4 v4;
  UInt32 ioDataSize;
  int outData;

  outputUnit = self->outputUnit;
  if (outputUnit)
  {
    ioDataSize = 4;
    outData = 0;
    if (!AudioUnitGetProperty(outputUnit, 0x65u, 0, 0, &outData, &ioDataSize))
    {
      v4 = outData != 0;
      if (self->isHostConnected != v4)
        self->isHostConnected = v4;
    }
  }
  return self->isHostConnected;
}

- (CGFloat)contentWidth
{
  CGFloat result;

  -[CAIAANodeContainer contentWidth](self->nodeView, "contentWidth");
  return result;
}

- (void)audioUnitPropertyChangedListener:(void *)a3 unit:(OpaqueAudioComponentInstance *)a4 propID:(unsigned int)a5 scope:(unsigned int)a6 element:(unsigned int)a7
{
  if (a5 == 101)
    -[CAInterAppAudioSwitcherView updateInfo](self, "updateInfo", a3, a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
}

- (void)updateInfo
{
  _BOOL4 v3;
  CAIAANodeInfo *info;

  v3 = -[CAInterAppAudioSwitcherView isHostConnected](self, "isHostConnected");
  self->isHostConnected = v3;
  info = self->info;
  if (v3)
  {
    if (info)
    {
      -[CAIAANodeInfo refresh](info, "refresh");
    }
    else
    {
      self->info = objc_alloc_init(CAIAANodeInfo);
      -[CAIAANodeInfo setLabelColor:](self->info, "setLabelColor:", objc_msgSend(MEMORY[0x24BEBD4B8], "lightGrayColor"));
    }
  }
  else if (info)
  {

    self->info = 0;
  }
  -[CAInterAppAudioSwitcherView updateNodeList](self, "updateNodeList");
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  double v5;
  double v6;
  double v7;

  if (self->pageControl)
  {
    objc_msgSend(a3, "contentOffset");
    v6 = v5;
    objc_msgSend(a3, "contentSize");
    *(float *)&v7 = v6 / v7;
    -[UIPageControl setCurrentPage:](self->pageControl, "setCurrentPage:", llroundf(*(float *)&v7));
  }
}

@end
