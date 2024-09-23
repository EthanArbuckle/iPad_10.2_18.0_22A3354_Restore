@implementation NUPipelineOutputNode

- (NUPipelineOutputNode)initWithInput:(id)a3
{
  return -[NUPipelineOutputNode initWithInput:settings:](self, "initWithInput:settings:", a3, MEMORY[0x1E0C9AA70]);
}

- (NUPipelineOutputNode)initWithInput:(id)a3 settings:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  NUPipelineOutputNode *v10;
  objc_super v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v13 = *MEMORY[0x1E0C9E1F8];
  v14[0] = a3;
  v6 = (void *)MEMORY[0x1E0C99D80];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)NUPipelineOutputNode;
  v10 = -[NURenderNode initWithSettings:inputs:](&v12, sel_initWithSettings_inputs_, v7, v9);

  return v10;
}

- (BOOL)shouldCacheNodeForPipelineState:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "evaluationMode");
  return (v3 < 4) & (0xBu >> (v3 & 0xF));
}

- (id)resolvedNodeWithCachedInputs:(id)a3 settings:(id)a4 pipelineState:(id)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NUPipelineOutputNode;
  -[NURenderNode resolvedNodeWithCachedInputs:settings:pipelineState:error:](&v7, sel_resolvedNodeWithCachedInputs_settings_pipelineState_error_, a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_evaluateImageGeometryWithZeroedOrigin:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  NUImageGeometry *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NUImageGeometry *v16;
  _OWORD v18[2];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)NUPipelineOutputNode;
  -[NURenderNode _evaluateImageGeometry:](&v23, sel__evaluateImageGeometry_, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v6, "extent");
    -[NUPipelineOutputNode extentPolicy](self, "extentPolicy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v18[0] = v21;
      v18[1] = v22;
      objc_msgSend(v8, "extentForImageExtent:", v18);
      v21 = v19;
      v22 = v20;
    }
    if (v4)
      v21 = 0uLL;
    v10 = -[NUPipelineOutputNode imageGeometryRoundingPolicy](self, "imageGeometryRoundingPolicy");
    v11 = [NUImageGeometry alloc];
    v12 = objc_msgSend(v7, "renderScale");
    v14 = v13;
    v15 = objc_msgSend(v7, "orientation");
    v19 = v21;
    v20 = v22;
    v16 = -[NUImageGeometry initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:](v11, "initWithExtent:renderScale:orientation:spaceMap:roundingPolicy:", &v19, v12, v14, v15, 0, v10);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_evaluateImageGeometry:(id *)a3
{
  return -[NUPipelineOutputNode _evaluateImageGeometryWithZeroedOrigin:error:](self, "_evaluateImageGeometryWithZeroedOrigin:error:", 1, a3);
}

- (int64_t)imageGeometryRoundingPolicy
{
  if (-[NUPipelineOutputNode enforceEvenDimensions](self, "enforceEvenDimensions"))
    return 4;
  else
    return 0;
}

- (BOOL)renderTransparencyOpaque
{
  void *v2;
  void *v3;
  char v4;
  BOOL v5;

  -[NURenderNode settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("renderTransparencyOpaque"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = +[NUGlobalSettings renderTransparencyOpaque](NUGlobalSettings, "renderTransparencyOpaque");
  v5 = v4;

  return v5;
}

- (BOOL)enforceEvenDimensions
{
  void *v2;
  void *v3;
  char v4;

  -[NURenderNode settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("enforceEvenDimensions"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (id)extentPolicy
{
  void *v2;
  void *v3;

  -[NURenderNode settings](self, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("extentPolicy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_evaluateVideoProperties:(id *)a3
{
  void *v5;
  _NUVideoProperties *v6;
  _NUVideoProperties *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD v23[2];
  __int128 v24;
  __int128 v25;
  _OWORD v26[2];
  __int128 v27;
  __int128 v28;

  -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "videoProperties:", a3);
  v6 = (_NUVideoProperties *)objc_claimAutoreleasedReturnValue();
  if (-[NUPipelineOutputNode enforceEvenDimensions](self, "enforceEvenDimensions"))
  {
    v7 = -[_NUVideoProperties initWithProperties:]([_NUVideoProperties alloc], "initWithProperties:", v6);
    v8 = -[_NUVideoProperties size](v7, "size");
    v10 = NUEvenPixelSize(v8, v9);
    -[_NUVideoProperties setSize:](v7, "setSize:", v10, v11);
    v12 = -[_NUVideoProperties originalSize](v7, "originalSize");
    v14 = NUEvenPixelSize(v12, v13);
    -[_NUVideoProperties setOriginalSize:](v7, "setOriginalSize:", v14, v15);
    if (v7)
    {
      -[_NUVideoProperties cleanAperture](v7, "cleanAperture");
      v17 = *((_QWORD *)&v28 + 1);
      v16 = v28;
    }
    else
    {
      v17 = 0;
      v16 = 0;
      v27 = 0u;
      v28 = 0u;
    }
    *(_QWORD *)&v28 = NUEvenPixelSize(v16, v17);
    *((_QWORD *)&v28 + 1) = v18;
    v26[0] = v27;
    v26[1] = v28;
    -[_NUVideoProperties setCleanAperture:](v7, "setCleanAperture:", v26);
    if (v7)
    {
      -[_NUVideoProperties originalCleanAperture](v7, "originalCleanAperture");
      v20 = *((_QWORD *)&v25 + 1);
      v19 = v25;
    }
    else
    {
      v20 = 0;
      v19 = 0;
      v24 = 0u;
      v25 = 0u;
    }
    *(_QWORD *)&v25 = NUEvenPixelSize(v19, v20);
    *((_QWORD *)&v25 + 1) = v21;
    v23[0] = v24;
    v23[1] = v25;
    -[_NUVideoProperties setOriginalCleanAperture:](v7, "setOriginalCleanAperture:", v23);

  }
  else
  {
    v7 = v6;
  }

  return v7;
}

- (id)_evaluateImage:(id *)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  __int128 v23;
  uint64_t v24;
  void *v25;
  void *v26;
  CGAffineTransform v28;
  CGAffineTransform v29;

  -[NURenderNode inputForKey:](self, "inputForKey:", *MEMORY[0x1E0C9E1F8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "outputImage:", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (id)v6;
    if (-[NUPipelineOutputNode renderTransparencyOpaque](self, "renderTransparencyOpaque"))
    {
      objc_msgSend(v5, "imageProperties:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
        goto LABEL_18;
      v9 = v8;
      if (objc_msgSend(v8, "alphaInfo") == 1)
      {
        if (+[NUGlobalSettings renderTransparencyOverBlack](NUGlobalSettings, "renderTransparencyOverBlack"))
        {
          objc_msgSend(MEMORY[0x1E0C9DD80], "blackColor");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C9DD80], "whiteColor");
        }
        v12 = objc_claimAutoreleasedReturnValue();
        +[NUColorSpace sRGBColorSpace](NUColorSpace, "sRGBColorSpace");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "CGColorSpace");

        objc_msgSend(v7, "imageByColorMatchingWorkingSpaceToColorSpace:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithColor:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "imageByCompositingOverImage:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "extent");
        objc_msgSend(v17, "imageBySettingAlphaOneInExtent:");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "imageByColorMatchingColorSpaceToWorkingSpace:", v14);
        v11 = objc_claimAutoreleasedReturnValue();

        v7 = (id)v12;
      }
      else
      {
        objc_msgSend(v7, "extent");
        objc_msgSend(v7, "imageBySettingAlphaOneInExtent:");
        v11 = objc_claimAutoreleasedReturnValue();
      }

      v7 = (id)v11;
    }
    -[NUPipelineOutputNode _evaluateImageGeometryWithZeroedOrigin:error:](self, "_evaluateImageGeometryWithZeroedOrigin:error:", 0, a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = v19;
      objc_msgSend(v19, "scaledExtent");
      if (v21 != 0.0 || v22 != 0.0)
      {
        memset(&v29, 0, sizeof(v29));
        v23 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v28.a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v28.c = v23;
        *(_OWORD *)&v28.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        CGAffineTransformTranslate(&v29, &v28, -v21, -v22);
        v28 = v29;
        objc_msgSend(v7, "imageByApplyingTransform:", &v28);
        v24 = objc_claimAutoreleasedReturnValue();

        v7 = (id)v24;
      }
      v25 = v7;
      objc_msgSend(v7, "imageByClampingToExtent");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      -[NUPipelineOutputNode _evaluateImageGeometryWithZeroedOrigin:error:](self, "_evaluateImageGeometryWithZeroedOrigin:error:", 1, a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        memset(&v29, 0, 32);
        objc_msgSend(v10, "physicalScaledExtent");
        objc_msgSend(v7, "imageByCroppingToRect:", (double)*(uint64_t *)&v29.a, (double)*(uint64_t *)&v29.b, (double)*(uint64_t *)&v29.c, (double)*(uint64_t *)&v29.d);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = v26;
        v10 = v7;
      }
      goto LABEL_19;
    }
LABEL_18:
    v10 = 0;
LABEL_19:

    goto LABEL_20;
  }
  v10 = 0;
LABEL_20:

  return v10;
}

@end
