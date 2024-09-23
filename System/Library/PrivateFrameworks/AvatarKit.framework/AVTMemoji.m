@implementation AVTMemoji

+ (id)neutralMemojiDataRepresentation
{
  if (neutralMemojiDataRepresentation_onceToken != -1)
    dispatch_once(&neutralMemojiDataRepresentation_onceToken, &__block_literal_global_22);
  return (id)neutralMemojiDataRepresentation_neutralMemojiData;
}

void __44__AVTMemoji_neutralMemojiDataRepresentation__block_invoke()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  id v3;

  +[AVTResourceLocator sharedResourceLocator]();
  v0 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  -[AVTResourceLocator pathForMemojiResource:ofType:isDirectory:](v0, (uint64_t)CFSTR("editor_neutral"), (uint64_t)CFSTR("avt"), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v3, 8, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)neutralMemojiDataRepresentation_neutralMemojiData;
  neutralMemojiDataRepresentation_neutralMemojiData = v1;

}

+ (id)neutralMemojiDescriptor
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__AVTMemoji_neutralMemojiDescriptor__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (neutralMemojiDescriptor_onceToken != -1)
    dispatch_once(&neutralMemojiDescriptor_onceToken, block);
  return (id)neutralMemojiDescriptor_neutralMemojiDescriptor;
}

void __36__AVTMemoji_neutralMemojiDescriptor__block_invoke(uint64_t a1)
{
  void *v1;
  AVTMemojiDescriptor *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "neutralMemojiDataRepresentation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[AVTMemojiDescriptor initWithDictionaryRepresentation:error:isResettingToDefault:]([AVTMemojiDescriptor alloc], "initWithDictionaryRepresentation:error:isResettingToDefault:", v1, 0, 1);
  v3 = (void *)neutralMemojiDescriptor_neutralMemojiDescriptor;
  neutralMemojiDescriptor_neutralMemojiDescriptor = (uint64_t)v2;

}

+ (id)neutralMemoji
{
  void *v2;
  AVTMemoji *v3;

  objc_msgSend(a1, "neutralMemojiDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[AVTMemoji initWithDescriptor:usageIntent:error:]([AVTMemoji alloc], "initWithDescriptor:usageIntent:error:", v2, 0, 0);

  return v3;
}

+ (id)neutralMemojiPresetsIdentifiersPerCategory
{
  void *v2;
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;

  objc_msgSend(a1, "neutralMemojiDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 40);
    for (i = 0; i != 40; ++i)
    {
      objc_msgSend(v2, "presetIdentifierForCategory:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, v6);

      }
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[AVTMemoji removeAllComponents](self, "removeAllComponents");
  CGImageRelease(self->_combinedAOImage);
  self->_combinedAOImage = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVTMemoji;
  -[AVTAvatar dealloc](&v3, sel_dealloc);
}

- (void)removeAllComponents
{
  uint64_t i;

  for (i = 0; i != 42; ++i)
    -[AVTMemoji removeComponentWithType:](self, "removeComponentWithType:", i);
}

- (void)resetToDefault
{
  id v3;

  +[AVTMemoji neutralMemojiDescriptor](AVTMemoji, "neutralMemojiDescriptor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applyToMemoji:", self);

}

- (id)newDescriptor
{
  return -[AVTMemojiDescriptor initWithMemoji:]([AVTMemojiDescriptor alloc], "initWithMemoji:", self);
}

- (AVTMemoji)initWithDescriptor:(id)a3 usageIntent:(unint64_t)a4 error:(id *)a5
{
  id v7;
  AVTMemoji *v8;
  AVTMemoji *v9;
  AVTAssetResourceCache *v10;
  AVTAssetResourceCache *resourceCache;
  AVTPresetStore *v12;
  AVTPresetStore *presetStore;
  uint64_t v14;
  SCNNode *avatarNode;
  SCNNode *v16;
  SCNNode *headComponentContainer;
  SCNNode *v18;
  SCNNode *bodyComponentContainer;
  SCNNode *v20;
  SCNNode *handsComponentContainer;
  id *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSDictionary *eyesAndTongueSpecializationSettings;
  id v33;
  uint64_t v34;
  SCNNode *eyelashes;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  SCNMaterial *eyeMaterialLeft;
  void *v42;
  void *v43;
  uint64_t v44;
  SCNMaterial *eyeMaterialRight;
  void *v46;
  uint64_t v47;
  AVTComponent *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  AVTComponentInstance *v54;
  uint64_t v55;
  SCNNode *headNode;
  void *v57;
  uint64_t v58;
  AVTComponent *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  uint64_t v64;
  id *v65;
  void *v66;
  void *v67;
  id v68;
  NSObject *v69;
  uint64_t v70;
  SCNNode *skeletonRootNode;
  SCNNode *v72;
  id *v73;
  AVTCompositor *v74;
  id v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t i;
  uint64_t v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t j;
  void *v89;
  void *v90;
  AVTComponentInstance *v91;
  void *v92;
  SCNNode **p_eyesAndTongue;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  AVTMemoji *v101;
  id obj;
  void *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _QWORD v112[4];
  id *v113;
  id v114;
  id v115;
  objc_super v116;
  _BYTE v117[128];
  _BYTE v118[128];
  uint64_t v119;
  _QWORD v120[3];

  v120[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v116.receiver = self;
  v116.super_class = (Class)AVTMemoji;
  v8 = -[AVTAvatar init](&v116, sel_init);
  v9 = v8;
  if (v8)
  {
    v100 = v7;
    v8->_usageIntent = a4;
    v8->_updateLock._os_unfair_lock_opaque = 0;
    v8->_visibleBodyParts = 1;
    v10 = objc_alloc_init(AVTAssetResourceCache);
    resourceCache = v9->_resourceCache;
    v9->_resourceCache = v10;

    v12 = objc_alloc_init(AVTPresetStore);
    presetStore = v9->_presetStore;
    v9->_presetStore = v12;

    if (v9->_usageIntent == 2)
      -[AVTAssetResourceCache setPolicy:](v9->_resourceCache, "setPolicy:", 1);
    v9->_componentDirtyMask = -1;
    v9->_componentAnimatedMask = 0;
    objc_msgSend(MEMORY[0x1E0CD59D0], "node");
    v14 = objc_claimAutoreleasedReturnValue();
    avatarNode = v9->_avatarNode;
    v9->_avatarNode = (SCNNode *)v14;

    -[SCNNode setName:](v9->_avatarNode, "setName:", CFSTR("avatarNode"));
    v16 = (SCNNode *)objc_alloc_init(MEMORY[0x1E0CD59D0]);
    headComponentContainer = v9->_headComponentContainer;
    v9->_headComponentContainer = v16;

    -[SCNNode setName:](v9->_headComponentContainer, "setName:", CFSTR("head components"));
    v18 = (SCNNode *)objc_alloc_init(MEMORY[0x1E0CD59D0]);
    bodyComponentContainer = v9->_bodyComponentContainer;
    v9->_bodyComponentContainer = v18;

    -[SCNNode setName:](v9->_bodyComponentContainer, "setName:", CFSTR("body components"));
    -[SCNNode setHidden:](v9->_bodyComponentContainer, "setHidden:", 1);
    v20 = (SCNNode *)objc_alloc_init(MEMORY[0x1E0CD59D0]);
    handsComponentContainer = v9->_handsComponentContainer;
    v9->_handsComponentContainer = v20;

    -[SCNNode setName:](v9->_handsComponentContainer, "setName:", CFSTR("hands components"));
    -[SCNNode setHidden:](v9->_handsComponentContainer, "setHidden:", 1);
    -[SCNNode addChildNode:](v9->_avatarNode, "addChildNode:", v9->_headComponentContainer);
    -[SCNNode addChildNode:](v9->_avatarNode, "addChildNode:", v9->_bodyComponentContainer);
    v101 = v9;
    -[SCNNode addChildNode:](v9->_avatarNode, "addChildNode:", v9->_handsComponentContainer);
    +[AVTResourceLocator sharedResourceLocator]();
    v22 = (id *)objc_claimAutoreleasedReturnValue();
    -[AVTResourceLocator urlForMemojiAssetAtPath:isDirectory:](v22, (uint64_t)CFSTR("eyes_mouth/eyes_mouth.aa"), 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "URLByAppendingPathComponent:isDirectory:", CFSTR("main.scnz"), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = 0;
    objc_msgSend(MEMORY[0x1E0CD5A10], "avt_rootNodeForSceneAtURL:options:error:", v24, 0, &v115);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v115;
    if (v26)
    {
      avt_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[AVTMemoji initWithDescriptor:usageIntent:error:].cold.2(v24, v26);

    }
    objc_msgSend(v25, "childNodes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectAtIndexedSubscript:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "removeFromParentNode");
    objc_msgSend(v29, "enumerateHierarchyUsingBlock:", &__block_literal_global_162);
    AVTPrecompiledMemojiAssetWithIdentifier(CFSTR("eyes_mouth"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("specialization settings"));
    v31 = objc_claimAutoreleasedReturnValue();
    eyesAndTongueSpecializationSettings = v101->_eyesAndTongueSpecializationSettings;
    v101->_eyesAndTongueSpecializationSettings = (NSDictionary *)v31;

    if (!v101->_eyesAndTongueSpecializationSettings)
      -[AVTMemoji initWithDescriptor:usageIntent:error:].cold.1();

    v33 = v29;
    objc_msgSend(v33, "childNodeWithName:recursively:", CFSTR("eyelashes"), 1);
    v34 = objc_claimAutoreleasedReturnValue();
    eyelashes = v101->_eyelashes;
    v101->_eyelashes = (SCNNode *)v34;

    objc_msgSend(v33, "childNodeWithName:recursively:", CFSTR("L_eye"), 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "childNodeWithName:recursively:", CFSTR("R_eye"), 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v36;
    objc_msgSend(v36, "childNodeWithName:recursively:", CFSTR("L_eye"), 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "geometry");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "firstMaterial");
    v40 = objc_claimAutoreleasedReturnValue();
    eyeMaterialLeft = v101->_eyeMaterialLeft;
    v101->_eyeMaterialLeft = (SCNMaterial *)v40;

    v95 = v37;
    objc_msgSend(v37, "childNodeWithName:recursively:", CFSTR("R_eye"), 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "geometry");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "firstMaterial");
    v44 = objc_claimAutoreleasedReturnValue();
    eyeMaterialRight = v101->_eyeMaterialRight;
    v101->_eyeMaterialRight = (SCNMaterial *)v44;

    objc_msgSend(v33, "avt_enableSubdivisionOnHierarchyWithQuality:animoji:", 1, 0);
    p_eyesAndTongue = &v101->_eyesAndTongue;
    objc_storeStrong((id *)&v101->_eyesAndTongue, v29);
    v97 = v33;
    -[SCNNode addChildNode:](v101->_headComponentContainer, "addChildNode:", v33);
    +[AVTAssetLibrary sharedAssetLibrary](AVTAssetLibrary, "sharedAssetLibrary");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "assetWithType:identifier:", 0, CFSTR("head"));
    v47 = objc_claimAutoreleasedReturnValue();

    v48 = [AVTComponent alloc];
    v94 = (void *)v47;
    v120[0] = v47;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v120, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v50) = 0;
    LODWORD(v51) = 0;
    LODWORD(v52) = 0;
    v53 = -[AVTComponent initWithType:assets:morphVariant:imageVariant:materialVariant:morphVariantIntensity:bodyPoseVariantIntensity:textureAssetPresence:](v48, "initWithType:assets:morphVariant:imageVariant:materialVariant:morphVariantIntensity:bodyPoseVariantIntensity:textureAssetPresence:", 0, v49, 0, 0, 0, v50, v51, v52);

    -[AVTMemoji addComponent:animated:](v101, "addComponent:animated:", v53, 0);
    v92 = (void *)v53;
    v54 = -[AVTComponentInstance initWithComponent:assetResourceCache:]([AVTComponentInstance alloc], "initWithComponent:assetResourceCache:", v53, v101->_resourceCache);
    -[AVTMemoji setInstance:forComponentType:](v101, "setInstance:forComponentType:", v54, 0);
    v91 = v54;
    -[AVTComponentInstance assetNode](v54, "assetNode");
    v55 = objc_claimAutoreleasedReturnValue();
    headNode = v101->_headNode;
    v101->_headNode = (SCNNode *)v55;

    -[SCNNode setCastsShadow:](v101->_headNode, "setCastsShadow:", 1);
    -[SCNNode setRenderingOrder:](v101->_headNode, "setRenderingOrder:", -1);
    -[SCNNode addChildNode:](v101->_headComponentContainer, "addChildNode:", v101->_headNode);
    +[AVTAssetLibrary sharedAssetLibrary](AVTAssetLibrary, "sharedAssetLibrary");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "assetWithType:identifier:", 34, CFSTR("body"));
    v58 = objc_claimAutoreleasedReturnValue();

    v59 = [AVTComponent alloc];
    v90 = (void *)v58;
    v119 = v58;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v119, 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v61) = 0;
    LODWORD(v62) = 0;
    LODWORD(v63) = 0;
    v64 = -[AVTComponent initWithType:assets:morphVariant:imageVariant:materialVariant:morphVariantIntensity:bodyPoseVariantIntensity:textureAssetPresence:](v59, "initWithType:assets:morphVariant:imageVariant:materialVariant:morphVariantIntensity:bodyPoseVariantIntensity:textureAssetPresence:", 34, v60, 0, 0, 0, v61, v62, v63);

    v89 = (void *)v64;
    -[AVTMemoji addComponent:animated:](v101, "addComponent:animated:", v64, 0);
    +[AVTResourceLocator sharedResourceLocator]();
    v65 = (id *)objc_claimAutoreleasedReturnValue();
    -[AVTResourceLocator urlForMemojiAssetAtPath:isDirectory:](v65, (uint64_t)CFSTR("skeleton.aa/main.scnz"), 0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    v114 = 0;
    objc_msgSend(MEMORY[0x1E0CD5A10], "avt_rootNodeForSceneAtURL:options:error:", v66, 0, &v114);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v114;
    if (v68)
    {
      avt_default_log();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        -[AVTMemoji initWithDescriptor:usageIntent:error:].cold.2(v66, v68);

    }
    v99 = v66;
    v98 = v67;
    objc_msgSend(v67, "childNodeWithName:recursively:", CFSTR("root_JNT"), 1);
    v70 = objc_claimAutoreleasedReturnValue();
    skeletonRootNode = v101->_skeletonRootNode;
    v101->_skeletonRootNode = (SCNNode *)v70;

    -[SCNNode removeFromParentNode](v101->_skeletonRootNode, "removeFromParentNode");
    -[SCNNode addChildNode:](v101->_avatarNode, "addChildNode:", v101->_skeletonRootNode);
    v72 = v101->_headComponentContainer;
    v112[0] = MEMORY[0x1E0C809B0];
    v112[1] = 3221225472;
    v112[2] = __50__AVTMemoji_initWithDescriptor_usageIntent_error___block_invoke_186;
    v112[3] = &unk_1EA61D7A8;
    v73 = v101;
    v113 = v73;
    -[SCNNode enumerateChildNodesUsingBlock:](v72, "enumerateChildNodesUsingBlock:", v112);
    v74 = objc_alloc_init(AVTCompositor);
    v75 = v73[297];
    v73[297] = v74;

    v73[298] = (id)-1;
    +[AVTCompositor propertyNames](AVTCompositor, "propertyNames");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    -[SCNNode geometry](v101->_headNode, "geometry");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "materials");
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v77;
    v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v108, v118, 16);
    if (v78)
    {
      v79 = v78;
      v80 = *(_QWORD *)v109;
      do
      {
        for (i = 0; i != v79; ++i)
        {
          if (*(_QWORD *)v109 != v80)
            objc_enumerationMutation(obj);
          v82 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * i);
          v104 = 0u;
          v105 = 0u;
          v106 = 0u;
          v107 = 0u;
          v83 = v103;
          v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v104, v117, 16);
          if (v84)
          {
            v85 = v84;
            v86 = *(_QWORD *)v105;
            do
            {
              for (j = 0; j != v85; ++j)
              {
                if (*(_QWORD *)v105 != v86)
                  objc_enumerationMutation(v83);
                objc_msgSend(v73[297], "configureMaterial:propertyNamed:memoji:", v82, *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * j), v73);
              }
              v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v104, v117, 16);
            }
            while (v85);
          }

        }
        v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v118, 16);
      }
      while (v79);
    }

    objc_msgSend(v73, "resetToDefault");
    v7 = v100;
    if (v100)
    {
      objc_msgSend(v100, "applyToMemoji:", v73);
      +[AVTAvatarMemoryOptimizer optimizeMemoji:]((uint64_t)AVTAvatarMemoryOptimizer, v73);
      objc_msgSend(v73, "rebuildSpecializationSettings");
      objc_msgSend(v73, "_avatarNodeAndHeadNodeAreNowAvailable");
      v9 = v101;
      objc_msgSend(v73, "addCustomBehavioursInHierarchy:forBodyParts:", v101->_headNode, 1);
      objc_msgSend(v73, "addCustomBehavioursInHierarchy:forBodyParts:", *p_eyesAndTongue, 1);
      objc_msgSend(v73, "updateBindings");
      objc_msgSend(v73, "update");
    }
    else
    {
      objc_msgSend(v73, "rebuildSpecializationSettings");
      objc_msgSend(v73, "_avatarNodeAndHeadNodeAreNowAvailable");
      v9 = v101;
      objc_msgSend(v73, "addCustomBehavioursInHierarchy:forBodyParts:", v101->_headNode, 1);
      objc_msgSend(v73, "addCustomBehavioursInHierarchy:forBodyParts:", *p_eyesAndTongue, 1);
      objc_msgSend(v73, "updateBindings");
    }

  }
  return v9;
}

void __50__AVTMemoji_initWithDescriptor_usageIntent_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasSuffix:", CFSTR("_eye"));

  objc_msgSend(v4, "setCastsShadow:", v3);
}

void __50__AVTMemoji_initWithDescriptor_usageIntent_error___block_invoke_186(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336);
  objc_msgSend(a2, "skinner");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSkeleton:", v2);

}

- (AVTMemoji)init
{
  return -[AVTMemoji initWithDescriptor:usageIntent:error:](self, "initWithDescriptor:usageIntent:error:", 0, 0, 0);
}

+ (id)memoji
{
  return objc_alloc_init((Class)a1);
}

+ (AVTMemoji)memojiWithContentsOfURL:(id)a3 error:(id *)a4
{
  return (AVTMemoji *)objc_msgSend(a1, "memojiWithContentsOfURL:usageIntent:error:", a3, 0, a4);
}

+ (AVTMemoji)memojiWithContentsOfURL:(id)a3 usageIntent:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 8, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "avatarWithDataRepresentation:usageIntent:error:", v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (AVTMemoji *)v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[AVTMemoji newDescriptor](self, "newDescriptor");
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("descriptor"));

}

- (AVTMemoji)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  AVTMemoji *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("descriptor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[AVTMemoji initWithDescriptor:usageIntent:error:](self, "initWithDescriptor:usageIntent:error:", v5, 0, 0);
  return v6;
}

- (double)arOffset
{
  return 2048.0;
}

- (float)arScale
{
  return 1.344;
}

- (id)assetResourceCache
{
  return self->_resourceCache;
}

- (id)componentForType:(int64_t)a3
{
  return self->_components[a3];
}

- (id)componentInstanceForType:(int64_t)a3
{
  return self->_componentInstances[a3];
}

- (unint64_t)usageIntent
{
  return self->_usageIntent;
}

- (id)copyWithUsageIntent:(unint64_t)a3
{
  unint64_t v3;
  unint64_t usageIntent;
  NSObject *v7;
  unint64_t v8;
  AVTMemojiDescriptor *v9;
  void *v10;
  int v12;
  unint64_t v13;
  __int16 v14;
  unint64_t v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  usageIntent = self->_usageIntent;
  if (usageIntent != a3 && usageIntent != 0)
  {
    avt_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = self->_usageIntent;
      v12 = 134218240;
      v13 = v3;
      v14 = 2048;
      v15 = v8;
      _os_log_impl(&dword_1DD1FA000, v7, OS_LOG_TYPE_DEFAULT, "Can't make a copy with usage intent %lu of a Memoji whose usage intent is %lu", (uint8_t *)&v12, 0x16u);
    }

    v3 = self->_usageIntent;
  }
  v9 = -[AVTMemojiDescriptor initWithMemoji:]([AVTMemojiDescriptor alloc], "initWithMemoji:", self);
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDescriptor:usageIntent:error:", v9, v3, 0);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[AVTMemoji copyWithUsageIntent:](self, "copyWithUsageIntent:", self->_usageIntent);
}

- (id)headNode
{
  return self->_headNode;
}

- (id)avatarNode
{
  return self->_avatarNode;
}

- (id)headComponentContainer
{
  return self->_headComponentContainer;
}

- (id)bodyComponentContainer
{
  return self->_bodyComponentContainer;
}

- (id)handsComponentContainer
{
  return self->_handsComponentContainer;
}

- (id)skinColor
{
  void *v2;
  void *v3;

  -[AVTMemoji colorPresetForCategory:](self, "colorPresetForCategory:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baseColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hairColor
{
  void *v2;
  void *v3;

  -[AVTMemoji colorPresetForCategory:](self, "colorPresetForCategory:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baseColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)eyebrowsColor
{
  void *v2;
  void *v3;

  -[AVTMemoji colorPresetForCategory:](self, "colorPresetForCategory:", 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baseColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)facialhairColor
{
  void *v2;
  void *v3;

  -[AVTMemoji colorPresetForCategory:](self, "colorPresetForCategory:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baseColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)lipsColor
{
  void *v2;
  void *v3;

  -[AVTMemoji colorPresetForCategory:](self, "colorPresetForCategory:", 10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "baseColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_invalidateAOImage
{
  CGImage *combinedAOImage;

  self->_aoValid = 0;
  combinedAOImage = self->_combinedAOImage;
  if (combinedAOImage)
  {
    CGImageRelease(combinedAOImage);
    self->_combinedAOImage = 0;
  }
}

- (void)_applyAllColorPresetsForCategory:(int64_t)a3
{
  uint64_t i;

  for (i = 0; i != 3; ++i)
    -[AVTMemoji _applyColorPresetForCategory:colorIndex:](self, "_applyColorPresetForCategory:colorIndex:", a3, i);
}

- (void)_applyColorPresetForCategory:(int64_t)a3 colorIndex:(unint64_t)a4
{
  AVTColorPreset *(*colorPresets)[3];
  id *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  SCNMaterial *eyeMaterialLeft;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;

  if (a4 >= 3)
    -[AVTMemoji _applyColorPresetForCategory:colorIndex:].cold.1();
  colorPresets = self->_colorPresets;
  v8 = (id *)self->_colorPresets[a3];
  v22 = v8[a4];
  v9 = AVTPresetCategoryToComponentType(a3);
  -[AVTMemoji componentWithType:](self, "componentWithType:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (a4 == 1)
  {
    if (a3 == 7)
    {
      if (v22)
      {
        objc_msgSend(v22, "makeMaterial");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v14;
        eyeMaterialLeft = self->_eyeMaterialLeft;
        goto LABEL_11;
      }
      v19 = *v8;
      objc_msgSend(v19, "makeMaterial");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "applyToSceneKitMaterial:", self->_eyeMaterialLeft);
LABEL_23:

      goto LABEL_27;
    }
    if (!v10)
      goto LABEL_28;
    objc_msgSend(v22, "makeMaterial");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    v16 = v12;
    v17 = 1;
LABEL_26:
    objc_msgSend(v15, "setMaterial:atIndex:", v16, v17);
    -[AVTMemoji componentMaterialDidUpdate:](self, "componentMaterialDidUpdate:", v11);
    goto LABEL_27;
  }
  if (a4)
  {
    if (!v10)
      goto LABEL_28;
    objc_msgSend(v22, "makeMaterial");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    v16 = v12;
    v17 = 2;
    goto LABEL_26;
  }
  if (v22)
  {
    if (a3 == 7)
    {
      objc_msgSend(v22, "makeMaterial");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "applyToSceneKitMaterial:", self->_eyeMaterialRight);
      if ((*colorPresets)[22])
      {
LABEL_27:

        goto LABEL_28;
      }
      eyeMaterialLeft = self->_eyeMaterialLeft;
      v14 = v12;
LABEL_11:
      objc_msgSend(v14, "applyToSceneKitMaterial:", eyeMaterialLeft);
      goto LABEL_27;
    }
    if (v9 == 28)
    {
      objc_msgSend(v22, "makeMaterial");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setMaterial:atIndex:", v12, 0);
      -[AVTMemoji componentMaterialDidUpdate:](self, "componentMaterialDidUpdate:", v11);
      -[AVTMemoji componentWithType:](self, "componentWithType:", 34);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        objc_msgSend(v18, "setMaterial:atIndex:", v12, 0);
        -[AVTMemoji componentMaterialDidUpdate:](self, "componentMaterialDidUpdate:", v19);
      }
      -[AVTMemoji componentWithType:](self, "componentWithType:", 37);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        objc_msgSend(v20, "setMaterial:atIndex:", v12, 0);
        -[AVTMemoji componentMaterialDidUpdate:](self, "componentMaterialDidUpdate:", v21);
      }
      -[AVTCompositor skinColorDidChange](self->_compositor, "skinColorDidChange");

      goto LABEL_23;
    }
    if (v10)
    {
      objc_msgSend(v22, "makeMaterial");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v11;
      v16 = v12;
      v17 = 0;
      goto LABEL_26;
    }
  }
LABEL_28:

}

- (id)colorPresetForCategory:(int64_t)a3
{
  NSObject *v3;
  AVTColorPreset *v4;

  if (a3 < 40)
  {
    v4 = self->_colorPresets[a3][0];
  }
  else
  {
    avt_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[AVTMemojiDescriptor presetIdentifierForCategory:].cold.1();

    v4 = 0;
  }
  return v4;
}

- (id)secondaryColorPresetForCategory:(int64_t)a3
{
  NSObject *v3;
  AVTColorPreset *v4;

  if (a3 < 40)
  {
    v4 = self->_colorPresets[a3][1];
  }
  else
  {
    avt_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[AVTMemojiDescriptor presetIdentifierForCategory:].cold.1();

    v4 = 0;
  }
  return v4;
}

- (id)colorPresetForCategory:(int64_t)a3 colorIndex:(unint64_t)a4
{
  NSObject *v4;
  AVTColorPreset *v5;

  if (a3 < 40)
  {
    if (a4 >= 3)
      -[AVTMemoji colorPresetForCategory:colorIndex:].cold.2();
    v5 = self->_colorPresets[a3][a4];
  }
  else
  {
    avt_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[AVTMemojiDescriptor presetIdentifierForCategory:].cold.1();

    v5 = 0;
  }
  return v5;
}

- (void)setColorPreset:(id)a3 forCategory:(int64_t)a4
{
  -[AVTMemoji setColorPreset:forCategory:colorIndex:](self, "setColorPreset:forCategory:colorIndex:", a3, a4, 0);
}

- (void)setSecondaryColorPreset:(id)a3 forCategory:(int64_t)a4
{
  -[AVTMemoji setColorPreset:forCategory:colorIndex:](self, "setColorPreset:forCategory:colorIndex:", a3, a4, 1);
}

- (void)setColorPreset:(id)a3 forCategory:(int64_t)a4 colorIndex:(unint64_t)a5
{
  id v8;
  id v9;
  AVTMemoji *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id *v19;
  uint64_t v20;
  NSObject *v21;

  v8 = a3;
  v9 = v8;
  if (a4 >= 40)
  {
    avt_default_log();
    v10 = (AVTMemoji *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super.super, OS_LOG_TYPE_ERROR))
      -[AVTMemojiDescriptor presetIdentifierForCategory:].cold.1();
LABEL_16:

    return;
  }
  if (v8)
  {
    if (objc_msgSend(v8, "category") != a4)
    {
      avt_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[AVTMemojiDescriptor setColorPreset:forCategory:colorIndex:].cold.3(v11, v12, v13, v14, v15, v16, v17, v18);

    }
    if (a5 <= 2)
    {
LABEL_10:
      v10 = self;
      objc_sync_enter(v10);
      v19 = (id *)&v10->_colorPresets[a4][a5];
      if (*v19 != v9)
      {
        objc_storeStrong(v19, v9);
        -[AVTMemoji _applyColorPresetForCategory:colorIndex:](v10, "_applyColorPresetForCategory:colorIndex:", a4, a5);
        if (a5 == 1)
        {
          v20 = AVTPresetCategoryToComponentType(a4);
          if (v20 != 42)
            v10->_compositorComponentDirtyMask |= 1 << v20;
        }
        -[AVTMemoji invalidate](v10, "invalidate");
      }
      objc_sync_exit(v10);
      goto LABEL_16;
    }
LABEL_24:
    -[AVTMemoji setColorPreset:forCategory:colorIndex:].cold.2();
  }
  if (a5 >= 3)
    goto LABEL_24;
  if (a5)
  {
    +[AVTColorPreset fallbackColorPresetForNilPresetAndCategory:colorIndex:](AVTColorPreset, "fallbackColorPresetForNilPresetAndCategory:colorIndex:", a4, a5);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      avt_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[AVTMemoji setColorPreset:forCategory:colorIndex:].cold.3(a4, v21);

    }
    goto LABEL_10;
  }
}

- (id)components
{
  void *v3;
  uint64_t v4;
  AVTComponent **components;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 42);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  components = self->_components;
  do
  {
    if (components[v4])
      objc_msgSend(v3, "addObject:");
    ++v4;
  }
  while (v4 != 42);
  return v3;
}

- (id)componentWithType:(int64_t)a3
{
  AVTComponent *v3;

  if (a3 == 42)
    v3 = 0;
  else
    v3 = self->_components[a3];
  return v3;
}

- (void)addComponent:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  AVTComponent *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  _BOOL4 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    v15 = v4;
    v9 = self->_components[objc_msgSend(v7, "type")];
    -[AVTMemoji _removeComponent:](self, "_removeComponent:", v9);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v8, "assets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          -[AVTAssetResourceCache retainAsset:](self->_resourceCache, "retainAsset:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

    objc_storeStrong((id *)&self->_components[objc_msgSend(v8, "type")], a3);
    -[AVTMemoji componentDidChangeForType:animated:](self, "componentDidChangeForType:animated:", objc_msgSend(v8, "type"), v15);

  }
}

- (void)removeComponentWithType:(int64_t)a3
{
  id v5;

  -[AVTMemoji componentWithType:](self, "componentWithType:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTMemoji _removeComponent:](self, "_removeComponent:", v5);
  -[AVTMemoji componentDidChangeForType:animated:](self, "componentDidChangeForType:animated:", a3, 0);

}

- (void)_removeComponent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  AVTComponent **components;
  uint64_t v12;
  AVTComponent *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v4, "assets", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          -[AVTAssetResourceCache releaseAsset:](self->_resourceCache, "releaseAsset:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    components = self->_components;
    v12 = objc_msgSend(v5, "type");
    v13 = components[v12];
    components[v12] = 0;

  }
}

- (void)invalidate
{
  os_unfair_lock_s *p_updateLock;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  if (!self->_needsUpdate)
  {
    p_updateLock = &self->_updateLock;
    os_unfair_lock_lock(&self->_updateLock);
    if (!self->_needsUpdate)
    {
      self->_needsUpdate = 1;
      -[AVTMemoji avatarNode](self, "avatarNode");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 1 - objc_msgSend(v4, "movabilityHint");
      -[AVTMemoji avatarNode](self, "avatarNode");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMovabilityHint:", v5);

      -[AVTMemoji avatarNode](self, "avatarNode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 1 - objc_msgSend(v7, "movabilityHint");
      -[AVTMemoji avatarNode](self, "avatarNode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setMovabilityHint:", v8);

    }
    os_unfair_lock_unlock(p_updateLock);
  }
}

- (void)componentDidChangeForType:(int64_t)a3 animated:(BOOL)a4
{
  if (a3 != 42)
  {
    self->_componentDirtyMask |= 1 << a3;
    if (a4)
      self->_componentAnimatedMask |= 1 << a3;
    -[AVTMemoji invalidate](self, "invalidate");
  }
}

- (void)componentMaterialDidUpdate:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  self->_compositorComponentDirtyMask |= 1 << objc_msgSend(v5, "type");
  if (objc_msgSend(v5, "type") != 28)
    -[AVTComponentInstance updateMaterialsWithComponent:](self->_componentInstances[objc_msgSend(v5, "type")], "updateMaterialsWithComponent:", v5);
  if (objc_msgSend(v5, "type") == 2)
  {
    v4 = 4;
LABEL_9:
    self->_componentDirtyMask |= v4;
    -[AVTMemoji invalidate](self, "invalidate");
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "type") == 11)
  {
    v4 = 2048;
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "type") == 12)
  {
    v4 = 4096;
    goto LABEL_9;
  }
LABEL_10:

}

- (BOOL)usesSkinningForEyeOrientation
{
  return 1;
}

- (void)randomize
{
  AVTMemoji *v3;
  _QWORD v4[5];
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0CD5A38], "lock");
  v3 = self;
  objc_sync_enter(v3);
  -[AVTMemoji resetToDefault](v3, "resetToDefault");
  objc_msgSend(MEMORY[0x1E0CD5A38], "begin");
  objc_msgSend(MEMORY[0x1E0CD5A38], "setAnimationDuration:", 0.75);
  v4[4] = v3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __22__AVTMemoji_randomize__block_invoke;
  v5[3] = &unk_1EA61FC60;
  v5[4] = v3;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __22__AVTMemoji_randomize__block_invoke_2;
  v4[3] = &unk_1EA61FC88;
  _AVTMemojiRandomize(v5, v4);
  objc_msgSend(MEMORY[0x1E0CD5A38], "commit");
  objc_sync_exit(v3);

  objc_msgSend(MEMORY[0x1E0CD5A38], "unlock");
}

uint64_t __22__AVTMemoji_randomize__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPreset:forCategory:animated:", a2, a3, 0);
}

uint64_t __22__AVTMemoji_randomize__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "setColorPreset:forCategory:colorIndex:", a2, a3, a4);
}

- (void)setPreset:(id)a3 forCategory:(int64_t)a4
{
  -[AVTMemoji setPreset:forCategory:animated:](self, "setPreset:forCategory:animated:", a3, a4, 0);
}

- (void)setPreset:(id)a3 forCategory:(int64_t)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  AVTMemoji *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  char *v24;
  unint64_t i;
  void *v26;
  void *v27;
  _BOOL8 v28;
  uint64_t v29;

  v5 = a5;
  v8 = a3;
  v9 = v8;
  if (v8)
  {
    if (objc_msgSend(v8, "category") != a4)
    {
      avt_default_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[AVTMemoji setPreset:forCategory:animated:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    }
    v18 = self;
    objc_sync_enter(v18);
    -[AVTPresetStore presetForCategory:]((id *)&v18->_presetStore->super.isa, a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19 != v9)
    {
      objc_msgSend(v19, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "isEqualToString:", v22);

      if ((v23 & 1) == 0)
      {
        if ((unint64_t)(a4 - 34) <= 5 && ((0x3Du >> (a4 - 34)) & 1) != 0)
          v5 = 0;
        v24 = -[AVTPresetStore setPreset:forCategory:]((char *)v18->_presetStore, v9, a4);
        for (i = 0; i != 40; ++i)
        {
          if ((((unint64_t)v24 >> i) & 1) != 0)
          {
            -[AVTPresetStore resolvedPresetForCategory:]((id *)&v18->_presetStore->super.isa, i);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v26;
            if (v26)
            {
              v28 = v26 == v9 && v5;
              objc_msgSend(v26, "applyPresetByChangingComponentsOfMemoji:animated:", v18, v28);
              -[AVTMemoji _applyAllColorPresetsForCategory:](v18, "_applyAllColorPresetsForCategory:", i);
            }
            else
            {
              v29 = AVTPresetCategoryToComponentType(i);
              if (v29 != 42)
                -[AVTMemoji removeComponentWithType:](v18, "removeComponentWithType:", v29);
            }

          }
        }
      }
    }

    objc_sync_exit(v18);
  }

}

- (id)presetForCategory:(int64_t)a3
{
  return -[AVTPresetStore presetForCategory:]((id *)&self->_presetStore->super.isa, a3);
}

- (id)resolvedPresetForCategory:(int64_t)a3
{
  return -[AVTPresetStore resolvedPresetForCategory:]((id *)&self->_presetStore->super.isa, a3);
}

- (void)morphTo:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t i;
  void *v8;
  id v9;

  v4 = a3;
  v5 = 0;
  v9 = v4;
  do
  {
    objc_msgSend(v4, "presetForCategory:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTMemoji setPreset:forCategory:animated:](self, "setPreset:forCategory:animated:", v6, v5, 1);

    for (i = 0; i != 3; ++i)
    {
      objc_msgSend(v9, "colorPresetForCategory:colorIndex:", v5, i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTMemoji setColorPreset:forCategory:colorIndex:](self, "setColorPreset:forCategory:colorIndex:", v8, v5, i);

    }
    ++v5;
    v4 = v9;
  }
  while (v5 != 40);

}

- (void)addComponentAssetNode:(id)a3 toNode:(id)a4 forBodyParts:(unint64_t)a5
{
  void (**componentAssetNodeObservationForStickerBlock)(id, AVTMemoji *, id, _QWORD);
  id v9;

  v9 = a3;
  objc_msgSend(a4, "addChildNode:", v9);
  -[AVTAvatar addCustomBehavioursInHierarchy:forBodyParts:](self, "addCustomBehavioursInHierarchy:forBodyParts:", v9, a5);
  componentAssetNodeObservationForStickerBlock = (void (**)(id, AVTMemoji *, id, _QWORD))self->_componentAssetNodeObservationForStickerBlock;
  if (componentAssetNodeObservationForStickerBlock)
    componentAssetNodeObservationForStickerBlock[2](componentAssetNodeObservationForStickerBlock, self, v9, 0);

}

- (void)removeComponentAssetNodeFromParentNode:(id)a3 forBodyParts:(unint64_t)a4
{
  id v6;
  void (**componentAssetNodeObservationForStickerBlock)(id, AVTMemoji *, id, uint64_t);
  id v8;

  v6 = a3;
  componentAssetNodeObservationForStickerBlock = (void (**)(id, AVTMemoji *, id, uint64_t))self->_componentAssetNodeObservationForStickerBlock;
  v8 = v6;
  if (componentAssetNodeObservationForStickerBlock)
  {
    componentAssetNodeObservationForStickerBlock[2](componentAssetNodeObservationForStickerBlock, self, v6, 1);
    v6 = v8;
  }
  objc_msgSend(v6, "removeFromParentNode");
  -[AVTAvatar removeCustomBehavioursInHierarchy:forBodyParts:](self, "removeCustomBehavioursInHierarchy:forBodyParts:", v8, a4);

}

- (double)skinTextureSize
{
  if (skinTextureSize_onceToken != -1)
    dispatch_once(&skinTextureSize_onceToken, &__block_literal_global_195);
  return 1024.0;
}

void __28__AVTMemoji_skinTextureSize__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "userInterfaceIdiom");

}

- (CGImage)createSkinAO
{
  double v3;
  double v4;
  CGColorSpace *v5;
  CGContext *v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  const __CFURL *v15;
  CGImageSource *v16;
  CGImageRef ImageAtIndex;
  CGImage *v18;
  CGImage *Image;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGRect v29;
  CGRect v30;

  v28 = *MEMORY[0x1E0C80C00];
  -[AVTMemoji skinTextureSize](self, "skinTextureSize");
  v4 = v3;
  v5 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  v6 = CGBitmapContextCreate(0, (unint64_t)v4, (unint64_t)v4, 8uLL, 4 * (unint64_t)v4, v5, 5u);
  CGColorSpaceRelease(v5);
  CGContextSetRGBFillColor(v6, 1.0, 1.0, 1.0, 1.0);
  v29.origin.x = 0.0;
  v29.origin.y = 0.0;
  v29.size.width = v4;
  v29.size.height = v4;
  CGContextFillRect(v6, v29);
  -[AVTMemoji componentWithType:](self, "componentWithType:", 7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  for (i = 0; i != 42; ++i)
  {
    if (i != 5 || !v21)
    {
      -[AVTMemoji componentWithType:](self, "componentWithType:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v22 = v8;
      objc_msgSend(v8, "assets");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v24;
        do
        {
          for (j = 0; j != v11; ++j)
          {
            if (*(_QWORD *)v24 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "ambientOcclusion");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v14, 0);
              v15 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
              v16 = CGImageSourceCreateWithURL(v15, 0);

              if (v16)
              {
                ImageAtIndex = CGImageSourceCreateImageAtIndex(v16, 0, 0);
                if (ImageAtIndex)
                {
                  v18 = ImageAtIndex;
                  CGContextSetBlendMode(v6, kCGBlendModeDarken);
                  v30.origin.x = 0.0;
                  v30.origin.y = 0.0;
                  v30.size.width = v4;
                  v30.size.height = v4;
                  CGContextDrawImage(v6, v30, v18);
                  CGImageRelease(v18);
                }
                CFRelease(v16);
              }
            }

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v11);
      }

    }
  }
  Image = CGBitmapContextCreateImage(v6);
  CGContextRelease(v6);
  return Image;
}

- (void)updateSkinMaterial:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  unsigned int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const char *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id obj;
  uint64_t v39;
  unsigned int v40;
  unsigned int v41;
  _QWORD v42[5];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  if (!self->_aoValid)
  {
    -[AVTMemoji _updateAO](self, "_updateAO", v36);
    self->_aoValid = 1;
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[SCNNode geometry](self->_headNode, "geometry", v36);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "materials");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v6)
  {
    v7 = v6;
    v39 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v44 != v39)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        +[AVTResourceLocator sharedResourceLocator]();
        v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        -[AVTResourceLocator pathForMemojiResource:ofType:inDirectory:isDirectory:](v10, (uint64_t)CFSTR("lips_MASK"), (uint64_t)CFSTR("heic"), (uint64_t)CFSTR("textures"), 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "multiply");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setContents:", v11);

        -[AVTMemoji facialhairColor](self, "facialhairColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setValue:forKey:", v13, CFSTR("facialhair_color"));

        -[AVTMemoji hairColor](self, "hairColor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setValue:forKey:", v14, CFSTR("hair_color"));

        -[AVTMemoji lipsColor](self, "lipsColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setValue:forKey:", v15, CFSTR("lipstick_color"));

        -[AVTMemoji eyebrowsColor](self, "eyebrowsColor");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setValue:forKey:", v16, CFSTR("brow_color"));

        -[AVTMemoji componentWithType:](self, "componentWithType:", 5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "textureAssetPresence");
        v41 = v18;

        -[AVTMemoji componentWithType:](self, "componentWithType:", 3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "textureAssetPresence");
        v40 = v20;

        -[AVTMemoji componentWithType:](self, "componentWithType:", 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "textureAssetPresence");

        -[AVTMemoji componentWithType:](self, "componentWithType:", 31);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "materialAtIndex:", 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "additionalPropertyColors");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("lips_presence"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend(MEMORY[0x1E0CB3B18], "avt_valueWithFloat4_usableWithKVCForSCNVector4:", COERCE_DOUBLE(__PAIR64__(v40, v41)));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setValue:forKey:", v26, CFSTR("hairBeardBrows_presence"));

          objc_msgSend(MEMORY[0x1E0CB3B18], "avt_valueWithFloat4_usableWithKVCForSCNVector4:", AVTGetColorComponents(v25, v27));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v9;
          v30 = v28;
          v31 = CFSTR("lips_presence");
        }
        else
        {
          -[AVTMemoji colorPresetForCategory:](self, "colorPresetForCategory:", 10);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "variation");

          objc_msgSend(MEMORY[0x1E0CB3B18], "avt_valueWithFloat4_usableWithKVCForSCNVector4:", COERCE_DOUBLE(__PAIR64__(v40, v41)));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v9;
          v30 = v28;
          v31 = CFSTR("hairBeardBrowLips_presence");
        }
        objc_msgSend(v29, "setValue:forKey:", v30, v31);

        -[AVTMemoji componentWithType:](self, "componentWithType:", 28);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "materialAtIndex:", 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "additionalPropertyColors");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __32__AVTMemoji_updateSkinMaterial___block_invoke;
        v42[3] = &unk_1EA61E298;
        v42[4] = v9;
        objc_msgSend(v35, "enumerateKeysAndObjectsUsingBlock:", v42);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v7);
  }

}

void __32__AVTMemoji_updateSkinMaterial___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = AVTGetColorComponents(v5, v7);
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB3B18], "avt_valueWithFloat4:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKeyPath:", v10, v11);

  }
}

- (void)updateEyeLashes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SCNNode *v14;

  v14 = self->_eyelashes;
  -[AVTComponentInstance assetImage](self->_componentInstances[2], "assetImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SCNNode setHidden:](v14, "setHidden:", 0);
    -[SCNNode geometry](v14, "geometry");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstMaterial");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "transparent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContents:", v3);

    -[AVTMemoji componentWithType:](self, "componentWithType:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "materialAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "baseColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCNNode geometry](v14, "geometry");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstMaterial");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "diffuse");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setContents:", v10);

    }
  }
  else
  {
    -[SCNNode setHidden:](v14, "setHidden:", 1);
  }

}

- (void)updateHighlightsForComponentType:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  AVTColorPreset *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  AVTComponent *v18;
  AVTComponentInstance *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  AVTComponentInstance *v24;
  AVTComponent *v25;
  AVTColorPreset *v26;
  id v27;
  _QWORD v28[4];
  AVTComponent *v29;
  AVTComponentInstance *v30;
  id v31;
  id v32;
  char v33;
  _QWORD v34[4];
  id v35;

  if (a3 == 11)
  {
    v5 = 5;
    v6 = 15;
  }
  else
  {
    if (a3 != 12)
      -[AVTMemoji updateHighlightsForComponentType:].cold.1();
    v5 = 3;
    v6 = 16;
  }
  -[AVTComponentInstance assetNode](self->_componentInstances[v5], "assetNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v27 = v7;
    v8 = self->_colorPresets[v6][0];
    -[AVTColorPreset makeMaterial](v8, "makeMaterial");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "baseColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v26 = v8;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.803921569, 0.803921569, 0.803921569, 1.0, v8);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v9, "additionalPropertyColors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __46__AVTMemoji_updateHighlightsForComponentType___block_invoke;
    v34[3] = &unk_1EA61E298;
    v17 = v14;
    v35 = v17;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v34);

    v18 = self->_components[v5];
    v19 = self->_componentInstances[a3];
    -[AVTPresetStore presetForCategory:]((id *)&self->_presetStore->super.isa, v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v16;
    v28[1] = 3221225472;
    v28[2] = __46__AVTMemoji_updateHighlightsForComponentType___block_invoke_2;
    v28[3] = &unk_1EA61FD60;
    v33 = objc_msgSend(v21, "isEqualToString:", CFSTR("none")) ^ 1;
    v29 = v18;
    v30 = v19;
    v31 = v13;
    v32 = v17;
    v22 = v17;
    v23 = v13;
    v24 = v19;
    v25 = v18;
    objc_msgSend(v27, "enumerateHierarchyUsingBlock:", v28);

    v7 = v27;
  }

}

void __46__AVTMemoji_updateHighlightsForComponentType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  const char *v6;
  id v7;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0CB3B18], "avt_valueWithFloat4:", AVTGetColorComponents(a3, v6));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v5);

}

void __46__AVTMemoji_updateHighlightsForComponentType___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t m;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  id obj;
  id obja;
  _QWORD v39[5];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v36 = a2;
  objc_msgSend(v36, "geometry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "materials");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 64))
  {
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "assets");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    if (v6)
    {
      v7 = v6;
      obj = v4;
      v8 = *(_QWORD *)v53;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v53 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v36, "name");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqualToString:", v12);

          if (v13)
          {
            v50 = 0u;
            v51 = 0u;
            v48 = 0u;
            v49 = 0u;
            v14 = obj;
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v49;
              do
              {
                for (j = 0; j != v16; ++j)
                {
                  if (*(_QWORD *)v49 != v17)
                    objc_enumerationMutation(v14);
                  v19 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
                  objc_msgSend(*(id *)(a1 + 40), "assetImageForAsset:", v10);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "emission");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "setContents:", v20);

                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
              }
              while (v16);
            }

            goto LABEL_19;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
        if (v7)
          continue;
        break;
      }
LABEL_19:
      v4 = obj;
    }
  }
  else
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v5 = v4;
    v22 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v45;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v45 != v24)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * k), "emission");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setContents:", 0);

        }
        v23 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
      }
      while (v23);
    }
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obja = v4;
  v27 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v41;
    v30 = MEMORY[0x1E0C809B0];
    do
    {
      for (m = 0; m != v28; ++m)
      {
        if (*(_QWORD *)v41 != v29)
          objc_enumerationMutation(obja);
        v32 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * m);
        v33 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v32, "selfIllumination");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setContents:", v33);

        v35 = *(void **)(a1 + 56);
        v39[0] = v30;
        v39[1] = 3221225472;
        v39[2] = __46__AVTMemoji_updateHighlightsForComponentType___block_invoke_3;
        v39[3] = &unk_1EA61FD38;
        v39[4] = v32;
        objc_msgSend(v35, "enumerateKeysAndObjectsUsingBlock:", v39);
      }
      v28 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v40, v56, 16);
    }
    while (v28);
  }

}

uint64_t __46__AVTMemoji_updateHighlightsForComponentType___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", a3, a2);
}

- (void)_updateAO
{
  void *v2;
  void *v3;
  int v4;
  CGImage *v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  id v14;
  CGImage *v15;
  CGImage *v16;
  void *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[SCNNode childNodeWithName:recursively:](self->_headComponentContainer, "childNodeWithName:recursively:", CFSTR("head"), 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__6;
  v33 = __Block_byref_object_dispose__6;
  v34 = 0;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __22__AVTMemoji__updateAO__block_invoke;
  v28[3] = &unk_1EA61DA50;
  v28[4] = &v29;
  objc_msgSend(v20, "enumerateHierarchyUsingBlock:", v28);
  objc_msgSend((id)v30[5], "ambientOcclusion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContents:", 0);

  objc_msgSend((id)v30[5], "ambientOcclusion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIntensity:", 1.5);

  -[AVTMemoji componentWithType:](self, "componentWithType:", 7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 0;
  v5 = 0;
  for (i = 0; i != 42; ++i)
  {
    if (i != 5 || !v22)
    {
      -[AVTMemoji componentWithType:](self, "componentWithType:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v23 = v7;
      objc_msgSend(v7, "assets");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v25;
        while (2)
        {
          for (j = 0; j != v9; ++j)
          {
            if (*(_QWORD *)v25 != v10)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "ambientOcclusion");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = v12;
            if (v12)
            {
              v14 = v12;

              if (v4 > 0)
              {

                v5 = (CGImage *)v14;
                ++v4;
                goto LABEL_16;
              }
              v5 = (CGImage *)v14;
              ++v4;
            }

          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
          if (v9)
            continue;
          break;
        }
      }
LABEL_16:

    }
  }
  if (v4 > 1)
  {
    v15 = -[AVTMemoji createSkinAO](self, "createSkinAO");
    self->_combinedAOImage = v15;
    v16 = v15;

    v5 = v16;
  }
  if (v5)
  {
    objc_msgSend((id)v30[5], "ambientOcclusion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setContents:", v5);
  }
  else
  {
    +[AVTResourceLocator sharedResourceLocator]();
    v18 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    -[AVTResourceLocator pathForMemojiResource:ofType:inDirectory:isDirectory:](v18, (uint64_t)CFSTR("head_AO"), (uint64_t)CFSTR("heic"), (uint64_t)CFSTR("textures"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)v30[5], "ambientOcclusion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setContents:", v17);

  }
  _Block_object_dispose(&v29, 8);

}

void __22__AVTMemoji__updateAO__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "geometry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v10, "geometry");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstMaterial");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *a3 = 1;
  }

}

- (void)update
{
  os_unfair_lock_s *p_updateLock;

  if (self->_needsUpdate)
  {
    p_updateLock = &self->_updateLock;
    os_unfair_lock_lock(&self->_updateLock);
    if (self->_needsUpdate)
    {
      -[AVTMemoji _update](self, "_update");
      -[AVTMemoji rebuildSpecializationSettings](self, "rebuildSpecializationSettings");
    }
    os_unfair_lock_unlock(p_updateLock);
  }
}

- (void)setInstance:(id)a3 forComponentType:(int64_t)a4
{
  AVTComponentInstance *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = self->_componentInstances[a4];
  v8 = AVTAvatarBodyPartForComponentType(a4);
  -[AVTComponentInstance assetNode](v7, "assetNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTMemoji removeComponentAssetNodeFromParentNode:forBodyParts:](self, "removeComponentAssetNodeFromParentNode:forBodyParts:", v9, v8);

  objc_storeStrong((id *)&self->_componentInstances[a4], a3);
  if (-[AVTComponentInstance has2DAsset](v7, "has2DAsset") || objc_msgSend(v10, "has2DAsset"))
    self->_compositorComponentDirtyMask |= 1 << a4;
  if ((unint64_t)a4 <= 8)
  {
    if (((1 << a4) & 0x3A) != 0)
    {
      if (!-[AVTComponentInstance has3DAsset](v7, "has3DAsset") && !objc_msgSend(v10, "has3DAsset"))
        goto LABEL_11;
    }
    else if (((1 << a4) & 0x1C0) == 0)
    {
      goto LABEL_11;
    }
    -[AVTMemoji _invalidateAOImage](self, "_invalidateAOImage");
  }
LABEL_11:

}

- (BOOL)_addTorsoComponentInstanceIfNeeded
{
  SCNNode *torsoNode;
  AVTComponent **components;
  AVTComponent *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  AVTComponentInstance *v14;
  SCNNode *v15;
  SCNNode *v16;
  void *v17;
  SCNNode *bodyComponentContainer;
  _QWORD v20[5];

  torsoNode = self->_torsoNode;
  if (!torsoNode)
  {
    components = self->_components;
    v5 = self->_components[34];
    if (!v5)
    {
      avt_default_log();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[AVTMemoji _addTorsoComponentInstanceIfNeeded].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    }
    v14 = -[AVTComponentInstance initWithComponent:assetResourceCache:]([AVTComponentInstance alloc], "initWithComponent:assetResourceCache:", v5, self->_resourceCache);
    -[AVTMemoji setInstance:forComponentType:](self, "setInstance:forComponentType:", v14, 34);
    -[AVTComponentInstance assetNode](v14, "assetNode");
    v15 = (SCNNode *)objc_claimAutoreleasedReturnValue();
    v16 = self->_torsoNode;
    self->_torsoNode = v15;

    -[AVTMemoji addComponentAssetNode:toNode:forBodyParts:](self, "addComponentAssetNode:toNode:forBodyParts:", self->_torsoNode, self->_bodyComponentContainer, 2);
    -[AVTAvatar resetPresentationConfigurationBehavioursInHierarchy:forBodyParts:](self, "resetPresentationConfigurationBehavioursInHierarchy:forBodyParts:", self->_torsoNode, 2);
    -[AVTComponent materialAtIndex:](components[28], "materialAtIndex:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTComponent setMaterial:atIndex:](v5, "setMaterial:atIndex:", v17, 0);
    -[AVTMemoji componentMaterialDidUpdate:](self, "componentMaterialDidUpdate:", v5);
    bodyComponentContainer = self->_bodyComponentContainer;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __47__AVTMemoji__addTorsoComponentInstanceIfNeeded__block_invoke;
    v20[3] = &unk_1EA61D7A8;
    v20[4] = self;
    -[SCNNode enumerateChildNodesUsingBlock:](bodyComponentContainer, "enumerateChildNodesUsingBlock:", v20);
    -[AVTMemoji _didInstantiateLazyComponentInstanceOfType:assetNode:](self, "_didInstantiateLazyComponentInstanceOfType:assetNode:", 34, self->_torsoNode);

  }
  return torsoNode == 0;
}

void __47__AVTMemoji__addTorsoComponentInstanceIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336);
  objc_msgSend(a2, "skinner");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSkeleton:", v2);

}

- (id)_wrapDeformerDriverInfoForComponentType:(int64_t)a3
{
  uint64_t v3;
  void **v4;
  void *v5;
  AVTMemojiWrapDeformerDriverInfo *v6;
  void *v7;
  id v8;

  if (a3 == 7)
  {
    v3 = 352;
  }
  else
  {
    if (a3 != 35)
    {
      v8 = 0;
      return v8;
    }
    v3 = 344;
  }
  v4 = (void **)((char *)&self->super.super.isa + v3);
  v5 = *(Class *)((char *)&self->super.super.isa + v3);
  if (!v5)
  {
    v6 = objc_alloc_init(AVTMemojiWrapDeformerDriverInfo);
    v7 = *v4;
    *v4 = v6;

    v5 = *v4;
  }
  v8 = v5;
  return v8;
}

- (id)wrapDeformedDriverNamed:(id)a3 forComponentType:(int64_t)a4
{
  id v6;
  uint64_t v7;
  id *v8;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v32[5];
  id v33;

  v6 = a3;
  -[AVTMemoji _wrapDeformerDriverInfoForComponentType:](self, "_wrapDeformerDriverInfoForComponentType:", a4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (id *)v7;
  if (v7)
  {
    objc_msgSend(*(id *)(v7 + 8), "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@.aa/main.scnz"), CFSTR("drivers"), v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[AVTResourceLocator sharedResourceLocator]();
      v11 = (id *)objc_claimAutoreleasedReturnValue();
      -[AVTResourceLocator urlForMemojiAssetAtPath:isDirectory:](v11, (uint64_t)v10, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v33 = 0;
      objc_msgSend(MEMORY[0x1E0CD5A10], "avt_nodeNamed:forSceneAtURL:options:error:", v6, v12, 0, &v33);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v33;
      if (v13)
      {
        avt_default_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          -[AVTMemoji initWithDescriptor:usageIntent:error:].cold.2(v12, v13);

      }
      if (!v9)
      {
        avt_default_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[AVTMemoji wrapDeformedDriverNamed:forComponentType:].cold.2(v15, v16, v17, v18, v19, v20, v21, v22);

      }
      objc_msgSend(v9, "setHidden:", 1);
      objc_msgSend(v9, "removeFromParentNode");
      -[SCNNode addChildNode:](self->_bodyComponentContainer, "addChildNode:", v9);
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __54__AVTMemoji_wrapDeformedDriverNamed_forComponentType___block_invoke;
      v32[3] = &unk_1EA61D7A8;
      v32[4] = self;
      objc_msgSend(v9, "enumerateChildNodesUsingBlock:", v32);
      objc_msgSend(v8[1], "setObject:forKeyedSubscript:", v9, v6);
      if ((unint64_t)objc_msgSend(v8[1], "count") >= 9)
      {
        avt_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[AVTMemoji wrapDeformedDriverNamed:forComponentType:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

      }
      -[AVTMemoji _didInstantiateLazyComponentInstanceOfType:assetNode:](self, "_didInstantiateLazyComponentInstanceOfType:assetNode:", a4, v9);
      if (a4 == 7)
        -[AVTAvatar updateBindingsOfNode:](self, "updateBindingsOfNode:", v9);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __54__AVTMemoji_wrapDeformedDriverNamed_forComponentType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336);
  objc_msgSend(a2, "skinner");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSkeleton:", v2);

}

- (void)enumerateActiveWrapDeformerDriversForComponentType:(int64_t)a3 usingBlock:(id)a4
{
  _QWORD *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  _QWORD *v11;
  id v12;

  v9 = a4;
  -[AVTMemoji _wrapDeformerDriverInfoForComponentType:](self, "_wrapDeformerDriverInfoForComponentType:", a3);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = (void *)v6[2];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __75__AVTMemoji_enumerateActiveWrapDeformerDriversForComponentType_usingBlock___block_invoke;
    v10[3] = &unk_1EA61FD88;
    v11 = v6;
    v12 = v9;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v10);

  }
}

void __75__AVTMemoji_enumerateActiveWrapDeformerDriversForComponentType_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(a3, "unsignedIntegerValue") == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKeyedSubscript:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

- (void)updateWrapDeformerIsActiveForComponentType:(int64_t)a3
{
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  AVTComponentInstance *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  _QWORD *v15;
  AVTMemoji *v16;
  int64_t v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[5];
  _QWORD *v24;
  int64_t v25;
  _QWORD v26[4];
  id v27;

  -[AVTMemoji _wrapDeformerDriverInfoForComponentType:](self, "_wrapDeformerDriverInfoForComponentType:");
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (void *)v5[1];
    v8 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke;
    v26[3] = &unk_1EA61FDB0;
    v9 = v5;
    v27 = v9;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v26);
    v10 = self->_componentInstances[a3];
    -[AVTComponentInstance assetNode](v10, "assetNode");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a3 == 35)
    {
      -[SCNNode simdConvertTransform:fromNode:](self->_bodyComponentContainer, "simdConvertTransform:fromNode:", self->_skeletonRootNode, *MEMORY[0x1E0C83FF0], *(double *)(MEMORY[0x1E0C83FF0] + 16), *(double *)(MEMORY[0x1E0C83FF0] + 32), *(double *)(MEMORY[0x1E0C83FF0] + 48));
      objc_msgSend(v12, "setSimdTransform:");
      if ((self->_visibleBodyParts & 2) == 0)
        goto LABEL_10;
    }
    else if ((self->_visibleBodyParts & 2) == 0)
    {
      v19 = 0;
      v20 = &v19;
      v21 = 0x2020000000;
      v22 = 0;
      v18[0] = v8;
      v18[1] = 3221225472;
      v18[2] = __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke_254;
      v18[3] = &unk_1EA61DA50;
      v18[4] = &v19;
      objc_msgSend(v11, "enumerateHierarchyUsingBlock:", v18);
      if (*((_BYTE *)v20 + 24))
        -[AVTMemoji _applyMorphVariantsForLazyComponentInstanceOfType:assetNode:](self, "_applyMorphVariantsForLazyComponentInstanceOfType:assetNode:", a3, v12);
      _Block_object_dispose(&v19, 8);
      goto LABEL_10;
    }
    v23[0] = v8;
    v23[1] = 3221225472;
    v23[2] = __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke_237;
    v23[3] = &unk_1EA61FDD8;
    v23[4] = self;
    v25 = a3;
    v24 = v9;
    objc_msgSend(v12, "enumerateHierarchyUsingBlock:", v23);

LABEL_10:
    v13 = (void *)v6[1];
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke_2;
    v14[3] = &unk_1EA61FE00;
    v15 = v9;
    v16 = self;
    v17 = a3;
    objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v14);

  }
}

void __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "unsignedIntegerValue") == 1)
    v5 = &unk_1EA655990;
  else
    v5 = &unk_1EA6559A8;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v5, v6);

}

void __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke_237(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "geometry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "valueForUndefinedKey:", CFSTR("wrapDeformerDriverName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(*(id *)(a1 + 32), "wrapDeformedDriverNamed:forComponentType:", v5, *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      avt_default_log();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke_237_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKeyedSubscript:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = objc_msgSend(v15, "unsignedIntegerValue");
      if (v17 == 1003)
      {
        v18 = &unk_1EA6559C0;
        goto LABEL_12;
      }
      if (v17 != 1000)
      {
LABEL_13:
        objc_msgSend(v3, "postSkinningDeformers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          objc_msgSend(v6, "childNodeWithName:recursively:", CFSTR("innerLayer"), 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "childNodeWithName:recursively:", CFSTR("outerLayer"), 1);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "valueForUndefinedKey:", CFSTR("wrapDeformerParameters"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5998]), "initWithInnerLayerNode:outerLayerNode:parameters:", v20, v21, v22);
          v27[0] = v23;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setPostSkinningDeformers:", v24);

          objc_msgSend(v3, "morpher");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25 && (!objc_msgSend(v22, "bindingMode") || *(_QWORD *)(a1 + 48) == 7))
          {
            objc_msgSend(v3, "setValue:forUndefinedKey:", v25, CFSTR("wrapDeformeMorpherBackup"));
            objc_msgSend(v3, "setMorpher:", 0);
          }
          objc_msgSend(v3, "skinner");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            objc_msgSend(v3, "setValue:forUndefinedKey:", v26, CFSTR("wrapDeformeSkinnerBackup"));
            objc_msgSend(v3, "setSkinner:", 0);
          }

        }
        goto LABEL_22;
      }
    }
    v18 = &unk_1EA6559D8;
LABEL_12:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setObject:forKeyedSubscript:", v18, v5);
    goto LABEL_13;
  }
LABEL_23:

}

void __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke_254(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "postSkinningDeformers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v6, "setPostSkinningDeformers:", 0);
    objc_msgSend(v6, "valueForUndefinedKey:", CFSTR("wrapDeformeMorpherBackup"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v6, "setMorpher:", v4);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    }
    objc_msgSend(v6, "valueForUndefinedKey:", CFSTR("wrapDeformeSkinnerBackup"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_msgSend(v6, "setSkinner:", v5);

  }
}

void __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    avt_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke_2_cold_2(v8, v9, v10, v11, v12, v13, v14, v15);

  }
  switch(objc_msgSend(v7, "unsignedIntegerValue"))
  {
    case 1000:
      goto LABEL_14;
    case 1001:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", &unk_1EA655A08, v5);
      objc_msgSend(*(id *)(a1 + 40), "_didActivateLazyComponentInstanceOfType:assetNode:", *(_QWORD *)(a1 + 48), v6);
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 2416);
      if (v16)
        (*(void (**)(void))(v16 + 16))();
      break;
    case 1002:
      v25 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      v26 = &unk_1EA655A08;
      goto LABEL_15;
    case 1003:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", &unk_1EA655A08, v5);
      objc_msgSend(*(id *)(a1 + 40), "_willDeactivateLazyComponentInstanceOfType:assetNode:", *(_QWORD *)(a1 + 48), v6);
      if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 2416))
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", &unk_1EA6559F0, v5);
LABEL_14:
      v25 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      v26 = &unk_1EA6559F0;
LABEL_15:
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v26, v5);
      break;
    default:
      avt_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke_2_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);

      break;
  }

}

- (void)_update
{
  unint64_t componentDirtyMask;
  unint64_t visibleBodyParts;
  unint64_t v5;
  unint64_t i;
  uint64_t v7;
  void *v8;
  AVTComponentInstance *v9;
  AVTComponent *v10;
  void *v11;
  int v12;
  double v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t n;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  AVTPreset **currentPresetsForVariants;
  uint64_t ii;
  uint64_t v43;
  AVTPreset *v44;
  unint64_t v45;
  unint64_t componentAnimatedMask;
  uint64_t v47;
  AVTComponent *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t jj;
  uint64_t v56;
  uint64_t kk;
  unint64_t v58;
  unint64_t v59;
  AVTComponent *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t mm;
  uint64_t v68;
  _BOOL4 v69;
  void *v70;
  void *v71;
  unint64_t v72;
  unsigned int v73;
  unint64_t v74;
  void *v75;
  id obj;
  id obja;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[5];
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _QWORD v91[5];
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  self->_needsUpdate = 0;
  componentDirtyMask = self->_componentDirtyMask;
  if (!componentDirtyMask)
  {
    v32 = 0;
    obja = 0;
    goto LABEL_68;
  }
  if ((componentDirtyMask & 0x400000000) != 0)
  {
    visibleBodyParts = self->_visibleBodyParts;
    -[SCNNode setHidden:](self->_bodyComponentContainer, "setHidden:", (visibleBodyParts & 2) == 0);
    if ((visibleBodyParts & 2) != 0
      && -[AVTMemoji _addTorsoComponentInstanceIfNeeded](self, "_addTorsoComponentInstanceIfNeeded"))
    {
      self->_componentDirtyMask |= 0x800000080uLL;
    }
    -[AVTMemoji updateWrapDeformerIsActiveForComponentType:](self, "updateWrapDeformerIsActiveForComponentType:", 35);
    -[AVTMemoji updateWrapDeformerIsActiveForComponentType:](self, "updateWrapDeformerIsActiveForComponentType:", 7);
    componentDirtyMask = self->_componentDirtyMask;
  }
  if ((componentDirtyMask & 0x2000000000) != 0)
  {
    v5 = self->_visibleBodyParts;
    -[SCNNode setHidden:](self->_handsComponentContainer, "setHidden:", (v5 & 4) == 0);
    if ((v5 & 4) != 0)
      -[AVTMemoji _addHandsComponentInstanceIfNeeded](self, "_addHandsComponentInstanceIfNeeded");
  }
  v75 = 0;
  obj = 0;
  for (i = 0; i != 42; ++i)
  {
    if ((i > 0x25 || ((1 << i) & 0x2400000001) == 0) && ((self->_componentDirtyMask >> i) & 1) != 0)
    {
      v7 = AVTBodyRegionForComponentType(i);
      if (v7 != 1 || self->_torsoNode)
      {
        -[AVTMemoji componentWithType:](self, "componentWithType:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          v9 = -[AVTComponentInstance initWithComponent:assetResourceCache:]([AVTComponentInstance alloc], "initWithComponent:assetResourceCache:", v8, self->_resourceCache);
        else
          v9 = 0;
        -[AVTMemoji setInstance:forComponentType:](self, "setInstance:forComponentType:", v9, i);
        if (i == 35)
        {
          v10 = self->_components[8];
          -[AVTComponent morphVariant](v10, "morphVariant");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("variant_age_child"));

          LODWORD(v13) = 0;
          if (v12)
            -[AVTComponent morphVariantIntensity](v10, "morphVariantIntensity", v13);
          -[AVTComponentInstance setSkinnerVariantIntensity:skeleton:](v9, "setSkinnerVariantIntensity:skeleton:", self->_skeletonRootNode, v13);

        }
        -[AVTComponentInstance assetNode](v9, "assetNode");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
          goto LABEL_36;
        if (i != 28)
          -[AVTComponentInstance updateMaterialsWithComponent:](v9, "updateMaterialsWithComponent:", v8);
        if (v7 == 1)
        {
          -[AVTMemoji addComponentAssetNode:toNode:forBodyParts:](self, "addComponentAssetNode:toNode:forBodyParts:", v14, self->_bodyComponentContainer, 2);
          -[AVTAvatar resetPresentationConfigurationBehavioursInHierarchy:forBodyParts:](self, "resetPresentationConfigurationBehavioursInHierarchy:forBodyParts:", v14, 2);
          v15 = obj;
          if (!obj)
          {
            v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            obj = v15;
          }
        }
        else
        {
          if (v7)
          {
LABEL_35:
            -[AVTMemoji updateWrapDeformerIsActiveForComponentType:](self, "updateWrapDeformerIsActiveForComponentType:", i);
LABEL_36:

            continue;
          }
          -[AVTMemoji addComponentAssetNode:toNode:forBodyParts:](self, "addComponentAssetNode:toNode:forBodyParts:", v14, self->_headComponentContainer, 1);
          v15 = v75;
          if (!v75)
          {
            v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v75 = v15;
          }
        }
        objc_msgSend(v15, "addObject:", v14);
        goto LABEL_35;
      }
    }
  }
  -[AVTMemoji updateEyeLashes](self, "updateEyeLashes");
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v16 = v75;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v100, v109, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v101;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v101 != v19)
          objc_enumerationMutation(v16);
        -[AVTAvatar updateBindingsOfNode:](self, "updateBindingsOfNode:", *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * j));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v100, v109, 16);
    }
    while (v18);
  }

  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v21 = obj;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v96, v108, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v97;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v97 != v24)
          objc_enumerationMutation(v21);
        -[AVTAvatar updateBindingsOfNode:](self, "updateBindingsOfNode:", *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * k));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v96, v108, 16);
    }
    while (v23);
  }

  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  obja = v16;
  v26 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v92, v107, 16);
  v27 = MEMORY[0x1E0C809B0];
  if (v26)
  {
    v28 = v26;
    v29 = *(_QWORD *)v93;
    do
    {
      for (m = 0; m != v28; ++m)
      {
        if (*(_QWORD *)v93 != v29)
          objc_enumerationMutation(obja);
        v31 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * m);
        v91[0] = v27;
        v91[1] = 3221225472;
        v91[2] = __20__AVTMemoji__update__block_invoke;
        v91[3] = &unk_1EA61D7A8;
        v91[4] = self;
        objc_msgSend(v31, "enumerateHierarchyUsingBlock:", v91);
      }
      v28 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v92, v107, 16);
    }
    while (v28);
  }

  v89 = 0u;
  v90 = 0u;
  v87 = 0u;
  v88 = 0u;
  v32 = v21;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v87, v106, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v88;
    do
    {
      for (n = 0; n != v34; ++n)
      {
        if (*(_QWORD *)v88 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * n);
        v86[0] = v27;
        v86[1] = 3221225472;
        v86[2] = __20__AVTMemoji__update__block_invoke_2;
        v86[3] = &unk_1EA61D7A8;
        v86[4] = self;
        objc_msgSend(v37, "enumerateHierarchyUsingBlock:", v86);
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v87, v106, 16);
    }
    while (v34);
  }

  if (-[AVTAvatar optimizeForSnapshot](self, "optimizeForSnapshot"))
  {
    -[AVTComponentInstance assetNode](self->_componentInstances[5], "assetNode");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "avt_enableSubdivisionOnHierarchyWithQuality:animoji:", 0, 0);

    -[AVTComponentInstance assetNode](self->_componentInstances[3], "assetNode");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "avt_enableSubdivisionOnHierarchyWithQuality:animoji:", 0, 0);

  }
LABEL_68:
  v40 = 0;
  currentPresetsForVariants = self->_currentPresetsForVariants;
  do
    -[AVTMemoji unapplyVariantDependenciesForPreset:dirtyComponents:](self, "unapplyVariantDependenciesForPreset:dirtyComponents:", currentPresetsForVariants[v40++], self->_componentDirtyMask);
  while (v40 != 40);
  for (ii = 0; ii != 40; ++ii)
  {
    -[AVTPresetStore resolvedPresetForCategory:]((id *)&self->_presetStore->super.isa, ii);
    v43 = objc_claimAutoreleasedReturnValue();
    -[AVTMemoji applyVariantDependenciesForPreset:dirtyComponents:](self, "applyVariantDependenciesForPreset:dirtyComponents:", v43, self->_componentDirtyMask);
    v44 = currentPresetsForVariants[ii];
    currentPresetsForVariants[ii] = (AVTPreset *)v43;

  }
  v45 = self->_componentDirtyMask;
  if ((v45 & 0x820) != 0)
    -[AVTMemoji updateHighlightsForComponentType:](self, "updateHighlightsForComponentType:", 11);
  v73 = v45;
  if ((v45 & 0x1008) != 0)
    -[AVTMemoji updateHighlightsForComponentType:](self, "updateHighlightsForComponentType:", 12);
  -[AVTMemoji updateSkinMaterial:](self, "updateSkinMaterial:", self->_headComponentContainer);
  -[AVTCompositor componentDidChangeForTypes:](self->_compositor, "componentDidChangeForTypes:", self->_compositorComponentDirtyMask);
  componentAnimatedMask = self->_componentAnimatedMask;
  if ((self->_componentDirtyMask & ~componentAnimatedMask) != 0)
  {
    v47 = 0;
    v72 = ~componentAnimatedMask;
    v74 = self->_componentAnimatedMask;
    do
    {
      if (((1 << v47) & componentAnimatedMask) == 0 && (self->_componentDirtyMask & (1 << v47)) != 0)
      {
        v49 = self->_components[v47];
        -[AVTComponent morphVariant](v49, "morphVariant");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if (v50)
        {
          -[AVTMemoji allAssetNodesForComponentType:](self, "allAssetNodesForComponentType:", v47);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = 0u;
          v83 = 0u;
          v84 = 0u;
          v85 = 0u;
          v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v82, v105, 16);
          if (v52)
          {
            v53 = v52;
            v54 = *(_QWORD *)v83;
            do
            {
              for (jj = 0; jj != v53; ++jj)
              {
                if (*(_QWORD *)v83 != v54)
                  objc_enumerationMutation(v51);
                v56 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * jj);
                -[AVTComponent morphVariantIntensity](v49, "morphVariantIntensity");
                -[AVTMemoji updateMorphVariantsInNodeHierarchy:componentType:variant:weight:](self, "updateMorphVariantsInNodeHierarchy:componentType:variant:weight:", v56, v47, v50);
              }
              v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v82, v105, 16);
            }
            while (v53);
          }

          componentAnimatedMask = v74;
        }

      }
      ++v47;
    }
    while (v47 != 42);
    -[AVTMemoji updateBodyPoseForSkinnerVariantsWithDirtyComponents:](self, "updateBodyPoseForSkinnerVariantsWithDirtyComponents:", self->_componentDirtyMask & v72);
    componentAnimatedMask = self->_componentAnimatedMask;
  }
  if (componentAnimatedMask)
  {
    objc_msgSend(MEMORY[0x1E0CD5A38], "begin");
    objc_msgSend(MEMORY[0x1E0CD5A38], "setAnimationDuration:", 0.25);
    for (kk = 0; kk != 42; ++kk)
    {
      v58 = self->_componentDirtyMask;
      v59 = self->_componentAnimatedMask;
      if ((v58 & (1 << kk)) != 0 && (v59 & (1 << kk)) != 0)
      {
        v61 = self->_components[kk];
        -[AVTComponent morphVariant](v61, "morphVariant");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (v62)
        {
          -[AVTMemoji allAssetNodesForComponentType:](self, "allAssetNodesForComponentType:", kk);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = 0u;
          v79 = 0u;
          v80 = 0u;
          v81 = 0u;
          v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v78, v104, 16);
          if (v64)
          {
            v65 = v64;
            v66 = *(_QWORD *)v79;
            do
            {
              for (mm = 0; mm != v65; ++mm)
              {
                if (*(_QWORD *)v79 != v66)
                  objc_enumerationMutation(v63);
                v68 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * mm);
                -[AVTComponent morphVariantIntensity](v61, "morphVariantIntensity");
                -[AVTMemoji updateMorphVariantsInNodeHierarchy:componentType:variant:weight:](self, "updateMorphVariantsInNodeHierarchy:componentType:variant:weight:", v68, kk, v62);
              }
              v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v78, v104, 16);
            }
            while (v65);
          }

        }
        v59 = self->_componentAnimatedMask;
        v58 = self->_componentDirtyMask;
      }
      -[AVTMemoji updateBodyPoseForSkinnerVariantsWithDirtyComponents:](self, "updateBodyPoseForSkinnerVariantsWithDirtyComponents:", v58 & v59);
    }
    objc_msgSend(MEMORY[0x1E0CD5A38], "commit");
  }
  if (!-[AVTAvatar optimizeForSnapshot](self, "optimizeForSnapshot"))
  {
    v69 = self->_componentInstances[7] && self->_componentInstances[5] != 0;
    if (((self->_componentInstances[5] != 0) & (v73 >> 5)) != 0 || self->_hairPhysicsShouldIgnoreUpperNodes != v69)
    {
      self->_hairPhysicsShouldIgnoreUpperNodes = v69;
      -[AVTComponentInstance assetNode](self->_componentInstances[5], "assetNode");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      if (v70)
      {
        -[AVTMemoji upperNodesIgnoredByDynamics](self, "upperNodesIgnoredByDynamics");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTAvatar removeDynamicsInHierarchy:](self, "removeDynamicsInHierarchy:", v70);
        -[AVTAvatar addDynamicsInHierarchy:ignoringUpperNodes:](self, "addDynamicsInHierarchy:ignoringUpperNodes:", v70, v71);

      }
    }
  }
  self->_componentDirtyMask = 0;
  self->_componentAnimatedMask = 0;
  self->_compositorComponentDirtyMask = 0;

}

void __20__AVTMemoji__update__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336);
  objc_msgSend(a2, "skinner");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSkeleton:", v2);

}

void __20__AVTMemoji__update__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336);
  objc_msgSend(a2, "skinner");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSkeleton:", v2);

}

- (id)upperNodesIgnoredByDynamics
{
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;

  if (!self->_hairPhysicsShouldIgnoreUpperNodes)
    return 0;
  -[AVTComponentInstance assetNode](self->_componentInstances[5], "assetNode");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2)
    return 0;
  v3 = (void *)v2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__AVTMemoji_upperNodesIgnoredByDynamics__block_invoke;
  v7[3] = &unk_1EA61D7A8;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateHierarchyUsingBlock:", v7);

  return v5;
}

void __40__AVTMemoji_upperNodesIgnoredByDynamics__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "morpher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (id)allBuiltinAssetNodes
{
  SCNNode *headNode;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  headNode = self->_headNode;
  v4[0] = self->_eyesAndTongue;
  v4[1] = headNode;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)builtinAssetNodesForComponentType:(int64_t)a3
{
  return -[AVTMemoji _assetNodesForComponentType:includingBuiltInAssetNodes:includingComponentAssetNode:](self, "_assetNodesForComponentType:includingBuiltInAssetNodes:includingComponentAssetNode:", a3, 1, 0);
}

- (id)allAssetNodesForComponentType:(int64_t)a3
{
  return -[AVTMemoji _assetNodesForComponentType:includingBuiltInAssetNodes:includingComponentAssetNode:](self, "_assetNodesForComponentType:includingBuiltInAssetNodes:includingComponentAssetNode:", a3, 1, 1);
}

- (id)_assetNodesForComponentType:(int64_t)a3 includingBuiltInAssetNodes:(BOOL)a4 includingComponentAssetNode:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v8;
  SCNNode *torsoNode;
  SCNNode *v10;
  AVTComponentInstance *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[6];
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD v22[5];
  uint64_t v23;
  uint64_t v24;

  v5 = a5;
  v24 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  memset(v22, 0, sizeof(v22));
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  if (!a4)
    goto LABEL_15;
  if (a3 > 27)
  {
    switch(a3)
    {
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
        goto LABEL_4;
      case 34:
        torsoNode = self->_torsoNode;
        if (torsoNode)
          goto LABEL_6;
        break;
      case 35:
        goto LABEL_14;
      case 38:
      case 39:
      case 40:
      case 41:
        v10 = self->_torsoNode;
        if (v10)
        {
          v21 = 1;
          *(_QWORD *)&v22[0] = v10;
        }
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __96__AVTMemoji__assetNodesForComponentType_includingBuiltInAssetNodes_includingComponentAssetNode___block_invoke_2;
        v16[3] = &unk_1EA61FE28;
        v16[4] = &v18;
        v16[5] = v22;
        -[AVTMemoji enumerateActiveWrapDeformerDriversForComponentType:usingBlock:](self, "enumerateActiveWrapDeformerDriversForComponentType:usingBlock:", 35, v16);
        break;
      default:
        goto LABEL_15;
    }
    goto LABEL_15;
  }
  switch(a3)
  {
    case 2:
      v8 = 320;
LABEL_5:
      torsoNode = *(SCNNode **)((char *)&self->super.super.isa + v8);
LABEL_6:
      v21 = 1;
      *(_QWORD *)&v22[0] = torsoNode;
      break;
    case 7:
LABEL_14:
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __96__AVTMemoji__assetNodesForComponentType_includingBuiltInAssetNodes_includingComponentAssetNode___block_invoke;
      v17[3] = &unk_1EA61FE28;
      v17[4] = &v18;
      v17[5] = v22;
      -[AVTMemoji enumerateActiveWrapDeformerDriversForComponentType:usingBlock:](self, "enumerateActiveWrapDeformerDriversForComponentType:usingBlock:", a3, v17);
      break;
    case 8:
LABEL_4:
      v8 = 296;
      goto LABEL_5;
  }
LABEL_15:
  if (v5)
  {
    v11 = self->_componentInstances[a3];
    -[AVTComponentInstance assetNode](v11, "assetNode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = v19[3];
      v19[3] = v13 + 1;
      *((_QWORD *)v22 + v13) = v12;
    }

  }
  if (v19[3])
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  _Block_object_dispose(&v18, 8);
  return v14;
}

uint64_t __96__AVTMemoji__assetNodesForComponentType_includingBuiltInAssetNodes_includingComponentAssetNode___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(result + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v4 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v4 + 1;
  *(_QWORD *)(v2 + 8 * v4) = a2;
  return result;
}

uint64_t __96__AVTMemoji__assetNodesForComponentType_includingBuiltInAssetNodes_includingComponentAssetNode___block_invoke_2(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(result + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v4 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v4 + 1;
  *(_QWORD *)(v2 + 8 * v4) = a2;
  return result;
}

- (id)_componentInstanceAssetNodesForDependencyOfType:(int64_t)a3 isAssetSpecific:(BOOL)a4
{
  void *v4;

  if (a3 == 42)
    -[AVTMemoji _componentInstanceAssetNodesForDependencyOfType:isAssetSpecific:].cold.1();
  if (self->_componentInstances[a3])
  {
    -[AVTMemoji allAssetNodesForComponentType:](self, "allAssetNodesForComponentType:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_setMorphWeight:(float)a3 forDependencyVariant:(id)a4 ofType:(int64_t)a5 isAssetSpecific:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  float v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v6 = a6;
  v26 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  -[AVTMemoji _componentInstanceAssetNodesForDependencyOfType:isAssetSpecific:](self, "_componentInstanceAssetNodesForDependencyOfType:isAssetSpecific:", a5, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v22;
    v15 = MEMORY[0x1E0C809B0];
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v14)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v16);
        v18[0] = v15;
        v18[1] = 3221225472;
        v18[2] = __73__AVTMemoji__setMorphWeight_forDependencyVariant_ofType_isAssetSpecific___block_invoke;
        v18[3] = &unk_1EA61FE50;
        v20 = a3;
        v19 = v10;
        objc_msgSend(v17, "enumerateHierarchyUsingBlock:", v18);

        ++v16;
      }
      while (v13 != v16);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }

}

void __73__AVTMemoji__setMorphWeight_forDependencyVariant_ofType_isAssetSpecific___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "morpher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setWeight:forTargetNamed:", *(_QWORD *)(a1 + 32), *(float *)(a1 + 40));
    v3 = v4;
  }

}

- (void)_setVariantDependenciesEnabled:(BOOL)a3 forPreset:(id)a4 dirtyComponents:(unint64_t)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  unint64_t v14;
  uint64_t v15;
  BOOL v16;
  _QWORD v17[7];
  BOOL v18;
  _QWORD v19[7];
  BOOL v20;
  _QWORD v21[7];
  BOOL v22;

  v8 = a4;
  v9 = AVTPresetCategoryToComponentType(objc_msgSend(v8, "category"));
  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __70__AVTMemoji__setVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke;
  v21[3] = &unk_1EA61FE78;
  v21[5] = a5;
  v21[6] = v9;
  v22 = a3;
  v21[4] = self;
  objc_msgSend(v8, "enumerateVariantDependenciesOfKind:block:", 0, v21);
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __70__AVTMemoji__setVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke_2;
  v19[3] = &unk_1EA61FE78;
  v19[4] = self;
  v19[5] = a5;
  v19[6] = v9;
  v20 = a3;
  objc_msgSend(v8, "enumerateVariantDependenciesOfKind:block:", 1, v19);
  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __70__AVTMemoji__setVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke_3;
  v17[3] = &unk_1EA61FE78;
  v17[4] = self;
  v17[5] = a5;
  v17[6] = v9;
  v18 = a3;
  objc_msgSend(v8, "enumerateVariantDependenciesOfKind:block:", 2, v17);
  v12[0] = v10;
  v12[1] = 3221225472;
  v12[2] = __70__AVTMemoji__setVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke_4;
  v12[3] = &unk_1EA61FEA0;
  v14 = a5;
  v15 = v9;
  v16 = a3;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v11, "enumerateVisibilityDependencies:", v12);

}

void __70__AVTMemoji__setVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke(uint64_t a1, unint64_t a2, void *a3, float a4)
{
  uint64_t v7;
  double v8;
  unint64_t v9;
  id v10;

  v10 = a3;
  v7 = AVTPresetCategoryToComponentType(a2);
  v9 = *(_QWORD *)(a1 + 40);
  if (((v9 >> *(_QWORD *)(a1 + 48)) & 1) != 0 || ((v9 >> v7) & 1) != 0)
  {
    LODWORD(v8) = 0;
    if (*(_BYTE *)(a1 + 56))
      *(float *)&v8 = a4;
    objc_msgSend(*(id *)(a1 + 32), "_setMorphWeight:forDependencyVariant:ofType:isAssetSpecific:", v10, v7, 0, v8);
  }

}

void __70__AVTMemoji__setVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke_2(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _OWORD v15[4];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = AVTPresetCategoryToComponentType(a2);
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 384 + 8 * v6);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  if (((v9 >> *(_QWORD *)(a1 + 48)) & 1) != 0 || ((v9 >> v6) & 1) != 0)
  {
    memset(v15, 0, sizeof(v15));
    objc_msgSend(v7, "assets", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v15, v16, 16)
      && objc_msgSend(**((id **)&v15[0] + 1), "is2DAsset"))
    {
      if (*(_BYTE *)(a1 + 56))
        v11 = v5;
      else
        v11 = 0;
      v12 = *(void **)(a1 + 32);
      v13 = v11;
      objc_msgSend(v12, "componentInstanceForType:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setImageVariant:", v13);

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 2384) |= 1 << v6;
    }

  }
}

void __70__AVTMemoji__setVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke_3(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _OWORD v15[4];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = AVTPresetCategoryToComponentType(a2);
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 384 + 8 * v6);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  if (((v9 >> *(_QWORD *)(a1 + 48)) & 1) != 0 || ((v9 >> v6) & 1) != 0)
  {
    memset(v15, 0, sizeof(v15));
    objc_msgSend(v7, "assets", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v15, v16, 16)
      && objc_msgSend(**((id **)&v15[0] + 1), "is3DAsset"))
    {
      if (*(_BYTE *)(a1 + 56))
        v11 = v5;
      else
        v11 = 0;
      v12 = *(void **)(a1 + 32);
      v13 = v11;
      objc_msgSend(v12, "componentInstanceForType:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setMaterialVariant:", v13);

    }
  }

}

void __70__AVTMemoji__setVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke_4(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _OWORD v15[4];
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = AVTPresetCategoryToComponentType(a2);
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 384 + 8 * v6);
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 48);
  if (((v9 >> *(_QWORD *)(a1 + 56)) & 1) != 0 || ((v9 >> v6) & 1) != 0)
  {
    memset(v15, 0, sizeof(v15));
    objc_msgSend(v7, "assets", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v15, v16, 16)
      && objc_msgSend(**((id **)&v15[0] + 1), "is3DAsset"))
    {
      if (*(_BYTE *)(a1 + 64))
        v11 = v5;
      else
        v11 = 0;
      v12 = *(void **)(a1 + 32);
      v13 = v11;
      objc_msgSend(v12, "componentInstanceForType:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setVisibilityRules:dictatedByCategory:", v13, objc_msgSend(*(id *)(a1 + 40), "category"));

    }
  }

}

- (void)_setAssetSpecificVariantDependenciesEnabled:(BOOL)a3 forPreset:(id)a4 dirtyComponents:(unint64_t)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[7];
  BOOL v12;
  _QWORD v13[7];
  BOOL v14;
  _QWORD v15[7];
  BOOL v16;

  v8 = a4;
  v9 = AVTPresetCategoryToComponentType(objc_msgSend(v8, "category"));
  v10 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __83__AVTMemoji__setAssetSpecificVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke;
  v15[3] = &unk_1EA61FEC8;
  v15[4] = self;
  v15[5] = a5;
  v15[6] = v9;
  v16 = a3;
  objc_msgSend(v8, "enumerateAssetSpecificVariantDependenciesOfKind:block:", 0, v15);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __83__AVTMemoji__setAssetSpecificVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke_2;
  v13[3] = &unk_1EA61FEC8;
  v13[4] = self;
  v13[5] = a5;
  v13[6] = v9;
  v14 = a3;
  objc_msgSend(v8, "enumerateAssetSpecificVariantDependenciesOfKind:block:", 1, v13);
  v11[0] = v10;
  v11[1] = 3221225472;
  v11[2] = __83__AVTMemoji__setAssetSpecificVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke_3;
  v11[3] = &unk_1EA61FEC8;
  v11[4] = self;
  v11[5] = a5;
  v11[6] = v9;
  v12 = a3;
  objc_msgSend(v8, "enumerateAssetSpecificVariantDependenciesOfKind:block:", 2, v11);

}

void __83__AVTMemoji__setAssetSpecificVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  double v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = *(id *)(*(_QWORD *)(a1 + 32) + 384 + 8 * a2);
  v10 = *(_QWORD *)(a1 + 40);
  if (((v10 >> *(_QWORD *)(a1 + 48)) & 1) != 0 || ((v10 >> a2) & 1) != 0)
  {
    v22 = v9;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v9, "assets", a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v24;
      while (2)
      {
        v15 = v8;
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v17, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", v7);

          if (v19)
          {
            v8 = v15;
            if (objc_msgSend(v17, "is3DAsset"))
            {
              LODWORD(v20) = 1.0;
              if (!*(_BYTE *)(a1 + 56))
                *(float *)&v20 = 0.0;
              objc_msgSend(*(id *)(a1 + 32), "_setMorphWeight:forDependencyVariant:ofType:isAssetSpecific:", v15, v21, 1, v20);
            }
            goto LABEL_16;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        v8 = v15;
        if (v13)
          continue;
        break;
      }
    }
LABEL_16:

    v9 = v22;
  }

}

void __83__AVTMemoji__setAssetSpecificVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = *(id *)(*(_QWORD *)(a1 + 32) + 384 + 8 * a2);
  v10 = *(_QWORD *)(a1 + 40);
  if (((v10 >> *(_QWORD *)(a1 + 48)) & 1) != 0 || ((v10 >> a2) & 1) != 0)
  {
    v25 = v9;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v9, "assets", a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      while (2)
      {
        v15 = v8;
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v17, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", v7);

          if (v19)
          {
            v8 = v15;
            if (objc_msgSend(v17, "is2DAsset"))
            {
              if (*(_BYTE *)(a1 + 56))
                v20 = v15;
              else
                v20 = 0;
              v21 = *(void **)(a1 + 32);
              v22 = v20;
              objc_msgSend(v21, "componentInstanceForType:", v24);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "setImageVariant:", v22);

              *(_QWORD *)(*(_QWORD *)(a1 + 32) + 2384) |= 1 << v24;
            }
            goto LABEL_17;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        v8 = v15;
        if (v13)
          continue;
        break;
      }
    }
LABEL_17:

    v9 = v25;
  }

}

void __83__AVTMemoji__setAssetSpecificVariantDependenciesEnabled_forPreset_dirtyComponents___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = *(id *)(*(_QWORD *)(a1 + 32) + 384 + 8 * a2);
  v10 = *(_QWORD *)(a1 + 40);
  if (((v10 >> *(_QWORD *)(a1 + 48)) & 1) != 0 || ((v10 >> a2) & 1) != 0)
  {
    v26 = v9;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v9, "assets", a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      while (2)
      {
        v15 = v8;
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v17, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", v7);

          if (v19)
          {
            v20 = objc_msgSend(v17, "is3DAsset");
            v8 = v15;
            if (v20)
            {
              if (*(_BYTE *)(a1 + 56))
                v21 = v15;
              else
                v21 = 0;
              v22 = *(void **)(a1 + 32);
              v23 = v21;
              objc_msgSend(v22, "componentInstanceForType:", v25);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "setMaterialVariant:", v23);

            }
            goto LABEL_17;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        v8 = v15;
        if (v13)
          continue;
        break;
      }
    }
LABEL_17:

    v9 = v26;
  }

}

- (void)applyVariantDependenciesForPreset:(id)a3 dirtyComponents:(unint64_t)a4
{
  id v6;

  v6 = a3;
  -[AVTMemoji _setVariantDependenciesEnabled:forPreset:dirtyComponents:](self, "_setVariantDependenciesEnabled:forPreset:dirtyComponents:", 1, v6, a4);
  -[AVTMemoji _setAssetSpecificVariantDependenciesEnabled:forPreset:dirtyComponents:](self, "_setAssetSpecificVariantDependenciesEnabled:forPreset:dirtyComponents:", 1, v6, a4);

}

- (void)unapplyVariantDependenciesForPreset:(id)a3 dirtyComponents:(unint64_t)a4
{
  id v6;

  v6 = a3;
  -[AVTMemoji _setVariantDependenciesEnabled:forPreset:dirtyComponents:](self, "_setVariantDependenciesEnabled:forPreset:dirtyComponents:", 0, v6, a4);
  -[AVTMemoji _setAssetSpecificVariantDependenciesEnabled:forPreset:dirtyComponents:](self, "_setAssetSpecificVariantDependenciesEnabled:forPreset:dirtyComponents:", 0, v6, a4);

}

- (void)updateMorphVariantsInNodeHierarchy:(id)a3 componentType:(int64_t)a4 variant:(id)a5 weight:(float)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  AVTComponentInstance *v15;
  int v16;
  double v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id v24;
  float v25;

  v18 = a3;
  v10 = a5;
  AVTComponentTypeToString(a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(CFSTR("variant_"), "stringByAppendingString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __77__AVTMemoji_updateMorphVariantsInNodeHierarchy_componentType_variant_weight___block_invoke;
    v22 = &unk_1EA61D730;
    v13 = v10;
    v23 = v13;
    v25 = a6;
    v14 = v12;
    v24 = v14;
    objc_msgSend(v18, "enumerateHierarchyUsingBlock:", &v19);
    if (a4 == 8)
    {
      v15 = self->_componentInstances[35];
      v16 = objc_msgSend(v13, "isEqualToString:", CFSTR("variant_age_child"));
      LODWORD(v17) = 0;
      if (v16)
        *(float *)&v17 = a6;
      -[AVTComponentInstance setSkinnerVariantIntensity:skeleton:](v15, "setSkinnerVariantIntensity:skeleton:", self->_skeletonRootNode, v17, v18, v19, v20, v21, v22, v23);

    }
  }

}

void __77__AVTMemoji_updateMorphVariantsInNodeHierarchy_componentType_variant_weight___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  int v10;

  objc_msgSend(a2, "morpher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__AVTMemoji_updateMorphVariantsInNodeHierarchy_componentType_variant_weight___block_invoke_2;
  v6[3] = &unk_1EA61FEF0;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v10 = *(_DWORD *)(a1 + 48);
  v9 = *(id *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __77__AVTMemoji_updateMorphVariantsInNodeHierarchy_componentType_variant_weight___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  double v6;
  id v7;

  objc_msgSend(a2, "name");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    v5 = *(void **)(a1 + 40);
    v6 = *(float *)(a1 + 56);
LABEL_5:
    objc_msgSend(v5, "setWeight:forTargetAtIndex:", a3, v6);
    goto LABEL_6;
  }
  if (objc_msgSend(v7, "hasPrefix:", *(_QWORD *)(a1 + 48)))
  {
    v5 = *(void **)(a1 + 40);
    v6 = 0.0;
    goto LABEL_5;
  }
LABEL_6:

}

- (id)effectiveMorphedNodeForTargetName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  int *v8;
  id v9;
  objc_super v11;

  v4 = a3;
  if (!objc_msgSend(v4, "hasPrefix:", CFSTR("variant_")))
    goto LABEL_9;
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("_"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = AVTPresetCategoryFromString(v6);
  if (v7 > 0x27)
  {
LABEL_8:

LABEL_9:
    v11.receiver = self;
    v11.super_class = (Class)AVTMemoji;
    -[AVTAvatar effectiveMorphedNodeForTargetName:](&v11, sel_effectiveMorphedNodeForTargetName_, v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (((1 << v7) & 0x1E81) == 0)
  {
    if (((1 << v7) & 0xF000000000) != 0)
    {
      v8 = &OBJC_IVAR___AVTMemoji__torsoNode;
      goto LABEL_7;
    }
    goto LABEL_8;
  }
  v8 = &OBJC_IVAR___AVTMemoji__headNode;
LABEL_7:
  v9 = *(id *)((char *)&self->super.super.isa + *v8);

LABEL_10:
  return v9;
}

- (void)_applyMorphVariantsForLazyComponentInstanceOfType:(int64_t)a3 assetNode:(id)a4
{
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  AVTComponent *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  unint64_t v17;

  v14 = a4;
  v6 = 0;
  if (a3 > 34)
  {
    if (a3 != 35)
    {
      v7 = 0;
      if (a3 != 37)
        goto LABEL_9;
    }
  }
  else
  {
    if (a3 == 7)
    {
      v7 = 0x3C000000180;
      v6 = 0x400000004;
      goto LABEL_9;
    }
    v7 = 0;
    if (a3 != 34)
      goto LABEL_9;
  }
  v6 = 0;
  v7 = 0x3C000000100;
LABEL_9:
  for (i = 0; i != 42; ++i)
  {
    if (((v7 >> i) & 1) != 0)
    {
      v9 = self->_components[i];
      -[AVTComponent morphVariant](v9, "morphVariant");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[AVTComponent morphVariantIntensity](v9, "morphVariantIntensity");
        -[AVTMemoji updateMorphVariantsInNodeHierarchy:componentType:variant:weight:](self, "updateMorphVariantsInNodeHierarchy:componentType:variant:weight:", v14, i, v10);
      }

    }
  }
  v11 = 0;
  v12 = MEMORY[0x1E0C809B0];
  do
  {
    if (((v6 >> v11) & 1) != 0)
    {
      -[AVTPresetStore resolvedPresetForCategory:]((id *)&self->_presetStore->super.isa, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v12;
      v15[1] = 3221225472;
      v15[2] = __73__AVTMemoji__applyMorphVariantsForLazyComponentInstanceOfType_assetNode___block_invoke;
      v15[3] = &unk_1EA61FF18;
      v17 = v7;
      v16 = v14;
      objc_msgSend(v13, "enumerateVariantDependenciesOfKind:block:", 0, v15);

    }
    ++v11;
  }
  while (v11 != 40);

}

void __73__AVTMemoji__applyMorphVariantsForLazyComponentInstanceOfType_assetNode___block_invoke(uint64_t a1, unint64_t a2, void *a3, float a4)
{
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  float v11;

  v8 = a3;
  if (((*(_QWORD *)(a1 + 40) >> AVTPresetCategoryToComponentType(a2)) & 1) != 0)
  {
    v7 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __73__AVTMemoji__applyMorphVariantsForLazyComponentInstanceOfType_assetNode___block_invoke_2;
    v9[3] = &unk_1EA61FE50;
    v11 = a4;
    v10 = v8;
    objc_msgSend(v7, "enumerateHierarchyUsingBlock:", v9);

  }
}

void __73__AVTMemoji__applyMorphVariantsForLazyComponentInstanceOfType_assetNode___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  objc_msgSend(a2, "morpher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "setWeight:forTargetNamed:", *(_QWORD *)(a1 + 32), *(float *)(a1 + 40));
    v3 = v4;
  }

}

- (void)_willDeactivateLazyComponentInstanceOfType:(int64_t)a3 assetNode:(id)a4
{
  objc_msgSend(a4, "enumerateHierarchyUsingBlock:", &__block_literal_global_272);
}

void __66__AVTMemoji__willDeactivateLazyComponentInstanceOfType_assetNode___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t i;
  id v6;

  objc_msgSend(a2, "morpher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = v2;
    objc_msgSend(v2, "targets");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    v2 = v6;
    if (v4)
    {
      for (i = 0; i != v4; ++i)
      {
        objc_msgSend(v6, "setWeight:forTargetAtIndex:", i, 0.0);
        v2 = v6;
      }
    }
  }

}

- (void)updateMorphVariantsInStickerPropNodeHierarchy:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[AVTMemoji componentForType:](self, "componentForType:", 8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "morphVariant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "morphVariantIntensity");
    -[AVTMemoji updateMorphVariantsInNodeHierarchy:componentType:variant:weight:](self, "updateMorphVariantsInNodeHierarchy:componentType:variant:weight:", v6, 8, v5);
  }

}

- (BOOL)showsBody
{
  return (LOBYTE(self->_visibleBodyParts) >> 1) & 1;
}

- (void)setShowsBody:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  -[AVTMemoji setVisibleBodyParts:](self, "setVisibleBodyParts:", self->_visibleBodyParts & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (unint64_t)visibleBodyParts
{
  return self->_visibleBodyParts;
}

- (void)setVisibleBodyParts:(unint64_t)a3
{
  unint64_t visibleBodyParts;
  char v5;

  visibleBodyParts = self->_visibleBodyParts;
  if (visibleBodyParts != (a3 | 1))
  {
    self->_visibleBodyParts = a3 | 1;
    v5 = visibleBodyParts ^ a3;
    if (((visibleBodyParts ^ a3) & 2) != 0)
    {
      self->_componentDirtyMask |= 0x400000000uLL;
      -[AVTMemoji invalidate](self, "invalidate");
    }
    if ((v5 & 4) != 0)
    {
      self->_componentDirtyMask |= 0x2000000000uLL;
      -[AVTMemoji invalidate](self, "invalidate");
    }
  }
}

- (id)bodyPose
{
  return self->_bodyPose;
}

- (void)setBodyPose:(id)a3
{
  AVTAvatarBodyPose *v5;
  void *v6;
  double v7;
  double v8;
  AVTAvatarBodyPose *v9;

  v5 = (AVTAvatarBodyPose *)a3;
  if (self->_bodyPose != v5)
  {
    v9 = v5;
    objc_storeStrong((id *)&self->_bodyPose, a3);
    if (v9)
    {
      -[AVTMemoji updateBodyPoseForSkinnerVariantsWithDirtyComponents:](self, "updateBodyPoseForSkinnerVariantsWithDirtyComponents:", -1);
    }
    else
    {
      +[AVTAvatarBodyPose neutralPose](AVTAvatarBodyPose, "neutralPose");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v7) = 0;
      LODWORD(v8) = 0;
      objc_msgSend(v6, "applyToBodySkeletonWithRootJoint:ageBodyPoseVariantIntensity:shoulderWidthBodyPoseVariantIntensity:", self->_skeletonRootNode, v7, v8);

    }
    v5 = v9;
  }

}

- (void)updateBodyPoseForSkinnerVariantsWithDirtyComponents:(unint64_t)a3
{
  int v4;
  int v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  id v10;

  if ((a3 & 0x4000000100) != 0)
  {
    -[AVTMemoji componentForType:](self, "componentForType:", 8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bodyPoseVariantIntensity");
    v5 = v4;
    -[AVTMemoji componentForType:](self, "componentForType:", 38);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bodyPoseVariantIntensity");
    LODWORD(v8) = v7;
    LODWORD(v9) = v5;
    -[AVTAvatarBodyPose applyToBodySkeletonWithRootJoint:ageBodyPoseVariantIntensity:shoulderWidthBodyPoseVariantIntensity:](self->_bodyPose, "applyToBodySkeletonWithRootJoint:ageBodyPoseVariantIntensity:shoulderWidthBodyPoseVariantIntensity:", self->_skeletonRootNode, v9, v8);

  }
}

- (void)rebuildSpecializationSettings
{
  NSDictionary *specializationSettings;
  NSDictionary *v4;
  NSDictionary *v5;
  uint64_t i;
  void *v7;
  NSDictionary *v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSDictionary *v16;

  v16 = self->_specializationSettings;
  specializationSettings = self->_specializationSettings;
  self->_specializationSettings = 0;

  AVTMergeSpecializationSettings(self->_specializationSettings, self->_eyesAndTongueSpecializationSettings);
  v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v5 = self->_specializationSettings;
  self->_specializationSettings = v4;

  for (i = 0; i != 40; ++i)
  {
    -[AVTPresetStore resolvedPresetForCategory:]((id *)&self->_presetStore->super.isa, i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = self->_specializationSettings;
    objc_msgSend(v7, "specializationSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AVTMergeSpecializationSettings(v8, v9);
    v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v11 = self->_specializationSettings;
    self->_specializationSettings = v10;

  }
  -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("dynamics"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_specializationSettings, "objectForKeyedSubscript:", CFSTR("dynamics"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToDictionary:", v13) & 1) == 0)
    -[AVTAvatar physicsSpecializationSettingsDidChange](self, "physicsSpecializationSettingsDidChange");
  -[NSDictionary objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("ARKit disabled blendshapes"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_specializationSettings, "objectForKeyedSubscript:", CFSTR("ARKit disabled blendshapes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "isEqualToArray:", v15) & 1) == 0)
    -[AVTAvatar disabledBlendshapesSpecializationSettingsDidChange](self, "disabledBlendshapesSpecializationSettingsDidChange");

}

- (id)specializationSettings
{
  return self->_specializationSettings;
}

- (id)stickerPhysicsStateIdentifier
{
  return CFSTR("memoji");
}

- (void)setComponentAssetNodeObservationForStickerBlock:(id)a3
{
  void *v4;
  id componentAssetNodeObservationForStickerBlock;

  if (self->_componentAssetNodeObservationForStickerBlock != a3)
  {
    v4 = (void *)MEMORY[0x1DF0D6F78](a3, a2);
    componentAssetNodeObservationForStickerBlock = self->_componentAssetNodeObservationForStickerBlock;
    self->_componentAssetNodeObservationForStickerBlock = v4;

  }
}

- (void)addDerivedNodesMatchingStickerPattern:(id)a3 toArray:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  unint64_t v24;
  _QWORD v25[4];
  id v26;
  unint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[2];
  void (*v33)(uint64_t, void *);
  void *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v33 = __67__AVTMemoji_addDerivedNodesMatchingStickerPattern_toArray_options___block_invoke;
  v34 = &unk_1EA61FF60;
  v35 = &v41;
  v36 = &v37;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v8;
    v33((uint64_t)v32, v11);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v11 = v8;
      v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v45, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v29 != v13)
              objc_enumerationMutation(v11);
            v33((uint64_t)v32, *(void **)(*((_QWORD *)&v28 + 1) + 8 * i));
          }
          v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v45, 16);
        }
        while (v12);
      }
    }
    else
    {
      avt_default_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[AVTMemoji addDerivedNodesMatchingStickerPattern:toArray:options:].cold.1(v11, v15, v16, v17, v18, v19, v20, v21);
    }
  }

  if (*((_BYTE *)v42 + 24))
  {
    v25[0] = v10;
    v25[1] = 3221225472;
    v25[2] = __67__AVTMemoji_addDerivedNodesMatchingStickerPattern_toArray_options___block_invoke_277;
    v25[3] = &unk_1EA61FFB0;
    v27 = a5;
    v26 = v9;
    -[AVTMemoji enumerateActiveWrapDeformerDriversForComponentType:usingBlock:](self, "enumerateActiveWrapDeformerDriversForComponentType:usingBlock:", 35, v25);

  }
  if (*((_BYTE *)v38 + 24))
  {
    v22[0] = v10;
    v22[1] = 3221225472;
    v22[2] = __67__AVTMemoji_addDerivedNodesMatchingStickerPattern_toArray_options___block_invoke_3;
    v22[3] = &unk_1EA61FFB0;
    v24 = a5;
    v23 = v9;
    -[AVTMemoji enumerateActiveWrapDeformerDriversForComponentType:usingBlock:](self, "enumerateActiveWrapDeformerDriversForComponentType:usingBlock:", 7, v22);

  }
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

}

void __67__AVTMemoji_addDerivedNodesMatchingStickerPattern_toArray_options___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  _BYTE *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  AVTComponentTypeToString(0x23uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v9, "hasPrefix:", v3);

  if (v4)
  {
    v5 = (_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v6 = v9;
LABEL_5:
    *v5 = 1;
    goto LABEL_6;
  }
  AVTComponentTypeToString(7uLL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v9, "hasPrefix:", v7);

  v6 = v9;
  if (v8)
  {
    v5 = (_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    goto LABEL_5;
  }
LABEL_6:

}

void __67__AVTMemoji_addDerivedNodesMatchingStickerPattern_toArray_options___block_invoke_277(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__AVTMemoji_addDerivedNodesMatchingStickerPattern_toArray_options___block_invoke_2;
  v4[3] = &unk_1EA61FF88;
  v3 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v5 = v3;
  objc_msgSend(a2, "enumerateHierarchyUsingBlock:", v4);

}

void __67__AVTMemoji_addDerivedNodesMatchingStickerPattern_toArray_options___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (AVTNodeMatchesHierarchyEnumerationOptions(v3, *(_QWORD *)(a1 + 40)))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __67__AVTMemoji_addDerivedNodesMatchingStickerPattern_toArray_options___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__AVTMemoji_addDerivedNodesMatchingStickerPattern_toArray_options___block_invoke_4;
  v4[3] = &unk_1EA61FF88;
  v3 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v5 = v3;
  objc_msgSend(a2, "enumerateHierarchyUsingBlock:", v4);

}

void __67__AVTMemoji_addDerivedNodesMatchingStickerPattern_toArray_options___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (AVTNodeMatchesHierarchyEnumerationOptions(v3, *(_QWORD *)(a1 + 40)))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;

  objc_storeStrong(&self->_componentAssetNodeObservationForStickerBlock, 0);
  objc_storeStrong((id *)&self->_specializationSettings, 0);
  objc_storeStrong((id *)&self->_bodyPose, 0);
  objc_storeStrong((id *)&self->_compositor, 0);
  for (i = 119; i != -1; --i)
    objc_storeStrong((id *)&self->_colorPresets[0][i], 0);
  for (j = 39; j != -1; --j)
    objc_storeStrong((id *)&self->_currentPresetsForVariants[j], 0);
  objc_storeStrong((id *)&self->_presetStore, 0);
  for (k = 41; k != -1; --k)
    objc_storeStrong((id *)&self->_componentInstances[k], 0);
  for (m = 41; m != -1; --m)
    objc_storeStrong((id *)&self->_components[m], 0);
  objc_storeStrong((id *)&self->_eyesAndTongueSpecializationSettings, 0);
  objc_storeStrong((id *)&self->_eyeMaterialRight, 0);
  objc_storeStrong((id *)&self->_eyeMaterialLeft, 0);
  objc_storeStrong((id *)&self->_headwearWrapDeformerDriverInfo, 0);
  objc_storeStrong((id *)&self->_outfitWrapDeformerDriverInfo, 0);
  objc_storeStrong((id *)&self->_skeletonRootNode, 0);
  objc_storeStrong((id *)&self->_eyesAndTongue, 0);
  objc_storeStrong((id *)&self->_eyelashes, 0);
  objc_storeStrong((id *)&self->_avatarNode, 0);
  objc_storeStrong((id *)&self->_torsoNode, 0);
  objc_storeStrong((id *)&self->_headNode, 0);
  objc_storeStrong((id *)&self->_handsComponentContainer, 0);
  objc_storeStrong((id *)&self->_bodyComponentContainer, 0);
  objc_storeStrong((id *)&self->_headComponentContainer, 0);
  objc_storeStrong((id *)&self->_resourceCache, 0);
}

- (void)initWithDescriptor:usageIntent:error:.cold.1()
{
  __assert_rtn("-[AVTMemoji initWithDescriptor:usageIntent:error:]", "AVTMemoji.m", 1061, "_eyesAndTongueSpecializationSettings != nil");
}

- (void)initWithDescriptor:(void *)a1 usageIntent:(void *)a2 error:.cold.2(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0(&dword_1DD1FA000, v5, v6, "Error: could not load scene at %@ with error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_1();
}

- (void)_applyColorPresetForCategory:colorIndex:.cold.1()
{
  __assert_rtn("-[AVTMemoji _applyColorPresetForCategory:colorIndex:]", "AVTMemoji.m", 1477, "colorIndex < AVT_MAX_COLOR_PRESETS");
}

- (void)colorPresetForCategory:colorIndex:.cold.2()
{
  __assert_rtn("-[AVTMemoji colorPresetForCategory:colorIndex:]", "AVTMemoji.m", 1600, "index < AVT_MAX_COLOR_PRESETS");
}

- (void)setColorPreset:forCategory:colorIndex:.cold.2()
{
  __assert_rtn("-[AVTMemoji setColorPreset:forCategory:colorIndex:]", "AVTMemoji.m", 1623, "index < AVT_MAX_COLOR_PRESETS");
}

- (void)setColorPreset:(unint64_t)a1 forCategory:(NSObject *)a2 colorIndex:.cold.3(unint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  AVTPresetCategoryToString(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1DD1FA000, a2, OS_LOG_TYPE_ERROR, "Error: Unreachable code: nil is not a valid secondary/tertiary color for %@", (uint8_t *)&v4, 0xCu);

}

- (void)setPreset:(uint64_t)a3 forCategory:(uint64_t)a4 animated:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. Preset category mismatch", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)updateHighlightsForComponentType:.cold.1()
{
  __assert_rtn("-[AVTMemoji updateHighlightsForComponentType:]", "AVTMemoji.m", 2142, "0");
}

- (void)_addTorsoComponentInstanceIfNeeded
{
  OUTLINED_FUNCTION_1_0();
}

- (void)wrapDeformedDriverNamed:(uint64_t)a3 forComponentType:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. Too many deformer drivers instantiated", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)wrapDeformedDriverNamed:(uint64_t)a3 forComponentType:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0();
}

void __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke_237_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0();
}

void __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1DD1FA000, a1, a3, "Error: Unreachable code: Internal consistency error", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __56__AVTMemoji_updateWrapDeformerIsActiveForComponentType___block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0();
}

- (void)_componentInstanceAssetNodesForDependencyOfType:isAssetSpecific:.cold.1()
{
  __assert_rtn("-[AVTMemoji _componentInstanceAssetNodesForDependencyOfType:isAssetSpecific:]", "AVTMemoji.m", 3074, "dependencyComponentType != AVTComponentTypeNone");
}

- (void)addDerivedNodesMatchingStickerPattern:(uint64_t)a3 toArray:(uint64_t)a4 options:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1DD1FA000, a1, a3, "Error: Unreachable code: Unexpected pattern", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

@end
