@implementation AEGridOverlayView

- (AEGridOverlayView)init
{
  AEGridOverlayView *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AEGridOverlayView;
  v2 = -[AEGridOverlayView init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "gradientShadow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithPatternImage:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEGridOverlayView setBackgroundColor:](v2, "setBackgroundColor:", v4);

  }
  return v2;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  int v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[AEGridOverlayView overlayConfiguration](self, "overlayConfiguration", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v10, "showCloudDecoration");
  v5 = objc_msgSend(v10, "showVideoDecoration");
  v6 = objc_msgSend(v10, "showLoopDecoration");
  if (!v4)
  {
    if (!v5)
      goto LABEL_3;
LABEL_7:
    objc_msgSend((id)objc_opt_class(), "videoBadge");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEGridOverlayView _videoRect](self, "_videoRect");
    objc_msgSend(v9, "drawInRect:");

    if (!v6)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend((id)objc_opt_class(), "cloudBadge");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AEGridOverlayView _cloudRect](self, "_cloudRect");
  objc_msgSend(v8, "drawInRect:");

  if (v5)
    goto LABEL_7;
LABEL_3:
  if (v6)
  {
LABEL_4:
    objc_msgSend((id)objc_opt_class(), "loopBadge");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AEGridOverlayView _loopRect](self, "_loopRect");
    objc_msgSend(v7, "drawInRect:");

  }
LABEL_5:

}

- (CGRect)_cloudRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[AEGridOverlayView bounds](self, "bounds");
  v4 = v2 + v3 + -24.0 + -6.0;
  v7 = v5 + v6 + -15.0 + -8.0;
  v8 = 24.0;
  v9 = 15.0;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v4;
  return result;
}

- (CGRect)_videoRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[AEGridOverlayView bounds](self, "bounds");
  v3 = v2 + 8.0;
  v6 = v4 + v5 + -12.0 + -8.0;
  v7 = 20.0;
  v8 = 12.0;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v3;
  return result;
}

- (CGRect)_loopRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[AEGridOverlayView bounds](self, "bounds");
  v3 = v2 + 8.0;
  v6 = v4 + v5 + -15.0 + -8.0;
  v7 = 19.0;
  v8 = 15.0;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v3;
  return result;
}

- (void)didApplyGeometry:(PXTileGeometry *)a3 withUserData:(id)a4
{
  -[AEGridOverlayView _setOverlayConfiguration:](self, "_setOverlayConfiguration:", a4);
  -[AEGridOverlayView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)becomeReusable
{
  -[AEGridOverlayView _setOverlayConfiguration:](self, "_setOverlayConfiguration:", 0);
  -[AEGridOverlayView setHidden:](self, "setHidden:", 1);
}

- (void)prepareForReuse
{
  -[AEGridOverlayView setHidden:](self, "setHidden:", 0);
}

- (AEGridOverlayConfiguration)overlayConfiguration
{
  return self->_overlayConfiguration;
}

- (void)_setOverlayConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_overlayConfiguration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayConfiguration, 0);
}

+ (id)gridOverlayLayoutInfo
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__AEGridOverlayView_gridOverlayLayoutInfo__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (gridOverlayLayoutInfo_onceToken != -1)
    dispatch_once(&gridOverlayLayoutInfo_onceToken, block);
  return (id)gridOverlayLayoutInfo_gridOverlayLayoutInfo;
}

+ (id)gradientShadow
{
  if (gradientShadow_onceToken != -1)
    dispatch_once(&gradientShadow_onceToken, &__block_literal_global_544);
  return (id)gradientShadow_gradientShadow;
}

+ (id)cloudBadge
{
  if (cloudBadge_onceToken != -1)
    dispatch_once(&cloudBadge_onceToken, &__block_literal_global_153);
  return (id)cloudBadge_cloudBadge;
}

+ (id)videoBadge
{
  if (videoBadge_onceToken != -1)
    dispatch_once(&videoBadge_onceToken, &__block_literal_global_156);
  return (id)videoBadge_videoBadge;
}

+ (id)loopBadge
{
  if (loopBadge_onceToken != -1)
    dispatch_once(&loopBadge_onceToken, &__block_literal_global_159);
  return (id)loopBadge_loopBadge;
}

void __30__AEGridOverlayView_loopBadge__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x24BEBD640];
  AssetExplorerBundle();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", CFSTR("Loop_badge"), v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)loopBadge_loopBadge;
  loopBadge_loopBadge = v1;

}

void __31__AEGridOverlayView_videoBadge__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x24BEBD640];
  AssetExplorerBundle();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", CFSTR("Video_badge"), v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)videoBadge_videoBadge;
  videoBadge_videoBadge = v1;

}

void __31__AEGridOverlayView_cloudBadge__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x24BEBD640];
  AssetExplorerBundle();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", CFSTR("Cloud_badge"), v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)cloudBadge_cloudBadge;
  cloudBadge_cloudBadge = v1;

}

void __35__AEGridOverlayView_gradientShadow__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x24BEBD640];
  AssetExplorerBundle();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", CFSTR("Gradient_shadow"), v3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)gradientShadow_gradientShadow;
  gradientShadow_gradientShadow = v1;

}

void __42__AEGridOverlayView_gridOverlayLayoutInfo__block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  AEGridOverlayLayoutInfo *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "gradientShadow");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "size");
  v3 = -[AEGridOverlayLayoutInfo initWithGradientImageSize:]([AEGridOverlayLayoutInfo alloc], "initWithGradientImageSize:", v1, v2);
  v4 = (void *)gridOverlayLayoutInfo_gridOverlayLayoutInfo;
  gridOverlayLayoutInfo_gridOverlayLayoutInfo = (uint64_t)v3;

}

@end
