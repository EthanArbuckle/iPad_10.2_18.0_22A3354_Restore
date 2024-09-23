@implementation ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation

- (ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation)init
{
  float v3;
  unint64_t v4;
  float v5;
  unint64_t v6;
  float v7;
  ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *result;
  objc_super v9;

  +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingHitTestClusterSizeForPlacement"));
  v4 = vcvtms_u32_f32(v3);
  +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingHitTestClusterSizeForMovement"));
  v6 = vcvtms_u32_f32(v5);
  if (v4 <= v6)
    v4 = v6;
  +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingInterpolationPlaneChangeDecisionCount"));
  v9.receiver = self;
  v9.super_class = (Class)ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation;
  result = -[ASVHitTestHistory initWithResultCapacity:decisionCapacity:](&v9, sel_initWithResultCapacity_decisionCapacity_, v4, vcvtms_u32_f32(v7));
  if (result)
  {
    result->_currentPlaneHeight = -1000000.0;
    *(_OWORD *)&result->_currentPlaneNormal[4] = kASVInvalidPosition;
  }
  return result;
}

- (void)clearHistory
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation;
  -[ASVHitTestHistory clearHistory](&v3, sel_clearHistory);
  self->_currentPlaneHeight = -1000000.0;
  *(_OWORD *)&self->_currentPlaneNormal[4] = kASVInvalidPosition;
}

- (id)decisionForHitTestOfType:(ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *)self atScreenPoint:(SEL)a2 inSession:(int64_t)a3 withViewportSize:(id)a4 assetPosition:(CGSize)a5 maxDistance:(float)a6
{
  double v6;
  int v7;
  int v8;
  double v9;
  double height;
  double width;
  id v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v25;

  v8 = v7;
  v25 = v6;
  v9 = *(double *)&a6;
  height = a5.height;
  width = a5.width;
  v14 = a4;
  objc_msgSend(v14, "currentFrame");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[ASVUserDefaults forceUseLegacyHitTestAPI](ASVUserDefaults, "forceUseLegacyHitTestAPI"))
  {
    LODWORD(v16) = v8;
    -[ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation decisionForHitTestOfType:atScreenPoint:inFrame:withViewportSize:assetPosition:maxDistance:](self, "decisionForHitTestOfType:atScreenPoint:inFrame:withViewportSize:assetPosition:maxDistance:", a3, v15, width, height, v9, v25, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "normalizedImagePointForScreenPoint:viewportSize:orientation:", objc_msgSend(v18, "currentOrientation"), width, height, v9);
    v20 = v19;

    LODWORD(v21) = v8;
    objc_msgSend(v14, "smartRaycastResultForImagePoint:assetPosition:maxDistance:", v20, v25, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = v8;
    -[ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation decisionForHitTestOfType:originalResult:atImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:](self, "decisionForHitTestOfType:originalResult:atImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:", a3, v22, v15, v20, height, v9, v25, v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

- (id)decisionForHitTestOfType:(ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *)self atScreenPoint:(SEL)a2 inFrame:(int64_t)a3 withViewportSize:(id)a4 assetPosition:(CGSize)a5 maxDistance:(float)a6
{
  double v6;
  int v7;
  int v8;
  double v9;
  double height;
  double width;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v24;

  v8 = v7;
  v24 = v6;
  v9 = *(double *)&a6;
  height = a5.height;
  width = a5.width;
  v14 = (void *)MEMORY[0x1E0DC3BF8];
  v15 = a4;
  objc_msgSend(v14, "mainScreen");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "normalizedImagePointForScreenPoint:viewportSize:orientation:", objc_msgSend(v16, "currentOrientation"), width, height, v9);
  v18 = v17;

  LODWORD(v19) = v8;
  objc_msgSend(v15, "smartHitTestResultForImagePoint:assetPosition:maxDistance:", v18, v24, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v21) = v8;
  -[ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation decisionForHitTestOfType:originalResult:atImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:](self, "decisionForHitTestOfType:originalResult:atImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:", a3, v20, v15, v18, height, v9, v24, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)decisionForHitTestOfType:(ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *)self originalResult:(SEL)a2 atImagePoint:(int64_t)a3 inFrame:(id)a4 withViewportSize:(id)a5 assetPosition:(CGSize)a6 maxDistance:(float)a7
{
  void *v8;
  uint64_t v9;
  void *v10;

  if ((unint64_t)a3 > 1)
  {
    -[ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation decisionForMovementFromOriginalResult:atImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:](self, "decisionForMovementFromOriginalResult:atImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:", a4, a5, a6.width, a6.height);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v8 = 0;
      return v8;
    }
    v10 = (void *)v9;
    -[ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation interpolatedDecisionForDecision:](self, "interpolatedDecisionForDecision:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation decisionForPlacementFromOriginalResult:afterPlacementTimeout:atImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:](self, "decisionForPlacementFromOriginalResult:afterPlacementTimeout:atImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:", a4, a3 == 1, a5, a6.width, a6.height);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      return v8;
  }
  -[ASVHitTestHistory addDecision:](self, "addDecision:", v8);
  return v8;
}

- (id)decisionForPlacementFromOriginalResult:(ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *)self afterPlacementTimeout:(SEL)a2 atImagePoint:(id)a3 inFrame:(BOOL)a4 withViewportSize:(id)a5 assetPosition:(CGSize)a6 maxDistance:(float)a7
{
  __int128 v7;
  int v8;
  int v9;
  double v10;
  double height;
  double width;
  _BOOL4 v14;
  id v16;
  id v17;
  ASVHitTestDecision *v18;
  float32x4_t v19;
  float32x4_t v20;
  int8x16_t v21;
  double v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  float v27;

  v9 = v8;
  v25 = v7;
  v10 = *(double *)&a7;
  height = a6.height;
  width = a6.width;
  v14 = a4;
  v16 = a3;
  v17 = a5;
  if (!v16)
    goto LABEL_9;
  -[ASVHitTestHistory addResult:](self, "addResult:", v16);
  if (objc_msgSend(v16, "isRealPlane"))
  {
    if (v14
      || (v18 = 0,
          -[ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation hasFormedClusterForInitialPlacement:planeNormal:](self, "hasFormedClusterForInitialPlacement:planeNormal:", 0, 0)))
    {
      objc_msgSend(v16, "worldTransform", v25);
      v21 = (int8x16_t)vmulq_f32(v19, v20);
      self->_currentPlaneHeight = vaddv_f32(vadd_f32(*(float32x2_t *)v21.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v21, v21, 8uLL)));
      *(float32x4_t *)&self->_currentPlaneNormal[4] = v19;
      v18 = -[ASVHitTestDecision initWithOriginalResult:interpolatedResult:finalResult:]([ASVHitTestDecision alloc], "initWithOriginalResult:interpolatedResult:finalResult:", v16, 0, v16);
    }
    goto LABEL_12;
  }
  v27 = 0.0;
  DWORD2(v26) = 0;
  *(_QWORD *)&v26 = 0;
  if (!-[ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation hasFormedClusterForInitialPlacement:planeNormal:](self, "hasFormedClusterForInitialPlacement:planeNormal:", &v27, &v26))
  {
LABEL_9:
    v18 = 0;
    goto LABEL_12;
  }
  self->_currentPlaneHeight = v27;
  *(_OWORD *)&self->_currentPlaneNormal[4] = v26;
  LODWORD(v22) = v9;
  -[ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation reprojectOntoCurrentPlaneAtImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:](self, "reprojectOntoCurrentPlaneAtImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:", v17, width, height, v10, *(double *)&v25, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    v18 = -[ASVHitTestDecision initWithOriginalResult:interpolatedResult:finalResult:]([ASVHitTestDecision alloc], "initWithOriginalResult:interpolatedResult:finalResult:", v16, 0, v23);
  else
    v18 = 0;

LABEL_12:
  return v18;
}

- (id)decisionForMovementFromOriginalResult:(ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *)self atImagePoint:(SEL)a2 inFrame:(id)a3 withViewportSize:(id)a4 assetPosition:(CGSize)a5 maxDistance:(float)a6
{
  __int128 v6;
  int v7;
  int v8;
  double v9;
  double height;
  double width;
  id v14;
  id v15;
  double v16;
  float32x4_t v17;
  float32x4_t v18;
  int8x16_t v19;
  ASVHitTestDecision *v20;
  void *v21;
  ASVHitTestDecision *v22;
  id v23;
  double v24;
  __int128 v26;
  __int128 v27;
  float v28;

  v8 = v7;
  v26 = v6;
  v9 = *(double *)&a6;
  height = a5.height;
  width = a5.width;
  v14 = a3;
  v15 = a4;
  if (!v14)
  {
    LODWORD(v16) = v8;
    -[ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation reprojectOntoCurrentPlaneAtImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:](self, "reprojectOntoCurrentPlaneAtImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:", v15, width, height, v9, *(double *)&v26, v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = [ASVHitTestDecision alloc];
      v23 = 0;
LABEL_10:
      v20 = -[ASVHitTestDecision initWithOriginalResult:interpolatedResult:finalResult:](v22, "initWithOriginalResult:interpolatedResult:finalResult:", v23, 0, v21, v26);
LABEL_12:

      goto LABEL_13;
    }
LABEL_11:
    v20 = 0;
    goto LABEL_12;
  }
  -[ASVHitTestHistory addResult:](self, "addResult:", v14);
  if (!objc_msgSend(v14, "isRealPlane"))
  {
    v28 = 0.0;
    DWORD2(v27) = 0;
    *(_QWORD *)&v27 = 0;
    if (-[ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation hasFormedClusterForMovement:planeNormal:](self, "hasFormedClusterForMovement:planeNormal:", &v28, &v27))
    {
      self->_currentPlaneHeight = v28;
      *(_OWORD *)&self->_currentPlaneNormal[4] = v27;
    }
    LODWORD(v24) = v8;
    -[ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation reprojectOntoCurrentPlaneAtImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:](self, "reprojectOntoCurrentPlaneAtImagePoint:inFrame:withViewportSize:assetPosition:maxDistance:", v15, width, height, v9, *(double *)&v26, v24, v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = [ASVHitTestDecision alloc];
      v23 = v14;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  objc_msgSend(v14, "worldTransform");
  v19 = (int8x16_t)vmulq_f32(v17, v18);
  self->_currentPlaneHeight = vaddv_f32(vadd_f32(*(float32x2_t *)v19.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v19, v19, 8uLL)));
  *(float32x4_t *)&self->_currentPlaneNormal[4] = v17;
  v20 = -[ASVHitTestDecision initWithOriginalResult:interpolatedResult:finalResult:]([ASVHitTestDecision alloc], "initWithOriginalResult:interpolatedResult:finalResult:", v14, 0, v14);
LABEL_13:

  return v20;
}

- (id)interpolatedDecisionForDecision:(id)a3
{
  id v4;
  float v5;
  unint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  float v15;
  uint64_t j;
  void *v17;
  float v18;
  void *v19;
  float32x4_t v20;
  void *v21;
  float32x4_t v22;
  int32x4_t v23;
  float32x2_t v24;
  float32x2_t v25;
  ASVHitTestResult *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  ASVHitTestResult *v34;
  float v36;
  double v37;
  float32x4_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingInterpolationPlaneChangeDecisionCount"));
  v6 = vcvtms_u32_f32(v5);
  -[ASVHitTestHistory recentDecisionsForCount:](self, "recentDecisionsForCount:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    if (objc_msgSend(v7, "count") >= v6)
    {
      v10 = v7;
    }
    else
    {
      v8 = objc_msgSend(v7, "count");
      objc_msgSend(v7, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_opt_new();
      for (i = v6 - v8; i; --i)
        objc_msgSend(v10, "addObject:", v9);
      objc_msgSend(v10, "addObjectsFromArray:", v7);

    }
    if (-[ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation decisionHistoryContainsPlaneChange:relativeToNewDecision:](self, "decisionHistoryContainsPlaneChange:relativeToNewDecision:", v10, v4))
    {
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v7 = v10;
      v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v40;
        v15 = 0.0;
        do
        {
          for (j = 0; j != v13; ++j)
          {
            if (*(_QWORD *)v40 != v14)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * j), "finalResult");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "distanceFromCamera");
            v15 = v15 + v18;

          }
          v13 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        }
        while (v13);
      }
      else
      {
        v15 = 0.0;
      }

      v36 = v15 / (float)(unint64_t)objc_msgSend(v7, "count");
      objc_msgSend(v4, "finalResult");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "cameraPosition");
      v38 = v20;
      objc_msgSend(v4, "finalResult");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "cameraToPosition");
      v23 = (int32x4_t)vmulq_f32(v22, v22);
      v23.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v23, 2), vadd_f32(*(float32x2_t *)v23.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v23.i8, 1))).u32[0];
      v24 = vrsqrte_f32((float32x2_t)v23.u32[0]);
      v25 = vmul_f32(v24, vrsqrts_f32((float32x2_t)v23.u32[0], vmul_f32(v24, v24)));
      v38.i64[0] = vmlaq_n_f32(v38, vmulq_n_f32(v22, vmul_f32(v25, vrsqrts_f32((float32x2_t)v23.u32[0], vmul_f32(v25, v25))).f32[0]), v36).u64[0];

      v26 = [ASVHitTestResult alloc];
      objc_msgSend(v4, "finalResult");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "imagePoint");
      v29 = v28;
      objc_msgSend(v4, "finalResult");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "assetPosition");
      v37 = v31;
      objc_msgSend(v4, "finalResult");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "cameraPosition");
      v34 = -[ASVHitTestResult initWithType:worldPosition:imagePoint:assetPosition:cameraPosition:](v26, "initWithType:worldPosition:imagePoint:assetPosition:cameraPosition:", 4, *(double *)v38.i64, v29, v37, v33);
      objc_msgSend(v4, "setInterpolatedResult:", v34);

    }
    else
    {
      v7 = v10;
    }
  }

  return v4;
}

- (BOOL)decisionHistoryContainsPlaneChange:(id)a3 relativeToNewDecision:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  float v22;
  float v23;
  uint64_t v24;
  void *j;
  void *v26;
  float32x4_t v27;
  void *v28;
  float32x4_t v29;
  float v30;
  id v32;
  float32x4_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "finalResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isRealPlane");

  if (v8)
  {
    objc_msgSend(v6, "finalResult");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v32 = v5;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v39;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v39 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v15, "finalResult", v32);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isRealPlane");

          if (v17)
          {
            objc_msgSend(v15, "finalResult");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "planeIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "planeIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v19, "isEqual:", v20);

            if (!v21)
            {

              LOBYTE(v10) = 1;
              v5 = v32;
              goto LABEL_23;
            }
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        if (v12)
          continue;
        break;
      }
    }

    v5 = v32;
  }
  +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingInterpolationPlaneChangeMinimumSeparationDistance"), v32);
  v23 = v22;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v9 = v5;
  v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v10)
  {
    v24 = *(_QWORD *)v35;
    while (2)
    {
      for (j = 0; j != v10; j = (char *)j + 1)
      {
        if (*(_QWORD *)v35 != v24)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)j), "finalResult");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "worldPosition");
        v33 = v27;
        objc_msgSend(v6, "finalResult");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "worldPosition");
        LODWORD(v30) = vsubq_f32(v33, v29).i32[1];

        if (fabsf(v30) >= v23)
        {
          LOBYTE(v10) = 1;
          goto LABEL_23;
        }
      }
      v10 = (id)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_23:

  return (char)v10;
}

- (id)reprojectOntoCurrentPlaneAtImagePoint:(ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation *)self inFrame:(SEL)a2 withViewportSize:(id)a3 assetPosition:(CGSize)a4 maxDistance:(float)a5
{
  double v5;
  int v6;
  int v7;
  double width;
  id v10;
  double v11;
  void *v12;
  float currentPlaneHeight;
  ASVHitTestResult *v14;
  void *v15;
  ASVHitTestResult *v16;
  double v17;
  double v18;
  double v20;
  double v21;

  v7 = v6;
  v21 = v5;
  width = a4.width;
  v10 = a3;
  v12 = v10;
  currentPlaneHeight = self->_currentPlaneHeight;
  if (currentPlaneHeight == -1000000.0)
  {
    v14 = 0;
  }
  else
  {
    LODWORD(v11) = v7;
    objc_msgSend(v10, "hitTestOnPlaneWithWorldTransform:forImagePoint:maxDistance:", *MEMORY[0x1E0C83FF0], *(double *)&self->_currentPlaneNormal[4], *(double *)(MEMORY[0x1E0C83FF0] + 32), *(double *)vmulq_n_f32(*(float32x4_t *)&self->_currentPlaneNormal[4], currentPlaneHeight).i64, width, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = [ASVHitTestResult alloc];
      objc_msgSend(v15, "worldPosition");
      v20 = v17;
      objc_msgSend(v12, "cameraPosition");
      v14 = -[ASVHitTestResult initWithType:worldPosition:imagePoint:assetPosition:cameraPosition:](v16, "initWithType:worldPosition:imagePoint:assetPosition:cameraPosition:", 3, v20, width, v21, v18);
      -[ASVHitTestResult setSynthesizedPlaneNormal:](v14, "setSynthesizedPlaneNormal:", *(double *)&self->_currentPlaneNormal[4]);
    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

- (BOOL)resultsContainPoorQualityEstimatedResults:(id)a3
{
  id v3;
  float v4;
  float v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  float v11;
  float v12;
  float v13;
  float v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingMinimumEstimatedHitPointDistanceFromCamera"));
  v5 = v4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (!objc_msgSend(v10, "type", (_QWORD)v16))
        {
          objc_msgSend(v10, "distanceFromCamera");
          if (v11 <= v5
            || (objc_msgSend(v10, "distanceFromFeaturePoint"),
                v13 = v12,
                objc_msgSend(v10, "distanceFromCamera"),
                v13 > v14))
          {
            LOBYTE(v7) = 1;
            goto LABEL_13;
          }
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

  return v7;
}

- (BOOL)hasFormedClusterForInitialPlacement:(float *)a3 planeNormal:
{
  _OWORD *v3;
  _OWORD *v4;
  float v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  BOOL v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  float32x4_t v18;
  int32x2_t v19;
  float v20;
  float v21;
  float v22;
  float v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  float v28;
  uint64_t v29;
  float32x2_t v30;
  uint64_t j;
  void *v32;
  float32x4_t v33;
  unsigned int v34;
  unsigned int v35;
  float32x2_t v36;
  float32x4_t v38;
  float32x4_t v39;
  unsigned int v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v4 = v3;
  v51 = *MEMORY[0x1E0C80C00];
  +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingHitTestClusterSizeForPlacement"));
  v8 = vcvtms_u32_f32(v7);
  if (!v8)
    return 1;
  -[ASVHitTestHistory results](self, "results");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 < v8)
    return 0;
  -[ASVHitTestHistory recentResultsForCount:](self, "recentResultsForCount:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation resultsContainPoorQualityEstimatedResults:](self, "resultsContainPoorQualityEstimatedResults:", v12))
  {
LABEL_28:
    v11 = 0;
  }
  else
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    v39 = 0u;
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v46;
      v39 = 0uLL;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v46 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "worldPosition");
          v39 = vaddq_f32(v39, v18);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v15);
    }

    *(float *)v19.i32 = (float)(unint64_t)objc_msgSend(v13, "count");
    v38 = vdivq_f32(v39, (float32x4_t)vdupq_lane_s32(v19, 0));
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingPlacementClusterCylinderDiameter"));
    v21 = v20;
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingPlacementClusterCylinderHeight"));
    v23 = v22;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v24 = v13;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    if (v25)
    {
      v26 = v25;
      v27 = v21 * 0.5;
      v28 = v23 * 0.5;
      v29 = *(_QWORD *)v42;
      v30 = (float32x2_t)vzip1_s32(*(int32x2_t *)v38.f32, (int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v38, (int8x16_t)v38, 8uLL));
      while (2)
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v42 != v29)
            objc_enumerationMutation(v24);
          v32 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
          objc_msgSend(v32, "worldPosition");
          if (fabsf(COERCE_FLOAT(vsubq_f32(v33, v38).i32[1])) <= v28)
          {
            objc_msgSend(v32, "worldPosition");
            v40 = v34;
            objc_msgSend(v32, "worldPosition");
            v36 = vsub_f32((float32x2_t)__PAIR64__(v35, v40), v30);
            if (sqrtf(vaddv_f32(vmul_f32(v36, v36))) <= v27)
              continue;
          }

          goto LABEL_28;
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        if (v26)
          continue;
        break;
      }
    }

    if (a3)
      *a3 = v38.f32[1];
    if (v4)
      *v4 = xmmword_1D94E1CC0;
    v11 = 1;
  }

  return v11;
}

- (BOOL)hasFormedClusterForMovement:(float *)a3 planeNormal:
{
  _OWORD *v3;
  _OWORD *v4;
  float v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  BOOL v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  uint64_t i;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  float v28;
  uint64_t v29;
  uint64_t j;
  float v31;
  unint64_t v32;
  void *v33;
  unint64_t v34;
  void *v35;
  unsigned int v36;
  unsigned int v37;
  unsigned int v38;
  unsigned int v39;
  float32x2_t v40;
  float v41;
  unsigned int v43;
  unsigned int v44;
  float32x2_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v4 = v3;
  v56 = *MEMORY[0x1E0C80C00];
  +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingHitTestClusterSizeForMovement"));
  v8 = vcvtms_u32_f32(v7);
  if (!v8)
    return 1;
  -[ASVHitTestHistory results](self, "results");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10 >= v8)
  {
    -[ASVHitTestHistory recentResultsForCount:](self, "recentResultsForCount:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[ASVHitTestStrategyAveragedPlaneWithClusteringAndInterpolation resultsContainPoorQualityEstimatedResults:](self, "resultsContainPoorQualityEstimatedResults:", v12))
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v51;
        v17 = 0.0;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v51 != v16)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "worldPosition");
            v17 = v17 + v19;
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        }
        while (v15);
      }
      else
      {
        v17 = 0.0;
      }

      v20 = v17 / (float)(unint64_t)objc_msgSend(v13, "count");
      +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingMovementClusterChainHeight"));
      v22 = v21;
      +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingMovementClusterChainLinkDistance"));
      v24 = v23;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v25 = v13;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      if (v26)
      {
        v27 = v26;
        v28 = v22 * 0.5;
        v29 = *(_QWORD *)v47;
        while (2)
        {
          for (j = 0; j != v27; ++j)
          {
            if (*(_QWORD *)v47 != v29)
              objc_enumerationMutation(v25);
            objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "worldPosition");
            if (vabds_f32(v31, v20) > v28)
            {

              goto LABEL_33;
            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
          if (v27)
            continue;
          break;
        }
      }

      if ((unint64_t)objc_msgSend(v25, "count") < 2)
      {
LABEL_27:
        if (a3)
          *a3 = v20;
        if (v4)
          *v4 = xmmword_1D94E1CC0;
        v11 = 1;
        goto LABEL_34;
      }
      v32 = 1;
      while (1)
      {
        objc_msgSend(v25, "objectAtIndexedSubscript:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v32 - 1;
        objc_msgSend(v25, "objectAtIndexedSubscript:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "worldPosition");
        v44 = v36;
        objc_msgSend(v33, "worldPosition");
        v45 = (float32x2_t)__PAIR64__(v37, v44);
        objc_msgSend(v35, "worldPosition");
        v43 = v38;
        objc_msgSend(v35, "worldPosition");
        v40 = vsub_f32(v45, (float32x2_t)__PAIR64__(v39, v43));
        v41 = sqrtf(vaddv_f32(vmul_f32(v40, v40)));

        if (v41 > v24)
          break;
        v32 = v34 + 2;
        if (v32 >= objc_msgSend(v25, "count"))
          goto LABEL_27;
      }
    }
LABEL_33:
    v11 = 0;
LABEL_34:

    return v11;
  }
  return 0;
}

@end
