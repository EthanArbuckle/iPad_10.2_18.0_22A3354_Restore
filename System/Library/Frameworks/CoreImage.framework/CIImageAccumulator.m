@implementation CIImageAccumulator

- (CIImageAccumulator)init
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = ci_logger_api();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[CIImageAccumulator init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  return 0;
}

+ (CIImageAccumulator)imageAccumulatorWithExtent:(CGRect)a3 format:(int)a4 options:(id)a5
{
  return (CIImageAccumulator *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithExtent:format:options:", *(_QWORD *)&a4, a5, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

+ (CIImageAccumulator)imageAccumulatorWithExtent:(CGRect)extent format:(CIFormat)format
{
  return (CIImageAccumulator *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithExtent:format:", *(_QWORD *)&format, extent.origin.x, extent.origin.y, extent.size.width, extent.size.height);
}

+ (CIImageAccumulator)imageAccumulatorWithExtent:(CGRect)extent format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace
{
  return (CIImageAccumulator *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithExtent:format:colorSpace:", *(_QWORD *)&format, colorSpace, extent.origin.x, extent.origin.y, extent.size.width, extent.size.height);
}

- (CIImageAccumulator)initWithExtent:(CGRect)extent format:(CIFormat)format
{
  return -[CIImageAccumulator initWithExtent:format:options:](self, "initWithExtent:format:options:", *(_QWORD *)&format, 0, extent.origin.x, extent.origin.y, extent.size.width, extent.size.height);
}

- (CIImageAccumulator)initWithExtent:(CGRect)extent format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace
{
  uint64_t v5;
  double height;
  double width;
  double y;
  double x;
  const __CFString *v12;
  _QWORD v13[2];

  v5 = *(_QWORD *)&format;
  height = extent.size.height;
  width = extent.size.width;
  y = extent.origin.y;
  x = extent.origin.x;
  v13[1] = *MEMORY[0x1E0C80C00];
  if (colorSpace)
  {
    v12 = CFSTR("color_space");
    v13[0] = colorSpace;
    colorSpace = (CGColorSpaceRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  }
  return -[CIImageAccumulator initWithExtent:format:options:](self, "initWithExtent:format:options:", v5, colorSpace, x, y, width, height);
}

- (CIImageAccumulator)initWithExtent:(CGRect)a3 format:(int)a4 options:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CIImageAccumulator *v11;
  CGColorSpace *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v23;
  int v24;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  CIContext *v33;
  CIBlendKernel *v34;
  NSObject *v35;
  CI::ImageAccumulator *v36;
  BOOL v37;
  NSObject *v38;
  _BOOL4 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  objc_super v60;
  _QWORD v61[7];
  _BYTE v62[128];
  uint64_t v63;
  CGRect v64;
  CGRect v65;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v63 = *MEMORY[0x1E0C80C00];
  v60.receiver = self;
  v60.super_class = (Class)CIImageAccumulator;
  v11 = -[CIImageAccumulator init](&v60, sel_init);
  if (!v11)
    return v11;
  v12 = (CGColorSpace *)objc_msgSend(a5, "objectForKey:", CFSTR("color_space"));
  v64.origin.x = x;
  v64.origin.y = y;
  v64.size.width = width;
  v64.size.height = height;
  if (CGRectIsEmpty(v64))
  {
    v13 = ci_logger_api();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CIImageAccumulator initWithExtent:format:options:].cold.2(v13, v14, v15, v16, v17, v18, v19, v20);
LABEL_50:
    v47 = ci_logger_api();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      -[CIImageAccumulator initWithExtent:format:options:].cold.1(v47, v48, v49, v50, v51, v52, v53, v54);

    return 0;
  }
  if (a4 == 267 || a4 == 265 || a4 == 264)
    v23 = 266;
  else
    v23 = a4;
  if (v23 == 1800)
    v23 = 2056;
  if (v23 == 2824)
    v24 = 2056;
  else
    v24 = v23;
  if (v24 != 2312 && v24 != 2056 && v24 != 266)
  {
    v37 = CI::name_for_format(v24) == 0;
    v38 = ci_logger_api();
    v39 = os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
    if (v37)
    {
      if (v39)
        -[CIImageAccumulator initWithExtent:format:options:].cold.4(v38, v40, v41, v42, v43, v44, v45, v46);
    }
    else if (v39)
    {
      -[CIImageAccumulator initWithExtent:format:options:].cold.5();
    }
    goto LABEL_50;
  }
  v27 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v27, "setObject:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("kCIContextEnableBlending"));
  if (!v12)
    objc_msgSend(v27, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), CFSTR("working_color_space"));
  objc_msgSend(v27, "setObject:forKey:", CFSTR("CIImageAccumulator"), CFSTR("kCIContextName"));
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v61[0] = CFSTR("kCIContextCacheIntermediates");
  v61[1] = CFSTR("priority_request_low");
  v61[2] = CFSTR("priority_request_high");
  v61[3] = CFSTR("kCIContextUseMetalRenderer");
  v61[4] = CFSTR("quality");
  v61[5] = CFSTR("high_quality_downsample");
  v61[6] = CFSTR("kCIContextName");
  v28 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 7, 0);
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v57 != v30)
          objc_enumerationMutation(v28);
        v32 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
        if (objc_msgSend(a5, "valueForKey:", v32))
          objc_msgSend(v27, "setObject:forKey:", objc_msgSend(a5, "valueForKey:", v32), v32);
      }
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    }
    while (v29);
  }
  v33 = +[CIContext contextWithOptions:](CIContext, "contextWithOptions:", v27);
  if (!v33)
    goto LABEL_50;
  v34 = (CIBlendKernel *)objc_msgSend(a5, "objectForKey:", CFSTR("blend_kernel"));
  if (v34 && (-[CIBlendKernel isMemberOfClass:](v34, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
    v35 = ci_logger_api();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[CIImageAccumulator initWithExtent:format:options:].cold.3();
    v34 = 0;
  }
  v36 = (CI::ImageAccumulator *)operator new();
  v65.origin.x = x;
  v65.origin.y = y;
  v65.size.width = width;
  v65.size.height = height;
  CI::ImageAccumulator::ImageAccumulator(v36, v65, v12, v24, v33, v34);
  v11->_state = v36;
  return v11;
}

- (void)dealloc
{
  CI::ImageAccumulator *state;
  objc_super v4;

  state = (CI::ImageAccumulator *)self->_state;
  if (state)
  {
    CI::ImageAccumulator::~ImageAccumulator(state);
    MEMORY[0x194025AAC]();
  }
  v4.receiver = self;
  v4.super_class = (Class)CIImageAccumulator;
  -[CIImageAccumulator dealloc](&v4, sel_dealloc);
}

- (CGRect)extent
{
  double *state;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  state = (double *)self->_state;
  v3 = *state;
  v4 = state[1];
  v5 = state[2];
  v6 = state[3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CIFormat)format
{
  return *((_DWORD *)self->_state + 10);
}

- (CGColorSpace)colorSpace
{
  return (CGColorSpace *)*((_QWORD *)self->_state + 4);
}

- (CIImage)image
{
  return (CIImage *)CI::ImageAccumulator::get((CI::ImageAccumulator *)self->_state, 0);
}

- (void)setImage:(CIImage *)image
{
  -[CIImageAccumulator setImage:dirtyRect:](self, "setImage:dirtyRect:", image, *MEMORY[0x1E0C9D5E0], *(double *)(MEMORY[0x1E0C9D5E0] + 8), *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
}

- (void)setImage:(CIImage *)image dirtyRect:(CGRect)dirtyRect
{
  void *state;
  double height;
  double width;
  double y;
  double x;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  NSObject *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CIImage *v23;
  _QWORD block[5];
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  state = self->_state;
  if (image)
  {
    height = dirtyRect.size.height;
    width = dirtyRect.size.width;
    y = dirtyRect.origin.y;
    x = dirtyRect.origin.x;
    v11 = *(double *)state;
    v12 = *((double *)state + 1);
    v13 = *((double *)state + 2);
    v14 = *((double *)state + 3);
    if (!CGRectIsInfinite(dirtyRect))
    {
      v25.origin.x = x;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      if (!CGRectIsEmpty(v25))
      {
        v26.origin.x = x;
        v26.origin.y = y;
        v26.size.width = width;
        v26.size.height = height;
        v27 = CGRectStandardize(v26);
        x = ceil(v27.origin.x);
        y = ceil(v27.origin.y);
        v15 = floor(v27.origin.x + v27.size.width);
        v16 = floor(v27.origin.y + v27.size.height);
        if (v15 > x && v16 > y)
        {
          width = v15 - x;
          height = v16 - y;
        }
        else
        {
          x = *MEMORY[0x1E0C9D628];
          y = *(double *)(MEMORY[0x1E0C9D628] + 8);
          width = *(double *)(MEMORY[0x1E0C9D628] + 16);
          height = *(double *)(MEMORY[0x1E0C9D628] + 24);
        }
      }
    }
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    v32.origin.x = v11;
    v32.origin.y = v12;
    v32.size.width = v13;
    v32.size.height = v14;
    v29 = CGRectIntersection(v28, v32);
    v19 = v29.origin.x;
    v20 = v29.origin.y;
    v21 = v29.size.width;
    v22 = v29.size.height;
    -[CIImage extent](image, "extent");
    v33.origin.x = v19;
    v33.origin.y = v20;
    v33.size.width = v21;
    v33.size.height = v22;
    v23 = image;
    if (!CGRectContainsRect(v30, v33))
      v23 = -[CIImage imageByCompositingOverImage:](image, "imageByCompositingOverImage:", +[CIImage clearImage:](CIImage, "clearImage:", v19, v20, v21, v22));
    -[CIImage extent](image, "extent");
    v34.origin.x = v19;
    v34.origin.y = v20;
    v34.size.width = v21;
    v34.size.height = v22;
    if (CGRectContainsRect(v31, v34))
      v23 = -[CIImage imageByCroppingToRect:](v23, "imageByCroppingToRect:", v19, v20, v21, v22);
    CI::ImageAccumulator::set((CI::ImageAccumulator *)self->_state, v23);
  }
  else
  {
    v18 = *((_QWORD *)state + 17);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___ZN2CI16ImageAccumulator5clearEv_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = state;
    dispatch_async(v18, block);
  }
}

- (void)clear
{
  void *state;
  NSObject *v3;
  _QWORD block[5];

  state = self->_state;
  v3 = *((_QWORD *)state + 17);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___ZN2CI16ImageAccumulator5clearEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = state;
  dispatch_async(v3, block);
}

- (void)commitUpdates:(id)a3
{
  dispatch_sync(*((dispatch_queue_t *)self->_state + 17), &__block_literal_global_10);
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;

  -[CIImageAccumulator extent](self, "extent");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[CIImageAccumulator format](self, "format");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<CIImageAccumulator: %p extent [%g %g %g %g] format %s>"), self, v4, v6, v8, v10, CI::name_for_format(v11));
}

- (void)init
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s init is not a valid initializer for CIImageAccumulator", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithExtent:(uint64_t)a3 format:(uint64_t)a4 options:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s failed.\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithExtent:(uint64_t)a3 format:(uint64_t)a4 options:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s failed because the extent is empty.\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithExtent:format:options:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, v0, v1, "%{public}s blendKernel ignored (invalid value of type '%{public}s').\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithExtent:(uint64_t)a3 format:(uint64_t)a4 options:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s failed because the format is not supported.\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithExtent:format:options:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, v0, v1, "%{public}s failed because the format '%{public}s' is not supported.\n", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

@end
