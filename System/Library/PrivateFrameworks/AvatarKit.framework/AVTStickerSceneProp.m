@implementation AVTStickerSceneProp

- (AVTStickerSceneProp)initWithRootNode:(id)a3 scale:(BOOL)a4 position:(id)a5 rotation:(id)a6 renderLast:(id)a7 palettesDescriptions:modifiers:adjustments:
{
  double v7;
  double v8;
  double v9;
  _BOOL8 v13;
  id v16;
  AVTStickerSceneProp *v17;
  AVTStickerSceneProp *v18;
  double v20;
  double v21;
  double v22;
  objc_super v23;

  v13 = a4;
  v21 = v8;
  v22 = v9;
  v20 = v7;
  v16 = a3;
  v23.receiver = self;
  v23.super_class = (Class)AVTStickerSceneProp;
  v17 = -[AVTStickerProp initWithSize:scale:position:renderLast:orientToCamera:rotation:palettesDescriptions:shaderModifiers:adjustments:](&v23, sel_initWithSize_scale_position_renderLast_orientToCamera_rotation_palettesDescriptions_shaderModifiers_adjustments_, v13, 0, a5, a6, a7, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), v20, v21, v22);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_rootNode, a3);
    objc_msgSend(v16, "avt_enableSubdivisionOnHierarchyWithQuality:animoji:", 1, 0);
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVTStickerSceneProp *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  AVTStickerSceneProp *v13;
  double v15;
  double v16;
  double v17;

  v4 = [AVTStickerSceneProp alloc];
  -[AVTStickerSceneProp rootNode](self, "rootNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerProp scale](self, "scale");
  v17 = v6;
  -[AVTStickerProp position](self, "position");
  v16 = v7;
  -[AVTStickerProp rotation](self, "rotation");
  v15 = v8;
  v9 = -[AVTStickerProp renderLast](self, "renderLast");
  -[AVTStickerProp palettesDescriptions](self, "palettesDescriptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerProp shaderModifiers](self, "shaderModifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerProp adjustments](self, "adjustments");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[AVTStickerSceneProp initWithRootNode:scale:position:rotation:renderLast:palettesDescriptions:modifiers:adjustments:](v4, "initWithRootNode:scale:position:rotation:renderLast:palettesDescriptions:modifiers:adjustments:", v5, v9, v10, v11, v12, v17, v16, v15);

  return v13;
}

- (void)buildNodeForAvatar:(id)a3 withCamera:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  float32x4_t v36;
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
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  -[AVTStickerProp node](self, "node");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    -[AVTStickerSceneProp rootNode](self, "rootNode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerProp setNode:](self, "setNode:", v15);

  }
  -[AVTStickerProp node](self, "node");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  AVTCloneNodesAndMaterials(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTStickerProp position](self, "position");
  objc_msgSend(v17, "setSimdPosition:");
  -[AVTStickerProp rotation](self, "rotation");
  objc_msgSend(v17, "setSimdEulerAngles:");
  -[AVTStickerProp scale](self, "scale");
  objc_msgSend(v17, "setSimdScale:");
  -[AVTStickerProp opacity](self, "opacity");
  objc_msgSend(v17, "setOpacity:");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = v11;
    v18 = v10;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    -[AVTStickerProp adjustments](self, "adjustments");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v42;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v42 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v23++), "applyAdjustmentIfNeededToNode:forMemoji:ignoreScaleZ:", v17, v18, 0, v35);
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v21);
    }

    objc_msgSend(v18, "updateMorphVariantsInStickerPropNodeHierarchy:", v17);
    v11 = v35;
  }
  objc_msgSend(v10, "neckNode", v35);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "simdWorldPosition");
  v36 = v25;
  objc_msgSend(v11, "simdWorldPosition");
  v27 = vsubq_f32(v36, v26);
  v28 = vmulq_f32(v27, v27);
  -[AVTStickerProp applyCamera:toNode:distToHead:](self, "applyCamera:toNode:distToHead:", v11, v17, sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v28, 2), vaddq_f32(v28, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v28.f32, 1))).f32[0]));

  -[AVTStickerProp palettesDescriptions](self, "palettesDescriptions");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTStickerProp applyPalettesForAvatar:toNode:palettesDescriptions:](AVTStickerProp, "applyPalettesForAvatar:toNode:palettesDescriptions:", v10, v17, v29);

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  -[AVTStickerProp shaderModifiers](self, "shaderModifiers");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v38;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v38 != v33)
          objc_enumerationMutation(v30);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v34++), "applyToMatchedMaterialsOfAvatar:inHierarchy:options:reversionContext:", v10, v17, v12, 0);
      }
      while (v32 != v34);
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v32);
  }

  v13[2](v13, v17);
}

- (id)dictionaryWithTargetPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVTStickerSceneProp;
  -[AVTStickerProp dictionaryWithTargetPath:](&v8, sel_dictionaryWithTargetPath_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "removeObjectForKey:", CFSTR("orientToCamera"));
  -[AVTStickerProp originalName](self, "originalName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("scene"));

  return v5;
}

- (SCNNode)rootNode
{
  return self->_rootNode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootNode, 0);
}

@end
