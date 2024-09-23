@implementation NUNIAstronomyVistaView

- (NUNIAstronomyVistaView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  NUNIAstronomyVistaView *v11;
  NUNIAstronomyVistaView *v12;
  uint64_t v13;
  CLKDevice *device;
  uint64_t v15;
  CLKUIQuadView *quadView0;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NUNIRenderer *renderer;
  double v23;
  NUNIQuad *v24;
  NUNIQuad *quad;
  CALayer *v26;
  CALayer *contentMaskLayer;
  NSArray *v28;
  void *v29;
  void *v30;
  UIView *v31;
  UIView *quadView1;
  UIView *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSArray *quadViews;
  void *v41;
  void (**v42)(_QWORD, _QWORD);
  objc_super v44;
  CLKUIQuadView *v45;
  _QWORD v46[2];
  const __CFString *v47;
  _QWORD v48[2];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v48[1] = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v44.receiver = self;
  v44.super_class = (Class)NUNIAstronomyVistaView;
  v11 = -[NUNIAstronomyVistaView initWithFrame:](&v44, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_configuration, a4);
    objc_msgSend(v10, "device");
    v13 = objc_claimAutoreleasedReturnValue();
    device = v12->_device;
    v12->_device = (CLKDevice *)v13;

    objc_msgSend(MEMORY[0x24BE16F58], "quadViewWithFrame:identifier:options:colorSpace:", CFSTR("NUV0"), objc_msgSend(v10, "quadViewOptions"), objc_msgSend(v10, "colorSpace"), x, y, width, height);
    v15 = objc_claimAutoreleasedReturnValue();
    quadView0 = v12->_quadView0;
    v12->_quadView0 = (CLKUIQuadView *)v15;

    -[NUNIAstronomyVistaView _mtlQuadView](v12, "_mtlQuadView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "maxAPL");
    objc_msgSend(v17, "setMaxAPL:");
    -[NUNIAstronomyVistaView addSubview:](v12, "addSubview:", v12->_quadView0);
    v18 = objc_msgSend(v10, "rendererStyle");
    v19 = objc_msgSend(v17, "colorPixelFormat");
    objc_msgSend(v10, "textureSuffix");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[NUNIRenderer sharedInstanceWithPixelFormat:textureSuffix:rendererStyle:](NUNIRenderer, "sharedInstanceWithPixelFormat:textureSuffix:rendererStyle:", v19, v20, v18);
    v21 = objc_claimAutoreleasedReturnValue();
    renderer = v12->_renderer;
    v12->_renderer = (NUNIRenderer *)v21;

    objc_msgSend(v10, "screenScale");
    v24 = -[NUNIQuad initWithScreenScale:renderer:]([NUNIQuad alloc], "initWithScreenScale:renderer:", v12->_renderer, v23);
    quad = v12->_quad;
    v12->_quad = v24;

    -[CLKUIQuadView addQuad:](v12->_quadView0, "addQuad:", v12->_quad);
    -[CLKUIQuadView setPaused:](v12->_quadView0, "setPaused:", 1);
    -[CLKUIQuadView setDelegate:](v12->_quadView0, "setDelegate:", v12);
    if ((v18 & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      -[CLKUIQuadView setOpaque:](v12->_quadView0, "setOpaque:", 1);
      -[CLKUIQuad setOpaque:](v12->_quad, "setOpaque:", 1);
      objc_msgSend(MEMORY[0x24BDE56D0], "layer");
      v26 = (CALayer *)objc_claimAutoreleasedReturnValue();
      contentMaskLayer = v12->_contentMaskLayer;
      v12->_contentMaskLayer = v26;

      v28 = v26;
      -[NSArray setFrame:](v28, "setFrame:", x, y, width, height);
      -[NSArray setCompositingFilter:](v28, "setCompositingFilter:", *MEMORY[0x24BDE5A48]);
      -[NSArray setOpaque:](v28, "setOpaque:", 0);
      v47 = CFSTR("contents");
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v29;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray setActions:](v28, "setActions:", v30);

      -[NUNIRenderer setContentMaskLayer:](v12->_renderer, "setContentMaskLayer:", v28);
      v31 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, width, floor(height / 3.0));
      quadView1 = v12->_quadView1;
      v12->_quadView1 = v31;

      v33 = v31;
      v34 = (void *)MGGetStringAnswer();
      if ((objc_msgSend(v34, "isEqualToString:", CFSTR("t8010")) & 1) != 0)
      {
        v35 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDE5720], "layer");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "metalLayer");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setSourceLayer:", v37);

        objc_msgSend(v35, "setFrame:", x, y, width, height);
        objc_msgSend(v35, "addSublayer:", v28);
        objc_msgSend(v35, "setOpaque:", 0);
        objc_storeStrong((id *)&v12->_portalLayer, v35);
      }
      -[UIView layer](v33, "layer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setOpaque:", 0);
      if (v35)
        objc_msgSend(v38, "addSublayer:", v35);
      -[UIView setOpaque:](v33, "setOpaque:", 0);
      -[NUNIAstronomyVistaView insertSubview:aboveSubview:](v12, "insertSubview:aboveSubview:", v33, v12->_quadView0);
      v46[0] = v33;
      v46[1] = v12->_quadView0;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 2);
      v39 = objc_claimAutoreleasedReturnValue();
      quadViews = v12->_quadViews;
      v12->_quadViews = (NSArray *)v39;

    }
    else
    {
      v45 = v12->_quadView0;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v45, 1);
      v36 = objc_claimAutoreleasedReturnValue();
      v28 = v12->_quadViews;
      v12->_quadViews = (NSArray *)v36;
    }

    v12->_vista = -1;
    v12->_transitionStyle = 0;
    -[NUNIAstronomyVistaView updateLightingPreference:](v12, "updateLightingPreference:", 0);
    *((_BYTE *)v12 + 496) |= 2u;
    objc_msgSend(v10, "initialSetupOperation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    if (v41)
    {
      objc_msgSend(v10, "initialSetupOperation");
      v42 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, NUNIAstronomyVistaView *))v42)[2](v42, v12);

    }
  }

  return v12;
}

- (void)discardContents
{
  void *v2;
  id v3;

  -[NUNIAstronomyVistaView _mtlQuadView](self, "_mtlQuadView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metalLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "discardContents");

}

- (void)removeBackBuffers
{
  void *v2;
  id v3;

  -[NUNIAstronomyVistaView _mtlQuadView](self, "_mtlQuadView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metalLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeBackBuffers");

}

- (void)setTritiumBrightness:(double)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_quadViews;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setTritiumBrightness:", a3, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)dealloc
{
  NUNIQuad *quad;
  CLKUIQuadView *quadView0;
  void *v5;
  objc_super v6;

  -[NUNIAstronomyVistaView _stopAnimation](self, "_stopAnimation");
  quad = self->_quad;
  self->_quad = 0;

  -[CLKUIQuadView removeAllQuads](self->_quadView0, "removeAllQuads");
  quadView0 = self->_quadView0;
  self->_quadView0 = 0;

  objc_msgSend(MEMORY[0x24BE16F60], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "purgeAllUnused");

  v6.receiver = self;
  v6.super_class = (Class)NUNIAstronomyVistaView;
  -[NUNIAstronomyVistaView dealloc](&v6, sel_dealloc);
}

- (void)purgeUnused
{
  -[NUNIRenderer purgeUnusedWithScene:](self->_renderer, "purgeUnusedWithScene:", self->_scene);
}

- (void)setCacheDirectory:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NUNIRenderer resourceManager](self->_renderer, "resourceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cloudsService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDirectory:", v6);

  }
}

- (void)disableCloudDataFetch:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NUNIRenderer resourceManager](self->_renderer, "resourceManager");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cloudsService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisableFetch:", v3);

  }
}

- (id)snapshotImage
{
  CLKUIQuadView *quadView0;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;

  quadView0 = self->_quadView0;
  -[NUNIAstronomyVistaView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[NUNIAstronomyVistaView device](self, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "screenScale");
  -[CLKUIQuadView snapshotInRect:scale:time:](quadView0, "snapshotInRect:scale:time:", v5, v7, v9, v11, v13, 0.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (float)computeDimming
{
  void *v2;
  float v3;
  float v4;

  -[NUNIAstronomyVistaView _mtlQuadView](self, "_mtlQuadView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CLKUIComputeDimmingRequiredToObtainQuadAPL();
  v4 = v3;

  return v4;
}

- (id)_mtlQuadView
{
  return self->_quadView0;
}

- (void)setAPLFilterAmount:(double)a3
{
  double v4;
  id v5;

  -[NUNIAstronomyVistaView _mtlQuadView](self, "_mtlQuadView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setAplFilterAmount:", v4);

}

- (NUNIScene)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
  NUNIScene *v5;

  v5 = (NUNIScene *)a3;
  if (self->_scene != v5)
  {
    objc_storeStrong((id *)&self->_scene, a3);
    -[NUNIScene setObserver:](v5, "setObserver:", self);
    -[NUNIQuad setScene:](self->_quad, "setScene:", v5);
  }

}

- (void)setOpaque:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  objc_super v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NUNIAstronomyVistaView;
  if (-[NUNIAstronomyVistaView isOpaque](&v8, sel_isOpaque) != a3)
  {
    v7.receiver = self;
    v7.super_class = (Class)NUNIAstronomyVistaView;
    -[NUNIAstronomyVistaView setOpaque:](&v7, sel_setOpaque_, v3);
    if (v3)
      v5 = 2;
    else
      v5 = 1;
    -[NUNIScene setBackgroundType:](self->_scene, "setBackgroundType:", v5);
    -[NSArray lastObject](self->_quadViews, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setOpaque:", v3);

  }
}

- (void)setFrameInterval:(int64_t)a3
{
  uint64_t v4;

  if (self->_frameInterval != a3)
  {
    self->_frameInterval = a3;
    v4 = _NUNIFrameIntervalToFramesPerSecond_framePerSeconds[a3];
    if (-[CLKUIQuadView preferredFramesPerSecond](self->_quadView0, "preferredFramesPerSecond") != v4)
      -[CLKUIQuadView setPreferredFramesPerSecond:](self->_quadView0, "setPreferredFramesPerSecond:", v4);
  }
}

- (void)updateSunLocationAnimated:(BOOL)a3
{
  -[NUNIScene updateSunLocationAnimated:lightingPreference:adjustEarthRotation:](self->_scene, "updateSunLocationAnimated:lightingPreference:adjustEarthRotation:", a3, self->_preferredCarouselLighting, 1);
}

- (void)updateSunLocationAnimated:(BOOL)a3 adjustEarthRotation:(BOOL)a4
{
  -[NUNIScene updateSunLocationAnimated:lightingPreference:adjustEarthRotation:](self->_scene, "updateSunLocationAnimated:lightingPreference:adjustEarthRotation:", a3, self->_preferredCarouselLighting, a4);
}

- (void)_startAnimation
{
  if (-[CLKUIQuadView isPaused](self->_quadView0, "isPaused"))
  {
    kdebug_trace();
    -[CLKUIQuadView setPaused:](self->_quadView0, "setPaused:", 0);
  }
}

- (void)_stopAnimation
{
  if ((-[CLKUIQuadView isPaused](self->_quadView0, "isPaused") & 1) == 0)
  {
    -[CLKUIQuadView setPaused:](self->_quadView0, "setPaused:", 1);
    kdebug_trace();
  }
}

- (void)startAnimation
{
  *((_BYTE *)self + 496) |= 4u;
  -[NUNIAstronomyVistaView _updateAnimation](self, "_updateAnimation");
}

- (void)stopAnimation
{
  *((_BYTE *)self + 496) &= ~4u;
  -[NUNIAstronomyVistaView _updateAnimation](self, "_updateAnimation");
}

- (void)_updateAnimation
{
  if ((*((_BYTE *)self + 496) & 4) != 0 && (*((_BYTE *)self + 496) & 2) != 0)
    -[NUNIAstronomyVistaView _startAnimation](self, "_startAnimation");
  else
    -[NUNIAstronomyVistaView _stopAnimation](self, "_stopAnimation");
}

- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  -[CLKUIQuadView renderSynchronouslyWithImageQueueDiscard:inGroup:](self->_quadView0, "renderSynchronouslyWithImageQueueDiscard:inGroup:", a3, a4);
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
  CAPortalLayer *portalLayer;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NUNIAstronomyVistaView;
  -[NUNIAstronomyVistaView layoutSubviews](&v12, sel_layoutSubviews);
  -[NUNIAstronomyVistaView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CLKUIQuadView setFrame:](self->_quadView0, "setFrame:");
  if (self->_quadView1)
  {
    -[CALayer setFrame:](self->_contentMaskLayer, "setFrame:", v4, v6, v8, v10);
    -[UIView setFrame:](self->_quadView1, "setFrame:", 0.0, 0.0, v8, floor(v10 / 3.0));
    portalLayer = self->_portalLayer;
    if (portalLayer)
      -[CAPortalLayer setFrame:](portalLayer, "setFrame:", v4, v6, v8, v10);
  }
}

- (void)updatePortalLayerBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CAPortalLayer *portalLayer;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[NUNIAstronomyVistaView bounds](self, "bounds");
  if (self->_quadView1)
  {
    v12 = v8;
    v13 = v9;
    v14 = v10;
    v15 = v11;
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
    -[CALayer setFrame:](self->_contentMaskLayer, "setFrame:", v12, v13, v14, v15);
    -[UIView setFrame:](self->_quadView1, "setFrame:", x, y, width, height);
    -[UIView setClipsToBounds:](self->_quadView1, "setClipsToBounds:", 1);
    portalLayer = self->_portalLayer;
    if (portalLayer)
      -[CAPortalLayer setFrame:](portalLayer, "setFrame:", -x, -y, v14, v15);
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
  }
}

- (id)rotatable:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a3 <= 9 && ((0x3FBu >> a3) & 1) != 0)
  {
    -[NUNIScene spheroidOfType:](self->_scene, "spheroidOfType:", qword_2134DBEE8[a3], v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)showSupplemental:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  char v7;
  float v8;
  float v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  NUNIAnimation *v14;
  float v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int v19;
  double v20;
  float v21;
  float v22;
  BOOL v23;
  double v24;
  NUNIAnimation *v25;
  double v26;
  unint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  float v31;
  double v32;
  float v33;
  float v34;
  double v35;
  int32x2_t v36;
  float v37;
  float v38;
  float v39;
  double v40;
  double v41;
  float v42;
  double v43;
  float v44;
  double v45;
  float v46;
  float v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  float64x2_t v53;
  float32x2_t v54;
  int v55;
  double v56;
  float v57;
  float v58;
  BOOL v59;
  float v60;
  NUNIAnimation *v61;
  double v62;
  double v63;
  float v64;
  NUNIAnimation *v65;
  double v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t i;
  void *v73;
  int v74;
  double v75;
  char v76;
  double v77;
  unint64_t v78;
  NUNIAnimation *v79;
  double v80;
  float v81;
  NUNIAnimation *v82;
  double v83;
  float v84;
  float v85;
  uint64_t v86;
  id obj;
  float32x2_t v88;
  NUNIScene *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v4 = a4;
  v5 = a3;
  v105 = *MEMORY[0x24BDAC8D0];
  v7 = *((_BYTE *)self + 496);
  v89 = self->_scene;
  if (v89 && ((((v7 & 1) == 0) ^ v5) & 1) == 0)
  {
    *((_BYTE *)self + 496) = *((_BYTE *)self + 496) & 0xFE | v5;
    if (v5)
    {
      -[NUNIAstronomyVistaView supplementalSpheroidSize](self, "supplementalSpheroidSize");
      v9 = v8;
      -[CLKDevice screenBounds](self->_device, "screenBounds");
      v11 = v10;
      v99 = 0u;
      v100 = 0u;
      v101 = 0u;
      v102 = 0u;
      -[NUNIScene spheroids](v89, "spheroids");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v104, 16);
      if (v12)
      {
        v13 = v12;
        v14 = 0;
        v15 = v9 / v11;
        v86 = *(_QWORD *)v100;
        v85 = v15;
        v84 = v15 * 0.5;
        while (1)
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v100 != v86)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * v16);
            v18 = objc_msgSend(v17, "type");
            v19 = 1 << v18;
            LODWORD(v20) = 897988541;
            if ((_DWORD)v18 != 4)
            {
              v21 = v85;
              if ((v19 & 0x3000) != 0 || (v21 = v84, ((1 << v18) & 0xFBFBFE) != 0))
              {
                objc_msgSend(v17, "radius", v20);
                *(float *)&v20 = v21 / *(float *)&v20;
              }
              else
              {
                LODWORD(v20) = 1.0;
              }
            }
            v90 = v20;
            objc_msgSend(v17, "radiusScale");
            v23 = v22 == *(float *)&v90;
            v24 = v90;
            if (!v23)
            {
              if (v4)
              {
                v25 = -[NUNIAnimation initWithAnimatable:value:key:]([NUNIAnimation alloc], "initWithAnimatable:value:key:", v17, 7, *(double *)vdupq_lane_s32(*(int32x2_t *)&v90, 0).i64);

                LODWORD(v26) = 1062557008;
                -[NUNIAnimation setDuration:](v25, "setDuration:", v26);
                -[NUNIScene addAnimation:](v89, "addAnimation:", v25);
                v14 = v25;
              }
              else
              {
                objc_msgSend(v17, "setRadiusScale:", v90);
              }
            }
            if (((1 << v18) & 0xFFF000) == 0)
            {
              objc_msgSend(v17, "opacity", v24);
              if (*(float *)&v35 == 0.0)
                goto LABEL_40;
              v36.i32[0] = 0;
              if (v4)
                goto LABEL_37;
LABEL_39:
              LODWORD(v35) = v36.i32[0];
              objc_msgSend(v17, "setOpacity:", v35);
              goto LABEL_40;
            }
            if ((v19 & 0x3000) != 0)
              v27 = 7;
            else
              v27 = v18 - 14;
            if (v27 <= 3)
              v28 = 0;
            else
              v28 = -1;
            if (-[NUNIAstronomyVistaConfiguration isRTLLayout](self->_configuration, "isRTLLayout", v24))
            {
              -[CLKDevice screenBounds](self->_device, "screenBounds");
              v30 = v29;
              -[NUNIAstronomyVistaView supplementalHorizontalInset](self, "supplementalHorizontalInset");
              v32 = v30 - v31;
              -[NUNIAstronomyVistaView supplementalSpheroidSize](self, "supplementalSpheroidSize");
              v34 = v32 + (float)(v33 * -0.5);
            }
            else
            {
              -[NUNIAstronomyVistaView supplementalHorizontalInset](self, "supplementalHorizontalInset");
              v38 = v37;
              -[NUNIAstronomyVistaView supplementalSpheroidSize](self, "supplementalSpheroidSize");
              v34 = v38 + (float)(v39 * 0.5);
            }
            -[CLKDevice screenBounds](self->_device, "screenBounds");
            v41 = v40;
            -[NUNIAstronomyVistaView supplementalTopInset](self, "supplementalTopInset");
            v43 = v41 - v42;
            -[NUNIAstronomyVistaView supplementalBottomInset](self, "supplementalBottomInset");
            v45 = (v43 - v44) / 7.0;
            -[NUNIAstronomyVistaView supplementalTopInset](self, "supplementalTopInset");
            v47 = v46 + v45 * (double)(v27 + v28 - 1);
            -[CLKDevice screenBounds](self->_device, "screenBounds");
            v49 = v48;
            -[CLKDevice screenBounds](self->_device, "screenBounds");
            *(float *)&v49 = v49 / v50;
            -[CLKDevice screenBounds](self->_device, "screenBounds");
            v91 = v34 / v51;
            -[CLKDevice screenBounds](self->_device, "screenBounds");
            v53.f64[0] = v91;
            v53.f64[1] = (v47 / v52 + -0.5) * (float)-*(float *)&v49 + 0.5;
            v54 = vadd_f32(vcvt_f32_f64(v53), (float32x2_t)0xBF000000BF000000);
            *(float32x2_t *)&v53.f64[0] = vmul_f32(v54, v54);
            *(float *)v53.f64 = sqrtf(vmlas_n_f32(*((float *)v53.f64 + 1), v54.f32[0], v54.f32[0]));
            v92 = v53.f64[0];
            v88 = vdiv_f32(v54, (float32x2_t)vdup_lane_s32(*(int32x2_t *)&v53.f64[0], 0));
            objc_msgSend(v17, "angle");
            LODWORD(v49) = v55;
            *(float *)&v56 = atan2f(v88.f32[1], v88.f32[0]);
            *(float *)&v56 = *(float *)&v56 + (float)(floorf(*(float *)&v56 / 6.2832) * -6.2832);
            v57 = vabds_f32(*(float *)&v56, *(float *)&v49);
            if (*(float *)&v49 >= *(float *)&v56)
              v58 = 6.2832;
            else
              v58 = -6.2832;
            v59 = v57 <= 3.1416;
            v60 = -0.0;
            if (!v59)
              v60 = v58;
            *(float *)&v56 = *(float *)&v56 + v60;
            if (v4)
            {
              v61 = -[NUNIAnimation initWithAnimatable:value:key:]([NUNIAnimation alloc], "initWithAnimatable:value:key:", v17, 8, *(double *)vdupq_lane_s32(*(int32x2_t *)&v56, 0).i64);

              LODWORD(v62) = 1062557008;
              -[NUNIAnimation setDuration:](v61, "setDuration:", v62);
              -[NUNIScene addAnimation:](v89, "addAnimation:", v61);
              v14 = -[NUNIAnimation initWithAnimatable:value:key:]([NUNIAnimation alloc], "initWithAnimatable:value:key:", v17, 4, *(double *)vdupq_lane_s32(*(int32x2_t *)&v92, 0).i64);

              LODWORD(v63) = 1062557008;
              -[NUNIAnimation setDuration:](v14, "setDuration:", v63);
              -[NUNIScene addAnimation:](v89, "addAnimation:", v14);
              objc_msgSend(v17, "opacity");
              v36.i32[0] = 1.0;
              if (v64 == 1.0)
                goto LABEL_40;
LABEL_37:
              v65 = -[NUNIAnimation initWithAnimatable:value:key:]([NUNIAnimation alloc], "initWithAnimatable:value:key:", v17, 9, *(double *)vdupq_lane_s32(v36, 0).i64);

              LODWORD(v66) = 1062557008;
              -[NUNIAnimation setDuration:](v65, "setDuration:", v66);
              -[NUNIScene addAnimation:](v89, "addAnimation:", v65);
              v14 = v65;
              goto LABEL_40;
            }
            objc_msgSend(v17, "setAngle:", v56);
            objc_msgSend(v17, "setDistance:", v92);
            objc_msgSend(v17, "opacity");
            v36.i32[0] = 1.0;
            if (*(float *)&v35 != 1.0)
              goto LABEL_39;
LABEL_40:
            ++v16;
          }
          while (v13 != v16);
          v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v104, 16);
          v13 = v67;
          if (!v67)
            goto LABEL_68;
        }
      }
LABEL_67:
      v14 = 0;
      goto LABEL_68;
    }
    v97 = 0u;
    v98 = 0u;
    v95 = 0u;
    v96 = 0u;
    -[NUNIScene spheroids](v89, "spheroids");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
    if (!v68)
      goto LABEL_67;
    v69 = v68;
    v14 = 0;
    v70 = *(_QWORD *)v96;
    v71 = 0x24CFD6000uLL;
    do
    {
      for (i = 0; i != v69; ++i)
      {
        if (*(_QWORD *)v96 != v70)
          objc_enumerationMutation(obj);
        v73 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
        v74 = objc_msgSend(v73, "type");
        v76 = v74;
        if (v74 == 4)
          *(float *)&v75 = 0.000001;
        else
          *(float *)&v75 = 1.0;
        v93 = v75;
        objc_msgSend(v73, "radiusScale");
        if (*(float *)&v77 != *(float *)&v93)
        {
          if (v4)
          {
            v78 = v71;
            v79 = (NUNIAnimation *)objc_msgSend(objc_alloc(*(Class *)(v71 + 3664)), "initWithAnimatable:value:key:", v73, 7, *(double *)vdupq_lane_s32(*(int32x2_t *)&v93, 0).i64);

            LODWORD(v80) = 1054168400;
            -[NUNIAnimation setDuration:](v79, "setDuration:", v80);
            -[NUNIScene addAnimation:](v89, "addAnimation:", v79);
            v14 = v79;
            v71 = v78;
          }
          else
          {
            objc_msgSend(v73, "setRadiusScale:", v93);
          }
        }
        if (((1 << v76) & 0xFFF400) != 0)
          *(float *)&v77 = 1.0;
        else
          *(float *)&v77 = 0.0;
        v94 = v77;
        objc_msgSend(v73, "opacity");
        if (v81 != *(float *)&v94)
        {
          if (v4)
          {
            v82 = (NUNIAnimation *)objc_msgSend(objc_alloc(*(Class *)(v71 + 3664)), "initWithAnimatable:value:key:", v73, 9, *(double *)vdupq_lane_s32(*(int32x2_t *)&v94, 0).i64);

            LODWORD(v83) = 1062557008;
            -[NUNIAnimation setDuration:](v82, "setDuration:", v83);
            -[NUNIScene addAnimation:](v89, "addAnimation:", v82);
            v14 = v82;
          }
          else
          {
            objc_msgSend(v73, "setOpacity:", v94);
          }
        }
      }
      v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v103, 16);
    }
    while (v69);
LABEL_68:

  }
}

- (id)generateAnimationArrayFromVista:(unint64_t)a3 toVista:(unint64_t)a4 transitionStyle:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (a3 == a4)
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    -[NUNIAstronomyVistaView generateAnimationArrayFromVista:fromSceneBlock:toVista:toSceneBlock:transitionStyle:](self, "generateAnimationArrayFromVista:fromSceneBlock:toVista:toSceneBlock:transitionStyle:", a3, 0, a4, 0, a5, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)generateAnimationArrayFromVista:(unint64_t)a3 fromSceneBlock:(id)a4 toVista:(unint64_t)a5 toSceneBlock:(id)a6 transitionStyle:(unint64_t)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v12 = a6;
  +[NUNISceneUpdateDescription descriptionWithVista:updateBlock:](NUNISceneUpdateDescription, "descriptionWithVista:updateBlock:", a3, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[NUNISceneUpdateDescription descriptionWithVista:updateBlock:](NUNISceneUpdateDescription, "descriptionWithVista:updateBlock:", a5, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[NUNIAstronomyVistaView generateAnimationArrayFromSceneDescription:toSceneDescription:transitionStyle:](self, "generateAnimationArrayFromSceneDescription:toSceneDescription:transitionStyle:", v13, v14, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)generateAnimationArrayFromSceneDescription:(id)a3 toSceneDescription:(id)a4 transitionStyle:(unint64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  if (a5 == 1)
  {
    -[NUNIAstronomyVistaView _panAnimationArrayFromSceneDescription:toSceneDescription:](self, "_panAnimationArrayFromSceneDescription:toSceneDescription:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a5)
    {
      v11 = (void *)MEMORY[0x24BDBD1A8];
      goto LABEL_7;
    }
    -[NUNIAstronomyVistaView _zoomAnimationArrayFromSceneDescription:toSceneDescription:](self, "_zoomAnimationArrayFromSceneDescription:toSceneDescription:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
LABEL_7:

  return v11;
}

- (id)_panAnimationArrayFromSceneDescription:(id)a3 toSceneDescription:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NUNIScene *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "vista");
  v9 = objc_msgSend(v7, "vista");
  if (v8 == 2 || (v10 = v9, v9 == 2))
  {
    -[NUNIAstronomyVistaView _zoomAnimationArrayFromSceneDescription:toSceneDescription:](self, "_zoomAnimationArrayFromSceneDescription:toSceneDescription:", v6, v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = self->_scene;
    -[NUNIScene packIntoBlob](v11, "packIntoBlob");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUNIScene date](v11, "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUNIAstronomyVistaView applyVista:transitionStyle:](self, "applyVista:transitionStyle:", v8, 1);
    -[NUNIScene updateSunLocationForDate:animated:lightingPreference:adjustEarthRotation:](v11, "updateSunLocationForDate:animated:lightingPreference:adjustEarthRotation:", v13, 0, self->_preferredCarouselLighting, 1);
    objc_msgSend(v6, "updateBlock");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      (*(void (**)(uint64_t, NUNIScene *))(v14 + 16))(v14, v11);
    -[NUNIScene updateCamera](v11, "updateCamera");
    -[NUNIScene packIntoBlob](v11, "packIntoBlob");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUNIAstronomyVistaView applyVista:transitionStyle:](self, "applyVista:transitionStyle:", v10, 1);
    -[NUNIScene updateSunLocationForDate:animated:lightingPreference:adjustEarthRotation:](v11, "updateSunLocationForDate:animated:lightingPreference:adjustEarthRotation:", v13, 0, self->_preferredCarouselLighting, 1);
    objc_msgSend(v7, "updateBlock");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      (*(void (**)(uint64_t, NUNIScene *))(v17 + 16))(v17, v11);
    -[NUNIScene updateCamera](v11, "updateCamera");
    -[NUNIScene packIntoBlob](v11, "packIntoBlob");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    NUNIAstronomyVistaView_GenerateCarouselAnimationArrayFromSceneBlob(v11, v16, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUNIScene unpackFromBlob:](v11, "unpackFromBlob:", v12);

  }
  return v20;
}

- (id)_zoomAnimationArrayFromSceneDescription:(id)a3 toSceneDescription:(id)a4
{
  NUNIScene *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  void *v16;

  v7 = self->_scene;
  v8 = a4;
  v9 = a3;
  -[NUNIScene packIntoBlob](v7, "packIntoBlob");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUNIScene date](v7, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUNIAstronomyVistaView applyVista:transitionStyle:](self, "applyVista:transitionStyle:", objc_msgSend(v9, "vista"), 0);
  -[NUNIScene updateSunLocationForDate:animated:lightingPreference:adjustEarthRotation:](v7, "updateSunLocationForDate:animated:lightingPreference:adjustEarthRotation:", v11, 0, 0, 1);
  objc_msgSend(v9, "updateBlock");
  v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    ((void (**)(_QWORD, NUNIScene *))v12)[2](v12, v7);
    -[NUNIScene updateCamera](v7, "updateCamera");
  }
  -[NUNIScene packIntoBlob](v7, "packIntoBlob");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUNIAstronomyVistaView applyVista:transitionStyle:](self, "applyVista:transitionStyle:", objc_msgSend(v8, "vista"), 0);
  -[NUNIScene updateSunLocationForDate:animated:lightingPreference:adjustEarthRotation:](v7, "updateSunLocationForDate:animated:lightingPreference:adjustEarthRotation:", v11, 0, 0, 1);
  objc_msgSend(v8, "updateBlock");
  v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    ((void (**)(_QWORD, NUNIScene *))v14)[2](v14, v7);
    -[NUNIScene updateCamera](v7, "updateCamera");
  }
  -[NUNIScene packIntoBlob](v7, "packIntoBlob");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NUNIAstronomyVistaView_GenerateZoomAnimationArrayFromSceneBlob(v7, v13, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUNIScene unpackFromBlob:](v7, "unpackFromBlob:", v10);

  return v16;
}

- (void)applyVista:(unint64_t)a3 transitionStyle:(unint64_t)a4
{
  unint64_t v5;
  NUNIScene *v7;
  NUNIScene *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NUNIScene *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  int64x2_t v20;
  int64x2_t v21;
  uint64_t v22;
  int v23;
  float v24;
  int v25;
  float v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  float v33;
  uint64_t k;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  float v39;
  float v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  void *v46;
  int v47;
  char v48;
  float v49;
  double v50;
  float v51;
  double v52;
  unint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  self->_vista = a3;
  self->_transitionStyle = a4;
  if (a3 <= 9)
  {
    v5 = a3;
    v7 = self->_scene;
    v8 = v7;
    if (v7)
    {
      switch(v5)
      {
        case 1uLL:
          v9 = 16;
          v5 = 4;
          goto LABEL_32;
        case 2uLL:
          -[NUNIQuad renderer](self->_quad, "renderer");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "rendererStyle");

          if (v11 == 3)
          {
            v64 = 0uLL;
            v65 = 0uLL;
            v62 = 0uLL;
            v63 = 0uLL;
            -[NUNIScene spheroids](v8, "spheroids");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
            if (v13)
            {
              v14 = v13;
              v15 = v8;
              v16 = *(_QWORD *)v63;
              do
              {
                for (i = 0; i != v14; ++i)
                {
                  if (*(_QWORD *)v63 != v16)
                    objc_enumerationMutation(v12);
                  v18 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
                  v19 = objc_msgSend(v18, "structure");
                  v22 = v19;
                  v23 = *(_DWORD *)v19;
                  if (*(_DWORD *)v19 == 4)
                    v24 = 0.000001;
                  else
                    v24 = 1.0;
                  if (*(float *)(v19 + 88) != v24)
                    objc_msgSend(v18, "setRadiusScale:");
                  v25 = 1 << v23;
                  if ((v25 & 0x47FE) != 0)
                    v26 = 1.0;
                  else
                    v26 = 0.0;
                  if (*(float *)(v22 + 48) != v26)
                    objc_msgSend(v18, "setOpacity:");
                  v20.i64[0] = 0;
                  v21.i64[0] = v25 & 0x3FE;
                  objc_msgSend(v18, "setOrientation:", *(double *)vbslq_s8((int8x16_t)vdupq_lane_s64(vceqq_s64(v21, v20).i64[0], 0), (int8x16_t)xmmword_2134DBE40, (int8x16_t)xmmword_2134DBE30).i64);
                  LODWORD(v27) = 1.0;
                  objc_msgSend(v18, "setDistanceScale:", v27);
                }
                v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
              }
              while (v14);
              v8 = v15;
            }
          }
          else
          {
            v60 = 0uLL;
            v61 = 0uLL;
            v58 = 0uLL;
            v59 = 0uLL;
            -[NUNIScene spheroids](v8, "spheroids");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
            if (v42)
            {
              v43 = v42;
              v44 = *(_QWORD *)v59;
              do
              {
                for (j = 0; j != v43; ++j)
                {
                  if (*(_QWORD *)v59 != v44)
                    objc_enumerationMutation(v12);
                  v46 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
                  v47 = objc_msgSend(v46, "type");
                  v48 = v47;
                  if (v47 == 4)
                    v49 = 0.000001;
                  else
                    v49 = 1.0;
                  objc_msgSend(v46, "radiusScale");
                  if (*(float *)&v50 != v49)
                  {
                    *(float *)&v50 = v49;
                    objc_msgSend(v46, "setRadiusScale:", v50);
                  }
                  if (((1 << v48) & 0xFFF400) != 0)
                    v51 = 1.0;
                  else
                    v51 = 0.0;
                  objc_msgSend(v46, "opacity");
                  if (*(float *)&v52 != v51)
                  {
                    *(float *)&v52 = v51;
                    objc_msgSend(v46, "setOpacity:", v52);
                  }
                }
                v43 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
              }
              while (v43);
            }
          }
          v5 = 24;
          goto LABEL_52;
        case 3uLL:
          v9 = 2097280;
          v5 = 7;
          goto LABEL_32;
        case 4uLL:
          v9 = 32770;
          v5 = 1;
          goto LABEL_32;
        case 5uLL:
          v9 = 65540;
          v5 = 2;
          goto LABEL_32;
        case 6uLL:
          v9 = 524320;
          v5 = 5;
          goto LABEL_32;
        case 7uLL:
          v9 = 1048640;
          v5 = 6;
          goto LABEL_32;
        case 8uLL:
          v9 = 4194560;
          goto LABEL_32;
        case 9uLL:
          v9 = 8389120;
          goto LABEL_32;
        default:
          v9 = 131080;
          v5 = 3;
LABEL_32:
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          -[NUNIScene spheroids](v7, "spheroids");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
          if (v28)
          {
            v29 = v28;
            v53 = v5;
            v30 = *(_QWORD *)v55;
            v31 = v9 | 0x400;
            v32 = v9 & 0x3FE;
            if (a4 == 1)
              v33 = 0.0001;
            else
              v33 = 1.0;
            do
            {
              for (k = 0; k != v29; ++k)
              {
                if (*(_QWORD *)v55 != v30)
                  objc_enumerationMutation(v12);
                v35 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
                v36 = objc_msgSend(v35, "structure");
                v37 = v36;
                v38 = (1 << *(_DWORD *)v36);
                if ((v31 & v38) != 0)
                  v39 = 1.0;
                else
                  v39 = 0.000001;
                if (*(float *)(v36 + 88) != v39)
                  objc_msgSend(v35, "setRadiusScale:");
                if ((v32 & v38) != 0)
                  v40 = 1.0;
                else
                  v40 = 0.0;
                if (*(float *)(v37 + 48) != v40)
                  objc_msgSend(v35, "setOpacity:");
                objc_msgSend(v35, "setOrientation:", *(double *)&_PromotedConst);
                *(float *)&v41 = v33;
                objc_msgSend(v35, "setDistanceScale:", v41);
              }
              v29 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
            }
            while (v29);
            v5 = v53;
          }
LABEL_52:

          -[NUNIScene setSnap:](v8, "setSnap:", v5);
          break;
      }
    }

  }
}

- (void)astronomySceneAnimationFinished:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  objc_msgSend(WeakRetained, "astronomyVistaViewContentsAnimationFinished:", self);

}

- (void)quadViewWillDisplay:(id)a3 forTime:(double)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  objc_msgSend(WeakRetained, "astronomyVistaViewWillDisplay:forTime:", self, a4);

}

- (id)contentMaskLayer
{
  return self->_contentMaskLayer;
}

- (id)spheroidAtPoint:(CGPoint)a3
{
  return -[NUNIQuad spheroidAtPoint:](self->_quad, "spheroidAtPoint:", a3.x, a3.y);
}

- (void)updateLightingPreference:(BOOL)a3
{
  unint64_t v4;

  if (a3)
  {
    v4 = 0;
  }
  else
  {
    self->_preferredCarouselLighting = 1;
    if (objc_msgSend(MEMORY[0x24BEBDB00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[NUNIAstronomyVistaView semanticContentAttribute](self, "semanticContentAttribute")) != 1)return;
    v4 = 2;
  }
  self->_preferredCarouselLighting = v4;
}

- (CLKDevice)device
{
  return self->_device;
}

- (NUNIAstronomyVistaViewObserver)observer
{
  return (NUNIAstronomyVistaViewObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (NSArray)quadViews
{
  return self->_quadViews;
}

- (float)supplementalSpheroidSize
{
  return self->_supplementalSpheroidSize;
}

- (void)setSupplementalSpheroidSize:(float)a3
{
  self->_supplementalSpheroidSize = a3;
}

- (float)supplementalHorizontalInset
{
  return self->_supplementalHorizontalInset;
}

- (void)setSupplementalHorizontalInset:(float)a3
{
  self->_supplementalHorizontalInset = a3;
}

- (float)supplementalTopInset
{
  return self->_supplementalTopInset;
}

- (void)setSupplementalTopInset:(float)a3
{
  self->_supplementalTopInset = a3;
}

- (float)supplementalBottomInset
{
  return self->_supplementalBottomInset;
}

- (void)setSupplementalBottomInset:(float)a3
{
  self->_supplementalBottomInset = a3;
}

- (int64_t)frameInterval
{
  return self->_frameInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quadViews, 0);
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_portalLayer, 0);
  objc_storeStrong((id *)&self->_contentMaskLayer, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_quad, 0);
  objc_storeStrong((id *)&self->_quadView1, 0);
  objc_storeStrong((id *)&self->_quadView0, 0);
}

@end
