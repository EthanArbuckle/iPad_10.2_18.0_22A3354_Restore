@implementation _FEFocusCastingController

- (_FEFocusCastingController)init
{
  _FEFocusCastingController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_FEFocusCastingController;
  result = -[_FEFocusCastingController init](&v3, sel_init);
  if (result)
  {
    result->_screenEntryPoint = (CGPoint)_FEFocusCastingPointNone;
    result->_isRememberingEntryPoint = 0;
    result->_entryPointMemorizationTimeout = 0.5;
    result->_entryPointAxis = 0;
  }
  return result;
}

- (void)updateFocusCastingWithContext:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  NSObject *v27;
  uint8_t v28[16];

  v4 = a3;
  -[_FEFocusCastingController _normalizedCoordinateSpace](self, "_normalizedCoordinateSpace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *MEMORY[0x24BDBF070];
    v7 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v9 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v8 = *(double *)(MEMORY[0x24BDBF070] + 24);
    objc_msgSend(v4, "previouslyFocusedItem");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v9;
    v12 = v8;
    v13 = v7;
    v14 = v6;
    if (v10)
    {
      v15 = (void *)v10;
      objc_msgSend(v4, "previouslyFocusedItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v9;
      v12 = v8;
      v13 = v7;
      v14 = v6;
      if (v17)
      {
        objc_msgSend(v4, "previouslyFocusedItem");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = _FEFocusItemFrameInCoordinateSpace(v18, v5);
        v13 = v19;
        v11 = v20;
        v12 = v21;

      }
    }
    objc_msgSend(v4, "nextFocusedItem");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v4, "nextFocusedItem");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = _FEFocusItemFrameInCoordinateSpace(v23, v5);
      v7 = v24;
      v9 = v25;
      v8 = v26;

    }
    -[_FEFocusCastingController _updateFocusItemFromNormalizedFrame:toNormalizedFrame:withHeading:](self, "_updateFocusItemFromNormalizedFrame:toNormalizedFrame:withHeading:", objc_msgSend(v4, "focusHeading"), v14, v13, v11, v12, v6, v7, v9, v8);
  }
  else
  {
    logger();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v28 = 0;
      _os_log_debug_impl(&dword_23C48C000, v27, OS_LOG_TYPE_DEBUG, "Unable to get normalized coordinate space for focus casting.", v28, 2u);
    }

  }
}

- (CGRect)castingFrameForFocusedItem:(id)a3 heading:(unint64_t)a4 inCoordinateSpace:(id)a5
{
  id v8;
  id v9;
  double v10;
  double v11;
  BOOL v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  __int16 v33[8];
  CGRect result;

  v8 = a3;
  v9 = a5;
  if (!v8
    && ((-[_FEFocusCastingController screenEntryPoint](self, "screenEntryPoint"), v11 == INFINITY)
      ? (v12 = v10 == INFINITY)
      : (v12 = 0),
        v12))
  {
    v19 = *MEMORY[0x24BDBF070];
    v20 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v21 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v22 = *(double *)(MEMORY[0x24BDBF070] + 24);
  }
  else
  {
    -[_FEFocusCastingController _normalizedCoordinateSpace](self, "_normalizedCoordinateSpace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (v8)
      {
        v14 = _FEFocusItemFrameInCoordinateSpace(v8, v13);
      }
      else
      {
        -[_FEFocusCastingController screenEntryPoint](self, "screenEntryPoint");
        v15 = round(v23 + -5.0);
        v14 = round(v24 + -5.0);
        v16 = 10.0;
        v17 = 10.0;
      }
      -[_FEFocusCastingController _castingFrameForFocusedNormalizedFrame:heading:](self, "_castingFrameForFocusedNormalizedFrame:heading:", a4, v14, v15, v16, v17);
      objc_msgSend(v13, "convertRect:toCoordinateSpace:", v9);
      v19 = v25;
      v20 = v26;
      v21 = v27;
      v22 = v28;
    }
    else
    {
      logger();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v33[0] = 0;
        _os_log_debug_impl(&dword_23C48C000, v18, OS_LOG_TYPE_DEBUG, "Unable to get normalized coordinate space for focus casting.", (uint8_t *)v33, 2u);
      }

      v19 = *MEMORY[0x24BDBF070];
      v20 = *(double *)(MEMORY[0x24BDBF070] + 8);
      v21 = *(double *)(MEMORY[0x24BDBF070] + 16);
      v22 = *(double *)(MEMORY[0x24BDBF070] + 24);
    }

  }
  v29 = v19;
  v30 = v20;
  v31 = v21;
  v32 = v22;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)forceUpdateFocusCastingFocusedRect:(CGRect)a3 coordinateSpace:(id)a4 heading:(unint64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  uint8_t v19[16];
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  if (CGRectIsNull(v20))
  {
    -[_FEFocusCastingController setScreenEntryPoint:](self, "setScreenEntryPoint:", INFINITY, INFINITY);
    -[_FEFocusCastingController _stopRememberingEntryPoint](self, "_stopRememberingEntryPoint");
  }
  else
  {
    -[_FEFocusCastingController _normalizedCoordinateSpace](self, "_normalizedCoordinateSpace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "convertRect:fromCoordinateSpace:", v11, x, y, width, height);
      -[_FEFocusCastingController _updateFocusItemFromNormalizedFrame:toNormalizedFrame:withHeading:](self, "_updateFocusItemFromNormalizedFrame:toNormalizedFrame:withHeading:", a5, *MEMORY[0x24BDBF070], *(double *)(MEMORY[0x24BDBF070] + 8), *(double *)(MEMORY[0x24BDBF070] + 16), *(double *)(MEMORY[0x24BDBF070] + 24), v14, v15, v16, v17);
    }
    else
    {
      logger();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v19 = 0;
        _os_log_debug_impl(&dword_23C48C000, v18, OS_LOG_TYPE_DEBUG, "Unable to get normalized coordinate space for focus casting.", v19, 2u);
      }

    }
  }

}

- (id)_normalizedCoordinateSpace
{
  void *v2;
  void *v3;
  void *v4;

  -[_FEFocusCastingController focusSystem](self, "focusSystem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_focusItemContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_focusCoordinateSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (CGRect)_castingFrameForFocusedNormalizedFrame:(CGRect)a3 heading:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v17;
  double MinX;
  double MinY;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!CGRectIsNull(a3))
  {
    -[_FEFocusCastingController _castingPointInNormalizedFrame:forHeading:](self, "_castingPointInNormalizedFrame:forHeading:", a4, x, y, width, height);
    v15 = v13;
    if (v13 == INFINITY && v14 == INFINITY)
    {
      v10 = x;
      v11 = width;
      v12 = height;
      goto LABEL_21;
    }
    v11 = fmin(width, 10.0);
    v12 = fmin(height, 10.0);
    if ((a4 & 3) != 0)
    {
      v15 = v13 + v11 * -0.5;
      if ((a4 & 1) != 0)
      {
        v17 = 0.0;
        goto LABEL_17;
      }
      if ((a4 & 2) != 0)
      {
        v25.origin.x = x;
        v25.origin.y = y;
        v25.size.width = width;
        v25.size.height = height;
        v17 = CGRectGetMaxY(v25) - v12;
LABEL_17:
        v24 = v17;
LABEL_20:
        v27.origin.x = x;
        v27.origin.y = y;
        v27.size.width = width;
        v27.size.height = height;
        MinX = CGRectGetMinX(v27);
        v28.origin.x = x;
        v28.origin.y = y;
        v28.size.width = width;
        v28.size.height = height;
        v10 = fmax(MinX, fmin(v15, CGRectGetMaxX(v28) - v11));
        v29.origin.x = x;
        v29.origin.y = y;
        v29.size.width = width;
        v29.size.height = height;
        MinY = CGRectGetMinY(v29);
        v30.origin.x = x;
        v30.origin.y = y;
        v30.size.width = width;
        v30.size.height = height;
        y = fmax(MinY, fmin(v24, CGRectGetMaxY(v30) - v12));
        goto LABEL_21;
      }
    }
    else if ((a4 & 0xC) != 0)
    {
      v24 = v14 + v12 * -0.5;
      if ((a4 & 4) != 0)
      {
        v15 = 0.0;
      }
      else if ((a4 & 8) != 0)
      {
        v26.origin.x = x;
        v26.origin.y = y;
        v26.size.width = width;
        v26.size.height = height;
        v15 = CGRectGetMaxX(v26) - v11;
      }
      goto LABEL_20;
    }
    v24 = v14;
    goto LABEL_20;
  }
  v10 = *MEMORY[0x24BDBF070];
  y = *(double *)(MEMORY[0x24BDBF070] + 8);
  v11 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v12 = *(double *)(MEMORY[0x24BDBF070] + 24);
LABEL_21:
  v20 = v10;
  v21 = y;
  v22 = v11;
  v23 = v12;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)_updateFocusItemFromNormalizedFrame:(CGRect)a3 toNormalizedFrame:(CGRect)a4 withHeading:(unint64_t)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double MinX;
  double v26;
  double MaxX;
  double v28;
  double MidX;
  double MidY;
  double v31;
  double v32;
  double MinY;
  double v34;
  double MaxY;
  double v36;
  double v37;
  CGFloat rect;
  CGFloat recta;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3.size.height;
  v11 = a3.size.width;
  v12 = a3.origin.y;
  v13 = a3.origin.x;
  if (CGRectIsNull(a4) || (a5 & 0xF) == 0)
  {
    -[_FEFocusCastingController _stopRememberingEntryPoint](self, "_stopRememberingEntryPoint");
    v19 = INFINITY;
    v20 = INFINITY;
    goto LABEL_17;
  }
  v40.origin.x = v13;
  v40.origin.y = v12;
  v40.size.width = v11;
  v40.size.height = v10;
  if (CGRectIsNull(v40))
  {
    v15 = x;
    v16 = y;
    v17 = width;
    v18 = height;
  }
  else
  {
    -[_FEFocusCastingController _castingFrameForFocusedNormalizedFrame:heading:](self, "_castingFrameForFocusedNormalizedFrame:heading:", a5, v13, v12, v11, v10);
    v15 = v21;
    v16 = v22;
    v17 = v23;
    v18 = v24;
  }
  if (_UIRectIntersectsRectAlongFocusHeading(a5, x, y, width, height, v15, v16, v17, v18))
  {
    if ((a5 & 3) == 0)
    {
      if ((a5 & 0xC) != 0)
      {
        v51.origin.x = v15;
        v51.origin.y = v16;
        v51.size.width = v17;
        v51.size.height = v18;
        recta = v15;
        MinY = CGRectGetMinY(v51);
        v52.origin.x = x;
        v52.origin.y = y;
        v52.size.width = width;
        v52.size.height = height;
        v34 = CGRectGetMinY(v52);
        if (MinY >= v34)
          v34 = MinY;
        v37 = v34;
        v53.origin.x = recta;
        v53.origin.y = v16;
        v53.size.width = v17;
        v53.size.height = v18;
        MaxY = CGRectGetMaxY(v53);
        v54.origin.x = x;
        v54.origin.y = y;
        v54.size.width = width;
        v54.size.height = height;
        v36 = CGRectGetMaxY(v54);
        if (MaxY < v36)
          v36 = MaxY;
        MidY = (v37 + v36) * 0.5;
        v55.origin.x = x;
        v55.origin.y = y;
        v55.size.width = width;
        v55.size.height = height;
        MidX = CGRectGetMidX(v55);
      }
      else
      {
        MidX = INFINITY;
        MidY = INFINITY;
      }
      goto LABEL_16;
    }
    v41.origin.x = v15;
    v41.origin.y = v16;
    v41.size.width = v17;
    v41.size.height = v18;
    rect = v15;
    MinX = CGRectGetMinX(v41);
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    v26 = CGRectGetMinX(v42);
    if (MinX >= v26)
      v26 = MinX;
    v37 = v26;
    v43.origin.x = rect;
    v43.origin.y = v16;
    v43.size.width = v17;
    v43.size.height = v18;
    MaxX = CGRectGetMaxX(v43);
    v44.origin.x = x;
    v44.origin.y = y;
    v44.size.width = width;
    v44.size.height = height;
    v28 = CGRectGetMaxX(v44);
    if (MaxX < v28)
      v28 = MaxX;
    MidX = (v37 + v28) * 0.5;
  }
  else
  {
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    MidX = CGRectGetMidX(v45);
  }
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  MidY = CGRectGetMidY(v46);
LABEL_16:
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  v31 = CGRectGetMinX(v47);
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  v19 = fmax(v31, fmin(MidX, CGRectGetMaxX(v48)));
  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = width;
  v49.size.height = height;
  v32 = CGRectGetMinY(v49);
  v50.origin.x = x;
  v50.origin.y = y;
  v50.size.width = width;
  v50.size.height = height;
  v20 = fmax(v32, fmin(MidY, CGRectGetMaxY(v50)));
  -[_FEFocusCastingController _startRememberingEntryPoint](self, "_startRememberingEntryPoint");
LABEL_17:
  -[_FEFocusCastingController setScreenEntryPoint:](self, "setScreenEntryPoint:", v19, v20, *(_QWORD *)&v37);
  -[_FEFocusCastingController setEntryPointAxis:](self, "setEntryPointAxis:", -[_FEFocusCastingController _axisForHeading:](self, "_axisForHeading:", a5));
  if (_FEGetFocusCastingVisualization())
    -[_FEFocusCastingController _updateFocusMovementIndicatorDisplay](self, "_updateFocusMovementIndicatorDisplay");
}

- (unint64_t)_axisForHeading:(unint64_t)a3
{
  if ((a3 & 3) != 0)
    return 2;
  else
    return (a3 & 0xC) != 0;
}

- (CGPoint)_castingPointInNormalizedFrame:(CGRect)a3 forHeading:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  CGPoint result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[_FEFocusCastingController isRememberingEntryPoint](self, "isRememberingEntryPoint"))
    -[_FEFocusCastingController _entryPointInNormalizedFrame:forHeading:](self, "_entryPointInNormalizedFrame:forHeading:", a4, x, y, width, height);
  else
    -[_FEFocusCastingController _movementPointInNormalizedFrame:](self, "_movementPointInNormalizedFrame:", x, y, width, height);
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)_stopRememberingEntryPoint
{
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_forgetEntryPoint, 0);
  -[_FEFocusCastingController setIsRememberingEntryPoint:](self, "setIsRememberingEntryPoint:", 0);
}

- (void)_startRememberingEntryPoint
{
  double v3;

  -[_FEFocusCastingController _stopRememberingEntryPoint](self, "_stopRememberingEntryPoint");
  -[_FEFocusCastingController setIsRememberingEntryPoint:](self, "setIsRememberingEntryPoint:", 1);
  -[_FEFocusCastingController entryPointMemorizationTimeout](self, "entryPointMemorizationTimeout");
  if (v3 > 0.0)
    -[_FEFocusCastingController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_forgetEntryPoint, 0);
}

- (void)forgetEntryPoint
{
  if (-[_FEFocusCastingController isRememberingEntryPoint](self, "isRememberingEntryPoint"))
  {
    -[_FEFocusCastingController _stopRememberingEntryPoint](self, "_stopRememberingEntryPoint");
    if (_FEGetFocusCastingVisualization())
      -[_FEFocusCastingController _positionFocusMovementIndicators](self, "_positionFocusMovementIndicators");
  }
}

- (void)setEntryPointMemorizationTimeout:(double)a3
{
  _BOOL4 v5;

  self->_entryPointMemorizationTimeout = a3;
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_forgetEntryPoint, 0);
  v5 = -[_FEFocusCastingController isRememberingEntryPoint](self, "isRememberingEntryPoint");
  if (a3 > 0.0 && v5)
    -[_FEFocusCastingController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_forgetEntryPoint, 0, a3);
}

- (CGPoint)_entryPointInNormalizedFrame:(CGRect)a3 forHeading:(unint64_t)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  double v15;
  BOOL v16;
  double v17;
  double MinX;
  double MinY;
  double v20;
  CGPoint result;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_FEFocusCastingController screenEntryPoint](self, "screenEntryPoint");
  v11 = v10;
  v13 = v12;
  v14 = -[_FEFocusCastingController _axisForHeading:](self, "_axisForHeading:", a4);
  v15 = INFINITY;
  v16 = v11 == INFINITY && v13 == INFINITY;
  v17 = INFINITY;
  if (!v16)
  {
    if (-[_FEFocusCastingController entryPointAxis](self, "entryPointAxis") == v14)
    {
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      MinX = CGRectGetMinX(v22);
      v23.origin.x = x;
      v23.origin.y = y;
      v23.size.width = width;
      v23.size.height = height;
      v15 = fmax(MinX, fmin(v11, CGRectGetMaxX(v23)));
      v24.origin.x = x;
      v24.origin.y = y;
      v24.size.width = width;
      v24.size.height = height;
      MinY = CGRectGetMinY(v24);
      v25.origin.x = x;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      v17 = fmax(MinY, fmin(v13, CGRectGetMaxY(v25)));
    }
    else
    {
      v15 = INFINITY;
      v17 = INFINITY;
    }
  }
  v20 = v15;
  result.y = v17;
  result.x = v20;
  return result;
}

- (CGPoint)_movementPointInNormalizedFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_FEFocusCastingController _focusEffectsControllerForFocusedItem](self, "_focusEffectsControllerForFocusedItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = x + width * (*MEMORY[0x24BDBEFB0] + 1.0) * 0.5;
    v9 = y + height * (*(double *)(MEMORY[0x24BDBEFB0] + 8) + 1.0) * 0.5;
  }
  else
  {
    v9 = INFINITY;
    v8 = INFINITY;
  }

  v10 = v8;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (id)_focusEffectsControllerForFocusedItem
{
  return 0;
}

- (void)_updateFocusMovementIndicatorDisplay
{
  -[_FEFocusCastingController _createFocusMovementIndicator](self, "_createFocusMovementIndicator");
  -[_FEFocusCastingController _positionFocusMovementIndicators](self, "_positionFocusMovementIndicators");
}

- (void)_createFocusMovementIndicator
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.PineBoard"));

}

- (void)_positionFocusMovementIndicators
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double x;
  double y;
  double width;
  double height;
  double v14;
  double v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _BOOL8 v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL8 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint8_t v44[16];
  CGRect v45;

  -[_FEFocusCastingController focusCastingIndicator](self, "focusCastingIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_FEFocusCastingController _normalizedCoordinateSpace](self, "_normalizedCoordinateSpace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[_FEFocusCastingController focusMovementIndicator](self, "focusMovementIndicator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setHidden:", 1);

      -[_FEFocusCastingController focusEntryIndicator](self, "focusEntryIndicator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setHidden:", 1);

      -[_FEFocusCastingController focusCastingIndicator](self, "focusCastingIndicator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setHidden:", 1);

      -[_FEFocusCastingController focusSystem](self, "focusSystem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "focusedItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v45.origin.x = _FEFocusItemFrameInCoordinateSpace(v9, v4);
      x = v45.origin.x;
      y = v45.origin.y;
      width = v45.size.width;
      height = v45.size.height;
      if (!CGRectIsNull(v45))
      {
        v14 = *MEMORY[0x24BDBEFB0];
        v15 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
        if (*MEMORY[0x24BDBEFB0] < 0.0)
          v14 = -*MEMORY[0x24BDBEFB0];
        v16 = 4;
        if (*MEMORY[0x24BDBEFB0] > 0.0)
          v16 = 8;
        v17 = v15 <= 0.0;
        if (v15 < 0.0)
          v15 = -v15;
        v18 = 2;
        if (v17)
          v18 = 1;
        if (v14 <= v15)
          v19 = v18;
        else
          v19 = v16;
        -[_FEFocusCastingController _movementPointInNormalizedFrame:](self, "_movementPointInNormalizedFrame:", x, y, width, height);
        v21 = v20;
        v23 = v22;
        -[_FEFocusCastingController _entryPointInNormalizedFrame:forHeading:](self, "_entryPointInNormalizedFrame:forHeading:", v19, x, y, width, height);
        v25 = v24;
        v27 = v26;
        -[_FEFocusCastingController _castingPointInNormalizedFrame:forHeading:](self, "_castingPointInNormalizedFrame:forHeading:", v19, x, y, width, height);
        v29 = v28;
        v31 = v30;
        v32 = v27 == INFINITY && v25 == INFINITY;
        -[_FEFocusCastingController focusEntryIndicator](self, "focusEntryIndicator");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setHidden:", v32);

        -[_FEFocusCastingController focusEntryIndicator](self, "focusEntryIndicator");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setBounds:", 0.0, 0.0, 20.0, 20.0);

        -[_FEFocusCastingController focusEntryIndicator](self, "focusEntryIndicator");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setCenter:", v25, v27);

        v36 = v23 == INFINITY && v21 == INFINITY;
        -[_FEFocusCastingController focusMovementIndicator](self, "focusMovementIndicator");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setHidden:", v36);

        -[_FEFocusCastingController focusMovementIndicator](self, "focusMovementIndicator");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setBounds:", 0.0, 0.0, 25.0, 25.0);

        -[_FEFocusCastingController focusMovementIndicator](self, "focusMovementIndicator");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setCenter:", v21, v23);

        -[_FEFocusCastingController focusCastingIndicator](self, "focusCastingIndicator");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setHidden:", 0);

        -[_FEFocusCastingController focusCastingIndicator](self, "focusCastingIndicator");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setBounds:", 0.0, 0.0, 30.0, 30.0);

        -[_FEFocusCastingController focusCastingIndicator](self, "focusCastingIndicator");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setCenter:", v29, v31);

      }
    }
    else
    {
      logger();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v44 = 0;
        _os_log_debug_impl(&dword_23C48C000, v43, OS_LOG_TYPE_DEBUG, "Unable to get normalized coordinate space for focus casting.", v44, 2u);
      }

    }
  }
}

- (void)_destroyFocusMovementIndicator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[_FEFocusCastingController focusMovementIndicator](self, "focusMovementIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_FEFocusCastingController focusMovementIndicator](self, "focusMovementIndicator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[_FEFocusCastingController setFocusMovementIndicator:](self, "setFocusMovementIndicator:", 0);
  }
  -[_FEFocusCastingController focusEntryIndicator](self, "focusEntryIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_FEFocusCastingController focusEntryIndicator](self, "focusEntryIndicator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[_FEFocusCastingController setFocusEntryIndicator:](self, "setFocusEntryIndicator:", 0);
  }
  -[_FEFocusCastingController focusCastingIndicator](self, "focusCastingIndicator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_FEFocusCastingController focusCastingIndicator](self, "focusCastingIndicator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperview");

    -[_FEFocusCastingController setFocusCastingIndicator:](self, "setFocusCastingIndicator:", 0);
  }
}

- (_FEFocusSystem)focusSystem
{
  return (_FEFocusSystem *)objc_loadWeakRetained((id *)&self->_focusSystem);
}

- (void)setFocusSystem:(id)a3
{
  objc_storeWeak((id *)&self->_focusSystem, a3);
}

- (double)entryPointMemorizationTimeout
{
  return self->_entryPointMemorizationTimeout;
}

- (CGPoint)screenEntryPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_screenEntryPoint.x;
  y = self->_screenEntryPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setScreenEntryPoint:(CGPoint)a3
{
  self->_screenEntryPoint = a3;
}

- (unint64_t)entryPointAxis
{
  return self->_entryPointAxis;
}

- (void)setEntryPointAxis:(unint64_t)a3
{
  self->_entryPointAxis = a3;
}

- (BOOL)isRememberingEntryPoint
{
  return self->_isRememberingEntryPoint;
}

- (void)setIsRememberingEntryPoint:(BOOL)a3
{
  self->_isRememberingEntryPoint = a3;
}

- (UIView)focusMovementIndicator
{
  return self->_focusMovementIndicator;
}

- (void)setFocusMovementIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_focusMovementIndicator, a3);
}

- (UIView)focusEntryIndicator
{
  return self->_focusEntryIndicator;
}

- (void)setFocusEntryIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_focusEntryIndicator, a3);
}

- (UIView)focusCastingIndicator
{
  return self->_focusCastingIndicator;
}

- (void)setFocusCastingIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_focusCastingIndicator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusCastingIndicator, 0);
  objc_storeStrong((id *)&self->_focusEntryIndicator, 0);
  objc_storeStrong((id *)&self->_focusMovementIndicator, 0);
  objc_destroyWeak((id *)&self->_focusSystem);
}

@end
