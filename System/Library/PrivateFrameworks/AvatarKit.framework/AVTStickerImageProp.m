@implementation AVTStickerImageProp

- (AVTStickerImageProp)initWithImageAtPath:(id)a3 size:(CGSize)a4 scale:(BOOL)a5 position:(BOOL)a6 renderLast:(id)a7 orientToCamera:(id)a8 rotation:(id)a9 palettesDescriptions:modifiers:adjustments:
{
  double v9;
  double v10;
  double v11;
  _BOOL8 v15;
  _BOOL8 v16;
  double height;
  double width;
  id v21;
  AVTStickerImageProp *v22;
  AVTStickerImageProp *v23;
  double v25;
  double v26;
  double v27;
  objc_super v28;

  v26 = v10;
  v27 = v11;
  v15 = a6;
  v16 = a5;
  v25 = v9;
  height = a4.height;
  width = a4.width;
  v21 = a3;
  v28.receiver = self;
  v28.super_class = (Class)AVTStickerImageProp;
  v22 = -[AVTStickerProp initWithSize:scale:position:renderLast:orientToCamera:rotation:palettesDescriptions:shaderModifiers:adjustments:](&v28, sel_initWithSize_scale_position_renderLast_orientToCamera_rotation_palettesDescriptions_shaderModifiers_adjustments_, v16, v15, a7, a8, a9, width, height, v25, v26, v27);
  v23 = v22;
  if (v22)
    objc_storeStrong((id *)&v22->_imagePath, a3);

  return v23;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVTStickerImageProp *v4;
  NSString *imagePath;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL8 v12;
  _BOOL8 v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  AVTStickerImageProp *v18;
  double v20;
  double v21;
  double v22;

  v4 = [AVTStickerImageProp alloc];
  imagePath = self->_imagePath;
  -[AVTStickerProp size](self, "size");
  v7 = v6;
  v9 = v8;
  -[AVTStickerProp scale](self, "scale");
  v22 = v10;
  -[AVTStickerProp position](self, "position");
  v21 = v11;
  v12 = -[AVTStickerProp renderLast](self, "renderLast");
  v13 = -[AVTStickerProp orientToCamera](self, "orientToCamera");
  -[AVTStickerProp rotation](self, "rotation");
  v20 = v14;
  -[AVTStickerProp palettesDescriptions](self, "palettesDescriptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerProp shaderModifiers](self, "shaderModifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTStickerProp adjustments](self, "adjustments");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[AVTStickerImageProp initWithImageAtPath:size:scale:position:renderLast:orientToCamera:rotation:palettesDescriptions:modifiers:adjustments:](v4, "initWithImageAtPath:size:scale:position:renderLast:orientToCamera:rotation:palettesDescriptions:modifiers:adjustments:", imagePath, v12, v13, v15, v16, v17, v7, v9, v22, v21, v20);

  return v18;
}

- (NSString)imagePath
{
  return self->_imagePath;
}

- (void)buildNodeForAvatar:(id)a3 withCamera:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  void (**v10)(id, void *);
  id v11;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  unint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void (**v22)(id, void *);
  unsigned int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void (**v28)(id, void *);
  id v29;
  void *v30;
  uint64_t v31;
  NSString *imagePath;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void (**v44)(id, void *);
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  float32x4_t v51;
  float32x4_t v52;
  float32x4_t v53;
  float32x4_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (**v61)(id, void *);
  float32x4_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v10 = (void (**)(id, void *))a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  -[AVTStickerProp node](self, "node");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0x1F03CC000;
  if (!v14)
  {
    v16 = (void *)MEMORY[0x1E0CD59F8];
    -[AVTStickerProp size](self, "size");
    v18 = v17;
    -[AVTStickerProp size](self, "size");
    objc_msgSend(v16, "planeWithWidth:height:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstMaterial");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD59D0], "nodeWithGeometry:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTStickerProp position](self, "position");
    objc_msgSend(v21, "setSimdPosition:");
    -[AVTStickerProp rotation](self, "rotation");
    objc_msgSend(v21, "setSimdEulerAngles:");
    -[AVTStickerProp scale](self, "scale");
    v61 = v22;
    -[AVTStickerProp scale](self, "scale");
    objc_msgSend(v21, "setSimdScale:", COERCE_DOUBLE(__PAIR64__(v23, v61)));
    objc_msgSend(v21, "setCastsShadow:", 0);
    -[AVTStickerProp opacity](self, "opacity");
    objc_msgSend(v21, "setOpacity:");
    -[AVTStickerProp palettesDescriptions](self, "palettesDescriptions");
    v24 = objc_claimAutoreleasedReturnValue();
    if (!v24)
      goto LABEL_5;
    v25 = (void *)v24;
    -[AVTStickerProp palettesDescriptions](self, "palettesDescriptions");
    v61 = v10;
    v26 = v20;
    v27 = v19;
    v28 = v13;
    v29 = v11;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");

    v11 = v29;
    v13 = v28;
    v19 = v27;
    v20 = v26;
    v10 = v61;

    if (v31)
    {
      imagePath = self->_imagePath;
      objc_msgSend(v20, "emission");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_5:
      imagePath = self->_imagePath;
      objc_msgSend(v20, "diffuse");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v34 = v33;
    objc_msgSend(v33, "setContents:", imagePath);

    objc_msgSend(v20, "setLightingModelName:", *MEMORY[0x1E0CD5AF8]);
    -[AVTStickerProp setNode:](self, "setNode:", v21);

    v15 = 0x1F03CC000uLL;
  }
  -[AVTStickerProp node](self, "node");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  AVTCloneNodesAndMaterials(v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (!*(Class *)((char *)&self->super.super.isa + *(int *)(v15 + 1552)))
  {
    objc_msgSend(v36, "geometry");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "firstMaterial");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "emission");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setContents:", v39);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "diffuse");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setContents:", v41);

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v61 = v13;
    v43 = v11;
    v44 = v10;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    -[AVTStickerProp adjustments](self, "adjustments");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v68;
      do
      {
        v49 = 0;
        do
        {
          if (*(_QWORD *)v68 != v48)
            objc_enumerationMutation(v45);
          objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * v49++), "applyAdjustmentIfNeededToNode:forMemoji:ignoreScaleZ:", v36, v44, 1, v61);
        }
        while (v47 != v49);
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v67, v72, 16);
      }
      while (v47);
    }

    v11 = v43;
    v13 = v61;
  }
  objc_msgSend(v10, "neckNode", v61);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "simdWorldPosition");
  v62 = v51;
  objc_msgSend(v11, "simdWorldPosition");
  v53 = vsubq_f32(v62, v52);
  v54 = vmulq_f32(v53, v53);
  -[AVTStickerProp applyCamera:toNode:distToHead:](self, "applyCamera:toNode:distToHead:", v11, v36, sqrtf(vaddq_f32((float32x4_t)vdupq_laneq_s32((int32x4_t)v54, 2), vaddq_f32(v54, (float32x4_t)vdupq_lane_s32(*(int32x2_t *)v54.f32, 1))).f32[0]));

  -[AVTStickerProp palettesDescriptions](self, "palettesDescriptions");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTStickerProp applyPalettesForAvatar:toNode:palettesDescriptions:](AVTStickerProp, "applyPalettesForAvatar:toNode:palettesDescriptions:", v10, v36, v55);

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[AVTStickerProp shaderModifiers](self, "shaderModifiers");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
  if (v57)
  {
    v58 = v57;
    v59 = *(_QWORD *)v64;
    do
    {
      v60 = 0;
      do
      {
        if (*(_QWORD *)v64 != v59)
          objc_enumerationMutation(v56);
        objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * v60++), "applyToAllMaterialsOfNode:options:reversionContext:", v36, v12, 0);
      }
      while (v58 != v60);
      v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
    }
    while (v58);
  }

  v13[2](v13, v36);
}

- (id)dictionaryWithTargetPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVTStickerImageProp;
  -[AVTStickerProp dictionaryWithTargetPath:](&v8, sel_dictionaryWithTargetPath_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[AVTStickerProp originalName](self, "originalName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("image"));

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imagePath, 0);
}

@end
