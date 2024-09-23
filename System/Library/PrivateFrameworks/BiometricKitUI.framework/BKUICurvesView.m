@implementation BKUICurvesView

- (void)dealloc
{
  NSXMLParser *parser;
  objc_super v4;

  parser = self->_parser;
  if (parser)
    -[NSXMLParser abortParsing](parser, "abortParsing");
  -[BKUICurvesView _waitForInit](self, "_waitForInit");
  v4.receiver = self;
  v4.super_class = (Class)BKUICurvesView;
  -[BKUICurvesView dealloc](&v4, sel_dealloc);
}

- (float)progress
{
  return self->_progress;
}

- (void)_resetLayers
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_pathLayers;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "removeFromSuperlayer", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_pathLayers, "removeAllObjects");
  self->_currentLayer = 0;
}

- (void)_animateFromLayer:(unint64_t)a3 toLayer:(unint64_t)a4 withColor:(id)a5
{
  unint64_t v8;
  unint64_t v9;

  if (a3 < a4)
  {
    v8 = a4 - 1;
    do
    {
      v9 = a3 + 1;
      -[BKUICurvesView _startAnimation:withColor:isLast:](self, "_startAnimation:withColor:isLast:", a3, a5, v8 == a3);
      a3 = v9;
    }
    while (a4 != v9);
  }
}

- (unint64_t)_animateFromLayer:(unint64_t)a3 toProgress:(float)a4 withColor:(id)a5
{
  NSMutableArray *paths;
  id v9;
  unint64_t v10;

  paths = self->_paths;
  v9 = a5;
  v10 = (unint64_t)(float)((float)(unint64_t)-[NSMutableArray count](paths, "count") * a4);
  -[BKUICurvesView _animateFromLayer:toLayer:withColor:](self, "_animateFromLayer:toLayer:withColor:", a3, v10, v9);

  return v10;
}

- (void)_animateEstimateFailure
{
  -[BKUICurvesView _animateFromLayer:toLayer:withColor:](self, "_animateFromLayer:toLayer:withColor:", self->_preEstimateLayer, self->_currentLayer, self->_color);
  self->_currentLayer = self->_preEstimateLayer;
}

- (void)_checkEstimateFailedAfterAnimation:(id)a3
{
  CABasicAnimation *v4;
  CABasicAnimation *lastAnimation;
  CABasicAnimation *v6;

  v4 = (CABasicAnimation *)a3;
  if (self->_lastAnimation == v4)
  {
    lastAnimation = v4;
    v6 = v4;
    if (self->_estimateFailed)
    {
      if (self->_progress < 1.0)
        -[BKUICurvesView _animateEstimateFailure](self, "_animateEstimateFailure");
      self->_estimateFailed = 0;
      lastAnimation = self->_lastAnimation;
    }
    self->_lastAnimation = 0;

    v4 = v6;
    self->_estimating = 0;
  }

}

- (void)_resetEstimate:(id)a3
{
  if (self->_progress < 1.0)
  {
    self->_preEstimateLayer = objc_msgSend(a3, "unsignedIntegerValue");
    self->_estimateFailed = 1;
    -[BKUICurvesView estimateFailed](self, "estimateFailed");
  }
}

- (void)estimateProgress:(float)a3
{
  NSObject *bkui_curves_view_log;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  float v14;
  float v15;
  float v16;
  unint64_t currentLayer;
  void *v18;
  double v19;

  bkui_curves_view_log = self->bkui_curves_view_log;
  if (os_log_type_enabled(bkui_curves_view_log, OS_LOG_TYPE_DEBUG))
    -[BKUICurvesView estimateProgress:].cold.1(bkui_curves_view_log, v6, v7, v8, v9, v10, v11, v12);
  if (!self->_estimating)
  {
    self->_estimating = 1;
    v13 = self->_progress + a3;
    v14 = (float)(self->_currentLayer + 1);
    v15 = v14 / (float)(unint64_t)-[NSMutableArray count](self->_paths, "count");
    if (v13 >= v15)
      v15 = v13;
    v16 = fminf(v15, 1.0);
    self->_preEstimateLayer = self->_currentLayer;
    currentLayer = self->_currentLayer;
    objc_msgSend(MEMORY[0x1E0CEA478], "systemPinkColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v19 = v16;
    self->_currentLayer = -[BKUICurvesView _animateFromLayer:toProgress:withColor:](self, "_animateFromLayer:toProgress:withColor:", currentLayer, v18, v19);

    -[BKUICurvesView _addEstimateWatchDog](self, "_addEstimateWatchDog");
  }
}

- (void)estimateFailed
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DB281000, log, OS_LOG_TYPE_DEBUG, "BiometricKitUI: Estimate failed", v1, 2u);
}

- (void)setProgress:(float)a3
{
  NSObject *bkui_curves_view_log;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float v13;
  float v14;
  unint64_t v15;
  unint64_t currentLayer;
  void *v17;
  uint64_t v18;

  bkui_curves_view_log = self->bkui_curves_view_log;
  if (os_log_type_enabled(bkui_curves_view_log, OS_LOG_TYPE_DEBUG))
    -[BKUICurvesView setProgress:].cold.1(bkui_curves_view_log, v6, v7, v8, v9, v10, v11, v12);
  -[BKUICurvesView _removeEstimateWatchDog](self, "_removeEstimateWatchDog");
  if (a3 <= 1.0)
    v13 = a3;
  else
    v13 = 1.0;
  v14 = fmaxf(v13, 0.0);
  if (v14 == 0.0)
  {
    -[BKUICurvesView _resetLayers](self, "_resetLayers");
    v14 = 0.0;
    goto LABEL_18;
  }
  v15 = (unint64_t)(float)(v14 * (float)(unint64_t)-[NSMutableArray count](self->_paths, "count"));
  currentLayer = self->_currentLayer;
  if (v14 == 1.0 && currentLayer < v15)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUICurvesView _animateFromLayer:toLayer:withColor:](self, "_animateFromLayer:toLayer:withColor:", currentLayer, v15, v17);

LABEL_17:
    self->_currentLayer = v15;
    goto LABEL_18;
  }
  v18 = -[NSMutableArray count](self->_paths, "count");
  if (v14 < 1.0 && currentLayer == v18)
  {
    -[BKUICurvesView _animateFromLayer:toLayer:withColor:](self, "_animateFromLayer:toLayer:withColor:", v15, self->_currentLayer, self->_color);
    goto LABEL_17;
  }
LABEL_18:
  self->_progress = v14;
  self->_estimating = 0;
}

- (CGPoint)_getPoint:(id)a3
{
  void *v3;
  void *v4;
  float v5;
  double v6;
  void *v7;
  float v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(","));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  v10 = v6;
  v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (void)_waitForInit
{
  -[NSCondition lock](self->_initCondition, "lock");
  while (!self->_inited)
    -[NSCondition wait](self->_initCondition, "wait");
  -[NSCondition unlock](self->_initCondition, "unlock");
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  void *v4;
  id v5;

  objc_msgSend(a3, "valueForKey:", CFSTR("oldLayer"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "removeFromSuperlayer");
    v4 = v5;
  }

}

- (void)_startAnimation:(unint64_t)a3 withColor:(id)a4 isLast:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  float v18;
  double v19;
  CGFloat v20;
  double v21;
  void *v22;
  CGPath *v23;
  void *v24;
  float v25;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  float v30;
  void *v31;
  CGAffineTransform v32;
  CGAffineTransform v33;

  v5 = a5;
  v8 = a4;
  if (-[NSMutableArray count](self->_paths, "count") > a3)
  {
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKUICurvesView bounds](self, "bounds");
    v11 = v10;
    -[UIBezierPath bounds](self->_wholePath, "bounds");
    v13 = v11 / v12;
    -[BKUICurvesView bounds](self, "bounds");
    v15 = v14;
    -[UIBezierPath bounds](self->_wholePath, "bounds");
    v17 = v15 / v16;
    if (v13 < v15 / v16)
      v17 = v13;
    v18 = v17;
    memset(&v33, 0, sizeof(v33));
    CGAffineTransformMakeScale(&v32, v18, v18);
    -[UIBezierPath bounds](self->_wholePath, "bounds");
    v20 = -v19;
    -[UIBezierPath bounds](self->_wholePath, "bounds");
    CGAffineTransformTranslate(&v33, &v32, v20, -v21);
    -[NSMutableArray objectAtIndexedSubscript:](self->_paths, "objectAtIndexedSubscript:", a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[BKUICurvesView newQuartzPath:transform:](self, "newQuartzPath:transform:", v22, &v33);

    objc_msgSend(v9, "setPath:", v23);
    CFRelease(v23);
    objc_msgSend(v9, "setStrokeColor:", objc_msgSend(objc_retainAutorelease(v8), "CGColor"));
    objc_msgSend(v9, "setFillColor:", 0);
    objc_msgSend(v9, "setLineWidth:", 1.5);
    objc_msgSend(v9, "setLineJoin:", *MEMORY[0x1E0CD3020]);
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("strokeEnd"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setFromValue:", &unk_1EA298A10);
    objc_msgSend(v24, "setToValue:", &unk_1EA298A20);
    -[NSNumber floatValue](self->_speed, "floatValue");
    objc_msgSend(v24, "setDuration:", v25);
    objc_storeStrong((id *)&self->_lastAnimation, v24);
    if (v5)
    {
      objc_msgSend(v24, "duration");
      -[BKUICurvesView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__checkEstimateFailedAfterAnimation_, v24, v26 + 0.0500000007);
    }
    objc_msgSend(v9, "addAnimation:forKey:", v24, CFSTR("strokeEnd"));
    if (-[NSMutableArray count](self->_pathLayers, "count") > a3
      && (-[NSMutableArray objectAtIndexedSubscript:](self->_pathLayers, "objectAtIndexedSubscript:", a3),
          (v27 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v28 = (void *)v27;
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setFromValue:", &unk_1EA298A20);
      objc_msgSend(v29, "setToValue:", &unk_1EA298A30);
      -[NSNumber floatValue](self->_speed, "floatValue");
      objc_msgSend(v29, "setDuration:", v30);
      objc_msgSend(v29, "setDelegate:", self);
      objc_msgSend(v29, "setValue:forKey:", v28, CFSTR("oldLayer"));
      objc_msgSend(v28, "addAnimation:forKey:", v29, CFSTR("opacity"));
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_pathLayers, "replaceObjectAtIndex:withObject:", a3, v9);

    }
    else
    {
      -[NSMutableArray addObject:](self->_pathLayers, "addObject:", v9);
    }
    -[BKUICurvesView layer](self, "layer");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSublayer:", v9);

  }
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  char v21;
  int v22;
  char v23;
  char v24;
  void *v25;
  int v26;
  BOOL v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  BOOL v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  void *v90;
  id v91;
  id v92;
  id v93;
  id v94;
  id v95;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("path")))
  {
    v92 = v15;
    v93 = v14;
    v94 = v13;
    v95 = v12;
    v91 = v16;
    objc_msgSend(v16, "valueForKey:", CFSTR("d"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc_init(MEMORY[0x1E0CEA390]);
    v90 = v17;
    objc_msgSend(v17, "componentsSeparatedByString:", CFSTR(" "));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v21 = 0;
    v22 = 0;
LABEL_3:
    v23 = 0;
LABEL_4:
    v24 = v23;
    while (objc_msgSend(v19, "count") > (unint64_t)v22)
    {
      objc_msgSend(v19, "objectAtIndexedSubscript:", v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "characterAtIndex:", 0);

      if ((v26 & 0xFFFFFFDF) == 0x4D)
      {
        objc_msgSend(v19, "objectAtIndexedSubscript:", v22 + 1);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[BKUICurvesView _getPoint:](self, "_getPoint:", v56);
        v58 = v57;
        v60 = v59;
        v22 += 2;

        v23 = 1;
        objc_msgSend(v18, "moveToPoint:", v58, v60);
        v21 = 0;
        goto LABEL_4;
      }
      v27 = v26 != 108;
      if (v26 == 108)
      {
        objc_msgSend(v18, "currentPoint");
        v48 = v47;
        v50 = v49;
        objc_msgSend(v19, "objectAtIndexedSubscript:", v22 + 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[BKUICurvesView _getPoint:](self, "_getPoint:", v51);
        v53 = v52;
        v55 = v54;
        v22 += 2;

        -[BKUICurvesView _path:drawLineToPoint:](self, "_path:drawLineToPoint:", v18, v48 + v53, v50 + v55);
        v21 = v27;
      }
      else
      {
        if ((v26 | 0x20) == 0x63)
        {
          objc_msgSend(v18, "currentPoint");
          v71 = v70;
          v73 = v72;
          v74 = v26 == 67;
          objc_msgSend(v19, "objectAtIndexedSubscript:", v22 + 1);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          -[BKUICurvesView _getPoint:](self, "_getPoint:", v75);
          v77 = v76;
          v79 = v78;

          objc_msgSend(v19, "objectAtIndexedSubscript:", v22 + 2);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          -[BKUICurvesView _getPoint:](self, "_getPoint:", v80);
          v82 = v81;
          v84 = v83;

          objc_msgSend(v19, "objectAtIndexedSubscript:", v22 + 3);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          -[BKUICurvesView _getPoint:](self, "_getPoint:", v85);
          v87 = v86;
          v89 = v88;
          v20 |= v74;

          if ((v20 & 1) == 0)
          {
            v87 = v71 + v87;
            v89 = v73 + v89;
            v77 = v71 + v77;
            v79 = v73 + v79;
            v82 = v71 + v82;
            v84 = v73 + v84;
          }
          -[BKUICurvesView _path:drawCurveToPoint:controlPoint1:controlPoint2:](self, "_path:drawCurveToPoint:controlPoint1:controlPoint2:", v18, v87, v89, v77, v79, v82, v84);
          v22 += 4;
          objc_msgSend(v18, "currentPoint");
          goto LABEL_3;
        }
        if ((v21 & 1) == 0)
        {
          v23 = 0;
          v21 = 1;
          if ((v24 & 1) != 0)
          {
            objc_msgSend(v18, "currentPoint");
            v62 = v61;
            v64 = v63;
            objc_msgSend(v19, "objectAtIndexedSubscript:", v22);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            -[BKUICurvesView _getPoint:](self, "_getPoint:", v65);
            v67 = v66;
            v69 = v68;
            ++v22;

            v23 = 1;
            -[BKUICurvesView _path:drawLineToPoint:](self, "_path:drawLineToPoint:", v18, v62 + v67, v64 + v69);
            v21 = 0;
          }
          goto LABEL_4;
        }
        objc_msgSend(v18, "currentPoint");
        v29 = v28;
        v31 = v30;
        objc_msgSend(v19, "objectAtIndexedSubscript:", v22);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[BKUICurvesView _getPoint:](self, "_getPoint:", v32);
        v34 = v33;
        v36 = v35;

        objc_msgSend(v19, "objectAtIndexedSubscript:", v22 + 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[BKUICurvesView _getPoint:](self, "_getPoint:", v37);
        v39 = v38;
        v41 = v40;

        objc_msgSend(v19, "objectAtIndexedSubscript:", v22 + 2);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[BKUICurvesView _getPoint:](self, "_getPoint:", v42);
        v44 = v43;
        v46 = v45;

        if ((v20 & 1) == 0)
        {
          v44 = v29 + v44;
          v46 = v31 + v46;
          v34 = v29 + v34;
          v36 = v31 + v36;
          v39 = v29 + v39;
          v41 = v31 + v41;
        }
        -[BKUICurvesView _path:drawCurveToPoint:controlPoint1:controlPoint2:](self, "_path:drawCurveToPoint:controlPoint1:controlPoint2:", v18, v44, v46, v34, v36, v39, v41);
        v22 += 3;
        objc_msgSend(v18, "currentPoint");
        v21 = v27;
      }
    }
    -[UIBezierPath appendPath:](self->_wholePath, "appendPath:", v18);
    -[NSMutableArray addObject:](self->_paths, "addObject:", v18);

    v13 = v94;
    v12 = v95;
    v15 = v92;
    v14 = v93;
    v16 = v91;

  }
}

- (void)_path:(id)a3 drawCurveToPoint:(CGPoint)a4 controlPoint1:(CGPoint)a5 controlPoint2:(CGPoint)a6
{
  objc_msgSend(a3, "addCurveToPoint:controlPoint1:controlPoint2:", a4.x, a4.y, a5.x, a5.y, a6.x, a6.y);
}

- (void)_path:(id)a3 drawLineToPoint:(CGPoint)a4
{
  objc_msgSend(a3, "addLineToPoint:", a4.x, a4.y);
}

- (void)loadDataFromXML:(id)a3 name:(id)a4 color:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_os_log *v11;
  OS_os_log *bkui_curves_view_log;
  UIBezierPath *v13;
  UIBezierPath *wholePath;
  NSMutableArray *v15;
  NSMutableArray *paths;
  id v17;
  double v18;
  NSNumber *v19;
  NSNumber *speed;
  NSMutableArray *v21;
  NSMutableArray *pathLayers;
  CAShapeLayer *fingerLayer;
  NSCondition *v24;
  NSCondition *initCondition;
  NSObject *v26;
  NSObject *v27;
  id v28;
  id v29;
  _QWORD block[5];
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (OS_os_log *)os_log_create("com.apple.biometrickitui", "CurvesView");
  bkui_curves_view_log = self->bkui_curves_view_log;
  self->bkui_curves_view_log = v11;

  objc_storeStrong((id *)&self->_color, a5);
  v13 = (UIBezierPath *)objc_alloc_init(MEMORY[0x1E0CEA390]);
  wholePath = self->_wholePath;
  self->_wholePath = v13;

  v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  paths = self->_paths;
  self->_paths = v15;

  v17 = objc_alloc(MEMORY[0x1E0CB37E8]);
  LODWORD(v18) = 0.5;
  v19 = (NSNumber *)objc_msgSend(v17, "initWithFloat:", v18);
  speed = self->_speed;
  self->_speed = v19;

  v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  pathLayers = self->_pathLayers;
  self->_pathLayers = v21;

  fingerLayer = self->_fingerLayer;
  self->_fingerLayer = 0;

  self->_currentLayer = 0;
  self->_preEstimateLayer = 0;
  self->_lastRatio = 0.0;
  self->_inited = 0;
  v24 = (NSCondition *)objc_alloc_init(MEMORY[0x1E0CB3530]);
  initCondition = self->_initCondition;
  self->_initCondition = v24;

  self->_lastFrameSize = (CGSize)*MEMORY[0x1E0C9D820];
  v26 = self->bkui_curves_view_log;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    v34 = v8;
    v35 = 2112;
    v36 = v9;
    v37 = 2112;
    v38 = v10;
    _os_log_impl(&dword_1DB281000, v26, OS_LOG_TYPE_INFO, "BiometricKitUI: Loading bundle: \"%@\" with name: \"%@\", and color: \"%@\", buf, 0x20u);
  }
  dispatch_get_global_queue(0, 0);
  v27 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__BKUICurvesView_loadDataFromXML_name_color___block_invoke;
  block[3] = &unk_1EA27FCA0;
  block[4] = self;
  v31 = v8;
  v32 = v9;
  v28 = v9;
  v29 = v8;
  dispatch_async(v27, block);

}

void __45__BKUICurvesView_loadDataFromXML_name_color___block_invoke(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  const void *v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t);
  void *v41;
  id v42;
  id v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 536);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __45__BKUICurvesView_loadDataFromXML_name_color___block_invoke_cold_2((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  objc_msgSend(*(id *)(a1 + 40), "pathForResource:ofType:", *(_QWORD *)(a1 + 48), CFSTR("svg"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B28]), "initWithData:", v11);
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 504);
  *(_QWORD *)(v13 + 504) = v12;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "setDelegate:");
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "parse"))
  {
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v2, "bounds");
    v17 = v16;
    v19 = v18;
    objc_msgSend(*((id *)*v2 + 64), "bounds");
    v21 = v17 / v20;
    objc_msgSend(*((id *)*v2 + 64), "bounds");
    v23 = v19 / v22;
    memset(&v45.c, 0, 32);
    if (v21 < v19 / v22)
      v23 = v21;
    *(_OWORD *)&v45.a = 0uLL;
    CGAffineTransformMakeScale(&v44, v23, v23);
    objc_msgSend(*((id *)*v2 + 64), "bounds");
    v25 = -v24;
    objc_msgSend(*((id *)*v2 + 64), "bounds");
    CGAffineTransformTranslate(&v45, &v44, v25, -v26);
    v27 = (const void *)objc_msgSend(*v2, "newQuartzPath:transform:", *((_QWORD *)*v2 + 64), &v45);
    objc_msgSend(v15, "setPath:", v27);
    CFRelease(v27);
    objc_msgSend(v15, "setStrokeColor:", objc_msgSend(*((id *)*v2 + 53), "CGColor"));
    objc_msgSend(v15, "setFillColor:", 0);
    objc_msgSend(v15, "setLineWidth:", 1.5);
    objc_msgSend(v15, "setLineJoin:", *MEMORY[0x1E0CD3020]);
    v38 = MEMORY[0x1E0C809B0];
    v39 = 3221225472;
    v40 = __45__BKUICurvesView_loadDataFromXML_name_color___block_invoke_29;
    v41 = &unk_1EA27FC78;
    v42 = *v2;
    v43 = v15;
    v28 = v15;
    dispatch_async(MEMORY[0x1E0C80D38], &v38);

  }
  else
  {
    v29 = *((_QWORD *)*v2 + 67);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      __45__BKUICurvesView_loadDataFromXML_name_color___block_invoke_cold_1((uint64_t)v2, v29, v30, v31, v32, v33, v34, v35);
  }
  v36 = *((_QWORD *)*v2 + 67);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    v37 = *v2;
    LODWORD(v45.a) = 138412290;
    *(_QWORD *)((char *)&v45.a + 4) = v37;
    _os_log_impl(&dword_1DB281000, v36, OS_LOG_TYPE_INFO, "BiometricKitUI: dispatch_async exit, self = %@", (uint8_t *)&v45, 0xCu);
  }
  objc_msgSend(*((id *)*v2 + 61), "lock", v38, v39, v40, v41, v42);
  *((_BYTE *)*v2 + 496) = 1;
  objc_msgSend(*((id *)*v2 + 61), "signal");
  objc_msgSend(*((id *)*v2 + 61), "unlock");

}

uint64_t __45__BKUICurvesView_loadDataFromXML_name_color___block_invoke_29(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSublayer:", *(_QWORD *)(a1 + 40));

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 528), *(id *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "sublayerSize");
  return objc_msgSend(v3, "setSublayersSize:");
}

- (void)_addEstimateWatchDog
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_preEstimateLayer);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BKUICurvesView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__resetEstimate_, v3, 2.0);

}

- (void)_removeEstimateWatchDog
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x1E0DE7910];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_preEstimateLayer);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__resetEstimate_, v4);

}

- (CGPath)newQuartzPath:(id)a3 transform:(CGAffineTransform *)a4
{
  objc_msgSend(objc_retainAutorelease(a3), "CGPath");
  JUMPOUT(0x1DF0AB814);
}

- (void)setSublayersSize:(CGSize)a3
{
  double height;
  double width;
  NSObject *bkui_curves_view_log;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  double lastRatio;
  double v13;
  CGFloat v14;
  double v15;
  CGPath *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  CGPath *v25;
  NSObject *v26;
  CGAffineTransform v27;
  CGAffineTransform buf;
  uint64_t v29;

  height = a3.height;
  width = a3.width;
  v29 = *MEMORY[0x1E0C80C00];
  bkui_curves_view_log = self->bkui_curves_view_log;
  if (os_log_type_enabled(bkui_curves_view_log, OS_LOG_TYPE_DEBUG))
    -[BKUICurvesView setSublayersSize:].cold.2(bkui_curves_view_log, width, height);
  -[BKUICurvesView _waitForInit](self, "_waitForInit");
  if (self->_fingerLayer)
  {
    self->_lastFrameSize.width = width;
    self->_lastFrameSize.height = height;
    -[UIBezierPath bounds](self->_wholePath, "bounds");
    v8 = width / v7;
    -[UIBezierPath bounds](self->_wholePath, "bounds");
    if (v8 >= height / v9)
      v10 = height / v9;
    else
      v10 = v8;
    v11 = self->bkui_curves_view_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      lastRatio = self->_lastRatio;
      LODWORD(buf.a) = 134218240;
      *(double *)((char *)&buf.a + 4) = v10;
      WORD2(buf.b) = 2048;
      *(double *)((char *)&buf.b + 6) = lastRatio;
      _os_log_impl(&dword_1DB281000, v11, OS_LOG_TYPE_DEFAULT, "setSublayersSize %f (%f)", (uint8_t *)&buf, 0x16u);
    }
    if (v10 != self->_lastRatio)
    {
      self->_lastRatio = v10;
      memset(&buf, 0, sizeof(buf));
      CGAffineTransformMakeScale(&v27, v10, v10);
      -[UIBezierPath bounds](self->_wholePath, "bounds");
      v14 = -v13;
      -[UIBezierPath bounds](self->_wholePath, "bounds");
      CGAffineTransformTranslate(&buf, &v27, v14, -v15);
      v16 = -[BKUICurvesView newQuartzPath:transform:](self, "newQuartzPath:transform:", self->_wholePath, &buf);
      -[CAShapeLayer setPath:](self->_fingerLayer, "setPath:", v16);
      CFRelease(v16);
      -[BKUICurvesView layer](self, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sublayers");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v19 >= 2)
      {
        for (i = 1; i != v19; ++i)
        {
          if (-[NSMutableArray count](self->_paths, "count") > (unint64_t)(i - 1))
          {
            -[BKUICurvesView layer](self, "layer");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "sublayers");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectAtIndex:", i);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSMutableArray objectAtIndexedSubscript:](self->_paths, "objectAtIndexedSubscript:", i - 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = -[BKUICurvesView newQuartzPath:transform:](self, "newQuartzPath:transform:", v24, &buf);

            objc_msgSend(v23, "setPath:", v25);
            CFRelease(v25);

          }
        }
      }
    }
  }
  else
  {
    v26 = self->bkui_curves_view_log;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[BKUICurvesView setSublayersSize:].cold.1(v26);
    -[BKUICurvesView setSublayerSize:](self, "setSublayerSize:", width, height);
  }
}

- (NSNumber)speed
{
  return (NSNumber *)objc_getProperty(self, a2, 544, 1);
}

- (void)setSpeed:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 544);
}

- (CGSize)sublayerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_sublayerSize.width;
  height = self->_sublayerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSublayerSize:(CGSize)a3
{
  self->_sublayerSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speed, 0);
  objc_storeStrong((id *)&self->bkui_curves_view_log, 0);
  objc_storeStrong((id *)&self->_fingerLayer, 0);
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_wholePath, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_initCondition, 0);
  objc_storeStrong((id *)&self->_lastAnimation, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_pathLayers, 0);
}

- (void)estimateProgress:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DB281000, a1, a3, "BiometricKitUI: Estimated increase: %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)setProgress:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DB281000, a1, a3, "BiometricKitUI: Progress set to: %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)parser:(uint64_t)a3 didStartElement:(uint64_t)a4 namespaceURI:(uint64_t)a5 qualifiedName:(uint64_t)a6 attributes:(uint64_t)a7 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1DB281000, a2, a3, "BiometricKitUI: Parsing error when processing: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __45__BKUICurvesView_loadDataFromXML_name_color___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1DB281000, a2, a3, "BiometricKitUI: NSXML parser failed or aborted, self = %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __45__BKUICurvesView_loadDataFromXML_name_color___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DB281000, a2, a3, "BiometricKitUI: dispatch_async entry, self = %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)setSublayersSize:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB281000, log, OS_LOG_TYPE_ERROR, "BiometricKitUI: Error: _fingerLayer == nil!", v1, 2u);
}

- (void)setSublayersSize:(double)a3 .cold.2(os_log_t log, double a2, double a3)
{
  int v3;
  double v4;
  __int16 v5;
  double v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a2;
  v5 = 2048;
  v6 = a3;
  _os_log_debug_impl(&dword_1DB281000, log, OS_LOG_TYPE_DEBUG, "BiometricKitUI: setSublayersSize entry, frameSize=[%f,%f]", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

@end
