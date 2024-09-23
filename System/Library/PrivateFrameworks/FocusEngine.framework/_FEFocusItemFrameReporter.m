@implementation _FEFocusItemFrameReporter

- (_FEFocusItemFrameReporter)initWithFocusSystem:(id)a3
{
  id v4;
  _FEFocusItemFrameReporter *v5;
  _FEFocusItemFrameReporter *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_FEFocusItemFrameReporter;
  v5 = -[_FEFocusItemFrameReporter init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_focusSystem, v4);
    -[_FEFocusItemFrameReporter setEnabled:](v6, "setEnabled:", objc_msgSend(v4, "_isEnabled"));
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__focusSystemEnabledStateDidChange_, 0x250D3B190, 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0x250D3B190, 0);

  v4.receiver = self;
  v4.super_class = (Class)_FEFocusItemFrameReporter;
  -[_FEFocusItemFrameReporter dealloc](&v4, sel_dealloc);
}

- (void)_reportFocusFrameForCurrentlyFocusedItem
{
  id WeakRetained;
  id v4;

  if (self->_enabled)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
    if (WeakRetained)
    {
      v4 = WeakRetained;
      -[_FEFocusItemFrameReporter _globalFrameForFocusedItemInSystem:](self, "_globalFrameForFocusedItemInSystem:", WeakRetained);
      -[_FEFocusItemFrameReporter _reportFocusFrameUpdateForGlobalFrame:](self, "_reportFocusFrameUpdateForGlobalFrame:");
      WeakRetained = v4;
    }

  }
}

- (void)_scheduleRepeatingFrameUpdate
{
  OS_dispatch_source *v3;
  OS_dispatch_source *focusedFrameUpdateTimer;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (self->_enabled)
  {
    if (!self->_focusedFrameUpdateTimer)
    {
      objc_initWeak(&location, self);
      v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
      focusedFrameUpdateTimer = self->_focusedFrameUpdateTimer;
      self->_focusedFrameUpdateTimer = v3;

      v5 = self->_focusedFrameUpdateTimer;
      v6 = dispatch_time(0, 0);
      dispatch_source_set_timer(v5, v6, 0xBEBC200uLL, 0x2FAF080uLL);
      v7 = self->_focusedFrameUpdateTimer;
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __58___FEFocusItemFrameReporter__scheduleRepeatingFrameUpdate__block_invoke;
      v8[3] = &unk_250D39E90;
      objc_copyWeak(&v9, &location);
      dispatch_source_set_event_handler(v7, v8);
      dispatch_resume((dispatch_object_t)self->_focusedFrameUpdateTimer);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    -[_FEFocusItemFrameReporter _cancelRepeatingFrameUpdate](self, "_cancelRepeatingFrameUpdate");
  }
}

- (void)_cancelRepeatingFrameUpdate
{
  NSObject *focusedFrameUpdateTimer;
  OS_dispatch_source *v4;

  focusedFrameUpdateTimer = self->_focusedFrameUpdateTimer;
  if (focusedFrameUpdateTimer)
  {
    dispatch_source_cancel(focusedFrameUpdateTimer);
    v4 = self->_focusedFrameUpdateTimer;
    self->_focusedFrameUpdateTimer = 0;

  }
}

- (void)_focusSystemEnabledStateDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  -[_FEFocusItemFrameReporter focusSystem](self, "focusSystem");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5 == v7)
  {
    -[_FEFocusItemFrameReporter setEnabled:](self, "setEnabled:", objc_msgSend(v7, "_isEnabled"));
    v6 = v7;
  }

}

- (BOOL)_rect:(CGRect)a3 differsFromRect:(CGRect)a4 lowerThreshold:(double)a5 upperThreshold:(double)a6
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  _BOOL4 IsNull;
  double v15;
  double v16;
  double v17;
  BOOL v20;
  BOOL v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  IsNull = CGRectIsNull(a3);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  if (IsNull != CGRectIsNull(v22))
    return 1;
  v23.origin.x = v13;
  v23.origin.y = v12;
  v23.size.width = v11;
  v23.size.height = v10;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v24 = CGRectIntersection(v23, v25);
  v15 = v24.size.width;
  v16 = v24.size.height;
  if (CGRectIsNull(v24))
    return 1;
  v17 = v11 * v10 / (v15 * v16);
  if (v17 < a5 || v17 > a6)
    return 1;
  v20 = v10 / height < a5;
  if (v10 / height > a6)
    v20 = 1;
  v21 = v11 / width < a5;
  if (v11 / width > a6)
    v21 = 1;
  return v21 || v20;
}

- (CGRect)_globalFrameForFocusedItemInSystem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect result;

  v3 = a3;
  objc_msgSend(v3, "focusedItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_parentFocusEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_focusItemContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v6)
  {
    objc_msgSend(v3, "_focusItemContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_focusCoordinateSpace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "_focusCoordinateSpace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_focusFrame");
    objc_msgSend(v9, "convertRect:toCoordinateSpace:", v8);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

  }
  else
  {
    v11 = *MEMORY[0x24BDBF070];
    v13 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v15 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v17 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    if (a3)
    {
      self->_enabled = 1;
      -[_FEFocusItemFrameReporter _scheduleRepeatingFrameUpdate](self, "_scheduleRepeatingFrameUpdate");
    }
    else
    {
      -[_FEFocusItemFrameReporter _cancelRepeatingFrameUpdate](self, "_cancelRepeatingFrameUpdate");
      -[_FEFocusItemFrameReporter _reportFocusFrameUpdateForGlobalFrame:](self, "_reportFocusFrameUpdateForGlobalFrame:", *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24));
      self->_enabled = 0;
    }
  }
}

- (_FEFocusSystem)focusSystem
{
  return (_FEFocusSystem *)objc_loadWeakRetained((id *)&self->_focusSystem);
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_focusSystem);
  objc_storeStrong((id *)&self->_focusedFrameUpdateTimer, 0);
}

@end
