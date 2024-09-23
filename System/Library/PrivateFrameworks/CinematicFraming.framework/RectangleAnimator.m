@implementation RectangleAnimator

- (RectangleAnimator)initWithFramingSpaceManager:(id)a3
{
  id v5;
  RectangleAnimator *v6;
  RectangleAnimator *v7;
  CGSize v8;
  RectangleAnimator *v9;
  __int128 v11;
  uint64_t v12;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RectangleAnimator;
  v6 = -[RectangleAnimator init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v8 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v6->_rectangle.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v6->_rectangle.size = v8;
    RectToState((uint64_t)&v11, v6->_rectangle.origin.x, v6->_rectangle.origin.y, v6->_rectangle.size.width, v6->_rectangle.size.height);
    *(_OWORD *)&v7->_currentState.x = v11;
    *(_QWORD *)&v7->_currentState.vy = v12;
    objc_storeStrong((id *)&v7->_framingSpaceManager, a3);
    v9 = v7;
  }

  return v7;
}

- (void)resetToRectangle:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  AnimationEngine *v8;
  double v9;
  AnimationEngine *v10;
  AnimationEngine *xAxisAnimationEngine;
  AnimationEngine *v12;
  double v13;
  AnimationEngine *v14;
  AnimationEngine *yAxisAnimationEngine;
  AnimationEngine *v16;
  float v17;
  double v18;
  AnimationEngine *v19;
  AnimationEngine *sizeAnimationEngine;
  $77F85791B0246B84B7FA9448DDB66A63 v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = [AnimationEngine alloc];
  LODWORD(v9) = 0;
  v10 = -[AnimationEngine initWithInitialPosition:](v8, "initWithInitialPosition:", v9);
  xAxisAnimationEngine = self->_xAxisAnimationEngine;
  self->_xAxisAnimationEngine = v10;

  v12 = [AnimationEngine alloc];
  LODWORD(v13) = 0;
  v14 = -[AnimationEngine initWithInitialPosition:](v12, "initWithInitialPosition:", v13);
  yAxisAnimationEngine = self->_yAxisAnimationEngine;
  self->_yAxisAnimationEngine = v14;

  v16 = [AnimationEngine alloc];
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  v17 = CGRectGetWidth(v22);
  *(float *)&v18 = logf(v17);
  v19 = -[AnimationEngine initWithInitialPosition:](v16, "initWithInitialPosition:", v18);
  sizeAnimationEngine = self->_sizeAnimationEngine;
  self->_sizeAnimationEngine = v19;

  RectToState((uint64_t)&v21, x, y, width, height);
  self->_currentState = v21;
}

- (CGRect)driveAnimationToTarget:(CGRect)a3 atTime:(id *)a4
{
  FramingSpaceManager *framingSpaceManager;
  float y;
  float w;
  float v9;
  int v10;
  unint64_t v11;
  float v12;
  FramingSpaceManager *v13;
  double v14;
  float v15;
  float v16;
  double v17;
  float v18;
  float v19;
  float v20;
  double v21;
  double v22;
  CGFloat x;
  CGFloat v24;
  CGFloat v25;
  float v26;
  double v27;
  double v28;
  double v29;
  double v30;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  CGRect result;

  v34 = 0uLL;
  v35 = 0;
  RectToState((uint64_t)&v34, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  framingSpaceManager = self->_framingSpaceManager;
  y = self->_currentState.y;
  w = self->_currentState.w;
  v11 = *(_QWORD *)((char *)&v34 + 4);
  v10 = HIDWORD(v11);
  LODWORD(v9) = v11;
  v12 = ComputeTPivot(self->_currentState.x, self->_currentState.x + w, *(float *)&v34, *(float *)&v34 + *((float *)&v34 + 2), 0.5);
  v13 = framingSpaceManager;
  *(float *)&v14 = w;
  -[FramingSpaceManager getHeightForWidth:](v13, "getHeightForWidth:", v14);
  v16 = y + v15;
  LODWORD(v17) = v10;
  -[FramingSpaceManager getHeightForWidth:](v13, "getHeightForWidth:", v17);
  v19 = v18;

  v20 = ComputeTPivot(y, v16, v9, v9 + v19, 0.0);
  v32 = v34;
  v33 = v35;
  v31 = *a4;
  *(float *)&v21 = v20;
  -[RectangleAnimator driveWidthAnimationToTarget:withPivotDescriptions:atTime:](self, "driveWidthAnimationToTarget:withPivotDescriptions:atTime:", &v32, &v31, COERCE_DOUBLE(__PAIR64__(HIDWORD(v31.var0), LODWORD(v12))), v21);
  v32 = v34;
  v33 = v35;
  v31 = *a4;
  *(float *)&v22 = v20;
  -[RectangleAnimator drivePivotAnimationsToTarget:withPivotDescriptions:atTime:](self, "drivePivotAnimationsToTarget:withPivotDescriptions:atTime:", &v32, &v31, COERCE_DOUBLE(__PAIR64__(HIDWORD(v31.var0), LODWORD(v12))), v22);
  x = self->_currentState.x;
  v24 = self->_currentState.y;
  v25 = self->_currentState.w;
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:");
  v27 = v26;
  self->_rectangle.origin.x = x;
  self->_rectangle.origin.y = v24;
  self->_rectangle.size.width = v25;
  self->_rectangle.size.height = v26;
  v28 = x;
  v29 = v24;
  v30 = v25;
  result.size.height = v27;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (float)xSpeed
{
  return fabsf(self->_currentState.vx);
}

- (float)ySpeed
{
  return fabsf(self->_currentState.vy);
}

- (float)sizeSpeed
{
  return fabsf(self->_currentState.vw);
}

- (void)driveWidthAnimationToTarget:(id *)a3 withPivotDescriptions:(id)a4 atTime:(id *)a5
{
  float var1;
  float var0;
  $77F85791B0246B84B7FA9448DDB66A63 *p_currentState;
  float v11;
  double v12;
  float vw;
  double v14;
  float v15;
  float v16;
  AnimationEngine *sizeAnimationEngine;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  float v22;
  CGFloat v23;
  void *v24;
  float v25;
  void *v26;
  unsigned int v27;
  int v28;
  float v29;
  void *v30;
  double v31;
  int v32;
  int v33;
  void *v34;
  void *v35;
  unsigned int v36;
  unsigned int v37;
  __n128 v38;
  AnimationEngine *v39;
  float v40;
  __n128 v41;
  __n128 v42;
  float v43;
  float v44;
  float vy;
  float vx;
  __n128 v47;
  float v48;
  float w;
  float v50;
  float y;
  float x;
  __n128 v53;
  __n128 v54;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v55;
  __int128 v56;
  int64_t var3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v58;

  var1 = a4.var1;
  var0 = a4.var0;
  p_currentState = &self->_currentState;
  x = self->_currentState.x;
  y = self->_currentState.y;
  w = self->_currentState.w;
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:");
  v48 = v11;
  *(float *)&v12 = self->_currentState.w;
  vx = self->_currentState.vx;
  vw = self->_currentState.vw;
  vy = self->_currentState.vy;
  *(float *)&v14 = vw;
  -[FramingSpaceManager getHeightDerivativeForWidth:widthDerivative:](self->_framingSpaceManager, "getHeightDerivativeForWidth:widthDerivative:", v12, v14);
  v44 = v15;
  v16 = logf(a3->var2);
  sizeAnimationEngine = self->_sizeAnimationEngine;
  v58 = *a5;
  *(float *)&v18 = v16;
  -[AnimationEngine animateWithDuration:toTarget:options:atTime:](sizeAnimationEngine, "animateWithDuration:toTarget:options:atTime:", 4, &v58, 1.75, v18);
  v19 = p_currentState->x;
  v20 = self->_currentState.y;
  v21 = self->_currentState.w;
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:");
  v23 = v22;
  memset(&v58, 0, sizeof(v58));
  -[RectangleAnimator options](self, "options");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  ComputeSizeFrameEdgeConstraints(v24, (uint64_t)&v58, v19, v20, v21, v23);

  -[FramingSpaceManager maxAllowedViewportWidth](self->_framingSpaceManager, "maxAllowedViewportWidth");
  HIDWORD(v58.var3) = logf(v25);
  -[RectangleAnimator options](self, "options");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v58.var1 = ComputeSizeVelocityConstraints(v26);
  v58.var2 = v27;

  -[AnimationEngine velocity](self->_sizeAnimationEngine, "velocity");
  LODWORD(v23) = v28;
  -[AnimationEngine position](self->_sizeAnimationEngine, "position");
  *(float *)&v20 = v16 - v29;
  -[RectangleAnimator options](self, "options");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = ComputeSizeEaseInAccelerationConstraintsForVelocityAndDisplacement(v30, *(float *)&v23, *(float *)&v20);

  LODWORD(v31) = HIDWORD(v58.var0);
  LODWORD(v58.var0) = CombineMotionConstraints(*(float *)&v58.var0, v31, *(float *)&v23);
  HIDWORD(v58.var0) = v32;
  -[AnimationEngine velocity](self->_sizeAnimationEngine, "velocity");
  LODWORD(v23) = v33;
  -[RectangleAnimator options](self, "options");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (*(float *)&v23 < 0.0)
    objc_msgSend(v34, "zoomInSpeedMultiplier");
  else
    objc_msgSend(v34, "zoomOutSpeedMultiplier");
  v37 = v36;

  v38.n128_f32[0] = vx + (float)(vw * var0);
  v47 = v38;
  v38.n128_f32[0] = x + (float)(w * var0);
  v53 = v38;
  v39 = self->_sizeAnimationEngine;
  v56 = *(_OWORD *)&a5->var0;
  var3 = a5->var3;
  v55 = v58;
  -[AnimationEngine driveAnimationAtTime:withConstraints:withMultiplier:](v39, "driveAnimationAtTime:withConstraints:withMultiplier:", &v56, &v55, COERCE_DOUBLE(__PAIR64__(HIDWORD(v58.var0), v37)));
  -[AnimationEngine position](self->_sizeAnimationEngine, "position");
  v50 = expf(v40);
  v41 = v53;
  v41.n128_f32[1] = y + (float)(v48 * var1);
  v41.n128_f32[2] = v50;
  v54 = v41;
  -[AnimationEngine velocity](self->_sizeAnimationEngine, "velocity");
  v42 = v47;
  v42.n128_f32[1] = vy + (float)(v44 * var1);
  v42.n128_f32[2] = v50 * v43;
  PivotDescriptionsToState(self->_framingSpaceManager, (uint64_t)&v56, v54, v42, var0, var1);
  *(_OWORD *)&p_currentState->x = v56;
  *(_QWORD *)&p_currentState->vy = var3;
}

- (void)drivePivotAnimationsToTarget:(id *)a3 withPivotDescriptions:(id)a4 atTime:(id *)a5
{
  float var1;
  float var0;
  float y;
  unsigned int v11;
  float v12;
  double v13;
  float vy;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  double v21;
  float var4;
  float v23;
  float v24;
  float v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  unint64_t v31;
  unint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  __n128 v38;
  unsigned __int32 v39;
  __n128 v40;
  unsigned __int32 v41;
  __n128 v42;
  float v43;
  unsigned int v44;
  float vw;
  float w;
  __n128 v47;
  __n128 v48;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v49;

  var1 = a4.var1;
  var0 = a4.var0;
  y = self->_currentState.y;
  w = self->_currentState.w;
  *(float *)&v11 = self->_currentState.x + (float)(w * a4.var0);
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:");
  *(float *)&v44 = y + (float)(v12 * var1);
  *(float *)&v13 = self->_currentState.w;
  vy = self->_currentState.vy;
  vw = self->_currentState.vw;
  v15 = self->_currentState.vx + (float)(vw * var0);
  -[FramingSpaceManager getHeightDerivativeForWidth:widthDerivative:](self->_framingSpaceManager, "getHeightDerivativeForWidth:widthDerivative:", v13);
  v43 = vy + (float)(v16 * var1);
  v17 = a3->var1;
  v18 = a3->var0 + (float)(a3->var2 * var0);
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:");
  v20 = v17 + (float)(v19 * var1);
  *(float *)&v21 = a3->var2;
  var4 = a3->var4;
  v23 = a3->var3 + (float)(a3->var5 * var0);
  -[FramingSpaceManager getHeightDerivativeForWidth:widthDerivative:](self->_framingSpaceManager, "getHeightDerivativeForWidth:widthDerivative:", v21);
  v25 = var4 + (float)(v24 * var1);
  v49 = *a5;
  *(float *)&v26 = v15;
  *(float *)&v27 = var0;
  *(float *)&v28 = var1;
  *(float *)&v29 = v18;
  *(float *)&v30 = v23;
  -[RectangleAnimator driveXPivotWithLocation:velocity:pivotDescriptions:toTargetLocation:targetVelocity:atTime:](self, "driveXPivotWithLocation:velocity:pivotDescriptions:toTargetLocation:targetVelocity:atTime:", &v49, COERCE_DOUBLE(__PAIR64__(HIDWORD(v49.var0), v11)), v26, v27, v28, v29, v30);
  -[AnimationEngine position](self->_xAxisAnimationEngine, "position");
  v47.n128_u64[0] = v31;
  -[AnimationEngine velocity](self->_xAxisAnimationEngine, "velocity");
  v42.n128_u64[0] = v32;
  v49 = *a5;
  *(float *)&v33 = v43;
  *(float *)&v34 = var0;
  *(float *)&v35 = var1;
  *(float *)&v36 = v20;
  *(float *)&v37 = v25;
  -[RectangleAnimator driveYPivotWithLocation:velocity:pivotDescriptions:toTargetLocation:targetVelocity:atTime:](self, "driveYPivotWithLocation:velocity:pivotDescriptions:toTargetLocation:targetVelocity:atTime:", &v49, COERCE_DOUBLE(__PAIR64__(HIDWORD(v49.var0), v44)), v33, v34, v35, v36, v37);
  -[AnimationEngine position](self->_yAxisAnimationEngine, "position");
  v38 = v47;
  v38.n128_u32[1] = v39;
  v38.n128_f32[2] = w;
  v48 = v38;
  -[AnimationEngine velocity](self->_yAxisAnimationEngine, "velocity");
  v40 = v42;
  v40.n128_u32[1] = v41;
  v40.n128_f32[2] = vw;
  PivotDescriptionsToState(self->_framingSpaceManager, (uint64_t)&v49, v48, v40, var0, var1);
  self->_currentState = ($77F85791B0246B84B7FA9448DDB66A63)v49;
}

- (void)driveXPivotWithLocation:(float)a3 velocity:(float)a4 pivotDescriptions:(id)a5 toTargetLocation:(float)a6 targetVelocity:(float)a7 atTime:(id *)a8
{
  double v12;
  AnimationEngine *xAxisAnimationEngine;
  double v14;
  CGFloat x;
  CGFloat y;
  CGFloat w;
  float v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  void *v28;
  unsigned int v29;
  void *v30;
  double v31;
  unsigned int v32;
  int v33;
  void *v34;
  double v35;
  int v36;
  void *v37;
  float v38;
  AnimationEngine *v39;
  float var0;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v43;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v44;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v45;
  CGRect v46;
  CGRect v47;

  var0 = a5.var0;
  -[AnimationEngine setPosition:](self->_xAxisAnimationEngine, "setPosition:");
  *(float *)&v12 = a4;
  -[AnimationEngine setVelocity:](self->_xAxisAnimationEngine, "setVelocity:", v12);
  xAxisAnimationEngine = self->_xAxisAnimationEngine;
  v45 = *a8;
  *(float *)&v14 = a6;
  -[AnimationEngine animateWithDuration:toTarget:options:atTime:](xAxisAnimationEngine, "animateWithDuration:toTarget:options:atTime:", 4, &v45, 0.75, v14);
  x = self->_currentState.x;
  y = self->_currentState.y;
  w = self->_currentState.w;
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:");
  v19 = v18;
  memset(&v45, 0, sizeof(v45));
  -[FramingSpaceManager framingSpaceBounds](self->_framingSpaceManager, "framingSpaceBounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[RectangleAnimator options](self, "options");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  ComputeXFrameEdgeConstraints(v28, (uint64_t)&v45, x, y, w, v19, v21, v23, v25, v27);

  -[FramingSpaceManager framingSpaceBounds](self->_framingSpaceManager, "framingSpaceBounds");
  *(float *)&v23 = CGRectGetMinX(v46) + (float)(var0 * self->_currentState.w);
  -[FramingSpaceManager framingSpaceBounds](self->_framingSpaceManager, "framingSpaceBounds");
  *(float *)&v29 = CGRectGetMaxX(v47) - (float)((float)(1.0 - var0) * self->_currentState.w);
  v45.var3 = __PAIR64__(v29, LODWORD(v23));
  -[RectangleAnimator options](self, "options");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = ComputeXVelocityConstraints(v30, x, y, w);

  LODWORD(v31) = v45.var2;
  v45.var1 = CombineMotionConstraints(*(float *)&v45.var1, v31, *(float *)&v23);
  v45.var2 = v32;
  -[AnimationEngine velocity](self->_xAxisAnimationEngine, "velocity");
  LODWORD(v23) = v33;
  *(float *)&v27 = self->_currentState.w;
  -[RectangleAnimator options](self, "options");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = ComputeXEaseInAccelerationConstraintsForVelocityAndDisplacement(v34, *(float *)&v23, a6 - a3, *(float *)&v27);

  LODWORD(v35) = HIDWORD(v45.var0);
  LODWORD(v45.var0) = CombineMotionConstraints(*(float *)&v45.var0, v35, *(float *)&v23);
  HIDWORD(v45.var0) = v36;
  *(float *)&v23 = self->_currentState.w;
  -[RectangleAnimator options](self, "options");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "horizontalSpeedMultiplier");
  *(float *)&v23 = *(float *)&v23 * v38;

  v39 = self->_xAxisAnimationEngine;
  v44 = *a8;
  v43 = v45;
  -[AnimationEngine driveAnimationAtTime:withConstraints:withMultiplier:](v39, "driveAnimationAtTime:withConstraints:withMultiplier:", &v44, &v43, COERCE_DOUBLE(__PAIR64__(HIDWORD(v45.var0), LODWORD(v23))));
}

- (void)driveYPivotWithLocation:(float)a3 velocity:(float)a4 pivotDescriptions:(id)a5 toTargetLocation:(float)a6 targetVelocity:(float)a7 atTime:(id *)a8
{
  double v12;
  AnimationEngine *yAxisAnimationEngine;
  double v14;
  CGFloat x;
  CGFloat y;
  CGFloat w;
  float v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  void *v28;
  double v29;
  int v30;
  unsigned int v31;
  void *v32;
  double v33;
  unsigned int v34;
  int v35;
  void *v36;
  double v37;
  int v38;
  void *v39;
  float v40;
  AnimationEngine *v41;
  float var1;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v45;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v46;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v47;
  CGRect v48;
  CGRect v49;

  var1 = a5.var1;
  -[AnimationEngine setPosition:](self->_yAxisAnimationEngine, "setPosition:");
  *(float *)&v12 = a4;
  -[AnimationEngine setVelocity:](self->_yAxisAnimationEngine, "setVelocity:", v12);
  yAxisAnimationEngine = self->_yAxisAnimationEngine;
  v47 = *a8;
  *(float *)&v14 = a6;
  -[AnimationEngine animateWithDuration:toTarget:options:atTime:](yAxisAnimationEngine, "animateWithDuration:toTarget:options:atTime:", 4, &v47, 0.75, v14);
  x = self->_currentState.x;
  y = self->_currentState.y;
  w = self->_currentState.w;
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:");
  v19 = v18;
  memset(&v47, 0, sizeof(v47));
  -[FramingSpaceManager framingSpaceBounds](self->_framingSpaceManager, "framingSpaceBounds");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[RectangleAnimator options](self, "options");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  ComputeYFrameEdgeConstraints(v28, (uint64_t)&v47, x, y, w, v19, v21, v23, v25, v27);

  *(float *)&v29 = self->_currentState.w;
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:", v29);
  LODWORD(v23) = v30;
  -[FramingSpaceManager framingSpaceBounds](self->_framingSpaceManager, "framingSpaceBounds");
  *(float *)&v25 = CGRectGetMinY(v48) + (float)(var1 * *(float *)&v23);
  -[FramingSpaceManager framingSpaceBounds](self->_framingSpaceManager, "framingSpaceBounds");
  *(float *)&v31 = CGRectGetMaxY(v49) - (float)((float)(1.0 - var1) * *(float *)&v23);
  v47.var3 = __PAIR64__(v31, LODWORD(v25));
  -[RectangleAnimator options](self, "options");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = ComputeYVelocityConstraints(v32, x, y, w, v19);

  LODWORD(v33) = v47.var2;
  v47.var1 = CombineMotionConstraints(*(float *)&v47.var1, v33, *(float *)&v23);
  v47.var2 = v34;
  -[AnimationEngine velocity](self->_yAxisAnimationEngine, "velocity");
  LODWORD(v23) = v35;
  *(float *)&v27 = self->_currentState.w;
  -[RectangleAnimator options](self, "options");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v23) = ComputeYEaseInAccelerationConstraintsForVelocityAndDisplacement(v36, *(float *)&v23, a6 - a3, *(float *)&v27);

  LODWORD(v37) = HIDWORD(v47.var0);
  LODWORD(v47.var0) = CombineMotionConstraints(*(float *)&v47.var0, v37, *(float *)&v23);
  HIDWORD(v47.var0) = v38;
  *(float *)&v23 = self->_currentState.w;
  -[RectangleAnimator options](self, "options");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "verticalSpeedMultiplier");
  *(float *)&v23 = *(float *)&v23 * v40;

  v41 = self->_yAxisAnimationEngine;
  v46 = *a8;
  v45 = v47;
  -[AnimationEngine driveAnimationAtTime:withConstraints:withMultiplier:](v41, "driveAnimationAtTime:withConstraints:withMultiplier:", &v46, &v45, COERCE_DOUBLE(__PAIR64__(HIDWORD(v47.var0), LODWORD(v23))));
}

- (CGRect)rectangle
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->rectangle.origin.x;
  y = self->rectangle.origin.y;
  width = self->rectangle.size.width;
  height = self->rectangle.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CinematicFramingSessionOptions)options
{
  return self->options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->options, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->options, 0);
  objc_storeStrong((id *)&self->_framingSpaceManager, 0);
  objc_storeStrong((id *)&self->_sizeAnimationEngine, 0);
  objc_storeStrong((id *)&self->_yAxisAnimationEngine, 0);
  objc_storeStrong((id *)&self->_xAxisAnimationEngine, 0);
}

@end
