@implementation AVTStickerConfigurationReversionContext

- (AVTStickerConfigurationReversionContext)init
{
  AVTStickerConfigurationReversionContext *v2;
  NSMutableArray *v3;
  NSMutableArray *presetOverrides;
  NSMutableArray *v5;
  NSMutableArray *morpherOverrides;
  uint64_t v7;
  NSMapTable *shaderModifiers;
  uint64_t v9;
  NSMapTable *customMaterialProperties;
  NSMutableArray *v11;
  NSMutableArray *singleSidedMaterials;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AVTStickerConfigurationReversionContext;
  v2 = -[AVTStickerConfigurationReversionContext init](&v14, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    presetOverrides = v2->_presetOverrides;
    v2->_presetOverrides = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    morpherOverrides = v2->_morpherOverrides;
    v2->_morpherOverrides = v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    shaderModifiers = v2->_shaderModifiers;
    v2->_shaderModifiers = (NSMapTable *)v7;

    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 0);
    customMaterialProperties = v2->_customMaterialProperties;
    v2->_customMaterialProperties = (NSMapTable *)v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    singleSidedMaterials = v2->_singleSidedMaterials;
    v2->_singleSidedMaterials = v11;

  }
  return v2;
}

- (void)resetForAvatar:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  SCNNode *extraCameraNode;
  SCNNode *extraPropsNode;
  NSNumber *showMemojiBody;

  v5 = a3;
  objc_storeStrong((id *)&self->_avatar, a3);
  if (-[NSMutableArray count](self->_presetOverrides, "count"))
  {
    avt_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[AVTStickerConfigurationReversionContext resetForAvatar:].cold.7(v6, v7, v8, v9, v10, v11, v12, v13);

  }
  if (-[NSMutableArray count](self->_morpherOverrides, "count"))
  {
    avt_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[AVTStickerConfigurationReversionContext resetForAvatar:].cold.6(v14, v15, v16, v17, v18, v19, v20, v21);

  }
  if (-[NSMapTable count](self->_shaderModifiers, "count"))
  {
    avt_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[AVTStickerConfigurationReversionContext resetForAvatar:].cold.5(v22, v23, v24, v25, v26, v27, v28, v29);

  }
  if (-[NSMapTable count](self->_customMaterialProperties, "count"))
  {
    avt_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[AVTStickerConfigurationReversionContext resetForAvatar:].cold.4(v30, v31, v32, v33, v34, v35, v36, v37);

  }
  if (-[NSMutableArray count](self->_singleSidedMaterials, "count"))
  {
    avt_default_log();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      -[AVTStickerConfigurationReversionContext resetForAvatar:].cold.3(v38, v39, v40, v41, v42, v43, v44, v45);

  }
  -[NSMutableArray removeAllObjects](self->_presetOverrides, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_morpherOverrides, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_shaderModifiers, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_customMaterialProperties, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_singleSidedMaterials, "removeAllObjects");
  if (self->_extraCameraNode)
  {
    avt_default_log();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      -[AVTStickerConfigurationReversionContext resetForAvatar:].cold.2(v46, v47, v48, v49, v50, v51, v52, v53);

  }
  if (self->_extraPropsNode)
  {
    avt_default_log();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      -[AVTStickerConfigurationReversionContext resetForAvatar:].cold.1(v54, v55, v56, v57, v58, v59, v60, v61);

  }
  extraCameraNode = self->_extraCameraNode;
  self->_extraCameraNode = 0;

  extraPropsNode = self->_extraPropsNode;
  self->_extraPropsNode = 0;

  showMemojiBody = self->_showMemojiBody;
  self->_showMemojiBody = 0;

  objc_storeWeak((id *)&self->_environmentForPointOfViewUpdateFromFramingMode, 0);
}

- (void)savePresetOverride:(id)a3
{
  -[NSMutableArray addObject:](self->_presetOverrides, "addObject:", a3);
}

- (void)saveMorpherOverride:(id)a3
{
  -[NSMutableArray addObject:](self->_morpherOverrides, "addObject:", a3);
}

- (void)saveShaderModifiers:(id)a3 forMaterial:(id)a4
{
  NSMapTable *shaderModifiers;
  void *v6;
  id v7;
  id v8;

  shaderModifiers = self->_shaderModifiers;
  if (a3)
  {
    v8 = a4;
    NSMapInsertIfAbsent(shaderModifiers, v8, a3);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99E38];
    v7 = a4;
    objc_msgSend(v6, "null");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    NSMapInsertIfAbsent(shaderModifiers, v7, v8);

  }
}

- (void)saveCustomMaterialPropertyNamed:(id)a3 forMaterial:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[NSMapTable objectForKey:](self->_customMaterialProperties, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 1);
    -[NSMapTable setObject:forKey:](self->_customMaterialProperties, "setObject:forKey:", v7, v6);
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v6, "valueForKey:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v11);

    }
  }

}

- (void)saveSingleSidedForMaterial:(id)a3
{
  -[NSMutableArray addObject:](self->_singleSidedMaterials, "addObject:", a3);
}

- (void)saveShowMemojiBody:(BOOL)a3
{
  NSNumber *v4;
  NSNumber *showMemojiBody;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  showMemojiBody = self->_showMemojiBody;
  self->_showMemojiBody = v4;

}

- (void)saveExtraCameraNode:(id)a3
{
  SCNNode *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SCNNode *extraCameraNode;

  v4 = (SCNNode *)a3;
  if (self->_extraCameraNode)
  {
    avt_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[AVTStickerConfigurationReversionContext saveExtraCameraNode:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  extraCameraNode = self->_extraCameraNode;
  self->_extraCameraNode = v4;

}

- (void)saveExtraPropsNode:(id)a3
{
  SCNNode *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  SCNNode *extraPropsNode;

  v4 = (SCNNode *)a3;
  if (self->_extraPropsNode)
  {
    avt_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[AVTStickerConfigurationReversionContext saveExtraPropsNode:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  extraPropsNode = self->_extraPropsNode;
  self->_extraPropsNode = v4;

}

- (void)saveUpdatePointOfViewFromFramingModeInEnvironment:(id)a3
{
  objc_storeWeak((id *)&self->_environmentForPointOfViewUpdateFromFramingMode, a3);
}

- (void)revertChangesWithScope:(unint64_t)a3 animationDuration:(double)a4
{
  void *v7;
  void *v8;
  id WeakRetained;
  id v10;
  SCNNode *v11;
  SCNNode *extraCameraNode;
  id v13;
  SCNNode *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  AVTAvatar *avatar;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t m;
  uint64_t v43;
  void *v44;
  NSMutableArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t n;
  AVTAvatar *v50;
  NSNumber *showMemojiBody;
  SCNNode *extraPropsNode;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[5];
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  if (a4 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CD5A38], "begin");
    objc_msgSend(MEMORY[0x1E0CD5A38], "setAnimationDuration:", a4);
    v7 = (void *)MEMORY[0x1E0CD5A38];
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAnimationTimingFunction:", v8);

  }
  if (a3 != 1)
  {
    if (a3)
      goto LABEL_53;
    WeakRetained = objc_loadWeakRetained((id *)&self->_environmentForPointOfViewUpdateFromFramingMode);

    if (WeakRetained)
    {
      v10 = objc_loadWeakRetained((id *)&self->_environmentForPointOfViewUpdateFromFramingMode);
      objc_msgSend(v10, "currentPointOfView");
      v11 = (SCNNode *)objc_claimAutoreleasedReturnValue();
      extraCameraNode = self->_extraCameraNode;

      if (v11 == extraCameraNode)
      {
        v13 = objc_loadWeakRetained((id *)&self->_environmentForPointOfViewUpdateFromFramingMode);
        objc_msgSend(v13, "updatePointOfViewFromFramingMode");

      }
      objc_storeWeak((id *)&self->_environmentForPointOfViewUpdateFromFramingMode, 0);
    }
    -[SCNNode removeFromParentNode](self->_extraCameraNode, "removeFromParentNode");
    v14 = self->_extraCameraNode;
    self->_extraCameraNode = 0;

  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v15 = self->_morpherOverrides;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v71 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
        avatar = self->_avatar;
        -[AVTAvatar avatarNode](avatar, "avatarNode");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "applyToAvatar:inHierarchy:reversionContext:", avatar, v22, 0);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
    }
    while (v17);
  }

  -[NSMutableArray removeAllObjects](self->_morpherOverrides, "removeAllObjects");
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v23 = self->_presetOverrides;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v67;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v67 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * j), "applyToAvatar:reversionContext:", self->_avatar, 0);
      }
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
    }
    while (v25);
  }

  -[NSMutableArray removeAllObjects](self->_presetOverrides, "removeAllObjects");
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  -[NSMapTable keyEnumerator](self->_shaderModifiers, "keyEnumerator");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v63;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v63 != v31)
          objc_enumerationMutation(v28);
        v33 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * k);
        -[NSMapTable objectForKey:](self->_shaderModifiers, "objectForKey:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v34, "isEqual:", v35);

        if (v36)
        {

          v34 = 0;
        }
        objc_msgSend(v33, "setShaderModifiers:", v34);

      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
    }
    while (v30);
  }

  -[NSMapTable removeAllObjects](self->_shaderModifiers, "removeAllObjects");
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  -[NSMapTable keyEnumerator](self->_customMaterialProperties, "keyEnumerator");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v59;
    v41 = MEMORY[0x1E0C809B0];
    do
    {
      for (m = 0; m != v39; ++m)
      {
        if (*(_QWORD *)v59 != v40)
          objc_enumerationMutation(v37);
        v43 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * m);
        -[NSMapTable objectForKey:](self->_customMaterialProperties, "objectForKey:", v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = v41;
        v57[1] = 3221225472;
        v57[2] = __84__AVTStickerConfigurationReversionContext_revertChangesWithScope_animationDuration___block_invoke;
        v57[3] = &unk_1EA61F070;
        v57[4] = v43;
        objc_msgSend(v44, "enumerateKeysAndObjectsUsingBlock:", v57);

      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v58, v75, 16);
    }
    while (v39);
  }

  -[NSMapTable removeAllObjects](self->_customMaterialProperties, "removeAllObjects");
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v45 = self->_singleSidedMaterials;
  v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v53, v74, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v54;
    do
    {
      for (n = 0; n != v47; ++n)
      {
        if (*(_QWORD *)v54 != v48)
          objc_enumerationMutation(v45);
        objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * n), "setDoubleSided:", 0, (_QWORD)v53);
      }
      v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v53, v74, 16);
    }
    while (v47);
  }

  -[NSMutableArray removeAllObjects](self->_singleSidedMaterials, "removeAllObjects");
  if (self->_showMemojiBody)
  {
    v50 = self->_avatar;
    if (-[NSNumber BOOLValue](self->_showMemojiBody, "BOOLValue"))
    {
      -[AVTAvatar setShowsBody:](v50, "setShowsBody:", 1);
    }
    else
    {
      -[AVTAvatar setShowsBody:](v50, "setShowsBody:", 0);
      -[AVTAvatar setBodyPose:](v50, "setBodyPose:", 0);
    }
    showMemojiBody = self->_showMemojiBody;
    self->_showMemojiBody = 0;

    -[AVTAvatar update](v50, "update");
  }
  -[SCNNode removeFromParentNode](self->_extraPropsNode, "removeFromParentNode", (_QWORD)v53);
  extraPropsNode = self->_extraPropsNode;
  self->_extraPropsNode = 0;

LABEL_53:
  if (a4 > 0.0)
    objc_msgSend(MEMORY[0x1E0CD5A38], "commit");
}

void __84__AVTStickerConfigurationReversionContext_revertChangesWithScope_animationDuration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (v7)
  {

    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v5, v8);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_environmentForPointOfViewUpdateFromFramingMode);
  objc_storeStrong((id *)&self->_showMemojiBody, 0);
  objc_storeStrong((id *)&self->_extraPropsNode, 0);
  objc_storeStrong((id *)&self->_extraCameraNode, 0);
  objc_storeStrong((id *)&self->_singleSidedMaterials, 0);
  objc_storeStrong((id *)&self->_customMaterialProperties, 0);
  objc_storeStrong((id *)&self->_shaderModifiers, 0);
  objc_storeStrong((id *)&self->_morpherOverrides, 0);
  objc_storeStrong((id *)&self->_presetOverrides, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

- (void)resetForAvatar:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. Reversion context is being reused but hasn't been reverted beforehand", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)resetForAvatar:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. Reversion context is being reused but hasn't been reverted beforehand", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)resetForAvatar:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. Reversion context is being reused but hasn't been reverted beforehand", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)resetForAvatar:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. Reversion context is being reused but hasn't been reverted beforehand", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)resetForAvatar:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. Reversion context is being reused but hasn't been reverted beforehand", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)resetForAvatar:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. Reversion context is being reused but hasn't been reverted beforehand", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)resetForAvatar:(uint64_t)a3 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. Reversion context is being reused but hasn't been reverted beforehand", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)saveExtraCameraNode:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. Can't save more than one camera", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)saveExtraPropsNode:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. Can't save more than one prop container", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
