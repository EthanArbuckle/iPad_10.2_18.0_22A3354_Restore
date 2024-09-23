@implementation BWStreamingCVAFilterRendererParameters

+ (void)initialize
{
  objc_opt_class();
}

- (BWStreamingCVAFilterRendererParameters)initWithColorFilter:(id)a3 colorLookupCache:(id)a4 studioAndContourRenderingEnabled:(BOOL)a5 stageRenderingEnabled:(BOOL)a6
{
  BWStreamingCVAFilterRendererParameters *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BWStreamingCVAFilterRendererParameters;
  v10 = -[BWStreamingCVAFilterRendererParameters init](&v13, sel_init);
  if (v10)
  {
    v10->_colorFilter = (CIFilter *)a3;
    v10->_colorLookupCache = (BWColorLookupCache *)a4;
    v11 = (void *)objc_msgSend(a4, "colorLookupTablesForFilter:", a3);
    v10->_foregroundColorLookupTable = (NSData *)(id)objc_msgSend(v11, "foregroundColorLookupTable");
    v10->_backgroundColorLookupTable = (NSData *)(id)objc_msgSend(v11, "backgroundColorLookupTable");
    v10->_interpolationFractionComplete = 1.0;
    v10->_studioAndContourRenderingEnabled = a5;
    v10->_stageRenderingEnabled = a6;
    -[BWStreamingCVAFilterRendererParameters _ensureParametersForColorFilter:outputRenderingStrategy:]((uint64_t)v10, a3, &v10->_renderingStrategy);
  }
  return v10;
}

- (uint64_t)_ensureParametersForColorFilter:(uint64_t *)a3 outputRenderingStrategy:
{
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  if (result && a2)
  {
    v5 = result;
    result = objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", CFSTR("CIPortraitEffectStudio"));
    if ((result & 1) != 0
      || (result = objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", CFSTR("CIPortraitEffectStudioV2")),
          (_DWORD)result))
    {
      v6 = *(_BYTE *)(v5 + 40) == 0;
      v7 = 1;
    }
    else
    {
      result = objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", CFSTR("CIPortraitEffectContour"));
      if ((result & 1) != 0
        || (result = objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", CFSTR("CIPortraitEffectContourV2")),
            (_DWORD)result))
      {
        v6 = *(_BYTE *)(v5 + 40) == 0;
        v7 = 3;
      }
      else
      {
        result = objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", CFSTR("CIPortraitEffectStage"));
        if ((result & 1) != 0
          || (result = objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", CFSTR("CIPortraitEffectStageV2")),
              (_DWORD)result))
        {
          v6 = *(_BYTE *)(v5 + 41) == 0;
          v7 = 5;
        }
        else
        {
          result = objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", CFSTR("CIPortraitEffectStageMono"));
          if ((result & 1) != 0
            || (result = objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", CFSTR("CIPortraitEffectStageMonoV2")), (_DWORD)result))
          {
            v6 = *(_BYTE *)(v5 + 41) == 0;
            v7 = 7;
          }
          else
          {
            result = objc_msgSend((id)objc_msgSend(a2, "name"), "isEqualToString:", CFSTR("CIPortraitEffectStageWhite"));
            if (!(_DWORD)result)
            {
              v7 = 0;
              if (!a3)
                return result;
              goto LABEL_18;
            }
            v6 = *(_BYTE *)(v5 + 41) == 0;
            v7 = 9;
          }
        }
      }
    }
    if (v6)
      ++v7;
    if (a3)
LABEL_18:
      *a3 = v7;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStreamingCVAFilterRendererParameters;
  -[BWStreamingCVAFilterRendererParameters dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p> studio&contour:%d, stage:%d strategy:%ld, fractionComplete:%.3f, fgLUT:%d, bgLUT:%d, colorFilter:%@"), objc_opt_class(), self, self->_studioAndContourRenderingEnabled, self->_stageRenderingEnabled, self->_renderingStrategy, self->_interpolationFractionComplete, self->_foregroundColorLookupTable != 0, self->_backgroundColorLookupTable != 0, self->_colorFilter);
}

- (id)copyWithZone:(_NSZone *)a3
{
  BWStreamingCVAFilterRendererParameters *v4;
  float v5;

  v4 = -[BWStreamingCVAFilterRendererParameters initWithColorFilter:colorLookupCache:studioAndContourRenderingEnabled:stageRenderingEnabled:]([BWStreamingCVAFilterRendererParameters alloc], "initWithColorFilter:colorLookupCache:studioAndContourRenderingEnabled:stageRenderingEnabled:", self->_colorFilter, self->_colorLookupCache, self->_studioAndContourRenderingEnabled, self->_stageRenderingEnabled);

  v4->_foregroundColorLookupTable = -[BWStreamingCVAFilterRendererParameters foregroundColorLookupTable](self, "foregroundColorLookupTable");
  v4->_backgroundColorLookupTable = -[BWStreamingCVAFilterRendererParameters backgroundColorLookupTable](self, "backgroundColorLookupTable");
  v4->_renderingStrategy = -[BWStreamingCVAFilterRendererParameters renderingStrategy](self, "renderingStrategy");
  -[BWStreamingCVAFilterRendererParameters interpolationFractionComplete](self, "interpolationFractionComplete");
  v4->_interpolationFractionComplete = v5;
  return v4;
}

- (signed)type
{
  return 0;
}

- (int)prepareForRenderingWithInputVideoFormat:(id)a3
{
  id v4;
  void *v5;

  if (!-[BWStreamingCVAFilterRendererParameters foregroundColorLookupTable](self, "foregroundColorLookupTable", a3)
    && !-[BWStreamingCVAFilterRendererParameters backgroundColorLookupTable](self, "backgroundColorLookupTable"))
  {
    v4 = -[BWColorLookupCache fetchColorLookupTablesForFilter:](-[BWStreamingCVAFilterRendererParameters colorLookupCache](self, "colorLookupCache"), "fetchColorLookupTablesForFilter:", -[BWStreamingCVAFilterRendererParameters colorFilter](self, "colorFilter"));
    if (v4)
    {
      v5 = v4;
      -[BWStreamingCVAFilterRendererParameters setForegroundColorLookupTable:](self, "setForegroundColorLookupTable:", objc_msgSend(v4, "foregroundColorLookupTable"));
      -[BWStreamingCVAFilterRendererParameters setBackgroundColorLookupTable:](self, "setBackgroundColorLookupTable:", objc_msgSend(v5, "backgroundColorLookupTable"));
    }
  }
  return 0;
}

- (void)updateByInterpolatingFromParameters:(id)a3 toParameters:(id)a4 withFractionComplete:(float)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  unint64_t renderingStrategy;
  id v18;
  double v19;

  if (objc_msgSend(a3, "type") || objc_msgSend(a4, "type"))
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  else
  {
    self->_renderingStrategy = objc_msgSend(a4, "renderingStrategy");
    if (objc_msgSend(a3, "colorFilter"))
      v9 = (id)objc_msgSend(a3, "foregroundColorLookupTable");
    else
      v9 = -[BWColorLookupCache identityColorLookupTable](self->_colorLookupCache, "identityColorLookupTable");
    v10 = v9;
    if (objc_msgSend(a4, "colorFilter"))
      v11 = (id)objc_msgSend(a4, "foregroundColorLookupTable");
    else
      v11 = -[BWColorLookupCache identityColorLookupTable](self->_colorLookupCache, "identityColorLookupTable");
    v12 = v11;
    if (objc_msgSend(a3, "colorFilter"))
      v13 = (id)objc_msgSend(a3, "backgroundColorLookupTable");
    else
      v13 = -[BWColorLookupCache identityColorLookupTable](self->_colorLookupCache, "identityColorLookupTable");
    v14 = v13;
    if (objc_msgSend(a4, "colorFilter"))
      v15 = (id)objc_msgSend(a4, "backgroundColorLookupTable");
    else
      v15 = -[BWColorLookupCache identityColorLookupTable](self->_colorLookupCache, "identityColorLookupTable");
    renderingStrategy = self->_renderingStrategy;
    if (renderingStrategy <= 0xA)
    {
      if (((1 << renderingStrategy) & 0x555) != 0)
      {
        if (v15)
          v18 = v15;
        else
          v18 = v12;
        if (!v14)
          v14 = v10;
        *(float *)&v16 = a5;
        -[BWStreamingCVAFilterRendererParameters setForegroundColorLookupTable:](self, "setForegroundColorLookupTable:", -[BWColorLookupCache interpolatedColorLookupTableFromTable:toTable:fractionComplete:](self->_colorLookupCache, "interpolatedColorLookupTableFromTable:toTable:fractionComplete:", v10, v12, v16));
        *(float *)&v19 = a5;
        -[BWStreamingCVAFilterRendererParameters setBackgroundColorLookupTable:](self, "setBackgroundColorLookupTable:", -[BWColorLookupCache interpolatedColorLookupTableFromTable:toTable:fractionComplete:](self->_colorLookupCache, "interpolatedColorLookupTableFromTable:toTable:fractionComplete:", v14, v18, v19));
        self->_interpolationFractionComplete = 1.0;
      }
      else
      {
        if (((1 << renderingStrategy) & 0x2A) == 0)
          -[BWStreamingCVAFilterRendererParameters setForegroundColorLookupTable:](self, "setForegroundColorLookupTable:", objc_msgSend(a4, "foregroundColorLookupTable"));
        self->_interpolationFractionComplete = a5;
      }
    }
  }
}

- (void)setColorFilter:(id)a3
{
  CIFilter *colorFilter;

  colorFilter = self->_colorFilter;
  if (colorFilter != a3)
  {

    self->_colorFilter = (CIFilter *)a3;
    -[BWStreamingCVAFilterRendererParameters _ensureParametersForColorFilter:outputRenderingStrategy:]((uint64_t)self, a3, &self->_renderingStrategy);
  }
}

- (CIFilter)colorFilter
{
  return self->_colorFilter;
}

- (BWColorLookupCache)colorLookupCache
{
  return self->_colorLookupCache;
}

- (NSData)foregroundColorLookupTable
{
  return self->_foregroundColorLookupTable;
}

- (void)setForegroundColorLookupTable:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSData)backgroundColorLookupTable
{
  return self->_backgroundColorLookupTable;
}

- (void)setBackgroundColorLookupTable:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (float)interpolationFractionComplete
{
  return self->_interpolationFractionComplete;
}

- (int64_t)renderingStrategy
{
  return self->_renderingStrategy;
}

@end
