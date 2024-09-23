@implementation BWCoreImageFilterRendererParameters

+ (void)initialize
{
  objc_opt_class();
}

- (BWCoreImageFilterRendererParameters)initWithFilters:(id)a3 originalOutputFilter:(id)a4
{
  BWCoreImageFilterRendererParameters *v6;
  BWCoreImageFilterRendererParameters *v7;
  __int16 v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BWCoreImageFilterRendererParameters;
  v6 = -[BWCoreImageFilterRendererParameters init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v9 = 0;
    -[BWCoreImageFilterRendererParameters _ensureResourceRequirementsForFilters:outputRequiresFaceLandmarks:outputRequiresDepthMap:]((uint64_t)v6, a3, (_BYTE *)&v9 + 1, &v9);
    v7->_filters = (NSArray *)objc_msgSend(a3, "copy");
    v7->_originalOutputFilter = (CIFilter *)a4;
    v7->_requiresFaceLandmarks = HIBYTE(v9);
    v7->_requiresDepthMap = v9;
  }
  return v7;
}

- (uint64_t)_ensureResourceRequirementsForFilters:(_BYTE *)a3 outputRequiresFaceLandmarks:(_BYTE *)a4 outputRequiresDepthMap:
{
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (result)
    {
      v5 = result;
      v6 = 0;
      v7 = 0;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(a2);
          v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "inputKeys");
          v11 = objc_msgSend(v10, "containsObject:", CFSTR("inputFaceLandmarkArray"));
          if ((objc_msgSend(v10, "containsObject:", CFSTR("inputDepthMap")) & 1) != 0
            || (objc_msgSend(v10, "containsObject:", CFSTR("inputDisparity")) & 1) != 0
            || (objc_msgSend(v10, "containsObject:", CFSTR("inputBlurMap")) & 1) != 0
            || objc_msgSend(v10, "containsObject:", CFSTR("inputShiftMap")))
          {
            v6 = 1;
          }
          v7 |= v11;
          ++v9;
        }
        while (v5 != v9);
        result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        v5 = result;
      }
      while (result);
    }
    else
    {
      v6 = 0;
      v7 = 0;
    }
    if (a3)
      *a3 = v7 & 1;
    if (a4)
      *a4 = v6 & 1;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWCoreImageFilterRendererParameters;
  -[BWCoreImageFilterRendererParameters dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFilters:originalOutputFilter:", self->_filters, self->_originalOutputFilter);
  *((_BYTE *)result + 24) = self->_requiresFaceLandmarks;
  *((_BYTE *)result + 25) = self->_requiresDepthMap;
  return result;
}

- (signed)type
{
  return 4;
}

- (int)prepareForRenderingWithInputVideoFormat:(id)a3
{
  return 0;
}

- (float)interpolationFractionComplete
{
  return 1.0;
}

- (void)setFilters:(id)a3
{
  __int16 v5;

  if (self->_filters != a3)
  {
    v5 = 0;
    -[BWCoreImageFilterRendererParameters _ensureResourceRequirementsForFilters:outputRequiresFaceLandmarks:outputRequiresDepthMap:]((uint64_t)self, a3, (_BYTE *)&v5 + 1, &v5);

    self->_filters = (NSArray *)objc_msgSend(a3, "copy");
    self->_requiresFaceLandmarks = HIBYTE(v5);
    self->_requiresDepthMap = v5;
  }
}

- (int)depthTypeForFilter:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(a3, "inputKeys");
  if (v4)
  {
    v5 = v4;
    if ((objc_msgSend(v4, "containsObject:", CFSTR("inputBlurMap")) & 1) != 0)
    {
      return 3;
    }
    else if (objc_msgSend(v5, "containsObject:", CFSTR("inputDisparity"))
           && ((objc_msgSend((id)objc_msgSend(a3, "name"), "isEqualToString:", CFSTR("CIPortraitEffectStage")) & 1) != 0
            || (objc_msgSend((id)objc_msgSend(a3, "name"), "isEqualToString:", CFSTR("CIPortraitEffectStageMono")) & 1) != 0))
    {
      return 2;
    }
    else
    {
      return objc_msgSend(v5, "containsObject:", CFSTR("inputDepthMap"));
    }
  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
    return 0;
  }
}

+ (BOOL)containsFilterRequiringFaceLandmarks:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(a3);
        v6 |= objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "inputKeys"), "containsObject:", CFSTR("inputFaceLandmarkArray"));
      }
      v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6 & 1;
}

- (NSArray)filters
{
  return self->_filters;
}

- (CIFilter)originalOutputFilter
{
  return self->_originalOutputFilter;
}

- (void)setOriginalOutputFilter:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (BOOL)requiresFaceLandmarks
{
  return self->_requiresFaceLandmarks;
}

- (BOOL)requiresDepthMap
{
  return self->_requiresDepthMap;
}

@end
