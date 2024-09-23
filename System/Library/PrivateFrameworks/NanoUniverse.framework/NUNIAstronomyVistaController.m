@implementation NUNIAstronomyVistaController

- (NUNIAstronomyVistaController)initWithVistaView:(id)a3
{
  id v4;
  NUNIAstronomyVistaController *v5;
  NUNIAstronomyVistaController *v6;
  uint64_t v7;
  NUNIAstronomyRotationModel *rotationModel;
  NUNIAstronomyLocationDotConfiguration *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NUNIAstronomyVistaController;
  v5 = -[NUNIAstronomyVistaController init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_numberOfPulses = 1.0;
    v5->_pulseAnimationDuration = 1.75;
    v7 = objc_opt_new();
    rotationModel = v6->_rotationModel;
    v6->_rotationModel = (NUNIAstronomyRotationModel *)v7;

    -[NUNIAstronomyRotationModel setObserver:](v6->_rotationModel, "setObserver:", v6);
    v9 = objc_alloc_init(NUNIAstronomyLocationDotConfiguration);
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "scale");
    -[NUNIAstronomyLocationDotConfiguration setScreenScale:](v9, "setScreenScale:");

    -[NUNIAstronomyVistaController setVistaView:](v6, "setVistaView:", v4);
    v6->_isFallbackLocation = 1;
    -[NUNIAstronomyVistaController applyMode:](v6, "applyMode:", 1);
    v6->_activeModeFrameInterval = 3;

  }
  return v6;
}

- (void)setPreparedForTransitions:(BOOL)a3
{
  self->_preparedForTransitions = a3;
  -[NUNIAstronomyVistaController _updateFrameInterval](self, "_updateFrameInterval");
}

- (void)setActiveModeFrameInterval:(int64_t)a3
{
  if (self->_activeModeFrameInterval != a3)
  {
    self->_activeModeFrameInterval = a3;
    -[NUNIAstronomyVistaController _updateFrameInterval](self, "_updateFrameInterval");
  }
}

- (void)_updateFrameInterval
{
  int64_t mode;
  int64_t activeModeFrameInterval;

  mode = self->_mode;
  if (mode == 3 || mode == 1)
  {
    activeModeFrameInterval = 3;
  }
  else if (mode)
  {
    activeModeFrameInterval = 0;
  }
  else
  {
    activeModeFrameInterval = self->_activeModeFrameInterval;
  }
  -[NUNIAstronomyVistaView setFrameInterval:](self->_vistaView, "setFrameInterval:", activeModeFrameInterval);
}

- (void)prepareForTransitions
{
  void *v3;
  uint64_t v4;
  NSArray **editingVistaAnimations;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSArray *v9;

  -[NUNIAstronomyVistaController setPreparedForTransitions:](self, "setPreparedForTransitions:", 1);
  -[NUNIAstronomyVistaView scene](self->_vistaView, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUpdatable:", 0);

  v4 = 0;
  editingVistaAnimations = self->_editingVistaAnimations;
  do
  {
    v6 = v4 + 1;
    if (v4 == 9)
      v7 = 0;
    else
      v7 = v4 + 1;
    -[NUNIAstronomyVistaView generateAnimationArrayFromVista:toVista:transitionStyle:](self->_vistaView, "generateAnimationArrayFromVista:toVista:transitionStyle:", v4, v7, self->_vistaTransitionStyle);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = editingVistaAnimations[v4];
    editingVistaAnimations[v4] = (NSArray *)v8;

    ++v4;
  }
  while (v6 != 10);
}

- (void)setCacheDirectory:(id)a3
{
  -[NUNIAstronomyVistaView setCacheDirectory:](self->_vistaView, "setCacheDirectory:", a3);
}

- (void)disableCloudDataFetch:(BOOL)a3
{
  -[NUNIAstronomyVistaView disableCloudDataFetch:](self->_vistaView, "disableCloudDataFetch:", a3);
}

- (void)setVistaView:(id)a3
{
  UIPanGestureRecognizer *v5;
  UIPanGestureRecognizer *spheroidPanGesture;
  UITapGestureRecognizer *v7;
  UITapGestureRecognizer *supplementalModeDoubleTapGesture;
  UITapGestureRecognizer *v9;
  UITapGestureRecognizer *interactiveModeTapGesture;
  id v11;

  objc_storeStrong((id *)&self->_vistaView, a3);
  v11 = a3;
  v5 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD7E0]), "initWithTarget:action:", self, sel__handleSpheroidPanGesture_);
  spheroidPanGesture = self->_spheroidPanGesture;
  self->_spheroidPanGesture = v5;

  -[UIPanGestureRecognizer setMaximumNumberOfTouches:](self->_spheroidPanGesture, "setMaximumNumberOfTouches:", 1);
  v7 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__handleSupplementalModeGesture_);
  supplementalModeDoubleTapGesture = self->_supplementalModeDoubleTapGesture;
  self->_supplementalModeDoubleTapGesture = v7;

  -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_supplementalModeDoubleTapGesture, "setNumberOfTapsRequired:", 2);
  -[UITapGestureRecognizer setNumberOfTouchesRequired:](self->_supplementalModeDoubleTapGesture, "setNumberOfTouchesRequired:", 1);
  v9 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDA20]), "initWithTarget:action:", self, sel__handleInteractiveModeGesture_);
  interactiveModeTapGesture = self->_interactiveModeTapGesture;
  self->_interactiveModeTapGesture = v9;

  -[UITapGestureRecognizer setNumberOfTapsRequired:](self->_interactiveModeTapGesture, "setNumberOfTapsRequired:", 1);
  -[UITapGestureRecognizer setNumberOfTouchesRequired:](self->_interactiveModeTapGesture, "setNumberOfTouchesRequired:", 1);
  -[UITapGestureRecognizer setCancelsTouchesInView:](self->_interactiveModeTapGesture, "setCancelsTouchesInView:", 0);
  -[UITapGestureRecognizer requireGestureRecognizerToFail:](self->_interactiveModeTapGesture, "requireGestureRecognizerToFail:", self->_supplementalModeDoubleTapGesture);
  -[NUNIAstronomyVistaView addGestureRecognizer:](self->_vistaView, "addGestureRecognizer:", self->_spheroidPanGesture);
  -[NUNIAstronomyVistaView addGestureRecognizer:](self->_vistaView, "addGestureRecognizer:", self->_interactiveModeTapGesture);
  -[NUNIAstronomyVistaView addGestureRecognizer:](self->_vistaView, "addGestureRecognizer:", self->_supplementalModeDoubleTapGesture);

}

- (NUNIAstronomyVistaView)vistaView
{
  return self->_vistaView;
}

- (void)cleanUpAfterTransitions
{
  void *v3;
  uint64_t i;
  void *v5;

  -[NUNIAstronomyVistaController _applyVista:](self, "_applyVista:", self->_vista);
  -[NUNIAstronomyVistaView scene](self->_vistaView, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUpdatable:", 1);

  for (i = 24; i != 104; i += 8)
  {
    v5 = *(Class *)((char *)&self->super.isa + i);
    *(Class *)((char *)&self->super.isa + i) = 0;

  }
  -[NUNIAstronomyVistaController setPreparedForTransitions:](self, "setPreparedForTransitions:", 0);
}

- (void)setVista:(unint64_t)a3
{
  self->_vista = a3;
  -[NUNIAstronomyVistaController _applyVista:](self, "_applyVista:");
}

- (void)_applyVista:(unint64_t)a3
{
  void *v5;
  id v6;

  if (self->_vistaView)
  {
    -[NUNIAstronomyRotationModel stop](self->_rotationModel, "stop");
    -[NUNIAstronomyVistaView rotatable:](self->_vistaView, "rotatable:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[NUNIAstronomyRotationModel setRotatable:](self->_rotationModel, "setRotatable:", v6);
    if (v6)
    {
      objc_msgSend(v6, "homeCoordinate");
      objc_msgSend(v6, "setCenterCoordinate:animated:", 0);
    }
    -[NUNIAstronomyVistaView scene](self->_vistaView, "scene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllAnimations");

    -[NUNIAstronomyVistaView applyVista:transitionStyle:](self->_vistaView, "applyVista:transitionStyle:", a3, self->_vistaTransitionStyle);
  }
}

- (void)setStyleDefinition:(NUNIAegirStyleDefinition)a3
{
  _OWORD *v3;
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  id v8;
  _OWORD v9[2];

  v4 = v3;
  v5 = v3[1];
  *(_OWORD *)&self->_styleDefinition.orbit = *v3;
  *(_OWORD *)&self[1]._vistaView = v5;
  -[NUNIAstronomyVistaView scene](self->_vistaView, "scene");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4[1];
  v9[0] = *v4;
  v9[1] = v6;
  NUNIAstronomyVistaController_ApplyStyleDefinition((float32x2_t *)v9, v7, v8);
  objc_msgSend(v8, "updateCamera");

}

- (void)applyTransitionFraction:(double)a3 fromVista:(unint64_t)a4 toVista:(unint64_t)a5
{
  NSArray *v8;
  NSArray *v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  float v13;
  float v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (a4 + 1 == a5)
  {
    v8 = self->_editingVistaAnimations[a4];
  }
  else if (a5 + 1 == a4)
  {
    v8 = self->_editingVistaAnimations[a5];
    a3 = 1.0 - a3;
  }
  else
  {
    if (a4 != a5)
      return;
    v8 = self->_editingVistaAnimations[a4];
    a3 = 0.0;
    if (self->_vista != a4)
      -[NUNIAstronomyVistaController setVista:](self, "setVista:", a4);
  }
  if (v8)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v8;
    v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v12 = v10;
      v13 = a3;
      v14 = (float)(v13 * v13) * (float)((float)(v13 * -2.0) + 3.0);
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v9);
          *(float *)&v11 = v14;
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "apply:", v11, (_QWORD)v17);
        }
        while (v12 != v16);
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v12);
    }

  }
}

- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
  unint64_t vista;
  char *v6;
  char *v7;
  char *v8;
  __int128 v9;
  char *v10;
  __int128 v11;
  _OWORD v12[2];
  _OWORD v13[2];

  vista = self->_vista;
  v6 = (char *)&_NUNIGetAegirStyleDefinition_earthDefinitions;
  if (vista == 1)
    v6 = (char *)&_NUNIGetAegirStyleDefinition_lunaDefinitions;
  if (vista == 2)
    v7 = (char *)&_NUNIGetAegirStyleDefinition_orreryDefinitions;
  else
    v7 = v6;
  v8 = &v7[32 * a4];
  v9 = *((_OWORD *)v8 + 1);
  v13[0] = *(_OWORD *)v8;
  v13[1] = v9;
  v10 = &v7[32 * a5];
  v11 = *((_OWORD *)v10 + 1);
  v12[0] = *(_OWORD *)v10;
  v12[1] = v11;
  -[NUNIAstronomyVistaController applyTransitionFraction:fromStyleDefinition:toStyleDefinition:](self, "applyTransitionFraction:fromStyleDefinition:toStyleDefinition:", v13, v12, a3);
}

- (void)applyTransitionFraction:(double)a3 fromStyleDefinition:(NUNIAegirStyleDefinition)a4 toStyleDefinition:(NUNIAegirStyleDefinition)a5
{
  float32x2_t *v5;
  float32x2_t *v6;
  float32x2_t *v7;
  float32x2_t *v8;
  float v11;
  float v12;
  float32x2_t v13;
  float32x2_t v14;
  unsigned int v15;
  float v16;
  float v17;
  float v18;
  uint64_t v19;
  void *v20;
  id v21;
  float32x2_t v22[3];
  float v23;
  int v24;

  v7 = v6;
  v8 = v5;
  -[NUNIAstronomyVistaView scene](self->_vistaView, "scene", a3, *(double *)&a4.orbit, *(double *)&a5.orbit);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v11 = a3;
  v12 = (float)(v11 * v11) * (float)((float)(v11 * -2.0) + 3.0);
  v13 = vmla_n_f32(v8[1], vsub_f32(v7[1], v8[1]), v12);
  v14 = vmla_n_f32(v8[2], vsub_f32(v7[2], v8[2]), v12);
  *(float *)&v15 = v8->f32[0] + (float)(v12 * (float)(v7->f32[0] - v8->f32[0]));
  v16 = 1.0 - v12;
  v17 = v12 * v7[3].f32[0];
  v18 = v8[3].f32[0];
  v22[0] = (float32x2_t)v15;
  v22[1] = v13;
  v22[2] = v14;
  v23 = v17 + (float)(v18 * v16);
  v24 = 0;
  NUNIAstronomyVistaController_ApplyStyleDefinition(v22, v19, v21);
  -[NUNIAstronomyRotationModel rotatable](self->_rotationModel, "rotatable");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "offsetCoordinate");
  objc_msgSend(v20, "homeCoordinate");
  objc_msgSend(v20, "setCenterCoordinate:");
  objc_msgSend(v21, "updateCamera");

}

- (void)applyTransitionFraction:(double)a3 fromVista:(unint64_t)a4 fromStyleDefinition:(NUNIAegirStyleDefinition)a5 toVista:(unint64_t)a6 toStyleDefinition:(NUNIAegirStyleDefinition)a7
{
  uint64_t v7;
  __int128 *v8;
  __int128 *v9;
  uint64_t v10;
  uint64_t v14;
  __int128 v15;
  void *v16;
  __int128 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  float v23;
  float v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _QWORD aBlock[4];
  __int128 v36;
  __int128 v37;
  unint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v9 = v8;
  v10 = v7;
  v40 = *MEMORY[0x24BDAC8D0];
  v14 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __112__NUNIAstronomyVistaController_applyTransitionFraction_fromVista_fromStyleDefinition_toVista_toStyleDefinition___block_invoke;
  aBlock[3] = &__block_descriptor_72_e19_v16__0__NUNIScene_8l;
  v15 = *(_OWORD *)(a6 + 16);
  v36 = *(_OWORD *)a6;
  v37 = v15;
  v38 = a4;
  v16 = _Block_copy(aBlock);
  v31[0] = v14;
  v31[1] = 3221225472;
  v31[2] = __112__NUNIAstronomyVistaController_applyTransitionFraction_fromVista_fromStyleDefinition_toVista_toStyleDefinition___block_invoke_2;
  v31[3] = &__block_descriptor_72_e19_v16__0__NUNIScene_8l;
  v17 = v9[1];
  v32 = *v9;
  v33 = v17;
  v34 = v10;
  v18 = _Block_copy(v31);
  -[NUNIAstronomyVistaView generateAnimationArrayFromVista:fromSceneBlock:toVista:toSceneBlock:transitionStyle:](self->_vistaView, "generateAnimationArrayFromVista:fromSceneBlock:toVista:toSceneBlock:transitionStyle:", a4, v16, v10, v18, self->_vistaTransitionStyle);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v20)
  {
    v22 = v20;
    v23 = a3;
    v24 = (float)(v23 * v23) * (float)((float)(v23 * -2.0) + 3.0);
    v25 = *(_QWORD *)v28;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v28 != v25)
          objc_enumerationMutation(v19);
        *(float *)&v21 = v24;
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v26++), "apply:", v21);
      }
      while (v22 != v26);
      v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v22);
  }

}

void __112__NUNIAstronomyVistaController_applyTransitionFraction_fromVista_fromStyleDefinition_toVista_toStyleDefinition___block_invoke(uint64_t a1, void *a2)
{
  __int128 v2;
  _OWORD v3[2];

  v2 = *(_OWORD *)(a1 + 48);
  v3[0] = *(_OWORD *)(a1 + 32);
  v3[1] = v2;
  NUNIAstronomyVistaController_ApplyStyleDefinition((float32x2_t *)v3, (uint64_t)a2, a2);
}

void __112__NUNIAstronomyVistaController_applyTransitionFraction_fromVista_fromStyleDefinition_toVista_toStyleDefinition___block_invoke_2(uint64_t a1, void *a2)
{
  __int128 v2;
  _OWORD v3[2];

  v2 = *(_OWORD *)(a1 + 48);
  v3[0] = *(_OWORD *)(a1 + 32);
  v3[1] = v2;
  NUNIAstronomyVistaController_ApplyStyleDefinition((float32x2_t *)v3, (uint64_t)a2, a2);
}

- (void)startClockUpdates
{
  void *v3;
  CLKClockTimerToken *v4;
  CLKClockTimerToken *clockTimerToken;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  if (!self->_clockTimerToken)
  {
    objc_msgSend(MEMORY[0x24BDB8698], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __49__NUNIAstronomyVistaController_startClockUpdates__block_invoke;
    v6[3] = &unk_24CFD7BF0;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v3, "startUpdatesWithUpdateFrequency:withHandler:identificationLog:", 0, v6, &__block_literal_global_0);
    v4 = (CLKClockTimerToken *)objc_claimAutoreleasedReturnValue();
    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = v4;

    objc_destroyWeak(&v7);
  }
  objc_destroyWeak(&location);
}

void __49__NUNIAstronomyVistaController_startClockUpdates__block_invoke(uint64_t a1, void *a2, id *a3)
{
  id WeakRetained;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateTimeAnimated:", objc_msgSend(WeakRetained, "isPreparedForTransitions") ^ 1);

}

const __CFString *__49__NUNIAstronomyVistaController_startClockUpdates__block_invoke_13()
{
  return CFSTR("astronomy face view");
}

- (void)stopClockUpdates
{
  void *v3;
  CLKClockTimerToken *clockTimerToken;

  if (self->_clockTimerToken)
  {
    objc_msgSend(MEMORY[0x24BDB8698], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopUpdatesForToken:", self->_clockTimerToken);

    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = 0;

  }
}

- (void)updateLocation:(id)a3 fallbackLocation:(id)a4
{
  -[NUNIAstronomyVistaController updateLocation:fallbackLocation:animated:](self, "updateLocation:fallbackLocation:animated:", a3, a4, 1);
}

- (void)updateLocation:(id)a3 fallbackLocation:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  NUNIAstronomyVistaView *vistaView;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = a5;
  vistaView = self->_vistaView;
  v9 = a4;
  v10 = a3;
  -[NUNIAstronomyVistaView rotatable:](vistaView, "rotatable:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    self->_isFallbackLocation = 0;
    objc_msgSend(v10, "coordinate");
    objc_msgSend(v11, "setHomeCoordinate:");
    objc_msgSend(v10, "coordinate");
    objc_msgSend(v11, "setCenterCoordinate:");
    -[NUNIAstronomyVistaController showLocationDotAnimated:](self, "showLocationDotAnimated:", v5);
    v12 = v10;
  }
  else
  {
    self->_isFallbackLocation = 1;
    objc_msgSend(v9, "coordinate");
    objc_msgSend(v11, "setHomeCoordinate:");
    objc_msgSend(v9, "coordinate");
    objc_msgSend(v11, "setCenterCoordinate:");
    -[NUNIAstronomyVistaController hideLocationDotAnimated:](self, "hideLocationDotAnimated:", v5);
    v12 = v9;
  }
  objc_storeStrong((id *)&self->_currentLocation, v12);

  -[NUNIAstronomyVistaController updateTimeAnimated:](self, "updateTimeAnimated:", v5);
  -[NUNIAstronomyVistaController styleDefinition](self, "styleDefinition");
  -[NUNIAstronomyVistaController applyStyleDefinition:](self, "applyStyleDefinition:", &v13);

}

- (void)updateTimeAnimated:(BOOL)a3
{
  -[NUNIAstronomyVistaView updateSunLocationAnimated:](self->_vistaView, "updateSunLocationAnimated:", a3);
}

- (void)_handleSpheroidPanGesture:(id)a3
{
  id v4;
  void *v5;
  const NUNIAstronomyInteractionSettings *v6;
  unint64_t vista;
  uint64_t v8;
  uint64_t v9;
  CLLocationDegrees v10;
  CLLocationDegrees v11;
  NUNIAstronomyRotationModel *rotationModel;
  void *v13;
  float64_t v14;
  float64x2_t v15;
  void *v16;
  float64_t v17;
  float64x2_t v18;
  float32x2_t v19;
  float32x2_t v20;
  float v21;
  float recentMovement;
  float32x2_t v23;
  float latitude;
  id v25;

  v4 = a3;
  if (self->_vista == 2 || self->_overrideDate)
    goto LABEL_17;
  v25 = v4;
  -[NUNIAstronomyRotationModel rotatable](self->_rotationModel, "rotatable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[NUNIAstronomyRotationModel interactionSettings](self->_rotationModel, "interactionSettings");
  vista = self->_vista;
  if (!vista)
  {
    v8 = 0;
    goto LABEL_7;
  }
  if (vista != 2)
  {
    v8 = 1;
LABEL_7:
    -[NUNIAstronomyRotationModel setPulling:](self->_rotationModel, "setPulling:", v8);
  }
  v9 = objc_msgSend(v25, "state");
  switch(v9)
  {
    case 3:
      rotationModel = self->_rotationModel;
      objc_msgSend(v25, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "velocityInView:", v13);
      v15.f64[1] = v14;
      -[NUNIAstronomyRotationModel push:](rotationModel, "push:", COERCE_DOUBLE(vmul_f32(*(float32x2_t *)&v6->var2, vcvt_f32_f64(v15))));

      break;
    case 2:
      objc_msgSend(v25, "view");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "translationInView:", v16);
      v18.f64[1] = v17;
      v19 = vcvt_f32_f64(v18);

      v20 = vsub_f32(*(float32x2_t *)self->_previousTranslation, v19);
      v21 = sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v20, v20).i32[1]), v20.f32[0], v20.f32[0]));
      recentMovement = self->_recentMovement;
      if (recentMovement != 0.0)
        v21 = (float)(recentMovement * 0.6) + (float)(v21 * 0.4);
      self->_recentMovement = v21;
      v23 = vmul_f32(*(float32x2_t *)&v6->var0, v19);
      *(float32x2_t *)self->_previousTranslation = v19;
      latitude = self->_initialCoordinate.latitude;
      objc_msgSend(v5, "setCenterCoordinate:", NUNIAstronomyClampLatitude(v23.f32[1] + latitude), self->_initialCoordinate.longitude + v23.f32[0]);
      break;
    case 1:
      -[NUNIAstronomyRotationModel stop](self->_rotationModel, "stop");
      objc_msgSend(v5, "centerCoordinate");
      self->_initialCoordinate.latitude = v10;
      self->_initialCoordinate.longitude = v11;
      self->_recentMovement = 0.0;
      *(_QWORD *)self->_previousTranslation = 0;
      break;
  }

  v4 = v25;
LABEL_17:

}

- (void)_handleInteractiveModeGesture:(id)a3
{
  int64_t mode;
  id WeakRetained;

  if (objc_msgSend(a3, "state") == 3)
  {
    mode = self->_mode;
    if ((unint64_t)(mode - 2) >= 2)
    {
      if (mode)
        goto LABEL_7;
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "astronomyVistaControllerWillEnterInteractiveMode:", self);
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "astronomyVistaControllerWillLeaveInteractiveMode:", self);
    }

    mode = self->_mode;
LABEL_7:
    if (mode)
      -[NUNIAstronomyVistaController _updateFrameInterval](self, "_updateFrameInterval");
  }
}

- (void)_handleSupplementalModeGesture:(id)a3
{
  int64_t mode;
  id WeakRetained;

  if (objc_msgSend(a3, "state") == 3 && self->_vista == 2)
  {
    mode = self->_mode;
    switch(mode)
    {
      case 0:
        goto LABEL_6;
      case 3:
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "astronomyVistaControllerWillLeaveSupplementalMode:", self);
        goto LABEL_9;
      case 2:
LABEL_6:
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "astronomyVistaControllerWillEnterSupplementalMode:", self);
LABEL_9:

        break;
    }
  }
}

- (void)animateTransitionToMode:(int64_t)a3
{
  int64_t mode;
  void *v6;
  _OWORD v7[2];

  mode = self->_mode;
  if (mode == 1)
    -[NUNIAstronomyVistaView startAnimation](self->_vistaView, "startAnimation");
  if ((unint64_t)a3 < 2)
    goto LABEL_6;
  if (a3 == 2)
  {
    if (mode == 3)
      -[NUNIAstronomyVistaView updateSunLocationAnimated:](self->_vistaView, "updateSunLocationAnimated:", 1);
    -[UIPanGestureRecognizer setEnabled:](self->_spheroidPanGesture, "setEnabled:", 1);
    v7[0] = _NUNIAegirStyleInteractiveDefinition;
    v7[1] = unk_2134DCD38;
    -[NUNIAstronomyVistaController _animateToStyleDefinition:](self, "_animateToStyleDefinition:", v7);
  }
  else if (a3 == 3)
  {
LABEL_6:
    -[UIPanGestureRecognizer setEnabled:](self->_spheroidPanGesture, "setEnabled:", 0);
    -[NUNIAstronomyVistaView updateSunLocationAnimated:](self->_vistaView, "updateSunLocationAnimated:", 1);
    -[NUNIAstronomyVistaController _animateToStyle:](self, "_animateToStyle:", self->_style);
  }
  -[UITapGestureRecognizer setEnabled:](self->_supplementalModeDoubleTapGesture, "setEnabled:", 0);
  -[UITapGestureRecognizer setEnabled:](self->_interactiveModeTapGesture, "setEnabled:", 0);
  if (self->_vista != 2
    && !-[NUNIAstronomyRotationModel isAtHomeCoordinate](self->_rotationModel, "isAtHomeCoordinate"))
  {
    -[NUNIAstronomyRotationModel stop](self->_rotationModel, "stop");
    -[NUNIAstronomyRotationModel rotatable](self->_rotationModel, "rotatable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "homeCoordinate");
    objc_msgSend(v6, "setCenterCoordinate:animated:", 1);

  }
  -[NUNIAstronomyVistaView showSupplemental:animated:](self->_vistaView, "showSupplemental:animated:", a3 == 3, 1);
}

- (void)activeMode
{
  -[NUNIAstronomyVistaView updateSunLocationAnimated:](self->_vistaView, "updateSunLocationAnimated:", 0);
  -[UITapGestureRecognizer setEnabled:](self->_interactiveModeTapGesture, "setEnabled:", 1);
  -[UIPanGestureRecognizer setEnabled:](self->_spheroidPanGesture, "setEnabled:", 0);
  -[NUNIAstronomyVistaController showLocationDotAnimated:](self, "showLocationDotAnimated:", 0);
  -[NUNIAstronomyVistaController _updateFrameInterval](self, "_updateFrameInterval");
  -[NUNIAstronomyVistaView startAnimation](self->_vistaView, "startAnimation");
  -[NUNIAstronomyVistaController startClockUpdates](self, "startClockUpdates");
}

- (void)deactiveMode
{
  -[UITapGestureRecognizer setEnabled:](self->_interactiveModeTapGesture, "setEnabled:", 0);
  -[UITapGestureRecognizer setEnabled:](self->_supplementalModeDoubleTapGesture, "setEnabled:", 0);
  -[UIPanGestureRecognizer setEnabled:](self->_spheroidPanGesture, "setEnabled:", 0);
  if (!self->_isBacklightTransitionEnabled)
    -[NUNIAstronomyVistaController hideLocationDotAnimated:](self, "hideLocationDotAnimated:", 0);
  -[NUNIAstronomyVistaController _updateFrameInterval](self, "_updateFrameInterval");
  -[NUNIAstronomyVistaView stopAnimation](self->_vistaView, "stopAnimation");
  -[NUNIAstronomyVistaController stopClockUpdates](self, "stopClockUpdates");
}

- (void)interactiveMode
{
  -[UITapGestureRecognizer setEnabled:](self->_interactiveModeTapGesture, "setEnabled:", 1);
  -[UIPanGestureRecognizer setEnabled:](self->_spheroidPanGesture, "setEnabled:", 1);
  -[NUNIAstronomyVistaController showLocationDotAnimated:](self, "showLocationDotAnimated:", 0);
  -[NUNIAstronomyVistaController _updateFrameInterval](self, "_updateFrameInterval");
  -[NUNIAstronomyVistaView startAnimation](self->_vistaView, "startAnimation");
  -[NUNIAstronomyVistaController startClockUpdates](self, "startClockUpdates");
}

- (void)supplementalMode
{
  -[UITapGestureRecognizer setEnabled:](self->_interactiveModeTapGesture, "setEnabled:", 1);
  -[UIPanGestureRecognizer setEnabled:](self->_spheroidPanGesture, "setEnabled:", 0);
  -[NUNIAstronomyVistaController hideLocationDotAnimated:](self, "hideLocationDotAnimated:", 0);
  -[NUNIAstronomyVistaController _updateFrameInterval](self, "_updateFrameInterval");
  -[NUNIAstronomyVistaView startAnimation](self->_vistaView, "startAnimation");
  -[NUNIAstronomyVistaController startClockUpdates](self, "startClockUpdates");
}

- (void)applyMode:(int64_t)a3
{
  _OWORD v5[2];

  self->_mode = a3;
  switch(a3)
  {
    case 0:
      -[NUNIAstronomyVistaController activeMode](self, "activeMode");
      break;
    case 1:
      -[NUNIAstronomyVistaController deactiveMode](self, "deactiveMode");
      break;
    case 2:
      v5[0] = _NUNIAegirStyleInteractiveDefinition;
      v5[1] = unk_2134DCD38;
      -[NUNIAstronomyVistaController applyStyleDefinition:](self, "applyStyleDefinition:", v5);
      -[NUNIAstronomyVistaController interactiveMode](self, "interactiveMode");
      break;
    case 3:
      -[NUNIAstronomyVistaController supplementalMode](self, "supplementalMode");
      break;
    default:
      break;
  }
  -[NUNIAstronomyVistaView applyVista:transitionStyle:](self->_vistaView, "applyVista:transitionStyle:", self->_vista, self->_vistaTransitionStyle);
  -[NUNIAstronomyVistaView showSupplemental:animated:](self->_vistaView, "showSupplemental:animated:", a3 == 3, 0);
}

- (BOOL)shouldShowLocationDot
{
  return !self->_forceDisableLocationDot && !self->_isFallbackLocation && self->_vista == 0;
}

- (void)setForceDisableLocationDot:(BOOL)a3
{
  self->_forceDisableLocationDot = a3;
  if (a3)
    -[NUNIAstronomyVistaController hideLocationDotAnimated:](self, "hideLocationDotAnimated:", 0);
  else
    -[NUNIAstronomyVistaController showLocationDotAnimated:](self, "showLocationDotAnimated:", 1);
}

- (void)hideLocationDotAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _BOOL4 v6;
  NUNIAnimation *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v3 = a3;
  -[NUNIAstronomyVistaView scene](self->_vistaView, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v5;
  if (v3 && (v6 = -[NUNIAstronomyVistaController shouldShowLocationDot](self, "shouldShowLocationDot"), v5 = v12, v6))
  {
    v7 = -[NUNIAnimation initWithAnimatable:value:key:]([NUNIAnimation alloc], "initWithAnimatable:value:key:", v12, 8, 0.0);
    LODWORD(v8) = 1050253722;
    -[NUNIAnimation setDuration:](v7, "setDuration:", v8);
    objc_msgSend(v12, "addAnimation:", v7);

  }
  else
  {
    objc_msgSend(v5, "removeAllAnimationsFor:withKeys:", v5, 1792);
    LODWORD(v9) = 0;
    objc_msgSend(v12, "setLocationDotPulse:", v9);
    LODWORD(v10) = 1.0;
    objc_msgSend(v12, "setLocationDotPulseOverrideAlpha:", v10);
    LODWORD(v11) = 0;
    objc_msgSend(v12, "setLocationDotAlpha:", v11);
  }

}

- (void)setLocationDotAlpha:(double)a3
{
  _BOOL4 v5;
  double v6;
  id v7;

  -[NUNIAstronomyVistaView scene](self->_vistaView, "scene");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[NUNIAstronomyVistaController shouldShowLocationDot](self, "shouldShowLocationDot");
  *(float *)&v6 = a3;
  if (!v5)
    *(float *)&v6 = 0.0;
  objc_msgSend(v7, "setLocationDotAlpha:", v6);

}

- (void)showLocationDotAnimated:(BOOL)a3
{
  _BOOL4 v3;
  NUNIAnimation *v5;
  NUNIAnimation *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;

  v3 = a3;
  -[NUNIAstronomyVistaView scene](self->_vistaView, "scene");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[NUNIAstronomyVistaController shouldShowLocationDot](self, "shouldShowLocationDot"))
  {
    objc_msgSend(v18, "removeAllAnimationsFor:withKeys:", v18, 1792);
    LODWORD(v13) = 0;
    objc_msgSend(v18, "setLocationDotPulse:", v13);
    LODWORD(v14) = 1.0;
    objc_msgSend(v18, "setLocationDotPulseOverrideAlpha:", v14);
    LODWORD(v15) = 0;
LABEL_6:
    objc_msgSend(v18, "setLocationDotAlpha:", v15);
    goto LABEL_7;
  }
  if (!v3)
  {
    objc_msgSend(v18, "removeAllAnimationsFor:withKeys:", v18, 1792);
    LODWORD(v16) = 0;
    objc_msgSend(v18, "setLocationDotPulse:", v16);
    LODWORD(v17) = 1.0;
    objc_msgSend(v18, "setLocationDotPulseOverrideAlpha:", v17);
    LODWORD(v15) = 1.0;
    goto LABEL_6;
  }
  v5 = [NUNIAnimation alloc];
  __asm { FMOV            V0.4S, #1.0 }
  v11 = -[NUNIAnimation initWithAnimatable:value:key:](v5, "initWithAnimatable:value:key:", v18, 8, *(double *)&_Q0);
  LODWORD(v12) = 1050253722;
  -[NUNIAnimation setDuration:](v11, "setDuration:", v12);
  objc_msgSend(v18, "addAnimation:", v11);

LABEL_7:
}

- (void)pulseLocationDot
{
  NUNIAnimation *v3;
  double numberOfPulses;
  NUNIAnimation *v5;
  double pulseAnimationDuration;
  double v7;
  double v8;
  double v9;
  id v10;

  -[NUNIAstronomyVistaView scene](self->_vistaView, "scene");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (-[NUNIAstronomyVistaController shouldShowLocationDot](self, "shouldShowLocationDot"))
  {
    v3 = [NUNIAnimation alloc];
    numberOfPulses = self->_numberOfPulses;
    *(float *)&numberOfPulses = numberOfPulses;
    v5 = -[NUNIAnimation initWithAnimatable:value:key:](v3, "initWithAnimatable:value:key:", v10, 9, *(double *)vdupq_lane_s32(*(int32x2_t *)&numberOfPulses, 0).i64);
    pulseAnimationDuration = self->_pulseAnimationDuration;
    *(float *)&pulseAnimationDuration = pulseAnimationDuration;
    -[NUNIAnimation setDuration:](v5, "setDuration:", pulseAnimationDuration);
    -[NUNIAnimation setObserver:](v5, "setObserver:", self);
    objc_msgSend(v10, "addAnimation:", v5);

  }
  else
  {
    objc_msgSend(v10, "removeAllAnimationsFor:withKeys:", v10, 1792);
    LODWORD(v7) = 0;
    objc_msgSend(v10, "setLocationDotPulse:", v7);
    LODWORD(v8) = 1.0;
    objc_msgSend(v10, "setLocationDotPulseOverrideAlpha:", v8);
    LODWORD(v9) = 0;
    objc_msgSend(v10, "setLocationDotAlpha:", v9);
  }

}

- (void)stopLocationDotPulse
{
  double v2;
  double v3;
  id v4;

  -[NUNIAstronomyVistaView scene](self->_vistaView, "scene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAnimationsFor:withKeys:", v4, 1536);
  LODWORD(v2) = 0;
  objc_msgSend(v4, "setLocationDotPulse:", v2);
  LODWORD(v3) = 1.0;
  objc_msgSend(v4, "setLocationDotPulseOverrideAlpha:", v3);

}

- (void)hideLocationDotPulse
{
  NUNIAnimation *v3;
  double v4;
  id v5;

  if (-[NUNIAstronomyVistaController shouldShowLocationDot](self, "shouldShowLocationDot"))
  {
    -[NUNIAstronomyVistaController hideLocationDotAnimated:](self, "hideLocationDotAnimated:", 0);
  }
  else
  {
    -[NUNIAstronomyVistaView scene](self->_vistaView, "scene");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = -[NUNIAnimation initWithAnimatable:value:key:]([NUNIAnimation alloc], "initWithAnimatable:value:key:", v5, 10, 0.0);
    LODWORD(v4) = 1.0;
    -[NUNIAnimation setDuration:](v3, "setDuration:", v4);
    -[NUNIAnimation setObserver:](v3, "setObserver:", self);
    objc_msgSend(v5, "addAnimation:", v3);

  }
}

- (void)astronomyAnimationFinished:(id)a3
{
  id WeakRetained;
  NUNIAstronomyStyleAnimationDelegate **p_styleAnimationDelegate;
  id v6;
  id v7;

  if ((unint64_t)(objc_msgSend(a3, "key") - 8) <= 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_pulseAnimationDelegate);
    objc_msgSend(WeakRetained, "pulseAnimationDidFinish");

  }
  if (self->_isAnimatingStyleDefinition)
  {
    p_styleAnimationDelegate = &self->_styleAnimationDelegate;
    v6 = objc_loadWeakRetained((id *)p_styleAnimationDelegate);

    if (v6)
    {
      v7 = objc_loadWeakRetained((id *)p_styleAnimationDelegate);
      objc_msgSend(v7, "styleAnimationDidFinish");

    }
  }
}

- (void)applyStyle:(unint64_t)a3
{
  char *v3;
  unint64_t vista;
  char *v5;
  __int128 v6;
  _OWORD v7[2];

  self->_style = a3;
  v3 = (char *)&_NUNIGetAegirStyleDefinition_earthDefinitions;
  vista = self->_vista;
  if (vista == 1)
    v3 = (char *)&_NUNIGetAegirStyleDefinition_lunaDefinitions;
  if (vista == 2)
    v3 = (char *)&_NUNIGetAegirStyleDefinition_orreryDefinitions;
  v5 = &v3[32 * a3];
  v6 = *((_OWORD *)v5 + 1);
  v7[0] = *(_OWORD *)v5;
  v7[1] = v6;
  -[NUNIAstronomyVistaController applyStyleDefinition:](self, "applyStyleDefinition:", v7);
}

- (void)applyStyleDefinition:(NUNIAegirStyleDefinition)a3
{
  _OWORD *v3;
  _OWORD *v4;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  id v10;
  _OWORD v11[2];

  v4 = v3;
  v6 = v3[1];
  *(_OWORD *)&self->_styleDefinition.orbit = *v3;
  *(_OWORD *)&self[1]._vistaView = v6;
  -[NUNIAstronomyVistaView scene](self->_vistaView, "scene");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v4[1];
  v11[0] = *v4;
  v11[1] = v7;
  NUNIAstronomyVistaController_ApplyStyleDefinition((float32x2_t *)v11, v8, v10);
  -[NUNIAstronomyRotationModel rotatable](self->_rotationModel, "rotatable");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "homeCoordinate");
  objc_msgSend(v9, "setCenterCoordinate:");
  objc_msgSend(v10, "updateCamera");

}

- (void)_animateToStyle:(unint64_t)a3
{
  char *v3;
  unint64_t vista;
  char *v5;
  __int128 v6;
  _OWORD v7[2];

  v3 = (char *)&_NUNIGetAegirStyleDefinition_earthDefinitions;
  vista = self->_vista;
  if (vista == 1)
    v3 = (char *)&_NUNIGetAegirStyleDefinition_lunaDefinitions;
  if (vista == 2)
    v3 = (char *)&_NUNIGetAegirStyleDefinition_orreryDefinitions;
  v5 = &v3[32 * a3];
  v6 = *((_OWORD *)v5 + 1);
  v7[0] = *(_OWORD *)v5;
  v7[1] = v6;
  -[NUNIAstronomyVistaController _animateToStyleDefinition:](self, "_animateToStyleDefinition:", v7);
}

- (void)_animateToStyleDefinition:(NUNIAegirStyleDefinition)a3
{
  _OWORD *v3;
  __int128 v4;
  _OWORD v5[2];

  v4 = v3[1];
  v5[0] = *v3;
  v5[1] = v4;
  -[NUNIAstronomyVistaController animateToStyleDefinition:duration:](self, "animateToStyleDefinition:duration:", v5, COERCE_DOUBLE(__PAIR64__(DWORD1(v5[0]), 1.0)));
}

- (void)animateToStyleDefinition:(NUNIAegirStyleDefinition)a3 duration:(float)a4
{
  uint64_t v4;
  uint64_t v6;
  float32x2_t v8;
  uint64_t v9;
  void *v10;
  NUNIAnimation *v11;
  const float *v12;
  double v13;
  NUNIAnimation *v14;
  double v15;
  NUNIAnimation *v21;
  double v22;
  NUNIAnimation *v23;
  double v24;
  NUNIAnimation *v25;
  double v26;
  NUNIAnimation *v27;
  double v28;
  __int128 v29;
  double v30;
  double v31;
  id v32;

  v6 = v4;
  self->_isAnimatingStyleDefinition = 1;
  -[NUNIAstronomyVistaView scene](self->_vistaView, "scene");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  v8 = *(float32x2_t *)(v6 + 16);
  v31 = *(double *)(v6 + 8);
  v9 = -[NUNIAstronomyVistaController vista](self, "vista");
  objc_msgSend(v32, "spheroidOfType:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = [NUNIAnimation alloc];
    v12 = (const float *)(v6 + 24);
    *(_QWORD *)&v13 = vld1q_dup_f32(v12).u64[0];
    v14 = -[NUNIAnimation initWithAnimatable:value:key:](v11, "initWithAnimatable:value:key:", v10, 12, v13);
    LODWORD(v15) = a3;
    -[NUNIAnimation setDuration:](v14, "setDuration:", v15);
    objc_msgSend(v32, "addAnimation:", v14);

  }
  __asm { FMOV            V1.2S, #-15.0 }
  v30 = COERCE_DOUBLE(vbsl_s8((int8x8_t)vceqd_s64(v9, 1), (int8x8_t)v8, (int8x8_t)vmul_f32(v8, _D1)));
  v21 = [NUNIAnimation alloc];
  *(_QWORD *)&v22 = vld1q_dup_f32((const float *)v6).u64[0];
  v23 = -[NUNIAnimation initWithAnimatable:value:key:](v21, "initWithAnimatable:value:key:", v32, 5, v22);
  LODWORD(v24) = a3;
  -[NUNIAnimation setDuration:](v23, "setDuration:", v24);
  objc_msgSend(v32, "addAnimation:", v23);
  v25 = -[NUNIAnimation initWithAnimatable:value:key:]([NUNIAnimation alloc], "initWithAnimatable:value:key:", v32, 6, v31);
  LODWORD(v26) = a3;
  -[NUNIAnimation setDuration:](v25, "setDuration:", v26);
  objc_msgSend(v32, "addAnimation:", v25);
  v27 = -[NUNIAnimation initWithAnimatable:value:key:]([NUNIAnimation alloc], "initWithAnimatable:value:key:", v32, 7, v30);
  LODWORD(v28) = a3;
  -[NUNIAnimation setDuration:](v27, "setDuration:", v28);
  objc_msgSend(v32, "addAnimation:", v27);
  v29 = *(_OWORD *)(v6 + 16);
  *(_OWORD *)&self->_styleDefinition.orbit = *(_OWORD *)v6;
  *(_OWORD *)&self[1]._vistaView = v29;

}

- (id)generateAnimationToVista:(unint64_t)a3 styleDefinition:(NUNIAegirStyleDefinition)a4
{
  _OWORD *v4;
  _OWORD *v5;
  unint64_t vista;
  void *v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _OWORD v16[2];

  v5 = v4;
  vista = self->_vista;
  -[NUNIAstronomyVistaView scene](self->_vistaView, "scene", *(double *)&a4.orbit);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "packIntoBlob");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUNIAstronomyVistaController setVista:](self, "setVista:", a3);
  v11 = v5[1];
  v16[0] = *v5;
  v16[1] = v11;
  NUNIAstronomyVistaController_ApplyStyleDefinition((float32x2_t *)v16, v12, v9);
  objc_msgSend(v9, "updateCamera");
  objc_msgSend(v9, "packIntoBlob");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_vistaTransitionStyle)
    NUNIAstronomyVistaView_GenerateCarouselAnimationArrayFromSceneBlob(v9, v10, v13);
  else
    NUNIAstronomyVistaView_GenerateZoomAnimationArrayFromSceneBlob(v9, v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unpackFromBlob:", v10);
  self->_vista = vista;

  return v14;
}

- (void)animateToVista:(unint64_t)a3 styleDefinition:(NUNIAegirStyleDefinition)a4 duration:(float)a5
{
  _OWORD *v5;
  __int128 v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD v23[2];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v9 = v5[1];
  v23[0] = *v5;
  v23[1] = v9;
  -[NUNIAstronomyVistaController generateAnimationToVista:styleDefinition:](self, "generateAnimationToVista:styleDefinition:", a3, v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NUNIAstronomyVistaView scene](self->_vistaView, "scene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        LODWORD(v14) = a4;
        objc_msgSend(v18, "setDuration:", v14, (_QWORD)v19);
        objc_msgSend(v11, "addAnimation:", v18);
      }
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v15);
  }

  self->_vista = a3;
}

- (void)setOverrideDate:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[NUNIAstronomyVistaController setOverrideDate:](self, "setOverrideDate:", a3);
  -[NUNIAstronomyVistaView updateSunLocationAnimated:](self->_vistaView, "updateSunLocationAnimated:", v4);
}

- (NUNIAstronomyVistaControllerDelegate)delegate
{
  return (NUNIAstronomyVistaControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NUNIAstronomyRotationModel)rotationModel
{
  return self->_rotationModel;
}

- (UIPanGestureRecognizer)spheroidPanGesture
{
  return self->_spheroidPanGesture;
}

- (UITapGestureRecognizer)supplementalModeDoubleTapGesture
{
  return self->_supplementalModeDoubleTapGesture;
}

- (UITapGestureRecognizer)interactiveModeTapGesture
{
  return self->_interactiveModeTapGesture;
}

- (int64_t)mode
{
  return self->_mode;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (NUNIAegirStyleDefinition)styleDefinition
{
  _OWORD *v2;
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&self->_styleDefinition.orbit;
  v4 = *(_OWORD *)&self[1]._vistaView;
  *v2 = v3;
  v2[1] = v4;
  return (NUNIAegirStyleDefinition)v3;
}

- (NUNIAstronomyStyleAnimationDelegate)styleAnimationDelegate
{
  return (NUNIAstronomyStyleAnimationDelegate *)objc_loadWeakRetained((id *)&self->_styleAnimationDelegate);
}

- (void)setStyleAnimationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_styleAnimationDelegate, a3);
}

- (NUNIAstronomyPulseAnimationDelegate)pulseAnimationDelegate
{
  return (NUNIAstronomyPulseAnimationDelegate *)objc_loadWeakRetained((id *)&self->_pulseAnimationDelegate);
}

- (void)setPulseAnimationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pulseAnimationDelegate, a3);
}

- (BOOL)forceDisableLocationDot
{
  return self->_forceDisableLocationDot;
}

- (unint64_t)vista
{
  return self->_vista;
}

- (unint64_t)vistaTransitionStyle
{
  return self->_vistaTransitionStyle;
}

- (void)setVistaTransitionStyle:(unint64_t)a3
{
  self->_vistaTransitionStyle = a3;
}

- (BOOL)isBacklightTransitionEnabled
{
  return self->_isBacklightTransitionEnabled;
}

- (void)setIsBacklightTransitionEnabled:(BOOL)a3
{
  self->_isBacklightTransitionEnabled = a3;
}

- (int64_t)activeModeFrameInterval
{
  return self->_activeModeFrameInterval;
}

- (NSDate)overrideDate
{
  return self->_overrideDate;
}

- (void)setOverrideDate:(id)a3
{
  objc_storeStrong((id *)&self->_overrideDate, a3);
}

- (BOOL)isPreparedForTransitions
{
  return self->_preparedForTransitions;
}

- (CLLocation)currentLocation
{
  return self->_currentLocation;
}

- (double)numberOfPulses
{
  return self->_numberOfPulses;
}

- (void)setNumberOfPulses:(double)a3
{
  self->_numberOfPulses = a3;
}

- (double)pulseAnimationDuration
{
  return self->_pulseAnimationDuration;
}

- (void)setPulseAnimationDuration:(double)a3
{
  self->_pulseAnimationDuration = a3;
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_destroyWeak((id *)&self->_pulseAnimationDelegate);
  objc_destroyWeak((id *)&self->_styleAnimationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clockTimerToken, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_interactiveModeTapGesture, 0);
  objc_storeStrong((id *)&self->_supplementalModeDoubleTapGesture, 0);
  objc_storeStrong((id *)&self->_spheroidPanGesture, 0);
  objc_storeStrong((id *)&self->_rotationModel, 0);
  for (i = 104; i != 16; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  objc_storeStrong((id *)&self->_vistaView, 0);
}

@end
