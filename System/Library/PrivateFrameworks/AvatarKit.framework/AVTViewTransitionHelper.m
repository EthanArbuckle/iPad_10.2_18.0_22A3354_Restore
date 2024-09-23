@implementation AVTViewTransitionHelper

- (id)initWithView:(id *)a1
{
  id v3;
  id *v4;
  objc_super v6;

  v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)AVTViewTransitionHelper;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4)
      objc_storeWeak(v4 + 1, v3);
  }

  return a1;
}

- (void)transitionViewToStickerConfiguration:(void *)a3 fallbackPose:(unint64_t)a4 duration:(void *)a5 style:(void *)a6 avatar:(void *)a7 completionHandler:(double)a8 simultaneousAnimationsBlock:
{
  unint64_t v16;
  unint64_t v17;
  id v18;
  void (**v19)(_QWORD);
  void (**v20)(_QWORD);
  void *v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  unint64_t v31;
  id WeakRetained;
  AVTStickerConfigurationReversionContext *v33;
  id v34;
  id v35;
  int v36;
  int v37;
  char v38;
  id v39;
  AVTStickerConfigurationReversionContext *v40;
  id v41;
  id v42;
  id v43;
  id *v44;
  id v45;
  id v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  id *v65;
  id *v66;
  id v67;
  void *v68;
  uint64_t v69;
  _QWORD v70[4];
  id v71;
  id v72;
  void (**v73)(_QWORD);
  _QWORD v74[4];
  id v75;
  id v76;
  void (**v77)(_QWORD);
  _QWORD v78[4];
  id v79;

  v16 = a2;
  v17 = a3;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  if (a1)
  {
    objc_msgSend(v18, "avatarNode");
    v69 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v18, "pose");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToPose:", v17);

    }
    else
    {
      v22 = 0;
    }
    v23 = (unint64_t)a1[2];
    v24 = v23 != v16 || v16 == 0;
    if (!v24 || (v22 & 1) != 0 || !(v16 | v17 | v23))
    {
      if (v20)
        v20[2](v20);
      v30 = (void *)v69;
      if (v19)
        v19[2](v19);
      goto LABEL_60;
    }
    v25 = (id)v23;
    objc_storeStrong(a1 + 2, a2);
    v26 = a1[3];
    v27 = a1[3];
    a1[3] = 0;

    if (!v16 && v25)
      objc_msgSend(v18, "resetToPhysicsState:assumeRestStateIfNil:", 0, 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = v18;
      v29 = v28;
      v68 = v28;
      if (v16)
      {
        v78[0] = MEMORY[0x1E0C809B0];
        v78[1] = 3221225472;
        v78[2] = __145__AVTViewTransitionHelper_transitionViewToStickerConfiguration_fallbackPose_duration_style_avatar_completionHandler_simultaneousAnimationsBlock___block_invoke;
        v78[3] = &unk_1EA61DC88;
        v79 = (id)v16;
        objc_msgSend(v29, "setComponentAssetNodeObservationForStickerBlock:", v78);

      }
      else
      {
        objc_msgSend(v28, "setComponentAssetNodeObservationForStickerBlock:", 0);
      }
    }
    else
    {
      v68 = 0;
    }
    if (a4)
      v31 = a4;
    else
      v31 = 3;
    if (a8 == 0.0)
    {
      objc_msgSend(v18, "removeDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:", CFSTR("sticker-transition"));
      WeakRetained = objc_loadWeakRetained(a1 + 1);
      objc_msgSend(WeakRetained, "setAvtRendererTechnique:", 0);

      if (v26)
        objc_msgSend(v26, "revertChangesWithScope:animationDuration:", 0, 0.0);
      objc_msgSend(v18, "stopTransitionAnimation");
      if (v16)
      {
        v33 = objc_alloc_init(AVTStickerConfigurationReversionContext);
        v34 = a1[3];
        a1[3] = v33;

        v35 = objc_loadWeakRetained(a1 + 1);
        +[AVTStickerGenerator applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:](AVTStickerGenerator, "applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:", v16, v35, 0, 0, v18, a1[3], 0.0, 0);

        v30 = (void *)v69;
      }
      else
      {
        v30 = (void *)v69;
        if (v17)
          objc_msgSend(v18, "setPose:", v17);
      }
      if (v20)
        v20[2](v20);
      if (v19)
        v19[2](v19);
      goto LABEL_59;
    }
    if (v25)
      v36 = objc_msgSend(v25, "definesPoseOnly") ^ 1;
    else
      v36 = 0;
    v67 = v25;
    if (v16)
      v37 = objc_msgSend((id)v16, "definesPoseOnly") ^ 1;
    else
      v37 = 0;
    if (v31 == 1)
      v38 = 1;
    else
      v38 = v36;
    if ((v38 & 1) == 0 && (v37 & 1) == 0)
    {
      objc_msgSend(v18, "removeDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:", CFSTR("sticker-transition"));
      v39 = objc_loadWeakRetained(a1 + 1);
      objc_msgSend(v39, "setAvtRendererTechnique:", 0);

      if (v16)
      {
        v40 = objc_alloc_init(AVTStickerConfigurationReversionContext);
        v41 = a1[3];
        a1[3] = v40;

        v63 = objc_loadWeakRetained(a1 + 1);
        v64 = a1[3];
        v74[0] = MEMORY[0x1E0C809B0];
        v74[1] = 3221225472;
        v74[2] = __145__AVTViewTransitionHelper_transitionViewToStickerConfiguration_fallbackPose_duration_style_avatar_completionHandler_simultaneousAnimationsBlock___block_invoke_2;
        v74[3] = &unk_1EA61DCB0;
        v66 = &v75;
        v42 = v18;
        v75 = v42;
        v65 = &v76;
        v43 = (id)v16;
        v76 = v43;
        v44 = (id *)&v77;
        v77 = v19;
        +[AVTStickerGenerator applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:](AVTStickerGenerator, "applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:", v43, v63, 0, 0, v42, v64, a8, v74);

      }
      else
      {
        v70[0] = MEMORY[0x1E0C809B0];
        v70[1] = 3221225472;
        v70[2] = __145__AVTViewTransitionHelper_transitionViewToStickerConfiguration_fallbackPose_duration_style_avatar_completionHandler_simultaneousAnimationsBlock___block_invoke_3;
        v70[3] = &unk_1EA61DCB0;
        v66 = &v71;
        v45 = v18;
        v71 = v45;
        v65 = &v72;
        v46 = (id)v17;
        v72 = v46;
        v44 = (id *)&v73;
        v73 = v19;
        objc_msgSend(v45, "transitionFromPose:toPose:duration:delay:completionHandler:", 0, v46, v70, a8, 0.0);
      }
      v25 = v67;

      v30 = (void *)v69;
      if (v20)
        v20[2](v20);
      objc_msgSend(v26, "revertChangesWithScope:animationDuration:", 0, a8);
      goto LABEL_59;
    }
    if (v31 <= 2 || (v36 & v37) == 1)
    {
      v30 = (void *)v69;
      objc_msgSend(a1, "view_performCrossFadeTransitionToStickerConfiguration:fallbackPose:duration:avatar:avatarNode:oldReversionContext:completionHandler:simultaneousAnimationsBlock:", v16, v17, v18, v69, v26, v19, a8, v20);
    }
    else
    {
      if (v31 != 3)
      {
        avt_default_log();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          -[AVTViewTransitionHelper transitionViewToStickerConfiguration:fallbackPose:duration:style:avatar:completionHandler:simultaneousAnimationsBlock:].cold.2(v47, v48, v49, v50, v51, v52, v53, v54);

      }
      if (v36)
      {
        v30 = (void *)v69;
        objc_msgSend(a1, "view_performCrossFadeThenAnimateTransitionToStickerConfiguration:fallbackPose:duration:avatar:avatarNode:oldReversionContext:completionHandler:simultaneousAnimationsBlock:", v16, v17, v18, v69, v26, v19, a8, v20);
      }
      else
      {
        if (v37)
        {
          v25 = v67;
          v30 = (void *)v69;
          objc_msgSend(a1, "view_performAnimateThenCrossFadeTransitionFromStickerConfiguration:toStickerConfiguration:duration:avatar:avatarNode:oldReversionContext:completionHandler:simultaneousAnimationsBlock:", v67, v16, v18, v69, v26, v19, a8, v20);
          goto LABEL_59;
        }
        avt_default_log();
        v55 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          -[AVTViewTransitionHelper transitionViewToStickerConfiguration:fallbackPose:duration:style:avatar:completionHandler:simultaneousAnimationsBlock:].cold.1(v55, v56, v57, v58, v59, v60, v61, v62);

        v30 = (void *)v69;
      }
    }
    v25 = v67;
LABEL_59:

LABEL_60:
  }

}

uint64_t __145__AVTViewTransitionHelper_transitionViewToStickerConfiguration_fallbackPose_duration_style_avatar_completionHandler_simultaneousAnimationsBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4)
    return +[AVTStickerGenerator applyViewTransitionConfiguration:forLateAdditionOfComponentAssetNode:ofAvatar:](AVTStickerGenerator, "applyViewTransitionConfiguration:forLateAdditionOfComponentAssetNode:ofAvatar:", *(_QWORD *)(result + 32), a3, a2);
  return result;
}

uint64_t __145__AVTViewTransitionHelper_transitionViewToStickerConfiguration_fallbackPose_duration_style_avatar_completionHandler_simultaneousAnimationsBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;

  +[AVTStickerGenerator poseByApplyingAdjustmentsForConfiguration:avatar:](AVTStickerGenerator, "poseByApplyingAdjustmentsForConfiguration:avatar:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setPose:", v2);

  objc_msgSend(*(id *)(a1 + 32), "stopTransitionAnimation");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __145__AVTViewTransitionHelper_transitionViewToStickerConfiguration_fallbackPose_duration_style_avatar_completionHandler_simultaneousAnimationsBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setPose:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "stopTransitionAnimation");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)transitionCoordinatorToStickerConfiguration:(unint64_t)a3 duration:(uint64_t)a4 style:(void *)a5 options:(double)a6 avatar:
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id WeakRetained;
  AVTStickerConfigurationReversionContext *v27;
  id v28;
  id v29;
  int v30;
  id v31;
  AVTStickerConfigurationReversionContext *v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v12 = a2;
  v13 = a5;
  v14 = v13;
  if (a1)
  {
    objc_msgSend(v13, "avatarNode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a1[2])
    {
      avt_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[AVTViewTransitionHelper transitionCoordinatorToStickerConfiguration:duration:style:options:avatar:].cold.2(v16, v17, v18, v19, v20, v21, v22, v23);

    }
    objc_storeStrong(a1 + 2, a2);
    v24 = a1[3];
    v25 = a1[3];
    a1[3] = 0;

    if (!a3)
      a3 = 3;
    if (a6 == 0.0)
    {
      objc_msgSend(v14, "removeDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:", CFSTR("sticker-transition"));
      WeakRetained = objc_loadWeakRetained(a1 + 1);
      objc_msgSend(WeakRetained, "setAvtRendererTechnique:", 0);

      if (v24)
        objc_msgSend(v24, "revertChangesWithScope:animationDuration:", 0, 0.0);
      if (!v12)
        goto LABEL_22;
      v27 = objc_alloc_init(AVTStickerConfigurationReversionContext);
      v28 = a1[3];
      a1[3] = v27;

      v29 = objc_loadWeakRetained(a1 + 1);
      +[AVTStickerGenerator applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:](AVTStickerGenerator, "applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:", v12, v29, 0, a4, v14, a1[3], 0.0, 0);
    }
    else
    {
      if (v12)
        v30 = objc_msgSend(v12, "definesPoseOnly");
      else
        v30 = 1;
      if (a3 == 1 || !v30)
      {
        if (a3 > 2)
        {
          if (a3 == 3)
          {
            objc_msgSend(a1, "coordinator_performCrossFadeThenAnimateTransitionToStickerConfiguration:duration:options:avatar:avatarNode:oldReversionContext:", v12, a4, v14, v15, v24, a6);
          }
          else
          {
            avt_default_log();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              -[AVTViewTransitionHelper transitionViewToStickerConfiguration:fallbackPose:duration:style:avatar:completionHandler:simultaneousAnimationsBlock:].cold.1(v34, v35, v36, v37, v38, v39, v40, v41);

          }
        }
        else
        {
          objc_msgSend(a1, "coordinator_performCrossFadeTransitionToStickerConfiguration:duration:options:avatar:avatarNode:oldReversionContext:", v12, a4, v14, v15, v24, a6);
        }
        goto LABEL_22;
      }
      objc_msgSend(v14, "removeDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:", CFSTR("sticker-transition"));
      v31 = objc_loadWeakRetained(a1 + 1);
      objc_msgSend(v31, "setAvtRendererTechnique:", 0);

      if (v24)
        objc_msgSend(v24, "revertChangesWithScope:animationDuration:", 0, a6);
      v32 = objc_alloc_init(AVTStickerConfigurationReversionContext);
      v33 = a1[3];
      a1[3] = v32;

      v29 = objc_loadWeakRetained(a1 + 1);
      +[AVTStickerGenerator applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:](AVTStickerGenerator, "applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:", v12, v29, 0, a4, v14, a1[3], a6, 0);
    }

LABEL_22:
  }

}

- (void)transitionCoordinatorOutOfStickerConfigurationWithDuration:(double)a3 style:(uint64_t)a4 options:(void *)a5 avatar:
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v8 = a5;
  v9 = v8;
  if (a1)
  {
    objc_msgSend(v8, "avatarNode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v9;
      objc_msgSend(v11, "setComponentAssetNodeObservationForStickerBlock:", 0);
    }
    else
    {
      v11 = 0;
    }
    v12 = a1[2];
    v13 = a1[2];
    a1[2] = 0;

    v14 = a1[3];
    v15 = a1[3];
    a1[3] = 0;

    if (!a2)
      a2 = 3;
    if (v12)
      v16 = objc_msgSend(v12, "definesPoseOnly");
    else
      v16 = 1;
    if (a2 == 1 || !v16)
    {
      if (a2 > 2)
      {
        if (a2 == 3)
        {
          objc_msgSend(a1, "coordinator_performCrossFadeThenAnimateTransitionOutOfStickerConfigurationWithDuration:avatar:avatarNode:oldReversionContext:", v9, v10, v14, a3);
        }
        else
        {
          avt_default_log();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            -[AVTViewTransitionHelper transitionViewToStickerConfiguration:fallbackPose:duration:style:avatar:completionHandler:simultaneousAnimationsBlock:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

        }
      }
      else
      {
        objc_msgSend(a1, "coordinator_performCrossFadeTransitionOutOfStickerConfigurationWithDuration:avatar:avatarNode:oldReversionContext:", v9, v10, v14, a3);
      }
    }
    else
    {
      objc_msgSend(v14, "revertChangesWithScope:animationDuration:", 0, a3);
    }

  }
}

- (void)view_performCrossFadeTransitionToStickerConfiguration:(id)a3 fallbackPose:(id)a4 duration:(double)a5 avatar:(id)a6 avatarNode:(id)a7 oldReversionContext:(id)a8 completionHandler:(id)a9 simultaneousAnimationsBlock:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  double v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  id WeakRetained;
  void *v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD block[4];
  __int128 v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56[2];
  int v57;
  id to;
  id location[2];

  v45 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v44 = a8;
  v42 = a9;
  v20 = a10;
  objc_initWeak(location, self);
  objc_copyWeak(&to, (id *)&self->_view);
  -[AVTViewTransitionHelper transitionTechnique](self, "transitionTechnique");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v21)
  {
    avt_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[AVTViewTransitionHelper view_performCrossFadeTransitionToStickerConfiguration:fallbackPose:duration:avatar:avatarNode:oldReversionContext:completionHandler:simultaneousAnimationsBlock:].cold.1(v23, v24, v25, v26, v27, v28, v29, v30);

  }
  LODWORD(v22) = 0;
  objc_msgSend(v21, "setFramebufferTextureOpacity:", v22);
  v41 = v19;
  -[AVTViewTransitionHelper viewBackgroundColor](self, "viewBackgroundColor");
  v40 = v31;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "renderer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "_renderingQueue");
  v34 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __187__AVTViewTransitionHelper_view_performCrossFadeTransitionToStickerConfiguration_fallbackPose_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke;
  block[3] = &unk_1EA61DD28;
  objc_copyWeak(&v55, location);
  objc_copyWeak(v56, &to);
  v47 = v40;
  v48 = v21;
  v49 = v44;
  v50 = v18;
  v51 = v45;
  v52 = v17;
  v53 = v20;
  v56[1] = *(id *)&a5;
  v57 = 0;
  v54 = v42;
  v43 = v42;
  *(_QWORD *)&v40 = v20;
  v35 = v17;
  v36 = v45;
  v37 = v18;
  v38 = v44;
  v39 = v21;
  dispatch_async(v34, block);

  objc_destroyWeak(v56);
  objc_destroyWeak(&v55);
  objc_destroyWeak(&to);
  objc_destroyWeak(location);

}

void __187__AVTViewTransitionHelper_view_performCrossFadeTransitionToStickerConfiguration_fallbackPose_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  void *v4;
  void *v5;
  AVTStickerConfigurationReversionContext *v6;
  void *v7;
  AVTStickerConfigurationReversionContext *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16[2];
  int v17;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  v3 = objc_loadWeakRetained((id *)(a1 + 112));
  v4 = v3;
  if (WeakRetained && v3)
  {
    objc_msgSend(v3, "setAvtRendererTechnique:", 0);
    objc_msgSend(WeakRetained, "snapshotViewUsingBackgroundColor:", *(double *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 48), "setSnapshotTexture:", v5);
      objc_msgSend(v4, "setAvtRendererTechnique:", *(_QWORD *)(a1 + 48));
    }
    objc_msgSend(*(id *)(a1 + 56), "revertChangesWithScope:animationDuration:", 0, 0.0);
    objc_msgSend(*(id *)(a1 + 64), "stopTransitionAnimation");
    if (*(_QWORD *)(a1 + 72))
    {
      v6 = objc_alloc_init(AVTStickerConfigurationReversionContext);
      v7 = (void *)WeakRetained[3];
      WeakRetained[3] = v6;
      v8 = v6;

      +[AVTStickerGenerator applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:](AVTStickerGenerator, "applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:", *(_QWORD *)(a1 + 72), v4, 0, 0, *(_QWORD *)(a1 + 64), v8, 0.0, 0);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 64), "setPose:", *(_QWORD *)(a1 + 80));
    }
    objc_msgSend(MEMORY[0x1E0CD5A38], "flush");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __187__AVTViewTransitionHelper_view_performCrossFadeTransitionToStickerConfiguration_fallbackPose_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke_2;
    block[3] = &unk_1EA61DD00;
    v14 = *(id *)(a1 + 88);
    v10 = *(id *)(a1 + 64);
    v16[1] = *(id *)(a1 + 120);
    v17 = *(_DWORD *)(a1 + 128);
    v11 = *(id *)(a1 + 48);
    objc_copyWeak(v16, (id *)(a1 + 112));
    v12 = *(id *)(a1 + 72);
    v13 = *(id *)(a1 + 80);
    v15 = *(id *)(a1 + 96);
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(v16);
  }

}

void __187__AVTViewTransitionHelper_view_performCrossFadeTransitionToStickerConfiguration_fallbackPose_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12[2];
  int v13;

  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __187__AVTViewTransitionHelper_view_performCrossFadeTransitionToStickerConfiguration_fallbackPose_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke_3;
  v6[3] = &unk_1EA61DCD8;
  v12[1] = *(id *)(a1 + 88);
  v5 = v3;
  v7 = v5;
  v13 = *(_DWORD *)(a1 + 96);
  v8 = *(id *)(a1 + 40);
  objc_copyWeak(v12, (id *)(a1 + 80));
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 72);
  objc_msgSend(v4, "addDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:block:", CFSTR("sticker-transition"), v6);

  objc_destroyWeak(v12);
}

void __187__AVTViewTransitionHelper_view_performCrossFadeTransitionToStickerConfiguration_fallbackPose_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke_3(uint64_t a1, void *a2, double a3, double a4, uint64_t a5, _BYTE *a6)
{
  double v10;
  float v11;
  double v12;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  v10 = (a3 - a4) / *(double *)(a1 + 80);
  *(float *)&v10 = v10;
  *(float *)&a4 = fmaxf(fminf(*(float *)&v10, 1.0), 0.0);
  LODWORD(v10) = LODWORD(a4);
  objc_msgSend(*(id *)(a1 + 32), "_solveForInput:", v10);
  *(float *)&v12 = *(float *)(a1 + 88) + (float)(v11 * (float)(1.0 - *(float *)(a1 + 88)));
  objc_msgSend(*(id *)(a1 + 40), "setFramebufferTextureOpacity:", v12);
  if (*(float *)&a4 >= 1.0)
  {
    *a6 = 1;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    v14 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "avtRendererTechnique");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(a1 + 40);

      if (v15 == v16)
        objc_msgSend(v14, "setAvtRendererTechnique:", 0);
    }
    +[AVTStickerGenerator poseByApplyingAdjustmentsForConfiguration:avatar:](AVTStickerGenerator, "poseByApplyingAdjustmentsForConfiguration:avatar:", *(_QWORD *)(a1 + 48), v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (!v17)
      v18 = *(void **)(a1 + 56);
    objc_msgSend(v19, "setPose:", v18);

    objc_msgSend(v19, "stopTransitionAnimation");
    if (*(_QWORD *)(a1 + 64))
      dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 64));

  }
}

- (void)coordinator_performCrossFadeTransitionToStickerConfiguration:(id)a3 duration:(double)a4 options:(unint64_t)a5 avatar:(id)a6 avatarNode:(id)a7 oldReversionContext:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  double v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  id WeakRetained;
  void *v28;
  NSObject *v29;
  id v30;
  AVTStickerConfigurationReversionContext *v31;
  AVTStickerConfigurationReversionContext *stickerTransitionReversionContext;
  id v33;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  id v40;
  double v41;
  _QWORD block[4];
  __int128 v43;
  AVTViewTransitionHelper *v44;
  id v45;

  v13 = a8;
  v14 = a6;
  v15 = a3;
  -[AVTViewTransitionHelper transitionTechnique](self, "transitionTechnique");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    avt_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[AVTViewTransitionHelper view_performCrossFadeTransitionToStickerConfiguration:fallbackPose:duration:avatar:avatarNode:oldReversionContext:completionHandler:simultaneousAnimationsBlock:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);

  }
  LODWORD(v17) = 0;
  objc_msgSend(v16, "setFramebufferTextureOpacity:", v17);
  -[AVTViewTransitionHelper viewBackgroundColor](self, "viewBackgroundColor");
  v37 = v26;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "renderer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_renderingQueue");
  v29 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __143__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke;
  block[3] = &unk_1EA61DD50;
  v44 = self;
  v43 = v37;
  v30 = v16;
  v45 = v30;
  dispatch_sync(v29, block);

  objc_msgSend(v13, "revertChangesWithScope:animationDuration:", 0, 0.0);
  v31 = objc_alloc_init(AVTStickerConfigurationReversionContext);
  stickerTransitionReversionContext = self->_stickerTransitionReversionContext;
  self->_stickerTransitionReversionContext = v31;

  v33 = objc_loadWeakRetained((id *)&self->_view);
  +[AVTStickerGenerator applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:](AVTStickerGenerator, "applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:", v15, v33, 0, a5, v14, self->_stickerTransitionReversionContext, a4, 0);

  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __143__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke_2;
  v38[3] = &unk_1EA61DD78;
  v41 = a4;
  v39 = v34;
  v40 = v30;
  v35 = v30;
  v36 = v34;
  objc_msgSend(v14, "addDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:block:", CFSTR("sticker-transition"), v38);

}

void __143__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "setAvtRendererTechnique:", 0);
    objc_msgSend(*(id *)(a1 + 48), "snapshotViewUsingBackgroundColor:", *(double *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 56), "setSnapshotTexture:", v3);
      objc_msgSend(v4, "setAvtRendererTechnique:", *(_QWORD *)(a1 + 56));
      objc_msgSend(MEMORY[0x1E0CD5A38], "flush");
    }

    WeakRetained = v4;
  }

}

void __143__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke_2(uint64_t a1, double a2, double a3, uint64_t a4, void *a5, _BYTE *a6)
{
  id v10;
  double v11;
  float v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;

  v10 = a5;
  v11 = (a2 - a3) / *(double *)(a1 + 48);
  *(float *)&v11 = v11;
  *(float *)&a3 = fmaxf(fminf(*(float *)&v11, 1.0), 0.0);
  LODWORD(v11) = LODWORD(a3);
  objc_msgSend(*(id *)(a1 + 32), "_solveForInput:", v11);
  *(float *)&v13 = v12 + 0.0;
  objc_msgSend(*(id *)(a1 + 40), "setFramebufferTextureOpacity:", v13);
  if (*(float *)&a3 >= 1.0)
  {
    *a6 = 1;
    if (objc_msgSend(v10, "conformsToProtocol:", &unk_1F03E4CB8))
    {
      v14 = v10;
      objc_msgSend(v14, "avtRendererTechnique");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(a1 + 40);

      if (v15 == v16)
        objc_msgSend(v14, "setAvtRendererTechnique:", 0);

    }
    else
    {
      avt_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __143__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke_2_cold_1();

    }
  }

}

- (void)coordinator_performCrossFadeTransitionOutOfStickerConfigurationWithDuration:(double)a3 avatar:(id)a4 avatarNode:(id)a5 oldReversionContext:(id)a6
{
  id v9;
  id v10;
  void *v11;
  double v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  id WeakRetained;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  id v32;
  double v33;
  _QWORD block[4];
  __int128 v35;
  AVTViewTransitionHelper *v36;
  id v37;

  v9 = a6;
  v10 = a4;
  -[AVTViewTransitionHelper transitionTechnique](self, "transitionTechnique");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    avt_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[AVTViewTransitionHelper view_performCrossFadeTransitionToStickerConfiguration:fallbackPose:duration:avatar:avatarNode:oldReversionContext:completionHandler:simultaneousAnimationsBlock:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

  }
  LODWORD(v12) = 0;
  objc_msgSend(v11, "setFramebufferTextureOpacity:", v12);
  -[AVTViewTransitionHelper viewBackgroundColor](self, "viewBackgroundColor");
  v29 = v21;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "renderer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_renderingQueue");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __141__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionOutOfStickerConfigurationWithDuration_avatar_avatarNode_oldReversionContext___block_invoke;
  block[3] = &unk_1EA61DD50;
  v36 = self;
  v35 = v29;
  v26 = v11;
  v37 = v26;
  dispatch_sync(v24, block);

  objc_msgSend(v9, "revertChangesWithScope:animationDuration:", 0, 0.0);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v30[0] = v25;
  v30[1] = 3221225472;
  v30[2] = __141__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionOutOfStickerConfigurationWithDuration_avatar_avatarNode_oldReversionContext___block_invoke_2;
  v30[3] = &unk_1EA61DD78;
  v33 = a3;
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v32 = v26;
  v27 = v26;
  v28 = v31;
  objc_msgSend(v10, "addDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:block:", CFSTR("sticker-transition"), v30);

}

void __141__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionOutOfStickerConfigurationWithDuration_avatar_avatarNode_oldReversionContext___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "setAvtRendererTechnique:", 0);
    objc_msgSend(*(id *)(a1 + 48), "snapshotViewUsingBackgroundColor:", *(double *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 56), "setSnapshotTexture:", v3);
      objc_msgSend(v4, "setAvtRendererTechnique:", *(_QWORD *)(a1 + 56));
      objc_msgSend(MEMORY[0x1E0CD5A38], "flush");
    }

    WeakRetained = v4;
  }

}

void __141__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionOutOfStickerConfigurationWithDuration_avatar_avatarNode_oldReversionContext___block_invoke_2(uint64_t a1, double a2, double a3, uint64_t a4, void *a5, _BYTE *a6)
{
  id v10;
  double v11;
  float v12;
  double v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;

  v10 = a5;
  v11 = (a2 - a3) / *(double *)(a1 + 48);
  *(float *)&v11 = v11;
  *(float *)&a3 = fmaxf(fminf(*(float *)&v11, 1.0), 0.0);
  LODWORD(v11) = LODWORD(a3);
  objc_msgSend(*(id *)(a1 + 32), "_solveForInput:", v11);
  *(float *)&v13 = v12 + 0.0;
  objc_msgSend(*(id *)(a1 + 40), "setFramebufferTextureOpacity:", v13);
  if (*(float *)&a3 >= 1.0)
  {
    *a6 = 1;
    if (objc_msgSend(v10, "conformsToProtocol:", &unk_1F03E4CB8))
    {
      v14 = v10;
      objc_msgSend(v14, "avtRendererTechnique");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(void **)(a1 + 40);

      if (v15 == v16)
        objc_msgSend(v14, "setAvtRendererTechnique:", 0);

    }
    else
    {
      avt_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __143__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke_2_cold_1();

    }
  }

}

- (void)view_performCrossFadeThenAnimateTransitionToStickerConfiguration:(id)a3 fallbackPose:(id)a4 duration:(double)a5 avatar:(id)a6 avatarNode:(id)a7 oldReversionContext:(id)a8 completionHandler:(id)a9 simultaneousAnimationsBlock:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  double v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  id WeakRetained;
  void *v35;
  NSObject *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  __int128 v42;
  void *v43;
  id v44;
  id v45;
  _QWORD block[4];
  __int128 v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56[2];
  int v57;
  id to;
  id location[2];

  v44 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  objc_initWeak(location, self);
  objc_copyWeak(&to, (id *)&self->_view);
  -[AVTViewTransitionHelper transitionTechnique](self, "transitionTechnique");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    avt_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[AVTViewTransitionHelper view_performCrossFadeTransitionToStickerConfiguration:fallbackPose:duration:avatar:avatarNode:oldReversionContext:completionHandler:simultaneousAnimationsBlock:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);

  }
  LODWORD(v24) = 0;
  objc_msgSend(v23, "setFramebufferTextureOpacity:", v24);
  v43 = v19;
  -[AVTViewTransitionHelper viewBackgroundColor](self, "viewBackgroundColor");
  v42 = v33;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "renderer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "_renderingQueue");
  v36 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __198__AVTViewTransitionHelper_view_performCrossFadeThenAnimateTransitionToStickerConfiguration_fallbackPose_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke;
  block[3] = &unk_1EA61DDF0;
  objc_copyWeak(&v55, location);
  objc_copyWeak(v56, &to);
  v47 = v42;
  v48 = v23;
  v49 = v20;
  v56[1] = *(id *)&a5;
  v57 = 0;
  v50 = v18;
  v51 = v44;
  v52 = v17;
  v53 = v22;
  v54 = v21;
  *(_QWORD *)&v42 = v21;
  v41 = v17;
  v45 = v44;
  v37 = v18;
  v38 = v22;
  v39 = v20;
  v40 = v23;
  dispatch_async(v36, block);

  objc_destroyWeak(v56);
  objc_destroyWeak(&v55);
  objc_destroyWeak(&to);
  objc_destroyWeak(location);

}

void __198__AVTViewTransitionHelper_view_performCrossFadeThenAnimateTransitionToStickerConfiguration_fallbackPose_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16[2];
  int v17;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  v3 = objc_loadWeakRetained((id *)(a1 + 112));
  v4 = v3;
  if (WeakRetained && v3)
  {
    objc_msgSend(v3, "setAvtRendererTechnique:", 0);
    objc_msgSend(WeakRetained, "snapshotViewUsingBackgroundColor:", *(double *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 48), "setSnapshotTexture:", v5);
      objc_msgSend(v4, "setAvtRendererTechnique:", *(_QWORD *)(a1 + 48));
    }
    objc_msgSend(*(id *)(a1 + 56), "revertChangesWithScope:animationDuration:", 1, 0.0);
    objc_msgSend(MEMORY[0x1E0CD5A38], "flush");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __198__AVTViewTransitionHelper_view_performCrossFadeThenAnimateTransitionToStickerConfiguration_fallbackPose_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke_2;
    v6[3] = &unk_1EA61DDC8;
    v14 = *(id *)(a1 + 88);
    v7 = *(id *)(a1 + 64);
    v16[1] = *(id *)(a1 + 120);
    v17 = *(_DWORD *)(a1 + 128);
    v8 = *(id *)(a1 + 48);
    v9 = *(id *)(a1 + 72);
    v10 = WeakRetained;
    v11 = v4;
    v12 = *(id *)(a1 + 80);
    v13 = *(id *)(a1 + 56);
    objc_copyWeak(v16, (id *)(a1 + 112));
    v15 = *(id *)(a1 + 96);
    dispatch_async(MEMORY[0x1E0C80D38], v6);

    objc_destroyWeak(v16);
  }

}

void __198__AVTViewTransitionHelper_view_performCrossFadeThenAnimateTransitionToStickerConfiguration_fallbackPose_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD *v18;
  id v19[2];
  int v20;
  _QWORD v21[3];
  char v22;

  v2 = *(_QWORD *)(a1 + 88);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __198__AVTViewTransitionHelper_view_performCrossFadeThenAnimateTransitionToStickerConfiguration_fallbackPose_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke_3;
  v9[3] = &unk_1EA61DDA0;
  v19[1] = *(id *)(a1 + 112);
  v5 = v3;
  v10 = v5;
  v20 = *(_DWORD *)(a1 + 120);
  v11 = *(id *)(a1 + 40);
  v18 = v21;
  v6 = *(id *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(void **)(a1 + 64);
  v12 = v6;
  v13 = v7;
  v14 = v8;
  v15 = *(id *)(a1 + 72);
  v16 = *(id *)(a1 + 80);
  objc_copyWeak(v19, (id *)(a1 + 104));
  v17 = *(id *)(a1 + 96);
  objc_msgSend(v4, "addDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:block:", CFSTR("sticker-transition"), v9);

  objc_destroyWeak(v19);
  _Block_object_dispose(v21, 8);
}

void __198__AVTViewTransitionHelper_view_performCrossFadeThenAnimateTransitionToStickerConfiguration_fallbackPose_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke_3(uint64_t a1, void *a2, double a3, double a4, uint64_t a5, _BYTE *a6)
{
  double v10;
  float v11;
  float v12;
  double v13;
  uint64_t v14;
  float v15;
  AVTStickerConfigurationReversionContext *v16;
  uint64_t v17;
  void *v18;
  AVTStickerConfigurationReversionContext *v19;
  double v20;
  id WeakRetained;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a2;
  v10 = (a3 - a4) / *(double *)(a1 + 112);
  *(float *)&v10 = v10;
  v11 = fmaxf(fminf(*(float *)&v10, 1.0), 0.0);
  *(float *)&v10 = v11;
  objc_msgSend(*(id *)(a1 + 32), "_solveForInput:", v10);
  *(float *)&v13 = *(float *)(a1 + 120)
                 + (float)(fminf(fmaxf(v12 / 0.75, 0.0), 1.0) * (float)(1.0 - *(float *)(a1 + 120)));
  objc_msgSend(*(id *)(a1 + 40), "setFramebufferTextureOpacity:", v13);
  if (v11 >= 0.25)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    if (!*(_BYTE *)(v14 + 24))
    {
      *(_BYTE *)(v14 + 24) = 1;
      v15 = *(double *)(a1 + 112) * 0.75;
      if (*(_QWORD *)(a1 + 48))
      {
        v16 = objc_alloc_init(AVTStickerConfigurationReversionContext);
        v17 = *(_QWORD *)(a1 + 56);
        v18 = *(void **)(v17 + 24);
        *(_QWORD *)(v17 + 24) = v16;
        v19 = v16;

        v20 = v15;
        +[AVTStickerGenerator applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:](AVTStickerGenerator, "applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), 0, 0, v28, v19, v20, 0);

      }
      else
      {
        v20 = v15;
        objc_msgSend(v28, "transitionFromPose:toPose:duration:delay:completionHandler:", 0, *(_QWORD *)(a1 + 72), 0, v20, 0.0);
      }
      objc_msgSend(*(id *)(a1 + 80), "revertChangesWithScope:animationDuration:", 0, v20);
    }
  }
  if (v11 >= 1.0)
  {
    *a6 = 1;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    v22 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "avtRendererTechnique");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(void **)(a1 + 40);

      if (v23 == v24)
        objc_msgSend(v22, "setAvtRendererTechnique:", 0);
    }
    v25 = *(void **)(a1 + 48);
    if (v25)
    {
      objc_msgSend(v25, "physicalizedPose");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "pose");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setPose:", v27);

    }
    else
    {
      objc_msgSend(v28, "setPose:", *(_QWORD *)(a1 + 72));
    }
    objc_msgSend(v28, "stopTransitionAnimation");
    if (*(_QWORD *)(a1 + 88))
      dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 88));

  }
}

- (void)coordinator_performCrossFadeThenAnimateTransitionToStickerConfiguration:(id)a3 duration:(double)a4 options:(unint64_t)a5 avatar:(id)a6 avatarNode:(id)a7 oldReversionContext:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  double v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  id WeakRetained;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  id v31;
  dispatch_semaphore_t v32;
  id v33;
  id v34;
  NSObject *v35;
  float v36;
  dispatch_time_t v37;
  AVTStickerConfigurationReversionContext *v38;
  float v39;
  AVTStickerConfigurationReversionContext *stickerTransitionReversionContext;
  id v41;
  double v42;
  id v43;
  __int128 v45;
  _QWORD v46[4];
  id v47;
  id v48;
  NSObject *v49;
  _QWORD *v50;
  double v51;
  _QWORD v52[3];
  char v53;
  _QWORD block[4];
  __int128 v55;
  AVTViewTransitionHelper *v56;
  id v57;

  v13 = a3;
  v14 = a6;
  v43 = a7;
  v15 = a8;
  -[AVTViewTransitionHelper transitionTechnique](self, "transitionTechnique");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    avt_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[AVTViewTransitionHelper view_performCrossFadeTransitionToStickerConfiguration:fallbackPose:duration:avatar:avatarNode:oldReversionContext:completionHandler:simultaneousAnimationsBlock:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);

  }
  LODWORD(v17) = 0;
  objc_msgSend(v16, "setFramebufferTextureOpacity:", v17);
  -[AVTViewTransitionHelper viewBackgroundColor](self, "viewBackgroundColor");
  v45 = v26;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "renderer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "_renderingQueue");
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __154__AVTViewTransitionHelper_coordinator_performCrossFadeThenAnimateTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke;
  block[3] = &unk_1EA61DD50;
  v56 = self;
  v55 = v45;
  v31 = v16;
  v57 = v31;
  dispatch_sync(v29, block);

  objc_msgSend(v15, "revertChangesWithScope:animationDuration:", 1, 0.0);
  v32 = dispatch_semaphore_create(0);
  v52[0] = 0;
  v52[1] = v52;
  v52[2] = 0x2020000000;
  v53 = 0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v46[0] = v30;
  v46[1] = 3221225472;
  v46[2] = __154__AVTViewTransitionHelper_coordinator_performCrossFadeThenAnimateTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke_2;
  v46[3] = &unk_1EA61DE18;
  v51 = a4;
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v47 = v33;
  v34 = v31;
  v48 = v34;
  v50 = v52;
  v35 = v32;
  v49 = v35;
  objc_msgSend(v14, "addDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:block:", CFSTR("sticker-transition"), v46);
  v36 = fmin(a4 * 10.0, 2.0);
  v37 = dispatch_time(0, (uint64_t)(float)(v36 * 1000000000.0));
  dispatch_semaphore_wait(v35, v37);
  v38 = objc_alloc_init(AVTStickerConfigurationReversionContext);
  stickerTransitionReversionContext = self->_stickerTransitionReversionContext;
  self->_stickerTransitionReversionContext = v38;

  v41 = objc_loadWeakRetained((id *)&self->_view);
  v39 = a4 * 0.75;
  v42 = v39;
  +[AVTStickerGenerator applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:](AVTStickerGenerator, "applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:", v13, v41, 0, a5, v14, self->_stickerTransitionReversionContext, v42, 0);

  objc_msgSend(v15, "revertChangesWithScope:animationDuration:", 0, v42);
  _Block_object_dispose(v52, 8);

}

void __154__AVTViewTransitionHelper_coordinator_performCrossFadeThenAnimateTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "setAvtRendererTechnique:", 0);
    objc_msgSend(*(id *)(a1 + 48), "snapshotViewUsingBackgroundColor:", *(double *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 56), "setSnapshotTexture:", v3);
      objc_msgSend(v4, "setAvtRendererTechnique:", *(_QWORD *)(a1 + 56));
      objc_msgSend(MEMORY[0x1E0CD5A38], "flush");
    }

    WeakRetained = v4;
  }

}

void __154__AVTViewTransitionHelper_coordinator_performCrossFadeThenAnimateTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke_2(uint64_t a1, double a2, double a3, uint64_t a4, void *a5, _BYTE *a6)
{
  id v10;
  double v11;
  float v12;
  float v13;
  double v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;

  v10 = a5;
  v11 = (a2 - a3) / *(double *)(a1 + 64);
  *(float *)&v11 = v11;
  v12 = fmaxf(fminf(*(float *)&v11, 1.0), 0.0);
  *(float *)&v11 = v12;
  objc_msgSend(*(id *)(a1 + 32), "_solveForInput:", v11);
  *(float *)&v14 = fminf(fmaxf(v13 / 0.75, 0.0), 1.0) + 0.0;
  objc_msgSend(*(id *)(a1 + 40), "setFramebufferTextureOpacity:", v14);
  if (v12 >= 0.25)
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (!*(_BYTE *)(v15 + 24))
    {
      *(_BYTE *)(v15 + 24) = 1;
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
    }
  }
  if (v12 >= 1.0)
  {
    *a6 = 1;
    if (objc_msgSend(v10, "conformsToProtocol:", &unk_1F03E4CB8))
    {
      v16 = v10;
      objc_msgSend(v16, "avtRendererTechnique");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(void **)(a1 + 40);

      if (v17 == v18)
        objc_msgSend(v16, "setAvtRendererTechnique:", 0);

    }
    else
    {
      avt_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __143__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke_2_cold_1();

    }
  }

}

- (void)coordinator_performCrossFadeThenAnimateTransitionOutOfStickerConfigurationWithDuration:(double)a3 avatar:(id)a4 avatarNode:(id)a5 oldReversionContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  id WeakRetained;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  dispatch_semaphore_t v29;
  id v30;
  id v31;
  NSObject *v32;
  float v33;
  dispatch_time_t v34;
  float v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  id v39;
  NSObject *v40;
  _QWORD *v41;
  double v42;
  _QWORD v43[3];
  char v44;
  _QWORD block[4];
  __int128 v46;
  AVTViewTransitionHelper *v47;
  id v48;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[AVTViewTransitionHelper transitionTechnique](self, "transitionTechnique");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    avt_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[AVTViewTransitionHelper view_performCrossFadeTransitionToStickerConfiguration:fallbackPose:duration:avatar:avatarNode:oldReversionContext:completionHandler:simultaneousAnimationsBlock:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

  }
  LODWORD(v14) = 0;
  objc_msgSend(v13, "setFramebufferTextureOpacity:", v14);
  -[AVTViewTransitionHelper viewBackgroundColor](self, "viewBackgroundColor");
  v36 = v23;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "renderer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "_renderingQueue");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __152__AVTViewTransitionHelper_coordinator_performCrossFadeThenAnimateTransitionOutOfStickerConfigurationWithDuration_avatar_avatarNode_oldReversionContext___block_invoke;
  block[3] = &unk_1EA61DD50;
  v47 = self;
  v46 = v36;
  v28 = v13;
  v48 = v28;
  dispatch_sync(v26, block);

  objc_msgSend(v12, "revertChangesWithScope:animationDuration:", 1, 0.0);
  v29 = dispatch_semaphore_create(0);
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  v44 = 0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v37[0] = v27;
  v37[1] = 3221225472;
  v37[2] = __152__AVTViewTransitionHelper_coordinator_performCrossFadeThenAnimateTransitionOutOfStickerConfigurationWithDuration_avatar_avatarNode_oldReversionContext___block_invoke_2;
  v37[3] = &unk_1EA61DE18;
  v42 = a3;
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v38 = v30;
  v31 = v28;
  v39 = v31;
  v41 = v43;
  v32 = v29;
  v40 = v32;
  objc_msgSend(v10, "addDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:block:", CFSTR("sticker-transition"), v37);
  v33 = fmin(a3 * 10.0, 2.0);
  v34 = dispatch_time(0, (uint64_t)(float)(v33 * 1000000000.0));
  dispatch_semaphore_wait(v32, v34);
  v35 = a3 * 0.75;
  objc_msgSend(v12, "revertChangesWithScope:animationDuration:", 0, v35);

  _Block_object_dispose(v43, 8);
}

void __152__AVTViewTransitionHelper_coordinator_performCrossFadeThenAnimateTransitionOutOfStickerConfigurationWithDuration_avatar_avatarNode_oldReversionContext___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 8));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "setAvtRendererTechnique:", 0);
    objc_msgSend(*(id *)(a1 + 48), "snapshotViewUsingBackgroundColor:", *(double *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 56), "setSnapshotTexture:", v3);
      objc_msgSend(v4, "setAvtRendererTechnique:", *(_QWORD *)(a1 + 56));
      objc_msgSend(MEMORY[0x1E0CD5A38], "flush");
    }

    WeakRetained = v4;
  }

}

void __152__AVTViewTransitionHelper_coordinator_performCrossFadeThenAnimateTransitionOutOfStickerConfigurationWithDuration_avatar_avatarNode_oldReversionContext___block_invoke_2(uint64_t a1, double a2, double a3, uint64_t a4, void *a5, _BYTE *a6)
{
  id v10;
  double v11;
  float v12;
  float v13;
  double v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *v19;

  v10 = a5;
  v11 = (a2 - a3) / *(double *)(a1 + 64);
  *(float *)&v11 = v11;
  v12 = fmaxf(fminf(*(float *)&v11, 1.0), 0.0);
  *(float *)&v11 = v12;
  objc_msgSend(*(id *)(a1 + 32), "_solveForInput:", v11);
  *(float *)&v14 = fminf(fmaxf(v13 / 0.75, 0.0), 1.0) + 0.0;
  objc_msgSend(*(id *)(a1 + 40), "setFramebufferTextureOpacity:", v14);
  if (v12 >= 0.25)
  {
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (!*(_BYTE *)(v15 + 24))
    {
      *(_BYTE *)(v15 + 24) = 1;
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
    }
  }
  if (v12 >= 1.0)
  {
    *a6 = 1;
    if (objc_msgSend(v10, "conformsToProtocol:", &unk_1F03E4CB8))
    {
      v16 = v10;
      objc_msgSend(v16, "avtRendererTechnique");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(void **)(a1 + 40);

      if (v17 == v18)
        objc_msgSend(v16, "setAvtRendererTechnique:", 0);

    }
    else
    {
      avt_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __143__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke_2_cold_1();

    }
  }

}

- (void)view_performAnimateThenCrossFadeTransitionFromStickerConfiguration:(id)a3 toStickerConfiguration:(id)a4 duration:(double)a5 avatar:(id)a6 avatarNode:(id)a7 oldReversionContext:(id)a8 completionHandler:(id)a9 simultaneousAnimationsBlock:(id)a10
{
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  AVTView **p_view;
  id WeakRetained;
  void *v32;
  NSObject *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  id v41;
  id v42;
  id v43;
  id v44;
  _QWORD block[4];
  __int128 v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55[3];
  id to;
  id location[2];

  v41 = a3;
  v43 = a4;
  v17 = a6;
  v44 = a7;
  v42 = a8;
  v18 = a9;
  v19 = a10;
  -[AVTViewTransitionHelper transitionTechnique](self, "transitionTechnique");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    avt_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[AVTViewTransitionHelper view_performCrossFadeTransitionToStickerConfiguration:fallbackPose:duration:avatar:avatarNode:oldReversionContext:completionHandler:simultaneousAnimationsBlock:].cold.1(v21, v22, v23, v24, v25, v26, v27, v28);

  }
  -[AVTViewTransitionHelper viewBackgroundColor](self, "viewBackgroundColor");
  v40 = v29;
  objc_initWeak(location, self);
  p_view = &self->_view;
  objc_copyWeak(&to, (id *)p_view);
  WeakRetained = objc_loadWeakRetained((id *)p_view);
  objc_msgSend(WeakRetained, "renderer");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "_renderingQueue");
  v33 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __210__AVTViewTransitionHelper_view_performAnimateThenCrossFadeTransitionFromStickerConfiguration_toStickerConfiguration_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke;
  block[3] = &unk_1EA61DE90;
  objc_copyWeak(&v54, location);
  objc_copyWeak(v55, &to);
  v47 = v17;
  v48 = v42;
  v46 = v40;
  v49 = v43;
  v50 = v20;
  v55[1] = *(id *)&a5;
  v51 = v41;
  v52 = v19;
  v53 = v18;
  *(_QWORD *)&v40 = v18;
  v39 = v19;
  v34 = v41;
  v35 = v20;
  v36 = v43;
  v37 = v42;
  v38 = v17;
  dispatch_async(v33, block);

  objc_destroyWeak(v55);
  objc_destroyWeak(&v54);
  objc_destroyWeak(&to);
  objc_destroyWeak(location);

}

void __210__AVTViewTransitionHelper_view_performAnimateThenCrossFadeTransitionFromStickerConfiguration_toStickerConfiguration_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id v4;
  void *v5;
  AVTStickerConfigurationReversionContext *v6;
  void *v7;
  AVTStickerConfigurationReversionContext *v8;
  _QWORD block[4];
  AVTStickerConfigurationReversionContext *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17[2];

  v2 = (id *)(a1 + 104);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 104));
  v4 = objc_loadWeakRetained((id *)(a1 + 112));
  v5 = v4;
  if (WeakRetained && v4)
  {
    objc_msgSend(*(id *)(a1 + 48), "stopTransitionAnimation");
    objc_msgSend(*(id *)(a1 + 56), "revertChangesWithScope:animationDuration:", 0, 0.0);
    v6 = objc_alloc_init(AVTStickerConfigurationReversionContext);
    objc_storeStrong(WeakRetained + 3, v6);
    +[AVTStickerGenerator applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:](AVTStickerGenerator, "applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:", *(_QWORD *)(a1 + 64), v5, 0, 0, *(_QWORD *)(a1 + 48), v6, 0.0, 0);
    objc_msgSend(v5, "setAvtRendererTechnique:", 0);
    objc_msgSend(MEMORY[0x1E0CD5A38], "flush");
    objc_msgSend(WeakRetained, "snapshotViewUsingBackgroundColor:", *(double *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(*(id *)(a1 + 72), "setSnapshotTexture:", v7);
    -[AVTStickerConfigurationReversionContext revertChangesWithScope:animationDuration:](v6, "revertChangesWithScope:animationDuration:", 0, 0.0);
    +[AVTStickerGenerator applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:](AVTStickerGenerator, "applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:", *(_QWORD *)(a1 + 80), v5, 0, 0, *(_QWORD *)(a1 + 48), v6, 0.0, 0);
    objc_msgSend(MEMORY[0x1E0CD5A38], "flush");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __210__AVTViewTransitionHelper_view_performAnimateThenCrossFadeTransitionFromStickerConfiguration_toStickerConfiguration_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke_2;
    block[3] = &unk_1EA61DE68;
    objc_copyWeak(&v16, v2);
    objc_copyWeak(v17, (id *)(a1 + 112));
    v17[1] = *(id *)(a1 + 120);
    v10 = v6;
    v11 = *(id *)(a1 + 64);
    v12 = *(id *)(a1 + 48);
    v14 = *(id *)(a1 + 88);
    v13 = *(id *)(a1 + 72);
    v15 = *(id *)(a1 + 96);
    v8 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(v17);
    objc_destroyWeak(&v16);

  }
}

void __210__AVTViewTransitionHelper_view_performAnimateThenCrossFadeTransitionFromStickerConfiguration_toStickerConfiguration_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  float v5;
  uint64_t v6;
  double v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17[2];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  v3 = objc_loadWeakRetained((id *)(a1 + 88));
  v4 = v3;
  if (WeakRetained && v3)
  {
    v5 = *(double *)(a1 + 96) * 0.75;
    objc_msgSend(*(id *)(a1 + 32), "revertChangesWithScope:animationDuration:", 0, 0.0);
    +[AVTStickerGenerator applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:](AVTStickerGenerator, "applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:", *(_QWORD *)(a1 + 40), v4, 1, 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), v5, 0);
    v6 = *(_QWORD *)(a1 + 64);
    if (v6)
      (*(void (**)(void))(v6 + 16))();
    objc_msgSend(v4, "setAvtRendererTechnique:", *(_QWORD *)(a1 + 56));
    LODWORD(v7) = 0;
    objc_msgSend(*(id *)(a1 + 56), "setFramebufferTextureOpacity:", v7);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 48);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __210__AVTViewTransitionHelper_view_performAnimateThenCrossFadeTransitionFromStickerConfiguration_toStickerConfiguration_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke_3;
    v11[3] = &unk_1EA61DE40;
    v17[1] = *(id *)(a1 + 96);
    v10 = v8;
    v12 = v10;
    v13 = *(id *)(a1 + 56);
    objc_copyWeak(v17, (id *)(a1 + 88));
    v14 = *(id *)(a1 + 40);
    v15 = *(id *)(a1 + 32);
    v16 = *(id *)(a1 + 72);
    objc_msgSend(v9, "addDidUpdateAfterAnimationsEvaluatedAtTimeCallbackForKey:block:", CFSTR("sticker-transition"), v11);

    objc_destroyWeak(v17);
  }

}

void __210__AVTViewTransitionHelper_view_performAnimateThenCrossFadeTransitionFromStickerConfiguration_toStickerConfiguration_duration_avatar_avatarNode_oldReversionContext_completionHandler_simultaneousAnimationsBlock___block_invoke_3(uint64_t a1, void *a2, double a3, double a4, uint64_t a5, _BYTE *a6)
{
  double v10;
  float v11;
  double v12;
  id WeakRetained;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v10 = (a3 - a4) / *(double *)(a1 + 80);
  *(float *)&v10 = v10;
  *(float *)&a4 = fmaxf(fminf(*(float *)&v10, 1.0), 0.0);
  LODWORD(v10) = LODWORD(a4);
  objc_msgSend(*(id *)(a1 + 32), "_solveForInput:", v10);
  *(float *)&v12 = 1.0 - fminf(fmaxf((float)(v11 + -0.25) / 0.75, 0.0), 1.0);
  objc_msgSend(*(id *)(a1 + 40), "setFramebufferTextureOpacity:", v12);
  if (*(float *)&a4 >= 1.0)
  {
    *a6 = 1;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    +[AVTStickerGenerator applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:](AVTStickerGenerator, "applyViewTransitionConfiguration:toView:scope:options:duration:avatar:context:completionHandler:", *(_QWORD *)(a1 + 48), WeakRetained, 2, 0, v16, *(_QWORD *)(a1 + 56), 0.0, 0);
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "avtRendererTechnique");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(a1 + 40);

      if (v14 == v15)
        objc_msgSend(WeakRetained, "setAvtRendererTechnique:", 0);
    }
    if (*(_QWORD *)(a1 + 64))
      dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 64));

  }
}

- (id)transitionTechnique
{
  AVTRendererViewTransitionTechnique *transitionTechnique;
  AVTRendererViewTransitionTechnique *v4;
  id WeakRetained;
  AVTRendererViewTransitionTechnique *v6;
  AVTRendererViewTransitionTechnique *v7;

  transitionTechnique = self->_transitionTechnique;
  if (!transitionTechnique)
  {
    v4 = [AVTRendererViewTransitionTechnique alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_view);
    v6 = -[AVTRendererViewTransitionTechnique initWithSceneRenderer:](v4, "initWithSceneRenderer:", WeakRetained);
    v7 = self->_transitionTechnique;
    self->_transitionTechnique = v6;

    transitionTechnique = self->_transitionTechnique;
  }
  return transitionTechnique;
}

- (__n128)viewBackgroundColor
{
  id WeakRetained;
  void *v3;
  float32x4_t v4;
  float32x4_t v6;
  _QWORD v7[6];
  uint64_t v8;
  float32x4_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = (float32x4_t *)&v8;
  v10 = 0x3020000000;
  v11 = 0;
  v12 = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  objc_msgSend(WeakRetained, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__AVTViewTransitionHelper_viewBackgroundColor__block_invoke;
  v7[3] = &unk_1EA61DEB8;
  v7[4] = a1;
  v7[5] = &v8;
  objc_msgSend(v3, "performAsCurrentTraitCollection:", v7);

  v4 = vmulq_laneq_f32(v9[2], v9[2], 3);
  v4.i32[3] = HIDWORD(*(_OWORD *)&v9[2]);
  v6 = v4;
  v9[2] = v4;
  _Block_object_dispose(&v8, 8);
  return (__n128)v6;
}

void __46__AVTViewTransitionHelper_viewBackgroundColor__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  CGColor *v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "renderer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backgroundColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (CGColor *)objc_msgSend(v4, "CGColor");

  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = AVTColor4WithCGColor(v5);
}

- (id)snapshotViewUsingBackgroundColor:(AVTViewTransitionHelper *)self
{
  __int128 v2;
  AVTView **p_view;
  id WeakRetained;
  void *v5;
  void *v6;
  double v7;
  double v8;
  unint64_t v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  float v49[6];
  unint64_t v50;

  *(_OWORD *)v49 = v2;
  p_view = &self->_view;
  WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  objc_msgSend(WeakRetained, "renderer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_backingSize");
  v9 = (unint64_t)v8;
  if ((unint64_t)v7)
    v10 = v9 == 0;
  else
    v10 = 1;
  if (v10)
  {
    v11 = 0;
  }
  else
  {
    v50 = (unint64_t)v7;
    objc_msgSend(MEMORY[0x1E0CC6BB8], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 71);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 2;
    objc_msgSend(v12, "setStorageMode:", 2);
    objc_msgSend(v12, "setUsage:", 5);
    v14 = objc_msgSend(v6, "newTextureWithDescriptor:", v12);
    v15 = AVTMTLDeviceSupportsMemorylessStorage(v6);
    v16 = objc_loadWeakRetained((id *)p_view);
    v17 = objc_msgSend(v16, "antialiasingMode");
    v18 = v17 - 1;
    v19 = 1;
    if (v17 == 1)
      v19 = 2;
    if (v17 == 2)
      v20 = 4;
    else
      v20 = v19;

    if (v15)
      v21 = 3;
    else
      v21 = 2;
    v48 = (void *)v14;
    if (v18 > 1)
    {
      v23 = 0;
      v47 = 0;
      v22 = v14;
      objc_msgSend(MEMORY[0x1E0CC6BB8], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 252, v50, v9, 0, 1);
    }
    else
    {
      objc_msgSend(v12, "setStorageMode:", v21);
      v13 = 4;
      objc_msgSend(v12, "setUsage:", 4);
      objc_msgSend(v12, "setTextureType:", 4);
      objc_msgSend(v12, "setSampleCount:", v20);
      v22 = objc_msgSend(v6, "newTextureWithDescriptor:", v12);
      v23 = v14;
      v47 = (void *)v22;
      objc_msgSend(MEMORY[0x1E0CC6BB8], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 252, v50, v9, 0, 2);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setStorageMode:", v21);
    objc_msgSend(v24, "setUsage:", 4);
    objc_msgSend(v24, "setTextureType:", v13);
    objc_msgSend(v24, "setSampleCount:", v20);
    v46 = v6;
    v25 = (void *)objc_msgSend(v6, "newTextureWithDescriptor:", v24);
    objc_msgSend(MEMORY[0x1E0CC6B58], "renderPassDescriptor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "colorAttachments");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectAtIndexedSubscript:", 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTexture:", v22);

    objc_msgSend(v26, "colorAttachments");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setResolveTexture:", v23);

    objc_msgSend(v26, "colorAttachments");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setLoadAction:", 2);

    objc_msgSend(v26, "colorAttachments");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectAtIndexedSubscript:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setClearColor:", v49[0], v49[1], v49[2], v49[3]);

    objc_msgSend(v26, "colorAttachments");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectAtIndexedSubscript:", 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setStoreAction:", v45);

    objc_msgSend(v26, "depthAttachment");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setTexture:", v25);

    if (objc_msgSend(v5, "usesReverseZ"))
      v38 = 1.0;
    else
      v38 = 0.0;
    objc_msgSend(v26, "depthAttachment");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setClearDepth:", v38);

    objc_msgSend(v26, "depthAttachment");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setLoadAction:", 2);

    objc_msgSend(v26, "depthAttachment");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setStoreAction:", 0);

    objc_msgSend(v5, "commandQueue");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "commandBuffer");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "updateAtTime:", CACurrentMediaTime());
    objc_msgSend(v5, "renderWithViewport:commandBuffer:passDescriptor:", v43, v26, 0.0, 0.0, (double)v50, (double)v9);
    objc_msgSend(v43, "commit");

    v6 = v46;
    v11 = v48;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionTechnique, 0);
  objc_storeStrong((id *)&self->_stickerTransitionReversionContext, 0);
  objc_storeStrong((id *)&self->_stickerConfiguration, 0);
  objc_destroyWeak((id *)&self->_view);
}

- (void)transitionViewToStickerConfiguration:(uint64_t)a3 fallbackPose:(uint64_t)a4 duration:(uint64_t)a5 style:(uint64_t)a6 avatar:(uint64_t)a7 completionHandler:(uint64_t)a8 simultaneousAnimationsBlock:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1DD1FA000, a1, a3, "Error: Unreachable code: Failed to start an adequate view transition", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)transitionViewToStickerConfiguration:(uint64_t)a3 fallbackPose:(uint64_t)a4 duration:(uint64_t)a5 style:(uint64_t)a6 avatar:(uint64_t)a7 completionHandler:(uint64_t)a8 simultaneousAnimationsBlock:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. Failed to resolve the view transition style", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)transitionCoordinatorToStickerConfiguration:(uint64_t)a3 duration:(uint64_t)a4 style:(uint64_t)a5 options:(uint64_t)a6 avatar:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, a1, a3, "Error: Condition '%s' failed. Coordinators are not expected to transition from a previous sticker configuration", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)view_performCrossFadeTransitionToStickerConfiguration:(NSObject *)a1 fallbackPose:(uint64_t)a2 duration:(uint64_t)a3 avatar:(uint64_t)a4 avatarNode:(uint64_t)a5 oldReversionContext:(uint64_t)a6 completionHandler:(uint64_t)a7 simultaneousAnimationsBlock:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0();
}

void __143__AVTViewTransitionHelper_coordinator_performCrossFadeTransitionToStickerConfiguration_duration_options_avatar_avatarNode_oldReversionContext___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_1DD1FA000, v0, v1, "Error: %@ does not conform to AVTRendererTechniqueSupport", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
