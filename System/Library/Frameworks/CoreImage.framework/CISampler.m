@implementation CISampler

- (void)dealloc
{
  void (*priv)(_QWORD);
  objc_super v4;
  _QWORD v5[5];
  void (*v6[5])(_QWORD);

  priv = (void (*)(_QWORD))self->_priv;
  if (priv)
  {
    if (*((_DWORD *)priv + 18) > 0x3FFu)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __20__CISampler_dealloc__block_invoke_2;
      v5[3] = &__block_descriptor_40_e5_v8__0l;
      v5[4] = priv;
      CI::Object::performDeferredRoot(v5);
    }
    else
    {
      v6[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
      v6[1] = (void (*)(_QWORD))3221225472;
      v6[2] = __20__CISampler_dealloc__block_invoke;
      v6[3] = (void (*)(_QWORD))&__block_descriptor_40_e5_v8__0l;
      v6[4] = priv;
      CI::Object::performDeferred(v6);
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)CISampler;
  -[CISampler dealloc](&v4, sel_dealloc);
}

void __20__CISampler_dealloc__block_invoke(uint64_t a1)
{
  CI::Object *v1;

  v1 = *(CI::Object **)(a1 + 32);
  if (v1)
    CI::Object::unref(v1);
}

void __20__CISampler_dealloc__block_invoke_2(uint64_t a1)
{
  CI::Object *v1;

  v1 = *(CI::Object **)(a1 + 32);
  if (v1)
    CI::Object::unref(v1);
}

- (CISampler)init
{
  NSObject *v3;

  v3 = ci_logger_api();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[CISampler init].cold.1(v3);

  return 0;
}

- (CISampler)initWithImage:(CIImage *)im
{
  return -[CISampler initWithImage:options:](self, "initWithImage:options:", im, 0);
}

- (CISampler)initWithImage:(CIImage *)im keysAndValues:(id)key0
{
  va_list va;

  va_start(va, key0);
  return (CISampler *)-[CISampler _initWithImage:key0:vargs:](self, "_initWithImage:key0:vargs:", im, key0, va);
}

- (id)_initWithImage:(id)a3 key0:(id)a4 vargs:(char *)a5
{
  void *v8;
  __int128 v9;
  const void **v10;
  const void *v11;
  CFTypeID v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  id *v18;
  __int128 v20;
  uint8_t v21;
  _BYTE v22[7];
  char *v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v23 = a5;
  v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  if (a4)
  {
    *(_QWORD *)&v9 = 138543362;
    v20 = v9;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v13 = ci_logger_api();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[CISampler _initWithImage:key0:vargs:].cold.1(&v21, v22, v13);
        goto LABEL_13;
      }
      v10 = (const void **)v23;
      v23 += 8;
      v11 = *v10;
      if (*v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (v12 = CFGetTypeID(v11), v12 == CGColorSpaceGetTypeID()))
        {
          objc_msgSend(v8, "setValue:forKey:", v11, a4, v20);
        }
        else
        {
          v17 = ci_logger_api();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            v25 = a4;
            v15 = v17;
            v16 = "CISampler value for key '%{public}@' must be a NSObject or a CGColorSpaceRef. Skipping.";
            goto LABEL_16;
          }
        }
      }
      else
      {
        v14 = ci_logger_api();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v20;
          v25 = a4;
          v15 = v14;
          v16 = "CISampler value for key '%{public}@' is nil. Skipping.";
LABEL_16:
          _os_log_error_impl(&dword_1921E4000, v15, OS_LOG_TYPE_ERROR, v16, buf, 0xCu);
        }
      }
LABEL_13:
      v18 = (id *)v23;
      v23 += 8;
      a4 = *v18;
    }
    while (*v18);
  }
  return -[CISampler initWithImage:options:](self, "initWithImage:options:", a3, v8, v20);
}

- (CISampler)initWithImage:(CIImage *)im options:(NSDictionary *)dict
{
  CIImage *v6;
  double v7;
  double v8;
  NSObject *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  __int128 v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  id v28;
  CGColorSpace *v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  _OWORD v35[3];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[32];
  __int128 v40;
  uint64_t v41;
  CGRect v42;
  CGRect v43;

  v41 = *MEMORY[0x1E0C80C00];
  if (!im)
  {
LABEL_44:

    return 0;
  }
  v6 = im;
  objc_msgSend(-[NSDictionary valueForKey:](dict, "valueForKey:", CFSTR("blur")), "doubleValue");
  v8 = fmax(v7, 0.0);
  if (v8 > 0.0)
  {
    if (-[NSDictionary valueForKey:](dict, "valueForKey:", CFSTR("blur_format")))
    {
      v9 = ci_logger_api();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[CISampler initWithImage:options:]";
        _os_log_impl(&dword_1921E4000, v9, OS_LOG_TYPE_INFO, "%{public}s ignoring kCISamplerBlurFormat because it is not supported.", buf, 0xCu);
      }
    }
    v6 = -[CIImage imageByApplyingGaussianBlurWithSigma:](v6, "imageByApplyingGaussianBlurWithSigma:", v8);
  }
  v10 = -[NSDictionary valueForKey:](dict, "valueForKey:", CFSTR("wrap_mode"));
  if (v10)
  {
    v11 = v10;
    if (objc_msgSend(v10, "isEqual:", CFSTR("clamp")))
    {
      -[CIImage extent](v6, "extent");
      if (!CGRectIsInfinite(v42))
        v6 = -[CIImage imageByClampingToExtent](v6, "imageByClampingToExtent");
    }
    if (objc_msgSend(v11, "isEqual:", CFSTR("periodic")))
    {
      -[CIImage extent](v6, "extent");
      if (!CGRectIsInfinite(v43))
      {
        v12 = ci_logger_api();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = "-[CISampler initWithImage:options:]";
          _os_log_impl(&dword_1921E4000, v12, OS_LOG_TYPE_INFO, "%{public}s ignoring kCISamplerWrapPeriodic because it is not supported.", buf, 0xCu);
        }
      }
    }
  }
  v13 = -[NSDictionary valueForKey:](dict, "valueForKey:", CFSTR("filter_mode"));
  if (v13)
  {
    v14 = v13;
    if (objc_msgSend(v13, "isEqual:", CFSTR("nearest")))
    {
      v15 = -[CIImage imageBySamplingNearest](v6, "imageBySamplingNearest");
LABEL_18:
      v6 = (CIImage *)v15;
      goto LABEL_22;
    }
    if ((objc_msgSend(v14, "isEqual:", CFSTR("point")) & 1) == 0
      && objc_msgSend(v14, "isEqual:", CFSTR("linear")))
    {
      v15 = -[CIImage imageBySamplingLinear](v6, "imageBySamplingLinear");
      goto LABEL_18;
    }
  }
LABEL_22:
  v16 = -[NSDictionary valueForKey:](dict, "valueForKey:", CFSTR("affine_matrix"));
  if (!v16)
    goto LABEL_35;
  v17 = v16;
  v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v36 = *MEMORY[0x1E0C9BAA8];
  v37 = v18;
  v38 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = (const char *)objc_msgSend(v17, "objCType");
    if (!strcmp(v19, "{CGAffineTransform=dddddd}") || !strcmp(v19, "{?=dddddd}"))
    {
      objc_msgSend(v17, "getValue:size:", &v36, 48);
LABEL_29:
      v35[0] = v36;
      v35[1] = v37;
      v35[2] = v38;
      v6 = -[CIImage imageByApplyingTransform:](v6, "imageByApplyingTransform:", v35);
      goto LABEL_35;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = 0u;
      memset(buf, 0, sizeof(buf));
      objc_msgSend(v17, "transformStruct");
      v36 = *(_OWORD *)buf;
      v37 = *(_OWORD *)&buf[16];
      v38 = v40;
      goto LABEL_29;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v17, "count") == 6)
    {
      objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", 0), "doubleValue");
      *(_QWORD *)&v36 = v20;
      objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", 1), "doubleValue");
      *((_QWORD *)&v36 + 1) = v21;
      objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", 2), "doubleValue");
      *(_QWORD *)&v37 = v22;
      objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", 3), "doubleValue");
      *((_QWORD *)&v37 + 1) = v23;
      objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", 4), "doubleValue");
      *(_QWORD *)&v38 = v24;
      objc_msgSend((id)objc_msgSend(v17, "objectAtIndex:", 5), "doubleValue");
      *((_QWORD *)&v38 + 1) = v25;
      goto LABEL_29;
    }
  }
  v26 = ci_logger_api();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = objc_msgSend(v17, "description");
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "-[CISampler initWithImage:options:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v27;
    _os_log_impl(&dword_1921E4000, v26, OS_LOG_TYPE_INFO, "%{public}s ignoring kCISamplerAffineMatrix value because it is not a valid object '%{public}@'.", buf, 0x16u);
  }
LABEL_35:
  v28 = -[NSDictionary valueForKey:](dict, "valueForKey:", CFSTR("color_space"));
  if (v28)
  {
    v30 = v28;
    if (CI::ColorSpace_is_RGB_and_supports_output((_BOOL8)v28, v29))
    {
      v6 = -[CIImage imageByColorMatchingWorkingSpaceToColorSpace:](v6, "imageByColorMatchingWorkingSpaceToColorSpace:", v30);
    }
    else
    {
      v31 = ci_logger_api();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = "-[CISampler initWithImage:options:]";
        _os_log_impl(&dword_1921E4000, v31, OS_LOG_TYPE_INFO, "%{public}s ignoring kCISamplerColorSpace value because it is not an RGB CGColorSpaceRef that supports output.", buf, 0xCu);
      }
    }
  }
  if (!v6)
    goto LABEL_44;
  v32 = -[CIImage _internalRepresentation](v6, "_internalRepresentation");
  v33 = (void *)v32;
  if (v32)
    CI::Object::ref(v32);
  self->_priv = v33;
  return self;
}

+ (CISampler)samplerWithImage:(CIImage *)im
{
  if (im)
    return -[CISampler initWithImage:]([CISampler alloc], "initWithImage:", im);
  else
    return 0;
}

+ (CISampler)samplerWithImage:(CIImage *)im keysAndValues:(id)key0
{
  va_list va;

  va_start(va, key0);
  if (im)
    return (CISampler *)-[CISampler _initWithImage:key0:vargs:]([CISampler alloc], "_initWithImage:key0:vargs:", im, key0, va);
  else
    return 0;
}

+ (CISampler)samplerWithImage:(CIImage *)im options:(NSDictionary *)dict
{
  if (im)
    return -[CISampler initWithImage:options:]([CISampler alloc], "initWithImage:options:", im, dict);
  else
    return 0;
}

- (void)_internalRepresentation
{
  return self->_priv;
}

- (CIFilterShape)definition
{
  -[CISampler extent](self, "extent");
  return +[CIFilterShape shapeWithRect:](CIFilterShape, "shapeWithRect:");
}

- (id)opaqueShape
{
  if ((*(unsigned int (**)(void *, SEL))(*(_QWORD *)self->_priv + 128))(self->_priv, a2))
    return -[CISampler definition](self, "definition");
  else
    return 0;
}

- (CGRect)extent
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  (*(void (**)(void *))(*(_QWORD *)self->_priv + 88))(self->_priv);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)wrapMode
{
  return 0;
}

- (void)colorSpace
{
  return (void *)(*(uint64_t (**)(void *))(*(_QWORD *)self->_priv + 240))(self->_priv);
}

- (id)description
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGRect v12;
  CGRect v13;

  -[CISampler extent](self, "extent");
  x = v12.origin.x;
  y = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  if (CGRectIsInfinite(v12))
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<CISampler: %p extent [infinite]>"), self, v8, v9, v10, v11);
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (CGRectIsEmpty(v13))
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<CISampler: %p extent [empty]>"), self, v8, v9, v10, v11);
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<CISampler: %p extent [%g %g %g %g]>"), self, *(_QWORD *)&x, *(_QWORD *)&y, *(_QWORD *)&width, *(_QWORD *)&height);
}

- (id)debugDescription
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__CISampler_debugDescription__block_invoke;
  v3[3] = &unk_1E2EC2F58;
  v3[4] = self;
  return (id)(id)stream_to_string((uint64_t)v3);
}

size_t __29__CISampler_debugDescription__block_invoke(uint64_t a1, FILE *a2)
{
  fprintf(a2, "<CISampler: %p>\n", *(const void **)(a1 + 32));
  CI::Image::print_graph(*(CI::Image **)(*(_QWORD *)(a1 + 32) + 8), a2);
  return fwrite("\n\n", 2uLL, 1uLL, a2);
}

- (void)init
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136446210;
  v2 = "-[CISampler init]";
  _os_log_error_impl(&dword_1921E4000, log, OS_LOG_TYPE_ERROR, "%{public}s init is not a valid initializer for CISampler", (uint8_t *)&v1, 0xCu);
}

- (void)_initWithImage:(uint8_t *)buf key0:(_BYTE *)a2 vargs:(os_log_t)log .cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1921E4000, log, OS_LOG_TYPE_ERROR, "CISampler option key must be a NSString. Skipping.", buf, 2u);
}

@end
