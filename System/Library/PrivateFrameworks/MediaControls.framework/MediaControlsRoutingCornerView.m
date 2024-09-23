@implementation MediaControlsRoutingCornerView

- (MediaControlsRoutingCornerView)initWithFrame:(CGRect)a3
{
  MediaControlsRoutingCornerView *v3;
  MediaControlsRoutingCornerView *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MediaControlsRoutingCornerView;
  v3 = -[CCUICAPackageView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MediaControlsRoutingCornerView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 1);
    -[CCUICAPackageView setStateName:](v4, "setStateName:", &stru_1E581FBA8);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if (v6 == 1)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B18]), "initWithDelegate:", v4);
      -[MediaControlsRoutingCornerView addInteraction:](v4, "addInteraction:", v7);

    }
  }
  return v4;
}

- (void)setRouting:(BOOL)a3
{
  if (self->_routing != a3)
  {
    self->_routing = a3;
    -[MediaControlsRoutingCornerView _updateGlyph](self, "_updateGlyph");
  }
}

- (void)setDeviceType:(int64_t)a3
{
  void *v5;
  int v6;
  __CFString *v7;
  const __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  if (self->_deviceType != a3)
  {
    self->_deviceType = a3;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "ccuiSupportsGroupRendering");

    if (a3 == 2)
    {
      v7 = CFSTR("VideoRoutingCorner-j71");
      v8 = CFSTR("VideoRoutingCorner");
    }
    else
    {
      if (a3 != 1)
      {
LABEL_9:
        -[MediaControlsRoutingCornerView _updateGlyph](self, "_updateGlyph");
        return;
      }
      v7 = CFSTR("AudioRoutingCorner-j71");
      v8 = CFSTR("AudioRoutingCorner");
    }
    if (v6)
      v7 = (__CFString *)v8;
    v9 = v7;
    objc_msgSend(MEMORY[0x1E0CB34D0], "mediaControlsBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLForResource:withExtension:", v9, CFSTR("ca"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD27F8], "packageWithContentsOfURL:type:options:error:", v11, *MEMORY[0x1E0CD3078], 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUICAPackageView setPackage:](self, "setPackage:", v12);

    goto LABEL_9;
  }
}

- (void)setRoutesAvailable:(BOOL)a3
{
  if (self->_routesAvailable != a3)
  {
    self->_routesAvailable = a3;
    -[MediaControlsRoutingCornerView _updateGlyph](self, "_updateGlyph");
  }
}

- (void)_updateGlyph
{
  const __CFString *v3;

  if (-[MediaControlsRoutingCornerView routesAreAvailable](self, "routesAreAvailable"))
  {
    if (-[MediaControlsRoutingCornerView isRouting](self, "isRouting"))
      v3 = CFSTR("connected");
    else
      v3 = CFSTR("available");
  }
  else
  {
    v3 = &stru_1E581FBA8;
  }
  -[CCUICAPackageView setStateName:](self, "setStateName:", v3);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = objc_alloc_init(MEMORY[0x1E0DC3B78]);
  v6 = (void *)MEMORY[0x1E0DC3508];
  -[MediaControlsRoutingCornerView bounds](self, "bounds");
  UIRectInset();
  objc_msgSend(v6, "bezierPathWithOvalInRect:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVisiblePath:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D90]), "initWithView:parameters:", self, v5);
  objc_msgSend(MEMORY[0x1E0DC3B08], "effectWithPreview:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (BOOL)routesAreAvailable
{
  return self->_routesAvailable;
}

- (BOOL)isRouting
{
  return self->_routing;
}

@end
