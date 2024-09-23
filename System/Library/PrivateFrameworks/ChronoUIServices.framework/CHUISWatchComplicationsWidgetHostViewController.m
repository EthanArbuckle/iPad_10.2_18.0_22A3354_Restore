@implementation CHUISWatchComplicationsWidgetHostViewController

- (CHUISWatchComplicationsWidgetHostViewController)initWithWidget:(id)a3 metrics:(id)a4 widgetConfigurationIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  char *v11;
  CHUISWatchComplicationsWidgetSceneClientSettingsDiffInspector *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CHUISWatchComplicationsWidgetHostViewController;
  v11 = -[CHUISWidgetHostViewController initWithWidget:metrics:widgetConfigurationIdentifier:](&v21, sel_initWithWidget_metrics_widgetConfigurationIdentifier_, v8, v9, v10);
  if (v11)
  {
    v12 = objc_alloc_init(CHUISWatchComplicationsWidgetSceneClientSettingsDiffInspector);
    v13 = (void *)*((_QWORD *)v11 + 175);
    *((_QWORD *)v11 + 175) = v12;

    *((_QWORD *)v11 + 179) = 0;
    v14 = (void *)*((_QWORD *)v11 + 181);
    *((_QWORD *)v11 + 181) = 0;

    v15 = (void *)*((_QWORD *)v11 + 182);
    *((_QWORD *)v11 + 182) = 0;

    *(_OWORD *)(v11 + 1464) = *MEMORY[0x1E0C9D538];
    v11[1424] = 1;
    v11[1425] = 0;
    objc_initWeak(&location, v11);
    v16 = (void *)*((_QWORD *)v11 + 175);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __104__CHUISWatchComplicationsWidgetHostViewController_initWithWidget_metrics_widgetConfigurationIdentifier___block_invoke;
    v18[3] = &unk_1E6B84BE0;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v16, "observeCurvedTextAngularWidthWithBlock:", v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return (CHUISWatchComplicationsWidgetHostViewController *)v11;
}

void __104__CHUISWatchComplicationsWidgetHostViewController_initWithWidget_metrics_widgetConfigurationIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "watchComplicationsDelegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "curvedLabelAngularWidthChanged");

    WeakRetained = v3;
  }

}

- (void)_translateCurvedLabelMetrics
{
  CHUISWatchComplicationsCurvedLabelMetrics *v3;
  _BOOL8 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  unint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  CHUISWatchComplicationsCurvedLabelMetrics *v24;
  CHUISWatchComplicationsCurvedLabelMetrics *complicationsCurvedLabelMetrics;
  id v26;

  v3 = [CHUISWatchComplicationsCurvedLabelMetrics alloc];
  v4 = -[CHSWatchComplicationsCurvedLabelMetrics interior](self->_curvedLabelMetrics, "interior");
  -[CHSWatchComplicationsCurvedLabelMetrics tracking](self->_curvedLabelMetrics, "tracking");
  v6 = v5;
  -[CHSWatchComplicationsCurvedLabelMetrics circleCenter](self->_curvedLabelMetrics, "circleCenter");
  v8 = v7;
  v10 = v9;
  -[CHSWatchComplicationsCurvedLabelMetrics circleRadius](self->_curvedLabelMetrics, "circleRadius");
  v12 = v11;
  -[CHSWatchComplicationsCurvedLabelMetrics maximumAngularWidth](self->_curvedLabelMetrics, "maximumAngularWidth");
  v14 = v13;
  -[CHSWatchComplicationsCurvedLabelMetrics centerAngle](self->_curvedLabelMetrics, "centerAngle");
  v16 = v15;
  -[CHSWatchComplicationsCurvedLabelMetrics fontSize](self->_curvedLabelMetrics, "fontSize");
  v18 = v17;
  -[CHSWatchComplicationsCurvedLabelMetrics textColor](self->_curvedLabelMetrics, "textColor");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v19 = -[CHSWatchComplicationsCurvedLabelMetrics accessoryPlacement](self->_curvedLabelMetrics, "accessoryPlacement");
  -[CHSWatchComplicationsCurvedLabelMetrics accessoryPadding](self->_curvedLabelMetrics, "accessoryPadding");
  v21 = v20;
  -[CHSWatchComplicationsCurvedLabelMetrics accessoryMaxSize](self->_curvedLabelMetrics, "accessoryMaxSize");
  v24 = -[CHUISWatchComplicationsCurvedLabelMetrics initWithInterior:tracking:circleCenter:circleRadius:maximumAngularWidth:centerAngle:fontSize:textColor:accessoryPlacement:accessoryPadding:accessoryMaxSize:](v3, "initWithInterior:tracking:circleCenter:circleRadius:maximumAngularWidth:centerAngle:fontSize:textColor:accessoryPlacement:accessoryPadding:accessoryMaxSize:", v4, v26, v19, v6, v8, v10, v12, v14, v16, v18, v21, v22, v23);
  complicationsCurvedLabelMetrics = self->_complicationsCurvedLabelMetrics;
  self->_complicationsCurvedLabelMetrics = v24;

}

- (void)setCornerPosition:(int64_t)a3
{
  _QWORD v3[5];

  if (self->_cornerPosition != a3)
  {
    self->_cornerPosition = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __69__CHUISWatchComplicationsWidgetHostViewController_setCornerPosition___block_invoke;
    v3[3] = &__block_descriptor_40_e78___UIApplicationSceneTransitionContext_16__0__CHUISMutableWidgetSceneSettings_8l;
    v3[4] = a3;
    -[CHUISWidgetHostViewController modifySceneSettings:](self, "modifySceneSettings:", v3);
  }
}

uint64_t __69__CHUISWatchComplicationsWidgetHostViewController_setCornerPosition___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "setCornerPosition:", *(_QWORD *)(a1 + 32));
  return 0;
}

- (void)setCurvedLabelMetrics:(id)a3
{
  id v5;
  _QWORD v6[5];

  v5 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_curvedLabelMetrics, a3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __73__CHUISWatchComplicationsWidgetHostViewController_setCurvedLabelMetrics___block_invoke;
    v6[3] = &unk_1E6B84C28;
    v6[4] = self;
    -[CHUISWidgetHostViewController modifySceneSettings:](self, "modifySceneSettings:", v6, v5);
  }

}

uint64_t __73__CHUISWatchComplicationsWidgetHostViewController_setCurvedLabelMetrics___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "setCurvedLabelMetrics:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1448));
  return 0;
}

- (void)setComplicationsCurvedLabelMetrics:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_complicationsCurvedLabelMetrics, a3);
  v5 = (void *)objc_msgSend(v6, "copy");
  -[CHUISWatchComplicationsWidgetHostViewController setCurvedLabelMetrics:](self, "setCurvedLabelMetrics:", v5);

}

- (void)setBezelContentCenter:(CGPoint)a3
{
  _QWORD v4[4];
  CGPoint v5;

  if (self->_bezelContentCenter.x != a3.x || self->_bezelContentCenter.y != a3.y)
  {
    self->_bezelContentCenter = a3;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __73__CHUISWatchComplicationsWidgetHostViewController_setBezelContentCenter___block_invoke;
    v4[3] = &__block_descriptor_48_e78___UIApplicationSceneTransitionContext_16__0__CHUISMutableWidgetSceneSettings_8l;
    v5 = a3;
    -[CHUISWidgetHostViewController modifySceneSettings:](self, "modifySceneSettings:", v4);
  }
}

uint64_t __73__CHUISWatchComplicationsWidgetHostViewController_setBezelContentCenter___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "setBezelContentCenter:", *(double *)(a1 + 32), *(double *)(a1 + 40));
  return 0;
}

- (void)setIncludeAccessoryViews:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  if (self->_includeAccessoryViews != a3)
  {
    self->_includeAccessoryViews = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __76__CHUISWatchComplicationsWidgetHostViewController_setIncludeAccessoryViews___block_invoke;
    v3[3] = &__block_descriptor_33_e78___UIApplicationSceneTransitionContext_16__0__CHUISMutableWidgetSceneSettings_8l;
    v4 = a3;
    -[CHUISWidgetHostViewController modifySceneSettings:](self, "modifySceneSettings:", v3);
  }
}

uint64_t __76__CHUISWatchComplicationsWidgetHostViewController_setIncludeAccessoryViews___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "setIncludeAccessoryViews:", *(unsigned __int8 *)(a1 + 32));
  return 0;
}

- (void)setGenerateSnapshotMetadata:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  if (self->_generateSnapshotMetadata != a3)
  {
    self->_generateSnapshotMetadata = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __79__CHUISWatchComplicationsWidgetHostViewController_setGenerateSnapshotMetadata___block_invoke;
    v3[3] = &__block_descriptor_33_e78___UIApplicationSceneTransitionContext_16__0__CHUISMutableWidgetSceneSettings_8l;
    v4 = a3;
    -[CHUISWidgetHostViewController modifySceneSettings:](self, "modifySceneSettings:", v3);
  }
}

uint64_t __79__CHUISWatchComplicationsWidgetHostViewController_setGenerateSnapshotMetadata___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "setGenerateSnapshotMetadata:", *(unsigned __int8 *)(a1 + 32));
  return 0;
}

- (int64_t)position
{
  return self->_cornerPosition;
}

- (double)curvedTextAngularWidth
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  double v7;
  double v8;

  -[CHUISWidgetHostViewController clientSettings](self, "clientSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v6, "curvedTextAngularWidth");
  v8 = v7;

  return v8;
}

- (CHUISWatchComplicationsWidgetSnapshotMetadata)snapshotMetadata
{
  return self->_snapshotMetadata;
}

- (void)setShouldReceiveWatchGestureInteractions:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  BSDispatchQueueAssertMain();
  if (self->_shouldReceiveWatchGestureInteractions != v3)
  {
    self->_shouldReceiveWatchGestureInteractions = v3;
    -[CHUISWatchComplicationsWidgetHostViewController updateWatchGestureInteraction](self, "updateWatchGestureInteraction");
  }
}

- (id)sceneSpecification
{
  return (id)objc_opt_new();
}

- (void)willModifySceneSettings:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHUISWatchComplicationsWidgetHostViewController;
  -[CHUISWidgetHostViewController willModifySceneSettings:](&v9, sel_willModifySceneSettings_, v4);
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v8, "setRemoteViewControllerClassName:", CFSTR("ChronoCore.WatchComplicationsWidgetSceneContentViewController"));
  objc_msgSend(v8, "setCornerPosition:", self->_cornerPosition);
  objc_msgSend(v8, "setCurvedLabelMetrics:", self->_curvedLabelMetrics);
  objc_msgSend(v8, "setBezelContentCenter:", self->_bezelContentCenter.x, self->_bezelContentCenter.y);
  objc_msgSend(v8, "setIncludeAccessoryViews:", self->_includeAccessoryViews);
  objc_msgSend(v8, "setGenerateSnapshotMetadata:", self->_generateSnapshotMetadata);

}

- (void)willModifySceneClientSettings:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHUISWatchComplicationsWidgetHostViewController;
  -[CHUISWidgetHostViewController willModifySceneClientSettings:](&v3, sel_willModifySceneClientSettings_, a3);
}

- (void)sceneDidUpdateClientSettingsWithDiff:(id)a3 oldClientSettings:(id)a4 newClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CHUISWidgetSceneClientSettingsDiffContext *v14;
  objc_super v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CHUISWatchComplicationsWidgetHostViewController;
  -[CHUISWidgetHostViewController sceneDidUpdateClientSettingsWithDiff:oldClientSettings:newClientSettings:transitionContext:](&v15, sel_sceneDidUpdateClientSettingsWithDiff_oldClientSettings_newClientSettings_transitionContext_, v10, v11, v12, v13);
  v14 = -[CHUISWidgetSceneClientSettingsDiffContext initWithPreviousClientSettings:currentClientSettings:transitionContext:]([CHUISWidgetSceneClientSettingsDiffContext alloc], "initWithPreviousClientSettings:currentClientSettings:transitionContext:", v11, v12, v13);
  -[CHUISWidgetSceneClientSettingsDiffInspector inspectDiff:withContext:](self->_clientSettingsDiffInspector, "inspectDiff:withContext:", v10, v14);

}

- (id)additionalSnapshotPresentationContext
{
  void *v3;
  __CFString *v4;
  uint64_t v5;
  CHSWatchComplicationsCurvedLabelMetrics *curvedLabelMetrics;
  void *v7;
  uint64_t v8;
  double y;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CHUISWatchComplicationsWidgetHostViewController;
  -[CHUISWidgetHostViewController additionalSnapshotPresentationContext](&v13, sel_additionalSnapshotPresentationContext);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@,"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E6B86F60;
  }
  if (self->_cornerPosition)
  {
    -[__CFString stringByAppendingFormat:](v4, "stringByAppendingFormat:", CFSTR("pos=%d"), self->_cornerPosition);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v5;
  }
  curvedLabelMetrics = self->_curvedLabelMetrics;
  if (curvedLabelMetrics)
  {
    -[CHSWatchComplicationsCurvedLabelMetrics description](curvedLabelMetrics, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v4, "stringByAppendingFormat:", CFSTR(",curveMetrics=%@"), v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v8;
  }
  y = self->_bezelContentCenter.y;
  if (self->_bezelContentCenter.x != *MEMORY[0x1E0C9D538] || y != *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    -[__CFString stringByAppendingFormat:](v4, "stringByAppendingFormat:", CFSTR(",bezelCirclePos=%f-%f"), *(_QWORD *)&self->_bezelContentCenter.x, *(_QWORD *)&y);
    v11 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v11;
  }

  return v4;
}

- (id)handleActions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  CHUISWatchComplicationsWidgetSnapshotMetadata *v16;
  CHUISWatchComplicationsWidgetSnapshotMetadata *snapshotMetadata;
  void *v18;
  void *v20;
  id obj;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CHUISWatchComplicationsWidgetHostViewController;
  -[CHUISWidgetHostViewController handleActions:](&v31, sel_handleActions_, v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (id)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v20;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v5;
        else
          v10 = v22;
        objc_msgSend(v10, "addObject:", v9);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v6);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = v5;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
        objc_msgSend(v15, "metadata");
        v16 = (CHUISWatchComplicationsWidgetSnapshotMetadata *)objc_claimAutoreleasedReturnValue();
        snapshotMetadata = self->_snapshotMetadata;
        self->_snapshotMetadata = v16;

        objc_msgSend(MEMORY[0x1E0D016A8], "response");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "sendResponse:", v18);

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    }
    while (v12);
  }

  return v22;
}

- (void)sceneDidUpdateToSceneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_sceneIdentifier, a3);
  -[CHUISWatchComplicationsWidgetHostViewController updateWatchGestureInteraction](self, "updateWatchGestureInteraction");
}

- (int64_t)cornerPosition
{
  return self->_cornerPosition;
}

- (CHUISWatchComplicationsWidgetHostViewControllerDelegate)watchComplicationsDelegate
{
  return (CHUISWatchComplicationsWidgetHostViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_watchComplicationsDelegate);
}

- (void)setWatchComplicationsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_watchComplicationsDelegate, a3);
}

- (CHSWatchComplicationsCurvedLabelMetrics)curvedLabelMetrics
{
  return self->_curvedLabelMetrics;
}

- (CHUISWatchComplicationsCurvedLabelMetrics)complicationsCurvedLabelMetrics
{
  return self->_complicationsCurvedLabelMetrics;
}

- (CGPoint)bezelContentCenter
{
  double x;
  double y;
  CGPoint result;

  x = self->_bezelContentCenter.x;
  y = self->_bezelContentCenter.y;
  result.y = y;
  result.x = x;
  return result;
}

- (BOOL)includeAccessoryViews
{
  return self->_includeAccessoryViews;
}

- (BOOL)generateSnapshotMetadata
{
  return self->_generateSnapshotMetadata;
}

- (BOOL)shouldReceiveWatchGestureInteractions
{
  return self->_shouldReceiveWatchGestureInteractions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationsCurvedLabelMetrics, 0);
  objc_storeStrong((id *)&self->_curvedLabelMetrics, 0);
  objc_destroyWeak((id *)&self->_watchComplicationsDelegate);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_snapshotMetadata, 0);
  objc_storeStrong((id *)&self->_clientSettingsDiffInspector, 0);
}

@end
