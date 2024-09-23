@implementation CIMedianProcessor

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  int v9;
  int v10;
  CGRect v11;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v9 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("w")), "intValue");
  if (v9 >= 0)
    v10 = v9;
  else
    v10 = v9 + 1;
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  return CGRectInset(v11, (double)-(v10 >> 1), (double)-(v10 >> 1));
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  unint64_t v18;
  int v19;
  int v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  unint64_t v25;
  int v26;
  int v27;
  _QWORD v29[3];
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v8 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("w"));
  v9 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
  v10 = objc_msgSend(v8, "intValue");
  v11 = (void *)objc_msgSend(a5, "metalCommandBuffer");
  if (v11)
  {
    v12 = v11;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E88]), "initWithDevice:kernelDiameter:", objc_msgSend(v11, "device"), v10);
    if (v11)
    {
      v13 = v11;
      objc_msgSend(v11, "setOptions:", 2);
      objc_msgSend(v13, "setEdgeMode:", 1);
      objc_msgSend(v9, "region");
      x = v30.origin.x;
      y = v30.origin.y;
      width = v30.size.width;
      height = v30.size.height;
      if (CGRectIsNull(v30))
      {
        LODWORD(v18) = 0;
        v19 = 0x7FFFFFFF;
        v20 = 0x7FFFFFFF;
      }
      else
      {
        v31.origin.x = x;
        v31.origin.y = y;
        v31.size.width = width;
        v31.size.height = height;
        if (CGRectIsInfinite(v31))
        {
          LODWORD(v18) = -1;
          v19 = -2147483647;
          v20 = -2147483647;
        }
        else
        {
          v32.origin.x = x;
          v32.origin.y = y;
          v32.size.width = width;
          v32.size.height = height;
          v33 = CGRectInset(v32, 0.000001, 0.000001);
          v34 = CGRectIntegral(v33);
          v19 = (int)v34.origin.x;
          v20 = (int)v34.origin.y;
          v18 = (unint64_t)v34.size.height;
        }
      }
      objc_msgSend(a5, "region");
      v21 = v35.origin.x;
      v22 = v35.origin.y;
      v23 = v35.size.width;
      v24 = v35.size.height;
      if (CGRectIsNull(v35))
      {
        LODWORD(v25) = 0;
        v26 = 0x7FFFFFFF;
        v27 = 0x7FFFFFFF;
      }
      else
      {
        v36.origin.x = v21;
        v36.origin.y = v22;
        v36.size.width = v23;
        v36.size.height = v24;
        if (CGRectIsInfinite(v36))
        {
          LODWORD(v25) = -1;
          v26 = -2147483647;
          v27 = -2147483647;
        }
        else
        {
          v37.origin.x = v21;
          v37.origin.y = v22;
          v37.size.width = v23;
          v37.size.height = v24;
          v38 = CGRectInset(v37, 0.000001, 0.000001);
          v39 = CGRectIntegral(v38);
          v26 = (int)v39.origin.x;
          v27 = (int)v39.origin.y;
          v25 = (unint64_t)v39.size.height;
        }
      }
      v29[0] = v26 - v19;
      v29[1] = (int)v18 + v20 - (v27 + (int)v25);
      v29[2] = 0;
      objc_msgSend(v13, "setOffset:", v29);
      objc_msgSend(v13, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v12, objc_msgSend(v9, "metalTexture"), objc_msgSend(a5, "metalTexture"));

      LOBYTE(v11) = 1;
    }
  }
  return (char)v11;
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

+ (int)outputFormat
{
  return 0;
}

+ (BOOL)canReduceOutputChannels
{
  return 1;
}

+ (BOOL)allowCompressedInputsAndOutputs
{
  return 1;
}

+ (int)formatForInputAtIndex:(int)a3
{
  return 0;
}

+ (BOOL)allowSRGBTranferFuntionOnInputAtIndex:(int)a3
{
  return 1;
}

+ (BOOL)allowSRGBTranferFuntionOnOutput
{
  return 1;
}

+ (id)applyMedianToImage:(id)a3 width:(int)a4
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v8;
  NSObject *v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];

  v4 = *(_QWORD *)&a4;
  v22[1] = *MEMORY[0x1E0C80C00];
  if ((a4 & 1) == 0)
  {
    v5 = ci_logger_api();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[CIMedianProcessor applyMedianToImage:width:].cold.1(v4, v5);
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0CC6E88], "minKernelDiameter");
  if ((int)v4 <= 2)
  {
    v8 = ci_logger_api();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[CIMedianProcessor applyMedianToImage:width:].cold.2();
    return 0;
  }
  if (objc_msgSend(MEMORY[0x1E0CC6E88], "maxKernelDiameter") < (unint64_t)v4)
  {
    v9 = ci_logger_api();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[CIMedianProcessor applyMedianToImage:width:].cold.3();
    return 0;
  }
  objc_msgSend(a3, "extent");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v22[0] = a3;
  v19 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v21 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4, CFSTR("w"));
  return (id)objc_msgSend(a1, "applyWithExtent:inputs:arguments:error:", v19, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1), 0, v12, v14, v16, v18);
}

+ (void)applyMedianToImage:(int)a1 width:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1921E4000, a2, OS_LOG_TYPE_ERROR, "Input filter kernel size %d is not an odd integer.\n", (uint8_t *)v2, 8u);
}

+ (void)applyMedianToImage:width:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  uint64_t v3;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_2(&dword_1921E4000, v0, v1, "Input filter kernel size %d is less than the minimum supported size %lu.\n", v2, v3);
}

+ (void)applyMedianToImage:width:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  uint64_t v3;

  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_2(&dword_1921E4000, v0, v1, "Input filter kernel size %d is greater than the maximum supported size %lu.\n", v2, v3);
}

@end
