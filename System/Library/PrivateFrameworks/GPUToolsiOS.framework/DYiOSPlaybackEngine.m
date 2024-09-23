@implementation DYiOSPlaybackEngine

+ (CATransform3D)_convertToCATransform3D:(SEL)a3
{
  unint64_t i;
  CATransform3D *result;

  for (i = 0; i != 16; ++i)
    *((__n64 *)&retstr->m11 + i) = GPUTools::FD::Argument::ViewAsScalarArray<double>((uint64_t)a4, i);
  return result;
}

+ (CGPoint)_convertToCGPoint:(const Argument *)a3
{
  unint64_t v4;
  __n64 v5;
  double v6;
  CGPoint result;

  v4 = GPUTools::FD::Argument::ViewAsScalarArray<double>((uint64_t)a3, 0).n64_u64[0];
  v5.n64_u64[0] = GPUTools::FD::Argument::ViewAsScalarArray<double>((uint64_t)a3, 1uLL).n64_u64[0];
  v6 = *(double *)&v4;
  result.y = v5.n64_f64[0];
  result.x = v6;
  return result;
}

- (DYiOSPlaybackEngine)initWithCaptureStore:(id)a3
{
  return -[DYiOSPlaybackEngine initWithCaptureStore:shouldCreateViewController:](self, "initWithCaptureStore:shouldCreateViewController:", a3, 1);
}

- (DYiOSPlaybackEngine)initWithCaptureStore:(id)a3 shouldCreateViewController:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  DYiOSPlaybackEngine *v7;
  DYPlaybackViewController *v8;
  UIViewController *viewController;
  CGColorSpace *DeviceRGB;
  CGColor *v11;
  void *v12;
  void *v13;
  CALayer *v14;
  CALayer *hostLayer;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CALayer *v29;
  CALayer *v30;
  DYiOSPlaybackEngine *v31;
  objc_super v33;
  CGFloat components[2];
  __int128 v35;
  uint64_t v36;
  CGRect v37;
  CGRect v38;

  v4 = a4;
  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!pthread_main_np())
    __assert_rtn("-[DYiOSPlaybackEngine initWithCaptureStore:shouldCreateViewController:]", (const char *)&unk_23C7D4249, 0, "pthread_main_np()");
  v33.receiver = self;
  v33.super_class = (Class)DYiOSPlaybackEngine;
  v7 = -[DYPlaybackEngine initWithCaptureStore:](&v33, sel_initWithCaptureStore_, v6);
  if (v7)
  {
    if (v4)
    {
      v8 = -[DYPlaybackViewController initWithNibName:bundle:]([DYPlaybackViewController alloc], "initWithNibName:bundle:", 0, 0);
      viewController = v7->_viewController;
      v7->_viewController = &v8->super;

      *(_OWORD *)components = xmmword_23C7D3E08;
      v35 = unk_23C7D3E18;
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v11 = CGColorCreate(DeviceRGB, components);
      -[UIViewController view](v7->_viewController, "view");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "layer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setBackgroundColor:", v11);

      CGColorRelease(v11);
      CGColorSpaceRelease(DeviceRGB);
      v14 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
      hostLayer = v7->_hostLayer;
      v7->_hostLayer = v14;

      -[CALayer setOpaque:](v7->_hostLayer, "setOpaque:", 1);
      objc_msgSend(MEMORY[0x24BDF6D30], "mainScreen");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "bounds");
      -[CALayer setFrame:](v7->_hostLayer, "setFrame:");

      objc_msgSend(MEMORY[0x24BDF6D30], "mainScreen");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scale");
      -[CALayer setContentsScale:](v7->_hostLayer, "setContentsScale:");

      -[UIViewController view](v7->_viewController, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "layer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addSublayer:", v7->_hostLayer);

      objc_msgSend(MEMORY[0x24BDF6D30], "mainScreen");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bounds");
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;

      v37.origin.x = v22;
      v37.origin.y = v24;
      v37.size.width = v26;
      v37.size.height = v28;
      v7->_screenCenter.x = CGRectGetWidth(v37) * 0.5;
      v38.origin.x = v22;
      v38.origin.y = v24;
      v38.size.width = v26;
      v38.size.height = v28;
      v7->_screenCenter.y = CGRectGetHeight(v38) * 0.5;
      v7->_interfaceOrientation = 1;
    }
    else
    {
      v29 = (CALayer *)objc_alloc_init(MEMORY[0x24BDE56D0]);
      v30 = v7->_hostLayer;
      v7->_hostLayer = v29;

      -[CALayer setOpaque:](v7->_hostLayer, "setOpaque:", 1);
    }
    v31 = v7;
  }

  return v7;
}

- (void)_setupLayer:(id)a3 contentRect:(CGRect)a4 contentsScale:(double)a5 properties:(id)a6 isCoreAnimationSurface:(BOOL)a7
{
  _BOOL4 v7;
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;

  v7 = a7;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v16 = a3;
  v15 = a6;
  if (v7)
    objc_msgSend(v16, "setFrame:", x, y, width, height);
  else
    objc_msgSend(v16, "setPosition:", 0.0, 0.0);
  objc_msgSend(v16, "setBounds:", x, y, width, height);
  objc_msgSend(v16, "setContentsScale:", a5);
  -[DYiOSPlaybackEngine setProperties:forLayer:](self, "setProperties:forLayer:", v15, v16);

}

- (id)createLayerWithID:(unint64_t)a3 contentRect:(CGRect)a4 contentsScale:(double)a5 properties:(id)a6 isCoreAnimationSurface:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  DYiOSPlaybackEngine *left;
  DYiOSPlaybackEngine *v18;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  double v25;
  double v26;
  double v27;
  uint64_t *v28;
  void *v29;
  _BOOL4 v30;
  _OWORD v32[8];
  _OWORD v33[16];
  id v34;
  unint64_t v35;
  unint64_t *v36;
  uint64_t *v37[6];

  v7 = a7;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v37[5] = *(uint64_t **)MEMORY[0x24BDAC8D0];
  v35 = a3;
  v15 = a6;
  if (a5 == 0.0)
    __assert_rtn("-[DYiOSPlaybackEngine createLayerWithID:contentRect:contentsScale:properties:isCoreAnimationSurface:]", (const char *)&unk_23C7D4249, 0, "contentsScale != 0.0");
  if (a3)
    goto LABEL_3;
  left = (DYiOSPlaybackEngine *)self->_layerMap.__tree_.__pair1_.__value_.__left_;
  if (!left)
    goto LABEL_3;
  do
  {
    v18 = left;
    left = (DYiOSPlaybackEngine *)left->super.super.isa;
  }
  while (left);
  if (v18 == (DYiOSPlaybackEngine *)&self->_layerMap.__tree_.__pair1_ || v18->super._playbackQueue)
  {
LABEL_3:
    -[DYiOSPlaybackEngine deleteLayer:](self, "deleteLayer:", a3);
    GPUTools::AutoCATransaction::AutoCATransaction((GPUTools::AutoCATransaction *)v37, 1, 1);
    v16 = -[DYiOSPlaybackEngine newLayer](self, "newLayer");
    v34 = v16;
    objc_msgSend(v16, "setOpaque:", 1);
    if (v35)
    {
      -[DYiOSPlaybackEngine _setupLayer:contentRect:contentsScale:properties:isCoreAnimationSurface:](self, "_setupLayer:contentRect:contentsScale:properties:isCoreAnimationSurface:", v16, v15, v7, x, y, width, height, a5);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDF6D30], "mainScreen");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setPosition:", self->_screenCenter.x, self->_screenCenter.y);
      objc_msgSend(v20, "scale");
      objc_msgSend(v16, "setContentsScale:");
      v21 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
      v33[4] = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
      v33[5] = v21;
      v22 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
      v33[6] = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
      v33[7] = v22;
      v23 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
      v33[0] = *MEMORY[0x24BDE5598];
      v33[1] = v23;
      v24 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
      v33[2] = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
      v33[3] = v24;
      -[DYiOSPlaybackEngine _applyInterfaceOrientationToTransform:](self, "_applyInterfaceOrientationToTransform:", v33);
      v32[4] = v33[12];
      v32[5] = v33[13];
      v32[6] = v33[14];
      v32[7] = v33[15];
      v32[0] = v33[8];
      v32[1] = v33[9];
      v32[2] = v33[10];
      v32[3] = v33[11];
      objc_msgSend(v16, "setTransform:", v32);
      if ((unint64_t)(self->_interfaceOrientation - 3) > 1)
      {
        objc_msgSend(v20, "bounds");
        objc_msgSend(v16, "setBounds:");
      }
      else
      {
        objc_msgSend(v20, "bounds");
        v26 = v25;
        objc_msgSend(v20, "bounds");
        objc_msgSend(v16, "setBounds:", 0.0, 0.0, v26, v27);
      }

    }
    v36 = &v35;
    v28 = std::__tree<std::__value_type<unsigned long long,CALayer * {__strong}>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,CALayer * {__strong}>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,CALayer * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t **)&self->_layerMap, &v35, (uint64_t)&std::piecewise_construct, (uint64_t **)&v36);
    objc_storeStrong((id *)v28 + 5, v16);
    v36 = (unint64_t *)&v34;
    *((_BYTE *)std::__tree<std::__value_type<CALayer * {__strong},BOOL>,std::__map_value_compare<CALayer * {__strong},std::__value_type<CALayer * {__strong},BOOL>,std::less<CALayer * {__strong}>,true>,std::allocator<std::__value_type<CALayer * {__strong},BOOL>>>::__emplace_unique_key_args<CALayer * {__strong},std::piecewise_construct_t const&,std::tuple<CALayer * const {__strong}&>,std::tuple<>>((uint64_t **)&self->_coreAnimationLayerMap, (unint64_t *)&v34, (uint64_t)&std::piecewise_construct, (id **)&v36)+ 40) = v7;
    -[CALayer addSublayer:](self->_hostLayer, "addSublayer:", v34);
    v36 = (unint64_t *)&v34;
    *((_BYTE *)std::__tree<std::__value_type<CALayer *,BOOL>,std::__map_value_compare<std::__value_type<CALayer *,BOOL>,std::__map_value_compare,std::less<std::__value_type<CALayer *,BOOL>>,true>,std::allocator<std::__map_value_compare>>::__emplace_unique_key_args<std::__value_type<CALayer *,BOOL>,std::piecewise_construct_t const&,std::tuple<CALayer * const&>,CALayer * const<>>((uint64_t **)&self->_hostLayerSublayersVisibilityMap, (unint64_t *)&v34, (uint64_t)&std::piecewise_construct, &v36)+ 40) = 0;
    -[CALayer sublayers](self->_hostLayer, "sublayers");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count") == 1;

    if (v30)
      objc_storeWeak((id *)&self->_topLayer, v34);
    v19 = v34;

    GPUTools::AutoCATransaction::~AutoCATransaction((GPUTools::AutoCATransaction *)v37);
  }
  else
  {
    v37[0] = (uint64_t *)&v35;
    v19 = (id)std::__tree<std::__value_type<unsigned long long,CALayer * {__strong}>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,CALayer * {__strong}>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,CALayer * {__strong}>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t **)&self->_layerMap, &v35, (uint64_t)&std::piecewise_construct, v37)[5];
  }

  return v19;
}

- (void)resetLayersVisibility
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  unint64_t v11;
  unint64_t *v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[CALayer sublayers](self->_hostLayer, "sublayers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        v11 = *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6);
        v12 = &v11;
        *((_BYTE *)std::__tree<std::__value_type<CALayer *,BOOL>,std::__map_value_compare<std::__value_type<CALayer *,BOOL>,std::__map_value_compare,std::less<std::__value_type<CALayer *,BOOL>>,true>,std::allocator<std::__map_value_compare>>::__emplace_unique_key_args<std::__value_type<CALayer *,BOOL>,std::piecewise_construct_t const&,std::tuple<CALayer * const&>,CALayer * const<>>((uint64_t **)&self->_hostLayerSublayersVisibilityMap, &v11, (uint64_t)&std::piecewise_construct, &v12)+ 40) = 0;
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v13, 16);
    }
    while (v4);
  }

}

- (void)prepareLayerForPresent:(id)a3
{
  id obj;
  id *p_obj;

  obj = a3;
  if (!obj)
    __assert_rtn("-[DYiOSPlaybackEngine prepareLayerForPresent:]", (const char *)&unk_23C7D4249, 0, "layer");
  p_obj = &obj;
  *((_BYTE *)std::__tree<std::__value_type<CALayer *,BOOL>,std::__map_value_compare<std::__value_type<CALayer *,BOOL>,std::__map_value_compare,std::less<std::__value_type<CALayer *,BOOL>>,true>,std::allocator<std::__map_value_compare>>::__emplace_unique_key_args<std::__value_type<CALayer *,BOOL>,std::piecewise_construct_t const&,std::tuple<CALayer * const&>,CALayer * const<>>((uint64_t **)&self->_hostLayerSublayersVisibilityMap, (unint64_t *)&obj, (uint64_t)&std::piecewise_construct, &p_obj)+ 40) = 1;
  objc_storeWeak((id *)&self->_topLayer, obj);

}

- (void)applyLayersVisibility
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  id v12;
  id *v13;
  _BYTE v14[128];
  _BYTE v15[40];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  GPUTools::AutoCATransaction::AutoCATransaction((GPUTools::AutoCATransaction *)v15, 0, 1);
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 0);
  objc_msgSend(MEMORY[0x24BDE57D8], "setAnimationDuration:", 0.15);
  -[CALayer setHidden:](self->_hostLayer, "setHidden:", 0);
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[CALayer sublayers](self->_hostLayer, "sublayers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        v12 = *(id *)(*((_QWORD *)&v8 + 1) + 8 * v6);
        v13 = &v12;
        v7 = *((_BYTE *)std::__tree<std::__value_type<CALayer *,BOOL>,std::__map_value_compare<std::__value_type<CALayer *,BOOL>,std::__map_value_compare,std::less<std::__value_type<CALayer *,BOOL>>,true>,std::allocator<std::__map_value_compare>>::__emplace_unique_key_args<std::__value_type<CALayer *,BOOL>,std::piecewise_construct_t const&,std::tuple<CALayer * const&>,CALayer * const<>>((uint64_t **)&self->_hostLayerSublayersVisibilityMap, (unint64_t *)&v12, (uint64_t)&std::piecewise_construct, &v13)+ 40) == 0;
        objc_msgSend(v12, "setHidden:", v7);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v14, 16);
    }
    while (v4);
  }

  GPUTools::AutoCATransaction::~AutoCATransaction((GPUTools::AutoCATransaction *)v15);
}

- (void)updateLayer:(id)a3 contentRect:(CGRect)a4 contentsScale:(double)a5 properties:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  double v15;
  uint64_t **v16;
  id v17;
  id *v18;
  _BYTE v19[40];
  uint64_t v20;
  CGRect v21;
  CGRect v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v20 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v17 = v13;
  v14 = a6;
  if (!v13)
    __assert_rtn("-[DYiOSPlaybackEngine updateLayer:contentRect:contentsScale:properties:]", (const char *)&unk_23C7D4249, 0, "layer");
  objc_msgSend(v13, "bounds");
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  if (!CGRectEqualToRect(v21, v22)
    || (objc_msgSend(v13, "contentsScale"), v15 != a5)
    || !-[DYiOSPlaybackEngine layerHasSameProperties:layer:](self, "layerHasSameProperties:layer:", v14, v13))
  {
    GPUTools::AutoCATransaction::AutoCATransaction((GPUTools::AutoCATransaction *)v19, 1, 1);
    if (a5 == 0.0)
      __assert_rtn("-[DYiOSPlaybackEngine updateLayer:contentRect:contentsScale:properties:]", (const char *)&unk_23C7D4249, 0, "contentsScale != 0.0");
    v18 = &v17;
    v16 = std::__tree<std::__value_type<CALayer * {__strong},BOOL>,std::__map_value_compare<CALayer * {__strong},std::__value_type<CALayer * {__strong},BOOL>,std::less<CALayer * {__strong}>,true>,std::allocator<std::__value_type<CALayer * {__strong},BOOL>>>::__emplace_unique_key_args<CALayer * {__strong},std::piecewise_construct_t const&,std::tuple<CALayer * const {__strong}&>,std::tuple<>>((uint64_t **)&self->_coreAnimationLayerMap, (unint64_t *)&v17, (uint64_t)&std::piecewise_construct, &v18);
    -[DYiOSPlaybackEngine _setupLayer:contentRect:contentsScale:properties:isCoreAnimationSurface:](self, "_setupLayer:contentRect:contentsScale:properties:isCoreAnimationSurface:", v17, v14, *((unsigned __int8 *)v16 + 40), x, y, width, height, a5);
    GPUTools::AutoCATransaction::~AutoCATransaction((GPUTools::AutoCATransaction *)v19);
  }

}

- (id)layerForID:(unint64_t)a3
{
  char *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, CALayer *>, void *>>> *p_pair1;
  unint64_t v5;
  BOOL v6;
  char **v7;

  left = (char *)self->_layerMap.__tree_.__pair1_.__value_.__left_;
  if (!left)
    return 0;
  p_pair1 = &self->_layerMap.__tree_.__pair1_;
  do
  {
    v5 = *((_QWORD *)left + 4);
    v6 = v5 >= a3;
    if (v5 >= a3)
      v7 = (char **)left;
    else
      v7 = (char **)(left + 8);
    if (v6)
      p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, CALayer *>, void *>>> *)left;
    left = *v7;
  }
  while (*v7);
  if (p_pair1 != &self->_layerMap.__tree_.__pair1_ && p_pair1[4].__value_.__left_ <= (void *)a3)
    return p_pair1[5].__value_.__left_;
  else
    return 0;
}

- (id)currentTopLayer
{
  return objc_loadWeakRetained((id *)&self->_topLayer);
}

- (void)deleteLayer:(unint64_t)a3
{
  uint64_t **p_layerMap;
  char *left;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, CALayer *>, void *>>> *p_pair1;
  unint64_t v7;
  BOOL v8;
  char **v9;

  p_layerMap = (uint64_t **)&self->_layerMap;
  left = (char *)self->_layerMap.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    p_pair1 = &self->_layerMap.__tree_.__pair1_;
    do
    {
      v7 = *((_QWORD *)left + 4);
      v8 = v7 >= a3;
      if (v7 >= a3)
        v9 = (char **)left;
      else
        v9 = (char **)(left + 8);
      if (v8)
        p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long long, CALayer *>, void *>>> *)left;
      left = *v9;
    }
    while (*v9);
    if (p_pair1 != &self->_layerMap.__tree_.__pair1_ && p_pair1[4].__value_.__left_ <= (void *)a3)
    {
      objc_msgSend(p_pair1[5].__value_.__left_, "removeFromSuperlayer");
      std::__tree<std::__value_type<CALayer * {__strong},BOOL>,std::__map_value_compare<CALayer * {__strong},std::__value_type<CALayer * {__strong},BOOL>,std::less<CALayer * {__strong}>,true>,std::allocator<std::__value_type<CALayer * {__strong},BOOL>>>::__erase_unique<CALayer * {__strong}>((uint64_t)&self->_coreAnimationLayerMap, (unint64_t *)&p_pair1[5]);
      std::__tree<std::__value_type<unsigned long long,CALayer * {__strong}>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,CALayer * {__strong}>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,CALayer * {__strong}>>>::erase(p_layerMap, (uint64_t)p_pair1);
    }
  }
}

- (void)setTransform:(const Argument *)a3 forLayerID:(unint64_t)a4 withScreenToLayerScale:(const void *)a5
{
  void *v7;
  void *v8;
  _OWORD v9[8];
  _OWORD v10[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[40];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[DYiOSPlaybackEngine layerForID:](self, "layerForID:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    GPUTools::AutoCATransaction::AutoCATransaction((GPUTools::AutoCATransaction *)v19, 1, 1);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v8 = (void *)objc_opt_class();
    if (v8)
    {
      objc_msgSend(v8, "_convertToCATransform3D:", a3);
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
    }
    v10[4] = v15;
    v10[5] = v16;
    v10[6] = v17;
    v10[7] = v18;
    v10[0] = v11;
    v10[1] = v12;
    v10[2] = v13;
    v10[3] = v14;
    -[DYiOSPlaybackEngine _applyInterfaceOrientationToTransform:](self, "_applyInterfaceOrientationToTransform:", v10);
    v9[4] = v10[12];
    v9[5] = v10[13];
    v9[6] = v10[14];
    v9[7] = v10[15];
    v9[0] = v10[8];
    v9[1] = v10[9];
    v9[2] = v10[10];
    v9[3] = v10[11];
    objc_msgSend(v7, "setTransform:", v9);
    GPUTools::AutoCATransaction::~AutoCATransaction((GPUTools::AutoCATransaction *)v19);
  }

}

- (void)setPosition:(const Argument *)a3 forLayerID:(unint64_t)a4
{
  void *v5;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  -[DYiOSPlaybackEngine layerForID:](self, "layerForID:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    GPUTools::AutoCATransaction::AutoCATransaction((GPUTools::AutoCATransaction *)v6, 1, 1);
    objc_msgSend((id)objc_opt_class(), "_convertToCGPoint:", a3);
    objc_msgSend(v5, "setPosition:");
    GPUTools::AutoCATransaction::~AutoCATransaction((GPUTools::AutoCATransaction *)v6);
  }

}

- (void)setAnchorPoint:(const Argument *)a3 forLayerID:(unint64_t)a4
{
  void *v5;
  _QWORD v6[6];

  v6[5] = *MEMORY[0x24BDAC8D0];
  -[DYiOSPlaybackEngine layerForID:](self, "layerForID:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    GPUTools::AutoCATransaction::AutoCATransaction((GPUTools::AutoCATransaction *)v6, 1, 1);
    objc_msgSend((id)objc_opt_class(), "_convertToCGPoint:", a3);
    objc_msgSend(v5, "setAnchorPoint:");
    GPUTools::AutoCATransaction::~AutoCATransaction((GPUTools::AutoCATransaction *)v6);
  }

}

- (id)newLayer
{
  -[DYiOSPlaybackEngine doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)layerHasSameProperties:(id)a3 layer:(id)a4
{
  return 1;
}

- (void)setInterfaceOrientation:(int)a3
{
  self->_interfaceOrientation = a3;
}

- (CGRect)boundsForCurrentInterfaceOrientation
{
  double v3;
  double v4;
  double v5;
  double v6;
  unint64_t v7;
  double v8;
  double v9;
  CGRect result;

  -[CALayer bounds](self->_hostLayer, "bounds");
  v7 = self->_interfaceOrientation - 3;
  if (v7 >= 2)
    v8 = v5;
  else
    v8 = v6;
  if (v7 < 2)
    v6 = v5;
  v9 = v8;
  result.size.height = v6;
  result.size.width = v9;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)defaultContentsScale
{
  double result;

  -[CALayer contentsScale](self->_hostLayer, "contentsScale");
  return result;
}

- (CATransform3D)_applyInterfaceOrientationToTransform:(SEL)a3
{
  CGFloat m32;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CATransform3D *v31;
  CATransform3D *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
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
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  CATransform3D v89;
  _OWORD v90[8];
  CATransform3D v91;
  CATransform3D v92;
  CATransform3D v93;
  CATransform3D v94;
  CATransform3D v95;
  CATransform3D v96;
  CATransform3D v97;
  CATransform3D v98;
  CATransform3D v99;
  CATransform3D v100;
  CATransform3D v101;
  _OWORD v102[8];
  CATransform3D v103;
  CATransform3D v104;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v107;
  CATransform3D v108;
  CATransform3D v109;
  CATransform3D v110;

  m32 = self[1].m32;
  switch(*(_QWORD *)&m32)
  {
    case 2:
      memset(&v110, 0, sizeof(v110));
      CATransform3DMakeRotation(&v110, 3.14159265, 0.0, 0.0, 1.0);
      memset(&v109, 0, sizeof(v109));
      CATransform3DMakeTranslation(&v109, -a4->m41, -a4->m42, 0.0);
      memset(&v108, 0, sizeof(v108));
      CATransform3DMakeTranslation(&v108, a4->m41, a4->m42, 0.0);
      v33 = *(_OWORD *)&a4->m33;
      *(_OWORD *)&v94.m31 = *(_OWORD *)&a4->m31;
      *(_OWORD *)&v94.m33 = v33;
      v34 = *(_OWORD *)&a4->m43;
      *(_OWORD *)&v94.m41 = *(_OWORD *)&a4->m41;
      *(_OWORD *)&v94.m43 = v34;
      v35 = *(_OWORD *)&a4->m13;
      *(_OWORD *)&v94.m11 = *(_OWORD *)&a4->m11;
      *(_OWORD *)&v94.m13 = v35;
      v36 = *(_OWORD *)&a4->m23;
      *(_OWORD *)&v94.m21 = *(_OWORD *)&a4->m21;
      *(_OWORD *)&v94.m23 = v36;
      v93 = v109;
      CATransform3DConcat(&v107, &v94, &v93);
      v37 = *(_OWORD *)&v107.m33;
      *(_OWORD *)&a4->m31 = *(_OWORD *)&v107.m31;
      *(_OWORD *)&a4->m33 = v37;
      v38 = *(_OWORD *)&v107.m43;
      *(_OWORD *)&a4->m41 = *(_OWORD *)&v107.m41;
      *(_OWORD *)&a4->m43 = v38;
      v39 = *(_OWORD *)&v107.m13;
      *(_OWORD *)&a4->m11 = *(_OWORD *)&v107.m11;
      *(_OWORD *)&a4->m13 = v39;
      v40 = *(_OWORD *)&v107.m23;
      *(_OWORD *)&a4->m21 = *(_OWORD *)&v107.m21;
      *(_OWORD *)&a4->m23 = v40;
      v41 = *(_OWORD *)&a4->m11;
      v42 = *(_OWORD *)&a4->m13;
      v43 = *(_OWORD *)&a4->m23;
      *(_OWORD *)&v92.m21 = *(_OWORD *)&a4->m21;
      *(_OWORD *)&v92.m23 = v43;
      *(_OWORD *)&v92.m11 = v41;
      *(_OWORD *)&v92.m13 = v42;
      v44 = *(_OWORD *)&a4->m31;
      v45 = *(_OWORD *)&a4->m33;
      v46 = *(_OWORD *)&a4->m43;
      *(_OWORD *)&v92.m41 = *(_OWORD *)&a4->m41;
      *(_OWORD *)&v92.m43 = v46;
      *(_OWORD *)&v92.m31 = v44;
      *(_OWORD *)&v92.m33 = v45;
      v91 = v110;
      CATransform3DConcat(&v107, &v92, &v91);
      v47 = *(_OWORD *)&v107.m33;
      *(_OWORD *)&a4->m31 = *(_OWORD *)&v107.m31;
      *(_OWORD *)&a4->m33 = v47;
      v48 = *(_OWORD *)&v107.m43;
      *(_OWORD *)&a4->m41 = *(_OWORD *)&v107.m41;
      *(_OWORD *)&a4->m43 = v48;
      v49 = *(_OWORD *)&v107.m13;
      *(_OWORD *)&a4->m11 = *(_OWORD *)&v107.m11;
      *(_OWORD *)&a4->m13 = v49;
      v50 = *(_OWORD *)&v107.m23;
      *(_OWORD *)&a4->m21 = *(_OWORD *)&v107.m21;
      *(_OWORD *)&a4->m23 = v50;
      v51 = *(_OWORD *)&a4->m11;
      v52 = *(_OWORD *)&a4->m13;
      v53 = *(_OWORD *)&a4->m23;
      v90[2] = *(_OWORD *)&a4->m21;
      v90[3] = v53;
      v90[0] = v51;
      v90[1] = v52;
      v54 = *(_OWORD *)&a4->m31;
      v55 = *(_OWORD *)&a4->m33;
      v56 = *(_OWORD *)&a4->m43;
      v90[6] = *(_OWORD *)&a4->m41;
      v90[7] = v56;
      v90[4] = v54;
      v90[5] = v55;
      v89 = v108;
      v31 = (CATransform3D *)v90;
      v32 = &v89;
      goto LABEL_7;
    case 3:
      memset(&v110, 0, sizeof(v110));
      CATransform3DMakeRotation(&v110, 1.57079633, 0.0, 0.0, 1.0);
      memset(&v109, 0, sizeof(v109));
      CATransform3DMakeTranslation(&v109, -a4->m41, -a4->m42, 0.0);
      memset(&v108, 0, sizeof(v108));
      CATransform3DMakeTranslation(&v108, a4->m42, a4->m41, 0.0);
      v57 = *(_OWORD *)&a4->m33;
      *(_OWORD *)&v100.m31 = *(_OWORD *)&a4->m31;
      *(_OWORD *)&v100.m33 = v57;
      v58 = *(_OWORD *)&a4->m43;
      *(_OWORD *)&v100.m41 = *(_OWORD *)&a4->m41;
      *(_OWORD *)&v100.m43 = v58;
      v59 = *(_OWORD *)&a4->m13;
      *(_OWORD *)&v100.m11 = *(_OWORD *)&a4->m11;
      *(_OWORD *)&v100.m13 = v59;
      v60 = *(_OWORD *)&a4->m23;
      *(_OWORD *)&v100.m21 = *(_OWORD *)&a4->m21;
      *(_OWORD *)&v100.m23 = v60;
      v99 = v109;
      CATransform3DConcat(&v107, &v100, &v99);
      v61 = *(_OWORD *)&v107.m33;
      *(_OWORD *)&a4->m31 = *(_OWORD *)&v107.m31;
      *(_OWORD *)&a4->m33 = v61;
      v62 = *(_OWORD *)&v107.m43;
      *(_OWORD *)&a4->m41 = *(_OWORD *)&v107.m41;
      *(_OWORD *)&a4->m43 = v62;
      v63 = *(_OWORD *)&v107.m13;
      *(_OWORD *)&a4->m11 = *(_OWORD *)&v107.m11;
      *(_OWORD *)&a4->m13 = v63;
      v64 = *(_OWORD *)&v107.m23;
      *(_OWORD *)&a4->m21 = *(_OWORD *)&v107.m21;
      *(_OWORD *)&a4->m23 = v64;
      v65 = *(_OWORD *)&a4->m11;
      v66 = *(_OWORD *)&a4->m13;
      v67 = *(_OWORD *)&a4->m21;
      *(_OWORD *)&v98.m23 = *(_OWORD *)&a4->m23;
      *(_OWORD *)&v98.m21 = v67;
      *(_OWORD *)&v98.m13 = v66;
      *(_OWORD *)&v98.m11 = v65;
      v68 = *(_OWORD *)&a4->m31;
      v69 = *(_OWORD *)&a4->m33;
      v70 = *(_OWORD *)&a4->m41;
      *(_OWORD *)&v98.m43 = *(_OWORD *)&a4->m43;
      *(_OWORD *)&v98.m41 = v70;
      *(_OWORD *)&v98.m33 = v69;
      *(_OWORD *)&v98.m31 = v68;
      v97 = v110;
      CATransform3DConcat(&v107, &v98, &v97);
      v71 = *(_OWORD *)&v107.m33;
      *(_OWORD *)&a4->m31 = *(_OWORD *)&v107.m31;
      *(_OWORD *)&a4->m33 = v71;
      v72 = *(_OWORD *)&v107.m43;
      *(_OWORD *)&a4->m41 = *(_OWORD *)&v107.m41;
      *(_OWORD *)&a4->m43 = v72;
      v73 = *(_OWORD *)&v107.m13;
      *(_OWORD *)&a4->m11 = *(_OWORD *)&v107.m11;
      *(_OWORD *)&a4->m13 = v73;
      v74 = *(_OWORD *)&v107.m23;
      *(_OWORD *)&a4->m21 = *(_OWORD *)&v107.m21;
      *(_OWORD *)&a4->m23 = v74;
      v75 = *(_OWORD *)&a4->m11;
      v76 = *(_OWORD *)&a4->m13;
      v77 = *(_OWORD *)&a4->m23;
      *(_OWORD *)&v96.m21 = *(_OWORD *)&a4->m21;
      *(_OWORD *)&v96.m23 = v77;
      *(_OWORD *)&v96.m11 = v75;
      *(_OWORD *)&v96.m13 = v76;
      v78 = *(_OWORD *)&a4->m31;
      v79 = *(_OWORD *)&a4->m33;
      v80 = *(_OWORD *)&a4->m43;
      *(_OWORD *)&v96.m41 = *(_OWORD *)&a4->m41;
      *(_OWORD *)&v96.m43 = v80;
      *(_OWORD *)&v96.m31 = v78;
      *(_OWORD *)&v96.m33 = v79;
      v95 = v108;
      v31 = &v96;
      v32 = &v95;
      goto LABEL_7;
    case 4:
      memset(&v110, 0, sizeof(v110));
      CATransform3DMakeRotation(&v110, -1.57079633, 0.0, 0.0, 1.0);
      memset(&v109, 0, sizeof(v109));
      CATransform3DMakeTranslation(&v109, -a4->m41, -a4->m42, 0.0);
      memset(&v108, 0, sizeof(v108));
      CATransform3DMakeTranslation(&v108, a4->m42, a4->m41, 0.0);
      v7 = *(_OWORD *)&a4->m33;
      *(_OWORD *)&a.m31 = *(_OWORD *)&a4->m31;
      *(_OWORD *)&a.m33 = v7;
      v8 = *(_OWORD *)&a4->m43;
      *(_OWORD *)&a.m41 = *(_OWORD *)&a4->m41;
      *(_OWORD *)&a.m43 = v8;
      v9 = *(_OWORD *)&a4->m13;
      *(_OWORD *)&a.m11 = *(_OWORD *)&a4->m11;
      *(_OWORD *)&a.m13 = v9;
      v10 = *(_OWORD *)&a4->m23;
      *(_OWORD *)&a.m21 = *(_OWORD *)&a4->m21;
      *(_OWORD *)&a.m23 = v10;
      b = v109;
      CATransform3DConcat(&v107, &a, &b);
      v11 = *(_OWORD *)&v107.m33;
      *(_OWORD *)&a4->m31 = *(_OWORD *)&v107.m31;
      *(_OWORD *)&a4->m33 = v11;
      v12 = *(_OWORD *)&v107.m43;
      *(_OWORD *)&a4->m41 = *(_OWORD *)&v107.m41;
      *(_OWORD *)&a4->m43 = v12;
      v13 = *(_OWORD *)&v107.m13;
      *(_OWORD *)&a4->m11 = *(_OWORD *)&v107.m11;
      *(_OWORD *)&a4->m13 = v13;
      v14 = *(_OWORD *)&v107.m23;
      *(_OWORD *)&a4->m21 = *(_OWORD *)&v107.m21;
      *(_OWORD *)&a4->m23 = v14;
      v15 = *(_OWORD *)&a4->m11;
      v16 = *(_OWORD *)&a4->m13;
      v17 = *(_OWORD *)&a4->m21;
      *(_OWORD *)&v104.m23 = *(_OWORD *)&a4->m23;
      *(_OWORD *)&v104.m21 = v17;
      *(_OWORD *)&v104.m13 = v16;
      *(_OWORD *)&v104.m11 = v15;
      v18 = *(_OWORD *)&a4->m31;
      v19 = *(_OWORD *)&a4->m33;
      v20 = *(_OWORD *)&a4->m41;
      *(_OWORD *)&v104.m43 = *(_OWORD *)&a4->m43;
      *(_OWORD *)&v104.m41 = v20;
      *(_OWORD *)&v104.m33 = v19;
      *(_OWORD *)&v104.m31 = v18;
      v103 = v110;
      CATransform3DConcat(&v107, &v104, &v103);
      v21 = *(_OWORD *)&v107.m33;
      *(_OWORD *)&a4->m31 = *(_OWORD *)&v107.m31;
      *(_OWORD *)&a4->m33 = v21;
      v22 = *(_OWORD *)&v107.m43;
      *(_OWORD *)&a4->m41 = *(_OWORD *)&v107.m41;
      *(_OWORD *)&a4->m43 = v22;
      v23 = *(_OWORD *)&v107.m13;
      *(_OWORD *)&a4->m11 = *(_OWORD *)&v107.m11;
      *(_OWORD *)&a4->m13 = v23;
      v24 = *(_OWORD *)&v107.m23;
      *(_OWORD *)&a4->m21 = *(_OWORD *)&v107.m21;
      *(_OWORD *)&a4->m23 = v24;
      v25 = *(_OWORD *)&a4->m11;
      v26 = *(_OWORD *)&a4->m13;
      v27 = *(_OWORD *)&a4->m21;
      v102[3] = *(_OWORD *)&a4->m23;
      v102[2] = v27;
      v102[1] = v26;
      v102[0] = v25;
      v28 = *(_OWORD *)&a4->m31;
      v29 = *(_OWORD *)&a4->m33;
      v30 = *(_OWORD *)&a4->m41;
      v102[7] = *(_OWORD *)&a4->m43;
      v102[6] = v30;
      v102[5] = v29;
      v102[4] = v28;
      v101 = v108;
      v31 = (CATransform3D *)v102;
      v32 = &v101;
LABEL_7:
      self = CATransform3DConcat(&v107, v31, v32);
      v81 = *(_OWORD *)&v107.m33;
      *(_OWORD *)&a4->m31 = *(_OWORD *)&v107.m31;
      *(_OWORD *)&a4->m33 = v81;
      v82 = *(_OWORD *)&v107.m43;
      *(_OWORD *)&a4->m41 = *(_OWORD *)&v107.m41;
      *(_OWORD *)&a4->m43 = v82;
      v83 = *(_OWORD *)&v107.m13;
      *(_OWORD *)&a4->m11 = *(_OWORD *)&v107.m11;
      *(_OWORD *)&a4->m13 = v83;
      v84 = *(_OWORD *)&v107.m23;
      *(_OWORD *)&a4->m21 = *(_OWORD *)&v107.m21;
      *(_OWORD *)&a4->m23 = v84;
      break;
  }
  v85 = *(_OWORD *)&a4->m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&a4->m31;
  *(_OWORD *)&retstr->m33 = v85;
  v86 = *(_OWORD *)&a4->m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&a4->m41;
  *(_OWORD *)&retstr->m43 = v86;
  v87 = *(_OWORD *)&a4->m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&a4->m11;
  *(_OWORD *)&retstr->m13 = v87;
  v88 = *(_OWORD *)&a4->m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&a4->m21;
  *(_OWORD *)&retstr->m23 = v88;
  return self;
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_topLayer);
  std::__tree<std::__value_type<CALayer * {__strong},BOOL>,std::__map_value_compare<CALayer * {__strong},std::__value_type<CALayer * {__strong},BOOL>,std::less<CALayer * {__strong}>,true>,std::allocator<std::__value_type<CALayer * {__strong},BOOL>>>::destroy((uint64_t)&self->_coreAnimationLayerMap, (_QWORD *)self->_coreAnimationLayerMap.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<unsigned long long,CALayer * {__strong}>,std::__map_value_compare<unsigned long long,std::__value_type<unsigned long long,CALayer * {__strong}>,std::less<unsigned long long>,true>,std::allocator<std::__value_type<unsigned long long,CALayer * {__strong}>>>::destroy((uint64_t)&self->_layerMap, (_QWORD *)self->_layerMap.__tree_.__pair1_.__value_.__left_);
  std::__tree<std::__value_type<CALayer *,BOOL>,std::__map_value_compare<std::__value_type<CALayer *,BOOL>,std::__map_value_compare,std::less<std::__value_type<CALayer *,BOOL>>,true>,std::allocator<std::__map_value_compare>>::destroy((uint64_t)&self->_hostLayerSublayersVisibilityMap, (_QWORD *)self->_hostLayerSublayersVisibilityMap.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_hostLayer, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 13) = (char *)self + 112;
  *((_QWORD *)self + 18) = 0;
  *((_QWORD *)self + 17) = 0;
  *((_QWORD *)self + 16) = (char *)self + 136;
  *((_QWORD *)self + 21) = 0;
  *((_QWORD *)self + 20) = 0;
  *((_QWORD *)self + 19) = (char *)self + 160;
  return self;
}

@end
