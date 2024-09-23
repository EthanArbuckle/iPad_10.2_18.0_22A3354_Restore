@implementation NUNIScene

- (NUNIScene)initWithSphereoids:(unint64_t)a3 currentDateBlock:(id)a4
{
  return -[NUNIScene initWithSphereoids:projectionType:currentDateBlock:](self, "initWithSphereoids:projectionType:currentDateBlock:", a3, 0, a4);
}

- (NUNIScene)initWithSphereoids:(unint64_t)a3 projectionType:(unint64_t)a4 currentDateBlock:(id)a5
{
  int v6;
  id v8;
  NUNIScene *v9;
  uint64_t v10;
  NSMutableArray *spheroids;
  unint64_t v12;
  NUNISpheroid *v13;
  NUNISpheroid *v14;
  NUNISpheroid *v15;
  NUNISpheroid *v16;
  NUNISpheroid *v17;
  NUNISpheroid *v18;
  NUNISpheroid *v19;
  uint64_t v20;
  NSMutableArray *animations;
  void *v22;
  id currentDateBlock;
  void *v24;
  double v25;
  unint64_t v27;
  void *aBlock;
  objc_super v29;

  v6 = a3;
  v8 = a5;
  v29.receiver = self;
  v29.super_class = (Class)NUNIScene;
  v9 = -[NUNIScene init](&v29, sel_init);
  if (v9)
  {
    v27 = a4;
    aBlock = v8;
    v10 = objc_opt_new();
    spheroids = v9->_spheroids;
    v9->_spheroids = (NSMutableArray *)v10;

    v12 = 0;
    v13 = 0;
    v14 = 0;
    while (((1 << v12) & v6) == 0)
    {
LABEL_13:
      if (++v12 == 24)
      {
        v20 = objc_opt_new();
        animations = v9->_animations;
        v9->_animations = (NSMutableArray *)v20;

        *(_OWORD *)&v9->_structure.var0 = xmmword_2134DC400;
        *(_OWORD *)&v9->_structure.var3 = xmmword_2134DBF50;
        *(_OWORD *)&v9->_structure.var5 = xmmword_2134DBF80;
        *(_QWORD *)&v9->_structure.var11 = 2;
        v9->_structure.var8.var0.var0 = 5.7588;
        v9->_anon_78[16] = 1;
        *(_QWORD *)&v9->_anon_78[8] = v27;
        *(_DWORD *)&v9->_anon_78[52] = 1097859072;
        -[NUNIScene setSnap:](v9, "setSnap:", 24);
        v8 = aBlock;
        v22 = _Block_copy(aBlock);
        currentDateBlock = v9->_currentDateBlock;
        v9->_currentDateBlock = v22;

        -[NUNIScene date](v9, "date");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "timeIntervalSince1970");
        *(float *)&v25 = v25 / 31536000.0;
        *(_DWORD *)&v9->_anon_78[20] = LODWORD(v25);

        goto LABEL_17;
      }
    }
    v15 = 0;
    if (v12 <= 9)
    {
      v16 = v14;
      if (((1 << v12) & 0x3EE) != 0)
      {
LABEL_6:
        v15 = v16;
        goto LABEL_7;
      }
      if (v12 == 4)
      {
        v16 = v13;
        goto LABEL_6;
      }
    }
LABEL_7:
    v17 = -[NUNISpheroid initWithScene:parent:type:]([NUNISpheroid alloc], "initWithScene:parent:type:", v9, v15, v12);
    -[NSMutableArray addObject:](v9->_spheroids, "addObject:", v17);
    if (v12)
    {
      if (v12 != 3)
      {
LABEL_12:

        goto LABEL_13;
      }
      v18 = v13;
      v13 = v17;
    }
    else
    {
      v18 = v14;
      v14 = v17;
    }
    v19 = v17;

    goto LABEL_12;
  }
LABEL_17:

  return v9;
}

- (void)updateCamera
{
  double v2;
  float var1;
  __int128 v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  float v10;
  __int128 v11;
  __int128 v12;

  DWORD2(v12) = 0;
  *(_QWORD *)&v12 = 0;
  DWORD2(v11) = 0;
  *(_QWORD *)&v11 = 0;
  if (*(_QWORD *)&self->_structure.var9 == 24)
  {
    var1 = self->_structure.var8.var0.var1;
    *(_QWORD *)&v5 = 0x3F0000003F000000;
    HIDWORD(v5) = 1056964608;
    *((float *)&v5 + 2) = self->_structure.var8.var0.var0 * 0.5;
    v11 = xmmword_2134DBF50;
    v12 = v5;
    v6 = 0.0078125;
    v7 = 0.0000305175853;
  }
  else
  {
    -[NUNIScene spheroidOfType:](self, "spheroidOfType:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))self->_currentDateBlock + 2))();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "date:toCameraPosition:toCameraTarget:", v9, &v12, &v11);

    -[NUNIScene restingCameraRoll](self, "restingCameraRoll");
    var1 = v10 + self->_structure.var8.var0.var1;

    v7 = *(double *)&v11;
    *(_QWORD *)&v5 = v12;
    v6 = 0.0;
  }
  *(float *)&v2 = var1;
  -[NUNIScene setCamera:target:up:roll:](self, "setCamera:target:up:roll:", *(double *)&v5, v7, v6, v2, v11, v12);
}

- (float)restingCameraRoll
{
  return 0.0;
}

- (double)animatedFloatForKey:(uint64_t)a3
{
  __int128 v3;
  const float *v4;

  switch(a3)
  {
    case 0:
      v3 = *(_OWORD *)(a1 + 48);
      return *(double *)&v3;
    case 1:
      v3 = *(_OWORD *)(a1 + 64);
      return *(double *)&v3;
    case 2:
      v3 = *(_OWORD *)(a1 + 80);
      return *(double *)&v3;
    case 3:
      v4 = (const float *)(a1 + 100);
      goto LABEL_15;
    case 4:
      v4 = (const float *)(a1 + 140);
      goto LABEL_15;
    case 5:
      v4 = (const float *)(a1 + 96);
      goto LABEL_15;
    case 6:
      *(_QWORD *)&v3 = *(_QWORD *)(a1 + 144);
      return *(double *)&v3;
    case 7:
      *(_QWORD *)&v3 = *(_QWORD *)(a1 + 152);
      return *(double *)&v3;
    case 8:
      v4 = (const float *)(a1 + 160);
      goto LABEL_15;
    case 9:
      v4 = (const float *)(a1 + 164);
      goto LABEL_15;
    case 10:
      v4 = (const float *)(a1 + 168);
LABEL_15:
      *(_QWORD *)&v3 = vld1q_dup_f32(v4).u64[0];
      break;
    default:
      *(_QWORD *)&v3 = 0;
      break;
  }
  return *(double *)&v3;
}

- (void)setAnimatedFloat:(unint64_t)a3 forKey:
{
  switch(a3)
  {
    case 0uLL:
      *(float32x4_t *)&self->_structure.var0 = _Q0;
      break;
    case 1uLL:
      *(float32x4_t *)&self->_structure.var3 = _Q0;
      break;
    case 2uLL:
      _Q1 = vmulq_f32(_Q0, _Q0);
      _S2 = _Q0.i32[2];
      __asm { FMLA            S1, S2, V0.S[2] }
      _Q1.f32[0] = sqrtf(_Q1.f32[0]);
      *(float32x4_t *)&self->_structure.var5 = vdivq_f32(_Q0, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)_Q1.f32, 0));
      break;
    case 3uLL:
      LODWORD(self->_structure.var8.var0.var1) = _Q0.i32[0];
      break;
    case 4uLL:
      *(_DWORD *)&self->_anon_78[20] = _Q0.i32[0];
      break;
    case 5uLL:
      LODWORD(self->_structure.var8.var0.var0) = _Q0.i32[0];
      -[NUNIScene updateCamera](self, "updateCamera");
      break;
    case 6uLL:
      *(_QWORD *)&self->_anon_78[24] = _Q0.i64[0];
      break;
    case 7uLL:
      *(_QWORD *)&self->_anon_78[32] = _Q0.i64[0];
      break;
    case 8uLL:
      *(_DWORD *)&self->_anon_78[40] = _Q0.i32[0];
      break;
    case 9uLL:
      *(_DWORD *)&self->_anon_78[44] = _Q0.i32[0];
      break;
    case 0xAuLL:
      *(_DWORD *)&self->_anon_78[48] = _Q0.i32[0];
      break;
    default:
      return;
  }
}

- (void)update:(float)a3
{
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = self->_animations;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        *(float *)&v8 = a3;
        if ((objc_msgSend(v12, "update:", v8, (_QWORD)v15) & 1) == 0)
        {
          objc_msgSend(v5, "addIndex:", -[NSMutableArray indexOfObject:](self->_animations, "indexOfObject:", v12));
          objc_msgSend(v12, "observer");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "astronomyAnimationFinished:", v12);

        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v5, "count"))
  {
    -[NSMutableArray removeObjectsAtIndexes:](self->_animations, "removeObjectsAtIndexes:", v5);
    if (!-[NSMutableArray count](self->_animations, "count"))
    {
      -[NUNIScene observer](self, "observer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "astronomySceneAnimationFinished:", self);

    }
  }

}

- (BOOL)isAnimating:(id)a3 forKeys:(unint64_t)a4
{
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char v13;
  id v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = self->_animations;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "key", (_QWORD)v17);
        objc_msgSend(v12, "animatable");
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (v14 == v6)
        {
          v15 = 1;

          if (((1 << v13) & ~a4) == 0)
            goto LABEL_12;
        }
        else
        {

        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (void)addAnimation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "key");
  objc_msgSend(v4, "animatable");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_animations;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "key", (_QWORD)v15) == v5)
        {
          objc_msgSend(v12, "animatable");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13 == v6)
          {
            v14 = v12;

            if (v14)
              -[NUNIScene removeAnimation:](self, "removeAnimation:", v14);
            goto LABEL_13;
          }
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }

  v14 = 0;
LABEL_13:
  -[NSMutableArray addObject:](self->_animations, "addObject:", v4, (_QWORD)v15);

}

- (void)removeAllAnimations
{
  -[NSMutableArray removeAllObjects](self->_animations, "removeAllObjects");
}

- (void)removeAllAnimationsFor:(id)a3 withKeys:(unint64_t)a4
{
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  id v15;
  NUNIScene *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v16 = self;
  v7 = self->_animations;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "key");
        objc_msgSend(v13, "animatable");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        if (v15 == v6)
        {

          if (((1 << v14) & ~a4) == 0)
          {
            if (!v10)
              v10 = (void *)objc_opt_new();
            objc_msgSend(v10, "addIndex:", -[NSMutableArray indexOfObject:](v16->_animations, "indexOfObject:", v13));
          }
        }
        else
        {

        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  if (objc_msgSend(v10, "count"))
    -[NSMutableArray removeObjectsAtIndexes:](v16->_animations, "removeObjectsAtIndexes:", v10);

}

- (void)removeAnimation:(id)a3
{
  -[NSMutableArray removeObject:](self->_animations, "removeObject:", a3);
}

- (NSDate)date
{
  return (NSDate *)(*((uint64_t (**)(void))self->_currentDateBlock + 2))();
}

- (void)updateSunLocationAnimated:(BOOL)a3 lightingPreference:(unint64_t)a4 adjustEarthRotation:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v7;
  id v9;

  v5 = a5;
  v7 = a3;
  -[NUNIScene date](self, "date");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NUNIScene updateSunLocationForDate:animated:lightingPreference:adjustEarthRotation:](self, "updateSunLocationForDate:animated:lightingPreference:adjustEarthRotation:", v9, v7, a4, v5);

}

- (void)updateSunLocationForDate:(id)a3 animated:(BOOL)a4 lightingPreference:(unint64_t)a5 adjustEarthRotation:(BOOL)a6
{
  id v8;
  double v9;
  int32x2_t v10;
  NUNIAnimation *v11;
  const float *v12;
  double v13;
  NUNIAnimation *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float32x2_t v18;
  float32x2_t v19;
  float32x2_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  int32x2_t v24;
  float32x2_t v25;
  float32x2_t v26;
  float32x2_t v27;
  float v28;
  float v29;
  float v30;
  float v31;
  float v32;
  float v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float32x2_t v38;
  NUNIAnimation *v39;
  const float *v40;
  double v41;
  NUNIAnimation *v42;
  NUNIAnimation *v43;
  const float *v44;
  double v45;
  NUNIAnimation *v46;
  int8x8_t v47;
  NUNIAnimation *v48;
  NUNIAnimation *v49;
  NUNIAnimation *v50;
  const float *v51;
  double v52;
  NUNIAnimation *v53;
  NUNIAnimation *v54;
  const float *v55;
  double v56;
  NUNIAnimation *v57;
  uint64_t v58;
  float v59;
  NUNIAnimation *v60;
  NSMutableArray *obj;
  _BOOL4 v63;
  int32x2_t v64;
  int32x2_t v65;
  int32x2_t v66;
  double v67;
  double v68;
  int32x2_t v69;
  float v70;
  int32x2_t v71;
  double v72;
  float32x2_t v73;
  uint64_t v74;
  unint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  uint64_t v81;

  v63 = a6;
  v81 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  self->_isUpdateNeeded = 0;
  objc_msgSend(v8, "timeIntervalSince1970");
  v10.i32[1] = 1098781496;
  *(float *)v10.i32 = v9 / 31536000.0;
  if (a4)
  {
    if (*(float *)&self->_anon_78[20] != *(float *)v10.i32)
    {
      v69 = v10;
      v11 = [NUNIAnimation alloc];
      v12 = (const float *)&self->_anon_78[20];
      *(_QWORD *)&v13 = vld1q_dup_f32(v12).u64[0];
      v14 = -[NUNIAnimation initWithAnimatable:from:to:key:](v11, "initWithAnimatable:from:to:key:", self, 4, v13, *(double *)vdupq_lane_s32(v69, 0).i64);
      -[NUNIScene addAnimation:](self, "addAnimation:", v14);

    }
  }
  else
  {
    v70 = v9 / 31536000.0;
    -[NUNIScene removeAllAnimationsFor:withKeys:](self, "removeAllAnimationsFor:withKeys:", self, 16);
    *(float *)&self->_anon_78[20] = v70;
  }
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = self->_spheroids;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v77;
    v18 = (float32x2_t)vdup_n_s32(0x40C90FDBu);
    v19 = (float32x2_t)vdup_n_s32(0xC0C90FDB);
    v20 = (float32x2_t)vdup_n_s32(0x40490FDBu);
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v77 != v17)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
        if (a4)
        {
          v23 = objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * i), "structure");
          *(float *)v24.i32 = *(float *)(v23 + 16) + (float)(floorf(*(float *)(v23 + 16) / 6.2832) * -6.2832);
          v64 = v24;
          *(float *)v24.i32 = *(float *)(v23 + 20) + (float)(floorf(*(float *)(v23 + 20) / 6.2832) * -6.2832);
          v71 = v24;
          v25 = *(float32x2_t *)(v23 + 112);
          v26 = vrndm_f32(vdiv_f32(v25, v18));
          v27 = vmla_f32(v25, v19, v26);
          v26.i32[0] = *(_DWORD *)(v23 + 8);
          v65 = (int32x2_t)v26;
          v26.i32[0] = *(_DWORD *)(v23 + 84);
          v66 = (int32x2_t)v26;
          v67 = *(double *)&v27;
          v74 = 0;
          v75 = 0;
          v73 = 0;
          NUNIComputeSpheroidTransformParameters(v22, v8, (float *)&v75, (float *)&v75 + 1, &v73, (float *)&v74 + 1, (float *)&v74, v63);
          v28 = *((float *)&v75 + 1) + (float)(floorf(*((float *)&v75 + 1) / 6.2832) * -6.2832);
          v29 = vabds_f32(v28, *(float *)v64.i32);
          if (v28 <= *(float *)v64.i32)
            v30 = 6.2832;
          else
            v30 = -6.2832;
          if (v29 <= 3.1416)
            v31 = -0.0;
          else
            v31 = v30;
          v32 = v28 + v31;
          v33 = *(float *)&v75 + (float)(floorf(*(float *)&v75 / 6.2832) * -6.2832);
          v34 = vabds_f32(v33, *(float *)v71.i32);
          if (v33 <= *(float *)v71.i32)
            v35 = 6.2832;
          else
            v35 = -6.2832;
          if (v34 <= 3.1416)
            v36 = -0.0;
          else
            v36 = v35;
          v37 = v33 + v36;
          v75 = __PAIR64__(LODWORD(v32), LODWORD(v37));
          v38 = vmla_f32(v73, v19, vrndm_f32(vdiv_f32(v73, v18)));
          v73 = vadd_f32(v38, (float32x2_t)vbsl_s8((int8x8_t)vcgt_f32(vabd_f32(v38, *(float32x2_t *)&v67), v20), vbsl_s8((int8x8_t)vcgt_f32(v38, *(float32x2_t *)&v67), (int8x8_t)v19, (int8x8_t)v18), (int8x8_t)0x8000000080000000));
          if (*(float *)v64.i32 != v32)
          {
            v39 = [NUNIAnimation alloc];
            v40 = (const float *)&v75 + 1;
            *(_QWORD *)&v41 = vld1q_dup_f32(v40).u64[0];
            v42 = -[NUNIAnimation initWithAnimatable:from:to:key:](v39, "initWithAnimatable:from:to:key:", v22, 8, *(double *)vdupq_lane_s32(v64, 0).i64, v41);
            -[NUNIScene addAnimation:](self, "addAnimation:", v42);

            LODWORD(v37) = v75;
          }
          if (*(float *)v71.i32 != v37)
          {
            v43 = [NUNIAnimation alloc];
            v44 = (const float *)&v75;
            *(_QWORD *)&v45 = vld1q_dup_f32(v44).u64[0];
            v46 = -[NUNIAnimation initWithAnimatable:from:to:key:](v43, "initWithAnimatable:from:to:key:", v22, 1, *(double *)vdupq_lane_s32(v71, 0).i64, v45);
            -[NUNIScene addAnimation:](self, "addAnimation:", v46);

          }
          v47 = vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&v67, v73));
          if ((v47.i8[0] & 1) != 0 || (v47.i8[4] & 1) != 0)
          {
            v48 = [NUNIAnimation alloc];
            v49 = -[NUNIAnimation initWithAnimatable:from:to:key:](v48, "initWithAnimatable:from:to:key:", v22, 3, v67, *(double *)&v73);
            -[NUNIScene addAnimation:](self, "addAnimation:", v49);

          }
          if (*(float *)v65.i32 != *((float *)&v74 + 1))
          {
            v50 = [NUNIAnimation alloc];
            v51 = (const float *)&v74 + 1;
            *(_QWORD *)&v52 = vld1q_dup_f32(v51).u64[0];
            v53 = -[NUNIAnimation initWithAnimatable:from:to:key:](v50, "initWithAnimatable:from:to:key:", v22, 4, *(double *)vdupq_lane_s32(v65, 0).i64, v52);
            -[NUNIScene addAnimation:](self, "addAnimation:", v53);

          }
          if (*(float *)v66.i32 != *(float *)&v74)
          {
            v54 = [NUNIAnimation alloc];
            v55 = (const float *)&v74;
            *(_QWORD *)&v56 = vld1q_dup_f32(v55).u64[0];
            v57 = -[NUNIAnimation initWithAnimatable:from:to:key:](v54, "initWithAnimatable:from:to:key:", v22, 6, *(double *)vdupq_lane_s32(v66, 0).i64, v56);
            -[NUNIScene addAnimation:](self, "addAnimation:", v57);

          }
          if (((1 << *(_DWORD *)v23) & 0x3E6) != 0)
          {
            v72 = *(double *)(v23 + 144);
            v58 = NUNIComputeSpheroidIdealHomeCoordinate(a5, v73.f32[0], *(float *)&v75);
            v59 = *(float *)&v58;
            v68 = *(double *)&v58;
            objc_msgSend(v22, "setHomeCoordinate:", *((float *)&v58 + 1), *(float *)&v58);
            if (*(float *)&v72 != v59
              || (vmvn_s8((int8x8_t)vceq_f32(*(float32x2_t *)&v72, *(float32x2_t *)&v68)).i32[1] & 1) != 0)
            {
              v60 = -[NUNIAnimation initWithAnimatable:from:to:key:]([NUNIAnimation alloc], "initWithAnimatable:from:to:key:", v22, 10, v72, v68);
              -[NUNIScene addAnimation:](self, "addAnimation:", v60);

            }
          }
        }
        else
        {
          -[NUNIScene removeAllAnimationsFor:withKeys:](self, "removeAllAnimationsFor:withKeys:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * i), 282);
          objc_msgSend(v22, "updateSunLocationForDate:lightingPreference:adjustEarthRotation:", v8, a5, v63);
        }
      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
    }
    while (v16);
  }

}

- (id)spheroidOfType:(unint64_t)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_spheroids;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "type", (_QWORD)v12) == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)updateFromDateIfNeeded
{
  if (self->_isUpdateNeeded)
  {
    if (self->_anon_78[16])
    {
      -[NUNIScene updateSunLocationAnimated:lightingPreference:adjustEarthRotation:](self, "updateSunLocationAnimated:lightingPreference:adjustEarthRotation:", 0, 1, 1);
      self->_isUpdateNeeded = 0;
    }
  }
}

- (void)setCamera:(float)a3 target:up:roll:
{
  __int128 v3;
  __int128 v4;
  float v5;
  float v6;
  NSObject *v8;
  __int128 v9;
  __int128 v10;
  __n128 v11;

  v6 = v5;
  v9 = v3;
  v10 = v4;
  v11 = *(__n128 *)&a3;
  NUNILoggingObjectForDomain(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[NUNIScene setCamera:target:up:roll:].cold.1(v8, v11);

  *(__n128 *)&self->_structure.var0 = v11;
  *(_OWORD *)&self->_structure.var3 = v9;
  *(_OWORD *)&self->_structure.var5 = v10;
  self->_structure.var8.var0.var1 = v6;
}

- (__n128)cameraPosition
{
  return a1[3];
}

- (__n128)cameraTarget
{
  return a1[4];
}

- (__n128)cameraUp
{
  return a1[5];
}

- (float)cameraRoll
{
  return self->_structure.var8.var0.var1;
}

- (unint64_t)projectionType
{
  return *(_QWORD *)&self->_anon_78[8];
}

- (float)yearsSince1970
{
  return *(float *)&self->_anon_78[20];
}

- (const)structure
{
  return &self->_structure;
}

- (float)cameraOrbit
{
  return self->_structure.var8.var0.var0;
}

- (unint64_t)snap
{
  return *(_QWORD *)&self->_structure.var9;
}

- (unint64_t)backgroundType
{
  return *(_QWORD *)&self->_structure.var11;
}

- (unint64_t)collectionType
{
  return *(_QWORD *)self->_anon_78;
}

- (double)cameraOffset
{
  return *(double *)(a1 + 144);
}

- (CLLocationCoordinate2D)offsetCoordinate
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  v2 = *(float *)&self->_anon_78[36];
  v3 = *(float *)&self->_anon_78[32];
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

- (float)locationDotAlpha
{
  return *(float *)&self->_anon_78[40];
}

- (float)locationDotPulse
{
  return *(float *)&self->_anon_78[44];
}

- (float)locationDotPulseOverrideAlpha
{
  return *(float *)&self->_anon_78[48];
}

- (float)locationDotMaximumRadius
{
  return *(float *)&self->_anon_78[52];
}

- (BOOL)isUpdatable
{
  return self->_anon_78[16];
}

- (void)setCameraOrbit:(float)a3
{
  self->_structure.var8.var0.var0 = a3;
}

- (void)setBackgroundType:(unint64_t)a3
{
  *(_QWORD *)&self->_structure.var11 = a3;
}

- (void)setCollectionType:(unint64_t)a3
{
  *(_QWORD *)self->_anon_78 = a3;
}

- (void)setCameraOffset:(NUNIScene *)self
{
  uint64_t v2;

  *(_QWORD *)&self->_anon_78[24] = v2;
}

- (void)setOffsetCoordinate:(CLLocationCoordinate2D)a3
{
  float longitude;
  float latitude;

  longitude = a3.longitude;
  latitude = a3.latitude;
  *(float *)&self->_anon_78[32] = longitude;
  *(float *)&self->_anon_78[36] = latitude;
}

- (void)setLocationDotAlpha:(float)a3
{
  *(float *)&self->_anon_78[40] = a3;
}

- (void)setLocationDotPulse:(float)a3
{
  *(float *)&self->_anon_78[44] = a3;
}

- (void)setLocationDotPulseOverrideAlpha:(float)a3
{
  *(float *)&self->_anon_78[48] = a3;
}

- (void)setLocationDotMaximumRadius:(float)a3
{
  *(float *)&self->_anon_78[52] = a3;
}

- (void)setUpdatable:(BOOL)a3
{
  self->_anon_78[16] = a3;
}

- (void)setSnap:(unint64_t)a3
{
  if (*(_QWORD *)&self->_structure.var9 != a3)
  {
    *(_QWORD *)&self->_structure.var9 = a3;
    -[NUNIScene updateCamera](self, "updateCamera");
  }
}

- (id)packIntoBlob
{
  NSMutableArray *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  const NUNISceneStructure *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  _OWORD *v15;
  void *v16;
  _OWORD *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  v3 = self->_spheroids;
  v4 = -[NSMutableArray count](v3, "count");
  v5 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", 160 * v4 + 144));
  v6 = objc_msgSend(v5, "mutableBytes");
  v7 = -[NUNIScene structure](self, "structure");
  v8 = *(_OWORD *)&v7->var0;
  v9 = *(_OWORD *)&v7->var3;
  v10 = *(_OWORD *)&v7->var8.var0.var0;
  *(_OWORD *)(v6 + 32) = *(_OWORD *)&v7->var5;
  *(_OWORD *)(v6 + 48) = v10;
  *(_OWORD *)v6 = v8;
  *(_OWORD *)(v6 + 16) = v9;
  v11 = *(_OWORD *)&v7->var11;
  v12 = *(_OWORD *)&v7[1].var2;
  v13 = *(_OWORD *)&v7[1].var6;
  *(_OWORD *)(v6 + 96) = *(_OWORD *)&v7[1].var4;
  *(_OWORD *)(v6 + 112) = v13;
  *(_OWORD *)(v6 + 64) = v11;
  *(_OWORD *)(v6 + 80) = v12;
  *(_DWORD *)(v6 + 128) = v4;
  if (v4)
  {
    v14 = 0;
    v15 = (_OWORD *)(v6 + 144);
    do
    {
      -[NSMutableArray objectAtIndex:](v3, "objectAtIndex:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (_OWORD *)objc_msgSend(v16, "structure");
      v18 = v17[1];
      *v15 = *v17;
      v15[1] = v18;
      v19 = v17[5];
      v21 = v17[2];
      v20 = v17[3];
      v15[4] = v17[4];
      v15[5] = v19;
      v15[2] = v21;
      v15[3] = v20;
      v22 = v17[9];
      v24 = v17[6];
      v23 = v17[7];
      v15[8] = v17[8];
      v15[9] = v22;
      v15[6] = v24;
      v15[7] = v23;

      ++v14;
      v15 += 10;
    }
    while (v4 != v14);
  }

  return v5;
}

- (void)unpackFromBlob:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  __int128 *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  _OWORD *v15;
  void *v16;
  _OWORD *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;

  v4 = a3;
  v5 = self->_spheroids;
  v6 = -[NSMutableArray count](v5, "count");
  v25 = objc_retainAutorelease(v4);
  v7 = (__int128 *)objc_msgSend(v25, "bytes");
  v8 = v7[3];
  v10 = *v7;
  v9 = v7[1];
  *(_OWORD *)&self->_structure.var5 = v7[2];
  *(_OWORD *)&self->_structure.var8.var0.var0 = v8;
  *(_OWORD *)&self->_structure.var0 = v10;
  *(_OWORD *)&self->_structure.var3 = v9;
  v11 = v7[7];
  v13 = v7[4];
  v12 = v7[5];
  *(_OWORD *)&self->_anon_78[24] = v7[6];
  *(_OWORD *)&self->_anon_78[40] = v11;
  *(_OWORD *)&self->_structure.var11 = v13;
  *(_OWORD *)&self->_anon_78[8] = v12;
  if (v6)
  {
    v14 = 0;
    v15 = v7 + 9;
    do
    {
      -[NSMutableArray objectAtIndex:](v5, "objectAtIndex:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (_OWORD *)objc_msgSend(v16, "structure");
      v18 = v15[1];
      *v17 = *v15;
      v17[1] = v18;
      v19 = v15[5];
      v21 = v15[2];
      v20 = v15[3];
      v17[4] = v15[4];
      v17[5] = v19;
      v17[2] = v21;
      v17[3] = v20;
      v22 = v15[9];
      v24 = v15[6];
      v23 = v15[7];
      v17[8] = v15[8];
      v17[9] = v22;
      v17[6] = v24;
      v17[7] = v23;

      ++v14;
      v15 += 10;
    }
    while (v6 != v14);
  }

}

- (NUNISceneObserver)observer
{
  return (NUNISceneObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (NSArray)spheroids
{
  return &self->_spheroids->super;
}

- (id)currentDateBlock
{
  return self->_currentDateBlock;
}

- (void)setCurrentDateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong(&self->_currentDateBlock, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong((id *)&self->_spheroids, 0);
}

- (void)setCamera:(os_log_t)log target:(__n128)a2 up:roll:.cold.1(os_log_t log, __n128 a2)
{
  int v2;
  double v3;
  __int16 v4;
  double v5;
  __int16 v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = 134218496;
  v3 = a2.n128_f32[0];
  v4 = 2048;
  v5 = a2.n128_f32[1];
  v6 = 2048;
  v7 = a2.n128_f32[2];
  _os_log_debug_impl(&dword_2134A1000, log, OS_LOG_TYPE_DEBUG, "Camera position %f, %f, %f", (uint8_t *)&v2, 0x20u);
}

@end
