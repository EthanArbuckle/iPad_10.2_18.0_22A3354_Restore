@implementation CIIntegralImageProcessorGPU

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t v16;
  int v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  unint64_t v30;
  int v31;
  int v32;
  _QWORD v34[3];
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v8 = (void *)objc_msgSend(a5, "metalCommandBuffer", a3, a4);
  if (!v8)
  {
    v19 = ci_logger_api();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!v20)
      return v20;
    +[CIIntegralImageProcessorGPU processWithInputs:arguments:output:error:].cold.1(v19, v21, v22);
LABEL_9:
    LOBYTE(v20) = 0;
    return v20;
  }
  v9 = v8;
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E78]), "initWithDevice:", objc_msgSend(v8, "device"));
  if (!v10)
  {
    v23 = ci_logger_api();
    v20 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
    if (!v20)
      return v20;
    +[CIIntegralImageProcessorGPU processWithInputs:arguments:output:error:].cold.2(v23, v24, v25);
    goto LABEL_9;
  }
  v11 = (void *)v10;
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "region");
  x = v35.origin.x;
  y = v35.origin.y;
  width = v35.size.width;
  height = v35.size.height;
  if (CGRectIsNull(v35))
  {
    LODWORD(v16) = 0;
    v17 = 0x7FFFFFFF;
    v18 = 0x7FFFFFFF;
  }
  else
  {
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    if (CGRectIsInfinite(v36))
    {
      v17 = -2147483647;
      LODWORD(v16) = -1;
      v18 = -2147483647;
    }
    else
    {
      v37.origin.x = x;
      v37.origin.y = y;
      v37.size.width = width;
      v37.size.height = height;
      v38 = CGRectInset(v37, 0.000001, 0.000001);
      v39 = CGRectIntegral(v38);
      v18 = (int)v39.origin.x;
      v17 = (int)v39.origin.y;
      v16 = (unint64_t)v39.size.height;
    }
  }
  objc_msgSend(a5, "region");
  v26 = v40.origin.x;
  v27 = v40.origin.y;
  v28 = v40.size.width;
  v29 = v40.size.height;
  if (CGRectIsNull(v40))
  {
    LODWORD(v30) = 0;
    v31 = 0x7FFFFFFF;
    v32 = 0x7FFFFFFF;
  }
  else
  {
    v41.origin.x = v26;
    v41.origin.y = v27;
    v41.size.width = v28;
    v41.size.height = v29;
    if (CGRectIsInfinite(v41))
    {
      v31 = -2147483647;
      LODWORD(v30) = -1;
      v32 = -2147483647;
    }
    else
    {
      v42.origin.x = v26;
      v42.origin.y = v27;
      v42.size.width = v28;
      v42.size.height = v29;
      v43 = CGRectInset(v42, 0.000001, 0.000001);
      v44 = CGRectIntegral(v43);
      v32 = (int)v44.origin.x;
      v31 = (int)v44.origin.y;
      v30 = (unint64_t)v44.size.height;
    }
  }
  v34[0] = v32 - v18;
  v34[1] = v17 + (int)v16 - ((int)v30 + v31);
  v34[2] = 0;
  objc_msgSend(v11, "setOffset:", v34);
  objc_msgSend(v11, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v9, objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "metalTexture"), objc_msgSend(a5, "metalTexture"));

  LOBYTE(v20) = 1;
  return v20;
}

+ (int)outputFormat
{
  return 2312;
}

+ (BOOL)canReduceOutputChannels
{
  return 1;
}

+ (void)processWithInputs:(uint64_t)a3 arguments:output:error:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136446467;
  v4 = "+[CIIntegralImageProcessorGPU processWithInputs:arguments:output:error:]";
  v5 = 2113;
  v6 = CFSTR("Metal");
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, a1, a3, "%{public}s %{private}@ command buffer is not available", (uint8_t *)&v3);
}

+ (void)processWithInputs:(uint64_t)a3 arguments:output:error:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136446467;
  v4 = "+[CIIntegralImageProcessorGPU processWithInputs:arguments:output:error:]";
  v5 = 2113;
  v6 = CFSTR("MPSImageIntegral");
  OUTLINED_FUNCTION_3_1(&dword_1921E4000, a1, a3, "%{public}s %{private}@ kernel could not be instantiated", (uint8_t *)&v3);
}

@end
