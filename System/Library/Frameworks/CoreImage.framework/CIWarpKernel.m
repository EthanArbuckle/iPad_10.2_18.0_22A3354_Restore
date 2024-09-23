@implementation CIWarpKernel

+ (CIWarpKernel)kernelWithString:(NSString *)string
{
  NSObject *v5;
  CIWarpKernel *v6;
  NSString *v7;
  _QWORD v9[2];
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 138543362;
    v14 = objc_msgSend(a1, "description");
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithString\", "%{public}@", buf, 0xCu);
  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v10 = __33__CIWarpKernel_kernelWithString___block_invoke;
  v11 = &unk_1E2EC3CC8;
  v12 = a1;
  if (check_cikl_string(string, "+[CIWarpKernel kernelWithString:]"))
  {
    v6 = (CIWarpKernel *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithString:", string);
    if (v6)
    {
      v7 = (NSString *)objc_msgSend((id)objc_opt_class(), "description");
      CoreAnalytics(v7, CFSTR("kernelWithString"), 1);
    }
  }
  else
  {
    v6 = 0;
  }
  v10((uint64_t)v9);
  return v6;
}

void __33__CIWarpKernel_kernelWithString___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v2))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "description");
    v4 = 138543362;
    v5 = v3;
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithString\", "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (CIWarpKernel)initWithString:(id)a3
{
  if (check_cikl_string((NSString *)a3, "-[CIWarpKernel initWithString:]"))
    return (CIWarpKernel *)-[CIKernel _initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:](self, "_initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:", a3, 0, 0, 0);

  return 0;
}

- (id)_initWithReflection:(CIKernelReflection *)a3 constants:(id)a4 constantTypes:(id)a5
{
  void *v9;
  void **v10;
  int *var0;
  int *var1;
  int v13;
  CI::SerialStringArray *v14;
  char *v15;
  char *i;
  __int128 v17;
  std::string *v18;
  size_t size;
  CI::MetalKernel *v20;
  CI::Object *v21;
  id v22;
  std::string v24;

  v9 = (void *)MEMORY[0x194026220](self, a2);
  v10 = (void **)operator new();
  CI::SerialValArray<int>::SerialValArray((uint64_t)v10, (unint64_t)((char *)a3->var5.var1 - (char *)a3->var5.var0) >> 2);
  var0 = a3->var5.var0;
  var1 = a3->var5.var1;
  while (var0 != var1)
  {
    v13 = *var0++;
    CI::SerialValArray<int>::append(v10, v13);
  }
  v14 = (CI::SerialStringArray *)operator new();
  CI::SerialStringArray::SerialStringArray(v14, -1431655765 * ((unint64_t)((char *)a3->var6.var1 - (char *)a3->var6.var0) >> 3), 16);
  v15 = (char *)a3->var6.var0;
  for (i = (char *)a3->var6.var1; v15 != i; v15 += 24)
  {
    if (v15[23] < 0)
    {
      std::string::__init_copy_ctor_external(&v24, *(const std::string::value_type **)v15, *((_QWORD *)v15 + 1));
    }
    else
    {
      v17 = *(_OWORD *)v15;
      v24.__r_.__value_.__r.__words[2] = *((_QWORD *)v15 + 2);
      *(_OWORD *)&v24.__r_.__value_.__l.__data_ = v17;
    }
    if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v18 = &v24;
    else
      v18 = (std::string *)v24.__r_.__value_.__r.__words[0];
    if ((v24.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v24.__r_.__value_.__r.__words[2]);
    else
      size = v24.__r_.__value_.__l.__size_;
    CI::SerialStringArray::append(v14, (const char *)v18, size);
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v24.__r_.__value_.__l.__data_);
  }
  if (a3->var7)
  {
    v20 = (CI::MetalKernel *)operator new();
    CI::PrecompiledWarpKernel::PrecompiledWarpKernel(v20, a3->var2, (CIKernelLibrary *)a3->var7, a3->var3, a3->var4, 0, v10, (uint64_t)v14, a3->var8, a3->var1, (NSDictionary *)a4, (NSDictionary *)a5, a3->var12);
    v21 = (CI::MetalKernel *)((char *)v20 + 80);
  }
  else
  {
    v21 = (CI::Object *)operator new();
    CI::WarpKernel::WarpKernel((uint64_t)v21, a3->var2, a3->var3, a3->var4, 0, v10, (uint64_t)v14, a3->var8, a3->var1, 1);
  }
  v22 = -[CIKernel _initWithInternalRepresentation:](self, "_initWithInternalRepresentation:", v21);
  if (*((_BYTE *)v21 + 12))
    CI::Object::unref(v21);
  objc_autoreleasePoolPop(v9);
  return v22;
}

- (BOOL)perservesAlpha
{
  return 0;
}

- (BOOL)preservesRange
{
  return 1;
}

- (BOOL)canReduceOutputChannels
{
  return 1;
}

- (id)applyWithExtent:(CGRect)a3 roiCallback:(id)a4 arguments:(id)a5 options:(id)a6
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = ci_logger_api();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[CIWarpKernel applyWithExtent:roiCallback:arguments:options:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  return 0;
}

- (id)applyWithExtent:(CGRect)a3 roiCallback:(id)a4 arguments:(id)a5
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = ci_logger_api();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[CIWarpKernel applyWithExtent:roiCallback:arguments:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  return 0;
}

- (id)applyWithExtent:(CGRect)a3 roiCallback:(id)a4 inputImage:(id)a5 arguments:(id)a6 options:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *priv;
  int v17;
  uint64_t v18;
  int v19;
  CI::SerialObjectPtrArray *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int type;
  CI::Object *v25;
  uint64_t v26;
  CI::Object *v27;
  CIImage *v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  uint64_t v52;
  const char *v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  _BYTE v59[24];
  uint64_t v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v60 = *MEMORY[0x1E0C80C00];
  if (CGRectIsEmpty(a3))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  if (!a5)
    return +[CIImage emptyImage](CIImage, "emptyImage");
  objc_msgSend(a5, "extent");
  if (CGRectIsEmpty(v61))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  priv = self->super._priv;
  if ((*(unsigned int (**)(_QWORD *))(*priv + 16))(priv) == 63)
  {
    v17 = objc_msgSend(a6, "count");
    if (CI::Kernel::num_apply_arguments((CI::Kernel *)priv) == v17)
    {
      if (v17 < 1)
      {
LABEL_16:
        v20 = (CI::SerialObjectPtrArray *)operator new();
        CI::SerialObjectPtrArray::SerialObjectPtrArray(v20, v17 + 1);
        if (v17 >= 1)
        {
          v21 = 0;
          v22 = v17;
          do
          {
            v23 = (void *)objc_msgSend(a6, "objectAtIndexedSubscript:", v21);
            if (*((_BYTE *)priv + 12))
            {
              type = CI::KernelArguments::get_type((CI::KernelArguments *)(priv + 18), v21);
            }
            else if (v21 >= *((int *)priv + 5))
            {
              type = 0;
            }
            else
            {
              type = *(_DWORD *)(priv[9] + 4 * v21);
            }
            v25 = object_for_argument(v23, type);
            CI::SerialObjectPtrArray::append((uint64_t)v20, v25);
            if (v25)
              CI::Object::unref(v25);
            ++v21;
          }
          while (v22 != v21);
        }
        v26 = objc_msgSend(a5, "_internalRepresentation");
        if (!a4)
          a4 = (id)defaultROI;
        v27 = (CI::Object *)operator new();
        CI::WarpKernelImage::WarpKernelImage(v27, v26, priv, v20, a4, x, y, width, height);
        v28 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v27);
        CI::Object::unref(v27);
        if (CI_AUTOTEST_ROI() == 1)
        {
          -[CIWarpKernel autogenerateROI:args:arguments:extent:](self, "autogenerateROI:args:arguments:extent:", priv, v20, a6, x, y, width, height);
          v30 = v29;
          v32 = v31;
          v34 = v33;
          v36 = v35;
          -[CIImage extent](v28, "extent");
          -[CIImage regionOfInterestForImage:inRect:](v28, "regionOfInterestForImage:inRect:", a5);
          v38 = v37;
          v40 = v39;
          v42 = v41;
          v44 = v43;
          v62.origin.x = v30;
          v62.origin.y = v32;
          v62.size.width = v34;
          v62.size.height = v36;
          if (!CGRectIsNull(v62))
          {
            v63.origin.x = v38;
            v63.origin.y = v40;
            v63.size.width = v42;
            v63.size.height = v44;
            v64.origin.x = v30;
            v64.origin.y = v32;
            v64.size.width = v34;
            v64.size.height = v36;
            if (!CGRectContainsRect(v63, v64))
            {
              v45 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%g,%g %g x %g}"), *(_QWORD *)&v38, *(_QWORD *)&v40, *(_QWORD *)&v42, *(_QWORD *)&v44);
              v46 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%g,%g %g x %g}"), *(_QWORD *)&v30, *(_QWORD *)&v32, *(_QWORD *)&v34, *(_QWORD *)&v36);
              v47 = ci_logger_api();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              {
                v48 = priv[3];
                *(_DWORD *)buf = 136446978;
                v55 = "-[CIWarpKernel applyWithExtent:roiCallback:inputImage:arguments:options:]";
                v56 = 2082;
                v57 = v48;
                v58 = 2114;
                *(_QWORD *)v59 = v45;
                *(_WORD *)&v59[8] = 2114;
                *(_QWORD *)&v59[10] = v46;
                _os_log_error_impl(&dword_1921E4000, v47, OS_LOG_TYPE_ERROR, "%{public}s provided rect for kernel %{public}s is %{public}@ but should be at least %{public}@", buf, 0x2Au);
              }
            }
          }
        }
        return v28;
      }
      v18 = 0;
      while (1)
      {
        if (*((_BYTE *)priv + 12))
          v19 = CI::KernelArguments::get_type((CI::KernelArguments *)(priv + 18), v18);
        else
          v19 = v18 >= *((int *)priv + 5) ? 0 : *(_DWORD *)(priv[9] + 4 * v18);
        if ((verify_argument_type((void *)objc_msgSend(a6, "objectAtIndexedSubscript:", v18), v19, 0) & 1) == 0)
          break;
        if (v17 == ++v18)
          goto LABEL_16;
      }
      v51 = ci_logger_api();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      {
        v52 = priv[3];
        v53 = expected_argument_type(v19);
        objc_msgSend(a6, "objectAtIndexedSubscript:", v18);
        *(_DWORD *)buf = 136447234;
        v55 = "-[CIWarpKernel applyWithExtent:roiCallback:inputImage:arguments:options:]";
        v56 = 2082;
        v57 = v52;
        v58 = 1024;
        *(_DWORD *)v59 = v18;
        *(_WORD *)&v59[4] = 2082;
        *(_QWORD *)&v59[6] = v53;
        *(_WORD *)&v59[14] = 2114;
        *(_QWORD *)&v59[16] = objc_msgSend((id)objc_opt_class(), "description");
        _os_log_error_impl(&dword_1921E4000, v51, OS_LOG_TYPE_ERROR, "%{public}s type mismatch for kernel '%{public}s' parameter %d. %{public}sGot %{public}@.", buf, 0x30u);
      }
    }
    else
    {
      v50 = ci_logger_api();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        -[CIWarpKernel applyWithExtent:roiCallback:inputImage:arguments:options:].cold.1((CI::Kernel *)priv);
    }
  }
  else
  {
    v49 = ci_logger_api();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      -[CIWarpKernel applyWithExtent:roiCallback:inputImage:arguments:options:].cold.2();
  }
  return 0;
}

- (CIImage)applyWithExtent:(CGRect)extent roiCallback:(CIKernelROICallback)callback inputImage:(CIImage *)image arguments:(NSArray *)args
{
  return (CIImage *)-[CIWarpKernel applyWithExtent:roiCallback:inputImage:arguments:options:](self, "applyWithExtent:roiCallback:inputImage:arguments:options:", callback, image, args, 0, extent.origin.x, extent.origin.y, extent.size.width, extent.size.height);
}

- (id)generateMainFromWarpKernel:(void *)a3 args:(SerialObjectPtrArray *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int type;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  int var0;

  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithUTF8String:", *((_QWORD *)a3 + 4));
  objc_msgSend(v6, "insertString:atIndex:", CFSTR(",vec2 samplePoint"), objc_msgSend(v6, "rangeOfString:", CFSTR(")")));
  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", CFSTR("destCoord()"), CFSTR("samplePoint"), 2, 0, objc_msgSend(v6, "length"));
  objc_msgSend(v6, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nkernel vec4 autoROI_%s(__sample s,vec4 e,"), *((_QWORD *)a3 + 3)));
  if (a4->var0 < 2)
  {
    objc_msgSend(v6, "appendString:", CFSTR("  vec2 pt =("));
    objc_msgSend(v6, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)a3 + 3)));
    objc_msgSend(v6, "appendString:", CFSTR("("));
  }
  else
  {
    v7 = 0;
    var0 = a4->var0;
    v8 = (a4->var0 - 1);
    do
    {
      if (*((_BYTE *)a3 + 12))
      {
        type = CI::KernelArguments::get_type((CI::KernelArguments *)((char *)a3 + 144), v7);
      }
      else if (v7 >= *((int *)a3 + 5))
      {
        type = 0;
      }
      else
      {
        type = *(_DWORD *)(*((_QWORD *)a3 + 9) + 4 * v7);
      }
      v10 = v7 + 1;
      if (v8 - 1 == v7)
        v11 = ") {";
      else
        v11 = ",";
      objc_msgSend(v6, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s v%d%s"), off_1E2EC5468[type], v7++, v11));
    }
    while (v8 != v10);
    objc_msgSend(v6, "appendString:", CFSTR("  vec2 pt =("));
    objc_msgSend(v6, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)a3 + 3)));
    objc_msgSend(v6, "appendString:", CFSTR("("));
    v12 = 0;
    do
    {
      v13 = (v12 + 1);
      if ((_DWORD)v12 - var0 == -2)
        v14 = ",s.xy) - e.xy) / e.zw; return pt.xyxy; }";
      else
        v14 = ", ";
      objc_msgSend(v6, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("v%d%s"), v12, v14));
      v12 = v13;
    }
    while ((_DWORD)v13 - var0 != -1);
  }
  return v6;
}

- (id)generateGeneralKernelFromWarpKernel:(void *)a3 args:(SerialObjectPtrArray *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int type;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  int var0;

  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithUTF8String:", *((_QWORD *)a3 + 4));
  objc_msgSend(v6, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nkernel vec4 autoROI_%s(sampler s,vec4 e,"), *((_QWORD *)a3 + 3)));
  if (a4->var0 < 2)
  {
    objc_msgSend(v6, "appendString:", CFSTR("  vec2 pt = "));
    objc_msgSend(v6, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)a3 + 3)));
    objc_msgSend(v6, "appendString:", CFSTR("("));
  }
  else
  {
    v7 = 0;
    var0 = a4->var0;
    v8 = (a4->var0 - 1);
    do
    {
      if (*((_BYTE *)a3 + 12))
      {
        type = CI::KernelArguments::get_type((CI::KernelArguments *)((char *)a3 + 144), v7);
      }
      else if (v7 >= *((int *)a3 + 5))
      {
        type = 0;
      }
      else
      {
        type = *(_DWORD *)(*((_QWORD *)a3 + 9) + 4 * v7);
      }
      v10 = v7 + 1;
      v11 = ") {";
      if (v8 - 1 != v7)
        v11 = ",";
      objc_msgSend(v6, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s v%d%s"), off_1E2EC5468[type], v7++, v11));
    }
    while (v8 != v10);
    objc_msgSend(v6, "appendString:", CFSTR("  vec2 pt = "));
    objc_msgSend(v6, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *((_QWORD *)a3 + 3)));
    objc_msgSend(v6, "appendString:", CFSTR("("));
    v12 = 0;
    do
    {
      v13 = (v12 + 1);
      if ((_DWORD)v12 - var0 == -2)
        v14 = ");\n  ";
      else
        v14 = ",";
      objc_msgSend(v6, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("v%d%s"), v12, v14));
      v12 = v13;
    }
    while ((_DWORD)v13 - var0 != -1);
  }
  objc_msgSend(v6, "appendString:", CFSTR(" return ((samplerTransform(s, pt).xyxy)- e.xyxy) / e.zwzw; }"));
  return v6;
}

- (id)makeGridImage:(CGRect)a3 nx:(int)a4 ny:(int)a5
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v11;
  size_t v12;
  char *v13;
  char *v14;
  int v15;
  float v16;
  float v17;
  char *v18;
  double v19;
  float v20;
  uint64_t v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = 16 * a4;
  v12 = v11 * a5;
  v13 = (char *)malloc_type_malloc(v12, 0x9A4C69uLL);
  v14 = v13;
  if (a5 >= 1)
  {
    v15 = 0;
    v18 = v13 + 4;
    do
    {
      if (a4 >= 1)
      {
        v16 = height / (double)(a5 - 1);
        v19 = (float)(v16 * (float)v15);
        if (v15 - a5 == -1)
          v19 = height;
        v20 = y + v19;
        v17 = x + width;
        *((float *)v18 - 1) = v17;
        *(float *)v18 = v20;
        *(_QWORD *)(v18 + 4) = 0x3F80000000000000;
      }
      ++v15;
      v18 += 16;
    }
    while (v15 != a5);
  }
  v21 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v13, v12);
  free(v14);
  return +[CIImage imageWithBitmapData:bytesPerRow:size:format:colorSpace:](CIImage, "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v21, v11, 2312, objc_msgSend(MEMORY[0x1E0C99E38], "null"), (double)a4, (double)a5);
}

- (CGRect)autogenerateROI:(void *)a3 args:(SerialObjectPtrArray *)a4 arguments:(id)a5 extent:(CGRect)a6
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  __int128 v18;
  CIKernel *v19;
  CIFilter *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  CGColorSpace *v27;
  float *v28;
  int v29;
  float v30;
  float v31;
  float *v32;
  float v33;
  float v34;
  uint64_t v35;
  float v36;
  float v37;
  float v38;
  float v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  _QWORD v49[3];
  _QWORD v50[4];
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect result;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v50[3] = *MEMORY[0x1E0C80C00];
  if (CGRectIsInfinite(a6)
    || (v51.origin.x = x, v51.origin.y = y, v51.size.width = width, v51.size.height = height, CGRectIsEmpty(v51)))
  {
    v14 = *MEMORY[0x1E0C9D628];
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v16 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v17 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v48.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v48.c = v18;
    *(_OWORD *)&v48.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v19 = +[CIKernel kernelWithString:](CIKernel, "kernelWithString:", -[CIWarpKernel generateGeneralKernelFromWarpKernel:args:](self, "generateGeneralKernelFromWarpKernel:args:", a3, a4));
    v20 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIConstantColorGenerator"));
    -[CIFilter setDefaults](v20, "setDefaults");
    v21 = (void *)objc_msgSend((id)-[CIFilter valueForKey:](v20, "valueForKey:", CFSTR("outputImage")), "imageByCroppingToRect:", x, y, width, height);
    CGAffineTransformMakeTranslation(&v48, -x, -y);
    v47 = v48;
    v22 = (void *)objc_msgSend(v21, "imageByApplyingTransform:", &v47);
    CGAffineTransformMakeScale(&v46, 16.0 / width, 16.0 / height);
    v48 = v46;
    v45 = v46;
    v23 = (void *)objc_msgSend(v22, "imageByApplyingTransform:", &v45);
    CGAffineTransformMakeTranslation(&v46, -x, -y);
    v48 = v46;
    v44 = v46;
    CGAffineTransformScale(&v46, &v44, 16.0 / width, 16.0 / height);
    v48 = v46;
    v24 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a5);
    objc_msgSend(v24, "insertObject:atIndex:", v23, 0);
    objc_msgSend(v24, "insertObject:atIndex:", +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:", 0.0, 0.0, 16.0, 16.0), 1);
    objc_msgSend(v23, "extent");
    v25 = -[CIKernel applyWithExtent:roiCallback:arguments:](v19, "applyWithExtent:roiCallback:arguments:", &__block_literal_global_70, v24);
    v50[0] = MEMORY[0x1E0C9AAB0];
    v49[0] = CFSTR("software_renderer");
    v49[1] = CFSTR("working_format");
    v50[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2312);
    v49[2] = CFSTR("working_color_space");
    v50[2] = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v26 = +[CIContext _cachedContext:options:](CIContext, "_cachedContext:options:", CFSTR("CIWarpKernel-autoROI"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 3));
    v27 = +[CIContext defaultWorkingColorSpace](CIContext, "defaultWorkingColorSpace");
    v28 = (float *)malloc_type_malloc(0x1000uLL, 0x19BEE661uLL);
    objc_msgSend(v26, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v25, v28, 256, 2312, v27, 0.0, 0.0, 16.0, 16.0);
    v29 = 0;
    v30 = *v28;
    v31 = v28[1];
    v32 = v28;
    v33 = v31;
    v34 = *v28;
    do
    {
      v35 = 0;
      do
      {
        v36 = v32[v35];
        if (v36 <= 10000.0 && v36 >= -10000.0)
        {
          v37 = v32[v35 + 1];
          if (v37 <= 10000.0 && v37 >= -10000.0)
          {
            v38 = x + v36 * width;
            v39 = y + v37 * height;
            if (v34 <= v38)
              v34 = v38;
            if (v30 >= v38)
              v30 = v38;
            if (v33 <= v39)
              v33 = v39;
            if (v31 >= v39)
              v31 = v39;
          }
        }
        v35 += 4;
      }
      while ((_DWORD)(v35 * 4) != 256);
      v32 += 64;
      ++v29;
    }
    while (v29 != 16);
    v52.origin.x = v30;
    v52.origin.y = v31;
    v52.size.width = (float)(v34 - v30);
    v52.size.height = (float)(v33 - v31);
    v53 = CGRectInset(v52, -0.5, -0.5);
    v14 = v53.origin.x;
    v15 = v53.origin.y;
    v16 = v53.size.width;
    v17 = v53.size.height;
    free(v28);
  }
  v40 = v14;
  v41 = v15;
  v42 = v16;
  v43 = v17;
  result.size.height = v43;
  result.size.width = v42;
  result.origin.y = v41;
  result.origin.x = v40;
  return result;
}

- (void)applyWithExtent:(uint64_t)a3 roiCallback:(uint64_t)a4 arguments:(uint64_t)a5 options:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s is not supported.  Use applyWithExtent:roiCallback:inputImage:arguments:options: instead.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)applyWithExtent:(uint64_t)a3 roiCallback:(uint64_t)a4 arguments:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s is not supported.  Use applyWithExtent:roiCallback:inputImage:arguments: instead.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)applyWithExtent:(CI::Kernel *)a1 roiCallback:inputImage:arguments:options:.cold.1(CI::Kernel *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_13_1(a1);
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_9_2(&dword_1921E4000, v1, v2, "%{public}s argument count mismatch for kernel '%{public}s', expected %d but saw %d.", v3, v4, v5, v6, 2u);
  OUTLINED_FUNCTION_12_0();
}

- (void)applyWithExtent:roiCallback:inputImage:arguments:options:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  OUTLINED_FUNCTION_17_0(*MEMORY[0x1E0C80C00]);
  v2[0] = 136446466;
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v0, v1, "%{public}s kernel '%{public}s' is not a warp kernel.", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

@end
