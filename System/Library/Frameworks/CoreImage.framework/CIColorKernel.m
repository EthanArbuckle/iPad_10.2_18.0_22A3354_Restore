@implementation CIColorKernel

+ (CIColorKernel)kernelWithString:(NSString *)string
{
  NSObject *v5;
  CIColorKernel *v6;
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
  v10 = __34__CIColorKernel_kernelWithString___block_invoke;
  v11 = &unk_1E2EC3CC8;
  v12 = a1;
  if (check_cikl_string(string, "+[CIColorKernel kernelWithString:]"))
  {
    v6 = (CIColorKernel *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithString:", string);
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

void __34__CIColorKernel_kernelWithString___block_invoke(uint64_t a1)
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

- (CIColorKernel)initWithString:(id)a3
{
  if (check_cikl_string((NSString *)a3, "-[CIColorKernel initWithString:]"))
    return (CIColorKernel *)-[CIKernel _initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:](self, "_initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:", a3, 0, 0, 0);

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
  *(_OWORD *)&v24.__r_.__value_.__l.__data_ = *(_OWORD *)&a3->var10;
  if (a3->var7)
  {
    v20 = (CI::MetalKernel *)operator new();
    CI::PrecompiledColorKernel::PrecompiledColorKernel(v20, a3->var2, (CIKernelLibrary *)a3->var7, a3->var3, a3->var4, 0, v10, (uint64_t)v14, a3->var8, a3->var1, a3->var9, (NSDictionary *)a4, (NSDictionary *)a5, (uint64_t *)&v24, a3->var12);
    v21 = (CI::MetalKernel *)((char *)v20 + 80);
  }
  else
  {
    v21 = (CI::Object *)operator new();
    CI::ColorKernel::ColorKernel((uint64_t)v21, a3->var2, a3->var3, a3->var4, 0, v10, (uint64_t)v14, a3->var8, a3->var1, a3->var9, (uint64_t *)&v24, a3->var13, 1);
  }
  v22 = -[CIKernel _initWithInternalRepresentation:](self, "_initWithInternalRepresentation:", v21);
  if (*((_BYTE *)v21 + 12))
    CI::Object::unref(v21);
  objc_autoreleasePoolPop(v9);
  return v22;
}

- (BOOL)perservesAlpha
{
  CI::Kernel *priv;

  priv = (CI::Kernel *)self->super._priv;
  return (int)CI::Kernel::num_image_arguments(priv) >= 1 && *((_BYTE *)priv + 162) != 0;
}

- (void)setPerservesAlpha:(BOOL)a3
{
  CI::Kernel *priv;

  priv = (CI::Kernel *)self->super._priv;
  if ((int)CI::Kernel::num_image_arguments(priv) >= 1)
    CI::Kernel::set_preserves_alpha((uint64_t)priv, a3);
}

- (BOOL)preservesRange
{
  CI::Kernel *priv;

  priv = (CI::Kernel *)self->super._priv;
  return (int)CI::Kernel::num_image_arguments(priv) >= 1 && *((_BYTE *)priv + 163) != 0;
}

- (void)setPreservesRange:(BOOL)a3
{
  CI::Kernel *priv;

  priv = (CI::Kernel *)self->super._priv;
  if ((int)CI::Kernel::num_image_arguments(priv) >= 1)
    CI::Kernel::set_preserves_range((uint64_t)priv, a3);
}

- (BOOL)canReduceOutputChannels
{
  CI::Kernel *priv;

  priv = (CI::Kernel *)self->super._priv;
  return (int)CI::Kernel::num_image_arguments(priv) >= 1 && *((_BYTE *)priv + 160) != 0;
}

- (void)setCanReduceOutputChannels:(BOOL)a3
{
  CI::Kernel *priv;

  priv = (CI::Kernel *)self->super._priv;
  if ((int)CI::Kernel::num_image_arguments(priv) >= 1)
    CI::Kernel::set_can_reduce_output_channels((uint64_t)priv, a3);
}

- (id)applyWithExtent:(CGRect)a3 roiCallback:(id)a4 arguments:(id)a5 options:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  NSObject *v13;
  int v15;
  const char *v16;
  uint64_t v17;
  CGRect v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v18.origin.x = (*((double (**)(id, _QWORD, CGPoint, __n128, CGSize, __n128))a4 + 2))(a4, 0, a3.origin, *(__n128 *)&a3.origin.y, a3.size, *(__n128 *)&a3.size.height);
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    if (!CGRectEqualToRect(v18, v19))
    {
      v13 = ci_logger_api();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v15 = 136446210;
        v16 = "-[CIColorKernel applyWithExtent:roiCallback:arguments:options:]";
        _os_log_impl(&dword_1921E4000, v13, OS_LOG_TYPE_INFO, "%{public}s ignores callback and is not recomended.  Use applyWithExtent:arguments:options: instead.", (uint8_t *)&v15, 0xCu);
      }
    }
  }
  return -[CIColorKernel applyWithExtent:arguments:options:](self, "applyWithExtent:arguments:options:", a5, a6, x, y, width, height);
}

- (id)applyWithExtent:(CGRect)a3 roiCallback:(id)a4 arguments:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  NSObject *v11;
  int v13;
  const char *v14;
  uint64_t v15;
  CGRect v16;
  CGRect v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v16.origin.x = (*((double (**)(id, _QWORD, CGPoint, __n128, CGSize, __n128))a4 + 2))(a4, 0, a3.origin, *(__n128 *)&a3.origin.y, a3.size, *(__n128 *)&a3.size.height);
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    if (!CGRectEqualToRect(v16, v17))
    {
      v11 = ci_logger_api();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v13 = 136446210;
        v14 = "-[CIColorKernel applyWithExtent:roiCallback:arguments:]";
        _os_log_impl(&dword_1921E4000, v11, OS_LOG_TYPE_INFO, "%{public}s ignores callback and is not recomended.  Use applyWithExtent:arguments: instead.", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  return -[CIColorKernel applyWithExtent:arguments:](self, "applyWithExtent:arguments:", a5, x, y, width, height);
}

- (id)applyWithExtent:(CGRect)a3 arguments:(id)a4 options:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  char *priv;
  int v14;
  uint64_t i;
  int type;
  NSObject *v17;
  NSObject *v18;
  CI::SerialObjectPtrArray *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  CI::Object *v24;
  uint64_t v25;
  uint64_t v26;
  float v27;
  float v28;
  CI::Object *v29;
  CIImage *v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  const char *v39;
  int v40;
  const char *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  int v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;
  CGRect v51;
  CGRect v52;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v50 = *MEMORY[0x1E0C80C00];
  if (CGRectIsEmpty(a3))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  priv = (char *)self->super._priv;
  if ((*(unsigned int (**)(char *))(*(_QWORD *)priv + 16))(priv) != 62)
  {
    v17 = ci_logger_api();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CIColorKernel applyWithExtent:arguments:options:].cold.4();
    return 0;
  }
  v14 = objc_msgSend(a4, "count");
  if (CI::Kernel::num_apply_arguments((CI::Kernel *)priv) != v14)
  {
    v18 = ci_logger_api();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[CIColorKernel applyWithExtent:arguments:options:].cold.3((CI::Kernel *)priv);
    return 0;
  }
  if (v14 >= 1)
  {
    for (i = 0; v14 != i; ++i)
    {
      if (priv[12])
      {
        type = CI::KernelArguments::get_type((CI::KernelArguments *)(priv + 144), i);
      }
      else if (i >= *((int *)priv + 5))
      {
        type = 0;
      }
      else
      {
        type = *(_DWORD *)(*((_QWORD *)priv + 9) + 4 * i);
      }
      if ((*(uint64_t (**)(char *))(*(_QWORD *)priv + 72))(priv)
        && !*((_QWORD *)priv + 4)
        && (type == 15 || type == 8)
        && ((objc_msgSend(a4, "objectAtIndexedSubscript:", i), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
         || (objc_msgSend(a4, "objectAtIndexedSubscript:", i), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
      {
        CI::Kernel::set_argument_type((uint64_t *)priv, i, 1);
        CI::Kernel::set_half_color_inputs((uint64_t)priv, type == 15);
      }
      else if ((verify_argument_type((void *)objc_msgSend(a4, "objectAtIndexedSubscript:", i), type, 1) & 1) == 0)
      {
        v36 = ci_logger_api();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          v38 = *((_QWORD *)priv + 3);
          v39 = expected_argument_type(type);
          objc_msgSend(a4, "objectAtIndexedSubscript:", i);
          v40 = 136447234;
          v41 = "-[CIColorKernel applyWithExtent:arguments:options:]";
          v42 = 2082;
          v43 = v38;
          v44 = 1024;
          v45 = i;
          v46 = 2082;
          v47 = v39;
          v48 = 2114;
          v49 = objc_msgSend((id)objc_opt_class(), "description");
          _os_log_error_impl(&dword_1921E4000, v36, OS_LOG_TYPE_ERROR, "%{public}s type mismatch for kernel '%{public}s' parameter %d. %{public}sGot %{public}@.", (uint8_t *)&v40, 0x30u);
        }
        return 0;
      }
    }
  }
  v19 = (CI::SerialObjectPtrArray *)operator new();
  CI::SerialObjectPtrArray::SerialObjectPtrArray(v19, v14);
  if (v14 >= 1)
  {
    v20 = 0;
    v21 = v14;
    while (1)
    {
      v22 = (void *)objc_msgSend(a4, "objectAtIndexedSubscript:", v20);
      if (priv[12])
        break;
      if (v20 < *((int *)priv + 5))
      {
        v23 = *(_DWORD *)(*((_QWORD *)priv + 9) + 4 * v20);
LABEL_32:
        if (v23 == 15 || v23 == 8)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v22 = (void *)objc_msgSend(v22, "imageByClampingToExtent");
            v23 = 1;
          }
        }
        goto LABEL_37;
      }
      v23 = 0;
LABEL_37:
      v24 = object_for_argument(v22, v23);
      CI::SerialObjectPtrArray::append((uint64_t)v19, v24);
      if (v24)
        CI::Object::unref(v24);
      if (v21 == ++v20)
        goto LABEL_40;
    }
    v23 = CI::KernelArguments::get_type((CI::KernelArguments *)(priv + 144), v20);
    goto LABEL_32;
  }
LABEL_40:
  v25 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("kCIImageAlphaOne")), "BOOLValue");
  v26 = -[CIKernel _outputFormatUsingDictionary:andKernel:](self, "_outputFormatUsingDictionary:andKernel:", a5, priv);
  objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("kCIImageContentHeadroom")), "floatValue");
  v28 = v27;
  v29 = (CI::Object *)operator new();
  CI::ColorKernelImage::ColorKernelImage(v29, priv, v19, 0, v25, v26, x, y, width, height, v28);
  v30 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v29);
  CI::Object::unref(v29);
  if (priv[162])
  {
    if (CI::Kernel::num_image_arguments((CI::Kernel *)priv))
    {
      objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", (int)CI::Kernel::index_of_first_image_argument((CI::Kernel *)priv)), "extent");
      v52.origin.x = v31;
      v52.origin.y = v32;
      v52.size.width = v33;
      v52.size.height = v34;
      v51.origin.x = x;
      v51.origin.y = y;
      v51.size.width = width;
      v51.size.height = height;
      if (!CGRectEqualToRect(v51, v52))
      {
        v35 = ci_logger_api();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          -[CIColorKernel applyWithExtent:arguments:options:].cold.2();
      }
    }
    else
    {
      v37 = ci_logger_api();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        -[CIColorKernel applyWithExtent:arguments:options:].cold.1();
    }
  }
  return v30;
}

- (CIImage)applyWithExtent:(CGRect)extent arguments:(NSArray *)args
{
  return (CIImage *)-[CIColorKernel applyWithExtent:arguments:options:](self, "applyWithExtent:arguments:options:", args, 0, extent.origin.x, extent.origin.y, extent.size.width, extent.size.height);
}

+ (id)SDOFV2MetalKernelNamed:(id)a3
{
  if (SDOFV2MetalLib::onceToken != -1)
    dispatch_once(&SDOFV2MetalLib::onceToken, &__block_literal_global_15);
  if (SDOFV2MetalLib::data)
    return +[CIKernel kernelWithFunctionName:fromMetalLibraryData:error:](CIColorKernel, "kernelWithFunctionName:fromMetalLibraryData:error:", a3, SDOFV2MetalLib::data, 0);
  else
    return 0;
}

+ (id)SDOFV3MetalKernelNamed:(id)a3
{
  if (SDOFV3MetalLib::onceToken != -1)
    dispatch_once(&SDOFV3MetalLib::onceToken, &__block_literal_global_26_1);
  if (SDOFV3MetalLib::data)
    return +[CIKernel kernelWithFunctionName:fromMetalLibraryData:error:](CIColorKernel, "kernelWithFunctionName:fromMetalLibraryData:error:", a3, SDOFV3MetalLib::data, 0);
  else
    return 0;
}

- (void)applyWithExtent:arguments:options:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_15_1(&dword_1921E4000, v0, v1, "%{public}s kernel '%{public}s' specified 'preservesAlpha' but has no inputs.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)applyWithExtent:arguments:options:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_15_1(&dword_1921E4000, v0, v1, "%{public}s kernel '%{public}s' specified 'preservesAlpha' but extent is not the same as the extent of the first input image.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)applyWithExtent:(CI::Kernel *)a1 arguments:options:.cold.3(CI::Kernel *a1)
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

- (void)applyWithExtent:arguments:options:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];

  OUTLINED_FUNCTION_17_0(*MEMORY[0x1E0C80C00]);
  v2[0] = 136446466;
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v0, v1, "%{public}s kernel '%{public}s' is not a color kernel.", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

@end
