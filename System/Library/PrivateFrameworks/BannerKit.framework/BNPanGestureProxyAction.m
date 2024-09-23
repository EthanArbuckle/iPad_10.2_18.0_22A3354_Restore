@implementation BNPanGestureProxyAction

- (BNPanGestureProxyAction)initWithPanGestureProxy:(id)a3 hostSideWindow:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BNPanGestureProxyAction *v9;
  objc_super v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "_infoFromPanGestureProxy:window:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11.receiver = self;
  v11.super_class = (Class)BNPanGestureProxyAction;
  v9 = -[BNPanGestureProxyAction initWithInfo:responder:](&v11, sel_initWithInfo_responder_, v8, 0);

  return v9;
}

- (int64_t)state
{
  void *v2;
  void *v3;
  int64_t v4;

  -[BNPanGestureProxyAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)actionHandler
{
  return 0;
}

- (BOOL)didCrossDefaultThreshold
{
  void *v2;
  char v3;

  -[BNPanGestureProxyAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForSetting:", 2);

  return v3;
}

- (CGPoint)locationInCoordinateSpace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  v4 = a3;
  -[BNPanGestureProxyAction info](self, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForSetting:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGPointValue");
  -[BNPanGestureProxyAction _convertPointInSceneReferenceSpace:toCoordinateSpace:](self, "_convertPointInSceneReferenceSpace:toCoordinateSpace:", v4);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)translationInCoordinateSpace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  v4 = a3;
  -[BNPanGestureProxyAction info](self, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForSetting:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGPointValue");
  -[BNPanGestureProxyAction _convertPointInSceneReferenceSpace:toCoordinateSpace:](self, "_convertPointInSceneReferenceSpace:toCoordinateSpace:", v4);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)visualTranslationInCoordinateSpace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  v4 = a3;
  -[BNPanGestureProxyAction info](self, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForSetting:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CGPointValue");
  -[BNPanGestureProxyAction _convertPointInSceneReferenceSpace:toCoordinateSpace:](self, "_convertPointInSceneReferenceSpace:toCoordinateSpace:", v4);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)velocityInCoordinateSpace:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGPoint result;

  -[BNPanGestureProxyAction info](self, "info", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForSetting:", 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CGPointValue");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.y = v10;
  result.x = v9;
  return result;
}

+ (id)_infoFromPanGestureProxy:(id)a3 window:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];

  v5 = (objc_class *)MEMORY[0x1E0D017D0];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "state"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", v9, 1);

  objc_msgSend(v8, "setFlag:forSetting:", objc_msgSend(v7, "didCrossDefaultThreshold"), 2);
  v10 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v7, "locationInCoordinateSpace:", v6);
  objc_msgSend(v6, "_convertPointToSceneReferenceSpace:");
  v32[0] = v11;
  v32[1] = v12;
  objc_msgSend(v10, "valueWithBytes:objCType:", v32, "{CGPoint=dd}");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", v13, 3);

  v14 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v7, "translationInCoordinateSpace:", v6);
  objc_msgSend(v6, "_convertPointToSceneReferenceSpace:");
  v31[0] = v15;
  v31[1] = v16;
  objc_msgSend(v14, "valueWithBytes:objCType:", v31, "{CGPoint=dd}");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", v17, 4);

  v18 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v7, "visualTranslationInCoordinateSpace:", v6);
  objc_msgSend(v6, "_convertPointToSceneReferenceSpace:");
  v30[0] = v19;
  v30[1] = v20;
  objc_msgSend(v18, "valueWithBytes:objCType:", v30, "{CGPoint=dd}");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", v21, 5);

  v22 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v7, "velocityInCoordinateSpace:", v6);
  v24 = v23;
  v26 = v25;

  v29[0] = v24;
  v29[1] = v26;
  objc_msgSend(v22, "valueWithBytes:objCType:", v29, "{CGPoint=dd}");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", v27, 6);

  return v8;
}

- (CGPoint)_convertPointInSceneReferenceSpace:(CGPoint)a3 toCoordinateSpace:(id)a4
{
  double y;
  double x;
  UIWindow **p_serviceSideWindow;
  id v9;
  id WeakRetained;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  p_serviceSideWindow = &self->_serviceSideWindow;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_serviceSideWindow);

  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BNPanGestureProxyAction.m"), 77, CFSTR("service-side window hasn't been set"));

  }
  v11 = objc_loadWeakRetained((id *)p_serviceSideWindow);
  objc_msgSend(v11, "_convertPointFromSceneReferenceSpace:", x, y);
  v13 = v12;
  v15 = v14;

  v16 = objc_loadWeakRetained((id *)p_serviceSideWindow);
  objc_msgSend(v16, "convertPoint:toCoordinateSpace:", v9, v13, v15);
  v18 = v17;
  v20 = v19;

  v21 = v18;
  v22 = v20;
  result.y = v22;
  result.x = v21;
  return result;
}

- (UIWindow)serviceSideWindow
{
  return (UIWindow *)objc_loadWeakRetained((id *)&self->_serviceSideWindow);
}

- (void)setServiceSideWindow:(id)a3
{
  objc_storeWeak((id *)&self->_serviceSideWindow, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_serviceSideWindow);
}

@end
