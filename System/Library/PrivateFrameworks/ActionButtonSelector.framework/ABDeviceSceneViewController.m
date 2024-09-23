@implementation ABDeviceSceneViewController

- (void)viewDidLoad
{
  NSObject *v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  objc_super v7;
  uint8_t buf[4];
  ABDeviceSceneViewController *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)ABDeviceSceneViewController;
  -[ABDeviceSceneViewController viewDidLoad](&v7, sel_viewDidLoad);
  ABLogger();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    +[ABDeviceSceneResourceLoader sharedLoader]();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[ABDeviceSceneResourceLoader areResourcesLoaded]((_BOOL8)v4);
    v6 = CFSTR("no");
    if (v5)
      v6 = CFSTR("yes");
    *(_DWORD *)buf = 138543618;
    v9 = self;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_235E72000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@) loading the view; scene resources are ready: %{public}@",
      buf,
      0x16u);

  }
  -[ABDeviceSceneViewController _setupSceneIfNeeded](self, "_setupSceneIfNeeded");
}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ABDeviceSceneViewController;
  -[ABDeviceSceneViewController viewIsAppearing:](&v7, sel_viewIsAppearing_, a3);
  v4 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABDeviceSceneViewController setScenePresentationBarrier:](self, "setScenePresentationBarrier:", v6);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ABDeviceSceneViewController;
  -[ABDeviceSceneViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[ABDeviceSceneViewController setScenePresentationBarrier:](self, "setScenePresentationBarrier:", 0);
}

- (void)renderWithTargetTimestamp:(double)a3 duration:(double)a4 renderInputs:
{
  void *v8;
  _BOOL4 v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _OWORD v22[10];
  uint64_t v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  uint8_t buf[4];
  _QWORD *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    +[ABDeviceSceneResourceLoader sharedLoader]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ABDeviceSceneResourceLoader areResourcesLoaded]((_BOOL8)v8);

    if (v9)
    {
      v10 = *(void **)(a2 + 168);
      v23 = *(_QWORD *)(a2 + 160);
      v11 = *(_OWORD *)(a2 + 144);
      v22[8] = *(_OWORD *)(a2 + 128);
      v22[9] = v11;
      v12 = *(_OWORD *)(a2 + 80);
      v22[4] = *(_OWORD *)(a2 + 64);
      v22[5] = v12;
      v13 = *(_OWORD *)(a2 + 112);
      v22[6] = *(_OWORD *)(a2 + 96);
      v22[7] = v13;
      v14 = *(_OWORD *)(a2 + 16);
      v22[0] = *(_OWORD *)a2;
      v22[1] = v14;
      v15 = *(_OWORD *)(a2 + 48);
      v22[2] = *(_OWORD *)(a2 + 32);
      v22[3] = v15;
      v16 = v10;
      v17 = *(_QWORD *)(a2 + 176);
      v24 = v16;
      v25 = v17;
      v26 = *(_OWORD *)(a2 + 184);
      objc_msgSend(a1, "_renderWithTargetTimestamp:duration:renderInputs:", v22, a3, a4);
    }
    else if (!a1[141])
    {
      ABLogger();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v28 = a1;
        _os_log_impl(&dword_235E72000, v18, OS_LOG_TYPE_DEFAULT, "(%{public}@) view controller will initiate resource loading", buf, 0xCu);
      }

      +[ABDeviceSceneResourceLoader sharedLoader]();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ABDeviceSceneResourceLoader loadResourcesWithCompletion:]((uint64_t)v19, &__block_literal_global_0);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)a1[141];
      a1[141] = v20;

    }
  }

}

void __79__ABDeviceSceneViewController_renderWithTargetTimestamp_duration_renderInputs___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  ABLogger();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_235E72000, v3, OS_LOG_TYPE_DEFAULT, "Finished resource loading, isSuccess: %{public}@", (uint8_t *)&v5, 0xCu);

  }
}

- (void)devicePerspectiveTransform
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  float v9;
  void *v10;
  double v11;
  float v12;
  SCNMatrix4 v13;
  SCNMatrix4 v14;
  SCNMatrix4 a;
  SCNMatrix4 b;
  SCNMatrix4 m;
  SCNMatrix4 v18;
  SCNMatrix4 v19;
  SCNMatrix4 v20;

  if (a1)
  {
    objc_msgSend(a1[121], "pointOfView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    memset(&v20, 0, sizeof(v20));
    objc_msgSend(v4, "camera");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "projectionTransform");
    else
      memset(&v20, 0, sizeof(v20));

    memset(&v19, 0, sizeof(v19));
    if (v4)
      objc_msgSend(v4, "worldTransform");
    memset(&v18, 0, sizeof(v18));
    m = v19;
    SCNMatrix4Invert(&v18, &m);
    memset(&m, 0, sizeof(m));
    objc_msgSend(a1, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8 * 0.5;
    objc_msgSend(a1, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    memset(&b.m22, 0, 40);
    v12 = v11 * 0.5;
    *(_OWORD *)&b.m12 = 0u;
    b.m11 = v9;
    b.m22 = v12;
    b.m33 = -1.0;
    b.m44 = 1.0;
    a = v20;
    SCNMatrix4Mult(&m, &a, &b);

    memset(&a, 0, sizeof(a));
    v14 = v18;
    v13 = m;
    SCNMatrix4Mult(&a, &v14, &v13);
    v14 = a;
    CATransform3DFromSCNMatrix4((float32x2_t *)&v14, (float64x2_t *)a2);

  }
  else
  {
    *(_OWORD *)(a2 + 96) = 0u;
    *(_OWORD *)(a2 + 112) = 0u;
    *(_OWORD *)(a2 + 64) = 0u;
    *(_OWORD *)(a2 + 80) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)(a2 + 48) = 0u;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
}

- (CATransform3D)actionButtonPerspectiveTransform
{
  CGFloat m34;
  double v4;
  double v5;
  CGFloat v6;
  CATransform3D v7;
  CATransform3D a;
  CATransform3D v9;
  CATransform3D v10;
  CATransform3D v11;
  _OWORD v12[4];
  float64x2_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;

  if (result)
  {
    v19 = 0uLL;
    v20 = 0uLL;
    v17 = 0uLL;
    v18 = 0uLL;
    v15 = 0uLL;
    v16 = 0uLL;
    v13 = 0uLL;
    v14 = 0uLL;
    m34 = result[7].m34;
    if (m34 == 0.0)
      memset(v12, 0, sizeof(v12));
    else
      objc_msgSend(*(id *)&m34, "transform");
    CATransform3DFromSCNMatrix4((float32x2_t *)v12, &v13);
    memset(&v11, 0, sizeof(v11));
    v4 = ABDegreesToRadians(-90.0);
    CATransform3DMakeRotation(&v11, v4, 0.0, 1.0, 0.0);
    v5 = ABButtonOffsetFromDeviceCenter();
    memset(&v10, 0, sizeof(v10));
    CATransform3DMakeTranslation(&v10, v5, v6, 0.0);
    a = v11;
    v7 = v10;
    CATransform3DConcat(&v9, &a, &v7);
    *(_OWORD *)&a.m31 = v17;
    *(_OWORD *)&a.m33 = v18;
    *(_OWORD *)&a.m41 = v19;
    *(_OWORD *)&a.m43 = v20;
    *(float64x2_t *)&a.m11 = v13;
    *(_OWORD *)&a.m13 = v14;
    *(_OWORD *)&a.m21 = v15;
    *(_OWORD *)&a.m23 = v16;
    return CATransform3DConcat((CATransform3D *)a2, &v9, &a);
  }
  else
  {
    *(_OWORD *)(a2 + 96) = 0uLL;
    *(_OWORD *)(a2 + 112) = 0uLL;
    *(_OWORD *)(a2 + 64) = 0uLL;
    *(_OWORD *)(a2 + 80) = 0uLL;
    *(_OWORD *)(a2 + 32) = 0uLL;
    *(_OWORD *)(a2 + 48) = 0uLL;
    *(_OWORD *)a2 = 0uLL;
    *(_OWORD *)(a2 + 16) = 0uLL;
  }
  return result;
}

- (double)actionButtonTranslationWithPressProgress:(uint64_t)a1
{
  if (a1)
    return -(ABButtonPressDepth() * a2);
  else
    return 0.0;
}

- (double)actionButtonScreenScale
{
  if (a1)
    return ABButtonScreenScale();
  else
    return 0.0;
}

- (void)renderer:(id)a3 willRenderScene:(id)a4 atTime:(double)a5
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__ABDeviceSceneViewController_renderer_willRenderScene_atTime___block_invoke;
  block[3] = &unk_25073ED10;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __63__ABDeviceSceneViewController_renderer_willRenderScene_atTime___block_invoke(uint64_t a1)
{
  id v2;

  -[ABDeviceSceneViewController delegate](*(id **)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceSceneViewControllerWillRenderScene:", *(_QWORD *)(a1 + 32));

}

- (id)delegate
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 143);
  return WeakRetained;
}

- (void)_setupSceneIfNeeded
{
  void *v3;
  _BOOL4 v4;
  ABDeviceSceneModel *p_sceneModel;
  void *v6;
  void *v7;
  SCNView *v8;
  SCNView *sceneView;
  void *v10;
  void *v11;
  ABDeviceDisplayView *v12;
  ABDeviceDisplayView *displayView;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18[18];

  if (!self->_sceneView)
  {
    +[ABDeviceSceneResourceLoader sharedLoader]();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[ABDeviceSceneResourceLoader areResourcesLoaded]((_BOOL8)v3);

    if (v4)
    {
      p_sceneModel = &self->_sceneModel;
      +[ABDeviceSceneResourceLoader sharedLoader]();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ABDeviceSceneResourceLoader sceneModel]((uint64_t)v6, (uint64_t)v18);
      __move_assignment_8_8_s0_s8_s16_S_s24_s32_s40_s48_s56_s64_s72_t80w64((uint64_t)&self->_sceneModel, v18);

      +[ABDeviceSceneResourceLoader sharedLoader]();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ABDeviceSceneResourceLoader sceneView]((uint64_t)v7);
      v8 = (SCNView *)objc_claimAutoreleasedReturnValue();
      sceneView = self->_sceneView;
      self->_sceneView = v8;

      -[ABDeviceSceneViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addSubview:", self->_sceneView);

      -[ABDeviceSceneViewController view](self, "view");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "frame");
      -[SCNView setBounds:](self->_sceneView, "setBounds:");

      -[SCNView setAutoresizingMask:](self->_sceneView, "setAutoresizingMask:", 18);
      -[SCNView setDelegate:](self->_sceneView, "setDelegate:", self);
      v12 = (ABDeviceDisplayView *)objc_opt_new();
      displayView = self->_displayView;
      self->_displayView = v12;

      -[ABDeviceDisplayView sizeToFit](self->_displayView, "sizeToFit");
      -[ABDeviceDisplayView layer](self->_displayView, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCNNode geometry](p_sceneModel->displayNode, "geometry");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstMaterial");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "emission");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setContents:", v14);

    }
  }
}

- (void)_renderWithTargetTimestamp:(double)a3 duration:(double)a4 renderInputs:(ABDeviceSceneRenderInputs *)a5
{
  void *v7;
  void *v8;
  double lightingIntensity;
  void *v10;
  double buttonPressProgress;
  double v12;
  SCNNode *capNode;
  SCNNode *sidesNode;
  __int128 v15;
  __int128 v16;
  SCNNode *capNodeHighlight;
  __int128 v18;
  __int128 v19;
  SCNNode *sidesNodeHighlight;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  SCNNode *deviceNode;
  id v26[15];
  float32x4_t v27[4];
  SCNMatrix4 a;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  float32x4_t v33[4];
  SCNMatrix4 v34;
  SCNMatrix4 v35;
  SCNMatrix4 v36;
  SCNMatrix4 b;
  SCNMatrix4 v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  int v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  int v58;

  -[ABDeviceSceneViewController _setupSceneIfNeeded](self, "_setupSceneIfNeeded", a3, a4);
  -[SCNView pointOfView](self->_sceneView, "pointOfView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "camera");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setFocusDistance:", a5->cameraAndLight.focusDistance);
  objc_msgSend(v8, "setFocalLength:", a5->cameraAndLight.focalLength);
  objc_msgSend(v8, "setFStop:", a5->cameraAndLight.fStop);
  objc_msgSend(v8, "setApertureBladeCount:", (uint64_t)a5->cameraAndLight.apertureBladeCount);
  lightingIntensity = a5->cameraAndLight.lightingIntensity;
  -[SCNScene lightingEnvironment](self->_sceneModel.scene, "lightingEnvironment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIntensity:", lightingIntensity);

  buttonPressProgress = a5->buttonPressProgress;
  v12 = ABButtonPressDepth();
  capNode = self->_sceneModel.buttonModel.capNode;
  *(float *)&buttonPressProgress = -(v12 * buttonPressProgress);
  v51 = 0;
  v50 = 0;
  v49 = 1065353216;
  v52 = 1065353216;
  v53 = 0;
  v54 = 0;
  v55 = 1065353216;
  v56 = LODWORD(buttonPressProgress);
  v57 = 0;
  v58 = 1065353216;
  -[SCNNode setTransform:](capNode, "setTransform:", &v49);
  sidesNode = self->_sceneModel.buttonModel.sidesNode;
  v41 = 0;
  v40 = 0;
  v39 = 1065353216;
  v42 = 1065353216;
  v43 = 0;
  v44 = 0;
  v45 = 1065353216;
  v46 = LODWORD(buttonPressProgress);
  v47 = 0;
  v48 = 1065353216;
  -[SCNNode setTransform:](sidesNode, "setTransform:", &v39);
  v15 = *(_OWORD *)&self->_sceneModel.buttonModel.highlightTransform.m21;
  *(_OWORD *)&a.m11 = *(_OWORD *)&self->_sceneModel.buttonModel.highlightTransform.m11;
  *(_OWORD *)&a.m21 = v15;
  v16 = *(_OWORD *)&self->_sceneModel.buttonModel.highlightTransform.m41;
  *(_OWORD *)&a.m31 = *(_OWORD *)&self->_sceneModel.buttonModel.highlightTransform.m31;
  *(_OWORD *)&a.m41 = v16;
  *(_QWORD *)&b.m14 = 0;
  *(_QWORD *)&b.m12 = 0;
  b.m11 = 1.0;
  b.m22 = 1.0;
  *(_QWORD *)&b.m31 = 0;
  *(_QWORD *)&b.m23 = 0;
  *(_QWORD *)&b.m33 = 1065353216;
  b.m41 = *(float *)&buttonPressProgress;
  b.m43 = 0.0;
  b.m42 = 0.0;
  b.m44 = 1.0;
  SCNMatrix4Mult(&v38, &a, &b);
  capNodeHighlight = self->_sceneModel.buttonModel.capNodeHighlight;
  v36 = v38;
  -[SCNNode setTransform:](capNodeHighlight, "setTransform:", &v36);
  v18 = *(_OWORD *)&self->_sceneModel.buttonModel.highlightTransform.m21;
  *(_OWORD *)&a.m11 = *(_OWORD *)&self->_sceneModel.buttonModel.highlightTransform.m11;
  *(_OWORD *)&a.m21 = v18;
  v19 = *(_OWORD *)&self->_sceneModel.buttonModel.highlightTransform.m41;
  *(_OWORD *)&a.m31 = *(_OWORD *)&self->_sceneModel.buttonModel.highlightTransform.m31;
  *(_OWORD *)&a.m41 = v19;
  *(_QWORD *)&b.m14 = 0;
  *(_QWORD *)&b.m12 = 0;
  b.m11 = 1.0;
  b.m22 = 1.0;
  *(_QWORD *)&b.m31 = 0;
  *(_QWORD *)&b.m23 = 0;
  *(_QWORD *)&b.m33 = 1065353216;
  b.m41 = *(float *)&buttonPressProgress;
  b.m43 = 0.0;
  b.m42 = 0.0;
  b.m44 = 1.0;
  SCNMatrix4Mult(&v35, &a, &b);
  sidesNodeHighlight = self->_sceneModel.buttonModel.sidesNodeHighlight;
  v34 = v35;
  -[SCNNode setTransform:](sidesNodeHighlight, "setTransform:", &v34);
  v21 = *(_OWORD *)&a5->modelTransform.m33;
  v29 = *(_OWORD *)&a5->modelTransform.m31;
  v30 = v21;
  v22 = *(_OWORD *)&a5->modelTransform.m43;
  v31 = *(_OWORD *)&a5->modelTransform.m41;
  v32 = v22;
  v23 = *(_OWORD *)&a5->modelTransform.m13;
  *(_OWORD *)&a.m11 = *(_OWORD *)&a5->modelTransform.m11;
  *(_OWORD *)&a.m21 = v23;
  v24 = *(_OWORD *)&a5->modelTransform.m23;
  *(_OWORD *)&a.m31 = *(_OWORD *)&a5->modelTransform.m21;
  *(_OWORD *)&a.m41 = v24;
  SCNMatrix4FromCATransform3D((float64x2_t *)&a, v33);
  deviceNode = self->_sceneModel.deviceNode;
  v27[0] = v33[0];
  v27[1] = v33[1];
  v27[2] = v33[2];
  v27[3] = v33[3];
  -[SCNNode setTransform:](deviceNode, "setTransform:", v27);
  __copy_constructor_8_8_s0_s8_s16_s24_s32_s40_s48_t56w64((uint64_t)v26, (uint64_t)&self->_sceneModel.buttonModel);
  ABDeviceSceneButtonModelSetColor(v26, a5->buttonHighlight.color, a5->buttonHighlight.opacity);
  -[ABDeviceDisplayView setIslandMode:](&self->_displayView->super.super.super.isa, a5->islandMode);
  -[ABDeviceSceneViewController _subscribeToFramePresentationIfNeeded](self, "_subscribeToFramePresentationIfNeeded");

}

- (void)_subscribeToFramePresentationIfNeeded
{
  SCNView *sceneView;
  _QWORD v4[4];
  id v5;
  id location;

  if (!self->_isScenePresented)
  {
    objc_initWeak(&location, self);
    sceneView = self->_sceneView;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __68__ABDeviceSceneViewController__subscribeToFramePresentationIfNeeded__block_invoke;
    v4[3] = &unk_25073EE18;
    objc_copyWeak(&v5, &location);
    -[SCNView _addGPUFramePresentedHandler:](sceneView, "_addGPUFramePresentedHandler:", v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __68__ABDeviceSceneViewController__subscribeToFramePresentationIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didPresentFrame");

}

- (void)_didPresentFrame
{
  NSObject *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t buf[4];
  ABDeviceSceneViewController *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  ABLogger();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl(&dword_235E72000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@) did present frame", buf, 0xCu);
  }

  -[ABDeviceSceneViewController scenePresentationBarrier](self, "scenePresentationBarrier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  if (v6 <= 0.0
    || (objc_msgSend(MEMORY[0x24BDBCE60], "now"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "timeIntervalSinceReferenceDate"),
        v9 = v8 - v6,
        v7,
        v9 <= 0.2))
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__ABDeviceSceneViewController__didPresentFrame__block_invoke;
    block[3] = &unk_25073ED10;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  else
  {
    ABLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_235E72000, v10, OS_LOG_TYPE_DEFAULT, "(%{public}@) delaying scene presentation", buf, 0xCu);
    }

    -[ABDeviceSceneViewController setScenePresentationBarrier:](self, "setScenePresentationBarrier:", 0);
  }
}

uint64_t __47__ABDeviceSceneViewController__didPresentFrame__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1136) = 1;
  return result;
}

- (id)setDelegate:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 143, a2);
  return result;
}

- (BOOL)isScenePresented
{
  if (result)
    return *(_BYTE *)(result + 1136) != 0;
  return result;
}

- (NSNumber)scenePresentationBarrier
{
  return (NSNumber *)objc_getProperty(self, a2, 1152, 1);
}

- (void)setScenePresentationBarrier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scenePresentationBarrier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_resourceLoadingToken, 0);
  objc_storeStrong((id *)&self->_displayView, 0);
  __destructor_8_s0_s8_s16_S_s24_s32_s40_s48_s56_s64_s72((id *)&self->_sceneModel.scene);
  objc_storeStrong((id *)&self->_sceneView, 0);
}

@end
