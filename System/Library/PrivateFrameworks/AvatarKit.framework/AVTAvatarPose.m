@implementation AVTAvatarPose

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  unsigned __int8 *neckPosition;
  AVTAvatarPose *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  if (self->_hasNeckPosition)
    neckPosition = self->_neckPosition;
  else
    neckPosition = 0;
  if (self->_hasNeckOrientation)
    v6 = self + 1;
  else
    v6 = 0;
  return (id)objc_msgSend(v4, "initWithWeights:neckPosition:neckOrientation:bakedAnimationBlendFactor:", self->_weights, neckPosition, v6, self->_bakedAnimationBlendFactor);
}

- (void)setWeights:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *weights;

  v4 = (NSMutableDictionary *)objc_msgSend(a3, "mutableCopy");
  weights = self->_weights;
  self->_weights = v4;

}

- (double)weightForBlendShapeNamed:(id)a3
{
  void *v3;
  float v4;
  double v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_weights, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setWeight:(double)a3 forBlendShapeNamed:(id)a4
{
  id v6;
  double v7;
  NSMutableDictionary *weights;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;

  v6 = a4;
  weights = self->_weights;
  v12 = v6;
  if (a3 == 0.0)
  {
    -[NSMutableDictionary removeObjectForKey:](weights, "removeObjectForKey:", v6);
  }
  else
  {
    if (!weights)
    {
      v9 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
      v10 = self->_weights;
      self->_weights = v9;

      weights = self->_weights;
    }
    *(float *)&v7 = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setValue:forKey:](weights, "setValue:forKey:", v11, v12);

  }
}

- (void)setNeckPosition:(AVTAvatarPose *)self
{
  float32x4_t v2;
  int32x4_t v3;
  float32x4_t v4;
  int32x4_t v5;

  v3.i32[0] = 0;
  v4.i64[0] = 0x3400000034000000;
  v4.i64[1] = 0x3400000034000000;
  v5 = vcgtq_f32(vabsq_f32(v2), v4);
  v5.i32[3] = v5.i32[2];
  v5.i32[0] = vmaxvq_u32((uint32x4_t)v5);
  self->_hasNeckPosition = v5.i32[0] < 0;
  *(int8x16_t *)self->_neckPosition = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v3, v5), 0), (int8x16_t)v2, (int8x16_t)0);
}

- (int8x16_t)setNeckOrientation:(int32x4_t)a3
{
  float32x4_t v3;
  int32x4_t v4;
  int8x16_t result;

  a3.i32[0] = 0;
  v3.i64[0] = 0x3400000034000000;
  v3.i64[1] = 0x3400000034000000;
  v4 = vcgtq_f32(vabsq_f32(vaddq_f32(a2, (float32x4_t)xmmword_1DD26A950)), v3);
  v4.i32[0] = vmaxvq_u32((uint32x4_t)v4);
  result = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(a3, v4), 0), (int8x16_t)a2, (int8x16_t)xmmword_1DD26A170);
  a1->i8[9] = v4.i32[0] < 0;
  a1[3] = result;
  return result;
}

- (id)dictionaryRepresentation
{
  void *v3;
  id v4;
  NSMutableDictionary *weights;
  id v6;
  id v7;
  void *v8;
  void *v9;
  double bakedAnimationBlendFactor;
  void *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  id v18;
  id v19;

  _AVTPoseRoundingBehaviour();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  weights = self->_weights;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __41__AVTAvatarPose_dictionaryRepresentation__block_invoke;
  v17 = &unk_1EA620350;
  v6 = v4;
  v18 = v6;
  v7 = v3;
  v19 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](weights, "enumerateKeysAndObjectsUsingBlock:", &v14);
  if (self->_hasNeckPosition)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "avt_arrayWithFloat3:roundingBehavior:", v7, *(double *)self->_neckPosition, v14, v15, v16, v17, v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("neckPosition"));

  }
  if (self->_hasNeckOrientation)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "avt_arrayWithFloat4:roundingBehavior:", v7, *(double *)&self[1].super.isa);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("neckOrientation"));

  }
  bakedAnimationBlendFactor = self->_bakedAnimationBlendFactor;
  *(float *)&bakedAnimationBlendFactor = bakedAnimationBlendFactor;
  objc_msgSend(MEMORY[0x1E0CB37E8], "avt_numberWithFloat:roundingBehavior:", v7, bakedAnimationBlendFactor, v14, v15, v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("bakedAnimationBlendFactor"));

  v12 = (void *)objc_msgSend(v6, "copy");
  return v12;
}

void __41__AVTAvatarPose_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(a3, "avt_numberByRoundingWithBehavior:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

- (AVTAvatarPose)init
{
  return -[AVTAvatarPose initWithWeights:neckPosition:neckOrientation:bakedAnimationBlendFactor:](self, "initWithWeights:neckPosition:neckOrientation:bakedAnimationBlendFactor:", 0, 0, 0, 0.0);
}

- (AVTAvatarPose)initWithWeights:(id)a3 neckPosition:neckOrientation:bakedAnimationBlendFactor:
{
  float32x4_t *v3;
  float32x4_t *v4;
  double v5;
  double v6;
  float32x4_t *v7;
  float32x4_t *v8;
  id v10;
  AVTAvatarPose *v11;
  uint64_t v12;
  NSMutableDictionary *weights;
  float32x4_t v14;
  uint32x4_t v15;
  int v16;
  float32x4_t v17;
  float32x4_t v18;
  int v19;
  __int128 v20;
  objc_super v22;

  v6 = v5;
  v7 = v4;
  v8 = v3;
  v10 = a3;
  v22.receiver = self;
  v22.super_class = (Class)AVTAvatarPose;
  v11 = -[AVTAvatarPose init](&v22, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v10, "mutableCopy");
    weights = v11->_weights;
    v11->_weights = (NSMutableDictionary *)v12;

    if (v8)
    {
      v14.i64[0] = 0x3400000034000000;
      v14.i64[1] = 0x3400000034000000;
      v15 = (uint32x4_t)vcgtq_f32(vabsq_f32(*v8), v14);
      v15.i32[3] = v15.i32[2];
      v16 = vmaxvq_u32(v15);
      v11->_hasNeckPosition = v16 < 0;
      v17 = 0uLL;
      if (v16 < 0)
        v17 = *v8;
    }
    else
    {
      v11->_hasNeckPosition = 0;
      v17 = 0uLL;
    }
    *(float32x4_t *)v11->_neckPosition = v17;
    if (v7)
    {
      v18.i64[0] = 0x3400000034000000;
      v18.i64[1] = 0x3400000034000000;
      v19 = vmaxvq_u32((uint32x4_t)vcgtq_f32(vabsq_f32(vaddq_f32(*v7, (float32x4_t)xmmword_1DD26A950)), v18));
      v11->_hasNeckOrientation = v19 < 0;
      if (v19 < 0)
      {
        v20 = (__int128)*v7;
LABEL_11:
        *(_OWORD *)&v11[1].super.isa = v20;
        v11->_bakedAnimationBlendFactor = v6;
        goto LABEL_12;
      }
    }
    else
    {
      v11->_hasNeckOrientation = 0;
    }
    v20 = xmmword_1DD26A170;
    goto LABEL_11;
  }
LABEL_12:

  return v11;
}

- (AVTAvatarPose)initWithScene:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  void *v17;
  void *v18;
  __int128 v19;
  AVTAvatarPose *v20;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  _QWORD v25[4];
  id v26;
  id v27;

  v4 = (objc_class *)MEMORY[0x1E0C99E20];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __31__AVTAvatarPose_initWithScene___block_invoke;
  v25[3] = &unk_1EA620378;
  v26 = v6;
  v27 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v5, "rootNode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "childNodeWithName:recursively:", CFSTR("head_GES"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  __31__AVTAvatarPose_initWithScene___block_invoke((uint64_t)v25, v12);
  objc_msgSend(v5, "rootNode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v8;
  v24[1] = 3221225472;
  v24[2] = __31__AVTAvatarPose_initWithScene___block_invoke_2;
  v24[3] = &__block_descriptor_40_e21_v24__0__SCNNode_8_B16lu32l8;
  v24[4] = v25;
  objc_msgSend(v13, "enumerateHierarchyUsingBlock:", v24);

  objc_msgSend(v5, "rootNode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "childNodeWithName:recursively:", CFSTR("root_JNT"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "simdPosition");
  v23 = v16;
  objc_msgSend(v5, "rootNode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "childNodeWithName:recursively:", CFSTR("head_JNT"), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "simdOrientation");
  v22 = v19;
  v20 = -[AVTAvatarPose initWithWeights:neckPosition:neckOrientation:bakedAnimationBlendFactor:](self, "initWithWeights:neckPosition:neckOrientation:bakedAnimationBlendFactor:", v9, &v23, &v22, 0.0);

  return v20;
}

void __31__AVTAvatarPose_initWithScene___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  float v11;
  void *v12;
  unint64_t v13;
  id v14;

  objc_msgSend(a2, "morpher");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "weights");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    do
    {
      objc_msgSend(v14, "targets");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (AVTMorphTargetNameDefinesPose(v8)
        && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v8) & 1) == 0)
      {
        objc_msgSend(v14, "weights");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectAtIndexedSubscript:", v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "floatValue");
        if (v11 != 0.0)
        {
          objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v10, v8);
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
        }

      }
      ++v5;
      objc_msgSend(v14, "weights");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

    }
    while (v13 > v5);
  }

}

uint64_t __31__AVTAvatarPose_initWithScene___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setNeckPositionAndOrientationFromHierarchy:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "childNodeWithName:recursively:", CFSTR("root_JNT"), 1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "simdPosition");
  -[AVTAvatarPose setNeckPosition:](self, "setNeckPosition:");
  objc_msgSend(v4, "childNodeWithName:recursively:", CFSTR("head_JNT"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "simdOrientation");
  -[AVTAvatarPose setNeckOrientation:](self, "setNeckOrientation:");

}

- (AVTAvatarPose)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __int128 v7;
  void *v8;
  __int128 v9;
  __int128 *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  __int128 *v16;
  AVTAvatarPose *v17;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0uLL;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("neckPosition"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "avt_float3");
    v20 = v7;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("neckOrientation"), 0, 0x3F80000000000000, v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "avt_float4");
    v19 = v9;
    v10 = &v19;
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bakedAnimationBlendFactor"), v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  v14 = (void *)objc_msgSend(v4, "mutableCopy");
  v21[0] = CFSTR("neckPosition");
  v21[1] = CFSTR("neckOrientation");
  v21[2] = CFSTR("bakedAnimationBlendFactor");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeObjectsForKeys:", v15);

  if (v6)
    v16 = &v20;
  else
    v16 = 0;
  v17 = -[AVTAvatarPose initWithWeights:neckPosition:neckOrientation:bakedAnimationBlendFactor:](self, "initWithWeights:neckPosition:neckOrientation:bakedAnimationBlendFactor:", v14, v16, v10, v13);

  return v17;
}

- (BOOL)affectsPhysicsSimulation
{
  return self->_hasNeckPosition || self->_hasNeckOrientation;
}

+ (id)neutralPose
{
  if (neutralPose_onceToken_0 != -1)
    dispatch_once(&neutralPose_onceToken_0, &__block_literal_global_35);
  return (id)neutralPose_pose;
}

void __28__AVTAvatarPose_neutralPose__block_invoke()
{
  AVTAvatarPose *v0;
  void *v1;

  v0 = objc_alloc_init(AVTAvatarPose);
  v1 = (void *)neutralPose_pose;
  neutralPose_pose = (uint64_t)v0;

}

+ (id)friendlyPose
{
  if (friendlyPose_onceToken != -1)
    dispatch_once(&friendlyPose_onceToken, &__block_literal_global_37);
  return (id)friendlyPose_pose;
}

uint64_t __29__AVTAvatarPose_friendlyPose__block_invoke()
{
  AVTAvatarPose *v0;
  void *v1;

  v0 = objc_alloc_init(AVTAvatarPose);
  v1 = (void *)friendlyPose_pose;
  friendlyPose_pose = (uint64_t)v0;

  return objc_msgSend((id)friendlyPose_pose, "setWeight:forBlendShapeNamed:", CFSTR("Emoji"), 1.0);
}

- (BOOL)isNeutralPose
{
  void *v3;

  +[AVTAvatarPose neutralPose](AVTAvatarPose, "neutralPose");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[AVTAvatarPose isEqualToPose:](self, "isEqualToPose:", v3);

  return (char)self;
}

- (BOOL)isFriendlyPose
{
  void *v3;

  +[AVTAvatarPose friendlyPose](AVTAvatarPose, "friendlyPose");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[AVTAvatarPose isEqualToPose:](self, "isEqualToPose:", v3);

  return (char)self;
}

- (BOOL)isEqualToPose:(id)a3
{
  AVTAvatarPose *v4;
  id *p_isa;
  BOOL v6;
  uint32x4_t v8;
  uint64_t v9;
  NSMutableDictionary *weights;
  uint64_t v11;
  id v12;
  _QWORD v13[6];
  _QWORD v14[4];
  id *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v4 = (AVTAvatarPose *)a3;
  p_isa = (id *)&v4->super.isa;
  if (v4 == self)
  {
    v6 = 1;
  }
  else if (v4
         && self->_bakedAnimationBlendFactor == v4->_bakedAnimationBlendFactor
         && (v8 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)self->_neckPosition, *(float32x4_t *)v4->_neckPosition)), v8.i32[3] = v8.i32[2], (vmaxvq_u32(v8) & 0x80000000) == 0)&& (vmaxvq_u32((uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(*(float32x4_t *)&self[1].super.isa, *(float32x4_t *)&v4[1].super.isa))) & 0x80000000) == 0&& (v9 = -[NSMutableDictionary count](self->_weights, "count"), v9 == objc_msgSend(p_isa[3], "count")))
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 1;
    weights = self->_weights;
    v11 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __31__AVTAvatarPose_isEqualToPose___block_invoke;
    v14[3] = &unk_1EA620400;
    v15 = p_isa;
    v16 = &v17;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](weights, "enumerateKeysAndObjectsUsingBlock:", v14);
    if (*((_BYTE *)v18 + 24))
    {
      v12 = p_isa[3];
      v13[0] = v11;
      v13[1] = 3221225472;
      v13[2] = __31__AVTAvatarPose_isEqualToPose___block_invoke_2;
      v13[3] = &unk_1EA620400;
      v13[4] = self;
      v13[5] = &v17;
      objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v13);
      v6 = *((_BYTE *)v18 + 24) != 0;
    }
    else
    {
      v6 = 0;
    }

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __31__AVTAvatarPose_isEqualToPose___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  float v8;
  float v9;
  void *v10;
  float v11;
  float v12;

  v7 = a2;
  objc_msgSend(a3, "floatValue");
  v9 = v8;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "floatValue");
  v12 = v11;

  if (vabds_f32(v9, v12) > 0.000001)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

void __31__AVTAvatarPose_isEqualToPose___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  float v10;
  float v11;
  float v12;
  float v13;

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v8 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  objc_msgSend(v8, "floatValue");
  v13 = v12;

  if (vabds_f32(v11, v13) > 0.000001)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (BOOL)isEqual:(id)a3
{
  AVTAvatarPose *v4;
  AVTAvatarPose *v5;
  BOOL v6;

  v4 = (AVTAvatarPose *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[AVTAvatarPose isEqualToPose:](self, "isEqualToPose:", v5);

  return v6;
}

- (id)poseByMergingPose:(id)a3
{
  id v4;
  NSMutableDictionary *weights;
  void *v6;
  _BOOL4 hasNeckPosition;
  _BOOL4 v8;
  _BOOL4 hasNeckOrientation;
  _BOOL4 v10;
  double bakedAnimationBlendFactor;
  id v12;
  __int128 *v13;
  __int128 *v14;
  void *v15;
  __int128 v17;
  __int128 v18;

  v4 = a3;
  weights = self->_weights;
  if (weights)
  {
    v6 = (void *)-[NSMutableDictionary mutableCopy](weights, "mutableCopy");
    objc_msgSend(v6, "addEntriesFromDictionary:", *((_QWORD *)v4 + 3));
  }
  else
  {
    v6 = (void *)objc_msgSend(*((id *)v4 + 3), "copy");
  }
  hasNeckPosition = self->_hasNeckPosition;
  v18 = *(_OWORD *)self->_neckPosition;
  v8 = hasNeckPosition;
  if (*((_BYTE *)v4 + 8))
  {
    v18 = *((_OWORD *)v4 + 2);
    v8 = 1;
  }
  hasNeckOrientation = self->_hasNeckOrientation;
  v17 = *(_OWORD *)&self[1].super.isa;
  v10 = hasNeckOrientation;
  if (*((_BYTE *)v4 + 9))
  {
    v17 = *((_OWORD *)v4 + 3);
    v10 = 1;
  }
  if (self->_bakedAnimationBlendFactor >= *((double *)v4 + 2))
    bakedAnimationBlendFactor = self->_bakedAnimationBlendFactor;
  else
    bakedAnimationBlendFactor = *((double *)v4 + 2);
  v12 = objc_alloc((Class)objc_opt_class());
  if (v8)
    v13 = &v18;
  else
    v13 = 0;
  if (v10)
    v14 = &v17;
  else
    v14 = 0;
  v15 = (void *)objc_msgSend(v12, "initWithWeights:neckPosition:neckOrientation:bakedAnimationBlendFactor:", v6, v13, v14, bakedAnimationBlendFactor, v17, v18);

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  __CFString *v18;
  AVTAvatarPose *v19;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1EA6284D0);
  -[NSMutableDictionary allKeys](self->_weights, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __28__AVTAvatarPose_description__block_invoke;
  v17 = &unk_1EA620428;
  v6 = v3;
  v18 = v6;
  v19 = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v14);
  if (self->_hasNeckPosition)
    -[__CFString appendFormat:](v6, "appendFormat:", CFSTR("\n\tNeck position : (%.2f, %.2f, %.2f)"), *(float *)self->_neckPosition, *(float *)&self->_neckPosition[4], *(float *)&self->_neckPosition[8]);
  if (self->_hasNeckOrientation)
    -[__CFString appendFormat:](v6, "appendFormat:", CFSTR("\n\tNeck orientation : (%.2f, %.2f, %.2f, %.2f)"), *(float *)&self[1].super.isa, *((float *)&self[1].super.isa + 1), *(float *)&self[1]._hasNeckPosition, *(float *)(&self[1]._hasNeckOrientation + 3), v14, v15, v16, v17);
  if (self->_bakedAnimationBlendFactor > 0.0)
    -[__CFString appendFormat:](v6, "appendFormat:", CFSTR("\n\tAnimation factor : %.2f"), *(_QWORD *)&self->_bakedAnimationBlendFactor);
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[__CFString length](v6, "length");
  v11 = CFSTR(" (empty pose)");
  if (v10)
    v11 = v6;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@: %p%@>"), v9, self, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __28__AVTAvatarPose_description__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  v4 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendFormat:", CFSTR("\n\t%@ : %@"), v4, v5);

}

- (id)hashString
{
  __CFString *v3;
  uint64_t i;
  void *v5;
  void *v6;
  float v7;
  float v8;
  uint64_t v9;
  void *v10;
  float v11;
  float v12;
  uint64_t v13;
  uint64_t v14;

  if (-[AVTAvatarPose isNeutralPose](self, "isNeutralPose"))
  {
    v3 = CFSTR("neutral");
  }
  else if (-[AVTAvatarPose isFriendlyPose](self, "isFriendlyPose"))
  {
    v3 = CFSTR("friendly");
  }
  else
  {
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1EA6284D0);
    for (i = 0; i != 52; ++i)
    {
      AVTBlendShapeLocationFromARIndex(i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_weights, "objectForKeyedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "floatValue");
      v8 = v7;

      if (v8 > 0.0)
      {
        if (-[__CFString length](v3, "length"))
          v9 = 59;
        else
          v9 = 0;
        -[__CFString appendFormat:](v3, "appendFormat:", CFSTR("%c%d:%.4f"), v9, i, v8);
      }

    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_weights, "objectForKeyedSubscript:", CFSTR("Emoji"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v12 = v11;

    if (v12 > 0.0)
    {
      v13 = -[__CFString length](v3, "length");
      v14 = 59;
      if (!v13)
        v14 = 0;
      -[__CFString appendFormat:](v3, "appendFormat:", CFSTR("%c%@:%.4f"), v14, CFSTR("Emoji"), v12);
    }
    if (self->_hasNeckPosition)
      -[__CFString appendFormat:](v3, "appendFormat:", CFSTR("%cpos:(%.4f;%.4f;%.4f)"),
        32 * (-[__CFString length](v3, "length") != 0),
        *(float *)self->_neckPosition,
        *(float *)&self->_neckPosition[4],
        *(float *)&self->_neckPosition[8]);
    if (self->_hasNeckOrientation)
      -[__CFString appendFormat:](v3, "appendFormat:", CFSTR("%crot:(%.4f;%.4f;%.4f;%.4f)"),
        32 * (-[__CFString length](v3, "length") != 0),
        COERCE_FLOAT(*(_OWORD *)&self[1].super.isa),
        COERCE_FLOAT((unint64_t)self[1].super.isa >> 32),
        COERCE_FLOAT(*(_QWORD *)&self[1]._hasNeckPosition),
        COERCE_FLOAT(HIDWORD(*(_OWORD *)&self[1].super.isa)));
    if (self->_bakedAnimationBlendFactor > 0.0)
      -[__CFString appendFormat:](v3, "appendFormat:", CFSTR("%canim:%.3f"), 32 * (-[__CFString length](v3, "length") != 0), *(_QWORD *)&self->_bakedAnimationBlendFactor);
  }
  return v3;
}

+ (id)posesForMemojiInPosePack:(id)a3
{
  return (id)objc_msgSend(a1, "posesInPosePack:avatarSelectionBlock:", a3, &__block_literal_global_74);
}

uint64_t __42__AVTAvatarPose_posesForMemojiInPosePack___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("memoji"));
}

+ (id)posesForAnimojiNamed:(id)a3 inPosePack:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__AVTAvatarPose_posesForAnimojiNamed_inPosePack___block_invoke;
  v10[3] = &unk_1EA620490;
  v11 = v6;
  v7 = v6;
  objc_msgSend(a1, "posesInPosePack:avatarSelectionBlock:", a4, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __49__AVTAvatarPose_posesForAnimojiNamed_inPosePack___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("animoji"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

+ (id)posesInPosePack:(id)a3 avatarSelectionBlock:(id)a4
{
  id v5;
  void (**v6)(_QWORD);
  _QWORD *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  AVTAvatarPose *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("watchFaceToybox"))
    && (+[AVTResourceLocator sharedResourceLocator](),
        v7 = (_QWORD *)objc_claimAutoreleasedReturnValue(),
        -[AVTResourceLocator pathForPoseResource:ofType:isDirectory:](v7, (uint64_t)CFSTR("toybox-watch"), (uint64_t)CFSTR("plist"), 0), v8 = objc_claimAutoreleasedReturnValue(), v7, v8))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v8);
    v6[2](v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = -[AVTAvatarPose initWithDictionaryRepresentation:]([AVTAvatarPose alloc], "initWithDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15));
          objc_msgSend(v10, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

  }
  else
  {
    avt_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[AVTAvatarBodyPose posesInPosePack:].cold.1((uint64_t)v5, v8);
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

- (__n128)neckPosition
{
  return a1[2];
}

- (__n128)neckOrientation
{
  return a1[3];
}

- (double)bakedAnimationBlendFactor
{
  return self->_bakedAnimationBlendFactor;
}

- (void)setBakedAnimationBlendFactor:(double)a3
{
  self->_bakedAnimationBlendFactor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weights, 0);
}

@end
