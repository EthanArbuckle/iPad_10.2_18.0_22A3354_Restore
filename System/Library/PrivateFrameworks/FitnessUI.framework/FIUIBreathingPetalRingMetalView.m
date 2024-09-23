@implementation FIUIBreathingPetalRingMetalView

- (FIUIBreathingPetalRingMetalView)initWithFrame:(CGRect)a3 numberOfPetals:(int64_t)a4 showBlurTrails:(BOOL)a5 device:(id)a6
{
  return -[FIUIBreathingPetalRingMetalView initWithFrame:petalColor:numberOfPetals:showBlurTrails:device:](self, "initWithFrame:petalColor:numberOfPetals:showBlurTrails:device:", 0, a4, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (FIUIBreathingPetalRingMetalView)initWithFrame:(CGRect)a3 petalColor:(int64_t)a4 numberOfPetals:(int64_t)a5 showBlurTrails:(BOOL)a6 device:(id)a7
{
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  id v15;
  FIUIBreathingPetalRingMetalView *v16;
  FIUIBreathingPetalRingMetalView *v17;
  id v18;
  void *v19;
  uint64_t v20;
  MTKView *mtkView;
  void *v22;
  FIUIBreathingPetalRingMetalRenderer *v23;
  FIUIBreathingPetalRingMetalRenderer *renderer;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  id location;
  objc_super v32;

  v7 = a6;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = a7;
  v32.receiver = self;
  v32.super_class = (Class)FIUIBreathingPetalRingMetalView;
  v16 = -[FIUIBreathingPetalRingMetalView initWithFrame:](&v32, sel_initWithFrame_, x, y, width, height);
  v17 = v16;
  if (v16)
  {
    -[FIUIBreathingPetalRingMetalView setTranslatesAutoresizingMaskIntoConstraints:](v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[FIUIBreathingPetalRingMetalView setAutoresizingMask:](v17, "setAutoresizingMask:", 18);
    -[FIUIBreathingPetalRingMetalView setAutoresizesSubviews:](v17, "setAutoresizesSubviews:", 1);
    v17->_numberOfPetals = a5;
    v17->_showBlurTrails = v7;
    if (v15)
      v18 = v15;
    else
      v18 = MTLCreateSystemDefaultDevice();
    v19 = v18;
    v20 = objc_msgSend(objc_alloc(MEMORY[0x24BDDDB50]), "initWithFrame:device:", v18, x, y, width, height);
    mtkView = v17->_mtkView;
    v17->_mtkView = (MTKView *)v20;

    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTKView setBackgroundColor:](v17->_mtkView, "setBackgroundColor:", v22);

    -[MTKView setFramebufferOnly:](v17->_mtkView, "setFramebufferOnly:", 1);
    v23 = -[FIUIBreathingPetalRingMetalRenderer initWithMetalKitView:petalColor:numberOfPetals:showBlurTrails:]([FIUIBreathingPetalRingMetalRenderer alloc], "initWithMetalKitView:petalColor:numberOfPetals:showBlurTrails:", v17->_mtkView, a4, a5, v7);
    renderer = v17->_renderer;
    v17->_renderer = v23;

    -[MTKView setDelegate:](v17->_mtkView, "setDelegate:", v17->_renderer);
    objc_initWeak(&location, v17);
    v26 = MEMORY[0x24BDAC760];
    v27 = 3221225472;
    v28 = __97__FIUIBreathingPetalRingMetalView_initWithFrame_petalColor_numberOfPetals_showBlurTrails_device___block_invoke;
    v29 = &unk_24CF30408;
    objc_copyWeak(&v30, &location);
    -[FIUIBreathingPetalRingMetalRenderer setStateUpdateBlock:](v17->_renderer, "setStateUpdateBlock:", &v26);
    -[FIUIBreathingPetalRingMetalView addSubview:](v17, "addSubview:", v17->_mtkView, v26, v27, v28, v29);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);

  }
  return v17;
}

void __97__FIUIBreathingPetalRingMetalView_initWithFrame_petalColor_numberOfPetals_showBlurTrails_device___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "petalRingDelegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "petalRingViewDisplayLinkDidFire:", WeakRetained);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FIUIBreathingPetalRingMetalView;
  -[FIUIBreathingPetalRingMetalView layoutSubviews](&v12, sel_layoutSubviews);
  -[FIUIBreathingPetalRingMetalView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[FIUIBreathingPetalRingMetalView mtkView](self, "mtkView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)setRingRadius:(float)a3
{
  -[FIUIBreathingPetalRingMetalRenderer setRingRadius:](self->_renderer, "setRingRadius:");
}

- (float)ringRadius
{
  float result;

  -[FIUIBreathingPetalRingMetalRenderer ringRadius](self->_renderer, "ringRadius");
  return result;
}

- (void)setRingCenter:(CGPoint)a3
{
  -[FIUIBreathingPetalRingMetalRenderer setRingCenter:](self->_renderer, "setRingCenter:", a3.x, a3.y);
}

- (CGPoint)ringCenter
{
  double v2;
  double v3;
  CGPoint result;

  -[FIUIBreathingPetalRingMetalRenderer ringCenter](self->_renderer, "ringCenter");
  result.y = v3;
  result.x = v2;
  return result;
}

- (int64_t)numberOfVisiblePetals
{
  return -[FIUIBreathingPetalRingMetalRenderer numberOfVisiblePetals](self->_renderer, "numberOfVisiblePetals");
}

- (void)setPreferredFramesPerSecond:(float)a3
{
  -[MTKView setPreferredFramesPerSecond:](self->_mtkView, "setPreferredFramesPerSecond:", (uint64_t)a3);
}

- (float)preferredFramesPerSecond
{
  return (float)-[MTKView preferredFramesPerSecond](self->_mtkView, "preferredFramesPerSecond");
}

- (void)importDataFromPetalRing:(id)a3
{
  if (a3)
    -[FIUIBreathingPetalRingMetalRenderer importDataFromPetalRingMetalRenderer:](self->_renderer, "importDataFromPetalRingMetalRenderer:", *((_QWORD *)a3 + 56));
}

- (void)setPetalAtIndex:(int64_t)a3 center:(CGPoint)a4 radius:(float)a5 alpha:(float)a6
{
  -[FIUIBreathingPetalRingMetalRenderer setPetalAtIndex:center:radius:alpha:](self->_renderer, "setPetalAtIndex:center:radius:alpha:", a3, a4.x, a4.y);
}

- (void)setBlurTrailAtIndex:(int64_t)a3 center:(CGPoint)a4 radius:(float)a5 blurriness:(float)a6 alpha:(float)a7
{
  -[FIUIBreathingPetalRingMetalRenderer setBlurTrailAtIndex:center:radius:blurriness:alpha:](self->_renderer, "setBlurTrailAtIndex:center:radius:blurriness:alpha:", a3, a4.x, a4.y);
}

- (void)setNumberOfVisiblePetals:(int64_t)a3 showBlurTrails:(BOOL)a4
{
  -[FIUIBreathingPetalRingMetalRenderer setNumberOfVisiblePetals:showBlurTrails:](self->_renderer, "setNumberOfVisiblePetals:showBlurTrails:", a3, a4);
}

- (void)setGradientRotationAngle:(float)a3
{
  -[FIUIBreathingPetalRingMetalRenderer setGradientRotationAngle:](self->_renderer, "setGradientRotationAngle:");
}

- (FIUIDeepBreathingPetalRingViewDelegate)petalRingDelegate
{
  return (FIUIDeepBreathingPetalRingViewDelegate *)objc_loadWeakRetained((id *)&self->_petalRingDelegate);
}

- (void)setPetalRingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_petalRingDelegate, a3);
}

- (int64_t)numberOfPetals
{
  return self->_numberOfPetals;
}

- (BOOL)showBlurTrails
{
  return self->_showBlurTrails;
}

- (MTKView)mtkView
{
  return self->_mtkView;
}

- (void)setMtkView:(id)a3
{
  objc_storeStrong((id *)&self->_mtkView, a3);
}

- (FIUIBreathingPetalRingMetalRenderer)renderer
{
  return self->_renderer;
}

- (void)setRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_renderer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_mtkView, 0);
  objc_destroyWeak((id *)&self->_petalRingDelegate);
}

@end
