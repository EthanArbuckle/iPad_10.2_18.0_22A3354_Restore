@implementation AVTSnapshotBuilder

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_19);
  return (id)sharedInstance_snapshotter;
}

void __36__AVTSnapshotBuilder_sharedInstance__block_invoke()
{
  AVTSnapshotBuilder *v0;
  void *v1;

  v0 = objc_alloc_init(AVTSnapshotBuilder);
  v1 = (void *)sharedInstance_snapshotter;
  sharedInstance_snapshotter = (uint64_t)v0;

}

- (SCNRenderer)renderer
{
  return (SCNRenderer *)self->_renderer;
}

- (void)setAvatar:(id)a3
{
  AVTAvatar *v5;
  AVTAvatar *snapshotedAvatar;
  AVTAvatar *v7;

  v5 = (AVTAvatar *)a3;
  if (self->_avatar != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_avatar, a3);
    snapshotedAvatar = self->_snapshotedAvatar;
    self->_snapshotedAvatar = 0;

    v5 = v7;
  }

}

- (AVTAvatar)avatar
{
  return self->_avatar;
}

- (AVTSnapshotBuilder)init
{
  AVTSnapshotBuilder *v2;
  void *v3;
  uint64_t v4;
  AVTRenderer *renderer;
  AVTSnapshotHelper *v6;
  AVTSnapshotHelper *snapshotHelper;
  objc_super v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)AVTSnapshotBuilder;
  v2 = -[AVTSnapshotBuilder init](&v9, sel_init);
  if (v2)
  {
    v10 = CFSTR("AVTRendererOptionInitiallyConfigureForARMode");
    v11[0] = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[SCNRenderer rendererWithDevice:options:](AVTRenderer, "rendererWithDevice:options:", 0, v3);
    v4 = objc_claimAutoreleasedReturnValue();
    renderer = v2->_renderer;
    v2->_renderer = (AVTRenderer *)v4;

    -[AVTRenderer setFramingMode:](v2->_renderer, "setFramingMode:", CFSTR("cameraDefault"));
    v6 = objc_alloc_init(AVTSnapshotHelper);
    snapshotHelper = v2->_snapshotHelper;
    v2->_snapshotHelper = v6;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AVTSnapshotBuilder;
  -[AVTSnapshotBuilder dealloc](&v2, sel_dealloc);
}

- (void)_applyOptions:(id)a3
{
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVTSnapshotFramingMode"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("cameraHead");
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  -[AVTRenderer setFramingMode:](self->_renderer, "setFramingMode:", v7);
}

- (void)setupAvatarWithOptions:(id)a3 useACopy:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  AVTAvatar *v7;
  AVTAvatar *snapshotedAvatar;
  void *v9;
  AVTAvatar *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t m;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v4 = a4;
  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!self->_snapshotedAvatar)
  {
    if (v4)
      v7 = (AVTAvatar *)-[AVTAvatar copy](self->_avatar, "copy");
    else
      v7 = self->_avatar;
    snapshotedAvatar = self->_snapshotedAvatar;
    self->_snapshotedAvatar = v7;

    -[AVTAvatar setOptimizeForSnapshot:](self->_snapshotedAvatar, "setOptimizeForSnapshot:", 1);
    -[AVTRenderer setAvatar:](self->_renderer, "setAvatar:", self->_snapshotedAvatar);
    if (!v4)
      goto LABEL_12;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[AVTAvatar morphTo:](self->_snapshotedAvatar, "morphTo:", self->_avatar);
  if (v4)
  {
LABEL_10:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AVTAvatar setShowsBody:](self->_snapshotedAvatar, "setShowsBody:", -[AVTAvatar showsBody](self->_avatar, "showsBody"));
      -[AVTAvatar bodyPose](self->_avatar, "bodyPose");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[AVTAvatar setBodyPose:](self->_snapshotedAvatar, "setBodyPose:", v9);

    }
  }
LABEL_12:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = self->_snapshotedAvatar;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AVTSnapshotMemojiPresetSubstitutions"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v45 != v14)
            objc_enumerationMutation(v11);
          -[AVTAvatar setPreset:forCategory:animated:](v10, "setPreset:forCategory:animated:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i), objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "category"), 0);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
      }
      while (v13);
    }

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AVTSnapshotMemojiColorPresetSubstitutions"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v41 != v19)
            objc_enumerationMutation(v16);
          -[AVTAvatar setColorPreset:forCategory:colorIndex:](v10, "setColorPreset:forCategory:colorIndex:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j), objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "category"), 0);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
      }
      while (v18);
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AVTSnapshotMemojiSecondaryColorPresetSubstitutions"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v37;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v37 != v24)
            objc_enumerationMutation(v21);
          -[AVTAvatar setColorPreset:forCategory:colorIndex:](v10, "setColorPreset:forCategory:colorIndex:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * k), objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * k), "category"), 1);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v49, 16);
      }
      while (v23);
    }

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AVTSnapshotMemojiThirdColorPresetSubstitutions"), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v33;
      do
      {
        for (m = 0; m != v28; ++m)
        {
          if (*(_QWORD *)v33 != v29)
            objc_enumerationMutation(v26);
          -[AVTAvatar setColorPreset:forCategory:colorIndex:](v10, "setColorPreset:forCategory:colorIndex:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * m), objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * m), "category"), 2);
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v32, v48, 16);
      }
      while (v28);
    }

  }
  -[AVTAvatar update](self->_snapshotedAvatar, "update");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AVTSnapshotPose"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    -[AVTAvatar setPose:](self->_snapshotedAvatar, "setPose:", v31);

}

+ (CGImage)copyRescaledCGImage:(CGImage *)a3 by:(float)a4
{
  size_t v6;
  size_t v7;
  size_t BitsPerComponent;
  size_t v9;
  CGColorSpace *ColorSpace;
  uint32_t BitmapInfo;
  CGImage *result;
  CGContext *v13;
  CGImage *Image;
  CGRect v15;

  v6 = (unint64_t)(float)((float)CGImageGetWidth(a3) * a4);
  v7 = (unint64_t)(float)((float)CGImageGetHeight(a3) * a4);
  BitsPerComponent = CGImageGetBitsPerComponent(a3);
  v9 = (CGImageGetBitsPerPixel(a3) >> 3) * v6;
  ColorSpace = CGImageGetColorSpace(a3);
  BitmapInfo = CGImageGetBitmapInfo(a3);
  result = CGBitmapContextCreate(0, v6, v7, BitsPerComponent, v9, ColorSpace, BitmapInfo);
  if (result)
  {
    v13 = result;
    v15.size.width = (double)v6;
    v15.size.height = (double)v7;
    v15.origin.x = 0.0;
    v15.origin.y = 0.0;
    CGContextDrawImage(result, v15, a3);
    Image = CGBitmapContextCreateImage(v13);
    CGContextRelease(v13);
    return Image;
  }
  return result;
}

- (id)imageWithSize:(CGSize)a3 scale:(double)a4 options:(id)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  objc_msgSend(v9, "valueForKey:", CFSTR("AVTSnapshotNoCopy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue") ^ 1;

  -[AVTSnapshotBuilder _imageWithSize:scale:options:useACopy:](self, "_imageWithSize:scale:options:useACopy:", v9, v11, width, height, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_imageWithSize:(CGSize)a3 scale:(double)a4 options:(id)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  objc_msgSend(v9, "valueForKey:", CFSTR("AVTSnapshotNoCopy"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue") ^ 1;

  -[AVTSnapshotBuilder _imageWithSize:scale:options:useACopy:](self, "_imageWithSize:scale:options:useACopy:", v9, v11, width, height, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_imageWithSize:(CGSize)a3 scale:(double)a4 options:(id)a5 useACopy:(BOOL)a6
{
  uint64_t v6;
  double height;
  double width;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double Current;
  void *v19;
  float v20;
  float v21;
  float v22;
  void *v23;
  float v24;
  double v25;
  void *v26;
  void *v27;
  id v28;
  double v29;
  void *v30;
  void *v31;
  AVTSnapshotHelper *snapshotHelper;
  AVTRenderer *renderer;
  float v34;
  void *v35;
  id v36;
  NSObject *v37;
  id v39;

  v6 = a6;
  height = a3.height;
  width = a3.width;
  v11 = a5;
  v12 = (void *)MEMORY[0x1DF0D6DC8]();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AVTSnapshotShaderCollectorNeverCopyKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    v6 = v6 & ~objc_msgSend(v13, "BOOLValue");
  -[AVTSnapshotBuilder setupAvatarWithOptions:useACopy:](self, "setupAvatarWithOptions:useACopy:", v11, v6);
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AVTSnapshotAntialiasedKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AVTSnapshotAntialiasedKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "BOOLValue"))
      v17 = 2;
    else
      v17 = 0;

  }
  else
  {
    v17 = 2;
  }

  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AVTSnapshotUpscaleKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "floatValue");
  v21 = v20;

  if (v21 == 0.0)
    v22 = 1.0;
  else
    v22 = v21;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AVTSnapshotHeroFrameKey"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "floatValue");
  v25 = v24;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AVTSnapshotPoseAnimation"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
    v28 = (id)objc_msgSend(v26, "addToAvatar:useStaticPhysicsState:", self->_snapshotedAvatar, 0);
  -[AVTSnapshotBuilder _applyOptions:](self, "_applyOptions:", v11);
  -[AVTRenderer setSceneTime:](self->_renderer, "setSceneTime:", v25);
  v29 = v22;
  -[AVTRenderer set_superSamplingFactor:](self->_renderer, "set_superSamplingFactor:", v29);
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("AVTSnapshotBackgroundColorKey"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTRenderer backgroundColor](self->_renderer, "backgroundColor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31 != v30)
    -[AVTRenderer setBackgroundColor:](self->_renderer, "setBackgroundColor:", v30);
  objc_msgSend(MEMORY[0x1E0CD5A38], "flush");
  -[AVTRenderer updateAtTime:](self->_renderer, "updateAtTime:", Current + v25);
  renderer = self->_renderer;
  snapshotHelper = self->_snapshotHelper;
  v34 = a4;
  v39 = 0;
  v35 = (void *)-[AVTSnapshotHelper newImageWithRenderer:antialiasingMode:pixelWidth:pixelHeight:imagePointSize:contentScaleFactor:error:]((CGImage *)snapshotHelper, renderer, v17, (unint64_t)(width * (v29 * a4)), (unint64_t)(height * (v29 * a4)), &v39, width, height, v34);
  v36 = v39;
  if (!v35)
  {
    avt_default_log();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[AVTVariantBatchSnapshotter imageWithOptions:modifications:].cold.1(v36);

  }
  objc_autoreleasePoolPop(v12);

  return v35;
}

- (id)animatedImageWithSize:(CGSize)a3 scale:(double)a4 options:(id)a5
{
  double height;
  double width;
  id v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  float v19;
  float v20;
  float v21;
  void *v22;
  float v23;
  float v24;
  float v25;
  float v26;
  int v27;
  __n128 v28;
  double v29;
  int v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  float v34;
  void *v35;
  AVTRenderer *renderer;
  double v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  double v43;
  CGImage *v44;
  void *v45;
  id v46;
  void *v47;
  double v49;
  void *v50;
  void *context;
  void *v52;
  void *v53;

  height = a3.height;
  width = a3.width;
  v9 = a5;
  context = (void *)MEMORY[0x1DF0D6DC8]();
  -[AVTSnapshotBuilder setupAvatarWithOptions:useACopy:](self, "setupAvatarWithOptions:useACopy:", v9, 1);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AVTSnapshotPoseAnimation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = (id)objc_msgSend(v10, "addToAvatar:useStaticPhysicsState:", self->_snapshotedAvatar, 0);
    objc_msgSend(v11, "duration");
    v14 = v13;
  }
  else
  {
    v14 = 2.0;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AVTSnapshotAntialiasedKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v11;
  if (v15)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AVTSnapshotAntialiasedKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "BOOLValue"))
      v17 = 2;
    else
      v17 = 0;

  }
  else
  {
    v17 = 2;
  }

  -[AVTRenderer setJitteringEnabled:](self->_renderer, "setJitteringEnabled:", 0);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AVTSnapshotUpscaleKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "floatValue");
  v20 = v19;

  if (v20 == 0.0)
    v21 = 1.5;
  else
    v21 = v20;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AVTSnapshotRateKey"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "floatValue");
  v24 = v23;

  if (v24 == 0.0)
    v25 = 60.0;
  else
    v25 = v24;
  v49 = v14;
  v26 = v14 * v25;
  v27 = vcvtps_s32_f32(v26);
  v52 = v9;
  -[AVTSnapshotBuilder _applyOptions:](self, "_applyOptions:", v9);
  objc_msgSend(MEMORY[0x1E0CD5A38], "flush");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v28.n128_f64[0] = CFAbsoluteTimeGetCurrent();
  if (v27 >= 1)
  {
    v29 = v28.n128_f64[0];
    v30 = 0;
    v31 = v21 * a4;
    v32 = (unint64_t)(width * v31);
    v28.n128_f64[0] = height * v31;
    v33 = (unint64_t)v28.n128_f64[0];
    v28.n128_u32[0] = 1.0;
    do
    {
      v35 = (void *)MEMORY[0x1DF0D6DC8](v28);
      -[AVTRenderer setSceneTime:](self->_renderer, "setSceneTime:", (float)((float)v30 / v25));
      renderer = self->_renderer;
      -[AVTRenderer sceneTime](renderer, "sceneTime");
      -[AVTRenderer updateAtTime:](renderer, "updateAtTime:", v29 + v37);
      v34 = a4;
      v38 = (void *)-[AVTSnapshotHelper newImageWithRenderer:antialiasingMode:pixelWidth:pixelHeight:imagePointSize:contentScaleFactor:error:]((CGImage *)self->_snapshotHelper, self->_renderer, v17, v32, v33, 0, width, height, v34);
      v39 = v38;
      if (v21 != 1.0)
      {
        v40 = objc_retainAutorelease(v38);
        v41 = objc_msgSend(v40, "CGImage");
        v42 = (void *)objc_opt_class();
        *(float *)&v43 = 1.0 / v21;
        v44 = (CGImage *)objc_msgSend(v42, "copyRescaledCGImage:by:", v41, v43);
        objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", v44);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        CGImageRelease(v44);
      }
      if (a4 != 1.0)
      {
        v45 = (void *)MEMORY[0x1E0CEA638];
        v46 = objc_retainAutorelease(v39);
        objc_msgSend(v45, "imageWithCGImage:scale:orientation:", objc_msgSend(v46, "CGImage"), 0, a4);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (v39)
        objc_msgSend(v53, "addObject:", v39);

      objc_autoreleasePoolPop(v35);
      ++v30;
    }
    while (v27 != v30);
  }
  objc_msgSend(MEMORY[0x1E0CEA638], "animatedImageWithImages:duration:", v53, v49);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
  return v47;
}

- (double)deprecated_avtui_fieldOfViewForFramingMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v4 = a3;
  -[AVTSnapshotBuilder renderer](self, "renderer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rootNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "childNodeWithName:recursively:", v4, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "camera");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fieldOfView");
  v11 = v10;

  return v11;
}

- (void)deprecated_avtui_applyModificationsForFramingMode:(id)a3 projectionDirectionModification:(unint64_t)a4 fieldOfViewModification:(double)a5 lensShiftModification:
{
  double v5;
  double v6;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = v5;
  v10 = a3;
  -[AVTSnapshotBuilder renderer](self, "renderer");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "scene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rootNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "childNodeWithName:recursively:", v10, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "camera");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFieldOfView:", a5);

  objc_msgSend(v13, "camera");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setProjectionDirection:", a4);

  objc_msgSend(v13, "camera");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLensShift:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotHelper, 0);
  objc_storeStrong((id *)&self->_renderer, 0);
  objc_storeStrong((id *)&self->_snapshotedAvatar, 0);
  objc_storeStrong((id *)&self->_avatar, 0);
}

@end
