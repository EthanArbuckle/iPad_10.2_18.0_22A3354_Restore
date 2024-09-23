@implementation HUCameraActivityZoneCanvasView

- (HUCameraActivityZoneCanvasView)initWithFrame:(CGRect)a3
{
  HUCameraActivityZoneCanvasView *v3;
  NSMutableArray *v4;
  NSMutableArray *activityZones;
  NSMutableArray *v6;
  NSMutableArray *currentActivityZone;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  UIImageView *canvasView;
  void *v13;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  v15.receiver = self;
  v15.super_class = (Class)HUCameraActivityZoneCanvasView;
  v3 = -[HUCameraActivityZoneCanvasView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    activityZones = v3->_activityZones;
    v3->_activityZones = v4;

    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    currentActivityZone = v3->_currentActivityZone;
    v3->_currentActivityZone = v6;

    -[HUCameraActivityZoneCanvasView setClipsToBounds:](v3, "setClipsToBounds:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraActivityZoneCanvasView setBackgroundColor:](v3, "setBackgroundColor:", v8);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", v3, sel_didTap_);
    objc_msgSend(v9, "setNumberOfTapsRequired:", 1);
    -[HUCameraActivityZoneCanvasView addGestureRecognizer:](v3, "addGestureRecognizer:", v9);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", v3, sel_didPan_);
    objc_msgSend(v10, "setMaximumNumberOfTouches:", 1);
    -[HUCameraActivityZoneCanvasView addGestureRecognizer:](v3, "addGestureRecognizer:", v10);
    -[HUCameraActivityZoneCanvasView bounds](v3, "bounds");
    v17 = CGRectInset(v16, -20.0, -20.0);
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithFrame:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
    canvasView = v3->_canvasView;
    v3->_canvasView = (UIImageView *)v11;

    -[UIImageView setAutoresizingMask:](v3->_canvasView, "setAutoresizingMask:", 18);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v3->_canvasView, "setBackgroundColor:", v13);

    -[HUCameraActivityZoneCanvasView center](v3, "center");
    -[UIImageView setCenter:](v3->_canvasView, "setCenter:");
    -[UIImageView setUserInteractionEnabled:](v3->_canvasView, "setUserInteractionEnabled:", 0);
    -[HUCameraActivityZoneCanvasView addSubview:](v3, "addSubview:", v3->_canvasView);

  }
  return v3;
}

- (void)updateAfterVideoBoundsChange
{
  -[HUCameraActivityZoneCanvasView _drawTouchPoints](self, "_drawTouchPoints");
  -[HUCameraActivityZoneCanvasView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)_drawPolygonWithMaskPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HUCameraActivityZoneCanvasView activityZones](self, "activityZones");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__HUCameraActivityZoneCanvasView__drawPolygonWithMaskPath___block_invoke;
  v7[3] = &unk_1E6F60288;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __59__HUCameraActivityZoneCanvasView__drawPolygonWithMaskPath___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLineWidth:", 4.0);
  objc_msgSend(v4, "setLineJoinStyle:", 1);
  objc_msgSend(v4, "setLineCapStyle:", 1);
  v5 = objc_msgSend(v3, "count");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__HUCameraActivityZoneCanvasView__drawPolygonWithMaskPath___block_invoke_2;
  v10[3] = &unk_1E6F60260;
  v6 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v4;
  v14 = v5;
  v12 = v3;
  v13 = v6;
  v7 = v3;
  v9 = v4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStroke");

  objc_msgSend(v9, "stroke");
}

void __59__HUCameraActivityZoneCanvasView__drawPolygonWithMaskPath___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  int v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "_hmPointToCGPoint:", a2);
  v7 = v5;
  v8 = v6;
  if (!a3)
  {
    objc_msgSend(*(id *)(a1 + 40), "moveToPoint:", v5, v6);
    return;
  }
  if (*(_QWORD *)(a1 + 64) - 1 != a3)
  {
    objc_msgSend(*(id *)(a1 + 40), "addLineToPoint:", v5, v6);
    return;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isEditingActivityZone"))
    objc_msgSend(*(id *)(a1 + 40), "addLineToPoint:", v7, v8);
  objc_msgSend(*(id *)(a1 + 48), "objectAtIndex:", 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_hmPointToCGPoint:");
  objc_msgSend(*(id *)(a1 + 40), "addLineToPoint:");
  if (!*(_QWORD *)(a1 + 56))
    goto LABEL_11;
  v9 = objc_msgSend(*(id *)(a1 + 32), "displaysInclusionZones");
  v10 = *(void **)(a1 + 56);
  if (!v9)
  {
    if (v10)
      goto LABEL_13;
LABEL_11:
    if ((objc_msgSend(*(id *)(a1 + 32), "displaysInclusionZones") & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "fill");
    goto LABEL_13;
  }
  objc_msgSend(v10, "closePath");
  objc_msgSend(*(id *)(a1 + 56), "appendPath:", *(_QWORD *)(a1 + 40));
LABEL_13:

}

- (void)drawRect:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFill");

  v5 = (void *)MEMORY[0x1E0CEA390];
  -[HUCameraActivityZoneCanvasView bounds](self, "bounds");
  objc_msgSend(v5, "bezierPathWithRect:");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUsesEvenOddFillRule:", 1);
  -[HUCameraActivityZoneCanvasView _drawPolygonWithMaskPath:](self, "_drawPolygonWithMaskPath:", v8);
  if (-[HUCameraActivityZoneCanvasView displaysInclusionZones](self, "displaysInclusionZones"))
  {
    -[HUCameraActivityZoneCanvasView activityZones](self, "activityZones");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
      objc_msgSend(v8, "fill");
  }
  -[HUCameraActivityZoneCanvasView _drawPolygonWithMaskPath:](self, "_drawPolygonWithMaskPath:", 0);

}

- (void)_drawTouchPoints
{
  void *v3;
  void *v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  CGContext *CurrentContext;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *, uint64_t);
  void *v17;
  id v18;
  HUCameraActivityZoneCanvasView *v19;
  CGContext *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat blue;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGSize v30;

  v28 = 0.0;
  v29 = 0.0;
  v27 = 0.0;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getRed:green:blue:alpha:", &v29, &v28, &v27, 0);

  v25 = 0.0;
  v26 = 0.0;
  blue = 0.0;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getRed:green:blue:alpha:", &v26, &v25, &blue, 0);

  -[HUCameraActivityZoneCanvasView canvasView](self, "canvasView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v30.width = v6;
  v30.height = v7;
  UIGraphicsBeginImageContextWithOptions(v30, 0, 0.0);

  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetRGBFillColor(CurrentContext, v29, v28, v27, 0.5);
  CGContextSetLineWidth(CurrentContext, 4.0);
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLineJoinStyle:", 1);
  objc_msgSend(v9, "setLineCapStyle:", 1);
  -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __50__HUCameraActivityZoneCanvasView__drawTouchPoints__block_invoke;
  v17 = &unk_1E6F602B0;
  v18 = v9;
  v19 = self;
  v20 = CurrentContext;
  v21 = v29;
  v22 = v28;
  v23 = v27;
  v11 = v9;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v14);

  CGContextSetRGBStrokeColor(CurrentContext, v26, v25, blue, 1.0);
  objc_msgSend(v11, "stroke", v14, v15, v16, v17);
  UIGraphicsGetImageFromCurrentImageContext();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraActivityZoneCanvasView canvasView](self, "canvasView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setImage:", v12);

  UIGraphicsEndImageContext();
}

uint64_t __50__HUCameraActivityZoneCanvasView__drawTouchPoints__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "setLineWidth:", 4.0);
  objc_msgSend(*(id *)(a1 + 40), "_hmPointToCGPoint:", v6);
  v8 = v7;
  v10 = v9;

  v11 = v8 + 20.0;
  v12 = v10 + 20.0;
  v13 = *(void **)(a1 + 32);
  if (a3)
    objc_msgSend(v13, "addLineToPoint:", v11, v12);
  else
    objc_msgSend(v13, "moveToPoint:", v11, v12);
  return objc_msgSend(*(id *)(a1 + 40), "_addTouchpointAtPoint:inContext:withRed:green:blue:", *(_QWORD *)(a1 + 48), v11, v12, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (void)loadActivityZones:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Load activity zones:%@", buf, 0xCu);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__HUCameraActivityZoneCanvasView_loadActivityZones___block_invoke;
  v6[3] = &unk_1E6F602D8;
  v6[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);
  -[HUCameraActivityZoneCanvasView setNeedsDisplay](self, "setNeedsDisplay");

}

void __52__HUCameraActivityZoneCanvasView_loadActivityZones___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a2;
  v7 = objc_alloc_init(v3);
  objc_msgSend(v4, "points");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObjectsFromArray:", v5);
  objc_msgSend(*(id *)(a1 + 32), "activityZones");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

}

- (BOOL)canCreateActivityZone
{
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  _QWORD v12[6];
  _QWORD v13[5];
  id v14;

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__34;
  v13[4] = __Block_byref_object_dispose__34;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __55__HUCameraActivityZoneCanvasView_canCreateActivityZone__block_invoke;
  v12[3] = &unk_1E6F4EB28;
  v12[4] = self;
  v12[5] = v13;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v12);

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[HUCameraActivityZoneCanvasView activityZones](self, "activityZones");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __55__HUCameraActivityZoneCanvasView_canCreateActivityZone__block_invoke_2;
  v7[3] = &unk_1E6F60328;
  v7[4] = self;
  v7[5] = v13;
  v7[6] = &v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

  LOBYTE(self) = *((_BYTE *)v9 + 24) == 0;
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(v13, 8);

  return (char)self;
}

uint64_t __55__HUCameraActivityZoneCanvasView_canCreateActivityZone__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_hmPointToCGPoint:", a2);
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (a3)
    return objc_msgSend(v5, "addLineToPoint:");
  else
    return objc_msgSend(v5, "moveToPoint:");
}

uint64_t __55__HUCameraActivityZoneCanvasView_canCreateActivityZone__block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;
  uint64_t v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __55__HUCameraActivityZoneCanvasView_canCreateActivityZone__block_invoke_3;
  v3[3] = &unk_1E6F60300;
  v4 = *(_OWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  return objc_msgSend(a2, "enumerateObjectsUsingBlock:", v3);
}

uint64_t __55__HUCameraActivityZoneCanvasView_canCreateActivityZone__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_hmPointToCGPoint:", a2);
  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "containsPoint:");
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)createActivityZone
{
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v3 = -[HUCameraActivityZoneCanvasView canCreateActivityZone](self, "canCreateActivityZone");
  HFLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Create activity zone.", v14, 2u);
    }

    -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v8, "addObject:", v9);

    -[HUCameraActivityZoneCanvasView activityZones](self, "activityZones");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v10, "addObject:", v12);

    -[HUCameraActivityZoneCanvasView _resetCanvasAndCurrentZone](self, "_resetCanvasAndCurrentZone");
    -[HUCameraActivityZoneCanvasView setNeedsDisplay](self, "setNeedsDisplay");
    -[HUCameraActivityZoneCanvasView delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "didUpdateActivityZoneCanvas:", self);

  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Unable to create activity zone.", buf, 2u);
    }

    -[HUCameraActivityZoneCanvasView delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didAttemptToCreateOverlappingZoneForCanvas:", self);
  }

}

- (id)_hmPointForTapPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  id v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  y = a3.y;
  x = a3.x;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__34;
  v14 = __Block_byref_object_dispose__34;
  v15 = 0;
  -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__HUCameraActivityZoneCanvasView__hmPointForTapPoint___block_invoke;
  v9[3] = &unk_1E6F60350;
  *(CGFloat *)&v9[6] = x;
  *(CGFloat *)&v9[7] = y;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __54__HUCameraActivityZoneCanvasView__hmPointForTapPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v7;
  double v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_hmPointToCGPoint:");
  *(float *)&v7 = v7 - *(double *)(a1 + 48);
  *(float *)&v8 = v8 - *(double *)(a1 + 56);
  if (hypotf(*(float *)&v7, *(float *)&v8) <= 34.0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    UIGraphicsEndImageContext();
    *a4 = 1;
  }

}

- (void)_resetCanvasAndCurrentZone
{
  id v3;

  -[HUCameraActivityZoneCanvasView setEditingActivityZone:](self, "setEditingActivityZone:", 0);
  -[HUCameraActivityZoneCanvasView setCurrentActivityZone:](self, "setCurrentActivityZone:", 0);
  -[HUCameraActivityZoneCanvasView canvasView](self, "canvasView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:", 0);

}

- (void)_prepCurrentActivityZoneForDeselection
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
  v3 = objc_claimAutoreleasedReturnValue();
  -[NSObject firstObject](v3, "firstObject");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_5:

    goto LABEL_6;
  }
  v5 = (void *)v4;
  -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
    -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v13);

    HFLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v14;
      _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Finished editing. Re-added the last HMPoint to the zone:%@", (uint8_t *)&v17, 0xCu);

    }
    goto LABEL_5;
  }
LABEL_6:
  -[HUCameraActivityZoneCanvasView delegate](self, "delegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "didUpdateActivityZone:", v16);

}

- (void)_finishEditingCurrentActivityZone
{
  id v3;

  -[HUCameraActivityZoneCanvasView _prepCurrentActivityZoneForDeselection](self, "_prepCurrentActivityZoneForDeselection");
  -[HUCameraActivityZoneCanvasView _resetCanvasAndCurrentZone](self, "_resetCanvasAndCurrentZone");
  objc_msgSend(MEMORY[0x1E0CEA748], "sharedMenuController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hideMenu");

}

- (void)_editActivityZone:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if (v6)
  {
    HFLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "Stop editing the activity zone:%@", (uint8_t *)&v14, 0xCu);
    }

    -[HUCameraActivityZoneCanvasView _finishEditingCurrentActivityZone](self, "_finishEditingCurrentActivityZone");
  }
  else
  {
    -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[HUCameraActivityZoneCanvasView _prepCurrentActivityZoneForDeselection](self, "_prepCurrentActivityZoneForDeselection");
    -[HUCameraActivityZoneCanvasView setEditingActivityZone:](self, "setEditingActivityZone:", 1);
    objc_msgSend(v4, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (v11)
    {
      HFLogForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = v4;
        _os_log_impl(&dword_1B8E1E000, v12, OS_LOG_TYPE_DEFAULT, "Removing the copied last object for the activity zone:%@", (uint8_t *)&v14, 0xCu);
      }

      objc_msgSend(v4, "removeLastObject");
    }
    HFLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v4;
      _os_log_impl(&dword_1B8E1E000, v13, OS_LOG_TYPE_DEFAULT, "Edit activity zone:%@", (uint8_t *)&v14, 0xCu);
    }

    -[HUCameraActivityZoneCanvasView setCurrentActivityZone:](self, "setCurrentActivityZone:", v4);
    -[HUCameraActivityZoneCanvasView _drawTouchPoints](self, "_drawTouchPoints");
    -[HUCameraActivityZoneCanvasView _displayMenuForActivityZone:](self, "_displayMenuForActivityZone:", v4);
  }

}

- (void)_displayMenuForActivityZone:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HUCameraActivityZoneCanvasView _hmPointToCGPoint:](self, "_hmPointToCGPoint:", v4);
    v6 = v5;
    v8 = v7 + -17.0;
  }
  else
  {
    v6 = 0.0;
    v8 = -17.0;
  }
  v9 = objc_alloc(MEMORY[0x1E0CEA758]);
  _HULocalizedStringWithDefaultValue(CFSTR("HUClearTitle"), CFSTR("HUClearTitle"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithTitle:action:", v10, sel_clearActivityZone);

  -[HUCameraActivityZoneCanvasView becomeFirstResponder](self, "becomeFirstResponder");
  objc_msgSend(MEMORY[0x1E0CEA748], "sharedMenuController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMenuItems:", v13);

  objc_msgSend(v12, "showMenuFromView:rect:", self, v6, v8, 17.0, 17.0);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)clearActivityZone
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  HFLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_1B8E1E000, v3, OS_LOG_TYPE_DEFAULT, "Clear activity zone:%@", (uint8_t *)&v10, 0xCu);

  }
  -[HUCameraActivityZoneCanvasView setEditingActivityZone:](self, "setEditingActivityZone:", 0);
  -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[HUCameraActivityZoneCanvasView activityZones](self, "activityZones");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v7);

  -[HUCameraActivityZoneCanvasView canvasView](self, "canvasView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", 0);

  -[HUCameraActivityZoneCanvasView setNeedsDisplay](self, "setNeedsDisplay");
  -[HUCameraActivityZoneCanvasView delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "didUpdateActivityZoneCanvas:", self);

}

- (id)activityZoneContainingPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  id v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  y = a3.y;
  x = a3.x;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__34;
  v14 = __Block_byref_object_dispose__34;
  v15 = 0;
  -[HUCameraActivityZoneCanvasView activityZones](self, "activityZones");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__HUCameraActivityZoneCanvasView_activityZoneContainingPoint___block_invoke;
  v9[3] = &unk_1E6F603A0;
  *(CGFloat *)&v9[6] = x;
  *(CGFloat *)&v9[7] = y;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __62__HUCameraActivityZoneCanvasView_activityZoneContainingPoint___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v9 = a2;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__HUCameraActivityZoneCanvasView_activityZoneContainingPoint___block_invoke_2;
  v10[3] = &unk_1E6F60378;
  v10[4] = *(_QWORD *)(a1 + 32);
  v8 = v7;
  v11 = v8;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);
  if (objc_msgSend(v8, "containsPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

uint64_t __62__HUCameraActivityZoneCanvasView_activityZoneContainingPoint___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_hmPointToCGPoint:", a2);
  v5 = *(void **)(a1 + 40);
  if (a3)
    return objc_msgSend(v5, "addLineToPoint:");
  else
    return objc_msgSend(v5, "moveToPoint:");
}

- (id)selectedActivityZoneAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  uint64_t v7;
  void *v8;

  y = a3.y;
  x = a3.x;
  if (-[HUCameraActivityZoneCanvasView isEditingActivityZone](self, "isEditingActivityZone")
    || (-[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "count"),
        v6,
        !v7))
  {
    -[HUCameraActivityZoneCanvasView activityZoneContainingPoint:](self, "activityZoneContainingPoint:", x, y);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)setDisplaysInclusionZones:(BOOL)a3
{
  if (self->_displaysInclusionZones != a3)
  {
    self->_displaysInclusionZones = a3;
    -[HUCameraActivityZoneCanvasView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (BOOL)isCreatingActivityZone
{
  BOOL v3;
  void *v4;

  if (-[HUCameraActivityZoneCanvasView isEditingActivityZone](self, "isEditingActivityZone"))
    return 0;
  -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v4, "count") > 2;

  return v3;
}

- (BOOL)isValidPointInView:(CGPoint)a3
{
  void *v3;
  BOOL v4;

  -[HUCameraActivityZoneCanvasView activityZoneContainingPoint:](self, "activityZoneContainingPoint:", a3.x, a3.y);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (BOOL)currentZonesIntersectSegmentFromPoint:(CGPoint)a3 toPoint:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat v6;
  CGFloat v7;
  void *v9;
  NSObject *v10;
  int v11;
  char v12;
  _QWORD v14[10];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  CGFloat v22;
  __int16 v23;
  CGFloat v24;
  __int16 v25;
  CGFloat v26;
  __int16 v27;
  CGFloat v28;
  uint64_t v29;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v29 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  -[HUCameraActivityZoneCanvasView activityZones](self, "activityZones");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__HUCameraActivityZoneCanvasView_currentZonesIntersectSegmentFromPoint_toPoint___block_invoke;
  v14[3] = &unk_1E6F603F0;
  *(CGFloat *)&v14[6] = v7;
  *(CGFloat *)&v14[7] = v6;
  *(CGFloat *)&v14[8] = x;
  *(CGFloat *)&v14[9] = y;
  v14[4] = self;
  v14[5] = &v15;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);

  HFLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *((unsigned __int8 *)v16 + 24);
    *(_DWORD *)buf = 67110144;
    v20 = v11;
    v21 = 2048;
    v22 = v7;
    v23 = 2048;
    v24 = v6;
    v25 = 2048;
    v26 = x;
    v27 = 2048;
    v28 = y;
    _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "Intersection:%{BOOL}d for Line segment = %.2f,%.2f to %.2f,%.2f", buf, 0x30u);
  }

  v12 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v12;
}

void __80__HUCameraActivityZoneCanvasView_currentZonesIntersectSegmentFromPoint_toPoint___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  NSObject *v6;
  __int128 v7;
  uint64_t v8;
  _QWORD v9[7];
  __int128 v10;
  __int128 v11;
  uint8_t buf[8];
  uint8_t *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "currentActivityZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) != 0)
  {
    HFLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8E1E000, v6, OS_LOG_TYPE_DEFAULT, "Skipping check against current activity zone.", buf, 2u);
    }

  }
  else
  {
    v14 = 0x3010000000;
    v9[1] = 3221225472;
    v7 = *(_OWORD *)(a1 + 64);
    v10 = *(_OWORD *)(a1 + 48);
    *(_QWORD *)buf = 0;
    v13 = buf;
    v16 = 0;
    v17 = 0;
    v15 = &unk_1B94F0049;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[2] = __80__HUCameraActivityZoneCanvasView_currentZonesIntersectSegmentFromPoint_toPoint___block_invoke_2;
    v9[3] = &unk_1E6F603C8;
    v8 = *(_QWORD *)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v9[5] = buf;
    v11 = v7;
    v9[6] = v8;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);
    _Block_object_dispose(buf, 8);
  }

}

uint64_t __80__HUCameraActivityZoneCanvasView_currentZonesIntersectSegmentFromPoint_toPoint___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  double v8;
  double v9;
  uint64_t v10;
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
  double v22;
  double v24;

  result = objc_msgSend(*(id *)(a1 + 32), "_hmPointToCGPoint:", a2);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (a3)
  {
    v11 = *(double *)(v10 + 32);
    v12 = *(double *)(v10 + 40);
    v13 = v11 - v8;
    v14 = v12 - v9;
    v15 = *(double *)(a1 + 56);
    v16 = *(double *)(a1 + 64);
    v17 = v15 - *(double *)(a1 + 72);
    v18 = v16 - *(double *)(a1 + 80);
    v19 = (v11 - v8) * v18 - v17 * (v12 - v9);
    if (v19 > 0.00000011920929)
    {
      v20 = v16 - v12;
      v21 = v15 - v11;
      v22 = (v20 * v17 - v21 * v18) / v19;
      if (v22 > 0.0 && v22 < 1.0)
      {
        v24 = (v14 * -v21 + v20 * v13) / v19;
        if (v24 > 0.0 && v24 < 1.0)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
          *a4 = 1;
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        }
      }
    }
  }
  *(double *)(v10 + 32) = v8;
  *(double *)(v10 + 40) = v9;
  return result;
}

- (BOOL)currentZonesIntersectPoint:(CGPoint)a3
{
  void *v4;
  void *v5;
  BOOL v6;

  -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HUCameraActivityZoneCanvasView _hmPointToCGPoint:](self, "_hmPointToCGPoint:", v5);
    v6 = -[HUCameraActivityZoneCanvasView currentZonesIntersectSegmentFromPoint:toPoint:](self, "currentZonesIntersectSegmentFromPoint:toPoint:");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)preventAttemptToMovePoint
{
  void *v3;
  int64_t v4;
  void *v5;
  id v6;

  -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HUCameraActivityZoneCanvasView currentTouchPointIndex](self, "currentTouchPointIndex");
  -[HUCameraActivityZoneCanvasView startingTouchPoint](self, "startingTouchPoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "replaceObjectAtIndex:withObject:", v4, v5);

  -[HUCameraActivityZoneCanvasView _drawTouchPoints](self, "_drawTouchPoints");
  -[HUCameraActivityZoneCanvasView setNeedsDisplay](self, "setNeedsDisplay");
  -[HUCameraActivityZoneCanvasView setCurrentTouchPointIndex:](self, "setCurrentTouchPointIndex:", -1);
  -[HUCameraActivityZoneCanvasView setStartingTouchPoint:](self, "setStartingTouchPoint:", 0);
  -[HUCameraActivityZoneCanvasView delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didAttemptToMovePointToOverlapZoneForCanvas:", self);

}

- (void)didTap:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  void *v31;
  void *v32;
  unint64_t v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  _BYTE v44[22];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    objc_msgSend(v4, "locationInView:", self);
    v6 = v5;
    v8 = v7;
    if (-[HUCameraActivityZoneCanvasView isEditingActivityZone](self, "isEditingActivityZone"))
    {
      -[HUCameraActivityZoneCanvasView selectedActivityZoneAtPoint:](self, "selectedActivityZoneAtPoint:", v6, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        -[HUCameraActivityZoneCanvasView _finishEditingCurrentActivityZone](self, "_finishEditingCurrentActivityZone");
        -[HUCameraActivityZoneCanvasView setNeedsDisplay](self, "setNeedsDisplay");
LABEL_22:

        goto LABEL_23;
      }
      -[HUCameraActivityZoneCanvasView _editActivityZone:](self, "_editActivityZone:", v9);
      -[HUCameraActivityZoneCanvasView setNeedsDisplay](self, "setNeedsDisplay");
      goto LABEL_20;
    }
    -[HUCameraActivityZoneCanvasView _hmPointForTapPoint:](self, "_hmPointForTapPoint:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      -[HUCameraActivityZoneCanvasView selectedActivityZoneAtPoint:](self, "selectedActivityZoneAtPoint:", v6, v8);
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = (void *)v24;
        -[HUCameraActivityZoneCanvasView _editActivityZone:](self, "_editActivityZone:", v24);
        -[HUCameraActivityZoneCanvasView setNeedsDisplay](self, "setNeedsDisplay");
      }
      else
      {
        if (-[HUCameraActivityZoneCanvasView currentZonesIntersectPoint:](self, "currentZonesIntersectPoint:", v6, v8)
          || !-[HUCameraActivityZoneCanvasView isValidPointInView:](self, "isValidPointInView:", v6, v8))
        {
          HFLogForCategory();
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v44 = 134218240;
            *(double *)&v44[4] = v6;
            *(_WORD *)&v44[12] = 2048;
            *(double *)&v44[14] = v8;
            _os_log_impl(&dword_1B8E1E000, v43, OS_LOG_TYPE_DEFAULT, "Invalid location. Not creating touchpoint at:%.2f,%.2f.", v44, 0x16u);
          }

          -[HUCameraActivityZoneCanvasView delegate](self, "delegate");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "didAttemptToAddOverlappingLineForCanvas:", self);
        }
        else
        {
          -[HUCameraActivityZoneCanvasView _normalizedPointForPoint:](self, "_normalizedPointForPoint:", v6, v8);
          v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA778]), "initWithPoint:", v34, v35);
          -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v37)
          {
            v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            -[HUCameraActivityZoneCanvasView setCurrentActivityZone:](self, "setCurrentActivityZone:", v38);

          }
          -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "addObject:", v36);

          -[HUCameraActivityZoneCanvasView _drawTouchPoints](self, "_drawTouchPoints");
          HFLogForCategory();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v44 = 138412290;
            *(_QWORD *)&v44[4] = v36;
            _os_log_impl(&dword_1B8E1E000, v40, OS_LOG_TYPE_DEFAULT, "Add touch point:%@", v44, 0xCu);
          }

          -[HUCameraActivityZoneCanvasView delegate](self, "delegate");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "didUpdateActivityZone:", v42);

        }
        v25 = 0;
      }
      goto LABEL_21;
    }
    -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqual:", v11);

    -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
    {
      v15 = objc_msgSend(v13, "count");

      if (v15 == 1)
      {
        HFLogForCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v44 = 0;
          _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "Delete the first touchpoint.", v44, 2u);
        }

        -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeObjectAtIndex:", 0);

        -[HUCameraActivityZoneCanvasView _drawTouchPoints](self, "_drawTouchPoints");
        HFLogForCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          -[HUCameraActivityZoneCanvasView activityZones](self, "activityZones");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "count");
          *(_DWORD *)v44 = 134217984;
          *(_QWORD *)&v44[4] = v20;
          _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "Remove the activity. Zone count:%lu", v44, 0xCu);

        }
        -[HUCameraActivityZoneCanvasView delegate](self, "delegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "didUpdateActivityZone:", v22);

        -[HUCameraActivityZoneCanvasView delegate](self, "delegate");
        v23 = objc_claimAutoreleasedReturnValue();
        -[NSObject didUpdateActivityZoneCanvas:](v23, "didUpdateActivityZoneCanvas:", self);
        goto LABEL_19;
      }
      -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "count");

      if (v33 > 2)
      {
        -[HUCameraActivityZoneCanvasView createActivityZone](self, "createActivityZone");
        goto LABEL_20;
      }
      HFLogForCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v44 = 0;
        v28 = "Ignore taps on the target since there are less than 3 points";
        v29 = v23;
        v30 = 2;
        goto LABEL_18;
      }
    }
    else
    {
      v26 = objc_msgSend(v13, "indexOfObject:", v9);

      -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "removeObjectAtIndex:", v26);

      -[HUCameraActivityZoneCanvasView _drawTouchPoints](self, "_drawTouchPoints");
      HFLogForCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v44 = 138412290;
        *(_QWORD *)&v44[4] = v9;
        v28 = "Deleted touchpoint:%@.";
        v29 = v23;
        v30 = 12;
LABEL_18:
        _os_log_impl(&dword_1B8E1E000, v29, OS_LOG_TYPE_DEFAULT, v28, v44, v30);
      }
    }
LABEL_19:

LABEL_20:
    -[HUCameraActivityZoneCanvasView delegate](self, "delegate", *(_OWORD *)v44);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "didUpdateActivityZone:", v31);

LABEL_21:
    goto LABEL_22;
  }
LABEL_23:

}

- (void)didPan:(id)a3
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "state");
  if (v4 == 3)
  {
    -[HUCameraActivityZoneCanvasView _handleEndForGesture:](self, "_handleEndForGesture:", v7);
  }
  else if (v4 == 2)
  {
    -[HUCameraActivityZoneCanvasView _handleChangeForGesture:](self, "_handleChangeForGesture:", v7);
  }
  else
  {
    v5 = v4 == 1;
    v6 = v7;
    if (!v5)
      goto LABEL_9;
    -[HUCameraActivityZoneCanvasView _handleBeginForGesture:](self, "_handleBeginForGesture:", v7);
  }
  v6 = v7;
LABEL_9:

}

- (void)_handleBeginForGesture:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[7];

  objc_msgSend(a3, "locationInView:", self);
  v5 = v4;
  v7 = v6;
  -[HUCameraActivityZoneCanvasView setCurrentTouchPointIndex:](self, "setCurrentTouchPointIndex:", -1);
  -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__HUCameraActivityZoneCanvasView__handleBeginForGesture___block_invoke;
  v9[3] = &unk_1E6F60418;
  v9[4] = self;
  v9[5] = v5;
  v9[6] = v7;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

}

void __57__HUCameraActivityZoneCanvasView__handleBeginForGesture___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  double v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_hmPointToCGPoint:", v7);
  *(float *)&v8 = v8 - *(double *)(a1 + 40);
  *(float *)&v9 = v9 - *(double *)(a1 + 48);
  if (hypotf(*(float *)&v8, *(float *)&v9) <= 34.0)
  {
    HFLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      v13 = 134218496;
      v14 = v11;
      v15 = 2048;
      v16 = v12;
      v17 = 2048;
      v18 = a3;
      _os_log_impl(&dword_1B8E1E000, v10, OS_LOG_TYPE_DEFAULT, "Begin dragging at point:%.0f, %.0f for index %lu", (uint8_t *)&v13, 0x20u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setCurrentTouchPointIndex:", a3);
    objc_msgSend(*(id *)(a1 + 32), "setStartingTouchPoint:", v7);
    *a4 = 1;
  }

}

- (void)_handleChangeForGesture:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  if ((-[HUCameraActivityZoneCanvasView currentTouchPointIndex](self, "currentTouchPointIndex") & 0x8000000000000000) == 0)
  {
    objc_msgSend(v16, "locationInView:", self);
    v5 = v4;
    v7 = fmax(v6, 0.0);
    -[HUCameraActivityZoneCanvasView bounds](self, "bounds");
    if (v7 >= v8)
      v7 = v8;
    v9 = fmax(v5, 0.0);
    -[HUCameraActivityZoneCanvasView bounds](self, "bounds");
    if (v9 >= v10)
      v11 = v10;
    else
      v11 = v9;
    -[HUCameraActivityZoneCanvasView _normalizedPointForPoint:](self, "_normalizedPointForPoint:", v7, v11);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CBA778]), "initWithPoint:", v12, v13);
    -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "replaceObjectAtIndex:withObject:", -[HUCameraActivityZoneCanvasView currentTouchPointIndex](self, "currentTouchPointIndex"), v14);

    -[HUCameraActivityZoneCanvasView _drawTouchPoints](self, "_drawTouchPoints");
    -[HUCameraActivityZoneCanvasView setNeedsDisplay](self, "setNeedsDisplay");

  }
}

- (void)_handleEndForGesture:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  int v33;
  id v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  HFLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v33 = 138412290;
    v34 = v4;
    _os_log_impl(&dword_1B8E1E000, v5, OS_LOG_TYPE_DEFAULT, "Finished pan:%@", (uint8_t *)&v33, 0xCu);
  }

  if ((-[HUCameraActivityZoneCanvasView currentTouchPointIndex](self, "currentTouchPointIndex") & 0x8000000000000000) == 0)
  {
    objc_msgSend(v4, "locationInView:", self);
    v7 = v6;
    v9 = v8;
    -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndex:", -[HUCameraActivityZoneCanvasView currentTouchPointIndex](self, "currentTouchPointIndex"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = -[HUCameraActivityZoneCanvasView currentTouchPointIndex](self, "currentTouchPointIndex");
    -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count") - 1;

    if (v12 < v14)
    {
      -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndex:", -[HUCameraActivityZoneCanvasView currentTouchPointIndex](self, "currentTouchPointIndex") + 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUCameraActivityZoneCanvasView _hmPointToCGPoint:](self, "_hmPointToCGPoint:", v11);
      v18 = v17;
      v20 = v19;
      -[HUCameraActivityZoneCanvasView _hmPointToCGPoint:](self, "_hmPointToCGPoint:", v16);
      if (-[HUCameraActivityZoneCanvasView currentZonesIntersectSegmentFromPoint:toPoint:](self, "currentZonesIntersectSegmentFromPoint:toPoint:", v18, v20, v21, v22))
      {
        HFLogForCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v33 = 134218240;
          v34 = v7;
          v35 = 2048;
          v36 = v9;
          v24 = "Overlapped activity zones are not allowed for next point:%.2f,%.2f.";
LABEL_16:
          _os_log_impl(&dword_1B8E1E000, v23, OS_LOG_TYPE_DEFAULT, v24, (uint8_t *)&v33, 0x16u);
          goto LABEL_17;
        }
        goto LABEL_17;
      }

    }
    if (-[HUCameraActivityZoneCanvasView currentTouchPointIndex](self, "currentTouchPointIndex") >= 1)
    {
      -[HUCameraActivityZoneCanvasView currentActivityZone](self, "currentActivityZone");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndex:", -[HUCameraActivityZoneCanvasView currentTouchPointIndex](self, "currentTouchPointIndex") - 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[HUCameraActivityZoneCanvasView _hmPointToCGPoint:](self, "_hmPointToCGPoint:", v11);
      v28 = v27;
      v30 = v29;
      -[HUCameraActivityZoneCanvasView _hmPointToCGPoint:](self, "_hmPointToCGPoint:", v16);
      if (-[HUCameraActivityZoneCanvasView currentZonesIntersectSegmentFromPoint:toPoint:](self, "currentZonesIntersectSegmentFromPoint:toPoint:", v28, v30, v31, v32))
      {
        HFLogForCategory();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v33 = 134218240;
          v34 = v7;
          v35 = 2048;
          v36 = v9;
          v24 = "Overlapped activity zones are not allowed for previous point:%.2f,%.2f.";
          goto LABEL_16;
        }
LABEL_17:

        -[HUCameraActivityZoneCanvasView preventAttemptToMovePoint](self, "preventAttemptToMovePoint");
LABEL_20:

        goto LABEL_21;
      }

    }
    -[HUCameraActivityZoneCanvasView delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "didUpdateActivityZoneCanvas:", self);
    goto LABEL_20;
  }
  HFLogForCategory();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v33) = 0;
    _os_log_error_impl(&dword_1B8E1E000, v25, OS_LOG_TYPE_ERROR, "Invalid touchPointIndex. Bailing.", (uint8_t *)&v33, 2u);
  }

  -[HUCameraActivityZoneCanvasView delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "didUpdateActivityZoneCanvas:", self);
LABEL_21:

}

- (CGPoint)_normalizedPointForPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[HUCameraActivityZoneCanvasView bounds](self, "bounds");
  v7 = x / fmax(v6, 1.0);
  -[HUCameraActivityZoneCanvasView bounds](self, "bounds");
  v9 = y / fmax(v8, 1.0);
  v10 = v7;
  result.y = v9;
  result.x = v10;
  return result;
}

- (CGPoint)_hmPointToCGPoint:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  objc_msgSend(a3, "point");
  v5 = v4;
  v7 = v6;
  -[HUCameraActivityZoneCanvasView bounds](self, "bounds");
  v9 = v5 * v8;
  -[HUCameraActivityZoneCanvasView bounds](self, "bounds");
  v11 = v7 * v10;
  v12 = v9;
  result.y = v11;
  result.x = v12;
  return result;
}

- (void)_addTouchpointAtPoint:(CGPoint)a3 inContext:(CGContext *)a4 withRed:(double)a5 green:(double)a6 blue:(double)a7
{
  double y;
  double x;
  void *v13;
  void *v14;
  void *v15;
  CGFloat blue;
  CGFloat v17;
  CGFloat v18;

  y = a3.y;
  x = a3.x;
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithOvalInRect:", a3.x + -3.0, a3.y + -3.0, 6.0, 6.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0.0;
  v18 = 0.0;
  blue = 0.0;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "getRed:green:blue:alpha:", &v18, &v17, &blue, 0);

  CGContextSetRGBFillColor(a4, v18, v17, blue, 1.0);
  objc_msgSend(v13, "fill");
  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithOvalInRect:", x + -17.0, y + -17.0, 34.0, 34.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  CGContextSetRGBFillColor(a4, a5, a6, a7, 0.5);
  CGContextSetRGBStrokeColor(a4, a5, a6, a7, 1.0);
  objc_msgSend(v15, "fill");
  objc_msgSend(v15, "stroke");

}

- (HUCameraActivityZoneCanvasDelegate)delegate
{
  return (HUCameraActivityZoneCanvasDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableArray)activityZones
{
  return self->_activityZones;
}

- (BOOL)displaysInclusionZones
{
  return self->_displaysInclusionZones;
}

- (BOOL)isEditingActivityZone
{
  return self->_editingActivityZone;
}

- (void)setEditingActivityZone:(BOOL)a3
{
  self->_editingActivityZone = a3;
}

- (NSMutableArray)currentActivityZone
{
  return self->_currentActivityZone;
}

- (void)setCurrentActivityZone:(id)a3
{
  objc_storeStrong((id *)&self->_currentActivityZone, a3);
}

- (UIImageView)canvasView
{
  return self->_canvasView;
}

- (void)setCanvasView:(id)a3
{
  objc_storeStrong((id *)&self->_canvasView, a3);
}

- (int64_t)currentTouchPointIndex
{
  return self->_currentTouchPointIndex;
}

- (void)setCurrentTouchPointIndex:(int64_t)a3
{
  self->_currentTouchPointIndex = a3;
}

- (HMPoint)startingTouchPoint
{
  return self->_startingTouchPoint;
}

- (void)setStartingTouchPoint:(id)a3
{
  objc_storeStrong((id *)&self->_startingTouchPoint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startingTouchPoint, 0);
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_storeStrong((id *)&self->_currentActivityZone, 0);
  objc_storeStrong((id *)&self->_activityZones, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
