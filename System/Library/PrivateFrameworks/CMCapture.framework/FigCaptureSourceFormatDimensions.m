@implementation FigCaptureSourceFormatDimensions

- (FigCaptureSourceFormatDimensions)initWithDimensions:(id)a3 deferredPhotoProxyDimensions:(id)a4 isPrivate:(BOOL)a5 flavor:(int)a6 maxUpscalingDimensions:(id)a7
{
  FigCaptureSourceFormatDimensions *result;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)FigCaptureSourceFormatDimensions;
  result = -[FigCaptureSourceFormatDimensions init](&v13, sel_init);
  if (result)
  {
    result->_dimensions = ($470D365275581EF16070F5A11344F73E)a3;
    result->_deferredPhotoProxyDimensions = ($470D365275581EF16070F5A11344F73E)a4;
    result->_isPrivate = a5;
    result->_flavor = a6;
    result->_maxUpscalingDimensions = ($470D365275581EF16070F5A11344F73E)a7;
  }
  return result;
}

- ($2825F4736939C4A6D3AD43837233062D)dimensions
{
  $2825F4736939C4A6D3AD43837233062D dest;

  objc_copyStruct(&dest, &self->_dimensions, 8, 1, 0);
  return dest;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (int)flavor
{
  return self->_flavor;
}

+ (int)identifyResolutionFlavorFromDimensions:(id)a3 availableHighResStillImageDimensions:(id)a4
{
  void *v4;

  v4 = (void *)objc_msgSend(a1, "identifySourceFormatDimensionsFromDimensions:availableHighResStillImageDimensions:", a3, a4);
  if (v4)
    LODWORD(v4) = objc_msgSend(v4, "flavor");
  return (int)v4;
}

+ (id)identifySourceFormatDimensionsFromDimensions:(id)a3 availableHighResStillImageDimensions:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v13;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v8)
      objc_enumerationMutation(a4);
    v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
    if ((objc_msgSend(v10, "dimensionsAreEqualToDimensions:", a3) & 1) != 0)
      return v10;
    if (v7 == ++v9)
    {
      v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        goto LABEL_3;
      return 0;
    }
  }
}

- (BOOL)dimensionsAreEqualToDimensions:(id)a3
{
  return self->_dimensions.width == a3.var0 && self->_dimensions.height == a3.var1;
}

- ($2825F4736939C4A6D3AD43837233062D)deferredPhotoProxyDimensions
{
  $2825F4736939C4A6D3AD43837233062D dest;

  objc_copyStruct(&dest, &self->_deferredPhotoProxyDimensions, 8, 1, 0);
  return dest;
}

- (id)description
{
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  uint64_t width;
  uint64_t height;
  uint64_t v10;
  const __CFString *v11;

  if (FigCaptureVideoDimensionsAreValid(*(_QWORD *)&self->_deferredPhotoProxyDimensions))
    v3 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("proxy dims: %d x %d, "), self->_deferredPhotoProxyDimensions.width, self->_deferredPhotoProxyDimensions.height);
  else
    v3 = &stru_1E4928818;
  v4 = &stru_1E4928818;
  if (FigCaptureVideoDimensionsAreValid(*(_QWORD *)&self->_maxUpscalingDimensions))
    v4 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("max upscaling dims: %d x %d, "), self->_maxUpscalingDimensions.width, self->_maxUpscalingDimensions.height);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  width = self->_dimensions.width;
  height = self->_dimensions.height;
  v10 = FigCaptureSourceFormatHighResolutionFlavorToShortString(self->_flavor);
  if (self->_isPrivate)
    v11 = CFSTR(" *Private");
  else
    v11 = &stru_1E4928818;
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %p> %d x %d, %@%@flavor: %@%@"), v7, self, width, height, v3, v4, v10, v11);
}

+ (id)identifyDimensionsFromFlavor:(int)a3 availableHighResStillImageDimensions:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v13;
LABEL_3:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v8)
      objc_enumerationMutation(a4);
    v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
    if (objc_msgSend(v10, "flavor") == a3)
      return v10;
    if (v7 == ++v9)
    {
      v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        goto LABEL_3;
      return 0;
    }
  }
}

- ($2825F4736939C4A6D3AD43837233062D)maxUpscalingDimensions
{
  $2825F4736939C4A6D3AD43837233062D dest;

  objc_copyStruct(&dest, &self->_maxUpscalingDimensions, 8, 1, 0);
  return dest;
}

@end
