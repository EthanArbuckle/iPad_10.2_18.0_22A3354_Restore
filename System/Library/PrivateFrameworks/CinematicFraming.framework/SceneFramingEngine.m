@implementation SceneFramingEngine

- (CinematicFramingSessionFramingParameters)activeFramingParameters
{
  return self->_activeFramingParameters;
}

- (void)setActiveFramingParameters:(id)a3
{
  double x;
  double y;
  double width;
  double height;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGRect v12;

  objc_storeStrong((id *)&self->_activeFramingParameters, a3);
  -[SceneFramingEngine targetViewport](self, "targetViewport");
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  if (!CGRectIsNull(v12))
  {
    -[SceneFramingEngine computeDeadbandFromViewport:](self, "computeDeadbandFromViewport:", x, y, width, height);
    self->_deadband.origin.x = v8;
    self->_deadband.origin.y = v9;
    self->_deadband.size.width = v10;
    self->_deadband.size.height = v11;
  }
}

- (SceneFramingEngine)initWithFramingSpaceManager:(id)a3
{
  id v5;
  SceneFramingEngine *v6;
  SceneFramingEngine *v7;
  SceneFramingEngine *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SceneFramingEngine;
  v6 = -[SceneFramingEngine init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_framingSpaceManager, a3);
    LODWORD(v7->_targetViewportForFloating.size.height) = 0;
    -[SceneFramingEngine reset](v7, "reset");
    v8 = v7;
  }

  return v7;
}

- (void)updateTargetViewportWithTracks:(id)a3 currentViewport:(CGRect)a4 atTime:(id *)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  uint64_t v12;
  int64_t v13;
  BOOL v14;
  __int128 v15;
  int64_t var3;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  if (objc_msgSend(v11, "count"))
  {
    v15 = *(_OWORD *)&a5->var0;
    var3 = a5->var3;
    -[SceneFramingEngine determineTemporallyStableTargetViewportForTracks:currentViewport:atTime:](self, "determineTemporallyStableTargetViewportForTracks:currentViewport:atTime:", v11, &v15, x, y, width, height);
    v12 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&self->_recenterEndTime.epoch = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)&self->_returningHomeStartTime.timescale = *(_QWORD *)(v12 + 16);
    v13 = a5->var3;
    *(_OWORD *)&self->_lastFrameWithDetectionsTimestamp.value = *(_OWORD *)&a5->var0;
    self->_lastFrameWithDetectionsTimestamp.epoch = v13;
    v14 = 1;
  }
  else
  {
    v15 = *(_OWORD *)&a5->var0;
    var3 = a5->var3;
    -[SceneFramingEngine restoreDefaultViewportFromCurrentViewport:atTime:](self, "restoreDefaultViewportFromCurrentViewport:atTime:", &v15, x, y, width, height);
    v14 = 0;
  }
  self->_lastFrameHadSubjects = v14;

}

- (void)reset
{
  uint64_t v3;
  int64_t v4;
  CinematicFramingSessionFramingParameters *activeFramingParameters;
  void *v6;
  __int128 v7;
  CGSize v8;
  CGPoint v9;

  v8 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  v9 = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_deadband.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_deadband.size = v8;
  self->_idealDeadband.origin = v9;
  self->_idealDeadband.size = v8;
  self->_slackDeadband.origin = v9;
  self->_slackDeadband.size = v8;
  v3 = MEMORY[0x1E0CA2E18];
  v7 = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)&self->_lastFrameWithDetectionsTimestamp.value = *MEMORY[0x1E0CA2E18];
  v4 = *(_QWORD *)(v3 + 16);
  self->_lastFrameWithDetectionsTimestamp.epoch = v4;
  activeFramingParameters = self->_activeFramingParameters;
  self->_activeFramingParameters = 0;

  self->_framingState = 0;
  -[SceneFramingEngine clearSubjectHistory](self, "clearSubjectHistory");
  *(_OWORD *)&self->_driftStartDeadband.size.height = v7;
  *(_QWORD *)&self->_driftStartTime.timescale = v4;
  *(_OWORD *)&self->_driftStartTime.epoch = v7;
  *(_QWORD *)&self->_driftEndTime.timescale = v4;
  *(_OWORD *)&self->_recenterStartDeadband.size.height = v7;
  *(_QWORD *)&self->_recenterStartTime.timescale = v4;
  *(_OWORD *)&self->_recenterStartTime.epoch = v7;
  *(_QWORD *)&self->_recenterEndTime.timescale = v4;
  *(_OWORD *)&self->_recenterEndTime.epoch = v7;
  *(_QWORD *)&self->_returningHomeStartTime.timescale = v4;
  self->_lastFrameHadSubjects = 0;
  v6 = *(void **)&self->_floatingFramingParameters.circleSize;
  *(_QWORD *)&self->_floatingFramingParameters.circleSize = 0;

  *(CGPoint *)&self->_trackForFloating = v9;
  *(CGSize *)&self->_targetViewportForFloating.origin.y = v8;
}

- (void)setFramingStyle:(int)a3
{
  int v3;

  if (a3 == 1)
  {
    *(_OWORD *)&self->_newsroomFramingParameters.viewportOffsetY = xmmword_1D4E43D80;
  }
  else if ((a3 & 0xFFFFFFFE) == 2)
  {
    *(_QWORD *)&self->_returningHomeTargetRect[12] = 0x3F800000BE4CCCCDLL;
    if (a3 == 2)
      v3 = -1;
    else
      v3 = 1;
    *(float *)&self->_returningHomeTargetRect[8] = (float)v3 * 0.2;
  }
  if (LODWORD(self->_targetViewportForFloating.size.height) != a3)
    LOBYTE(self->_driftEndTime.epoch) = 1;
  LODWORD(self->_targetViewportForFloating.size.height) = a3;
}

- (CGRect)defaultViewport
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  float v11;
  double v12;
  CGFloat v13;
  float v14;
  float v15;
  CGFloat v16;
  float v17;
  double v18;
  CGFloat v19;
  float v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect result;

  -[FramingSpaceManager framingSpaceBounds](self->_framingSpaceManager, "framingSpaceBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CinematicFramingSessionOptions viewportDefaultFOV](self->_options, "viewportDefaultFOV");
  v12 = v11;
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  v13 = CGRectGetWidth(v25) * v12;
  *(float *)&v12 = v13;
  LODWORD(v13) = LODWORD(v12);
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:", v13);
  v15 = v14;
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  v16 = CGRectGetMidX(v26) - (float)(*(float *)&v12 * 0.5);
  -[CinematicFramingSessionOptions defaultViewportRotation](self->_options, "defaultViewportRotation");
  v18 = v16 - v17;
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  v19 = CGRectGetMidY(v27) - (float)(v15 * 0.5);
  -[CinematicFramingSessionOptions defaultViewportRotation](self->_options, "defaultViewportRotation");
  v21 = v19 - v20;
  v22 = *(float *)&v12;
  v23 = v15;
  v24 = v18;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v24;
  return result;
}

- (CGRect)targetViewport
{
  CinematicTrack *trackForFloating;
  double x;
  double y;
  double width;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  if (LODWORD(self->_targetViewportForFloating.size.height) == 1)
  {
    trackForFloating = self->_trackForFloating;
    x = self->_targetViewportForFloating.origin.x;
    y = self->_targetViewportForFloating.origin.y;
    width = self->_targetViewportForFloating.size.width;
LABEL_6:
    -[FramingSpaceManager adjustDisplayRectToFitInFramingSpace:](self->_framingSpaceManager, "adjustDisplayRectToFitInFramingSpace:", *(double *)&trackForFloating, x, y, width);
    goto LABEL_7;
  }
  if (!CGRectIsNull(self->_deadband))
  {
    -[SceneFramingEngine computeViewportFromDeadband:](self, "computeViewportFromDeadband:", self->_deadband.origin.x, self->_deadband.origin.y, self->_deadband.size.width, self->_deadband.size.height);
    goto LABEL_6;
  }
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  v9 = *MEMORY[0x1E0C9D628];
  v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
LABEL_7:
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)idealViewport
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if (LODWORD(self->_targetViewportForFloating.size.height) == 1)
  {
    -[SceneFramingEngine targetViewport](self, "targetViewport");
  }
  else if (CGRectIsNull(self->_idealDeadband))
  {
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v3 = *MEMORY[0x1E0C9D628];
    v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  }
  else
  {
    -[SceneFramingEngine computeViewportFromDeadband:](self, "computeViewportFromDeadband:", self->_idealDeadband.origin.x, self->_idealDeadband.origin.y, self->_idealDeadband.size.width, self->_idealDeadband.size.height);
    -[FramingSpaceManager adjustDisplayRectToFitInFramingSpace:](self->_framingSpaceManager, "adjustDisplayRectToFitInFramingSpace:");
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)slackViewport
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (LODWORD(self->_targetViewportForFloating.size.height) != 1 && !CGRectIsNull(self->_slackDeadband))
  {
    -[SceneFramingEngine computeViewportFromDeadband:](self, "computeViewportFromDeadband:", self->_slackDeadband.origin.x, self->_slackDeadband.origin.y, self->_slackDeadband.size.width, self->_slackDeadband.size.height);
    -[FramingSpaceManager adjustDisplayRectToFitInFramingSpace:](self->_framingSpaceManager, "adjustDisplayRectToFitInFramingSpace:");
    v2 = v7;
    v3 = v8;
    v4 = v9;
    v5 = v10;
  }
  v11 = v2;
  v12 = v3;
  v13 = v4;
  v14 = v5;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)restoreDefaultViewportFromCurrentViewport:(CGRect)a3 atTime:(id *)a4
{
  CMTime *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  float v11;
  float v12;
  double v13;
  double v14;
  double v15;
  __int128 v16;
  int64_t *p_epoch;
  float64x2_t v18;
  float64x2_t v19;
  float32x4_t v20;
  float64x2_t v21;
  double Seconds;
  float v23;
  double v24;
  float v25;
  double v26;
  float v27;
  double v28;
  float v29;
  double v30;
  double v31;
  float v32;
  int8x16_t v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGPoint origin;
  CGSize size;
  __int128 v42;
  float64_t v43;
  float64_t v44;
  float64_t v45;
  CGFloat height;
  CGFloat y;
  CGFloat x;
  CGFloat width;
  CGPoint v50;
  CMTime v51;
  CMTime v52;
  CMTime v53;
  CMTime v54;
  CMTime time;
  CMTime time2;
  CMTime time1;

  height = a3.size.height;
  y = a3.origin.y;
  x = a3.origin.x;
  width = a3.size.width;
  v6 = (CMTime *)MEMORY[0x1E0CA2E18];
  if (LODWORD(self->_targetViewportForFloating.size.height) == 1)
  {
    v7 = *(double *)&self->_trackForFloating;
    v8 = self->_targetViewportForFloating.origin.x;
    v9 = self->_targetViewportForFloating.origin.y;
    v10 = self->_targetViewportForFloating.size.width;
  }
  else
  {
    v7 = self->_deadband.origin.x;
    v8 = self->_deadband.origin.y;
    v9 = self->_deadband.size.width;
    v10 = self->_deadband.size.height;
  }
  if (CGRectIsNull(*(CGRect *)&v7)
    || ((time1 = (CMTime)self->_lastFrameWithDetectionsTimestamp, time2 = *v6, !CMTimeCompare(&time1, &time2))
      ? (v11 = 0.0)
      : (time1 = (CMTime)*a4,
         time2 = (CMTime)self->_lastFrameWithDetectionsTimestamp,
         CMTimeSubtract(&time, &time1, &time2),
         v11 = CMTimeGetSeconds(&time)),
        -[CinematicFramingSessionOptions noPeopleDelayBeforeReturningHomeSec](self->_options, "noPeopleDelayBeforeReturningHomeSec"), v11 > v12))
  {
    -[SceneFramingEngine defaultViewport](self, "defaultViewport");
    v43 = v14;
    v44 = v13;
    v45 = v15;
    v42 = v16;
    p_epoch = &self->_recenterEndTime.epoch;
    time1 = *(CMTime *)&self->_recenterEndTime.epoch;
    time2 = *v6;
    if (!CMTimeCompare(&time1, &time2))
    {
      v18 = *(float64x2_t *)&a4->var0;
      *(_QWORD *)&self->_returningHomeStartTime.timescale = a4->var3;
      *(float64x2_t *)p_epoch = v18;
      v19.f64[0] = width;
      v19.f64[1] = height;
      v18.f64[0] = x;
      v18.f64[1] = y;
      v20 = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v18), v19);
      v21.f64[0] = v45;
      *(_QWORD *)&v21.f64[1] = v42;
      v19.f64[0] = v44;
      v19.f64[1] = v43;
      *(float32x4_t *)&self->_returningHomeStartTime.epoch = v20;
      *(float32x4_t *)&self->_returningHomeStartRect[8] = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(v19), v21);
    }
    time1 = (CMTime)*a4;
    *(_OWORD *)&time2.value = *(_OWORD *)p_epoch;
    time2.epoch = *(_QWORD *)&self->_returningHomeStartTime.timescale;
    CMTimeSubtract(&v54, &time1, &time2);
    Seconds = CMTimeGetSeconds(&v54);
    -[CinematicFramingSessionOptions noPeopleReturningHomeDurationSec](self->_options, "noPeopleReturningHomeDurationSec");
    if (Seconds / v23 > 1.0)
      goto LABEL_13;
    time1 = (CMTime)*a4;
    *(_OWORD *)&time2.value = *(_OWORD *)p_epoch;
    time2.epoch = *(_QWORD *)&self->_returningHomeStartTime.timescale;
    CMTimeSubtract(&v53, &time1, &time2);
    v24 = CMTimeGetSeconds(&v53);
    -[CinematicFramingSessionOptions noPeopleReturningHomeDurationSec](self->_options, "noPeopleReturningHomeDurationSec");
    v26 = v24 / v25;
    v27 = 0.0;
    if (v26 >= 0.0)
    {
LABEL_13:
      time1 = (CMTime)*a4;
      *(_OWORD *)&time2.value = *(_OWORD *)p_epoch;
      time2.epoch = *(_QWORD *)&self->_returningHomeStartTime.timescale;
      CMTimeSubtract(&v52, &time1, &time2);
      v28 = CMTimeGetSeconds(&v52);
      -[CinematicFramingSessionOptions noPeopleReturningHomeDurationSec](self->_options, "noPeopleReturningHomeDurationSec");
      v30 = v28 / v29;
      v27 = 1.0;
      if (v30 <= 1.0)
      {
        time1 = (CMTime)*a4;
        *(_OWORD *)&time2.value = *(_OWORD *)p_epoch;
        time2.epoch = *(_QWORD *)&self->_returningHomeStartTime.timescale;
        CMTimeSubtract(&v51, &time1, &time2);
        v31 = CMTimeGetSeconds(&v51);
        -[CinematicFramingSessionOptions noPeopleReturningHomeDurationSec](self->_options, "noPeopleReturningHomeDurationSec");
        v27 = v31 / v32;
      }
    }
    v33 = (int8x16_t)vmlaq_n_f32(*(float32x4_t *)&self->_returningHomeStartTime.epoch, vsubq_f32(*(float32x4_t *)&self->_returningHomeStartRect[8], *(float32x4_t *)&self->_returningHomeStartTime.epoch), v27);
    v34 = *(float *)v33.i32;
    v35 = *(float *)&v33.i32[3];
    v50 = (CGPoint)vcvtq_f64_f32((float32x2_t)*(_OWORD *)&vextq_s8(v33, v33, 4uLL));
    -[SceneFramingEngine computeDeadbandFromViewport:](self, "computeDeadbandFromViewport:", *(float *)v33.i32, v42);
    self->_deadband.origin.x = v36;
    self->_deadband.origin.y = v37;
    self->_deadband.size.width = v38;
    self->_deadband.size.height = v39;
    origin = self->_deadband.origin;
    size = self->_deadband.size;
    self->_idealDeadband.origin = origin;
    self->_idealDeadband.size = size;
    self->_slackDeadband.origin = origin;
    self->_slackDeadband.size = size;
    if (LODWORD(self->_targetViewportForFloating.size.height) == 1)
    {
      *(double *)&self->_trackForFloating = v34;
      self->_targetViewportForFloating.origin = v50;
      self->_targetViewportForFloating.size.width = v35;
    }
  }
}

- (void)determineTemporallyStableTargetViewportForTracks:(id)a3 currentViewport:(CGRect)a4 atTime:(id *)a5
{
  id v7;
  double height;
  double width;
  double y;
  double x;
  id v12;
  __int128 v13;
  int64_t var3;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  if (LODWORD(self->_targetViewportForFloating.size.height) == 1)
  {
    v20 = *(_OWORD *)&a5->var0;
    *(_QWORD *)&v21 = a5->var3;
    v7 = a3;
    -[SceneFramingEngine updateTargetViewportForFloatingWithTracks:atTime:](self, "updateTargetViewportForFloatingWithTracks:atTime:", v7, &v20);

  }
  else
  {
    height = a4.size.height;
    width = a4.size.width;
    y = a4.origin.y;
    x = a4.origin.x;
    v24 = 0;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = *(_OWORD *)&a5->var0;
    *(_QWORD *)&v16 = a5->var3;
    v12 = a3;
    -[SceneFramingEngine determineSceneSummaryForTracks:currentViewport:atTime:](self, "determineSceneSummaryForTracks:currentViewport:atTime:", v12, &v15, x, y, width, height);
    v17 = v22;
    v18 = v23;
    v19 = v24;
    v15 = v20;
    v16 = v21;
    v13 = *(_OWORD *)&a5->var0;
    var3 = a5->var3;
    -[SceneFramingEngine updateDeadbandToFitScene:tracks:currentViewport:atTime:](self, "updateDeadbandToFitScene:tracks:currentViewport:atTime:", &v15, v12, &v13, x, y, width, height);

  }
}

- (void)updateTargetViewportForFloatingWithTracks:(id)a3 atTime:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double viewportOffsetY;
  double viewportScale;
  CGFloat v25;
  double v26;
  double eyeBoxBottomInset;
  double MidX;
  double MidY;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  float v35;
  float v36;
  CGFloat MaxY;
  float v38;
  CGFloat v39;
  float v40;
  double v41;
  CGFloat v42;
  float v43;
  CGFloat v44;
  float v45;
  double MinY;
  double v47;
  double v48;
  double v49;
  __int128 v50;
  int64_t var3;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!*(_QWORD *)&self->_floatingFramingParameters.circleSize || (objc_msgSend(v6, "containsObject:") & 1) == 0)
  {
    objc_msgSend(v7, "count");
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v53;
      v12 = 0.0;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v53 != v11)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v13);
          v50 = *(_OWORD *)&a4->var0;
          var3 = a4->var3;
          objc_msgSend(v14, "faceBoundingBoxForFramingAtTime:", &v50);
          if (v15 <= v16)
            v17 = v16;
          else
            v17 = v15;
          if (v17 > v12)
          {
            objc_storeStrong((id *)&self->_floatingFramingParameters.circleSize, v14);
            v12 = v17;
          }
          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      }
      while (v10);
    }

  }
  v18 = *(void **)&self->_floatingFramingParameters.circleSize;
  v50 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  objc_msgSend(v18, "faceBoundingBoxForFramingAtTime:", &v50);
  x = v58.origin.x;
  y = v58.origin.y;
  width = v58.size.width;
  height = v58.size.height;
  viewportOffsetY = self->_newsroomFramingParameters.viewportOffsetY;
  viewportScale = self->_newsroomFramingParameters.viewportScale;
  MinY = CGRectGetMinY(v58);
  v59.origin.x = x;
  v59.origin.y = y;
  v59.size.width = width;
  v59.size.height = height;
  v25 = CGRectGetMaxY(v59) - viewportOffsetY * height;
  v60.origin.x = x;
  v60.origin.y = y;
  v60.size.width = width;
  v60.size.height = height;
  v26 = CGRectGetMinX(v60) - viewportScale * width;
  v61.origin.x = x;
  v61.origin.y = y;
  v61.size.width = width;
  v61.size.height = height;
  v47 = v25 - MinY;
  v48 = CGRectGetMaxX(v61) + viewportScale * width - v26;
  eyeBoxBottomInset = self->_floatingFramingParameters.eyeBoxBottomInset;
  v62.origin.x = x;
  v62.origin.y = y;
  v62.size.width = width;
  v62.size.height = height;
  MidX = CGRectGetMidX(v62);
  v63.origin.x = x;
  v63.origin.y = y;
  v63.size.width = width;
  v63.size.height = height;
  MidY = CGRectGetMidY(v63);
  if (width <= height)
    v30 = height;
  else
    v30 = width;
  v31 = v30 * 0.5 * (eyeBoxBottomInset + 1.0);
  v32 = MidX - v31;
  v33 = MidY - v31;
  v34 = v31 + v31;
  v64.origin.x = x;
  v64.origin.y = y;
  v64.size.width = width;
  v64.size.height = height;
  v49 = CGRectGetMidX(v64);
  v65.origin.x = v26;
  v65.origin.y = MinY;
  v65.size.width = v48;
  v65.size.height = v47;
  v35 = CGRectGetMinX(v65) - v49;
  v45 = v35;
  v66.origin.x = v32;
  v66.origin.y = v33;
  v66.size.width = v34;
  v66.size.height = v34;
  v36 = CGRectGetMinX(v66) - v49;
  v67.origin.x = v32;
  v67.origin.y = v33;
  v67.size.width = v34;
  v67.size.height = v34;
  MaxY = CGRectGetMaxY(v67);
  v68.origin.x = v26;
  v68.origin.y = MinY;
  v68.size.width = v48;
  v68.size.height = v47;
  v38 = MaxY - CGRectGetMinY(v68);
  *(float *)&v32 = v45;
  *(float *)&MaxY = (float)((float)((float)(v36 * v36) - (float)(*(float *)&v32 * *(float *)&v32)) + (float)(v38 * v38))
                  / (float)(v38 + v38);
  v69.origin.x = v26;
  v69.origin.y = MinY;
  v69.size.width = v48;
  v69.size.height = v47;
  v39 = CGRectGetMinY(v69) + *(float *)&MaxY;
  v40 = sqrtf((float)(*(float *)&MaxY * *(float *)&MaxY) + (float)(*(float *)&v32 * *(float *)&v32));
  v41 = v40 + v40;
  v42 = v41 / self->_floatingFramingParameters.eyeBoxHorizontalPadding;
  *(float *)&v41 = v42;
  -[FramingSpaceManager getWidthForHeight:](self->_framingSpaceManager, "getWidthForHeight:", v41);
  v44 = v43;
  *(double *)&self->_trackForFloating = v49 + v44 * -0.5;
  self->_targetViewportForFloating.origin.x = v39 + v42 * -0.5;
  self->_targetViewportForFloating.origin.y = v44;
  self->_targetViewportForFloating.size.width = v42;

}

- ($680651117FADF5CC13A199869A236271)determineSceneSummaryForTracks:(SEL)a3 currentViewport:(id)a4 atTime:(CGRect)a5
{
  CGFloat height;
  double width;
  double y;
  double x;
  id v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  int v26;
  double v27;
  float v28;
  double v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  float v38;
  double v39;
  double v40;
  float v41;
  double MinX;
  double v43;
  CGFloat v44;
  double v45;
  $680651117FADF5CC13A199869A236271 *result;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  float v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v60 = *a6;
  v13 = a4;
  -[SceneFramingEngine calculateBaselineViewportForTracks:atTime:](self, "calculateBaselineViewportForTracks:atTime:", v13, &v60);
  v51 = v61.size.height;
  v14 = v61.origin.x;
  v54 = v61.origin.y;
  v55 = v61.origin.x;
  v15 = v61.origin.y;
  v16 = v61.size.width;
  v53 = v61.size.width;
  v17 = CGRectGetWidth(v61);
  *(float *)&v17 = v17;
  v60 = *a6;
  -[SceneFramingEngine calculateSubjectEnclosingRectangleForTracks:withBaselineWidth:currentViewport:atTime:](self, "calculateSubjectEnclosingRectangleForTracks:withBaselineWidth:currentViewport:atTime:", v13, &v60, v17, x, y, width, height);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;

  -[SceneFramingEngine calculateViewportWidthToFitSubjectsInDeadband:](self, "calculateViewportWidthToFitSubjectsInDeadband:", v19, v21, v23, v25);
  LODWORD(height) = v26;
  v62.origin.x = v14;
  v62.origin.y = v15;
  v62.size.width = v16;
  v62.size.height = v51;
  v27 = fmax(CGRectGetWidth(v62), *(float *)&height);
  *(float *)&height = v27;
  LODWORD(v27) = LODWORD(height);
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:", v27);
  v52 = v28;
  LODWORD(v29) = LODWORD(height);
  v56 = v19;
  v57 = v21;
  v58 = v23;
  v59 = v25;
  -[SceneFramingEngine computeCroppedSubjectEnclosingRectForViewportWidth:subjectEnclosingRect:](self, "computeCroppedSubjectEnclosingRectForViewportWidth:subjectEnclosingRect:", v29, v19, v21, v23, v25);
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  LODWORD(v30) = LODWORD(height);
  -[SceneFramingEngine computeDeadbandWidthFromViewportWidth:](self, "computeDeadbandWidthFromViewportWidth:", v30);
  -[SceneFramingEngine computeDeadbandHeightForWidth:](self, "computeDeadbandHeightForWidth:");
  v39 = v38;
  v40 = v38 * 0.125;
  v63.origin.x = v31;
  v63.origin.y = v33;
  v63.size.width = v35;
  v63.size.height = v37;
  *(float *)&v39 = fmax(fmin(v40, (v39 - CGRectGetHeight(v63)) * 0.5), 0.0);
  v64.origin.x = v31;
  v64.origin.y = v33;
  v64.size.width = v35;
  v64.size.height = v37;
  *(float *)&v35 = CGRectGetMinY(v64) - *(float *)&v39;
  -[CinematicFramingSessionFramingParameters deadbandTopOffsetFractionOfScreenHeight](self->_activeFramingParameters, "deadbandTopOffsetFractionOfScreenHeight");
  *(float *)&v31 = *(float *)&v35 - (float)(v52 * v41);
  v65.origin.x = v55;
  v65.origin.y = v54;
  v65.size.width = v53;
  v65.size.height = v51;
  MinX = CGRectGetMinX(v65);
  v66.origin.x = v55;
  v66.origin.y = v54;
  v66.size.width = v53;
  v66.size.height = v51;
  v43 = CGRectGetWidth(v66);
  v67.origin.x = v55;
  v67.origin.y = v54;
  v67.size.width = v53;
  v67.size.height = v51;
  v44 = CGRectGetHeight(v67);
  LODWORD(v45) = LODWORD(height);
  -[SceneFramingEngine calculateViewportCenteredAround:withWidth:](self, "calculateViewportCenteredAround:withWidth:", MinX, *(float *)&v31, v43, v44, v45);
  if ((LODWORD(self->_targetViewportForFloating.size.height) & 0xFFFFFFFE) == 2)
    -[SceneFramingEngine applyNewsroomViewportAdjustments:](self, "applyNewsroomViewportAdjustments:");
  result = ($680651117FADF5CC13A199869A236271 *)-[SceneFramingEngine computeDeadbandFromViewport:](self, "computeDeadbandFromViewport:");
  retstr->var0.origin.x = v47;
  retstr->var0.origin.y = v48;
  retstr->var0.size.width = v49;
  retstr->var0.size.height = v50;
  retstr->var1.origin.x = v56;
  retstr->var1.origin.y = v57;
  retstr->var1.size.width = v58;
  retstr->var1.size.height = v59;
  retstr->var2 = 0;
  return result;
}

- (void)updateDeadbandToFitScene:(id *)a3 tracks:(id)a4 currentViewport:(CGRect)a5 atTime:(id *)a6
{
  id v9;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  double v15;
  float v16;
  float v17;
  double v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  double Width;
  float v26;
  double v27;
  float v28;
  CGPoint origin;
  CGSize size;
  float v31;
  float v32;
  float v33;
  float v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  int v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  double x;
  double y;
  double v57;
  double height;
  uint64_t v59;
  __int128 v60;
  int64_t var3;

  v9 = a4;
  if (CGRectEqualToRect(self->_deadband, *MEMORY[0x1E0C9D628]) || !self->_lastFrameHadSubjects)
  {
    origin = a3->var0.origin;
    size = a3->var0.size;
    goto LABEL_6;
  }
  -[FramingSpaceManager maxAllowedViewportWidth](self->_framingSpaceManager, "maxAllowedViewportWidth");
  v11 = v10;
  -[SceneFramingEngine calculateViewportWidthToFitSubjectsInDeadband:](self, "calculateViewportWidthToFitSubjectsInDeadband:", a3->var1.origin.x, a3->var1.origin.y, a3->var1.size.width, a3->var1.size.height);
  v13 = v12;
  -[SceneFramingEngine minAllowedDeadbandWidth](self, "minAllowedDeadbandWidth");
  *(float *)&v15 = fminf(fmaxf(v14, v13), v11);
  -[SceneFramingEngine computeDeadbandWidthFromViewportWidth:](self, "computeDeadbandWidthFromViewportWidth:", v15);
  v17 = v16;
  *(float *)&v18 = v11;
  -[SceneFramingEngine computeDeadbandWidthFromViewportWidth:](self, "computeDeadbandWidthFromViewportWidth:", v18);
  v20 = v19;
  -[CinematicFramingSessionFramingParameters deadbandWidthMinFraction](self->_activeFramingParameters, "deadbandWidthMinFraction");
  v22 = fmin(fmax(CGRectGetWidth(self->_deadband) * v21, v17), v20);
  -[CinematicFramingSessionFramingParameters deadbandWidthMaxFraction](self->_activeFramingParameters, "deadbandWidthMaxFraction");
  v24 = v23;
  Width = CGRectGetWidth(self->_deadband);
  v26 = CGRectGetWidth(a3->var0);
  v27 = CGRectGetWidth(self->_deadband);
  if (v22 + -0.001 <= v26)
  {
    v31 = fmin(fmax(Width * v24, v17), v20);
    if (v26 + -0.001 <= v31)
    {
      v32 = v27;
      goto LABEL_12;
    }
    -[CinematicFramingSessionFramingParameters deadbandWidthMaxFraction](self->_activeFramingParameters, "deadbandWidthMaxFraction", v27);
  }
  else
  {
    -[CinematicFramingSessionFramingParameters deadbandWidthMinFraction](self->_activeFramingParameters, "deadbandWidthMinFraction", v27);
  }
  v32 = v26 / v28;
LABEL_12:
  if ((unint64_t)objc_msgSend(v9, "count") >= 2)
    v33 = v32;
  else
    v33 = v26;
  v34 = fminf(fmaxf(v33, v17), v20);
  v35 = vabdd_f64(v34, CGRectGetWidth(self->_deadband));
  v36 = v35 / CGRectGetWidth(self->_deadband);
  if (v36 > 0.100000001)
    v34 = v26;
  -[SceneFramingEngine computeViewportFromDeadband:](self, "computeViewportFromDeadband:", a3->var0.origin.x, a3->var0.origin.y, a3->var0.size.width, a3->var0.size.height);
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v44 = v43;
  *(float *)&v37 = v34;
  -[SceneFramingEngine computeViewportWidthFromDeadbandWidth:](self, "computeViewportWidthFromDeadbandWidth:", v37);
  LODWORD(v46) = v45;
  -[SceneFramingEngine calculateViewportCenteredAround:withWidth:](self, "calculateViewportCenteredAround:withWidth:", v38, v40, v42, v44, v46);
  -[SceneFramingEngine computeDeadbandFromViewport:](self, "computeDeadbandFromViewport:");
  self->_idealDeadband.origin.x = v47;
  self->_idealDeadband.origin.y = v48;
  self->_idealDeadband.size.width = v49;
  self->_idealDeadband.size.height = v50;
  *(float *)&v59 = v34;
  -[SceneFramingEngine determineDeadbandForSubjectEnclosingRect:oldDeadband:newDeadbandWidth:](self, "determineDeadbandForSubjectEnclosingRect:oldDeadband:newDeadbandWidth:", a3->var1.origin.x, a3->var1.origin.y, a3->var1.size.width, a3->var1.size.height, self->_deadband.origin.x, self->_deadband.origin.y, self->_deadband.size.width, self->_deadband.size.height, v59);
  self->_slackDeadband.origin.x = v51;
  self->_slackDeadband.origin.y = v52;
  self->_slackDeadband.size.width = v53;
  self->_slackDeadband.size.height = v54;
  if (v36 <= 0.100000001)
  {
    x = a3->var1.origin.x;
    y = a3->var1.origin.y;
    v57 = a3->var1.size.width;
    height = a3->var1.size.height;
    v60 = *(_OWORD *)&a6->var0;
    var3 = a6->var3;
    -[SceneFramingEngine updateDeadbandWithSubjectRect:atTime:](self, "updateDeadbandWithSubjectRect:atTime:", &v60, x, y, v57, height);
    goto LABEL_7;
  }
  origin = self->_idealDeadband.origin;
  size = self->_idealDeadband.size;
LABEL_6:
  self->_deadband.origin = origin;
  self->_deadband.size = size;
LABEL_7:

}

- (void)updateDeadbandWithSubjectRect:(CGRect)a3 atTime:(id *)a4
{
  int v6;
  int framingState;
  CGRect *p_deadband;
  CGFloat x;
  CGRect *p_slackDeadband;
  CGFloat v11;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  double MaxY;
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
  int v33;
  double v34;
  BOOL v35;
  _BOOL4 v36;
  CGSize size;
  double v38;
  BOOL v39;
  int32_t v40;
  double Seconds;
  double v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat MidY;
  float64x2_t v49;
  float32x2_t v50;
  CGFloat v51;
  float64_t v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  float64x2_t v59;
  float32x2_t v60;
  float32x2_t v61;
  int32_t v62;
  float v63;
  float v64;
  _BOOL4 v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  float64x2_t v71;
  float32x2_t v72;
  int64_t epoch;
  float64_t v74;
  CGFloat v75;
  CGFloat v76;
  int64_t v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  float64x2_t v81;
  float32x2_t v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  double MaxX;
  double MinY;
  CGFloat MidX;
  CGFloat v92;
  double MinX;
  float v94;
  CGFloat v95;
  CGFloat v96;
  CMTime time;
  CMTime v98;
  CMTime v99;
  CMTime lhs;
  CMTime rhs;
  CMTime time1;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;

  if (LOBYTE(self->_driftEndTime.epoch))
  {
    LOBYTE(self->_driftEndTime.epoch) = 0;
    v6 = 2;
    goto LABEL_56;
  }
  framingState = self->_framingState;
  p_deadband = &self->_deadband;
  x = self->_deadband.origin.x;
  p_slackDeadband = &self->_slackDeadband;
  v11 = self->_slackDeadband.origin.x;
  y = self->_deadband.origin.y;
  width = self->_deadband.size.width;
  height = self->_deadband.size.height;
  v15 = self->_slackDeadband.origin.y;
  v16 = self->_slackDeadband.size.width;
  v17 = self->_slackDeadband.size.height;
  v103.origin.x = x;
  v103.origin.y = y;
  v103.size.width = width;
  v103.size.height = height;
  MinX = CGRectGetMinX(v103);
  v104.origin.x = x;
  v104.origin.y = y;
  v104.size.width = width;
  v104.size.height = height;
  MaxX = CGRectGetMaxX(v104);
  v105.origin.x = x;
  v105.origin.y = y;
  v105.size.width = width;
  v105.size.height = height;
  MinY = CGRectGetMinY(v105);
  v106.origin.x = x;
  v106.origin.y = y;
  v106.size.width = width;
  v106.size.height = height;
  MaxY = CGRectGetMaxY(v106);
  v107.origin.x = v11;
  v107.origin.y = v15;
  v107.size.width = v16;
  v107.size.height = v17;
  v19 = CGRectGetMinX(v107);
  v108.origin.x = v11;
  v108.origin.y = v15;
  v108.size.width = v16;
  v108.size.height = v17;
  v20 = CGRectGetMaxX(v108);
  v109.origin.x = v11;
  v109.origin.y = v15;
  v109.size.width = v16;
  v109.size.height = v17;
  v21 = CGRectGetMinY(v109);
  v110.origin.x = v11;
  v110.origin.y = v15;
  v110.size.width = v16;
  v110.size.height = v17;
  v22 = CGRectGetMaxY(v110);
  v23 = MaxX;
  if (MaxX >= v20)
    v24 = v20;
  else
    v24 = MaxX;
  if (MaxX <= v20)
    v23 = v20;
  if (MinX <= v19)
    v25 = v19;
  else
    v25 = MinX;
  v26 = v24 - v25;
  if (MinX >= v19)
    v27 = v19;
  else
    v27 = MinX;
  if (MaxY >= v22)
    v28 = v22;
  else
    v28 = MaxY;
  if (MaxY > v22)
    v22 = MaxY;
  if (MinY <= v21)
    v29 = v21;
  else
    v29 = MinY;
  v30 = v28 - v29;
  v31 = v23 - v27;
  if (MinY >= v21)
    v32 = v21;
  else
    v32 = MinY;
  v33 = self->_framingState;
  if (v26 * v30 / (v31 * (v22 - v32)) <= 0.899999976)
  {
    if (v33 == 1)
    {
      size = self->_slackDeadband.size;
      p_deadband->origin = p_slackDeadband->origin;
      self->_deadband.size = size;
      CMTimeMakeWithSeconds(&rhs, 0.100000001, a4->var1);
      lhs = (CMTime)*a4;
      CMTimeAdd(&time1, &lhs, &rhs);
      *(CMTime *)&self->_driftStartTime.epoch = time1;
    }
    v6 = 1;
  }
  else
  {
    if (v33 == 2)
    {
      if (-[SceneFramingEngine isSubjectRectStationary:](self, "isSubjectRectStationary:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
      {
        *(float *)&v38 = 0.01;
      }
      else
      {
        *(float *)&v38 = 0.1;
      }
      v39 = -[SceneFramingEngine isCurrentFramingIdeal:withTolerance:](self, "isCurrentFramingIdeal:withTolerance:", self->_idealDeadband.origin.x, self->_idealDeadband.origin.y, self->_idealDeadband.size.width, self->_idealDeadband.size.height, v38);
      time1 = (CMTime)*a4;
      lhs = *(CMTime *)&self->_recenterStartTime.epoch;
      v40 = CMTimeCompare(&time1, &lhs);
      v6 = 0;
      if (v39 || (v40 & 0x80000000) == 0)
        goto LABEL_56;
      time1 = *(CMTime *)&self->_recenterStartDeadband.size.height;
      Seconds = CMTimeGetSeconds(&time1);
      time1 = *(CMTime *)&self->_recenterStartTime.epoch;
      v42 = CMTimeGetSeconds(&time1);
      time1 = (CMTime)*a4;
      v43 = fmin(fmax((CMTimeGetSeconds(&time1) - Seconds) / (v42 - Seconds), 0.0), 1.0);
      *(float *)&v43 = v43 * v43 * (v43 * -2.0 + 3.0);
      v94 = *(float *)&v43;
      v44 = *(double *)&self->_recenterOnNextFrame;
      v45 = self->_recenterStartDeadband.origin.x;
      v46 = self->_recenterStartDeadband.origin.y;
      v47 = self->_recenterStartDeadband.size.width;
      v111.origin.x = v44;
      v111.origin.y = v45;
      v111.size.width = v46;
      v111.size.height = v47;
      MidX = CGRectGetMidX(v111);
      v112.origin.x = v44;
      v112.origin.y = v45;
      v112.size.width = v46;
      v112.size.height = v47;
      MidY = CGRectGetMidY(v112);
      v49.f64[0] = MidX;
      v49.f64[1] = MidY;
      v50 = vcvt_f32_f64(v49);
      v51 = self->_idealDeadband.origin.x;
      v52 = self->_idealDeadband.origin.y;
      v53 = self->_idealDeadband.size.width;
      v54 = self->_idealDeadband.size.height;
      v55 = v51;
      v49.f64[0] = v52;
      v56 = v53;
      v57 = v54;
      v92 = CGRectGetMidX(*(CGRect *)((char *)&v49 - 8));
      v113.origin.x = v51;
      v113.origin.y = v52;
      v113.size.width = v53;
      v113.size.height = v54;
      v58 = CGRectGetMidY(v113);
      v59.f64[0] = v92;
      v59.f64[1] = v58;
      v60 = vcvt_f32_f64(*(float64x2_t *)&self->_recenterStartDeadband.origin.y);
      v61 = vmla_n_f32(v60, vsub_f32(vcvt_f32_f64((float64x2_t)self->_idealDeadband.size), v60), v94);
      self->_deadband.origin = (CGPoint)vcvtq_f64_f32(vmla_f32(vmla_n_f32(v50, vsub_f32(vcvt_f32_f64(v59), v50), v94), (float32x2_t)0xBF000000BF000000, v61));
      self->_deadband.size = (CGSize)vcvtq_f64_f32(v61);
      goto LABEL_42;
    }
    if (v33 != 1)
    {
      if (!self->_framingState)
      {
        time1 = (CMTime)*a4;
        -[SceneFramingEngine updateSubjectMovement:atTime:](self, "updateSubjectMovement:atTime:", &time1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
        LODWORD(v34) = 1045220557;
        v35 = -[SceneFramingEngine isCurrentFramingIdeal:withTolerance:](self, "isCurrentFramingIdeal:withTolerance:", self->_idealDeadband.origin.x, self->_idealDeadband.origin.y, self->_idealDeadband.size.width, self->_idealDeadband.size.height, v34);
        if (BYTE4(self->_subjectRectHistoryUpdateTime.epoch))
        {
          v6 = framingState;
          if (!v35)
          {
            if ((self->_subjectRectStationaryTime.value & 0x100000000) != 0)
            {
              time1 = (CMTime)*a4;
              lhs = *(CMTime *)&self->_subjectRectStationary;
              CMTimeSubtract(&v99, &time1, &lhs);
              v84 = CMTimeGetSeconds(&v99);
              -[CinematicFramingSessionOptions deadbandRecenteringInitialDelaySec](self->_options, "deadbandRecenteringInitialDelaySec");
              v36 = v85 < v84;
            }
            else
            {
              v36 = 1;
            }
            if ((self->_recenterEndTime.value & 0x100000000) != 0)
            {
              time1 = (CMTime)*a4;
              lhs = *(CMTime *)&self->_recenterStartTime.epoch;
              CMTimeSubtract(&v98, &time1, &lhs);
              v86 = CMTimeGetSeconds(&v98);
              -[CinematicFramingSessionOptions deadbandRecenteringIdleDurationSec](self->_options, "deadbandRecenteringIdleDurationSec");
              if (v87 >= v86)
                v36 = 0;
            }
            if (v36)
              v6 = 2;
            else
              v6 = framingState;
          }
          goto LABEL_56;
        }
      }
LABEL_42:
      v6 = framingState;
      goto LABEL_56;
    }
    time1 = (CMTime)*a4;
    lhs = *(CMTime *)&self->_driftStartTime.epoch;
    v62 = CMTimeCompare(&time1, &lhs);
    v6 = framingState;
    if (v62 >= 1)
    {
      time1 = (CMTime)*a4;
      lhs = *(CMTime *)&self->_driftStartDeadband.size.height;
      CMTimeSubtract(&time, &time1, &lhs);
      v63 = CMTimeGetSeconds(&time);
      -[CinematicFramingSessionOptions recenterAfterDriftDurationThreshold](self->_options, "recenterAfterDriftDurationThreshold");
      v65 = v64 < v63;
      v66 = self->_deadband.origin.x;
      v67 = self->_deadband.origin.y;
      v68 = self->_deadband.size.width;
      v69 = self->_deadband.size.height;
      v114.origin.x = v66;
      v114.origin.y = v67;
      v114.size.width = v68;
      v114.size.height = v69;
      v95 = CGRectGetMidX(v114);
      v115.origin.x = v66;
      v115.origin.y = v67;
      v115.size.width = v68;
      v115.size.height = v69;
      v70 = CGRectGetMidY(v115);
      v71.f64[0] = v95;
      v71.f64[1] = v70;
      v72 = vcvt_f32_f64(v71);
      epoch = self->_subjectRectStationaryTime.epoch;
      v74 = self->_driftStartDeadband.origin.x;
      v75 = self->_driftStartDeadband.origin.y;
      v76 = self->_driftStartDeadband.size.width;
      v77 = epoch;
      v71.f64[0] = v74;
      v78 = v75;
      v79 = v76;
      v96 = CGRectGetMidX(*(CGRect *)((char *)&v71 - 8));
      *(_QWORD *)&v116.origin.x = epoch;
      v116.origin.y = v74;
      v116.size.width = v75;
      v116.size.height = v76;
      v80 = CGRectGetMidY(v116);
      v81.f64[0] = v96;
      v81.f64[1] = v80;
      v82 = vsub_f32(v72, vcvt_f32_f64(v81));
      *(float *)&epoch = sqrtf(vaddv_f32(vmul_f32(v82, v82)));
      -[CinematicFramingSessionOptions recenterAfterDriftOffsetThreshold](self->_options, "recenterAfterDriftOffsetThreshold");
      if (*(float *)&epoch > v83)
        v65 = 1;
      if (-[CinematicFramingSessionOptions recenterAfterDriftEnabled](self->_options, "recenterAfterDriftEnabled")
        && v65)
      {
        v6 = 2;
      }
      else
      {
        v6 = 0;
      }
    }
  }
LABEL_56:
  if (self->_framingState != v6)
  {
    time1 = (CMTime)*a4;
    -[SceneFramingEngine transitionToFramingState:atTime:](self, "transitionToFramingState:atTime:");
  }
}

- (void)transitionToFramingState:(unsigned __int16)a3 atTime:(id *)a4
{
  CGSize size;
  int64_t var3;
  float v9;
  CGSize v10;
  int64_t v11;
  CMTime rhs;
  CMTime lhs;
  CMTime v14;
  CMTime v15;

  if (self->_framingState != a3)
  {
    switch(a3)
    {
      case 2u:
        size = self->_deadband.size;
        *(CGPoint *)&self->_recenterOnNextFrame = self->_deadband.origin;
        *(CGSize *)&self->_recenterStartDeadband.origin.y = size;
        var3 = a4->var3;
        *(_OWORD *)&self->_recenterStartDeadband.size.height = *(_OWORD *)&a4->var0;
        *(_QWORD *)&self->_recenterStartTime.timescale = var3;
        -[CinematicFramingSessionOptions deadbandRecenteringDurationSec](self->_options, "deadbandRecenteringDurationSec");
        CMTimeMakeWithSeconds(&rhs, v9, a4->var1);
        lhs = (CMTime)*a4;
        CMTimeAdd(&v15, &lhs, &rhs);
        *(CMTime *)&self->_recenterStartTime.epoch = v15;
        break;
      case 1u:
        v10 = self->_deadband.size;
        *(CGPoint *)&self->_subjectRectStationaryTime.epoch = self->_deadband.origin;
        *(CGSize *)&self->_driftStartDeadband.origin.y = v10;
        v11 = a4->var3;
        *(_OWORD *)&self->_driftStartDeadband.size.height = *(_OWORD *)&a4->var0;
        *(_QWORD *)&self->_driftStartTime.timescale = v11;
        CMTimeMakeWithSeconds(&v14, 0.100000001, a4->var1);
        lhs = (CMTime)*a4;
        CMTimeAdd(&v15, &lhs, &v14);
        *(CMTime *)&self->_driftStartTime.epoch = v15;
        break;
      case 0u:
        -[SceneFramingEngine clearSubjectHistory](self, "clearSubjectHistory");
        break;
    }
    self->_framingState = a3;
  }
}

- (void)clearSubjectHistory
{
  CGRect *subjectRectHistoryBuffer;
  uint64_t v3;
  CGPoint v4;
  CGFloat v5;

  self->_subjectRectHistoryBuffer[0].origin = 0u;
  subjectRectHistoryBuffer = self->_subjectRectHistoryBuffer;
  subjectRectHistoryBuffer[9].origin = 0u;
  subjectRectHistoryBuffer[9].size = 0u;
  subjectRectHistoryBuffer[8].origin = 0u;
  subjectRectHistoryBuffer[8].size = 0u;
  subjectRectHistoryBuffer[7].origin = 0u;
  subjectRectHistoryBuffer[7].size = 0u;
  subjectRectHistoryBuffer[6].origin = 0u;
  subjectRectHistoryBuffer[6].size = 0u;
  subjectRectHistoryBuffer[5].origin = 0u;
  subjectRectHistoryBuffer[5].size = 0u;
  subjectRectHistoryBuffer[4].origin = 0u;
  subjectRectHistoryBuffer[4].size = 0u;
  subjectRectHistoryBuffer[3].origin = 0u;
  subjectRectHistoryBuffer[3].size = 0u;
  subjectRectHistoryBuffer[2].origin = 0u;
  subjectRectHistoryBuffer[2].size = 0u;
  subjectRectHistoryBuffer[1].origin = 0u;
  subjectRectHistoryBuffer[1].size = 0u;
  subjectRectHistoryBuffer->size = 0u;
  LODWORD(subjectRectHistoryBuffer[10].origin.x) = 0;
  v3 = MEMORY[0x1E0CA2E18];
  v4 = (CGPoint)*MEMORY[0x1E0CA2E18];
  *(CGPoint *)((char *)&subjectRectHistoryBuffer[10].origin + 4) = (CGPoint)*MEMORY[0x1E0CA2E18];
  v5 = *(double *)(v3 + 16);
  *(CGFloat *)((char *)&subjectRectHistoryBuffer[10].size.width + 4) = v5;
  BYTE4(subjectRectHistoryBuffer[10].size.height) = 0;
  subjectRectHistoryBuffer[11].origin = v4;
  subjectRectHistoryBuffer[11].size.width = v5;
}

- (void)updateSubjectMovement:(CGRect)a3 atTime:(id *)a4
{
  double height;
  double width;
  double y;
  double x;
  float Seconds;
  uint64_t subjectRectHistoryHeadIdx;
  double *v12;
  unsigned int subjectRectHistoryCount;
  unsigned __int16 v14;
  __int128 v15;
  int v16;
  BOOL *p_subjectRectStationary;
  __int128 v18;
  uint64_t v19;
  CMTime v20;
  CMTime lhs;
  CMTime time;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!self->_subjectRectHistoryCount)
  {
    self->_subjectRectHistoryBuffer[0] = a3;
    *(_DWORD *)&self->_subjectRectHistoryCount = 65537;
    p_subjectRectStationary = (BOOL *)(&self->_subjectRectHistoryHeadIdx + 1);
LABEL_10:
    v18 = *(_OWORD *)&a4->var0;
    *((_QWORD *)p_subjectRectStationary + 2) = a4->var3;
    *(_OWORD *)p_subjectRectStationary = v18;
    return;
  }
  lhs = *(CMTime *)a4;
  *(_OWORD *)&v20.value = *(_OWORD *)(&self->_subjectRectHistoryHeadIdx + 1);
  v20.epoch = *(_QWORD *)&self->_subjectRectHistoryUpdateTime.flags;
  CMTimeSubtract(&time, &lhs, &v20);
  Seconds = CMTimeGetSeconds(&time);
  if (Seconds >= 0.1)
  {
    subjectRectHistoryHeadIdx = self->_subjectRectHistoryHeadIdx;
    v12 = (double *)((char *)self + 32 * subjectRectHistoryHeadIdx);
    v12[21] = x;
    v12[22] = y;
    v12[23] = width;
    v12[24] = height;
    subjectRectHistoryCount = self->_subjectRectHistoryCount;
    v14 = subjectRectHistoryCount < 9 ? subjectRectHistoryCount + 1 : 10;
    self->_subjectRectHistoryCount = v14;
    self->_subjectRectHistoryHeadIdx = subjectRectHistoryHeadIdx
                                     + 1
                                     - 10
                                     * ((429496730 * (unint64_t)(subjectRectHistoryHeadIdx + 1)) >> 32);
    v15 = *(_OWORD *)&a4->var0;
    *(_QWORD *)&self->_subjectRectHistoryUpdateTime.flags = a4->var3;
    *(_OWORD *)(&self->_subjectRectHistoryHeadIdx + 1) = v15;
    v16 = -[SceneFramingEngine isSubjectRectStationary:](self, "isSubjectRectStationary:", x, y, width, height);
    if (BYTE4(self->_subjectRectHistoryUpdateTime.epoch) != v16)
    {
      p_subjectRectStationary = &self->_subjectRectStationary;
      if (!v16)
      {
        BYTE4(self->_subjectRectHistoryUpdateTime.epoch) = 0;
        v19 = MEMORY[0x1E0CA2E18];
        *(_OWORD *)p_subjectRectStationary = *MEMORY[0x1E0CA2E18];
        *(_QWORD *)&self->_subjectRectStationaryTime.timescale = *(_QWORD *)(v19 + 16);
        return;
      }
      BYTE4(self->_subjectRectHistoryUpdateTime.epoch) = 1;
      goto LABEL_10;
    }
  }
}

- (BOOL)isSubjectRectStationary:(CGRect)a3
{
  CGFloat y;
  CGFloat x;
  uint64_t v6;
  float32x2_t v7;
  float32x2_t v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat MidY;
  float64x2_t v14;
  float32x2_t v20;
  float v21;
  float32x2_t v22;
  float32x2_t v23;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  float32x2_t v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  if (self->_subjectRectHistoryCount != 10)
    return 0;
  y = a3.origin.y;
  x = a3.origin.x;
  width = a3.size.width;
  height = a3.size.height;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  do
  {
    v9 = self->_subjectRectHistoryBuffer[v6].origin.x;
    v10 = self->_subjectRectHistoryBuffer[v6].origin.y;
    v11 = self->_subjectRectHistoryBuffer[v6].size.width;
    v12 = self->_subjectRectHistoryBuffer[v6].size.height;
    v29.origin.x = v9;
    v29.origin.y = v10;
    v29.size.width = v11;
    v29.size.height = v12;
    MidX = CGRectGetMidX(v29);
    v30.origin.x = v9;
    v30.origin.y = v10;
    v30.size.width = v11;
    v30.size.height = v12;
    MidY = CGRectGetMidY(v30);
    v14.f64[0] = MidX;
    v14.f64[1] = MidY;
    v7 = vadd_f32(v7, vcvt_f32_f64(v14));
    *(float *)&MidY = v11;
    *(float *)v14.f64 = v12;
    HIDWORD(MidY) = LODWORD(v14.f64[0]);
    v8 = vadd_f32(v8, *(float32x2_t *)&MidY);
    ++v6;
  }
  while (v6 != 10);
  __asm { FMOV            V0.2S, #10.0 }
  v28 = vdiv_f32(v7, _D0);
  v20 = vdiv_f32(v8, _D0);
  -[CinematicFramingSessionOptions subjectMovementTolerance](self->_options, "subjectMovementTolerance");
  v22 = vmul_n_f32(v20, v21 + 1.0);
  v23 = vmla_f32(v28, (float32x2_t)0xBF000000BF000000, v22);
  v31.origin.x = v23.f32[0];
  v31.origin.y = v23.f32[1];
  v31.size.width = v22.f32[0];
  v31.size.height = v22.f32[1];
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  return CGRectContainsRect(v31, v32);
}

- (BOOL)isCurrentFramingIdeal:(CGRect)a3 withTolerance:(float)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MidX;
  double v11;
  float v12;
  double MidY;
  double v14;
  float v15;
  BOOL v16;
  float v17;
  CGRect v19;
  CGRect v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  MidX = CGRectGetMidX(self->_deadband);
  v19.origin.x = x;
  v19.origin.y = y;
  v19.size.width = width;
  v19.size.height = height;
  v11 = MidX - CGRectGetMidX(v19);
  if (v11 < 0.0)
    v11 = -v11;
  v12 = v11;
  MidY = CGRectGetMidY(self->_deadband);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v14 = CGRectGetMidY(v20);
  if (v12 / self->_deadband.size.width >= a4)
    return 0;
  v15 = MidY - v14;
  v16 = v15 <= 0.0;
  if (v15 < 0.0)
    v15 = -v15;
  v17 = 0.3;
  if (v16)
    v17 = 1.0;
  return v15 / (self->_deadband.size.height * v17) < a4;
}

- (CGRect)calculateBaselineViewportForTracks:(id)a3 atTime:(id *)a4
{
  id v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  float v16;
  float v17;
  float v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  float v41;
  float v42;
  CGFloat v43;
  double MinY;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  FramingSpaceManager *framingSpaceManager;
  CGFloat v50;
  CGFloat v51;
  float v52;
  int v53;
  float v54;
  int v55;
  double MaxY;
  double v57;
  double v58;
  float v59;
  double v60;
  float v61;
  double v62;
  double v63;
  double v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat r2;
  float r2_12;
  CGFloat r2_16;
  double r2_16a;
  CGFloat r2_24;
  double r2_24a;
  CGFloat v75;
  double MaxX;
  CGFloat v77;
  float v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat v81;
  CGFloat rect;
  CGFloat recta;
  __int128 v84;
  int64_t var3;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  uint64_t v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect result;
  CGRect v107;

  v91 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v8 = *MEMORY[0x1E0C9D628];
  v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v9 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  -[FramingSpaceManager framingSpaceBounds](self->_framingSpaceManager, "framingSpaceBounds");
  v67 = v12;
  v68 = v11;
  v65 = v14;
  v66 = v13;
  -[SceneFramingEngine defaultScreenWidth](self, "defaultScreenWidth");
  v16 = v15;
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:");
  v18 = v17;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v19 = v6;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v86, v90, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v87;
    v64 = v16;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        v75 = v8;
        v77 = v7;
        v79 = v10;
        if (*(_QWORD *)v87 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
        objc_msgSend(v24, "boundingBoxForFraming");
        v29 = CGRectSafeIntersection(v25, v26, v27, v28, v68, v67, v66, v65);
        r2_16 = v31;
        r2_24 = v30;
        rect = v32;
        v84 = *(_OWORD *)&a4->var0;
        var3 = a4->var3;
        objc_msgSend(v24, "faceBoundingBoxForFramingAtTime:", &v84);
        v92.origin.x = CGRectSafeIntersection(v33, v34, v35, v36, v68, v67, v66, v65);
        x = v92.origin.x;
        y = v92.origin.y;
        width = v92.size.width;
        height = v92.size.height;
        v41 = fmin(CGRectGetWidth(v92), v64);
        v93.origin.x = v29;
        v93.origin.y = r2_24;
        v93.size.width = r2_16;
        v93.size.height = rect;
        v42 = fmin(CGRectGetHeight(v93), v18);
        r2_12 = v42;
        v94.origin.x = x;
        v94.origin.y = y;
        v94.size.width = width;
        v94.size.height = height;
        v43 = v41;
        r2 = CGRectGetMidX(v94) + v43 * -0.5;
        v95.origin.x = x;
        v95.origin.y = y;
        v95.size.width = width;
        v95.size.height = height;
        MinY = CGRectGetMinY(v95);
        v96.origin.x = v29;
        v96.origin.y = r2_24;
        v96.size.width = r2_16;
        v96.size.height = rect;
        v107.origin.y = fmin(MinY, CGRectGetMinY(v96));
        v107.size.height = r2_12;
        v97.origin.x = v75;
        v97.origin.y = v77;
        v97.size.width = v79;
        v97.size.height = v9;
        v107.origin.x = r2;
        v107.size.width = v43;
        v98 = CGRectUnion(v97, v107);
        v8 = v98.origin.x;
        v7 = v98.origin.y;
        v10 = v98.size.width;
        v9 = v98.size.height;
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v86, v90, 16);
    }
    while (v21);
  }

  v99.origin.x = CGRectSafeIntersection(v8, v7, v10, v9, v68, v67, v66, v65);
  v45 = v99.origin.x;
  v81 = v99.origin.y;
  recta = v99.origin.x;
  v46 = v99.origin.y;
  v47 = v99.size.width;
  v48 = v99.size.height;
  v80 = CGRectGetWidth(v99);
  framingSpaceManager = self->_framingSpaceManager;
  v100.origin.x = v45;
  v100.origin.y = v46;
  v50 = v47;
  v100.size.width = v47;
  v100.size.height = v48;
  v51 = CGRectGetHeight(v100);
  *(float *)&v51 = v51;
  -[FramingSpaceManager getWidthForHeight:](framingSpaceManager, "getWidthForHeight:", v51);
  *(float *)&v45 = fmax(v80, v52);
  -[FramingSpaceManager maxAllowedViewportWidth](self->_framingSpaceManager, "maxAllowedViewportWidth");
  LODWORD(v47) = v53;
  -[SceneFramingEngine minAllowedScreenWidth](self, "minAllowedScreenWidth");
  v78 = fminf(*(float *)&v47, fmaxf(v54, *(float *)&v45));
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:");
  LODWORD(v80) = v55;
  v101.origin.x = v68;
  v101.origin.y = v67;
  v101.size.width = v66;
  v101.size.height = v65;
  MaxX = CGRectGetMaxX(v101);
  v102.origin.x = v68;
  v102.origin.y = v67;
  v102.size.width = v66;
  v102.size.height = v65;
  r2_24a = CGRectGetMinX(v102);
  v103.origin.x = recta;
  v103.origin.y = v81;
  v103.size.width = v50;
  v103.size.height = v48;
  r2_16a = CGRectGetMidX(v103);
  v104.origin.x = v68;
  v104.origin.y = v67;
  v104.size.width = v66;
  v104.size.height = v65;
  MaxY = CGRectGetMaxY(v104);
  v105.origin.x = recta;
  v105.origin.y = v81;
  v105.size.width = v50;
  v105.size.height = v48;
  v57 = CGRectGetMinY(v105);

  v58 = v78;
  v59 = fmin(MaxX - v78, fmax(r2_24a, r2_16a + v78 * -0.5));
  v60 = *(float *)&v80;
  v61 = fmin(MaxY - *(float *)&v80, v57);
  v62 = v59;
  v63 = v61;
  result.size.height = v60;
  result.size.width = v58;
  result.origin.y = v63;
  result.origin.x = v62;
  return result;
}

- (CGRect)calculateSubjectEnclosingRectangleForTracks:(id)a3 withBaselineWidth:(float)a4 currentViewport:(CGRect)a5 atTime:(id *)a6
{
  id v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v31;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v36;
  float v37;
  CGFloat MinX;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  float v43;
  double v44;
  float v45;
  float v46;
  double v47;
  CGFloat v48;
  float v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat MinY;
  float64x2_t v53;
  float64x2_t v54;
  float64x2_t v55;
  double v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  float64x2_t v73;
  double v74;
  double v75;
  double v76;
  double v77;
  CGFloat v78;
  CGFloat v79;
  CGRect v80;
  CGFloat MidX;
  float32x2_t v82;
  __int128 v83;
  int64_t var3;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _BYTE v89[128];
  uint64_t v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect result;
  CGRect v109;

  v90 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v11 = *MEMORY[0x1E0C9D628];
  v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v12 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  *(float *)&v14 = a4;
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:", v14);
  v16 = v15;
  -[SceneFramingEngine computeDeadbandHeightFromViewportHeight:](self, "computeDeadbandHeightFromViewportHeight:");
  v18 = v17;
  -[SceneFramingEngine minAllowedDeadbandWidth](self, "minAllowedDeadbandWidth");
  v20 = v19;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v21 = v9;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v86;
    v76 = v16;
    v77 = v18;
    v74 = (float)(v20 * 0.5);
    v75 = (float)(v18 * 0.5);
    __asm { FMOV            V0.2D, #1.0 }
    v73 = _Q0;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        v80.origin.x = v11;
        v80.origin.y = v10;
        v80.size.width = v13;
        v80.size.height = v12;
        if (*(_QWORD *)v86 != v24)
          objc_enumerationMutation(v21);
        v31 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * i);
        v83 = *(_OWORD *)&a6->var0;
        var3 = a6->var3;
        objc_msgSend(v31, "faceBoundingBoxForFramingAtTime:", &v83, *(_OWORD *)&v73);
        x = v91.origin.x;
        y = v91.origin.y;
        width = v91.size.width;
        height = v91.size.height;
        v36 = CGRectGetHeight(v91) * 0.5;
        v92.origin.x = x;
        v92.origin.y = y;
        v92.size.width = width;
        v92.size.height = height;
        v37 = fmax(fmin(v36, v77 + CGRectGetHeight(v92) * -0.6), 0.0);
        v93.origin.x = x;
        v93.origin.y = y;
        v93.size.width = width;
        v93.size.height = height;
        MinX = CGRectGetMinX(v93);
        v94.origin.x = x;
        v94.origin.y = y;
        v94.size.width = width;
        v94.size.height = height;
        v39 = v37;
        v40 = CGRectGetMinY(v94) - v37;
        v95.origin.x = x;
        v95.origin.y = y;
        v95.size.width = width;
        v95.size.height = height;
        v41 = CGRectGetWidth(v95);
        v96.origin.x = x;
        v96.origin.y = y;
        v96.size.width = width;
        v96.size.height = height;
        v42 = CGRectGetHeight(v96) + v39;
        -[CinematicFramingSessionFramingParameters deadbandTopOffsetFractionOfScreenHeight](self->_activeFramingParameters, "deadbandTopOffsetFractionOfScreenHeight");
        v44 = 1.0 - v43;
        -[CinematicFramingSessionFramingParameters deadbandHeightFractionOfScreenHeight](self->_activeFramingParameters, "deadbandHeightFractionOfScreenHeight");
        *(float *)&v44 = fmax((v44 - v45 + -0.100000001) * v76, 0.0);
        v97.origin.x = MinX;
        v97.origin.y = v40;
        v97.size.width = v41;
        v97.size.height = v42;
        *(float *)&v44 = CGRectGetHeight(v97) - *(float *)&v44;
        -[CinematicFramingSessionFramingParameters subjectHeightPaddingMultiplier](self->_activeFramingParameters, "subjectHeightPaddingMultiplier");
        v47 = v46;
        v98.origin.x = MinX;
        v98.origin.y = v40;
        v98.size.width = v41;
        v98.size.height = v42;
        *(float *)&v39 = fmax(*(float *)&v44, fmin(v75, CGRectGetHeight(v98))) * v47;
        v99.origin.x = MinX;
        v99.origin.y = v40;
        v99.size.width = v41;
        v99.size.height = v42;
        v48 = CGRectGetWidth(v99);
        -[CinematicFramingSessionFramingParameters subjectWidthPaddingMultiplier](self->_activeFramingParameters, "subjectWidthPaddingMultiplier");
        *(float *)&v48 = fmax(v74, v48 * v49);
        v100.origin.x = MinX;
        v100.origin.y = v40;
        v100.size.width = v41;
        v100.size.height = v42;
        v50 = *(float *)&v48;
        v51 = CGRectGetMidX(v100) - v50 * 0.5;
        v101.origin.x = MinX;
        v101.origin.y = v40;
        v101.size.width = v41;
        v101.size.height = v42;
        MinY = CGRectGetMinY(v101);
        v102.origin.x = v51;
        v102.origin.y = MinY;
        v102.size.width = v50;
        v102.size.height = *(float *)&v39;
        MidX = CGRectGetMidX(v102);
        v103.origin.x = v51;
        v103.origin.y = MinY;
        v103.size.width = v50;
        v103.size.height = *(float *)&v39;
        v79 = CGRectGetMinY(v103);
        v104.origin.x = v51;
        v104.origin.y = MinY;
        v104.size.width = v50;
        v104.size.height = *(float *)&v39;
        v78 = CGRectGetMidX(v104);
        v105.origin.x = v51;
        v105.origin.y = MinY;
        v105.size.width = v50;
        v105.size.height = *(float *)&v39;
        v53.f64[0] = CGRectGetMaxY(v105);
        v54.f64[0] = v78;
        v54.f64[1] = MidX;
        v53.f64[1] = v79;
        v55 = vcvtq_f64_f32(vabs_f32(vcvt_f32_f64(v54)));
        v82 = vdiv_f32(vcvt_f32_f64(v53), vcvt_f32_f64(vaddq_f64(vmulq_f64(v55, v55), v73)));
        v53.f64[0] = v51;
        v55.f64[0] = MinY;
        v54.f64[0] = v50;
        v56 = *(float *)&v39;
        v57 = CGRectGetMinX(*(CGRect *)v53.f64);
        v106.origin.x = v51;
        v106.origin.y = MinY;
        v106.size.width = v50;
        v106.size.height = *(float *)&v39;
        v109.size.width = CGRectGetWidth(v106);
        v109.size.height = (float)(v82.f32[0] - v82.f32[1]);
        v109.origin.x = v57;
        v109.origin.y = v82.f32[1];
        v107 = CGRectUnion(v80, v109);
        v11 = v107.origin.x;
        v10 = v107.origin.y;
        v13 = v107.size.width;
        v12 = v107.size.height;
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v85, v89, 16);
    }
    while (v23);
  }

  -[FramingSpaceManager framingSpaceBounds](self->_framingSpaceManager, "framingSpaceBounds");
  v62 = CGRectSafeIntersection(v11, v10, v13, v12, v58, v59, v60, v61);
  v64 = v63;
  v66 = v65;
  v68 = v67;

  v69 = v62;
  v70 = v64;
  v71 = v66;
  v72 = v68;
  result.size.height = v72;
  result.size.width = v71;
  result.origin.y = v70;
  result.origin.x = v69;
  return result;
}

- (float)calculateViewportWidthToFitSubjectsInDeadband:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  float v15;
  float v16;
  int32x2_t v17;
  CGFloat MaxX;
  float64x2_t v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  float64x2_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  int v31;
  float v32;
  float v33;
  float v34;
  CGFloat MaxY;
  float64x2_t v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  float64x2_t v42;
  double v43;
  double v44;
  double v45;
  int v46;
  double v47;
  float v48;
  CGFloat MinY;
  CGFloat MinX;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  int32x2_t v56;
  CGFloat v57;
  float v58;
  float v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[FramingSpaceManager framingSpaceBounds](self->_framingSpaceManager, "framingSpaceBounds");
  v9 = v8;
  v55 = v8;
  v11 = v10;
  v13 = v12;
  v52 = v14;
  -[SceneFramingEngine minAllowedScreenWidth](self, "minAllowedScreenWidth");
  v58 = v15;
  -[CinematicFramingSessionFramingParameters deadbandWidthFractionOfScreenWidth](self->_activeFramingParameters, "deadbandWidthFractionOfScreenWidth");
  *(double *)&v17 = (1.0 - v16) * 0.5;
  *(float *)v17.i32 = *(double *)v17.i32;
  v56 = v17;
  v60.origin.x = x;
  v60.origin.y = y;
  v53 = width;
  v60.size.width = width;
  v60.size.height = height;
  MinX = CGRectGetMinX(v60);
  v61.origin.x = x;
  v61.origin.y = y;
  v61.size.width = width;
  v61.size.height = height;
  MaxX = CGRectGetMaxX(v61);
  v19.f64[0] = MinX;
  v19.f64[1] = MaxX;
  v20 = COERCE_DOUBLE(vcvt_f32_f64(v19));
  v21 = COERCE_DOUBLE(vdup_lane_s32(v56, 0));
  v22 = v9;
  v19.f64[0] = v11;
  v23 = v13;
  v24 = v52;
  v57 = CGRectGetMinX(*(CGRect *)((char *)&v19 - 8));
  v62.origin.x = v9;
  v62.origin.y = v11;
  v62.size.width = v13;
  v62.size.height = v52;
  v25 = CGRectGetMaxX(v62);
  v26.f64[0] = v57;
  v26.f64[1] = v25;
  LODWORD(v57) = ComputeSizeToFitSubjectsInDeadband(v58, v20, v21, COERCE_DOUBLE(vcvt_f32_f64(v26)), v27, v28, v29);
  *(float *)&v30 = v58;
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:", v30);
  LODWORD(v21) = v31;
  -[CinematicFramingSessionFramingParameters deadbandTopOffsetFractionOfScreenHeight](self->_activeFramingParameters, "deadbandTopOffsetFractionOfScreenHeight");
  v59 = v32;
  -[CinematicFramingSessionFramingParameters deadbandHeightFractionOfScreenHeight](self->_activeFramingParameters, "deadbandHeightFractionOfScreenHeight");
  v34 = 1.0 - v33 - v59;
  *(float *)&MinX = v34;
  v63.origin.x = x;
  v63.origin.y = y;
  v63.size.width = v53;
  v63.size.height = height;
  MinY = CGRectGetMinY(v63);
  v64.origin.x = x;
  v64.origin.y = y;
  v64.size.width = v53;
  v64.size.height = height;
  MaxY = CGRectGetMaxY(v64);
  v36.f64[0] = MinY;
  v36.f64[1] = MaxY;
  v37 = COERCE_DOUBLE(vcvt_f32_f64(v36));
  v38 = v55;
  v36.f64[0] = v11;
  v39 = v13;
  v40 = v52;
  v54 = CGRectGetMinY(*(CGRect *)((char *)&v36 - 8));
  v65.origin.x = v55;
  v65.origin.y = v11;
  v65.size.width = v13;
  v65.size.height = v52;
  v41 = CGRectGetMaxY(v65);
  v42.f64[0] = v54;
  v42.f64[1] = v41;
  LODWORD(height) = ComputeSizeToFitSubjectsInDeadband(*(float *)&v21, v37, COERCE_DOUBLE(__PAIR64__(LODWORD(MinX), LODWORD(v59))), COERCE_DOUBLE(vcvt_f32_f64(v42)), v43, v44, v45);
  -[FramingSpaceManager maxAllowedViewportWidth](self->_framingSpaceManager, "maxAllowedViewportWidth");
  LODWORD(v37) = v46;
  LODWORD(v47) = LODWORD(height);
  -[FramingSpaceManager getWidthForHeight:](self->_framingSpaceManager, "getWidthForHeight:", v47);
  return fminf(*(float *)&v37, fmaxf(*(float *)&v57, v48));
}

- (CGRect)calculateViewportCenteredAround:(CGRect)a3 withWidth:(float)a4
{
  CGFloat v5;
  CGFloat x;
  float v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat height;
  double v13;
  double MinX;
  float v15;
  double v16;
  double MinY;
  float v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat y;
  CGFloat width;
  float v27;
  CGFloat rect;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect result;

  rect = a3.size.height;
  y = a3.origin.y;
  width = a3.size.width;
  v5 = a3.origin.y;
  x = a3.origin.x;
  v24 = a3.origin.x;
  *(float *)&a3.origin.x = a4;
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:", a3.origin.x);
  v27 = v8;
  -[FramingSpaceManager framingSpaceBounds](self->_framingSpaceManager, "framingSpaceBounds");
  v9 = v29.origin.x;
  v10 = v29.origin.y;
  v11 = v29.size.width;
  height = v29.size.height;
  v13 = a4;
  v23 = CGRectGetMaxX(v29) - v13;
  v30.origin.x = v9;
  v30.origin.y = v10;
  v30.size.width = v11;
  v30.size.height = height;
  MinX = CGRectGetMinX(v30);
  v31.origin.x = x;
  v31.origin.y = v5;
  v31.size.width = width;
  v31.size.height = rect;
  v15 = fmin(v23, fmax(MinX, CGRectGetMidX(v31) + v13 * -0.5));
  *(float *)&v23 = v15;
  v32.origin.x = v9;
  v32.origin.y = v10;
  v32.size.width = v11;
  v32.size.height = height;
  v16 = CGRectGetMaxY(v32) - v27;
  v33.origin.x = v9;
  v33.origin.y = v10;
  v33.size.width = v11;
  v33.size.height = height;
  MinY = CGRectGetMinY(v33);
  v34.origin.x = v24;
  v34.origin.y = y;
  v34.size.width = width;
  v34.size.height = rect;
  v18 = fmin(v16, fmax(MinY, CGRectGetMinY(v34)));
  v19 = *(float *)&v23;
  v20 = v18;
  v21 = v13;
  v22 = v27;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (CGRect)computeCroppedSubjectEnclosingRectForViewportWidth:(float)a3 subjectEnclosingRect:(CGRect)a4
{
  CGFloat height;
  CGFloat v5;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  float v16;
  float v17;
  float MinX;
  float MaxX;
  CGFloat v20;
  int32x2_t v21;
  BOOL v22;
  double v23;
  double v24;
  double v25;
  float v26;
  float v27;
  double v28;
  float v29;
  float v30;
  float MinY;
  float MaxY;
  float v33;
  CGFloat v34;
  int32x2_t v35;
  float v36;
  double v37;
  double v38;
  double v39;
  float32x2_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  float v45;
  float v46;
  CGFloat v47;
  CGFloat v49;
  CGFloat width;
  CGFloat v51;
  float v52;
  float32x2_t v53;
  CGFloat v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  v51 = a4.size.height;
  v5 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[FramingSpaceManager framingSpaceBounds](self->_framingSpaceManager, "framingSpaceBounds");
  v54 = v9;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[CinematicFramingSessionFramingParameters deadbandWidthFractionOfScreenWidth](self->_activeFramingParameters, "deadbandWidthFractionOfScreenWidth");
  v17 = (1.0 - v16) * 0.5;
  v52 = v17;
  v55.origin.x = x;
  v49 = x;
  v55.origin.y = y;
  v55.size.width = v5;
  v55.size.height = height;
  MinX = CGRectGetMinX(v55);
  v56.origin.x = x;
  v56.origin.y = y;
  v56.size.width = v5;
  v56.size.height = height;
  MaxX = CGRectGetMaxX(v56);
  v57.origin.x = v54;
  v47 = v11;
  v57.origin.y = v11;
  v57.size.width = v13;
  v57.size.height = v15;
  *(float *)&v5 = CGRectGetMinX(v57);
  v58.origin.x = v54;
  v58.origin.y = v11;
  v58.size.width = v13;
  v58.size.height = v15;
  v20 = CGRectGetMaxX(v58);
  *(float *)v21.i32 = *(float *)&v5 + (float)(a3 * v52);
  *(float *)&v20 = v20;
  *(float *)&v20 = *(float *)&v20 - (float)(a3 * v52);
  v22 = *(float *)&v20 < MinX;
  *(float *)&v23 = fmaxf(MinX, *(float *)v21.i32);
  HIDWORD(v23) = fminf(MaxX, *(float *)&v20);
  v24 = COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&v20, 0));
  if (!v22)
    v24 = v23;
  v25 = COERCE_DOUBLE(vdup_lane_s32(v21, 0));
  if (*(float *)v21.i32 > MaxX)
    v24 = v25;
  v53 = *(float32x2_t *)&v24;
  -[CinematicFramingSessionFramingParameters deadbandTopOffsetFractionOfScreenHeight](self->_activeFramingParameters, "deadbandTopOffsetFractionOfScreenHeight");
  v46 = v26;
  -[CinematicFramingSessionFramingParameters deadbandHeightFractionOfScreenHeight](self->_activeFramingParameters, "deadbandHeightFractionOfScreenHeight");
  v45 = v27;
  *(float *)&v28 = a3;
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:", v28);
  v30 = v29;
  v59.origin.x = v49;
  v59.origin.y = y;
  v59.size.width = width;
  v59.size.height = v51;
  MinY = CGRectGetMinY(v59);
  v60.origin.x = v49;
  v60.origin.y = y;
  v60.size.width = width;
  v60.size.height = v51;
  MaxY = CGRectGetMaxY(v60);
  v61.origin.x = v54;
  v61.origin.y = v11;
  v61.size.width = v13;
  v61.size.height = v15;
  v33 = CGRectGetMinY(v61);
  v62.origin.x = v54;
  v62.origin.y = v47;
  v62.size.width = v13;
  v62.size.height = v15;
  v34 = CGRectGetMaxY(v62);
  *(float *)v35.i32 = v33 + (float)(v30 * v46);
  *(float *)&v34 = v34;
  v36 = 1.0 - v45 - v46;
  *(float *)&v34 = *(float *)&v34 - (float)(v30 * v36);
  v22 = *(float *)&v34 < MinY;
  *(float *)&v37 = fmaxf(MinY, *(float *)v35.i32);
  HIDWORD(v37) = fminf(MaxY, *(float *)&v34);
  v38 = COERCE_DOUBLE(vdup_lane_s32(*(int32x2_t *)&v34, 0));
  if (!v22)
    v38 = v37;
  v39 = COERCE_DOUBLE(vdup_lane_s32(v35, 0));
  if (*(float *)v35.i32 > MaxY)
    *(double *)&v40 = v39;
  else
    *(double *)&v40 = v38;
  v41 = v53.f32[0];
  v42 = v40.f32[0];
  v43 = vsub_f32((float32x2_t)vdup_lane_s32((int32x2_t)v53, 1), v53).f32[0];
  v44 = vsub_f32((float32x2_t)vdup_lane_s32((int32x2_t)v40, 1), v40).f32[0];
  result.size.height = v44;
  result.size.width = v43;
  result.origin.y = v42;
  result.origin.x = v41;
  return result;
}

- (CGRect)determineDeadbandForSubjectEnclosingRect:(CGRect)a3 oldDeadband:(CGRect)a4 newDeadbandWidth:(float)a5
{
  CGFloat width;
  float64_t y;
  CGFloat x;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float v21;
  double v22;
  float v23;
  int32x2_t v24;
  CGFloat MaxX;
  float64x2_t v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  float64x2_t v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  float64x2_t v39;
  int v40;
  float v41;
  float v42;
  double v43;
  float v44;
  double v45;
  int v46;
  CGFloat MaxY;
  float64x2_t v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  float64x2_t v54;
  double v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  float64x2_t v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGFloat MinY;
  unsigned int v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat MinX;
  CGFloat v72;
  CGFloat height;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  CGFloat v77;
  int32x2_t v78;
  CGFloat v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[SceneFramingEngine computeViewportWidthFromDeadbandWidth:](self, "computeViewportWidthFromDeadbandWidth:");
  -[SceneFramingEngine computeCroppedSubjectEnclosingRectForViewportWidth:subjectEnclosingRect:](self, "computeCroppedSubjectEnclosingRectForViewportWidth:subjectEnclosingRect:");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[FramingSpaceManager framingSpaceBounds](self->_framingSpaceManager, "framingSpaceBounds");
  v76 = v18;
  v77 = v17;
  v67 = v19;
  v75 = v20;
  -[CinematicFramingSessionFramingParameters deadbandWidthFractionOfScreenWidth](self->_activeFramingParameters, "deadbandWidthFractionOfScreenWidth");
  v22 = (1.0 - v21) * 0.5;
  -[CinematicFramingSessionFramingParameters deadbandWidthFractionOfScreenWidth](self->_activeFramingParameters, "deadbandWidthFractionOfScreenWidth");
  *(double *)&v24 = v22 / v23;
  *(float *)v24.i32 = *(double *)v24.i32;
  v78 = v24;
  v80.origin.x = v10;
  v80.origin.y = v12;
  v80.size.width = v14;
  v80.size.height = v16;
  MinX = CGRectGetMinX(v80);
  v81.origin.x = v10;
  v81.origin.y = v12;
  v81.size.width = v14;
  v81.size.height = v16;
  MaxX = CGRectGetMaxX(v81);
  v26.f64[0] = MinX;
  v26.f64[1] = MaxX;
  v27 = COERCE_DOUBLE(vcvt_f32_f64(v26));
  v69 = y;
  v28 = x;
  v26.f64[0] = y;
  v70 = width;
  v29 = width;
  v30 = height;
  v72 = CGRectGetMinX(*(CGRect *)((char *)&v26 - 8));
  v82.origin.x = x;
  v82.origin.y = y;
  v82.size.width = width;
  v82.size.height = height;
  v31 = CGRectGetMaxX(v82);
  v32.f64[0] = v72;
  v32.f64[1] = v31;
  v33 = COERCE_DOUBLE(vcvt_f32_f64(v32));
  v34 = COERCE_DOUBLE(vdup_lane_s32(v78, 0));
  v35 = v77;
  v32.f64[0] = v76;
  v36 = v67;
  v37 = v75;
  v79 = CGRectGetMinX(*(CGRect *)((char *)&v32 - 8));
  v83.origin.x = v77;
  v83.origin.y = v76;
  v83.size.width = v67;
  v83.size.height = v75;
  v38 = CGRectGetMaxX(v83);
  v39.f64[0] = v79;
  v39.f64[1] = v38;
  LODWORD(v72) = DetermineNewDeadbandMinComponent(v27, v33, v34, vcvt_f32_f64(v39).f32[0], a5);
  -[CinematicFramingSessionFramingParameters deadbandTopOffsetFractionOfScreenHeight](self->_activeFramingParameters, "deadbandTopOffsetFractionOfScreenHeight");
  LODWORD(v27) = v40;
  -[CinematicFramingSessionFramingParameters deadbandHeightFractionOfScreenHeight](self->_activeFramingParameters, "deadbandHeightFractionOfScreenHeight");
  *(float *)&v79 = *(float *)&v27 / v41;
  -[CinematicFramingSessionFramingParameters deadbandHeightFractionOfScreenHeight](self->_activeFramingParameters, "deadbandHeightFractionOfScreenHeight");
  v43 = 1.0 - v42;
  -[CinematicFramingSessionFramingParameters deadbandHeightFractionOfScreenHeight](self->_activeFramingParameters, "deadbandHeightFractionOfScreenHeight");
  v45 = v43 / v44 - *(float *)&v79;
  *(float *)&v45 = v45;
  v66 = LODWORD(v45);
  *(float *)&v45 = a5;
  -[SceneFramingEngine computeDeadbandHeightForWidth:](self, "computeDeadbandHeightForWidth:", v45);
  LODWORD(v43) = v46;
  v84.origin.x = v10;
  v84.origin.y = v12;
  v84.size.width = v14;
  v84.size.height = v16;
  MinY = CGRectGetMinY(v84);
  v85.origin.x = v10;
  v85.origin.y = v12;
  v85.size.width = v14;
  v85.size.height = v16;
  MaxY = CGRectGetMaxY(v85);
  v48.f64[0] = MinY;
  v48.f64[1] = MaxY;
  v49 = COERCE_DOUBLE(vcvt_f32_f64(v48));
  v50 = x;
  v48.f64[0] = v69;
  v51 = v70;
  v52 = height;
  v68 = CGRectGetMinY(*(CGRect *)((char *)&v48 - 8));
  v86.origin.x = x;
  v86.origin.y = v69;
  v86.size.width = v70;
  v86.size.height = height;
  v53 = CGRectGetMaxY(v86);
  v54.f64[0] = v68;
  v54.f64[1] = v53;
  v55 = COERCE_DOUBLE(vcvt_f32_f64(v54));
  v56 = v77;
  v54.f64[0] = v76;
  v57 = v67;
  v58 = v75;
  v74 = CGRectGetMinY(*(CGRect *)((char *)&v54 - 8));
  v87.origin.x = v77;
  v87.origin.y = v76;
  v87.size.width = v67;
  v87.size.height = v75;
  v59 = CGRectGetMaxY(v87);
  v60.f64[0] = v74;
  v60.f64[1] = v59;
  v61 = DetermineNewDeadbandMinComponent(v49, v55, COERCE_DOUBLE(__PAIR64__(v66, LODWORD(v79))), vcvt_f32_f64(v60).f32[0], *(float *)&v43);
  v62 = a5;
  v63 = *(float *)&v43;
  v64 = *(float *)&v72;
  result.size.height = v63;
  result.size.width = v62;
  result.origin.y = v61;
  result.origin.x = v64;
  return result;
}

- (float)defaultScreenWidth
{
  float v3;
  float v4;
  FramingSpaceManager *framingSpaceManager;
  float v6;
  float result;
  FramingSpaceManager *v8;

  -[CinematicFramingSessionOptions viewportDefaultFOV](self->_options, "viewportDefaultFOV");
  v4 = v3;
  framingSpaceManager = self->_framingSpaceManager;
  -[CinematicFramingSessionOptions viewportDefaultFOV](self->_options, "viewportDefaultFOV");
  -[FramingSpaceManager getWidthForHeight:](framingSpaceManager, "getWidthForHeight:");
  if (v4 <= v6)
  {
    v8 = self->_framingSpaceManager;
    -[CinematicFramingSessionOptions viewportDefaultFOV](self->_options, "viewportDefaultFOV");
    -[FramingSpaceManager getWidthForHeight:](v8, "getWidthForHeight:");
  }
  else
  {
    -[CinematicFramingSessionOptions viewportDefaultFOV](self->_options, "viewportDefaultFOV");
  }
  return result;
}

- (float)minAllowedScreenWidth
{
  float v3;
  float v4;
  FramingSpaceManager *framingSpaceManager;
  float v6;
  float result;
  FramingSpaceManager *v8;

  -[CinematicFramingSessionOptions viewportMinimumFOV](self->_options, "viewportMinimumFOV");
  v4 = v3;
  framingSpaceManager = self->_framingSpaceManager;
  -[CinematicFramingSessionOptions viewportMinimumFOV](self->_options, "viewportMinimumFOV");
  -[FramingSpaceManager getWidthForHeight:](framingSpaceManager, "getWidthForHeight:");
  if (v4 <= v6)
  {
    v8 = self->_framingSpaceManager;
    -[CinematicFramingSessionOptions viewportMinimumFOV](self->_options, "viewportMinimumFOV");
    -[FramingSpaceManager getWidthForHeight:](v8, "getWidthForHeight:");
  }
  else
  {
    -[CinematicFramingSessionOptions viewportMinimumFOV](self->_options, "viewportMinimumFOV");
  }
  return result;
}

- (float)minAllowedDeadbandWidth
{
  float v3;
  float v4;
  float v5;

  -[SceneFramingEngine minAllowedScreenWidth](self, "minAllowedScreenWidth");
  v4 = v3;
  -[CinematicFramingSessionFramingParameters deadbandWidthFractionOfScreenWidth](self->_activeFramingParameters, "deadbandWidthFractionOfScreenWidth");
  return v4 * v5;
}

- (float)computeViewportWidthFromDeadbandWidth:(float)a3
{
  float v4;

  -[CinematicFramingSessionFramingParameters deadbandWidthFractionOfScreenWidth](self->_activeFramingParameters, "deadbandWidthFractionOfScreenWidth");
  return a3 / v4;
}

- (CGRect)computeViewportFromDeadband:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  double MinY;
  float v19;
  float v20;
  double v21;
  double v22;
  double v23;
  double v24;
  float v25;
  float v26;
  double v27;
  FramingSpaceManager *framingSpaceManager;
  float v29;
  float v30;
  float v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectIsNull(a3))
  {
    v8 = *MEMORY[0x1E0C9D628];
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    v12 = CGRectGetWidth(v36);
    *(float *)&v12 = v12;
    -[SceneFramingEngine computeViewportWidthFromDeadbandWidth:](self, "computeViewportWidthFromDeadbandWidth:", v12);
    v14 = v13;
    -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:");
    v16 = v15;
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    v10 = v14;
    v17 = CGRectGetMidX(v37) + v14 * -0.5;
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    MinY = CGRectGetMinY(v38);
    -[CinematicFramingSessionFramingParameters deadbandTopOffsetFractionOfScreenHeight](self->_activeFramingParameters, "deadbandTopOffsetFractionOfScreenHeight");
    v20 = MinY - (float)(v16 * v19);
    v8 = v17;
    v9 = v20;
    v11 = v16;
    if ((LODWORD(self->_targetViewportForFloating.size.height) & 0xFFFFFFFE) == 2)
    {
      -[SceneFramingEngine applyNewsroomViewportAdjustments:](self, "applyNewsroomViewportAdjustments:", v17, v9, v14, v16);
      v8 = v21;
      v9 = v22;
      v10 = v23;
      v11 = v24;
    }
    -[FramingSpaceManager maxAllowedViewportWidth](self->_framingSpaceManager, "maxAllowedViewportWidth");
    v26 = v25;
    -[FramingSpaceManager maxAllowedViewportWidth](self->_framingSpaceManager, "maxAllowedViewportWidth");
    if (v14 > (float)(*(float *)&v27 * 0.95))
    {
      framingSpaceManager = self->_framingSpaceManager;
      *(float *)&v27 = v26;
      if (v14 <= v16)
      {
        -[FramingSpaceManager getWidthForHeight:](framingSpaceManager, "getWidthForHeight:", v27);
        v31 = v30;
        v29 = v26;
        v26 = v31;
      }
      else
      {
        -[FramingSpaceManager getHeightForWidth:](framingSpaceManager, "getHeightForWidth:", v27);
      }
      v8 = (float)(v26 * -0.5);
      v9 = (float)(v29 * -0.5);
      v10 = v26;
      v11 = v29;
    }
  }
  v32 = v8;
  v33 = v9;
  v34 = v10;
  v35 = v11;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (float)computeDeadbandWidthFromViewportWidth:(float)a3
{
  float v4;

  -[CinematicFramingSessionFramingParameters deadbandWidthFractionOfScreenWidth](self->_activeFramingParameters, "deadbandWidthFractionOfScreenWidth");
  return v4 * a3;
}

- (float)computeDeadbandHeightFromViewportHeight:(float)a3
{
  float v4;

  -[CinematicFramingSessionFramingParameters deadbandHeightFractionOfScreenHeight](self->_activeFramingParameters, "deadbandHeightFractionOfScreenHeight");
  return v4 * a3;
}

- (CGRect)computeDeadbandFromViewport:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  float v17;
  float v18;
  CGFloat v19;
  float v20;
  float v21;
  CGFloat MinY;
  double v23;
  float v24;
  CGFloat MidX;
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
  if (CGRectIsNull(a3))
  {
    v8 = *MEMORY[0x1E0C9D628];
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    if ((LODWORD(self->_targetViewportForFloating.size.height) & 0xFFFFFFFE) == 2)
    {
      -[SceneFramingEngine undoNewsroomViewportAdjustments:](self, "undoNewsroomViewportAdjustments:", x, y, width, height);
      x = v12;
      y = v13;
      width = v14;
      height = v15;
    }
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    v16 = CGRectGetWidth(v26);
    *(float *)&v16 = v16;
    -[SceneFramingEngine computeDeadbandWidthFromViewportWidth:](self, "computeDeadbandWidthFromViewportWidth:", v16);
    v18 = v17;
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    v19 = CGRectGetHeight(v27);
    *(float *)&v19 = v19;
    -[SceneFramingEngine computeDeadbandHeightFromViewportHeight:](self, "computeDeadbandHeightFromViewportHeight:", v19);
    v21 = v20;
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    MinY = CGRectGetMinY(v28);
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v23 = CGRectGetHeight(v29);
    -[CinematicFramingSessionFramingParameters deadbandTopOffsetFractionOfScreenHeight](self->_activeFramingParameters, "deadbandTopOffsetFractionOfScreenHeight");
    *(float *)&MinY = MinY + v23 * v24;
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    MidX = CGRectGetMidX(v30);
    v10 = v18;
    v8 = MidX + v18 * -0.5;
    v9 = *(float *)&MinY;
    v11 = v21;
  }
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (float)computeDeadbandHeightForWidth:(float)a3
{
  float v5;
  double v6;
  float v7;
  float v8;
  float v9;

  -[CinematicFramingSessionFramingParameters deadbandWidthFractionOfScreenWidth](self->_activeFramingParameters, "deadbandWidthFractionOfScreenWidth");
  *(float *)&v6 = a3 / v5;
  -[FramingSpaceManager getHeightForWidth:](self->_framingSpaceManager, "getHeightForWidth:", v6);
  v8 = v7;
  -[CinematicFramingSessionFramingParameters deadbandHeightFractionOfScreenHeight](self->_activeFramingParameters, "deadbandHeightFractionOfScreenHeight");
  return v8 * v9;
}

- (float)computeDeadbandWidthForHeight:(float)a3
{
  float v5;
  double v6;
  float v7;
  float v8;
  float v9;

  -[CinematicFramingSessionFramingParameters deadbandHeightFractionOfScreenHeight](self->_activeFramingParameters, "deadbandHeightFractionOfScreenHeight");
  *(float *)&v6 = a3 / v5;
  -[FramingSpaceManager getWidthForHeight:](self->_framingSpaceManager, "getWidthForHeight:", v6);
  v8 = v7;
  -[CinematicFramingSessionFramingParameters deadbandWidthFractionOfScreenWidth](self->_activeFramingParameters, "deadbandWidthFractionOfScreenWidth");
  return v8 * v9;
}

- (CGRect)applyNewsroomViewportAdjustments:(CGRect)a3
{
  double y;
  double x;
  double viewportOffsetX;
  FramingSpaceManager *framingSpaceManager;
  double v8;
  float v9;
  double v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  y = a3.origin.y;
  x = a3.origin.x;
  viewportOffsetX = self->_newsroomFramingParameters.viewportOffsetX;
  framingSpaceManager = self->_framingSpaceManager;
  if (a3.size.width >= a3.size.height)
  {
    v10 = a3.size.height * viewportOffsetX;
    *(float *)&viewportOffsetX = a3.size.height * viewportOffsetX;
    -[FramingSpaceManager getWidthForHeight:](framingSpaceManager, "getWidthForHeight:", viewportOffsetX);
    v8 = v11;
  }
  else
  {
    v8 = a3.size.width * viewportOffsetX;
    *(float *)&viewportOffsetX = a3.size.width * viewportOffsetX;
    -[FramingSpaceManager getHeightForWidth:](framingSpaceManager, "getHeightForWidth:", viewportOffsetX);
    v10 = v9;
  }
  v12 = x + v8 * *(float *)&self->_returningHomeTargetRect[8];
  v13 = y + v10 * *(float *)&self->_returningHomeTargetRect[12];
  v14 = v8;
  v15 = v10;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)undoNewsroomViewportAdjustments:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  float v7;
  float v8;
  double viewportOffsetX;
  FramingSpaceManager *framingSpaceManager;
  double v11;
  float v12;
  double v13;
  float v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = *(float *)&self->_returningHomeTargetRect[8];
  v8 = *(float *)&self->_returningHomeTargetRect[12];
  viewportOffsetX = self->_newsroomFramingParameters.viewportOffsetX;
  framingSpaceManager = self->_framingSpaceManager;
  if (a3.size.width >= a3.size.height)
  {
    v13 = a3.size.height / viewportOffsetX;
    *(float *)&viewportOffsetX = a3.size.height / viewportOffsetX;
    -[FramingSpaceManager getWidthForHeight:](framingSpaceManager, "getWidthForHeight:", viewportOffsetX);
    v11 = v14;
  }
  else
  {
    v11 = a3.size.width / viewportOffsetX;
    *(float *)&viewportOffsetX = a3.size.width / viewportOffsetX;
    -[FramingSpaceManager getHeightForWidth:](framingSpaceManager, "getHeightForWidth:", viewportOffsetX);
    v13 = v12;
  }
  v15 = y - height * v8;
  v16 = x - width * v7;
  v17 = v11;
  v18 = v13;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v15;
  result.origin.x = v16;
  return result;
}

- (CinematicFramingSessionOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (int)framingStyle
{
  return LODWORD(self->_targetViewportForFloating.size.height);
}

- (CGRect)deadband
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_deadband.origin.x;
  y = self->_deadband.origin.y;
  width = self->_deadband.size.width;
  height = self->_deadband.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingFramingParameters.circleSize, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_activeFramingParameters, 0);
  objc_storeStrong((id *)&self->_framingSpaceManager, 0);
}

@end
