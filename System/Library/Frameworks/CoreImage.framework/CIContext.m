@implementation CIContext

- (CIContext)initWithOptions:(NSDictionary *)options
{
  void *v5;
  CIContext *v6;
  int v7;
  BOOL v8;
  CI::Object *v9;
  CI::Object *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  int v15;
  char v16;
  int v17;
  CI::Object *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  const char *v28;
  const void *v29;
  char v30;
  char v31;
  _QWORD v33[5];
  objc_super v34;

  v5 = (void *)MEMORY[0x194026220](self, a2);
  v34.receiver = self;
  v34.super_class = (Class)CIContext;
  v6 = -[CIContext init](&v34, sel_init);
  if (!v6)
    goto LABEL_53;
  v7 = objc_msgSend(-[NSDictionary valueForKey:](options, "valueForKey:", CFSTR("CoreUI")), "BOOLValue");
  if (can_use_metal())
    v8 = objc_msgSend(-[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("software_renderer")), "intValue") == 2;
  else
    v8 = 0;
  if ((isWidget() & 1) == 0 && !v8)
  {
    if (!v7)
      goto LABEL_14;
    if (isSWAllowList(void)::onceToken != -1)
      dispatch_once(&isSWAllowList(void)::onceToken, &__block_literal_global_301);
    if (isSWAllowList(void)::allowed != 1)
    {
LABEL_14:
      if ((can_use_metal() & 1) != 0 || (CIGLIsUsable() & 1) != 0)
      {
        if (options)
          v11 = -[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("software_renderer"));
        else
          v11 = 0;
        v12 = (id)MEMORY[0x1E0C9AAB0];
        v13 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", options);
        objc_msgSend(v13, "removeObjectForKey:", CFSTR("software_renderer"));
        if (v11 == v12 || v11 == &unk_1E2F1B5D8)
          objc_msgSend(v13, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("priority_request_low"));
        v14 = -[NSDictionary objectForKeyedSubscript:](options, "objectForKeyedSubscript:", CFSTR("kCIContextUseMetalRenderer"));
        if (v14)
        {
          v15 = objc_msgSend(v14, "BOOLValue") ^ 1;
          v16 = v15;
        }
        else
        {
          LOBYTE(v15) = 0;
          v16 = 1;
        }
        v17 = CI_ENABLE_METAL_GPU();
        v18 = 0;
        if ((v15 & 1) == 0 && v17)
        {
          if (options)
            -[NSDictionary objectForKey:](options, "objectForKey:", CFSTR("kCIContextAllowLowPower"));
          v27 = CIMetalCopyDefaultDevice();
          if (v27)
          {
            v29 = v27;
            if (CIMetalDeviceIsSupported(v27, v28))
              v18 = +[CIContext internalContextWithMTLDevice:options:](CIContext, "internalContextWithMTLDevice:options:", v29, v13);
            else
              v18 = 0;
            CFRelease(v29);
          }
          else
          {
            v18 = 0;
          }
        }
        if (v18)
          v30 = 1;
        else
          v30 = v16;
        if ((v30 & 1) != 0
          && (v18
           || (v18 = +[CIContext internalGLContextWithOptions:](CIContext, "internalGLContextWithOptions:", v13)) != 0))
        {
          v33[0] = MEMORY[0x1E0C809B0];
          v33[1] = 3221225472;
          v33[2] = __29__CIContext_initWithOptions___block_invoke;
          v33[3] = &__block_descriptor_40_e8_v12__0B8l;
          v33[4] = v18;
          OptionIsTrueOrFalse(options, (uint64_t)CFSTR("kCIContextEnableBlending"), (uint64_t)v33);
          v6 = -[CIContext _initWithInternalRepresentation:](v6, "_initWithInternalRepresentation:", v18);
          if (CI_ENABLE_METAL_GPU())
            v31 = v15;
          else
            v31 = 1;
          if ((v31 & 1) == 0
            && objc_msgSend(-[NSDictionary valueForKey:](options, "valueForKey:", CFSTR("CoreUI")), "BOOLValue"))
          {
            -[CIContext loadArchive:](v6, "loadArchive:", CFSTR("coreui_archive"));
          }
          v10 = v18;
          goto LABEL_49;
        }
      }
      else
      {
        v19 = ci_logger_api();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[CIContext initWithOptions:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
      }

      v6 = 0;
      goto LABEL_53;
    }
  }
  v9 = +[CIContext internalSWContextWithOptions:](CIContext, "internalSWContextWithOptions:", options);
  v6 = -[CIContext _initWithInternalRepresentation:](v6, "_initWithInternalRepresentation:", v9);
  if (!v9)
    goto LABEL_50;
  v10 = v9;
LABEL_49:
  CI::Object::unref(v10);
LABEL_50:
  if (v6)
    CoreAnalytics(CFSTR("initWithOptions"), v6);
LABEL_53:
  objc_autoreleasePoolPop(v5);
  return v6;
}

+ (void)internalContextWithMTLDevice:(id)a3 options:(id)a4
{
  char *v6;
  void *v7;
  void *v8;

  if (!a3)
    return 0;
  v6 = objc_msgSend(a4, "valueForKey:", CFSTR("CoreUI")) ? "com.apple.CoreImage-Internal" : "com.apple.CoreImage";
  v7 = CIMetalCommandQueueCreate((uint64_t)v6, a3);
  if (!v7)
    return 0;
  v8 = v7;
  CFAutorelease(v7);
  return +[CIContext internalContextWithMTLCommandQueue:options:](CIContext, "internalContextWithMTLCommandQueue:options:", v8, a4);
}

- (id)_initWithInternalRepresentation:(void *)a3
{
  CIContext *v4;
  int v5;
  int v6;
  unsigned __int8 v7;
  int v8;
  void *dli_fbase;
  char *v10;
  const void **v11;
  int v12;
  const char *dli_sname;
  NSObject *v14;
  uint64_t v15;
  int v16;
  const char *v17;
  int v18;
  BOOL v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  objc_super v26;
  Dl_info v27;
  uint8_t buf[80];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v26.receiver = self;
    v26.super_class = (Class)CIContext;
    v4 = -[CIContext init](&v26, sel_init);
    if (v4)
    {
      if ((v4->_priv = malloc_type_calloc(1uLL, 0x58uLL, 0x1020040347FB3B5uLL),
            *(_QWORD *)v4->_priv = CI::Object::ref((uint64_t)a3),
            pthread_mutex_init((pthread_mutex_t *)((char *)v4->_priv + 8), 0),
            CI_PRINT_TREE())
        && (v5 = (*(uint64_t (**)(void *))(*(_QWORD *)a3 + 272))(a3),
            CI_PRINT_TREE_context(v5, (char *)a3 + 236))
        || CI_PRINT_TIME()
        && (v6 = (*(uint64_t (**)(void *))(*(_QWORD *)a3 + 272))(a3),
            CI_PRINT_TIME_context(v6, (char *)a3 + 236)))
      {
        if ((v7 & 1) == 0
        {
          log_context_creation(CI::Context *)::isInternalBuild = os_variant_has_internal_content();
        }
        if (log_context_creation(CI::Context *)::isInternalBuild)
        {
          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          v32 = 0u;
          v33 = 0u;
          v30 = 0u;
          v31 = 0u;
          v29 = 0u;
          memset(buf, 0, sizeof(buf));
          v8 = backtrace((void **)buf, 32);
          if (dladdr(*(const void **)buf, &v27))
            dli_fbase = v27.dli_fbase;
          else
            dli_fbase = 0;
          if (v8 >= 2)
          {
            v10 = (char *)(v8 - 1);
            v11 = (const void **)&buf[8];
            while (dladdr(*v11, &v27))
            {
              if (v27.dli_fbase != dli_fbase)
              {
                if (v27.dli_fname)
                  v10 = strrchr((char *)v27.dli_fname, 47);
                else
                  v10 = 0;
                v12 = 1;
                goto LABEL_20;
              }
              ++v11;
              if (!--v10)
              {
                v12 = 0;
                goto LABEL_20;
              }
            }
          }
          v12 = 0;
          v10 = 0;
LABEL_20:
          if ((v12 & (v27.dli_sname != 0)) != 0)
            dli_sname = v27.dli_sname;
          else
            dli_sname = "";
        }
        else
        {
          v12 = 0;
          v10 = 0;
          dli_sname = "";
        }
        v14 = ci_logger_api();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = (*(uint64_t (**)(void *))(*(_QWORD *)a3 + 304))(a3);
          v16 = (*(uint64_t (**)(void *))(*(_QWORD *)a3 + 272))(a3);
          v18 = *((unsigned __int8 *)a3 + 236);
          v17 = (char *)a3 + 236;
          v19 = v18 == 0;
          *(_DWORD *)buf = 136447746;
          if (v18)
            v20 = ":";
          else
            v20 = "";
          if (v19)
            v21 = "";
          else
            v21 = v17;
          *(_QWORD *)&buf[4] = v15;
          *(_WORD *)&buf[12] = 1026;
          v22 = "from";
          *(_DWORD *)&buf[14] = v16;
          if (!v12)
            v22 = "";
          *(_WORD *)&buf[18] = 2082;
          if (v10)
            v23 = v10 + 1;
          else
            v23 = "";
          *(_QWORD *)&buf[20] = v20;
          if (dli_sname)
            v24 = dli_sname;
          else
            v24 = "";
          *(_WORD *)&buf[28] = 2082;
          *(_QWORD *)&buf[30] = v21;
          *(_WORD *)&buf[38] = 2082;
          *(_QWORD *)&buf[40] = v22;
          *(_WORD *)&buf[48] = 2082;
          *(_QWORD *)&buf[50] = v23;
          *(_WORD *)&buf[58] = 2082;
          *(_QWORD *)&buf[60] = v24;
          _os_log_impl(&dword_1921E4000, v14, OS_LOG_TYPE_INFO, "Created CIContext (%{public}s context %{public}d%{public}s%{public}s) %{public}s %{public}s %{public}s", buf, 0x44u);
        }
      }
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

+ (CIContext)contextWithOptions:(NSDictionary *)options
{
  return -[CIContext initWithOptions:]([CIContext alloc], "initWithOptions:", options);
}

+ (void)internalContextWithMTLCommandQueue:(id)a3 options:(id)a4
{
  CGColorSpace *OutputColorSpaceFromOptions;
  CGColorSpace *v7;
  CGColorSpaceRef WorkingColorSpaceFromOptions;
  CGColorSpace *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  BOOL v17;
  BOOL v18;
  const char *v20;
  NSObject *v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  char v33;
  void *v34;
  char v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  unsigned int v41;
  const char *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  CGColorSpace *v56;
  _QWORD v57[5];
  _QWORD v58[5];
  _QWORD v59[5];
  _QWORD block[6];
  BOOL v61[9];

  if (!a3)
    return 0;
  v61[0] = 0;
  OutputColorSpaceFromOptions = (CGColorSpace *)GetOutputColorSpaceFromOptions((NSDictionary *)a4, v61);
  if (!v61[0])
    return 0;
  v7 = OutputColorSpaceFromOptions;
  WorkingColorSpaceFromOptions = GetWorkingColorSpaceFromOptions((NSDictionary *)a4, v61);
  if (!v61[0])
    return 0;
  v9 = WorkingColorSpaceFromOptions;
  v10 = (void *)objc_msgSend(a4, "valueForKey:", CFSTR("working_format"));
  v12 = v10;
  if (v10)
    v13 = objc_msgSend(v10, "intValue");
  else
    v13 = 0;
  v15 = CI::format_modernize(v13, (CI *)"+[CIContext(Internal) internalContextWithMTLCommandQueue:options:]", v11);
  v16 = v15;
  v56 = v9;
  if (v12)
  {
    v17 = v15 == 266 || v15 == 264;
    v18 = v17 || v15 == 2056;
    if (!v18 && v15 != 2312)
    {
      v20 = CI::name_for_format(v15);
      v16 = 0;
      v21 = ci_logger_api();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
      if (v20)
      {
        if (v22)
          +[CIContext(Internal) internalContextWithMTLCommandQueue:options:].cold.3();
      }
      else if (v22)
      {
        +[CIContext(Internal) internalContextWithMTLCommandQueue:options:].cold.2(v21, v23, v24, v25, v26, v27, v28, v29);
      }
    }
  }
  v30 = (void *)MEMORY[0x1E0C9AAA0];
  if (a4)
  {
    v31 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("output_premultiplied"));
    v33 = v31 != v30 && v31 != &unk_1E2F1B5C0;
    v34 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIContextAllowHalfPrecision"));
  }
  else
  {
    v34 = 0;
    v33 = 1;
  }
  v36 = v34 == (void *)MEMORY[0x1E0C9AAB0] || v34 == &unk_1E2F1B5D8;
  v37 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIContextIntermediateMemoryTarget"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38 = (int)objc_msgSend(v37, "intValue");
  }
  else
  {
    if (defaultIntermediateMemoryTarget(void)::onceToken != -1)
      dispatch_once(&defaultIntermediateMemoryTarget(void)::onceToken, &__block_literal_global_333);
    if (defaultIntermediateMemoryTarget(void)::targetMB)
      v38 = 256;
    else
      v38 = 0;
  }
  v39 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIContextMemoryLimit"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v40 = (int)objc_msgSend(v39, "intValue");
  else
    v40 = 0;
  v41 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("kCIContextIOSurfaceMemoryPoolID")), "unsignedIntValue");
  v14 = (void *)operator new();
  if (objc_msgSend(a4, "valueForKey:", CFSTR("CoreUI")))
    v42 = "com.apple.CoreImage-Internal";
  else
    v42 = "com.apple.CoreImage";
  CI::MetalContext::MetalContext((uint64_t)v14, a3, v42, v7, v56, v16, v33, v40, v38, v41, 0, v36);
  v43 = CI_ENABLE_METAL_CAPTURE();
  v44 = MEMORY[0x1E0C809B0];
  if (v43)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __66__CIContext_Internal__internalContextWithMTLCommandQueue_options___block_invoke;
    block[3] = &unk_1E2EC2EE0;
    block[4] = objc_msgSend(MEMORY[0x1E0CC6A48], "sharedCaptureManager");
    block[5] = a3;
    if (+[CIContext(Internal) internalContextWithMTLCommandQueue:options:]::once != -1)
      dispatch_once(&+[CIContext(Internal) internalContextWithMTLCommandQueue:options:]::once, block);
  }
  v45 = objc_msgSend(a4, "objectForKey:", CFSTR("kCIContextName"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v46 = (uint64_t)v14;
    v47 = (const __CFString *)v45;
  }
  else
  {
    if (!objc_msgSend(a4, "valueForKey:", CFSTR("CoreUI")))
      goto LABEL_60;
    v47 = CFSTR("CoreUI");
    v46 = (uint64_t)v14;
  }
  CI::Context::set_client_name(v46, v47);
LABEL_60:
  v48 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("quality"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v48, "floatValue");
    (*(void (**)(void *))(*(_QWORD *)v14 + 192))(v14);
  }
  v59[0] = v44;
  v59[1] = 3221225472;
  v59[2] = __66__CIContext_Internal__internalContextWithMTLCommandQueue_options___block_invoke_2;
  v59[3] = &__block_descriptor_40_e8_v12__0B8l;
  v59[4] = v14;
  OptionIsTrueOrFalse(a4, (uint64_t)CFSTR("high_quality_downsample"), (uint64_t)v59);
  if (a4)
    v49 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIContextCacheIntermediates"));
  else
    v49 = 0;
  v50 = (void *)MEMORY[0x1E0C9AAB0];
  if (v49 == (void *)MEMORY[0x1E0C9AAA0] || v49 == &unk_1E2F1B5C0)
  {
    (*(void (**)(void *, uint64_t))(*(_QWORD *)v14 + 224))(v14, 0xFFFFFFFFLL);
    if (a4)
      goto LABEL_68;
LABEL_70:
    v51 = 0;
    goto LABEL_71;
  }
  if (!a4)
    goto LABEL_70;
LABEL_68:
  v51 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("priority_request_low"));
LABEL_71:
  if (v51 == v50 || v51 == &unk_1E2F1B5D8)
  {
    (*(void (**)(void *, uint64_t))(*(_QWORD *)v14 + 256))(v14, 0xFFFFFFFFLL);
    if (a4)
      goto LABEL_74;
  }
  else if (a4)
  {
LABEL_74:
    v52 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("priority_request_high"));
    goto LABEL_77;
  }
  v52 = 0;
LABEL_77:
  if (v52 == v50 || v52 == &unk_1E2F1B5D8)
    (*(void (**)(void *, uint64_t))(*(_QWORD *)v14 + 256))(v14, 1);
  v58[0] = v44;
  v58[1] = 3221225472;
  v58[2] = __66__CIContext_Internal__internalContextWithMTLCommandQueue_options___block_invoke_3;
  v58[3] = &__block_descriptor_40_e8_v12__0B8l;
  v58[4] = v14;
  OptionIsTrueOrFalse(a4, (uint64_t)CFSTR("kCIContextAllowClampToAlpha"), (uint64_t)v58);
  v53 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIContextHLGOpticalScale"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v53, "floatValue");
    (*(void (**)(void *))(*(_QWORD *)v14 + 144))(v14);
  }
  else if (v53)
  {
    v54 = ci_logger_api();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
      +[CIContext(Internal) internalContextWithMTLCommandQueue:options:].cold.1();
  }
  v57[0] = v44;
  v57[1] = 3221225472;
  v57[2] = __66__CIContext_Internal__internalContextWithMTLCommandQueue_options___block_invoke_255;
  v57[3] = &__block_descriptor_40_e8_v12__0B8l;
  v57[4] = v14;
  OptionIsTrueOrFalse(a4, (uint64_t)CFSTR("kCIContextLossyCompressedIntermediates"), (uint64_t)v57);
  return v14;
}

uint64_t __66__CIContext_Internal__internalContextWithMTLCommandQueue_options___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 208))(*(_QWORD *)(a1 + 32));
}

- (void)_internalContext
{
  void **priv;

  priv = (void **)self->_priv;
  if (priv)
    return *priv;
  else
    return 0;
}

- (void)dealloc
{
  CI::Object *v3;
  objc_super v4;

  if (self->_priv)
  {
    v3 = -[CIContext _internalContext](self, "_internalContext");
    if (v3)
      CI::Object::unref(v3);
    pthread_mutex_destroy((pthread_mutex_t *)((char *)self->_priv + 8));
    free(self->_priv);
    self->_priv = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CIContext;
  -[CIContext dealloc](&v4, sel_dealloc);
}

+ (CIContext)context
{
  return +[CIContext contextWithOptions:](CIContext, "contextWithOptions:", 0);
}

- (id)device
{
  id *v2;

  v2 = -[CIContext _internalContext](self, "_internalContext");
  if ((*((unsigned int (**)(id *))*v2 + 2))(v2) == 77)
    return (id)CI::MetalContext::device(v2);
  else
    return 0;
}

- (id)internalCommandQueue
{
  CI::MetalContext *v2;

  v2 = -[CIContext _internalContext](self, "_internalContext");
  if ((*(unsigned int (**)(CI::MetalContext *))(*(_QWORD *)v2 + 16))(v2) == 77)
    return (id)CI::MetalContext::queue(v2);
  else
    return 0;
}

- (id)clientCommandQueue
{
  if (*((_BYTE *)self->_priv + 72))
    return -[CIContext internalCommandQueue](self, "internalCommandQueue");
  else
    return 0;
}

- (unint64_t)identifier
{
  unint64_t result;

  result = -[CIContext _internalContext](self, "_internalContext");
  if (result)
    return (*(int (**)(unint64_t))(*(_QWORD *)result + 272))(result);
  return result;
}

- (void)lock
{
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  os_signpost_id_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock((pthread_mutex_t *)((char *)self->_priv + 8));
  v3 = -[CIContext _internalContext](self, "_internalContext");
  v4 = v3[19] + 1;
  if (CI_KDEBUG())
  {
    (*(void (**)(_QWORD *))(*v3 + 272))(v3);
    kdebug_trace();
  }
  v5 = ci_signpost_log_render();
  v6 = (*(uint64_t (**)(_QWORD *))(*v3 + 272))(v3) << 32;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    v7 = 134217984;
    v8 = v4;
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v6, "render_lock", "frame %lu", (uint8_t *)&v7, 0xCu);
  }
  if ((int)CI_PRINT_TIME() >= 2)
  {
    v3[41] = 0;
    *((CFAbsoluteTime *)v3 + 42) = CFAbsoluteTimeGetCurrent();
  }
  if (CI_ENABLE_METAL_CAPTURE())
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CC6A48], "sharedCaptureManager"), "defaultCaptureScope"), "beginScope");
}

- (void)unlock
{
  _QWORD *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = -[CIContext _internalContext](self, "_internalContext");
  if (CI_KDEBUG())
  {
    (*(void (**)(_QWORD *))(*v3 + 272))(v3);
    kdebug_trace();
  }
  v4 = ci_signpost_log_render();
  v5 = (*(uint64_t (**)(_QWORD *))(*v3 + 272))(v3) << 32;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    v6 = v3[19];
    v7 = 134217984;
    v8 = v6;
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v4, OS_SIGNPOST_INTERVAL_END, v5, "render_lock", "frame %lu", (uint8_t *)&v7, 0xCu);
  }
  CI::Context::endFrame((CI::Context *)v3);
  if (CI_ENABLE_METAL_CAPTURE())
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CC6A48], "sharedCaptureManager"), "defaultCaptureScope"), "endScope");
  pthread_mutex_unlock((pthread_mutex_t *)((char *)self->_priv + 8));
}

- (BOOL)loadArchiveWithName:(id)a3 fromURL:(id)a4
{
  NSObject ***v6;
  _BOOL4 v7;

  v6 = -[CIContext _internalContext](self, "_internalContext");
  if (((unsigned int (*)(NSObject ***))(*v6)[2])(v6) == 77)
  {
    v7 = +[CIContext loadArchiveWithName:fromURL:](CIContext, "loadArchiveWithName:fromURL:", a3, a4);
    if (v7)
    {
      CI::MetalContext::add_archive(v6, (const __CFString *)a3);
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (BOOL)loadArchive:(id)a3
{
  NSObject ***v4;
  _BOOL4 v5;

  v4 = -[CIContext _internalContext](self, "_internalContext");
  if (((unsigned int (*)(NSObject ***))(*v4)[2])(v4) == 77)
  {
    v5 = +[CIContext loadArchive:](CIContext, "loadArchive:", a3);
    if (v5)
    {
      CI::MetalContext::add_archive(v4, (const __CFString *)a3);
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

+ (BOOL)loadArchiveWithName:(id)a3 fromURL:(id)a4
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  _QWORD v21[2];
  _QWORD v22[2];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = CI_USE_ARCHIVED_KERNELS();
  if (v6)
  {
    if ((CI_DISABLE_LOADING_ARCHIVES() & 1) == 0
      && (!CI_DISABLE_LOADING_ARCHIVES_BY_NAME()
       || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", CI_DISABLE_LOADING_ARCHIVES_BY_NAME(), 1), "containsString:", a3) & 1) == 0))
    {
      v7 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@.metallib"), a4, a3));
      v8 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@_bin.metallib"), a4, a3));
      if (v7 | v8)
      {
        v9 = v8;
        v10 = (void *)CI::MetalContext::binaryArchiveCache((CI::MetalContext *)v8);
        objc_sync_enter(v10);
        v11 = objc_msgSend(v10, "objectForKey:", a3);
        if (v11)
        {
LABEL_7:
          v12 = 1;
LABEL_8:
          objc_sync_exit(v10);
          if (v11)
            LOBYTE(v6) = v12;
          else
            LOBYTE(v6) = 0;
          return v6;
        }
        v14 = CILoadAIRArchive(v7, 1);
        if (CI_USE_ARCHIVED_KERNELS() == 2)
          v15 = CILoadBinaryArchive(v9, 1);
        else
          v15 = 0;
        if (!(v14 | v15))
        {
          v17 = ci_logger_api();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            +[CIContext loadArchiveWithName:fromURL:].cold.2();
          v12 = 0;
          v11 = 0;
          goto LABEL_8;
        }
        if (v14 && !v15)
        {
          v16 = ci_logger_api();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            +[CIContext loadArchiveWithName:fromURL:].cold.1();
          v11 = 0;
          goto LABEL_7;
        }
        if (v14 || !v15)
        {
          v21[0] = CFSTR("air");
          v21[1] = CFSTR("bin");
          v22[0] = v14;
          v22[1] = v15;
          v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
          v18 = ci_logger_api();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            goto LABEL_34;
          *(_DWORD *)buf = 136446722;
          v24 = "+[CIContext loadArchiveWithName:fromURL:]";
          v25 = 2114;
          v26 = a3;
          v27 = 2114;
          v28 = a4;
          v19 = "%{public}s Loaded %{public}@ CoreImage AIR and binary archive from url %{public}@";
        }
        else
        {
          v29 = CFSTR("bin");
          v30[0] = v15;
          v11 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
          v18 = ci_logger_api();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            goto LABEL_34;
          *(_DWORD *)buf = 136446722;
          v24 = "+[CIContext loadArchiveWithName:fromURL:]";
          v25 = 2114;
          v26 = a3;
          v27 = 2114;
          v28 = a4;
          v19 = "%{public}s Loaded %{public}@ CoreImage stitched libraries binary archive from url %{public}@";
        }
        _os_log_impl(&dword_1921E4000, v18, OS_LOG_TYPE_INFO, v19, buf, 0x20u);
LABEL_34:
        if (v11)
          objc_msgSend(v10, "setObject:forKey:", v11, a3);
        goto LABEL_7;
      }
      v13 = ci_logger_api();
      v6 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      if (!v6)
        return v6;
      +[CIContext loadArchiveWithName:fromURL:].cold.3();
    }
    LOBYTE(v6) = 0;
  }
  return v6;
}

+ (BOOL)loadArchive:(id)a3
{
  int v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  _QWORD v24[2];
  _QWORD v25[2];
  const __CFString *v26;
  uint64_t v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = CI_USE_ARCHIVED_KERNELS();
  if (!v4)
    return v4;
  if ((CI_DISABLE_LOADING_ARCHIVES() & 1) != 0
    || CI_DISABLE_LOADING_ARCHIVES_BY_NAME()
    && (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", CI_DISABLE_LOADING_ARCHIVES_BY_NAME(), 1), "containsString:", a3) & 1) != 0)
  {
    goto LABEL_32;
  }
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("portrait_filters_archive")) & 1) == 0
    && !objc_msgSend(a3, "isEqualToString:", CFSTR("portrait_filters_fullsize_archive"))
    || (+[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIPortraitEffectLightV2")),
        v5 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()),
        !objc_msgSend(v5, "URLForResource:withExtension:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_bin"), a3), CFSTR("metallib"))))
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v8 = objc_msgSend(v7, "URLForResource:withExtension:", a3, CFSTR("metallib"));
    v9 = objc_msgSend(v7, "URLForResource:withExtension:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_bin"), a3), CFSTR("metallib"));
    if (v8 | v9)
    {
      v10 = v9;
      v11 = (void *)CI::MetalContext::binaryArchiveCache((CI::MetalContext *)v9);
      if ((objc_msgSend(a3, "isEqualToString:", CFSTR("portrait_filters_archive")) & 1) != 0
        || (objc_msgSend(a3, "isEqualToString:", CFSTR("portrait_filters_fullsize_archive")) & 1) != 0)
      {
        v12 = 1;
      }
      else
      {
        v12 = objc_msgSend(a3, "isEqualToString:", CFSTR("photo_style_archive"));
      }
      v14 = objc_msgSend(a3, "isEqualToString:", CFSTR("redeye_repair_archive"));
      objc_sync_enter(v11);
      v15 = objc_msgSend(v11, "objectForKey:", a3);
      if (v15)
      {
LABEL_19:
        objc_sync_exit(v11);
        objc_msgSend(a3, "isEqualToString:", CFSTR("coreui_archive"));
        LOBYTE(v4) = v15 != 0;
        return v4;
      }
      v16 = v12 | v14;
      v17 = CILoadAIRArchive(v8, v16);
      if (CI_USE_ARCHIVED_KERNELS() == 2)
        v18 = CILoadBinaryArchive(v10, v16);
      else
        v18 = 0;
      if (v17 | v18)
      {
        if (v17 && !v18)
        {
          v19 = ci_logger_api();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            +[CIContext loadArchive:].cold.1();
          v15 = 0;
          goto LABEL_19;
        }
        if (v17 || !v18)
        {
          v24[0] = CFSTR("air");
          v24[1] = CFSTR("bin");
          v25[0] = v17;
          v25[1] = v18;
          v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
          v21 = ci_logger_api();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            goto LABEL_41;
          *(_DWORD *)buf = 136446466;
          v29 = "+[CIContext loadArchive:]";
          v30 = 2114;
          v31 = a3;
          v22 = "%{public}s Loaded %{public}@ CoreImage AIR and binary archive";
        }
        else
        {
          v26 = CFSTR("bin");
          v27 = v18;
          v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
          v21 = ci_logger_api();
          if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            goto LABEL_41;
          *(_DWORD *)buf = 136446466;
          v29 = "+[CIContext loadArchive:]";
          v30 = 2114;
          v31 = a3;
          v22 = "%{public}s Loaded %{public}@ CoreImage stitched libraries binary archive";
        }
        _os_log_impl(&dword_1921E4000, v21, OS_LOG_TYPE_INFO, v22, buf, 0x16u);
LABEL_41:
        if (v15)
          objc_msgSend(v11, "setObject:forKey:", v15, a3);
        goto LABEL_19;
      }
      v20 = ci_logger_api();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        +[CIContext loadArchive:].cold.2();
      objc_sync_exit(v11);
    }
    else
    {
      v13 = ci_logger_api();
      v4 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      if (!v4)
        return v4;
      +[CIContext loadArchive:].cold.3();
    }
LABEL_32:
    LOBYTE(v4) = 0;
    return v4;
  }
  v6 = ci_logger_api();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446722;
    v29 = "+[CIContext loadArchive:]";
    v30 = 2112;
    v31 = a3;
    v32 = 2112;
    v33 = objc_msgSend(v5, "bundleURL");
    _os_log_impl(&dword_1921E4000, v6, OS_LOG_TYPE_INFO, "%{public}s Loading %@ from PortraitFilters bundle at: %@", buf, 0x20u);
  }
  LOBYTE(v4) = +[CIContext loadArchiveWithName:fromURL:](CIContext, "loadArchiveWithName:fromURL:", a3, objc_msgSend(v5, "bundleURL"));
  return v4;
}

+ (void)clearArchives
{
  void *v2;

  v2 = (void *)CI::MetalContext::binaryArchiveCache((CI::MetalContext *)a1);
  objc_sync_enter(v2);
  objc_msgSend(v2, "removeAllObjects");
  objc_sync_exit(v2);
}

+ (void)purgeArchive:(id)a3
{
  void *v4;

  v4 = (void *)CI::MetalContext::binaryArchiveCache((CI::MetalContext *)a1);
  objc_sync_enter(v4);
  objc_msgSend(v4, "removeObjectForKey:", a3);
  objc_sync_exit(v4);
}

+ (id)_singletonContext
{
  unsigned __int8 v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  {
    v4[0] = CFSTR("kCIContextName");
    v4[1] = CFSTR("kCIContextCacheIntermediates");
    v5[0] = CFSTR("CISingletonContext");
    v5[1] = MEMORY[0x1E0C9AAA0];
    +[CIContext _singletonContext]::context = +[CIContext contextWithOptions:](CIContext, "contextWithOptions:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2));
  }
  return (id)+[CIContext _singletonContext]::context;
}

- (BOOL)testArchive:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = objc_msgSend(v4, "URLForResource:withExtension:", a3, CFSTR("metallib"));
  v6 = objc_msgSend(v4, "URLForResource:withExtension:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_bin"), a3), CFSTR("metallib"));
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    NSLog(CFSTR("Failed to load %@.metallib for prewarming"), a3);
  }
  else
  {
    v8 = v6;
    v9 = (void *)CILoadAIRArchive(v5, 1);
    v10 = CILoadBinaryArchive(v8, 1);
    if (v9)
      v11 = v10 == 0;
    else
      v11 = 1;
    if (!v11)
      testBinaryArchive(v9, v10);
  }
  return 0;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  void *v6;
  uint64_t v7;
  CGColorSpace *v8;
  CGColorSpace *v9;
  NSObject *v10;
  NSObject *v11;
  void (*v12)(uint64_t);
  NSObject *v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;

  v6 = -[CIContext _internalContext](self, "_internalContext");
  if (!v6)
    return;
  v7 = (uint64_t)v6;
  (*(void (**)(void *))(*(_QWORD *)v6 + 328))(v6);
  if (!objc_msgSend(a4, "isEqual:", CFSTR("output_color_space")))
  {
    if (objc_msgSend(a4, "isEqual:", CFSTR("working_color_space")))
    {
      if (CI::ColorSpace_is_RGB_or_Gray_and_supports_output((_BOOL8)a3, v9))
      {
        CI::Context::updateWorkingSpace((CGColorSpaceRef *)v7, (CGColorSpaceRef)a3);
        return;
      }
      v11 = ci_logger_api();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      return;
    }
    if (objc_msgSend(a4, "isEqual:", CFSTR("kCIContextName")))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        CI::Context::set_client_name(v7, (CFStringRef)a4);
        return;
      }
      v13 = ci_logger_api();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_19;
      return;
    }
    if (objc_msgSend(a4, "isEqual:", CFSTR("quality")))
    {
      objc_msgSend(a3, "floatValue");
      v12 = *(void (**)(uint64_t))(*(_QWORD *)v7 + 192);
LABEL_17:
      v12(v7);
      return;
    }
    if (objc_msgSend(a4, "isEqual:", CFSTR("high_quality_downsample")))
    {
      if (a3 != (id)MEMORY[0x1E0C9AAB0])
      {
        if (a3 != (id)MEMORY[0x1E0C9AAA0])
          return;
        v14 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)v7 + 208);
        goto LABEL_25;
      }
      v14 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)v7 + 208);
LABEL_35:
      v15 = v7;
      v16 = 1;
      goto LABEL_36;
    }
    if (objc_msgSend(a4, "isEqual:", CFSTR("kCIContextAllowClampToAlpha")))
    {
      if (a3 == (id)MEMORY[0x1E0C9AAB0])
      {
        *(_BYTE *)(v7 + 41) = 1;
      }
      else if (a3 == (id)MEMORY[0x1E0C9AAA0])
      {
        *(_BYTE *)(v7 + 41) = 0;
      }
      return;
    }
    if (objc_msgSend(a4, "isEqual:", CFSTR("kCIContextHLGOpticalScale")))
    {
      if (!a4)
      {
        v12 = *(void (**)(uint64_t))(*(_QWORD *)v7 + 144);
        goto LABEL_17;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(a4, "floatValue");
        v12 = *(void (**)(uint64_t))(*(_QWORD *)v7 + 144);
        goto LABEL_17;
      }
      v19 = ci_logger_api();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        return;
    }
    else
    {
      if (!objc_msgSend(a4, "isEqual:", CFSTR("kCIContextLossyCompressedIntermediates")))
      {
        v18 = ci_logger_api();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[CIContext setObject:forKey:].cold.6();
        return;
      }
      if (a3 == (id)MEMORY[0x1E0C9AAB0])
      {
        v14 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)v7 + 160);
        goto LABEL_35;
      }
      if (a3 == (id)MEMORY[0x1E0C9AAA0])
      {
        v14 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)v7 + 160);
LABEL_25:
        v15 = v7;
        v16 = 0;
LABEL_36:
        v14(v15, v16);
        return;
      }
      v17 = ci_logger_api();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        return;
    }
LABEL_19:
    -[CIContext setObject:forKey:].cold.1();
    return;
  }
  if (CI::ColorSpace_is_RGB_or_Gray_and_supports_output((_BOOL8)a3, v8))
  {
    CI::Context::updateColorSpace((CGColorSpaceRef *)v7, (CGColorSpaceRef)a3);
    return;
  }
  v10 = ci_logger_api();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    goto LABEL_19;
}

- (id)objectForKey:(id)a3
{
  id result;
  id v5;
  CGColorSpace *v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *v10;

  result = -[CIContext _internalContext](self, "_internalContext");
  if (result)
  {
    v5 = result;
    if (objc_msgSend(a3, "isEqual:", CFSTR("output_color_space")))
    {
      v6 = (CGColorSpace *)*((_QWORD *)v5 + 2);
      if (v6)
        goto LABEL_4;
      return (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    }
    if (objc_msgSend(a3, "isEqual:", CFSTR("working_color_space")))
    {
      v6 = (CGColorSpace *)*((_QWORD *)v5 + 3);
      if (v6)
      {
LABEL_4:
        v7 = dyld_program_sdk_at_least();
        result = CGColorSpaceRetain(v6);
        if (v7)
          return (id)(id)CFMakeCollectable(result);
        return result;
      }
      return (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    }
    if (objc_msgSend(a3, "isEqual:", CFSTR("quality")))
    {
      if ((*(float (**)(id))(*(_QWORD *)v5 + 200))(v5) == 0.0)
        return &unk_1E2F19250;
      v8 = (void *)MEMORY[0x1E0CB37E8];
      return (id)objc_msgSend(v8, "numberWithFloat:");
    }
    if (objc_msgSend(a3, "isEqual:", CFSTR("high_quality_downsample")))
    {
      if ((*(unsigned int (**)(id))(*(_QWORD *)v5 + 216))(v5))
        return (id)MEMORY[0x1E0C9AAB0];
      else
        return (id)MEMORY[0x1E0C9AAA0];
    }
    else if (objc_msgSend(a3, "isEqual:", CFSTR("kCIContextAllowClampToAlpha")))
    {
      if (*((_BYTE *)v5 + 41))
        return (id)MEMORY[0x1E0C9AAB0];
      else
        return (id)MEMORY[0x1E0C9AAA0];
    }
    else
    {
      if (objc_msgSend(a3, "isEqual:", CFSTR("kCIContextHLGOpticalScale")))
      {
        v9 = (void *)MEMORY[0x1E0CB37E8];
        (*(void (**)(id))(*(_QWORD *)v5 + 152))(v5);
        v8 = v9;
        return (id)objc_msgSend(v8, "numberWithFloat:");
      }
      if (objc_msgSend(a3, "isEqual:", CFSTR("kCIContextLossyCompressedIntermediates")))
      {
        return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (*(uint64_t (**)(id))(*(_QWORD *)v5 + 168))(v5));
      }
      else
      {
        v10 = ci_logger_api();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[CIContext objectForKey:].cold.1();
        return 0;
      }
    }
  }
  return result;
}

- (void)abort
{
  void *v2;

  v2 = -[CIContext _internalContext](self, "_internalContext");
  if (v2)
    (*(void (**)(void *, uint64_t))(*(_QWORD *)v2 + 240))(v2, 1);
}

- (CIContext)init
{
  return -[CIContext initWithOptions:](self, "initWithOptions:", 0);
}

uint64_t __29__CIContext_initWithOptions___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 280))(*(_QWORD *)(a1 + 32));
}

+ (CIContext)contextWithCGContext:(CGContextRef)cgctx options:(NSDictionary *)options
{
  return -[CIContext initWithCGContext:options:]([CIContext alloc], "initWithCGContext:options:", cgctx, options);
}

- (CIContext)initWithCGContext:(CGContext *)a3 options:(id)a4
{
  void *v7;
  int Type;
  uint64_t ColorSpace;
  CIContext *v10;
  uint64_t Property;
  CIContext *v12;
  CI::Context *v13;
  CI::Context *v14;
  double Width;
  size_t Height;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x194026220](self, a2);
  if (!a3)
  {
    v10 = -[CIContext initWithOptions:](self, "initWithOptions:", a4);
    goto LABEL_20;
  }
  Type = CGContextGetType();
  switch(Type)
  {
    case 10:
      ColorSpace = CGMetalContextGetColorSpace();
      break;
    case 8:
      ColorSpace = CGIOSurfaceContextGetColorSpace();
      break;
    case 4:
      ColorSpace = (uint64_t)CGBitmapContextGetColorSpace(a3);
      break;
    default:
      goto LABEL_10;
  }
  Property = ColorSpace;
  if (ColorSpace)
    goto LABEL_11;
LABEL_10:
  Property = CGContextGetProperty();
  if (Property)
  {
LABEL_11:
    if (a4)
    {
      if (!objc_msgSend(a4, "objectForKey:", CFSTR("output_color_space")))
      {
        a4 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", a4);
        objc_msgSend(a4, "setValue:forKey:", Property, CFSTR("output_color_space"));
      }
    }
    else
    {
      v18 = CFSTR("output_color_space");
      v19[0] = Property;
      a4 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    }
  }
  objc_msgSend(a4, "objectForKey:", CFSTR("default_CGImage_format"));
  v12 = -[CIContext initWithOptions:](self, "initWithOptions:", a4);
  v10 = v12;
  if (v12)
  {
    v13 = -[CIContext _internalContext](v12, "_internalContext");
    if (v13)
    {
      v14 = v13;
      CI::Context::set_cgcontext(v13, a3);
      if (CGContextGetType() == 4)
      {
        Width = (double)CGBitmapContextGetWidth(a3);
        Height = CGBitmapContextGetHeight(a3);
        (*(void (**)(CI::Context *, double, double, double, double))(*(_QWORD *)v14 + 176))(v14, 0.0, 0.0, Width, (double)Height);
      }
    }
    CoreAnalytics(CFSTR("contextWithCGContext"), v10);
  }
LABEL_20:
  objc_autoreleasePoolPop(v7);
  return v10;
}

+ (CIContext)contextWithEAGLContext:(EAGLContext *)eaglContext
{
  return -[CIContext initWithEAGLContext:]([CIContext alloc], "initWithEAGLContext:", eaglContext);
}

+ (CIContext)contextWithEAGLContext:(EAGLContext *)eaglContext options:(NSDictionary *)options
{
  return -[CIContext initWithEAGLContext:options:]([CIContext alloc], "initWithEAGLContext:options:", eaglContext, options);
}

- (CIContext)initWithEAGLContext:(id)a3
{
  return -[CIContext initWithEAGLContext:options:](self, "initWithEAGLContext:options:", a3, 0);
}

- (CIContext)initWithEAGLContext:(id)a3 options:(id)a4
{
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CIContext *v16;
  CI::Object *v17;
  objc_super v19;

  v7 = (void *)MEMORY[0x194026220](self, a2);
  if (CIEAGLContextGetAPI(a3) - 4 > 0xFFFFFFFD)
  {
    v19.receiver = self;
    v19.super_class = (Class)CIContext;
    v16 = -[CIContext init](&v19, sel_init);
    if (v16)
    {
      v17 = +[CIContext internalContextWithEAGLContext:options:](CIContext, "internalContextWithEAGLContext:options:", a3, a4);
      v16 = -[CIContext _initWithInternalRepresentation:](v16, "_initWithInternalRepresentation:", v17);
      if (v17)
        CI::Object::unref(v17);
      if (v16)
        CoreAnalytics(CFSTR("contextWithEAGLContext"), v16);
    }
  }
  else
  {
    v8 = ci_logger_api();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CIContext initWithEAGLContext:options:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    v16 = 0;
  }
  objc_autoreleasePoolPop(v7);
  return v16;
}

+ (CIContext)contextWithMTLDevice:(id)device
{
  return -[CIContext initWithMTLDevice:options:]([CIContext alloc], "initWithMTLDevice:options:", device, 0);
}

+ (CIContext)contextWithMTLDevice:(id)device options:(NSDictionary *)options
{
  return -[CIContext initWithMTLDevice:options:]([CIContext alloc], "initWithMTLDevice:options:", device, options);
}

- (CIContext)initWithMTLDevice:(id)a3 options:(id)a4
{
  void *v7;
  CIContext *v8;
  CIContext *v9;
  CI::Object *v10;
  CIContext *v11;
  objc_super v13;

  v7 = (void *)MEMORY[0x194026220](self, a2);
  v13.receiver = self;
  v13.super_class = (Class)CIContext;
  v8 = -[CIContext init](&v13, sel_init);
  if (v8)
  {
    v9 = v8;
    v10 = +[CIContext internalContextWithMTLDevice:options:](CIContext, "internalContextWithMTLDevice:options:", a3, a4);
    v11 = -[CIContext _initWithInternalRepresentation:](v9, "_initWithInternalRepresentation:", v10);
    if (v10)
      CI::Object::unref(v10);
    if (v11)
      CoreAnalytics(CFSTR("contextWithMTLDevice"), v11);
  }
  else
  {
    v11 = 0;
  }
  objc_autoreleasePoolPop(v7);
  return v11;
}

- (CIContext)initWithMTLCommandQueue:(id)a3 options:(id)a4
{
  void *v7;
  CIContext *v8;
  CIContext *v9;
  CI::Object *v10;
  CIContext *v11;
  objc_super v13;

  v7 = (void *)MEMORY[0x194026220](self, a2);
  v13.receiver = self;
  v13.super_class = (Class)CIContext;
  v8 = -[CIContext init](&v13, sel_init);
  if (v8)
  {
    v9 = v8;
    v10 = +[CIContext internalContextWithMTLCommandQueue:options:](CIContext, "internalContextWithMTLCommandQueue:options:", a3, a4);
    v11 = -[CIContext _initWithInternalRepresentation:](v9, "_initWithInternalRepresentation:", v10);
    if (v10)
      CI::Object::unref(v10);
    *((_BYTE *)v9->_priv + 72) = 1;
    *((_QWORD *)v9->_priv + 10) = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("kCIContextIOSurfaceMemoryPoolID")), "unsignedIntValue");
    if (v11)
      CoreAnalytics(CFSTR("contextWithMTLCommandQueue"), v11);
  }
  else
  {
    v11 = 0;
  }
  objc_autoreleasePoolPop(v7);
  return v11;
}

+ (CIContext)contextWithMTLCommandQueue:(id)commandQueue
{
  return +[CIContext contextWithMTLCommandQueue:options:](CIContext, "contextWithMTLCommandQueue:options:", commandQueue, MEMORY[0x1E0C9AA70]);
}

+ (CIContext)contextWithMTLCommandQueue:(id)commandQueue options:(NSDictionary *)options
{
  return -[CIContext initWithMTLCommandQueue:options:]([CIContext alloc], "initWithMTLCommandQueue:options:", commandQueue, options);
}

+ (int)_crashed_because_nonaddressable_memory_was_passed_to_render:(id)a3 toBitmap:(void *)a4 rowBytes:(int64_t)a5 bounds:(CGRect)a6 format:(int)a7 colorSpace:(CGColorSpace *)a8
{
  double height;
  double width;
  int v12;
  unint64_t v13;

  height = a6.size.height;
  width = a6.size.width;
  v12 = CI::format_bits_per_pixel(a7);
  v13 = (v12 * vcvtmd_u64_f64(width)) >> 3;
  if (v12 == 12)
    v13 = a5;
  if (!v12)
    v13 = a5;
  return *((char *)a4 + (vcvtmd_u64_f64(height) - 1) * a5 + v13 - 1) + *(unsigned __int8 *)a4;
}

- (void)render:(CIImage *)image toBitmap:(void *)data rowBytes:(ptrdiff_t)rowBytes bounds:(CGRect)bounds format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace
{
  uint64_t v9;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v18;
  _BYTE *v19;
  _BYTE *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  const char *v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  NSObject *v29;
  CFTypeID TypeID;
  int is_luminance;
  CGColorSpaceModel Model;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  unint64_t v49;
  uint64_t v50;
  ptrdiff_t v51;
  CIRenderDestination *v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  unint64_t v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  v9 = *(_QWORD *)&format;
  height = bounds.size.height;
  width = bounds.size.width;
  y = bounds.origin.y;
  x = bounds.origin.x;
  v18 = (void *)MEMORY[0x194026220](self, a2);
  -[CIContext _gpuContextCheck](self, "_gpuContextCheck");
  v19 = -[CIContext _internalContext](self, "_internalContext");
  if (!data)
    goto LABEL_42;
  if (!image)
    goto LABEL_42;
  v20 = v19;
  if (!v19)
    goto LABEL_42;
  -[CIImage extent](image, "extent");
  v78.origin.x = v21;
  v78.origin.y = v22;
  v78.size.width = v23;
  v78.size.height = v24;
  v70.origin.x = x;
  v70.origin.y = y;
  v70.size.width = width;
  v70.size.height = height;
  v71 = CGRectIntersection(v70, v78);
  if (CGRectIsEmpty(v71))
    goto LABEL_42;
  v26 = CI::format_modernize(v9, (CI *)"-[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:]", v25);
  if (v26 == 258)
    v27 = 259;
  else
    v27 = v26;
  if (v27 == 1794)
    v28 = 1795;
  else
    v28 = v27;
  if ((*(unsigned int (**)(_BYTE *))(*(_QWORD *)v20 + 16))(v20) == 76
    && CI::format_is_not_supported_as_destination_on_gles(v28))
  {
    v29 = ci_logger_api();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:].cold.1(v28, v29);
    goto LABEL_42;
  }
  if ((CI::format_is_supported_render_to_bitmap(v28) & 1) != 0)
  {
    if (!colorSpace)
      goto LABEL_26;
    TypeID = CGColorSpaceGetTypeID();
    if (TypeID == CFGetTypeID(colorSpace) && CGColorSpaceSupportsOutput(colorSpace))
    {
      is_luminance = CI::format_is_luminance(v28);
      Model = CGColorSpaceGetModel(colorSpace);
      if (is_luminance)
      {
        if (Model)
          goto LABEL_21;
        goto LABEL_26;
      }
      if (Model == kCGColorSpaceModelRGB)
      {
LABEL_26:
        if (rowBytes % (unint64_t)CI::format_destination_rowbytes_requirement(v28))
        {
          v42 = ci_logger_api();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
            -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:].cold.2();
        }
        else
        {
          v72.origin.x = x;
          v72.origin.y = y;
          v72.size.width = width;
          v72.size.height = height;
          v73 = CGRectStandardize(v72);
          v43 = v73.size.width;
          v44 = v73.size.height;
          v45 = floor(v73.origin.x);
          v46 = floor(v73.origin.y);
          v47 = floor(v73.size.width);
          v48 = floor(v73.size.height);
          +[CIContext _crashed_because_nonaddressable_memory_was_passed_to_render:toBitmap:rowBytes:bounds:format:colorSpace:](CIContext, "_crashed_because_nonaddressable_memory_was_passed_to_render:toBitmap:rowBytes:bounds:format:colorSpace:", image, data, rowBytes, v28, colorSpace, v45, v46, v47, v48);
          v69 = vcvtmd_u64_f64(v43);
          v49 = vcvtmd_u64_f64(v44);
          v50 = (v49 - 1) * rowBytes;
          if (rowBytes >= 0)
            v51 = rowBytes;
          else
            v51 = -rowBytes;
          if (rowBytes >= 0)
            v50 = 0;
          v52 = -[CIRenderDestination initWithBitmapData:width:height:bytesPerRow:format:]([CIRenderDestination alloc], "initWithBitmapData:width:height:bytesPerRow:format:", (char *)data + v50, v69, v49, v51, v28);
          -[CIRenderDestination setColorSpace:](v52, "setColorSpace:", colorSpace);
          -[CIRenderDestination setFlipped:](v52, "setFlipped:", rowBytes >= 0);
          if (!v20[40])
            -[CIRenderDestination setAlphaMode:](v52, "setAlphaMode:", 2);
          if (!v20[41])
            -[CIRenderDestination setClamped:](v52, "setClamped:", 0);
          -[CIImage extent](image, "extent");
          v79.origin.x = v53;
          v79.origin.y = v54;
          v79.size.width = v55;
          v79.size.height = v56;
          v74.origin.x = v45;
          v74.origin.y = v46;
          v74.size.width = v47;
          v74.size.height = v48;
          v75 = CGRectUnion(v74, v79);
          v57 = v75.origin.x;
          v58 = v75.origin.y;
          v59 = v75.size.width;
          v60 = v75.size.height;
          -[CIImage extent](image, "extent");
          v80.origin.x = v61;
          v80.origin.y = v62;
          v80.size.width = v63;
          v80.size.height = v64;
          v76.origin.x = v57;
          v76.origin.y = v58;
          v76.size.width = v59;
          v76.size.height = v60;
          if (CGRectContainsRect(v76, v80))
          {
            -[CIImage extent](image, "extent");
            v81.origin.x = v65;
            v81.origin.y = v66;
            v81.size.width = v67;
            v81.size.height = v68;
            v77.origin.x = v57;
            v77.origin.y = v58;
            v77.size.width = v59;
            v77.size.height = v60;
            if (!CGRectEqualToRect(v77, v81))
              image = -[CIImage imageByCompositingOverImage:](image, "imageByCompositingOverImage:", +[CIImage clearImage](CIImage, "clearImage"));
          }
          -[CIRenderTask waitUntilCompletedAndReturnError:](-[CIContext startTaskToRender:fromRect:toDestination:atPoint:error:](self, "startTaskToRender:fromRect:toDestination:atPoint:error:", image, v52, 0, v45, v46, v47, v48, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8)), "waitUntilCompletedAndReturnError:", 0);

        }
        goto LABEL_42;
      }
    }
LABEL_21:
    v33 = ci_logger_api();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:].cold.3(v33, v34, v35, v36, v37, v38, v39, v40);
    goto LABEL_42;
  }
  v41 = ci_logger_api();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:].cold.4(v28, v41);
LABEL_42:
  objc_autoreleasePoolPop(v18);
}

- (void)render:(CIImage *)image toCVPixelBuffer:(CVPixelBufferRef)buffer
{
  double Width;
  double Height;
  CGColorSpace *v9;

  Width = (double)CVPixelBufferGetWidth(buffer);
  Height = (double)CVPixelBufferGetHeight(buffer);
  v9 = CVImageBufferCopyColorSpace(buffer);
  -[CIContext render:toCVPixelBuffer:bounds:colorSpace:](self, "render:toCVPixelBuffer:bounds:colorSpace:", image, buffer, v9, 0.0, 0.0, Width, Height);
  CGColorSpaceRelease(v9);
}

- (void)render:(CIImage *)image toCVPixelBuffer:(CVPixelBufferRef)buffer bounds:(CGRect)bounds colorSpace:(CGColorSpaceRef)colorSpace
{
  double height;
  double width;
  double y;
  double x;
  void *v14;
  _BYTE *v15;
  _BYTE *v16;
  CIRenderDestination *v17;
  CIRenderTask *v18;

  height = bounds.size.height;
  width = bounds.size.width;
  y = bounds.origin.y;
  x = bounds.origin.x;
  v14 = (void *)MEMORY[0x194026220](self, a2);
  -[CIContext _gpuContextCheck](self, "_gpuContextCheck");
  v15 = -[CIContext _internalContext](self, "_internalContext");
  if (image)
  {
    if (buffer)
    {
      v16 = v15;
      if (v15)
      {
        v17 = -[CIRenderDestination initWithPixelBuffer:]([CIRenderDestination alloc], "initWithPixelBuffer:", buffer);
        -[CIRenderDestination setColorSpace:](v17, "setColorSpace:", colorSpace);
        if (!v16[40])
          -[CIRenderDestination setAlphaMode:](v17, "setAlphaMode:", 2);
        if (!v16[41])
          -[CIRenderDestination setClamped:](v17, "setClamped:", 0);
        v18 = -[CIContext startTaskToRender:fromRect:toDestination:atPoint:error:](self, "startTaskToRender:fromRect:toDestination:atPoint:error:", image, v17, 0, x, y, width, height, x, y);

        if (v18)
          -[CIRenderTask waitUntilCompletedAndReturnError:](v18, "waitUntilCompletedAndReturnError:", 0);
      }
    }
  }
  objc_autoreleasePoolPop(v14);
}

- (BOOL)isMetalBased
{
  void *v2;

  v2 = -[CIContext _internalContext](self, "_internalContext");
  if (v2)
    LOBYTE(v2) = (*(unsigned int (**)(void *))(*(_QWORD *)v2 + 16))(v2) == 77;
  return (char)v2;
}

- (BOOL)isOpenGLBased
{
  void *v2;

  v2 = -[CIContext _internalContext](self, "_internalContext");
  if (v2)
    LOBYTE(v2) = (*(unsigned int (**)(void *))(*(_QWORD *)v2 + 16))(v2) == 76;
  return (char)v2;
}

- (BOOL)isOpenCLBased
{
  void *v2;

  v2 = -[CIContext _internalContext](self, "_internalContext");
  if (v2)
    LOBYTE(v2) = (*(unsigned int (**)(void *))(*(_QWORD *)v2 + 16))(v2) == 74;
  return (char)v2;
}

- (BOOL)_isGLBackedContext
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = -[CIContext _internalContext](self, "_internalContext");
  if (v2)
  {
    v3 = v2;
    LOBYTE(v2) = (*(unsigned int (**)(_QWORD *))(*v2 + 16))(v2) == 76 && v3[50] != 0;
  }
  return (char)v2;
}

- (BOOL)_isCGBackedContext
{
  _QWORD *v2;

  v2 = -[CIContext _internalContext](self, "_internalContext");
  if (v2)
    LOBYTE(v2) = v2[6] != 0;
  return (char)v2;
}

- (void)_insertEventMarker:(const char *)a3
{
  void **v4;
  void **v5;

  v4 = -[CIContext _internalContext](self, "_internalContext");
  if (v4)
  {
    v5 = v4;
    if ((*((unsigned int (**)(void **))*v4 + 2))(v4) == 76)
      CI::GLContext::insert_event_marker(v5, a3);
  }
}

- (void)render:(id)a3
{
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CIContext *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v5 = (void *)MEMORY[0x194026220](self, a2);
  if (!a3)
    goto LABEL_10;
  objc_msgSend(a3, "extent");
  if (CGRectIsEmpty(v40))
    goto LABEL_10;
  -[CIContext bounds](self, "bounds");
  x = v41.origin.x;
  y = v41.origin.y;
  width = v41.size.width;
  height = v41.size.height;
  if (!CGRectIsInfinite(v41))
  {
    v18 = self;
    v19 = a3;
    v20 = x;
    v21 = y;
    v22 = width;
    v23 = height;
    v24 = x;
    v25 = y;
    v26 = width;
    v27 = height;
LABEL_9:
    -[CIContext drawImage:inRect:fromRect:](v18, "drawImage:inRect:fromRect:", v19, v20, v21, v22, v23, v24, v25, v26, v27);
    goto LABEL_10;
  }
  objc_msgSend(a3, "extent");
  if (!CGRectIsInfinite(v42))
  {
    objc_msgSend(a3, "extent");
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    objc_msgSend(a3, "extent");
    v24 = v36;
    v25 = v37;
    v26 = v38;
    v27 = v39;
    v18 = self;
    v19 = a3;
    v20 = v29;
    v21 = v31;
    v22 = v33;
    v23 = v35;
    goto LABEL_9;
  }
  v10 = ci_logger_api();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[CIContext render:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
LABEL_10:
  objc_autoreleasePoolPop(v5);
}

- (void)drawImage:(CIImage *)image atPoint:(CGPoint)atPoint fromRect:(CGRect)fromRect
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v9;
  double v10;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  if (image)
  {
    height = fromRect.size.height;
    width = fromRect.size.width;
    y = fromRect.origin.y;
    x = fromRect.origin.x;
    v9 = atPoint.y;
    v10 = atPoint.x;
    -[CIImage extent](image, "extent");
    if (!CGRectIsEmpty(v13))
    {
      v14.origin.x = x;
      v14.origin.y = y;
      v14.size.width = width;
      v14.size.height = height;
      v15 = CGRectStandardize(v14);
      -[CIContext drawImage:inRect:fromRect:](self, "drawImage:inRect:fromRect:", image, v10, v9, v15.size.width, v15.size.height, v15.origin.x, v15.origin.y, v15.size.width, v15.size.height);
    }
  }
}

- (void)drawImage:(CIImage *)image inRect:(CGRect)inRect fromRect:(CGRect)fromRect
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  CGContext *v45;
  CGColorSpace *ColorSpace;
  size_t BitsPerComponent;
  __int16 BitmapInfo;
  CIFormat *v49;
  CIImage *v50;
  CGColorSpaceRef v51;
  unsigned int *v52;
  CGColorSpace *v53;
  _BOOL4 v54;
  CGImage *v55;
  CIFormat *v56;
  CGColorSpaceModel Model;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  height = fromRect.size.height;
  width = fromRect.size.width;
  y = fromRect.origin.y;
  x = fromRect.origin.x;
  v9 = inRect.size.height;
  v10 = inRect.size.width;
  v11 = inRect.origin.y;
  v12 = inRect.origin.x;
  v15 = (void *)MEMORY[0x194026220](self, a2);
  if (-[CIContext _isGLBackedContext](self, "_isGLBackedContext")
    || -[CIContext _isCGBackedContext](self, "_isCGBackedContext"))
  {
    -[CIContext _gpuContextCheck](self, "_gpuContextCheck");
    v16 = -[CIContext _internalContext](self, "_internalContext");
    v64.origin.x = x;
    v64.origin.y = y;
    v64.size.width = width;
    v64.size.height = height;
    v65 = CGRectStandardize(v64);
    v17 = v65.origin.x;
    v18 = v65.origin.y;
    v19 = v65.size.width;
    v20 = v65.size.height;
    v65.origin.x = v12;
    v65.origin.y = v11;
    v65.size.width = v10;
    v65.size.height = v9;
    v66 = CGRectStandardize(v65);
    if (image)
    {
      if (v16)
      {
        v21 = v66.origin.x;
        v22 = v66.origin.y;
        v23 = v66.size.width;
        v24 = v66.size.height;
        if (!CGRectIsEmpty(v66))
        {
          -[CIImage extent](image, "extent");
          v71.origin.x = v25;
          v71.origin.y = v26;
          v71.size.width = v27;
          v71.size.height = v28;
          v67.origin.x = v17;
          v67.origin.y = v18;
          v67.size.width = v19;
          v67.size.height = v20;
          v68 = CGRectIntersection(v67, v71);
          if (!CGRectIsEmpty(v68))
          {
            v69.origin.x = v17;
            v69.origin.y = v18;
            v69.size.width = v19;
            v69.size.height = v20;
            if (CGRectIsInfinite(v69)
              || (v70.origin.x = v21,
                  v70.origin.y = v22,
                  v70.size.width = v23,
                  v70.size.height = v24,
                  CGRectIsInfinite(v70)))
            {
              v29 = ci_logger_api();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                -[CIContext drawImage:inRect:fromRect:].cold.1(v29, v30, v31, v32, v33, v34, v35, v36);
            }
            else if (-[CIContext _isCGBackedContext](self, "_isCGBackedContext"))
            {
              v45 = (CGContext *)*((_QWORD *)v16 + 6);
              if (CGContextGetType() == 4 && CGBitmapContextGetColorSpace(v45))
              {
                ColorSpace = CGBitmapContextGetColorSpace(v45);
                BitsPerComponent = CGBitmapContextGetBitsPerComponent(v45);
                BitmapInfo = CGBitmapContextGetBitmapInfo(v45);
                if ((BitmapInfo & 0x100) != 0)
                {
                  if ((BitmapInfo & 0x7000) == 0x1000)
                    v56 = &kCIFormatRGBAh;
                  else
                    v56 = &kCIFormatRGBAf;
                  Model = CGColorSpaceGetModel(ColorSpace);
                  v49 = &kCIFormatLAf;
                  if (Model)
                    v49 = v56;
                }
                else if (CGColorSpaceGetModel(ColorSpace))
                {
                  v49 = &kCIFormatRGBA8;
                }
                else
                {
                  v49 = &kCIFormatLA16;
                  if (BitsPerComponent <= 8)
                    v49 = &kCIFormatLA8;
                }
              }
              else
              {
                v53 = -[CIImage colorSpace](image, "colorSpace");
                if (!v53
                  || (ColorSpace = v53, CGColorSpaceGetModel(v53) != kCGColorSpaceModelRGB)
                  || !CGColorSpaceSupportsOutput(ColorSpace))
                {
                  ColorSpace = -[CIContext _outputColorSpace](self, "_outputColorSpace");
                }
                v54 = CGColorSpaceUsesExtendedRange(ColorSpace);
                if (CGColorSpaceUsesITUR_2100TF(ColorSpace) || v54)
                  v49 = &kCIFormatRGBAh;
                else
                  v49 = &kCIFormatRGBA8;
              }
              v55 = -[CIContext createCGImage:fromRect:format:colorSpace:](self, "createCGImage:fromRect:format:colorSpace:", image, *v49, ColorSpace, v17, v18, v19, v20);
              CGContextDrawImageFromRect();
              CGImageRelease(v55);
            }
            else
            {
              v58 = v23 / v19;
              v59 = v23 / v19 * 0.0;
              v60 = v24 / v20 * 0.0;
              v61 = v24 / v20;
              v62 = v21 - v23 / v19 * v17 - v60 * v18;
              v63 = v22 - v59 * v17 - v24 / v20 * v18;
              v50 = -[CIImage imageByApplyingTransform:](image, "imageByApplyingTransform:", &v58);
              v51 = (CGColorSpaceRef)*((_QWORD *)v16 + 2);
              if ((*(unsigned int (**)(void *))(*(_QWORD *)v16 + 16))(v16) == 76
                && CI::GLContext::is_user_destination_srgb((CI::GLContext *)v16))
              {
                v51 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA00]);
                CFAutorelease(v51);
              }
              v52 = -[CIImage _internalRepresentation](-[CIImage imageByColorMatchingWorkingSpaceToColorSpace:](v50, "imageByColorMatchingWorkingSpaceToColorSpace:", v51), "_internalRepresentation");
              -[CIContext lock](self, "lock");
              ++*((_QWORD *)v16 + 19);
              *((_QWORD *)v16 + 24) = 0;
              *((double *)v16 + 20) = v21;
              *((double *)v16 + 21) = v22;
              *((double *)v16 + 22) = v23;
              *((double *)v16 + 23) = v24;
              (*(void (**)(void *, _QWORD))(*(_QWORD *)v16 + 240))(v16, 0);
              CI::image_render_to_display((uint64_t)v16, v52, 264, v21, v22, v23, v24);
              -[CIContext unlock](self, "unlock");
            }
          }
        }
      }
    }
  }
  else
  {
    v37 = ci_logger_api();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[CIContext drawImage:inRect:fromRect:].cold.2(v37, v38, v39, v40, v41, v42, v43, v44);
  }
  objc_autoreleasePoolPop(v15);
}

- (void)render:(id)a3 toTexture:(unsigned int)a4 bounds:(CGRect)a5 colorSpace:(CGColorSpace *)a6
{
  -[CIContext render:toTexture:target:bounds:colorSpace:](self, "render:toTexture:target:bounds:colorSpace:", a3, *(_QWORD *)&a4, 3553, a6, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (void)render:(id)a3 toTexture:(unsigned int)a4 target:(unsigned int)a5 bounds:(CGRect)a6 colorSpace:(CGColorSpace *)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v13;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  _BYTE *v25;
  CIRenderDestination *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = *(_QWORD *)&a4;
  v16 = (void *)MEMORY[0x194026220](self, a2);
  if (a5 == 3553)
  {
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = height;
    v44 = CGRectStandardize(v43);
    if (a3)
    {
      v17 = v44.origin.x;
      v18 = v44.origin.y;
      v19 = v44.size.width;
      v20 = v44.size.height;
      if (-[CIContext _internalContext](self, "_internalContext"))
      {
        objc_msgSend(a3, "extent");
        v47.origin.x = v21;
        v47.origin.y = v22;
        v47.size.width = v23;
        v47.size.height = v24;
        v45.origin.x = v17;
        v45.origin.y = v18;
        v45.size.width = v19;
        v45.size.height = v20;
        v46 = CGRectIntersection(v45, v47);
        if (!CGRectIsEmpty(v46))
        {
          -[CIContext _gpuContextCheck](self, "_gpuContextCheck");
          v25 = -[CIContext _internalContext](self, "_internalContext");
          if ((*(unsigned int (**)(_BYTE *))(*(_QWORD *)v25 + 16))(v25) == 76
            || (*(unsigned int (**)(_BYTE *))(*(_QWORD *)v25 + 16))(v25) == 74)
          {
            v26 = -[CIRenderDestination initWithGLTexture:target:width:height:]([CIRenderDestination alloc], "initWithGLTexture:target:width:height:", v13, 3553, (unint64_t)v19, (unint64_t)v20);
            -[CIRenderDestination setColorSpace:](v26, "setColorSpace:", a7);
            -[CIRenderDestination setFlipped:](v26, "setFlipped:", 0);
            if (!v25[40])
              -[CIRenderDestination setAlphaMode:](v26, "setAlphaMode:", 2);
            if (!v25[41])
              -[CIRenderDestination setClamped:](v26, "setClamped:", 0);
            -[CIContext startTaskToRender:fromRect:toDestination:atPoint:error:](self, "startTaskToRender:fromRect:toDestination:atPoint:error:", a3, v26, 0, v17, v18, v19, v20, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

          }
          else
          {
            v35 = ci_logger_api();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              -[CIContext render:toTexture:target:bounds:colorSpace:].cold.1(v35, v36, v37, v38, v39, v40, v41, v42);
          }
        }
      }
    }
  }
  else
  {
    v27 = ci_logger_api();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[CIContext render:toTexture:target:bounds:colorSpace:].cold.2(v27, v28, v29, v30, v31, v32, v33, v34);
  }
  objc_autoreleasePoolPop(v16);
}

- (void)render:(CIImage *)image toMTLTexture:(id)texture commandBuffer:(id)commandBuffer bounds:(CGRect)bounds colorSpace:(CGColorSpaceRef)colorSpace
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  _BYTE *v25;
  CIRenderDestination *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  height = bounds.size.height;
  width = bounds.size.width;
  y = bounds.origin.y;
  x = bounds.origin.x;
  v16 = (void *)MEMORY[0x194026220](self, a2);
  v44.origin.x = x;
  v44.origin.y = y;
  v44.size.width = width;
  v44.size.height = height;
  v45 = CGRectStandardize(v44);
  if (image)
  {
    v17 = v45.origin.x;
    v18 = v45.origin.y;
    v19 = v45.size.width;
    v20 = v45.size.height;
    if (-[CIContext _internalContext](self, "_internalContext"))
    {
      -[CIImage extent](image, "extent");
      v48.origin.x = v21;
      v48.origin.y = v22;
      v48.size.width = v23;
      v48.size.height = v24;
      v46.origin.x = v17;
      v46.origin.y = v18;
      v46.size.width = v19;
      v46.size.height = v20;
      v47 = CGRectIntersection(v46, v48);
      if (!CGRectIsEmpty(v47))
      {
        v25 = -[CIContext _internalContext](self, "_internalContext");
        if (objc_msgSend(texture, "textureType") == 2)
        {
          if ((*(unsigned int (**)(_BYTE *))(*(_QWORD *)v25 + 16))(v25) == 77)
          {
            v26 = -[CIRenderDestination initWithMTLTexture:commandBuffer:]([CIRenderDestination alloc], "initWithMTLTexture:commandBuffer:", texture, commandBuffer);
            -[CIRenderDestination setColorSpace:](v26, "setColorSpace:", colorSpace);
            if (!v25[40])
              -[CIRenderDestination setAlphaMode:](v26, "setAlphaMode:", 2);
            if (!v25[41])
              -[CIRenderDestination setClamped:](v26, "setClamped:", 0);
            if ((dyld_program_sdk_at_least() & 1) == 0 && (dyld_program_sdk_at_least() & 1) == 0)
              -[CIRenderDestination setFlipped:](v26, "setFlipped:", 0);
            -[CIContext startTaskToRender:fromRect:toDestination:atPoint:error:](self, "startTaskToRender:fromRect:toDestination:atPoint:error:", image, v26, 0, v17, v18, v19, v20, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

          }
          else if (commandBuffer || (v43 = objc_msgSend(texture, "iosurface")) == 0)
          {
            v35 = ci_logger_api();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              -[CIContext render:toMTLTexture:commandBuffer:bounds:colorSpace:].cold.1(v35, v36, v37, v38, v39, v40, v41, v42);
          }
          else
          {
            -[CIContext render:toIOSurface:bounds:colorSpace:](self, "render:toIOSurface:bounds:colorSpace:", image, v43, colorSpace, v17, v18, v19, v20);
          }
        }
        else
        {
          v27 = ci_logger_api();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            -[CIContext render:toMTLTexture:commandBuffer:bounds:colorSpace:].cold.2(v27, v28, v29, v30, v31, v32, v33, v34);
        }
      }
    }
  }
  objc_autoreleasePoolPop(v16);
}

- (__IOSurface)createIOSurface:(id)a3
{
  objc_msgSend(a3, "extent");
  return -[CIContext createIOSurface:fromRect:](self, "createIOSurface:fromRect:", a3);
}

- (__IOSurface)createIOSurface:(id)a3 fromRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  unsigned int v20;
  __IOSurface *Surface;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = (void *)MEMORY[0x194026220](self, a2);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v24 = CGRectStandardize(v23);
  if (!a3)
    goto LABEL_7;
  v11 = v24.origin.x;
  v12 = v24.origin.y;
  v13 = v24.size.width;
  v14 = v24.size.height;
  if (!-[CIContext _internalContext](self, "_internalContext"))
    goto LABEL_7;
  v25.origin.x = v11;
  v25.origin.y = v12;
  v25.size.width = v13;
  v25.size.height = v14;
  if (CGRectIsInfinite(v25))
    goto LABEL_7;
  objc_msgSend(a3, "extent");
  v27.origin.x = v15;
  v27.origin.y = v16;
  v27.size.width = v17;
  v27.size.height = v18;
  v26.origin.x = v11;
  v26.origin.y = v12;
  v26.size.width = v13;
  v26.size.height = v14;
  if (CGRectIntersectsRect(v26, v27))
  {
    v19 = -[CIContext _internalContext](self, "_internalContext");
    v20 = (*(uint64_t (**)(void *, uint64_t))(*(_QWORD *)v19 + 544))(v19, 266);
    Surface = CreateSurface((__CVBuffer *)vcvtpd_u64_f64(v13), (__CVBuffer *)vcvtpd_u64_f64(v14), (void *)v20, 1111970369, 1);
    if (Surface)
      -[CIContext render:toIOSurface:bounds:colorSpace:](self, "render:toIOSurface:bounds:colorSpace:", a3, Surface, -[CIContext _outputColorSpace](self, "_outputColorSpace"), v11, v12, v13, v14);
  }
  else
  {
LABEL_7:
    Surface = 0;
  }
  objc_autoreleasePoolPop(v10);
  return Surface;
}

- (void)render:(CIImage *)image toIOSurface:(IOSurfaceRef)surface bounds:(CGRect)bounds colorSpace:(CGColorSpaceRef)colorSpace
{
  double height;
  double width;
  double y;
  double x;
  void *v14;
  _BYTE *v15;
  _BYTE *v16;
  CIRenderDestination *v17;
  CIRenderTask *v18;

  height = bounds.size.height;
  width = bounds.size.width;
  y = bounds.origin.y;
  x = bounds.origin.x;
  v14 = (void *)MEMORY[0x194026220](self, a2);
  -[CIContext _gpuContextCheck](self, "_gpuContextCheck");
  v15 = -[CIContext _internalContext](self, "_internalContext");
  if (image)
  {
    if (surface)
    {
      v16 = v15;
      if (v15)
      {
        v17 = -[CIRenderDestination initWithIOSurface:]([CIRenderDestination alloc], "initWithIOSurface:", surface);
        -[CIRenderDestination setColorSpace:](v17, "setColorSpace:", colorSpace);
        if (!v16[40])
          -[CIRenderDestination setAlphaMode:](v17, "setAlphaMode:", 2);
        if (!v16[41])
          -[CIRenderDestination setClamped:](v17, "setClamped:", 0);
        v18 = -[CIContext startTaskToRender:fromRect:toDestination:atPoint:error:](self, "startTaskToRender:fromRect:toDestination:atPoint:error:", image, v17, 0, x, y, width, height, x, y);

        if (v18)
          -[CIRenderTask waitUntilCompletedAndReturnError:](v18, "waitUntilCompletedAndReturnError:", 0);
      }
    }
  }
  objc_autoreleasePoolPop(v14);
}

- (CGLayerRef)createCGLayerWithSize:(CGSize)size info:(CFDictionaryRef)info
{
  CGFloat height;
  CGFloat width;
  CGColorSpace *v7;
  CGContext *v8;
  CGLayer *v9;
  CGSize v11;

  height = size.height;
  width = size.width;
  v7 = CGColorSpaceRetain(-[CIContext workingColorSpace](self, "workingColorSpace"));
  if (!v7)
    v7 = +[CIContext defaultRGBColorSpace](CIContext, "defaultRGBColorSpace");
  v8 = CGBitmapContextCreate(0, 1uLL, 1uLL, 8uLL, 0, v7, 2u);
  CGColorSpaceRelease(v7);
  if (!v8)
    return 0;
  v11.width = width;
  v11.height = height;
  v9 = CGLayerCreateWithContext(v8, v11, info);
  CGContextRelease(v8);
  return v9;
}

- (unint64_t)maximumInputImageSize
{
  unint64_t result;

  result = -[CIContext _internalContext](self, "_internalContext");
  if (result)
    return (*(uint64_t (**)(unint64_t))(*(_QWORD *)result + 448))(result);
  return result;
}

- (unint64_t)maximumOutputImageSize
{
  unint64_t result;

  result = -[CIContext _internalContext](self, "_internalContext");
  if (result)
    return (*(uint64_t (**)(unint64_t))(*(_QWORD *)result + 456))(result);
  return result;
}

- (CGSize)inputImageMaximumSize
{
  void *v2;
  double v3;
  double v4;
  CGSize result;

  v2 = -[CIContext _internalContext](self, "_internalContext");
  if (v2)
    v3 = (double)(unint64_t)(*(uint64_t (**)(void *))(*(_QWORD *)v2 + 448))(v2);
  else
    v3 = 0.0;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)outputImageMaximumSize
{
  void *v2;
  double v3;
  double v4;
  CGSize result;

  v2 = -[CIContext _internalContext](self, "_internalContext");
  if (v2)
    v3 = (double)(unint64_t)(*(uint64_t (**)(void *))(*(_QWORD *)v2 + 456))(v2);
  else
    v3 = 0.0;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGColorSpace)_outputColorSpace
{
  CGColorSpace *result;

  result = -[CIContext _internalContext](self, "_internalContext");
  if (result)
    return (CGColorSpace *)*((_QWORD *)result + 2);
  return result;
}

- (CGColorSpaceRef)workingColorSpace
{
  CGColorSpaceRef result;

  result = -[CIContext _internalContext](self, "_internalContext");
  if (result)
    return (CGColorSpaceRef)*((_QWORD *)result + 3);
  return result;
}

- (CIFormat)workingFormat
{
  _DWORD *v2;

  v2 = -[CIContext _internalContext](self, "_internalContext");
  if (v2)
    LODWORD(v2) = v2[8];
  return (int)v2;
}

+ (CGColorSpace)defaultWorkingColorSpace
{
  CGColorSpace *v2;

  v2 = (CGColorSpace *)CI::Context::defaultWorkingSpace((CI::Context *)a1);
  return CGColorSpaceRetain(v2);
}

+ (CGColorSpace)defaultRGBColorSpace
{
  unsigned __int8 v2;
  CI::Context *v4;

  if ((v2 & 1) == 0)
  {
    if ((_DWORD)v4)
    {
      +[CIContext defaultRGBColorSpace]::space = CI::Context::defaultOutputRGBSpace(v4);
    }
  }
  return CGColorSpaceRetain((CGColorSpaceRef)+[CIContext defaultRGBColorSpace]::space);
}

+ (CGColorSpace)defaultGrayColorSpace
{
  unsigned __int8 v2;
  CI::Context *v4;

  if ((v2 & 1) == 0)
  {
    if ((_DWORD)v4)
    {
      +[CIContext defaultGrayColorSpace]::space = CI::Context::defaultOutputGraySpace(v4);
    }
  }
  return CGColorSpaceRetain((CGColorSpaceRef)+[CIContext defaultGrayColorSpace]::space);
}

- (void)clearCaches
{
  void *v2;

  v2 = -[CIContext _internalContext](self, "_internalContext");
  if (v2)
    (*(void (**)(void *))(*(_QWORD *)v2 + 608))(v2);
}

- (id)flatten:(id)a3 fromRect:(CGRect)a4 format:(int)a5 colorSpace:(CGColorSpace *)a6
{
  NSObject *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v7 = ci_logger_api();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 136446210;
    v10 = "-[CIContext flatten:fromRect:format:colorSpace:]";
    _os_log_impl(&dword_1921E4000, v7, OS_LOG_TYPE_INFO, "%{public}s was called but ignored.", (uint8_t *)&v9, 0xCu);
  }
  return a3;
}

- (BOOL)measureRequirementsOf:(id)a3 query:(int)a4 :(id *)a5 results:(CGRect *)a6
{
  BOOL v6;
  BOOL v8;
  char v9;
  id *v11;
  uint64_t v12;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double x;
  double y;
  double width;
  double height;
  CGSize *p_size;
  uint64_t v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGRect v37;
  CGRect v38;

  if (a3)
    v6 = a4 == 0;
  else
    v6 = 1;
  v8 = v6 || a6 == 0 || a5 == 0;
  v9 = v8;
  if (!v8)
  {
    v11 = a5;
    LODWORD(v12) = a4;
    -[CIContext bounds](self, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    memset(&v36, 0, sizeof(v36));
    if (self)
      -[CIContext CTM](self, "CTM");
    else
      memset(&v35, 0, sizeof(v35));
    CGAffineTransformInvert(&v36, &v35);
    v34 = v36;
    v37.origin.x = v16;
    v37.origin.y = v18;
    v37.size.width = v20;
    v37.size.height = v22;
    v38 = CGRectApplyAffineTransform(v37, &v34);
    if ((int)v12 >= 1)
    {
      x = v38.origin.x;
      y = v38.origin.y;
      width = v38.size.width;
      height = v38.size.height;
      v12 = v12;
      p_size = &a6->size;
      do
      {
        v28 = (uint64_t)*v11++;
        objc_msgSend(a3, "regionOfInterestForImage:inRect:", v28, x, y, width, height);
        p_size[-1].width = v29;
        p_size[-1].height = v30;
        p_size->width = v31;
        p_size->height = v32;
        p_size += 2;
        --v12;
      }
      while (v12);
    }
  }
  return v9 ^ 1;
}

- (void)setCTM:(CGAffineTransform *)a3
{
  void *v4;
  __int128 v5;
  _OWORD v6[3];

  v4 = -[CIContext _internalContext](self, "_internalContext");
  if (v4)
  {
    v5 = *(_OWORD *)&a3->c;
    v6[0] = *(_OWORD *)&a3->a;
    v6[1] = v5;
    v6[2] = *(_OWORD *)&a3->tx;
    (*(void (**)(void *, _OWORD *))(*(_QWORD *)v4 + 128))(v4, v6);
  }
}

- (CGAffineTransform)CTM
{
  CGAffineTransform *result;
  uint64_t v5;
  __int128 v6;

  result = -[CIContext _internalContext](self, "_internalContext");
  if (result)
    return (CGAffineTransform *)(*(uint64_t (**)(CGAffineTransform *))(*(_QWORD *)&result->a + 136))(result);
  v5 = MEMORY[0x1E0C9BAA8];
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = -[CIContext _internalContext](self, "_internalContext");
  if (v7)
    (*(void (**)(void *, double, double, double, double))(*(_QWORD *)v7 + 176))(v7, x, y, width, height);
}

- (CGRect)bounds
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v2 = -[CIContext _internalContext](self, "_internalContext");
  if (v2)
  {
    (*(void (**)(void *))(*(_QWORD *)v2 + 184))(v2);
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D628];
    v4 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v5 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)description
{
  void *v3;
  _QWORD v5[6];
  objc_super v6;

  v3 = -[CIContext _internalContext](self, "_internalContext");
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __24__CIContext_description__block_invoke;
    v5[3] = &unk_1E2EC3148;
    v5[4] = self;
    v5[5] = v3;
    return (id)(id)stream_to_string((uint64_t)v5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CIContext;
    return -[CIContext description](&v6, sel_description);
  }
}

uint64_t __24__CIContext_description__block_invoke(uint64_t a1, FILE *a2)
{
  const char *v4;
  const char *v5;
  int v6;
  const void *v7;
  double x;
  double y;
  double width;
  double height;
  const void *v12;
  const char *v13;
  int v14;
  const char *v15;
  int v16;
  const char *v17;
  size_t v18;
  const char *v19;
  int v20;
  const char *v21;
  unint64_t v22;
  uint64_t result;
  CGRect v24;
  CGRect v25;

  v4 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
  fprintf(a2, "<%s: %p", v4, *(const void **)(a1 + 32));
  v5 = (const char *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 304))(*(_QWORD *)(a1 + 40));
  v6 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 272))(*(_QWORD *)(a1 + 40));
  fprintf(a2, " (%s %d)", v5, v6);
  if (objc_msgSend(*(id *)(a1 + 32), "isMetalBased"))
  {
    v7 = (const void *)CI::MetalContext::device(*(id **)(a1 + 40));
    fprintf(a2, " MTLDevice=%p", v7);
  }
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  if (!CGRectIsInfinite(v24))
  {
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    if (CGRectIsEmpty(v25))
      fwrite(" bounds=[empty]", 0xFuLL, 1uLL, a2);
    else
      fprintf(a2, " bounds=[%g %g %g %g]", x, y, width, height);
  }
  fwrite(">\n", 2uLL, 1uLL, a2);
  v12 = (const void *)objc_msgSend(*(id *)(a1 + 32), "clientCommandQueue");
  if (v12)
    fprintf(a2, "    withMTLCommandQueue: %p\n", v12);
  if (objc_msgSend(*(id *)(a1 + 32), "_isCGBackedContext"))
    fprintf(a2, "    withCGContext: %p\n", *(const void **)(*(_QWORD *)(a1 + 40) + 48));
  if (objc_msgSend(*(id *)(a1 + 32), "_isGLBackedContext"))
    fprintf(a2, "    withGLContext: %p\n", *(const void **)(*(_QWORD *)(a1 + 40) + 392));
  v13 = *(const char **)(a1 + 40);
  if (v13[236])
  {
    fprintf(a2, "    name: %s\n", v13 + 236);
    v13 = *(const char **)(a1 + 40);
  }
  v14 = (*(uint64_t (**)(const char *))(*(_QWORD *)v13 + 232))(v13);
  v15 = "yes";
  if (v14 == -1)
    v15 = "no";
  fprintf(a2, "    cacheIntermediates: %s\n", v15);
  v16 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 264))(*(_QWORD *)(a1 + 40));
  if (v16 == -1)
  {
    v17 = "    priority: low\n";
    v18 = 18;
  }
  else if (v16 == 1)
  {
    v17 = "    priority: high\n";
    v18 = 19;
  }
  else
  {
    if (v16)
      goto LABEL_24;
    v17 = "    priority: default\n";
    v18 = 22;
  }
  fwrite(v17, v18, 1uLL, a2);
LABEL_24:
  fwrite("    workingSpace: ", 0x12uLL, 1uLL, a2);
  CI::fprintf_cs(a2, *(__sFILE **)(*(_QWORD *)(a1 + 40) + 24), (CGColorSpace *)1);
  fputc(10, a2);
  v19 = CI::name_for_format(*(_DWORD *)(*(_QWORD *)(a1 + 40) + 32));
  fprintf(a2, "    workingFormat: %s\n", v19);
  if ((*(unsigned int (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 168))(*(_QWORD *)(a1 + 40)))
    fwrite("    lossyIntermediates: true\n", 0x1DuLL, 1uLL, a2);
  v20 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 216))(*(_QWORD *)(a1 + 40));
  v21 = "Low";
  if (v20)
    v21 = "High";
  fprintf(a2, "    downsampleQuality: %s\n", v21);
  v22 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 488))(*(_QWORD *)(a1 + 40));
  result = fprintf(a2, "    maxRenderLoad: %ld MB", v22 >> 20);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 368))
    return fprintf(a2, "    memoryLimit: %ld MB", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 368));
  return result;
}

- (id)createColorCubeDataForFilters:(id)a3 dimension:(int)a4 colorSpace:(CGColorSpace *)a5
{
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _BYTE *v14;
  int v15;
  double v16;
  int v17;
  int v18;
  CGColorSpaceRef DeviceRGB;
  CGColorSpace *v20;
  CGColorSpace *v21;
  double v22;
  double v23;
  CIImage *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v34;
  CGColorSpace *v35;
  CIContext *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v9 = 4 * a4;
  v10 = a4 * a4;
  v11 = a4 * a4 * 4 * a4;
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v11);
  if (!v12)
    return 0;
  v13 = v12;
  v14 = (_BYTE *)objc_msgSend(v12, "mutableBytes");
  if (a4 >= 1)
  {
    v15 = 0;
    v16 = (float)(a4 - 1);
    do
    {
      v17 = 0;
      do
      {
        v18 = 0;
        do
        {
          *v14 = (int)((float)v18 * 255.0 / v16);
          v14[1] = (int)((float)v17 * 255.0 / v16);
          v14[2] = (int)((float)v15 * 255.0 / v16);
          v14[3] = -1;
          v14 += 4;
          ++v18;
        }
        while (a4 != v18);
        ++v17;
      }
      while (v17 != a4);
      ++v15;
    }
    while (v15 != a4);
  }
  v36 = self;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v20 = DeviceRGB;
  if (a5)
    v21 = a5;
  else
    v21 = DeviceRGB;
  v22 = (double)a4;
  v23 = (double)v10;
  v34 = v9;
  v35 = v21;
  v24 = +[CIImage imageWithBitmapData:bytesPerRow:size:format:colorSpace:](CIImage, "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v13, (double)a4, (double)v10);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v25 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v38 != v27)
          objc_enumerationMutation(a3);
        v29 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v30 = (id)objc_msgSend(v29, "valueForKey:", CFSTR("inputImage"));
        objc_msgSend(v29, "setValue:forKey:", v24, CFSTR("inputImage"));
        v24 = (CIImage *)objc_msgSend(v29, "outputImage");
        objc_msgSend(v29, "setValue:forKey:", v30, CFSTR("inputImage"));

      }
      v26 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v26);
  }
  v31 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v11);
  v32 = v31;
  if (v31)
    -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v36, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v24, objc_msgSend(v31, "mutableBytes"), v34, 264, v35, 0.0, 0.0, v22, v23);
  CGColorSpaceRelease(v20);
  return v32;
}

- (id)createColorCubeDataForFilters:(id)a3 dimension:(int)a4
{
  return -[CIContext createColorCubeDataForFilters:dimension:colorSpace:](self, "createColorCubeDataForFilters:dimension:colorSpace:", a3, *(_QWORD *)&a4, 0);
}

+ (void)internalGLContextWithOptions:(id)a3
{
  return +[CIContext internalContextWithEAGLContext:options:](CIContext, "internalContextWithEAGLContext:options:", 0, a3);
}

+ (void)internalContextWithEAGLContext:(id)a3 options:(id)a4
{
  CGColorSpace *OutputColorSpaceFromOptions;
  CGColorSpace *v7;
  CGColorSpaceRef WorkingColorSpaceFromOptions;
  CGColorSpace *v9;
  void *v10;
  const char *v11;
  void *v12;
  uint64_t v13;
  _BYTE *v14;
  int v16;
  int v17;
  const char *v18;
  NSObject *v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  char v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  const __CFString *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  NSObject *v48;
  CGColorSpace *v49;
  CGColorSpace *v50;
  BOOL v51;
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[6];

  if (!CIGLIsUsable())
    return 0;
  v51 = 0;
  OutputColorSpaceFromOptions = (CGColorSpace *)GetOutputColorSpaceFromOptions((NSDictionary *)a4, &v51);
  if (!v51)
    return 0;
  v7 = OutputColorSpaceFromOptions;
  WorkingColorSpaceFromOptions = GetWorkingColorSpaceFromOptions((NSDictionary *)a4, &v51);
  if (!v51)
    return 0;
  v9 = WorkingColorSpaceFromOptions;
  v10 = (void *)objc_msgSend(a4, "valueForKey:", CFSTR("working_format"));
  v12 = v10;
  if (v10)
    v13 = objc_msgSend(v10, "intValue");
  else
    v13 = 0;
  v16 = CI::format_modernize(v13, (CI *)"+[CIContext(Internal) internalContextWithEAGLContext:options:]", v11);
  v17 = v16;
  if (v12 && v16 != 266 && v16 != 264 && v16 != 2056)
  {
    v18 = CI::name_for_format(v16);
    v17 = 0;
    v19 = ci_logger_api();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (v18)
    {
      if (v20)
        +[CIContext(Internal) internalContextWithEAGLContext:options:].cold.4();
    }
    else if (v20)
    {
      +[CIContext(Internal) internalContextWithEAGLContext:options:].cold.3(v19, v21, v22, v23, v24, v25, v26, v27);
    }
  }
  v49 = v7;
  v50 = v9;
  if (a4)
    v28 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("output_premultiplied"));
  else
    v28 = 0;
  v29 = (void *)MEMORY[0x1E0C9AAA0];
  v31 = v28 != (void *)MEMORY[0x1E0C9AAA0] && v28 != &unk_1E2F1B5C0;
  v32 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIContextIntermediateMemoryTarget"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = (int)objc_msgSend(v32, "intValue");
  }
  else
  {
    if (defaultIntermediateMemoryTarget(void)::onceToken != -1)
      dispatch_once(&defaultIntermediateMemoryTarget(void)::onceToken, &__block_literal_global_333);
    if (defaultIntermediateMemoryTarget(void)::targetMB)
      v33 = 256;
    else
      v33 = 0;
  }
  v34 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIContextMemoryLimit"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v35 = (int)objc_msgSend(v34, "intValue");
  else
    v35 = 0;
  v36 = objc_msgSend(a4, "valueForKey:", CFSTR("CoreUI")) == 0;
  v14 = (_BYTE *)operator new();
  CI::GLContext::GLContext((uint64_t)v14, a3, v49, v50, v17, v31, v35, v33, 0, v36);
  v37 = objc_msgSend(a4, "objectForKey:", CFSTR("kCIContextName"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38 = (uint64_t)v14;
    v39 = (const __CFString *)v37;
  }
  else
  {
    if (!objc_msgSend(a4, "valueForKey:", CFSTR("CoreUI")))
      goto LABEL_42;
    v39 = CFSTR("CoreUI");
    v38 = (uint64_t)v14;
  }
  CI::Context::set_client_name(v38, v39);
LABEL_42:
  v40 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("quality"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v40, "floatValue");
    (*(void (**)(_BYTE *))(*(_QWORD *)v14 + 192))(v14);
  }
  v41 = MEMORY[0x1E0C809B0];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = ___ZL19set_context_optionsPN2CI9GLContextEP12NSDictionary_block_invoke;
  v54[3] = &__block_descriptor_40_e8_v12__0B8l;
  v54[4] = v14;
  OptionIsTrueOrFalse(a4, (uint64_t)CFSTR("high_quality_downsample"), (uint64_t)v54);
  if (a4)
    v42 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIContextCacheIntermediates"));
  else
    v42 = 0;
  if (v42 == v29 || v42 == &unk_1E2F1B5C0)
  {
    (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)v14 + 224))(v14, 0xFFFFFFFFLL);
    if (a4)
      goto LABEL_50;
LABEL_52:
    v43 = 0;
    goto LABEL_53;
  }
  if (!a4)
    goto LABEL_52;
LABEL_50:
  v43 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("priority_request_low"));
LABEL_53:
  v44 = (void *)MEMORY[0x1E0C9AAB0];
  if (v43 == (void *)MEMORY[0x1E0C9AAB0] || v43 == &unk_1E2F1B5D8)
  {
    (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)v14 + 256))(v14, 0xFFFFFFFFLL);
    if (a4)
      goto LABEL_56;
  }
  else if (a4)
  {
LABEL_56:
    v45 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("priority_request_high"));
    goto LABEL_59;
  }
  v45 = 0;
LABEL_59:
  if (v45 == v44 || v45 == &unk_1E2F1B5D8)
    (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)v14 + 256))(v14, 1);
  v53[0] = v41;
  v53[1] = 3221225472;
  v53[2] = ___ZL19set_context_optionsPN2CI9GLContextEP12NSDictionary_block_invoke_2;
  v53[3] = &__block_descriptor_40_e8_v12__0B8l;
  v53[4] = v14;
  OptionIsTrueOrFalse(a4, (uint64_t)CFSTR("kCIContextAllowClampToAlpha"), (uint64_t)v53);
  v46 = (void *)objc_msgSend(a4, "objectForKey:", CFSTR("kCIContextHLGOpticalScale"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v46, "floatValue");
    (*(void (**)(_BYTE *))(*(_QWORD *)v14 + 144))(v14);
  }
  else if (v46)
  {
    v47 = ci_logger_api();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      +[CIContext(Internal) internalContextWithEAGLContext:options:].cold.2();
  }
  v52[0] = v41;
  v52[1] = 3221225472;
  v52[2] = ___ZL19set_context_optionsPN2CI9GLContextEP12NSDictionary_block_invoke_340;
  v52[3] = &__block_descriptor_40_e8_v12__0B8l;
  v52[4] = v14;
  OptionIsTrueOrFalse(a4, (uint64_t)CFSTR("kCIContextLossyCompressedIntermediates"), (uint64_t)v52);
  if ((*(unsigned int (**)(_BYTE *))(*(_QWORD *)v14 + 16))(v14) == 76)
  {
    v14[908] = 1;
  }
  else if ((*(unsigned int (**)(_BYTE *))(*(_QWORD *)v14 + 16))(v14) == 74)
  {
    v48 = ci_logger_api();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
      +[CIContext(Internal) internalContextWithEAGLContext:options:].cold.1(v48);
  }
  return v14;
}

uint64_t __66__CIContext_Internal__internalContextWithMTLCommandQueue_options___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "newCaptureScopeWithDevice:", objc_msgSend(*(id *)(a1 + 40), "device"));
  objc_msgSend(v2, "setLabel:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CoreImage <%@>"), objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "device"), "name")));
  return objc_msgSend(*(id *)(a1 + 32), "setDefaultCaptureScope:", v2);
}

uint64_t __66__CIContext_Internal__internalContextWithMTLCommandQueue_options___block_invoke_3(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 41) = a2;
  return result;
}

uint64_t __66__CIContext_Internal__internalContextWithMTLCommandQueue_options___block_invoke_255(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 160))(*(_QWORD *)(a1 + 32));
}

+ (void)internalSWContextWithOptions:(id)a3
{
  id OutputColorSpaceFromOptions;
  id v5;
  CGColorSpaceRef WorkingColorSpaceFromOptions;
  CGColorSpaceRef v7;
  void *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  BOOL v16;
  const char *v18;
  NSObject *v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _BOOL8 v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  const __CFString *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  NSObject *v46;
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[5];
  BOOL v51;

  v51 = 0;
  OutputColorSpaceFromOptions = GetOutputColorSpaceFromOptions((NSDictionary *)a3, &v51);
  if (!v51)
    return 0;
  v5 = OutputColorSpaceFromOptions;
  WorkingColorSpaceFromOptions = GetWorkingColorSpaceFromOptions((NSDictionary *)a3, &v51);
  if (!v51)
    return 0;
  v7 = WorkingColorSpaceFromOptions;
  v8 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("working_format"));
  v10 = v8;
  if (v8)
    v11 = objc_msgSend(v8, "intValue");
  else
    v11 = 0;
  v13 = CI::format_modernize(v11, (CI *)"+[CIContext(Internal) internalSWContextWithOptions:]", v9);
  v14 = v13;
  if (v10)
  {
    v15 = (_DWORD)v13 == 266 || (_DWORD)v13 == 264;
    v16 = v15 || (_DWORD)v13 == 2056;
    if (!v16 && (_DWORD)v13 != 2312)
    {
      v18 = CI::name_for_format(v13);
      v14 = 0;
      v19 = ci_logger_api();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
      if (v18)
      {
        if (v20)
        {
          +[CIContext(Internal) internalContextWithMTLCommandQueue:options:].cold.3();
          if (!a3)
            goto LABEL_26;
LABEL_24:
          v28 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("output_premultiplied"));
          goto LABEL_27;
        }
      }
      else if (v20)
      {
        +[CIContext(Internal) internalContextWithMTLCommandQueue:options:].cold.2(v19, v21, v22, v23, v24, v25, v26, v27);
        if (a3)
          goto LABEL_24;
        goto LABEL_26;
      }
    }
  }
  if (a3)
    goto LABEL_24;
LABEL_26:
  v28 = 0;
LABEL_27:
  v29 = (void *)MEMORY[0x1E0C9AAA0];
  v31 = v28 != (void *)MEMORY[0x1E0C9AAA0] && v28 != &unk_1E2F1B5C0;
  v32 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("kCIContextIntermediateMemoryTarget"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = (int)objc_msgSend(v32, "intValue");
  }
  else
  {
    if (defaultIntermediateMemoryTarget(void)::onceToken != -1)
      dispatch_once(&defaultIntermediateMemoryTarget(void)::onceToken, &__block_literal_global_333);
    if (defaultIntermediateMemoryTarget(void)::targetMB)
      v33 = 256;
    else
      v33 = 0;
  }
  v34 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("kCIContextMemoryLimit"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v35 = (int)objc_msgSend(v34, "intValue");
  else
    v35 = 0;
  v12 = (void *)operator new();
  CI::SWContext::SWContext(v12, v5, v7, v14, v31, v35, v33);
  if (a3)
    v36 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("priority_request_low"));
  else
    v36 = 0;
  v37 = (void *)MEMORY[0x1E0C9AAB0];
  if (v36 == (void *)MEMORY[0x1E0C9AAB0] || v36 == &unk_1E2F1B5D8)
  {
    (*(void (**)(void *, uint64_t))(*(_QWORD *)v12 + 256))(v12, 0xFFFFFFFFLL);
    if (a3)
      goto LABEL_49;
LABEL_51:
    v38 = 0;
    goto LABEL_52;
  }
  if (!a3)
    goto LABEL_51;
LABEL_49:
  v38 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("priority_request_high"));
LABEL_52:
  if (v38 == v37 || v38 == &unk_1E2F1B5D8)
    (*(void (**)(void *, uint64_t))(*(_QWORD *)v12 + 256))(v12, 1);
  v39 = objc_msgSend(a3, "objectForKey:", CFSTR("kCIContextName"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v40 = (uint64_t)v12;
    v41 = (const __CFString *)v39;
LABEL_59:
    CI::Context::set_client_name(v40, v41);
    goto LABEL_60;
  }
  if (objc_msgSend(a3, "valueForKey:", CFSTR("CoreUI")))
  {
    v41 = CFSTR("CoreUI");
    v40 = (uint64_t)v12;
    goto LABEL_59;
  }
LABEL_60:
  v42 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("quality"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v42, "floatValue");
    (*(void (**)(void *))(*(_QWORD *)v12 + 192))(v12);
  }
  v43 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __52__CIContext_Internal__internalSWContextWithOptions___block_invoke;
  v50[3] = &__block_descriptor_40_e8_v12__0B8l;
  v50[4] = v12;
  OptionIsTrueOrFalse(a3, (uint64_t)CFSTR("high_quality_downsample"), (uint64_t)v50);
  if (a3)
    v44 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("kCIContextCacheIntermediates"));
  else
    v44 = 0;
  if (v44 == v29 || v44 == &unk_1E2F1B5C0)
    (*(void (**)(void *, uint64_t))(*(_QWORD *)v12 + 224))(v12, 0xFFFFFFFFLL);
  v49[0] = v43;
  v49[1] = 3221225472;
  v49[2] = __52__CIContext_Internal__internalSWContextWithOptions___block_invoke_2;
  v49[3] = &__block_descriptor_40_e8_v12__0B8l;
  v49[4] = v12;
  OptionIsTrueOrFalse(a3, (uint64_t)CFSTR("kCIContextAllowClampToAlpha"), (uint64_t)v49);
  v45 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("kCIContextHLGOpticalScale"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v45, "floatValue");
    (*(void (**)(void *))(*(_QWORD *)v12 + 144))(v12);
  }
  else if (v45)
  {
    v46 = ci_logger_api();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      +[CIContext(Internal) internalSWContextWithOptions:].cold.1();
  }
  v48[0] = v43;
  v48[1] = 3221225472;
  v48[2] = __52__CIContext_Internal__internalSWContextWithOptions___block_invoke_256;
  v48[3] = &__block_descriptor_40_e8_v12__0B8l;
  v48[4] = v12;
  OptionIsTrueOrFalse(a3, (uint64_t)CFSTR("kCIContextLossyCompressedIntermediates"), (uint64_t)v48);
  return v12;
}

uint64_t __52__CIContext_Internal__internalSWContextWithOptions___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 208))(*(_QWORD *)(a1 + 32));
}

uint64_t __52__CIContext_Internal__internalSWContextWithOptions___block_invoke_2(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 41) = a2;
  return result;
}

uint64_t __52__CIContext_Internal__internalSWContextWithOptions___block_invoke_256(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 32) + 160))(*(_QWORD *)(a1 + 32));
}

+ (void)internalCLContextWithOptions:(id)a3 glContext:(void *)a4
{
  return 0;
}

+ (void)internalCLContextWithOptions:(id)a3
{
  return (void *)objc_msgSend(a1, "internalCLContextWithOptions:glContext:", a3, 0);
}

- (id)_CPUShadow
{
  CI::MetalContext *v2;
  CI::Object *v3;
  id v4;

  v2 = -[CIContext _internalContext](self, "_internalContext");
  if ((*(unsigned int (**)(CI::MetalContext *))(*(_QWORD *)v2 + 16))(v2) != 77)
    return self;
  v3 = (CI::Object *)CI::MetalContext::SWShadow(v2);
  v4 = -[CIContext _initWithInternalRepresentation:]([CIContext alloc], "_initWithInternalRepresentation:", v3);
  if (v3)
    CI::Object::unref(v3);
  return v4;
}

- (id)_createClone
{
  const CI::Context *v2;
  int v3;
  CI::SWContext *v4;
  id v5;

  v2 = -[CIContext _internalContext](self, "_internalContext");
  v3 = (*(uint64_t (**)(const CI::Context *))(*(_QWORD *)v2 + 16))(v2);
  switch(v3)
  {
    case 'K':
      v4 = (CI::SWContext *)operator new();
      CI::SWContext::SWContext(v4, v2);
      goto LABEL_7;
    case 'M':
      v4 = (CI::SWContext *)operator new();
      CI::MetalContext::MetalContext(v4, v2);
      goto LABEL_7;
    case 'L':
      v4 = (CI::SWContext *)operator new();
      CI::GLContext::GLContext(v4, v2);
LABEL_7:
      v5 = -[CIContext _initWithInternalRepresentation:]([CIContext alloc], "_initWithInternalRepresentation:", v4);
      CI::Object::unref(v4);
      return v5;
  }
  return 0;
}

- (id)_pdfDataRepresentation
{
  return 0;
}

+ (id)_namedCache
{
  if (+[CIContext(_createCached) _namedCache]::onceToken != -1)
    dispatch_once(&+[CIContext(_createCached) _namedCache]::onceToken, &__block_literal_global_11);
  return (id)+[CIContext(_createCached) _namedCache]::cache;
}

uint64_t __39__CIContext__createCached___namedCache__block_invoke()
{
  +[CIContext(_createCached) _namedCache]::cache = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99D38]);
  objc_msgSend((id)+[CIContext(_createCached) _namedCache]::cache, "setName:", CFSTR("com.apple.coreimage.nscache.CIContext"));
  objc_msgSend((id)+[CIContext(_createCached) _namedCache]::cache, "setCountLimit:", 256);
  return objc_msgSend((id)+[CIContext(_createCached) _namedCache]::cache, "setEvictsObjectsWhenApplicationEntersBackground:", 1);
}

+ (id)_cachedContext:(id)a3 options:(id)a4
{
  void *v6;
  void *v7;
  void *v9;
  CIContext *v10;

  v6 = (void *)objc_msgSend(a1, "_namedCache");
  v7 = (void *)objc_msgSend(v6, "objectForKey:", a3);
  if (v7)
    return v7;
  v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v9, "addEntriesFromDictionary:", a4);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", a3, CFSTR("kCIContextName"));
  objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("kCIContextCacheIntermediates"));
  v10 = +[CIContext contextWithOptions:](CIContext, "contextWithOptions:", v9);
  objc_msgSend(v6, "setObject:forKey:", v10, a3);
  return v10;
}

- (CGImage)_createCGImage:(id)a3 fromRect:(CGRect)a4 format:(int)a5 premultiplied:(BOOL)a6 colorSpace:(CGColorSpace *)a7 deferred:(Trilean)a8 renderCallback:(id)a9
{
  _BOOL4 v12;
  uint64_t v13;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v20;
  id v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  const char *v31;
  CGImage *v32;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  CFTypeID TypeID;
  int is_luminance;
  CGColorSpaceModel Model;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  CGFloat MidY;
  uint64_t *v51;
  uint64_t *v52;
  id v53;
  char var0;
  char v56;
  uint64_t v57;
  unsigned int v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  int v62;
  NSObject *v63;
  os_signpost_id_t v64;
  uint64_t v65;
  double v66;
  double v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  CI::GraphObject *v72;
  CI::Node *v73;
  double *v74;
  CGImage *v75;
  CGImageRef CopyWithColorSpace;
  unint64_t v77;
  id v78;
  char v79;
  int v80;
  void *v81;
  int v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  int v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double *v92;
  NSObject *v93;
  os_signpost_id_t v94;
  uint64_t v95;
  CI::Object *v96;
  CIRenderDestination *v97;
  CIRenderTask *v98;
  CGImageRef CGImage;
  unsigned int v100;
  CGImage *v101;
  CGFloat v102;
  double v103;
  CI *v104;
  CGFloat v105;
  double v106;
  CGFloat v107;
  CGImage *v108;
  int v109;
  int has_alpha;
  CGFloat v111;
  double v112;
  double v113;
  CGFloat v114;
  double v115;
  CGFloat v116;
  __IOSurface *v117;
  int v118;
  int v119;
  int v120;
  int v121;
  int v122;
  CGImageRef v123;
  __CFDictionary *Mutable;
  const void *v125;
  __CFDictionary **v126;
  _QWORD *v127;
  NSObject *v128;
  void *v129;
  unint64_t v130;
  unint64_t v131;
  CFNumberRef v132;
  uint64_t v133;
  float v134;
  float v135;
  int v136;
  uint64_t v137;
  NSObject *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  NSObject *v145;
  const char *v146;
  _BOOL4 v147;
  int v148;
  int v149;
  int v150;
  CGFloat v151;
  CGFloat v152;
  int v153;
  CI *v154;
  CI *v155;
  CGFloat v156;
  int v157;
  CGFloat v158;
  CGFloat v159;
  unsigned int v160;
  uint64_t v161;
  void (**v162)(_QWORD, _QWORD, double, double, double, double);
  uint64_t v163;
  unint64_t v164;
  unint64_t v165;
  void *v166;
  _QWORD v167[3];
  __int128 v168;
  double v169;
  uint64_t valuePtr;
  uint8_t buf[8];
  uint64_t v172;
  void (*v173)(uint64_t, const void *, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v174;
  uint64_t *v175;
  double *v176;
  uint64_t *v177;
  CGColorSpace *v178;
  int v179;
  unsigned int v180;
  BOOL v181;
  int64x2_t v182[3];
  __int32 v183;
  __int16 v184;
  _QWORD v185[6];
  int64x2_t v186[3];
  uint64_t v187;
  uint64_t *v188;
  uint64_t v189;
  uint64_t v190;
  uint8_t v191[56];
  uint64_t v192;
  CGRect v193;
  CGRect v194;
  CGRect v195;
  CGRect v196;
  CGRect v197;
  CGRect v198;
  CGRect v199;
  CGRect v200;
  CGRect v201;
  CGRect v202;
  CGRect v203;
  CGRect v204;
  CGRect v205;
  CGRect v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;

  v12 = a6;
  v13 = *(_QWORD *)&a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v192 = *MEMORY[0x1E0C80C00];
  v20 = (void *)MEMORY[0x194026220](self, a2);
  v21 = a3;
  v22 = a3;
  -[CIContext _gpuContextCheck](self, "_gpuContextCheck");
  v193.origin.x = x;
  v193.origin.y = y;
  v193.size.width = width;
  v193.size.height = height;
  v194 = CGRectStandardize(v193);
  if (!a3)
    goto LABEL_4;
  v23 = v194.origin.x;
  v24 = v194.origin.y;
  v25 = v194.size.width;
  v26 = v194.size.height;
  if (CGRectIsInfinite(v194))
    goto LABEL_4;
  objc_msgSend(a3, "extent");
  v206.origin.x = v27;
  v206.origin.y = v28;
  v206.size.width = v29;
  v206.size.height = v30;
  v195.origin.x = v23;
  v195.origin.y = v24;
  v195.size.width = v25;
  v195.size.height = v26;
  v196 = CGRectIntersection(v195, v206);
  if (CGRectIsEmpty(v196))
  {
LABEL_4:
    v32 = 0;
    goto LABEL_5;
  }
  v34 = CI::format_modernize(v13, (CI *)"-[CIContext(_createCGImageInternal) _createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:]", v31);
  if (CI::format_CGBitmapInfo(v34, 1) == -1)
  {
    v35 = ci_logger_api();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[CIContext(_createCGImageInternal) _createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:].cold.1(v34);
    goto LABEL_4;
  }
  v36 = -[CIContext _internalContext](self, "_internalContext");
  if ((*(unsigned int (**)(void *))(*(_QWORD *)v36 + 16))(v36) == 76
    && CI::format_is_not_supported_as_destination_on_gles(v34))
  {
    v37 = ci_logger_api();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[CIContext(_createCGImageInternal) _createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:].cold.2(v34);
    goto LABEL_4;
  }
  if (!a7)
    goto LABEL_21;
  v38 = v34;
  TypeID = CGColorSpaceGetTypeID();
  if (TypeID != CFGetTypeID(a7) || !CGColorSpaceSupportsOutput(a7))
  {
LABEL_18:
    v42 = ci_logger_api();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      -[CIContext(_createCGImageInternal) _createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:].cold.5(v42, v43, v44, v45, v46, v47, v48, v49);
    goto LABEL_4;
  }
  is_luminance = CI::format_is_luminance(v38);
  Model = CGColorSpaceGetModel(a7);
  if (!is_luminance)
  {
    v34 = v38;
    if (Model == kCGColorSpaceModelRGB)
      goto LABEL_21;
    goto LABEL_18;
  }
  v34 = v38;
  if (Model)
    goto LABEL_18;
LABEL_21:
  v197.origin.x = v23;
  v197.origin.y = v24;
  v197.size.width = v25;
  v197.size.height = v26;
  MidY = CGRectGetMidY(v197);
  v167[1] = 0;
  v167[2] = 0;
  v167[0] = 0x3FF0000000000000;
  v168 = xmmword_192493540;
  v169 = MidY + MidY;
  v166 = (void *)objc_msgSend(a3, "imageByApplyingTransform:", v167);
  v51 = -[CIContext _internalContext](self, "_internalContext");
  v52 = v51;
  v53 = &__block_literal_global_12;
  if (a9)
    v53 = a9;
  v162 = (void (**)(_QWORD, _QWORD, double, double, double, double))v53;
  if ((*(unsigned int (**)(uint64_t *))(*v51 + 552))(v51))
    var0 = a8.var0;
  else
    var0 = -1;
  if ((_DWORD)v34 == 784 || (_DWORD)v34 == 785)
    v56 = -1;
  else
    v56 = var0;
  v187 = 0;
  v188 = &v187;
  v189 = 0x2020000000;
  v190 = 0;
  v57 = objc_msgSend(v166, "_internalRepresentation");
  if (objc_msgSend(v166, "isOpaque"))
  {
    objc_msgSend(v166, "extent");
    v207.origin.x = v23;
    v207.origin.y = v24;
    v207.size.width = v25;
    v207.size.height = v26;
    if (CGRectContainsRect(v198, v207))
    {
      if ((_DWORD)v34 == 264)
        v58 = 268;
      else
        v58 = v34;
      if (v58 == 266)
        v58 = 270;
      if (v58 == 265)
        v58 = 269;
      if (v58 == 267)
        v58 = 271;
      if (v58 == 784)
        v58 = 775;
      if (v58 == 1800)
        v58 = 1804;
      if (v58 == 2056)
        v58 = 2060;
      if (v58 == 2312)
        v58 = 2316;
      if (v58 == 260)
        v58 = 259;
      if (v58 == 1796)
        v58 = 1795;
      if (v58 == 2052)
        v58 = 2051;
      if (v58 == 2308)
        v34 = 2307;
      else
        v34 = v58;
    }
  }
  if (v12)
    v59 = 1;
  else
    v59 = 2;
  if (CI::format_has_unpremul_alpha(v34))
  {
    v60 = 2;
  }
  else if (CI::format_has_alpha(v34))
  {
    v60 = v59;
  }
  else
  {
    v60 = 0;
  }
  v163 = v60;
  CI::Context::swizzler_for_output((uint64_t)v52, v34, 0, v186);
  v164 = vcvtpd_u64_f64(v26);
  v165 = vcvtpd_u64_f64(v25);
  v185[0] = 0x3FF0000000000000;
  v185[1] = 0;
  v185[2] = 0;
  v185[3] = 0x3FF0000000000000;
  *(double *)&v185[4] = -v23;
  *(double *)&v185[5] = -v24;
  v183 = v186[0].i32[0];
  v184 = 0;
  v61 = strcmp((const char *)v52 + 236, "CoreUI");
  if (*(_BYTE *)(v57 + 97))
  {
    v62 = v61;
    -[CIContext lock](self, "lock");
    ++v52[19];
    v52[24] = 0;
    *((double *)v52 + 20) = v23;
    *((double *)v52 + 21) = v24;
    *((double *)v52 + 22) = v25;
    *((double *)v52 + 23) = v26;
    (*(void (**)(uint64_t *, _QWORD))(*v52 + 240))(v52, 0);
    v199.origin.x = (*(double (**)(uint64_t))(*(_QWORD *)v57 + 88))(v57);
    v200 = CGRectIntegral(v199);
    v208.origin.x = v23;
    v208.origin.y = v24;
    v208.size.width = v25;
    v208.size.height = v26;
    if (!CGRectContainsRect(v200, v208))
    {
LABEL_81:
      -[CIContext unlock](self, "unlock");
      goto LABEL_82;
    }
    v63 = ci_signpost_log_render();
    v160 = v34;
    v64 = (*(uint64_t (**)(uint64_t *))(*v52 + 272))(v52) << 32;
    if (v64 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1921E4000, v63, OS_SIGNPOST_INTERVAL_BEGIN, v64, "create_cgimage_check", (const char *)&unk_192520C83, buf, 2u);
    }
    v65 = (*(uint64_t (**)(uint64_t *))(*v52 + 272))(v52);
    TimerBase::TimerBase((uint64_t)v191, v65, 0, (uint64_t)"create_cgimage_check", 0);
    v201.origin.x = v23;
    v201.origin.y = v24;
    v201.size.width = (double)v165;
    v201.size.height = (double)v164;
    v66 = CI::Affine::applyToRect((CI::Affine *)v185, v201);
    v158 = v67;
    v159 = v68;
    v69 = v66;
    v71 = v70;
    v182[0] = v186[0];
    v182[1] = v186[1];
    v182[2] = v186[2];
    v72 = CI::prepare_initial_graph(v52, "create_cgimage_check", (unsigned int *)v57, 0, a7, v160, (uint64_t)v182, (uint64_t)v185, v23, v24, (double)v165, (double)v164, 1u, (uint64_t)&v183);
    v74 = (double *)v72;
    if (!v62 && v56 == -1)
    {
LABEL_75:
      v75 = (CGImage *)v188[3];
      v34 = v160;
      if (v75)
      {
        CGImageGetColorSpace(v75);
        if ((CGColorSpaceEqualToColorSpace() & 1) == 0)
        {
          CFAutorelease((CFTypeRef)v188[3]);
          CopyWithColorSpace = CGImageCreateCopyWithColorSpace((CGImageRef)v188[3], a7);
          v188[3] = (uint64_t)CopyWithColorSpace;
        }
      }
      CI::traverse_releasing_resources((CI *)v74, v73);
      if (v74)
        CI::Object::unref((CI::Object *)v74);
      CI::create_cgimage(CIContext *,CIImage *,CGRect,CGColorSpace *,int,BOOL,CI::Trilean,void({block_pointer})(CGRect,NSError *))::SignpostTimer::~SignpostTimer((TimerBase *)v191);
      goto LABEL_81;
    }
    v87 = v160;
    if ((*(unsigned int (**)(CI::GraphObject *))(*(_QWORD *)v72 + 16))(v72) == 28)
    {
      if (v74[7] != 1.0
        || v74[8] != 0.0
        || v74[9] != 0.0
        || v74[10] != 1.0
        || vabdd_f64(v74[11], round(v74[11])) >= 1.0e-10
        || vabdd_f64(v74[12], round(v74[12])) >= 1.0e-10)
      {
        goto LABEL_75;
      }
      CI::Affine::inverse((CI::Affine *)(v74 + 7), (double *)buf);
      v202.origin.x = v69;
      v202.origin.y = v71;
      v202.size.width = v158;
      v202.size.height = v159;
      v88 = CI::Affine::applyToRect((CI::Affine *)buf, v202);
      v158 = v89;
      v159 = v90;
      v69 = v88;
      v71 = v91;
      v92 = (double *)(*(uint64_t (**)(double *, _QWORD))(*(_QWORD *)v74 + 48))(v74, 0);
      v87 = v160;
    }
    else
    {
      v92 = v74;
    }
    if ((*(unsigned int (**)(double *))(*(_QWORD *)v92 + 16))(v92) == 31
      || (*(unsigned int (**)(double *))(*(_QWORD *)v92 + 16))(v92) == 32)
    {
      v92 = (double *)(*(uint64_t (**)(double *, _QWORD))(*(_QWORD *)v92 + 48))(v92, 0);
    }
    if ((*(unsigned int (**)(double *))(*(_QWORD *)v92 + 16))(v92) == 47)
    {
      v100 = (*(uint64_t (**)(double *))(*(_QWORD *)v92 + 408))(v92);
      if (v100 > 0xF || ((1 << v100) & 0xFC2B) == 0)
        goto LABEL_75;
      v92 = (double *)(*(uint64_t (**)(double *, _QWORD))(*(_QWORD *)v92 + 48))(v92, 0);
      v87 = v160;
    }
    if ((*(unsigned int (**)(double *))(*(_QWORD *)v92 + 16))(v92) == 29)
    {
      v101 = (CGImage *)*((_QWORD *)v92 + 13);
      v102 = (*(double (**)(double *))(*(_QWORD *)v92 + 168))(v92);
      v154 = v104;
      v156 = v103;
      v105 = v102;
      v107 = v106;
      v109 = CI::format_from_CGImage((uint64_t)v101, v108);
      if (CI::format_has_alpha(v109))
        has_alpha = CI::format_has_alpha(v87);
      else
        has_alpha = 1;
      if (CI::format_is_rgb(v109) && (CI::format_is_rgb(v87) & 1) != 0)
      {
        v153 = 1;
      }
      else if (CI::format_is_luminance(v109))
      {
        v153 = CI::format_is_luminance(v87);
      }
      else
      {
        v153 = 0;
      }
      v121 = CI::format_bits_per_component(v109);
      v122 = CI::format_bits_per_component(v87);
      if (CGImageGetProperty() != *MEMORY[0x1E0C9AE50] || v56 != -1)
      {
        v203.origin.x = v105;
        v203.origin.y = v107;
        *(_QWORD *)&v203.size.height = v154;
        v203.size.width = v156;
        v209.origin.x = v69;
        v209.origin.y = v71;
        v209.size.width = v158;
        v209.size.height = v159;
        if ((CGRectContainsRect(v203, v209) & has_alpha & v153) == 1 && v121 == v122)
        {
          v204.origin.x = v69;
          v204.origin.y = v71;
          v204.size.width = v158;
          v204.size.height = v159;
          v123 = CGImageCreateWithImageInRect(v101, v204);
          v188[3] = (uint64_t)v123;
        }
      }
    }
    else if ((*(unsigned int (**)(double *))(*(_QWORD *)v92 + 16))(v92) == 46)
    {
      v155 = (CI *)*((_QWORD *)v92 + 7);
      v111 = (*(double (**)(double *))(*(_QWORD *)v92 + 168))(v92);
      v151 = v113;
      v152 = v112;
      v114 = v111;
      v116 = v115;
      v147 = (*(uint64_t (**)(double *))(*(_QWORD *)v92 + 416))(v92) != 2;
      v118 = CI::format_from_IOSurface(v155, v117);
      v119 = CI::format_CGBitmapInfo(v118, v147);
      v157 = v118;
      v120 = CI::format_has_alpha(v118) ? CI::format_has_alpha(v160) : 1;
      v148 = v119;
      if (CI::format_is_rgb(v157) && (CI::format_is_rgb(v160) & 1) != 0)
        v150 = 1;
      else
        v150 = CI::format_is_luminance(v157) ? CI::format_is_luminance(v160) : 0;
      v149 = CI::format_bits_per_component(v157);
      v136 = CI::format_bits_per_component(v160);
      v205.origin.x = v114;
      v205.origin.y = v116;
      v205.size.height = v151;
      v205.size.width = v152;
      v210.origin.x = v69;
      v210.origin.y = v71;
      v210.size.width = v158;
      v210.size.height = v159;
      if ((CGRectEqualToRect(v205, v210) & v120 & v150) == 1 && v149 == v136 && v148 != -1)
      {
        if (((*(unsigned int (**)(double *))(*(_QWORD *)v92 + 416))(v92)
           || (CI::format_has_alpha(v160) & 1) == 0)
          && (CI::format_has_alpha(v157) & 1) != 0
          || (v137 = CGImageCreateFromIOSurface(), (v188[3] = v137) == 0))
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          v172 = 3221225472;
          v173 = ___ZN2CIL14create_cgimageEP9CIContextP7CIImage6CGRectP12CGColorSpaceibNS_7TrileanEU13block_pointerFvS4_P7NSErrorE_block_invoke;
          v174 = &unk_1E2EC31F8;
          v179 = v157;
          v180 = v160;
          v181 = v147;
          v177 = v52;
          v178 = a7;
          v175 = &v187;
          v176 = v92;
          if (SurfaceApplyPlaneReadOnlyBlock(v155, (uint64_t)buf))
          {
            v138 = ci_logger_render();
            if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
              -[CIContext(_createCGImageInternal) _createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:].cold.4(v138, (uint64_t)v73, v139, v140, v141, v142, v143, v144);
          }
        }
      }
    }
    goto LABEL_75;
  }
LABEL_82:
  if (v56 != 1)
  {
    v77 = v164;
    if (v165 > v164)
      v77 = v165;
    if (v56 == -1 || v77 <= 0x1000)
    {
      if (v188[3])
      {
        if (!CGImageGetImageProvider())
          goto LABEL_198;
        CGImageRelease((CGImageRef)v188[3]);
      }
      valuePtr = 0;
      v81 = -[CIContext _internalContext](self, "_internalContext");
      v82 = CI_IOSURFACE_WRAPPING(2u);
      v83 = 544;
      if (!v82)
        v83 = 528;
      v84 = (*(uint64_t (**)(void *, uint64_t))(*(_QWORD *)v81 + v83))(v81, v34);
      v85 = v84 - 1 + (int)CI::format_bytes_per_pixel(v34) * v165;
      if ((v84 & (v84 - 1)) != 0)
        v86 = v85 / v84 * v84;
      else
        v86 = v85 & -(uint64_t)v84;
      v93 = ci_signpost_log_render();
      v94 = (*(uint64_t (**)(void *))(*(_QWORD *)v81 + 272))(v81) << 32;
      if (v94 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v93))
      {
        *(_DWORD *)v191 = 134218240;
        *(_QWORD *)&v191[4] = v165;
        *(_WORD *)&v191[12] = 2048;
        *(_QWORD *)&v191[14] = v164;
        _os_signpost_emit_with_name_impl(&dword_1921E4000, v93, OS_SIGNPOST_INTERVAL_BEGIN, v94, "new_bitmap", "[%zu %zu]", v191, 0x16u);
      }
      v95 = (*(uint64_t (**)(void *))(*(_QWORD *)v81 + 272))(v81);
      TimerBase::TimerBase((uint64_t)v191, v95, 0, (uint64_t)"new_bitmap", 0);
      v96 = (CI::Object *)operator new();
      CI::Bitmap::Bitmap(v96, v165, v164, v34, v163 == 1, a7, v86);
      CI::create_cgimage_immediate(CIContext *,CIImage *,CGRect,CGColorSpace *,int,CIRenderDestinationAlphaMode,NSError **)::SignpostTimer::~SignpostTimer((TimerBase *)v191);
      v97 = -[CIRenderDestination initWithBitmapData:width:height:bytesPerRow:format:]([CIRenderDestination alloc], "initWithBitmapData:width:height:bytesPerRow:format:", *((_QWORD *)v96 + 9), *((_QWORD *)v96 + 10), *((_QWORD *)v96 + 11), *((_QWORD *)v96 + 12), v34);
      -[CIRenderDestination setFlipped:](v97, "setFlipped:", 0);
      -[CIRenderDestination setColorSpace:](v97, "setColorSpace:", a7);
      -[CIRenderDestination setAlphaMode:](v97, "setAlphaMode:", v163);
      if (v163 == 2)
        -[CIRenderDestination setClamped:](v97, "setClamped:", 0);
      *(_QWORD *)v191 = 0;
      v98 = -[CIContext startTaskToRender:fromRect:toDestination:atPoint:error:](self, "startTaskToRender:fromRect:toDestination:atPoint:error:", v166, v97, v191, v23, v24, v25, v26, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

      -[CIRenderTask waitUntilCompletedAndReturnError:](v98, "waitUntilCompletedAndReturnError:", &valuePtr);
      if (*(_QWORD *)v191)
      {
        CI::Object::unref(v96);
        CGImage = 0;
      }
      else
      {
        CGImage = CI::Bitmap::create_CGImage(v96);
        CI::Object::unref(v96);
        if (CGImage)
          CGImageSetProperty();
      }
      v188[3] = (uint64_t)CGImage;
      v162[2](v162, valuePtr, v23, v24, v25, v26);
      goto LABEL_198;
    }
  }
  if (v188[3])
    goto LABEL_198;
  v78 = -[CIContext _createClone](self, "_createClone");
  v161 = objc_msgSend(v78, "_internalContext");
  v79 = 0;
  if ((int)v34 > 1794)
  {
    if ((int)v34 <= 2306)
    {
      v80 = v34;
      switch((int)v34)
      {
        case 1795:
          goto LABEL_166;
        case 1796:
        case 1800:
        case 1804:
          goto LABEL_170;
        case 1797:
        case 1798:
        case 1802:
        case 1803:
          goto LABEL_215;
        case 1799:
          v79 = 0;
          v80 = 1804;
          goto LABEL_170;
        case 1801:
          v79 = 0;
          v80 = 1800;
          goto LABEL_170;
        default:
          v80 = v34;
          switch((int)v34)
          {
            case 2051:
              goto LABEL_135;
            case 2052:
            case 2056:
            case 2060:
              goto LABEL_170;
            case 2055:
              v79 = 0;
              v80 = 2060;
              goto LABEL_170;
            default:
              goto LABEL_215;
          }
      }
    }
    v80 = v34;
    switch((int)v34)
    {
      case 2307:
        goto LABEL_135;
      case 2308:
      case 2312:
      case 2316:
        goto LABEL_170;
      case 2309:
      case 2310:
      case 2314:
      case 2315:
        goto LABEL_215;
      case 2311:
        v79 = 0;
        v80 = 2316;
        goto LABEL_170;
      case 2313:
        v79 = 0;
        v80 = 2312;
        goto LABEL_170;
      default:
        if ((_DWORD)v34 == 3331)
          goto LABEL_166;
        goto LABEL_215;
    }
  }
  if ((int)v34 <= 770)
  {
    v80 = v34;
    switch((int)v34)
    {
      case 259:
LABEL_135:
        v79 = 1;
        v80 = v34;
        goto LABEL_170;
      case 260:
      case 264:
      case 268:
        goto LABEL_170;
      case 263:
      case 269:
      case 270:
      case 271:
        v79 = 0;
        v80 = 268;
        goto LABEL_170;
      case 265:
      case 266:
      case 267:
        v79 = 0;
        v80 = 264;
        goto LABEL_170;
      default:
        goto LABEL_215;
    }
  }
  if ((int)v34 > 783)
  {
    v80 = v34;
    if ((_DWORD)v34 != 784)
    {
      if ((_DWORD)v34 != 785)
        goto LABEL_215;
      v79 = 0;
      v80 = 784;
    }
  }
  else if ((_DWORD)v34 == 771)
  {
LABEL_166:
    v79 = 1;
    v80 = 1795;
  }
  else
  {
    v80 = v34;
    if ((_DWORD)v34 != 775)
    {
LABEL_215:
      v145 = ci_logger_render();
      if (os_log_type_enabled(v145, OS_LOG_TYPE_ERROR))
      {
        v146 = CI::name_for_format(v34);
        -[CIContext(_createCGImageInternal) _createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:].cold.3((uint64_t)v146, v191, v145);
      }
      goto LABEL_196;
    }
  }
LABEL_170:
  if ((CI::format_is_half_float(v34) & 1) == 0 && (CI::format_is_full_float(v34) & 1) == 0 && v80 != 775 && v80 != 784)
    CI::format_is_deep(v34);
  Mutable = CFDictionaryCreateMutable(0, 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (CI::format_has_alpha(v34))
  {
    if (v163 == 1)
    {
      v126 = (__CFDictionary **)MEMORY[0x1E0C9DAF0];
      goto LABEL_182;
    }
    if (v163 == 2)
    {
      v126 = (__CFDictionary **)MEMORY[0x1E0C9DAE0];
LABEL_182:
      __CFDictionary::setValue(Mutable, *v126, (const __CFString *)1, v125);
    }
  }
  else if ((v79 & 1) == 0)
  {
    v126 = (__CFDictionary **)MEMORY[0x1E0C9DAE8];
    goto LABEL_182;
  }
  *(_OWORD *)v191 = xmmword_1E2EC3218;
  *(_OWORD *)&v191[16] = *(_OWORD *)&off_1E2EC3228;
  v127 = malloc_type_calloc(1uLL, 0x50uLL, 0x108004010BCB57AuLL);
  *v127 = v78;
  v127[1] = v166;
  *((_DWORD *)v127 + 4) = v80;
  v127[3] = v163;
  *((double *)v127 + 4) = v23;
  *((double *)v127 + 5) = v24;
  *((double *)v127 + 6) = v25;
  *((double *)v127 + 7) = v26;
  v127[9] = _Block_copy(v162);
  v128 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v127[8] = dispatch_queue_create("CI_CGImageProviderCallbackQueue", v128);
  if (CGImageProviderCreate())
  {
    CGImageProviderSetProperty();
    v130 = CI::format_bytes_per_row(v34, v165);
    if (v130)
    {
      v131 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v161 + 488))(v161) / (2 * v130);
      if ((int)v131 >= (int)(0x4000000 / v130))
        LODWORD(v131) = 0x4000000 / v130;
      if ((int)v131 >= (int)v164)
        LODWORD(v131) = v164;
      LODWORD(valuePtr) = v131;
      v132 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
      CGImageProviderSetProperty();
      if (v132)
        CFRelease(v132);
    }
    v133 = CGImageCreateWithImageProvider();
    CGImageProviderRelease();
    if (Mutable)
      CFRelease(Mutable);
    if (v133)
      CGImageSetProperty();
    goto LABEL_197;
  }
  CI::_providerInfoReleaseCallback((CI *)v127, v129);
LABEL_196:
  v133 = 0;
LABEL_197:
  v188[3] = v133;

LABEL_198:
  objc_msgSend(v166, "contentHeadroom");
  v135 = v134;
  if (!CGColorSpaceUsesITUR_2100TF(a7) && CGColorSpaceUsesExtendedRange(a7))
    CI::format_is_float(v34);
  if (v135 >= 1.0)
    CGImageSetHeadroom();
  v32 = (CGImage *)v188[3];
  _Block_object_dispose(&v187, 8);
LABEL_5:
  objc_autoreleasePoolPop(v20);
  return v32;
}

- (CGImage)createCGImage:(id)a3 fromRect:(CGRect)a4 format:(int)a5 premultiplied:(BOOL)a6 colorSpace:(CGColorSpace *)a7 deferred:(BOOL)a8 renderCallback:(id)a9
{
  _BOOL4 v10;
  _BOOL8 v12;
  double height;
  double width;
  double y;
  double x;
  uint64_t v19;
  uint64_t v20;

  v10 = a8;
  v12 = a6;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v19 = CI::format_modernize(*(uint64_t *)&a5, (CI *)"-[CIContext(createCGImageInternal) createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:]", (const char *)a3);
  if (v10)
    v20 = 1;
  else
    v20 = 255;
  return -[CIContext _createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:](self, "_createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:", a3, v19, v12, a7, v20, a9, x, y, width, height);
}

- (CGImageRef)createCGImage:(CIImage *)image fromRect:(CGRect)fromRect
{
  double height;
  double width;
  double y;
  double x;
  CGColorSpace *v10;
  CGColorSpace *v11;
  CGColorSpaceModel Model;
  CIFormat *v13;
  _BOOL4 v14;
  CGImage *v15;

  height = fromRect.size.height;
  width = fromRect.size.width;
  y = fromRect.origin.y;
  x = fromRect.origin.x;
  v10 = CGColorSpaceRetain(-[CIContext _outputColorSpace](self, "_outputColorSpace"));
  v11 = v10;
  if (!v10)
    goto LABEL_5;
  Model = CGColorSpaceGetModel(v10);
  if (Model != kCGColorSpaceModelRGB)
  {
    if (Model == kCGColorSpaceModelMonochrome)
    {
      v13 = &kCIFormatLA8;
      goto LABEL_9;
    }
LABEL_5:
    CGColorSpaceRelease(v11);
    v11 = +[CIContext defaultRGBColorSpace](CIContext, "defaultRGBColorSpace");
    v13 = &kCIFormatRGBA8;
    goto LABEL_9;
  }
  v14 = CGColorSpaceUsesExtendedRange(v11);
  if (CGColorSpaceUsesITUR_2100TF(v11) || v14)
    v13 = &kCIFormatRGBAh;
  else
    v13 = &kCIFormatRGBA8;
LABEL_9:
  v15 = -[CIContext createCGImage:fromRect:format:colorSpace:](self, "createCGImage:fromRect:format:colorSpace:", image, *v13, v11, x, y, width, height);
  CGColorSpaceRelease(v11);
  return v15;
}

- (CGImage)createCGImage:(id)a3 fromRect:(CGRect)a4 format:(int)a5
{
  uint64_t v5;
  double height;
  double width;
  double y;
  double x;
  CGColorSpace *v12;
  const char *v13;
  uint64_t v14;
  CFTypeID TypeID;
  int is_luminance;
  CGColorSpaceModel Model;
  CGColorSpace *v18;
  CGImage *v19;

  v5 = *(_QWORD *)&a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = -[CIContext _outputColorSpace](self, "_outputColorSpace");
  v14 = CI::format_modernize(v5, (CI *)"-[CIContext(createCGImage) createCGImage:fromRect:format:]", v13);
  TypeID = CGColorSpaceGetTypeID();
  if (TypeID == CFGetTypeID(v12) && CGColorSpaceSupportsOutput(v12))
  {
    is_luminance = CI::format_is_luminance(v14);
    Model = CGColorSpaceGetModel(v12);
    if (is_luminance)
    {
      if (Model)
        goto LABEL_5;
    }
    else if (Model != kCGColorSpaceModelRGB)
    {
      goto LABEL_5;
    }
    CGColorSpaceRetain(v12);
    goto LABEL_9;
  }
LABEL_5:
  if (CI::format_is_luminance(v14))
    v18 = +[CIContext defaultGrayColorSpace](CIContext, "defaultGrayColorSpace");
  else
    v18 = +[CIContext defaultRGBColorSpace](CIContext, "defaultRGBColorSpace");
  v12 = v18;
LABEL_9:
  v19 = -[CIContext createCGImage:fromRect:format:colorSpace:](self, "createCGImage:fromRect:format:colorSpace:", a3, v14, v12, x, y, width, height);
  CGColorSpaceRelease(v12);
  return v19;
}

- (CGImageRef)createCGImage:(CIImage *)image fromRect:(CGRect)fromRect format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace
{
  return -[CIContext _createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:](self, "_createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:", image, CI::format_modernize(*(uint64_t *)&format, (CI *)"-[CIContext(createCGImage) createCGImage:fromRect:format:colorSpace:]", (const char *)image), *(unsigned __int8 *)(-[CIContext _internalContext](self, "_internalContext") + 40), colorSpace, 0, 0, fromRect.origin.x, fromRect.origin.y, fromRect.size.width, fromRect.size.height);
}

- (CGImageRef)createCGImage:(CIImage *)image fromRect:(CGRect)fromRect format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace deferred:(BOOL)deferred
{
  _BOOL4 v7;
  double height;
  double width;
  double y;
  double x;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v7 = deferred;
  height = fromRect.size.height;
  width = fromRect.size.width;
  y = fromRect.origin.y;
  x = fromRect.origin.x;
  v15 = CI::format_modernize(*(uint64_t *)&format, (CI *)"-[CIContext(createCGImage) createCGImage:fromRect:format:colorSpace:deferred:]", (const char *)image);
  v16 = *(unsigned __int8 *)(-[CIContext _internalContext](self, "_internalContext") + 40);
  if (v7)
    v17 = 1;
  else
    v17 = 255;
  return -[CIContext _createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:](self, "_createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:", image, v15, v16, colorSpace, v17, 0, x, y, width, height);
}

- (id)addAuxOptionsForSDR:(id)a3 HDR:(id)a4 colorSpace:(CGColorSpace *)a5 rgbGainmap:(BOOL)a6
{
  _BOOL4 v6;
  float v11;
  float v12;
  CGColorSpace *ExtendedLinearized;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CIImage *v20;
  double v21;
  CGFloat v22;
  double v23;
  CIImage *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  float v31;
  CIImage *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  float v39;
  CIImage *v40;
  CIRenderDestination *v41;
  CIRenderDestination *v42;
  CIImage *v43;
  uint64_t v44;
  double v51;
  float v52;
  float v53;
  CIColorKernel *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  uint64_t v63;
  id v64;
  double v65;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  uint64_t v73;
  id v74;
  CIImage *v75;
  uint64_t v76;
  float v80;
  float v81;
  CIColorKernel *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  id *v92;
  id result;
  double v94;
  double v95;
  double v96;
  double v97;
  id v98;
  double v99;
  double v100;
  uint64_t v101;
  CIColorKernel *v102;
  CGAffineTransform v103;
  CGAffineTransform v104;
  CGAffineTransform v105;
  _QWORD v106[7];
  _QWORD v107[7];
  id v108;
  id v109;
  const __CFString *v110;
  CIVector *v111;
  const __CFString *v112;
  uint64_t v113;
  _QWORD v114[4];
  const __CFString *v115;
  uint64_t v116;
  _QWORD v117[4];
  const __CFString *v118;
  CIVector *v119;
  CGAffineTransform v120;
  uint64_t v121;
  CGRect v122;
  CGRect v123;

  v121 = *MEMORY[0x1E0C80C00];
  if (!a4)
    return 0;
  v6 = a6;
  objc_msgSend(a4, "extent");
  if (CGRectIsEmpty(v122))
    return 0;
  objc_msgSend(a4, "extent");
  if (CGRectIsInfinite(v123))
    return 0;
  objc_msgSend(a4, "contentHeadroom");
  v12 = v11;
  ExtendedLinearized = CGColorSpaceCreateExtendedLinearized(a5);
  if (!ExtendedLinearized)
    ExtendedLinearized = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D958]);
  v14 = (void *)objc_msgSend(a3, "imageByColorMatchingWorkingSpaceToColorSpace:", ExtendedLinearized);
  v15 = (void *)objc_msgSend(a4, "imageByColorMatchingWorkingSpaceToColorSpace:", ExtendedLinearized);
  CGColorSpaceRelease(ExtendedLinearized);
  v16 = (void *)objc_msgSend(v14, "_imageByClampingAlpha");
  objc_msgSend(v15, "extent");
  v18 = -v17;
  objc_msgSend(v15, "extent");
  CGAffineTransformMakeTranslation(&v105, v18, -v19);
  v104 = v105;
  v20 = (CIImage *)objc_msgSend(v15, "imageByApplyingTransform:highQualityDownsample:", &v104, 0);
  objc_msgSend(v16, "extent");
  v22 = -v21;
  objc_msgSend(v16, "extent");
  CGAffineTransformMakeTranslation(&v120, v22, -v23);
  v105 = v120;
  v103 = v120;
  v24 = (CIImage *)objc_msgSend(v16, "imageByApplyingTransform:highQualityDownsample:", &v103, 0);
  -[CIImage extent](v24, "extent");
  v26 = v25;
  -[CIImage extent](v20, "extent");
  *(float *)&v26 = v26 / v27;
  -[CIImage extent](v24, "extent");
  v29 = v28;
  -[CIImage extent](v20, "extent");
  v31 = v29 / v30;
  v32 = downScale(v20, *(float *)&v26, v31);
  -[CIImage extent](v32, "extent");
  v34 = v33;
  -[CIImage extent](v24, "extent");
  *(float *)&v34 = v34 / v35;
  -[CIImage extent](v32, "extent");
  v37 = v36;
  -[CIImage extent](v24, "extent");
  v39 = v37 / v38;
  v40 = downScale(v24, *(float *)&v34, v39);
  v120.a = 0.0;
  v120.b = 0.0;
  v41 = -[CIRenderDestination initWithBitmapData:width:height:bytesPerRow:format:]([CIRenderDestination alloc], "initWithBitmapData:width:height:bytesPerRow:format:", &v120, 1, 1, 16, 2054);
  v42 = v41;
  -[CIRenderDestination setColorSpace:](v41, "setColorSpace:", 0);
  if (v12 == 0.0)
  {
    v43 = downScale(-[CIImage imageByApplyingFilter:](v32, "imageByApplyingFilter:", CFSTR("CIMaximumComponent")), 0.125, 0.125);
    v118 = CFSTR("inputExtent");
    -[CIImage extent](v43, "extent");
    v119 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
    v44 = -[CIImage imageByApplyingFilter:withInputParameters:](v43, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaMaximum"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1));
    -[CIRenderTask waitUntilCompletedAndReturnError:](-[CIContext startTaskToRender:fromRect:toDestination:atPoint:error:](self, "startTaskToRender:fromRect:toDestination:atPoint:error:", v44, v41, 0, 0.0, 0.0, 1.0, 1.0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8)), "waitUntilCompletedAndReturnError:", 0);
    _H0 = LOWORD(v120.a);
    __asm { FCVT            D0, H0 }
    v51 = fmax(_D0, 1.0);
  }
  else
  {
    v51 = v12;
  }
  v52 = v51;
  v53 = log2f(v52);
  if (v51 <= 1.0)
    return 0;
  v54 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_flexMapLinGain);
  v102 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_flexMapLinGainRGB);
  -[CIImage extent](v32, "extent");
  v56 = v55;
  v58 = v57;
  v60 = v59;
  v62 = v61;
  v117[0] = v32;
  v117[1] = v40;
  v117[2] = &unk_1E2F1D918;
  v117[3] = &unk_1E2F1D918;
  v63 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v117, 4);
  v115 = CFSTR("kCIKernelOutputFormat");
  v116 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2053);
  v64 = -[CIColorKernel applyWithExtent:arguments:options:](v54, "applyWithExtent:arguments:options:", v63, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1), v56, v58, v60, v62);
  -[CIImage extent](v32, "extent");
  _D9 = v65;
  v68 = v67;
  v70 = v69;
  v72 = v71;
  v114[0] = v32;
  v114[1] = v40;
  v114[2] = &unk_1E2F1D918;
  v114[3] = &unk_1E2F1D918;
  v73 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v114, 4);
  v112 = CFSTR("kCIKernelOutputFormat");
  v113 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2056);
  v74 = -[CIColorKernel applyWithExtent:arguments:options:](v102, "applyWithExtent:arguments:options:", v73, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1), _D9, v68, v70, v72);
  v75 = downScale((CIImage *)objc_msgSend(v64, "imageByApplyingFilter:", CFSTR("CIMedianFilter")), 0.125, 0.125);
  v110 = CFSTR("inputExtent");
  -[CIImage extent](v75, "extent");
  v111 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  v76 = -[CIImage imageByApplyingFilter:withInputParameters:](v75, "imageByApplyingFilter:withInputParameters:", CFSTR("CIAreaMinMaxRed"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1));
  -[CIRenderTask waitUntilCompletedAndReturnError:](-[CIContext startTaskToRender:fromRect:toDestination:atPoint:error:](self, "startTaskToRender:fromRect:toDestination:atPoint:error:", v76, v41, 0, 0.0, 0.0, 1.0, 1.0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8)), "waitUntilCompletedAndReturnError:", 0);
  _H0 = LOWORD(v120.a);
  __asm { FCVT            S0, H0; float }
  _H1 = WORD1(v120.a);
  __asm { FCVT            S9, H1 }
  v80 = log2f(_S0);
  v81 = log2f(*(float *)&_D9);
  if (v80 > -0.01 && v80 <= 0.0)
    v80 = 0.0;
  if (v6)
  {
    v83 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_flexMapImageRGB);
    objc_msgSend(v74, "extent");
    v85 = v84;
    v87 = v86;
    v89 = v88;
    v91 = v90;
    v109 = v74;
    v92 = &v109;
  }
  else
  {
    v83 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_flexMapImage);
    objc_msgSend(v64, "extent");
    v85 = v84;
    v87 = v94;
    v89 = v95;
    v91 = v96;
    v108 = v64;
    v92 = &v108;
  }
  *(float *)&v84 = v80;
  v92[1] = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v84);
  *(float *)&v97 = v81;
  v92[2] = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v97);
  result = -[CIColorKernel applyWithExtent:arguments:](v83, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v92, 3), v85, v87, v89, v91);
  if (result)
  {
    v98 = result;
    v106[0] = CFSTR("kCIImageRepresentationISOGainMapAlternateHeadroom");
    v107[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v53);
    v107[1] = &unk_1E2F19260;
    v106[1] = CFSTR("kCIImageRepresentationISOGainMapBaseHeadroom");
    v106[2] = CFSTR("kCIImageRepresentationISOGainMapMin");
    *(float *)&v99 = v80;
    v107[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v99);
    v106[3] = CFSTR("kCIImageRepresentationISOGainMapMax");
    *(float *)&v100 = v81;
    v107[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v100);
    v107[4] = &unk_1E2F1D918;
    v106[4] = CFSTR("kCIImageRepresentationISOGainMapOffset");
    v106[5] = CFSTR("kCIImageRepresentationHDRGainMapAsRGB");
    v101 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v106[6] = CFSTR("kCIImageRepresentationISOGainMapImage");
    v107[5] = v101;
    v107[6] = v98;
    return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v107, v106, 7);
  }
  return result;
}

- (id)_dataRepresentationOfImage:(id)a3 UTIType:(id)a4 format:(int)a5 premultiplied:(BOOL)a6 colorSpace:(CGColorSpace *)a7 options:(id)a8 addAuxData:(BOOL)a9 keysToMerge:(id)a10 error:(id *)a11
{
  _BOOL8 v13;
  uint64_t v14;
  __int128 v17;
  CGImage *v18;
  CGImage *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  CGImageDestinationRef v36;
  CGImageDestination *v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  unint64_t v45;
  uint64_t v46;
  void *v47;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  NSObject *v52;
  NSObject *v53;
  const char *v54;
  NSObject *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  const void *v60;
  uint64_t v61;
  const void *v62;
  uint64_t v63;
  const void *v64;
  int v65;
  int v66;
  int v67;
  int v68;
  double v69;
  double v70;
  CGImageMetadataTagRef v71;
  float v72;
  float v73;
  void *v74;
  float v75;
  uint64_t v76;
  double v77;
  void *v78;
  id v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t v82;
  char v83;
  unint64_t v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  const __CFDictionary *v88;
  uint64_t v89;
  id v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t k;
  void *v95;
  const __CFDictionary *v96;
  void *v97;
  void *v98;
  uint64_t isKindOfClass;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  CGFloat v106;
  CGFloat v107;
  const __CFDictionary *v108;
  unint64_t v109;
  unint64_t v110;
  void *v111;
  CGImageMetadata *Mutable;
  uint64_t v113;
  void *v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  void *v126;
  void *v127;
  void *v128;
  size_t v129;
  size_t v130;
  CFStringRef *v131;
  const __CFDictionary *v132;
  OSType v133;
  void *v134;
  CFStringRef *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  uint64_t v139;
  _BOOL4 v140;
  uint64_t v141;
  CGFloat v142;
  CGFloat v143;
  CGFloat v144;
  CGFloat v145;
  CGFloat v146;
  CGFloat v147;
  CGFloat v148;
  CGFloat v149;
  uint64_t v150;
  uint64_t v151;
  id v152;
  id v153;
  __int128 v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  const __CFString *auxiliaryImageDataType;
  void *v160;
  int v161;
  CGColorSpace *metadata;
  CGImageMetadata *metadataa;
  CIContext *v164;
  void *context;
  __CFData *data;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  _QWORD v176[6];
  uint64_t v177;
  uint64_t *v178;
  uint64_t v179;
  void (*v180)(uint64_t, uint64_t);
  void (*v181)(uint64_t);
  uint64_t v182;
  uint64_t v183;
  double *v184;
  uint64_t v185;
  __n128 (*v186)(uint64_t, uint64_t);
  uint64_t (*v187)();
  const char *v188;
  __int128 v189;
  __int128 v190;
  CFStringRef v191;
  _BYTE v192[128];
  _BYTE v193[128];
  _QWORD v194[4];
  _QWORD v195[4];
  CFStringRef v196[4];
  _QWORD v197[2];
  _QWORD v198[2];
  _QWORD v199[4];
  CFStringRef v200[4];
  _QWORD v201[3];
  _QWORD v202[3];
  _OWORD buf[8];
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  _QWORD v208[4];
  _QWORD v209[4];
  _QWORD v210[3];
  _QWORD v211[3];
  _QWORD v212[7];
  _QWORD v213[10];
  CGRect v214;
  CGRect v215;
  CGRect v216;
  CGRect v217;
  CGRect v218;
  CGRect v219;
  CGRect v220;
  CGRect v221;

  v13 = a6;
  v14 = *(_QWORD *)&a5;
  v213[7] = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x194026220](self, a2);
  v183 = 0;
  v184 = (double *)&v183;
  v186 = __Block_byref_object_copy__1;
  v187 = __Block_byref_object_dispose__1;
  v188 = "";
  v185 = 0x5012000000;
  v17 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v189 = *MEMORY[0x1E0C9D628];
  v190 = v17;
  v177 = 0;
  v178 = &v177;
  v179 = 0x3052000000;
  v180 = __Block_byref_object_copy__40;
  v181 = __Block_byref_object_dispose__41;
  v182 = 0;
  if ((objc_msgSend(a4, "isEqual:", CFSTR("public.jpeg")) & 1) == 0)
    objc_msgSend(a4, "isEqual:", CFSTR("public.heic"));
  objc_msgSend(a3, "extent");
  v176[0] = MEMORY[0x1E0C809B0];
  v176[1] = 3221225472;
  v176[2] = __138__CIContext_ImageRepresentation___dataRepresentationOfImage_UTIType_format_premultiplied_colorSpace_options_addAuxData_keysToMerge_error___block_invoke;
  v176[3] = &unk_1E2EC3300;
  v176[4] = &v183;
  v176[5] = &v177;
  v18 = -[CIContext createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:](self, "createCGImage:fromRect:format:premultiplied:colorSpace:deferred:renderCallback:", a3, v14, v13, a7, 1, v176);
  v19 = v18;
  if (!v18)
  {
    *(_QWORD *)&v204 = CFSTR("CINonLocalizedDescriptionKey");
    *(_QWORD *)&buf[0] = CFSTR("failed to create data representation.");
    v33 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v204, 1);
    v34 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CINonLocalizedDescriptionKey"), 3, v33);
    v35 = v34;
LABEL_162:
    data = 0;
    goto LABEL_163;
  }
  CFAutorelease(v18);
  metadata = a7;
  v164 = self;
  v20 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v20, "addEntriesFromDictionary:", objc_msgSend(a3, "properties"));
  v21 = *MEMORY[0x1E0CBCEA0];
  v194[0] = *MEMORY[0x1E0CBCA08];
  v194[1] = v21;
  v22 = *MEMORY[0x1E0CBD060];
  v194[2] = *MEMORY[0x1E0CBC8C8];
  v194[3] = v22;
  v23 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v194, 4);
  v174 = 0u;
  v175 = 0u;
  v172 = 0u;
  v173 = 0u;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v172, v193, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v173;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v173 != v25)
          objc_enumerationMutation(v23);
        objc_msgSend(v20, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v172 + 1) + 8 * i));
      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v172, v193, 16);
    }
    while (v24);
  }
  v170 = 0u;
  v171 = 0u;
  v168 = 0u;
  v169 = 0u;
  v27 = objc_msgSend(a10, "countByEnumeratingWithState:objects:count:", &v168, v192, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v169;
    do
    {
      for (j = 0; j != v27; ++j)
      {
        if (*(_QWORD *)v169 != v28)
          objc_enumerationMutation(a10);
        v30 = *(_QWORD *)(*((_QWORD *)&v168 + 1) + 8 * j);
        if (objc_msgSend(a8, "objectForKey:", v30))
          objc_msgSend(v20, "setObject:forKey:", objc_msgSend(a8, "objectForKey:", v30), v30);
      }
      v27 = objc_msgSend(a10, "countByEnumeratingWithState:objects:count:", &v168, v192, 16);
    }
    while (v27);
  }
  if (objc_msgSend(a4, "isEqual:", CFSTR("public.tiff")))
  {
    v31 = *MEMORY[0x1E0CBD090];
    v32 = (id)objc_msgSend((id)objc_msgSend(v20, "objectForKey:", *MEMORY[0x1E0CBD090]), "mutableCopy");
    if (!v32)
      v32 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    if (CI::format_is_deep(v14))
      objc_msgSend(v32, "removeObjectForKey:", *MEMORY[0x1E0CBD078]);
    else
      objc_msgSend(v32, "setObject:forKey:", &unk_1E2F1B5F0, *MEMORY[0x1E0CBD078]);
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v32, v31);
  }
  data = (__CFData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v36 = CGImageDestinationCreateWithData(data, (CFStringRef)a4, 1uLL, 0);
  v37 = v36;
  if (!v36)
  {

    *(_QWORD *)&v204 = CFSTR("CINonLocalizedDescriptionKey");
    *(_QWORD *)&buf[0] = CFSTR("failed to create data representation.");
    v89 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v204, 1);
    v34 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CINonLocalizedDescriptionKey"), 3, v89);
    v90 = v34;
    goto LABEL_162;
  }
  CFAutorelease(v36);
  CGImageDestinationAddImage(v37, v19, (CFDictionaryRef)v20);
  if (!a9)
    goto LABEL_153;
  v38 = -[CIContext addAuxOptionsForSDR:HDR:colorSpace:rgbGainmap:](v164, "addAuxOptionsForSDR:HDR:colorSpace:rgbGainmap:", a3, objc_msgSend(a8, "objectForKeyedSubscript:", CFSTR("kCIImageRepresentationHDRImage")), metadata, objc_msgSend((id)objc_msgSend(a8, "objectForKeyedSubscript:", CFSTR("kCIImageRepresentationHDRGainMapAsRGB")), "BOOLValue"));
  v213[0] = CFSTR("kCIImageRepresentationSemanticSegmentationSkinMatteImage");
  v213[1] = CFSTR("kCIImageRepresentationSemanticSegmentationHairMatteImage");
  v213[2] = CFSTR("kCIImageRepresentationSemanticSegmentationTeethMatteImage");
  v213[3] = CFSTR("kCIImageRepresentationSemanticSegmentationGlassesMatteImage");
  v213[4] = CFSTR("kCIImageRepresentationSemanticSegmentationSkyMatteImage");
  v213[5] = CFSTR("kCIImageRepresentationHDRGainMapImage");
  v213[6] = CFSTR("kCIImageRepresentationISOGainMapImage");
  if (v38)
    v39 = (id)v38;
  else
    v39 = a8;
  v40 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v213, 7);
  v41 = *MEMORY[0x1E0CBC730];
  v212[0] = *MEMORY[0x1E0CBC738];
  v212[1] = v41;
  v42 = *MEMORY[0x1E0CBC728];
  v212[2] = *MEMORY[0x1E0CBC748];
  v212[3] = v42;
  v43 = *MEMORY[0x1E0CBC710];
  v212[4] = *MEMORY[0x1E0CBC740];
  v212[5] = v43;
  v212[6] = CFSTR("kCGImageAuxiliaryDataTypeISOGainMap");
  v160 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v212, 7);
  if (objc_msgSend(v40, "count"))
  {
    v45 = 0;
    v158 = *MEMORY[0x1E0CBC6C0];
    v156 = *MEMORY[0x1E0CBC6C8];
    v157 = *MEMORY[0x1E0CBC6D0];
    *(_QWORD *)&v44 = 138543362;
    v155 = v44;
    do
    {
      v46 = objc_msgSend(v40, "objectAtIndexedSubscript:", v45, v155);
      v47 = (void *)objc_msgSend(v39, "objectForKey:", v46);
      if (v47)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v47, "extent");
          x = v214.origin.x;
          y = v214.origin.y;
          width = v214.size.width;
          height = v214.size.height;
          if (!CGRectIsInfinite(v214))
          {
            v215.origin.x = x;
            v215.origin.y = y;
            v215.size.width = width;
            v215.size.height = height;
            if (!CGRectIsEmpty(v215))
            {
              auxiliaryImageDataType = (const __CFString *)objc_msgSend(v160, "objectAtIndexedSubscript:", v45);
              metadataa = CGImageMetadataCreateMutable();
              if ((__CFString *)objc_msgSend(v40, "objectAtIndexedSubscript:", v45) == CFSTR("kCIImageRepresentationISOGainMapImage"))
              {
                v56 = objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("kCIImageRepresentationISOGainMapBaseHeadroom"));
                if (v56)
                  v57 = (void *)v56;
                else
                  v57 = &unk_1E2F19260;
                v58 = (void *)objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("kCIImageRepresentationISOGainMapAlternateHeadroom"));
                v59 = objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("kCIImageRepresentationISOGainMapMin"));
                if (v59)
                  v60 = (const void *)v59;
                else
                  v60 = v57;
                v61 = objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("kCIImageRepresentationISOGainMapMax"));
                if (v61)
                  v62 = (const void *)v61;
                else
                  v62 = v58;
                v63 = objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("kCIImageRepresentationISOGainMapOffset"));
                if (v63)
                  v64 = (const void *)v63;
                else
                  v64 = &unk_1E2F19270;
                v161 = objc_msgSend((id)objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("kCIImageRepresentationHDRGainMapAsRGB")), "BOOLValue");
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & (v58 != 0)) == 1)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          objc_msgSend(v57, "floatValue");
                          v66 = v65;
                          objc_msgSend(v58, "floatValue");
                          v68 = v67;
                          CGImageMetadataRegisterNamespaceForPrefix(metadataa, CFSTR("http://ns.apple.com/HDRToneMap/1.0/"), CFSTR("HDRToneMap"), 0);
                          CGImageMetadataSetValueWithPath(metadataa, 0, CFSTR("HDRToneMap:Version"), CFSTR("1"));
                          LODWORD(v69) = v66;
                          CGImageMetadataSetValueWithPath(metadataa, 0, CFSTR("HDRToneMap:BaseHeadroom"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v69));
                          LODWORD(v70) = v68;
                          CGImageMetadataSetValueWithPath(metadataa, 0, CFSTR("HDRToneMap:AlternateHeadroom"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v70));
                          CGImageMetadataSetValueWithPath(metadataa, 0, CFSTR("HDRToneMap:BaseColorIsWorkingColor"), CFSTR("True"));
                          CGImageMetadataSetValueWithPath(metadataa, 0, CFSTR("HDRToneMap:ChannelMetadata[0].BaseOffset"), v64);
                          CGImageMetadataSetValueWithPath(metadataa, 0, CFSTR("HDRToneMap:ChannelMetadata[0].AlternateOffset"), v64);
                          CGImageMetadataSetValueWithPath(metadataa, 0, CFSTR("HDRToneMap:ChannelMetadata[0].GainMapMin"), v60);
                          CGImageMetadataSetValueWithPath(metadataa, 0, CFSTR("HDRToneMap:ChannelMetadata[0].GainMapMax"), v62);
                          CGImageMetadataSetValueWithPath(metadataa, 0, CFSTR("HDRToneMap:ChannelMetadata[0].Gamma"), &unk_1E2F19280);
                        }
                      }
                    }
                  }
                }
              }
              else
              {
                v161 = 0;
              }
              if ((__CFString *)objc_msgSend(v40, "objectAtIndexedSubscript:", v45) != CFSTR("kCIImageRepresentationHDRGainMapImage"))
                goto LABEL_82;
              v71 = CGImageMetadataCopyTagWithPath((CGImageMetadataRef)objc_msgSend((id)objc_msgSend(v47, "properties"), "objectForKeyedSubscript:", CFSTR("kCGImageAuxiliaryDataInfoMetadata")), 0, CFSTR("HDRGainMap:HDRGainMapHeadroom"));
              if (v71)
              {
                v72 = 0.0;
                CFRelease(v71);
              }
              else
              {
                objc_msgSend(a3, "_makernoteMeteorHeadroom");
                v72 = v73;
              }
              v74 = (void *)objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("kCIImageRepresentationHDRGainMapHeadroom"));
              if (v74)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v74, "floatValue");
                  v72 = v75;
                  goto LABEL_74;
                }
              }
              if (v72 > 0.0)
              {
LABEL_74:
                if (v72 > 0.0)
                {
                  CGImageMetadataRegisterNamespaceForPrefix(metadataa, CFSTR("http://ns.apple.com/HDRGainMap/1.0/"), CFSTR("HDRGainMap"), 0);
                  if (v72 <= 1.0)
                    v76 = 0x10000;
                  else
                    v76 = 0x20000;
                  CGImageMetadataSetValueWithPath(metadataa, 0, CFSTR("HDRGainMap:HDRGainMapVersion"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v76));
                  if (v72 > 1.0)
                  {
                    *(float *)&v77 = v72;
                    CGImageMetadataSetValueWithPath(metadataa, 0, CFSTR("HDRGainMap:HDRGainMapHeadroom"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v77));
                  }
LABEL_82:
                  v80 = vcvtmd_u64_f64(width);
                  v81 = vcvtmd_u64_f64(height);
                  if (v161)
                    v82 = 1380401729;
                  else
                    v82 = 1278226488;
                  v83 = 2;
                  if (!v161)
                    v83 = 0;
                  v84 = ((v80 << v83) + 15) & 0xFFFFFFFFFFFFFFF0;
                  v85 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v84 * v81);
                  v86 = objc_msgSend(v85, "mutableBytes");
                  if (v161)
                    v87 = 268;
                  else
                    v87 = 259;
                  -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v164, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v47, v86, v84, v87, 0, 0.0, 0.0, (double)v80, (double)v81);
                  v210[0] = v158;
                  v210[1] = v157;
                  v211[0] = v85;
                  v211[1] = metadataa;
                  v210[2] = v156;
                  v208[0] = CFSTR("BytesPerRow");
                  v209[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v84);
                  v208[1] = CFSTR("Height");
                  v209[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v81);
                  v208[2] = CFSTR("Width");
                  v209[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v80);
                  v208[3] = CFSTR("PixelFormat");
                  v209[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v82);
                  v211[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v209, v208, 4);
                  v88 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v211, v210, 3);
                  CFRelease(metadataa);
                  if (v88)
                    CGImageDestinationAddAuxiliaryDataInfo(v37, auxiliaryImageDataType, v88);
                  goto LABEL_42;
                }
              }
              v78 = (void *)objc_msgSend((id)objc_msgSend(v47, "properties"), "objectForKeyedSubscript:", CFSTR("kCGImageAuxiliaryDataInfoMetadata"));
              if (v78)
              {
                CFRelease(metadataa);
                v79 = v78;
                metadataa = (CGImageMetadata *)v78;
              }
              goto LABEL_82;
            }
          }
          v52 = ci_logger_api();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf[0]) = v155;
            *(_QWORD *)((char *)buf + 4) = v46;
            v53 = v52;
            v54 = "Saving %{public}@ option requires an image with a finite non-empty extent.";
LABEL_68:
            _os_log_error_impl(&dword_1921E4000, v53, OS_LOG_TYPE_ERROR, v54, (uint8_t *)buf, 0xCu);
          }
        }
        else
        {
          v55 = ci_logger_api();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf[0]) = v155;
            *(_QWORD *)((char *)buf + 4) = v46;
            v53 = v55;
            v54 = "Saving %{public}@ option requires a CIImage object.";
            goto LABEL_68;
          }
        }
      }
LABEL_42:
      ++v45;
    }
    while (objc_msgSend(v40, "count") > v45);
  }
  v91 = (void *)objc_msgSend(v39, "objectForKey:", CFSTR("kCIImageRepresentationAVSemanticSegmentationMattes"));
  if (v91)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v207 = 0u;
      v206 = 0u;
      v205 = 0u;
      v204 = 0u;
      v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v204, buf, 16);
      if (v92)
      {
        v93 = *(_QWORD *)v205;
        do
        {
          for (k = 0; k != v92; ++k)
          {
            if (*(_QWORD *)v205 != v93)
              objc_enumerationMutation(v91);
            v95 = *(void **)(*((_QWORD *)&v204 + 1) + 8 * k);
            AVSemanticSegmentationMatteClass();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v200[0] = 0;
              v96 = (const __CFDictionary *)AVSemanticSegmentationMatteDictionaryRepresentationForAuxiliaryType(v95, (const char *)v200);
              if (v96)
                CGImageDestinationAddAuxiliaryDataInfo(v37, v200[0], v96);
            }
          }
          v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v204, buf, 16);
        }
        while (v92);
      }
    }
  }
  v97 = (void *)objc_msgSend(v39, "objectForKey:", CFSTR("kCIImageRepresentationAVPortraitEffectsMatte"));
  v98 = (void *)objc_msgSend(v39, "objectForKey:", CFSTR("kCIImageRepresentationPortraitEffectsMatteImage"));
  isKindOfClass = objc_msgSend(v98, "extent");
  v103 = v102;
  v105 = v104;
  v196[0] = *(CFStringRef *)MEMORY[0x1E0CBC720];
  if (v98)
  {
    v106 = v100;
    v107 = v101;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) == 0)
      goto LABEL_109;
    v216.origin.x = v106;
    v216.origin.y = v107;
    v216.size.width = v103;
    v216.size.height = v105;
    isKindOfClass = CGRectIsInfinite(v216);
    if ((isKindOfClass & 1) != 0
      || (v217.origin.x = v106,
          v217.origin.y = v107,
          v217.size.width = v103,
          v217.size.height = v105,
          isKindOfClass = CGRectIsEmpty(v217),
          (_DWORD)isKindOfClass))
    {
LABEL_109:
      v98 = 0;
    }
  }
  if (!v97 || (AVPortraitEffectsMatteClass(isKindOfClass), (v98 != 0) | ((objc_opt_isKindOfClass() & 1) == 0)))
  {
    if (!v98)
      goto LABEL_120;
    v109 = vcvtmd_u64_f64(v103);
    v110 = vcvtmd_u64_f64(v105);
    v111 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", ((v109 + 15) & 0xFFFFFFFFFFFFFFF0) * v110);
    -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v164, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v98, objc_msgSend(v111, "mutableBytes"), (v109 + 15) & 0xFFFFFFFFFFFFFFF0, 259, 0, 0.0, 0.0, (double)v109, (double)v110);
    Mutable = CGImageMetadataCreateMutable();
    if (CGImageMetadataRegisterNamespaceForPrefix(Mutable, CFSTR("PortraitEffectsMatteVersion"), CFSTR("portraitEffectsMatte"), 0))
    {
      CGImageMetadataSetValueWithPath(Mutable, 0, CFSTR("portraitEffectsMatte:PortraitEffectsMatteVersion"), &unk_1E2F1B650);
    }
    v202[0] = v111;
    v201[0] = CFSTR("kCGImageAuxiliaryDataInfoData");
    v201[1] = CFSTR("kCGImageAuxiliaryDataInfoDataDescription");
    v199[0] = CFSTR("BytesPerRow");
    v200[0] = (CFStringRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", (v109 + 15) & 0xFFFFFFFFFFFFFFF0);
    v199[1] = CFSTR("Height");
    v200[1] = (CFStringRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v110);
    v199[2] = CFSTR("Width");
    v200[2] = (CFStringRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v109);
    v199[3] = CFSTR("PixelFormat");
    v200[3] = (CFStringRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1278226488);
    v113 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v200, v199, 4);
    v201[2] = CFSTR("kCGImageAuxiliaryDataInfoMetadata");
    v202[1] = v113;
    v202[2] = Mutable;
    v108 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v202, v201, 3);
    if (Mutable)
      CFRelease(Mutable);
  }
  else
  {
    v108 = (const __CFDictionary *)AVPortraitEffectsMatteDictionaryRepresentation(v97, (const char *)v196);
  }
  if (v108)
    CGImageDestinationAddAuxiliaryDataInfo(v37, v196[0], v108);
LABEL_120:
  v114 = (void *)objc_msgSend(v39, "objectForKey:", CFSTR("kCIImageRepresentationAVDepthData"));
  v115 = (void *)objc_msgSend(v39, "objectForKey:", CFSTR("kCIImageRepresentationDepthImage"));
  v116 = objc_msgSend(v39, "objectForKey:", CFSTR("kCIImageRepresentationDisparityImage"));
  v117 = v116;
  if (v116)
    v115 = (void *)v116;
  objc_msgSend(v115, "extent");
  v119 = v118;
  v121 = v120;
  v123 = v122;
  v125 = v124;
  v126 = (void *)objc_msgSend(v115, "depthData");
  v191 = 0;
  if (!v115)
    goto LABEL_126;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_126;
  v218.origin.x = v119;
  v218.origin.y = v121;
  v218.size.width = v123;
  v218.size.height = v125;
  if (CGRectIsInfinite(v218)
    || (v219.origin.x = v119,
        v219.origin.y = v121,
        v219.size.width = v123,
        v219.size.height = v125,
        v127 = v115,
        CGRectIsEmpty(v219)))
  {
LABEL_126:
    v127 = 0;
  }
  if (!v114 || (AVDepthDataClass(), (v127 != 0) | ((objc_opt_isKindOfClass() & 1) == 0)))
  {
    v129 = vcvtmd_u64_f64(v123);
    v130 = vcvtmd_u64_f64(v125);
    if (v127 && v126)
    {
      v131 = (CFStringRef *)MEMORY[0x1E0CBC708];
      if (!v117)
        v131 = (CFStringRef *)MEMORY[0x1E0CBC700];
      v191 = *v131;
      v196[0] = 0;
      v198[0] = *MEMORY[0x1E0CA8FF0];
      v195[0] = MEMORY[0x1E0C9AA70];
      v132 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v195, v198, 1);
      if (v117)
        v133 = 1751411059;
      else
        v133 = 1717856627;
      CVPixelBufferCreate(0, v129, v130, v133, v132, (CVPixelBufferRef *)v196);
      if (v196[0])
      {
        -[CIContext render:toCVPixelBuffer:bounds:colorSpace:](v164, "render:toCVPixelBuffer:bounds:colorSpace:", v127, v196[0], 0, v119, v121, v123, v125);
        v134 = AVFDepthDataByReplacingDepthDataMapWithPixelBuffer(v126, (const char *)v196[0]);
        v128 = AVFDepthDataDictionaryRepresentation(v134, (const char *)&v191);
        CFRelease(v196[0]);
      }
      else
      {
        v128 = 0;
      }
    }
    else
    {
      if (!v127)
        goto LABEL_153;
      v135 = (CFStringRef *)MEMORY[0x1E0CBC708];
      if (!v117)
        v135 = (CFStringRef *)MEMORY[0x1E0CBC700];
      v191 = *v135;
      if (v117)
        v136 = 1751411059;
      else
        v136 = 1717856627;
      v137 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 2 * v129 * v130);
      -[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:](v164, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v115, objc_msgSend(v137, "mutableBytes"), 2 * v129, 2051, 0, 0.0, 0.0, (double)v129, (double)v130);
      if (objc_msgSend(v115, "properties"))
      {
        v138 = (void *)objc_msgSend(v115, "properties");
        v139 = objc_msgSend(v138, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6D0]);
      }
      else
      {
        v139 = 0;
      }
      v198[0] = v137;
      v197[0] = CFSTR("kCGImageAuxiliaryDataInfoData");
      v197[1] = CFSTR("kCGImageAuxiliaryDataInfoDataDescription");
      v195[0] = CFSTR("BytesPerRow");
      v196[0] = (CFStringRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", 2 * v129);
      v195[1] = CFSTR("Height");
      v196[1] = (CFStringRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v130);
      v195[2] = CFSTR("Width");
      v196[2] = (CFStringRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v129);
      v195[3] = CFSTR("PixelFormat");
      v196[3] = (CFStringRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v136);
      v198[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v196, v195, 4);
      v128 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v198, v197, 2);
      if (v139)
      {
        v128 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v128);
        objc_msgSend(v128, "setObject:forKeyedSubscript:", v139, *MEMORY[0x1E0CBC6D0]);
      }
    }
  }
  else
  {
    v128 = AVFDepthDataDictionaryRepresentation(v114, (const char *)&v191);
  }
  if (v128)
    CGImageDestinationAddAuxiliaryDataInfo(v37, v191, (CFDictionaryRef)v128);
LABEL_153:
  v140 = CGImageDestinationFinalize(v37);
  v141 = v178[5];
  if (v141)
  {
    v142 = v184[6];
    v143 = v184[7];
    v144 = v184[8];
    v145 = v184[9];
    objc_msgSend(a3, "extent");
    v221.origin.x = v146;
    v221.origin.y = v147;
    v221.size.width = v148;
    v221.size.height = v149;
    v220.origin.x = v142;
    v220.origin.y = v143;
    v220.size.width = v144;
    v220.size.height = v145;
    LODWORD(v141) = !CGRectContainsRect(v220, v221);
  }
  if (!v140 || (_DWORD)v141)
  {

    v150 = v178[5];
    if (v150)
    {
      *(_QWORD *)&v204 = *MEMORY[0x1E0CB3388];
      *((_QWORD *)&v204 + 1) = CFSTR("CINonLocalizedDescriptionKey");
      *(_QWORD *)&buf[0] = v150;
      *((_QWORD *)&buf[0] + 1) = CFSTR("failed to create data representation.");
      v151 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v204, 2);
    }
    else
    {
      *(_QWORD *)&v204 = CFSTR("CINonLocalizedDescriptionKey");
      *(_QWORD *)&buf[0] = CFSTR("failed to create data representation.");
      v151 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v204, 1);
    }
    v34 = (void *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CINonLocalizedDescriptionKey"), 3, v151);
    v152 = v34;
    goto LABEL_162;
  }
  v34 = 0;
LABEL_163:
  _Block_object_dispose(&v177, 8);
  _Block_object_dispose(&v183, 8);
  objc_autoreleasePoolPop(context);
  if (a11 && v34)
    *a11 = v34;
  v153 = v34;
  return data;
}

void __138__CIContext_ImageRepresentation___dataRepresentationOfImage_UTIType_format_premultiplied_colorSpace_options_addAuxData_keysToMerge_error___block_invoke(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  CGRect v8;

  if (a2)
  {

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  }
  else
  {
    v8.size.height = a6;
    v8.size.width = a5;
    v8.origin.y = a4;
    v8.origin.x = a3;
    *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = CGRectUnion(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 48), v8);
  }
}

- (NSData)TIFFRepresentationOfImage:(CIImage *)image format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options
{
  return (NSData *)-[CIContext _TIFFRepresentationOfImage:format:colorSpace:options:error:](self, "_TIFFRepresentationOfImage:format:colorSpace:options:error:", image, *(_QWORD *)&format, colorSpace, options, 0);
}

- (id)_TIFFRepresentationOfImage:(id)a3 format:(int)a4 colorSpace:(CGColorSpace *)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v12;
  uint64_t v14;

  v12 = CI::format_modernize(*(uint64_t *)&a4, (CI *)"-[CIContext(ImageRepresentation) _TIFFRepresentationOfImage:format:colorSpace:options:error:]", (const char *)a3);
  if (!canCreateDataRepresentation((CIImage *)a3, a5, v12, (NSError **)a7))
    return 0;
  LOBYTE(v14) = 0;
  return -[CIContext _dataRepresentationOfImage:UTIType:format:premultiplied:colorSpace:options:addAuxData:keysToMerge:error:](self, "_dataRepresentationOfImage:UTIType:format:premultiplied:colorSpace:options:addAuxData:keysToMerge:error:", a3, CFSTR("public.tiff"), v12, 1, a5, a6, v14, 0, a7);
}

- (NSData)PNGRepresentationOfImage:(CIImage *)image format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options
{
  return (NSData *)-[CIContext _PNGRepresentationOfImage:format:colorSpace:options:error:](self, "_PNGRepresentationOfImage:format:colorSpace:options:error:", image, *(_QWORD *)&format, colorSpace, options, 0);
}

- (id)_PNGRepresentationOfImage:(id)a3 format:(int)a4 colorSpace:(CGColorSpace *)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v12;
  uint64_t v14;

  v12 = CI::format_modernize(*(uint64_t *)&a4, (CI *)"-[CIContext(ImageRepresentation) _PNGRepresentationOfImage:format:colorSpace:options:error:]", (const char *)a3);
  if (!canCreateDataRepresentation((CIImage *)a3, a5, v12, (NSError **)a7))
    return 0;
  LOBYTE(v14) = 0;
  return -[CIContext _dataRepresentationOfImage:UTIType:format:premultiplied:colorSpace:options:addAuxData:keysToMerge:error:](self, "_dataRepresentationOfImage:UTIType:format:premultiplied:colorSpace:options:addAuxData:keysToMerge:error:", a3, CFSTR("public.png"), v12, 0, a5, a6, v14, 0, a7);
}

- (NSData)JPEGRepresentationOfImage:(CIImage *)image colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options
{
  return (NSData *)-[CIContext _JPEGRepresentationOfImage:colorSpace:options:error:](self, "_JPEGRepresentationOfImage:colorSpace:options:error:", image, colorSpace, options, 0);
}

- (id)_JPEGRepresentationOfImage:(id)a3 colorSpace:(CGColorSpace *)a4 options:(id)a5 error:(id *)a6
{
  CGColorSpaceModel Model;
  CIFormat *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  _QWORD v19[7];

  v19[6] = *MEMORY[0x1E0C80C00];
  if (!canCreateDataRepresentation((CIImage *)a3, a4, (NSError **)a6))
    return 0;
  Model = CGColorSpaceGetModel(a4);
  v12 = &kCIFormatL8;
  if (Model)
    v12 = &kCIFormatRGBX8;
  v13 = *v12;
  v14 = *MEMORY[0x1E0CBC768];
  v19[0] = *MEMORY[0x1E0CBC780];
  v19[1] = v14;
  v15 = *MEMORY[0x1E0CBCF50];
  v19[2] = *MEMORY[0x1E0CBCF60];
  v19[3] = v15;
  v16 = *MEMORY[0x1E0CBC7C0];
  v19[4] = *MEMORY[0x1E0CBCF58];
  v19[5] = v16;
  LOBYTE(v18) = 1;
  return -[CIContext _dataRepresentationOfImage:UTIType:format:premultiplied:colorSpace:options:addAuxData:keysToMerge:error:](self, "_dataRepresentationOfImage:UTIType:format:premultiplied:colorSpace:options:addAuxData:keysToMerge:error:", a3, CFSTR("public.jpeg"), v13, 1, a4, a5, v18, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 6), a6);
}

- (NSData)OpenEXRRepresentationOfImage:(CIImage *)image options:(NSDictionary *)options error:(NSError *)errorPtr
{
  CGColorSpaceRef v9;
  uint64_t v11;

  if (!canCreateDataRepresentation(image, errorPtr))
    return 0;
  v9 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D958]);
  CFAutorelease(v9);
  LOBYTE(v11) = 0;
  return (NSData *)-[CIContext _dataRepresentationOfImage:UTIType:format:premultiplied:colorSpace:options:addAuxData:keysToMerge:error:](self, "_dataRepresentationOfImage:UTIType:format:premultiplied:colorSpace:options:addAuxData:keysToMerge:error:", image, CFSTR("com.ilm.openexr-image"), 2056, 0, v9, options, v11, 0, errorPtr);
}

- (NSData)HEIFRepresentationOfImage:(CIImage *)image format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options
{
  return (NSData *)-[CIContext _HEIFRepresentationOfImage:format:colorSpace:options:error:](self, "_HEIFRepresentationOfImage:format:colorSpace:options:error:", image, *(_QWORD *)&format, colorSpace, options, 0);
}

- (id)_HEIFRepresentationOfImage:(id)a3 format:(int)a4 colorSpace:(CGColorSpace *)a5 options:(id)a6 error:(id *)a7
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v12 = CI::format_modernize(*(uint64_t *)&a4, (CI *)"-[CIContext(ImageRepresentation) _HEIFRepresentationOfImage:format:colorSpace:options:error:]", (const char *)a3);
  if (!canCreateDataRepresentation((CIImage *)a3, a5, v12, (NSError **)a7))
    return 0;
  v13 = *MEMORY[0x1E0CBC768];
  v16[0] = *MEMORY[0x1E0CBC780];
  v16[1] = v13;
  v16[2] = *MEMORY[0x1E0CBC7C0];
  LOBYTE(v15) = 1;
  return -[CIContext _dataRepresentationOfImage:UTIType:format:premultiplied:colorSpace:options:addAuxData:keysToMerge:error:](self, "_dataRepresentationOfImage:UTIType:format:premultiplied:colorSpace:options:addAuxData:keysToMerge:error:", a3, CFSTR("public.heic"), v12, 0, a5, a6, v15, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3), a7);
}

- (NSData)HEIF10RepresentationOfImage:(CIImage *)image colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options error:(NSError *)errorPtr
{
  void *v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSError *v25;
  CFTypeID TypeID;
  CGColorSpaceModel Model;
  const __CFDictionary *v28;
  OSType v29;
  double v30;
  double v31;
  double v32;
  _BOOL4 v33;
  _BOOL4 IsHLGBased;
  int v35;
  const void *v36;
  const void *v37;
  const __CFDictionary *ColorAttributesForColorSpace;
  CIRenderDestination *v39;
  CIRenderDestination *v40;
  CIRenderTask *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSError *v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSError *v64;
  NSError *v65;
  NSError *v66;
  NSObject *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  NSError *v77;
  NSObject *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSObject *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  id v105;
  void *v106;
  NSObject *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  NSObject *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  NSError *v123;
  NSError *v124;
  CVPixelBufferRef pixelBufferOut;
  id v126;
  uint64_t v127;
  id v128;
  _QWORD v129[3];
  _QWORD v130[3];
  uint64_t v131;
  uint64_t v132;
  CFTypeRef arg[2];
  const __CFString *v134;
  const __CFString *v135;
  const __CFString *v136;
  const __CFString **v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;

  v140 = *MEMORY[0x1E0C80C00];
  v126 = 0;
  v11 = (void *)MEMORY[0x194026220](self, a2);
  -[CIImage extent](image, "extent");
  v142 = CGRectInset(v141, 0.00100000005, 0.00100000005);
  v143 = CGRectIntegral(v142);
  x = v143.origin.x;
  y = v143.origin.y;
  width = v143.size.width;
  height = v143.size.height;
  if (CGRectIsEmpty(v143)
    || (v144.origin.x = x, v144.origin.y = y, v144.size.width = width, v144.size.height = height, CGRectIsInfinite(v144)))
  {
    v16 = ci_logger_api();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CIContext(ImageRepresentation) HEIF10RepresentationOfImage:colorSpace:options:error:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
    arg[0] = CFSTR("CINonLocalizedDescriptionKey");
    v136 = CFSTR("requires an image with a finite non-empty extent.");
    v24 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v136, arg, 1);
    v25 = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CINonLocalizedDescriptionKey"), 4, v24);
LABEL_38:
    v64 = v25;
    v65 = v25;
    goto LABEL_39;
  }
  if (!colorSpace
    || (TypeID = CGColorSpaceGetTypeID(), TypeID != CFGetTypeID(colorSpace))
    || !CGColorSpaceSupportsOutput(colorSpace)
    || CGColorSpaceGetModel(colorSpace) && CGColorSpaceGetModel(colorSpace) != kCGColorSpaceModelRGB)
  {
    v55 = ci_logger_api();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      -[CIContext(ImageRepresentation) HEIF10RepresentationOfImage:colorSpace:options:error:].cold.2(v55, v56, v57, v58, v59, v60, v61, v62);
    arg[0] = CFSTR("CINonLocalizedDescriptionKey");
    v136 = CFSTR("unsupported colorspace.");
    v63 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v136, arg, 1);
    v25 = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CINonLocalizedDescriptionKey"), 5, v63);
    goto LABEL_38;
  }
  pixelBufferOut = 0;
  Model = CGColorSpaceGetModel(colorSpace);
  v131 = *MEMORY[0x1E0CA8FF0];
  v132 = MEMORY[0x1E0C9AA70];
  v28 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v132, &v131, 1);
  if (Model)
    v29 = 2019963440;
  else
    v29 = 1278226736;
  -[CIImage extent](image, "extent");
  v31 = v30;
  -[CIImage extent](image, "extent");
  if (CVPixelBufferCreate(0, (unint64_t)v31, (unint64_t)v32, v29, v28, &pixelBufferOut)
    || !pixelBufferOut)
  {
    v68 = ci_logger_api();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      -[CIContext(ImageRepresentation) HEIF10RepresentationOfImage:colorSpace:options:error:].cold.3(v68, v69, v70, v71, v72, v73, v74, v75);
    arg[0] = CFSTR("CINonLocalizedDescriptionKey");
    v136 = CFSTR("failed to create a CVPixelBuffer.");
    v76 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v136, arg, 1);
    v64 = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CINonLocalizedDescriptionKey"), 6, v76);
    v77 = v64;
  }
  else
  {
    v33 = Model == kCGColorSpaceModelMonochrome;
    CFAutorelease(pixelBufferOut);
    IsHLGBased = CGColorSpaceIsHLGBased(colorSpace);
    v35 = IsHLGBased | CGColorSpaceIsPQBased(colorSpace);
    v36 = (const void *)*MEMORY[0x1E0CA8F10];
    if (v33)
      v36 = 0;
    if (v35)
      v37 = (const void *)*MEMORY[0x1E0CA8F00];
    else
      v37 = v36;
    if (v37)
      CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8EE8], v37, kCVAttachmentMode_ShouldPropagate);
    ColorAttributesForColorSpace = CreateColorAttributesForColorSpace();
    if (ColorAttributesForColorSpace)
    {
      CVBufferSetAttachments(pixelBufferOut, ColorAttributesForColorSpace, kCVAttachmentMode_ShouldPropagate);
      CFRelease(ColorAttributesForColorSpace);
    }
    CVBufferSetAttachment(pixelBufferOut, (CFStringRef)*MEMORY[0x1E0CA8CD8], colorSpace, kCVAttachmentMode_ShouldPropagate);
    v124 = 0;
    v39 = [CIRenderDestination alloc];
    v40 = -[CIRenderDestination initWithPixelBuffer:](v39, "initWithPixelBuffer:", pixelBufferOut);
    -[CIRenderDestination setColorSpace:](v40, "setColorSpace:", colorSpace);
    v41 = -[CIContext startTaskToRender:toDestination:error:](self, "startTaskToRender:toDestination:error:", image, v40, &v124);
    if (!v41)
    {
      v78 = ci_logger_api();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
        -[CIContext(ImageRepresentation) HEIF10RepresentationOfImage:colorSpace:options:error:].cold.4(v78, v79, v80, v81, v82, v83, v84, v85);
      if (v124)
      {
        arg[0] = *(CFTypeRef *)MEMORY[0x1E0CB3388];
        arg[1] = CFSTR("CINonLocalizedDescriptionKey");
        v136 = (const __CFString *)v124;
        v137 = (const __CFString **)CFSTR("failed to render image.");
        v86 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v136, arg, 2);
      }
      else
      {
        v134 = CFSTR("CINonLocalizedDescriptionKey");
        v135 = CFSTR("failed to render image.");
        v86 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1);
      }
      v54 = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CINonLocalizedDescriptionKey"), 7, v86);
      goto LABEL_72;
    }
    if (!-[CIRenderTask waitUntilCompletedAndReturnError:](v41, "waitUntilCompletedAndReturnError:", &v124))
    {
      v87 = ci_logger_api();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
        -[CIContext(ImageRepresentation) HEIF10RepresentationOfImage:colorSpace:options:error:].cold.4(v87, v88, v89, v90, v91, v92, v93, v94);
      v54 = (NSError *)imageRepError(7, CFSTR("failed to render image."), v124);
      goto LABEL_72;
    }
    arg[0] = 0;
    v136 = 0;
    v137 = &v136;
    v138 = 0x2020000000;
    v42 = (const __CFString *)getCMPhotoCompressionSessionCreateSymbolLoc(void)::ptr;
    v139 = getCMPhotoCompressionSessionCreateSymbolLoc(void)::ptr;
    if (!getCMPhotoCompressionSessionCreateSymbolLoc(void)::ptr)
    {
      v43 = (void *)CMPhotoLibrary();
      v42 = (const __CFString *)dlsym(v43, "CMPhotoCompressionSessionCreate");
      v137[3] = v42;
      getCMPhotoCompressionSessionCreateSymbolLoc(void)::ptr = v42;
    }
    _Block_object_dispose(&v136, 8);
    if (!v42)
      -[CIContext(ImageRepresentation) HEIF10RepresentationOfImage:colorSpace:options:error:].cold.6();
    ((void (*)(_QWORD, _QWORD, CFTypeRef *))v42)(0, 0, arg);
    CFAutorelease(arg[0]);
    if (!arg[0])
    {
      v95 = ci_logger_api();
      if (os_log_type_enabled(v95, OS_LOG_TYPE_ERROR))
        -[CIContext(ImageRepresentation) HEIF10RepresentationOfImage:colorSpace:options:error:].cold.7(v95, v96, v97, v98, v99, v100, v101, v102);
      v54 = (NSError *)imageRepError(8, CFSTR("failed to create a PhotoCompressionSession."));
      goto LABEL_72;
    }
    v44 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend(v44, "addEntriesFromDictionary:", -[CIImage properties](image, "properties"));
    v129[0] = getkCMPhotoCompressionContainerOption_Format();
    v130[0] = &unk_1E2F1B608;
    v129[1] = getkCMPhotoCompressionContainerOption_ImageCountHint();
    v130[1] = &unk_1E2F1B620;
    v129[2] = getkCMPhotoCompressionContainerOption_BackingType();
    v130[2] = &unk_1E2F1B620;
    v45 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v130, v129, 3);
    if (soft_CMPhotoCompressionSessionOpenEmptyContainer((uint64_t)arg[0], v45))
    {
      v46 = ci_logger_api();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        -[CIContext(ImageRepresentation) HEIF10RepresentationOfImage:colorSpace:options:error:].cold.10(v46, v47, v48, v49, v50, v51, v52, v53);
      v54 = (NSError *)imageRepError(9, CFSTR("failed to open the PhotoCompressionSession."));
LABEL_72:
      v64 = v54;
      v123 = v54;
      goto LABEL_39;
    }
    v103 = objc_msgSend(v44, "valueForKey:", *MEMORY[0x1E0CBCFF0]);
    if (v103)
      v104 = (void *)v103;
    else
      v104 = &unk_1E2F1B620;
    v105 = -[NSDictionary valueForKey:](options, "valueForKey:", *MEMORY[0x1E0CBC780]);
    v106 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend(v106, "setObject:forKey:", v104, getkCMPhotoCompressionOption_ImageOrientation());
    if (v105)
    {
      objc_msgSend(v106, "setObject:forKey:", &unk_1E2F1B638, getkCMPhotoCompressionOption_QualityControllerType());
      v127 = getkCMPhotoQualityControllerParameter_QualityValue();
      v128 = v105;
      objc_msgSend(v106, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1), getkCMPhotoCompressionOption_QualityControllerParameters());
    }
    v136 = 0;
    if (soft_CMPhotoCompressionSessionAddImage((uint64_t)arg[0], (uint64_t)v106, (uint64_t)pixelBufferOut, (uint64_t)&v136))
    {
      v107 = ci_logger_api();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
        -[CIContext(ImageRepresentation) HEIF10RepresentationOfImage:colorSpace:options:error:].cold.9(v107, v108, v109, v110, v111, v112, v113, v114);
      v54 = (NSError *)imageRepError(10, CFSTR("failed to add image to the PhotoCompressionSession."));
      goto LABEL_72;
    }
    if (v44)
      soft_CMPhotoCompressionSessionAddMetadataFromImageProperties((uint64_t)arg[0], (uint64_t)v136, (uint64_t)v44);
    if (soft_CMPhotoCompressionSessionCloseContainerAndCopyBacking((uint64_t)arg[0], (uint64_t)&v126))
    {
      v115 = ci_logger_api();
      if (os_log_type_enabled(v115, OS_LOG_TYPE_ERROR))
        -[CIContext(ImageRepresentation) HEIF10RepresentationOfImage:colorSpace:options:error:].cold.8(v115, v116, v117, v118, v119, v120, v121, v122);
      v54 = (NSError *)imageRepError(11, CFSTR("failed to close the PhotoCompressionSession."));
      goto LABEL_72;
    }
    v64 = 0;
  }
LABEL_39:
  objc_autoreleasePoolPop(v11);
  v66 = v64;
  if (errorPtr)
    *errorPtr = v64;
  return (NSData *)v126;
}

- (BOOL)writeTIFFRepresentationOfImage:(CIImage *)image toURL:(NSURL *)url format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options error:(NSError *)errorPtr
{
  uint64_t v14;
  id v15;
  char v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v14 = CI::format_modernize(*(uint64_t *)&format, (CI *)"-[CIContext(ImageRepresentation) writeTIFFRepresentationOfImage:toURL:format:colorSpace:options:error:]", (const char *)image);
  if (!canCreateDataRepresentation(image, colorSpace, v14, errorPtr))
    return 0;
  v21 = 0;
  v15 = -[CIContext _TIFFRepresentationOfImage:format:colorSpace:options:error:](self, "_TIFFRepresentationOfImage:format:colorSpace:options:error:", image, v14, colorSpace, options, &v21);
  if (v15)
  {
    v16 = objc_msgSend(v15, "writeToURL:options:error:", url, 1, &v21);
    if (!errorPtr)
      return v16;
  }
  else
  {
    v16 = 0;
    if (!errorPtr)
      return v16;
  }
  if ((v16 & 1) == 0)
  {
    if (v21)
    {
      v22[0] = *MEMORY[0x1E0CB3388];
      v22[1] = CFSTR("CINonLocalizedDescriptionKey");
      v23[0] = v21;
      v23[1] = CFSTR("failed to write TIFF data to file.");
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = 2;
    }
    else
    {
      v22[0] = CFSTR("CINonLocalizedDescriptionKey");
      v23[0] = CFSTR("failed to write TIFF data to file.");
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = 1;
    }
    v19 = objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v23, v22, v18);
    *errorPtr = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CINonLocalizedDescriptionKey"), 3, v19);
  }
  return v16;
}

- (BOOL)writePNGRepresentationOfImage:(CIImage *)image toURL:(NSURL *)url format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options error:(NSError *)errorPtr
{
  uint64_t v14;
  id v15;
  char v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v14 = CI::format_modernize(*(uint64_t *)&format, (CI *)"-[CIContext(ImageRepresentation) writePNGRepresentationOfImage:toURL:format:colorSpace:options:error:]", (const char *)image);
  if (!canCreateDataRepresentation(image, colorSpace, v14, errorPtr))
    return 0;
  v21 = 0;
  v15 = -[CIContext _PNGRepresentationOfImage:format:colorSpace:options:error:](self, "_PNGRepresentationOfImage:format:colorSpace:options:error:", image, v14, colorSpace, options, &v21);
  if (v15)
  {
    v16 = objc_msgSend(v15, "writeToURL:options:error:", url, 1, &v21);
    if (!errorPtr)
      return v16;
  }
  else
  {
    v16 = 0;
    if (!errorPtr)
      return v16;
  }
  if ((v16 & 1) == 0)
  {
    if (v21)
    {
      v22[0] = *MEMORY[0x1E0CB3388];
      v22[1] = CFSTR("CINonLocalizedDescriptionKey");
      v23[0] = v21;
      v23[1] = CFSTR("failed to write PNG data to file.");
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = 2;
    }
    else
    {
      v22[0] = CFSTR("CINonLocalizedDescriptionKey");
      v23[0] = CFSTR("failed to write PNG data to file.");
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = 1;
    }
    v19 = objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v23, v22, v18);
    *errorPtr = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CINonLocalizedDescriptionKey"), 3, v19);
  }
  return v16;
}

- (BOOL)writeJPEGRepresentationOfImage:(CIImage *)image toURL:(NSURL *)url colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options error:(NSError *)errorPtr
{
  id v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  if (!canCreateDataRepresentation(image, colorSpace, errorPtr))
    return 0;
  v19 = 0;
  v13 = -[CIContext _JPEGRepresentationOfImage:colorSpace:options:error:](self, "_JPEGRepresentationOfImage:colorSpace:options:error:", image, colorSpace, options, &v19);
  if (v13)
  {
    v14 = objc_msgSend(v13, "writeToURL:options:error:", url, 1, &v19);
    if (!errorPtr)
      return v14;
  }
  else
  {
    v14 = 0;
    if (!errorPtr)
      return v14;
  }
  if ((v14 & 1) == 0)
  {
    if (v19)
    {
      v20[0] = *MEMORY[0x1E0CB3388];
      v20[1] = CFSTR("CINonLocalizedDescriptionKey");
      v21[0] = v19;
      v21[1] = CFSTR("failed to write JPEG data to file.");
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = 2;
    }
    else
    {
      v20[0] = CFSTR("CINonLocalizedDescriptionKey");
      v21[0] = CFSTR("failed to write JPEG data to file.");
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = 1;
    }
    v17 = objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v21, v20, v16);
    *errorPtr = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CINonLocalizedDescriptionKey"), 3, v17);
  }
  return v14;
}

- (BOOL)writeHEIFRepresentationOfImage:(CIImage *)image toURL:(NSURL *)url format:(CIFormat)format colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options error:(NSError *)errorPtr
{
  uint64_t v14;
  id v15;
  char v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v14 = CI::format_modernize(*(uint64_t *)&format, (CI *)"-[CIContext(ImageRepresentation) writeHEIFRepresentationOfImage:toURL:format:colorSpace:options:error:]", (const char *)image);
  if (!canCreateDataRepresentation(image, colorSpace, v14, errorPtr))
    return 0;
  v21 = 0;
  v15 = -[CIContext _HEIFRepresentationOfImage:format:colorSpace:options:error:](self, "_HEIFRepresentationOfImage:format:colorSpace:options:error:", image, v14, colorSpace, options, &v21);
  if (v15)
  {
    v16 = objc_msgSend(v15, "writeToURL:options:error:", url, 1, &v21);
    if (!errorPtr)
      return v16;
  }
  else
  {
    v16 = 0;
    if (!errorPtr)
      return v16;
  }
  if ((v16 & 1) == 0)
  {
    if (v21)
    {
      v22[0] = *MEMORY[0x1E0CB3388];
      v22[1] = CFSTR("CINonLocalizedDescriptionKey");
      v23[0] = v21;
      v23[1] = CFSTR("failed to write HEIC data to file.");
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = 2;
    }
    else
    {
      v22[0] = CFSTR("CINonLocalizedDescriptionKey");
      v23[0] = CFSTR("failed to write HEIC data to file.");
      v17 = (void *)MEMORY[0x1E0C99D80];
      v18 = 1;
    }
    v19 = objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v23, v22, v18);
    *errorPtr = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CINonLocalizedDescriptionKey"), 3, v19);
  }
  return v16;
}

- (BOOL)writeHEIF10RepresentationOfImage:(CIImage *)image toURL:(NSURL *)url colorSpace:(CGColorSpaceRef)colorSpace options:(NSDictionary *)options error:(NSError *)errorPtr
{
  NSData *v13;
  BOOL v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  if (!canCreateDataRepresentation(image, colorSpace, errorPtr))
    return 0;
  v19 = 0;
  v13 = -[CIContext HEIF10RepresentationOfImage:colorSpace:options:error:](self, "HEIF10RepresentationOfImage:colorSpace:options:error:", image, colorSpace, options, &v19);
  if (v13)
  {
    v14 = -[NSData writeToURL:options:error:](v13, "writeToURL:options:error:", url, 1, &v19);
    if (!errorPtr)
      return v14;
  }
  else
  {
    v14 = 0;
    if (!errorPtr)
      return v14;
  }
  if (!v14)
  {
    if (v19)
    {
      v20[0] = *MEMORY[0x1E0CB3388];
      v20[1] = CFSTR("CINonLocalizedDescriptionKey");
      v21[0] = v19;
      v21[1] = CFSTR("failed to write HEIC data to file.");
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = 2;
    }
    else
    {
      v20[0] = CFSTR("CINonLocalizedDescriptionKey");
      v21[0] = CFSTR("failed to write HEIC data to file.");
      v15 = (void *)MEMORY[0x1E0C99D80];
      v16 = 1;
    }
    v17 = objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v21, v20, v16);
    *errorPtr = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CINonLocalizedDescriptionKey"), 3, v17);
  }
  return v14;
}

- (BOOL)writeOpenEXRRepresentationOfImage:(CIImage *)image toURL:(NSURL *)url options:(NSDictionary *)options error:(NSError *)errorPtr
{
  NSData *v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  if (!canCreateDataRepresentation(image, errorPtr))
    return 0;
  v17 = 0;
  v11 = -[CIContext OpenEXRRepresentationOfImage:options:error:](self, "OpenEXRRepresentationOfImage:options:error:", image, options, &v17);
  if (v11)
  {
    v12 = -[NSData writeToURL:options:error:](v11, "writeToURL:options:error:", url, 1, &v17);
    if (!errorPtr)
      return v12;
  }
  else
  {
    v12 = 0;
    if (!errorPtr)
      return v12;
  }
  if (!v12)
  {
    if (v17)
    {
      v18[0] = *MEMORY[0x1E0CB3388];
      v18[1] = CFSTR("CINonLocalizedDescriptionKey");
      v19[0] = v17;
      v19[1] = CFSTR("failed to write OpenEXR data to file.");
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = 2;
    }
    else
    {
      v18[0] = CFSTR("CINonLocalizedDescriptionKey");
      v19[0] = CFSTR("failed to write OpenEXR data to file.");
      v13 = (void *)MEMORY[0x1E0C99D80];
      v14 = 1;
    }
    v15 = objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v19, v18, v14);
    *errorPtr = (NSError *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CINonLocalizedDescriptionKey"), 3, v15);
  }
  return v12;
}

- (CIFilter)depthBlurEffectFilterForImageData:(NSData *)data options:(NSDictionary *)options
{
  CIImage *v6;
  CIImage *v7;
  CIImage *v8;
  CIImage *v9;
  CIImage *v10;
  CIImage *v11;
  CIImage *v12;
  NSDictionary *v13;
  int v14;
  unsigned int v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v6 = +[CIImage imageWithData:](CIImage, "imageWithData:");
  v43 = CFSTR("kCIImageAuxiliaryDisparity");
  v44[0] = &unk_1E2F1B668;
  v7 = +[CIImage imageWithData:options:](CIImage, "imageWithData:options:", data, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1));
  v41 = CFSTR("kCIImageAuxiliaryPortraitEffectsMatte");
  v42 = &unk_1E2F1B668;
  v8 = +[CIImage imageWithData:options:](CIImage, "imageWithData:options:", data, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
  v39 = CFSTR("kCIImageAuxiliarySemanticSegmentationHairMatte");
  v40 = &unk_1E2F1B668;
  v9 = +[CIImage imageWithData:options:](CIImage, "imageWithData:options:", data, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
  v37 = CFSTR("kCIImageAuxiliarySemanticSegmentationGlassesMatte");
  v38 = &unk_1E2F1B668;
  v10 = +[CIImage imageWithData:options:](CIImage, "imageWithData:options:", data, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
  v35 = CFSTR("kCIImageAuxiliaryHDRGainMap");
  v36 = &unk_1E2F1B668;
  v11 = +[CIImage imageWithData:options:](CIImage, "imageWithData:options:", data, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
  if (!v6)
  {
    v16 = ci_logger_api();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CIContext(CIDepthBlurEffect) depthBlurEffectFilterForImageData:options:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
    return 0;
  }
  if (!v7)
  {
    v24 = ci_logger_api();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[CIContext(CIDepthBlurEffect) depthBlurEffectFilterForImageData:options:].cold.2(v24, v25, v26, v27, v28, v29, v30, v31);
    return 0;
  }
  v12 = v11;
  v13 = -[CIImage properties](v6, "properties");
  if (v13)
  {
    v14 = objc_msgSend(-[NSDictionary objectForKey:](v13, "objectForKey:", CFSTR("Orientation")), "intValue");
    if (v14 <= 1)
      v15 = 1;
    else
      v15 = v14;
    if (v15 >= 8)
      v15 = 8;
  }
  else
  {
    v15 = 1;
  }
  LODWORD(v33) = v15;
  return -[CIContext depthBlurEffectFilterForImage:disparityImage:portraitEffectsMatte:hairSemanticSegmentation:glassesMatte:gainMap:orientation:options:](self, "depthBlurEffectFilterForImage:disparityImage:portraitEffectsMatte:hairSemanticSegmentation:glassesMatte:gainMap:orientation:options:", v6, v7, v8, v9, v10, v12, v33, options);
}

- (CIFilter)depthBlurEffectFilterForImageURL:(NSURL *)url options:(NSDictionary *)options
{
  CIImage *v6;
  CIImage *v7;
  CIImage *v8;
  CIImage *v9;
  CIImage *v10;
  CIImage *v11;
  CIImage *v12;
  NSDictionary *v13;
  int v14;
  unsigned int v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v6 = +[CIImage imageWithContentsOfURL:](CIImage, "imageWithContentsOfURL:");
  v43 = CFSTR("kCIImageAuxiliaryDisparity");
  v44[0] = &unk_1E2F1B668;
  v7 = +[CIImage imageWithContentsOfURL:options:](CIImage, "imageWithContentsOfURL:options:", url, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1));
  v41 = CFSTR("kCIImageAuxiliaryPortraitEffectsMatte");
  v42 = &unk_1E2F1B668;
  v8 = +[CIImage imageWithContentsOfURL:options:](CIImage, "imageWithContentsOfURL:options:", url, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
  v39 = CFSTR("kCIImageAuxiliarySemanticSegmentationHairMatte");
  v40 = &unk_1E2F1B668;
  v9 = +[CIImage imageWithContentsOfURL:options:](CIImage, "imageWithContentsOfURL:options:", url, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1));
  v37 = CFSTR("kCIImageAuxiliarySemanticSegmentationGlassesMatte");
  v38 = &unk_1E2F1B668;
  v10 = +[CIImage imageWithContentsOfURL:options:](CIImage, "imageWithContentsOfURL:options:", url, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v38, &v37, 1));
  v35 = CFSTR("kCIImageAuxiliaryHDRGainMap");
  v36 = &unk_1E2F1B668;
  v11 = +[CIImage imageWithContentsOfURL:options:](CIImage, "imageWithContentsOfURL:options:", url, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
  if (!v6)
  {
    v16 = ci_logger_api();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CIContext(CIDepthBlurEffect) depthBlurEffectFilterForImageURL:options:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
    return 0;
  }
  if (!v7)
  {
    v24 = ci_logger_api();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[CIContext(CIDepthBlurEffect) depthBlurEffectFilterForImageURL:options:].cold.2(v24, v25, v26, v27, v28, v29, v30, v31);
    return 0;
  }
  v12 = v11;
  v13 = -[CIImage properties](v6, "properties");
  if (v13)
  {
    v14 = objc_msgSend(-[NSDictionary objectForKey:](v13, "objectForKey:", CFSTR("Orientation")), "intValue");
    if (v14 <= 1)
      v15 = 1;
    else
      v15 = v14;
    if (v15 >= 8)
      v15 = 8;
  }
  else
  {
    v15 = 1;
  }
  LODWORD(v33) = v15;
  return -[CIContext depthBlurEffectFilterForImage:disparityImage:portraitEffectsMatte:hairSemanticSegmentation:glassesMatte:gainMap:orientation:options:](self, "depthBlurEffectFilterForImage:disparityImage:portraitEffectsMatte:hairSemanticSegmentation:glassesMatte:gainMap:orientation:options:", v6, v7, v8, v9, v10, v12, v33, options);
}

- (void)_performFaceDetection:(id)a3 image:(id)a4 orientation:(int)a5 filter:(id)a6
{
  uint64_t v7;
  CIDetector *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  float v14;
  double v15;
  float v16;
  double v17;
  float v18;
  NSArray *v19;
  NSArray *v20;
  uint64_t v21;
  double *v22;
  double *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  float v33;
  float v34;
  double v35;
  double v36;
  unint64_t v37;
  unint64_t v38;
  double v39;
  double v40;
  double v41;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  BOOL v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  float64x2_t v60;
  uint64_t v61;
  float64x2_t v62;
  double *v63;
  id v64;
  unsigned int v65;
  uint64_t v66;
  double *v67;
  double *v68;
  double *v69;
  void *v70;
  double *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  CGAffineTransform v76;
  CGAffineTransform v77;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v80;
  CGAffineTransform v81;
  CGAffineTransform v82;
  _BYTE v83[128];
  const __CFString *v84;
  _QWORD v85[3];
  float64x2x2_t v86;
  float64x2x2_t v87;

  v7 = *(_QWORD *)&a5;
  v85[1] = *MEMORY[0x1E0C80C00];
  v9 = +[CIDetector detectorOfType:context:options:](CIDetector, "detectorOfType:context:options:", CFSTR("CIDetectorTypeFace"), self, MEMORY[0x1E0C9AA70]);
  CGAffineTransformMakeScale(&v77, 0.25, 0.25);
  v10 = (void *)objc_msgSend(a4, "imageByApplyingTransform:highQualityDownsample:", &v77, 0);
  objc_msgSend(v10, "extent");
  if (v11 < 1024.0 || (objc_msgSend(v10, "extent"), v12 < 1024.0))
  {
    objc_msgSend(a4, "extent");
    v14 = v13 * 0.0009765625;
    objc_msgSend(a4, "extent");
    v16 = v15 * 0.0009765625;
    v17 = 1.0 / v16;
    if (1.0 / v14 < v17)
      v17 = 1.0 / v14;
    v18 = v17;
    CGAffineTransformMakeScale(&v76, v18, v18);
    v10 = (void *)objc_msgSend(a4, "imageByApplyingTransform:highQualityDownsample:", &v76, 0);
  }
  v84 = CFSTR("CIDetectorImageOrientation");
  v85[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v19 = -[CIDetector featuresInImage:options:](v9, "featuresInImage:options:", v10, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, &v84, 1));
  if (v19)
  {
    v20 = v19;
    if (-[NSArray count](v19, "count") <= 4)
    {
      v21 = -[NSArray count](v20, "count");
      if (!v21)
        return;
    }
    else
    {
      v21 = 4;
    }
    v22 = (double *)malloc_type_calloc(8 * v21, 8uLL, 0x100004000313F17uLL);
    if (v22)
    {
      v23 = v22;
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
      if (v24)
      {
        v25 = v24;
        v70 = v10;
        v65 = v7;
        v26 = 0;
        v67 = &v23[2 * v21];
        v68 = &v23[4 * v21];
        v69 = &v23[6 * v21];
        v27 = *(_QWORD *)v73;
        v71 = v23;
LABEL_13:
        v28 = 0;
        while (1)
        {
          if (*(_QWORD *)v73 != v27)
            objc_enumerationMutation(v20);
          if (v26 > 3)
            break;
          v29 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * v28);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (objc_msgSend(v29, "hasLeftEyePosition"))
            {
              if (objc_msgSend(v29, "hasRightEyePosition"))
              {
                v30 = (void *)objc_msgSend(v29, "landmarks");
                if (v30)
                {
                  v31 = v30;
                  if (objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("nose")))
                  {
                    v32 = (void *)objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("faceContour"));
                    v33 = 0.0;
                    if (objc_msgSend(v29, "hasFaceAngle"))
                    {
                      objc_msgSend(v29, "faceAngle");
                      v33 = v34;
                    }
                    if (v32 && objc_msgSend(v32, "count"))
                    {
                      objc_msgSend((id)objc_msgSend(v32, "objectAtIndexedSubscript:", 0), "CGPointValue");
                      v36 = v35;
                      memset(&v82, 0, sizeof(v82));
                      if (v70)
                        objc_msgSend(v70, "imageTransformForOrientation:", v65);
                      v64 = a6;
                      memset(&v81, 0, sizeof(v81));
                      CGAffineTransformMakeRotation(&v81, v33 * 3.14159265 / 180.0);
                      t1 = v82;
                      memset(&v80, 0, sizeof(v80));
                      t2 = v81;
                      CGAffineTransformConcat(&v80, &t1, &t2);
                      v37 = 0;
                      if (objc_msgSend(v32, "count"))
                      {
                        v38 = 0;
                        do
                        {
                          objc_msgSend((id)objc_msgSend(v32, "objectAtIndexedSubscript:", v38), "CGPointValue");
                          v41 = v80.ty + v39 * v80.d + v80.b * v40;
                          if (v41 < v36 || v38 == 0)
                          {
                            v37 = v38;
                            v36 = v41;
                          }
                          ++v38;
                        }
                        while (v38 < objc_msgSend(v32, "count"));
                      }
                      objc_msgSend((id)objc_msgSend(v32, "objectAtIndexedSubscript:", v37), "CGPointValue");
                      v44 = v43;
                      v46 = v45;
                      v47 = *MEMORY[0x1E0C9D538];
                      v48 = *(double *)(MEMORY[0x1E0C9D538] + 8);
                      a6 = v64;
                    }
                    else
                    {
                      v47 = *MEMORY[0x1E0C9D538];
                      v48 = *(double *)(MEMORY[0x1E0C9D538] + 8);
                      v44 = *MEMORY[0x1E0C9D538];
                      v46 = v48;
                    }
                    v49 = v44 == v47 && v46 == v48;
                    v23 = v71;
                    if (!v49)
                    {
                      v50 = CIVNAverage((void *)objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("nose")));
                      v52 = v51;
                      objc_msgSend(v29, "leftEyePosition");
                      v71[2 * v26] = v53;
                      objc_msgSend(v29, "leftEyePosition");
                      v54 = (16 * v26) | 8;
                      *(_QWORD *)((char *)v71 + v54) = v55;
                      objc_msgSend(v29, "rightEyePosition");
                      v67[2 * v26] = v56;
                      objc_msgSend(v29, "rightEyePosition");
                      *(_QWORD *)((char *)v67 + v54) = v57;
                      v23 = v71;
                      v69[2 * v26] = v44;
                      *(double *)((char *)v69 + v54) = v46;
                      v68[2 * v26++] = v50;
                      *(_QWORD *)((char *)v68 + v54) = v52;
                    }
                  }
                }
              }
            }
          }
          if (++v28 == v25)
          {
            v25 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
            if (v25)
              goto LABEL_13;
            break;
          }
        }
        if (v26 >= 5)
          -[CIContext(CIDepthBlurEffect) _performFaceDetection:image:orientation:filter:].cold.1();
        if (v26)
        {
          objc_msgSend(v70, "extent");
          v66 = v58;
          objc_msgSend(v70, "extent");
          v59 = 4 * v26;
          v60 = (float64x2_t)vdupq_lane_s64(v66, 0);
          v62 = (float64x2_t)vdupq_lane_s64(v61, 0);
          v63 = v23;
          do
          {
            v86 = vld2q_f64(v63);
            v87.val[0] = vdivq_f64(v86.val[0], v60);
            v87.val[1] = vdivq_f64(v86.val[1], v62);
            vst2q_f64(v63, v87);
            v63 += 4;
            v59 -= 2;
          }
          while (v59);
          objc_msgSend(a6, "setValue:forKey:", +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", v23, 2 * v26), CFSTR("inputLeftEyePositions"));
          objc_msgSend(a6, "setValue:forKey:", +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", v67, 2 * v26), CFSTR("inputRightEyePositions"));
          objc_msgSend(a6, "setValue:forKey:", +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", v68, 2 * v26), CFSTR("inputNosePositions"));
          objc_msgSend(a6, "setValue:forKey:", +[CIVector vectorWithValues:count:](CIVector, "vectorWithValues:count:", v69, 2 * v26), CFSTR("inputChinPositions"));
        }
      }
      free(v23);
    }
  }
}

- (CIFilter)depthBlurEffectFilterForImage:(CIImage *)image disparityImage:(CIImage *)disparityImage portraitEffectsMatte:(CIImage *)portraitEffectsMatte orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v8;

  LODWORD(v8) = orientation;
  return -[CIContext depthBlurEffectFilterForImage:disparityImage:portraitEffectsMatte:hairSemanticSegmentation:glassesMatte:gainMap:orientation:options:](self, "depthBlurEffectFilterForImage:disparityImage:portraitEffectsMatte:hairSemanticSegmentation:glassesMatte:gainMap:orientation:options:", image, disparityImage, portraitEffectsMatte, 0, 0, 0, v8, options);
}

- (CIFilter)depthBlurEffectFilterForImage:(CIImage *)image disparityImage:(CIImage *)disparityImage portraitEffectsMatte:(CIImage *)portraitEffectsMatte hairSemanticSegmentation:(CIImage *)hairSemanticSegmentation orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  uint64_t v9;

  LODWORD(v9) = orientation;
  return -[CIContext depthBlurEffectFilterForImage:disparityImage:portraitEffectsMatte:hairSemanticSegmentation:glassesMatte:gainMap:orientation:options:](self, "depthBlurEffectFilterForImage:disparityImage:portraitEffectsMatte:hairSemanticSegmentation:glassesMatte:gainMap:orientation:options:", image, disparityImage, portraitEffectsMatte, hairSemanticSegmentation, 0, 0, v9, options);
}

- (CIFilter)depthBlurEffectFilterForImage:(CIImage *)image disparityImage:(CIImage *)disparityImage portraitEffectsMatte:(CIImage *)portraitEffectsMatte hairSemanticSegmentation:(CIImage *)hairSemanticSegmentation glassesMatte:(CIImage *)glassesMatte gainMap:(CIImage *)gainMap orientation:(CGImagePropertyOrientation)orientation options:(NSDictionary *)options
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  CIFilter *v37;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSDictionary *v48;
  uint64_t v49;
  const CGImageMetadata *v50;
  CGImageMetadataTag *v51;
  CGImageMetadataTag *v52;
  CFTypeRef v53;
  AVDepthData *v54;
  const char *v55;
  void *v56;
  NSDictionary *v57;
  NSDictionary *v58;
  const __CFDictionary *Value;
  const void *v60;
  NSDictionary *v61;
  id v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t i;
  void *v71;
  void *v72;
  CIVector *v73;
  NSDictionary *v74;
  CGRect rect;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  uint64_t v81;
  CGRect v82;
  CGRect v83;

  v81 = *MEMORY[0x1E0C80C00];
  if (!image || !disparityImage)
  {
    v29 = ci_logger_api();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[CIContext(CIDepthBlurEffect) depthBlurEffectFilterForImage:disparityImage:portraitEffectsMatte:hairSemanticSegmentation:glassesMatte:gainMap:orientation:options:].cold.1(v29, v30, v31, v32, v33, v34, v35, v36);
    return 0;
  }
  -[CIImage extent](image, "extent");
  x = v82.origin.x;
  y = v82.origin.y;
  width = v82.size.width;
  height = v82.size.height;
  if (CGRectIsEmpty(v82)
    || (v83.origin.x = x, v83.origin.y = y, v83.size.width = width, v83.size.height = height, CGRectIsInfinite(v83)))
  {
    v21 = ci_logger_api();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[CIContext(CIDepthBlurEffect) depthBlurEffectFilterForImage:disparityImage:portraitEffectsMatte:hairSemanticSegmentation:glassesMatte:gainMap:orientation:options:].cold.2(v21, v22, v23, v24, v25, v26, v27, v28);
    return 0;
  }
  v39 = orientation;
  if (orientation - 9 <= 0xFFFFFFF7)
  {
    v40 = ci_logger_api();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      -[CIContext(CIDepthBlurEffect) depthBlurEffectFilterForImage:disparityImage:portraitEffectsMatte:hairSemanticSegmentation:glassesMatte:gainMap:orientation:options:].cold.3(v40, v41, v42, v43, v44, v45, v46, v47);
    return 0;
  }
  v37 = +[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIDepthBlurEffect"));
  -[CIFilter setDefaults](v37, "setDefaults");
  -[CIFilter setValue:forKey:](v37, "setValue:forKey:", image, CFSTR("inputImage"));
  -[CIFilter setValue:forKey:](v37, "setValue:forKey:", disparityImage, CFSTR("inputDisparityImage"));
  if (portraitEffectsMatte)
    -[CIFilter setValue:forKey:](v37, "setValue:forKey:", portraitEffectsMatte, CFSTR("inputMatteImage"));
  if (hairSemanticSegmentation)
    -[CIFilter setValue:forKey:](v37, "setValue:forKey:", hairSemanticSegmentation, CFSTR("inputHairImage"));
  if (glassesMatte)
    -[CIFilter setValue:forKey:](v37, "setValue:forKey:", glassesMatte, CFSTR("inputGlassesImage"));
  if (gainMap)
    -[CIFilter setValue:forKey:](v37, "setValue:forKey:", gainMap, CFSTR("inputGainMap"));
  v48 = -[CIImage properties](disparityImage, "properties");
  if (v48)
  {
    v49 = -[NSDictionary objectForKeyedSubscript:](v48, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6D0]);
    if (v49)
    {
      v50 = (const CGImageMetadata *)v49;
      -[CIFilter setValue:forKey:](v37, "setValue:forKey:", v49, CFSTR("inputAuxDataMetadata"));
      v51 = CGImageMetadataCopyTagWithPath(v50, 0, CFSTR("depthBlurEffect:SimulatedAperture"));
      if (v51)
      {
        v52 = v51;
        v53 = CGImageMetadataTagCopyValue(v51);
        objc_msgSend((id)(id)CFMakeCollectable(v53), "floatValue");
        -[CIFilter setValue:forKey:](v37, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:"), CFSTR("inputAperture"));
        CFRelease(v52);
      }
    }
  }
  v54 = -[CIImage depthData](disparityImage, "depthData");
  v56 = AVFDepthCameraCalibrationData(v54, v55);
  if (v56)
    -[CIFilter setValue:forKey:](v37, "setValue:forKey:", v56, CFSTR("inputCalibrationData"));
  v57 = options;
  if (-[CIImage properties](image, "properties"))
  {
    v58 = -[CIImage properties](image, "properties");
    Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v58, (const void *)*MEMORY[0x1E0CBCF70]);
    if (Value)
    {
      v60 = CFDictionaryGetValue(Value, CFSTR("29"));
      if (v60)
        -[CIFilter setValue:forKey:](v37, "setValue:forKey:", v60, CFSTR("inputLumaNoiseScale"));
    }
  }
  v61 = -[CIImage properties](image, "properties");
  if (v61)
  {
    v62 = -[NSDictionary objectForKey:](v61, "objectForKey:", *MEMORY[0x1E0CBCA28]);
    if (v62)
    {
      v63 = (void *)objc_msgSend(v62, "objectForKey:", CFSTR("Regions"));
      if (v63)
      {
        v64 = (void *)objc_msgSend(v63, "objectForKey:", *MEMORY[0x1E0CBCAC8]);
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
        if (v65)
        {
          v66 = v65;
          v67 = *(_QWORD *)v77;
          v68 = *MEMORY[0x1E0CBCAD0];
          v69 = *MEMORY[0x1E0CBCAB8];
          v74 = options;
          while (2)
          {
            for (i = 0; i != v66; ++i)
            {
              if (*(_QWORD *)v77 != v67)
                objc_enumerationMutation(v64);
              v71 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
              v72 = (void *)objc_msgSend(v71, "objectForKey:", v68, v74);
              if (v72
                && objc_msgSend(v72, "isEqualToString:", v69)
                && CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)v71, &rect))
              {
                rect.origin.x = rect.origin.x - rect.size.width * 0.5;
                rect.origin.y = 1.0 - rect.origin.y - rect.size.height * 0.5;
                v73 = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
                v39 = orientation;
                v57 = v74;
                if (v73)
                  -[CIFilter setValue:forKey:](v37, "setValue:forKey:", v73, CFSTR("inputFocusRect"));
                goto LABEL_48;
              }
            }
            v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
            v39 = orientation;
            v57 = v74;
            if (v66)
              continue;
            break;
          }
        }
      }
    }
  }
LABEL_48:
  -[CIContext _performFaceDetection:image:orientation:filter:](self, "_performFaceDetection:image:orientation:filter:", v57, image, v39, v37);
  return v37;
}

- (CIRenderTask)startTaskToRender:(CIImage *)image fromRect:(CGRect)fromRect toDestination:(CIRenderDestination *)destination atPoint:(CGPoint)atPoint error:(NSError *)error
{
  double y;
  double x;
  double v11;
  double v12;
  CIImage *v14;
  CGAffineTransform v16;

  y = atPoint.y;
  x = atPoint.x;
  v11 = fromRect.origin.y;
  v12 = fromRect.origin.x;
  v14 = -[CIImage imageByCroppingToRect:](image, "imageByCroppingToRect:", fromRect.origin.x, fromRect.origin.y, fromRect.size.width, fromRect.size.height);
  CGAffineTransformMakeTranslation(&v16, x - v12, y - v11);
  return -[CIContext startTaskToRender:toDestination:error:](self, "startTaskToRender:toDestination:error:", -[CIImage imageByApplyingTransform:](v14, "imageByApplyingTransform:", &v16), destination, error);
}

- (id)_startTaskToRender:(id)a3 toDestination:(id)a4 forPrepareRender:(BOOL)a5 forClear:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
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
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v57;
  void *v58;
  NSObject *v59;
  CGColorSpace *v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  CGColorSpace *v67;
  CGColorSpace *v68;
  CGColorSpace *v69;
  CIImage *v70;
  CIImage *v71;
  uint64_t v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  int v84;
  uint64_t v85;
  CIColorKernel *v86;
  double v87;
  CIImage *v88;
  CIImage *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  CIImage *v98;
  uint64_t v99;
  _QWORD *v100;
  double v101;
  CGFloat v102;
  double v103;
  CGFloat v104;
  double v105;
  double v106;
  double v107;
  double v108;
  _BOOL4 v109;
  int v110;
  _BOOL4 v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  CI::Object *v116;
  int v117;
  const void *v118;
  const __CFString *v119;
  NSObject *v120;
  const __CFString *v121;
  CIRenderTask *v122;
  void *context;
  void *contexta;
  int v125;
  uint64_t v126;
  _QWORD v127[3];
  __int128 v128;
  double v129;
  const __CFString *v130;
  const __CFString *v131;
  _QWORD v132[4];
  _QWORD v133[4];
  _QWORD v134[5];
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;

  v8 = a6;
  v9 = a5;
  v134[3] = *MEMORY[0x1E0C80C00];
  -[CIContext _gpuContextCheck](self, "_gpuContextCheck");
  v13 = -[CIContext _internalContext](self, "_internalContext");
  if (!v13)
  {
    if (a7)
      *a7 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CIContextStartTask"), 1, &unk_1E2F1D648);
    v32 = ci_logger_api();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[CIContext(CIRenderDestination) _startTaskToRender:toDestination:forPrepareRender:forClear:error:].cold.1(v32, v33, v34, v35, v36, v37, v38, v39);
    return 0;
  }
  if (!a4)
  {
    if (a7)
      *a7 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CIContextStartTask"), 2, &unk_1E2F1D670);
    v48 = ci_logger_api();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      -[CIContext(CIRenderDestination) _startTaskToRender:toDestination:forPrepareRender:forClear:error:].cold.2(v48, v49, v50, v51, v52, v53, v54, v55);
    return 0;
  }
  v14 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(a4, "_internalRepresentation"))
  {
    if (a7)
      *a7 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CIContextStartTask"), 3, &unk_1E2F1D698);
    v40 = ci_logger_api();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      -[CIContext(CIRenderDestination) _startTaskToRender:toDestination:forPrepareRender:forClear:error:].cold.3(v40, v41, v42, v43, v44, v45, v46, v47);
    return 0;
  }
  objc_msgSend(a3, "extent");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = (double)(unint64_t)objc_msgSend(a4, "width");
  v138.size.height = (double)(unint64_t)objc_msgSend(a4, "height");
  v138.origin.x = 0.0;
  v138.origin.y = 0.0;
  v135.origin.x = v16;
  v135.origin.y = v18;
  v135.size.width = v20;
  v135.size.height = v22;
  v138.size.width = v23;
  v136 = CGRectIntersection(v135, v138);
  if (CGRectIsEmpty(v136))
  {
    if (a7)
      *a7 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CIContextStartTask"), 4, &unk_1E2F1D6C0);
    v24 = ci_logger_api();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[CIContext(CIRenderDestination) _startTaskToRender:toDestination:forPrepareRender:forClear:error:].cold.4(v24, v25, v26, v27, v28, v29, v30, v31);
    return 0;
  }
  v57 = objc_msgSend(a4, "format");
  v58 = -[CIContext _internalContext](self, "_internalContext");
  if ((*(unsigned int (**)(void *))(*(_QWORD *)v58 + 16))(v58) == 76
    && CI::format_is_not_supported_as_destination_on_gles(v57))
  {
    if (a7)
      *a7 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CIContextStartTask"), 5, &unk_1E2F1D6E8);
    v59 = ci_logger_api();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      -[CIContext(CIRenderDestination) _startTaskToRender:toDestination:forPrepareRender:forClear:error:].cold.5(v57);
    return 0;
  }
  v60 = (CGColorSpace *)objc_msgSend(a4, "colorSpace");
  v61 = objc_msgSend(a4, "alphaMode");
  v125 = objc_msgSend(a4, "isClamped");
  v62 = objc_msgSend(a4, "format");
  if (!CI_NO_CM() && CI::format_only_alpha(v62))
    v60 = 0;
  if (objc_msgSend(a3, "isOpaque"))
    v63 = 1;
  else
    v63 = v61;
  v126 = v63;
  context = (void *)MEMORY[0x194026220]();
  if (!CI_NO_CM())
  {
    v67 = (CGColorSpace *)objc_msgSend(a3, "baseColorSpace", context);
    if (CI::ColorSpace_is_HDR(v67, v68))
    {
      if (v60 && (CI::ColorSpace_is_HDR(v60, v69) & 1) == 0 && !CGColorSpaceUsesExtendedRange(v60))
        a3 = (id)objc_msgSend((id)objc_msgSend(a3, "imageByColorMatchingWorkingSpaceToColorSpace:", v67), "imageByToneMappingColorSpaceToWorkingSpace:", v67);
    }
  }
  if (objc_msgSend(a4, "blendKernel", context))
  {
    v64 = objc_msgSend(a4, "imageRepresentation");
    if (v64)
    {
      v65 = (void *)v64;
      if (objc_msgSend((id)objc_msgSend(a4, "blendKernel"), "isBackIfForeIsClear"))
      {
        objc_msgSend(a3, "extent");
        v65 = (void *)objc_msgSend(v65, "imageByCroppingToRect:");
      }
      if ((*(unsigned int (**)(void *))(*(_QWORD *)v14 + 16))(v14) == 76
        || objc_msgSend(a4, "isCompressed"))
      {
        v65 = (void *)objc_msgSend(v65, "imageByInsertingIntermediate:", 0);
      }
      if (objc_msgSend(a4, "blendsInDestinationColorSpace"))
      {
        if (v60 && !CI_NO_CM())
        {
          a3 = (id)objc_msgSend(a3, "imageByColorMatchingWorkingSpaceToRGBorGrayColorSpace:", v60);
          v65 = (void *)objc_msgSend(v65, "imageByColorMatchingWorkingSpaceToRGBorGrayColorSpace:", v60);
        }
        v66 = (void *)objc_msgSend((id)objc_msgSend(a4, "blendKernel"), "applyWithForeground:background:", a3, v65);
        goto LABEL_57;
      }
      a3 = (id)objc_msgSend((id)objc_msgSend(a4, "blendKernel"), "applyWithForeground:background:", a3, v65);
    }
  }
  if (v60 && !CI_NO_CM())
  {
    v66 = (void *)objc_msgSend(a3, "imageByColorMatchingWorkingSpaceToRGBorGrayColorSpace:", v60);
LABEL_57:
    a3 = v66;
  }
  v70 = (CIImage *)objc_msgSend(a3, "imageByCroppingToRect:", 0.0, 0.0, (double)(unint64_t)objc_msgSend(a4, "width"), (double)(unint64_t)objc_msgSend(a4, "height"));
  v71 = v70;
  if (!v126)
  {
    -[CIImage extent](v70, "extent");
    v71 = -[CIImage imageBySettingAlphaOneInExtent:](v71, "imageBySettingAlphaOneInExtent:");
  }
  if (v125)
    v71 = -[CIImage _imageByClampingAlpha](v71, "_imageByClampingAlpha");
  v72 = objc_msgSend(a4, "_internalRepresentation");
  if (*(_DWORD *)(v72 + 28))
  {
    v73 = *(double *)(v72 + 32);
    v74 = *(double *)(v72 + 40);
    v75 = *(double *)(v72 + 48);
    v76 = *(double *)(v72 + 56);
    v77 = *(double *)(v72 + 64);
    v78 = *(double *)(v72 + 72);
    v79 = *(double *)(v72 + 80);
    v80 = *(double *)(v72 + 88);
    v81 = *(double *)(v72 + 96);
    v82 = *(double *)(v72 + 104);
    v83 = *(double *)(v72 + 112);
    v132[0] = CFSTR("inputRVector");
    v133[0] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v73, v74, v75);
    v132[1] = CFSTR("inputGVector");
    v133[1] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v76, v77, v78);
    v132[2] = CFSTR("inputBVector");
    v133[2] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v79, v80, v81);
    v132[3] = CFSTR("inputBiasVector");
    v133[3] = +[CIVector vectorWithX:Y:Z:](CIVector, "vectorWithX:Y:Z:", v82, v83, v83);
    v71 = -[CIImage imageByApplyingFilter:withInputParameters:](v71, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorMatrix"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v133, v132, 4));
  }
  if (objc_msgSend(a4, "isDithered"))
  {
    v84 = objc_msgSend(a4, "ditherDepth");
    v85 = objc_msgSend(a4, "colorSpace");
    v86 = +[CIKernel kernelWithInternalRepresentation:](CIColorKernel, "kernelWithInternalRepresentation:", &CI::_destDither);
    v87 = ldexp(1.0, -v84);
    if (v87 > 0.0009765625)
    {
      if (v85)
        v71 = -[CIImage imageByColorMatchingWorkingSpaceToColorSpace:](v71, "imageByColorMatchingWorkingSpaceToColorSpace:", v85);
      v88 = -[CIImage imageByUnpremultiplyingAlpha](v71, "imageByUnpremultiplyingAlpha");
      v89 = -[CIFilter outputImage](+[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIRandomGenerator")), "outputImage");
      -[CIImage extent](v88, "extent");
      v91 = v90;
      v93 = v92;
      v95 = v94;
      v97 = v96;
      v134[0] = v88;
      v134[1] = v89;
      v134[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v87);
      v98 = -[CIImage imageByPremultiplyingAlpha](-[CIColorKernel applyWithExtent:arguments:](v86, "applyWithExtent:arguments:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v134, 3), v91, v93, v95, v97), "imageByPremultiplyingAlpha");
      v71 = v98;
      if (v85)
        v71 = -[CIImage imageByColorMatchingColorSpaceToWorkingSpace:](v98, "imageByColorMatchingColorSpaceToWorkingSpace:", v85);
    }
  }
  if (v126 == 2)
    v71 = -[CIImage imageByUnpremultiplyingAlpha](v71, "imageByUnpremultiplyingAlpha");
  if (objc_msgSend(a4, "isFlipped"))
  {
    v127[1] = 0;
    v127[2] = 0;
    v127[0] = 0x3FF0000000000000;
    v128 = xmmword_192493540;
    v129 = (double)(unint64_t)objc_msgSend(a4, "height");
    v71 = -[CIImage imageByApplyingTransform:](v71, "imageByApplyingTransform:", v127);
  }
  -[CIContext lock](self, "lock");
  v99 = -[CIImage _internalRepresentation](v71, "_internalRepresentation");
  v100 = -[CIContext _internalContext](self, "_internalContext");
  -[CIImage extent](v71, "extent");
  v102 = v101;
  v104 = v103;
  v106 = v105;
  v108 = v107;
  v109 = (*(unsigned int (**)(_QWORD *))(*v100 + 16))(v100) == 75 && *(_BYTE *)(v99 + 96) == 0;
  if ((*(unsigned int (**)(_QWORD *))(*v100 + 16))(v100) != 75)
  {
    v111 = 0;
LABEL_81:
    if (!v109 && !v111)
      goto LABEL_83;
    goto LABEL_82;
  }
  v137.origin.x = v102;
  v137.origin.y = v104;
  v137.size.width = v106;
  v137.size.height = v108;
  if (!CGRectIsInfinite(v137))
  {
    v110 = CI_MAX_CPU_RENDER_SIZE();
    v111 = v106 * v108 > (double)(int)(CI_MAX_CPU_RENDER_SIZE() * v110);
    goto LABEL_81;
  }
LABEL_82:
  v100 = (_QWORD *)(*(uint64_t (**)(_QWORD *))(*v100 + 120))(v100);
LABEL_83:
  -[CIImage extent](v71, "extent");
  ++v100[19];
  v100[24] = 0;
  v100[20] = v112;
  v100[21] = v113;
  v100[22] = v114;
  v100[23] = v115;
  (*(void (**)(_QWORD *, _QWORD))(*v100 + 240))(v100, 0);
  if (v9)
    *((_DWORD *)v100 + 86) = 1;
  if (objc_msgSend(a4, "blendKernel") || v8)
  {
    v117 = (*(uint64_t (**)(_QWORD *))(*v100 + 288))(v100);
    (*(void (**)(_QWORD *, _QWORD))(*v100 + 280))(v100, 0);
    v116 = (CI::Object *)objc_msgSend(a4, "_render:withContext:", v99, v100);
    if (v117)
      (*(void (**)(_QWORD *, uint64_t))(*v100 + 280))(v100, 1);
  }
  else
  {
    v116 = (CI::Object *)objc_msgSend(a4, "_render:withContext:", v99, v100);
  }
  if (v9)
    *((_DWORD *)v100 + 86) = 0;
  if (!-[CIContext clientCommandQueue](self, "clientCommandQueue"))
    CI::RenderTask::waitUntilScheduled((intptr_t)v116);
  -[CIContext unlock](self, "unlock");
  v118 = (const void *)*((_QWORD *)v116 + 16);
  if (v118)
  {
    v119 = (const __CFString *)CFRetain(v118);
    if (v119)
    {
      CI::Object::unref(v116);
      objc_autoreleasePoolPop(contexta);
      v120 = ci_logger_api();
      if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
        -[CIContext(CIRenderDestination) _startTaskToRender:toDestination:forPrepareRender:forClear:error:].cold.6(v119);
      if (a7)
      {
        v130 = CFSTR("CINonLocalizedDescriptionKey");
        v131 = v119;
        *a7 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CIContextRenderDestination"), 5, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v131, &v130, 1));
      }
      else
      {
        CI::Context::AbortIfUnhandledError(v119, v121);
      }
      CFRelease(v119);
      return 0;
    }
  }
  v122 = -[CIRenderTask initWithInternalTask:]([CIRenderTask alloc], "initWithInternalTask:", v116);
  CI::Object::unref(v116);
  objc_autoreleasePoolPop(contexta);
  return v122;
}

- (CIRenderTask)startTaskToRender:(CIImage *)image toDestination:(CIRenderDestination *)destination error:(NSError *)error
{
  return (CIRenderTask *)-[CIContext _startTaskToRender:toDestination:forPrepareRender:forClear:error:](self, "_startTaskToRender:toDestination:forPrepareRender:forClear:error:", image, destination, 0, 0, error);
}

- (BOOL)prepareRender:(CIImage *)image fromRect:(CGRect)fromRect toDestination:(CIRenderDestination *)destination atPoint:(CGPoint)atPoint error:(NSError *)error
{
  double y;
  double x;
  double v11;
  double v12;
  CIImage *v14;
  CGAffineTransform v16;

  y = atPoint.y;
  x = atPoint.x;
  v11 = fromRect.origin.y;
  v12 = fromRect.origin.x;
  v14 = -[CIImage imageByCroppingToRect:](image, "imageByCroppingToRect:", fromRect.origin.x, fromRect.origin.y, fromRect.size.width, fromRect.size.height);
  CGAffineTransformMakeTranslation(&v16, x - v12, y - v11);
  return -[CIContext _startTaskToRender:toDestination:forPrepareRender:forClear:error:](self, "_startTaskToRender:toDestination:forPrepareRender:forClear:error:", -[CIImage imageByApplyingTransform:](v14, "imageByApplyingTransform:", &v16), destination, 1, 0, error) != 0;
}

- (CIRenderTask)startTaskToClear:(CIRenderDestination *)destination error:(NSError *)error
{
  CIBlendKernel *v7;
  CIBlendKernel *v8;
  CIBlendKernel *v9;
  CIRenderTask *v10;

  v7 = -[CIRenderDestination blendKernel](destination, "blendKernel");
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    -[CIRenderDestination setBlendKernel:](destination, "setBlendKernel:", 0);
  }
  v10 = -[CIContext _startTaskToRender:toDestination:forPrepareRender:forClear:error:](self, "_startTaskToRender:toDestination:forPrepareRender:forClear:error:", +[CIImage imageWithColor:](CIImage, "imageWithColor:", +[CIColor clearColor](CIColor, "clearColor")), destination, 0, 1, error);
  if (v8)
  {
    -[CIRenderDestination setBlendKernel:](destination, "setBlendKernel:", v8);

  }
  return v10;
}

+ (void)loadArchiveWithName:fromURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446722;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_1(&dword_1921E4000, v0, v1, "%{public}s Failed loading %{public}@ binary archive from %{public}@, Only AIR loaded", v2);
  OUTLINED_FUNCTION_8();
}

+ (void)loadArchiveWithName:fromURL:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446722;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_1(&dword_1921E4000, v0, v1, "%{public}s Failed loading %{public}@ AIR and binary archive from %{public}@", v2);
  OUTLINED_FUNCTION_8();
}

+ (void)loadArchiveWithName:fromURL:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446722;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_1(&dword_1921E4000, v0, v1, "%{public}s No %{public}@ AIR or binary archive found in %{public}@", v2);
  OUTLINED_FUNCTION_8();
}

+ (void)loadArchive:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, v0, v1, "%{public}s Failed loading %{public}@ binary archive, Only AIR loaded", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)loadArchive:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, v0, v1, "%{public}s Failed loading %{public}@ AIR and binary archive", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

+ (void)loadArchive:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, v0, v1, "%{public}s No %{public}@ AIR or binary archive found", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)setObject:forKey:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136446722;
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_4_1(&dword_1921E4000, v0, v1, "%{public}s unsupported object %{public}@ for key %{public}@.", v2);
  OUTLINED_FUNCTION_8();
}

- (void)setObject:forKey:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, v0, v1, "%{public}s unsupported key %{public}@.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)objectForKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, v0, v1, "%{public}s unsupported key %{public}@.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithOptions:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s No supported back-end renderer is usable.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)initWithEAGLContext:(uint64_t)a3 options:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s can only be created with ES 2.0 or 3.0 EAGLContexts.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)render:(int)a1 toBitmap:(NSObject *)a2 rowBytes:bounds:format:colorSpace:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  CI::name_for_format(a1);
  v4 = 136446466;
  v5 = "-[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:]";
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, a2, v3, "%{public}s format %{public}s is not supported on GLES.", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8();
}

- (void)render:toBitmap:rowBytes:bounds:format:colorSpace:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_1921E4000, v0, v1, "%{public}s rowBytes must be a multiple of %ld.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)render:(uint64_t)a3 toBitmap:(uint64_t)a4 rowBytes:(uint64_t)a5 bounds:(uint64_t)a6 format:(uint64_t)a7 colorSpace:(uint64_t)a8 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s unsupported colorspace.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)render:(int)a1 toBitmap:(NSObject *)a2 rowBytes:bounds:format:colorSpace:.cold.4(int a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  CI::name_for_format(a1);
  v4 = 136446466;
  v5 = "-[CIContext render:toBitmap:rowBytes:bounds:format:colorSpace:]";
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, a2, v3, "%{public}s format %{public}s is unsupported.", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8();
}

- (void)render:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s cannot render an infinite image into an infinite context.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)drawImage:(uint64_t)a3 inRect:(uint64_t)a4 fromRect:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s given an infinite rect", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)drawImage:(uint64_t)a3 inRect:(uint64_t)a4 fromRect:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s requires a CIContext created with a GL context or a CG context.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)render:(uint64_t)a3 toTexture:(uint64_t)a4 target:(uint64_t)a5 bounds:(uint64_t)a6 colorSpace:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s requires a GL or CL context!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)render:(uint64_t)a3 toTexture:(uint64_t)a4 target:(uint64_t)a5 bounds:(uint64_t)a6 colorSpace:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s target must be GL_TEXTURE_2D.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)render:(uint64_t)a3 toMTLTexture:(uint64_t)a4 commandBuffer:(uint64_t)a5 bounds:(uint64_t)a6 colorSpace:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s requires a Metal context (with the same device used to create the given texture).", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

- (void)render:(uint64_t)a3 toMTLTexture:(uint64_t)a4 commandBuffer:(uint64_t)a5 bounds:(uint64_t)a6 colorSpace:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_1921E4000, a1, a3, "%{public}s texture type must be MTLTextureType2D.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4_0();
}

@end
