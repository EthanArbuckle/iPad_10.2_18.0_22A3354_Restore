@implementation TabOverviewInterpolatedLocation

- ($4129EC284BFC52D68F2E23A88D6E8763)location
{
  return self;
}

- ($4129EC284BFC52D68F2E23A88D6E8763)targetLocation
{
  return self;
}

- (void)setMinimumTranslationSpeed:(double)a3
{
  self->_minimumTranslationSpeed = a3;
}

- (TabOverviewInterpolatedLocation)initWithLocation:(id *)a3 decelerationFactor:(double)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  TabOverviewInterpolatedLocation *v13;
  TabOverviewInterpolatedLocation *v14;
  TabOverviewInterpolatedLocation *v15;
  objc_super v17;

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = v4;
  v17.receiver = self;
  v17.super_class = (Class)TabOverviewInterpolatedLocation;
  v13 = -[TabOverviewInterpolatedLocation init](&v17, sel_init, a3);
  v14 = v13;
  if (v13)
  {
    v13->_location.offset.y = v11;
    v13->_location.zOffset = v10;
    v13->_location.logScale = v9;
    v13->_instantaneousTargetLocation.offset.x = a4;
    v13->_instantaneousTargetLocation.offset.y = v11;
    v13->_instantaneousTargetLocation.zOffset = v10;
    v13->_instantaneousTargetLocation.logScale = v9;
    v13->_targetLocation.offset.y = v11;
    v13->_targetLocation.zOffset = v10;
    v13->_targetLocation.logScale = v9;
    v13->_location.offset.x = a4;
    v13->_decelerationFactor = v8;
    v13->_targetLocation.offset.x = a4;
    v15 = v13;
  }

  return v14;
}

- (void)resetToLocation:(id *)a3
{
  CGFloat v3;
  CGFloat v4;
  double v5;
  double v6;

  self->_location.offset.x = v3;
  self->_location.offset.y = v4;
  self->_location.zOffset = v5;
  self->_location.logScale = v6;
  self->_instantaneousTargetLocation.offset.x = v3;
  self->_instantaneousTargetLocation.offset.y = v4;
  self->_instantaneousTargetLocation.zOffset = v5;
  self->_instantaneousTargetLocation.logScale = v6;
  self->_targetLocation.offset.x = v3;
  self->_targetLocation.offset.y = v4;
  self->_targetLocation.zOffset = v5;
  self->_targetLocation.logScale = v6;
}

- (BOOL)isInSteadyStateWithConstraints:(id)a3 epsilon:(double)a4
{
  void (**v5)(_QWORD, double, double, double, double);
  char v6;

  v5 = (void (**)(_QWORD, double, double, double, double))a3;
  if (TabOverviewLocationEqualToLocationWithEpsilon()
    && TabOverviewLocationEqualToLocationWithEpsilon())
  {
    if (v5)
    {
      v5[2](v5, self->_location.offset.x, self->_location.offset.y, self->_location.zOffset, self->_location.logScale);
      v6 = TabOverviewLocationEqualToLocationWithEpsilon();
    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isInSteadyStateWithConstraints:(id)a3
{
  return -[TabOverviewInterpolatedLocation isInSteadyStateWithConstraints:epsilon:](self, "isInSteadyStateWithConstraints:epsilon:", a3, 0.0);
}

- (void)setDecelerationFactor:(double)a3
{
  double decelerationFactor;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CGFloat v14;
  double v15;
  double v16;

  decelerationFactor = self->_decelerationFactor;
  if (decelerationFactor != a3)
  {
    if (a3 <= 0.99999)
    {
      self->_instantaneousTargetLocation.offset.x = interpolateLocations(self->_location.offset.x, self->_location.offset.y, self->_location.zOffset, self->_location.logScale, self->_instantaneousTargetLocation.offset.x, self->_instantaneousTargetLocation.offset.y, self->_instantaneousTargetLocation.zOffset, self->_instantaneousTargetLocation.logScale, (1.0 - decelerationFactor)* a3/ ((1.0 - a3)* decelerationFactor));
      self->_instantaneousTargetLocation.offset.y = v14;
      self->_instantaneousTargetLocation.zOffset = v15;
      self->_instantaneousTargetLocation.logScale = v16;
    }
    else
    {
      v6 = WBS_LOG_CHANNEL_PREFIXTabView();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[TabOverviewInterpolatedLocation setDecelerationFactor:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
    self->_decelerationFactor = a3;
  }
}

- (void)shiftTargetLocation:(id *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double logScale;
  long double v13;
  long double v14;
  long double v15;
  long double v16;
  double y;
  long double v18;
  CGFloat v19;
  CGFloat v20;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  logScale = self->_targetLocation.logScale;
  v13 = exp(logScale - v6);
  v14 = v10 * v13 - self->_targetLocation.offset.x;
  v15 = v9 * v13 - self->_targetLocation.offset.y;
  v16 = exp(self->_instantaneousTargetLocation.logScale - logScale);
  y = self->_instantaneousTargetLocation.offset.y;
  self->_instantaneousTargetLocation.offset.x = self->_instantaneousTargetLocation.offset.x + v14 * v16;
  self->_instantaneousTargetLocation.offset.y = y + v15 * v16;
  v18 = exp(self->_location.logScale - logScale);
  v19 = self->_location.offset.x + v14 * v18;
  v20 = self->_location.offset.y + v15 * v18;
  self->_location.offset.x = v19;
  self->_location.offset.y = v20;
  self->_targetLocation.offset.x = v10;
  self->_targetLocation.offset.y = v9;
  self->_targetLocation.zOffset = v8;
  self->_targetLocation.logScale = v7;
}

- (void)setTargetLocation:(id *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;

  if (v3 != self->_targetLocation.offset.x
    || v4 != self->_targetLocation.offset.y
    || v5 != self->_targetLocation.zOffset
    || v6 != self->_targetLocation.logScale)
  {
    self->_targetLocation.offset.x = v3;
    self->_targetLocation.offset.y = v4;
    self->_targetLocation.zOffset = v5;
    self->_targetLocation.logScale = v6;
  }
}

- (double)decelerationFactorForTargetLocation:(id *)a3
{
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  int v12;
  double logScale;
  long double v14;
  double x;
  double y;
  double v17;
  double v18;
  double v19;
  NSObject *v20;
  double zOffset;
  double v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  CGPoint offset;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  v33 = *MEMORY[0x1E0C80C00];
  v12 = _SFEqualWithEpsilon();
  logScale = self->_location.logScale;
  if (v12)
  {
    v14 = exp(logScale - v7);
    x = self->_location.offset.x;
    y = self->_location.offset.y;
    v17 = ((self->_instantaneousTargetLocation.offset.y - y) * (v9 * v14 - y)
         + (self->_instantaneousTargetLocation.offset.x - x) * (v10 * v14 - x))
        / ((self->_instantaneousTargetLocation.offset.y - y) * (self->_instantaneousTargetLocation.offset.y - y)
         + (self->_instantaneousTargetLocation.offset.x - x) * (self->_instantaneousTargetLocation.offset.x - x));
  }
  else
  {
    v17 = (v7 - logScale) / (self->_instantaneousTargetLocation.logScale - logScale);
  }
  v18 = v17 * self->_decelerationFactor / (1.0 - (1.0 - v17) * self->_decelerationFactor);
  v19 = fabs(v18);
  if (v19 >= INFINITY && v19 <= INFINITY)
  {
    v20 = WBS_LOG_CHANNEL_PREFIXTabView();
    v18 = 0.0;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      offset = self->_location.offset;
      zOffset = self->_location.zOffset;
      v23 = self->_location.logScale;
      v24 = (void *)MEMORY[0x1E0CB3940];
      v25 = v20;
      objc_msgSend(v24, "stringWithFormat:", CFSTR("{ x = %f; y = %f; z = %f; logScale = %f }"),
        offset,
        *(_QWORD *)&zOffset,
        *(_QWORD *)&v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ x = %f; y = %f; z = %f; logScale = %f }"),
        *(_QWORD *)&v10,
        *(_QWORD *)&v9,
        v8,
        *(_QWORD *)&v7);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v30 = v26;
      v31 = 2112;
      v32 = v27;
      _os_log_error_impl(&dword_1D7CA3000, v25, OS_LOG_TYPE_ERROR, "Unexpected deceleration factor for location: %@, target location: %@", buf, 0x16u);

    }
  }
  return v18;
}

- (BOOL)interpolateByTimeInterval:(double)a3 roundingAtSize:(CGSize)a4 zScaleFactor:(double)a5 withHorizontalBounceFactor:(double)a6 verticalBounceFactor:(double)a7 constraints:(id)a8
{
  double (**v13)(_QWORD);
  BOOL v14;
  _BOOL4 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double x;
  double logScale;
  double v36;
  double y;
  double v38;
  long double v39;
  long double v40;
  long double v41;
  long double v42;
  long double v43;
  long double v44;
  double v45;
  double v46;
  double zOffset;
  double v48;
  double v49;
  long double v50;
  double v51;
  BOOL v52;
  double __x;
  double v55;
  double v56;
  double v58;
  double v59;
  double v60;
  double v61;

  v13 = (double (**)(_QWORD))a8;
  v14 = self->_lastRenderedLocation.offset.x == self->_location.offset.x
     && self->_lastRenderedLocation.offset.y == self->_location.offset.y;
  v16 = v14
     && self->_lastRenderedLocation.zOffset == self->_location.zOffset
     && self->_lastRenderedLocation.logScale == self->_location.logScale;
  v17 = a3 * 1000.0;
  v18 = pow(self->_decelerationFactor, a3 * 1000.0);
  v19 = fmax(fmin(-[TabOverviewInterpolatedLocation _minimumInterpolationFactorForTimeInterval:]((double *)self, a3), v18), 0.0);
  v20 = interpolateLocations(self->_targetLocation.offset.x, self->_targetLocation.offset.y, self->_targetLocation.zOffset, self->_targetLocation.logScale, self->_instantaneousTargetLocation.offset.x, self->_instantaneousTargetLocation.offset.y, self->_instantaneousTargetLocation.zOffset, self->_instantaneousTargetLocation.logScale, v19);
  self->_instantaneousTargetLocation.offset.x = v20;
  self->_instantaneousTargetLocation.offset.y = v21;
  self->_instantaneousTargetLocation.zOffset = v22;
  self->_instantaneousTargetLocation.logScale = v23;
  self->_location.offset.x = interpolateLocations(v20, v21, v22, v23, self->_location.offset.x, self->_location.offset.y, self->_location.zOffset, self->_location.logScale, v19);
  self->_location.offset.y = v24;
  self->_location.zOffset = v25;
  self->_location.logScale = v26;
  if (v13)
  {
    v27 = a6;
    __x = a7;
    v55 = a5;
    v28 = v13[2](v13);
    v30 = v29;
    v56 = v31;
    v33 = v32;
    x = self->_location.offset.x;
    logScale = self->_location.logScale;
    if (v28 != x)
    {
      v36 = pow(v27, a3 * 1000.0);
      x = v36 * x + (1.0 - v36) * (v28 * exp(logScale - v33));
      self->_location.offset.x = x;
      self->_instantaneousTargetLocation.offset.x = v36 * self->_instantaneousTargetLocation.offset.x
                                                  + (1.0 - v36)
                                                  * (v28
                                                   * exp(self->_instantaneousTargetLocation.logScale - v33));
      self->_targetLocation.offset.x = v36 * self->_targetLocation.offset.x
                                     + (1.0 - v36) * (v28 * exp(self->_targetLocation.logScale - v33));
    }
    y = self->_location.offset.y;
    if (v30 != y)
    {
      v38 = pow(__x, v17);
      y = v38 * y + (1.0 - v38) * (v30 * exp(logScale - v33));
      self->_location.offset.y = y;
      self->_instantaneousTargetLocation.offset.y = v38 * self->_instantaneousTargetLocation.offset.y
                                                  + (1.0 - v38)
                                                  * (v30
                                                   * exp(self->_instantaneousTargetLocation.logScale - v33));
      self->_targetLocation.offset.y = v38 * self->_targetLocation.offset.y
                                     + (1.0 - v38) * (v30 * exp(self->_targetLocation.logScale - v33));
    }
    v14 = x == v28;
    a5 = v55;
    if (!v14 || y != v30 || self->_location.zOffset != v56 || logScale != v33)
    {
      v39 = self->_targetLocation.logScale;
      v40 = exp(v39 - v33);
      roundLocationToLocation((uint64_t)&self->_targetLocation, v28 * v40, v30 * v40, v56, v39, a4.width, a4.height, v55);
      v41 = self->_location.logScale;
      v42 = exp(v41 - v33);
      roundLocationToLocation((uint64_t)&self->_location, v28 * v42, v30 * v42, v56, v41, a4.width, a4.height, v55);
      v43 = self->_instantaneousTargetLocation.logScale;
      v44 = exp(v43 - v33);
      roundLocationToLocation((uint64_t)&self->_instantaneousTargetLocation, v28 * v44, v30 * v44, v56, v43, a4.width, a4.height, v55);
    }
  }
  roundLocationToLocation((uint64_t)&self->_instantaneousTargetLocation, self->_targetLocation.offset.x, self->_targetLocation.offset.y, self->_targetLocation.zOffset, self->_targetLocation.logScale, a4.width, a4.height, a5);
  roundLocationToLocation((uint64_t)&self->_location, self->_instantaneousTargetLocation.offset.x, self->_instantaneousTargetLocation.offset.y, self->_instantaneousTargetLocation.zOffset, self->_instantaneousTargetLocation.logScale, a4.width, a4.height, a5);
  if (v16)
  {
    v45 = self->_lastRenderedLocation.offset.y;
    zOffset = self->_lastRenderedLocation.zOffset;
    v46 = self->_lastRenderedLocation.logScale;
    v49 = self->_location.offset.x;
    v48 = self->_location.offset.y;
    v51 = self->_location.zOffset;
    v50 = self->_location.logScale;
    v58 = self->_lastRenderedLocation.offset.x;
    v59 = v45;
    v60 = zOffset;
    v61 = v46;
    if (v58 == v49 && v45 == v48 && zOffset == v51 && v46 == v50)
    {
      v52 = 0;
    }
    else
    {
      roundLocationToLocation((uint64_t)&v58, v49, v48, v51, v50, a4.width, a4.height, a5);
      v52 = 1;
      if (v58 == v49 && v59 == v48 && v60 == v51)
        v52 = v61 != v50;
    }
  }
  else
  {
    v52 = 1;
  }

  return v52;
}

- (double)_minimumInterpolationFactorForTimeInterval:(double *)a1
{
  double result;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  BOOL v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  if (!a1)
    return 0.0;
  result = 1.0;
  if (a2 != 0.0)
  {
    v4 = a1[21];
    if (v4 != 0.0)
    {
      v5 = a1[4];
      if (a1[26] == v5 && v5 == a1[30])
      {
        v6 = a1[3];
        if (a1[25] == v6 && v6 == a1[29])
        {
          v7 = a1[1];
          v8 = a1[23] != v7 || v7 != a1[27];
          v9 = a1[2];
          if (a1[24] != v9 || v9 != a1[28])
            v8 |= 2uLL;
          if (v8 && v8 != 3)
          {
            v10 = v8 == 1;
            v11 = 28;
            if (v10)
              v11 = 27;
            v12 = a1[v11];
            v13 = 2;
            if (v10)
              v13 = 1;
            v14 = a1[v13];
            v15 = 24;
            if (v10)
              v15 = 23;
            v16 = a1[v15];
            if ((v12 >= v16 || v12 <= v14 && v14 <= v16) && (v16 >= v12 || v14 <= v12 && v16 <= v14))
            {
              v17 = -v4;
              if (v12 < v16)
                v17 = a1[21];
              if (v14 == v16)
              {
                v18 = v12 + v17 * a2 - v16;
                v19 = v12 - v16;
              }
              else
              {
                v20 = v12 + v14 - v16 - v16;
                v21 = v16 - v14;
                v22 = v20 * v20 + v21 * -4.0 * (v16 - v17 * a2 - v12);
                v19 = v21 + v21;
                v23 = sqrt(v22);
                v24 = -v20;
                if (v12 < v16)
                {
                  v20 = v23;
                  v23 = v24;
                }
                v18 = v23 - v20;
              }
              return v18 / v19;
            }
          }
        }
      }
    }
  }
  return result;
}

- (void)resetRenderedLocation
{
  self->_lastRenderedLocation = self->_location;
}

- (void)beginInteractionAtTime:(double)a3
{
  self->_lastInteractionTimestamp = a3;
  *(_WORD *)&self->_interactionIncludesScale = 256;
  self->_interactionLocation = self->_location;
  self->_interactionVelocity = (CGPoint)*MEMORY[0x1E0C9D538];
}

- (void)endInteraction
{
  -[TabOverviewInterpolatedLocation endInteractionWithVelocity:](self, "endInteractionWithVelocity:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)endInteractionWithVelocity:(CGPoint)a3
{
  double decelerationFactor;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 interactionIncludesScale;
  double logScale;
  long double v15;
  double v16;
  double v17;
  double v18;
  double interactionLogScaleVelocity;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  double v33;
  double v34;
  CGPoint interactionFixedPoint;
  float64x2_t v36;

  _ZF = self->_interactionVelocity.x == *MEMORY[0x1E0C9D538]
     && self->_interactionVelocity.y == *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (_ZF
    && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64((float64x2_t)self->_interactionLocation.offset, (float64x2_t)self->_location.offset), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_interactionLocation.zOffset, *(float64x2_t *)&self->_location.zOffset))), 0xFuLL))) & 1) != 0)
  {
    self->_interactionVelocity = a3;
  }
  decelerationFactor = self->_decelerationFactor;
  self->_interacting = 0;
  if (decelerationFactor <= 0.99999)
  {
    v34 = decelerationFactor / ((1.0 - decelerationFactor) * 1000.0);
  }
  else
  {
    v6 = WBS_LOG_CHANNEL_PREFIXTabView();
    v34 = 1.0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[TabOverviewInterpolatedLocation endInteractionWithVelocity:].cold.1((uint64_t)&self->_decelerationFactor, v6, v7, v8, v9, v10, v11, v12);
  }
  interactionIncludesScale = self->_interactionIncludesScale;
  logScale = self->_targetLocation.logScale;
  v15 = self->_interactionLocation.logScale;
  v16 = exp(logScale - v15);
  if (interactionIncludesScale)
  {
    v17 = self->_instantaneousTargetLocation.logScale;
    v33 = v16;
    v18 = exp(v17 - v15);
    interactionLogScaleVelocity = self->_interactionLogScaleVelocity;
    v20 = logScale + v34 * interactionLogScaleVelocity;
    self->_targetLocation.logScale = v20;
    v21 = v17 + v34 * interactionLogScaleVelocity;
    self->_instantaneousTargetLocation.logScale = v21;
    v22 = exp(v20);
    v23 = exp(v15);
    interactionFixedPoint = self->_interactionFixedPoint;
    self->_targetLocation.offset = (CGPoint)vmlaq_n_f64((float64x2_t)self->_targetLocation.offset, vmulq_n_f64((float64x2_t)interactionFixedPoint, v22 - v23), v33);
    v24 = exp(v21) - v23;
    v25 = self->_instantaneousTargetLocation.offset.x + v24 * interactionFixedPoint.x * v18;
    v26 = self->_instantaneousTargetLocation.offset.y + vmuld_lane_f64(v24, (float64x2_t)interactionFixedPoint, 1) * v18;
    self->_instantaneousTargetLocation.offset.x = v25;
    self->_instantaneousTargetLocation.offset.y = v26;
  }
  else
  {
    v36 = vmulq_n_f64((float64x2_t)self->_interactionVelocity, v34);
    self->_targetLocation.offset = (CGPoint)vmlaq_n_f64((float64x2_t)self->_targetLocation.offset, v36, v16);
    _D0 = exp(self->_instantaneousTargetLocation.logScale - self->_location.logScale);
    _V3.D[1] = v36.f64[1];
    __asm { FMLA            D2, D0, V3.D[1] }
    self->_instantaneousTargetLocation.offset.x = vmlad_n_f64(self->_instantaneousTargetLocation.offset.x, _D0, v36.f64[0]);
    self->_instantaneousTargetLocation.offset.y = _D2;
  }
}

- (void)_moveBy:(double)a3 shiftLocation:(double)a4
{
  uint64_t v8;
  double v9;
  long double v10;
  long double v11;
  long double v12;
  double v13;
  long double v14;
  long double v15;
  long double v16;
  long double v17;
  long double v18;
  long double v19;

  if (a1)
  {
    v8 = 160;
    if (!*(_BYTE *)(a1 + 57))
      v8 = 240;
    v9 = *(double *)(a1 + v8);
    if (a2)
    {
      v10 = exp(*(double *)(a1 + 240) - v9);
      v11 = *(double *)(a1 + 216) + a3 * v10;
      v12 = *(double *)(a1 + 224) + a4 * v10;
      *(long double *)(a1 + 216) = v11;
      *(long double *)(a1 + 224) = v12;
    }
    v13 = a4 + *(double *)(a1 + 144);
    *(double *)(a1 + 136) = a3 + *(double *)(a1 + 136);
    *(double *)(a1 + 144) = v13;
    v14 = exp(*(double *)(a1 + 208) - v9);
    v15 = *(double *)(a1 + 184) + a3 * v14;
    v16 = *(double *)(a1 + 192) + a4 * v14;
    *(long double *)(a1 + 184) = v15;
    *(long double *)(a1 + 192) = v16;
    if (a2)
    {
      v17 = exp(*(double *)(a1 + 32) - v9);
      v18 = *(double *)(a1 + 8) + a3 * v17;
      v19 = *(double *)(a1 + 16) + a4 * v17;
      *(long double *)(a1 + 8) = v18;
      *(long double *)(a1 + 16) = v19;
    }
  }
}

- (void)moveBy:(CGPoint)a3 atTime:(double)a4
{
  double y;
  double x;
  double v8;

  y = a3.y;
  x = a3.x;
  -[TabOverviewInterpolatedLocation _moveBy:shiftLocation:]((uint64_t)self, 1, a3.x, a3.y);
  v8 = a4 - self->_lastInteractionTimestamp;
  if (v8 > 0.008)
  {
    self->_interactionVelocity.x = x / v8;
    self->_interactionVelocity.y = y / v8;
  }
  self->_lastInteractionTimestamp = a4;
  self->_interactionIncludesScale = 0;
}

- (void)moveInstantaneouslyBy:(CGPoint)a3
{
  double y;
  double x;
  CGFloat v6;
  long double v7;
  CGFloat v8;
  CGFloat v9;

  y = a3.y;
  x = a3.x;
  v6 = a3.y + self->_location.offset.y;
  self->_location.offset.x = a3.x + self->_location.offset.x;
  self->_location.offset.y = v6;
  v7 = exp(self->_instantaneousTargetLocation.logScale - self->_location.logScale);
  v8 = self->_instantaneousTargetLocation.offset.x + x * v7;
  v9 = self->_instantaneousTargetLocation.offset.y + y * v7;
  self->_instantaneousTargetLocation.offset.x = v8;
  self->_instantaneousTargetLocation.offset.y = v9;
}

- (void)moveLogScaleBy:(double)a3 centeringOffset:(CGPoint)a4 withLastCenteringOffset:(CGPoint)a5 atTime:(double)a6
{
  -[TabOverviewInterpolatedLocation moveLogScaleBy:centeringOffset:withLastCenteringOffset:atTime:shiftLocation:](self, "moveLogScaleBy:centeringOffset:withLastCenteringOffset:atTime:shiftLocation:", 1, a3, a4.x, a4.y, a5.x, a5.y, a6);
}

- (void)moveLogScaleBy:(double)a3 centeringOffset:(CGPoint)a4 withLastCenteringOffset:(CGPoint)a5 atTime:(double)a6 shiftLocation:(BOOL)a7
{
  _BOOL4 v7;
  double y;
  double x;
  double v10;
  double v11;
  double v14;
  double v15;
  long double logScale;
  long double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;

  v7 = a7;
  y = a5.y;
  x = a5.x;
  v10 = a4.y;
  v11 = a4.x;
  v14 = self->_interactionLocation.offset.x;
  v15 = self->_interactionLocation.offset.y;
  logScale = self->_interactionLocation.logScale;
  v22 = exp(logScale);
  self->_targetLocation.logScale = self->_targetLocation.logScale + a3;
  self->_interactionLocation.logScale = logScale + a3;
  if (v7)
  {
    self->_location.logScale = self->_location.logScale + a3;
    self->_instantaneousTargetLocation.logScale = self->_instantaneousTargetLocation.logScale + a3;
  }
  v17 = exp(a3);
  -[TabOverviewInterpolatedLocation _moveBy:shiftLocation:]((uint64_t)self, v7, v11 - v14 - (x - v14) * v17, v10 - v15 - (y - v15) * v17);
  v18 = exp(self->_interactionLocation.logScale) - v22;
  if ((_SFEqualWithEpsilon() & 1) == 0)
  {
    v19 = (self->_interactionLocation.offset.y - v15) / v18;
    self->_interactionFixedPoint.x = (self->_interactionLocation.offset.x - v14) / v18;
    self->_interactionFixedPoint.y = v19;
  }
  v20 = a6 - self->_lastInteractionTimestamp;
  if (v20 > 0.008)
  {
    v21 = a3 / v20;
    self->_interactionLogScaleVelocity = v21 * 0.2 + self->_previousInteractionLogScaleVelocity * 0.8;
    self->_previousInteractionLogScaleVelocity = v21;
    self->_lastInteractionTimestamp = a6;
  }
  self->_interactionIncludesScale = 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  CGPoint offset;
  float64x2_t v9;
  float64x2_t v10;
  void *v11;
  void *v12;
  double y;
  double logScale;
  double x;
  double v16;
  double v17;
  void *v18;
  double interactionLogScaleVelocity;
  double previousInteractionLogScaleVelocity;
  void *v21;
  uint64_t v23;
  uint64_t v24;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ x = %f; y = %f; z = %f; logScale = %f }"),
    *(_QWORD *)&self->_location.offset.x,
    *(_QWORD *)&self->_location.offset.y,
    *(_QWORD *)&self->_location.zOffset,
    *(_QWORD *)&self->_location.logScale);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; location = %@"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  offset = self->_location.offset;
  v9 = *(float64x2_t *)&self->_location.zOffset;
  v10 = *(float64x2_t *)&self->_targetLocation.zOffset;
  if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64((float64x2_t)offset, (float64x2_t)self->_targetLocation.offset), (int32x4_t)vceqq_f64(v9, v10))), 0xFuLL))) & 1) != 0&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64((float64x2_t)offset, (float64x2_t)self->_instantaneousTargetLocation.offset), (int32x4_t)vceqq_f64(v9, *(float64x2_t *)&self->_instantaneousTargetLocation.zOffset))), 0xFuLL))) & 1) != 0)
  {
    y = self->_location.offset.y;
    logScale = self->_location.logScale;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ x = %f; y = %f; z = %f; logScale = %f }"),
      *(_QWORD *)&self->_targetLocation.offset.x,
      *(_QWORD *)&self->_targetLocation.offset.y,
      *(_OWORD *)&v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ x = %f; y = %f; z = %f; logScale = %f }"),
      *(_QWORD *)&self->_instantaneousTargetLocation.offset.x,
      *(_QWORD *)&self->_instantaneousTargetLocation.offset.y,
      *(_QWORD *)&self->_instantaneousTargetLocation.zOffset,
      *(_QWORD *)&self->_instantaneousTargetLocation.logScale);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("; targetLocation = %@; instantaneousTargetLocation = %@"), v11, v12);

    offset.x = self->_location.offset.x;
    y = self->_location.offset.y;
    v9.f64[0] = self->_location.zOffset;
    logScale = self->_location.logScale;
  }
  x = self->_lastRenderedLocation.offset.x;
  v16 = self->_lastRenderedLocation.offset.y;
  v17 = self->_lastRenderedLocation.logScale;
  if (offset.x != x || y != v16 || v9.f64[0] != self->_lastRenderedLocation.zOffset || logScale != v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ x = %f; y = %f; z = %f; logScale = %f }"),
      v9.f64[0],
      *(_QWORD *)&x,
      *(_QWORD *)&v16,
      *(_QWORD *)&self->_lastRenderedLocation.zOffset,
      *(_QWORD *)&v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("; lastRenderedLocation = %@"), v18);

  }
  objc_msgSend(v7, "appendFormat:", CFSTR("; decelerationFactor = %f"), *(_QWORD *)&self->_decelerationFactor);
  if (self->_interacting)
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("; lastInteractionTimestamp = %f"),
      *(_QWORD *)&self->_lastInteractionTimestamp);
    if (self->_interactionIncludesScale)
    {
      interactionLogScaleVelocity = self->_interactionLogScaleVelocity;
      previousInteractionLogScaleVelocity = self->_previousInteractionLogScaleVelocity;
      NSStringFromCGPoint(self->_interactionFixedPoint);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendFormat:", CFSTR("; interactionLogScaleVelocity = %f; previousInteractionLogScaleVelocity = %f; interactionFixedPoint = %@"),
        *(_QWORD *)&interactionLogScaleVelocity,
        *(_QWORD *)&previousInteractionLogScaleVelocity,
        v21);
    }
    else
    {
      NSStringFromCGPoint(self->_interactionVelocity);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendFormat:", CFSTR("; interactionVelocity = %@"), v21, v23, v24);
    }

  }
  objc_msgSend(v7, "appendString:", CFSTR(">"));
  return v7;
}

- (double)minimumTranslationSpeed
{
  return self->_minimumTranslationSpeed;
}

- (double)decelerationFactor
{
  return self->_decelerationFactor;
}

- (void)setDecelerationFactor:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D7CA3000, a1, a3, "Unexpected decelerationFactor: %f", a5, a6, a7, a8, 0);
}

- (void)endInteractionWithVelocity:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D7CA3000, a2, a3, "Unexpected _decelerationFactor after ending interaction: %f", a5, a6, a7, a8, 0);
}

@end
