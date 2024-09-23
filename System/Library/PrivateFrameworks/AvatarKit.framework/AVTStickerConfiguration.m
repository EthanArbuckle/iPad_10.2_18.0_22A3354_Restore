@implementation AVTStickerConfiguration

+ (id)allStickerPackNames
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("stickers");
  v3[1] = CFSTR("stickersPrerelease");
  v3[2] = CFSTR("posesPack");
  v3[3] = CFSTR("posesPackPrerelease");
  v3[4] = CFSTR("memojiEditorThumbnails");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)stickerConfigurationsForMemoji
{
  return (id)objc_msgSend(a1, "_stickerConfigurationsForPuppetNamed:inStickerPack:", CFSTR("memoji"), CFSTR("stickers"));
}

+ (id)stickerConfigurationsForAnimojiNamed:(id)a3
{
  return (id)objc_msgSend(a1, "_stickerConfigurationsForPuppetNamed:inStickerPack:", a3, CFSTR("stickers"));
}

+ (id)stickerConfigurationsForMemojiInStickerPack:(id)a3
{
  return (id)objc_msgSend(a1, "_stickerConfigurationsForPuppetNamed:inStickerPack:", CFSTR("memoji"), a3);
}

+ (id)_stickerConfigurationsForPuppetNamed:(id)a3 inStickerPack:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v19;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  AVTPrecompiledStickerPackPlistForPuppetNamed(v6, a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v7;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v23;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v11), "stringByAppendingPathComponent:", CFSTR("stickerConfiguration.json"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[AVTResourceLocator sharedResourceLocator]();
        v13 = (id *)objc_claimAutoreleasedReturnValue();
        -[AVTResourceLocator urlForStickerResourceAtPath:isDirectory:](v13, (uint64_t)v12, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_alloc((Class)a1);
        objc_msgSend(v14, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v15, "initWithConfigurationAtPath:forStickerPack:", v16, v6);

        if (v17)
          objc_msgSend(v21, "addObject:", v17);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v9);
  }

  return v21;
}

+ (id)stickerConfigurationForMemojiInStickerPack:(id)a3 stickerName:(id)a4
{
  return (id)objc_msgSend(a1, "_stickerConfigurationForPuppetNamed:inStickerPack:stickerName:", CFSTR("memoji"), a3, a4);
}

+ (id)_stickerConfigurationForPuppetNamed:(id)a3 inStickerPack:(id)a4 stickerName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  AVTPrecompiledStickerPackPlistForPuppetNamed(v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "indexOfObject:", v10);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    avt_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v27 = v10;
      v28 = 2112;
      v29 = v9;
      v30 = 2112;
      v31 = v8;
      _os_log_error_impl(&dword_1DD1FA000, v14, OS_LOG_TYPE_ERROR, "Error: Failed to find sticker \"%@\" in pack \"%@\" for puppet named \"%@\", buf, 0x20u);
    }

    v15 = 0;
  }
  else
  {
    v16 = v13;
    objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "objectAtIndexedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingPathComponent:", CFSTR("stickerConfiguration.json"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTResourceLocator sharedResourceLocator]();
    v19 = (id *)objc_claimAutoreleasedReturnValue();
    -[AVTResourceLocator urlForStickerResourceAtPath:isDirectory:](v19, (uint64_t)v18, 0);
    v20 = v8;
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_alloc((Class)a1);
    objc_msgSend(v21, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v22, "initWithConfigurationAtPath:forStickerPack:", v23, v9);

    v8 = v20;
  }

  return v15;
}

+ (id)unavailableAnimojiNamesForStickerPack:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  AVTPrecompiledStickerPackPlist(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("unavailableAnimoji"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = (void *)MEMORY[0x1E0C9AA60];
  v6 = v4;

  return v6;
}

+ (id)availableStickerNamesForMemojiInStickerPack:(id)a3
{
  return (id)objc_msgSend(a1, "_availableStickerNamesForPuppetNamed:inStickerPack:", CFSTR("memoji"), a3);
}

+ (id)_availableStickerNamesForPuppetNamed:(id)a3 inStickerPack:(id)a4
{
  void *v4;
  void *v5;

  AVTPrecompiledStickerPackPlistForPuppetNamed(a4, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (AVTStickerConfiguration)initWithConfigurationAtPath:(id)a3
{
  return -[AVTStickerConfiguration initWithConfigurationAtPath:forStickerPack:](self, "initWithConfigurationAtPath:forStickerPack:", a3, CFSTR("stickers"));
}

- (AVTStickerConfiguration)initWithConfigurationAtPath:(id)a3 forStickerPack:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  AVTStickerConfiguration *v14;
  id v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "stringByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v6, 8, &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v18;
  if (!v9
    || (v11 = v10,
        v17 = v10,
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v9, 0, &v17),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = v17,
        v11,
        v13))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Sticker Configuration could not be created, data not JSON or empty"), 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
  v14 = -[AVTStickerConfiguration initWithConfigDictionary:assetsPath:forStickerPack:](self, "initWithConfigDictionary:assetsPath:forStickerPack:", v12, v8, v7);

  return v14;
}

- (AVTStickerConfiguration)initWithConfigDictionary:(id)a3 assetsPath:(id)a4 forStickerPack:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  AVTStickerConfiguration *v14;
  AVTStickerConfiguration *v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "objectForKey:", CFSTR("options"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(v10, "lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = -[AVTStickerConfiguration initWithName:pose:bodyPose:props:shaders:camera:options:](self, "initWithName:pose:bodyPose:props:shaders:camera:options:", v13, 0, 0, 0, 0, 0, v12);
  v15 = v14;
  if (v14)
  {
    v14->_hasLoadedFromConfiguration = 0;
    objc_storeStrong((id *)&v14->_configurationDictionary, a3);
    objc_storeStrong((id *)&v15->_assetsPath, a4);
    objc_storeStrong((id *)&v15->_stickerPack, a5);
  }

  return v15;
}

- (AVTStickerConfiguration)initWithName:(id)a3 poseAnimation:(id)a4 bodyPose:(id)a5 props:(id)a6 shaders:(id)a7 camera:(id)a8 options:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  AVTStickerConfiguration *v23;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a3;
  objc_msgSend(a4, "physicalizedPose");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[AVTStickerConfiguration initWithName:pose:bodyPose:props:shaders:camera:options:](self, "initWithName:pose:bodyPose:props:shaders:camera:options:", v21, v22, v20, v19, v18, v17, v16);

  return v23;
}

- (AVTStickerConfiguration)initWithName:(id)a3 pose:(id)a4 props:(id)a5 shaders:(id)a6 camera:(id)a7 options:(id)a8
{
  return -[AVTStickerConfiguration initWithName:pose:bodyPose:props:shaders:camera:options:](self, "initWithName:pose:bodyPose:props:shaders:camera:options:", a3, a4, 0, a5, a6, a7, a8);
}

- (AVTStickerConfiguration)initWithName:(id)a3 pose:(id)a4 bodyPose:(id)a5 props:(id)a6 shaders:(id)a7 camera:(id)a8 options:(id)a9
{
  id v16;
  id v17;
  AVTStickerConfiguration *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSString *localizedName;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v16 = a3;
  v34 = a4;
  v33 = a5;
  v32 = a6;
  v31 = a7;
  v30 = a8;
  v17 = a9;
  v35.receiver = self;
  v35.super_class = (Class)AVTStickerConfiguration;
  v18 = -[AVTStickerConfiguration init](&v35, sel_init);
  if (v18)
  {
    if (!v16)
    {
      avt_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[AVTAnimoji initWithName:error:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);

    }
    objc_storeStrong((id *)&v18->_name, a3);
    AVTLocalizedStickerName(v16);
    v27 = objc_claimAutoreleasedReturnValue();
    localizedName = v18->_localizedName;
    v18->_localizedName = (NSString *)v27;

    objc_storeStrong((id *)&v18->_physicalizedPose, a4);
    objc_storeStrong((id *)&v18->_bodyPose, a5);
    objc_storeStrong((id *)&v18->_props, a6);
    objc_storeStrong((id *)&v18->_shaderModifiers, a7);
    objc_storeStrong((id *)&v18->_camera, a8);
    v18->_stickerVersion = 1;
    -[AVTStickerConfiguration setupOptions:](v18, "setupOptions:", v17);
  }

  return v18;
}

- (id)framingMode
{
  if (self->_camera)
    return 0;
  else
    return CFSTR("camera");
}

- (BOOL)hasProps
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (-[AVTStickerConfiguration hasLoadedFromConfiguration](self, "hasLoadedFromConfiguration")
    || (-[AVTStickerConfiguration configurationDictionary](self, "configurationDictionary"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    v6 = -[NSArray count](self->_props, "count");
  }
  else
  {
    -[AVTStickerConfiguration configurationDictionary](self, "configurationDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("props"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "count");
  }
  return v6 != 0;
}

- (BOOL)showsBody
{
  void *v3;
  void *v4;
  void *bodyPose;

  if (-[AVTStickerConfiguration hasLoadedFromConfiguration](self, "hasLoadedFromConfiguration")
    || (-[AVTStickerConfiguration configurationDictionary](self, "configurationDictionary"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    bodyPose = self->_bodyPose;
  }
  else
  {
    -[AVTStickerConfiguration configurationDictionary](self, "configurationDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("body-pose"));
    bodyPose = (void *)objc_claimAutoreleasedReturnValue();

  }
  return bodyPose != 0;
}

- (BOOL)definesPoseOnly
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  if (-[AVTStickerConfiguration hasLoadedFromConfiguration](self, "hasLoadedFromConfiguration"))
    return !-[NSArray count](self->_props, "count") && self->_bodyPose == 0;
  -[AVTStickerConfiguration configurationDictionary](self, "configurationDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    return !-[NSArray count](self->_props, "count") && self->_bodyPose == 0;
  }
  else
  {
    -[AVTStickerConfiguration configurationDictionary](self, "configurationDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("props"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTStickerConfiguration configurationDictionary](self, "configurationDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("body-pose"));
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = (objc_msgSend(v5, "count") | v7) == 0;
  }
  return v8;
}

- (AVTAvatarPoseAnimation)poseAnimation
{
  AVTAvatarPoseAnimation *v3;
  void *v4;
  void *v5;
  AVTAvatarPoseAnimation *v6;

  v3 = [AVTAvatarPoseAnimation alloc];
  -[AVTAvatarPhysicalizedPose pose](self->_physicalizedPose, "pose");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTAvatarPhysicalizedPose physicsStates](self->_physicalizedPose, "physicsStates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AVTAvatarPoseAnimation initWithStaticPose:staticPhysicsStates:](v3, "initWithStaticPose:staticPhysicsStates:", v4, v5);

  return v6;
}

- (void)setupOptions:(id)a3
{
  id v4;
  NSNumber *v5;
  NSNumber *legacySizeOption;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSArray *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  NSArray *presetOverrides;
  void *v26;
  NSArray *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  NSArray *morpherOverrides;
  id v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("size"));
  v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  legacySizeOption = self->_legacySizeOption;
  self->_legacySizeOption = v5;

  if (self->_legacySizeOption && (setupOptions__done & 1) == 0)
  {
    setupOptions__done = 1;
    avt_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[AVTStickerConfiguration setupOptions:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
  objc_msgSend(v4, "valueForKey:", CFSTR("presetOverrides"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v15;
  if (objc_msgSend(v15, "count"))
  {
    v35 = v4;
    v16 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v17 = v15;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v42 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v17, "objectForKeyedSubscript:", v22, v35);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[AVTStickerPresetOverride presetOverrideFromDictionary:forCategoryName:](AVTStickerPresetOverride, "presetOverrideFromDictionary:forCategoryName:", v23, v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          -[NSArray addObject:](v16, "addObject:", v24);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v19);
    }

    presetOverrides = self->_presetOverrides;
    self->_presetOverrides = v16;

    v4 = v35;
  }
  objc_msgSend(v4, "valueForKey:", CFSTR("morpherOverrides"), v35);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "count"))
  {
    v27 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v26, "count"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v28 = v26;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v38 != v31)
            objc_enumerationMutation(v28);
          +[AVTStickerMorpherOverride morpherOverrideFromDictionary:](AVTStickerMorpherOverride, "morpherOverrideFromDictionary:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v27, "addObject:", v33);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v30);
    }

    morpherOverrides = self->_morpherOverrides;
    self->_morpherOverrides = v27;

    v15 = v36;
  }

}

- (NSString)emojiRepresentation
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_configurationDictionary, "objectForKeyedSubscript:", CFSTR("emoji"));
}

- (void)loadIfNeeded
{
  void *v3;
  AVTStickerConfiguration *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  AVTAvatarPhysicalizedPose *v14;
  AVTAvatarPhysicalizedPose *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  AVTAvatarBodyPose *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  AVTAvatarPhysicalizedPose *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[5];
  _QWORD v56[4];
  id v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if (!-[AVTStickerConfiguration hasLoadedFromConfiguration](self, "hasLoadedFromConfiguration"))
  {
    -[AVTStickerConfiguration configurationDictionary](self, "configurationDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = self;
      objc_sync_enter(v4);
      if (-[AVTStickerConfiguration hasLoadedFromConfiguration](v4, "hasLoadedFromConfiguration")
        || (-[AVTStickerConfiguration configurationDictionary](v4, "configurationDictionary"),
            v5 = (void *)objc_claimAutoreleasedReturnValue(),
            v5,
            !v5))
      {
LABEL_47:
        objc_sync_exit(v4);

        return;
      }
      -[AVTStickerConfiguration configurationDictionary](v4, "configurationDictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTStickerConfiguration assetsPath](v4, "assetsPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTStickerConfiguration physicalizedPose](v4, "physicalizedPose");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
LABEL_16:
        -[AVTStickerConfiguration bodyPose](v4, "bodyPose");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20 == 0;

        if (v21)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("body-pose"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            v23 = -[AVTAvatarBodyPose initWithDictionaryRepresentation:]([AVTAvatarBodyPose alloc], "initWithDictionaryRepresentation:", v22);
            -[AVTStickerConfiguration setBodyPose:](v4, "setBodyPose:", v23);

          }
        }
        -[AVTStickerConfiguration props](v4, "props");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24 == 0;

        if (v25)
        {
          objc_msgSend(v6, "objectForKey:", CFSTR("props"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v26, "count"));
          v53 = 0u;
          v54 = 0u;
          v51 = 0u;
          v52 = 0u;
          v28 = v26;
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
          if (v29)
          {
            v30 = *(_QWORD *)v52;
            do
            {
              v31 = 0;
              do
              {
                if (*(_QWORD *)v52 != v30)
                  objc_enumerationMutation(v28);
                +[AVTStickerProp propFromDictionary:assetsPath:](AVTStickerProp, "propFromDictionary:assetsPath:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v31), v7);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                if (v32)
                  objc_msgSend(v27, "addObject:", v32);

                ++v31;
              }
              while (v29 != v31);
              v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
            }
            while (v29);
          }

          -[AVTStickerConfiguration setProps:](v4, "setProps:", v27);
        }
        -[AVTStickerConfiguration shaderModifiers](v4, "shaderModifiers");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v33 == 0;

        if (v34)
        {
          objc_msgSend(v6, "objectForKey:", CFSTR("shaders"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v35, "count"));
          v49 = 0u;
          v50 = 0u;
          v47 = 0u;
          v48 = 0u;
          v37 = v35;
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
          if (v38)
          {
            v39 = *(_QWORD *)v48;
            do
            {
              v40 = 0;
              do
              {
                if (*(_QWORD *)v48 != v39)
                  objc_enumerationMutation(v37);
                +[AVTStickerShaderModifier shaderModifierFromDictionary:assetsPath:](AVTStickerShaderModifier, "shaderModifierFromDictionary:assetsPath:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v40), v7, (_QWORD)v47);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                if (v41)
                  objc_msgSend(v36, "addObject:", v41);

                ++v40;
              }
              while (v38 != v40);
              v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
            }
            while (v38);
          }

          -[AVTStickerConfiguration setShaderModifiers:](v4, "setShaderModifiers:", v36);
        }
        -[AVTStickerConfiguration camera](v4, "camera", (_QWORD)v47);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v42 == 0;

        if (v43)
        {
          objc_msgSend(v6, "objectForKey:", CFSTR("camera"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v44)
          {
            +[AVTStickerCamera cameraFromDictionary:assetsPath:](AVTStickerCamera, "cameraFromDictionary:assetsPath:", v44, v7);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[AVTStickerConfiguration setCamera:](v4, "setCamera:", v45);

          }
        }
        -[AVTStickerConfiguration setHasLoadedFromConfiguration:](v4, "setHasLoadedFromConfiguration:", 1);

        goto LABEL_47;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pose"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("physicsState"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v7, "stringByAppendingPathComponent:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "fileURLWithPath:isDirectory:", v12, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = -[AVTAvatarPhysicalizedPose initWithSceneAtURL:]([AVTAvatarPhysicalizedPose alloc], "initWithSceneAtURL:", v13);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v15 = -[AVTAvatarPhysicalizedPose initWithPoseRepresentation:physicsStatesRepresentation:]([AVTAvatarPhysicalizedPose alloc], "initWithPoseRepresentation:physicsStatesRepresentation:", v9, v10);
LABEL_12:
          -[AVTStickerConfiguration setPhysicalizedPose:](v4, "setPhysicalizedPose:", v15);
          objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("pose-adjustments"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v16, "count"));
              v18 = MEMORY[0x1E0C809B0];
              v56[0] = MEMORY[0x1E0C809B0];
              v56[1] = 3221225472;
              v56[2] = __39__AVTStickerConfiguration_loadIfNeeded__block_invoke;
              v56[3] = &unk_1EA61F098;
              v19 = v17;
              v57 = v19;
              v55[0] = v18;
              v55[1] = 3221225472;
              v55[2] = __39__AVTStickerConfiguration_loadIfNeeded__block_invoke_2;
              v55[3] = &__block_descriptor_40_e25_v32__0__NSString_8_16_B24lu32l8;
              v55[4] = v56;
              objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v55);
              -[AVTStickerConfiguration setPoseAdjustments:](v4, "setPoseAdjustments:", v19);

            }
          }

          goto LABEL_16;
        }
        v46 = [AVTAvatarPhysicalizedPose alloc];
        +[AVTAvatarPose neutralPose](AVTAvatarPose, "neutralPose");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[AVTAvatarPhysicalizedPose initWithPose:physicsStates:](v46, "initWithPose:physicsStates:", v13, 0);
      }
      v15 = v14;

      goto LABEL_12;
    }
  }
}

void __39__AVTStickerConfiguration_loadIfNeeded__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  AVTStickerPoseAdjustment *v6;
  void *v7;
  AVTAvatarPose *v8;
  id v9;

  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pose"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(AVTStickerPoseAdjustment);
  -[AVTStickerPoseAdjustment setPresetCategory:](v6, "setPresetCategory:", a2);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("value"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTStickerPoseAdjustment setPresetIdentifier:](v6, "setPresetIdentifier:", v7);
  v8 = -[AVTAvatarPose initWithDictionaryRepresentation:]([AVTAvatarPose alloc], "initWithDictionaryRepresentation:", v9);
  -[AVTStickerPoseAdjustment setPose:](v6, "setPose:", v8);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
}

void __39__AVTStickerConfiguration_loadIfNeeded__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  AVTPresetCategoryFromString(a2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)unload
{
  void *v3;
  void *v4;
  AVTStickerConfiguration *obj;

  if (-[AVTStickerConfiguration hasLoadedFromConfiguration](self, "hasLoadedFromConfiguration"))
  {
    -[AVTStickerConfiguration configurationDictionary](self, "configurationDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      obj = self;
      objc_sync_enter(obj);
      if (-[AVTStickerConfiguration hasLoadedFromConfiguration](obj, "hasLoadedFromConfiguration"))
      {
        -[AVTStickerConfiguration configurationDictionary](obj, "configurationDictionary");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        if (v4)
        {
          -[AVTStickerConfiguration setPhysicalizedPose:](obj, "setPhysicalizedPose:", 0);
          -[AVTStickerConfiguration setBodyPose:](obj, "setBodyPose:", 0);
          -[AVTStickerConfiguration setPoseAdjustments:](obj, "setPoseAdjustments:", 0);
          -[AVTStickerConfiguration setProps:](obj, "setProps:", 0);
          -[AVTStickerConfiguration setShaderModifiers:](obj, "setShaderModifiers:", 0);
          -[AVTStickerConfiguration setCamera:](obj, "setCamera:", 0);
          -[AVTStickerConfiguration setHasLoadedFromConfiguration:](obj, "setHasLoadedFromConfiguration:", 0);
        }
      }
      objc_sync_exit(obj);

    }
  }
}

- (void)_updateDictionary:(id)a3 withTargetPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[AVTStickerConfiguration props](self, "props", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13), "dictionaryWithTargetPath:", v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("props"));
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[AVTStickerConfiguration name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AVTStickerConfiguration hasLoadedFromConfiguration](self, "hasLoadedFromConfiguration"))
  {
    -[AVTStickerConfiguration dictionaryWithTargetPath:](self, "dictionaryWithTargetPath:", CFSTR("/"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> \"%@\" %@"), v4, self, v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p> \"%@\" %@"), v4, self, v5, CFSTR("Unloaded"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)dictionaryWithTargetPath:(id)a3
{
  id v4;
  NSDictionary *configurationDictionary;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[AVTStickerConfiguration loadIfNeeded](self, "loadIfNeeded");
  configurationDictionary = self->_configurationDictionary;
  if (configurationDictionary)
  {
    v6 = -[NSDictionary mutableCopy](configurationDictionary, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  -[AVTStickerConfiguration _updateDictionary:withTargetPath:](self, "_updateDictionary:withTargetPath:", v6, v4);

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (AVTAvatarPhysicalizedPose)physicalizedPose
{
  return self->_physicalizedPose;
}

- (void)setPhysicalizedPose:(id)a3
{
  objc_storeStrong((id *)&self->_physicalizedPose, a3);
}

- (AVTAvatarBodyPose)bodyPose
{
  return self->_bodyPose;
}

- (void)setBodyPose:(id)a3
{
  objc_storeStrong((id *)&self->_bodyPose, a3);
}

- (NSArray)props
{
  return self->_props;
}

- (void)setProps:(id)a3
{
  objc_storeStrong((id *)&self->_props, a3);
}

- (NSArray)shaderModifiers
{
  return self->_shaderModifiers;
}

- (void)setShaderModifiers:(id)a3
{
  objc_storeStrong((id *)&self->_shaderModifiers, a3);
}

- (AVTStickerCamera)camera
{
  return self->_camera;
}

- (void)setCamera:(id)a3
{
  objc_storeStrong((id *)&self->_camera, a3);
}

- (NSString)stickerPack
{
  return self->_stickerPack;
}

- (NSArray)morpherOverrides
{
  return self->_morpherOverrides;
}

- (NSArray)presetOverrides
{
  return self->_presetOverrides;
}

- (NSArray)poseAdjustments
{
  return self->_poseAdjustments;
}

- (void)setPoseAdjustments:(id)a3
{
  objc_storeStrong((id *)&self->_poseAdjustments, a3);
}

- (unint64_t)stickerVersion
{
  return self->_stickerVersion;
}

- (NSDictionary)configurationDictionary
{
  return self->_configurationDictionary;
}

- (void)setConfigurationDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_configurationDictionary, a3);
}

- (NSString)assetsPath
{
  return self->_assetsPath;
}

- (void)setAssetsPath:(id)a3
{
  objc_storeStrong((id *)&self->_assetsPath, a3);
}

- (BOOL)hasLoadedFromConfiguration
{
  return self->_hasLoadedFromConfiguration;
}

- (void)setHasLoadedFromConfiguration:(BOOL)a3
{
  self->_hasLoadedFromConfiguration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsPath, 0);
  objc_storeStrong((id *)&self->_configurationDictionary, 0);
  objc_storeStrong((id *)&self->_poseAdjustments, 0);
  objc_storeStrong((id *)&self->_presetOverrides, 0);
  objc_storeStrong((id *)&self->_morpherOverrides, 0);
  objc_storeStrong((id *)&self->_stickerPack, 0);
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_shaderModifiers, 0);
  objc_storeStrong((id *)&self->_props, 0);
  objc_storeStrong((id *)&self->_bodyPose, 0);
  objc_storeStrong((id *)&self->_physicalizedPose, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_legacySizeOption, 0);
}

- (id)legacySizeOption
{
  return self->_legacySizeOption;
}

- (CGSize)size
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSNumber *legacySizeOption;
  float v12;
  double v13;
  double v14;
  CGSize result;

  if ((size_done & 1) == 0)
  {
    size_done = 1;
    avt_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[AVTStickerConfiguration setupOptions:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  legacySizeOption = self->_legacySizeOption;
  if (legacySizeOption)
  {
    -[NSNumber floatValue](legacySizeOption, "floatValue");
    v13 = v12;
  }
  else
  {
    v13 = 140.0;
  }
  v14 = v13;
  result.height = v14;
  result.width = v13;
  return result;
}

- (BOOL)preRendered
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((preRendered_done & 1) == 0)
  {
    preRendered_done = 1;
    avt_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      -[AVTStickerConfiguration(Deprecated) preRendered].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

  }
  return 0;
}

- (void)setupOptions:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_3();
}

@end
