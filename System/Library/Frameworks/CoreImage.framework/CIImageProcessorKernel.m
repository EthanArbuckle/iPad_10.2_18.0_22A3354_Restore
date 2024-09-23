@implementation CIImageProcessorKernel

+ (BOOL)processWithInputs:(NSArray *)inputs arguments:(NSDictionary *)arguments output:(id)output error:(NSError *)error
{
  void *v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0C99DA0];
  v7 = *MEMORY[0x1E0C99778];
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  v10 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, objc_msgSend(v8, "stringWithFormat:", CFSTR("%s must be overridden in %@ class"), "+[CIImageProcessorKernel processWithInputs:arguments:output:error:]", NSStringFromClass(v9)), 0);
  objc_exception_throw(v10);
}

+ (NSArray)roiTileArrayForInput:(int)input arguments:(NSDictionary *)arguments outputRect:(CGRect)outputRect
{
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "roiForInput:arguments:outputRect:", *(_QWORD *)&input, arguments, outputRect.origin.x, outputRect.origin.y, outputRect.size.width, outputRect.size.height);
  v6[0] = +[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:");
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
}

+ (CIFormat)formatForInputAtIndex:(int)input
{
  return 0;
}

+ (int)formatForInputAtIndex:(int)a3 arguments:(id)a4
{
  return 0;
}

+ (BOOL)allowSRGBTranferFuntionOnInputAtIndex:(int)a3
{
  return 0;
}

+ (CIFormat)outputFormat
{
  return 0;
}

+ (int)outputFormatWithArguments:(id)a3
{
  return 0;
}

+ (BOOL)allowSRGBTranferFuntionOnOutput
{
  return 0;
}

+ (BOOL)canReduceOutputChannels
{
  return 0;
}

+ (BOOL)allowCompressedInputsAndOutputs
{
  return 0;
}

+ (BOOL)canOutputLossyCompressed
{
  return 0;
}

+ (BOOL)outputIsOpaque
{
  return 0;
}

+ (BOOL)allowPartialOutputRegion
{
  return 1;
}

+ (BOOL)synchronizeInputs
{
  return 1;
}

+ (BOOL)skipFormatChecks
{
  return 0;
}

+ (unint64_t)_digestForArgs:(id)a3
{
  int64x2_t v5[5];
  BOOL v6;

  v6 = 0;
  XXH64_reset(v5, 0);
  if (a3 && (digestAdd((CI::XXHashHelper *)v5, (objc_object *)a3, &v6), v6))
    return 0;
  else
    return XXH64_digest((uint64_t)v5);
}

+ (CIImage)applyWithExtent:(CGRect)extent inputs:(NSArray *)inputs arguments:(NSDictionary *)args error:(NSError *)error
{
  double height;
  double width;
  double y;
  double x;
  SEL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  int v26;
  int v27;
  char v28;
  char v29;
  NSObject *v30;
  objc_class *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  uint64_t v38;
  const char *v39;
  int v40;
  int v41;
  char v42;
  uint64_t v43;
  BOOL v44;
  CI::SerialObjectPtrArray *v45;
  uint64_t v46;
  unsigned int v47;
  CI::Object *v48;
  void *v50;
  NSError *v51;
  CIImage *v52;
  objc_class *v53;
  const __CFString *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  CI::Object *v59;
  char v60;
  unsigned __int8 v61;
  unsigned __int8 v62;
  unsigned __int8 v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  objc_class *v68;
  void *v69;
  uint64_t v70;
  unsigned __int8 v71;
  unsigned __int8 v72;
  int v73;
  NSDictionary *v75;
  void *v76;
  char v78;
  void *v79;
  _QWORD v80[9];
  BOOL v81;
  _QWORD v82[6];
  const __CFString *v83;
  uint64_t v84;
  uint8_t buf[4];
  const char *v86;
  __int16 v87;
  NSString *v88;
  const __CFString *v89;
  _QWORD v90[4];
  CGRect v91;

  height = extent.size.height;
  width = extent.size.width;
  y = extent.origin.y;
  x = extent.origin.x;
  v90[1] = *MEMORY[0x1E0C80C00];
  v12 = NSSelectorFromString(CFSTR("processWithInputs:arguments:output:error:"));
  v13 = objc_msgSend((id)objc_opt_class(), "methodForSelector:", v12);
  v14 = +[CIImageProcessorKernel methodForSelector:](CIImageProcessorKernel, "methodForSelector:", v12);
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  if (v13 == v14 || v15 == v16)
  {
    v65 = (void *)MEMORY[0x1E0C99DA0];
    v66 = *MEMORY[0x1E0C99778];
    v67 = (void *)MEMORY[0x1E0CB3940];
    v68 = (objc_class *)objc_opt_class();
    v69 = (void *)objc_msgSend(v65, "exceptionWithName:reason:userInfo:", v66, objc_msgSend(v67, "stringWithFormat:", CFSTR("%s must be overridden in %@ class"), "+[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:]", NSStringFromClass(v68)), 0);
    objc_exception_throw(v69);
  }
  v91.origin.x = x;
  v91.origin.y = y;
  v91.size.width = width;
  v91.size.height = height;
  if (CGRectIsEmpty(v91))
    return +[CIImage emptyImage](CIImage, "emptyImage");
  v19 = objc_msgSend((id)objc_opt_class(), "skipFormatChecks");
  v20 = -[NSArray count](inputs, "count");
  v21 = objc_msgSend((id)objc_opt_class(), "methodForSelector:", sel_outputFormatWithArguments_);
  v22 = +[CIImageProcessorKernel methodForSelector:](CIImageProcessorKernel, "methodForSelector:", sel_outputFormatWithArguments_);
  v23 = (void *)objc_opt_class();
  if (v21 == v22)
    v24 = objc_msgSend(v23, "outputFormat");
  else
    v24 = objc_msgSend(v23, "outputFormatWithArguments:", args);
  v26 = CI::format_modernize(v24, (CI *)"+[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:]", v25);
  v27 = v26;
  if (v26)
    v28 = v19;
  else
    v28 = 1;
  if ((v28 & 1) != 0 || (CI::ProcessorImage::format_is_supported(v26, 0) & 1) != 0)
  {
    if (!v27 || v27 == 266)
      v72 = objc_msgSend((id)objc_opt_class(), "allowSRGBTranferFuntionOnOutput");
    else
      v72 = 0;
    v29 = 1;
    v73 = v27;
    if (v27 != 261 && v27 != 2053 && v27 != 2309)
      v29 = objc_msgSend((id)objc_opt_class(), "outputIsOpaque");
    v71 = v29;
    v70 = objc_msgSend(a1, "_digestForArgs:", args);
    if (!v70)
    {
      v30 = ci_logger_performance();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = (objc_class *)objc_opt_class();
        *(_DWORD *)buf = 136446466;
        v86 = "+[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:]";
        v87 = 2114;
        v88 = NSStringFromClass(v31);
        _os_log_impl(&dword_1921E4000, v30, OS_LOG_TYPE_DEFAULT, "%{public}s each object in arguments dictionary be an NSArray, NSDictionary, NSNumber, NSValue, NSData, NSString, NSNull, CIVector, CIColor, CIImage, CGImageRef or CGColorSpaceRef for CoreImage to cache optimally (%{public}@).", buf, 0x16u);
      }
    }
    v75 = args;
    if (v20)
    {
      v76 = malloc_type_calloc(4uLL, v20, 0xC13C0C4CuLL);
      v79 = malloc_type_calloc(1uLL, v20, 0x7C2A4A89uLL);
    }
    else
    {
      v79 = 0;
      v76 = 0;
    }
    v32 = objc_msgSend((id)objc_opt_class(), "methodForSelector:", sel_formatForInputAtIndex_arguments_);
    v33 = +[CIImageProcessorKernel methodForSelector:](CIImageProcessorKernel, "methodForSelector:", sel_formatForInputAtIndex_arguments_);
    if (!v20)
    {
LABEL_43:
      v43 = objc_msgSend((id)objc_opt_class(), "methodForSelector:", sel_roiTileArrayForInput_arguments_outputRect_);
      v44 = v43 != +[CIImageProcessorKernel methodForSelector:](CIImageProcessorKernel, "methodForSelector:", sel_roiTileArrayForInput_arguments_outputRect_);
      if (v20)
      {
        v45 = (CI::SerialObjectPtrArray *)operator new();
        CI::SerialObjectPtrArray::SerialObjectPtrArray(v45, v20);
        v46 = 0;
        v47 = 1;
        do
        {
          v48 = (CI::Object *)objc_msgSend(-[NSArray objectAtIndex:](inputs, "objectAtIndex:", v46), "_internalRepresentation");
          CI::Object::ref((uint64_t)v48);
          CI::SerialObjectPtrArray::append((uint64_t)v45, v48);
          CI::Object::unref(v48);
          v46 = v47;
        }
        while (v20 > v47++);
      }
      else
      {
        v45 = 0;
      }
      v53 = (objc_class *)objc_opt_class();
      v54 = (const __CFString *)NSStringFromClass(v53);
      v55 = (void *)objc_opt_class();
      if ((objc_msgSend(v55, "isSubclassOfClass:", NSClassFromString(CFSTR("CIGenericMetalProcessor"))) & 1) != 0
        || (v56 = (void *)objc_opt_class(),
            objc_msgSend(v56, "isSubclassOfClass:", NSClassFromString(CFSTR("CIMetalProcessor")))))
      {
        v57 = (uint64_t)v75;
        if (v75)
        {
          v57 = -[NSDictionary objectForKeyedSubscript:](v75, "objectForKeyedSubscript:", CFSTR("_shader"));
          if (!v57)
            v57 = -[NSDictionary objectForKeyedSubscript:](v75, "objectForKeyedSubscript:", CFSTR("filterName"));
        }
        if (v57)
          v54 = (const __CFString *)v57;
      }
      v58 = MEMORY[0x1E0C809B0];
      v82[0] = MEMORY[0x1E0C809B0];
      v82[1] = 3221225472;
      v82[2] = __65__CIImageProcessorKernel_applyWithExtent_inputs_arguments_error___block_invoke;
      v82[3] = &unk_1E2EC4548;
      v82[4] = a1;
      v82[5] = v75;
      v59 = (CI::Object *)operator new();
      v78 = objc_msgSend((id)objc_opt_class(), "allowCompressedInputsAndOutputs");
      v60 = objc_msgSend((id)objc_opt_class(), "canOutputLossyCompressed");
      v61 = objc_msgSend((id)objc_opt_class(), "canReduceOutputChannels");
      v62 = objc_msgSend((id)objc_opt_class(), "allowPartialOutputRegion");
      v63 = objc_msgSend((id)objc_opt_class(), "synchronizeInputs");
      v80[0] = v58;
      v80[1] = 3221225472;
      v80[2] = __65__CIImageProcessorKernel_applyWithExtent_inputs_arguments_error___block_invoke_2;
      v80[3] = &unk_1E2EC4570;
      v81 = v44;
      v80[4] = v54;
      v80[5] = a1;
      v80[7] = v82;
      v80[8] = v20;
      v80[6] = v75;
      CI::ProcessorImage::ProcessorImage((uint64_t)v59, v45, v54, v70, v78, v76, v79, v73, x, y, width, height, v72, v71, v60, v61, v62, v63, v82,
        v80);
      v52 = +[CIImage imageWithInternalRepresentation:](CIImage, "imageWithInternalRepresentation:", v59);
      CI::Object::unref(v59);
      if (v76)
        free(v76);
      if (v79)
        free(v79);
      return v52;
    }
    v34 = v33;
    v35 = 0;
    v36 = 0;
    while (1)
    {
      v37 = (void *)objc_opt_class();
      v38 = v32 == v34
          ? objc_msgSend(v37, "formatForInputAtIndex:", v36)
          : objc_msgSend(v37, "formatForInputAtIndex:arguments:", v36, v75);
      v40 = CI::format_modernize(v38, (CI *)"+[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:]", v39);
      v41 = v40;
      *((_DWORD *)v76 + v35) = v40;
      v42 = v40 ? v19 : 1;
      if ((v42 & 1) == 0 && (CI::ProcessorImage::format_is_supported(v40, 1) & 1) == 0)
        break;
      *((_BYTE *)v79 + v35) = 0;
      if (!v41 || v41 == 266)
        *((_BYTE *)v79 + v35) = objc_msgSend((id)objc_opt_class(), "allowSRGBTranferFuntionOnInputAtIndex:", v36);
      v35 = (v36 + 1);
      v36 = v35;
      if (v20 <= v35)
        goto LABEL_43;
    }
    if (error)
    {
      v64 = (void *)MEMORY[0x1E0CB35C8];
      v83 = CFSTR("CINonLocalizedDescriptionKey");
      v84 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("inputFormat for image %d must be 0, %s."), v36, "R8, Rh, Rf, BGRA8, RGBAh, RGBAf");
      *error = (NSError *)objc_msgSend(v64, "errorWithDomain:code:userInfo:", CFSTR("CIImageProcessorKernel"), 3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1));
    }
    free(v76);
    if (v79)
      free(v79);
    return 0;
  }
  if (!error)
    return 0;
  v50 = (void *)MEMORY[0x1E0CB35C8];
  v89 = CFSTR("CINonLocalizedDescriptionKey");
  v90[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("outputFormat must be 0, %s."), "R8, Rh, Rf, BGRA8, RGBAh, RGBAf");
  v51 = (NSError *)objc_msgSend(v50, "errorWithDomain:code:userInfo:", CFSTR("CIImageProcessorKernel"), 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v90, &v89, 1));
  v52 = 0;
  *error = v51;
  return v52;
}

void __65__CIImageProcessorKernel_applyWithExtent_inputs_arguments_error___block_invoke(uint64_t a1@<X0>, uint64_t a2@<X1>, char **a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  void *v14;
  void *v15;
  unint64_t i;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  __int128 v36;
  char *v37;

  v14 = (void *)MEMORY[0x194026220]();
  a3[1] = 0;
  a3[2] = 0;
  *a3 = 0;
  v15 = (void *)objc_msgSend((id)objc_opt_class(), "roiTileArrayForInput:arguments:outputRect:", a2, *(_QWORD *)(a1 + 40), a4, a5, a6, a7);
  for (i = 0; objc_msgSend(v15, "count") > i; ++i)
  {
    objc_msgSend((id)objc_msgSend(v15, "objectAtIndexedSubscript:", i), "CGRectValue");
    v21 = v17;
    v22 = v18;
    v23 = v19;
    v24 = v20;
    v26 = a3[1];
    v25 = (unint64_t)a3[2];
    if ((unint64_t)v26 >= v25)
    {
      v28 = *a3;
      v29 = (v26 - *a3) >> 5;
      v30 = v29 + 1;
      if ((unint64_t)(v29 + 1) >> 59)
        abort();
      v31 = v25 - (_QWORD)v28;
      if (v31 >> 4 > v30)
        v30 = v31 >> 4;
      if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFE0)
        v32 = 0x7FFFFFFFFFFFFFFLL;
      else
        v32 = v30;
      if (v32)
      {
        v33 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<CI::SoftwareDAGDescriptor::ArgumentInfo>>((uint64_t)(a3 + 2), v32);
        v28 = *a3;
        v26 = a3[1];
      }
      else
      {
        v33 = 0;
      }
      v34 = &v33[32 * v29];
      *(_QWORD *)v34 = v21;
      *((_QWORD *)v34 + 1) = v22;
      *((_QWORD *)v34 + 2) = v23;
      *((_QWORD *)v34 + 3) = v24;
      if (v26 == v28)
      {
        v37 = &v33[32 * v29];
      }
      else
      {
        v35 = &v33[32 * v29];
        do
        {
          v36 = *((_OWORD *)v26 - 1);
          v37 = v35 - 32;
          *((_OWORD *)v35 - 2) = *((_OWORD *)v26 - 2);
          *((_OWORD *)v35 - 1) = v36;
          v26 -= 32;
          v35 -= 32;
        }
        while (v26 != v28);
      }
      v27 = v34 + 32;
      *a3 = v37;
      a3[1] = v34 + 32;
      a3[2] = &v33[32 * v32];
      if (v28)
        operator delete(v28);
    }
    else
    {
      *(_QWORD *)v26 = v17;
      *((_QWORD *)v26 + 1) = v18;
      v27 = v26 + 32;
      *((_QWORD *)v26 + 2) = v19;
      *((_QWORD *)v26 + 3) = v20;
    }
    a3[1] = v27;
  }
  objc_autoreleasePoolPop(v14);
}

void __65__CIImageProcessorKernel_applyWithExtent_inputs_arguments_error___block_invoke_2(uint64_t a1, _QWORD *a2, uint64_t *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, double a8, double a9, double a10, double a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, unsigned __int8 a16, int a17, _QWORD *a18, CI::TileTask *a19)
{
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unsigned int v35;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  int v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  unint64_t v45;
  unint64_t v46;
  int v47;
  int v48;
  __IOSurface *v49;
  uint64_t v50;
  BOOL v53;
  char v54;
  _BOOL4 v55;
  uint64_t PixelFormat;
  __IOSurface *Surface;
  int v58;
  int v59;
  int v60;
  int v61;
  void *Queue;
  IRect *v63;
  void *v64;
  int v65;
  CIImageProcessorInput *v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  double *v71;
  double v72;
  double v73;
  double v74;
  double v75;
  CI *v76;
  int v77;
  unsigned int v78;
  void *Device;
  void *v80;
  void *v81;
  void *v82;
  char v84;
  BOOL v88;
  int v89;
  BOOL v90;
  int v91;
  int v92;
  int v93;
  NSObject *v94;
  os_signpost_id_t v95;
  uint64_t v96;
  uint64_t v97;
  NSObject *v98;
  os_signpost_id_t v99;
  uint64_t v100;
  uint64_t v101;
  void ***v102;
  void *context;
  CIImageProcessorOutput *v104;
  unint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  int v118;
  unint64_t v119;
  void *__p[3];
  _QWORD v121[3];
  CFTypeRef cf[3];
  uint8_t buf[16];
  unint64_t v124;
  uint64_t v125;
  CGRect v126;
  CGRect v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;

  v125 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x194026220]();
  v25 = a1;
  v104 = -[CIImageProcessorOutput initWithSurface:texture:digest:allowSRGB:bounds:context:tileTask:]([CIImageProcessorOutput alloc], "initWithSurface:texture:digest:allowSRGB:bounds:context:tileTask:", a7, a13, a14, a15, a16, a18, a8, a9, a10, a11, a19);
  if (*(_QWORD *)(a1 + 64) <= 1uLL)
    v26 = 1;
  else
    v26 = *(_QWORD *)(a1 + 64);
  std::vector<std::vector<CGRect>>::vector(v121, v26);
  if (*(_QWORD *)(a1 + 64))
  {
    v27 = 0;
    v28 = 0;
    do
    {
      (*(void (**)(uint8_t *__return_ptr, double, double, double, double))(*(_QWORD *)(v25 + 56) + 16))(buf, a8, a9, a10, a11);
      v29 = (_QWORD *)(v121[0] + v27);
      v30 = *(void **)(v121[0] + v27);
      if (v30)
      {
        v29[1] = v30;
        operator delete(v30);
        *v29 = 0;
        v29[1] = 0;
        v29[2] = 0;
      }
      *(_OWORD *)v29 = *(_OWORD *)buf;
      v29[2] = v124;
      ++v28;
      v31 = *(_QWORD *)(v25 + 64);
      v27 += 24;
    }
    while (v31 > v28);
  }
  else
  {
    v31 = 0;
  }
  v33 = *(_QWORD *)v121[0];
  v32 = *(_QWORD *)(v121[0] + 8);
  v114 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v31);
  if (*(_QWORD *)(v25 + 64))
  {
    v34 = 0;
    v108 = (v32 - v33) >> 5;
    v35 = 1;
    v107 = v25;
    while (1)
    {
      std::vector<CGRect>::vector(__p, v121[0] + 24 * v34);
      v126 = CGRectInset(*((CGRect *)__p[0] + a17), 0.001, 0.001);
      v127 = CGRectIntegral(v126);
      x = v127.origin.x;
      y = v127.origin.y;
      width = v127.size.width;
      height = v127.size.height;
      if (CGRectIsNull(v127))
      {
        v117 = 0;
        v119 = 0;
        v118 = 0x7FFFFFFF;
        v40 = 0x7FFFFFFF;
      }
      else
      {
        v128.origin.x = x;
        v128.origin.y = y;
        v128.size.width = width;
        v128.size.height = height;
        if (CGRectIsInfinite(v128))
        {
          v118 = -2147483647;
          v117 = 0xFFFFFFFFLL;
          v119 = 0xFFFFFFFFLL;
          v40 = -2147483647;
        }
        else
        {
          v129.origin.x = x;
          v129.origin.y = y;
          v129.size.width = width;
          v129.size.height = height;
          v130 = CGRectInset(v129, 0.000001, 0.000001);
          v131 = CGRectIntegral(v130);
          v40 = (int)v131.origin.x;
          v118 = (int)v131.origin.y;
          v119 = (unint64_t)v131.size.width;
          v117 = (unint64_t)v131.size.height;
        }
      }
      v132 = CGRectInset(*(CGRect *)(*a5 + 32 * v34), 0.001, 0.001);
      v133 = CGRectIntegral(v132);
      v41 = v133.origin.x;
      v42 = v133.origin.y;
      v43 = v133.size.width;
      v44 = v133.size.height;
      if (CGRectIsNull(v133))
      {
        v45 = 0;
        v46 = 0;
        v47 = 0x7FFFFFFF;
        v48 = 0x7FFFFFFF;
      }
      else
      {
        v134.origin.x = v41;
        v134.origin.y = v42;
        v134.size.width = v43;
        v134.size.height = v44;
        if (CGRectIsInfinite(v134))
        {
          v47 = -2147483647;
          v45 = 0xFFFFFFFFLL;
          v46 = 0xFFFFFFFFLL;
          v48 = -2147483647;
        }
        else
        {
          v135.origin.x = v41;
          v135.origin.y = v42;
          v135.size.width = v43;
          v135.size.height = v44;
          v136 = CGRectInset(v135, 0.000001, 0.000001);
          v137 = CGRectIntegral(v136);
          v48 = (int)v137.origin.x;
          v47 = (int)v137.origin.y;
          v46 = (unint64_t)v137.size.width;
          v45 = (unint64_t)v137.size.height;
        }
      }
      v49 = *(__IOSurface **)(*a2 + 8 * v34);
      v50 = *a3;
      v115 = *(_QWORD *)(*a4 + 8 * v34);
      v116 = *(_QWORD *)(*a6 + ((v34 >> 3) & 0x1FFFFFFFFFFFFFF8)) & (1 << v34);
      if (v40 != v48 || v118 != v47 || v119 != v46 || v117 != v45)
      {
        if (*(_BYTE *)(v25 + 72))
          break;
      }
      v66 = [CIImageProcessorInput alloc];
      v67 = (uint64_t *)(v50 + 16 * v34);
      v68 = *v67;
      v69 = v67[1];
      if (v48 == -2147483647)
      {
        v70 = v115;
        if (v47 == -2147483647 && v46 == 0xFFFFFFFF && v45 == 0xFFFFFFFF)
        {
          v71 = (double *)MEMORY[0x1E0C9D5E0];
LABEL_67:
          v72 = *v71;
          v73 = v71[1];
          Surface = v49;
LABEL_91:
          v74 = v71[2];
          v75 = v71[3];
          goto LABEL_93;
        }
      }
      else
      {
        v70 = v115;
        if (v48 == 0x7FFFFFFF && v47 == 0x7FFFFFFF && !v46 && !v45)
        {
          v71 = (double *)MEMORY[0x1E0C9D628];
          goto LABEL_67;
        }
      }
      v72 = (double)v48;
      v73 = (double)v47;
      v74 = (double)v46;
      Surface = v49;
      v75 = (double)v45;
LABEL_93:
      objc_msgSend(v114, "addObject:", -[CIImageProcessorInput initWithSurface:texture:digest:allowSRGB:bounds:roiTileIndex:roiTileCount:context:](v66, "initWithSurface:texture:digest:allowSRGB:bounds:roiTileIndex:roiTileCount:context:", Surface, v68, v69, v70, v116 != 0, a17, v72, v73, v74, v75, v108, a18));
      v25 = v107;
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      v34 = v35;
      if (*(_QWORD *)(v107 + 64) <= (unint64_t)v35++)
        goto LABEL_137;
    }
    v53 = v48 == -2147483647 && v47 == -2147483647 && v46 == 0xFFFFFFFF && v45 == 0xFFFFFFFF;
    v54 = v53;
    if (!v53)
    {
      if (v40 != 0x7FFFFFFF)
      {
        if (v40 == -2147483647 && v118 == -2147483647 && v119 == 0xFFFFFFFF && v117 == 0xFFFFFFFF)
        {
          v55 = 1;
          goto LABEL_43;
        }
LABEL_106:
        v88 = v48 == 0x7FFFFFFF && v47 == 0x7FFFFFFF && v46 == 0 && v45 == 0;
        v55 = 1;
        if (v48 <= v40 && !v88 && v48 + (int)v46 >= v40 + (int)v119 && v47 <= v118)
          v55 = v47 + (int)v45 < v118 + (int)v117;
LABEL_43:
        PixelFormat = IOSurfaceGetPixelFormat(v49);
        Surface = CreateSurface((__CVBuffer *)v119, (__CVBuffer *)v117, 0, PixelFormat, v55);
        CFAutorelease(Surface);
        v58 = 0x7FFFFFFF;
        if (v48 == 0x7FFFFFFF && v47 == 0x7FFFFFFF && !v46 && !v45
          || v40 == 0x7FFFFFFF && v118 == 0x7FFFFFFF && !v119 && !v117)
        {
          v105 = 0;
          v106 = 0;
LABEL_52:
          v59 = 0x7FFFFFFF;
          goto LABEL_53;
        }
        v105 = v119;
        v106 = v117;
        v58 = v118;
        v84 = v54;
        v59 = v40;
        if ((v84 & 1) == 0)
        {
          if (v40 == -2147483647 && v118 == -2147483647 && v119 == 0xFFFFFFFF && v117 == 0xFFFFFFFF)
          {
            v105 = v46;
            v106 = v45;
            v58 = v47;
            v59 = v48;
          }
          else
          {
            if (v48 <= v40)
              v59 = v40;
            else
              v59 = v48;
            v89 = v48 + v46;
            if (v48 + (int)v46 >= v40 + (int)v119)
              v89 = v40 + v119;
            v90 = __OFSUB__(v89, v59);
            v91 = v89 - v59;
            if (v91 < 0 != v90)
              goto LABEL_136;
            if (v47 <= v118)
              v58 = v118;
            else
              v58 = v47;
            v92 = v47 + v45;
            if (v47 + (int)v45 >= v118 + (int)v117)
              v92 = v118 + v117;
            v90 = __OFSUB__(v92, v58);
            v93 = v92 - v58;
            if (v93 < 0 != v90)
            {
LABEL_136:
              v105 = 0;
              v106 = 0;
              v58 = 0x7FFFFFFF;
              goto LABEL_52;
            }
            v105 = v91;
            v106 = v93;
          }
        }
LABEL_53:
        v60 = v59 - v48;
        v61 = v47 + v45 - (v58 + v106);
        if ((*(unsigned int (**)(_QWORD *))(*a18 + 16))(a18) == 77)
        {
          Queue = (void *)CIMetalCommandBufferGetQueue(a18[224]);
          if (Queue)
          {
            v64 = (void *)a18[226];
            if (v64)
            {
              v65 = 0;
              goto LABEL_77;
            }
LABEL_76:
            v64 = CIMetalCommandBufferCreate((uint64_t)"CIImageProcessor::createTileInput", Queue, 0, 0);
            v65 = 1;
LABEL_77:
            v76 = (CI *)IOSurfaceGetPixelFormat(v49);
            v77 = CI::format_from_PixelFormatType(v76);
            v78 = CIMetalFormatForFormat(v77, v116 != 0);
            Device = (void *)CIMetalTextureGetDevice(v64);
            v80 = CIMetalTextureCreateFromIOSurface((uint64_t)"CIImageProcessor::createTileInput", Device, v49, 0, v78, 1);
            v81 = (void *)CIMetalTextureGetDevice(v64);
            v82 = CIMetalTextureCreateFromIOSurface((uint64_t)"CIImageProcessor::createTileInput", v81, Surface, 0, v78, 2);
            CIMetalCommandBufferCopyTexture(v64, (uint64_t)v82, (uint64_t)v80, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), (double)v60, (double)v61, (double)v105, (double)v106);
            CFRelease(v80);
            CFRelease(v82);
            if (v65)
            {
              CIMetalCommandBufferCommit(v64);
              CIMetalCommandBufferWaitUntilCompleted(v64);
            }
            goto LABEL_80;
          }
        }
        else
        {
          Queue = (void *)objc_msgSend(-[CIImageProcessorOutput metalContext](v104, "metalContext"), "internalCommandQueue");
          if (Queue)
            goto LABEL_76;
        }
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = v105;
        v124 = v106;
        LODWORD(cf[0]) = v60;
        HIDWORD(cf[0]) = v47 + v45 - (v58 + v106);
        cf[1] = (CFTypeRef)v105;
        cf[2] = (CFTypeRef)v106;
        CI::Context::blitSurface(Surface, (__IOSurface *)buf, (IRect *)v49, (__IOSurface *)cf, v63);
LABEL_80:
        v66 = [CIImageProcessorInput alloc];
        if (v40 == -2147483647)
        {
          v70 = v115;
          if (v118 != -2147483647 || v119 != 0xFFFFFFFF || v117 != 0xFFFFFFFF)
          {
LABEL_92:
            v68 = 0;
            v72 = (double)v40;
            v73 = (double)v118;
            v74 = (double)v119;
            v75 = (double)v117;
            goto LABEL_93;
          }
          v68 = 0;
          v71 = (double *)MEMORY[0x1E0C9D5E0];
        }
        else
        {
          v70 = v115;
          if (v40 != 0x7FFFFFFF || v118 != 0x7FFFFFFF || v119 || v117)
            goto LABEL_92;
          v68 = 0;
          v71 = (double *)MEMORY[0x1E0C9D628];
        }
        v72 = *v71;
        v73 = v71[1];
        goto LABEL_91;
      }
      if (v118 != 0x7FFFFFFF || v119 || v117)
        goto LABEL_106;
    }
    v55 = 0;
    goto LABEL_43;
  }
LABEL_137:
  v94 = ci_signpost_log_render();
  v95 = (*(uint64_t (**)(_QWORD *))(*a18 + 272))(a18) << 32;
  if (v95 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v94))
  {
    v96 = *(_QWORD *)(v25 + 32);
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v96;
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v94, OS_SIGNPOST_INTERVAL_BEGIN, v95, "processor_process", "%{public}@", buf, 0xCu);
  }
  v97 = (*(uint64_t (**)(_QWORD *))(*a18 + 272))(a18);
  TimerBase::TimerBase((uint64_t)buf, v97, 0, (uint64_t)"processor_process", 0);
  cf[0] = 0;
  objc_msgSend((id)objc_opt_class(), "processWithInputs:arguments:output:error:", v114, *(_QWORD *)(v25 + 48), v104, cf);
  if (cf[0])
    CI::TileTask::setCommandBufferError(a19, cf[0]);
  _ZZZ65__CIImageProcessorKernel_applyWithExtent_inputs_arguments_error__EUb0_EN13SignpostTimerD1Ev((TimerBase *)buf);
  v98 = ci_signpost_log_render();
  v99 = (*(uint64_t (**)(_QWORD *))(*a18 + 272))(a18) << 32;
  if (v99 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v98))
  {
    v100 = *(_QWORD *)(v25 + 32);
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v100;
    _os_signpost_emit_with_name_impl(&dword_1921E4000, v98, OS_SIGNPOST_INTERVAL_BEGIN, v99, "processor_postprocess", "%{public}@", buf, 0xCu);
  }
  v101 = (*(uint64_t (**)(_QWORD *))(*a18 + 272))(a18);
  TimerBase::TimerBase((uint64_t)buf, v101, 0, (uint64_t)"processor_postprocess", 0);
  post_process(v114, v104, (uint64_t)a18);
  _ZZZ65__CIImageProcessorKernel_applyWithExtent_inputs_arguments_error__EUb0_EN13SignpostTimerD1E_0v((TimerBase *)buf);
  *(_QWORD *)buf = v121;
  std::vector<std::vector<IRect>>::__destroy_vector::operator()[abi:nn180100](v102);
  objc_autoreleasePoolPop(context);
}

@end
