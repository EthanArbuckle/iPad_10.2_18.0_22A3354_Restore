@implementation CIBitmapContext

+ (id)context
{
  return objc_alloc_init(CIBitmapContext);
}

+ (id)contextWithOptions:(id)a3
{
  return -[CIBitmapContext initWithOptions:]([CIBitmapContext alloc], "initWithOptions:", a3);
}

+ (id)contextWithBitmap:(void *)a3 rowBytes:(int64_t)a4 bounds:(CGRect)a5 format:(int)a6
{
  return -[CIBitmapContext initWithBitmap:rowBytes:bounds:format:]([CIBitmapContext alloc], "initWithBitmap:rowBytes:bounds:format:", a3, a4, *(_QWORD *)&a6, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

+ (id)contextWithBitmap:(void *)a3 rowBytes:(int64_t)a4 bounds:(CGRect)a5 format:(int)a6 options:(id)a7
{
  return -[CIBitmapContext initWithBitmap:rowBytes:bounds:format:options:]([CIBitmapContext alloc], "initWithBitmap:rowBytes:bounds:format:options:", a3, a4, *(_QWORD *)&a6, a7, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (CIBitmapContext)init
{
  return -[CIBitmapContext initWithOptions:](self, "initWithOptions:", 0);
}

- (CIBitmapContext)initWithOptions:(id)a3
{
  void *v4;
  objc_super v6;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a3);
  objc_msgSend(v4, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("software_renderer"));
  v6.receiver = self;
  v6.super_class = (Class)CIBitmapContext;
  return -[CIContext initWithOptions:](&v6, sel_initWithOptions_, v4);
}

- (CIBitmapContext)initWithBitmap:(void *)a3 rowBytes:(int64_t)a4 bounds:(CGRect)a5 format:(int)a6
{
  return -[CIBitmapContext initWithBitmap:rowBytes:bounds:format:options:](self, "initWithBitmap:rowBytes:bounds:format:options:", a3, a4, *(_QWORD *)&a6, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (CIBitmapContext)initWithBitmap:(void *)a3 rowBytes:(int64_t)a4 bounds:(CGRect)a5 format:(int)a6 options:(id)a7
{
  uint64_t v7;
  double height;
  double width;
  double y;
  double x;
  void *v15;
  const char *v16;
  CIBitmapContext *v17;
  objc_super v19;

  v7 = *(_QWORD *)&a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v15 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a7);
  objc_msgSend(v15, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("software_renderer"));
  v19.receiver = self;
  v19.super_class = (Class)CIBitmapContext;
  v17 = -[CIContext initWithOptions:](&v19, sel_initWithOptions_, v15);
  if (v17
    && !-[CIBitmapContext setBitmap:rowBytes:bounds:format:](v17, "setBitmap:rowBytes:bounds:format:", a3, a4, CI::format_modernize(v7, (CI *)"-[CIBitmapContext initWithBitmap:rowBytes:bounds:format:options:]", v16), x, y, width, height))
  {

    return 0;
  }
  return v17;
}

- (BOOL)setBitmap:(void *)a3 rowBytes:(int64_t)a4 bounds:(CGRect)a5 format:(int)a6
{
  uint64_t v6;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CIBitmapContextPrivate *bcpriv;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  _BOOL4 v19;
  const char *v20;
  int v21;
  int v22;
  unint64_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  CIBitmapContextPrivate *v35;
  CIBitmapContextPrivate *v36;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v6 = *(_QWORD *)&a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  bcpriv = self->_bcpriv;
  if (bcpriv)
  {
    free(bcpriv);
    self->_bcpriv = 0;
  }
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  v39 = CGRectStandardize(v38);
  if (!a3)
    goto LABEL_5;
  v15 = v39.origin.x;
  v16 = v39.origin.y;
  v17 = v39.size.width;
  v18 = v39.size.height;
  if (CGRectIsEmpty(v39))
    goto LABEL_5;
  v40.origin.x = v15;
  v40.origin.y = v16;
  v40.size.width = v17;
  v40.size.height = v18;
  if (CGRectIsInfinite(v40) || v17 >= 1000000.0 || v18 >= 1000000.0)
  {
    v26 = ci_logger_api();
    v19 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
    if (!v19)
      return v19;
    -[CIBitmapContext setBitmap:rowBytes:bounds:format:].cold.1(v26, v27, v28, v29, v30, v31, v32, v33);
  }
  else
  {
    v21 = CI::format_modernize(v6, (CI *)"-[CIBitmapContext setBitmap:rowBytes:bounds:format:]", v20);
    if (v21 == 258)
      v22 = 259;
    else
      v22 = v21;
    if ((CI::format_is_supported_render_to_bitmap(v22) & 1) != 0)
    {
      v23 = CI::format_destination_rowbytes_requirement(v22);
      if (!(a4 % v23))
      {
        v35 = (CIBitmapContextPrivate *)malloc_type_malloc(0x38uLL, 0x10800402C4B44A1uLL);
        self->_bcpriv = v35;
        v35->var0 = a3;
        v36 = self->_bcpriv;
        v36->var1 = a4;
        v36->var2.origin.x = v15;
        v36->var2.origin.y = v16;
        v36->var2.size.width = v17;
        v36->var2.size.height = v18;
        v36->var3 = v22;
LABEL_5:
        LOBYTE(v19) = 1;
        return v19;
      }
      v24 = v23;
      v25 = ci_logger_api();
      v19 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
      if (!v19)
        return v19;
      -[CIBitmapContext setBitmap:rowBytes:bounds:format:].cold.2(v24, v25);
    }
    else
    {
      v34 = ci_logger_api();
      v19 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);
      if (!v19)
        return v19;
      -[CIBitmapContext setBitmap:rowBytes:bounds:format:].cold.3(v22);
    }
  }
  LOBYTE(v19) = 0;
  return v19;
}

- (void)dealloc
{
  CIBitmapContextPrivate *bcpriv;
  objc_super v4;

  bcpriv = self->_bcpriv;
  if (bcpriv)
  {
    free(bcpriv);
    self->_bcpriv = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CIBitmapContext;
  -[CIContext dealloc](&v4, sel_dealloc);
}

- (void)drawImage:(id)a3 inRect:(CGRect)a4 fromRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CGColorSpace *v32;
  CGColorSpaceModel Model;
  int var3;
  NSObject *v35;
  int v36;
  NSObject *v37;
  uint64_t v38;
  CIBitmapContextPrivate *bcpriv;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  if (!self->_bcpriv)
    return;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v46 = CGRectStandardize(a5);
  v11 = v46.origin.x;
  v12 = v46.origin.y;
  v13 = v46.size.width;
  v14 = v46.size.height;
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  v47 = CGRectStandardize(v46);
  v15 = v47.origin.x;
  v16 = v47.origin.y;
  v17 = v47.size.width;
  v18 = v47.size.height;
  v19 = -[CIContext _internalContext](self, "_internalContext");
  if (!a3)
    return;
  if (!v19)
    return;
  v48.origin.x = v15;
  v48.origin.y = v16;
  v48.size.width = v17;
  v48.size.height = v18;
  if (CGRectIsEmpty(v48))
    return;
  objc_msgSend(a3, "extent");
  v53.origin.x = v20;
  v53.origin.y = v21;
  v53.size.width = v22;
  v53.size.height = v23;
  v49.origin.x = v11;
  v49.origin.y = v12;
  v49.size.width = v13;
  v49.size.height = v14;
  v50 = CGRectIntersection(v49, v53);
  if (CGRectIsEmpty(v50))
    return;
  v51.origin.x = v11;
  v51.origin.y = v12;
  v51.size.width = v13;
  v51.size.height = v14;
  if (CGRectIsInfinite(v51)
    || (v52.origin.x = v15, v52.origin.y = v16, v52.size.width = v17, v52.size.height = v18, CGRectIsInfinite(v52)))
  {
    v24 = ci_logger_api();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[CIBitmapContext drawImage:inRect:fromRect:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);
    return;
  }
  v32 = -[CIContext _outputColorSpace](self, "_outputColorSpace");
  Model = CGColorSpaceGetModel(v32);
  var3 = self->_bcpriv->var3;
  if (!CI::format_is_luminance(var3))
  {
    if (Model != kCGColorSpaceModelRGB)
    {
      v32 = +[CIContext defaultRGBColorSpace](CIContext, "defaultRGBColorSpace");
      v37 = ci_logger_api();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        -[CIBitmapContext drawImage:inRect:fromRect:].cold.3(var3);
      goto LABEL_19;
    }
LABEL_16:
    v36 = 0;
    goto LABEL_20;
  }
  if (Model == kCGColorSpaceModelMonochrome)
    goto LABEL_16;
  v32 = +[CIContext defaultGrayColorSpace](CIContext, "defaultGrayColorSpace");
  v35 = ci_logger_api();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    -[CIBitmapContext drawImage:inRect:fromRect:].cold.2(var3);
LABEL_19:
  v36 = 1;
LABEL_20:
  v40 = v17 / v13;
  v41 = v17 / v13 * 0.0;
  v42 = v18 / v14 * 0.0;
  v43 = v18 / v14;
  v44 = v15 - v17 / v13 * v11 - v42 * v12;
  v45 = v16 - v41 * v11 - v18 / v14 * v12;
  v38 = objc_msgSend(a3, "imageByApplyingTransform:", &v40);
  bcpriv = self->_bcpriv;
  -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](self, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v38, bcpriv->var0, bcpriv->var1, bcpriv->var3, v32, bcpriv->var2.origin.x, bcpriv->var2.origin.y, bcpriv->var2.size.width, bcpriv->var2.size.height);
  if (v36)
    CGColorSpaceRelease(v32);
}

- (CGRect)bounds
{
  CIBitmapContextPrivate *bcpriv;
  double *p_x;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  bcpriv = self->_bcpriv;
  if (bcpriv)
    p_x = &bcpriv->var2.origin.x;
  else
    p_x = (double *)MEMORY[0x1E0C9D628];
  v4 = *p_x;
  v5 = p_x[1];
  v6 = p_x[2];
  v7 = p_x[3];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (void)setBitmap:(uint64_t)a3 rowBytes:(uint64_t)a4 bounds:(uint64_t)a5 format:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s bounds is too large\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)setBitmap:(uint64_t)a1 rowBytes:(NSObject *)a2 bounds:format:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136446466;
  v3 = "-[CIBitmapContext setBitmap:rowBytes:bounds:format:]";
  v4 = 2048;
  v5 = a1;
  _os_log_error_impl(&dword_1921E4000, a2, OS_LOG_TYPE_ERROR, "%{public}s rowBytes must be a multiple of %ld.\n", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_4_0();
}

- (void)setBitmap:(int)a1 rowBytes:bounds:format:.cold.3(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_5(a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1921E4000, v1, v2, "%{public}s format %{public}s is unsupported.\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)drawImage:(uint64_t)a3 inRect:(uint64_t)a4 fromRect:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s given an infinite rect", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)drawImage:(int)a1 inRect:fromRect:.cold.2(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_5(a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1921E4000, v1, v2, "%{public}s context's output colorspace can't be used with pixel format %{public}s. Using default grayscale output colorspace instead.\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)drawImage:(int)a1 inRect:fromRect:.cold.3(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_5(a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1921E4000, v1, v2, "%{public}s context's output colorspace can't be used with pixel format %{public}s. Using default RGB output colorspace instead.\n", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_2();
}

@end
