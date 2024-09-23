@implementation DTSSceneView

- (DTSSceneView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  DTSSceneView *v7;
  void *v8;
  objc_class *v9;
  uint64_t v10;
  SKView *sceneView;
  void *v12;
  DTSSceneView *v13;
  objc_super v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15.receiver = self;
  v15.super_class = (Class)DTSSceneView;
  v7 = -[DTSSceneView initWithFrame:](&v15, sel_initWithFrame_);
  if (v7)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2050000000;
    v8 = (void *)getSKViewClass_softClass;
    v20 = getSKViewClass_softClass;
    if (!getSKViewClass_softClass)
    {
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __getSKViewClass_block_invoke;
      v16[3] = &unk_24F6E6C30;
      v16[4] = &v17;
      __getSKViewClass_block_invoke((uint64_t)v16);
      v8 = (void *)v18[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v17, 8);
    v10 = objc_msgSend([v9 alloc], "initWithFrame:", x, y, width, height);
    sceneView = v7->_sceneView;
    v7->_sceneView = (SKView *)v10;

    -[DTSSceneView addSubview:](v7, "addSubview:", v7->_sceneView);
    -[SKView setAutoresizingMask:](v7->_sceneView, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel__applicationDidEnterBackground, *MEMORY[0x24BDF7528], 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel__applicationWillEnterForeground, *MEMORY[0x24BDF75D0], 0);
    objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel__applicationWillEnterForeground, *MEMORY[0x24BDF7510], 0);
    v13 = v7;

  }
  return v7;
}

- (void)setShouldCullNonVisibleNodes:(BOOL)a3
{
  self->_shouldCullNonVisibleNodes = a3;
  -[SKView setShouldCullNonVisibleNodes:](self->_sceneView, "setShouldCullNonVisibleNodes:");
}

- (void)setIgnoresSiblingOrder:(BOOL)a3
{
  self->_ignoresSiblingOrder = a3;
  -[SKView setIgnoresSiblingOrder:](self->_sceneView, "setIgnoresSiblingOrder:");
}

- (void)setAllowsTransparency:(BOOL)a3
{
  self->_allowsTransparency = a3;
  -[SKView setAllowsTransparency:](self->_sceneView, "setAllowsTransparency:");
}

- (void)presentScene:(id)a3
{
  -[SKView presentScene:](self->_sceneView, "presentScene:", a3);
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
  -[SKView setPaused:](self->_sceneView, "setPaused:");
}

- (void)setPreferredFramesPerSecond:(int64_t)a3
{
  self->_preferredFramesPerSecond = a3;
  -[SKView setPreferredFramesPerSecond:](self->_sceneView, "setPreferredFramesPerSecond:");
}

- (NSMutableDictionary)options
{
  return (NSMutableDictionary *)-[SKView options](self->_sceneView, "options");
}

- (void)_applicationDidEnterBackground
{
  self->_shouldDelayLayout = 1;
}

- (void)_updateLayout
{
  self->_shouldDelayLayout = 0;
  if (self->_didDelayLayout)
    -[DTSSceneView setNeedsLayout](self, "setNeedsLayout");
  self->_didDelayLayout = 0;
}

- (void)layoutSubviews
{
  void *v3;
  uint64_t v4;
  objc_super v5;

  if (self->_shouldDelayLayout
    || (objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "applicationState"),
        v3,
        v4))
  {
    self->_didDelayLayout = 1;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)DTSSceneView;
    -[DTSSceneView layoutSubviews](&v5, sel_layoutSubviews);
  }
}

- (BOOL)shouldCullNonVisibleNodes
{
  return self->_shouldCullNonVisibleNodes;
}

- (BOOL)ignoresSiblingOrder
{
  return self->_ignoresSiblingOrder;
}

- (BOOL)allowsTransparency
{
  return self->_allowsTransparency;
}

- (BOOL)paused
{
  return self->_paused;
}

- (int64_t)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneView, 0);
}

@end
