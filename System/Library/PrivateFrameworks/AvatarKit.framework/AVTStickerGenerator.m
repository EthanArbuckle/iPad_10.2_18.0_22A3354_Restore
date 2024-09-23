@implementation AVTStickerGenerator

+ (id)poseByApplyingAdjustmentsForConfiguration:(id)a3 avatar:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "physicalizedPose");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pose");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v5, "poseAdjustments", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      v14 = v8;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "poseByApplyingToPose:forAvatar:", v14, v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        ++v13;
        v14 = v8;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v8;
}

+ (void)applyViewTransitionConfiguration:(id)a3 toView:(id)a4 scope:(unint64_t)a5 options:(unint64_t)a6 duration:(double)a7 avatar:(id)a8 context:(id)a9 completionHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(_QWORD);
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  AVTAvatarPhysicalizedPose *v50;
  void *v51;
  void *v52;
  AVTAvatarPhysicalizedPose *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  unint64_t v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  char v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  uint64_t v99;

  v78 = a6;
  v99 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a8;
  v19 = a9;
  v20 = (void (**)(_QWORD))a10;
  if (!v19)
  {
    avt_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      +[AVTStickerGenerator applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:].cold.1(v21);

  }
  objc_msgSend(v17, "scene");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "pointOfView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "environment");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (a5 <= 1)
  {
    v71 = v23;
    v72 = a5;
    v74 = v22;
    v75 = (void *)v24;
    objc_msgSend(v16, "loadIfNeeded");
    objc_msgSend(v19, "resetForAvatar:", v18);
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    objc_msgSend(v16, "presetOverrides");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v92 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v91 + 1) + 8 * i), "applyToAvatar:reversionContext:", v18, v19);
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v91, v98, 16);
      }
      while (v28);
    }
    v73 = a1;
    v77 = v20;

    objc_msgSend(v18, "update");
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    objc_msgSend(v16, "shaderModifiers");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v88;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v88 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * j);
          objc_msgSend(v18, "avatarNode");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "applyToMatchedMaterialsOfAvatar:inHierarchy:options:reversionContext:", v18, v37, 0, v19);

        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v87, v97, 16);
      }
      while (v33);
    }

    if ((v78 & 1) == 0)
    {
      v38 = v77;
      if (a7 <= 0.0)
      {
        v39 = 0;
      }
      else
      {
        v39 = (void *)MEMORY[0x1DF0D6F78](v77);

        v38 = 0;
      }
      objc_msgSend(v16, "poseAdjustments");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "physicalizedPose");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v41;
      v77 = v38;
      if (v40)
      {
        v70 = v39;
        objc_msgSend(v41, "pose");
        v43 = objc_claimAutoreleasedReturnValue();

        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        objc_msgSend(v16, "poseAdjustments");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
        if (v45)
        {
          v46 = v45;
          v47 = *(_QWORD *)v84;
          do
          {
            v48 = 0;
            v49 = (void *)v43;
            do
            {
              if (*(_QWORD *)v84 != v47)
                objc_enumerationMutation(v44);
              objc_msgSend(*(id *)(*((_QWORD *)&v83 + 1) + 8 * v48), "poseByApplyingToPose:forAvatar:", v49, v18);
              v43 = objc_claimAutoreleasedReturnValue();

              ++v48;
              v49 = (void *)v43;
            }
            while (v46 != v48);
            v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
          }
          while (v46);
        }

        v50 = [AVTAvatarPhysicalizedPose alloc];
        objc_msgSend(v16, "physicalizedPose");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "physicsStates");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = -[AVTAvatarPhysicalizedPose initWithPose:physicsStates:](v50, "initWithPose:physicsStates:", v43, v52);

        v39 = v70;
        -[AVTAvatarPhysicalizedPose applyWithTransitionToAvatar:duration:completionHandler:](v53, "applyWithTransitionToAvatar:duration:completionHandler:", v18, v70, a7);

        v42 = (void *)v43;
      }
      else
      {
        objc_msgSend(v41, "applyWithTransitionToAvatar:duration:completionHandler:", v18, v39, a7);
      }

    }
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    objc_msgSend(v16, "morpherOverrides");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v80;
      do
      {
        for (k = 0; k != v56; ++k)
        {
          if (*(_QWORD *)v80 != v57)
            objc_enumerationMutation(v54);
          v59 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * k);
          objc_msgSend(v18, "avatarNode");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "applyToAvatar:inHierarchy:reversionContext:", v18, v60, v19);

        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v79, v95, 16);
      }
      while (v56);
    }

    if ((v78 & 2) != 0)
    {
      v23 = v71;
      a5 = v72;
      v25 = v75;
      v20 = (void (**)(_QWORD))v77;
      a1 = v73;
      v22 = v74;
    }
    else
    {
      objc_msgSend(v16, "camera");
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = v75;
      v20 = (void (**)(_QWORD))v77;
      a1 = v73;
      v22 = v74;
      if (v61)
      {
        objc_msgSend(v16, "camera");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "addCamera:inScene:reversionContext:", v62, v74, v19);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "camera");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setProjectionDirection:", 0);

        objc_msgSend(v19, "saveUpdatePointOfViewFromFramingModeInEnvironment:", v75);
        if (a7 <= 0.0)
        {
          objc_msgSend(v17, "setPointOfView:", v23);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CD5A38], "begin");
          objc_msgSend(MEMORY[0x1E0CD5A38], "setAnimationDuration:", a7);
          v64 = (void *)MEMORY[0x1E0CD5A38];
          objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "setAnimationTimingFunction:", v65);

          v25 = v75;
          objc_msgSend(v17, "setPointOfView:", v23);
          v22 = v74;
          objc_msgSend(MEMORY[0x1E0CD5A38], "commit");
        }
        a5 = v72;

      }
      else
      {
        v23 = v71;
        a5 = v72;
      }
    }
  }
  if ((a5 & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v76 = v25;
      v66 = v18;
      objc_msgSend(v16, "bodyPose");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setShowsBody:", v67 != 0);
      objc_msgSend(v66, "setBodyPose:", v67);
      if (v67)
        objc_msgSend(v19, "saveShowMemojiBody:", 0);
      objc_msgSend(v66, "update");

      v25 = v76;
    }
    objc_msgSend(v16, "props");
    v68 = (void *)objc_claimAutoreleasedReturnValue();

    if (v68)
    {
      objc_msgSend(v16, "props");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "addProps:toScene:forAvatar:withCamera:options:reversionContext:", v69, v22, v18, v23, 0, v19);

    }
  }
  if (v20)
    v20[2](v20);

}

+ (void)applyViewTransitionConfiguration:(id)a3 forLateAdditionOfComponentAssetNode:(id)a4 ofAvatar:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "loadIfNeeded");
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v7, "shaderModifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v14++), "applyToMatchedMaterialsOfAvatar:inHierarchy:options:reversionContext:", v9, v8, 0, 0);
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v12);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v7, "morpherOverrides", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v19++), "applyToAvatar:inHierarchy:reversionContext:", v9, v8, 0);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v17);
  }

}

- (void)applyConfiguration:(id)a3 options:(id)a4 snapshotBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(void);
  AVTRenderer *renderer;
  void *v12;
  AVTRenderer *v13;
  AVTRenderer *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  AVTAvatarPhysicalizedPose *v39;
  void *v40;
  void *v41;
  AVTAvatarPhysicalizedPose *v42;
  AVTAvatar *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  AVTAvatar *avatar;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t k;
  void *v58;
  AVTAvatar *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t m;
  void *v70;
  double v71;
  double v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  int v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t n;
  AVTAvatar *v87;
  int v88;
  uint64_t v89;
  double v90;
  double v91;
  double v92;
  __int128 v93;
  __int128 v94;
  void *v95;
  __int128 v96;
  char isKindOfClass;
  void (**v98)(void);
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
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
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  const __CFString *v135;
  _QWORD v136[3];

  v136[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(void))a5;
  objc_msgSend(MEMORY[0x1E0CD5A38], "begin");
  objc_msgSend(MEMORY[0x1E0CD5A38], "setAnimationDuration:", 0.0);
  renderer = self->_renderer;
  if (!renderer)
  {
    v135 = CFSTR("AVTRendererOptionInitiallyConfigureForARMode");
    v136[0] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v136, &v135, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCNRenderer rendererWithDevice:options:](AVTRenderer, "rendererWithDevice:options:", 0, v12);
    v13 = (AVTRenderer *)objc_claimAutoreleasedReturnValue();
    v14 = self->_renderer;
    self->_renderer = v13;

    -[AVTRenderer setFramingMode:](self->_renderer, "setFramingMode:", CFSTR("cameraDefault"));
    -[AVTRenderer setEnableReticle:](self->_renderer, "setEnableReticle:", 0);
    renderer = self->_renderer;
  }
  -[AVTRenderer setAvatar:](renderer, "setAvatar:", self->_avatar);
  objc_msgSend(v8, "loadIfNeeded");
  -[AVTStickerConfigurationReversionContext resetForAvatar:](self->_context, "resetForAvatar:", self->_avatar);
  objc_msgSend(v8, "camera");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)objc_opt_class();
    objc_msgSend(v8, "camera");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTRenderer scene](self->_renderer, "scene");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addCamera:inScene:reversionContext:", v17, v18, self->_context);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[AVTRenderer setPointOfView:](self->_renderer, "setPointOfView:", v19);
  }
  else
  {
    objc_msgSend(v8, "framingMode");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = CFSTR("camera");
    if (v20)
      v22 = (__CFString *)v20;
    v23 = v22;

    -[AVTRenderer setFramingModeForcingPointOfViewUpdate:](self->_renderer, "setFramingModeForcingPointOfViewUpdate:", v23);
    -[AVTRenderer pointOfView](self->_renderer, "pointOfView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v98 = v10;
  if (self->_avatar)
  {
    v121 = 0u;
    v122 = 0u;
    v119 = 0u;
    v120 = 0u;
    objc_msgSend(v8, "presetOverrides");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v119, v134, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v120;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v120 != v27)
            objc_enumerationMutation(v24);
          objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 8 * i), "applyToAvatar:reversionContext:", self->_avatar, self->_context);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v119, v134, 16);
      }
      while (v26);
    }
    v95 = v19;

    objc_msgSend(v8, "poseAdjustments");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "physicalizedPose");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v29)
    {
      objc_msgSend(v30, "pose");
      v32 = objc_claimAutoreleasedReturnValue();

      v117 = 0u;
      v118 = 0u;
      v115 = 0u;
      v116 = 0u;
      objc_msgSend(v8, "poseAdjustments");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v115, v133, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v116;
        do
        {
          v37 = 0;
          v38 = (void *)v32;
          do
          {
            if (*(_QWORD *)v116 != v36)
              objc_enumerationMutation(v33);
            objc_msgSend(*(id *)(*((_QWORD *)&v115 + 1) + 8 * v37), "poseByApplyingToPose:forAvatar:", v38, self->_avatar);
            v32 = objc_claimAutoreleasedReturnValue();

            ++v37;
            v38 = (void *)v32;
          }
          while (v35 != v37);
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v115, v133, 16);
        }
        while (v35);
      }

      v39 = [AVTAvatarPhysicalizedPose alloc];
      objc_msgSend(v8, "physicalizedPose");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "physicsStates");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = -[AVTAvatarPhysicalizedPose initWithPose:physicsStates:](v39, "initWithPose:physicsStates:", v32, v41);

      -[AVTAvatarPhysicalizedPose applyToAvatar:](v42, "applyToAvatar:", self->_avatar);
      v31 = (void *)v32;
    }
    else
    {
      objc_msgSend(v30, "applyToAvatar:", self->_avatar);
    }

    if ((isKindOfClass & 1) != 0)
    {
      v43 = self->_avatar;
      objc_msgSend(v8, "bodyPose");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTAvatar setShowsBody:](v43, "setShowsBody:", v44 != 0);
      -[AVTAvatar setBodyPose:](v43, "setBodyPose:", v44);

    }
    -[AVTAvatar update](self->_avatar, "update");
    v113 = 0u;
    v114 = 0u;
    v111 = 0u;
    v112 = 0u;
    objc_msgSend(v8, "shaderModifiers");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v111, v132, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v112;
      do
      {
        for (j = 0; j != v47; ++j)
        {
          if (*(_QWORD *)v112 != v48)
            objc_enumerationMutation(v45);
          v50 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * j);
          avatar = self->_avatar;
          -[AVTAvatar avatarNode](avatar, "avatarNode");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "applyToMatchedMaterialsOfAvatar:inHierarchy:options:reversionContext:", avatar, v52, v9, self->_context);

        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v111, v132, 16);
      }
      while (v47);
    }

    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    objc_msgSend(v8, "morpherOverrides");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v107, v131, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v108;
      do
      {
        for (k = 0; k != v55; ++k)
        {
          if (*(_QWORD *)v108 != v56)
            objc_enumerationMutation(v53);
          v58 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * k);
          v59 = self->_avatar;
          -[AVTAvatar avatarNode](v59, "avatarNode");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "applyToAvatar:inHierarchy:reversionContext:", v59, v60, self->_context);

        }
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v107, v131, 16);
      }
      while (v55);
    }

    v19 = v95;
  }
  objc_msgSend(v8, "props");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  if (v61)
  {
    v62 = (void *)objc_opt_class();
    objc_msgSend(v8, "props");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTRenderer scene](self->_renderer, "scene");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "addProps:toScene:forAvatar:withCamera:options:reversionContext:", v63, v64, self->_avatar, v19, v9, self->_context);

  }
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  objc_msgSend(v8, "props");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v103, v130, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v104;
    do
    {
      for (m = 0; m != v67; ++m)
      {
        if (*(_QWORD *)v104 != v68)
          objc_enumerationMutation(v65);
        objc_msgSend(*(id *)(*((_QWORD *)&v103 + 1) + 8 * m), "stickerGenerationWillBegin");
      }
      v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v103, v130, 16);
    }
    while (v67);
  }

  objc_msgSend(v19, "camera");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "fieldOfView");
  v72 = v71;
  objc_msgSend(v70, "avt_simdPostProjectionTransform");
  HIDWORD(v73) = 0;
  HIDWORD(v74) = 0;
  v94 = v74;
  v96 = v73;
  HIDWORD(v75) = 0;
  v93 = v75;
  v76 = objc_msgSend(v9, "useLegacyCorrectClippingImplementation");
  v77 = objc_msgSend(v9, "contentMode");
  if (v76)
  {
    if (v77 != 1)
      goto LABEL_66;
    objc_msgSend(v19, "camera");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setFieldOfView:", v72 * 1.375);
    goto LABEL_65;
  }
  if (v77 == 1)
  {
    v79 = 0;
    v123 = v96;
    v124 = v94;
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    v125 = v93;
    do
    {
      *(__int128 *)((char *)&v126 + v79) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1DD26A110, COERCE_FLOAT(*(__int128 *)((char *)&v123 + v79))), (float32x4_t)xmmword_1DD26A120, *(float32x2_t *)((char *)&v123 + v79), 1), (float32x4_t)xmmword_1DD26A130, *(float32x4_t *)((char *)&v123 + v79), 2);
      v79 += 16;
    }
    while (v79 != 48);
LABEL_64:
    objc_msgSend(v19, "camera", v126, v127, v128);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "avt_setSimdPostProjectionTransform:", v90, v91, v92);
LABEL_65:

    goto LABEL_66;
  }
  if (objc_msgSend(v9, "contentMode") == 2
    || objc_msgSend(v9, "contentMode") == 3
    || objc_msgSend(v9, "contentMode") == 4)
  {
    v80 = 0;
    v123 = v96;
    v124 = v94;
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    v125 = v93;
    do
    {
      *(__int128 *)((char *)&v126 + v80) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1DD26A110, COERCE_FLOAT(*(__int128 *)((char *)&v123 + v80))), (float32x4_t)xmmword_1DD26A120, *(float32x2_t *)((char *)&v123 + v80), 1), (float32x4_t)xmmword_1DD26A080, *(float32x4_t *)((char *)&v123 + v80), 2);
      v80 += 16;
    }
    while (v80 != 48);
    goto LABEL_64;
  }
LABEL_66:
  v81 = v19;
  objc_msgSend(MEMORY[0x1E0CD5A38], "commit");
  v98[2]();
  objc_msgSend(MEMORY[0x1E0CD5A38], "begin");
  objc_msgSend(MEMORY[0x1E0CD5A38], "setAnimationDuration:", 0.0);
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  objc_msgSend(v8, "props");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v99, v129, 16);
  if (v83)
  {
    v84 = v83;
    v85 = *(_QWORD *)v100;
    do
    {
      for (n = 0; n != v84; ++n)
      {
        if (*(_QWORD *)v100 != v85)
          objc_enumerationMutation(v82);
        objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * n), "stickerGenerationDidEnd");
      }
      v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v99, v129, 16);
    }
    while (v84);
  }

  if ((isKindOfClass & 1) != 0)
  {
    v87 = self->_avatar;
    -[AVTAvatar setShowsBody:](v87, "setShowsBody:", 0);
    -[AVTAvatar setBodyPose:](v87, "setBodyPose:", 0);

  }
  -[AVTStickerConfigurationReversionContext revertChangesWithScope:animationDuration:](self->_context, "revertChangesWithScope:animationDuration:", 0, 0.0);
  v88 = objc_msgSend(v9, "useLegacyCorrectClippingImplementation");
  v89 = objc_msgSend(v9, "contentMode");
  if (v88)
  {
    if (v89 == 1)
      objc_msgSend(v70, "setFieldOfView:", v72);
  }
  else if (v89 == 1
         || objc_msgSend(v9, "contentMode") == 2
         || objc_msgSend(v9, "contentMode") == 3
         || objc_msgSend(v9, "contentMode") == 4)
  {
    objc_msgSend(v70, "avt_setSimdPostProjectionTransform:", *(double *)&v96, *(double *)&v94, *(double *)&v93);
  }
  objc_msgSend(v8, "unload");
  objc_msgSend(MEMORY[0x1E0CD5A38], "commit");

}

- (void)updateConfiguration:(id)a3 atTime:(double)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  CMTime v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CMTime v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v6, "props");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v8)
  {
    v9 = v8;
    LOBYTE(v10) = 0;
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v7);
        if ((v10 & 1) != 0)
          v10 = 1;
        else
          v10 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "wantsTimedUpdates");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v9);

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CD5A38], "begin");
      objc_msgSend(MEMORY[0x1E0CD5A38], "setAnimationDuration:", 0.0);
      memset(&v29, 0, sizeof(v29));
      CMTimeMakeWithSeconds(&v29, a4, 1000000000);
      -[AVTRenderer scene](self->_renderer, "scene");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "rootNode");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "childNodeWithName:recursively:", CFSTR("sticker_props"), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      objc_msgSend(v6, "props");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v26;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v26 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
            objc_msgSend(v21, "nodeName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "childNodeWithName:recursively:", v22, 0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            v24 = v29;
            objc_msgSend(v21, "updateNode:withContentAtTime:", v23, &v24);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
        }
        while (v18);
      }

      objc_msgSend(MEMORY[0x1E0CD5A38], "commit");
    }
  }
  else
  {

  }
}

+ (void)addProps:(id)a3 toScene:(id)a4 forAvatar:(id)a5 withCamera:(id)a6 options:(id)a7 reversionContext:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  id v29;
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v29 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = objc_alloc_init(MEMORY[0x1E0CD59D0]);
  objc_msgSend(v18, "setName:", CFSTR("sticker_props"));
  v27 = v14;
  objc_msgSend(v14, "rootNode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addChildNode:", v18);

  v26 = v17;
  objc_msgSend(v17, "saveExtraPropsNode:", v18);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v13;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v33;
    v23 = MEMORY[0x1E0C809B0];
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v24);
        CACurrentMediaTime();
        v30[0] = v23;
        v30[1] = 3221225472;
        v30[2] = __86__AVTStickerGenerator_addProps_toScene_forAvatar_withCamera_options_reversionContext___block_invoke;
        v30[3] = &unk_1EA61DFF8;
        v31 = v18;
        objc_msgSend(v25, "buildNodeForAvatar:withCamera:options:completionHandler:", v29, v15, v16, v30);

        ++v24;
      }
      while (v21 != v24);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v21);
  }

}

uint64_t __86__AVTStickerGenerator_addProps_toScene_forAvatar_withCamera_options_reversionContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addChildNode:", a2);
}

+ (id)addCamera:(id)a3 inScene:(id)a4 reversionContext:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  objc_msgSend(a3, "buildNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setName:", CFSTR("sticker_camera"));
  objc_msgSend(v8, "rootNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addChildNode:", v9);
  objc_msgSend(v7, "saveExtraCameraNode:", v9);

  return v9;
}

- (AVTStickerGenerator)initWithAvatar:(id)a3
{
  id v4;
  AVTStickerGenerator *v5;
  AVTStickerGenerator *v6;
  AVTStickerConfigurationReversionContext *v7;
  AVTStickerConfigurationReversionContext *context;
  AVTSnapshotHelper *v9;
  AVTSnapshotHelper *snapshotHelper;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AVTStickerGenerator;
  v5 = -[AVTStickerGenerator init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    -[AVTStickerGenerator setAvatar:](v5, "setAvatar:", v4);
    v7 = objc_alloc_init(AVTStickerConfigurationReversionContext);
    context = v6->_context;
    v6->_context = v7;

    v6->_async = 1;
    v9 = objc_alloc_init(AVTSnapshotHelper);
    snapshotHelper = v6->_snapshotHelper;
    v6->_snapshotHelper = v9;

    if (initWithAvatar__onceToken != -1)
      dispatch_once(&initWithAvatar__onceToken, &__block_literal_global_2);
    objc_storeStrong((id *)&v6->_workQueue, (id)initWithAvatar__sharedWorkQueue);
  }

  return v6;
}

void __38__AVTStickerGenerator_initWithAvatar___block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INITIATED, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("com.apple.avatarkit.AVTStickerGenerator", v0);
  v2 = (void *)initWithAvatar__sharedWorkQueue;
  initWithAvatar__sharedWorkQueue = (uint64_t)v1;

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AVTStickerGenerator;
  -[AVTStickerGenerator dealloc](&v2, sel_dealloc);
}

- (void)setAvatar:(id)a3
{
  AVTAvatar *v5;
  AVTAvatar **p_avatar;
  AVTAvatar *avatar;
  AVTAvatar *v8;

  v5 = (AVTAvatar *)a3;
  avatar = self->_avatar;
  p_avatar = &self->_avatar;
  if (avatar != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_avatar, a3);
    -[AVTAvatar pauseBakedAnimation](*p_avatar, "pauseBakedAnimation");
    v5 = v8;
  }

}

- (void)_snapshotAtTime:(double)a3 configuration:(id)a4 options:(id)a5 completionBlock:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, const void *, id, double, double, double, double, double, double, double, double);
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  float v22;
  float v23;
  unint64_t v24;
  unint64_t v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  AVTSnapshotHelper *snapshotHelper;
  AVTRenderer *renderer;
  const void *v37;
  id v38;
  double v39;
  id v41;

  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, const void *, id, double, double, double, double, double, double, double, double))a6;
  objc_msgSend(v10, "size");
  v13 = v12;
  objc_msgSend(v10, "size");
  v15 = v14;
  objc_msgSend(v10, "sizeMultiplier");
  v17 = v16;
  objc_msgSend(v10, "scaleFactor");
  v19 = v18;
  objc_msgSend(v9, "legacySizeOption");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v9, "legacySizeOption");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "floatValue");
    v23 = v22;

    v13 = v23;
    v15 = v13;
  }
  v24 = (unint64_t)(v19 * (v17 * v13));
  v25 = (unint64_t)(v19 * (v17 * v15));
  if (objc_msgSend(v10, "contentMode") == 1)
  {
    v26 = (double)v24;
    v27 = (double)v25;
    if (objc_msgSend(v10, "useLegacyCorrectClippingImplementation"))
    {
      v28 = (unint64_t)(v26 * 1.375);
      v29 = (unint64_t)(v27 * 1.375);
      v39 = (double)(unint64_t)v28;
      v30 = (double)(unint64_t)v29;
      v31 = (double)(v28 - v24) * 0.5;
      v32 = (double)(v29 - v25) * 0.5;
    }
    else
    {
      v28 = (unint64_t)(v26 * 1.9);
      v29 = (unint64_t)(v27 * 1.9);
      v39 = (double)(unint64_t)v28;
      v30 = (double)(unint64_t)v29;
      v31 = (double)(v28 - v24) * 0.5;
      v32 = (double)(v29 - v25);
    }
    goto LABEL_11;
  }
  if (objc_msgSend(v10, "contentMode") == 2
    || objc_msgSend(v10, "contentMode") == 3
    || objc_msgSend(v10, "contentMode") == 4)
  {
    v26 = (double)v24;
    v28 = (unint64_t)((double)v24 * 1.9);
    v27 = (double)v25;
    v29 = (unint64_t)((double)v25 * 1.9);
    v32 = (double)(v29 - v25) * 0.5;
    v39 = (double)(unint64_t)v28;
    v30 = (double)(v29 - (unint64_t)v32);
    v31 = (double)(v28 - v24) * 0.5;
LABEL_11:
    v33 = 0.0;
    v34 = 0.0;
    goto LABEL_12;
  }
  v26 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v30 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v27 = v30;
  v39 = v26;
  v34 = *MEMORY[0x1E0C9D648];
  v33 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v32 = v33;
  v31 = *MEMORY[0x1E0C9D648];
  v29 = v25;
  v28 = v24;
LABEL_12:
  -[AVTStickerGenerator updateConfiguration:atTime:](self, "updateConfiguration:atTime:", v9, a3);
  -[AVTRenderer updateAtTime:](self->_renderer, "updateAtTime:", a3);
  renderer = self->_renderer;
  snapshotHelper = self->_snapshotHelper;
  v41 = 0;
  v37 = (const void *)-[AVTSnapshotHelper newCGImageWithRenderer:antialiasingMode:pixelWidth:pixelHeight:error:]((CGImageRef)snapshotHelper, renderer, 2, v28, v29, &v41);
  v38 = v41;
  v11[2](v11, v37, v38, v31, v32, v26, v27, v34, v33, v39, v30);

  if (v37)
    CFRelease(v37);

}

- (void)stickerImageWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  +[AVTStickerGeneratorOptions defaultOptions](AVTStickerGeneratorOptions, "defaultOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__AVTStickerGenerator_stickerImageWithConfiguration_completionHandler___block_invoke;
  v10[3] = &unk_1EA61E040;
  v11 = v6;
  v9 = v6;
  -[AVTStickerGenerator stickerImageWithConfiguration:options:completionHandler:](self, "stickerImageWithConfiguration:options:completionHandler:", v7, v8, v10);

}

uint64_t __71__AVTStickerGenerator_stickerImageWithConfiguration_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)stickerImageWithConfiguration:(id)a3 correctClipping:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  +[AVTStickerGeneratorOptions optionsWithCorrectClipping:](AVTStickerGeneratorOptions, "optionsWithCorrectClipping:", v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTStickerGenerator stickerImageWithConfiguration:options:completionHandler:](self, "stickerImageWithConfiguration:options:completionHandler:", v9, v10, v8);

}

- (void)_stickerImageWithConfiguration:(id)a3 options:(id)a4 startTime:(double)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, void *, AVTAvatar *, double, double, double, double);
  __int128 v12;
  uint64_t v13;
  char v14;
  id v15;
  id v16;
  double v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  AVTStickerGenerator *v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  BOOL v28;
  char v29;
  uint64_t v30;
  double *v31;
  uint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *, AVTAvatar *, double, double, double, double))a6;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 0;
  v30 = 0;
  v31 = (double *)&v30;
  v32 = 0x4010000000;
  v33 = &unk_1DD28DD0A;
  v12 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v34 = *MEMORY[0x1E0C9D648];
  v35 = v12;
  v13 = objc_msgSend(v10, "contentMode");
  v14 = AVTPosterExpectsExtraTallContent(self->_avatar, v9);
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __90__AVTStickerGenerator__stickerImageWithConfiguration_options_startTime_completionHandler___block_invoke;
  v22 = &unk_1EA61E0B8;
  v23 = self;
  v15 = v9;
  v24 = v15;
  v16 = v10;
  v25 = v16;
  v26 = &v36;
  v27 = &v30;
  v28 = v13 == 4;
  v29 = v14;
  -[AVTStickerGenerator applyConfiguration:options:snapshotBlock:](self, "applyConfiguration:options:snapshotBlock:", v15, v16, &v19);
  if (v37[3])
  {
    objc_msgSend(v16, "scaleFactor", v19, v20, v21, v22, v23, v24);
    *(float *)&v17 = v17;
    objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", v37[3], 0, *(float *)&v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease((CGImageRef)v37[3]);
    v11[2](v11, v18, self->_avatar, v31[4], v31[5], v31[6], v31[7]);

  }
  else
  {
    v11[2](v11, 0, self->_avatar, v31[4], v31[5], v31[6], v31[7]);
  }

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

}

void __90__AVTStickerGenerator__stickerImageWithConfiguration_options_startTime_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  __int128 v7;
  __int16 v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __90__AVTStickerGenerator__stickerImageWithConfiguration_options_startTime_completionHandler___block_invoke_2;
  v5[3] = &unk_1EA61E090;
  v6 = v4;
  v7 = *(_OWORD *)(a1 + 56);
  v8 = *(_WORD *)(a1 + 72);
  objc_msgSend(v2, "_snapshotAtTime:configuration:options:completionBlock:", v3, v6, v5, 0.0);

}

void __90__AVTStickerGenerator__stickerImageWithConfiguration_options_startTime_completionHandler___block_invoke_2(uint64_t a1, CGImage *a2, void *a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  id v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[4];
  __int128 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _QWORD v32[4];
  __int128 v33;
  double v34;
  double v35;
  double v36;
  double v37;

  v21 = a3;
  if (a2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "contentMode") == 1 || objc_msgSend(*(id *)(a1 + 32), "contentMode") == 2)
    {
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __90__AVTStickerGenerator__stickerImageWithConfiguration_options_startTime_completionHandler___block_invoke_3;
      v32[3] = &unk_1EA61E068;
      v33 = *(_OWORD *)(a1 + 40);
      v34 = a4;
      v35 = a5;
      v36 = a6;
      v37 = a7;
      +[AVTImageUtilities cropImageWhitespace:outsideRect:insideRect:resultBlock:](AVTImageUtilities, "cropImageWhitespace:outsideRect:insideRect:resultBlock:", a2, v32, a4, a5, a6, a7, a8, a9, a10, a11);
    }
    else if (objc_msgSend(*(id *)(a1 + 32), "contentMode") == 3 || objc_msgSend(*(id *)(a1 + 32), "contentMode") == 4)
    {
      v23 = *(_QWORD *)(a1 + 32);
      LODWORD(v22) = *(_DWORD *)(v23 + 24);
      v24 = *(unsigned __int8 *)(a1 + 56);
      v25 = *(unsigned __int8 *)(a1 + 57);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __90__AVTStickerGenerator__stickerImageWithConfiguration_options_startTime_completionHandler___block_invoke_4;
      v26[3] = &unk_1EA61E068;
      v27 = *(_OWORD *)(a1 + 40);
      v28 = a4;
      v29 = a5;
      v30 = a6;
      v31 = a7;
      +[AVTImageUtilities posterWithStickerImage:posterSize:minimumHorizontalMargin:thumbnailRect:allowsExtraTallContent:expectsExtraTallContent:resultBlock:](AVTImageUtilities, "posterWithStickerImage:posterSize:minimumHorizontalMargin:thumbnailRect:allowsExtraTallContent:expectsExtraTallContent:resultBlock:", a2, v24, v25, v26, *(double *)(v23 + 8), *(double *)(v23 + 16), v22, a4, a5, a6, a7);
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = CGImageRetain(a2);
    }
  }

}

double __90__AVTStickerGenerator__stickerImageWithConfiguration_options_startTime_completionHandler___block_invoke_3(uint64_t a1, CGImageRef image, double a3, double a4)
{
  double result;
  double v8;
  uint64_t v9;
  __int128 v10;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CGImageRetain(image);
  result = *(double *)(a1 + 48) - a3;
  v8 = *(double *)(a1 + 56) - a4;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(_OWORD *)(a1 + 64);
  *(double *)(v9 + 32) = result;
  *(double *)(v9 + 40) = v8;
  *(_OWORD *)(v9 + 48) = v10;
  return result;
}

double __90__AVTStickerGenerator__stickerImageWithConfiguration_options_startTime_completionHandler___block_invoke_4(uint64_t a1, CGImageRef image, double a3, double a4)
{
  double result;
  double v8;
  uint64_t v9;
  __int128 v10;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CGImageRetain(image);
  result = *(double *)(a1 + 48) - a3;
  v8 = *(double *)(a1 + 56) - a4;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(_OWORD *)(a1 + 64);
  *(double *)(v9 + 32) = result;
  *(double *)(v9 + 40) = v8;
  *(_OWORD *)(v9 + 48) = v10;
  return result;
}

- (void)stickerImageWithConfiguration:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  CFTimeInterval v11;
  NSObject *workQueue;
  void *v13;
  __int128 v14;
  NSObject *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  CFTimeInterval v22;
  uint64_t v23;
  double *v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  void *v40;
  _QWORD block[5];
  id v42;
  id v43;
  id v44;
  CFTimeInterval v45;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = CACurrentMediaTime();
  if (self->_async)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __79__AVTStickerGenerator_stickerImageWithConfiguration_options_completionHandler___block_invoke;
    block[3] = &unk_1EA61E108;
    block[4] = self;
    v42 = v8;
    v43 = v9;
    v45 = v11;
    v44 = v10;
    dispatch_async(workQueue, block);

    v13 = v42;
  }
  else
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__2;
    v39 = __Block_byref_object_dispose__2;
    v40 = 0;
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__2;
    v33 = __Block_byref_object_dispose__2;
    v34 = 0;
    v23 = 0;
    v24 = (double *)&v23;
    v25 = 0x4010000000;
    v26 = &unk_1DD28DD0A;
    v14 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v27 = *MEMORY[0x1E0C9D648];
    v28 = v14;
    v15 = self->_workQueue;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __79__AVTStickerGenerator_stickerImageWithConfiguration_options_completionHandler___block_invoke_102;
    v16[3] = &unk_1EA61E158;
    v16[4] = self;
    v17 = v8;
    v22 = v11;
    v18 = v9;
    v19 = &v35;
    v20 = &v29;
    v21 = &v23;
    dispatch_sync(v15, v16);
    (*((void (**)(id, uint64_t, uint64_t, double, double, double, double))v10 + 2))(v10, v36[5], v30[5], v24[4], v24[5], v24[6], v24[7]);

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);

    _Block_object_dispose(&v35, 8);
    v13 = v40;
  }

}

void __79__AVTStickerGenerator_stickerImageWithConfiguration_options_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  double v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(double *)(a1 + 64);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__AVTStickerGenerator_stickerImageWithConfiguration_options_completionHandler___block_invoke_2;
  v5[3] = &unk_1EA61E040;
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  objc_msgSend(v1, "_stickerImageWithConfiguration:options:startTime:completionHandler:", v2, v4, v5, v3);

}

void __79__AVTStickerGenerator_stickerImageWithConfiguration_options_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;

  v13 = a2;
  v14 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__AVTStickerGenerator_stickerImageWithConfiguration_options_completionHandler___block_invoke_3;
  block[3] = &unk_1EA61E0E0;
  v15 = *(id *)(a1 + 32);
  v20 = v14;
  v21 = v15;
  v19 = v13;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = a7;
  v16 = v14;
  v17 = v13;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __79__AVTStickerGenerator_stickerImageWithConfiguration_options_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, double, double, double, double))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

uint64_t __79__AVTStickerGenerator_stickerImageWithConfiguration_options_completionHandler___block_invoke_102(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  double v4;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(double *)(a1 + 80);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__AVTStickerGenerator_stickerImageWithConfiguration_options_completionHandler___block_invoke_2_103;
  v6[3] = &unk_1EA61E130;
  v7 = *(_OWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 72);
  return objc_msgSend(v2, "_stickerImageWithConfiguration:options:startTime:completionHandler:", v1, v3, v6, v4);
}

void __79__AVTStickerGenerator_stickerImageWithConfiguration_options_completionHandler___block_invoke_2_103(_QWORD *a1, void *a2, void *a3, double a4, double a5, double a6, double a7)
{
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  double *v20;
  id v21;

  v13 = a2;
  v14 = a3;
  v15 = *(_QWORD *)(a1[4] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v13;
  v21 = v13;

  v17 = *(_QWORD *)(a1[5] + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v14;
  v19 = v14;

  v20 = *(double **)(a1[6] + 8);
  v20[4] = a4;
  v20[5] = a5;
  v20[6] = a6;
  v20[7] = a7;

}

- (void)posterWithConfiguration:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  AVTStickerGeneratorOptions *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  float v26;
  uint64_t v27;
  id v28;
  _QWORD v29[4];
  id v30;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(AVTStickerGeneratorOptions);
  objc_msgSend(v9, "size");
  v13 = v12 + v12;
  objc_msgSend(v9, "size");
  v15 = v14 + v14;
  if (v13 >= v14 + v14)
    v15 = v13;
  -[AVTStickerGeneratorOptions setSize:](v11, "setSize:", v15);
  objc_msgSend(v9, "scaleFactor");
  -[AVTStickerGeneratorOptions setScaleFactor:](v11, "setScaleFactor:");
  if (objc_msgSend(v9, "growsForExtraTallContent"))
    v16 = 4;
  else
    v16 = 3;
  -[AVTStickerGeneratorOptions setContentMode:](v11, "setContentMode:", v16);
  -[AVTStickerGeneratorOptions sizeMultiplier](v11, "sizeMultiplier");
  v18 = v17;
  -[AVTStickerGeneratorOptions scaleFactor](v11, "scaleFactor");
  v20 = v19;
  objc_msgSend(v9, "size");
  v22 = v20 * (v18 * v21);
  objc_msgSend(v9, "size");
  v11->_posterSizeInPixels.width = (double)(unint64_t)v22;
  v11->_posterSizeInPixels.height = (double)(unint64_t)(v20 * (v18 * v23));
  objc_msgSend(v9, "minimumHorizontalMargin");
  v25 = v24;

  v26 = v20 * (v18 * v25);
  v27 = MEMORY[0x1E0C809B0];
  v11->_posterMinimumHorizontalMargin = v26;
  v29[0] = v27;
  v29[1] = 3221225472;
  v29[2] = __73__AVTStickerGenerator_posterWithConfiguration_options_completionHandler___block_invoke;
  v29[3] = &unk_1EA61E040;
  v30 = v8;
  v28 = v8;
  -[AVTStickerGenerator stickerImageWithConfiguration:options:completionHandler:](self, "stickerImageWithConfiguration:options:completionHandler:", v10, v11, v29);

}

uint64_t __73__AVTStickerGenerator_posterWithConfiguration_options_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (AVTAvatar)avatar
{
  return self->_avatar;
}

- (BOOL)async
{
  return self->_async;
}

- (void)setAsync:(BOOL)a3
{
  self->_async = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatar, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_snapshotHelper, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
}

+ (void)applyViewTransitionConfiguration:(os_log_t)log toView:scope:options:duration:avatar:context:completionHandler:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "context";
}

@end
