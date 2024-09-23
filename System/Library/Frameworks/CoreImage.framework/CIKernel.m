@implementation CIKernel

- (id)applyWithExtent:(CGRect)a3 roiCallback:(id)a4 arguments:(id)a5 options:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  char *priv;
  int v16;
  uint64_t i;
  int type;
  NSObject *v19;
  CI::SerialObjectPtrArray *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  CI::Object *v25;
  int v26;
  int v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  void *v37;
  _QWORD *v38;
  int64_t v39;
  unint64_t v40;
  int64_t v41;
  unint64_t v42;
  char *v43;
  double *v44;
  char *v45;
  __int128 v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  unsigned int v60;
  uint64_t v61;
  double v62;
  unsigned int v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  CIImage *v72;
  NSObject *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  unsigned int v78;
  uint64_t v79;
  double v80;
  unsigned int v81;
  void *v82;
  const char *v83;
  id v84;
  void *__p[3];
  int v86;
  __int16 v87;
  const char *v88;
  __int16 v89;
  uint64_t v90;
  uint64_t v91;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v91 = *MEMORY[0x1E0C80C00];
  if (CGRectIsEmpty(a3))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  priv = (char *)self->_priv;
  v16 = objc_msgSend(a5, "count");
  if (CI::Kernel::num_apply_arguments((CI::Kernel *)priv) != v16)
  {
    v19 = ci_logger_api();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[CIKernel applyWithExtent:roiCallback:arguments:options:].cold.2((CI::Kernel *)priv);
    return 0;
  }
  v84 = a4;
  if (v16 >= 1)
  {
    for (i = 0; v16 != i; ++i)
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
        && (objc_msgSend(a5, "objectAtIndexedSubscript:", i, v84), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        CI::Kernel::set_argument_type((uint64_t *)priv, i, 1);
        CI::Kernel::set_half_color_inputs((uint64_t)priv, type == 15);
      }
      else if ((verify_argument_type((void *)objc_msgSend(a5, "objectAtIndexedSubscript:", i, v84), type, 0) & 1) == 0)
      {
        v73 = ci_logger_api();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
        {
          v82 = (void *)*((_QWORD *)priv + 3);
          v83 = expected_argument_type(type);
          objc_msgSend(a5, "objectAtIndexedSubscript:", i);
          LODWORD(__p[0]) = 136447234;
          *(void **)((char *)__p + 4) = "-[CIKernel applyWithExtent:roiCallback:arguments:options:]";
          WORD2(__p[1]) = 2082;
          *(void **)((char *)&__p[1] + 6) = v82;
          HIWORD(__p[2]) = 1024;
          v86 = i;
          v87 = 2082;
          v88 = v83;
          v89 = 2114;
          v90 = objc_msgSend((id)objc_opt_class(), "description");
          _os_log_error_impl(&dword_1921E4000, v73, OS_LOG_TYPE_ERROR, "%{public}s type mismatch for kernel '%{public}s' parameter %d. %{public}sGot %{public}@.", (uint8_t *)__p, 0x30u);
        }
        return 0;
      }
    }
  }
  v20 = (CI::SerialObjectPtrArray *)operator new();
  CI::SerialObjectPtrArray::SerialObjectPtrArray(v20, v16);
  memset(__p, 0, sizeof(__p));
  if (v16 <= 0)
    goto LABEL_68;
  v21 = 0;
  v22 = v16;
  do
  {
    v23 = (void *)objc_msgSend(a5, "objectAtIndexedSubscript:", v21, v84);
    if (priv[12])
    {
      v24 = CI::KernelArguments::get_type((CI::KernelArguments *)(priv + 144), v21);
    }
    else if (v21 >= *((int *)priv + 5))
    {
      v24 = 0;
    }
    else
    {
      v24 = *(_DWORD *)(*((_QWORD *)priv + 9) + 4 * v21);
    }
    v25 = object_for_argument(v23, v24);
    if (v25)
    {
      CI::SerialObjectPtrArray::append((uint64_t)v20, v25);
      if (priv[12])
      {
        v26 = CI::KernelArguments::get_type((CI::KernelArguments *)(priv + 144), v21);
      }
      else
      {
        if (v21 >= *((int *)priv + 5))
          goto LABEL_37;
        v26 = *(_DWORD *)(*((_QWORD *)priv + 9) + 4 * v21);
      }
      if (v26 == 2)
      {
LABEL_40:
        v28 = (*(double (**)(CI::Object *))(*(_QWORD *)v25 + 88))(v25);
        v32 = v28;
        v33 = v29;
        v34 = v30;
        v35 = v31;
        v36 = __p[1];
        if (__p[1] >= __p[2])
        {
          v38 = __p[0];
          v39 = ((char *)__p[1] - (char *)__p[0]) >> 5;
          v40 = v39 + 1;
          if ((unint64_t)(v39 + 1) >> 59)
            abort();
          v41 = (char *)__p[2] - (char *)__p[0];
          if (((char *)__p[2] - (char *)__p[0]) >> 4 > v40)
            v40 = v41 >> 4;
          if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFE0)
            v42 = 0x7FFFFFFFFFFFFFFLL;
          else
            v42 = v40;
          if (v42)
          {
            v43 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<CI::SoftwareDAGDescriptor::ArgumentInfo>>((uint64_t)&__p[2], v42);
            v38 = __p[0];
            v36 = __p[1];
          }
          else
          {
            v43 = 0;
          }
          v44 = (double *)&v43[32 * v39];
          *v44 = v32;
          *((_QWORD *)v44 + 1) = v33;
          *((_QWORD *)v44 + 2) = v34;
          *((_QWORD *)v44 + 3) = v35;
          if (v36 == v38)
          {
            v47 = &v43[32 * v39];
          }
          else
          {
            v45 = &v43[32 * v39];
            do
            {
              v46 = *((_OWORD *)v36 - 1);
              v47 = v45 - 32;
              *((_OWORD *)v45 - 2) = *((_OWORD *)v36 - 2);
              *((_OWORD *)v45 - 1) = v46;
              v36 -= 4;
              v45 -= 32;
            }
            while (v36 != v38);
          }
          v37 = v44 + 4;
          __p[0] = v47;
          __p[1] = v44 + 4;
          __p[2] = &v43[32 * v42];
          if (v38)
            operator delete(v38);
        }
        else
        {
          *(double *)__p[1] = v28;
          v36[1] = v29;
          v37 = v36 + 4;
          v36[2] = v30;
          v36[3] = v31;
        }
        __p[1] = v37;
        goto LABEL_59;
      }
      if (priv[12])
      {
        v27 = CI::KernelArguments::get_type((CI::KernelArguments *)(priv + 144), v21);
        goto LABEL_39;
      }
LABEL_37:
      if (v21 >= *((int *)priv + 5))
        goto LABEL_59;
      v27 = *(_DWORD *)(*((_QWORD *)priv + 9) + 4 * v21);
LABEL_39:
      if (v27 == 1)
        goto LABEL_40;
LABEL_59:
      CI::Object::unref(v25);
    }
    ++v21;
  }
  while (v21 != v22);
  if (__p[1] != __p[0])
  {
    v48 = objc_msgSend((id)objc_msgSend(a6, "objectForKey:", CFSTR("kCIImageAlphaOne")), "BOOLValue");
    v49 = -[CIKernel _outputFormatUsingDictionary:andKernel:](self, "_outputFormatUsingDictionary:andKernel:", a6, priv);
    v50 = defaultROI;
    v51 = operator new();
    v52 = v51;
    if (v84)
      v53 = (uint64_t)v84;
    else
      v53 = v50;
    CI::GeneralKernelImage::GeneralKernelImage(v51, priv, v20, __p, v53, v49, v48, x, y, width, height);
    v54 = (void *)objc_msgSend(a6, "objectForKeyedSubscript:", CFSTR("kCIKernelThreadsPerThreadgroup"));
    v55 = (void *)objc_msgSend(a6, "objectForKeyedSubscript:", CFSTR("kCIKernelThreadgroupsPerGrid"));
    if (v54)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v54, "X");
        v57 = v56;
        objc_msgSend(v54, "Y");
        v59 = v58;
        objc_msgSend(v54, "Z");
        v60 = v57;
        v61 = v59;
        v63 = v62;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v54, "count") == 3)
        {
          v60 = objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 0), "unsignedIntValue");
          v61 = objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 1), "unsignedIntValue");
          v63 = objc_msgSend((id)objc_msgSend(v54, "objectAtIndexedSubscript:", 2), "unsignedIntValue");
        }
        else
        {
          v60 = 0;
          v61 = 0;
          v63 = 0;
        }
      }
      *(_QWORD *)(v52 + 200) = v60 | (unint64_t)(v61 << 32);
      *(_DWORD *)(v52 + 208) = v63;
    }
    if (v55)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v55, "X");
        v75 = v74;
        objc_msgSend(v55, "Y");
        v77 = v76;
        objc_msgSend(v55, "Z");
        v78 = v75;
        v79 = v77;
        v81 = v80;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v55, "count") == 3)
        {
          v78 = objc_msgSend((id)objc_msgSend(v55, "objectAtIndexedSubscript:", 0), "unsignedIntValue");
          v79 = objc_msgSend((id)objc_msgSend(v55, "objectAtIndexedSubscript:", 1), "unsignedIntValue");
          v81 = objc_msgSend((id)objc_msgSend(v55, "objectAtIndexedSubscript:", 2), "unsignedIntValue");
        }
        else
        {
          v78 = 0;
          v79 = 0;
          v81 = 0;
        }
      }
      *(_QWORD *)(v52 + 212) = v78 | (unint64_t)(v79 << 32);
      *(_DWORD *)(v52 + 220) = v81;
    }
    v72 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v52);
    CI::Object::unref((CI::Object *)v52);
    goto LABEL_88;
  }
LABEL_68:
  CI::SerialObjectPtrArray::~SerialObjectPtrArray(v20);
  MEMORY[0x194025AAC]();
  v64 = ci_logger_api();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    -[CIKernel applyWithExtent:roiCallback:arguments:options:].cold.1(v64, v65, v66, v67, v68, v69, v70, v71);
  v72 = 0;
LABEL_88:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v72;
}

void __43__CIKernel_internalCachedKernelWithString___block_invoke(uint64_t a1)
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
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"internalCachedKernelWithString\", "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

id __17__CIKernel_cache__block_invoke()
{
  id result;

  result = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[CIKernel cache]::cache = (uint64_t)result;
  return result;
}

- (void)setCanReduceOutputChannels:(BOOL)a3
{
  CI::Kernel *priv;

  priv = (CI::Kernel *)self->_priv;
  if ((int)CI::Kernel::num_image_arguments(priv) >= 1)
    CI::Kernel::set_can_reduce_output_channels((uint64_t)priv, a3);
}

- (CIImage)applyWithExtent:(CGRect)extent roiCallback:(CIKernelROICallback)callback arguments:(NSArray *)args
{
  return (CIImage *)-[CIKernel applyWithExtent:roiCallback:arguments:options:](self, "applyWithExtent:roiCallback:arguments:options:", callback, args, 0, extent.origin.x, extent.origin.y, extent.size.width, extent.size.height);
}

- (int)_outputFormatUsingDictionary:(id)a3 andKernel:(void *)a4
{
  uint64_t v6;
  _BOOL4 v7;
  int v8;
  NSObject *v11;
  const char *v12;
  const char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("kCIKernelOutputFormat")), "longValue");
  v7 = -[CIKernel _isValidOutputPixelFormat:](self, "_isValidOutputPixelFormat:", v6);
  v8 = *((_DWORD *)a4 + 30);
  if (!v7 || (_DWORD)v6 == 0)
  {
    if (!v8 || !-[CIKernel _isValidOutputPixelFormat:](self, "_isValidOutputPixelFormat:", *((unsigned int *)a4 + 30)))
      return 0;
  }
  else
  {
    if (v8)
    {
      if (v8 != (_DWORD)v6)
      {
        v11 = ci_logger_api();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = CI::name_for_format(v6);
          v13 = CI::name_for_format(*((_DWORD *)a4 + 30));
          v14 = 136446466;
          v15 = v12;
          v16 = 2080;
          v17 = v13;
          _os_log_impl(&dword_1921E4000, v11, OS_LOG_TYPE_INFO, "Warning: specified a kernel attribute output format of %{public}s and apply option kCIKernelOutputFormat of %s. The former will be used.", (uint8_t *)&v14, 0x16u);
        }
      }
    }
    v8 = v6;
  }
  if (v8 == 264)
    return 266;
  else
    return v8;
}

- (BOOL)_isValidOutputPixelFormat:(int)a3
{
  uint64_t v4;
  void *v5;
  uint64_t i;
  const __CFString *v7;
  NSObject *v8;
  _BOOL4 v9;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = 0;
    while (dword_192495C80[v4] != a3)
    {
      if (++v4 == 6)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", &stru_1E2ECD1B0);
        for (i = 0; i != 6; ++i)
        {
          if (i * 4)
            v7 = CFSTR(", kCIFormat");
          else
            v7 = CFSTR("kCIFormat");
          objc_msgSend(v5, "appendString:", v7);
          objc_msgSend(v5, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", CI::name_for_format(dword_192495C80[i])));
        }
        v8 = ci_logger_api();
        v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
        if (v9)
        {
          v11 = 136446466;
          v12 = CI::name_for_format(a3);
          v13 = 2112;
          v14 = v5;
          _os_log_impl(&dword_1921E4000, v8, OS_LOG_TYPE_INFO, "kCIKernelOutputFormat value (%{public}s) is not supported.Use one of these formats instead: %@", (uint8_t *)&v11, 0x16u);
          LOBYTE(v9) = 0;
        }
        return v9;
      }
    }
  }
  LOBYTE(v9) = 1;
  return v9;
}

- (id)_initWithString:(id)a3 andCIKernelLibrary:(id)a4 usingCruftCompatibility:(BOOL)a5 isInternal:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _xlocale *v11;
  _xlocale *v12;
  uint64_t Pool;
  NSObject *v14;
  uint64_t v15;
  int var0;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  char v20;
  _xlocale *v21;
  NSObject *v23;
  id *v24;
  int v25;
  NSObject *v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  int v30;
  const void *v31;
  int64_t v32;
  char *v33;
  void *v34;
  id v35;
  const void *v36;
  int64_t v37;
  char *v38;
  NSObject *v39;
  _OWORD v40[2];
  void *v41;
  void *v42;
  uint64_t v43;
  std::string v44;
  __int128 v45;
  int64x2_t v46;
  __int16 v47;
  _OWORD v48[2];
  void *v49;
  void *__dst;
  uint64_t v51;
  std::string v52;
  __int128 v53;
  int64x2_t v54;
  __int16 v55;
  CIKernelReflection v56;
  CIKernelReflection v57;
  _BYTE v58[40];
  __int128 v59;
  _BYTE v60[40];
  int64x2_t v61;
  __int16 v62;
  vector<std::string, std::allocator<std::string>> *p_var6;
  CIKernelReflection buf;
  uint64_t v65;

  v6 = a6;
  v7 = a5;
  v65 = *MEMORY[0x1E0C80C00];
  memset(v60, 0, sizeof(v60));
  v59 = 0u;
  memset(&v58[8], 0, 32);
  v61 = vdupq_n_s64(1uLL);
  v62 = 0;
  memset(&v57.var2, 0, 88);
  *(int64x2_t *)&v57.var10 = v61;
  *(_WORD *)&v57.var12 = 0;
  memset(&v56.var2, 0, 88);
  *(int64x2_t *)&v56.var10 = v61;
  *(_WORD *)&v56.var12 = 0;
  v11 = newlocale(63, 0, 0);
  v12 = uselocale(v11);
  Pool = fosl_filter_kernelpool_createPool();
  fosl_filter_kernelpool_addLibrary(Pool, (uint64_t)aCopyright2022A);
  if ((dyld_program_sdk_at_least() & 1) == 0
    && (dyld_program_sdk_at_least() & 1) == 0
    && !CI_DISABLE_CRUFT_COMPATABILITY()
    && v7)
  {
    a3 = (id)objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("__sampler"), CFSTR("sampler"));
  }
  fosl_filter_kernelpool_addString(Pool, objc_msgSend(a3, "UTF8String"));
  if (check_and_emit_compile_errors((NSString *)a3, Pool, 0))
  {
    v14 = ci_logger_compile();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend((id)objc_opt_class(), "description");
      -[CIKernel _initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:].cold.1(v15, (uint64_t)&buf, v14);
    }
    goto LABEL_18;
  }
  if (!fosl_filter_kernelpool_getNumKernels(Pool))
  {
    v18 = ci_logger_compile();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = objc_msgSend((id)objc_opt_class(), "description");
      -[CIKernel _initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:].cold.2(v19, (uint64_t)&buf, v18);
    }
LABEL_18:
    v20 = 0;
    if (!Pool)
      goto LABEL_20;
    goto LABEL_19;
  }
  if (!CIKernelReflection::reflect(&v57, Pool, 0, 0))
    goto LABEL_18;
  if ((dyld_program_sdk_at_least() & 1) != 0 || dyld_program_sdk_at_least())
  {
    var0 = v57.var0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & (var0 != 3)) == 1)
    {
      v17 = ci_logger_compile();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[CIKernel _initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:].cold.3();
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & (var0 != 2)) == 1)
    {
      v23 = ci_logger_compile();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[CIKernel _initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:].cold.4();
      goto LABEL_18;
    }
  }
  if (!a4 && !v6)
  {
    if (!can_use_metal() || !CI_USE_MTL_DAG_FOR_CIKL_SRC())
      goto LABEL_42;
    CIKLLibraryMaker::CIKLLibraryMaker((CIKLLibraryMaker *)&buf, Pool);
    a4 = *(id *)&buf.var0;
    CIKLLibraryMaker::~CIKLLibraryMaker(v24);
  }
  if (a4 && CIKernelReflection::reflect(&v56, (CIKernelLibrary *)a4, v57.var2, 0))
  {
    v25 = v56.var0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & (v25 != 2)) == 1)
    {
      v26 = ci_logger_api();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[CIKernel _initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:].cold.6();
      goto LABEL_18;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & (v25 != 3)) == 1)
    {
      v39 = ci_logger_api();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        -[CIKernel _initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:].cold.7();
      goto LABEL_18;
    }
    CIKernelReflection::consolidate(&v57, &v56, (uint64_t)&buf);
    CIKernelReflection::operator=((uint64_t)v58, (uint64_t)&buf);
    CIKernelReflection::~CIKernelReflection(&buf);
    goto LABEL_43;
  }
LABEL_42:
  *(_OWORD *)v58 = *(_OWORD *)&v57.var0;
  *(_OWORD *)&v58[16] = *(_OWORD *)&v57.var3;
  std::vector<CI::KernelArgumentType>::__assign_with_size[abi:nn180100]<CI::KernelArgumentType*,CI::KernelArgumentType*>(&v58[32], (char *)v57.var5.var0, (uint64_t)v57.var5.var1, v57.var5.var1 - v57.var5.var0);
  std::vector<std::string>::__assign_with_size[abi:nn180100]<std::string*,std::string*>((std::vector<std::string> *)v60, (std::string *)v57.var6.var0, (__int128 *)v57.var6.var1, 0xAAAAAAAAAAAAAAABLL * (((char *)v57.var6.var1 - (char *)v57.var6.var0) >> 3));
  *(_OWORD *)&v60[24] = *(_OWORD *)&v57.var7;
  v61 = *(int64x2_t *)&v57.var10;
  v62 = *(_WORD *)&v57.var12;
LABEL_43:
  v27 = *v57.var2;
  if (v6)
  {
    if (v27 != 95)
    {
      v28 = ci_logger_api();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        -[CIKernel _initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:].cold.5();
    }
  }
  else if (v27 == 95)
  {
    v29 = ci_logger_api();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      buf.var0 = 136446210;
      *(_QWORD *)&buf.var1 = v57.var2;
      _os_log_impl(&dword_1921E4000, v29, OS_LOG_TYPE_INFO, "WARNING: Client CIKL function name %{public}s must not start with '_'\n", (uint8_t *)&buf, 0xCu);
    }
  }
  v30 = *(_DWORD *)v58;
  if (*(_DWORD *)v58 == 1)
    goto LABEL_56;
  if (*(_DWORD *)v58 == 2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_56;
    v30 = *(_DWORD *)v58;
  }
  if (v30 == 3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
LABEL_56:
      v48[0] = *(_OWORD *)v58;
      v48[1] = *(_OWORD *)&v58[16];
      __dst = 0;
      v51 = 0;
      v49 = 0;
      v31 = *(const void **)&v58[32];
      v32 = v59 - *(_QWORD *)&v58[32];
      if ((_QWORD)v59 != *(_QWORD *)&v58[32])
      {
        std::vector<CI::KernelArgumentType>::__vallocate[abi:nn180100](&v49, v32 >> 2);
        v33 = (char *)__dst;
        memmove(__dst, v31, v32);
        __dst = &v33[4 * (v32 >> 2)];
      }
      memset(&v52, 0, sizeof(v52));
      std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>(&v52, *(__int128 **)v60, *(__int128 **)&v60[8], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&v60[8] - *(_QWORD *)v60) >> 3));
      v53 = *(_OWORD *)&v60[24];
      v54 = v61;
      v55 = v62;
      self = -[CIKernel _initWithReflection:](self, "_initWithReflection:", v48);
      *(_QWORD *)&buf.var0 = &v52;
      std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&buf);
      v34 = v49;
      if (v49)
      {
        __dst = v49;
LABEL_64:
        operator delete(v34);
        goto LABEL_65;
      }
      goto LABEL_65;
    }
  }

  v35 = KernelKindAlloc(*(int *)v58);
  v40[0] = *(_OWORD *)v58;
  v40[1] = *(_OWORD *)&v58[16];
  v42 = 0;
  v43 = 0;
  v41 = 0;
  v36 = *(const void **)&v58[32];
  v37 = v59 - *(_QWORD *)&v58[32];
  if ((_QWORD)v59 != *(_QWORD *)&v58[32])
  {
    std::vector<CI::KernelArgumentType>::__vallocate[abi:nn180100](&v41, v37 >> 2);
    v38 = (char *)v42;
    memmove(v42, v36, v37);
    v42 = &v38[4 * (v37 >> 2)];
  }
  memset(&v44, 0, sizeof(v44));
  std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>(&v44, *(__int128 **)v60, *(__int128 **)&v60[8], 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)&v60[8] - *(_QWORD *)v60) >> 3));
  v45 = *(_OWORD *)&v60[24];
  v46 = v61;
  v47 = v62;
  self = (CIKernel *)objc_msgSend(v35, "_initWithReflection:", v40);
  *(_QWORD *)&buf.var0 = &v44;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&buf);
  v34 = v41;
  if (v41)
  {
    v42 = v41;
    goto LABEL_64;
  }
LABEL_65:
  v20 = 1;
  if (Pool)
LABEL_19:
    fosl_filter_kernelpool_destroyPool(Pool);
LABEL_20:
  v21 = uselocale(v12);
  freelocale(v21);
  if ((v20 & 1) == 0)
  {

    self = 0;
  }
  p_var6 = &v56.var6;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&p_var6);
  if (v56.var5.var0)
  {
    v56.var5.var1 = v56.var5.var0;
    operator delete(v56.var5.var0);
  }
  *(_QWORD *)&v56.var0 = &v57.var6;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v56);
  if (v57.var5.var0)
  {
    v57.var5.var1 = v57.var5.var0;
    operator delete(v57.var5.var0);
  }
  *(_QWORD *)&v57.var0 = v60;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v57);
  if (*(_QWORD *)&v58[32])
  {
    *(_QWORD *)&v59 = *(_QWORD *)&v58[32];
    operator delete(*(void **)&v58[32]);
  }
  return self;
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
  char *var2;
  char *var3;
  char *var4;
  int v25;
  unsigned int var8;
  int var9;
  id v28;
  int64x2_t v30;
  std::string v31;

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
      std::string::__init_copy_ctor_external(&v31, *(const std::string::value_type **)v15, *((_QWORD *)v15 + 1));
    }
    else
    {
      v17 = *(_OWORD *)v15;
      v31.__r_.__value_.__r.__words[2] = *((_QWORD *)v15 + 2);
      *(_OWORD *)&v31.__r_.__value_.__l.__data_ = v17;
    }
    if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v18 = &v31;
    else
      v18 = (std::string *)v31.__r_.__value_.__r.__words[0];
    if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v31.__r_.__value_.__r.__words[2]);
    else
      size = v31.__r_.__value_.__l.__size_;
    CI::SerialStringArray::append(v14, (const char *)v18, size);
    if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v31.__r_.__value_.__l.__data_);
  }
  *(_OWORD *)&v31.__r_.__value_.__l.__data_ = *(_OWORD *)&a3->var10;
  if (a3->var7)
  {
    v20 = (CI::MetalKernel *)operator new();
    CI::PrecompiledGeneralKernel::PrecompiledGeneralKernel(v20, a3->var2, (CIKernelLibrary *)a3->var7, a3->var3, a3->var4, 0, v10, (uint64_t)v14, a3->var8, a3->var1, a3->var9, (NSDictionary *)a4, (NSDictionary *)a5, (uint64_t *)&v31, a3->var12);
    v21 = (CI::MetalKernel *)((char *)v20 + 80);
  }
  else
  {
    v21 = (CI::Object *)operator new();
    var2 = a3->var2;
    var3 = a3->var3;
    var4 = a3->var4;
    v25 = a3->var1;
    var8 = a3->var8;
    var9 = a3->var9;
    v30 = vdupq_n_s64(1uLL);
    CI::GeneralKernel::GeneralKernel((uint64_t)v21, var2, var3, var4, 0, v10, (uint64_t)v14, var8, v25, var9, v30.i64, 1);
  }
  v28 = -[CIKernel _initWithInternalRepresentation:](self, "_initWithInternalRepresentation:", v21);
  if (*((_BYTE *)v21 + 12))
    CI::Object::unref(v21);
  objc_autoreleasePoolPop(v9);
  return v28;
}

- (id)_initWithReflection:(CIKernelReflection *)a3
{
  __int128 v5;
  __int128 v6;
  id v7;
  _OWORD v9[2];
  void *__p[3];
  std::string v11;
  __int128 v12;
  __int128 v13;
  __int16 v14;
  std::string *v15;

  v5 = *(_OWORD *)&a3->var3;
  v9[0] = *(_OWORD *)&a3->var0;
  v9[1] = v5;
  std::vector<CI::KernelArgumentType>::vector(__p, (uint64_t)&a3->var5);
  memset(&v11, 0, sizeof(v11));
  std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>(&v11, (__int128 *)a3->var6.var0, (__int128 *)a3->var6.var1, 0xAAAAAAAAAAAAAAABLL * (((char *)a3->var6.var1 - (char *)a3->var6.var0) >> 3));
  v6 = *(_OWORD *)&a3->var10;
  v12 = *(_OWORD *)&a3->var7;
  v13 = v6;
  v14 = *(_WORD *)&a3->var12;
  v7 = -[CIKernel _initWithReflection:constants:constantTypes:](self, "_initWithReflection:constants:constantTypes:", v9, 0, 0);
  v15 = &v11;
  std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v15);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  return v7;
}

- (id)_initWithInternalRepresentation:(void *)a3
{
  uint64_t v3;
  CIKernel *v4;
  objc_super v6;

  if (a3)
  {
    v3 = (uint64_t)a3;
    v6.receiver = self;
    v6.super_class = (Class)CIKernel;
    v4 = -[CIKernel init](&v6, sel_init);
    if (v4)
    {
      if (*(_BYTE *)(v3 + 12))
        v3 = CI::Object::ref(v3);
      v4->_priv = (void *)v3;
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (id)_initInternalWithString:(id)a3
{
  if (check_cikl_string((NSString *)a3, "-[CIKernel _initInternalWithString:]"))
    return -[CIKernel _initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:](self, "_initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:", a3, 0, 0, 1);

  return 0;
}

+ (id)internalCachedKernelWithString:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[2];
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 138543362;
    v16 = objc_msgSend(a1, "description");
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"internalCachedKernelWithString\", "%{public}@", buf, 0xCu);
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v12 = __43__CIKernel_internalCachedKernelWithString___block_invoke;
  v13 = &unk_1E2EC3CC8;
  v14 = a1;
  v6 = (void *)objc_msgSend(a1, "cache");
  objc_sync_enter(v6);
  v7 = (void *)objc_msgSend(v6, "objectForKey:", a3);
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v8 = (id)objc_msgSend(objc_alloc((Class)a1), "_initInternalWithString:", a3);
    objc_msgSend(v6, "setObject:forKey:", v8, a3);
  }
  objc_sync_exit(v6);
  v12((uint64_t)v11);
  return v8;
}

+ (id)cache
{
  if (+[CIKernel cache]::onceToken != -1)
    dispatch_once(&+[CIKernel cache]::onceToken, &__block_literal_global_89);
  return (id)+[CIKernel cache]::cache;
}

- (void)_internalRepresentation
{
  return self->_priv;
}

+ (CIKernel)kernelWithInternalRepresentation:(const void *)a3
{
  int v4;

  if ((*(unsigned int (**)(const void *, SEL))(*(_QWORD *)a3 + 16))(a3, a2) == 64)
  {
    v4 = 1;
  }
  else if ((*(unsigned int (**)(const void *))(*(_QWORD *)a3 + 16))(a3) == 62)
  {
    v4 = 2;
  }
  else
  {
    v4 = 3;
  }
  return (CIKernel *)(id)objc_msgSend(KernelKindAlloc(v4), "_initWithInternalRepresentation:", a3);
}

+ (void)clearCache
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "cache");
  objc_sync_enter(v2);
  objc_msgSend(v2, "removeAllObjects");
  objc_sync_exit(v2);
  +[CIKernelLibrary clearCache](CIKernelLibrary, "clearCache");
}

+ (id)cachedKernelWithString:(id)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 138543362;
    v18 = objc_msgSend(a1, "description");
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"cachedKernelWithString\", "%{public}@", buf, 0xCu);
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v14 = __35__CIKernel_cachedKernelWithString___block_invoke;
  v15 = &unk_1E2EC3CC8;
  v16 = a1;
  v6 = (void *)objc_msgSend(a1, "cache");
  objc_sync_enter(v6);
  v7 = (void *)objc_msgSend(v6, "objectForKey:", a3);
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    v8 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithString:", a3);
    v10 = (uint64_t)v8;
    if (!v8)
      v10 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
    objc_msgSend(v6, "setObject:forKey:", v10, a3);
  }
  objc_sync_exit(v6);
  if (v8 == (id)objc_msgSend(MEMORY[0x1E0C99E38], "null"))
    v11 = 0;
  else
    v11 = v8;
  v14((uint64_t)v13);
  return v11;
}

void __35__CIKernel_cachedKernelWithString___block_invoke(uint64_t a1)
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
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"cachedKernelWithString\", "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

+ (id)cacheKeyForFunctionName:(id)a3 fromCIKernelLibrary:(id)a4 options:(id)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  const __CFString *v13;
  const __CFNumber *v14;
  const __CFNumber *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  int64x2_t v21[5];
  uint64_t __src;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  XXH64_reset(v21, 0);
  CI::XXHashHelper::addstr((uint64_t)v21, (char *)objc_msgSend(a3, "UTF8String"));
  __src = objc_msgSend(a4, "digest");
  XXH64_update((uint64_t)v21, (char *)&__src, 8uLL);
  v8 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("kCIKernelFunctionConstants"));
  v9 = (void *)objc_msgSend((id)objc_msgSend(v8, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        v13 = *(const __CFString **)(*((_QWORD *)&v17 + 1) + 8 * i);
        CI::XXHashHelper::add((CI::XXHashHelper *)v21, v13);
        v14 = (const __CFNumber *)objc_msgSend(v8, "valueForKey:", v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          CI::XXHashHelper::add((CI::XXHashHelper *)v21, v14);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            CI::XXHashHelper::add((CI::XXHashHelper *)v21, v14);
        }
        v15 = (const __CFNumber *)objc_msgSend(v8, "valueForKey:", v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          CI::XXHashHelper::add((CI::XXHashHelper *)v21, v15);
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    }
    while (v10);
  }
  __src = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("kCIKernelOutputFormat")), "longLongValue");
  XXH64_update((uint64_t)v21, (char *)&__src, 8uLL);
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%016llX"), XXH64_digest((uint64_t)v21));
}

+ (id)cachedKernelWithFunctionName:(id)a3 fromCIKernelLibrary:(id)a4 options:(id)a5 error:(id *)a6
{
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v19[2];
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  uint8_t buf[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v11 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = objc_msgSend(a1, "description");
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"cachedKernelWithFunctionName\", "%{public}@", buf, 0xCu);
  }
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v20 = __75__CIKernel_cachedKernelWithFunctionName_fromCIKernelLibrary_options_error___block_invoke;
  v21 = &unk_1E2EC3CC8;
  v22 = a1;
  v12 = (void *)objc_msgSend(a1, "cache");
  v13 = objc_msgSend(a1, "cacheKeyForFunctionName:fromCIKernelLibrary:options:", a3, a4, a5);
  objc_sync_enter(v12);
  v14 = (void *)objc_msgSend(v12, "objectForKey:", v13);
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    *(_QWORD *)buf = 0;
    v17 = objc_msgSend(a1, "kernelWithFunctionName:fromCIKernelLibrary:options:error:", a3, a4, a5, buf);
    if (v17)
      v15 = (void *)v17;
    else
      v15 = *(void **)buf;
    if (!v15)
      v15 = (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    objc_msgSend(v12, "setObject:forKey:", v15, v13);
  }
  objc_sync_exit(v12);
  if (v15 == (void *)objc_msgSend(MEMORY[0x1E0C99E38], "null"))
    goto LABEL_15;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (!((a6 == 0) | ((objc_opt_isKindOfClass() & 1) == 0)))
      *a6 = v15;
LABEL_15:
    v15 = 0;
  }
  v20((uint64_t)v19);
  return v15;
}

void __75__CIKernel_cachedKernelWithFunctionName_fromCIKernelLibrary_options_error___block_invoke(uint64_t a1)
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
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"cachedKernelWithFunctionName\", "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (CIKernel)init
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
    -[CIKernel init].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
  return (CIKernel *)-[CIKernel _initWithInternalRepresentation:](self, "_initWithInternalRepresentation:", 0);
}

- (void)dealloc
{
  CI::Object *priv;
  objc_super v4;

  priv = (CI::Object *)self->_priv;
  if (priv)
  {
    if (*((_BYTE *)priv + 12))
      CI::Object::unref(priv);
    self->_priv = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CIKernel;
  -[CIKernel dealloc](&v4, sel_dealloc);
}

+ (id)kernelsWithString:(id)a3 andCIKernelLibrary:(id)a4 messageLog:(id)a5
{
  _xlocale *v8;
  uint64_t Pool;
  unsigned int NumKernels;
  void *v11;
  id *v12;
  uint64_t v14;
  CIKernel *v15;
  int *var0;
  int64_t v17;
  char *v18;
  char *v19;
  void *v20;
  CIColorKernel *v21;
  int *v22;
  int64_t v23;
  char *v24;
  char *v25;
  CIWarpKernel *v26;
  int *v27;
  int64_t v28;
  char *v29;
  char *v30;
  CIBlendKernel *v31;
  int *v32;
  int64_t v33;
  char *v34;
  char *v35;
  _xlocale *v36;
  __CFString *v37;
  _xlocale *v38;
  id v39;
  unsigned int v40;
  int64x2_t v41;
  void *v42;
  _OWORD v43[2];
  void *v44;
  void *v45;
  uint64_t v46;
  std::string v47;
  __int128 v48;
  __int128 v49;
  __int16 v50;
  _OWORD v51[2];
  void *v52;
  void *v53;
  uint64_t v54;
  std::string v55;
  __int128 v56;
  __int128 v57;
  __int16 v58;
  _OWORD v59[2];
  void *v60;
  void *v61;
  uint64_t v62;
  std::string v63;
  __int128 v64;
  __int128 v65;
  __int16 v66;
  _OWORD v67[2];
  void *v68;
  void *__dst;
  uint64_t v70;
  std::string v71;
  __int128 v72;
  __int128 v73;
  __int16 v74;
  _QWORD v75[7];
  vector<std::string, std::allocator<std::string>> v76;
  __int128 v77;
  __int128 v78;
  __int16 v79;
  CIKernelReflection v80;
  CIKernelReflection v81;
  vector<std::string, std::allocator<std::string>> *v82;

  if (!check_cikl_string((NSString *)a3, "+[CIKernel kernelsWithString:andCIKernelLibrary:messageLog:]"))
    return 0;
  v8 = newlocale(63, 0, 0);
  v38 = uselocale(v8);
  Pool = fosl_filter_kernelpool_createPool();
  fosl_filter_kernelpool_addLibrary(Pool, (uint64_t)aCopyright2022A);
  fosl_filter_kernelpool_addString(Pool, objc_msgSend(a3, "UTF8String"));
  check_and_emit_compile_errors((NSString *)a3, Pool, (NSMutableArray *)a5);
  v42 = (void *)Pool;
  NumKernels = fosl_filter_kernelpool_getNumKernels(Pool);
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", NumKernels);
  if (!a4)
  {
    if (can_use_metal() && CI_USE_MTL_DAG_FOR_CIKL_SRC())
    {
      CIKLLibraryMaker::CIKLLibraryMaker((CIKLLibraryMaker *)&v81, (uint64_t)v42);
      a4 = *(id *)&v81.var0;
      CIKLLibraryMaker::~CIKLLibraryMaker(v12);
    }
    else
    {
      a4 = 0;
    }
  }
  if (NumKernels)
  {
    v14 = 0;
    v41 = vdupq_n_s64(1uLL);
    v39 = a4;
    v40 = NumKernels;
    do
    {
      memset(&v81.var2, 0, 88);
      *(int64x2_t *)&v81.var10 = v41;
      *(_WORD *)&v81.var12 = 0;
      if (CIKernelReflection::reflect(&v81, (uint64_t)v42, v14, 0))
      {
        memset(&v80.var2, 0, 88);
        *(int64x2_t *)&v80.var10 = vdupq_n_s64(1uLL);
        *(_WORD *)&v80.var12 = 0;
        if (a4)
        {
          NumKernels = v40;
          if (CIKernelReflection::reflect(&v80, (CIKernelLibrary *)a4, v81.var2, 0))
          {
            CIKernelReflection::consolidate(&v81, &v80, (uint64_t)v75);
            *(_OWORD *)&v81.var0 = *(_OWORD *)v75;
            *(_OWORD *)&v81.var3 = *(_OWORD *)&v75[2];
            if (v81.var5.var0)
            {
              v81.var5.var1 = v81.var5.var0;
              operator delete(v81.var5.var0);
            }
            v81.var5 = *(vector<CI::KernelArgumentType, std::allocator<CI::KernelArgumentType>> *)&v75[4];
            memset(&v75[4], 0, 24);
            std::vector<std::string>::__vdeallocate((std::vector<std::string> *)&v81.var6);
            v81.var6 = v76;
            memset(&v76, 0, sizeof(v76));
            *(_OWORD *)&v81.var7 = v77;
            *(_OWORD *)&v81.var10 = v78;
            *(_WORD *)&v81.var12 = v79;
            v82 = &v76;
            std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v82);
            if (v75[4])
            {
              v75[5] = v75[4];
              operator delete((void *)v75[4]);
            }
          }
        }
        switch(v81.var0)
        {
          case 1:
            v15 = [CIKernel alloc];
            v67[0] = *(_OWORD *)&v81.var0;
            v67[1] = *(_OWORD *)&v81.var3;
            __dst = 0;
            v70 = 0;
            v68 = 0;
            var0 = v81.var5.var0;
            v17 = (char *)v81.var5.var1 - (char *)v81.var5.var0;
            if (v81.var5.var1 != v81.var5.var0)
            {
              std::vector<CI::KernelArgumentType>::__vallocate[abi:nn180100](&v68, v17 >> 2);
              v18 = (char *)__dst;
              memmove(__dst, var0, v17);
              v19 = &v18[4 * (v17 >> 2)];
              a4 = v39;
              __dst = v19;
            }
            memset(&v71, 0, sizeof(v71));
            std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>(&v71, (__int128 *)v81.var6.var0, (__int128 *)v81.var6.var1, 0xAAAAAAAAAAAAAAABLL * (((char *)v81.var6.var1 - (char *)v81.var6.var0) >> 3));
            v72 = *(_OWORD *)&v81.var7;
            v73 = *(_OWORD *)&v81.var10;
            v74 = *(_WORD *)&v81.var12;
            objc_msgSend(v11, "addObject:", -[CIKernel _initWithReflection:](v15, "_initWithReflection:", v67));
            v75[0] = &v71;
            std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)v75);
            v20 = v68;
            NumKernels = v40;
            if (v68)
            {
              __dst = v68;
              goto LABEL_34;
            }
            break;
          case 2:
            v21 = [CIColorKernel alloc];
            v59[0] = *(_OWORD *)&v81.var0;
            v59[1] = *(_OWORD *)&v81.var3;
            v61 = 0;
            v62 = 0;
            v60 = 0;
            v22 = v81.var5.var0;
            v23 = (char *)v81.var5.var1 - (char *)v81.var5.var0;
            if (v81.var5.var1 != v81.var5.var0)
            {
              std::vector<CI::KernelArgumentType>::__vallocate[abi:nn180100](&v60, v23 >> 2);
              v24 = (char *)v61;
              memmove(v61, v22, v23);
              v25 = &v24[4 * (v23 >> 2)];
              a4 = v39;
              v61 = v25;
            }
            memset(&v63, 0, sizeof(v63));
            std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>(&v63, (__int128 *)v81.var6.var0, (__int128 *)v81.var6.var1, 0xAAAAAAAAAAAAAAABLL * (((char *)v81.var6.var1 - (char *)v81.var6.var0) >> 3));
            v64 = *(_OWORD *)&v81.var7;
            v65 = *(_OWORD *)&v81.var10;
            v66 = *(_WORD *)&v81.var12;
            objc_msgSend(v11, "addObject:", -[CIKernel _initWithReflection:](v21, "_initWithReflection:", v59));
            v75[0] = &v63;
            std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)v75);
            v20 = v60;
            NumKernels = v40;
            if (v60)
            {
              v61 = v60;
              goto LABEL_34;
            }
            break;
          case 3:
            v26 = [CIWarpKernel alloc];
            v51[0] = *(_OWORD *)&v81.var0;
            v51[1] = *(_OWORD *)&v81.var3;
            v53 = 0;
            v54 = 0;
            v52 = 0;
            v27 = v81.var5.var0;
            v28 = (char *)v81.var5.var1 - (char *)v81.var5.var0;
            if (v81.var5.var1 != v81.var5.var0)
            {
              std::vector<CI::KernelArgumentType>::__vallocate[abi:nn180100](&v52, v28 >> 2);
              v29 = (char *)v53;
              memmove(v53, v27, v28);
              v30 = &v29[4 * (v28 >> 2)];
              a4 = v39;
              v53 = v30;
            }
            memset(&v55, 0, sizeof(v55));
            std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>(&v55, (__int128 *)v81.var6.var0, (__int128 *)v81.var6.var1, 0xAAAAAAAAAAAAAAABLL * (((char *)v81.var6.var1 - (char *)v81.var6.var0) >> 3));
            v56 = *(_OWORD *)&v81.var7;
            v57 = *(_OWORD *)&v81.var10;
            v58 = *(_WORD *)&v81.var12;
            objc_msgSend(v11, "addObject:", -[CIKernel _initWithReflection:](v26, "_initWithReflection:", v51));
            v75[0] = &v55;
            std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)v75);
            v20 = v52;
            NumKernels = v40;
            if (v52)
            {
              v53 = v52;
              goto LABEL_34;
            }
            break;
          case 4:
            v31 = [CIBlendKernel alloc];
            v43[0] = *(_OWORD *)&v81.var0;
            v43[1] = *(_OWORD *)&v81.var3;
            v45 = 0;
            v46 = 0;
            v44 = 0;
            v32 = v81.var5.var0;
            v33 = (char *)v81.var5.var1 - (char *)v81.var5.var0;
            if (v81.var5.var1 != v81.var5.var0)
            {
              std::vector<CI::KernelArgumentType>::__vallocate[abi:nn180100](&v44, v33 >> 2);
              v34 = (char *)v45;
              memmove(v45, v32, v33);
              v35 = &v34[4 * (v33 >> 2)];
              a4 = v39;
              v45 = v35;
            }
            memset(&v47, 0, sizeof(v47));
            std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>(&v47, (__int128 *)v81.var6.var0, (__int128 *)v81.var6.var1, 0xAAAAAAAAAAAAAAABLL * (((char *)v81.var6.var1 - (char *)v81.var6.var0) >> 3));
            v48 = *(_OWORD *)&v81.var7;
            v49 = *(_OWORD *)&v81.var10;
            v50 = *(_WORD *)&v81.var12;
            objc_msgSend(v11, "addObject:", -[CIKernel _initWithReflection:](v31, "_initWithReflection:", v43, v38));
            v75[0] = &v47;
            std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)v75);
            v20 = v44;
            NumKernels = v40;
            if (v44)
            {
              v45 = v44;
LABEL_34:
              operator delete(v20);
            }
            break;
          default:
            break;
        }
        v75[0] = &v80.var6;
        std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)v75);
        if (v80.var5.var0)
        {
          v80.var5.var1 = v80.var5.var0;
          operator delete(v80.var5.var0);
        }
      }
      *(_QWORD *)&v80.var0 = &v81.var6;
      std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&v80);
      if (v81.var5.var0)
      {
        v81.var5.var1 = v81.var5.var0;
        operator delete(v81.var5.var0);
      }
      v14 = (v14 + 1);
    }
    while (NumKernels != (_DWORD)v14);
  }
  fosl_filter_kernelpool_destroyPool((uint64_t)v42);
  v36 = uselocale(v38);
  freelocale(v36);
  if (a4)
    v37 = CFSTR("kernelsWithString_andMetalLibrary");
  else
    v37 = CFSTR("kernelsWithString");
  CoreAnalytics(CFSTR("CIKernel"), &v37->isa, NumKernels);
  return v11;
}

+ (id)kernelsWithString:(id)a3 fromMetalLibraryData:(id)a4
{
  NSObject *v7;
  void *v8;
  _QWORD v10[2];
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 138543362;
    v15 = objc_msgSend(a1, "description");
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"kernelsWithString:fromMetalLibraryData\", "%{public}@", buf, 0xCu);
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v11 = __51__CIKernel_kernelsWithString_fromMetalLibraryData___block_invoke;
  v12 = &unk_1E2EC3CC8;
  v13 = a1;
  if (check_cikl_string((NSString *)a3, "+[CIKernel kernelsWithString:fromMetalLibraryData:]"))
    v8 = (void *)objc_msgSend((id)objc_opt_class(), "kernelsWithString:andCIKernelLibrary:messageLog:", a3, +[CIKernelLibrary libraryWithData:error:](CIKernelLibrary, "libraryWithData:error:", a4, 0), 0);
  else
    v8 = 0;
  v11((uint64_t)v10);
  return v8;
}

void __51__CIKernel_kernelsWithString_fromMetalLibraryData___block_invoke(uint64_t a1)
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
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"kernelsWithString:fromMetalLibraryData\", "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

+ (id)kernelsWithString:(id)a3 messageLog:(id)a4
{
  if (check_cikl_string((NSString *)a3, "+[CIKernel kernelsWithString:messageLog:]"))
    return (id)objc_msgSend((id)objc_opt_class(), "kernelsWithString:andCIKernelLibrary:messageLog:", a3, 0, a4);
  else
    return 0;
}

+ (NSArray)kernelsWithString:(NSString *)string
{
  NSObject *v5;
  NSArray *v6;
  _QWORD v8[2];
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 138543362;
    v13 = objc_msgSend(a1, "description");
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"kernelsWithString\", "%{public}@", buf, 0xCu);
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v9 = __30__CIKernel_kernelsWithString___block_invoke;
  v10 = &unk_1E2EC3CC8;
  v11 = a1;
  if (check_cikl_string(string, "+[CIKernel kernelsWithString:]"))
    v6 = (NSArray *)objc_msgSend((id)objc_opt_class(), "kernelsWithString:andCIKernelLibrary:messageLog:", string, 0, 0);
  else
    v6 = 0;
  v9((uint64_t)v8);
  return v6;
}

void __30__CIKernel_kernelsWithString___block_invoke(uint64_t a1)
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
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"kernelsWithString\", "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

+ (NSArray)kernelsWithMetalString:(NSString *)source error:(NSError *)error
{
  NSObject *v7;
  CIKernelLibrary *v8;
  CIKernelLibrary *v9;
  id v10;
  uint64_t v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  CIKernel *v16;
  const __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  _QWORD v28[2];
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  _BYTE v32[128];
  _QWORD v33[2];
  __int128 buf;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v7))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(a1, "description");
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"kernelsWithMetalString\", "%{public}@", (uint8_t *)&buf, 0xCu);
  }
  v27 = 0;
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v29 = __41__CIKernel_kernelsWithMetalString_error___block_invoke;
  v30 = &unk_1E2EC3CC8;
  v31 = a1;
  v8 = +[CIKernelLibrary libraryWithSource:error:](CIKernelLibrary, "libraryWithSource:error:", source, &v27);
  v9 = v8;
  if (!v8)
  {
    v17 = CFSTR("Cannot initialize a library with the provided Metal source");
    v18 = 13;
    if (!error)
      goto LABEL_25;
LABEL_21:
    if (v27)
    {
      v19 = *MEMORY[0x1E0CB3388];
      v33[0] = CFSTR("CINonLocalizedDescriptionKey");
      v33[1] = v19;
      *(_QWORD *)&buf = v17;
      *((_QWORD *)&buf + 1) = v27;
      v20 = 2;
    }
    else
    {
      v33[0] = CFSTR("CINonLocalizedDescriptionKey");
      *(_QWORD *)&buf = v17;
      v20 = 1;
    }
    v21 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &buf, v33, v20);
    *error = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CIKernel"), v18, v21);
    goto LABEL_25;
  }
  v10 = -[CIKernelLibrary functionNames](v8, "functionNames");
  v11 = objc_msgSend(v10, "count");
  if (!v11)
  {
    v17 = CFSTR("Cannot find a valid stitchable Metal function in the source");
    v18 = 12;
    if (!error)
      goto LABEL_25;
    goto LABEL_21;
  }
  v12 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v11);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v10);
        v16 = +[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:](CIKernel, "kernelWithFunctionName:fromCIKernelLibrary:options:error:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), v9, 0, &v27);
        if (v16)
          -[NSArray addObject:](v12, "addObject:", v16);
      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    }
    while (v13);
  }
  if (!-[NSArray count](v12, "count"))
  {
    v17 = CFSTR("Cannot find a valid Metal function in the source");
    v18 = 14;
    if (error)
      goto LABEL_21;
LABEL_25:
    v12 = 0;
    goto LABEL_26;
  }
  CoreAnalytics(CFSTR("CIKernel"), CFSTR("kernelsWithMetalString"), v11);
LABEL_26:
  v29((uint64_t)v28);
  return v12;
}

void __41__CIKernel_kernelsWithMetalString_error___block_invoke(uint64_t a1)
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
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"kernelsWithMetalString\", "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (CIKernel)initWithString:(id)a3
{
  if (check_cikl_string((NSString *)a3, "-[CIKernel initWithString:]"))
    return (CIKernel *)-[CIKernel _initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:](self, "_initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:", a3, 0, 1, 0);

  return 0;
}

+ (CIKernel)kernelWithString:(NSString *)string
{
  NSObject *v5;
  CIKernel *v6;
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
  v10 = __29__CIKernel_kernelWithString___block_invoke;
  v11 = &unk_1E2EC3CC8;
  v12 = a1;
  if (check_cikl_string(string, "+[CIKernel kernelWithString:]"))
  {
    v6 = (CIKernel *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithString:", string);
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

void __29__CIKernel_kernelWithString___block_invoke(uint64_t a1)
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

+ (CIKernel)kernelWithString:(id)a3 fromMetalLibraryData:(id)a4
{
  NSObject *v7;
  CIKernel *v8;
  CIKernel *v9;
  _QWORD v11[2];
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 138543362;
    v16 = objc_msgSend(a1, "description");
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithString:fromMetalLibraryData\", "%{public}@", buf, 0xCu);
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v12 = __50__CIKernel_kernelWithString_fromMetalLibraryData___block_invoke;
  v13 = &unk_1E2EC3CC8;
  v14 = a1;
  if (check_cikl_string((NSString *)a3, "+[CIKernel kernelWithString:fromMetalLibraryData:]"))
  {
    if (a4)
      v8 = (CIKernel *)(id)objc_msgSend(objc_alloc((Class)a1), "_initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:", a3, +[CIKernelLibrary libraryWithData:error:](CIKernelLibrary, "libraryWithData:error:", a4, 0), 0, 0);
    else
      v8 = (CIKernel *)objc_msgSend(a1, "kernelWithString:", a3);
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }
  v12((uint64_t)v11);
  return v9;
}

void __50__CIKernel_kernelWithString_fromMetalLibraryData___block_invoke(uint64_t a1)
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
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithString:fromMetalLibraryData\", "%{public}@", (uint8_t *)&v4, 0xCu);
  }
}

+ (CIKernel)kernelWithFunctionName:(NSString *)name fromMetalLibraryData:(NSData *)data error:(NSError *)error
{
  return (CIKernel *)objc_msgSend((id)objc_opt_class(), "kernelWithFunctionName:fromMetalLibraryData:options:error:", name, data, 0, error);
}

+ (CIKernel)kernelWithFunctionName:(NSString *)name fromMetalLibraryData:(NSData *)data outputPixelFormat:(CIFormat)format error:(NSError *)error
{
  uint64_t v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v9 = CI::format_modernize(*(uint64_t *)&format, (CI *)"+[CIKernel kernelWithFunctionName:fromMetalLibraryData:outputPixelFormat:error:]", (const char *)name);
  v10 = (void *)objc_opt_class();
  v12 = CFSTR("kCIKernelOutputFormat");
  v13[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
  return (CIKernel *)objc_msgSend(v10, "kernelWithFunctionName:fromMetalLibraryData:options:error:", name, data, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1), error);
}

+ (CIKernel)kernelWithFunctionName:(id)a3 fromMetalLibraryData:(id)a4 outputGroupSize:(CGSize)a5 error:(id *)a6
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
    +[CIKernel kernelWithFunctionName:fromMetalLibraryData:outputGroupSize:error:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
  return 0;
}

+ (CIKernel)kernelWithFunctionName:(id)a3 fromMetalLibraryData:(id)a4 constants:(id)a5 error:(id *)a6
{
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("kCIKernelFunctionConstants");
  v8[0] = a5;
  return (CIKernel *)objc_msgSend((id)objc_opt_class(), "kernelWithFunctionName:fromMetalLibraryData:options:error:", a3, a4, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1), a6);
}

+ (CIKernel)kernelWithFunctionName:(id)a3 fromMetalLibraryData:(id)a4 options:(id)a5 error:(id *)a6
{
  NSObject *v11;
  CIKernelLibrary *v12;
  CIKernel *v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  _QWORD v29[2];
  void (*v30)(uint64_t);
  void *v31;
  id v32;
  id v33;
  _BYTE buf[22];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v11 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = objc_msgSend(a1, "description");
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = a3;
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithFunctionName:fromMetalLibraryData\", "%{public}@ %{public}@", buf, 0x16u);
  }
  v28 = 0;
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v30 = __70__CIKernel_kernelWithFunctionName_fromMetalLibraryData_options_error___block_invoke;
  v31 = &unk_1E2EC2EE0;
  v32 = a1;
  v33 = a3;
  v12 = +[CIKernelLibrary libraryWithData:error:](CIKernelLibrary, "libraryWithData:error:", a4, &v28);
  if (v12)
  {
    v13 = (CIKernel *)objc_msgSend((id)objc_opt_class(), "kernelWithFunctionName:fromCIKernelLibrary:options:error:", a3, v12, a5, a6);
    if (v13)
    {
      v14 = dyld_program_sdk_at_least();
      if (a6)
        v15 = v14;
      else
        v15 = 1;
      if ((v15 & 1) == 0)
        *a6 = 0;
    }
  }
  else
  {
    if (a6)
    {
      if (v28)
      {
        v16 = *MEMORY[0x1E0CB3388];
        v35[0] = CFSTR("CINonLocalizedDescriptionKey");
        v35[1] = v16;
        *(_QWORD *)buf = CFSTR("Cannot initialize kernel with given library data.");
        *(_QWORD *)&buf[8] = v28;
        v17 = 2;
      }
      else
      {
        v35[0] = CFSTR("CINonLocalizedDescriptionKey");
        *(_QWORD *)buf = CFSTR("Cannot initialize kernel with given library data.");
        v17 = 1;
      }
      v18 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v35, v17);
      *a6 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CIKernel"), 6, v18);
    }
    v19 = ci_logger_api();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[CIKernel kernelWithFunctionName:fromMetalLibraryData:options:error:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
    v13 = 0;
  }
  v30((uint64_t)v29);
  return v13;
}

void __70__CIKernel_kernelWithFunctionName_fromMetalLibraryData_options_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v2))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "description");
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithFunctionName:fromMetalLibraryData\", "%{public}@ %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

+ (CIKernel)kernelWithFunctionName:(id)a3 fromMetalLibrary:(id)a4 error:(id *)a5
{
  return (CIKernel *)objc_msgSend((id)objc_opt_class(), "kernelWithFunctionName:fromMetalLibrary:options:error:", a3, a4, 0, a5);
}

+ (CIKernel)kernelWithFunctionName:(id)a3 fromMetalLibrary:(id)a4 outputPixelFormat:(int)a5 error:(id *)a6
{
  uint64_t v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v9 = CI::format_modernize(*(uint64_t *)&a5, (CI *)"+[CIKernel kernelWithFunctionName:fromMetalLibrary:outputPixelFormat:error:]", (const char *)a3);
  v10 = (void *)objc_opt_class();
  v12 = CFSTR("kCIKernelOutputFormat");
  v13[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
  return (CIKernel *)objc_msgSend(v10, "kernelWithFunctionName:fromMetalLibrary:options:error:", a3, a4, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1), a6);
}

+ (CIKernel)kernelWithFunctionName:(id)a3 fromMetalLibrary:(id)a4 constants:(id)a5 error:(id *)a6
{
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("kCIKernelFunctionConstants");
  v8[0] = a5;
  return (CIKernel *)objc_msgSend((id)objc_opt_class(), "kernelWithFunctionName:fromMetalLibrary:options:error:", a3, a4, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1), a6);
}

+ (CIKernel)kernelWithFunctionName:(id)a3 fromMetalLibrary:(id)a4 options:(id)a5 error:(id *)a6
{
  NSObject *v11;
  CIKernelLibrary *v12;
  CIKernel *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  _QWORD v27[2];
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  id v31;
  _BYTE buf[22];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v11 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = objc_msgSend(a1, "description");
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = a3;
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithFunctionName:fromMetalLibrary\", "%{public}@ %{public}@", buf, 0x16u);
  }
  v26 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v28 = __66__CIKernel_kernelWithFunctionName_fromMetalLibrary_options_error___block_invoke;
  v29 = &unk_1E2EC2EE0;
  v30 = a1;
  v31 = a3;
  v12 = +[CIKernelLibrary libraryWithURL:error:](CIKernelLibrary, "libraryWithURL:error:", a4, &v26);
  if (v12)
  {
    v13 = (CIKernel *)objc_msgSend((id)objc_opt_class(), "kernelWithFunctionName:fromCIKernelLibrary:options:error:", a3, v12, a5, a6);
  }
  else
  {
    if (a6)
    {
      if (v26)
      {
        v14 = *MEMORY[0x1E0CB3388];
        v33[0] = CFSTR("CINonLocalizedDescriptionKey");
        v33[1] = v14;
        *(_QWORD *)buf = CFSTR("Cannot initialize kernel with given library URL.");
        *(_QWORD *)&buf[8] = v26;
        v15 = 2;
      }
      else
      {
        v33[0] = CFSTR("CINonLocalizedDescriptionKey");
        *(_QWORD *)buf = CFSTR("Cannot initialize kernel with given library URL.");
        v15 = 1;
      }
      v16 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v33, v15);
      *a6 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CIKernel"), 6, v16);
    }
    v17 = ci_logger_api();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[CIKernel kernelWithFunctionName:fromMetalLibrary:options:error:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
    v13 = 0;
  }
  v28((uint64_t)v27);
  return v13;
}

void __66__CIKernel_kernelWithFunctionName_fromMetalLibrary_options_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v2))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "description");
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithFunctionName:fromMetalLibrary\", "%{public}@ %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

+ (id)cachedKernelWithFunctionName:(id)a3 fromMetalLibrary:(id)a4 error:(id *)a5
{
  return (id)objc_msgSend((id)objc_opt_class(), "cachedKernelWithFunctionName:fromMetalLibrary:options:error:", a3, a4, 0, a5);
}

+ (id)cachedKernelWithFunctionName:(id)a3 fromMetalLibrary:(id)a4 outputPixelFormat:(int)a5 error:(id *)a6
{
  uint64_t v9;
  void *v10;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v9 = CI::format_modernize(*(uint64_t *)&a5, (CI *)"+[CIKernel cachedKernelWithFunctionName:fromMetalLibrary:outputPixelFormat:error:]", (const char *)a3);
  v10 = (void *)objc_opt_class();
  v12 = CFSTR("kCIKernelOutputFormat");
  v13[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
  return (id)objc_msgSend(v10, "cachedKernelWithFunctionName:fromMetalLibrary:options:error:", a3, a4, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1), a6);
}

+ (id)cachedKernelWithFunctionName:(id)a3 fromMetalLibrary:(id)a4 constants:(id)a5 error:(id *)a6
{
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("kCIKernelFunctionConstants");
  v8[0] = a5;
  return (id)objc_msgSend((id)objc_opt_class(), "cachedKernelWithFunctionName:fromMetalLibrary:options:error:", a3, a4, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1), a6);
}

+ (id)cachedKernelWithFunctionName:(id)a3 fromMetalLibrary:(id)a4 options:(id)a5 error:(id *)a6
{
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  _QWORD v27[2];
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  id v31;
  _BYTE buf[22];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v11 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = objc_msgSend(a1, "description");
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = a3;
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithFunctionName:fromMetalLibrary\", "%{public}@ %{public}@", buf, 0x16u);
  }
  v26 = 0;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v28 = __72__CIKernel_cachedKernelWithFunctionName_fromMetalLibrary_options_error___block_invoke;
  v29 = &unk_1E2EC2EE0;
  v30 = a1;
  v31 = a3;
  v12 = +[CIKernelLibrary cachedLibraryWithURL:error:](CIKernelLibrary, "cachedLibraryWithURL:error:", a4, &v26);
  if (v12)
  {
    v13 = (void *)objc_msgSend((id)objc_opt_class(), "cachedKernelWithFunctionName:fromCIKernelLibrary:options:error:", a3, v12, a5, a6);
  }
  else
  {
    if (a6)
    {
      if (v26)
      {
        v14 = *MEMORY[0x1E0CB3388];
        v33[0] = CFSTR("CINonLocalizedDescriptionKey");
        v33[1] = v14;
        *(_QWORD *)buf = CFSTR("Cannot initialize kernel with given library URL.");
        *(_QWORD *)&buf[8] = v26;
        v15 = 2;
      }
      else
      {
        v33[0] = CFSTR("CINonLocalizedDescriptionKey");
        *(_QWORD *)buf = CFSTR("Cannot initialize kernel with given library URL.");
        v15 = 1;
      }
      v16 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v33, v15);
      *a6 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CIKernel"), 6, v16);
    }
    v17 = ci_logger_api();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[CIKernel cachedKernelWithFunctionName:fromMetalLibrary:options:error:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
    v13 = 0;
  }
  v28((uint64_t)v27);
  return v13;
}

void __72__CIKernel_cachedKernelWithFunctionName_fromMetalLibrary_options_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v2))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "description");
    v4 = *(_QWORD *)(a1 + 40);
    v5 = 138543618;
    v6 = v3;
    v7 = 2114;
    v8 = v4;
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"kernelWithFunctionName:fromMetalLibrary\", "%{public}@ %{public}@", (uint8_t *)&v5, 0x16u);
  }
}

+ (CIKernel)kernelWithFunctionName:(id)a3 fromCIKernelLibrary:(id)a4 options:(id)a5 error:(id *)a6
{
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CIKernel *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  signed int v92;
  uint64_t v94;
  uint64_t v95;
  char v96;
  uint64_t i;
  uint64_t v98;
  id v99;
  int *var0;
  int64_t v101;
  char *v102;
  NSObject *v103;
  NSObject *v104;
  NSObject *v106;
  uint64_t v107;
  NSObject *v108;
  uint64_t v109;
  uint64_t v110;
  id *v111;
  id obj;
  _OWORD v113[2];
  void *__p;
  void *__dst;
  uint64_t v116;
  std::string v117;
  __int128 v118;
  __int128 v119;
  __int16 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  CIKernelReflection v129;
  vector<std::string, std::allocator<std::string>> *p_var6;
  _BYTE v131[128];
  _BYTE v132[128];
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v10 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("kCIKernelFunctionConstants"));
  if (CI_ENABLE_METAL_DAG())
  {
    memset(&v129.var2, 0, 88);
    *(int64x2_t *)&v129.var10 = vdupq_n_s64(1uLL);
    *(_WORD *)&v129.var12 = 0;
    if ((CIKernelReflection::reflect(&v129, (CIKernelLibrary *)a4, (char *)objc_msgSend(a3, "UTF8String"), (NSError **)a6) & 1) != 0)
    {
      if (v10)
        obj = CIKernelReflection::reflectConstants(&v129);
      else
        obj = 0;
      v20 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", CFSTR("kCIKernelOutputFormat")), "intValue");
      v129.var9 = CI::format_modernize(v20, (CI *)"+[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:]", v21);
      if (dyld_program_sdk_at_least())
      {
        v22 = objc_opt_class();
        if (v22 == objc_opt_class()
          && v129.var0 == 2
          && (int *)((char *)v129.var5.var1 - (char *)v129.var5.var0) == (int *)8)
        {
          if ((v23 = v129.var5.var0[1], *v129.var5.var0 == 8) && v23 == 8 || *v129.var5.var0 == 15 && v23 == 15)
            v129.var0 = 4;
        }
        v24 = objc_opt_class();
        if (v24 == objc_opt_class() && v129.var0 == 2)
        {
          CIKernelError(a6, 0xCu, CFSTR("Cannot initialize CIWarpKernel because the kernel appears to be a CIColorKernel."));
          v25 = ci_logger_api();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            +[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:].cold.2(v25, v26, v27, v28, v29, v30, v31, v32);
          goto LABEL_82;
        }
        v33 = objc_opt_class();
        if (v33 == objc_opt_class() && v129.var0 == 3)
        {
          CIKernelError(a6, 0xDu, CFSTR("Cannot initialize CIColorKernel because the kernel appears to be a CIWarpKernel."));
          v34 = ci_logger_api();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            +[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:].cold.3(v34, v35, v36, v37, v38, v39, v40, v41);
          goto LABEL_82;
        }
        v42 = objc_opt_class();
        if (v42 == objc_opt_class() && v129.var0 == 1)
        {
          CIKernelError(a6, 0xEu, CFSTR("Cannot initialize CIWarpKernel because the kernel appears to be a CIKernel."));
          v43 = ci_logger_api();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
            +[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:].cold.4(v43, v44, v45, v46, v47, v48, v49, v50);
          goto LABEL_82;
        }
        v51 = objc_opt_class();
        if (v51 == objc_opt_class() && v129.var0 == 1)
        {
          CIKernelError(a6, 0xFu, CFSTR("Cannot initialize CIColorKernel because the kernel appears to be a CIKernel."));
          v52 = ci_logger_api();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            +[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:].cold.5(v52, v53, v54, v55, v56, v57, v58, v59);
          goto LABEL_82;
        }
        v60 = objc_opt_class();
        if (v60 == objc_opt_class() && v129.var0 == 1)
        {
          CIKernelError(a6, 0x10u, CFSTR("Cannot initialize CIBlendKernel because the kernel appears to be a CIKernel."));
          v61 = ci_logger_api();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
            +[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:].cold.6(v61, v62, v63, v64, v65, v66, v67, v68);
          goto LABEL_82;
        }
        v69 = objc_opt_class();
        if (v69 == objc_opt_class() && v129.var0 == 2)
        {
          CIKernelError(a6, 0x11u, CFSTR("Cannot initialize CIBlendKernel because the kernel appears to be a CIColorKernel."));
          v70 = ci_logger_api();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            +[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:].cold.7(v70, v71, v72, v73, v74, v75, v76, v77);
          goto LABEL_82;
        }
        v78 = objc_opt_class();
        if (v78 == objc_opt_class() && v129.var0 == 3)
        {
          CIKernelError(a6, 0x12u, CFSTR("Cannot initialize CIBlendKernel because the kernel appears to be a CIWarpKernel."));
          v79 = ci_logger_api();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
            +[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:].cold.8(v79, v80, v81, v82, v83, v84, v85, v86);
          goto LABEL_82;
        }
      }
      v127 = 0u;
      v128 = 0u;
      v125 = 0u;
      v126 = 0u;
      v87 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v132, 16);
      if (v87)
      {
        v88 = *(_QWORD *)v126;
        while (2)
        {
          v89 = 0;
          do
          {
            if (*(_QWORD *)v126 != v88)
              objc_enumerationMutation(obj);
            v90 = *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * v89);
            v91 = (void *)objc_msgSend(v10, "objectForKey:", v90);
            v92 = objc_msgSend((id)objc_msgSend(obj, "objectForKeyedSubscript:", v90), "intValue");
            if (v92 > 0x35 || ((1 << v92) & 0x22222220010008) == 0)
            {
              if ((v92 - 57) <= 0xFFFFFFC9)
              {
                v107 = v92;
                CIKernelError(a6, 8u, CFSTR("Cannot initialize kernel because constant MTLDataType %lu is not supported."), v92);
                v108 = ci_logger_api();
                if (os_log_type_enabled(v108, OS_LOG_TYPE_ERROR))
                  +[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:].cold.9(v107, v108, v109);
                goto LABEL_82;
              }
              if (!v91)
              {
LABEL_78:
                CIKernelError(a6, 9u, CFSTR("Cannot initialize kernel because the constant value for %@ was not specified."), v90);
                v103 = ci_logger_api();
                if (os_log_type_enabled(v103, OS_LOG_TYPE_ERROR))
                  +[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:].cold.10();
                goto LABEL_82;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_86;
              v123 = 0u;
              v124 = 0u;
              v121 = 0u;
              v122 = 0u;
              v94 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v121, v131, 16);
              if (v94)
              {
                v110 = v88;
                v111 = a6;
                v95 = *(_QWORD *)v122;
                v96 = 1;
                do
                {
                  for (i = 0; i != v94; ++i)
                  {
                    if (*(_QWORD *)v122 != v95)
                      objc_enumerationMutation(v91);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                      v96 = 0;
                  }
                  v94 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v121, v131, 16);
                }
                while (v94);
                a6 = v111;
                v88 = v110;
                if ((v96 & 1) == 0)
                {
LABEL_86:
                  CIKernelError(a6, 0xBu, CFSTR("Cannot initialize kernel because %@ requires a constant value to be an NSArray of NSNumbers."), v90);
                  v106 = ci_logger_api();
                  if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
                    +[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:].cold.11();
                  goto LABEL_82;
                }
              }
            }
            else
            {
              if (!v91)
                goto LABEL_78;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                CIKernelError(a6, 0xAu, CFSTR("Cannot initialize kernel because %@ requires a constant value to be an NSNumbers."), v90);
                v104 = ci_logger_api();
                if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
                  +[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:].cold.12();
                goto LABEL_82;
              }
            }
            ++v89;
          }
          while (v89 != v87);
          v98 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v132, 16);
          v87 = v98;
          if (v98)
            continue;
          break;
        }
      }
      v99 = KernelKindAlloc(v129.var0);
      v113[0] = *(_OWORD *)&v129.var0;
      v113[1] = *(_OWORD *)&v129.var3;
      __dst = 0;
      v116 = 0;
      __p = 0;
      var0 = v129.var5.var0;
      v101 = (char *)v129.var5.var1 - (char *)v129.var5.var0;
      if (v129.var5.var1 != v129.var5.var0)
      {
        std::vector<CI::KernelArgumentType>::__vallocate[abi:nn180100](&__p, v101 >> 2);
        v102 = (char *)__dst;
        memmove(__dst, var0, v101);
        __dst = &v102[4 * (v101 >> 2)];
      }
      memset(&v117, 0, sizeof(v117));
      std::vector<std::string>::__init_with_size[abi:nn180100]<std::string*,std::string*>(&v117, (__int128 *)v129.var6.var0, (__int128 *)v129.var6.var1, 0xAAAAAAAAAAAAAAABLL * (((char *)v129.var6.var1 - (char *)v129.var6.var0) >> 3));
      v118 = *(_OWORD *)&v129.var7;
      v119 = *(_OWORD *)&v129.var10;
      v120 = *(_WORD *)&v129.var12;
      v19 = (CIKernel *)(id)objc_msgSend(v99, "_initWithReflection:constants:constantTypes:", v113, v10, obj);
      p_var6 = (vector<std::string, std::allocator<std::string>> *)&v117;
      std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&p_var6);
      if (__p)
      {
        __dst = __p;
        operator delete(__p);
      }
      goto LABEL_83;
    }
LABEL_82:
    v19 = 0;
LABEL_83:
    p_var6 = &v129.var6;
    std::vector<std::string>::__destroy_vector::operator()[abi:nn180100]((void ***)&p_var6);
    if (v129.var5.var0)
    {
      v129.var5.var1 = v129.var5.var0;
      operator delete(v129.var5.var0);
    }
    return v19;
  }
  CIKernelError(a6, 7u, CFSTR("Cannot initialize kernel with Metal DAG compiler disabled."));
  v11 = ci_logger_api();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    +[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
  return 0;
}

+ (NSArray)kernelNamesFromMetalLibraryData:(NSData *)data
{
  NSObject *v4;
  CIKernelLibrary *v5;
  NSArray *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v16;
  const __CFString *v17;
  uint64_t v18;
  uint8_t buf[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"kernelNamesFromMetalLibraryData\", (const char *)&unk_192520C83, buf, 2u);
  }
  if (!data || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || !-[NSData length](data, "length"))
  {
    v7 = ci_logger_api();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[CIKernel kernelNamesFromMetalLibraryData:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    goto LABEL_10;
  }
  v18 = 0;
  v5 = +[CIKernelLibrary libraryWithData:error:](CIKernelLibrary, "libraryWithData:error:", data, &v18);
  if (!v5)
  {
    v16 = ci_logger_api();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      if (v18)
        v17 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" = %@"), v18);
      else
        v17 = &stru_1E2ECD1B0;
      +[CIKernel kernelNamesFromMetalLibraryData:].cold.2((uint64_t)v17, buf);
    }
LABEL_10:
    v6 = (NSArray *)MEMORY[0x1E0C9AA60];
    goto LABEL_11;
  }
  v6 = -[CIKernelLibrary functionNames](v5, "functionNames");
LABEL_11:
  __44__CIKernel_kernelNamesFromMetalLibraryData___block_invoke();
  return v6;
}

void __44__CIKernel_kernelNamesFromMetalLibraryData___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"kernelNamesFromMetalLibraryData\", (const char *)&unk_192520C83, v1, 2u);
  }
}

+ (id)kernelNamesFromMetalLibrary:(id)a3
{
  NSObject *v4;
  CIKernelLibrary *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  uint64_t v18;
  uint8_t buf[24];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"kernelNamesFromMetalLibrary\", (const char *)&unk_192520C83, buf, 2u);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = ci_logger_api();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[CIKernel kernelNamesFromMetalLibrary:].cold.2(v7, v8, v9, v10, v11, v12, v13, v14);
    goto LABEL_13;
  }
  v18 = 0;
  v5 = +[CIKernelLibrary libraryWithURL:error:](CIKernelLibrary, "libraryWithURL:error:", a3, &v18);
  if (!v5)
  {
    v15 = ci_logger_api();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      if (v18)
        v16 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" = %@"), v18);
      else
        v16 = &stru_1E2ECD1B0;
      +[CIKernel kernelNamesFromMetalLibrary:].cold.1((uint64_t)v16, buf);
    }
LABEL_13:
    v6 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_14;
  }
  v6 = -[CIKernelLibrary functionNames](v5, "functionNames");
LABEL_14:
  __40__CIKernel_kernelNamesFromMetalLibrary___block_invoke();
  return v6;
}

void __40__CIKernel_kernelNamesFromMetalLibrary___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = ci_signpost_log_kernel();
  if (os_signpost_enabled(v0))
  {
    *(_WORD *)v1 = 0;
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "\"kernelNamesFromMetalLibrary\", (const char *)&unk_192520C83, v1, 2u);
  }
}

- (BOOL)perservesAlpha
{
  CI::Kernel *priv;

  priv = (CI::Kernel *)self->_priv;
  return (int)CI::Kernel::num_image_arguments(priv) >= 1 && *((_BYTE *)priv + 162) != 0;
}

- (void)setPerservesAlpha:(BOOL)a3
{
  CI::Kernel *priv;

  priv = (CI::Kernel *)self->_priv;
  if ((int)CI::Kernel::num_image_arguments(priv) >= 1)
    CI::Kernel::set_preserves_alpha((uint64_t)priv, a3);
}

- (BOOL)preservesRange
{
  CI::Kernel *priv;

  priv = (CI::Kernel *)self->_priv;
  return (int)CI::Kernel::num_image_arguments(priv) >= 1 && *((_BYTE *)priv + 163) != 0;
}

- (void)setPreservesRange:(BOOL)a3
{
  CI::Kernel *priv;

  priv = (CI::Kernel *)self->_priv;
  if ((int)CI::Kernel::num_image_arguments(priv) >= 1)
    CI::Kernel::set_preserves_range((uint64_t)priv, a3);
}

- (BOOL)canReduceOutputChannels
{
  CI::Kernel *priv;

  priv = (CI::Kernel *)self->_priv;
  return (int)CI::Kernel::num_image_arguments(priv) >= 1 && *((_BYTE *)priv + 160) != 0;
}

- (int)outputFormat
{
  return *((_DWORD *)self->_priv + 30);
}

- (CGSize)outputGroupSize
{
  unint64_t *priv;
  double v3;
  double v4;
  CGSize result;

  priv = (unint64_t *)self->_priv;
  v3 = (double)priv[16];
  v4 = (double)priv[17];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setOutputGroupSize:(CGSize)a3
{
  CI::Kernel::set_output_size((uint64_t)self->_priv, (unint64_t)a3.width, (unint64_t)a3.height);
}

- (NSString)name
{
  _QWORD *priv;

  priv = self->_priv;
  if (priv)
    return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", priv[3]);
  else
    return 0;
}

- (void)setROISelector:(SEL)method
{
  void *priv;
  NSString *v4;
  unsigned __int8 v5;
  uint64_t *v6;
  NSObject *v7;
  int v8;
  int v9;
  NSObject *v10;
  NSString *v11;
  _QWORD block[6];

  priv = self->_priv;
  v4 = NSStringFromSelector(method);
  v6 = &bicubicScaleTransformFilter_onceToken;
  if ((v5 & 1) == 0)
  {
    v11 = v4;
    v6 = &bicubicScaleTransformFilter_onceToken;
    v9 = v8;
    v4 = v11;
    if (v9)
    {
      v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      -[CIKernel setROISelector:]::queue = (uint64_t)dispatch_queue_create("CI::SetROISelectorQueue", v10);
      v6 = &bicubicScaleTransformFilter_onceToken;
      v4 = v11;
    }
  }
  v7 = v6[397];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__CIKernel_setROISelector___block_invoke;
  block[3] = &unk_1E2EC3DE0;
  block[4] = v4;
  block[5] = priv;
  dispatch_sync(v7, block);
}

void __27__CIKernel_setROISelector___block_invoke(uint64_t a1)
{
  CI::Kernel::set_roi_selector(*(CI::Kernel **)(a1 + 40), *(CFTypeRef *)(a1 + 32));
}

- (SEL)ROISelector
{
  SEL result;

  result = (SEL)*((_QWORD *)self->_priv + 14);
  if (result)
    return NSSelectorFromString((NSString *)result);
  return result;
}

+ (id)colorMatrixBiasKernel
{
  return -[CIKernel _initWithInternalRepresentation:]([CIColorKernel alloc], "_initWithInternalRepresentation:", &CI::_ci_colormatrix_canonical);
}

- (id)parameters
{
  char *priv;
  int v3;
  void *v4;
  uint64_t i;
  int type;
  uint64_t v7;
  void *v8;
  uint64_t *v9;
  const __CFString **v10;
  uint64_t v11;
  const __CFString *v13;
  uint64_t v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[3];
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[3];
  _QWORD v36[3];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[4];

  v42[2] = *MEMORY[0x1E0C80C00];
  priv = (char *)self->_priv;
  v3 = CI::Kernel::num_apply_arguments((CI::Kernel *)priv);
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v3);
  if (v3 >= 1)
  {
    for (i = 0; v3 != i; ++i)
    {
      if (priv[12])
      {
        type = CI::KernelArguments::get_type((CI::KernelArguments *)(priv + 144), i);
        if (priv[12])
        {
          if (!CI::KernelArguments::get_name((CI::KernelArguments *)(priv + 144), i))
            goto LABEL_13;
          goto LABEL_12;
        }
      }
      else if (i >= *((int *)priv + 5))
      {
        type = 0;
      }
      else
      {
        type = *(_DWORD *)(*((_QWORD *)priv + 9) + 4 * i);
      }
      if (i >= *((int *)priv + 5) || !*(_QWORD *)(*((_QWORD *)priv + 10) + 8 * i))
      {
LABEL_13:
        v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_arg%d"), i);
        goto LABEL_14;
      }
LABEL_12:
      v7 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
LABEL_14:
      switch(type)
      {
        case 1:
        case 2:
        case 3:
          v41[0] = CFSTR("CIAttributeClass");
          v41[1] = CFSTR("CIAttributeName");
          v42[0] = CFSTR("CISampler");
          v42[1] = v7;
          v8 = (void *)MEMORY[0x1E0C99D80];
          v9 = v42;
          v10 = (const __CFString **)v41;
          goto LABEL_29;
        case 4:
          v39[0] = CFSTR("CIAttributeClass");
          v39[1] = CFSTR("CIAttributeName");
          v40[0] = CFSTR("Sampler2D");
          v40[1] = v7;
          v8 = (void *)MEMORY[0x1E0C99D80];
          v9 = v40;
          v10 = (const __CFString **)v39;
          goto LABEL_29;
        case 5:
        case 12:
        case 19:
        case 23:
          v37[0] = CFSTR("CIAttributeClass");
          v37[1] = CFSTR("CIAttributeName");
          v38[0] = CFSTR("NSNumber");
          v38[1] = v7;
          v8 = (void *)MEMORY[0x1E0C99D80];
          v9 = v38;
          v10 = (const __CFString **)v37;
          goto LABEL_29;
        case 6:
        case 13:
          v35[0] = CFSTR("CIAttributeClass");
          v35[1] = CFSTR("CIVectorSize");
          v36[0] = CFSTR("CIVector");
          v36[1] = &unk_1E2F1BA40;
          v35[2] = CFSTR("CIAttributeName");
          v36[2] = v7;
          v8 = (void *)MEMORY[0x1E0C99D80];
          v9 = v36;
          v10 = (const __CFString **)v35;
          goto LABEL_31;
        case 7:
        case 14:
          v31[0] = CFSTR("CIAttributeClass");
          v31[1] = CFSTR("CIVectorSize");
          v32[0] = CFSTR("CIVector");
          v32[1] = &unk_1E2F1BA58;
          v31[2] = CFSTR("CIAttributeName");
          v32[2] = v7;
          v8 = (void *)MEMORY[0x1E0C99D80];
          v9 = v32;
          v10 = (const __CFString **)v31;
          goto LABEL_31;
        case 8:
        case 15:
          v27[0] = CFSTR("CIAttributeClass");
          v27[1] = CFSTR("CIVectorSize");
          v28[0] = CFSTR("CIVector");
          v28[1] = &unk_1E2F1BA70;
          v27[2] = CFSTR("CIAttributeName");
          v28[2] = v7;
          v8 = (void *)MEMORY[0x1E0C99D80];
          v9 = v28;
          v10 = (const __CFString **)v27;
          goto LABEL_31;
        case 9:
        case 16:
          v23[0] = CFSTR("CIAttributeClass");
          v23[1] = CFSTR("CIVectorSize");
          v24[0] = CFSTR("CIVector");
          v24[1] = &unk_1E2F1BA70;
          v23[2] = CFSTR("CIAttributeName");
          v24[2] = v7;
          v8 = (void *)MEMORY[0x1E0C99D80];
          v9 = v24;
          v10 = (const __CFString **)v23;
          goto LABEL_31;
        case 10:
        case 17:
          v21[0] = CFSTR("CIAttributeClass");
          v21[1] = CFSTR("CIVectorSize");
          v22[0] = CFSTR("CIVector");
          v22[1] = &unk_1E2F1BA88;
          v21[2] = CFSTR("CIAttributeName");
          v22[2] = v7;
          v8 = (void *)MEMORY[0x1E0C99D80];
          v9 = v22;
          v10 = (const __CFString **)v21;
          goto LABEL_31;
        case 11:
        case 18:
          v19[0] = CFSTR("CIAttributeClass");
          v19[1] = CFSTR("CIVectorSize");
          v20[0] = CFSTR("CIVector");
          v20[1] = &unk_1E2F1BAA0;
          v19[2] = CFSTR("CIAttributeName");
          v20[2] = v7;
          v8 = (void *)MEMORY[0x1E0C99D80];
          v9 = v20;
          v10 = (const __CFString **)v19;
          goto LABEL_31;
        case 20:
        case 24:
          v33[0] = CFSTR("CIAttributeClass");
          v33[1] = CFSTR("NSArrayCount");
          v34[0] = CFSTR("NSArray");
          v34[1] = &unk_1E2F1BA40;
          v33[2] = CFSTR("CIAttributeName");
          v34[2] = v7;
          v8 = (void *)MEMORY[0x1E0C99D80];
          v9 = v34;
          v10 = (const __CFString **)v33;
          goto LABEL_31;
        case 21:
        case 25:
          v29[0] = CFSTR("CIAttributeClass");
          v29[1] = CFSTR("NSArrayCount");
          v30[0] = CFSTR("NSArray");
          v30[1] = &unk_1E2F1BA58;
          v29[2] = CFSTR("CIAttributeName");
          v30[2] = v7;
          v8 = (void *)MEMORY[0x1E0C99D80];
          v9 = v30;
          v10 = (const __CFString **)v29;
          goto LABEL_31;
        case 22:
        case 26:
          v25[0] = CFSTR("CIAttributeClass");
          v25[1] = CFSTR("NSArrayCount");
          v26[0] = CFSTR("NSArray");
          v26[1] = &unk_1E2F1BA70;
          v25[2] = CFSTR("CIAttributeName");
          v26[2] = v7;
          v8 = (void *)MEMORY[0x1E0C99D80];
          v9 = v26;
          v10 = (const __CFString **)v25;
          goto LABEL_31;
        case 27:
          v17[0] = CFSTR("CIAttributeClass");
          v17[1] = CFSTR("CIVectorSize");
          v18[0] = CFSTR("CIColor");
          v18[1] = &unk_1E2F1BA70;
          v17[2] = CFSTR("CIAttributeName");
          v18[2] = v7;
          v8 = (void *)MEMORY[0x1E0C99D80];
          v9 = v18;
          v10 = (const __CFString **)v17;
LABEL_31:
          v11 = 3;
          break;
        case 28:
        case 29:
          v15[0] = CFSTR("CIAttributeClass");
          v15[1] = CFSTR("CIAttributeName");
          v16[0] = CFSTR("NSData");
          v16[1] = v7;
          v8 = (void *)MEMORY[0x1E0C99D80];
          v9 = v16;
          v10 = (const __CFString **)v15;
LABEL_29:
          v11 = 2;
          break;
        default:
          v13 = CFSTR("CIAttributeName");
          v14 = v7;
          v8 = (void *)MEMORY[0x1E0C99D80];
          v9 = &v14;
          v10 = &v13;
          v11 = 1;
          break;
      }
      objc_msgSend(v4, "addObject:", objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, v11));
    }
  }
  return v4;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %s>"), objc_msgSend((id)objc_opt_class(), "description"), *((_QWORD *)self->_priv + 3));
}

- (id)debugDescription
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__CIKernel_debugDescription__block_invoke;
  v3[3] = &unk_1E2EC2F58;
  v3[4] = self;
  return (id)(id)stream_to_string((uint64_t)v3);
}

uint64_t __28__CIKernel_debugDescription__block_invoke(uint64_t a1, FILE *a2)
{
  unsigned int *v4;
  uint64_t v5;
  const char *v6;
  int v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  FILE *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t result;
  const char *v23;
  const char *v24;
  unsigned int *v25;

  v4 = *(unsigned int **)(*(_QWORD *)(a1 + 32) + 8);
  v5 = (*(uint64_t (**)(unsigned int *))(*(_QWORD *)v4 + 72))(v4);
  v6 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
  fprintf(a2, "<%s: %p>", v6, *(const void **)(a1 + 32));
  if (objc_msgSend(*(id *)(a1 + 32), "name"))
    fprintf(a2, "\n    name: %s", (const char *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "name"), "UTF8String"));
  if (v5)
  {
    fwrite("\n    metal", 0xAuLL, 1uLL, a2);
    if (*(_BYTE *)(v5 + 48))
      fwrite(" stitchable", 0xBuLL, 1uLL, a2);
  }
  if (*((_BYTE *)v4 + 165))
    fwrite("\n    positionInvariant", 0x16uLL, 1uLL, a2);
  if (objc_msgSend(*(id *)(a1 + 32), "preservesRange"))
    fwrite("\n    preservesRange", 0x13uLL, 1uLL, a2);
  if (objc_msgSend(*(id *)(a1 + 32), "perservesAlpha"))
    fwrite("\n    preservesAlpha", 0x13uLL, 1uLL, a2);
  if (objc_msgSend(*(id *)(a1 + 32), "canReduceOutputChannels"))
    fwrite("\n    canReduceOutputChannels", 0x1CuLL, 1uLL, a2);
  v7 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "parameters"), "count");
  v25 = v4;
  if (v7)
  {
    fwrite("\n    arguments: (", 0x11uLL, 1uLL, a2);
    if (v7 >= 1)
    {
      for (i = 0; i != v7; ++i)
      {
        v9 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "parameters"), "objectAtIndex:", i);
        v10 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CIAttributeName"));
        v11 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CIAttributeClass"));
        v12 = (void *)objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("CIVectorSize"));
        objc_msgSend(v11, "UTF8String");
        if (v12)
        {
          objc_msgSend(v12, "intValue");
          objc_msgSend(v10, "UTF8String");
          fprintf(a2, "%s%s len%d %s");
        }
        else
        {
          objc_msgSend(v10, "UTF8String");
          fprintf(a2, "%s%s %s");
        }
      }
    }
    fputc(41, a2);
    v4 = v25;
  }
  v13 = (void *)(*(uint64_t (**)(unsigned int *))(*(_QWORD *)v4 + 40))(v4);
  if (objc_msgSend(v13, "count"))
  {
    fwrite("\n    constants: (", 0x11uLL, 1uLL, a2);
    v14 = (void *)objc_msgSend(v13, "keysSortedByValueUsingSelector:", sel_compare_);
    if (objc_msgSend(v13, "count"))
    {
      v15 = 0;
      do
      {
        v16 = (void *)objc_msgSend(v14, "objectAtIndexedSubscript:", v15);
        v17 = (void *)objc_msgSend(v13, "objectForKeyedSubscript:", v16);
        v18 = a2;
        if (v15)
          v19 = ", ";
        else
          v19 = "";
        v20 = objc_msgSend(v16, "UTF8String");
        if (v20)
          v21 = (const char *)v20;
        else
          v21 = "unknown";
        v24 = v19;
        a2 = v18;
        fprintf(v18, "%s%s = %s", v24, v21, (const char *)objc_msgSend((id)objc_msgSend(v17, "description"), "UTF8String"));
        ++v15;
      }
      while (v15 < objc_msgSend(v13, "count"));
    }
    fputc(41, a2);
    v4 = v25;
  }
  result = v4[30];
  if ((_DWORD)result)
  {
    v23 = CI::name_for_format(result);
    return fprintf(a2, "\n    output: %s", v23);
  }
  return result;
}

+ (id)SDOFV2MetalKernelNamed:(id)a3
{
  if (SDOFV2MetalLib::onceToken != -1)
    dispatch_once(&SDOFV2MetalLib::onceToken, &__block_literal_global_15);
  if (SDOFV2MetalLib::data)
    return +[CIKernel kernelWithFunctionName:fromMetalLibraryData:error:](CIKernel, "kernelWithFunctionName:fromMetalLibraryData:error:", a3, SDOFV2MetalLib::data, 0);
  else
    return 0;
}

+ (id)SDOFV3MetalKernelNamed:(id)a3
{
  if (SDOFV3MetalLib::onceToken != -1)
    dispatch_once(&SDOFV3MetalLib::onceToken, &__block_literal_global_26_1);
  if (SDOFV3MetalLib::data)
    return +[CIKernel kernelWithFunctionName:fromMetalLibraryData:error:](CIKernel, "kernelWithFunctionName:fromMetalLibraryData:error:", a3, SDOFV3MetalLib::data, 0);
  else
    return 0;
}

- (void)init
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s init is not a valid initializer for CIKernel", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)_initWithString:(NSObject *)a3 andCIKernelLibrary:usingCruftCompatibility:isInternal:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_4(&dword_1921E4000, a3, (uint64_t)a3, "[%{public}@ kernelWithString:] failed due to error parsing kernel source.", (uint8_t *)a2);
}

- (void)_initWithString:(NSObject *)a3 andCIKernelLibrary:usingCruftCompatibility:isInternal:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_4(&dword_1921E4000, a3, (uint64_t)a3, "[%{public}@ kernelWithString:] failed because no valid kernels were in the string.", (uint8_t *)a2);
}

- (void)_initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, v0, v1, "[CIWarpKernel kernelWithString:] failed because '%{public}s', the first kernel in the string, does not conform to the calling convensions of a CIWarpKernel.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, v0, v1, "[CIColorKernel kernelWithString:] failed because '%{public}s', the first kernel in the string, does not conform to the calling convensions of a CIColorKernel.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_13_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_18_0(&dword_1921E4000, v0, v1, "WARNING: CoreImage intrenal function name %{public}s must start with '_'\n", v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)_initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, v0, v1, "[CIColorKernel kernelWithString:fromMetalLibraryData:] Function '%{public}s' does not conform to the calling conventions of a CIColorKernel.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

- (void)_initWithString:andCIKernelLibrary:usingCruftCompatibility:isInternal:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, v0, v1, "[CIWarpKernel kernelWithString:fromMetalLibraryData:] Function '%{public}s' does not conform to the calling conventions of a CIWarpKernel.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

+ (void)kernelWithFunctionName:(uint64_t)a3 fromMetalLibraryData:(uint64_t)a4 outputGroupSize:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s User-specified output group size not yet supported.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)kernelWithFunctionName:(uint64_t)a3 fromMetalLibraryData:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Cannot initialize kernel with given library data.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)kernelWithFunctionName:(uint64_t)a3 fromMetalLibrary:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Cannot initialize kernel with given library URL.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)cachedKernelWithFunctionName:(uint64_t)a3 fromMetalLibrary:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Cannot initialize kernel with given library URL.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)kernelWithFunctionName:(uint64_t)a3 fromCIKernelLibrary:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Cannot initialize kernel with Metal DAG compiler disabled.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)kernelWithFunctionName:(uint64_t)a3 fromCIKernelLibrary:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Cannot initialize CIWarpKernel because the kernel appears to be a CIColorKernel.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)kernelWithFunctionName:(uint64_t)a3 fromCIKernelLibrary:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Cannot initialize CIColorKernel because the kernel appears to be a CIWarpKernel.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)kernelWithFunctionName:(uint64_t)a3 fromCIKernelLibrary:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Cannot initialize CIWarpKernel because the kernel appears to be a CIKernel.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)kernelWithFunctionName:(uint64_t)a3 fromCIKernelLibrary:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Cannot initialize CIColorKernel because the kernel appears to be a CIKernel.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)kernelWithFunctionName:(uint64_t)a3 fromCIKernelLibrary:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Cannot initialize CIBlendKernel because the kernel appears to be a CIKernel.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)kernelWithFunctionName:(uint64_t)a3 fromCIKernelLibrary:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Cannot initialize CIBlendKernel because the kernel appears to be a CIColorKernel.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)kernelWithFunctionName:(uint64_t)a3 fromCIKernelLibrary:(uint64_t)a4 options:(uint64_t)a5 error:(uint64_t)a6 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s Cannot initialize CIBlendKernel because the kernel appears to be a CIWarpKernel.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)kernelWithFunctionName:(uint64_t)a3 fromCIKernelLibrary:options:error:.cold.9(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136446466;
  v4 = "+[CIKernel kernelWithFunctionName:fromCIKernelLibrary:options:error:]";
  v5 = 2048;
  v6 = a1;
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, a2, a3, "%{public}s Cannot initialize kernel because constant MTLDataType %lu is not supported.", (uint8_t *)&v3);
  OUTLINED_FUNCTION_4_0();
}

+ (void)kernelWithFunctionName:fromCIKernelLibrary:options:error:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v0, v1, "%{public}s Cannot initialize kernel because the constant value for %{public}@ was not specified.", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

+ (void)kernelWithFunctionName:fromCIKernelLibrary:options:error:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v0, v1, "%{public}s Cannot initialize kernel because %{public}@ requires a constant value to be an NSArray of NSNumbers.", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

+ (void)kernelWithFunctionName:fromCIKernelLibrary:options:error:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v0, v1, "%{public}s Cannot initialize kernel because %{public}@ requires a constant value to be an NSNumbers.", (uint8_t *)v2);
  OUTLINED_FUNCTION_4_0();
}

+ (void)kernelNamesFromMetalLibraryData:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s [CIKernel kernelNamesFromMetalLibraryData:] passed an incorrect Metal library NSData argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)kernelNamesFromMetalLibraryData:(uint64_t)a1 .cold.2(uint64_t a1, _DWORD *a2)
{
  NSObject *v2;
  uint8_t *v3;

  *a2 = 136446466;
  OUTLINED_FUNCTION_16_0(a1, (uint64_t)a2, (uint64_t)"+[CIKernel kernelNamesFromMetalLibraryData:]");
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v2, (uint64_t)v2, "%{public}s [CIKernel kernelNamesFromMetalLibraryData:] error creating Metal library for NSData%{public}@", v3);
}

+ (void)kernelNamesFromMetalLibrary:(uint64_t)a1 .cold.1(uint64_t a1, _DWORD *a2)
{
  NSObject *v2;
  uint8_t *v3;

  *a2 = 136446466;
  OUTLINED_FUNCTION_16_0(a1, (uint64_t)a2, (uint64_t)"+[CIKernel kernelNamesFromMetalLibrary:]");
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, v2, (uint64_t)v2, "%{public}s [CIKernel kernelNamesFromMetalLibraryData:] error creating Metal library for NSData%{public}@", v3);
}

+ (void)kernelNamesFromMetalLibrary:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s [CIKernel kernelNamesFromMetalLibrary:] passed an incorrect Metal library URL argument", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)applyWithExtent:(uint64_t)a3 roiCallback:(uint64_t)a4 arguments:(uint64_t)a5 options:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s no image in arguments array.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)applyWithExtent:(CI::Kernel *)a1 roiCallback:arguments:options:.cold.2(CI::Kernel *a1)
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

@end
