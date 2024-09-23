@implementation VKMapDebugView

+ (id)sharedInstance
{
  return 0;
}

- (void)setDebugMessage:(id)a3
{
  NSString *v4;
  NSString *debugMessage;
  NSString *v6;

  v6 = (NSString *)a3;
  if (self->_debugMessage != v6)
  {
    v4 = (NSString *)-[NSString copy](v6, "copy");
    debugMessage = self->_debugMessage;
    self->_debugMessage = v4;

    -[VKMapDebugView setNeedsDisplay](self, "setNeedsDisplay");
  }

}

- (void)_orientationDidChange:(id)a3
{
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __40__VKMapDebugView__orientationDidChange___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");

  return objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplay");
}

- (void)addBuildingPaths:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VKMapDebugView buildingPaths](self, "buildingPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapDebugView _addValidPaths:array:](self, "_addValidPaths:array:", v5, v4);

}

- (void)setCurrentPoint:(CGPoint)a3 frontierPoint:(CGPoint)a4
{
  double y;
  double x;

  y = a4.y;
  x = a4.x;
  -[VKMapDebugView setCurrentPoint:](self, "setCurrentPoint:", a3.x, a3.y);
  -[VKMapDebugView setFrontierPoint:](self, "setFrontierPoint:", x, y);
  -[VKMapDebugView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)addIntersectionPoints:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        -[VKMapDebugView intersectionPoints](self, "intersectionPoints", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  -[VKMapDebugView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)addPOIPaths:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VKMapDebugView poiPaths](self, "poiPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapDebugView _addValidPaths:array:](self, "_addValidPaths:array:", v5, v4);

}

- (void)addRoadPoints:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VKMapDebugView roadPoints](self, "roadPoints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

}

- (void)addRoadPaths:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[VKMapDebugView roadPaths](self, "roadPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapDebugView _addValidPaths:array:](self, "_addValidPaths:array:", v5, v4);

}

- (void)setCurrentExplorationVertex:(id)a3
{
  objc_storeStrong((id *)&self->_currentExplorationElement, a3);
  -[VKMapDebugView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)removePointsAndPaths
{
  void *v3;
  double *v4;
  void *v5;
  void *v6;
  void *v7;

  -[VKMapDebugView buildingPaths](self, "buildingPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  v4 = (double *)MEMORY[0x24BDBEFB0];
  -[VKMapDebugView setCurrentPoint:](self, "setCurrentPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  -[VKMapDebugView setFrontierPoint:](self, "setFrontierPoint:", *v4, v4[1]);
  -[VKMapDebugView poiPaths](self, "poiPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  -[VKMapDebugView roadPaths](self, "roadPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[VKMapDebugView roadPoints](self, "roadPoints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeAllObjects");

  -[VKMapDebugView setDebugMessage:](self, "setDebugMessage:", 0);
  -[VKMapDebugView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)removeExplorationPointsAndPaths
{
  id v3;

  -[VKMapDebugView setCurrentExplorationElement:](self, "setCurrentExplorationElement:", 0);
  -[VKMapDebugView intersectionPoints](self, "intersectionPoints");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

- (void)_addValidPaths:(id)a3 array:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  const CGPath *v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;
  CGRect BoundingBox;
  CGRect v24;
  CGRect v25;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v8);
        v12 = *(const CGPath **)(*((_QWORD *)&v17 + 1) + 8 * i);
        BoundingBox = CGPathGetBoundingBox(v12);
        x = BoundingBox.origin.x;
        y = BoundingBox.origin.y;
        width = BoundingBox.size.width;
        height = BoundingBox.size.height;
        if (!CGRectIsEmpty(BoundingBox))
        {
          v24.origin.x = x;
          v24.origin.y = y;
          v24.size.width = width;
          v24.size.height = height;
          if (!CGRectIsInfinite(v24))
          {
            v25.origin.x = x;
            v25.origin.y = y;
            v25.size.width = width;
            v25.size.height = height;
            if (!CGRectIsNull(v25))
              objc_msgSend(v7, "addObject:", v12, (_QWORD)v17);
          }
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  -[VKMapDebugView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BDF76D8], 0);

  v4.receiver = self;
  v4.super_class = (Class)VKMapDebugView;
  -[VKMapDebugView dealloc](&v4, sel_dealloc);
}

- (VKMapDebugView)initWithFrame:(CGRect)a3
{
  char *v3;
  id v4;
  void *v5;
  _OWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)VKMapDebugView;
  v3 = -[VKMapDebugView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = (void *)*((_QWORD *)v3 + 53);
    *((_QWORD *)v3 + 53) = v4;

    v6 = (_OWORD *)MEMORY[0x24BDBEFB0];
    *(_OWORD *)(v3 + 472) = *MEMORY[0x24BDBEFB0];
    *(_OWORD *)(v3 + 488) = *v6;
    v7 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v8 = (void *)*((_QWORD *)v3 + 54);
    *((_QWORD *)v3 + 54) = v7;

    v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v10 = (void *)*((_QWORD *)v3 + 55);
    *((_QWORD *)v3 + 55) = v9;

    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v12 = (void *)*((_QWORD *)v3 + 56);
    *((_QWORD *)v3 + 56) = v11;

    v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v14 = (void *)*((_QWORD *)v3 + 57);
    *((_QWORD *)v3 + 57) = v13;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v3, sel__orientationDidChange_, *MEMORY[0x24BDF76D8], 0);

  }
  return (VKMapDebugView *)v3;
}

- (void)drawRect:(CGRect)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  const CGPath *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t m;
  const CGPath *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t n;
  double v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t ii;
  double v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  double *v77;
  double v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  double v83;
  double v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t jj;
  const CGPath *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  void *v107;
  void *v108;
  void *v109;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  uint64_t v139;
  void *v140;
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  uint64_t v148;

  v148 = *MEMORY[0x24BDAC8D0];
  -[VKMapDebugView currentExplorationElement](self, "currentExplorationElement", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[VKMapDebugView currentExplorationElement](self, "currentExplorationElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getScreenPoint");
    v6 = v5;
    v8 = v7;

    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v6, v8, 26.0, 0.0, 6.28318531);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "redColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "colorWithAlphaComponent:", 0.5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setStroke");

    objc_msgSend(v109, "setLineWidth:", 2.0);
    objc_msgSend(v109, "stroke");
    v137 = 0u;
    v138 = 0u;
    v135 = 0u;
    v136 = 0u;
    -[VKMapDebugView currentExplorationElement](self, "currentExplorationElement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "edges");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v135, v147, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v136;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v136 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v135 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDF6870], "bezierPath");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "vertices");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v18, "count") >= 2)
          {
            objc_msgSend(v18, "firstObject");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "getScreenPoint");
            objc_msgSend(v17, "moveToPoint:");

            objc_msgSend(v18, "objectAtIndex:", 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "getScreenPoint");
            objc_msgSend(v17, "addLineToPoint:");

            objc_msgSend(MEMORY[0x24BDF6950], "redColor");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "colorWithAlphaComponent:", 0.5);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setStroke");

            objc_msgSend(v17, "setLineWidth:", 2.0);
            objc_msgSend(v17, "stroke");
          }

        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v135, v147, 16);
      }
      while (v13);
    }

    v133 = 0u;
    v134 = 0u;
    v131 = 0u;
    v132 = 0u;
    -[VKMapDebugView currentExplorationElement](self, "currentExplorationElement");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "neighbors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v131, v146, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v132;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v132 != v26)
            objc_enumerationMutation(v24);
          v28 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * j);
          objc_msgSend(v28, "getScreenPoint");
          objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v28, "isComputed"))
          {
            objc_msgSend(MEMORY[0x24BDF6950], "redColor");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "colorWithAlphaComponent:", 0.5);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDF6950], "redColor");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "colorWithAlphaComponent:", 0.0);
          }
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setFill");

          objc_msgSend(v29, "fill");
          objc_msgSend(MEMORY[0x24BDF6950], "redColor");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "colorWithAlphaComponent:", 0.5);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setStroke");

          objc_msgSend(v29, "setLineWidth:", 2.0);
          objc_msgSend(v29, "stroke");

        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v131, v146, 16);
      }
      while (v25);
    }

  }
  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  -[VKMapDebugView roadPaths](self, "roadPaths");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v127, v145, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v128;
    do
    {
      for (k = 0; k != v35; ++k)
      {
        if (*(_QWORD *)v128 != v36)
          objc_enumerationMutation(v34);
        v38 = *(const CGPath **)(*((_QWORD *)&v127 + 1) + 8 * k);
        if (!CGPathIsEmpty(v38))
        {
          objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithCGPath:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setLineWidth:", 1.0);
          objc_msgSend(MEMORY[0x24BDF6950], "blueColor");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "colorWithAlphaComponent:", 0.125);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setFill");

          objc_msgSend(MEMORY[0x24BDF6950], "blueColor");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setStroke");

          objc_msgSend(v39, "fill");
          objc_msgSend(v39, "stroke");
          objc_msgSend(MEMORY[0x24BDF6950], "blueColor");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "colorWithAlphaComponent:", 0.800000012);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setStroke");

          objc_msgSend(v39, "stroke");
        }
      }
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v127, v145, 16);
    }
    while (v35);
  }

  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  -[VKMapDebugView poiPaths](self, "poiPaths");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v123, v144, 16);
  if (v46)
  {
    v47 = *(_QWORD *)v124;
    do
    {
      for (m = 0; m != v46; ++m)
      {
        if (*(_QWORD *)v124 != v47)
          objc_enumerationMutation(v45);
        v49 = *(const CGPath **)(*((_QWORD *)&v123 + 1) + 8 * m);
        if (!CGPathIsEmpty(v49))
        {
          objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithCGPath:", v49);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setLineWidth:", 1.0);
          objc_msgSend(MEMORY[0x24BDF6950], "greenColor");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "colorWithAlphaComponent:", 0.125);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "setFill");

          objc_msgSend(MEMORY[0x24BDF6950], "greenColor");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "setStroke");

          objc_msgSend(v50, "fill");
          objc_msgSend(v50, "stroke");
          objc_msgSend(MEMORY[0x24BDF6950], "greenColor");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "colorWithAlphaComponent:", 0.800000012);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "setStroke");

          objc_msgSend(v50, "stroke");
        }
      }
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v123, v144, 16);
    }
    while (v46);
  }

  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  -[VKMapDebugView intersectionPoints](self, "intersectionPoints");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v119, v143, 16);
  if (v57)
  {
    v58 = *(_QWORD *)v120;
    do
    {
      for (n = 0; n != v57; ++n)
      {
        if (*(_QWORD *)v120 != v58)
          objc_enumerationMutation(v56);
        objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 8 * n), "CGPointValue");
        objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", v60 + -6.0, v61 + -6.0, 12.0, 12.0, 3.0);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setLineWidth:", 2.0);
        objc_msgSend(MEMORY[0x24BDF6950], "redColor");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "colorWithAlphaComponent:", 0.125);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "setFill");

        objc_msgSend(MEMORY[0x24BDF6950], "redColor");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setStroke");

        objc_msgSend(v62, "fill");
        objc_msgSend(v62, "stroke");

      }
      v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v119, v143, 16);
    }
    while (v57);
  }

  v117 = 0u;
  v118 = 0u;
  v115 = 0u;
  v116 = 0u;
  -[VKMapDebugView roadPoints](self, "roadPoints");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v115, v142, 16);
  if (v67)
  {
    v68 = *(_QWORD *)v116;
    do
    {
      for (ii = 0; ii != v67; ++ii)
      {
        if (*(_QWORD *)v116 != v68)
          objc_enumerationMutation(v66);
        objc_msgSend(*(id *)(*((_QWORD *)&v115 + 1) + 8 * ii), "CGPointValue");
        objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", v70 + -2.0, v71 + -2.0, 4.0, 4.0, 3.0);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setLineWidth:", 1.0);
        objc_msgSend(MEMORY[0x24BDF6950], "blueColor");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "colorWithAlphaComponent:", 0.875);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "setFill");

        objc_msgSend(MEMORY[0x24BDF6950], "blueColor");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "setStroke");

        objc_msgSend(v72, "fill");
        objc_msgSend(v72, "stroke");

      }
      v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v115, v142, 16);
    }
    while (v67);
  }

  -[VKMapDebugView frontierPoint](self, "frontierPoint");
  v77 = (double *)MEMORY[0x24BDBEFB0];
  if (v78 != *MEMORY[0x24BDBEFB0] || v76 != *(double *)(MEMORY[0x24BDBEFB0] + 8))
  {
    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setLineWidth:", 2.0);
    objc_msgSend(MEMORY[0x24BDF6950], "orangeColor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "colorWithAlphaComponent:", 0.125);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setFill");

    objc_msgSend(MEMORY[0x24BDF6950], "orangeColor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setStroke");

    objc_msgSend(v79, "fill");
    objc_msgSend(v79, "stroke");

  }
  -[VKMapDebugView currentPoint](self, "currentPoint");
  if (v84 != *v77 || v83 != v77[1])
  {
    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setLineWidth:", 2.0);
    objc_msgSend(MEMORY[0x24BDF6950], "orangeColor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "colorWithAlphaComponent:", 0.125);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "setFill");

    objc_msgSend(MEMORY[0x24BDF6950], "orangeColor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setStroke");

    objc_msgSend(v85, "fill");
    objc_msgSend(v85, "stroke");

  }
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  -[VKMapDebugView buildingPaths](self, "buildingPaths");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v111, v141, 16);
  if (v90)
  {
    v91 = *(_QWORD *)v112;
    do
    {
      for (jj = 0; jj != v90; ++jj)
      {
        if (*(_QWORD *)v112 != v91)
          objc_enumerationMutation(v89);
        v93 = *(const CGPath **)(*((_QWORD *)&v111 + 1) + 8 * jj);
        if (!CGPathIsEmpty(v93))
        {
          objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithCGPath:", v93);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "setLineWidth:", 1.0);
          objc_msgSend(MEMORY[0x24BDF6950], "purpleColor");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "colorWithAlphaComponent:", 0.125);
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "setFill");

          objc_msgSend(MEMORY[0x24BDF6950], "purpleColor");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "setStroke");

          objc_msgSend(v94, "fill");
          objc_msgSend(v94, "stroke");

        }
      }
      v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v111, v141, 16);
    }
    while (v90);
  }

  -[VKMapDebugView debugMessage](self, "debugMessage");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapDebugView bounds](self, "bounds");
  v100 = v99;
  v102 = v101;
  v104 = v103;
  v106 = v105;
  v139 = *MEMORY[0x24BDF65F8];
  objc_msgSend(MEMORY[0x24BDF6A70], "boldSystemFontOfSize:", 24.0);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = v107;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v140, &v139, 1);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "drawInRect:withAttributes:", v108, v100, v102, v104, v106);

}

- (NSString)debugMessage
{
  return self->_debugMessage;
}

- (NSMutableArray)buildingPaths
{
  return self->_buildingPaths;
}

- (void)setBuildingPaths:(id)a3
{
  objc_storeStrong((id *)&self->_buildingPaths, a3);
}

- (CGPoint)currentPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_currentPoint.x;
  y = self->_currentPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCurrentPoint:(CGPoint)a3
{
  self->_currentPoint = a3;
}

- (CGPoint)frontierPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_frontierPoint.x;
  y = self->_frontierPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setFrontierPoint:(CGPoint)a3
{
  self->_frontierPoint = a3;
}

- (NSMutableSet)intersectionPoints
{
  return self->_intersectionPoints;
}

- (void)setIntersectionPoints:(id)a3
{
  objc_storeStrong((id *)&self->_intersectionPoints, a3);
}

- (NSMutableArray)poiPaths
{
  return self->_poiPaths;
}

- (void)setPoiPaths:(id)a3
{
  objc_storeStrong((id *)&self->_poiPaths, a3);
}

- (NSMutableArray)roadPaths
{
  return self->_roadPaths;
}

- (void)setRoadPaths:(id)a3
{
  objc_storeStrong((id *)&self->_roadPaths, a3);
}

- (NSMutableArray)roadPoints
{
  return self->_roadPoints;
}

- (void)setRoadPoints:(id)a3
{
  objc_storeStrong((id *)&self->_roadPoints, a3);
}

- (AXVKExplorationVertexElement)currentExplorationElement
{
  return self->_currentExplorationElement;
}

- (void)setCurrentExplorationElement:(id)a3
{
  objc_storeStrong((id *)&self->_currentExplorationElement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentExplorationElement, 0);
  objc_storeStrong((id *)&self->_roadPoints, 0);
  objc_storeStrong((id *)&self->_roadPaths, 0);
  objc_storeStrong((id *)&self->_poiPaths, 0);
  objc_storeStrong((id *)&self->_intersectionPoints, 0);
  objc_storeStrong((id *)&self->_buildingPaths, 0);
  objc_storeStrong((id *)&self->_debugMessage, 0);
}

@end
