@implementation AVTVariantBatchSnapshotter

- (AVTVariantBatchSnapshotter)initWithAvatar:(id)a3 size:(CGSize)a4 scale:(double)a5 antialiasingMode:(unint64_t)a6 device:(id)a7
{
  CGFloat height;
  CGFloat width;
  id v14;
  id v15;
  AVTVariantBatchSnapshotter *v16;
  AVTVariantBatchSnapshotter *v17;
  void *v18;
  uint64_t v19;
  AVTRenderer *renderer;
  AVTSnapshotHelper *v21;
  AVTSnapshotHelper *snapshotHelper;
  objc_super v24;
  const __CFString *v25;
  _QWORD v26[2];

  height = a4.height;
  width = a4.width;
  v26[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)AVTVariantBatchSnapshotter;
  v16 = -[AVTVariantBatchSnapshotter init](&v24, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_avatar, a3);
    v17->_size.width = width;
    v17->_size.height = height;
    v17->_scale = a5;
    v17->_antialiasingMode = a6;
    -[AVTAvatar setOptimizeForSnapshot:](v17->_avatar, "setOptimizeForSnapshot:", 1);
    v25 = CFSTR("AVTRendererOptionInitiallyConfigureForARMode");
    v26[0] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCNRenderer rendererWithDevice:options:](AVTRenderer, "rendererWithDevice:options:", v15, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    renderer = v17->_renderer;
    v17->_renderer = (AVTRenderer *)v19;

    -[AVTRenderer setFramingMode:](v17->_renderer, "setFramingMode:", CFSTR("cameraDefault"));
    -[AVTRenderer setAvatar:](v17->_renderer, "setAvatar:", v14);
    v21 = objc_alloc_init(AVTSnapshotHelper);
    snapshotHelper = v17->_snapshotHelper;
    v17->_snapshotHelper = v21;

  }
  return v17;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AVTVariantBatchSnapshotter;
  -[AVTVariantBatchSnapshotter dealloc](&v2, sel_dealloc);
}

- (id)imageWithOptions:(id)a3 modifications:(id)a4
{
  id v6;
  id v7;
  void *v8;
  AVTAvatar *v9;
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
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  __CFString *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  double scale;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  float v44;
  double v45;
  AVTRenderer *renderer;
  AVTSnapshotHelper *snapshotHelper;
  unint64_t antialiasingMode;
  double height;
  float v50;
  void *v51;
  id v52;
  NSObject *v53;
  id v55;
  __int128 v56;
  __int128 v57;
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
  _BYTE v72[128];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
    (*((void (**)(id, AVTAvatar *))v7 + 2))(v7, self->_avatar);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = self->_avatar;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AVTSnapshotMemojiPresetSubstitutions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v69;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v69 != v13)
            objc_enumerationMutation(v10);
          -[AVTAvatar setPreset:forCategory:animated:](v9, "setPreset:forCategory:animated:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * v14), objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * v14), "category"), 0);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v68, v75, 16);
      }
      while (v12);
    }

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AVTSnapshotMemojiColorPresetSubstitutions"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v65;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v65 != v18)
            objc_enumerationMutation(v15);
          -[AVTAvatar setColorPreset:forCategory:colorIndex:](v9, "setColorPreset:forCategory:colorIndex:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * v19), objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * v19), "category"), 0);
          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
      }
      while (v17);
    }

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AVTSnapshotMemojiSecondaryColorPresetSubstitutions"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v61;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v61 != v23)
            objc_enumerationMutation(v20);
          -[AVTAvatar setColorPreset:forCategory:colorIndex:](v9, "setColorPreset:forCategory:colorIndex:", *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v24), objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * v24), "category"), 1);
          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
      }
      while (v22);
    }

    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AVTSnapshotMemojiThirdColorPresetSubstitutions"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v57;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v57 != v28)
            objc_enumerationMutation(v25);
          -[AVTAvatar setColorPreset:forCategory:colorIndex:](v9, "setColorPreset:forCategory:colorIndex:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v29), objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * v29), "category"), 2);
          ++v29;
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v56, v72, 16);
      }
      while (v27);
    }

  }
  -[AVTAvatar update](self->_avatar, "update");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AVTSnapshotPose"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
    -[AVTAvatar setPose:](self->_avatar, "setPose:", v30);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AVTSnapshotFramingMode"));
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v31;
  v33 = CFSTR("cameraHead");
  if (v31)
    v33 = (__CFString *)v31;
  v34 = v33;

  -[AVTRenderer setFramingMode:](self->_renderer, "setFramingMode:", v34);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AVTSnapshotPoseAnimation"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
    v37 = (id)objc_msgSend(v35, "addToAvatar:useStaticPhysicsState:", self->_avatar, 0);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AVTSnapshotBackgroundColorKey"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTRenderer backgroundColor](self->_renderer, "backgroundColor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39 != v38)
    -[AVTRenderer setBackgroundColor:](self->_renderer, "setBackgroundColor:", v38);
  objc_msgSend(MEMORY[0x1E0CD5A38], "flush");
  scale = self->_scale;
  v41 = (unint64_t)(scale * self->_size.width);
  v42 = (unint64_t)(scale * self->_size.height);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AVTSnapshotHeroFrameKey"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "floatValue");
  v45 = v44;

  -[AVTRenderer updateAtTime:](self->_renderer, "updateAtTime:", v45);
  renderer = self->_renderer;
  antialiasingMode = self->_antialiasingMode;
  snapshotHelper = self->_snapshotHelper;
  height = self->_size.height;
  v50 = self->_scale;
  v55 = 0;
  v51 = (void *)-[AVTSnapshotHelper newImageWithRenderer:antialiasingMode:pixelWidth:pixelHeight:imagePointSize:contentScaleFactor:error:]((CGImage *)snapshotHelper, renderer, antialiasingMode, v41, v42, &v55, self->_size.width, height, v50);
  v52 = v55;
  if (!v51)
  {
    avt_default_log();
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      -[AVTVariantBatchSnapshotter imageWithOptions:modifications:].cold.1(v52);

  }
  return v51;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotHelper, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
}

- (void)imageWithOptions:(void *)a1 modifications:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1DD1FA000, v2, v3, "Error: Failed to create image with error: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_5();
}

@end
