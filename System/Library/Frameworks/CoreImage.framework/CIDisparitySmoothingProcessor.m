@implementation CIDisparitySmoothingProcessor

+ (BOOL)hasValidPipelines
{
  return shaderDisparitySmoothing != 0;
}

+ (void)compilePipelines:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = 0;
  v4 = (void *)objc_msgSend(a3, "newDefaultLibraryWithBundle:error:", objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), 0);
  v5 = (void *)objc_msgSend(v4, "newFunctionWithName:", CFSTR("CIDisparitySmoothing"));
  shaderDisparitySmoothing = objc_msgSend(a3, "newComputePipelineStateWithFunction:error:", v5, &v7);
  if (v7)
  {
    v6 = objc_msgSend(v7, "localizedDescription");
    NSLog(CFSTR("Failed to initialize CIDisparitySmoothing: %@; %@"),
      v6,
      objc_msgSend(v7, "localizedFailureReason"));
  }

}

+ (void)releasePipelines
{
  if (shaderDisparitySmoothing)

  shaderDisparitySmoothing = 0;
}

+ (void)compilePipelinesIfNeeded:(id)a3
{
  id v5;

  v5 = (id)+[CIDisparitySmoothingProcessor compilePipelinesIfNeeded:]::targetedDevice;
  if ((id)+[CIDisparitySmoothingProcessor compilePipelinesIfNeeded:]::targetedDevice == a3)
  {
    if ((objc_msgSend(a1, "hasValidPipelines") & 1) != 0)
      return;
    v5 = (id)+[CIDisparitySmoothingProcessor compilePipelinesIfNeeded:]::targetedDevice;
  }
  if (v5 != a3)
  {
    objc_msgSend(a1, "releasePipelines");
    +[CIDisparitySmoothingProcessor compilePipelinesIfNeeded:]::targetedDevice = (uint64_t)a3;
  }
  if ((objc_msgSend(a1, "hasValidPipelines") & 1) == 0)
    objc_msgSend(a1, "compilePipelines:", a3);
}

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  unsigned int v15;
  double v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[3];
  _QWORD v26[3];
  uint64_t v27;

  v9 = (void *)objc_msgSend(a5, "metalCommandBuffer", a3, a4);
  objc_msgSend(a1, "compilePipelinesIfNeeded:", objc_msgSend(v9, "device"));
  v10 = objc_msgSend(a1, "hasValidPipelines");
  if (v10)
  {
    v11 = (void *)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
    v12 = objc_msgSend(v11, "metalTexture");
    v13 = objc_msgSend(a5, "metalTexture");
    objc_msgSend(v11, "region");
    v15 = v14;
    objc_msgSend(v11, "region");
    LODWORD(v11) = v15 >> 1;
    v17 = v16 >> 1;
    v27 = 0;
    v18 = objc_msgSend((id)shaderDisparitySmoothing, "maxTotalThreadsPerThreadgroup");
    mtlutl_ComputeThreadGroupParameters(v18, objc_msgSend((id)shaderDisparitySmoothing, "threadExecutionWidth"), (_DWORD *)&v27 + 1, &v27, v11, v17);
    v20 = v27;
    v19 = HIDWORD(v27);
    v21 = v11 / HIDWORD(v27);
    v22 = v17 / v27;
    v23 = (void *)objc_msgSend(v9, "computeCommandEncoder");
    objc_msgSend(v23, "setComputePipelineState:", shaderDisparitySmoothing);
    objc_msgSend(v23, "setTexture:atIndex:", v12, 0);
    objc_msgSend(v23, "setTexture:atIndex:", v13, 1);
    v26[0] = v21;
    v26[1] = v22;
    v26[2] = 1;
    v25[0] = v19;
    v25[1] = v20;
    v25[2] = 1;
    objc_msgSend(v23, "dispatchThreadgroups:threadsPerThreadgroup:", v26, v25);
    objc_msgSend(v23, "endEncoding");
  }
  return v10;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  return CGRectInset(a5, -5.0, -5.0);
}

+ (int)formatForInputAtIndex:(int)a3
{
  return 0;
}

+ (int)outputFormat
{
  return 2053;
}

+ (BOOL)outputIsOpaque
{
  return 1;
}

+ (BOOL)synchronizeInputs
{
  return 0;
}

@end
