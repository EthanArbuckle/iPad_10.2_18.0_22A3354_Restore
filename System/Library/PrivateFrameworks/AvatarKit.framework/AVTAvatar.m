@implementation AVTAvatar

- (BOOL)optimizeForSnapshot
{
  return self->_optimizedForSnapshot;
}

- (void)setOptimizeForSnapshot:(BOOL)a3
{
  self->_optimizedForSnapshot = a3;
}

- (void)avatarCommonInit
{
  AVTPhysicsController *v3;
  AVTPhysicsController *physicsController;

  if (AVTInitializeShaderCache_onceToken != -1)
    dispatch_once(&AVTInitializeShaderCache_onceToken, &__block_literal_global_65);
  v3 = objc_alloc_init(AVTPhysicsController);
  physicsController = self->_physicsController;
  self->_physicsController = v3;

  -[AVTPhysicsController setDelegate:](self->_physicsController, "setDelegate:", self);
  self->_didUpdateAtTimeLock._os_unfair_lock_opaque = 0;
}

- (AVTAvatar)init
{
  AVTAvatar *v2;
  AVTAvatar *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTAvatar;
  v2 = -[AVTAvatar init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[AVTAvatar avatarCommonInit](v2, "avatarCommonInit");
    v3->_physicsScaleFactor = 1.0;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_morphInfoFromARKitBlendShapeIndex);
  free(self->_friendlyPoseMorphInfos);
  v3.receiver = self;
  v3.super_class = (Class)AVTAvatar;
  -[AVTAvatar dealloc](&v3, sel_dealloc);
}

- (__n128)arOffset
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  unsigned __int32 v5;
  void *v6;
  unsigned __int32 v7;
  void *v8;
  unsigned __int32 v9;
  __n128 result;
  unsigned __int32 v11;
  unsigned __int32 v12;
  unsigned __int32 v13;

  objc_msgSend(a1, "specializationSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("AR"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("offset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("x"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v13 = v5;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("y"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v12 = v7;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("z"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatValue");
  v11 = v9;

  result.n128_u32[0] = v13;
  result.n128_u32[1] = v12;
  result.n128_u32[2] = v11;
  return result;
}

- (float)arScale
{
  void *v2;
  void *v3;
  void *v4;
  float v5;
  float v6;

  -[AVTAvatar specializationSettings](self, "specializationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AR"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("scale"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;

  return v6;
}

- (double)physicsDownforceForNodeNamed:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  double v11;
  id v12;
  double v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  double v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  unint64_t v22;

  v4 = a3;
  -[AVTAvatar specializationSettings](self, "specializationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("dynamics"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("apply downforce to"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("downforce multiplier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "floatValue");
    v11 = v10;
  }
  else
  {
    v11 = 1.0;
  }
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x2020000000;
  v22 = 0xBFF0000000000000;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __42__AVTAvatar_physicsDownforceForNodeNamed___block_invoke;
  v15[3] = &unk_1EA61F2A0;
  v12 = v4;
  v16 = v12;
  v17 = &v19;
  v18 = v11;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v15);
  v13 = v20[3];

  _Block_object_dispose(&v19, 8);
  return v13;
}

double __42__AVTAvatar_physicsDownforceForNodeNamed___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  double result;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", a2))
  {
    result = *(double *)(a1 + 48);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
    *a4 = 1;
  }
  return result;
}

- (void)physicsSpecializationSettingsDidChange
{
  -[AVTAvatar resetDynamics](self, "resetDynamics");
  -[AVTPhysicsController downforcesDidChange](self->_physicsController, "downforcesDidChange");
}

- (id)physicsState
{
  return -[AVTPhysicsController physicsState](self->_physicsController, "physicsState");
}

- (void)resetToPhysicsState:(id)a3 assumeRestStateIfNil:(BOOL)a4
{
  -[AVTPhysicsController resetToPhysicsState:assumeRestStateIfNil:](self->_physicsController, "resetToPhysicsState:assumeRestStateIfNil:", a3, a4);
}

- (void)_avatarNodeAndHeadNodeAreNowAvailable
{
  __assert_rtn("-[AVTAvatar _avatarNodeAndHeadNodeAreNowAvailable]", "AVTAvatar.m", 328, "_headNode != nil && _avatarNode != nil");
}

- (SCNNode)lightingNode
{
  return 0;
}

- (SCNNode)cameraNode
{
  return 0;
}

- (SCNNode)headNode
{
  NSObject *v2;

  avt_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[AVTAvatar headNode].cold.1();

  return 0;
}

- (SCNNode)neckNode
{
  return self->_neckNode;
}

- (SCNNode)rootJointNode
{
  return self->_rootJointNode;
}

- (SCNNode)avatarNode
{
  NSObject *v2;

  avt_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[AVTAvatar avatarNode].cold.1();

  return 0;
}

- (void)setBakedAnimationReferenceTime:(double)a3
{
  SCNAnimationPlayer *bakedAnimationPlayer_lazy;
  void *v6;
  id v7;

  bakedAnimationPlayer_lazy = self->_bakedAnimationPlayer_lazy;
  self->_bakedAnimationPlayer_lazy = 0;

  -[SCNNode animationForKey:](self->_avatarNode, "animationForKey:", CFSTR("AVTPuppetAnimationGroup"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "setBeginTime:", a3);
    objc_msgSend(v7, "setTimeOffset:", 0.0);
    -[SCNNode addAnimation:forKey:](self->_avatarNode, "addAnimation:forKey:", v7, CFSTR("AVTPuppetAnimationGroup"));
    v6 = v7;
  }

}

- (void)pauseBakedAnimation
{
  SCNAnimationPlayer *bakedAnimationPlayer_lazy;

  bakedAnimationPlayer_lazy = self->_bakedAnimationPlayer_lazy;
  self->_bakedAnimationPlayer_lazy = 0;

  -[SCNNode removeAnimationForKey:](self->_avatarNode, "removeAnimationForKey:", CFSTR("AVTPuppetAnimationGroup"));
}

- (void)resumeBakedAnimation
{
  SCNAnimationPlayer *bakedAnimationPlayer_lazy;

  bakedAnimationPlayer_lazy = self->_bakedAnimationPlayer_lazy;
  self->_bakedAnimationPlayer_lazy = 0;

  -[SCNNode addAnimation:forKey:](self->_avatarNode, "addAnimation:forKey:", self->_bakedAnimation, CFSTR("AVTPuppetAnimationGroup"));
}

- (id)bakedAnimationCopy
{
  return (id)-[CAAnimation copy](self->_bakedAnimation, "copy");
}

- (id)bakedAnimationPlayer
{
  SCNAnimationPlayer *v3;
  SCNAnimationPlayer *bakedAnimationPlayer_lazy;

  if (self->_bakedAnimation && !self->_bakedAnimationPlayer_lazy)
  {
    -[SCNNode animationPlayerForKey:](self->_avatarNode, "animationPlayerForKey:", CFSTR("AVTPuppetAnimationGroup"));
    v3 = (SCNAnimationPlayer *)objc_claimAutoreleasedReturnValue();
    bakedAnimationPlayer_lazy = self->_bakedAnimationPlayer_lazy;
    self->_bakedAnimationPlayer_lazy = v3;

  }
  return self->_bakedAnimationPlayer_lazy;
}

- (void)_restoreOriginalShaderModifiersOfMaterial:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v3 = a3;
  objc_getAssociatedObject(v3, CFSTR("kAVTOriginalShaderModifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v3;
      v6 = 0;
LABEL_6:
      objc_msgSend(v5, "setShaderModifiers:", v6);
      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v3;
      v6 = v4;
      goto LABEL_6;
    }
    avt_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AVTAvatar _restoreOriginalShaderModifiersOfMaterial:].cold.1();

  }
LABEL_10:

}

- (id)_cachePresentationConfigurationShaderModifiersForMaterial:(id)a3 cacheKey:(id)a4 shaderModifiersBuilder:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, id);
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, id))a5;
  objc_getAssociatedObject(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_getAssociatedObject(v7, CFSTR("kAVTOriginalShaderModifiers"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(v7, "shaderModifiers");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "count"))
      {
        v14 = v13;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v12 = v14;
      objc_setAssociatedObject(v7, CFSTR("kAVTOriginalShaderModifiers"), v14, (void *)0x303);
      goto LABEL_14;
    }
    v12 = (void *)v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v12;
        v12 = v13;
LABEL_14:
        v9[2](v9, v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_setAssociatedObject(v7, v8, v10, (void *)0x303);

        goto LABEL_15;
      }
      avt_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[AVTAvatar _restoreOriginalShaderModifiersOfMaterial:].cold.1();

    }
    v13 = 0;
    goto LABEL_14;
  }
LABEL_15:

  return v10;
}

- (void)_updateARModeShaderModifiersForMaterial:(id)a3 withOnTopMask:(BOOL)a4
{
  id v6;
  void *v7;
  _QWORD v8[4];
  BOOL v9;

  v6 = a3;
  if (-[AVTPresentationConfiguration usesAR](self->_presentationConfiguration, "usesAR"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __67__AVTAvatar__updateARModeShaderModifiersForMaterial_withOnTopMask___block_invoke;
    v8[3] = &__block_descriptor_33_e36___NSDictionary_16__0__NSDictionary_8l;
    v9 = a4;
    -[AVTAvatar _cachePresentationConfigurationShaderModifiersForMaterial:cacheKey:shaderModifiersBuilder:](self, "_cachePresentationConfigurationShaderModifiersForMaterial:cacheKey:shaderModifiersBuilder:", v6, CFSTR("kAVTARShaderModifiers"), v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setShaderModifiers:", v7);

  }
  else
  {
    -[AVTAvatar _restoreOriginalShaderModifiersOfMaterial:](self, "_restoreOriginalShaderModifiersOfMaterial:", v6);
  }

}

id __67__AVTAvatar__updateARModeShaderModifiersForMaterial_withOnTopMask___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  __CFString *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = CFSTR("#pragma body\n#ifdef USE_COLOR1_OUTPUT\n_output.color1.rg = 1.h - half2(onTopMask.sample(sampler(), _surface.diffuseTexcoord).rg);\n#endif\n");
  if (!*(_BYTE *)(a1 + 32))
    v4 = CFSTR("#pragma body\n#ifdef USE_COLOR1_OUTPUT\n_output.color1.rg = half2(1.h, 1.h);\n#endif\n");
  v5 = *MEMORY[0x1E0CD5BB0];
  v6 = v4;
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AVTMergeShaderModifiersForEntryPointWithPartsAndCode(0, CFSTR("#pragma arguments\ntexture2d onTopMask;\n"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    v9 = (void *)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v5);
  }
  else
  {
    v11 = v5;
    v12[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (BOOL)arMode
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;

  if ((arMode_done & 1) == 0)
  {
    arMode_done = 1;
    avt_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[AVTAvatar arMode].cold.1(v3, v4, v5);

  }
  return -[AVTPresentationConfiguration usesAR](self->_presentationConfiguration, "usesAR");
}

- (void)setArMode:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  AVTAugmentedRealityPresentationConfiguration *v8;
  AVTAugmentedRealityPresentationConfiguration *v9;

  v3 = a3;
  if ((setArMode__done & 1) == 0)
  {
    setArMode__done = 1;
    avt_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[AVTAvatar setArMode:].cold.1(v5, v6, v7);

  }
  if (v3)
  {
    v8 = objc_alloc_init(AVTAugmentedRealityPresentationConfiguration);
  }
  else
  {
    +[AVTClassicPresentationConfiguration sharedConfiguration](AVTClassicPresentationConfiguration, "sharedConfiguration");
    v8 = (AVTAugmentedRealityPresentationConfiguration *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  -[AVTAvatar setPresentationConfiguration:](self, "setPresentationConfiguration:", v8);

}

- (void)setPresentationConfiguration:(id)a3
{
  AVTPresentationConfiguration *v5;
  int v6;
  int v7;
  int32x2_t v8;
  uint64_t v9;
  float32x4_t v10;
  uint32x4_t v11;
  int32x2_t v12;
  float32x4_t v13;
  AVTPresentationConfiguration *v14;

  v5 = (AVTPresentationConfiguration *)a3;
  if (self->_presentationConfiguration != v5)
  {
    v14 = v5;
    v6 = -[AVTPresentationConfiguration usesAR](v5, "usesAR");
    v7 = -[AVTPresentationConfiguration usesAR](self->_presentationConfiguration, "usesAR");
    -[AVTAvatar removePresentationConfigurationBehavioursInHierarchy:forBodyParts:](self, "removePresentationConfigurationBehavioursInHierarchy:forBodyParts:", self->_avatarNode, -1);
    objc_storeStrong((id *)&self->_presentationConfiguration, a3);
    -[AVTAvatar resetPresentationConfigurationBehavioursInHierarchy:forBodyParts:](self, "resetPresentationConfigurationBehavioursInHierarchy:forBodyParts:", self->_avatarNode, -1);
    v5 = v14;
    if (v6 != v7)
    {
      v8.i32[0] = 1.0;
      if (v6)
        v8.i32[0] = LODWORD(self->_arScale);
      v13 = (float32x4_t)vdupq_lane_s32(v8, 0);
      -[SCNNode simdScale](self->_neckNode, "simdScale", *(_QWORD *)&v8, v9);
      v11 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(v10, v13));
      v11.i32[3] = v11.i32[2];
      v5 = v14;
      if ((vmaxvq_u32(v11) & 0x80000000) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CD5A38], "begin");
        -[SCNNode setSimdScale:](self->_neckNode, "setSimdScale:", *(double *)vdupq_lane_s32(v12, 0).i64);
        objc_msgSend(MEMORY[0x1E0CD5A38], "commit");
        v5 = v14;
      }
    }
  }

}

- (void)resetPresentationConfigurationBehavioursInHierarchy:(id)a3 forBodyParts:(unint64_t)a4
{
  AVTPresentationConfiguration *presentationConfiguration;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  SCNNode *avatarNode;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  char v24;
  _QWORD v25[5];

  presentationConfiguration = self->_presentationConfiguration;
  v6 = a3;
  v7 = -[AVTPresentationConfiguration usesAR](presentationConfiguration, "usesAR");
  v8 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __78__AVTAvatar_resetPresentationConfigurationBehavioursInHierarchy_forBodyParts___block_invoke;
  v25[3] = &unk_1EA61D7A8;
  v25[4] = self;
  objc_msgSend(v6, "enumerateHierarchyUsingBlock:", v25);

  -[AVTAvatar specializationSettings](self, "specializationSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AR"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("additional geometries"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    avatarNode = self->_avatarNode;
    v22[0] = v8;
    v22[1] = 3221225472;
    v22[2] = __78__AVTAvatar_resetPresentationConfigurationBehavioursInHierarchy_forBodyParts___block_invoke_2;
    v22[3] = &unk_1EA61F2E8;
    v23 = v11;
    v24 = v7;
    -[SCNNode enumerateChildNodesUsingBlock:](avatarNode, "enumerateChildNodesUsingBlock:", v22);

  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("skinner"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("normal node"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCNNode childNodeWithName:recursively:](self->_avatarNode, "childNodeWithName:recursively:", v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setHidden:", v7);
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("AR node"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCNNode childNodeWithName:recursively:](self->_avatarNode, "childNodeWithName:recursively:", v17, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "morpher");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v19)
    {
      objc_msgSend(v16, "morpher");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v20, "copy");
      objc_msgSend(v18, "setMorpher:", v21);

    }
    objc_msgSend(v18, "setHidden:", v7 ^ 1);

  }
}

void __78__AVTAvatar_resetPresentationConfigurationBehavioursInHierarchy_forBodyParts___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a2, "geometry", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "materials");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "customMaterialPropertyNames");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsObject:", CFSTR("onTopMask"));

        objc_msgSend(*(id *)(a1 + 32), "_updateARModeShaderModifiersForMaterial:withOnTopMask:", v9, v11);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

void __78__AVTAvatar_resetPresentationConfigurationBehavioursInHierarchy_forBodyParts___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "name");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v7, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6);

    if ((_DWORD)v5)
      objc_msgSend(v7, "setHidden:", *(_BYTE *)(a1 + 40) == 0);
  }

}

- (void)updateBindings
{
  void *v3;
  id v4;

  -[AVTAvatar headNode](self, "headNode");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatar updateBindingsOfNode:](self, "updateBindingsOfNode:", v3);

}

- (void)updateBindingsOfNode:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[7];
  char v7[32];
  char v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_headNode || !self->_morphInfoFromARKitBlendShapeIndex)
    -[AVTAvatar updateBindingsOfNode:].cold.1();
  v5 = v4;
  strcpy(v8, "morpher.weights[000]");
  strcpy(v7, "morpher.weights[000]");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__AVTAvatar_updateBindingsOfNode___block_invoke;
  v6[3] = &unk_1EA61F338;
  v6[4] = self;
  v6[5] = v8;
  v6[6] = v7;
  objc_msgSend(v4, "enumerateHierarchyUsingBlock:", v6);

}

void __34__AVTAvatar_updateBindingsOfNode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  __int128 v9;

  v3 = a2;
  if (*(id *)(*(_QWORD *)(a1 + 32) + 24) != v3)
  {
    v6 = v3;
    objc_msgSend(v3, "morpher");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v6, "removeAllBindings");
      objc_msgSend(v4, "targets");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __34__AVTAvatar_updateBindingsOfNode___block_invoke_2;
      v7[3] = &unk_1EA61F310;
      v7[4] = *(_QWORD *)(a1 + 32);
      v8 = v6;
      v9 = *(_OWORD *)(a1 + 40);
      objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

    }
    v3 = v6;
  }

}

void __34__AVTAvatar_updateBindingsOfNode___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  int IsUsedForBindings;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  objc_msgSend(a2, "name");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  IsUsedForBindings = AVTMorphTargetNameIsUsedForBindings(v15);
  v6 = v15;
  if (IsUsedForBindings)
  {
    objc_msgSend(*(id *)(a1 + 32), "effectiveMorphedNodeForTargetName:", v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (v7 != *(void **)(a1 + 40))
      {
        objc_msgSend(v7, "morpher");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "_weightIndexForTargetNamed:", v15);

        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v11 = ((unsigned __int128)(v10 * (__int128)(uint64_t)0xA3D70A3D70A3D70BLL) >> 64) + v10;
          *(_BYTE *)(*(_QWORD *)(a1 + 48) + 16) = (v11 < 0) + (v11 >> 6) + 48;
          *(_BYTE *)(*(_QWORD *)(a1 + 48) + 17) = (char)v10 / 10 + 48;
          *(_BYTE *)(*(_QWORD *)(a1 + 48) + 18) = (char)v10 % 10 + 48;
          *(_BYTE *)(*(_QWORD *)(a1 + 56) + 16) = a3 / 0x64 + 48;
          *(_BYTE *)(*(_QWORD *)(a1 + 56) + 17) = a3 / 0xA + 48;
          *(_BYTE *)(*(_QWORD *)(a1 + 56) + 18) = (a3 % 0xA) | 0x30;
          v12 = *(void **)(a1 + 40);
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", *(_QWORD *)(a1 + 56));
          v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", *(_QWORD *)(a1 + 48));
          objc_msgSend(v12, "bindAnimatablePath:toObject:withKeyPath:options:", v13, v8, v14, 0);

        }
      }
    }

    v6 = v15;
  }

}

- (void)resetCustomBehaviours
{
  -[AVTAvatar resetMorphingSkinningControllers](self, "resetMorphingSkinningControllers");
  -[AVTAvatar resetPresentationConfigurationBehavioursInHierarchy:forBodyParts:](self, "resetPresentationConfigurationBehavioursInHierarchy:forBodyParts:", self->_avatarNode, -1);
  -[AVTAvatar setupMorphInfoForChangeInSubHierarchy](self, "setupMorphInfoForChangeInSubHierarchy");
}

- (void)addCustomBehavioursInHierarchy:(id)a3 forBodyParts:(unint64_t)a4
{
  id v6;

  v6 = a3;
  -[AVTAvatar addMorphingSkinningControllersInHierarchy:](self, "addMorphingSkinningControllersInHierarchy:", v6);
  -[AVTAvatar resetPresentationConfigurationBehavioursInHierarchy:forBodyParts:](self, "resetPresentationConfigurationBehavioursInHierarchy:forBodyParts:", v6, a4);

  -[AVTAvatar setupMorphInfoForChangeInSubHierarchy](self, "setupMorphInfoForChangeInSubHierarchy");
}

- (void)removeCustomBehavioursInHierarchy:(id)a3 forBodyParts:(unint64_t)a4
{
  -[AVTAvatar removeMorphingSkinningControllersInHierarchy:](self, "removeMorphingSkinningControllersInHierarchy:", a3, a4);
  -[AVTAvatar setupMorphInfoForChangeInSubHierarchy](self, "setupMorphInfoForChangeInSubHierarchy");
}

- (void)disabledBlendshapesSpecializationSettingsDidChange
{
  void *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  int v7;
  $F418A78870F13856FCD92A25B67E8546 *v8;
  id v9;

  if (self->_morphInfoFromARKitBlendShapeIndex)
  {
    -[AVTAvatar specializationSettings](self, "specializationSettings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ARKit disabled blendshapes"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v4 = 0;
    for (i = 0; i != 52; ++i)
    {
      AVTBlendShapeLocationFromARIndex(i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "containsObject:", v6);
      v8 = &self->_morphInfoFromARKitBlendShapeIndex[v4];
      v8->var3 = v7 ^ 1;
      if (((v7 ^ 1) & 1) == 0)
        objc_msgSend(v8->var0, "setWeight:forTargetAtIndex:", v8->var2, 0.0);

      ++v4;
    }

  }
}

- (void)resetMorphingSkinningControllers
{
  -[AVTAvatar resetDynamics](self, "resetDynamics");
  -[AVTAvatar resetMorpherDrivenMaterials](self, "resetMorpherDrivenMaterials");
}

- (void)addMorphingSkinningControllersInHierarchy:(id)a3
{
  id v4;

  v4 = a3;
  -[AVTAvatar addDynamicsInHierarchy:ignoringUpperNodes:](self, "addDynamicsInHierarchy:ignoringUpperNodes:", v4, 0);
  -[AVTAvatar addMorpherDrivenMaterialsInHierarchy:](self, "addMorpherDrivenMaterialsInHierarchy:", v4);

}

- (void)removeMorphingSkinningControllersInHierarchy:(id)a3
{
  id v4;

  v4 = a3;
  -[AVTAvatar removeDynamicsInHierarchy:](self, "removeDynamicsInHierarchy:", v4);
  -[AVTAvatar removeMorpherDrivenMaterialsInHierarchy:](self, "removeMorpherDrivenMaterialsInHierarchy:", v4);

}

- (id)_objectsInDescriptors:(id)a3 andHierarchy:(id)a4 passingTest:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "count"))
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__4;
    v20 = __Block_byref_object_dispose__4;
    v21 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __60__AVTAvatar__objectsInDescriptors_andHierarchy_passingTest___block_invoke;
    v12[3] = &unk_1EA61F360;
    v13 = v7;
    v14 = v9;
    v15 = &v16;
    objc_msgSend(v8, "enumerateHierarchyUsingBlock:", v12);
    v10 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __60__AVTAvatar__objectsInDescriptors_andHierarchy_passingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        if ((*(unsigned int (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40)))
        {
          v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          if (!v10)
          {
            v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v13 = *(void **)(v12 + 40);
            *(_QWORD *)(v12 + 40) = v11;

            v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          }
          objc_msgSend(v10, "addObject:", v9, (_QWORD)v14);
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (id)upperNodesIgnoredByDynamics
{
  return 0;
}

- (void)resetDynamics
{
  NSMutableArray *dynamics;
  id v4;

  if (self->_avatarNode)
  {
    dynamics = self->_dynamics;
    self->_dynamics = 0;

    -[AVTAvatar upperNodesIgnoredByDynamics](self, "upperNodesIgnoredByDynamics");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[AVTAvatar addDynamicsInHierarchy:ignoringUpperNodes:](self, "addDynamicsInHierarchy:ignoringUpperNodes:", self->_avatarNode, v4);

  }
}

- (void)addDynamicsInHierarchy:(id)a3 ignoringUpperNodes:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];

  v7 = a3;
  v6 = a4;
  if (!-[AVTAvatar optimizeForSnapshot](self, "optimizeForSnapshot") || objc_msgSend(v6, "count", v7))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __55__AVTAvatar_addDynamicsInHierarchy_ignoringUpperNodes___block_invoke;
    v8[3] = &unk_1EA61F388;
    v8[4] = self;
    +[AVTPhysicalizedMorpherDynamic enumerateDynamicsInHierarchy:forAvatar:ignoredUpperNodes:usingBlock:]((uint64_t)AVTPhysicalizedMorpherDynamic, v7, self, v6, v8);
    +[AVTPhysicalizedSkeletonDynamic enumerateDynamicsInHierarchy:forAvatar:usingBlock:]((uint64_t)AVTPhysicalizedSkeletonDynamic, (uint64_t)v7, self, v8);
    +[AVTSpringDynamic enumerateDynamicsInHierarchy:forAvatar:usingBlock:]((uint64_t)AVTSpringDynamic, (uint64_t)v7, self, v8);
  }

}

void __55__AVTAvatar_addDynamicsInHierarchy_ignoringUpperNodes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  v8 = v3;
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 128);
    *(_QWORD *)(v6 + 128) = v5;

    v3 = v8;
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  }
  objc_msgSend(v4, "addObject:", v3);

}

- (void)removeDynamicsInHierarchy:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *dynamics;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[AVTAvatar _objectsInDescriptors:andHierarchy:passingTest:](self, "_objectsInDescriptors:andHierarchy:passingTest:", self->_dynamics, a3, &__block_literal_global_122);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "resetTarget", (_QWORD)v11);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

    -[NSMutableArray removeObjectsInArray:](self->_dynamics, "removeObjectsInArray:", v5);
    if (!-[NSMutableArray count](self->_dynamics, "count"))
    {
      dynamics = self->_dynamics;
      self->_dynamics = 0;

    }
  }

}

uint64_t __39__AVTAvatar_removeDynamicsInHierarchy___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "affectsNode:");
}

- (void)evaluateDynamicsAtTime:(double)a3
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_dynamics;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "evaluateAtTime:physicsController:", self->_physicsController, a3, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)resetMorpherDrivenMaterials
{
  NSMutableArray *morpherDrivenMaterialDescriptors;
  id v4;

  morpherDrivenMaterialDescriptors = self->_morpherDrivenMaterialDescriptors;
  self->_morpherDrivenMaterialDescriptors = 0;

  -[AVTAvatar avatarNode](self, "avatarNode");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTAvatar addMorpherDrivenMaterialsInHierarchy:](self, "addMorpherDrivenMaterialsInHierarchy:", v4);

}

- (void)addMorpherDrivenMaterialsInHierarchy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint8_t v11[16];
  _QWORD v12[5];
  id v13;

  v4 = a3;
  -[AVTAvatar specializationSettings](self, "specializationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ARKit driven material"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__AVTAvatar_addMorpherDrivenMaterialsInHierarchy___block_invoke;
    v12[3] = &unk_1EA61F418;
    v12[4] = self;
    v13 = v4;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    v9 = -[NSMutableArray count](self->_morpherDrivenMaterialDescriptors, "count");

    if (v8 != v9)
    {
      avt_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1DD1FA000, v10, OS_LOG_TYPE_DEFAULT, "Failed to create morpher-driven material", v11, 2u);
      }

    }
  }

}

void __50__AVTAvatar_addMorpherDrivenMaterialsInHierarchy___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  AVTMorpherDrivenMaterialDescriptor *v26;
  SEL v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id obj;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v40 = a1;
  objc_msgSend(*(id *)(a1 + 32), "effectiveMorphedNodeForTargetName:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v7;
  if (v7)
  {
    objc_msgSend(v7, "morpher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v8, "_weightIndexForTargetNamed:", v5);

  }
  else
  {
    v36 = 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_opt_class();
  v33 = v6;
  v34 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v6, v6, v5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  obj = v9;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v39)
  {
    v38 = *(_QWORD *)v51;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v51 != v38)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v10);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("node"), v33);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("material"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("property"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(void **)(v40 + 40);
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __50__AVTAvatar_addMorpherDrivenMaterialsInHierarchy___block_invoke_2;
        v48[3] = &unk_1EA61F3F0;
        v43 = v12;
        v49 = v43;
        objc_msgSend(v15, "childNodesPassingTest:recursively:", v48, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "lastObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v41 = v16;
        objc_msgSend(v16, "geometry");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "materials");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v45;
          while (2)
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v45 != v21)
                objc_enumerationMutation(v18);
              v23 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
              objc_msgSend(v23, "name");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "isEqualToString:", v13);

              if (v25)
              {
                v26 = objc_alloc_init(AVTMorpherDrivenMaterialDescriptor);
                -[AVTSkinnerVariantPair setOriginalSkinner:]((uint64_t)v26, v37);
                if (v26)
                {
                  v26->_morphTargetIndex = v36;
                  -[AVTPhysicsRig setChainRoot:]((uint64_t)v26, v23);
                  objc_setProperty_nonatomic_copy(v26, v27, v14, 32);
                }
                else
                {
                  -[AVTPhysicsRig setChainRoot:](0, v23);
                }
                v28 = *(void **)(*(_QWORD *)(v40 + 32) + 136);
                if (!v28)
                {
                  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  v30 = *(_QWORD *)(v40 + 32);
                  v31 = *(void **)(v30 + 136);
                  *(_QWORD *)(v30 + 136) = v29;

                  v28 = *(void **)(*(_QWORD *)(v40 + 32) + 136);
                }
                objc_msgSend(v28, "addObject:", v26);

                goto LABEL_26;
              }
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
            if (v20)
              continue;
            break;
          }
        }
LABEL_26:

        ++v10;
      }
      while (v10 != v39);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      v39 = v32;
    }
    while (v32);
  }

}

uint64_t __50__AVTAvatar_addMorpherDrivenMaterialsInHierarchy___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  int v8;

  v5 = a2;
  objc_msgSend(v5, "geometry");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

    if (v8)
    {
      v6 = 1;
      *a3 = 1;
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (void)removeMorpherDrivenMaterialsInHierarchy:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *morpherDrivenMaterialDescriptors;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[AVTAvatar _objectsInDescriptors:andHierarchy:passingTest:](self, "_objectsInDescriptors:andHierarchy:passingTest:", self->_morpherDrivenMaterialDescriptors, a3, &__block_literal_global_128);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
          if (v10)
          {
            v11 = *(id *)(v10 + 24);
            v12 = *(_QWORD *)(v10 + 32);
          }
          else
          {
            v11 = 0;
            v12 = 0;
          }
          objc_msgSend(v11, "setValue:forKey:", &unk_1EA655B50, v12, (_QWORD)v15);

          ++v9;
        }
        while (v7 != v9);
        v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v7 = v13;
      }
      while (v13);
    }

    -[NSMutableArray removeObjectsInArray:](self->_morpherDrivenMaterialDescriptors, "removeObjectsInArray:", v5);
    if (!-[NSMutableArray count](self->_morpherDrivenMaterialDescriptors, "count"))
    {
      morpherDrivenMaterialDescriptors = self->_morpherDrivenMaterialDescriptors;
      self->_morpherDrivenMaterialDescriptors = 0;

    }
  }

}

BOOL __53__AVTAvatar_removeMorpherDrivenMaterialsInHierarchy___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  if (a2)
    v3 = *(_QWORD *)(a2 + 8);
  else
    v3 = 0;
  return v3 == a3;
}

- (void)updateMorpherDrivenMaterialsWithDeltaTime:(double)a3
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v17;
  float v18;
  id v19;
  double v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = self->_morpherDrivenMaterialDescriptors;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD **)(*((_QWORD *)&v24 + 1) + 8 * v7);
        if (v8)
          v9 = (void *)v8[1];
        else
          v9 = 0;
        v10 = v9;
        objc_msgSend(v10, "presentationNode", (_QWORD)v24);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "morpher");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v8)
          v14 = v8[2];
        else
          v14 = 0;
        objc_msgSend(v12, "weightForTargetAtIndex:", v14);
        v16 = v15;

        if (v8)
          v17 = (void *)v8[3];
        else
          v17 = 0;
        v19 = v17;
        v18 = v16;
        *(float *)&v20 = v18;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          v22 = v8[4];
        else
          v22 = 0;
        objc_msgSend(v19, "setValue:forKey:", v21, v22);

        ++v7;
      }
      while (v5 != v7);
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v5 = v23;
    }
    while (v23);
  }

}

- (BOOL)usesSkinningForEyeOrientation
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[AVTAvatar specializationSettings](self, "specializationSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("eye behavior"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("uses skinning for orientation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setupEyeOrientationAndReflections
{
  __assert_rtn("-[AVTAvatar setupEyeOrientationAndReflections]", "AVTAvatar.m", 975, "_rightEye && _leftEye");
}

- (void)updateEyeOrientationAndReflections
{
  AVTPupilReflectionCorrectionDescriptor *pupilReflectionCorrectionDescriptor;
  void *v4;
  void *v5;
  AVTPupilReflectionCorrectionDescriptor *v6;
  int64_t leftEyeTargetIndex;
  double v8;
  float v9;
  AVTPupilReflectionCorrectionDescriptor *v10;
  void *v11;
  float v12;
  AVTPupilReflectionCorrectionDescriptor *v13;
  double v14;
  void *v15;
  AVTPupilReflectionCorrectionDescriptor *v16;
  int64_t rightEyeTargetIndex;
  double v18;
  float v19;
  AVTPupilReflectionCorrectionDescriptor *v20;
  void *v21;
  float v22;
  AVTPupilReflectionCorrectionDescriptor *v23;
  double v24;
  void *v25;
  AVTEyeSkinningDescriptor *eyeSkinningDescriptor;
  void *v27;
  AVTEyeSkinningDescriptor *v28;
  int64_t leftEyeLookDownTargetIndex;
  double v30;
  double v31;
  AVTEyeSkinningDescriptor *v32;
  int64_t leftEyeLookInTargetIndex;
  double v34;
  double v35;
  AVTEyeSkinningDescriptor *v36;
  int64_t leftEyeLookOutTargetIndex;
  double v38;
  double v39;
  AVTEyeSkinningDescriptor *v40;
  int64_t leftEyeLookUpTargetIndex;
  double v42;
  double v43;
  AVTEyeSkinningDescriptor *v44;
  int64_t rightEyeLookDownTargetIndex;
  double v46;
  double v47;
  AVTEyeSkinningDescriptor *v48;
  int64_t rightEyeLookInTargetIndex;
  double v50;
  __int128 v51;
  AVTEyeSkinningDescriptor *v52;
  int64_t rightEyeLookOutTargetIndex;
  float v54;
  float v55;
  float v56;
  double v57;
  AVTEyeSkinningDescriptor *v58;
  int64_t rightEyeLookUpTargetIndex;
  double v60;
  float32x2_t v61;
  float64x2_t v62;
  double v63;
  AVTEyeSkinningDescriptor *v64;
  SCNNode *leftEyeJoint;
  AVTEyeSkinningDescriptor *v66;
  SCNNode *rightEyeJoint;
  __int128 v68;
  unsigned int v69;
  float v70;
  unsigned int v71;
  unsigned int v72;
  __int32 v73;
  float v74;
  float v75;
  double v76;
  void *v77;

  pupilReflectionCorrectionDescriptor = self->_pupilReflectionCorrectionDescriptor;
  if (pupilReflectionCorrectionDescriptor)
  {
    -[SCNNode presentationNode](pupilReflectionCorrectionDescriptor->_readMorpherNode, "presentationNode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "morpher");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = self->_pupilReflectionCorrectionDescriptor;
    if (v6)
      leftEyeTargetIndex = v6->_leftEyeTargetIndex;
    else
      leftEyeTargetIndex = 0;
    objc_msgSend(v5, "weightForTargetAtIndex:", leftEyeTargetIndex);
    v9 = v8;
    v10 = self->_pupilReflectionCorrectionDescriptor;
    if (v10)
      v10 = (AVTPupilReflectionCorrectionDescriptor *)v10->_leftEyeMaterial;
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v12 = v9 * 0.5;
    v13 = v10;
    *(float *)&v14 = v12;
    objc_msgSend(v11, "numberWithFloat:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPupilReflectionCorrectionDescriptor setValue:forKey:](v13, "setValue:forKey:", v15, CFSTR("blink"));

    v16 = self->_pupilReflectionCorrectionDescriptor;
    if (v16)
      rightEyeTargetIndex = v16->_rightEyeTargetIndex;
    else
      rightEyeTargetIndex = 0;
    objc_msgSend(v5, "weightForTargetAtIndex:", rightEyeTargetIndex);
    v19 = v18;
    v20 = self->_pupilReflectionCorrectionDescriptor;
    if (v20)
      v20 = (AVTPupilReflectionCorrectionDescriptor *)v20->_rightEyeMaterial;
    v21 = (void *)MEMORY[0x1E0CB37E8];
    v22 = v19 * 0.5;
    v23 = v20;
    *(float *)&v24 = v22;
    objc_msgSend(v21, "numberWithFloat:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTPupilReflectionCorrectionDescriptor setValue:forKey:](v23, "setValue:forKey:", v25, CFSTR("blink"));

  }
  eyeSkinningDescriptor = self->_eyeSkinningDescriptor;
  if (eyeSkinningDescriptor)
  {
    -[SCNNode presentationNode](eyeSkinningDescriptor->_readMorpherNode, "presentationNode");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "morpher");
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = self->_eyeSkinningDescriptor;
    if (v28)
      leftEyeLookDownTargetIndex = v28->_leftEyeLookDownTargetIndex;
    else
      leftEyeLookDownTargetIndex = 0;
    objc_msgSend(v77, "weightForTargetAtIndex:", leftEyeLookDownTargetIndex);
    v31 = v30;
    v32 = self->_eyeSkinningDescriptor;
    if (v32)
      leftEyeLookInTargetIndex = v32->_leftEyeLookInTargetIndex;
    else
      leftEyeLookInTargetIndex = 0;
    objc_msgSend(v77, "weightForTargetAtIndex:", leftEyeLookInTargetIndex);
    v35 = v34;
    v36 = self->_eyeSkinningDescriptor;
    if (v36)
      leftEyeLookOutTargetIndex = v36->_leftEyeLookOutTargetIndex;
    else
      leftEyeLookOutTargetIndex = 0;
    objc_msgSend(v77, "weightForTargetAtIndex:", leftEyeLookOutTargetIndex);
    v39 = v38;
    v40 = self->_eyeSkinningDescriptor;
    if (v40)
      leftEyeLookUpTargetIndex = v40->_leftEyeLookUpTargetIndex;
    else
      leftEyeLookUpTargetIndex = 0;
    objc_msgSend(v77, "weightForTargetAtIndex:", leftEyeLookUpTargetIndex);
    v43 = v42;
    v44 = self->_eyeSkinningDescriptor;
    if (v44)
      rightEyeLookDownTargetIndex = v44->_rightEyeLookDownTargetIndex;
    else
      rightEyeLookDownTargetIndex = 0;
    objc_msgSend(v77, "weightForTargetAtIndex:", rightEyeLookDownTargetIndex);
    v47 = v46;
    v48 = self->_eyeSkinningDescriptor;
    if (v48)
      rightEyeLookInTargetIndex = v48->_rightEyeLookInTargetIndex;
    else
      rightEyeLookInTargetIndex = 0;
    objc_msgSend(v77, "weightForTargetAtIndex:", rightEyeLookInTargetIndex);
    v52 = self->_eyeSkinningDescriptor;
    if (v52)
      rightEyeLookOutTargetIndex = v52->_rightEyeLookOutTargetIndex;
    else
      rightEyeLookOutTargetIndex = 0;
    *(float *)&v51 = v31;
    v72 = v51;
    *(float *)&v51 = v35;
    v71 = v51;
    *(float *)&v51 = v39;
    v68 = v51;
    v54 = v43;
    v70 = v54;
    v55 = v47;
    v56 = v50;
    v74 = v56;
    v75 = v55;
    objc_msgSend(v77, "weightForTargetAtIndex:", rightEyeLookOutTargetIndex, v68);
    *(float *)&v57 = v57;
    v73 = LODWORD(v57);
    v58 = self->_eyeSkinningDescriptor;
    if (v58)
      rightEyeLookUpTargetIndex = v58->_rightEyeLookUpTargetIndex;
    else
      rightEyeLookUpTargetIndex = 0;
    objc_msgSend(v77, "weightForTargetAtIndex:", rightEyeLookUpTargetIndex);
    v61.f32[0] = v60;
    v62 = (float64x2_t)vdupq_n_s64(0x3FD657184DB22790uLL);
    v63 = COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(vsub_f32((float32x2_t)__PAIR64__(v69, v72), (float32x2_t)__PAIR64__(v71, LODWORD(v70)))), v62)));
    v61.i32[1] = v73;
    v76 = COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(vcvtq_f64_f32(vsub_f32((float32x2_t)__PAIR64__(LODWORD(v74), LODWORD(v75)), v61)), v62)));
    v64 = self->_eyeSkinningDescriptor;
    if (v64)
      leftEyeJoint = v64->_leftEyeJoint;
    else
      leftEyeJoint = 0;
    -[SCNNode setSimdEulerAngles:](leftEyeJoint, "setSimdEulerAngles:", v63);
    v66 = self->_eyeSkinningDescriptor;
    if (v66)
      rightEyeJoint = v66->_rightEyeJoint;
    else
      rightEyeJoint = 0;
    -[SCNNode setSimdEulerAngles:](rightEyeJoint, "setSimdEulerAngles:", v76);

  }
}

- (void)willRemoveFromScene:(id)a3
{
  AVTPhysicsController *physicsController;
  id v4;

  physicsController = self->_physicsController;
  objc_msgSend(a3, "physicsWorld");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTPhysicsController removeFromPhysicsWorld:](physicsController, "removeFromPhysicsWorld:", v4);

}

- (void)didAddToScene:(id)a3
{
  AVTPhysicsController *physicsController;
  id v4;

  physicsController = self->_physicsController;
  objc_msgSend(a3, "physicsWorld");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTPhysicsController addToPhysicsWorld:](physicsController, "addToPhysicsWorld:", v4);

}

- (void)renderer:(id)a3 didApplyAnimationsAtTime:(double)a4
{
  id v4;

  v4 = a3;
  __assert_rtn("-[AVTAvatar renderer:didApplyAnimationsAtTime:]", "AVTAvatar.m", 1110, "0");
}

- (void)updateAfterAnimationsEvaluatedAtTime:(double)a3 renderer:(id)a4
{
  id v6;
  double physicsScaleFactor;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __n128 v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  NSMutableArray *didUpdateAtTimeCallbackItems;
  char v18;

  v6 = a4;
  physicsScaleFactor = self->_physicsScaleFactor;
  v8 = a3 - self->_lastRenderTime;
  if (v8 == 0.0)
    v8 = 0.0166666667;
  if (v8 <= 0.1)
    v9 = v8;
  else
    v9 = 0.1;
  self->_lastRenderTime = a3;
  -[AVTPhysicsController updateAtTime:forceMultiplier:](self->_physicsController, "updateAtTime:forceMultiplier:", a3, physicsScaleFactor);
  -[AVTAvatar evaluateDynamicsAtTime:](self, "evaluateDynamicsAtTime:", a3);
  -[AVTAvatar updateEyeOrientationAndReflections](self, "updateEyeOrientationAndReflections");
  -[AVTAvatar updateMorpherDrivenMaterialsWithDeltaTime:](self, "updateMorpherDrivenMaterialsWithDeltaTime:", v9);
  if (self->_didUpdateAtTimeCallbackItems)
  {
    os_unfair_lock_lock(&self->_didUpdateAtTimeLock);
    v10 = -[NSMutableArray count](self->_didUpdateAtTimeCallbackItems, "count");
    if (v10 - 1 >= 0)
    {
      v11 = v10;
      do
      {
        --v11;
        v18 = 0;
        -[NSMutableArray objectAtIndexedSubscript:](self->_didUpdateAtTimeCallbackItems, "objectAtIndexedSubscript:", v11);
        v12 = objc_claimAutoreleasedReturnValue();
        v14 = (_QWORD *)v12;
        if (v12)
        {
          if (!*(_BYTE *)(v12 + 8))
          {
            *(_BYTE *)(v12 + 8) = 1;
            *(double *)(v12 + 16) = a3;
          }
          v15 = *(id *)(v12 + 32);
          v16 = (uint64_t)v15 + 16;
          v13.n128_u64[0] = v14[2];
        }
        else
        {
          v15 = 0;
          v13.n128_u64[0] = 0;
          v16 = 16;
        }
        (*(void (**)(id, AVTAvatar *, id, char *, double, __n128))v16)(v15, self, v6, &v18, a3, v13);

        if (v18)
        {
          -[NSMutableArray removeObjectAtIndex:](self->_didUpdateAtTimeCallbackItems, "removeObjectAtIndex:", v11);
          if (!-[NSMutableArray count](self->_didUpdateAtTimeCallbackItems, "count"))
          {
            didUpdateAtTimeCallbackItems = self->_didUpdateAtTimeCallbackItems;
            self->_didUpdateAtTimeCallbackItems = 0;

          }
        }

      }
      while (v11 > 0);
    }
    os_unfair_lock_unlock(&self->_didUpdateAtTimeLock);
  }

}

- (void)addDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:(id)a3 block:(id)a4
{
  id v6;
  AVTAvatarDidUpdateAtTimeCallbackItem *v7;
  void *v8;
  const char *v9;
  void *v10;
  void *v11;
  SEL v12;
  NSMutableArray *didUpdateAtTimeCallbackItems;
  uint64_t v14;
  NSMutableArray *v15;
  NSMutableArray *v16;
  NSMutableArray *v17;
  id v18;
  _QWORD v19[4];
  NSMutableArray *v20;

  v18 = a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_didUpdateAtTimeLock);
  v7 = objc_alloc_init(AVTAvatarDidUpdateAtTimeCallbackItem);
  v8 = (void *)objc_msgSend(v18, "copy");
  v10 = v8;
  if (v7)
  {
    objc_setProperty_nonatomic_copy(v7, v9, v8, 24);

    v11 = (void *)objc_msgSend(v6, "copy");
    objc_setProperty_nonatomic_copy(v7, v12, v11, 32);
  }
  else
  {

    v11 = (void *)objc_msgSend(v6, "copy");
  }

  didUpdateAtTimeCallbackItems = self->_didUpdateAtTimeCallbackItems;
  if (didUpdateAtTimeCallbackItems)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __76__AVTAvatar_addDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey_block___block_invoke;
    v19[3] = &unk_1EA61F480;
    v20 = (NSMutableArray *)v18;
    v14 = -[NSMutableArray indexOfObjectPassingTest:](didUpdateAtTimeCallbackItems, "indexOfObjectPassingTest:", v19);
    v15 = self->_didUpdateAtTimeCallbackItems;
    if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      -[NSMutableArray insertObject:atIndex:](v15, "insertObject:atIndex:", v7, 0);
    else
      -[NSMutableArray setObject:atIndexedSubscript:](v15, "setObject:atIndexedSubscript:", v7);
    v17 = v20;
  }
  else
  {
    v16 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v7, 0);
    v17 = self->_didUpdateAtTimeCallbackItems;
    self->_didUpdateAtTimeCallbackItems = v16;
  }

  os_unfair_lock_unlock(&self->_didUpdateAtTimeLock);
}

uint64_t __76__AVTAvatar_addDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey_block___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  if (a2)
    v2 = *(void **)(a2 + 24);
  else
    v2 = 0;
  return objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 32));
}

- (void)removeDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:(id)a3
{
  id v4;
  NSMutableArray *didUpdateAtTimeCallbackItems;
  uint64_t v6;
  NSMutableArray *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  os_unfair_lock_lock(&self->_didUpdateAtTimeLock);
  didUpdateAtTimeCallbackItems = self->_didUpdateAtTimeCallbackItems;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__AVTAvatar_removeDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey___block_invoke;
  v9[3] = &unk_1EA61F480;
  v8 = v4;
  v10 = v8;
  v6 = -[NSMutableArray indexOfObjectPassingTest:](didUpdateAtTimeCallbackItems, "indexOfObjectPassingTest:", v9);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_didUpdateAtTimeCallbackItems, "removeObjectAtIndex:", v6);
    if (!-[NSMutableArray count](self->_didUpdateAtTimeCallbackItems, "count"))
    {
      v7 = self->_didUpdateAtTimeCallbackItems;
      self->_didUpdateAtTimeCallbackItems = 0;

    }
  }
  os_unfair_lock_unlock(&self->_didUpdateAtTimeLock);

}

uint64_t __73__AVTAvatar_removeDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  if (a2)
    v2 = *(void **)(a2 + 24);
  else
    v2 = 0;
  return objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 32));
}

- (id)effectiveMorphedNodeForTargetName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  SCNNode *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, void *, _BYTE *);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  -[AVTAvatar specializationSettings](self, "specializationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ARKit driven morpher"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__4;
  v23 = __Block_byref_object_dispose__4;
  v24 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __47__AVTAvatar_effectiveMorphedNodeForTargetName___block_invoke;
  v16 = &unk_1EA61DA00;
  v7 = v4;
  v17 = v7;
  v18 = &v19;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v13);
  v8 = self->_headNode;
  v9 = (void *)v20[5];
  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("morphed node"), v13, v14, v15, v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SCNNode childNodeWithName:recursively:](self->_avatarNode, "childNodeWithName:recursively:", v10, 1);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (SCNNode *)v11;
  }

  _Block_object_dispose(&v19, 8);
  return v8;
}

void __47__AVTAvatar_effectiveMorphedNodeForTargetName___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", a2))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

- (void)setupMorphInfo
{
  SCNNode *headNode;
  $F418A78870F13856FCD92A25B67E8546 *morphInfoFromARKitBlendShapeIndex;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  id v13;
  uint64_t v14;
  void *v15;
  $F418A78870F13856FCD92A25B67E8546 *v16;
  id v17;

  headNode = self->_headNode;
  morphInfoFromARKitBlendShapeIndex = self->_morphInfoFromARKitBlendShapeIndex;
  if (headNode)
  {
    self->_morphInfoFromARKitBlendShapeIndex = ($F418A78870F13856FCD92A25B67E8546 *)malloc_type_realloc(morphInfoFromARKitBlendShapeIndex, 0x680uLL, 0x108004077A7B0B0uLL);
    -[AVTAvatar specializationSettings](self, "specializationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ARKit disabled blendshapes"));
    v17 = (id)objc_claimAutoreleasedReturnValue();

    v6 = 0;
    for (i = 0; i != 52; ++i)
    {
      AVTBlendShapeLocationFromARIndex(i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTAvatar effectiveMorphedNodeForTargetName:](self, "effectiveMorphedNodeForTargetName:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "morpher");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "_weightIndexForTargetNamed:", v8);

      v12 = 0;
      v13 = 0;
      v14 = 0x7FFFFFFFFFFFFFFFLL;
      v15 = 0;
      if (v9)
      {
        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v13 = (id)objc_msgSend(v9, "morpher");
          v12 = objc_msgSend(v17, "containsObject:", v8) ^ 1;
          v15 = v9;
          v14 = v11;
        }
      }
      v16 = &self->_morphInfoFromARKitBlendShapeIndex[v6];
      v16->var0 = v13;
      v16->var1 = v15;
      v16->var2 = v14;
      v16->var3 = v12;
      *(_DWORD *)(&v16->var3 + 1) = 0;
      *((_DWORD *)&v16->var3 + 1) = 0;

      ++v6;
    }
    -[AVTAvatar setupMorphInfoForChangeInSubHierarchy](self, "setupMorphInfoForChangeInSubHierarchy");

  }
  else
  {
    free(morphInfoFromARKitBlendShapeIndex);
    self->_morphInfoFromARKitBlendShapeIndex = 0;
    free(self->_friendlyPoseMorphInfos);
    self->_friendlyPoseMorphInfos = 0;
    self->_friendlyPoseMorphInfoCount = 0;
  }
}

- (void)setupMorphInfoForChangeInSubHierarchy
{
  void *v3;
  char v4;
  SCNNode *v5;
  SCNNode *v6;
  uint64_t v7;
  SCNNode *avatarNode;
  uint64_t v9;
  SCNNode *headNode;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  AVTAvatar *v16;
  char v17;

  self->_friendlyPoseMorphInfoCount = 0;
  -[AVTAvatar specializationSettings](self, "specializationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ARKit disabled blendshapes"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v11, "containsObject:", CFSTR("Emoji")) ^ 1;
  v5 = self->_headNode;
  if (v5)
  {
    v6 = v5;
    while (v6 != self->_avatarNode)
    {
      -[SCNNode parentNode](v6, "parentNode");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (SCNNode *)v7;
      if (!v7)
        goto LABEL_5;
    }
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __50__AVTAvatar_setupMorphInfoForChangeInSubHierarchy__block_invoke_2;
    v15 = &unk_1EA61F2E8;
    v17 = v4;
    v16 = self;
    -[SCNNode enumerateHierarchyUsingBlock:](v6, "enumerateHierarchyUsingBlock:", &v12);
  }
  else
  {
LABEL_5:
    avatarNode = self->_avatarNode;
    v9 = MEMORY[0x1E0C809B0];
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __50__AVTAvatar_setupMorphInfoForChangeInSubHierarchy__block_invoke_2;
    v15 = &unk_1EA61F2E8;
    v17 = v4;
    v16 = self;
    -[SCNNode enumerateHierarchyUsingBlock:](avatarNode, "enumerateHierarchyUsingBlock:", &v12);
    headNode = self->_headNode;
    v12 = v9;
    v13 = 3221225472;
    v14 = __50__AVTAvatar_setupMorphInfoForChangeInSubHierarchy__block_invoke_2;
    v15 = &unk_1EA61F2E8;
    v17 = v4;
    v16 = self;
    -[SCNNode enumerateHierarchyUsingBlock:](headNode, "enumerateHierarchyUsingBlock:", &v12);
    v6 = 0;
  }
  if (!self->_friendlyPoseMorphInfoCount)
    self->_friendlyPoseMorphInfoProxy.isEnabled = v4;

}

void __50__AVTAvatar_setupMorphInfoForChangeInSubHierarchy__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "morpher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "_weightIndexForTargetNamed:", CFSTR("Emoji"));
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = v5;
      v7 = *(_BYTE *)(a1 + 40);
      ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = malloc_type_realloc(*(void **)(*(_QWORD *)(a1 + 32) + 72), 32 * *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), 0x108004077A7B0B0uLL);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 32 * *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
      *(_QWORD *)(v8 - 32) = v4;
      *(_QWORD *)(v8 - 24) = v9;
      *(_QWORD *)(v8 - 16) = v6;
      *(_BYTE *)(v8 - 8) = v7;
      *(_DWORD *)(v8 - 4) = 0;
      *(_DWORD *)(v8 - 7) = 0;
    }
  }

}

- (void)updatePoseWithPoseProvider:(id)a3 applySmoothing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  $F418A78870F13856FCD92A25B67E8546 *morphInfoFromARKitBlendShapeIndex;
  int64_t var2;
  id var0;
  void *v14;
  float v15;
  uint64_t v16;
  unint64_t v17;
  $F418A78870F13856FCD92A25B67E8546 *v18;
  id v19;
  int64_t v20;
  float v21;
  float v22;
  uint64_t v23;
  double v24;
  float32x4_t v25;
  float v26;
  float32x4_t v27;
  float32x4_t v28;
  id v29;

  v4 = a4;
  v6 = a3;
  if (!self->_headNode)
    goto LABEL_21;
  v29 = v6;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CD5A38], "begin");
    objc_msgSend(MEMORY[0x1E0CD5A38], "setAnimationDuration:", 0.05);
    v7 = (void *)MEMORY[0x1E0CD5A38];
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAnimationTimingFunction:", v8);

  }
  v9 = 0;
  for (i = 0; i != 52; ++i)
  {
    morphInfoFromARKitBlendShapeIndex = self->_morphInfoFromARKitBlendShapeIndex;
    if (morphInfoFromARKitBlendShapeIndex[v9].var3)
    {
      var2 = morphInfoFromARKitBlendShapeIndex[v9].var2;
      if (var2 != 0x7FFFFFFFFFFFFFFFLL)
      {
        var0 = morphInfoFromARKitBlendShapeIndex[v9].var0;
        -[AVTAvatar blendShapeNameForARKitBlendShapeIndex:](self, "blendShapeNameForARKitBlendShapeIndex:", i);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "weightForBlendShapeNamed:index:", v14, i);
        objc_msgSend(var0, "setWeight:forTargetAtIndex:", var2, v15);

      }
    }
    ++v9;
  }
  if (self->_friendlyPoseMorphInfoCount)
  {
    v16 = 0;
    v17 = 0;
    do
    {
      v18 = &self->_friendlyPoseMorphInfos[v16];
      v19 = v18->var0;
      v20 = v18->var2;
      objc_msgSend(v29, "weightForBlendShapeNamed:index:", CFSTR("Emoji"), 52);
      objc_msgSend(v19, "setWeight:forTargetAtIndex:", v20, v21);
      ++v17;
      ++v16;
    }
    while (v17 < self->_friendlyPoseMorphInfoCount);
  }
  else
  {
    objc_msgSend(v29, "weightForBlendShapeNamed:index:", CFSTR("Emoji"), 52);
    self->_friendlyPoseMorphInfoProxy.morphWeight = v22;
  }
  -[AVTPhysicsController setupPhysicsIfNeeded](self->_physicsController, "setupPhysicsIfNeeded");
  v23 = objc_msgSend(v29, "unitSystem");
  if (v23 == 1)
  {
    objc_msgSend(v29, "neckPosition");
    v28 = v25;
    v26 = AVTGetNeutralZ();
    v27.i64[0] = 0;
    v27.i64[1] = LODWORD(v26);
    *(_QWORD *)&v24 = vmulq_f32(vsubq_f32(v28, v27), (float32x4_t)xmmword_1DD26A090).u64[0];
  }
  else
  {
    if (v23)
      goto LABEL_19;
    objc_msgSend(v29, "neckPosition");
  }
  -[SCNNode setSimdPosition:](self->_rootJointNode, "setSimdPosition:", v24, *(_OWORD *)&v28);
LABEL_19:
  objc_msgSend(v29, "neckOrientation");
  -[SCNNode setSimdOrientation:](self->_neckNode, "setSimdOrientation:");
  v6 = v29;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CD5A38], "commit");
    v6 = v29;
  }
LABEL_21:

}

- (void)updatePoseWithFaceTrackingData:(id)a3 applySmoothing:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;

  v4 = a4;
  v6 = a3;
  if (self->_headNode)
  {
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CD5A38], "begin");
      objc_msgSend(MEMORY[0x1E0CD5A38], "setAnimationDuration:", 0.05);
      v7 = (void *)MEMORY[0x1E0CD5A38];
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAnimationTimingFunction:", v8);

    }
    if (objc_msgSend(v6, "length") != 480)
    {
      avt_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[AVTAvatar updatePoseWithFaceTrackingData:applySmoothing:].cold.1(v6, v9);

    }
    v10 = objc_msgSend(objc_retainAutorelease(v6), "bytes");
    -[AVTAvatar _applyBlendShapesWithTrackingData:](self, "_applyBlendShapesWithTrackingData:", v10);
    -[AVTAvatar _applyHeadPoseWithTrackingData:gazeCorrection:pointOfView:](self, "_applyHeadPoseWithTrackingData:gazeCorrection:pointOfView:", v10, 1, 0);
    if (v4)
      objc_msgSend(MEMORY[0x1E0CD5A38], "commit");
  }

}

- (void)updatePoseWithCVAFaceTrackingAnimationDictionary:(_QWORD *)a1 neckPosition:(uint64_t)a2 neckOrientation:(void *)a3 applySmoothing:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  float v9;
  float32x4_t v10;
  float32x4_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  int v27;
  float32x4_t v28;
  float32x4_t v29;
  __int128 v30;
  _OWORD v31[28];
  __int128 v32;
  __int128 v33;

  v6 = a3;
  if (a1[3])
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CD5A38], "begin");
      objc_msgSend(MEMORY[0x1E0CD5A38], "setAnimationDuration:", 0.05);
      v7 = (void *)MEMORY[0x1E0CD5A38];
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAnimationTimingFunction:", v8);

    }
    v9 = AVTGetNeutralZ();
    v10.i64[0] = 0;
    v10.i64[1] = LODWORD(v9);
    v29 = vmulq_f32(vsubq_f32(v28, v10), (float32x4_t)xmmword_1DD26A090);
    v32 = 0u;
    v33 = 0u;
    memset(&v31[3], 0, 400);
    v31[0] = 0u;
    *(_QWORD *)&v31[0] = CACurrentMediaTime();
    v11 = v29;
    v11.i32[3] = 0;
    v31[1] = v11;
    v31[2] = v30;
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCC48]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CFCC78]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length") != 204)
    {
      avt_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[AVTAvatar updatePoseWithCVAFaceTrackingAnimationDictionary:neckPosition:neckOrientation:applySmoothing:].cold.1(v14, v15, v16);

    }
    if (objc_msgSend(v12, "length", *(_OWORD *)&v29) == 204)
    {
      v17 = (_OWORD *)objc_msgSend(objc_retainAutorelease(v12), "bytes");
      *(_OWORD *)((char *)&v31[3] + 4) = *v17;
      v18 = v17[3];
      v19 = v17[4];
      v20 = v17[2];
      *(_OWORD *)((char *)&v31[4] + 4) = v17[1];
      *(_OWORD *)((char *)&v31[7] + 4) = v19;
      *(_OWORD *)((char *)&v31[6] + 4) = v18;
      *(_OWORD *)((char *)&v31[5] + 4) = v20;
      v21 = v17[7];
      v22 = v17[8];
      v23 = v17[6];
      *(_OWORD *)((char *)&v31[8] + 4) = v17[5];
      *(_OWORD *)((char *)&v31[11] + 4) = v22;
      *(_OWORD *)((char *)&v31[10] + 4) = v21;
      *(_OWORD *)((char *)&v31[9] + 4) = v23;
      v25 = v17[10];
      v24 = v17[11];
      v26 = *(_OWORD *)((char *)v17 + 188);
      *(_OWORD *)((char *)&v31[12] + 4) = v17[9];
      v31[15] = v26;
      *(_OWORD *)((char *)&v31[14] + 4) = v24;
      *(_OWORD *)((char *)&v31[13] + 4) = v25;
    }
    objc_msgSend(v13, "floatValue");
    HIDWORD(v32) = v27;
    objc_msgSend(a1, "_applyBlendShapesWithTrackingData:", v31);
    objc_msgSend(a1, "_applyHeadPoseWithTrackingData:gazeCorrection:pointOfView:", v31, 1, 0);
    if (a4)
      objc_msgSend(MEMORY[0x1E0CD5A38], "commit");

  }
}

- (void)_applyBlendShapes:(const float *)a3 parameters:(const float *)a4
{
  $F418A78870F13856FCD92A25B67E8546 *morphInfoFromARKitBlendShapeIndex;
  int64_t var2;
  float v8;
  id var0;
  float v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  uint64_t i;
  $F418A78870F13856FCD92A25B67E8546 *v16;
  int64_t v17;
  float v18;
  id v19;
  float v20;
  float v21;
  void *v22;
  float v23;
  uint64_t v24;
  unint64_t v25;

  if (self->_headNode)
  {
    morphInfoFromARKitBlendShapeIndex = self->_morphInfoFromARKitBlendShapeIndex;
    var2 = morphInfoFromARKitBlendShapeIndex[51].var2;
    v8 = -1.0;
    if (var2 != 0x7FFFFFFFFFFFFFFFLL && *a4 != -1.0)
    {
      var0 = morphInfoFromARKitBlendShapeIndex[51].var0;
      v10 = 0.0;
      if (morphInfoFromARKitBlendShapeIndex[51].var3)
      {
        v11 = (void *)*MEMORY[0x1E0C894D8];
        v10 = fmaxf(fminf(*a4, 1.0), 0.0);
        AVTBlendShapeLocationFromARIndex(51);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 == v11)
        {
          objc_msgSend(var0, "weightForTargetAtIndex:", var2);
          *(float *)&v13 = v13;
          v10 = *(float *)&v13 + (float)((float)(v10 - *(float *)&v13) * 0.3);
          v8 = v10;
        }
      }
      objc_msgSend(var0, "setWeight:forTargetAtIndex:", var2, v10);
    }
    v14 = 0;
    for (i = 0; i != 51; ++i)
    {
      v16 = &self->_morphInfoFromARKitBlendShapeIndex[v14];
      v17 = v16->var2;
      if (v17 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v18 = a3[i];
        if (v18 != -1.0)
        {
          v19 = v16->var0;
          v20 = 0.0;
          if (v16->var3)
          {
            v21 = fmaxf(fminf(v18, 1.0), 0.0);
            AVTBlendShapeLocationFromARIndex(i);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = AVTMorphWeightApplyCorrectionForTongue(v22, v21, v8);
            v20 = AVTMorphWeightApplyBlinkCorrection(v22, v23);

          }
          objc_msgSend(v19, "setWeight:forTargetAtIndex:", v17, v20);
        }
      }
      ++v14;
    }
    if (self->_friendlyPoseMorphInfoCount)
    {
      v24 = 0;
      v25 = 0;
      do
      {
        objc_msgSend(self->_friendlyPoseMorphInfos[v24].var0, "setWeight:forTargetAtIndex:", self->_friendlyPoseMorphInfos[v24].var2, 0.0);
        ++v25;
        ++v24;
      }
      while (v25 < self->_friendlyPoseMorphInfoCount);
    }
    else
    {
      self->_friendlyPoseMorphInfoProxy.morphWeight = 0.0;
    }
  }
}

- (void)_applyBlendShapesWithTrackingData:(id *)a3
{
  if (a3)
    -[AVTAvatar _applyBlendShapes:parameters:](self, "_applyBlendShapes:parameters:", &a3->var2[10], &a3[1].var2[4]);
}

- (void)_applyHeadPoseWithTrackingData:(id *)a3 gazeCorrection:(BOOL)a4 pointOfView:(id)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  float32x4_t v10;
  __int128 v11;
  __int128 v12;
  float32x4_t v13;
  float32x4_t v14;
  float32x4_t v15;
  float v16;
  float32x2_t v17;
  float32x2_t v18;
  __int128 v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  float32x4_t v23;
  float32x4_t v24;
  uint64_t v25;
  int32x4_t v26;
  float32x2_t v27;
  float32x2_t v28;
  float32x4_t v29;
  int32x4_t v30;
  float32x2_t v31;
  float32x2_t v32;
  float32x4_t v33;
  int32x4_t v34;
  float32x2_t v35;
  float32x2_t v36;
  float32x4_t v37;
  float v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  double v42;
  SCNNode *neckNode;
  NSObject *v44;
  float32x4_t v46;
  float32x4_t v47;
  int32x4_t v48;
  float32_t v49;
  float32x4_t v50;
  float32x4_t v51;
  float32x4_t v52;
  double v53;
  float32x4_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  float32x4_t v59;
  _OWORD v60[4];
  float32x4_t v61;
  float32x4_t v62;
  float32x4_t v63;
  float32x4_t v64;

  v5 = a4;
  v8 = a5;
  v9 = v8;
  if (!a3)
    goto LABEL_29;
  v10 = *(float32x4_t *)&a3->var2[5];
  if (LOBYTE(a3->var2[9]))
  {
    if (v8)
    {
      v11 = *MEMORY[0x1E0C83FF0];
      v12 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 16);
      v13 = vmulq_f32(v10, v10);
      v14 = vaddq_f32(v13, v13);
      v15 = vmulq_laneq_f32(v10, v10, 3);
      v16 = vmulq_lane_f32(v10, *(float32x2_t *)v10.f32, 1).f32[0];
      *(float *)&v11 = (float)(1.0 - v14.f32[1]) - v14.f32[2];
      *((float *)&v11 + 1) = (float)(v16 + v15.f32[2]) + (float)(v16 + v15.f32[2]);
      *(float *)&v12 = (float)(v16 - v15.f32[2]) + (float)(v16 - v15.f32[2]);
      v14.f32[0] = 1.0 - v14.f32[0];
      *((float *)&v12 + 1) = v14.f32[0] - v14.f32[2];
      v17 = vmul_laneq_f32(*(float32x2_t *)v10.f32, v10, 2);
      *((float *)&v11 + 2) = (float)(v17.f32[0] - v15.f32[1]) + (float)(v17.f32[0] - v15.f32[1]);
      *((float *)&v12 + 2) = (float)(v17.f32[1] + v15.f32[0]) + (float)(v17.f32[1] + v15.f32[0]);
      v56 = v12;
      v58 = v11;
      *(int32x2_t *)v15.f32 = vrev64_s32(*(int32x2_t *)v15.f32);
      v18.i32[0] = vadd_f32(v17, *(float32x2_t *)v15.f32).u32[0];
      v18.i32[1] = vsub_f32(v17, *(float32x2_t *)&v15).i32[1];
      *(float32x2_t *)&v19 = vadd_f32(v18, v18);
      HIDWORD(v19) = HIDWORD(*(_QWORD *)(MEMORY[0x1E0C83FF0] + 40));
      *((float *)&v19 + 2) = v14.f32[0] - v14.f32[1];
      v20 = vaddq_f32(*(float32x4_t *)&a3->var2[1], *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 48));
      v20.i32[3] = HIDWORD(*(_OWORD *)(MEMORY[0x1E0C83FF0] + 48));
      v54 = v20;
      v55 = v19;
      objc_msgSend(v8, "simdWorldTransform");
      v25 = 0;
      v60[0] = v58;
      v60[1] = v56;
      v60[2] = v55;
      v60[3] = v54;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      do
      {
        *(float32x4_t *)((char *)&v61 + v25 * 16) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(v60[v25])), v22, *(float32x2_t *)&v60[v25], 1), v23, (float32x4_t)v60[v25], 2), v24, (float32x4_t)v60[v25], 3);
        ++v25;
      }
      while (v25 != 4);
      v26 = (int32x4_t)vmulq_f32(v61, v61);
      v26.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v26, 2), vadd_f32(*(float32x2_t *)v26.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v26.i8, 1))).u32[0];
      v27 = vrsqrte_f32((float32x2_t)v26.u32[0]);
      v28 = vmul_f32(v27, vrsqrts_f32((float32x2_t)v26.u32[0], vmul_f32(v27, v27)));
      v29 = vmulq_n_f32(v61, vmul_f32(v28, vrsqrts_f32((float32x2_t)v26.u32[0], vmul_f32(v28, v28))).f32[0]);
      v30 = (int32x4_t)vmulq_f32(v62, v62);
      v30.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v30, 2), vadd_f32(*(float32x2_t *)v30.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v30.i8, 1))).u32[0];
      v31 = vrsqrte_f32((float32x2_t)v30.u32[0]);
      v32 = vmul_f32(v31, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(v31, v31)));
      v33 = vmulq_n_f32(v62, vmul_f32(v32, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(v32, v32))).f32[0]);
      v34 = (int32x4_t)vmulq_f32(v63, v63);
      v34.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v34, 2), vadd_f32(*(float32x2_t *)v34.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v34.i8, 1))).u32[0];
      v35 = vrsqrte_f32((float32x2_t)v34.u32[0]);
      v36 = vmul_f32(v35, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v35, v35)));
      v37 = vmulq_n_f32(v63, vmul_f32(v36, vrsqrts_f32((float32x2_t)v34.u32[0], vmul_f32(v36, v36))).f32[0]);
      v38 = (float)(v29.f32[0] + v33.f32[1]) + v37.f32[2];
      if (v38 <= 0.0)
      {
        if (v29.f32[0] <= v33.f32[1] || v29.f32[0] <= v37.f32[2])
        {
          if (v33.f32[1] <= v37.f32[2])
          {
            v51.i64[0] = v37.i64[0];
            v51.f32[2] = (float)(v37.f32[2] + 1.0) - v29.f32[0];
            v51.i32[3] = v29.i32[1];
            v41 = (float32x4_t)vrev64q_s32((int32x4_t)vextq_s8((int8x16_t)vtrn1q_s32((int32x4_t)v33, (int32x4_t)v29), (int8x16_t)v33, 8uLL));
            v40.i64[0] = vaddq_f32(v37, v41).u64[0];
            v40.i64[1] = vsubq_f32(v51, v41).i64[1];
            v41.i32[0] = v40.i32[2];
          }
          else
          {
            v46 = v33;
            v46.f32[1] = (float)(v33.f32[1] + 1.0) - v29.f32[0];
            v46.i32[3] = v37.i32[0];
            v47 = (float32x4_t)vzip2q_s32(vzip1q_s32((int32x4_t)v29, (int32x4_t)v37), vtrn1q_s32((int32x4_t)v37, (int32x4_t)v29));
            v48 = (int32x4_t)vaddq_f32(v33, v47);
            v41 = vsubq_f32(v46, v47);
            v40 = (float32x4_t)vtrn2q_s32(vrev64q_s32(v48), (int32x4_t)v41);
            v41.i32[0] = v41.i32[1];
          }
        }
        else
        {
          v49 = (float)(v29.f32[0] + 1.0) - v33.f32[1];
          v50 = (float32x4_t)vextq_s8((int8x16_t)v33, (int8x16_t)vtrn1q_s32((int32x4_t)v33, (int32x4_t)v37), 0xCuLL);
          v40 = vaddq_f32(v50, v29);
          v50.f32[0] = v49;
          v29.i32[0] = v37.i32[2];
          v29.i32[3] = v37.i32[1];
          v41 = vsubq_f32(v50, v29);
          v40.i32[0] = v41.i32[0];
          v40.i32[3] = v41.i32[3];
        }
      }
      else
      {
        v39 = (float32x4_t)vzip2q_s32((int32x4_t)v33, vuzp1q_s32((int32x4_t)v33, (int32x4_t)v37));
        v39.i32[2] = v29.i32[1];
        v41 = (float32x4_t)vtrn2q_s32((int32x4_t)v37, vzip2q_s32((int32x4_t)v37, (int32x4_t)v29));
        v41.i32[2] = v33.i32[0];
        v40 = vsubq_f32(v39, v41);
        v41.i32[3] = 1.0;
        v39.f32[3] = v38;
        v40.i32[3] = vaddq_f32(v39, v41).i32[3];
        v41.i32[0] = v40.i32[3];
      }
      *(_QWORD *)&v57 = vmulq_n_f32(v40, 0.5 / sqrtf(v41.f32[0])).u64[0];
      v59 = v64;
    }
    else
    {
      v57 = *(_OWORD *)&a3->var2[5];
      v59 = *(float32x4_t *)&a3->var2[1];
      if ((_applyHeadPoseWithTrackingData_gazeCorrection_pointOfView__done & 1) == 0)
      {
        _applyHeadPoseWithTrackingData_gazeCorrection_pointOfView__done = 1;
        avt_default_log();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          -[AVTAvatar _applyHeadPoseWithTrackingData:gazeCorrection:pointOfView:].cold.1();

      }
    }
    -[AVTPhysicsController setupPhysicsIfNeeded](self->_physicsController, "setupPhysicsIfNeeded");
    goto LABEL_24;
  }
  v57 = *(_OWORD *)&a3->var2[5];
  v59 = *(float32x4_t *)&a3->var2[1];
  -[AVTPhysicsController setupPhysicsIfNeeded](self->_physicsController, "setupPhysicsIfNeeded");
  if (!v5)
  {
LABEL_24:
    neckNode = self->_neckNode;
    v42 = *(double *)&v57;
    goto LABEL_25;
  }
  +[AVTAvatar applyGazeCorrectionWithInputAngle:translation:](AVTAnimoji, "applyGazeCorrectionWithInputAngle:translation:", *(double *)&v57, *(double *)v59.i64);
  neckNode = self->_neckNode;
LABEL_25:
  -[SCNNode setSimdOrientation:](neckNode, "setSimdOrientation:", v42);
  if (LOBYTE(a3->var2[9]))
  {
    -[SCNNode simdConvertPosition:toNode:](self->_neckNode, "simdConvertPosition:toNode:", self->_rootJointNode, *(double *)self->_arOffset);
    *(_QWORD *)&v53 = vsubq_f32(v59, v52).u64[0];
  }
  else
  {
    v53 = *(double *)v59.i64;
  }
  -[SCNNode setSimdPosition:](self->_rootJointNode, "setSimdPosition:", v53);
LABEL_29:

}

- (void)applyBlendShapesWithTrackingInfo:(id)a3
{
  if (a3)
    -[AVTAvatar _applyBlendShapesWithTrackingData:](self, "_applyBlendShapesWithTrackingData:", objc_msgSend(a3, "trackingData"));
}

- (void)applyHeadPoseWithTrackingInfo:(id)a3
{
  -[AVTAvatar applyHeadPoseWithTrackingInfo:gazeCorrection:pointOfView:](self, "applyHeadPoseWithTrackingInfo:gazeCorrection:pointOfView:", a3, 1, 0);
}

- (void)applyHeadPoseWithTrackingInfo:(id)a3 gazeCorrection:(BOOL)a4
{
  -[AVTAvatar applyHeadPoseWithTrackingInfo:gazeCorrection:pointOfView:](self, "applyHeadPoseWithTrackingInfo:gazeCorrection:pointOfView:", a3, a4, 0);
}

- (void)applyHeadPoseWithTrackingInfo:(id)a3 gazeCorrection:(BOOL)a4 pointOfView:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint8_t v12[16];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (v8)
  {
    -[SCNNode scene](self->_avatarNode, "scene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[AVTAvatar _applyHeadPoseWithTrackingData:gazeCorrection:pointOfView:](self, "_applyHeadPoseWithTrackingData:gazeCorrection:pointOfView:", objc_msgSend(v8, "trackingData"), v6, v9);
    }
    else
    {
      avt_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1DD1FA000, v11, OS_LOG_TYPE_DEFAULT, "applyHeadPoseWithTrackingInfo - avatar has not been assigned to a scene yet, ignoring", v12, 2u);
      }

    }
  }

}

- ($F418A78870F13856FCD92A25B67E8546)morphInfoForARKitBlendShapeIndex:(SEL)a3
{
  _OWORD *v4;
  __int128 v5;

  v4 = (char *)self[2].var0 + 32 * a4;
  v5 = v4[1];
  *(_OWORD *)&retstr->var0 = *v4;
  *(_OWORD *)&retstr->var2 = v5;
  return self;
}

- (id)blendShapeNameForARKitBlendShapeIndex:(unint64_t)a3
{
  -[AVTAvatar morphInfoForARKitBlendShapeIndex:](self, "morphInfoForARKitBlendShapeIndex:", 0, 0);
  AVTBlendShapeLocationFromARIndex(a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)blendShapeIndexForARKitBlendShapeName:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  int v7;

  v4 = a3;
  v5 = 0;
  while (1)
  {
    -[AVTAvatar blendShapeNameForARKitBlendShapeIndex:](self, "blendShapeNameForARKitBlendShapeIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", v4);

    if (v7)
      break;
    if (++v5 == 52)
    {
      v5 = 0x7FFFFFFFFFFFFFFFLL;
      break;
    }
  }

  return v5;
}

- (void)enumerateMorphInfoForCustomBlendShapeName:(id)a3 usingBlock:(id)a4
{
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  $F418A78870F13856FCD92A25B67E8546 *v9;
  __int128 v10;
  void (*v11)(_QWORD *, _OWORD *);
  _OWORD v12[2];
  __int128 v13;
  __int128 v14;

  v6 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Emoji")) && self->_friendlyPoseMorphInfoCount)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = &self->_friendlyPoseMorphInfos[v7];
      v10 = *(_OWORD *)&v9->var2;
      v13 = *(_OWORD *)&v9->var0;
      v14 = v10;
      v11 = (void (*)(_QWORD *, _OWORD *))v6[2];
      v12[0] = v13;
      v12[1] = v10;
      v11(v6, v12);
      ++v8;
      ++v7;
    }
    while (v8 < self->_friendlyPoseMorphInfoCount);
  }

}

+ (double)applyGazeCorrectionWithInputAngle:(int32x4_t)a1 translation:(__n128)a2
{
  float v2;
  float v3;
  float v4;
  __float2 v5;
  float32x2_t v6;
  float32x2_t v7;
  int32x4_t v8;
  float32x4_t v9;
  int32x4_t v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  float v14;
  __float2 v15;
  int32x4_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t v22;
  double result;
  float v24;
  float32x4_t v26;
  unint64_t v27;

  v27 = a2.n128_u64[0];
  v2 = a2.n128_f32[2] + AVTGetNeutralZ() * 100.0;
  v3 = *((float *)&v27 + 1) / 0.2;
  v4 = atanf(v3 / v2) + 0.104719755;
  v5 = __sincosf_stret(v4 * 0.5);
  v6 = vrsqrte_f32((float32x2_t)1065353216);
  v7 = vmul_f32(v6, vrsqrts_f32((float32x2_t)1065353216, vmul_f32(v6, v6)));
  LODWORD(v24) = vmul_f32(v7, vrsqrts_f32((float32x2_t)1065353216, vmul_f32(v7, v7))).u32[0];
  v8 = (int32x4_t)vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_1DD26A060, v24), v5.__sinval);
  v9 = (float32x4_t)v8;
  v9.i32[3] = v8.i32[0];
  v10 = a1;
  v11 = (float32x4_t)vzip1q_s32(v10, v10);
  v11.i32[0] = a1.i32[2];
  v12 = vmlaq_f32(vmlaq_n_f32(vmulq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32(a1, 3), (int8x16_t)a1, 4uLL), v9), (float32x4_t)xmmword_1DD26A420), (float32x4_t)a1, v5.__cosval), (float32x4_t)xmmword_1DD26A420, vmulq_f32(v11, (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v8, (int8x16_t)v8, 0xCuLL), (int8x16_t)v8, 8uLL)));
  v13 = (float32x4_t)vuzp1q_s32(v10, v10);
  v13.i32[0] = a1.i32[1];
  v26 = vmlsq_f32(v12, v13, (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32(v8, v8), (int8x16_t)v8, 0xCuLL));
  v14 = atanf((float)(*(float *)&v27 + *(float *)&v27) / v2);
  v15 = __sincosf_stret(v14 * -0.5);
  v16 = (int32x4_t)v26;
  v17 = vmulq_n_f32(vmulq_n_f32((float32x4_t)xmmword_1DD26A070, v24), v15.__sinval);
  v18 = (float32x4_t)vextq_s8(vextq_s8((int8x16_t)v17, (int8x16_t)v17, 0xCuLL), (int8x16_t)v17, 8uLL);
  v19 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v17, (int32x4_t)v17), (int8x16_t)v17, 0xCuLL);
  v17.i32[3] = v17.i32[0];
  v20 = (float32x4_t)vzip1q_s32(v16, v16);
  v20.i32[0] = v26.i32[2];
  v21 = vmlaq_f32(vmlaq_n_f32(vmulq_f32(vmulq_f32(v17, (float32x4_t)vextq_s8((int8x16_t)vdupq_laneq_s32((int32x4_t)v26, 3), (int8x16_t)v26, 4uLL)), (float32x4_t)xmmword_1DD26A420), v26, v15.__cosval), (float32x4_t)xmmword_1DD26A420, vmulq_f32(v18, v20));
  v22 = (float32x4_t)vuzp1q_s32(v16, v16);
  v22.i32[0] = v26.i32[1];
  *(_QWORD *)&result = vmlsq_f32(v21, v22, v19).u64[0];
  return result;
}

- (void)_resetFaceToRandomPosition
{
  void *v3;
  void *v4;
  int v5;
  double v11;
  double v12;
  _QWORD v13[5];

  -[SCNNode morpher](self->_headNode, "morpher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __39__AVTAvatar__resetFaceToRandomPosition__block_invoke;
  v13[3] = &unk_1EA61F4A8;
  v13[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v13);

  LODWORD(v3) = rand();
  v5 = rand();
  __asm { FMOV            V1.2D, #-0.5 }
  v11 = COERCE_DOUBLE(vcvt_f32_f64(vmulq_f64(vaddq_f64(vcvtq_f64_f32(vmul_f32(vcvt_f32_s32((int32x2_t)__PAIR64__(v5, v3)), (float32x2_t)0x3000000030000000)), _Q1), (float64x2_t)xmmword_1DD26A430)));
  rand();
  -[SCNNode setSimdPosition:](self->_rootJointNode, "setSimdPosition:", v11);
  LODWORD(v3) = rand();
  v12 = COERCE_DOUBLE(vadd_f32(vmul_f32(vcvt_f32_s32((int32x2_t)__PAIR64__(rand(), v3)), (float32x2_t)0x3000000030000000), (float32x2_t)0xBF000000BF000000));
  rand();
  -[SCNNode setSimdEulerAngles:](self->_rootJointNode, "setSimdEulerAngles:", v12);
}

void __39__AVTAvatar__resetFaceToRandomPosition__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  int v6;
  id v7;

  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = AVTMorphTargetNameDefinesPose(v5);

  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "morpher");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWeight:forTargetAtIndex:", a3, (float)((float)rand() * 4.6566e-10));

  }
}

- (id)pose
{
  AVTAvatarPose *v3;
  AVTAvatarPose *v4;
  void *v5;
  uint64_t isKindOfClass;
  void *v7;
  uint64_t v8;
  uint64_t i;
  $F418A78870F13856FCD92A25B67E8546 *morphInfoFromARKitBlendShapeIndex;
  id var1;
  void *v12;
  void *v13;
  void *v14;
  float v15;
  unint64_t friendlyPoseMorphInfoCount;
  uint64_t v17;
  unint64_t j;
  $F418A78870F13856FCD92A25B67E8546 *v19;
  id v20;
  void *v21;
  void *v22;
  float v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t k;
  $F418A78870F13856FCD92A25B67E8546 *v27;
  double v28;
  double v29;
  void *v30;
  double morphWeight;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;

  v3 = objc_alloc_init(AVTAvatarPose);
  if (!self->_morphInfoFromARKitBlendShapeIndex)
    -[AVTAvatar pose].cold.1();
  v4 = v3;
  -[SCNNode animationForKey:](self->_rootJointNode, "animationForKey:", CFSTR("kAVTTransitionAnimation-posePosition"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
      goto LABEL_6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "toValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
LABEL_6:
        v8 = 0;
        for (i = 0; i != 52; ++i)
        {
          morphInfoFromARKitBlendShapeIndex = self->_morphInfoFromARKitBlendShapeIndex;
          if (morphInfoFromARKitBlendShapeIndex[v8].var3
            && morphInfoFromARKitBlendShapeIndex[v8].var2 != 0x7FFFFFFFFFFFFFFFLL)
          {
            var1 = morphInfoFromARKitBlendShapeIndex[v8].var1;
            -[AVTAvatar blendShapeNameForARKitBlendShapeIndex:](self, "blendShapeNameForARKitBlendShapeIndex:", i);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(CFSTR("kAVTTransitionAnimation-"), "stringByAppendingString:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            __17__AVTAvatar_pose__block_invoke((uint64_t)v13, var1);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "floatValue");
            -[AVTAvatarPose setWeight:forBlendShapeNamed:](v4, "setWeight:forBlendShapeNamed:", v12, v15);

          }
          ++v8;
        }
        friendlyPoseMorphInfoCount = self->_friendlyPoseMorphInfoCount;
        if (friendlyPoseMorphInfoCount)
        {
          v17 = 0;
          for (j = 0; j < friendlyPoseMorphInfoCount; ++j)
          {
            v19 = &self->_friendlyPoseMorphInfos[v17];
            if (v19->var3)
            {
              v20 = v19->var1;
              objc_msgSend(CFSTR("kAVTTransitionAnimation-"), "stringByAppendingString:", CFSTR("Emoji"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              __17__AVTAvatar_pose__block_invoke((uint64_t)v21, v20);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "floatValue");
              -[AVTAvatarPose setWeight:forBlendShapeNamed:](v4, "setWeight:forBlendShapeNamed:", CFSTR("Emoji"), v23);

              friendlyPoseMorphInfoCount = self->_friendlyPoseMorphInfoCount;
            }
            ++v17;
          }
        }
        else if (self->_friendlyPoseMorphInfoProxy.isEnabled)
        {
          isKindOfClass = -[AVTAvatarPose setWeight:forBlendShapeNamed:](v4, "setWeight:forBlendShapeNamed:", CFSTR("Emoji"), self->_friendlyPoseMorphInfoProxy.morphWeight);
        }
        __17__AVTAvatar_pose__block_invoke(isKindOfClass, self->_rootJointNode);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "avt_float3Value");
        -[AVTAvatarPose setNeckPosition:](v4, "setNeckPosition:");

        __17__AVTAvatar_pose__block_invoke(v35, self->_neckNode);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "avt_float4Value");
        goto LABEL_31;
      }
    }
    else
    {
      avt_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[AVTAvatar pose].cold.2((uint64_t)v5, v24);

    }
  }
  v25 = 0;
  for (k = 0; k != 52; ++k)
  {
    v27 = self->_morphInfoFromARKitBlendShapeIndex;
    if (v27[v25].var2 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v27[v25].var0, "weightForTargetAtIndex:");
      v29 = v28;
      -[AVTAvatar blendShapeNameForARKitBlendShapeIndex:](self, "blendShapeNameForARKitBlendShapeIndex:", k);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTAvatarPose setWeight:forBlendShapeNamed:](v4, "setWeight:forBlendShapeNamed:", v30, v29);

    }
    ++v25;
  }
  if (self->_friendlyPoseMorphInfoCount)
    objc_msgSend(self->_friendlyPoseMorphInfos->var0, "weightForTargetAtIndex:", self->_friendlyPoseMorphInfos->var2);
  else
    morphWeight = self->_friendlyPoseMorphInfoProxy.morphWeight;
  -[AVTAvatarPose setWeight:forBlendShapeNamed:](v4, "setWeight:forBlendShapeNamed:", CFSTR("Emoji"), morphWeight);
  -[SCNNode presentationNode](self->_rootJointNode, "presentationNode");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "simdPosition");
  -[AVTAvatarPose setNeckPosition:](v4, "setNeckPosition:");

  -[SCNNode presentationNode](self->_neckNode, "presentationNode");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "simdOrientation");
LABEL_31:
  -[AVTAvatarPose setNeckOrientation:](v4, "setNeckOrientation:");

  -[AVTAvatarPose setBakedAnimationBlendFactor:](v4, "setBakedAnimationBlendFactor:", 1.0);
  return v4;
}

id __17__AVTAvatar_pose__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  objc_msgSend(a2, "animationForKey:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "values");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v2, "toValue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      avt_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[AVTAvatar pose].cold.2((uint64_t)v2, v5);

      v4 = 0;
    }
  }

  return v4;
}

- (void)setPose:(id)a3
{
  uint64_t v4;
  uint64_t i;
  $F418A78870F13856FCD92A25B67E8546 *v6;
  int64_t var2;
  id var0;
  BOOL var3;
  void *v10;
  double v11;
  uint64_t v12;
  unint64_t v13;
  $F418A78870F13856FCD92A25B67E8546 *v14;
  id v15;
  int64_t v16;
  double v17;
  double v18;
  float v19;
  double v20;
  double v21;
  void *v22;
  id v23;

  v23 = a3;
  if (self->_morphInfoFromARKitBlendShapeIndex)
  {
    v4 = 0;
    for (i = 0; i != 52; ++i)
    {
      v6 = &self->_morphInfoFromARKitBlendShapeIndex[v4];
      var2 = v6->var2;
      if (var2 != 0x7FFFFFFFFFFFFFFFLL)
      {
        var0 = v6->var0;
        var3 = v6->var3;
        -[AVTAvatar blendShapeNameForARKitBlendShapeIndex:](self, "blendShapeNameForARKitBlendShapeIndex:", i);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 0.0;
        if (var3)
          objc_msgSend(v23, "weightForBlendShapeNamed:", v10, 0.0);
        objc_msgSend(var0, "setWeight:forTargetAtIndex:", var2, v11);

      }
      ++v4;
    }
    if (self->_friendlyPoseMorphInfoCount)
    {
      v12 = 0;
      v13 = 0;
      do
      {
        v14 = &self->_friendlyPoseMorphInfos[v12];
        v15 = v14->var0;
        v16 = v14->var2;
        v17 = 0.0;
        if (v14->var3)
          objc_msgSend(v23, "weightForBlendShapeNamed:", CFSTR("Emoji"), 0.0);
        objc_msgSend(v15, "setWeight:forTargetAtIndex:", v16, v17);
        ++v13;
        ++v12;
      }
      while (v13 < self->_friendlyPoseMorphInfoCount);
    }
    else
    {
      if (self->_friendlyPoseMorphInfoProxy.isEnabled)
      {
        objc_msgSend(v23, "weightForBlendShapeNamed:", CFSTR("Emoji"));
        v19 = v18;
      }
      else
      {
        v19 = 0.0;
      }
      self->_friendlyPoseMorphInfoProxy.morphWeight = v19;
    }
    -[AVTPhysicsController setupPhysicsIfNeeded](self->_physicsController, "setupPhysicsIfNeeded");
    if (v23)
    {
      objc_msgSend(v23, "neckPosition");
      -[SCNNode setSimdPosition:](self->_rootJointNode, "setSimdPosition:");
      objc_msgSend(v23, "neckOrientation");
      -[SCNNode setSimdOrientation:](self->_neckNode, "setSimdOrientation:");
      objc_msgSend(v23, "bakedAnimationBlendFactor");
      v21 = v20;
    }
    else
    {
      -[SCNNode setSimdPosition:](self->_rootJointNode, "setSimdPosition:", 0.0);
      -[SCNNode setSimdOrientation:](self->_neckNode, "setSimdOrientation:", *(double *)&_PromotedConst);
      v21 = 1.0;
    }
    -[AVTAvatar bakedAnimationPlayer](self, "bakedAnimationPlayer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setBlendFactor:", v21);

  }
}

- (id)debugPoseJSONRepresentation
{
  id v3;
  SCNNode *avatarNode;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(id *, void *, uint64_t);
  void *v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  avatarNode = self->_avatarNode;
  v5 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __40__AVTAvatar_debugPoseJSONRepresentation__block_invoke;
  v23[3] = &unk_1EA61D7A8;
  v6 = v3;
  v24 = v6;
  -[SCNNode enumerateHierarchyUsingBlock:](avatarNode, "enumerateHierarchyUsingBlock:", v23);
  v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v7, "appendString:", CFSTR("{\n"));
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingSelector:", sel_compare_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v5;
  v17 = 3221225472;
  v18 = __40__AVTAvatar_debugPoseJSONRepresentation__block_invoke_3;
  v19 = &unk_1EA61E850;
  v10 = v7;
  v20 = v10;
  v21 = v6;
  v22 = v9;
  v11 = v9;
  v12 = v6;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", &v16);
  objc_msgSend(v10, "appendString:", CFSTR("}"), v16, v17, v18, v19);
  v13 = v22;
  v14 = v10;

  return v14;
}

void __40__AVTAvatar_debugPoseJSONRepresentation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(v3, "presentationNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "morpher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "targets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__AVTAvatar_debugPoseJSONRepresentation__block_invoke_2;
  v9[3] = &unk_1EA61D7F8;
  v10 = v3;
  v11 = *(id *)(a1 + 32);
  v12 = v5;
  v7 = v5;
  v8 = v3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

}

void __40__AVTAvatar_debugPoseJSONRepresentation__block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  double v8;
  void *v9;
  id v10;

  objc_msgSend(a2, "name");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (AVTMorphTargetNameIsOfInterestForAnimator(v10))
  {
    objc_msgSend(a1[4], "geometry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[5], "objectForKeyedSubscript:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(a1[5], "setObject:forKeyedSubscript:", v7, v6);
    }
    objc_msgSend(a1[6], "weightForTargetAtIndex:", a3);
    *(float *)&v8 = v8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v10);

  }
}

void __40__AVTAvatar_debugPoseJSONRepresentation__block_invoke_3(id *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  const char *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v5 = a1[4];
  v6 = a2;
  objc_msgSend(v5, "appendFormat:", CFSTR("  \"%@\" : {\n"), v6);
  objc_msgSend(a1[5], "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingSelector:", sel_compare_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __40__AVTAvatar_debugPoseJSONRepresentation__block_invoke_4;
  v14[3] = &unk_1EA61E850;
  v15 = v7;
  v16 = a1[4];
  v17 = v9;
  v10 = v9;
  v13 = v7;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);
  v11 = a1[4];
  if (objc_msgSend(a1[6], "count") - 1 == a3)
    v12 = "";
  else
    v12 = ",";
  objc_msgSend(v11, "appendFormat:", CFSTR("  }%s\n"), v12);

}

void __40__AVTAvatar_debugPoseJSONRepresentation__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  float v7;
  float v8;
  double v9;
  void *v10;
  const char *v11;
  id v12;

  v5 = *(void **)(a1 + 32);
  v12 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  v9 = v8;
  v10 = *(void **)(a1 + 40);
  if (objc_msgSend(*(id *)(a1 + 48), "count") - 1 == a3)
    v11 = "";
  else
    v11 = ",";
  objc_msgSend(v10, "appendFormat:", CFSTR("    \"%@\" : %.3f%s\n"), v12, *(_QWORD *)&v9, v11);

}

- (BOOL)isTransitioning
{
  return self->_transitionCount > 0;
}

- (void)setPhysicsScaleFactor:(double)a3
{
  -[AVTAvatar removeDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:](self, "removeDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:", CFSTR("animatePhysicsOnAvatar"));
  self->_physicsScaleFactor = a3;
}

- (void)animatePhysicsScaleFactor:(double)a3 duration:(double)a4
{
  uint64_t v4;
  uint64_t v5;
  double physicsScaleFactor;
  _QWORD v7[9];

  if (a4 <= 0.0)
  {
    -[AVTAvatar setPhysicsScaleFactor:](self, "setPhysicsScaleFactor:", a3);
  }
  else
  {
    v7[7] = v4;
    v7[8] = v5;
    physicsScaleFactor = self->_physicsScaleFactor;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __48__AVTAvatar_animatePhysicsScaleFactor_duration___block_invoke;
    v7[3] = &__block_descriptor_56_e52_v48__0__AVTAvatar_8d16d24___SCNSceneRenderer__32_B40l;
    *(double *)&v7[4] = a4;
    *(double *)&v7[5] = physicsScaleFactor;
    *(double *)&v7[6] = a3;
    -[AVTAvatar addDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:block:](self, "addDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:block:", CFSTR("animatePhysicsOnAvatar"), v7);
  }
}

double *__48__AVTAvatar_animatePhysicsScaleFactor_duration___block_invoke(double *result, uint64_t a2, double a3, double a4, uint64_t a5, _BYTE *a6)
{
  float v6;
  float v7;

  v6 = (a3 - a4) / result[4];
  v7 = fmaxf(fminf(v6, 1.0), 0.0);
  *(double *)(a2 + 184) = result[5] + v7 * (result[6] - result[5]);
  if (v7 >= 1.0)
    *a6 = 1;
  return result;
}

- (void)transitionToPose:(id)a3 duration:(double)a4 delay:(double)a5 completionHandler:(id)a6
{
  id v10;
  double v11;
  id v12;

  v12 = a3;
  v10 = a6;
  if (v12)
    objc_msgSend(v12, "bakedAnimationBlendFactor");
  else
    v11 = 1.0;
  -[AVTAvatar _transitionFromPose:toPose:bakedAnimationBlendFactor:duration:delay:timingFunction:timingAnimation:completionHandler:](self, "_transitionFromPose:toPose:bakedAnimationBlendFactor:duration:delay:timingFunction:timingAnimation:completionHandler:", 0, v12, 0, 0, v10, v11, a4, a5);

}

- (void)transitionFromPose:(id)a3 duration:(double)a4 delay:(double)a5 completionHandler:(id)a6
{
  -[AVTAvatar _transitionFromPose:toPose:bakedAnimationBlendFactor:duration:delay:timingFunction:timingAnimation:completionHandler:](self, "_transitionFromPose:toPose:bakedAnimationBlendFactor:duration:delay:timingFunction:timingAnimation:completionHandler:", a3, 0, 0, 0, a6, 1.0, a4, a5);
}

- (void)transitionFromPose:(id)a3 toPose:(id)a4 duration:(double)a5 delay:(double)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  double v14;
  id v15;

  v15 = a3;
  v12 = a4;
  v13 = a7;
  if (v12)
    objc_msgSend(v12, "bakedAnimationBlendFactor");
  else
    v14 = 1.0;
  -[AVTAvatar _transitionFromPose:toPose:bakedAnimationBlendFactor:duration:delay:timingFunction:timingAnimation:completionHandler:](self, "_transitionFromPose:toPose:bakedAnimationBlendFactor:duration:delay:timingFunction:timingAnimation:completionHandler:", v15, v12, 0, 0, v13, v14, a5, a6);

}

- (void)transitionFromPose:(id)a3 toPose:(id)a4 duration:(double)a5 delay:(double)a6 timingFunction:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  double v17;
  id v18;

  v18 = a3;
  v14 = a4;
  v15 = a7;
  v16 = a8;
  if (v14)
    objc_msgSend(v14, "bakedAnimationBlendFactor");
  else
    v17 = 1.0;
  -[AVTAvatar _transitionFromPose:toPose:bakedAnimationBlendFactor:duration:delay:timingFunction:timingAnimation:completionHandler:](self, "_transitionFromPose:toPose:bakedAnimationBlendFactor:duration:delay:timingFunction:timingAnimation:completionHandler:", v18, v14, v15, 0, v16, v17, a5, a6);

}

- (void)transitionFromPose:(id)a3 toPose:(id)a4 duration:(double)a5 delay:(double)a6 timingAnimation:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  double v17;
  id v18;

  v18 = a3;
  v14 = a4;
  v15 = a7;
  v16 = a8;
  if (v14)
    objc_msgSend(v14, "bakedAnimationBlendFactor");
  else
    v17 = 1.0;
  -[AVTAvatar _transitionFromPose:toPose:bakedAnimationBlendFactor:duration:delay:timingFunction:timingAnimation:completionHandler:](self, "_transitionFromPose:toPose:bakedAnimationBlendFactor:duration:delay:timingFunction:timingAnimation:completionHandler:", v18, v14, 0, v15, v16, v17, a5, a6);

}

- (void)_transitionFromPose:(id)a3 toPose:(id)a4 bakedAnimationBlendFactor:(double)a5 duration:(double)a6 delay:(double)a7 timingFunction:(id)a8 timingAnimation:(id)a9 completionHandler:(id)a10
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  double v23;
  void *v24;
  id v25;
  NSObject *v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  $F418A78870F13856FCD92A25B67E8546 *v30;
  int64_t var2;
  id var1;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  $F418A78870F13856FCD92A25B67E8546 *v45;
  id v46;
  int64_t v47;
  BOOL var3;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  void *v56;
  double v57;
  float v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  float v74;
  id v75;
  id v76;
  void *v77;
  id *v78;
  void *v79;
  void *v80;
  _QWORD v81[5];
  _QWORD v82[2];
  void (*v83)(uint64_t, void *, void *, void *, void *, void *);
  void *v84;
  id v85;
  id v86;
  double v87;
  double v88;
  uint8_t buf[8];
  _QWORD v90[4];
  id v91;
  id v92;
  BOOL v93;
  id location[2];

  v18 = a3;
  v19 = a4;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = CACurrentMediaTime();
  ++self->_transitionCount;
  objc_initWeak(location, self);
  objc_msgSend(MEMORY[0x1E0CD5A38], "begin");
  objc_msgSend(MEMORY[0x1E0CD5A38], "setAnimationDuration:", 0.0);
  v24 = (void *)MEMORY[0x1E0CD5A38];
  v90[0] = MEMORY[0x1E0C809B0];
  v90[1] = 3221225472;
  v90[2] = __130__AVTAvatar__transitionFromPose_toPose_bakedAnimationBlendFactor_duration_delay_timingFunction_timingAnimation_completionHandler___block_invoke;
  v90[3] = &unk_1EA61F4F0;
  v78 = &v92;
  objc_copyWeak(&v92, location);
  v93 = v19 != 0;
  v25 = v22;
  v91 = v25;
  objc_msgSend(v24, "setCompletionBlock:", v90);
  v79 = v18;
  v77 = v25;
  if (!v19 && v21)
  {
    avt_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD1FA000, v26, OS_LOG_TYPE_DEFAULT, "Can't use a timing animation without a destination pose", buf, 2u);
    }

    v21 = 0;
  }
  v27 = v23 + a7;
  v82[0] = MEMORY[0x1E0C809B0];
  v82[1] = 3221225472;
  v83 = __130__AVTAvatar__transitionFromPose_toPose_bakedAnimationBlendFactor_duration_delay_timingFunction_timingAnimation_completionHandler___block_invoke_196;
  v84 = &unk_1EA61F518;
  v87 = a6;
  v76 = v21;
  v85 = v76;
  v88 = v27;
  v28 = 0;
  v29 = 0;
  v75 = v20;
  v86 = v75;
  v80 = v19;
  do
  {
    v30 = &self->_morphInfoFromARKitBlendShapeIndex[v28];
    if (v30->var3)
    {
      var2 = v30->var2;
      if (var2 != 0x7FFFFFFFFFFFFFFFLL)
      {
        var1 = v30->var1;
        -[AVTAvatar blendShapeNameForARKitBlendShapeIndex:](self, "blendShapeNameForARKitBlendShapeIndex:", v29);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("kAVTTransitionAnimation-"), "stringByAppendingString:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("morpher.weights[%d]"), var2, v75, v76, v77, v78);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v79)
        {
          v36 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v79, "weightForBlendShapeNamed:", v33);
          *(float *)&v37 = v37;
          objc_msgSend(v36, "numberWithFloat:", v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v19)
            goto LABEL_14;
        }
        else
        {
          v38 = 0;
          if (!v19)
          {
LABEL_14:
            v83((uint64_t)v82, var1, v35, v34, v38, v19);

            v19 = v80;
            goto LABEL_15;
          }
        }
        v39 = v19;
        v40 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v39, "weightForBlendShapeNamed:", v33);
        *(float *)&v41 = v41;
        objc_msgSend(v40, "numberWithFloat:", v41);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
LABEL_15:
    ++v29;
    ++v28;
  }
  while (v29 != 52);
  if (self->_friendlyPoseMorphInfoCount)
  {
    v42 = 0;
    v43 = 0;
    v44 = v79;
    while (1)
    {
      v45 = &self->_friendlyPoseMorphInfos[v42];
      v46 = v45->var1;
      v47 = v45->var2;
      var3 = v45->var3;
      objc_msgSend(CFSTR("kAVTTransitionAnimation-"), "stringByAppendingString:", CFSTR("Emoji"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("morpher.weights[%d]"), v47);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
      {
        v51 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v44, "weightForBlendShapeNamed:", CFSTR("Emoji"));
        *(float *)&v52 = v52;
        objc_msgSend(v51, "numberWithFloat:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v53 = 0;
      }
      if (!v80)
        break;
      v54 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v80, "weightForBlendShapeNamed:", CFSTR("Emoji"));
      *(float *)&v55 = v55;
      objc_msgSend(v54, "numberWithFloat:", v55);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if (!var3)
        goto LABEL_23;
LABEL_24:
      v83((uint64_t)v82, v46, v50, v49, v53, v56);

      ++v43;
      ++v42;
      v44 = v79;
      if (v43 >= self->_friendlyPoseMorphInfoCount)
        goto LABEL_33;
    }
    v56 = 0;
    if (var3)
      goto LABEL_24;
LABEL_23:

    v56 = &unk_1EA655B50;
    goto LABEL_24;
  }
  v44 = v79;
  if (self->_friendlyPoseMorphInfoProxy.isEnabled)
  {
    if (v80)
    {
      objc_msgSend(v80, "weightForBlendShapeNamed:", CFSTR("Emoji"));
      v58 = v57;
      goto LABEL_32;
    }
  }
  else
  {
    v58 = 0.0;
LABEL_32:
    self->_friendlyPoseMorphInfoProxy.morphWeight = v58;
  }
LABEL_33:
  if (v44)
  {
    v59 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v44, "neckPosition");
    objc_msgSend(v59, "avt_valueWithFloat3_usableWithKVCForSCNVector3:");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v60 = 0;
  }
  if (v80)
  {
    v61 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v80, "neckPosition");
    objc_msgSend(v61, "avt_valueWithFloat3_usableWithKVCForSCNVector3:");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v62 = 0;
  }
  v83((uint64_t)v82, self->_rootJointNode, CFSTR("position"), CFSTR("kAVTTransitionAnimation-posePosition"), v60, v62);

  if (v44)
  {
    v63 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v44, "neckOrientation");
    objc_msgSend(v63, "avt_valueWithFloat4_usableWithKVCForSCNVector4:");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    if (v80)
      goto LABEL_41;
LABEL_43:
    v66 = 0;
  }
  else
  {
    v64 = 0;
    if (!v80)
      goto LABEL_43;
LABEL_41:
    v65 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v80, "neckOrientation");
    objc_msgSend(v65, "avt_valueWithFloat4_usableWithKVCForSCNVector4:");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v83((uint64_t)v82, self->_neckNode, CFSTR("orientation"), CFSTR("kAVTTransitionAnimation-poseOrientation"), v64, v66);

  v81[0] = MEMORY[0x1E0C809B0];
  v81[1] = 3221225472;
  v81[2] = __130__AVTAvatar__transitionFromPose_toPose_bakedAnimationBlendFactor_duration_delay_timingFunction_timingAnimation_completionHandler___block_invoke_2;
  v81[3] = &__block_descriptor_40_e63_v40__0__CABasicAnimation_8__NSString_16___SCNAnimatable__24__32l;
  *(double *)&v81[4] = v27;
  -[AVTAvatar bakedAnimationPlayer](self, "bakedAnimationPlayer");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = v67;
  if (v67)
  {
    if (a6 <= 0.0)
    {
      objc_msgSend(v67, "removeAnimationForKey:", CFSTR("transition-blendFactor"));
      objc_msgSend(v68, "setBlendFactor:", a5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("blendFactor"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      __130__AVTAvatar__transitionFromPose_toPose_bakedAnimationBlendFactor_duration_delay_timingFunction_timingAnimation_completionHandler___block_invoke_2((uint64_t)v81, v69, (uint64_t)CFSTR("transition-blendFactor"), v68, (void (*)(void *, float))AVTInterpolateBasicAnimationFloat);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setToValue:", v70);

      objc_msgSend(v69, "setDuration:", a6);
      objc_msgSend(v69, "setBeginTime:", v27);
      objc_msgSend(v69, "setFillMode:", *MEMORY[0x1E0CD2B60]);
      objc_msgSend(v69, "setRemovedOnCompletion:", 0);
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3050]);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "setTimingFunction:", v71);

      objc_msgSend(v69, "fromValue");
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      if (v72)
      {
        objc_msgSend(v69, "fromValue");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "floatValue");
        objc_msgSend(v68, "setBlendFactor:", v74);

      }
      objc_msgSend(v68, "addAnimation:forKey:", v69, CFSTR("transition-blendFactor"));

      v44 = v79;
    }
  }
  objc_msgSend(MEMORY[0x1E0CD5A38], "commit");

  objc_destroyWeak(v78);
  objc_destroyWeak(location);

}

void __130__AVTAvatar__transitionFromPose_toPose_bakedAnimationBlendFactor_duration_delay_timingFunction_timingAnimation_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (!*(_BYTE *)(a1 + 48))
      --*((_DWORD *)WeakRetained + 28);
    v4 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      v5 = v3;
      (*(void (**)(void))(v4 + 16))();
      v3 = v5;
    }
  }

}

void __130__AVTAvatar__transitionFromPose_toPose_bakedAnimationBlendFactor_duration_delay_timingFunction_timingAnimation_completionHandler___block_invoke_196(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  double v25;
  float v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  float32x4_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  float32x4_t v38;
  float v39;
  void *v40;
  void *v41;
  float32x4_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t k;
  void *v48;
  float32x4_t v49;
  float v50;
  float v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  float v55;
  float32x4_t v56;
  int8x16_t v57;
  float32x4_t v58;
  int8x16_t v59;
  float v60;
  float v61;
  float v62;
  float v63;
  float v64;
  float v65;
  float v66;
  float v67;
  float v68;
  float32x2_t v69;
  float32x2_t v70;
  float v71;
  float32x4_t v72;
  int8x16_t v73;
  float32x2_t v74;
  double v75;
  unsigned __int32 v76;
  float32x2_t v77;
  float32x2_t v78;
  void *v79;
  float v80;
  float v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t m;
  void *v87;
  float v88;
  float v89;
  float v90;
  double v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  float v101;
  float v102;
  float32x4_t v103;
  float32x4_t v104;
  float32x4_t v105;
  float32x4_t v106;
  float32x4_t v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
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
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (*(double *)(a1 + 48) <= 0.0)
  {
    objc_msgSend(v11, "removeAnimationForKey:", v13);
    if (v15)
      objc_msgSend(v11, "setValue:forKeyPath:", v15, v12);
  }
  else
  {
    if (!v14)
    {
      objc_msgSend(v11, "presentationNode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "valueForKeyPath:", v12);
      v14 = (id)objc_claimAutoreleasedReturnValue();

    }
    v17 = *(void **)(a1 + 32);
    if (v17)
    {
      v99 = v14;
      v100 = v12;
      v97 = v13;
      v98 = v11;
      objc_msgSend(v17, "keyTimes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v18, "count"));
      v120 = 0u;
      v121 = 0u;
      v122 = 0u;
      v123 = 0u;
      v20 = v18;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v120, v127, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v121;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v121 != v23)
              objc_enumerationMutation(v20);
            v25 = *(double *)(a1 + 48);
            objc_msgSend(*(id *)(*((_QWORD *)&v120 + 1) + 8 * i), "floatValue");
            v27 = v25 * v26;
            *(float *)&v27 = v27;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObject:", v28);

          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v120, v127, 16);
        }
        while (v22);
      }
      v96 = v20;

      objc_msgSend(*(id *)(a1 + 32), "values");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v29, "count"));
      v95 = v29;
      if (objc_msgSend(v100, "isEqualToString:", CFSTR("position")))
      {
        objc_msgSend(v99, "avt_float3Value");
        v103 = v31;
        v116 = 0u;
        v117 = 0u;
        v118 = 0u;
        v119 = 0u;
        v32 = v29;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v116, v126, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v117;
          do
          {
            for (j = 0; j != v34; ++j)
            {
              if (*(_QWORD *)v117 != v35)
                objc_enumerationMutation(v32);
              v37 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * j);
              objc_msgSend(v15, "avt_float3Value", v95, v96);
              v106 = v38;
              objc_msgSend(v37, "floatValue");
              objc_msgSend(MEMORY[0x1E0CB3B18], "avt_valueWithFloat3_usableWithKVCForSCNVector3:", *(double *)vmlaq_n_f32(v103, vsubq_f32(v106, v103), v39).i64);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "addObject:", v40);

            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v116, v126, 16);
          }
          while (v34);
        }
      }
      else if (objc_msgSend(v100, "isEqualToString:", CFSTR("orientation")))
      {
        objc_msgSend(v99, "avt_float4Value");
        v107 = v42;
        v112 = 0u;
        v113 = 0u;
        v114 = 0u;
        v115 = 0u;
        v43 = v29;
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v112, v125, 16);
        if (v44)
        {
          v45 = v44;
          v46 = *(_QWORD *)v113;
          do
          {
            for (k = 0; k != v45; ++k)
            {
              if (*(_QWORD *)v113 != v46)
                objc_enumerationMutation(v43);
              v48 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * k);
              objc_msgSend(v15, "avt_float4Value", v95, v96);
              v104 = v49;
              objc_msgSend(v48, "floatValue");
              v51 = v50;
              v52 = vmulq_f32(v107, v104);
              v53 = (float32x4_t)vextq_s8((int8x16_t)v52, (int8x16_t)v52, 8uLL);
              *(float32x2_t *)v52.f32 = vadd_f32(*(float32x2_t *)v52.f32, *(float32x2_t *)v53.f32);
              v52.f32[0] = vaddv_f32(*(float32x2_t *)v52.f32);
              v53.i32[0] = 0;
              v54 = (float32x4_t)vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vmvnq_s8((int8x16_t)vcgeq_f32(v52, v53)), 0), (int8x16_t)vnegq_f32(v104), (int8x16_t)v104);
              v55 = 1.0;
              v56 = vsubq_f32(v107, v54);
              v57 = (int8x16_t)vmulq_f32(v56, v56);
              v105 = v54;
              v58 = vaddq_f32(v107, v54);
              v59 = (int8x16_t)vmulq_f32(v58, v58);
              v60 = atan2f(sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v57.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v57, v57, 8uLL)))), sqrtf(vaddv_f32(vadd_f32(*(float32x2_t *)v59.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v59, v59, 8uLL)))));
              v61 = v60 + v60;
              v62 = 1.0;
              if ((float)(v60 + v60) != 0.0)
                v62 = sinf(v60 + v60) / v61;
              v63 = (float)(1.0 - v51) * v61;
              if (v63 != 0.0)
              {
                v101 = v62;
                v64 = sinf((float)(1.0 - v51) * v61);
                v62 = v101;
                v55 = v64 / v63;
              }
              v65 = v51 * v61;
              v66 = 1.0;
              if (v65 != 0.0)
              {
                v102 = v62;
                v67 = sinf(v65);
                v62 = v102;
                v66 = v67 / v65;
              }
              v68 = v62;
              v69 = vrecpe_f32((float32x2_t)LODWORD(v62));
              v70 = vmul_f32(v69, vrecps_f32((float32x2_t)LODWORD(v68), v69));
              v71 = vmul_f32(v70, vrecps_f32((float32x2_t)LODWORD(v68), v70)).f32[0];
              v70.f32[0] = (float)(1.0 - v51) * (float)(v71 * v55);
              v72 = vmlaq_f32(vmulq_n_f32(v105, v51 * (float)(v71 * v66)), v107, (float32x4_t)vdupq_lane_s32((int32x2_t)v70, 0));
              v73 = (int8x16_t)vmulq_f32(v72, v72);
              v74 = vadd_f32(*(float32x2_t *)v73.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v73, v73, 8uLL));
              v75 = 0.0;
              if (vaddv_f32(v74) != 0.0)
              {
                v76 = vadd_f32(v74, (float32x2_t)vdup_lane_s32((int32x2_t)v74, 1)).u32[0];
                v77 = vrsqrte_f32((float32x2_t)v76);
                v78 = vmul_f32(v77, vrsqrts_f32((float32x2_t)v76, vmul_f32(v77, v77)));
                *(_QWORD *)&v75 = vmulq_n_f32(v72, vmul_f32(v78, vrsqrts_f32((float32x2_t)v76, vmul_f32(v78, v78))).f32[0]).u64[0];
              }
              objc_msgSend(MEMORY[0x1E0CB3B18], "avt_valueWithFloat4_usableWithKVCForSCNVector4:", v75);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "addObject:", v79);

            }
            v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v112, v125, 16);
          }
          while (v45);
        }
      }
      else
      {
        objc_msgSend(v99, "floatValue");
        v81 = v80;
        v108 = 0u;
        v109 = 0u;
        v110 = 0u;
        v111 = 0u;
        v82 = v29;
        v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v108, v124, 16);
        if (v83)
        {
          v84 = v83;
          v85 = *(_QWORD *)v109;
          do
          {
            for (m = 0; m != v84; ++m)
            {
              if (*(_QWORD *)v109 != v85)
                objc_enumerationMutation(v82);
              v87 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * m);
              objc_msgSend(v15, "floatValue", v95, v96);
              v89 = v88;
              objc_msgSend(v87, "floatValue");
              *(float *)&v91 = v81 + (float)(v90 * (float)(v89 - v81));
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v91);
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "addObject:", v92);

            }
            v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v108, v124, 16);
          }
          while (v84);
        }
      }

      v12 = v100;
      objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", v100);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "setKeyTimes:", v19);
      objc_msgSend(v93, "setValues:", v30);
      objc_msgSend(v93, "setFillMode:", *MEMORY[0x1E0CD2B60]);
      objc_msgSend(v93, "setRemovedOnCompletion:", 0);
      objc_msgSend(v93, "setDuration:", *(double *)(a1 + 48));
      objc_msgSend(v93, "setBeginTime:", *(double *)(a1 + 56));
      objc_msgSend(v93, "setTimingFunction:", 0);
      v13 = v97;
      v11 = v98;
      objc_msgSend(v98, "addAnimation:forKey:", v93, v97);

      v14 = v99;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", v12);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setFromValue:", v14);
      if (v15)
      {
        objc_msgSend(v41, "setToValue:", v15);
        objc_msgSend(v41, "setFillMode:", *MEMORY[0x1E0CD2B60]);
      }
      objc_msgSend(v41, "setRemovedOnCompletion:", 0);
      objc_msgSend(v41, "setDuration:", *(double *)(a1 + 48));
      objc_msgSend(v41, "setBeginTime:", *(double *)(a1 + 56));
      if (*(_QWORD *)(a1 + 40))
      {
        objc_msgSend(v41, "setTimingFunction:");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setTimingFunction:", v94);

      }
      objc_msgSend(v11, "addAnimation:forKey:", v41, v13);

    }
  }

}

void __130__AVTAvatar__transitionFromPose_toPose_bakedAnimationBlendFactor_duration_delay_timingFunction_timingAnimation_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4, void (*a5)(void *, float))
{
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  id v23;

  v23 = a2;
  objc_msgSend(a4, "animationForKey:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "beginTime");
    v12 = v11;
    objc_msgSend(v10, "duration");
    if (v12 + v13 <= *(double *)(a1 + 32))
    {
      objc_msgSend(v10, "toValue");
      v21 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    objc_msgSend(v10, "fromValue");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      objc_msgSend(v10, "toValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = *(double *)(a1 + 32);
        objc_msgSend(v10, "beginTime");
        v19 = v17 - v18;
        objc_msgSend(v10, "duration");
        *(float *)&v20 = v19 / v20;
        a5(v10, *(float *)&v20);
        v21 = objc_claimAutoreleasedReturnValue();
LABEL_7:
        v22 = (void *)v21;
        objc_msgSend(v23, "setFromValue:", v21);

      }
    }
  }

}

- (void)stopTransitionAnimation
{
  uint64_t i;
  unint64_t v4;
  uint64_t v5;

  if (self->_morphInfoFromARKitBlendShapeIndex)
  {
    for (i = 8; i != 1672; i += 32)
      objc_msgSend(*(id *)((char *)&self->_morphInfoFromARKitBlendShapeIndex->var0 + i), "removeAllAnimations");
    if (self->_friendlyPoseMorphInfoCount)
    {
      v4 = 0;
      v5 = 8;
      do
      {
        objc_msgSend(*(id *)((char *)&self->_friendlyPoseMorphInfos->var0 + v5), "removeAllAnimations");
        ++v4;
        v5 += 32;
      }
      while (v4 < self->_friendlyPoseMorphInfoCount);
    }
    -[SCNNode removeAllAnimations](self->_rootJointNode, "removeAllAnimations");
    -[SCNNode removeAllAnimations](self->_neckNode, "removeAllAnimations");
    -[SCNAnimationPlayer removeAllAnimations](self->_bakedAnimationPlayer_lazy, "removeAllAnimations");
    self->_transitionCount = 0;
  }
}

- (void)stopTransitionAnimationWithBlendOutDuration:(double)a3
{
  uint64_t i;
  unint64_t v6;
  uint64_t v7;

  for (i = 8; i != 1672; i += 32)
    objc_msgSend(*(id *)((char *)&self->_morphInfoFromARKitBlendShapeIndex->var0 + i), "removeAllAnimationsWithBlendOutDuration:", a3);
  if (self->_friendlyPoseMorphInfoCount)
  {
    v6 = 0;
    v7 = 8;
    do
    {
      objc_msgSend(*(id *)((char *)&self->_friendlyPoseMorphInfos->var0 + v7), "removeAllAnimationsWithBlendOutDuration:", a3);
      ++v6;
      v7 += 32;
    }
    while (v6 < self->_friendlyPoseMorphInfoCount);
  }
  -[SCNNode removeAllAnimationsWithBlendOutDuration:](self->_rootJointNode, "removeAllAnimationsWithBlendOutDuration:", a3);
  -[SCNNode removeAllAnimationsWithBlendOutDuration:](self->_neckNode, "removeAllAnimationsWithBlendOutDuration:", a3);
  -[SCNAnimationPlayer removeAllAnimationsWithBlendOutDuration:](self->_bakedAnimationPlayer_lazy, "removeAllAnimationsWithBlendOutDuration:", a3);
  self->_transitionCount = 0;
}

- (id)snapshotWithSize:(CGSize)a3 scale:(double)a4 options:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  +[AVTSnapshotBuilder sharedInstance](AVTSnapshotBuilder, "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v10);
  objc_msgSend(v10, "setAvatar:", self);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AVTSnapshotAnimatedKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v12)
    objc_msgSend(v10, "animatedImageWithSize:scale:options:", v9, width, height, a4);
  else
    objc_msgSend(v10, "imageWithSize:scale:options:", v9, width, height, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v10);

  return v13;
}

+ (void)preloadAvatar:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1DF0D6DC8]();
  v8 = CFSTR("AVTRendererOptionInitiallyConfigureForARMode");
  v9[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCNRenderer rendererWithDevice:options:](AVTRenderer, "rendererWithDevice:options:", 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setAvatar:", v3);
  objc_msgSend(v6, "scene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepareObject:shouldAbortBlock:", v7, 0);

  objc_autoreleasePoolPop(v4);
}

- (unint64_t)usageIntent
{
  -[AVTAvatar doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)copyWithUsageIntent:(unint64_t)a3
{
  -[AVTAvatar doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSObject *v3;

  avt_default_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[AVTAvatar copyWithZone:].cold.1();

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)canLoadDataRepresentation:(id)a3
{
  return +[AVTAvatarDescriptor canLoadDataRepresentation:](AVTAvatarDescriptor, "canLoadDataRepresentation:", a3);
}

- (id)dataRepresentation
{
  id v2;
  void *v3;

  v2 = -[AVTAvatar newDescriptor](self, "newDescriptor");
  objc_msgSend(v2, "dataRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (AVTAvatar)avatarWithDataRepresentation:(id)a3 error:(id *)a4
{
  return (AVTAvatar *)objc_msgSend(a1, "avatarWithDataRepresentation:usageIntent:error:", a3, 0, a4);
}

+ (AVTAvatar)avatarWithDataRepresentation:(id)a3 usageIntent:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  void *v9;

  +[AVTAvatarDescriptor descriptorWithDataRepresentation:error:](AVTAvatarDescriptor, "descriptorWithDataRepresentation:error:", a3, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "avatarWithDescriptor:usageIntent:error:", v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVTAvatar *)v9;
}

- (id)newDescriptor
{
  NSObject *v2;

  avt_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[AVTAvatar newDescriptor].cold.1();

  return 0;
}

+ (AVTAvatar)avatarWithDescriptor:(id)a3 usageIntent:(unint64_t)a4 error:(id *)a5
{
  id v7;
  __objc2_class **v8;
  void *v9;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = off_1EA61CDB0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = 0;
      goto LABEL_7;
    }
    v8 = off_1EA61CD38;
  }
  v9 = (void *)objc_msgSend(objc_alloc(*v8), "initWithDescriptor:usageIntent:error:", v7, a4, a5);
LABEL_7:

  return (AVTAvatar *)v9;
}

- (id)avatarNodeForPhysicsController:(id)a3
{
  return self->_avatarNode;
}

- (double)physicsController:(id)a3 downforceForNodeNamed:(id)a4
{
  double result;

  -[AVTAvatar physicsDownforceForNodeNamed:](self, "physicsDownforceForNodeNamed:", a4);
  return result;
}

- (id)stickerPhysicsStateIdentifier
{
  NSObject *v2;

  avt_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[AVTAvatar stickerPhysicsStateIdentifier].cold.1();

  return 0;
}

- (id)nodesMatchingStickerPattern:(id)a3 inHierarchy:(id)a4 options:(unint64_t)a5 includingDerivedNodes:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v6 = a6;
  v24 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[AVTAvatar _addNodesMatchingStickerPattern:inHierarchy:toArray:options:](self, "_addNodesMatchingStickerPattern:inHierarchy:toArray:options:", v10, v11, v12, a5);
    if (!v6)
      goto LABEL_17;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v13 = v10;
    v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          -[AVTAvatar _addNodesMatchingStickerPattern:inHierarchy:toArray:options:](self, "_addNodesMatchingStickerPattern:inHierarchy:toArray:options:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), v11, v12, a5, (_QWORD)v19);
        }
        v15 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v15);
    }
  }
  else
  {
    avt_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[AVTAvatar nodesMatchingStickerPattern:inHierarchy:options:includingDerivedNodes:].cold.1();
  }

  if (v6)
LABEL_16:
    -[AVTAvatar addDerivedNodesMatchingStickerPattern:toArray:options:](self, "addDerivedNodesMatchingStickerPattern:toArray:options:", v10, v12, a5, (_QWORD)v19);
LABEL_17:

  return v12;
}

- (void)_addNodesMatchingStickerPattern:(id)a3 inHierarchy:(id)a4 toArray:(id)a5 options:(unint64_t)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  unint64_t v20;
  char v21;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  LOBYTE(a4) = objc_msgSend(v9, "hasSuffix:", CFSTR("*"));
  objc_msgSend(v9, "substringToIndex:", objc_msgSend(v9, "length") - 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__AVTAvatar__addNodesMatchingStickerPattern_inHierarchy_toArray_options___block_invoke;
  v16[3] = &unk_1EA61F560;
  v21 = (char)a4;
  v17 = v12;
  v18 = v10;
  v19 = v9;
  v20 = a6;
  v13 = v9;
  v14 = v10;
  v15 = v12;
  objc_msgSend(v11, "enumerateHierarchyUsingBlock:", v16);

}

void __73__AVTAvatar__addNodesMatchingStickerPattern_inHierarchy_toArray_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(v7, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(a1 + 32));

    if (v4)
    {
      if (!AVTNodeMatchesHierarchyEnumerationOptions(v7, *(_QWORD *)(a1 + 56)))
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  objc_msgSend(v7, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 48));

  if (v6 && AVTNodeMatchesHierarchyEnumerationOptions(v7, *(_QWORD *)(a1 + 56)))
LABEL_7:
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
LABEL_8:

}

- (float)opacity
{
  void *v2;
  void *v3;
  double v4;
  float v5;
  NSObject *v6;

  -[AVTAvatar avatarNode](self, "avatarNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "opacity");
    v5 = v4;
  }
  else
  {
    avt_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AVTAvatar opacity].cold.1();

    v5 = 1.0;
  }

  return v5;
}

- (void)setOpacity:(float)a3
{
  double v5;
  double v6;
  id v7;

  -[AVTAvatar avatarNode](self, "avatarNode");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "opacity");
  if (v5 != a3)
  {
    if (a3 == 1.0 || (objc_msgSend(v7, "opacity"), v6 == 1.0))
      -[AVTAvatar _preparePrePass:](self, "_preparePrePass:", a3 != 1.0);
    objc_msgSend(v7, "setOpacity:", a3);
  }

}

- (void)_preparePrePass:(BOOL)a3
{
  id v4;
  _QWORD v5[4];
  BOOL v6;

  -[AVTAvatar avatarNode](self, "avatarNode");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__AVTAvatar__preparePrePass___block_invoke;
  v5[3] = &__block_descriptor_33_e21_v24__0__SCNNode_8_B16l;
  v6 = a3;
  objc_msgSend(v4, "enumerateHierarchyUsingBlock:", v5);

}

void __29__AVTAvatar__preparePrePass___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "renderingOrder") <= 0)
    objc_msgSend(v3, "setUsesDepthPrePass:", *(unsigned __int8 *)(a1 + 32));

}

- (NSDictionary)specializationSettings
{
  return self->_specializationSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specializationSettings, 0);
  objc_storeStrong((id *)&self->_didUpdateAtTimeCallbackItems, 0);
  objc_storeStrong((id *)&self->_bakedAnimationPlayer_lazy, 0);
  objc_storeStrong((id *)&self->_bakedAnimation, 0);
  objc_storeStrong((id *)&self->_eyeSkinningDescriptor, 0);
  objc_storeStrong((id *)&self->_pupilReflectionCorrectionDescriptor, 0);
  objc_storeStrong((id *)&self->_morpherDrivenMaterialDescriptors, 0);
  objc_storeStrong((id *)&self->_dynamics, 0);
  objc_storeStrong((id *)&self->_physicsController, 0);
  objc_storeStrong((id *)&self->_portalPresentationConfigurationNode, 0);
  objc_storeStrong((id *)&self->_presentationConfiguration, 0);
  objc_storeStrong((id *)&self->_rootJointNode, 0);
  objc_storeStrong((id *)&self->_neckNode, 0);
  objc_storeStrong((id *)&self->_rightEye, 0);
  objc_storeStrong((id *)&self->_leftEye, 0);
  objc_storeStrong((id *)&self->_headNode, 0);
  objc_storeStrong((id *)&self->_skeleton, 0);
  objc_storeStrong((id *)&self->_avatarNode, 0);
}

- (void)headNode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2(&dword_1DD1FA000, v0, v1, "Error: Unreachable code: abstract method called: headNode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)avatarNode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2(&dword_1DD1FA000, v0, v1, "Error: Unreachable code: abstract method called: avatarNode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_restoreOriginalShaderModifiersOfMaterial:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1DD1FA000, v0, v1, "Error: Unreachable code: Unknown stored shader modifiers %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)arMode
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[AVTAvatar arMode]";
  OUTLINED_FUNCTION_0_2(&dword_1DD1FA000, a1, a3, "Error: %s is deprecated - use AVTPresentationConfiguration instead", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)setArMode:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[AVTAvatar setArMode:]";
  OUTLINED_FUNCTION_0_2(&dword_1DD1FA000, a1, a3, "Error: %s is deprecated - use AVTPresentationConfiguration instead", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)updateBindingsOfNode:.cold.1()
{
  __assert_rtn("-[AVTAvatar updateBindingsOfNode:]", "AVTAvatar.m", 645, "_headNode != nil && _morphInfoFromARKitBlendShapeIndex != nil");
}

- (void)updatePoseWithFaceTrackingData:(void *)a1 applySmoothing:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136315650;
  v4 = "data.length == sizeof(AVTFaceTrackingData)";
  v5 = 2048;
  v6 = objc_msgSend(a1, "length");
  v7 = 2048;
  v8 = 480;
  _os_log_error_impl(&dword_1DD1FA000, a2, OS_LOG_TYPE_ERROR, "Error: Condition '%s' failed. Inconsistent size for AVTFaceTrackingData (%zu vs %zu)", (uint8_t *)&v3, 0x20u);
}

- (void)updatePoseWithCVAFaceTrackingAnimationDictionary:(uint64_t)a3 neckPosition:neckOrientation:applySmoothing:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "weightData.length == weightBufferSize";
  OUTLINED_FUNCTION_0_2(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. Inconsistent size for kCVAFaceTracking_AnimationBlendshapes", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

- (void)_applyHeadPoseWithTrackingData:gazeCorrection:pointOfView:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2(&dword_1DD1FA000, v0, v1, "Error: applyHeadPoseWithTrackingInfo - missing point of view for correct AR mode", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)pose
{
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_1DD1FA000, a2, v5, "Error: Unreachable code: Unsupported CAAnimation subclass (%@)", v6);

  OUTLINED_FUNCTION_5();
}

- (void)copyWithZone:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2(&dword_1DD1FA000, v0, v1, "Error: Unreachable code: copyWithZone: abstract implementation invoked", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)newDescriptor
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2(&dword_1DD1FA000, v0, v1, "Error: Unreachable code: abstract method called: -newDescriptor:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)stickerPhysicsStateIdentifier
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2(&dword_1DD1FA000, v0, v1, "Error: Unreachable code: abstract method called: stickerPhysicsStateIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)nodesMatchingStickerPattern:inHierarchy:options:includingDerivedNodes:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2(&dword_1DD1FA000, v0, v1, "Error: Unreachable code: Unexpected pattern", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)opacity
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2(&dword_1DD1FA000, v0, v1, "Error: avatar opacity: no avatar node", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
