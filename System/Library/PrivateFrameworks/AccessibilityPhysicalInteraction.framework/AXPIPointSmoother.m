@implementation AXPIPointSmoother

- (AXPIPointSmoother)init
{
  AXPIPointSmoother *v2;
  AXPIPointSmoother *v3;
  uint64_t v4;
  NSMutableArray *pointBuffer;
  uint64_t v6;
  NSMutableArray *medianPointBuffer;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AXPIPointSmoother;
  v2 = -[AXPIPointSmoother init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_bufferSize = 1;
    *(_OWORD *)&v2->_smoothingMaxDelta = xmmword_22A6DC090;
    v2->_shouldOffsetBufferPoints = 0;
    v2->_xOffset = 0.0;
    v2->_yOffset = 0.0;
    v2->_yOrder = 1.0;
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v2->_bufferSize);
    pointBuffer = v3->_pointBuffer;
    v3->_pointBuffer = (NSMutableArray *)v4;

    v6 = objc_opt_new();
    medianPointBuffer = v3->_medianPointBuffer;
    v3->_medianPointBuffer = (NSMutableArray *)v6;

  }
  return v3;
}

- (CGPoint)medianFilterPointForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  double v15;
  double v16;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[AXPIPointSmoother medianPointBuffer](self, "medianPointBuffer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPoint:", x, y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  if ((unint64_t)objc_msgSend(v5, "count") >= 8)
  {
    do
      objc_msgSend(v5, "removeObjectAtIndex:", 0);
    while ((unint64_t)objc_msgSend(v5, "count") > 7);
  }
  if ((unint64_t)objc_msgSend(v5, "count") >= 7)
  {
    objc_msgSend(v5, "ax_mappedArrayUsingBlock:", &__block_literal_global_5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "ax_mappedArrayUsingBlock:", &__block_literal_global_5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v8, "count") >> 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", (unint64_t)objc_msgSend(v10, "count") >> 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    x = v13;
    objc_msgSend(v12, "floatValue");
    y = v14;

  }
  v15 = x;
  v16 = y;
  result.y = v16;
  result.x = v15;
  return result;
}

uint64_t __47__AXPIPointSmoother_medianFilterPointForPoint___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a2, "pointValue");
  return objc_msgSend(v2, "numberWithDouble:");
}

uint64_t __47__AXPIPointSmoother_medianFilterPointForPoint___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  double v3;

  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a2, "pointValue");
  return objc_msgSend(v2, "numberWithDouble:", v3);
}

- (void)addPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  BOOL v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  double v34;
  double v35;
  void *v36;
  id v37;

  y = a3.y;
  x = a3.x;
  -[AXPIPointSmoother updateFPS](self, "updateFPS");
  if (-[AXPIPointSmoother useMedianFilter](self, "useMedianFilter"))
  {
    -[AXPIPointSmoother medianFilterPointForPoint:](self, "medianFilterPointForPoint:", x, y);
    x = v6;
    y = v7;
  }
  -[AXPIPointSmoother pointBuffer](self, "pointBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    -[AXPIPointSmoother smoothingMaxDelta](self, "smoothingMaxDelta");
    if (v10 > 0.0)
    {
      -[AXPIPointSmoother pointBuffer](self, "pointBuffer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[AXPIPointSmoother pointBuffer](self, "pointBuffer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "subarrayWithRange:", 0, objc_msgSend(v12, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "_averagePointsInArray:", v13);
      AX_CGPointGetDistanceToPoint();
      v15 = v14;
      -[AXPIPointSmoother smoothingMaxDelta](self, "smoothingMaxDelta");
      v17 = v16;
      if (-[AXPIPointSmoother bufferSize](self, "bufferSize"))
      {
        v18 = 0;
        v19 = v15 >= v17;
        v20 = -1;
        while (1)
        {
          -[AXPIPointSmoother pointBuffer](self, "pointBuffer");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "count");

          if (v18 >= v22 || !v19)
            break;
          ++v18;
          -[AXPIPointSmoother pointBuffer](self, "pointBuffer");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXPIPointSmoother pointBuffer](self, "pointBuffer");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "subarrayWithRange:", v18, objc_msgSend(v24, "count") + v20);
          v25 = objc_claimAutoreleasedReturnValue();

          objc_msgSend((id)objc_opt_class(), "_averagePointsInArray:", v25);
          AX_CGPointGetDistanceToPoint();
          v27 = v26;
          -[AXPIPointSmoother smoothingMaxDelta](self, "smoothingMaxDelta");
          v19 = v27 >= v28;
          --v20;
          v13 = (void *)v25;
          if (v18 >= -[AXPIPointSmoother bufferSize](self, "bufferSize"))
            goto LABEL_12;
        }
        v25 = (uint64_t)v13;
        if (!v18)
          goto LABEL_13;
LABEL_12:
        -[AXPIPointSmoother pointBuffer](self, "pointBuffer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "removeObjectsInRange:", 0, v18);

        v13 = (void *)v25;
      }
LABEL_13:

    }
    while (1)
    {
      -[AXPIPointSmoother pointBuffer](self, "pointBuffer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "count");
      v33 = -[AXPIPointSmoother bufferSize](self, "bufferSize");

      if (v32 < v33)
        break;
      -[AXPIPointSmoother pointBuffer](self, "pointBuffer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "removeObjectAtIndex:", 0);

    }
  }
  if (-[AXPIPointSmoother shouldOffsetBufferPoints](self, "shouldOffsetBufferPoints"))
  {
    -[AXPIPointSmoother _deltaForPoint:](self, "_deltaForPoint:", x, y);
    x = x + v34;
    y = y + v35;
  }
  -[AXPIPointSmoother pointBuffer](self, "pointBuffer");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithPoint:", x, y);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v36);

}

- (id)_gaussianBlurredArrayFromArray:(id)a3
{
  id v3;
  unint64_t v4;
  id v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  unint64_t i;
  void *v27;

  v3 = a3;
  v4 = objc_msgSend(v3, "count");
  if (v4 >= objc_msgSend(&unk_24F47CA78, "count"))
  {
    v7 = objc_msgSend(&unk_24F47CA78, "count") + 1;
    v8 = v7 >> 1;
    v5 = (id)objc_opt_new();
    v9 = (v7 >> 1) - 1;
    if (v7 >> 1 != 1)
    {
      v10 = 0;
      do
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v9 != v10);
    }
    if (v9 < objc_msgSend(v3, "count") - v8)
    {
      v12 = (v7 & 0xFFFFFFFFFFFFFFFELL) - 1;
      do
      {
        v13 = (void *)objc_opt_new();
        v14 = v9 - v8 + 1;
        v15 = v12;
        if (v14 < v9 + v8)
        {
          do
          {
            objc_msgSend(v3, "objectAtIndexedSubscript:", v14);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v16);

            ++v14;
            --v15;
          }
          while (v15);
        }
        if (objc_msgSend(v13, "count"))
        {
          v17 = 0;
          v18 = 0.0;
          do
          {
            objc_msgSend(&unk_24F47CA78, "objectAtIndexedSubscript:", v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "doubleValue");
            v21 = v20;

            objc_msgSend(v13, "objectAtIndexedSubscript:", v17);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "doubleValue");
            v24 = v23;

            v18 = v18 + v21 * v24;
            ++v17;
          }
          while (objc_msgSend(v13, "count") > v17);
        }
        else
        {
          v18 = 0.0;
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v18);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v25);

        ++v9;
      }
      while (v9 < objc_msgSend(v3, "count") - v8);
    }
    for (i = objc_msgSend(v3, "count") - v8; i < objc_msgSend(v3, "count"); ++i)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", i);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v27);

    }
  }
  else
  {
    v5 = v3;
  }

  return v5;
}

- (id)_gaussianBlurredPointBuffer
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v18;
  _QWORD v19[2];

  -[AXPIPointSmoother pointBuffer](self, "pointBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ax_mappedArrayUsingBlock:", &__block_literal_global_10);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ax_mappedArrayUsingBlock:", &__block_literal_global_11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)v4;
  -[AXPIPointSmoother _gaussianBlurredArrayFromArray:](self, "_gaussianBlurredArrayFromArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPIPointSmoother _gaussianBlurredArrayFromArray:](self, "_gaussianBlurredArrayFromArray:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  if (objc_msgSend(v6, "count"))
  {
    v9 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x24BDD1968];
      objc_msgSend(v10, "doubleValue");
      v14 = v13;
      objc_msgSend(v11, "doubleValue");
      v19[0] = v14;
      v19[1] = v15;
      objc_msgSend(v12, "valueWithBytes:objCType:", v19, "{CGPoint=dd}");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v16);

      ++v9;
    }
    while (objc_msgSend(v6, "count") > v9);
  }

  return v8;
}

uint64_t __48__AXPIPointSmoother__gaussianBlurredPointBuffer__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "CGPointValue");
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
}

uint64_t __48__AXPIPointSmoother__gaussianBlurredPointBuffer__block_invoke_2(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "CGPointValue");
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v2);
}

- (CGPoint)point
{
  void *v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  double v9;
  void *v10;
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
  CGPoint result;

  if (-[AXPIPointSmoother useGaussianBlur](self, "useGaussianBlur"))
    -[AXPIPointSmoother _gaussianBlurredPointBuffer](self, "_gaussianBlurredPointBuffer");
  else
    -[AXPIPointSmoother pointBuffer](self, "pointBuffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AXPIPointSmoother useWeightedMovingAverage](self, "useWeightedMovingAverage"))
  {
    v4 = *MEMORY[0x24BDBEFB0];
    v5 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    v6 = objc_msgSend(v3, "count");
    v7 = objc_msgSend(v3, "count");
    if (objc_msgSend(v3, "count"))
    {
      v8 = 0;
      v9 = (double)((unint64_t)(v6 + v6 * v7) >> 1);
      do
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "CGPointValue");
        v12 = v11;
        v14 = v13;

        v4 = v4 + v12 * (double)(int)++v8 / v9;
        v5 = v5 + v14 * (double)(int)v8 / v9;
      }
      while (objc_msgSend(v3, "count") > v8);
    }
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_averagePointsInArray:", v3);
    v4 = v15;
    v5 = v16;
  }
  if (!-[AXPIPointSmoother shouldOffsetBufferPoints](self, "shouldOffsetBufferPoints"))
  {
    -[AXPIPointSmoother _deltaForPoint:](self, "_deltaForPoint:", v4, v5);
    v4 = v4 + v17;
    v5 = v5 + v18;
  }

  v19 = v4;
  v20 = v5;
  result.y = v20;
  result.x = v19;
  return result;
}

- (CGSize)_deltaForPoint:(CGPoint)a3
{
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  char v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat MidX;
  double v25;
  double v26;
  double v27;
  float v28;
  double v29;
  double v30;
  double v31;
  double v32;
  float v33;
  double v34;
  float v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGSize result;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
  -[AXPIPointSmoother delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  v10 = v7;
  v11 = v6;
  v12 = v5;
  v13 = v4;
  if ((v9 & 1) != 0)
  {
    -[AXPIPointSmoother delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rotatedScreenBounds");
    v13 = v15;
    v12 = v16;
    v11 = v17;
    v10 = v18;

  }
  v44.origin.x = v13;
  v44.origin.y = v12;
  v44.size.width = v11;
  v44.size.height = v10;
  v47.origin.x = v4;
  v47.origin.y = v5;
  v47.size.width = v6;
  v47.size.height = v7;
  if (CGRectEqualToRect(v44, v47))
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bounds");
    v13 = v20;
    v12 = v21;
    v11 = v22;
    v10 = v23;

  }
  v45.origin.x = v13;
  v45.origin.y = v12;
  v45.size.width = v11;
  v45.size.height = v10;
  MidX = CGRectGetMidX(v45);
  v46.origin.x = v13;
  v46.origin.y = v12;
  v46.size.width = v11;
  v46.size.height = v10;
  v25 = fmax(MidX, 1.0);
  v26 = fmax(CGRectGetMidY(v46), 1.0);
  *(float *)&MidX = vabdd_f64(v25, a3.x) / v25;
  -[AXPIPointSmoother xOrder](self, "xOrder");
  v28 = v27;
  v29 = powf(*(float *)&MidX, v28);
  -[AXPIPointSmoother xOffset](self, "xOffset");
  v31 = v30;
  v32 = v30 * v29;
  -[AXPIPointSmoother yOrder](self, "yOrder");
  v35 = v34;
  v33 = vabdd_f64(v26, a3.y) / v26;
  v36 = powf(v33, v35);
  -[AXPIPointSmoother yOffset](self, "yOffset");
  v38 = v37 * v36;
  v39 = -(v31 * v29);
  if (a3.x > v25)
    v39 = v32;
  v40 = -(v37 * v36);
  if (a3.y <= v26)
    v38 = v40;
  v41 = v39;
  result.height = v38;
  result.width = v41;
  return result;
}

- (void)removeAllPoints
{
  id v2;

  -[AXPIPointSmoother pointBuffer](self, "pointBuffer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (unint64_t)bufferSize
{
  unint64_t bufferSize;

  if (-[AXPIPointSmoother lowFPSDetectedCount](self, "lowFPSDetectedCount") <= 0x31)
    bufferSize = self->_bufferSize;
  else
    bufferSize = 1;
  if (bufferSize <= 1)
    return 1;
  else
    return bufferSize;
}

- (void)updateFPS
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = mach_absolute_time();
  -[AXPIPointSmoother lastTimePointAdded](self, "lastTimePointAdded");
  -[AXPIPointSmoother setFramesPerSecond:](self, "setFramesPerSecond:", (unint64_t)(1.0 / ((double)(unint64_t)AXMachTimeToNanoseconds() / 1000000000.0)));
  -[AXPIPointSmoother setLastTimePointAdded:](self, "setLastTimePointAdded:", v3);
  if (-[AXPIPointSmoother framesPerSecond](self, "framesPerSecond") > 0xA)
  {
    v5 = 0;
  }
  else
  {
    v4 = -[AXPIPointSmoother lowFPSDetectedCount](self, "lowFPSDetectedCount");
    if (v4 + 1 < 0x32)
      v5 = v4 + 1;
    else
      v5 = 50;
  }
  -[AXPIPointSmoother setLowFPSDetectedCount:](self, "setLowFPSDetectedCount:", v5);
}

+ (CGPoint)_averagePointsInArray:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t i;
  double v10;
  double v11;
  unint64_t v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;
  CGPoint result;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    v7 = 0.0;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "CGPointValue");
        v8 = v8 + v10;
        v7 = v7 + v11;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
    v8 = 0.0;
  }
  v12 = objc_msgSend(v3, "count");

  v13 = v8 / (double)v12;
  v14 = v7 / (double)v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (void)setBufferSize:(unint64_t)a3
{
  self->_bufferSize = a3;
}

- (AXPIPointSmootherClientDelegate)delegate
{
  return (AXPIPointSmootherClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)useWeightedMovingAverage
{
  return self->_useWeightedMovingAverage;
}

- (void)setUseWeightedMovingAverage:(BOOL)a3
{
  self->_useWeightedMovingAverage = a3;
}

- (BOOL)useMedianFilter
{
  return self->_useMedianFilter;
}

- (void)setUseMedianFilter:(BOOL)a3
{
  self->_useMedianFilter = a3;
}

- (BOOL)useGaussianBlur
{
  return self->_useGaussianBlur;
}

- (void)setUseGaussianBlur:(BOOL)a3
{
  self->_useGaussianBlur = a3;
}

- (double)smoothingMaxDelta
{
  return self->_smoothingMaxDelta;
}

- (void)setSmoothingMaxDelta:(double)a3
{
  self->_smoothingMaxDelta = a3;
}

- (BOOL)shouldOffsetBufferPoints
{
  return self->_shouldOffsetBufferPoints;
}

- (void)setShouldOffsetBufferPoints:(BOOL)a3
{
  self->_shouldOffsetBufferPoints = a3;
}

- (double)xOrder
{
  return self->_xOrder;
}

- (void)setXOrder:(double)a3
{
  self->_xOrder = a3;
}

- (double)yOrder
{
  return self->_yOrder;
}

- (void)setYOrder:(double)a3
{
  self->_yOrder = a3;
}

- (double)xOffset
{
  return self->_xOffset;
}

- (void)setXOffset:(double)a3
{
  self->_xOffset = a3;
}

- (double)yOffset
{
  return self->_yOffset;
}

- (void)setYOffset:(double)a3
{
  self->_yOffset = a3;
}

- (NSMutableArray)pointBuffer
{
  return self->_pointBuffer;
}

- (void)setPointBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_pointBuffer, a3);
}

- (NSMutableArray)medianPointBuffer
{
  return self->_medianPointBuffer;
}

- (void)setMedianPointBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_medianPointBuffer, a3);
}

- (unint64_t)framesPerSecond
{
  return self->_framesPerSecond;
}

- (void)setFramesPerSecond:(unint64_t)a3
{
  self->_framesPerSecond = a3;
}

- (unint64_t)lastTimePointAdded
{
  return self->_lastTimePointAdded;
}

- (void)setLastTimePointAdded:(unint64_t)a3
{
  self->_lastTimePointAdded = a3;
}

- (unint64_t)lowFPSDetectedCount
{
  return self->_lowFPSDetectedCount;
}

- (void)setLowFPSDetectedCount:(unint64_t)a3
{
  self->_lowFPSDetectedCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medianPointBuffer, 0);
  objc_storeStrong((id *)&self->_pointBuffer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
