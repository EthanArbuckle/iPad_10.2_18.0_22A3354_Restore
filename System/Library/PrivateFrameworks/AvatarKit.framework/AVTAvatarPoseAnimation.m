@implementation AVTAvatarPoseAnimation

- (void)commonInitWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSString *v7;
  NSString *animationBaseKey;
  id v9;
  id v10;

  v9 = a3;
  if (objc_msgSend(v9, "length"))
  {
    v4 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "UUIDString");
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v6;
  }
  v10 = v4;
  objc_msgSend(CFSTR("kAVTPoseAnimation-"), "stringByAppendingString:", v4);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  animationBaseKey = self->_animationBaseKey;
  self->_animationBaseKey = v7;

}

- (AVTAvatarPoseAnimation)initWithSceneAtURL:(id)a3
{
  _OWORD v4[2];

  memset(v4, 0, sizeof(v4));
  return -[AVTAvatarPoseAnimation initWithSceneAtURL:usdaMetadata:](self, "initWithSceneAtURL:usdaMetadata:", a3, v4);
}

- (AVTAvatarPoseAnimation)initWithSceneAtURL:(id)a3 usdaMetadata:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  __int128 v16;
  AVTAvatarPoseAnimation *v17;
  _OWORD v19[2];
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v8, 0);

  if (v9)
  {
    v21 = *MEMORY[0x1E0CD5B78];
    v22[0] = *MEMORY[0x1E0CD5B80];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v11 = (void *)objc_msgSend(MEMORY[0x1E0CD5A10], "avt_newSceneWithURL:options:error:", v6, v10, &v20);
    v12 = v20;
    objc_msgSend(v11, "avt_fixQuirksOfNewUSDSchemaWithOptions:handler:", 0, 0);
    if (v12)
    {
      avt_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[AVTAvatarPoseAnimation initWithSceneAtURL:usdaMetadata:].cold.1(v6, v12, v13);

    }
    objc_msgSend(v6, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByDeletingPathExtension");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *(_OWORD *)&a4->var2;
    v19[0] = *(_OWORD *)&a4->var0;
    v19[1] = v16;
    self = (AVTAvatarPoseAnimation *)-[AVTAvatarPoseAnimation _initWithScene:usdaMetadata:identifier:](self, "_initWithScene:usdaMetadata:identifier:", v11, v19, v15);

    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (AVTAvatarPoseAnimation)initWithScene:(id)a3
{
  _OWORD v4[2];

  memset(v4, 0, sizeof(v4));
  return (AVTAvatarPoseAnimation *)-[AVTAvatarPoseAnimation _initWithScene:usdaMetadata:identifier:](self, "_initWithScene:usdaMetadata:identifier:", a3, v4, 0);
}

- (AVTAvatarPoseAnimation)initWithScene:(id)a3 usdaMetadata:(id *)a4
{
  __int128 v4;
  _OWORD v6[2];

  v4 = *(_OWORD *)&a4->var2;
  v6[0] = *(_OWORD *)&a4->var0;
  v6[1] = v4;
  return (AVTAvatarPoseAnimation *)-[AVTAvatarPoseAnimation _initWithScene:usdaMetadata:identifier:](self, "_initWithScene:usdaMetadata:identifier:", a3, v6, 0);
}

- (id)_initWithScene:(id)a3 usdaMetadata:(id *)a4 identifier:(id)a5
{
  id v8;
  id v9;
  AVTAvatarPoseAnimation *v10;
  AVTAvatarPoseAnimation *v11;
  AVTAvatarPose *v12;
  AVTAvatarPose *staticPose;
  NSDictionary *staticPhysicsStates;
  id v15;
  id v16;
  void *v17;
  id *v18;
  __int128 v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v25[4];
  id *v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;

  v8 = a3;
  v9 = a5;
  v31.receiver = self;
  v31.super_class = (Class)AVTAvatarPoseAnimation;
  v10 = -[AVTAvatarPoseAnimation init](&v31, sel_init);
  v11 = v10;
  if (v10)
  {
    -[AVTAvatarPoseAnimation commonInitWithIdentifier:](v10, "commonInitWithIdentifier:", v9);
    v12 = -[AVTAvatarPose initWithScene:]([AVTAvatarPose alloc], "initWithScene:", v8);
    staticPose = v11->_staticPose;
    v11->_staticPose = v12;

    staticPhysicsStates = v11->_staticPhysicsStates;
    v11->_staticPhysicsStates = 0;

    v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v8, "rootNode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __65__AVTAvatarPoseAnimation__initWithScene_usdaMetadata_identifier___block_invoke;
    v25[3] = &unk_1EA61E558;
    v18 = v11;
    v26 = v18;
    v27 = v15;
    v28 = v16;
    v19 = *(_OWORD *)&a4->var2;
    v29 = *(_OWORD *)&a4->var0;
    v30 = v19;
    v20 = v16;
    v21 = v15;
    objc_msgSend(v17, "enumerateHierarchyUsingBlock:", v25);

    if (objc_msgSend(v21, "count"))
      v22 = v21;
    else
      v22 = 0;
    objc_storeStrong(v18 + 3, v22);
    if (objc_msgSend(v20, "count"))
      v23 = v20;
    else
      v23 = 0;
    objc_storeStrong(v18 + 4, v23);

  }
  return v11;
}

void __65__AVTAvatarPoseAnimation__initWithScene_usdaMetadata_identifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v14;
  _OWORD v15[2];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "animationKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "animationPlayerForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "animation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (id)objc_msgSend((id)objc_opt_class(), "optimizeAnimation:target:", v10, v3);
        v12 = *(void **)(a1 + 40);
        v13 = *(void **)(a1 + 48);
        v14 = *(_OWORD *)(a1 + 72);
        v15[0] = *(_OWORD *)(a1 + 56);
        v15[1] = v14;
        addAnimation(v3, v10, v12, v13, (unsigned __int8 *)v15);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

- (AVTAvatarPoseAnimation)initWithAnimatedPoseRepresentationAtURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  AVTAvatarPoseAnimation *v8;

  v4 = a3;
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByDeletingPathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:error:", v4, 0);
  v8 = -[AVTAvatarPoseAnimation _initWithStaticPoseRepresentation:animatedPoseRepresentation:staticPhysicsStatesRepresentation:identifier:](self, "_initWithStaticPoseRepresentation:animatedPoseRepresentation:staticPhysicsStatesRepresentation:identifier:", 0, v7, 0, v6);

  return v8;
}

- (AVTAvatarPoseAnimation)initWithStaticPose:(id)a3 staticPhysicsStates:(id)a4
{
  id v7;
  id v8;
  AVTAvatarPoseAnimation *v9;
  AVTAvatarPoseAnimation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AVTAvatarPoseAnimation;
  v9 = -[AVTAvatarPoseAnimation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    -[AVTAvatarPoseAnimation commonInitWithIdentifier:](v9, "commonInitWithIdentifier:", 0);
    objc_storeStrong((id *)&v10->_staticPose, a3);
    objc_storeStrong((id *)&v10->_staticPhysicsStates, a4);
  }

  return v10;
}

- (AVTAvatarPoseAnimation)initWithStaticPoseRepresentation:(id)a3 animatedPoseRepresentation:(id)a4 staticPhysicsStatesRepresentation:(id)a5
{
  return (AVTAvatarPoseAnimation *)-[AVTAvatarPoseAnimation _initWithStaticPoseRepresentation:animatedPoseRepresentation:staticPhysicsStatesRepresentation:identifier:](self, "_initWithStaticPoseRepresentation:animatedPoseRepresentation:staticPhysicsStatesRepresentation:identifier:", a3, a4, a5, 0);
}

- (id)_initWithStaticPoseRepresentation:(id)a3 animatedPoseRepresentation:(id)a4 staticPhysicsStatesRepresentation:(id)a5 identifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  AVTAvatarPoseAnimation *v14;
  AVTAvatarPoseAnimation *v15;
  AVTAvatarPose *v16;
  AVTAvatarPose *staticPose;
  void *v18;
  NSDictionary *v19;
  NSDictionary *staticPhysicsStates;
  NSDictionary *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSDictionary *v25;
  NSDictionary *blendshapeAnimations;
  NSDictionary *v27;
  void *v28;
  void *v29;
  NSDictionary *v30;
  NSDictionary *perNodeAnimations;
  NSDictionary *v32;
  _QWORD v34[4];
  NSDictionary *v35;
  _QWORD v36[4];
  NSDictionary *v37;
  _QWORD v38[4];
  NSDictionary *v39;
  objc_super v40;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v40.receiver = self;
  v40.super_class = (Class)AVTAvatarPoseAnimation;
  v14 = -[AVTAvatarPoseAnimation init](&v40, sel_init);
  v15 = v14;
  if (v14)
  {
    -[AVTAvatarPoseAnimation commonInitWithIdentifier:](v14, "commonInitWithIdentifier:", v13);
    if (v10)
    {
      v16 = -[AVTAvatarPose initWithDictionaryRepresentation:]([AVTAvatarPose alloc], "initWithDictionaryRepresentation:", v10);
      staticPose = v15->_staticPose;
      v15->_staticPose = v16;

    }
    if (v12)
    {
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v12, "count"));
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __132__AVTAvatarPoseAnimation__initWithStaticPoseRepresentation_animatedPoseRepresentation_staticPhysicsStatesRepresentation_identifier___block_invoke;
      v38[3] = &unk_1EA61E580;
      v19 = v18;
      v39 = v19;
      objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v38);
      staticPhysicsStates = v15->_staticPhysicsStates;
      v15->_staticPhysicsStates = v19;
      v21 = v19;

    }
    if (v11)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("blendshapes"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");
      if (v23)
      {
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v23);
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __132__AVTAvatarPoseAnimation__initWithStaticPoseRepresentation_animatedPoseRepresentation_staticPhysicsStatesRepresentation_identifier___block_invoke_2;
        v36[3] = &unk_1EA61E5A8;
        v25 = v24;
        v37 = v25;
        objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v36);
        blendshapeAnimations = v15->_blendshapeAnimations;
        v15->_blendshapeAnimations = v25;
        v27 = v25;

      }
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("perNode"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v28, "count"))
      {
        v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v23);
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __132__AVTAvatarPoseAnimation__initWithStaticPoseRepresentation_animatedPoseRepresentation_staticPhysicsStatesRepresentation_identifier___block_invoke_3;
        v34[3] = &unk_1EA61E580;
        v30 = v29;
        v35 = v30;
        objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v34);
        perNodeAnimations = v15->_perNodeAnimations;
        v15->_perNodeAnimations = v30;
        v32 = v30;

      }
    }
  }

  return v15;
}

void __132__AVTAvatarPoseAnimation__initWithStaticPoseRepresentation_animatedPoseRepresentation_staticPhysicsStatesRepresentation_identifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  AVTAvatarPhysicsState *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[AVTAvatarPhysicsState initWithDictionaryRepresentation:]([AVTAvatarPhysicsState alloc], "initWithDictionaryRepresentation:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);
}

void __132__AVTAvatarPoseAnimation__initWithStaticPoseRepresentation_animatedPoseRepresentation_staticPhysicsStatesRepresentation_identifier___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;

  v5 = a2;
  +[AVTAvatarPoseAnimation animationFromDataRepresentation:keyPath:](AVTAvatarPoseAnimation, "animationFromDataRepresentation:keyPath:", a3, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

void __132__AVTAvatarPoseAnimation__initWithStaticPoseRepresentation_animatedPoseRepresentation_staticPhysicsStatesRepresentation_identifier___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithCapacity:", objc_msgSend(v6, "count"));
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __132__AVTAvatarPoseAnimation__initWithStaticPoseRepresentation_animatedPoseRepresentation_staticPhysicsStatesRepresentation_identifier___block_invoke_4;
  v10[3] = &unk_1EA61E5A8;
  v11 = v8;
  v9 = v8;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v10);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v7);
}

void __132__AVTAvatarPoseAnimation__initWithStaticPoseRepresentation_animatedPoseRepresentation_staticPhysicsStatesRepresentation_identifier___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  +[AVTAvatarPoseAnimation animationFromDataRepresentation:keyPath:](AVTAvatarPoseAnimation, "animationFromDataRepresentation:keyPath:", a3, a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (id)staticPoseRepresentation
{
  return -[AVTAvatarPose dictionaryRepresentation](self->_staticPose, "dictionaryRepresentation");
}

- (id)animatedPoseRepresentationWithAnimationRepresentationBuilder:(id)a3
{
  id v4;
  id v5;
  NSUInteger v6;
  uint64_t v7;
  id v8;
  NSDictionary *blendshapeAnimations;
  id v10;
  id v11;
  NSDictionary *perNodeAnimations;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v4 = a3;
  if (-[NSDictionary count](self->_blendshapeAnimations, "count")
    || -[NSDictionary count](self->_perNodeAnimations, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = -[NSDictionary count](self->_blendshapeAnimations, "count");
    v7 = MEMORY[0x1E0C809B0];
    if (v6)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      blendshapeAnimations = self->_blendshapeAnimations;
      v21[0] = v7;
      v21[1] = 3221225472;
      v21[2] = __87__AVTAvatarPoseAnimation_animatedPoseRepresentationWithAnimationRepresentationBuilder___block_invoke;
      v21[3] = &unk_1EA61E5F8;
      v22 = v8;
      v23 = v4;
      v10 = v8;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](blendshapeAnimations, "enumerateKeysAndObjectsUsingBlock:", v21);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("blendshapes"));

    }
    if (-[NSDictionary count](self->_perNodeAnimations, "count"))
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      perNodeAnimations = self->_perNodeAnimations;
      v15 = v7;
      v16 = 3221225472;
      v17 = __87__AVTAvatarPoseAnimation_animatedPoseRepresentationWithAnimationRepresentationBuilder___block_invoke_3;
      v18 = &unk_1EA61E648;
      v19 = v11;
      v20 = v4;
      v13 = v11;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](perNodeAnimations, "enumerateKeysAndObjectsUsingBlock:", &v15);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("perNode"), v15, v16, v17, v18);

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __87__AVTAvatarPoseAnimation_animatedPoseRepresentationWithAnimationRepresentationBuilder___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, _QWORD *);
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__AVTAvatarPoseAnimation_animatedPoseRepresentationWithAnimationRepresentationBuilder___block_invoke_2;
  v9[3] = &unk_1EA61E5D0;
  v6 = *(_QWORD *)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v11 = v5;
  v7 = *(void (**)(uint64_t, uint64_t, _QWORD *))(v6 + 16);
  v8 = v5;
  v7(v6, a3, v9);

}

uint64_t __87__AVTAvatarPoseAnimation_animatedPoseRepresentationWithAnimationRepresentationBuilder___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, *(_QWORD *)(a1 + 40));
}

void __87__AVTAvatarPoseAnimation_animatedPoseRepresentationWithAnimationRepresentationBuilder___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id obj;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v14 = a2;
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
        v13 = *(_QWORD *)(a1 + 40);
        v16[0] = v10;
        v16[1] = 3221225472;
        v16[2] = __87__AVTAvatarPoseAnimation_animatedPoseRepresentationWithAnimationRepresentationBuilder___block_invoke_4;
        v16[3] = &unk_1EA61E620;
        v17 = v6;
        (*(void (**)(uint64_t, uint64_t, _QWORD *))(v13 + 16))(v13, v12, v16);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v14);
}

uint64_t __87__AVTAvatarPoseAnimation_animatedPoseRepresentationWithAnimationRepresentationBuilder___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

- (id)animatedPoseRepresentationWithDataAnimationRepresentation
{
  return -[AVTAvatarPoseAnimation animatedPoseRepresentationWithAnimationRepresentationBuilder:](self, "animatedPoseRepresentationWithAnimationRepresentationBuilder:", &__block_literal_global_7);
}

uint64_t __83__AVTAvatarPoseAnimation_animatedPoseRepresentationWithDataAnimationRepresentation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[AVTAvatarPoseAnimation dataRepresentationForAnimation:completionHandler:](AVTAvatarPoseAnimation, "dataRepresentationForAnimation:completionHandler:", a2, a3);
}

- (id)animatedPoseRepresentationWithDictionaryAnimationRepresentation
{
  return -[AVTAvatarPoseAnimation animatedPoseRepresentationWithAnimationRepresentationBuilder:](self, "animatedPoseRepresentationWithAnimationRepresentationBuilder:", &__block_literal_global_89);
}

uint64_t __89__AVTAvatarPoseAnimation_animatedPoseRepresentationWithDictionaryAnimationRepresentation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[AVTAvatarPoseAnimation dictionaryRepresentationForAnimation:completionHandler:](AVTAvatarPoseAnimation, "dictionaryRepresentationForAnimation:completionHandler:", a2, a3);
}

- (id)animationsForAvatar:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *perNodeAnimations;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  _OWORD v19[2];
  __int128 v20;
  __int128 v21;
  _QWORD v22[2];
  void (*v23)(uint64_t, void *, uint64_t);
  void *v24;
  AVTAvatarPoseAnimation *v25;
  id v26;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v23 = __46__AVTAvatarPoseAnimation_animationsForAvatar___block_invoke;
  v24 = &unk_1EA61E6F0;
  v25 = self;
  v7 = v5;
  v8 = 0;
  v26 = v7;
  do
  {
    AVTBlendShapeLocationFromARIndex(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "blendShapeIndexForARKitBlendShapeName:", v9);
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v20 = 0u;
      v21 = 0u;
      if (v4)
        objc_msgSend(v4, "morphInfoForARKitBlendShapeIndex:", v10);
      v19[0] = v20;
      v19[1] = v21;
      v23((uint64_t)v22, v9, (uint64_t)v19);
    }

    ++v8;
  }
  while (v8 != 52);
  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __46__AVTAvatarPoseAnimation_animationsForAvatar___block_invoke_98;
  v18[3] = &__block_descriptor_40_e15_v40__0_____qB_8lu32l8;
  v18[4] = v22;
  objc_msgSend(v4, "enumerateMorphInfoForCustomBlendShapeName:usingBlock:", CFSTR("Emoji"), v18);
  perNodeAnimations = self->_perNodeAnimations;
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __46__AVTAvatarPoseAnimation_animationsForAvatar___block_invoke_2;
  v16[3] = &unk_1EA61E738;
  v12 = v7;
  v17 = v12;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](perNodeAnimations, "enumerateKeysAndObjectsUsingBlock:", v16);
  v13 = v17;
  v14 = v12;

  return v14;
}

void __46__AVTAvatarPoseAnimation_animationsForAvatar___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  if (*(_BYTE *)(a3 + 24))
  {
    v5 = *(void **)(a3 + 8);
    v6 = a2;
    objc_msgSend(v5, "name");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/%@.morpher.weights[%ld]"), v12, *(_QWORD *)(a3 + 16));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (id)objc_msgSend(v8, "copy");
      objc_msgSend(v9, "setKeyPath:", v7);
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
    }
    else
    {
      v9 = objc_alloc_init(MEMORY[0x1E0CD2710]);
      objc_msgSend(v9, "setFromValue:", &unk_1EA655B40);
      objc_msgSend(v9, "setToValue:", &unk_1EA655B40);
      objc_msgSend(v9, "setKeyPath:", v7);
      v10 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CD5948], "animationWithCAAnimation:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

    }
  }
}

uint64_t __46__AVTAvatarPoseAnimation_animationsForAvatar___block_invoke_98(uint64_t a1, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t, const __CFString *, _OWORD *, uint64_t);
  __int128 v6;
  _OWORD v8[2];

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(uint64_t (**)(uint64_t, const __CFString *, _OWORD *, uint64_t))(v4 + 16);
  v6 = a2[1];
  v8[0] = *a2;
  v8[1] = v6;
  return v5(v4, CFSTR("Emoji"), v8, a4);
}

void __46__AVTAvatarPoseAnimation_animationsForAvatar___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = a3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = (void *)objc_msgSend(v10, "copy");
        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v10, "keyPath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("/%@.%@"), v5, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setKeyPath:", v14);

        objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

- (double)duration
{
  uint64_t v3;
  NSDictionary *blendshapeAnimations;
  NSDictionary *perNodeAnimations;
  double v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x2020000000;
  v13 = 0;
  v3 = MEMORY[0x1E0C809B0];
  blendshapeAnimations = self->_blendshapeAnimations;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __34__AVTAvatarPoseAnimation_duration__block_invoke;
  v9[3] = &unk_1EA61E760;
  v9[4] = &v10;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](blendshapeAnimations, "enumerateKeysAndObjectsUsingBlock:", v9);
  perNodeAnimations = self->_perNodeAnimations;
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __34__AVTAvatarPoseAnimation_duration__block_invoke_2;
  v8[3] = &unk_1EA61E788;
  v8[4] = &v10;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](perNodeAnimations, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t __34__AVTAvatarPoseAnimation_duration__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v4;
  uint64_t result;
  double v6;

  v4 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = objc_msgSend(a3, "duration");
  if (v4 >= v6)
    v6 = v4;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;
  return result;
}

void __34__AVTAvatarPoseAnimation_duration__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "duration");
        if (v9 >= v10)
          v10 = v9;
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v10;
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (id)addToAvatar:(id)a3 useStaticPhysicsState:(BOOL)a4
{
  return -[AVTAvatarPoseAnimation _addAnimationToAvatar:options:transitionInDuration:transitionOutDuration:isTransient:completionQueue:completionHandler:](self, "_addAnimationToAvatar:options:transitionInDuration:transitionOutDuration:isTransient:completionQueue:completionHandler:", a3, a4, 0, 0, 0, 0.0, 0.0);
}

- (id)addToAvatar:(id)a3 useStaticPhysicsState:(BOOL)a4 transitionDuration:(double)a5
{
  return -[AVTAvatarPoseAnimation _addAnimationToAvatar:options:transitionInDuration:transitionOutDuration:isTransient:completionQueue:completionHandler:](self, "_addAnimationToAvatar:options:transitionInDuration:transitionOutDuration:isTransient:completionQueue:completionHandler:", a3, a4, 0, 0, 0, a5, 0.0);
}

- (id)addToAvatar:(id)a3 options:(unint64_t)a4
{
  return -[AVTAvatarPoseAnimation _addAnimationToAvatar:options:transitionInDuration:transitionOutDuration:isTransient:completionQueue:completionHandler:](self, "_addAnimationToAvatar:options:transitionInDuration:transitionOutDuration:isTransient:completionQueue:completionHandler:", a3, a4, 0, 0, 0, 0.0, 0.0);
}

- (id)addToAvatar:(id)a3 options:(unint64_t)a4 transitionDuration:(double)a5
{
  return -[AVTAvatarPoseAnimation _addAnimationToAvatar:options:transitionInDuration:transitionOutDuration:isTransient:completionQueue:completionHandler:](self, "_addAnimationToAvatar:options:transitionInDuration:transitionOutDuration:isTransient:completionQueue:completionHandler:", a3, a4, 0, 0, 0, a5, a5);
}

- (void)playOnceOnAvatar:(id)a3 options:(unint64_t)a4 transitionInDuration:(double)a5 transitionOutDuration:(double)a6 completionQueue:(id)a7 completionHandler:(id)a8
{
  id v8;

  v8 = -[AVTAvatarPoseAnimation _addAnimationToAvatar:options:transitionInDuration:transitionOutDuration:isTransient:completionQueue:completionHandler:](self, "_addAnimationToAvatar:options:transitionInDuration:transitionOutDuration:isTransient:completionQueue:completionHandler:", a3, a4, 1, a7, a8, a5, a6);
}

- (id)_addAnimationToAvatar:(id)a3 options:(unint64_t)a4 transitionInDuration:(double)a5 transitionOutDuration:(double)a6 isTransient:(BOOL)a7 completionQueue:(id)a8 completionHandler:(id)a9
{
  id v15;
  NSDictionary *staticPhysicsStates;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  CFAbsoluteTime v21;
  double v22;
  double v23;
  float v24;
  double v25;
  double v26;
  double v27;
  double v28;
  BOOL v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  float v56;
  double v57;
  uint64_t j;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id *v73;
  void *v74;
  id v75;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  AVTAvatarPoseAnimationController *v81;
  id obj;
  id v83;
  AVTAvatarPoseAnimation *v84;
  _BOOL4 v85;
  void *v86;
  void *v87;
  _QWORD v88[4];
  id v89;
  double v90;
  _QWORD v91[4];
  AVTAvatarPoseAnimationController *v92;
  id v93;
  id v94;
  _QWORD v95[4];
  id v96;
  id v97;
  _QWORD v98[4];
  _QWORD v99[2];
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  void *v109;
  uint64_t v110;
  _QWORD v111[2];
  _BYTE v112[128];
  int v113;
  void *v114;
  __int16 v115;
  void *v116;
  uint8_t buf[32];
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _BYTE v121[128];
  uint64_t v122;

  v85 = a7;
  v122 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v80 = a8;
  v83 = a9;
  if (self->_staticPose)
    objc_msgSend(v15, "setPose:");
  if ((a4 & 1) != 0)
  {
    staticPhysicsStates = self->_staticPhysicsStates;
    objc_msgSend(v15, "stickerPhysicsStateIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](staticPhysicsStates, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "resetToPhysicsState:assumeRestStateIfNil:", v18, 1);
  }
  -[AVTAvatarPoseAnimation animationsForAvatar:](self, "animationsForAvatar:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0.0;
  if ((a4 & 2) != 0)
  {
    v21 = CFAbsoluteTimeGetCurrent() + 0.05;
    v22 = CACurrentMediaTime();
    v20 = fmin(v22 - floor(v22), 1.0) + fmin(v21 - v22 - floor(v21 - v22), 1.0) + -1.0;
  }
  if ((a4 & 4) != 0)
    v23 = v20 + 2.5;
  else
    v23 = v20;
  if ((a4 & 8) != 0)
  {
    v24 = (double)arc4random() / 4294967300.0;
    -[AVTAvatarPoseAnimation duration](self, "duration");
    v23 = v23 + v25 * v24;
  }
  if ((a4 >> 4) & 1 | v85)
    v26 = 1.0;
  else
    v26 = INFINITY;
  -[AVTAvatarPoseAnimation duration](self, "duration");
  v28 = v27;
  v29 = a5 + a6 <= v27;
  v30 = v27 / (a5 + a6);
  v31 = v30 * a5;
  v32 = v30 * a6;
  if (a5 + a6 > v28)
    v33 = v32;
  else
    v33 = a6;
  if (!v29)
    a5 = v31;
  objc_msgSend(v15, "avatarNode");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "animationKeys");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "count");
  v84 = self;
  v77 = v34;
  v78 = v15;
  if (v35)
  {
    v79 = v19;
    v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v35);
    v105 = 0u;
    v106 = 0u;
    v107 = 0u;
    v108 = 0u;
    v36 = v34;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v106;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v106 != v39)
            objc_enumerationMutation(v36);
          v41 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
          if (objc_msgSend(v41, "hasPrefix:", CFSTR("kAVTPoseAnimation-")))
          {
            objc_msgSend(v87, "animationPlayerForKey:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = v42;
            if (v42)
            {
              objc_msgSend(v42, "animation");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = v44;
              if (v44)
              {
                objc_msgSend(v44, "keyPath");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v46, "length"))
                {
                  objc_msgSend(v86, "objectForKeyedSubscript:", v46);
                  v47 = (id)objc_claimAutoreleasedReturnValue();
                  if (!v47)
                  {
                    v47 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                    objc_msgSend(v86, "setObject:forKeyedSubscript:", v47, v46);
                  }
                  objc_msgSend(v47, "addObject:", v41);

                }
                else
                {
                  avt_default_log();
                  v50 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)&buf[4] = v41;
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v45;
                  }

                  if (AVTLogAllowsInternalCrash())
                    goto LABEL_76;
                }

              }
              else
              {
                avt_default_log();
                v49 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)&buf[4] = v41;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v43;
                }

                if (AVTLogAllowsInternalCrash())
                {
                  v104 = 0;
                  v119 = 0u;
                  v120 = 0u;
                  v118 = 0u;
                  memset(buf, 0, sizeof(buf));
                  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
                  v113 = 138412546;
                  v114 = v41;
                  v115 = 2112;
                  v116 = v43;
                  _os_log_send_and_compose_impl();
                  _os_crash_msg();
                  __break(1u);
LABEL_76:
                  v104 = 0;
                  v119 = 0u;
                  v120 = 0u;
                  v118 = 0u;
                  memset(buf, 0, sizeof(buf));
                  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
                  v113 = 138412546;
                  v114 = v41;
                  v115 = 2112;
                  v116 = v45;
                  _os_log_send_and_compose_impl();
                  _os_crash_msg();
                  __break(1u);
                }
              }

              self = v84;
            }
            else
            {
              avt_default_log();
              v48 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v41;
                _os_log_fault_impl(&dword_1DD1FA000, v48, OS_LOG_TYPE_FAULT, "Fault: Unreachable code: Animation for key \"%@\" has no player", buf, 0xCu);
              }

              if (AVTLogAllowsInternalCrash())
                -[AVTAvatarPoseAnimation _addAnimationToAvatar:options:transitionInDuration:transitionOutDuration:isTransient:completionQueue:completionHandler:].cold.3(&v113, buf);
            }

          }
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v105, v121, 16);
      }
      while (v38);
    }

    v15 = v78;
    v19 = v79;
  }
  else
  {
    v86 = 0;
  }
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v19, "count"));
  v81 = -[AVTAvatarPoseAnimationController initWithAvatar:animationKeys:]([AVTAvatarPoseAnimationController alloc], "initWithAvatar:animationKeys:", v15, v51);
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  obj = v19;
  v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
  if (v52)
  {
    v53 = v52;
    v54 = 0;
    v55 = *(_QWORD *)v101;
    v56 = 1.0 - v33 / v28;
    v57 = v56;
    do
    {
      for (j = 0; j != v53; ++j)
      {
        if (*(_QWORD *)v101 != v55)
          objc_enumerationMutation(obj);
        v59 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * j);
        -[NSString stringByAppendingFormat:](self->_animationBaseKey, "stringByAppendingFormat:", CFSTR("-%ld"), v54 + j);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setDuration:", v28);
        objc_msgSend(v59, "setRepeatCount:", v26);
        objc_msgSend(v59, "setFillsForward:", 1);
        objc_msgSend(v59, "setFillsBackward:", 1);
        objc_msgSend(v59, "setBlendInDuration:", a5);
        objc_msgSend(v59, "setTimeOffset:", v23);
        objc_msgSend(v59, "setRemovedOnCompletion:", 0);
        if (!objc_msgSend(v51, "count") && v85)
        {
          if (v23 != 0.0)
          {
            avt_default_log();
            v61 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
              -[AVTAvatarPoseAnimation _addAnimationToAvatar:options:transitionInDuration:transitionOutDuration:isTransient:completionQueue:completionHandler:].cold.2(buf, &buf[4], v61);

          }
          v62 = (void *)MEMORY[0x1E0CD5950];
          if (v33 <= 0.0)
          {
            v91[0] = MEMORY[0x1E0C809B0];
            v91[1] = 3221225472;
            v91[2] = __145__AVTAvatarPoseAnimation__addAnimationToAvatar_options_transitionInDuration_transitionOutDuration_isTransient_completionQueue_completionHandler___block_invoke_2;
            v91[3] = &unk_1EA61E800;
            v92 = v81;
            v94 = v83;
            v93 = v80;
            objc_msgSend(v62, "animationEventWithKeyTime:block:", v91, 1.0);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v109 = v71;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v109, 1);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "setAnimationEvents:", v72);

            v64 = v94;
            v73 = (id *)&v92;
          }
          else
          {
            v98[0] = MEMORY[0x1E0C809B0];
            v98[1] = 3221225472;
            v98[2] = __145__AVTAvatarPoseAnimation__addAnimationToAvatar_options_transitionInDuration_transitionOutDuration_isTransient_completionQueue_completionHandler___block_invoke;
            v98[3] = &unk_1EA61E7B0;
            v99[0] = v81;
            *(double *)&v99[1] = v33;
            objc_msgSend(v62, "animationEventWithKeyTime:block:", v98, v57);
            v63 = objc_claimAutoreleasedReturnValue();
            v64 = (void *)v63;
            if (v83)
            {
              v65 = v80;
              if (!v80)
              {
                avt_default_log();
                v66 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
                  -[AVTAvatarPoseAnimation _addAnimationToAvatar:options:transitionInDuration:transitionOutDuration:isTransient:completionQueue:completionHandler:].cold.1((uint8_t *)&v113, &v114, v66);

                v65 = 0;
              }
              v67 = (void *)MEMORY[0x1E0CD5950];
              v95[0] = MEMORY[0x1E0C809B0];
              v95[1] = 3221225472;
              v95[2] = __145__AVTAvatarPoseAnimation__addAnimationToAvatar_options_transitionInDuration_transitionOutDuration_isTransient_completionQueue_completionHandler___block_invoke_110;
              v95[3] = &unk_1EA61E7D8;
              v96 = v65;
              v97 = v83;
              objc_msgSend(v67, "animationEventWithKeyTime:block:", v95, 1.0);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              v111[0] = v64;
              v111[1] = v68;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v111, 2);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "setAnimationEvents:", v69);

              v70 = v96;
            }
            else
            {
              v110 = v63;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v110, 1);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "setAnimationEvents:", v70);
            }

            v73 = (id *)v99;
          }

          self = v84;
        }
        objc_msgSend(v87, "addAnimation:forKey:", v59, v60);
        objc_msgSend(v51, "addObject:", v60);
        objc_msgSend(v59, "keyPath");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "removeObjectForKey:", v74);

      }
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v112, 16);
      v54 += j;
    }
    while (v53);
  }

  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v88[2] = __145__AVTAvatarPoseAnimation__addAnimationToAvatar_options_transitionInDuration_transitionOutDuration_isTransient_completionQueue_completionHandler___block_invoke_112;
  v88[3] = &unk_1EA61E828;
  v89 = v87;
  v90 = v33;
  v75 = v87;
  objc_msgSend(v86, "enumerateKeysAndObjectsUsingBlock:", v88);

  return v81;
}

uint64_t __145__AVTAvatarPoseAnimation__addAnimationToAvatar_options_transitionInDuration_transitionOutDuration_isTransient_completionQueue_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAnimationWithBlendOutDuration:", *(double *)(a1 + 40));
}

void __145__AVTAvatarPoseAnimation__addAnimationToAvatar_options_transitionInDuration_transitionOutDuration_isTransient_completionQueue_completionHandler___block_invoke_110(uint64_t a1)
{
  dispatch_async(*(dispatch_queue_t *)(a1 + 32), *(dispatch_block_t *)(a1 + 40));
}

void __145__AVTAvatarPoseAnimation__addAnimationToAvatar_options_transitionInDuration_transitionOutDuration_isTransient_completionQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "removeAnimationWithBlendOutDuration:", 0.0);
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    v3 = *(NSObject **)(a1 + 40);
    if (!v3)
    {
      avt_default_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __145__AVTAvatarPoseAnimation__addAnimationToAvatar_options_transitionInDuration_transitionOutDuration_isTransient_completionQueue_completionHandler___block_invoke_2_cold_1(v4, v5, v6);

      v3 = *(NSObject **)(a1 + 40);
      v2 = *(void **)(a1 + 48);
    }
    dispatch_async(v3, v2);
  }
}

void __145__AVTAvatarPoseAnimation__addAnimationToAvatar_options_transitionInDuration_transitionOutDuration_isTransient_completionQueue_completionHandler___block_invoke_112(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 32), "removeAnimationForKey:blendOutDuration:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), *(double *)(a1 + 40));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

+ (id)animationFromDataRepresentation:(id)a3 keyPath:(id)a4
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB3710];
  v5 = a3;
  objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)dataRepresentationForAnimation:(id)a3 completionHandler:(id)a4
{
  void *v5;
  void (**v6)(id, void *, id);
  id v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0CB36F8];
  v6 = (void (**)(id, void *, id))a4;
  v7 = a3;
  objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 0, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v6[2](v6, v8, v9);
}

+ (id)animationFromDictionaryRepresentation:(id)a3 keyPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  float v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("valuesByKeyTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("self.floatValue"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortedArrayUsingDescriptors:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __72__AVTAvatarPoseAnimation_animationFromDictionaryRepresentation_keyPath___block_invoke;
  v23[3] = &unk_1EA61E850;
  v24 = v10;
  v25 = v7;
  v26 = v11;
  v16 = v11;
  v17 = v7;
  v18 = v10;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v23);
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", v5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("duration"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "floatValue");
  objc_msgSend(v19, "setDuration:", v21);

  objc_msgSend(v19, "setUsesSceneTimeBase:", 1);
  objc_msgSend(v19, "setValues:", v16);
  objc_msgSend(v19, "setKeyTimes:", v18);

  return v19;
}

void __72__AVTAvatarPoseAnimation_animationFromDictionaryRepresentation_keyPath___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(v5, "floatValue");
  objc_msgSend(v4, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_10;
    v7 = v11;
    if (objc_msgSend(v7, "count") == 3)
    {
      objc_msgSend(v7, "avt_float3");
      v8 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB3B18], "avt_valueWithFloat3_usableWithKVCForSCNVector3:");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v7, "count") != 4)
      {
LABEL_9:

        goto LABEL_10;
      }
      objc_msgSend(v7, "avt_float4");
      v8 = *(void **)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CB3B18], "avt_valueWithFloat4_usableWithKVCForSCNVector4:");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;
    objc_msgSend(v8, "addObject:", v9);

    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v11);
LABEL_10:

}

+ (void)dictionaryRepresentationForAnimation:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  id v11;
  id v12;
  void *v13;
  float32x4_t v14;
  float32x4_t v15;
  void *v16;
  uint64_t v17;
  unsigned int v18;
  unint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  float32x4_t v32;
  uint32x4_t v33;
  unsigned int v34;
  float32x4_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  void (**v44)(_QWORD, _QWORD, _QWORD);
  void *v45;
  void (**v46)(_QWORD, _QWORD, _QWORD);
  id v47;
  void *v48;
  int v49;
  void (**v50)(uint64_t, void *);
  void *v51;
  void *v52;
  uint64_t v53;
  unint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  unint64_t v63;
  uint64_t v64;
  id v65;
  id v66;
  float32x4_t v67;
  float32x4_t v68;
  double v69;
  double v70;
  double v71;
  double v72;
  unsigned int v73;
  _QWORD v74[2];
  uint64_t (*v75)(uint64_t, void *);
  void *v76;
  id v77;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "caAnimation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    +[AVTAvatarPoseAnimation dictionaryRepresentationForAnimation:completionHandler:].cold.1();
  v8 = v7;
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v75 = __81__AVTAvatarPoseAnimation_dictionaryRepresentationForAnimation_completionHandler___block_invoke_2;
  v76 = &unk_1EA61E878;
  v77 = v8;
  objc_msgSend(v8, "keyPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("transform"));

  if (!v10)
  {
    objc_msgSend(v8, "keyPath");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
    v47 = v5;
    if (objc_msgSend(v45, "isEqualToString:", CFSTR("position")))
    {

    }
    else
    {
      objc_msgSend(v8, "keyPath");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "isEqualToString:", CFSTR("eulerAngles"));

      if (!v49)
      {
        v50 = (void (**)(uint64_t, void *))&__block_literal_global_138;
        goto LABEL_23;
      }
    }
    v50 = (void (**)(uint64_t, void *))&__block_literal_global_141;
LABEL_23:
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v8, "keyTimes");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "count");

    if (v53)
    {
      v54 = 0;
      do
      {
        objc_msgSend(v8, "keyTimes");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "objectAtIndexedSubscript:", v54);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v75((uint64_t)v74, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "stringValue");
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "values");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "objectAtIndexedSubscript:", v54);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v50[2]((uint64_t)v50, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "setObject:forKeyedSubscript:", v61, v58);
        ++v54;
        objc_msgSend(v8, "keyTimes");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend(v62, "count");

      }
      while (v54 < v63);
    }
    objc_msgSend(v8, "keyPath");
    v64 = objc_claimAutoreleasedReturnValue();
    __81__AVTAvatarPoseAnimation_dictionaryRepresentationForAnimation_completionHandler___block_invoke(v64, v8, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v46;
    v12 = (id)v64;
    ((void (**)(_QWORD, uint64_t, void *))v44)[2](v44, v64, v13);
    v5 = v47;
    goto LABEL_27;
  }
  v66 = v6;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CD59D0], "node");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "simdPosition");
  v68 = v14;
  objc_msgSend(v13, "simdOrientation");
  v67 = v15;
  objc_msgSend(v8, "keyTimes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    v65 = v5;
    LOBYTE(v18) = 0;
    LOBYTE(v73) = 0;
    v19 = 0;
    do
    {
      v20 = v11;
      v21 = v12;
      objc_msgSend(v8, "keyTimes", v65);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v75((uint64_t)v74, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringValue");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "values");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndexedSubscript:", v19);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "avt_float4x4Value");
      v71 = v29;
      v72 = v28;
      v69 = v31;
      v70 = v30;
      objc_msgSend(MEMORY[0x1E0CD5A38], "begin");
      objc_msgSend(v13, "setSimdTransform:", v72, v71, v70, v69);
      objc_msgSend(MEMORY[0x1E0CD5A38], "commit");
      if ((v18 & 1) != 0)
      {
        LOBYTE(v18) = 1;
      }
      else
      {
        objc_msgSend(v13, "simdPosition");
        v33 = (uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(v68, v32));
        v33.i32[3] = v33.i32[2];
        v18 = vmaxvq_u32(v33) >> 31;
      }
      v12 = v21;
      if ((v73 & 1) != 0)
      {
        v34 = 1;
      }
      else
      {
        objc_msgSend(v13, "simdOrientation");
        v34 = vmaxvq_u32((uint32x4_t)vmvnq_s8((int8x16_t)vceqq_f32(v67, v35))) >> 31;
      }
      v73 = v34;
      v11 = v20;
      v36 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend(v13, "simdPosition");
      objc_msgSend(v36, "avt_arrayWithFloat3:");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v37, v25);

      v38 = (void *)MEMORY[0x1E0C99D20];
      objc_msgSend(v13, "simdOrientation");
      objc_msgSend(v38, "avt_arrayWithFloat4:");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v39, v25);

      ++v19;
      objc_msgSend(v8, "keyTimes");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count");

    }
    while (v19 < v41);
    if ((v18 & 1) != 0)
    {
      __81__AVTAvatarPoseAnimation_dictionaryRepresentationForAnimation_completionHandler___block_invoke(v42, v8, v20);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (void (**)(_QWORD, _QWORD, _QWORD))v66;
      (*((void (**)(id, const __CFString *, void *))v66 + 2))(v66, CFSTR("position"), v43);

      v5 = v65;
      if ((v73 & 1) == 0)
        goto LABEL_27;
      goto LABEL_21;
    }
    v5 = v65;
    v44 = (void (**)(_QWORD, _QWORD, _QWORD))v66;
    if (v73)
    {
LABEL_21:
      __81__AVTAvatarPoseAnimation_dictionaryRepresentationForAnimation_completionHandler___block_invoke(v42, v8, v12);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, const __CFString *, void *))v44)[2](v44, CFSTR("orientation"), v51);

    }
  }
  else
  {
    v44 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  }
LABEL_27:

}

id __81__AVTAvatarPoseAnimation_dictionaryRepresentationForAnimation_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "duration");
  v10 = v9;

  *(float *)&v11 = v10;
  objc_msgSend(v8, "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("duration"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("valuesByKeyTime"));
  return v7;
}

uint64_t __81__AVTAvatarPoseAnimation_dictionaryRepresentationForAnimation_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  float v8;
  float v9;
  double v10;
  double v11;
  float v12;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "beginTime");
  v7 = v6;
  objc_msgSend(v5, "floatValue");
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 32), "timeOffset");
  v11 = v9 - v10;
  objc_msgSend(*(id *)(a1 + 32), "speed");
  return objc_msgSend(v3, "numberWithDouble:", v7 + v11 / v12);
}

id __81__AVTAvatarPoseAnimation_dictionaryRepresentationForAnimation_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return a2;
}

id __81__AVTAvatarPoseAnimation_dictionaryRepresentationForAnimation_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "avt_float3Value");
    objc_msgSend(MEMORY[0x1E0C99D20], "avt_arrayWithFloat3:");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = v2;
  }
  v4 = v3;

  return v4;
}

+ (id)optimizeAnimation:(id)a3 target:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "setUsesSceneTimeBase:", 1);
  objc_msgSend(v5, "_optimizeKeyframesWithTarget:", v6);

  objc_msgSend(v5, "setUsesSceneTimeBase:", 0);
  return v5;
}

+ (void)removeAllAnimationsFromAvatar:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "avatarNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "animationKeys");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "hasPrefix:", CFSTR("kAVTPoseAnimation-")))
        {

          v17 = 0u;
          v18 = 0u;
          v15 = 0u;
          v16 = 0u;
          v9 = v4;
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v16;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v16 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * j);
                if (objc_msgSend(v14, "hasPrefix:", CFSTR("kAVTPoseAnimation-"), (_QWORD)v15))
                  objc_msgSend(v3, "removeAnimationForKey:", v14);
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
            }
            while (v11);
          }

          goto LABEL_20;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v6)
        continue;
      break;
    }
  }

  objc_msgSend(v3, "removeAllAnimations");
LABEL_20:

}

- (id)physicalizedPose
{
  return -[AVTAvatarPhysicalizedPose initWithPose:physicsStates:]([AVTAvatarPhysicalizedPose alloc], "initWithPose:physicsStates:", self->_staticPose, self->_staticPhysicsStates);
}

- (AVTAvatarPose)staticPose
{
  return self->_staticPose;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationBaseKey, 0);
  objc_storeStrong((id *)&self->_perNodeAnimations, 0);
  objc_storeStrong((id *)&self->_blendshapeAnimations, 0);
  objc_storeStrong((id *)&self->_staticPhysicsStates, 0);
  objc_storeStrong((id *)&self->_staticPose, 0);
}

- (void)initWithSceneAtURL:(NSObject *)a3 usdaMetadata:.cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v5;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_1_4(&dword_1DD1FA000, a3, v7, "Error: could not load scene at %@ with error: %@", (uint8_t *)&v8);

}

- (void)_addAnimationToAvatar:(NSObject *)a3 options:transitionInDuration:transitionOutDuration:isTransient:completionQueue:completionHandler:.cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "completionQueue";
}

- (void)_addAnimationToAvatar:(NSObject *)a3 options:transitionInDuration:transitionOutDuration:isTransient:completionQueue:completionHandler:.cold.2(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 136315138;
  *a2 = "timeOffset == 0.0";
  OUTLINED_FUNCTION_0_2(&dword_1DD1FA000, a3, (uint64_t)a3, "Error: Condition '%s' failed. Needs more work to support timeOffset + SCNAnimationEvent", a1);
}

- (void)_addAnimationToAvatar:(_QWORD *)a1 options:(_OWORD *)a2 transitionInDuration:transitionOutDuration:isTransient:completionQueue:completionHandler:.cold.3(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void __145__AVTAvatarPoseAnimation__addAnimationToAvatar_options_transitionInDuration_transitionOutDuration_isTransient_completionQueue_completionHandler___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "completionQueue";
}

+ (void)dictionaryRepresentationForAnimation:completionHandler:.cold.1()
{
  __assert_rtn("+[AVTAvatarPoseAnimation dictionaryRepresentationForAnimation:completionHandler:]", "AVTAvatarPoseAnimation.m", 821, "0 && \"Unsupported CAPropertyAnimation subclass\");
}

@end
